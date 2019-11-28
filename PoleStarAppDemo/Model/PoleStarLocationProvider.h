//
//  PoleStarLocationProvider.h
//  MapwizeUIApp
//
//  PoleStarLocationProvider is used to link the NAOSDK and MapwizeView
//
//  Created by Pole Star on 22/11/2019.
//  Copyright © 2019 Honoré BIZAGWIRA. All rights reserved.
//


#import "ILIndoorLocationProvider.h"
#import "ContainerController.h"
#import "NAOSDK.h"

NS_ASSUME_NONNULL_BEGIN

@interface PoleStarLocationProvider : ILIndoorLocationProvider<NAOLocationHandleDelegate, NAOSyncDelegate, NAOSensorsDelegate>



- (instancetype) initWithApikey:(NSString*) apikey;


@end




NS_ASSUME_NONNULL_END
