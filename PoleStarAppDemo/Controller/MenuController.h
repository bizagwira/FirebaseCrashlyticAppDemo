//
//  MenuController.h
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapwizeSDK/MapwizeSDK.h>

@class MWZComponentBottomInfoView;

NS_ASSUME_NONNULL_BEGIN

@interface MenuController : UIViewController
@property (nonatomic) MWZComponentBottomInfoView* bottomInfoView;

@end

NS_ASSUME_NONNULL_END
