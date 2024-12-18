#include <stdio.h>
#include <assert.h>
#include <stddef.h>

extern int sLength(const char* source);
extern int gHash(const char* source);

#define TABLE_SIZE (16)

int main()
{
assert(sLength(0) == 0);
assert(sLength("a") == 1);
printf("sLength OK\n");

assert(gHash("mohithv0311") == 639467543);
assert(gHash("alex35") == 5560235);
assert(gHash("jim45") == 643145);
assert(gHash("robin99") == 72863299);
assert(gHash("sam00") == 725100);
assert(gHash("john76") == 6492276);
assert(gHash("micheal09") == -1862749583);
assert(gHash("harry20") == 61633320);
assert(gHash("manuel65") == 665949065);
assert(gHash("ram75") == 715175);
assert(gHash("derrick21") == 1508259625);
printf("gHash OK\n");

printf("ALL OK\n");
    
    return 0;
}