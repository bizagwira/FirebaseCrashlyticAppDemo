//
//  HomeController.h
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeControllerDelegate.h"
#import <MapwizeUI/MapwizeUI.h>
#import <MapwizeSDK/MWZMapView.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeController : UIViewController

@property (nonatomic, retain) MWZMapView* mapwizeView;
@property (nonatomic, weak) id <HomeControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
