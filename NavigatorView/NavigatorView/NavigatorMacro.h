//
//  HLMNavigatorMacro.h
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#ifndef NavigatorMacro_h
#define NavigatorMacro_h

#define kScreenWidth      CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight     CGRectGetHeight([UIScreen mainScreen].bounds)
/*是否是手机*/
#define kIs_iphone        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/*是否是X系列手机*/
#define kIs_iPhoneX       ((kScreenWidth >=375.0f) && (kScreenHeight >=812.0f) && (kIs_iphone))
/*状态栏高度*/
#define kStatusBarHeight  (CGFloat)(kIs_iPhoneX ? (44.0):(20.0))
/*导航栏高度*/
#define kNavBarHeight     (44)
/*状态栏和导航栏总高度*/
#define kNavHeight        (CGFloat)(kIs_iPhoneX ? (88.0):(64.0))
/*TabBar高度*/
#define kTabBarHeight     (CGFloat)(kIs_iPhoneX ? (49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX ? (44.0):(0))
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX ? (34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight  (CGFloat)(kIs_iPhoneX ? (24.0):(0))
/*导航条和Tabbar总高度*/
#define kNavAndTabHeight  (kNavBarAndStatusBarHeight + kTabBarHeight)
/*屏幕总高度-导航高度-tabbar高度*/
#define kSreenHeight_Nav_Tab (kScreenHeight - kNavAndTabHeight)
/*屏幕总高度-导航高度*/
#define kScreenHeight_Nav (kScreenHeight - kNavHeight)
/*屏幕总高度-tabbar高度*/
#define kScreenHeight_Tab (kScreenHeight - kTabBarHeight)

#import "NavigatorView.h"

#endif /* HLMNavigatorMacro_h */
