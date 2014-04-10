//  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.


#import "WebViewViewController.h"
#import "PinDataBase.h"



@implementation WebViewViewController

@synthesize webView;

@synthesize pinLabel, addressLabel;
@synthesize URL, pin;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Web", @"Web");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [self.addressLabel setText:@""];
    [self.pinLabel setText:@""];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:[PinDataBase sharedDB].currentURL]]];
    
    [[self view] removeFromSuperview ];
    
   [self.addressLabel setText:self.URL];
   [self.pinLabel setText:self.pin];

}

-(void)sendURLRequest: (NSString *) newURL
{
    self.URL = newURL;
    
//    [urlLabel setText:URL];
    
    
    
    [self.addressLabel setText:@""];
    [self.pinLabel setText:@""];
    
   self.URL = [PinDataBase sharedDB].currentURL;
   self.pin = [PinDataBase sharedDB].pin;
    NSLog(@"%@ %@" , self.URL, self.pin);
    NSURL *myURL = [NSURL URLWithString: self.URL];
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL: myURL];
    
    [self.addressLabel setText:self.URL];
    [self.pinLabel setText:self.pin];

    
    [webView loadRequest: myRequest];
    
    
  
       
    
    [[self view] removeFromSuperview ];
    
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
