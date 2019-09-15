//
//  LayoutView.m
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import "LayoutView.h"

@implementation LayoutView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, 0, 43)];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}

+ (id)new {
    return [[self alloc] init];
}

- (void)removeAllSubviews {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        [view removeFromSuperview];
    }];
}

- (void)resetSubviews:(NSArray<UIView *> *)subviews {
    [self removeAllSubviews];
    if (subviews && subviews.count > 0) {
        [subviews enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addSubview:view];
        }];
    }
    [self setNeedsLayout];
}

- (void)addSubviews:(NSArray<UIView *> *)subviews {
    if (subviews && subviews.count > 0) {
        [subviews enumerateObjectsUsingBlock:^(UIView * _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addSubview:view];
        }];
    }
    [self setNeedsLayout];
}

- (void)addSubview:(UIView *)view atIndex:(NSInteger)index {
    [self insertSubview:view atIndex:index];
    [self setNeedsLayout];
}

- (void)removeSubView:(UIView *)view {
    if ([self.subviews containsObject:view]) {
        [view removeFromSuperview];
        [self setNeedsLayout];
    }
}

- (void)removeSubViewAtIndex:(NSInteger)index {
    if (index < self.subviews.count) {
        [[self.subviews objectAtIndex:index] removeFromSuperview];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    UIView *tempView = nil;
    
    for (int i = 0; i < self.subviews.count; i ++) {
        
        UIView *subview = [self.subviews objectAtIndex:i];
        
        if ((subview.alpha < 0.05) || (subview.hidden == YES)) continue;
        
        if (!tempView) {
            CGRect tempRect = subview.frame;
            tempRect.origin.x = 0;
            tempRect.origin.y = (self.frame.size.height - tempRect.size.height)/2.0;
            subview.frame = tempRect;
        }else {
            CGRect tempRect = subview.frame;
            tempRect.origin.x = CGRectGetMaxX(tempView.frame) + self.space;
            tempRect.origin.y = (self.frame.size.height - tempRect.size.height)/2.0;
            subview.frame = tempRect;
        }
        tempView = subview;
    }
    
    CGRect selfRect = self.frame;
    selfRect.size.width = CGRectGetMaxX(tempView.frame);
    self.frame = selfRect;
}

@end
