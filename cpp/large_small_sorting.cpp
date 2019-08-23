#include<iostream>
#define N 3 
void sort(int a[], int);
void print(int a[], int);

int main(){
	int a[N];
	std::cout << "Stroke the fucking " << N <<" numbers: \n";
	for (int i = 0; i < N; i++){
		std::cin >> a[i];
	}
    sort(a, N);
    print(a, N);
    return 0;
}

void sort(int a[], int n){
	for (int i = 0; i < N - 1; i++){
		for (int j = i + 1; j < N; j++){
			if (a[i] < a[j]){
				int t = a[i];
				a[i] = a[j];
				a[j] = t;            
			}
		}
	}
}

void print(int a[], int n){
	for (int i = 0; i < N; i++){
		std::cout << a[i] << "\n";
	}
	std::cout << std::endl;
}