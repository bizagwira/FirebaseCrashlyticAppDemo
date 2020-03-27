//
//  AppDelegate.m
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import <Firebase/Firebase.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ContainerController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [Fabric with:@[[Crashlytics class]]];
    
    // Use the Firebase library to configure APIs.
    [FIRApp configure];
    
//    [Fabric.sharedSDK setDebug:YES];
//    [FIRCrashlytics crashlytics];
    [[FIRCrashlytics crashlytics] setCrashlyticsCollectionEnabled:YES];

    NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  NSLocalizedString(@"The request failed.", nil),NSLocalizedDescriptionKey,
                                  NSLocalizedString(@"The response returned a 404.", nil),NSLocalizedFailureReasonErrorKey,
                                  NSLocalizedString(@"Does this page exist?", nil), NSLocalizedRecoverySuggestionErrorKey,
                                  @"123456",@"ProductID",
                                  @"Honoré BIZAGWIRA", @"UserID",
                                  nil];

    NSError *error = [NSError errorWithDomain:@"Crashlytics.test"
                              code:-1001
                              userInfo:userInfo];
    [[FIRCrashlytics crashlytics] recordError:error];
    
    return YES;
}

 


@end
