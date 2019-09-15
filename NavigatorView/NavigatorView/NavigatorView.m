//
//  NavigatorView.m
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import "NavigatorView.h"

@interface NavigatorView ()

@property (nonatomic, strong, readwrite) UIView *containerView;

@end

@implementation NavigatorView


+ (id)defaultView {
    return [[NavigatorView alloc] init];
}

- (id)init {
    self = [self initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavHeight)];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    frame = CGRectMake(0, 0, kScreenWidth, kNavHeight);
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.containerView];
    }
    return self;
}

+ (id)new {
    return [[NavigatorView alloc] init];
}

- (UIView *)containerView {
    if (_containerView == nil) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, kStatusBarHeight, CGRectGetWidth(self.bounds), kNavBarHeight)];
        _containerView.backgroundColor = [UIColor clearColor];
        
        [_containerView addSubview:({
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, kNavBarHeight - 0.4, CGRectGetWidth(self.bounds), 0.6)];
            line.backgroundColor = [UIColor colorWithWhite:0.75 alpha:1];
            _line = line;
            line;
        })];
    }
    return _containerView;
}



- (BOOL)isDeepColor {
    
    UIColor *color = [self backgroundColor];
    
    if (!color) return NO;
    
    CGFloat R;
    CGFloat G;
    CGFloat B;
    [color getRed:&R green:&G blue:&B alpha:NULL];
    
    NSLog(@"%f  %f  %f",R,G,B);
    
    CGFloat value = (R * 0.299 + G * 0.587 + B * 0.114) * 255;
    
    return value < 192;
}


@end
