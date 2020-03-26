//
//  HomeController.m
//  PoleStarAppDemo
//
//  Created by Pole Star on 26/11/2019.
//  Copyright © 2019 Pole Star. All rights reserved.
//

#import "HomeController.h"
#import <MapwizeUI/MapwizeUI.h>
#import <MapwizeSDK/MapwizeSDK.h>
#import "PoleStarLocationProvider.h"
#import "HomeController.h"
#import "HomeControllerDelegate.h"


@interface HomeController () <MWZMapViewDelegate>

@property (nonatomic, retain) NSString *mapwizeApiKey;
@property (nonatomic, retain) NSString *mapwizeVenueId;
@property (nonatomic, retain) NSString *naoKey;

@end

@implementation HomeController



// MARK: - Properties




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    //!  Read and parse the Mapwize Apikey and venue ID
    self.mapwizeApiKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"mapwizeApiKey"];
    self.mapwizeVenueId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"mapwizeVenueId"];

    //! Read and parse the NAOSDK key
    self.naoKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"naoKey"];
    
    MWZUIOptions* opts = [[MWZUIOptions alloc] init];
    opts.centerOnVenueId = self.mapwizeVenueId;


    MWZMapwizeConfiguration *mapwizeConfiguration = [MWZMapwizeConfiguration configurationWithApiKey:self.mapwizeApiKey];
    self.mapwizeView = [[MWZMapView alloc] initWithFrame:self.view.frame
                                              options:opts
                                mapwizeConfiguration:mapwizeConfiguration];
    
    self.mapwizeView.delegate = self;
    self.mapwizeView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.mapwizeView];
    
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeLeft
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeLeft
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeTop
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeTop
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeBottom
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeBottom
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
    [[NSLayoutConstraint constraintWithItem:self.mapwizeView
                                  attribute:NSLayoutAttributeRight
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeRight
                                 multiplier:1.0f
                                   constant:0.0f] setActive:YES];
}



- (void)mapwizeView:(MWZMapView *)mapwizeView didTapOnPlaceInformationButton:(MWZPlace *)place {
    
}

- (void)mapwizeView:(MWZMapView *)mapwizeView didTapOnPlaceListInformationButton:(MWZPlacelist *)placeList {
}

- (void)mapwizeViewDidTapOnFollowWithoutLocation:(MWZMapView *)mapwizeView {
    NSLog(@"####################### [%d] %s", __LINE__, __FILE__);
}

- (void)mapwizeViewDidTapOnMenu:(MWZMapView *)mapwizeView {
    [self.delegate handleMenuToggle];
}

- (void) mapwizeViewDidLoad:(MWZMapView*) mapwizeView {
    PoleStarLocationProvider* locationProvider = [[PoleStarLocationProvider alloc] initWithApikey:self.naoKey];
    [self.mapwizeView setIndoorLocationProvider:locationProvider];
}

- (BOOL) mapwizeView:(MWZMapView *)mapwizeView shouldShowInformationButtonFor:(id<MWZObject>)mapwizeObject {
    if ([mapwizeObject isKindOfClass:MWZPlace.class]) {
        return YES;
    }
    return NO;
}

@end
