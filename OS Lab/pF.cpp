#include <iostream>
#include <algorithm>
using namespace std;
int replacePos(int counter[],int n);
int main()
{
    int pages[10], frames[5], counter[5];
    int nPages,nFrames,pageFault=0;
    cout<<"Enter the number of pages(MAX 10): "; cin>>nPages;
    cout<<"Enter the number of frames(MAX 3): "; cin>>nFrames;
    cout<<"Enter the Page order: ";
    for(int i=0; i<nPages; i++){ 
			cin>>pages[i];
    }
    for(int i=0;i<nFrames;i++)
    {
      frames[i] = 0; 
      counter[i] = 0;
    }
    for(int i=0;i<nPages;i++)
    {
			int flag =0;
      for(int j=0;j<nFrames;j++)
      {
       if(frames[j] == pages[i]) {
			 		flag=1;  
          break;
        }
      }
      if(flag == 0)
      {
        pageFault++;
        for(int j=0;j<nFrames;j++)
        {
          if(frames[j] == 0)
          {   
						frames[j] = pages[i];
           	flag=1;
            counter[j]++;
            break;
          }
        }
      }
      if(flag == 0)
      {
        int pos = replacePos(counter,nFrames); 
        frames[pos] = pages[i];
        counter[pos] = 1;
        for(int k=0;k<nFrames;k++){  
					if(k!=pos)
          counter[k]++;
        }
    	}    
      cout<<endl;
      for(int j=0;j<nFrames;j++)
      {
          cout<<frames[j]<<" ";
      }         
    }    
    cout<<"\nTotal no of Page Faults: "<<pageFault;
    return 0;
}
int replacePos(int counter[],int n)
{
    int max = counter[0];
    int pos=0;
    for(int i=0;i<n;i++) { if(counter[i]>max)
       {
           pos=i;
           max = counter[i];
       }
    }
  	return pos;
}
