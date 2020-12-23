#define retCode 0
#define condition

int main(int argc, char** argv){
    // this is the top of main
    #ifdef condition
        int a;
    #else
        int b;
    #endif

    return retCode;
}
