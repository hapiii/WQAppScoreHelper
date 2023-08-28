//
//  WQAppScoreHelper.m
//  CS_demo
//
//  Created by hapii on 2020/9/4.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "WQAppScoreHelper.h"
#import <StoreKit/StoreKit.h>

///上次打开好评日期
static NSString *const kOpenRatingViewDate = @"kOpenRatingViewDate";
///已经好评
static NSString *const kHasOpenRatingView = @"kHasOpenRatingView";

@implementation WQAppScoreModel

@end

@implementation WQAppScoreHelper

+ (void)gotoStoreScoreWithConfig:(void(^)(WQAppScoreModel *configInfo))configBlock {
    
    WQAppScoreModel *model = [[WQAppScoreModel alloc] init];
    //default config
    model.betweenTime = 7;
    model.alTitle = @"求好评";
    model.alDesc = @"感谢您使用app,跪求五星好评全款付~~";
    model.alSure = @"前往好评";
    model.alCancel = @"残忍拒绝";
    model.vc = [WQAppScoreHelper getCurrentVC];
    ///自定义修改
    configBlock(model);
    
    if ([WQAppScoreHelper showOpenRatingViewAlertWithTime:model.betweenTime]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:model.alTitle message:model.alDesc preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *conform = [UIAlertAction actionWithTitle:model
                                  .alSure style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [WQAppScoreHelper openRatingViewWithAppID:model.appID];
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:model.alCancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alert addAction:conform];
        [alert addAction:cancel];
        
        [model.vc presentViewController:alert animated:YES completion:nil];
        
        return;
    }
}

+ (BOOL)showOpenRatingViewAlertWithTime:(NSInteger)betweenTime{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDate *date = [userDefault objectForKey:kOpenRatingViewDate];
    BOOL hasRate = [userDefault boolForKey:kHasOpenRatingView];
    if (hasRate) {
        return NO;
    }
    if (date != nil) {
        if ([WQAppScoreHelper isEarlierThanNow:date]) {//比现在早
            return [self showWithTime:betweenTime];
        }else {
            return NO;
        }
    }else {
        return [self showWithTime:betweenTime];
    }
}

+ (BOOL)showWithTime:(NSInteger)betweenTime {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:[WQAppScoreHelper dateByAddingDays:betweenTime] forKey:kOpenRatingViewDate];
    [userDefault setBool:YES forKey:kHasOpenRatingView];
    [userDefault synchronize];
    return YES;
}

+ (void)openRatingViewWithAppID:(NSString *)appID {
    
    NSString *nsStringToOpen = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",appID];
    [self.currectKeyWindow endEditing:YES];
    
    if (@available(iOS 10.3, *)) {
        if([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {
            [SKStoreReviewController requestReview];
        }
    } else if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen] options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen]];
    }
    
}

#pragma mark -  date
+ (NSDate *)dateByAddingDays:(NSInteger)days {
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + 86400 * days;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (BOOL) isEarlierThanNow: (NSDate *) aDate {
    return ([aDate compare:[NSDate date]] == NSOrderedAscending);
}


#pragma mark -  获取当前Controller
+ (UIViewController *)getCurrentVC {
    
    UIViewController *rootViewController = self.currectKeyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}

+ (UIWindow *)currectKeyWindow {
    
    UIWindow *keyWindow = nil;
    NSArray  *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow  *window in windows) {
        if (window.isKeyWindow) {
            keyWindow = window;
            break;
        }
    }
    return keyWindow;
}

@end
