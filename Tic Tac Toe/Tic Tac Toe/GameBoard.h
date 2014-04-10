///  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Thursday 01/29/2014
//


#import <Foundation/Foundation.h>

@interface GameBoard: NSObject
{
    UIImage *temp;

        
    
    NSMutableArray * state;
    
    bool buttonPressed;
    
    NSString* winText;
    bool buttonPressedEnabled;
    
    int numberOfPlays;
    
    
}

@property bool buttonPressed, buttonPressedEnabled;
@property int numberOfPlays;
@property NSString * winText;

@property (strong, nonatomic) NSMutableArray *state;

@property (strong, nonatomic) UIImage * O, *X, *blank;

@property (strong, nonatomic) NSArray * labelManager;


- (void) updateBoard:(int)position ;

- (void) checkWinner;

- (UIImage*) setImage;

- (id) init;

- (UIImage*) resetBoard;

- (void) checkSetQuadrants;




@end
