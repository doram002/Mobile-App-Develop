//
//  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Wednesday 02/05/2014
//

//  Calculator.h
//  Fraction_Calculator
//
//  Created by David Oramas on 2/3/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject {
    
    Fraction *operand1 ;
    
    Fraction *operand2;
    
    Fraction *accumlator;
}

@property (strong, nonatomic) Fraction *operand1, *operand2, *acumulator;

- (Fraction *) performOperation: (char) op;
- (void) clear;

@end
