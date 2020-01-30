#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

#define LIR 0
#define HIR_RES 1
#define HIR_NON 2

#define LIR_RATIO (5.0/8.0)

class Entry
{
public:
    Entry(int value,int state){
        this->value=value;
        this->state=state;
    }
    int value;
    int state;
};

class LIRSstack
{
public:
    vector<Entry*> container;

    int find_location(int value)
    {
        int location=-1;
        for(int i=0;i<container.size();i++){
            if(container[i]->value==value){
                location=i;
                break;
            }
        }
        return location;
    }

    void move_topORend(int location)
    {
        if(location=container.size()-1)
            return;
        Entry* tmpE=container[location];
        container.erase(container.begin()+location);
        container.push_back(tmpE);
    }

    void push_topORend(Entry *item)
    {
        container.push_back(item);
    }

    void pop_bottomORfront()
    {
        container.erase(container.begin());
    }

    void pop_location(int location)
    {
        container.erase(container.begin()+location);
    }
};

class LIRSstackS:public LIRSstack
{
public:
    void stack_pruning()
    {
        while(true){
            int state=container[0]->state;
            if(state==HIR_NON||state==HIR_RES)
                pop_bottomORfront();
            else
                break;
        }
    }

    void find_set_state(int value,int state)
    {
        int location=find_location(value);
        if(location!=-1)
            container[location]->state=state;
    }
};

class LIRSlistQ:public LIRSstack
{
public:
    void find_remove(int value)
    {
        int location=find_location(value);
        if(location!=-1)
            pop_location(location);
    }

    Entry* get_pop_front()
    {
        Entry* tmpE=container[0];
        pop_bottomORfront();
        return tmpE;
    }
};
