//
//  RushViewController.h
//  ThetaTau
//
//  Created by David Oramas on 3/25/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RushViewController : UIViewController <UITabBarControllerDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *rushVideoView;

@property (strong, nonatomic) NSString * URL;


- (IBAction)events:(id)sender;


@end
