#include "cache.h"
#include "def.h"

void Cache::SetConfig(CacheConfig cc)
{
	// 类似的set所有设置
	config_.write_through=cc.write_through;
	config_.write_allocate=cc.write_allocate;
	config_.b=cc.b;
	config_.e=cc.e;
	config_.c=cc.c;
	config_.B=pow(2,config_.b);
	config_.E=pow(2,config_.e);
	config_.C=pow(2,config_.c);
	config_.S=config_.C/(config_.B*config_.E);
	config_.s=config_.c-(config_.b+config_.e);
	config_.replace_type=cc.replace_type;
	config_.prefetch_num=cc.prefetch_num;
}

void Cache::GetConfig(CacheConfig cc)
{
	// 类似的get所有设置
	cc.write_through=config_.write_through;
	cc.write_allocate=config_.write_allocate;
	cc.b=config_.b;
	cc.e=config_.e;
	cc.c=config_.c;
	cc.B=pow(2,cc.b);
	cc.E=pow(2,cc.e);
	cc.C=pow(2,cc.c);
	cc.S=cc.C/(cc.B*cc.E);
	cc.s=cc.c-(cc.b+cc.e);
	cc.replace_type=config_.replace_type;
	cc.prefetch_num=config_.prefetch_num;
}

void Cache::BuildCache()
{
	Block new_block;
	new_block.tag=0;
	new_block.valid=false;
	new_block.dirty=false;

	Set new_set;
	new_set.lirsize=config_.E*LIR_RATIO;
	new_set.hirsize=config_.E-new_set.lirsize;
	for(int i=0;i<config_.E;i++)
	{
		new_set.value.push_back(0);
		new_set.data_set.push_back(new_block);
	}
	for(int i=0;i<config_.S;i++)
	{
		data_cache.push_back(new_set);
	}

	stream_size=32;
    stream = (Stream*)malloc(stream_size*sizeof(Stream));
    for(int i = 0; i < stream_size; i++)
    {
        stream[i].valid = 0;
        stream[i].addr = 0;
        stream[i].block_valid = 1;
    }

    FIFO=0;
}

void Cache::PrintCache()
{
	printf("S= %d, E= %d, B= %d\n", config_.S, config_.E, config_.B);
	printf("All the tag values.\n");
	for (int i = 0; i < config_.S; i++)
	{
		printf("[%3x]", i);
		for (int j = 0; j < config_.E; j++)
		{
			if (data_cache[i].data_set[j].valid == true)
			{
				//printf("cache[%d][%d]: tag = %x(%u) valid= %d\n", i, j,
				//	data_cache[i].data_set[j].tag, data_cache[i].data_set[j].tag,
				//	data_cache[i].data_set[j].valid);
				printf("%5x ", data_cache[i].data_set[j].tag);
				//printf("%5x ", data_cache[i].value[j]);
			}
			else
			{
				printf("%5d", -1);
				//printf("%5d ", -1);
			}
		}
		printf("\n");
	}
}

void Cache::HandleRequest(uint64_t addr,int bytes,int read,char *content,int &hit,int &time)
{
    bool preflag=false;
    if(time==PF_FLAG) preflag=true;
	hit=0;
	time=0;
	uint64_t tag;
	uint64_t set_index;
	uint64_t block_offset;

	if(!preflag) stats_.access_counter++;
	// Read.
	if(read==1)
	{
        PartitionAlgorithm(addr,tag,set_index,block_offset);
        uint64_t block_addr = (tag << (config_.b + config_.s)) | (set_index << config_.b);

        if(ReplaceDecision(tag,set_index)) //miss
        {
            if(config_.prefetch_num==PF_STREAM){
                if(PrefetchHit(block_addr)){
                    ReplaceAlgorithm(tag,set_index,time);
                    return;
                }
                PrefetchUpdate(block_addr);
            }
            if(!preflag) stats_.miss_num+=1;
            hit=0;
            // Choose victim
            if(preflag) time=PF_FLAG;
            ReplaceAlgorithm(tag,set_index,time);
            // Fetch from lower layer
            int lower_hit,lower_time;
            if(preflag) lower_time=PF_FLAG;
            lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
            time+=latency_.bus_latency+latency_.hit_latency+lower_time;
            if(config_.prefetch_num>0&&!preflag)
                PrefetchAlgorithm(addr,time);
            if(!preflag) stats_.access_time+=time;
        }
        else if(!preflag) //hit
        {
            hit=1;
            time+=latency_.bus_latency+latency_.hit_latency;
            stats_.access_time+=time;
            if(config_.replace_type==RP_LIRS)
                updatehitLIRS(set_index,tag);
        }
        if(!preflag&&config_.replace_type==RP_LRU) updateLRU(set_index,tag);
	}
	// Write
	else if(read==0)
	{
		PartitionAlgorithm(addr,tag,set_index,block_offset);
		uint64_t block_addr = (tag << (config_.b + config_.s)) | (set_index << config_.b);

		bool miss=ReplaceDecision(tag, set_index);
		time+=latency_.bus_latency+latency_.hit_latency;

		hit=!miss;

		if(miss&&(config_.write_allocate==1))
		{
            if(config_.prefetch_num==PF_STREAM){
                if(PrefetchHit(block_addr)){
                    ReplaceAlgorithm(tag,set_index,time);
                    return;
                }
                PrefetchUpdate(block_addr);
            }
            stats_.miss_num+=1;
			ReplaceAlgorithm(tag,set_index,time);  // Load to cache.
			// Fetch from lower layer
			int lower_hit,lower_time;
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			time+=lower_time;
			if(config_.prefetch_num>0)
                PrefetchAlgorithm(addr,time);
		}
		else if(miss&&(config_.write_allocate==0))
		{
            stats_.miss_num+=1;
            int lower_hit,lower_time;
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			time+=lower_time;
			stats_.access_time+=time;
			return;
		}

        if(config_.replace_type==RP_LRU) updateLRU(set_index,tag);
        else if(!miss&&config_.replace_type==RP_LIRS){
            updatehitLIRS(set_index,tag);
        }

        // Write dirty bit;
        if(config_.write_through==0)
        {
            // Find block index.
            uint64_t block_index;
            findblockindex(set_index,tag,block_index);
            data_cache[set_index].data_set[block_index].dirty=true;
        }
		// Write to memory
		else if (config_.write_through==1)
		{
			int lower_hit,lower_time;
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			time+=lower_time;
		}
		stats_.access_time+=time;
	}
}

// Read the tag, set_index, block_offset number from the addr.
void Cache::PartitionAlgorithm(uint64_t addr,uint64_t& tag,uint64_t& set_index,uint64_t& block_offset)
{
	tag=(addr>>(config_.b+config_.s))&((1<<(32-(config_.b+config_.s)))-1);
	set_index=(addr>>config_.b)&((1<<(config_.s))-1);
	block_offset=addr&((1<<(config_.b))-1);
	/*
	printf("Partition Algorithm: tag : %lx(%lu)\n", tag, tag);
	printf("Partition Algorithm: set_index : %lx(%lu)\n", set_index, set_index);
	printf("Partition Algorithm: block_offset : %lx(%lu)\n",
	block_offset, block_offset);
	*/
}

// return true means the cache miss.
int Cache::ReplaceDecision(uint64_t tag, uint64_t set_index)
{
	for(int i=0;i<config_.E;i++)
	{
		if(data_cache[set_index].data_set[i].tag==tag&&data_cache[set_index].data_set[i].valid==true)
			return FALSE;
	}
	return TRUE;
}

void Cache::ReplaceAlgorithm(uint64_t tag,uint64_t set_index,int& time)
{
    bool preflag=false;
    if(time==PF_FLAG) preflag=true;
	int out_index=-1;  // replace data_cache[set_index].data_set[out_index]
	for(int i=0;i<config_.E;i++)
	{
		if (data_cache[set_index].data_set[i].valid==false){
            out_index = i;
            if(config_.replace_type==RP_LIRS){
                if(data_cache[set_index].lirsize>0){
                    Entry* tmpE=new Entry(tag,LIR);
                    //printf("%d %d\n",tmpE->value,tmpE->state);
                    data_cache[set_index].stackS.push_topORend(tmpE);
                    data_cache[set_index].lirsize-=1;
                }
                else if(data_cache[set_index].hirsize>0){
                    data_cache[set_index].add_HIR_RES(tag);
                    data_cache[set_index].hirsize-=1;
                }
                else
                    printf("what's wrong??????????\n");
            }
            break;
        }
	}
	if(out_index==-1)
	{
		stats_.replace_num++;  // Need to replace some blocks.
		if(config_.replace_type==RP_LRU) getoutindexLRU(set_index,out_index);
		else if(config_.replace_type==RP_LIRS) getoutindexLIRS(set_index,out_index);

		if(config_.replace_type==RP_LIRS){
            int location=data_cache[set_index].stackS.find_location(tag);
            if(location>=0)
                data_cache[set_index].hit_HIR_stack(location);
            else
                data_cache[set_index].add_HIR_RES(tag);
		}

        // Dirty && Write_back
        if(data_cache[set_index].data_set[out_index].dirty==true&&config_.write_through==0)
        {
            // Write block's data[i] back into memory
            int lower_hit,lower_time;
            int newaddr_tag=data_cache[set_index].data_set[out_index].tag<<(config_.s+config_.b);
            int newaddr_set_index=set_index<<(config_.b);
            int newaddr_block_offset = 0;
            int addr=newaddr_tag+newaddr_set_index+newaddr_block_offset;
            int bytes=1;
            int read=0;
            char content[32];
            if(preflag) lower_time=PF_FLAG;
            lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
            time+=lower_time;
        }
	}
	// Write a new block into cache
    data_cache[set_index].data_set[out_index].dirty=false;
	data_cache[set_index].data_set[out_index].tag=tag;
	data_cache[set_index].data_set[out_index].valid=true;
	// Fresh data_cache[set_index].data_set[out_index].data_block;
}

void Cache::getoutindexLRU(uint64_t set_index,int &out_index)
{
    out_index=0;  // If not, cause segmentation fault.
    for(int i=0;i<config_.E;i++)
    {
        if(data_cache[set_index].value[i]>data_cache[set_index].value[out_index])
        {
            out_index=i;
        }
    }
}

void Cache::updateLRU(uint64_t set_index,uint64_t tag)
{
    uint64_t block_index;
    findblockindex(set_index,tag,block_index);
    // Fresh LRU
    data_cache[set_index].value[block_index]=0;
    for(int i=0;i<config_.E;i++)
    {
        if(i!=block_index&&data_cache[set_index].data_set[i].valid==true)
        {
            data_cache[set_index].value[i]++;
        }
    }
}

void Cache::getoutindexLIRS(uint64_t set_index,int &out_index)
{
    out_index=0;  // If not, cause segmentation fault.
    Entry* tmpE=data_cache[set_index].listQ.get_pop_front();
    data_cache[set_index].stackS.find_set_state(tmpE->value,HIR_NON);
    //data_cache[set_index].stackS.stack_pruning();
    // Find block index.
    for(int i=0;i<config_.E;i++){
        if(data_cache[set_index].data_set[i].tag==(tmpE->value)){
            out_index=i;
            break;
        }
    }
}

void Cache::updatehitLIRS(uint64_t set_index,uint64_t tag)
{
    int location=data_cache[set_index].stackS.find_location(tag);
    if(location>=0){
        int state=data_cache[set_index].stackS.container[location]->state;
        if(state==LIR)
            data_cache[set_index].hit_LIR(location);
        else
            data_cache[set_index].hit_HIR_stack(location);
    }
    else{
        location=data_cache[set_index].listQ.find_location(tag);
        if(location>=0)
            data_cache[set_index].hit_HIR_list(location);
        else
            printf("hit but there is not such a man in LRU S stack\n");
    }
}

void Cache::findblockindex(uint64_t set_index,uint64_t tag,uint64_t &block_index)
{
    // Find block index.
    for(int i=0;i<config_.E;i++)
    {
        if(data_cache[set_index].data_set[i].tag==tag)
        {
            block_index=i;
            break;
        }
    }
}

int Cache::BypassDecision()
{
	return FALSE;
}

int Cache::PrefetchDecision()
{
	return FALSE;
}

bool Cache::PrefetchHit(uint64_t addr)
{
    for(int i=0;i<stream_size;i++)
    {
        if(stream[i].valid==1&& addr==stream[i].addr)
        {
            if(stream[i].block_valid > 0)
            {
                stream[i].block_valid --;
                // update queue head
                stream[i].addr+=config_.B;
                if(stream[i].block_valid==0)
                    stream[i].valid=0;
                return true;
            }
            else
                return false;
        }
    }
    return false;
}

void Cache::PrefetchUpdate(uint64_t addr)
{
    // find an invalid one
    for(int i = 0; i < stream_size; i++)
    {
        if(stream[i].valid == 0)
        {
            stream[i].valid = 1;
            stream[i].addr = addr + config_.B;
            stream[i].block_valid = 4;
            return;
        }
    }

    // Finally, if no invalid steam, use evict algorithm FIFO(first in first out) to replace one stream
    FIFO += 1;
    if(FIFO == stream_size)
    {
        FIFO = 0;
    }

    stream[FIFO].addr = addr+config_.B;
    stream[FIFO].valid = 1;
    stream[FIFO].block_valid = 4;
}

void Cache::PrefetchAlgorithm(uint64_t addr,int &time)
{
    uint64_t tag;
    uint64_t set_index;
    uint64_t block_offset;
    for(int i=1;i<=config_.prefetch_num;i++){
        addr+=config_.B;
        PartitionAlgorithm(addr,tag,set_index,block_offset);
        int temptime=PF_FLAG;
        if(ReplaceDecision(tag,set_index)){
            ReplaceAlgorithm(tag,set_index,temptime);  // Load to cache.
			// Fetch from lower layer
			int lower_hit,lower_time=PF_FLAG,read=1,bytes=1;
			char content[32];
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			temptime+=lower_time;
			if(config_.replace_type==RP_LRU) updateLRU(set_index,tag);
        }
    }
}

