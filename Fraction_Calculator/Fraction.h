//
//  Fraction.h
//  Fraction_Calculator
//
//  Created by iStef on 06.11.16.
//  Copyright © 2016 St. All rights reserved.
//

/*Chapter 21, Program 21.2___________________________________________________________________________*/

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void) print;
-(void) setTo:(int)n over:(int)d;
-(Fraction *)add:(Fraction *)f;
-(Fraction *)subtract:(Fraction *)f;
-(Fraction *)multiply:(Fraction *)f;
-(Fraction *)divide:(Fraction *)f;
-(void)reduce;
-(double)convertToNum;
-(NSString *)convertToString;

@end
