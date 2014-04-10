//  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.

#import "EditViewController.h"
#import "PinDataBase.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize pinField, addressField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        
            self.title = NSLocalizedString(@"Edit", @"Edit");
            self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    int index = 0;
    
    for (NSString *str in [[PinDataBase sharedDB].addresses keyEnumerator]) {
        [[pinField objectAtIndex:index++] setText: str ];
    }
    index = 0;
    for (NSString *str in [[PinDataBase sharedDB].addresses allValues]) {
        [[addressField objectAtIndex:index++] setText: str ];
    }
    
   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editingEnded:(id)sender
{
    
    [sender resignFirstResponder];
    [self updateValues];
    
}

- (IBAction)resignResponder:(id)sender
{
      [self.view endEditing:YES];
    
      [self updateValues];
   
}

- (void)updateValues
{
    for (int i = 0; i<self.pinField.count; i++)
    {
        [[PinDataBase sharedDB].addresses setValue:[(UITextField*) [self.addressField objectAtIndex:i] text]  forKey:[self.pinField objectAtIndex:i]!=NULL ?[(UITextField*)[self.pinField objectAtIndex:i] text] : @"" ];
    }
    
    for (NSString *str in [[PinDataBase sharedDB].addresses allValues])
    {
        NSLog(@"%@",(NSString*)str);

    }
}





















@end
