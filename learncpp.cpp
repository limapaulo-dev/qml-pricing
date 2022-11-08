// C++ Course
// Start by choosing a chapter and
// write your code in this window.

#include <iostream>
#include <locale>
#include <array>

using namespace std;

int main() {
    setlocale(LC_ALL, "");

    //cout << "LC_ALL: " << setlocale(LC_ALL, "") << endl;
    //cout << "LC_CTYPE: " << setlocale(LC_CTYPE, "") << endl;


    //double a = 0;
    //
    //do {
    //    cout << "Digite um número menor que 10 > " << flush;
    //    cin >> a;
    //}while (a < 10);
    //
    //cout << "Você digitou um número maior que 10 troucha!" << endl;

    //for (int i=1; i<10 ; i++) {
    //    cout << "i = " << i << endl;
    //
    //
    //}

    //double values[] = {4, 5, 66, 7.5};
    //
    //for (int i=0; i<3 ; i++) {
    //    cout << "Element at index " << i << ":" << values[i] << endl;
    //}

    string animals[][4] {
        {"fox", "dog", "cat"},
        {"mouse", "squirrel", "parrot", "frog"}

    };

    std::array<int,2> dogs;

    cout << dogs.length ();



    //for (int i = 0; i < 2; ++i) {
    //    for (int j = 0; j < 4; ++j) {
    //        cout << animals[i][j] << endl;
    //    }
    //
    //    cout << endl;
    //
    //}

    return 0;
}
