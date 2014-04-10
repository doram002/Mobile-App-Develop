///  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Thursday 01/29/2014
//


#import "ViewController.h"
#import "GameBoard.h"


@implementation ViewController

int toggle =0;

@synthesize myBoard, myButtons ,winText;






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

    for (int i = 0; i<=8; i++) {
        [[myButtons objectAtIndex:i] setImage: [UIImage imageNamed:  @"blank"]forState:UIControlStateNormal];
    }

    myBoard = [[GameBoard alloc] init];
    
    
    
    
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    if (myBoard.buttonPressedEnabled ) {
       // myBoard.numberOfPlays++;
    
    int tag = [sender tag];
    
    [myBoard updateBoard:tag];
   
    
    UIImage *temp = [myBoard setImage];
    
    [sender setImage: temp forState:UIControlStateNormal];
    
    
    [winText setText:(myBoard.winText)];

    }
    
}

- (IBAction)reset:(id)sender {
    
    for (int i = 0 ; i < [myButtons count]; i++) {
        
        [[myButtons objectAtIndex:i] setImage: [myBoard resetBoard] forState:UIControlStateNormal];

    }
    
    [winText setText:@""];
    [myBoard setNumberOfPlays:0];
    [myBoard setButtonPressedEnabled:true];
    
    }




@end
