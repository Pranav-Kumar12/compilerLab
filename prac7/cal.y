%{
    /* Definition Section */
    #include<stdio.h>
    int flag=0;
%}

%{
    int yylex();
    void yyerror();
%}

%token NUMBER

%left '+''-'

%left '*''/''%'

%left '('')'

/* Rule section */

%%
ArithmeticExpression: E{
    printf("\nResult=%d\n", $$);
    return 0;
            };

E: E'+'E {$$= $1+$3;}

|E'-'E {$$= $1-$3;}

|E'*'E {$$= $1*$3;}

|E'/'E {$$=$1/$3;}

|E'%'E {$$ =$1 % $3;}

|'('E')' {$$=$2;}

|NUMBER {$$= $1;}

;

%%

//driver code
void main()
{
    printf("\nEnter any arithmetic expression which can have operations: Addtion, Subtraction, Multiplication, Division, Modulus and Round Brackets: \n");

    yyparse();
    if(flag==0) printf("\nEntered arithmetic expression is valid\n\n");
}

void yyerror(){
    printf("\nEntered arithmetic expression is Invalid\n\n");
    flag=1;
}