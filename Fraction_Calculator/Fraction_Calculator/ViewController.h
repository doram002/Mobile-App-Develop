////
//  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Wednesday 02/05/2014
//

//  ViewController.h
//  Fraction_Calculator
//
//  Created by David Oramas on 2/3/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"


@interface ViewController : UIViewController{
    
    UILabel *display;
    
    char op;
    
    int currentNumber;
    
    NSMutableString * displayString;
    
    BOOL firstOperand, isNumerator, decimal;
    
    Calculator * myCalculator;
    
    
    
}



@property (strong, nonatomic) IBOutlet UILabel *display;

@property (strong, nonatomic) NSMutableString *displayString;

- (void) processDigit: (int) digit;
- (void) processOp: (char) theOp;
- (void) storeFracPart;


// Numeric keys

- (IBAction)clickDigit:(UIButton *)sender;

// Arithmetic Operation keys

- (IBAction)clickPlus:(id)sender;

- (IBAction)clickMinus:(id)sender;

- (IBAction)clickMultiply:(id)sender;

- (IBAction)clickDivide:(id)sender;

// Misc. Keys

- (IBAction)clickOver:(UIButton *)sender;

- (IBAction)clickEquals:(UIButton *)sender;

- (IBAction)clickClear:(UIButton *)sender;

- (IBAction)convertToNum:(id)sender;






@end
