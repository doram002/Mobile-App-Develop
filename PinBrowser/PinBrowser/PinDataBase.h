//  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.

#import <Foundation/Foundation.h>

@interface PinDataBase : NSObject

@property (strong, nonatomic) NSMutableDictionary * addresses;

@property (strong,nonatomic) NSString *currentURL;
@property (strong, nonatomic) NSString *pin;


+(PinDataBase*) sharedDB;    

-(NSString *) getValue: (NSString *)key;

-(NSMutableArray *) getAllKey;

-(NSMutableArray *) getAllValues;


@end
