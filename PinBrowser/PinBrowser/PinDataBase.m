//  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.

#import "PinDataBase.h"

@implementation PinDataBase

@synthesize addresses;
@synthesize currentURL,pin;

+ (PinDataBase*)sharedDB
{
    static PinDataBase *anInstance = nil;
    @synchronized(self) {
        if (anInstance == nil)
        {
            anInstance = [[self alloc] init];
            anInstance.addresses = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"http://www.apple.com", @"1111", @"http://www.google.com/" , @"1234" , @"http://www.youtube.com/", @"4321" , nil];
            
            
        }
    }
    return anInstance;
}

-(NSString *) getValue: (NSString *)key
{
    self.pin = key;
    self.currentURL = [[[PinDataBase sharedDB] addresses] valueForKey:key];
    
    return currentURL;
}

NSMutableArray *keys;
-(NSMutableArray *) getAllKey
{
    
    for (NSString *str in addresses) {
        [keys addObject:str];
    }
    return keys;
}
NSMutableArray *values;
-(NSMutableArray *) getAllValues
{
    
    for (NSString *str in addresses) {
        [values addObject:str];
    }
    return values;
    
}




@end
