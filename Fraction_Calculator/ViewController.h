//
//  ViewController.h
//  Fraction_Calculator
//
//  Created by iStef on 05.11.16.
//  Copyright © 2016 St. All rights reserved.
//

/*Chapter 21, Program 21.2___________________________________________________________________________*/

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit:(NSInteger)digit;
-(void) processOp:(char)theOp;
-(void) storeFracPart;

//Numeric keys
-(IBAction) clickDigit:(UIButton *)sender;

//Arithmetic Operation Keys
-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

//Misc. keys
-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;
-(IBAction) tapConvert;


@end

