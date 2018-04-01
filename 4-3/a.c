int a = 0;
int b = 0;

int main() {
    for (a = 0; a <= 10; a++) 
        b += a;
    a = 0;
    b = 0;
    while (a <= 10) {
        b += a;
        a++;
    }
    a = 0;
    b = 0;
    do {
        b += a;
        a++;
    } while (a <= 10); 
    return 0;
}
