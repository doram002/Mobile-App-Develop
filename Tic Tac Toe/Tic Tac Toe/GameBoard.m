///  PROGRAMMER: David Oramas
//  PANTHERID: 1234567
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #2
//  DUE:            Thursday 01/29/2014
//
#import "GameBoard.h"

@implementation GameBoard


@synthesize labelManager, buttonPressed, buttonPressedEnabled;

@synthesize  state, winText, numberOfPlays;



- (id)init
{
    self = [super init];
    if (self) {
       
        
        state = [[NSMutableArray alloc] initWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
     
        buttonPressedEnabled = true;
      
        
        
    }
    return self;
    

}

- (void) updateBoard:(int)position {
    
    [self checkSetQuadrants];
    
    if ( [[state objectAtIndex:position] isEqual:@""]&& !buttonPressed)
    {
        [state replaceObjectAtIndex:position withObject:(@"X")];
       
        temp = [UIImage imageNamed:@"x.jpg"];
        buttonPressed = true;
        
        
       
        
       
    }else   if([[state objectAtIndex:position] isEqual:@""]&& buttonPressed )
    {
        [state replaceObjectAtIndex:position withObject:(@"O")];
        temp = [UIImage imageNamed:@"o.jpg"];
        buttonPressed = false;
        
        
   
    }else if([[state objectAtIndex:position] isEqual:@"X"]){
        buttonPressed = false;
        [state replaceObjectAtIndex:position withObject:(@"")];
        temp = [ UIImage imageNamed:@"blank.png"];

    }
        else{
            buttonPressed = true;
        [state replaceObjectAtIndex:position withObject:(@"")];
        temp = [ UIImage imageNamed:@"blank.png"];
        
    }
    
  [self checkWinner];

}

- (UIImage*) setImage {
    
    return temp;
}

- (UIImage*) resetBoard {
    
    for (int i = 0 ; i <  [state count]; i++) {
        [state replaceObjectAtIndex:i withObject:(@"")];
    }
    winText = @"";
    buttonPressed = false;
    return [UIImage imageNamed:@"blank.png"];
    buttonPressedEnabled =true;
  //  numberOfPlays = 0;
}

- (void) checkSetQuadrants{
    int counter =0;
    for (NSString *current in state) {
        if (![current isEqual: @""]) {
            counter++;
        }
    }
    numberOfPlays = counter;
}
- (void) checkWinner {
     
    if (numberOfPlays <8){
    
    if ([[state objectAtIndex:0] isEqual:[state objectAtIndex:1]] && [[state objectAtIndex:0] isEqual:[state objectAtIndex:2]] && ![[state objectAtIndex:0&1&2] isEqual: @""] ){
        NSLog(@"1. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:0]];
        buttonPressedEnabled = false;
        
    }
    else if ([[state objectAtIndex:0] isEqual:[state objectAtIndex:3]] && [[state objectAtIndex:0] isEqual:[state objectAtIndex:6]] && ![[state objectAtIndex:0&3&6] isEqual: @""] ){
        NSLog(@"2.Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:0]];
        buttonPressedEnabled = false;
    }
    else if ([[state objectAtIndex:6] isEqual:[state objectAtIndex:7]] && [[state objectAtIndex:6] isEqual:[state objectAtIndex:8]] && ![[state objectAtIndex:8] isEqual: @""]){
        NSLog(@"3. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:6]];
        buttonPressedEnabled = false;
    }
    else if ([[state objectAtIndex:2] isEqual:[state objectAtIndex:5]] && [[state objectAtIndex:2] isEqual:[state objectAtIndex:8]] && ![[state objectAtIndex:8] isEqual: @""]){
        NSLog(@"4. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:2]];
        buttonPressedEnabled = false;
    }
    else if ([[state objectAtIndex:3] isEqual:[state objectAtIndex:4]] && [[state objectAtIndex:3] isEqual:[state objectAtIndex:5]] && ![[state objectAtIndex:4] isEqual: @""]){
        NSLog(@"5. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:3]];
        buttonPressedEnabled = false;
    }
    else if ([[state objectAtIndex:0] isEqual:[state objectAtIndex:4]] && [[state objectAtIndex:0] isEqual:[state objectAtIndex:8]] && ![[state objectAtIndex:8] isEqual: @""]){
        NSLog(@"6. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:0]];
        buttonPressedEnabled = false;
    }
    else if ([[state objectAtIndex:2] isEqual:[state objectAtIndex:4]] && [[state objectAtIndex:2] isEqual:[state objectAtIndex:6]] && ![[state objectAtIndex:6] isEqual: @""]){
        NSLog(@"7. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:2]];
        buttonPressedEnabled = false;
    }
    else if ([[state objectAtIndex:1] isEqual:[state objectAtIndex:4]] && [[state objectAtIndex:1] isEqual:[state objectAtIndex:7]] && ![[state objectAtIndex:7] isEqual: @""]){
        NSLog(@"7. Somebody Won");
        winText = [NSString stringWithFormat:@"The Winner is: %@", [state objectAtIndex:1]];
        buttonPressedEnabled = false;
    }
    else {
        winText = @"";
        numberOfPlays = 0;
    }
    }else  {
        winText = [NSString stringWithFormat:@"Game Tie"];
        buttonPressedEnabled = false;
        
    }

    
      
    
 }

@end
