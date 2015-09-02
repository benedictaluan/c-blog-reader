//
//  WebViewController.h
//  C Blog Reader
//
//  Created by Benedict Aluan on 2/09/15.
//  Copyright (c) 2015 Pencil Rocket. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *blogPostURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
