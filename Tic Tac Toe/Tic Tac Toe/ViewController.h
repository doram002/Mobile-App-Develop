///  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Thursday 01/29/2014
//


#import <UIKit/UIKit.h>

@class GameBoard;

@interface ViewController : UIViewController   


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *myButtons;


@property (strong, nonatomic) GameBoard * myBoard;


- (IBAction)buttonPressed:(id)sender;


- (IBAction)reset:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *winText;

@end
