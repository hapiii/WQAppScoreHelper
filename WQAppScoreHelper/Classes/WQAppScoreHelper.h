//
//  WQAppScoreHelper.h
//  CS_demo
//
//  Created by hapii on 2020/9/4.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface WQAppScoreModel : NSObject
///要评价的appID 必填选项
@property (nonatomic, copy) NSString *appID;
///Alert从vc弹出
@property (nonatomic, weak) UIViewController *vc;
///弹窗间隔时间,默认7天
@property (nonatomic, assign) NSInteger betweenTime;
///弹窗title
@property (nonatomic, copy) NSString *alTitle;
///弹窗描述
@property (nonatomic, copy) NSString *alDesc;
///弹窗确认文案
@property (nonatomic, copy) NSString *alSure;
///弹窗取消文案
@property (nonatomic, copy) NSString *alCancel;

@end

@interface WQAppScoreHelper : NSObject
///appStore评分
+ (void)gotoStoreScoreWithConfig:(void(^)(WQAppScoreModel *configInfo))configBlock;
///获取当前ViewController
+ (UIViewController *)getCurrentVC;

@end

NS_ASSUME_NONNULL_END
