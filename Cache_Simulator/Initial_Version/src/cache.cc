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
}

void Cache::BuildCache()
{
	Block new_block;
	new_block.tag=0;
	new_block.valid=false;
	for(int i=0;i<config_.B;i++)
	{
		new_block.data_block.push_back(0);
		new_block.dirty.push_back(false);
	}
	Set new_set;
	for(int i=0;i<config_.E;i++)
	{
		new_set.value.push_back(0);
		new_set.data_set.push_back(new_block);
	}
	for(int i=0;i<config_.S;i++)
	{
		data_cache.push_back(new_set);
	}
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
	hit=0;
	time=0;
	uint64_t tag;
	uint64_t set_index;
	uint64_t block_offset;

	stats_.access_counter++;
	// Read.
	if(read==1)
	{
        PartitionAlgorithm(addr,tag,set_index,block_offset);
        // Miss?
        if(ReplaceDecision(tag,set_index))
        {
            stats_.miss_num+=1;
            hit=0;
            // Choose victim
            ReplaceAlgorithm(tag,set_index,stats_,time);
            // Fetch from lower layer
            int lower_hit,lower_time;
            lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
            time+=latency_.bus_latency+lower_time;
            // stats_.access_time += latency_.bus_latency;
            stats_.access_time+=time;
        }
        else
        {
            // return hit & time
            //PrintCache();
            //printf("READ HIT!\n");
            hit=1;
            time+=latency_.bus_latency+latency_.hit_latency;
            stats_.access_time+=time;
            updateLRU(set_index,tag);
            return;
        }
	}
	// Write
	else if(read==0)
	{

		PartitionAlgorithm(addr,tag,set_index,block_offset);
		// Don't write allocate && write back
		bool miss=ReplaceDecision(tag, set_index);

		hit=!miss;

		if(miss&&(config_.write_allocate==1))
		{
            stats_.miss_num+=1;
			ReplaceAlgorithm(tag,set_index,stats_,time);  // Load to cache.
			// LRU freshed in Replace Algorithm.
			// Fetch from lower layer
			int lower_hit,lower_time;
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			time+=latency_.bus_latency+lower_time;
			// stats_.access_time += latency_.bus_latency;
			stats_.access_time+=time;
		}
		else if(miss&&(config_.write_allocate==0))
		{
            stats_.miss_num+=1;
            int lower_hit,lower_time;
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			time+=latency_.bus_latency+lower_time;
			stats_.access_time+=time;
			return;
		}

        // Write to cache, data_cache[set_index].data_set[block_index]

        if(!miss)
        {
            updateLRU(set_index,tag);
        }
		// ???
		// Write to data_cache[set_index].data_set[block_index].data_block[block_offset]
		time+=latency_.bus_latency+latency_.hit_latency;
		stats_.access_time+=time;

        // Write dirty bit;
        if(config_.write_through==0)
        {
            // Find block index.
            uint64_t block_index;
            findblockindex(set_index,tag,block_index);
            data_cache[set_index].data_set[block_index].dirty[block_offset]=true;
        }
		// Write to memory
		else if (config_.write_through==1)
		{
			int lower_hit,lower_time;
			lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
			time+=latency_.bus_latency+lower_time;
			// stats_.access_time += latency_.bus_latency;
			stats_.access_time+=time;
		}
	}
}

int Cache::BypassDecision()
{
	return FALSE;
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

void Cache::ReplaceAlgorithm(uint64_t tag,uint64_t set_index,StorageStats& stats_,int& time)
{
	int out_index=-1;  // replace data_cache[set_index].data_set[out_index]
	for(int i=0;i<config_.E;i++)
	{
		if (data_cache[set_index].data_set[i].valid==false) out_index = i;
	}

	if(out_index==-1)
	{
		stats_.replace_num++;  // Need to replace some blocks.
		out_index=0;  // If not, cause segmentation fault.
		for(int i=0;i<config_.E;i++)
		{
			//if (data_cache[set_index].data_set[i].valid >
			//	data_cache[set_index].data_set[out_index].valid)
			if(data_cache[set_index].value[i]>data_cache[set_index].value[out_index])
			{
				out_index=i;
			}
		}
        // Dirty && Write_back
        for(int i=0;i<config_.B;i++)
        {
            if(data_cache[set_index].data_set[out_index].dirty[i]==true&&config_.write_through==0)
            {
                // Write block's data[i] back into memory
                int lower_hit,lower_time;
                int newaddr_tag=data_cache[set_index].data_set[out_index].tag<<(config_.s+config_.b);
                int newaddr_set_index=set_index<<(config_.b);
                int newaddr_block_offset = i;
                int addr=newaddr_tag+newaddr_set_index+newaddr_block_offset;
                int bytes=1;
                int read=0;
                char content[32];
                lower_->HandleRequest(addr,bytes,read,content,lower_hit,lower_time);
                time+=latency_.bus_latency+lower_time;
                // stats_.access_time += latency_.bus_latency;
                stats_.access_time+=time;
            }
        }
	}
	// Write a new block into cache
	for(int i=0;i<config_.B;i++)
	{
		data_cache[set_index].data_set[out_index].dirty[i] = false;
	}
	data_cache[set_index].data_set[out_index].tag=tag;
	data_cache[set_index].data_set[out_index].valid=true;
	// Fresh data_cache[set_index].data_set[out_index].data_block;

	updateLRU(set_index,tag);
}

void Cache::updateLRU(uint64_t set_index,uint64_t tag)
{
    uint64_t block_index;
    findblockindex(set_index,tag,block_index);
    // Fresh LRU
    //printf("Write HIT! Fresh LRU\n");
    data_cache[set_index].value[block_index]=0;
    for(int i=0;i<config_.E;i++)
    {
        if(i!=block_index&&data_cache[set_index].data_set[i].valid==true)
        {
            //printf("[%d]: old value %d ", i, data_cache[set_index].value[i]);
            data_cache[set_index].value[i]++;
            //printf("new value %d \n", data_cache[set_index].value[i]);
        }
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

int Cache::PrefetchDecision()
{
	return FALSE;
}

void Cache::PrefetchAlgorithm()
{
}

