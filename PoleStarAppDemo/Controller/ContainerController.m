//
//  ContainerController.m
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import "ContainerController.h"
#import "HomeController.h"
#import "MenuController.h"

@interface ContainerController ()
@property (nonatomic, retain) HomeController *homeController;
@property (nonatomic, retain) MenuController *menuController;
@property (nonatomic, retain) UINavigationController *centerController;
@property (nonatomic, assign) BOOL isExpanded;
@end

@implementation ContainerController

// MARK: - Properties




// MARK: - Init

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setIsExpanded:NO];
    
    [self configureHomeController];
}


// MARK: - Handler

- (void) configureHomeController{
    self.homeController = [[HomeController alloc] init];
    self.homeController.delegate = self;
    self.centerController = [[UINavigationController alloc]initWithRootViewController:self.homeController];
    
    [self.view addSubview:self.centerController.view];
    [self addChildViewController:self.centerController];
    [self.centerController didMoveToParentViewController:self];
}

- (void) configureMenuController{
    if( self.menuController == nil ){
        self.menuController = [[MenuController alloc] init];
        
        [self.view insertSubview:self.menuController.view atIndex:0];
        [self addChildViewController:self.menuController];
        [self.menuController didMoveToParentViewController:self];
    }
}

- (void) handleMenuToggle{
    if (!self.isExpanded) {
        [self configureMenuController];
    }
    
    [self setIsExpanded:!self.isExpanded];
    [self showMenuController:self.isExpanded];
}

- (void)showMenuController:(BOOL) shouldExpand{
    if (shouldExpand) {
        // Show the Menu
        [UIView animateWithDuration:0.3 animations:^{
            self.centerController.view.frame = CGRectMake(self.centerController.view.frame.size.width - 100, 0, self.centerController.view.frame.size.width, self.view.frame.size.height);
        }];
        
    } else {
        // Hide the Menu
        [UIView animateWithDuration:0.3 animations:^{
            self.centerController.view.frame = CGRectMake(0, 0, self.centerController.view.frame.size.width, self.view.frame.size.height);
        }];
    }
}


@end
