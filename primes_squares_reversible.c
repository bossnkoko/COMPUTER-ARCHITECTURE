/* A PROGRAM THAT FINDS SUARE PRIMES AND THEIR REVERSE

NAME : THABANG NKOKO
SCHOOL: NUL
COURSE : ELECTRONICS ENGINEERING */

#include <stdio.h>
#include<math.h>

// function prototypes
void is_prime(int n);
void isPalindrome(int n);
void reverseDigits(int num);
void list_prime_numbers(int num);


//macro to define prime number range
#define RANGE 2000

	int main()
		{
			//call function
		    list_prime_numbers(RANGE);
		  
		    return 0;
		}


// function definations

void is_prime(int n){
    double squareroot = sqrt (n);
    
    if(squareroot-(int)squareroot == 0){

    
     int n, i, flag = 0;
     for (i = 2; i <= squareroot / 2; ++i) {

    
    if ((int)squareroot % i == 0) {
      flag = 1;
      break;
    }
  }

  
  if (flag == 0)
    printf("%0.f\n ", squareroot*squareroot);
    }
 
}


void isPalindrome(int n)
{
     int reversed = 0, remainder = 0, original= 0;
    
    original = n;

    // reversed integer is stored in reversed variable
    while (n != 0)
	 {
        remainder =( n % 10 );
        reversed = (reversed *10) + remainder;
        n /= 10;
    }

    // palindrome if orignal and reversed are equal
    if (original != reversed)  
       
       
      is_prime(original);
                  
       


}


void reverseDigits(int num)
{
	int rev_num = 0;
	while (num > 0) {
		rev_num = (rev_num * 10) +  ( num % 10 );
		num = num / 10;
	}


    isPalindrome(rev_num);
}

void list_prime_numbers(int num)
{
 int i, count=0, j,square = 0;
   // printf("Prime numbers between 1 to 50 are:\n");
    for(i=1; i<=num; i++)
    {
        for(j=2; j<i; j++)
        {
           if(i%j==0)
           {
               count++;
               break;
           }
        }
        if(count==0 && i!=1)
            //printf("%d\n", i);
          {  square = i*i;
             reverseDigits(square);
          }
        count = 0;
    }
}
