//
//  HossViewController.m
//  Simple Hybrid Web
//
//  Created by will.asrari on 2/2/13.
//  Copyright (c) 2013 will.asrari. All rights reserved.
//

#import "HossViewController.h"

@interface HossViewController()

- (void)loadHtml;
- (void)updateUserDefaultsWithUsername:(NSString *)username;

@end

@implementation HossViewController

@synthesize navigationBar = _navigationBar;
@synthesize webView = _webView;

- (void)dealloc {    
    _webView.delegate = nil;
    
    [_webView release];
    [_navigationBar release];
    
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [self.webView setDelegate:self];
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [self loadHtml];
    
    [super viewDidLoad];
}

- (void)loadHtml {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]  pathForResource:@"hoss" ofType:@"html"]isDirectory:NO]]];
}

- (void)updateUserDefaultsWithUsername:(NSString *)username {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:username forKey:@"Username"];
    [userDefaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UIWebViewDelegate implementation

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSData *data = request.HTTPBody;
    NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    if ([dataString length] > 0) {
        NSString *username = [[dataString componentsSeparatedByString:@"="] objectAtIndex:1];
        
        [self.navigationBar.topItem setTitle:[NSString stringWithFormat:@"Hello %@!", username]];
        [self updateUserDefaultsWithUsername:username];
    }
        
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"Username"];
    
    if (username) {
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('divFormHoss').style.display = 'none';"];
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('divConfirmation').style.display = '';"];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello Friend" message:[NSString stringWithFormat:@"Welcome back %@!", username] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
}

@end