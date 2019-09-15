//
//  HLMBaseViewController.m
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import "HLMBaseViewController.h"

@interface HLMBaseViewController ()

@end

@implementation HLMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navigatorView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)pop {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (void)close {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (HLMNavigatorView *)navigatorView {
    if (_navigatorView == nil) {
        _navigatorView = [HLMNavigatorView defaultView];
        __weak typeof(self) weakSelf = self;
        [_navigatorView addLeftImaged:[UIImage imageNamed:@"nav_back"] action:^(UIButton * _Nonnull sender) {
            [weakSelf pop];
        }];
    }
    return _navigatorView;
}

@end
