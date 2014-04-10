///  PROGRAMMER: David Oramas
//  PANTHERID: 2889224
//  CLASS:          COP 465501 MW 5:00
//  INSTRUCTOR:     Steve Luis  ECS 282
//  ASSIGNMENT:     #5
//  DUE:            Sunday 03/16/2014
/// Copyright (c) 2014 David Oramas. All rights reserved.


#import <UIKit/UIKit.h>

@interface WebViewViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString * URL;

@property (strong, nonatomic) NSString * pin;

-(void)sendURLRequest: (NSString *) newURL;

@property (strong, nonatomic) IBOutlet UILabel *pinLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@end
