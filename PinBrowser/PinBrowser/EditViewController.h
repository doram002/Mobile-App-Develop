
//  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.


#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *pinField;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *addressField;

- (IBAction)editingEnded:(id)sender;

- (IBAction)resignResponder:(id)sender;

@end
