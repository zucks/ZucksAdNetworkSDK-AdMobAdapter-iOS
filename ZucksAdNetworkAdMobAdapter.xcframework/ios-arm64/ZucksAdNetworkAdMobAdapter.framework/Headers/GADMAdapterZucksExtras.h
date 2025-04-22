//
//  GADMAdapterZucksExtras.h
//  ZucksAdNetworkSDK
//
//  Copyright (C) 2015 Zucks, Inc.
//

#import <Foundation/Foundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, GADMAdapterZucksInterstitialType) {
  GADMAdapterZucksInterstitialTypeRectangle,
  GADMAdapterZucksInterstitialTypeFullScreen
};

@interface GADMAdapterZucksExtras : NSObject<GADAdNetworkExtras>

@property(nonatomic, readonly) GADMAdapterZucksInterstitialType interstitialType;

+ (instancetype)zucksExtrasFullScreenInterstitial;

@end
NS_ASSUME_NONNULL_END
