/* Originally taken from https://github.com/983/SHA-256/blob/main/example.c */

// #include "sha256.h"
/* The libary is availible at https://github.com/983/SHA-256/
 * I am not incliding the library or header file here.
 * I have added the relevent typedefs and function prototypes here for reference.
 */
#ifndef SHA256_H
#define SHA256_H

extern void sha256_hex(const void *input, size_t len, char *hex);
#define SHA256_HEX_SIZE (64 + 1) // 64 characters + null-character '\0'

#endif

#include <stdio.h>
#include <string.h>

int main(void)
{
	/* Input text. */
	const char *text = "Hello, World!";

	/* Char array to store the hexadecimal SHA-256 string. */
	/* Must be 65 characters big (or larger). */
	/* The last character will be the null-character. */
	char hex[SHA256_HEX_SIZE];

	/* Compute SHA-256 sum. */
	sha256_hex(text, strlen(text), hex);

	/* Print result. */
	printf("The SHA-256 sum of \"%s\" is:\n\n", text);
	printf("%s\n\n", hex);

	return 0;
}
