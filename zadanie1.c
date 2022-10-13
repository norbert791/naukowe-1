#include <stdio.h>
#include <float.h>

int main(void) {
    register const float a = FLT_EPSILON;
    register const double b = DBL_EPSILON;
    printf("Float eps: %.36E, Double eps %.36E\n", a, b);
    return 0;
}
