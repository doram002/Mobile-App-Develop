//
//  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Wednesday 02/05/2014
//

//  Calculator.m
//  Fraction_Calculator
//
//  Created by David Oramas on 2/3/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "Calculator.h"



@implementation Calculator

@synthesize operand1, operand2, acumulator;



- (id)init
{
    self = [super init];
    
    if (self) {
        operand1 = [[Fraction alloc] init];
        operand2 = [[Fraction alloc] init];
        acumulator = [[Fraction alloc] init];
    }
    
    
    return self;
}

- (void) clear {
    
    acumulator.numerator = 0;
    acumulator.denominator = 0;
    
}

- (Fraction *) performOperation:(char)op {
    
    Fraction *result;
    
    switch (op) {
        case '+':
            result = [operand1 add: operand2];
            break;
        case '-':
            result = [operand1 substract:operand2];
            break;
        case '*':
            result = [operand1 multiply: operand2];
            break;
        case '/':
            result = [operand1 divide: operand2];
            break;
    }
    
    acumulator.numerator = result.numerator;
    acumulator.denominator = result.denominator;
    
    return acumulator;
    
}


@end
