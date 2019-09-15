//
//  NavigatorView.h
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigatorMacro.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavigatorView : UIView

@property (nonatomic, strong, readonly) UIView *containerView;
@property (nonatomic, strong) UIView *line;

+ (id)defaultView;

- (BOOL)isDeepColor;


@end

NS_ASSUME_NONNULL_END
