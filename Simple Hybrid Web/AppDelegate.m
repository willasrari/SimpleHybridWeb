//
//  AppDelegate.m
//  Simple Hybrid Web
//
//  Created by will.asrari on 2/2/13.
//  Copyright (c) 2013 will.asrari. All rights reserved.
//

#import "AppDelegate.h"
#import "HossViewController.h"

@implementation AppDelegate

- (void)dealloc {
    [_window release];
    [_viewController release];
    
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.viewController = [[HossViewController alloc] initWithNibName:@"HossWebView" bundle:nil];
            
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

-(void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end