#include <stdio.h> 
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

int addstr(char *a, char *b);
int is_palindrome(char *t, int h);
int factstr(char *s);
void palindrome_check();

int palindrome_is(char *g)
{
    int l = 0;
    int j = strlen(g) - 2;

    while(j > l)
    {
        if (g[l++] != g[j--])
        {
            printf("%s is not a palindrome\n", g);
            return 0;
        }
    }
    printf("%s is a palindrome\n", g);
    
    return 0;
}

int fact(int n)
{
    int x;
    int num = 1;

  
        for(x=1;x<=n;x++)
        {
            num = num*x;
        }
        return num;

}

int main()
{


int choice;


printf("Welcome to BackandForth!\n");

printf("1.) Add two numbers together\n");
printf("2.) Test if a string is a palindrome (C -> ASM)\n");
printf("3.) Print the factorial of a number\n");
printf("4.) Test if a string is a palindrome (ASM -> C)\n");

printf("Enter your choice here:");
scanf("%d", &choice);

switch (choice)
{
    case 1: {
        char *a = malloc(100);
        char *b = malloc(100);
        printf("Choose the two numbers you want to add!\n");
        scanf("%s",a);
        scanf("%s",b);
        int result = addstr(a,b);
        printf("The answer is %d\n", result);
        free(a);
        free(b);
        break;
    }

    case 2: {
        char *t = malloc(100);
        printf("Enter the string you want to test: \n");
        scanf("%s", t);
        if(is_palindrome(t, strlen(t) - 1))   
        {
            printf("%s","It is a palindrome\n");
    
        }
        else{
            printf("%s","It is not a palindrome\n");
        }
        free(t);
        break;
    }

    case 3: {
    char *s = malloc(100);
    printf("Print the number you want the factorial of: \n");
    scanf("%s", s);
    int answer = factstr(s);
    printf("The factorial is: %d\n", answer);
    free(s);
    break;
    }

    case 4:
        palindrome_check();

}

return 0;
}