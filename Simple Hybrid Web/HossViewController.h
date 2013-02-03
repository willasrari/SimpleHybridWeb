//
//  HossViewController.h
//  Simple Hybrid Web
//
//  Created by will.asrari on 2/2/13.
//  Copyright (c) 2013 will.asrari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HossViewController : UIViewController<UIWebViewDelegate>

@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end