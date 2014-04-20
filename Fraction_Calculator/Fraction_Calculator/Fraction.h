//
//  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Wednesday 02/05/2014
//

//  Fraction.h
//  Fraction_Calculator
//
//  Created by David Oramas on 2/3/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject {
    
    int numerator;
    int denominator;
}

@property int numerator, denominator;

- (void) print;

- (void) setTo: (int) n over: (int) d;

- (Fraction *) add: (Fraction *) f;

- (Fraction *) substract: (Fraction *) f;

- (Fraction *) multiply: (Fraction *) f;

- (Fraction *) divide: (Fraction *) f;

- (void) reduce;

- (double) convertToNum;

- (NSString *) convertToString;


@end
