//
//  HLMBaseViewController.h
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLMNavigatorView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLMBaseViewController : UIViewController

@property (nonatomic, strong) HLMNavigatorView *navigatorView;

- (void)pop;

- (void)close;

@end

NS_ASSUME_NONNULL_END
