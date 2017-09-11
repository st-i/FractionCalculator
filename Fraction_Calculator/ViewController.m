//
//  ViewController.m
//  Fraction_Calculator
//
//  Created by iStef on 05.11.16.
//  Copyright © 2016 St. All rights reserved.
//

/*Chapter 21, Program 21.2___________________________________________________________________________*/

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController
{
    char op;
    int currentNumber, opCount;
    BOOL firstOperand, isNumerator, negative, canBeNegative;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    //Override point for customization after application launch
    firstOperand=YES;
    isNumerator=YES;
    negative=NO;
    canBeNegative=YES;
    displayString=[NSMutableString stringWithCapacity:40];
    myCalculator=[[Calculator alloc]init];
}

-(void)processDigit:(int)digit
{
    if (digit==0 && currentNumber==0 && !isNumerator) {
        display.text=@"Error!";
    }
    else{
    currentNumber=currentNumber*10+digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text=displayString;

    }
}

-(IBAction)clickDigit:(UIButton *)sender
{
    int digit=sender.tag;
    [self processDigit:digit];
}

-(void)processOp:(char)theOp
{
    [self storeFracPart];
    if (opCount>1) {
        [myCalculator performOperation:op];
    }
    
    NSString *opStr;
    
    op=theOp;
    canBeNegative=YES;
    
    switch (theOp) {
        case '+':
            opStr=@"+";
            break;
        case '-':
            opStr=@"-";
            break;
        case '*':
            opStr=@"x";
            break;
        case '/':
            opStr=@"÷";
            break;
    }
    firstOperand=NO;
    isNumerator=YES;
    
    [displayString appendString:opStr];
    display.text=displayString;
}

-(void)storeFracPart
{
    if (firstOperand) {
        if (isNumerator) {
            if (negative) {
                myCalculator.accumulator.numerator=-currentNumber;
                myCalculator.accumulator.denominator=1;
            }else{
                myCalculator.accumulator.numerator=currentNumber;
                myCalculator.accumulator.denominator=1;
            }
        }
        else
            myCalculator.accumulator.denominator=currentNumber;
    }
    else if (isNumerator){
        if (negative) {
            myCalculator.operand2.numerator=-currentNumber;
            myCalculator.operand2.denominator=1;
        }else{
            myCalculator.operand2.numerator=currentNumber;
            myCalculator.operand2.denominator=1;
        }
    }
    else{
        myCalculator.operand2.denominator=currentNumber;
        firstOperand=YES;
    }
    
    currentNumber=0;
}

-(IBAction)clickOver
{
    [self storeFracPart];
    isNumerator=NO;
    canBeNegative=NO;
    [displayString appendString:@"/"];
    display.text=displayString;
}

//Arithmetic Operation Keys
-(IBAction)clickPlus
{
    ++opCount;
    [self processOp:'+'];
}

-(IBAction)clickMinus
{
    if (canBeNegative) {
        negative=YES;
        [displayString appendString:@"-"];
        display.text=displayString;
    }
    else {
        ++opCount;
        [self processOp:'-'];
    }
}

-(IBAction)clickMultiply
{
    ++opCount;
    [self processOp:'*'];
}

-(IBAction)clickDivide
{
    ++opCount;
    [self processOp:'/'];
}

//misc. keys
-(IBAction)clickEquals
{
    if (firstOperand==NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@"="];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        display.text=displayString;
        
        currentNumber=0;
        firstOperand=YES;
        isNumerator=YES;

        [displayString setString:@""];
        
    }
}

-(IBAction)clickClear
{
    isNumerator=YES;
    firstOperand=YES;
    negative=NO;
    currentNumber=0;
    opCount=0;
    [myCalculator clear];
    
    [displayString setString:@""];
    display.text=displayString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) tapConvert
{
    [displayString appendString:@"="];
    [displayString appendFormat:@"%.12f", [myCalculator.accumulator convertToNum]];
    display.text=displayString;
}


@end
