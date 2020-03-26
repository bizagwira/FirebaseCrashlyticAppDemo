//
//  MainViewController.m
//  FirebaseCrashlyticAppDemo
//
//  Created by Pole Star on 25/03/2020.
//  Copyright © 2020 Pole Star. All rights reserved.
//
#import "MainViewController.h"
#import <Firebase/Firebase.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Detect when a crash happens during your app's last run.
    if([[FIRCrashlytics crashlytics] didCrashDuringPreviousExecution]){
        NSLog(@"#################### %s", __func__);
    }
}
- (IBAction)onCrashButtonPressed:(UIButton *)sender {
//        [[Crashlytics sharedInstance] crash];
    assert(NO);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
