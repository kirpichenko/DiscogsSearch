//
//  AppDelegate.m
//  DiscogsSearch
//
//  Created by Ievgeniy Kirpichenko on 3/22/15.
//  Copyright (c) 2015 Ievgeniy Kirpichenko. All rights reserved.
//

#import "AppDelegate.h"

#import "SearchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SearchViewController *searchViewController = [SearchViewController new];
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:searchViewController];
    
    [self.window setRootViewController:navigationViewController];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
