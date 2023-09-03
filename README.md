# WQAppScoreHelper

[![CI Status](https://img.shields.io/travis/hapiii/WQAppScoreHelper.svg?style=flat)](https://travis-ci.org/hapiii/WQAppScoreHelper)
[![Version](https://img.shields.io/cocoapods/v/WQAppScoreHelper.svg?style=flat)](https://cocoapods.org/pods/WQAppScoreHelper)
[![License](https://img.shields.io/cocoapods/l/WQAppScoreHelper.svg?style=flat)](https://cocoapods.org/pods/WQAppScoreHelper)
[![Platform](https://img.shields.io/cocoapods/p/WQAppScoreHelper.svg?style=flat)](https://cocoapods.org/pods/WQAppScoreHelper)

## desc
WQAppScoreHelper封装了前往appStore用户打分的功能
在appStore里，app评分作为吸引用户的一个指标具有非常重要的作用。但是部分产品和开发都并不看重这个功能，其实提高评分的手段有很多，而弹窗邀请则是非常简单高效的一种方法。
只需要简单的几句代码，放在适合的位置，就能带来持续的收益。
比如教育类app将弹窗放到视频课程播放结束，七天弹一次，配上优秀的文案(比如:老师讲课幸苦了,给个好评支持一下吧!)只要app不是太烂,基本上都是5星好评.app用户越多,5星越多。
亲测1年内将app评分从3.2 拉到4.8

## useage
appID为必选参数,在合适的地方调用代码就可以
OC：
```
[WQAppScoreHelper gotoStoreScoreWithConfig:^(WQAppScoreModel * _Nonnull configInfo) {
     configInfo.appID = @"";
}];
```

swift：
```
WQAppScoreHelper.gotoStoreScore { (config) in
            config.appID = App.SDK.appleAppID
            config.alDesc = "老师讲课辛苦啦,给个好评鼓励一下~~"
        }
```
也可以自定义弹窗或者规则，在需要弹的时候调用
```
openRatingViewWithAppID
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

WQAppScoreHelper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WQAppScoreHelper'
```

## Author

hapiii, 869932084@qq.com

## License

WQAppScoreHelper is available under the MIT license. See the LICENSE file for more info.
