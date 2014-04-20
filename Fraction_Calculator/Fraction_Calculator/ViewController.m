//
//  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Wednesday 02/05/2014
//

//  ViewController.m
//  Fraction_Calculator
//
//  Created by David Oramas on 2/3/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize display, displayString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    decimal = NO;
    firstOperand = YES;
    isNumerator = YES;
    self.displayString = [NSMutableString stringWithCapacity:40];
    
    myCalculator = [[Calculator alloc] init];
}

- (void) processDigit:(int)digit {
    
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:[NSString stringWithFormat:@"%i", digit]];
    display.text = displayString;
    
    
}

- (void) processOp:(char) theOp {
    
    NSString *opStr;
    
    op = theOp;
    
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" x ";
            break;
        case '/':
            opStr = @" ÷ ";
            break;
            
            }
    
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
    
}
    
- (void) storeFracPart {
    
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1; // not really needed
            
        } else {
            myCalculator.operand1.denominator = currentNumber;
        }
    }else if (isNumerator) {
        
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
        
    }else {
        
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    currentNumber = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickDigit:(UIButton *)sender {
    
    int digit = [sender tag];
    
    [self processDigit:digit];
    
    
}
- (IBAction)clickOver:(UIButton *)sender {
    
    [self storeFracPart];
    
    isNumerator = NO;
    
    [displayString appendString:@"/"];
    
    display.text = displayString;
    
    
}

- (IBAction)clickEquals:(UIButton *)sender {
    
    if (firstOperand==NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString: [myCalculator.acumulator convertToString]];
        display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
        
    }
}

- (IBAction)clickClear:(UIButton *)sender {
    
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [displayString setString:@""];
    display.text = displayString;
    
}

- (IBAction)convertToNum:(id)sender {
    
    if (!decimal) {
        
    [displayString setString: [NSString stringWithFormat:@"%f", [myCalculator.acumulator convertToNum]]];
    display.text = displayString ;
        decimal = YES;
        
    } else {
        
        [displayString setString:[myCalculator.acumulator convertToString]];
        display.text = displayString;
        decimal = NO;
    }
    
}
- (IBAction)clickPlus:(id)sender {
    
    [self processOp:'+'];
    
}

- (IBAction)clickMinus:(id)sender {
    
    [self processOp:'-'];
}

- (IBAction)clickMultiply:(id)sender {
    
    [self processOp:'*'];
}

- (IBAction)clickDivide:(id)sender {
    
    [self processOp:'/'];
}
@end
