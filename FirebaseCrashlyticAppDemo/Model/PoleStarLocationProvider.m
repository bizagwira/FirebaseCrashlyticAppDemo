//
//  PoleStarLocationProvider.m
//  MapwizeUIApp
//
//  Created by Pole Star on 22/11/2019.
//  Copyright © 2019 Etienne Mercier. All rights reserved.
//

#import "PoleStarLocationProvider.h"
#import "ILIndoorLocation.h"
#import "ILIndoorLocationProvider.h"


@interface PoleStarLocationProvider()


@property bool isOnSite;
@property NAOLocationHandle* locationHandle;

@end

@implementation PoleStarLocationProvider


- (instancetype) initWithApikey:(NSString*) apikey {
    self = [super init];
    if (self) {
        self.locationHandle = [[NAOLocationHandle alloc] initWithKey:apikey delegate:self sensorsDelegate:self];
        [self.locationHandle synchronizeData:self];
        self.isOnSite = false;
    }
    
    return self;
}

- (BOOL) supportsFloor {

    return true;
}

- (void) start {
//    [self.locationHandle start];
}

- (void) stop {
    [self.locationHandle stop];
}

- (BOOL) isStarted {
    return self.isOnSite ;
}

#pragma mark - NAOLocationHandleDelegate

- (void) didLocationChange:(CLLocation *)location {
    NSNumber *floorLevel = [[NSNumber alloc] initWithInteger:(location.altitude/5)];
    
    ILIndoorLocation *userLocation = [[ILIndoorLocation alloc] initWithProvider:self latitude:location.coordinate.latitude longitude:location.coordinate.longitude floor:floorLevel];
    
    [self dispatchDidUpdateLocation:userLocation];
}

- (void) didFailWithErrorCode:(DBNAOERRORCODE)errCode andMessage:(NSString *)message {
}

- (void) didLocationStatusChanged:(DBTNAOFIXSTATUS)status {
    NSString* statusString = [self stringFromStatus:status];
}


- (NSString*) stringFromStatus:(DBTNAOFIXSTATUS) status {
    switch (status) {
        case DBTNAOFIXSTATUS_NAO_FIX_UNAVAILABLE:
            return @"FIX_UNAVAILABLE";
            break;
        case DBTNAOFIXSTATUS_NAO_FIX_AVAILABLE:
            return @"AVAILABLE";
            break;
        case DBTNAOFIXSTATUS_NAO_TEMPORARY_UNAVAILABLE:
            return @"TEMPORARY_UNAVAILABLE";
            break;
        case DBTNAOFIXSTATUS_NAO_OUT_OF_SERVICE:
            return @"OUT_OF_SERVICE";
            break;
        default:
            return @"UNKNOWN";
            break;
    }
}

- (void) didEnterSite:(NSString *)name {
//    self.isOnSite = true;
}

- (void) didExitSite:(NSString *)name {
    self.isOnSite = false;
}

#pragma mark - NAOSyncDelegate

- (void)  didSynchronizationSuccess {
    [self.locationHandle start];
}

- (void)  didSynchronizationFailure:(DBNAOERRORCODE)errorCode msg:(NSString*) message {
    NSString *errorText = [NSString stringWithFormat:@"errorCode:%ld  message:%@", (long)errorCode, message];
}

#pragma mark - NAOSensorsDelegate

- (void)requiresBLEOn {
}

- (void)requiresWifiOn {
}

- (void)requiresLocationOn {
}

- (void)requiresCompassCalibration {
}
@end
