//
//  AppDelegate.m
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import "AppDelegate.h"
#import "ContainerController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = [[ContainerController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



@end
