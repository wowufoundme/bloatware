#include<bits/stdc++.h>
using namespace std;

bool checkInArray(int arr[], int x) {
	cout<<x<<"\n"<<"FRAMES: ";
	for(int i=0; i<3; i++) {
		cout<<arr[i]<<" ";
		if (arr[i] == x)
			return true;
		else
			continue;
		return false;
	}
}

int main() {
	//Variables
	int nop, nof, frames[3], pos = 0, counter = 0, faultCount = 0;
	//Pages available in the memory
	//cout<<"Enter the number of pages(Max: 20): ";
	//cin>>nop;
	//Frames or Buffer Size for the pages
	//cout<<"Enter the number of frames(Max: 10): ";
	//cin>>nof;
	
	//Page order in which the page arrives
	//cout<<"Enter the order of pages in the memory: ";
	//Input Pgae order
	nop = 12;
	nof = 3;
	int pOrder[12] = {1,2,3,4,1,2,5,1,2,3,4,5};
//	for(int i=0; i<nop; i++) {
//		cin>>pOrder[i];
//	}
	//Set frames = 0 i.e. it is empty
	for(int i=0; i<3; i++) {
		frames[i] = 0;
	}
	for(int i=0; i<3; i++) {
		cout<<frames[i]<<"";
	}
	cout<<endl;
	//Begin main code
	//Check all elements in the array pages stored in pOrder
	for(int i=0; i<nop; i++) {
		if(checkInArray(frames, pOrder[i])) // If element is found in the array
		{
			//Simply continue;
			continue;
		}
		else  // If the element is not found in the array 
		{
			cout<<"\nFault Found\n";
			faultCount++;
			if (counter == nof) {
				//Set counter = 0 to replace value in the starting if it has exceeded max
				counter = 0; 
			}
			else //Frame at value counter must be replaced with the current page 
			{
				frames[counter] = pOrder[i];
			}
			counter++;
		}
		for(int j=0; j<nof; j++) {
			cout<<frames[j]<<" ";
		}
		cout<<endl;
	}
	cout<<faultCount;
	return 0;	
}
