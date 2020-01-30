#ifndef CACHE_CACHE_H_
#define CACHE_CACHE_H_

#include <stdint.h>
#include <vector>
#include <math.h>
#include "storage.h"
#include "LIRSContainer.h"
using namespace std;

#define RP_LRU 0
#define RP_LIRS 1

#define PF_STREAM -1

typedef struct CacheConfig_
{
	// int size;
	// int associativity;
	// int set_num; // Number of cache sets
	int write_through; // 0|1 for back|through
	int write_allocate; // 0|1 for no-alc|alc

	int s;
	int S;  // S = 2^s sets
	int e;
	int E;  // E = 2^e lines per set
	int b;
	int B;  // B = 2^b bytes per cache block (the data)
	int c;
	int C;  // C = S x E x B data bytes,2^c
	int replace_type;
	int prefetch_num;
} CacheConfig;

struct Block
{
	bool valid;
	int tag;
	bool dirty;  // dirty==true means ot has been written
};
struct Set
{
	vector<Block> data_set;
	vector<int> value;  // 用于判断LRU的替换策略
	LIRSstackS stackS;
	LIRSlistQ listQ;
	int lirsize;
	int hirsize;

	void add_HIR_RES(int tag)
	{
        Entry *tmpE=new Entry(tag,HIR_RES);
        stackS.push_topORend(tmpE);
        listQ.push_topORend(tmpE);
	}
	void hit_LIR(int location)
	{
        stackS.move_topORend(location);
        stackS.stack_pruning();
	}
	void hit_HIR_stack(int location)
	{
        int tag=stackS.container[location]->value;
        stackS.container[location]->state=LIR;
        stackS.move_topORend(location);
        stackS.container[0]->state=HIR_RES;
        listQ.push_topORend(stackS.container[0]);
        listQ.find_remove(tag);
        stackS.stack_pruning();
	}
	void hit_HIR_list(int location)
	{
        stackS.push_topORend(listQ.container[location]);
        listQ.move_topORend(location);
	}
};

typedef struct Stream_
{
	uint64_t addr;
	int valid;
	int block_valid;
	Stream_(){valid = 0; block_valid=4;}
} Stream;

class Cache : public Storage
{
public:
	Cache() {}
	~Cache() {}

	// Sets & Gets
	void SetConfig(CacheConfig cc);
	void GetConfig(CacheConfig cc);
	// Set lower storage level.
	void SetLower(Storage *ll) { lower_ = ll; }
	void BuildCache();
	void PrintCache();
	// Main access process
	void HandleRequest(uint64_t addr, int bytes, int read,
		char *content, int &hit, int &time);
    int FIFO;
    Stream *stream;
    int stream_size;

private:
	// Bypassing
	int BypassDecision();
	// Partitioning
	void PartitionAlgorithm(uint64_t addr,uint64_t& tag,uint64_t& set_index,uint64_t& block_offset);
	// Replacement
	int ReplaceDecision(uint64_t tag,uint64_t set_index);
	void ReplaceAlgorithm(uint64_t tag,uint64_t set_index,int& time);
	// Prefetching
	bool PrefetchHit(uint64_t addr);
	void PrefetchUpdate(uint64_t addr);
	int PrefetchDecision();
	void PrefetchAlgorithm(uint64_t addr,int& time);

	void getoutindexLRU(uint64_t set_index,int &out_index);
	void updateLRU(uint64_t set_index,uint64_t tag);
	void getoutindexLIRS(uint64_t set_index,int &out_index);
	void updatehitLIRS(uint64_t set_index,uint64_t tag);
	void findblockindex(uint64_t set_index,uint64_t tag,uint64_t &block_index);

	CacheConfig config_;
	Storage *lower_;
	vector<Set> data_cache;
	DISALLOW_COPY_AND_ASSIGN(Cache);
};

#endif //CACHE_CACHE_H_
