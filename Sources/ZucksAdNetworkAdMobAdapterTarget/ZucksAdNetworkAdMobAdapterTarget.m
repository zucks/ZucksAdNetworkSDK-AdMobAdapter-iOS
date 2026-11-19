// Swift Package Manager向けのラッパーターゲット。
//
// binaryTargetは依存関係を宣言できない為、SDK本体とGoogle Mobile Ads SDKへの依存はこのターゲットが宣言する。
// あわせて、AdMobが名前で動的にロードするアダプタクラスをここから参照する。
// Swift Package Managerは利用側に `-ObjC` を付与しない為、この参照がないと
// 利用側コードから直接参照されないクラスがリンク時に除去され、AdMobからロードできなくなる。
//
// アダプタのクラスを追加・削除した場合は、下記の一覧も更新すること。
// 一覧がXCFramework内のクラスと一致することは `make check-spm-adapter-class-refs` で確認できる。
@import Foundation;

@interface GADMAdapterZucksAds : NSObject
@end
@interface GADMAdapterZucksExtras : NSObject
@end
@interface GADMediationAdapterZucks : NSObject
@end
@interface GADMediationAdapterZucksBannerAd : NSObject
@end
@interface GADMediationAdapterZucksInterstitialAd : NSObject
@end
@interface GADMediationAdapterZucksRewardedAd : NSObject
@end

__attribute__((used)) NSArray<Class> *ZucksAdNetworkAdMobAdapterClassReferences(void) {
    return @[
        [GADMAdapterZucksAds class],
        [GADMAdapterZucksExtras class],
        [GADMediationAdapterZucks class],
        [GADMediationAdapterZucksBannerAd class],
        [GADMediationAdapterZucksInterstitialAd class],
        [GADMediationAdapterZucksRewardedAd class],
    ];
}
