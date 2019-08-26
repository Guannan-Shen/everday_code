#include <iostream>
#define max_len 100
using namespace std

void search(int a[], int);
void sort(int a[], int);
void print(int a[], int);

int main(){
	int a[max_len];
	int Num;
    cout << "Provide less than " << max_len << " integers which are separated by whitespace: " << endl;
    for (int i = 0; i < max_len; i++){
    	cin >> a[i];
    }
    sort(a, max_len);
    print(a, max_len);
    cout << "Provide an integer: \n" << endl;
    cin >> Num;
	return 0;
}