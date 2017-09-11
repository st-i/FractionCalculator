//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by iStef on 06.11.16.
//  Copyright © 2016 St. All rights reserved.
//

/*Chapter 21, Program 21.2___________________________________________________________________________*/

#import "Calculator.h"

@implementation Calculator

@synthesize operand2, accumulator;

-(id)init
{
    self=[super init];
    
    if (self) {
        operand2=[[Fraction alloc]init];
        accumulator=[[Fraction alloc]init];
    }
    return self;
}

-(void)clear
{
    accumulator.numerator=0;
    accumulator.denominator=0;
}

-(Fraction *)performOperation:(char)op
{
    Fraction *result;
    
    switch (op) {
        case '+':
            result=[accumulator add:operand2];
            break;
        case '-':
            result=[accumulator subtract:operand2];
            break;
        case '*':
            result=[accumulator multiply:operand2];
            break;
        case '/':
            result=[accumulator divide:operand2];
            break;
    }
    
    accumulator.numerator=result.numerator;
    accumulator.denominator=result.denominator;
    
    return accumulator;
}

@end
