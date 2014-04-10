//  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.
//

#import "PinViewController.h"
#import "PinDataBase.h"
#import "WebViewViewController.h"

@interface PinViewController ()

@end

@implementation PinViewController


@synthesize labels;
int count = 0;

NSMutableArray *pinValues;

NSString *pinString =@"";


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Pin", @"Pin");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    int digit = [sender tag];
    NSString* URL = @"";
    
    
    if( count < 4 )
    {
        [[labels objectAtIndex:count] setText: [NSString stringWithFormat:@"%d", digit]];
        
        
        
        [pinValues insertObject: [NSString stringWithFormat:@"%d", digit] atIndex: count];
        
        pinString = [pinString stringByAppendingString:[NSString stringWithFormat:@"%d", digit]];
      
        count++;
       
   
    }
    
    
    //If user entered all 4 pin numbers
    if(count == 4)
    {
        [[labels objectAtIndex:count-1] setText: [NSString stringWithFormat:@"%d", digit]];
       
       
        
        if ((URL = [[PinDataBase sharedDB] getValue:pinString]) !=NULL )
       {
        
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Found Entry"
                              message:@"Check the browser. To view page."
                              delegate:self
                             cancelButtonTitle:@"OK."
                              otherButtonTitles:nil];
       [alert show];
        while ((!alert.hidden) && (alert.superview != nil))
        {
            [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
        }
        
             
        
        for(int i = 0; i < 4; i++ )
        {
            [[labels objectAtIndex:i] setText:@""];
        }
        pinString = @"";

     count = 0;
           
           [(WebViewViewController*)[self.tabBarController.viewControllers objectAtIndex:1] sendURLRequest: URL];
            self.tabBarController.selectedViewController =[self.tabBarController.viewControllers objectAtIndex:1];

} else
    {
        
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Invalid Pin"
                                  message:@"You have entered an invalid pin. Try again"
                                  delegate:self
                                  cancelButtonTitle:@"OK."
                                  otherButtonTitles:nil];
            [alert show];
            while ((!alert.hidden) && (alert.superview != nil))
            {
                [[NSRunLoop currentRunLoop] limitDateForMode:NSDefaultRunLoopMode];
            }

            
            count = 0;
            
            [[labels objectAtIndex:count] setText: [NSString stringWithFormat:@"%d", digit]];
            
            int i;
            for( i = 0; i < 4; i++ )
            {
                [[labels objectAtIndex:i] setText:@""];
            }
            pinString = @"";
        }

    }
    }

}

@end
