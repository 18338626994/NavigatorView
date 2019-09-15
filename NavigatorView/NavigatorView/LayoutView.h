//
//  LayoutView.h
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,AligmentType) {
    AligmentTypeLeft,
    AligmentTypeRight,
    AligmentTypeCenter,
};

@interface LayoutView : UIView

@property (nonatomic, assign) CGFloat marginLeft;
@property (nonatomic, assign) CGFloat marginRight;
@property (nonatomic, assign) CGFloat space;
@property (nonatomic, assign) AligmentType aligment;

- (void)resetSubviews:(NSArray <UIView *>*)subviews;

- (void)addSubviews:(NSArray <UIView *>*)subviews;
- (void)addSubview:(UIView *)view atIndex:(NSInteger)index;

- (void)removeSubView:(UIView *)view;
- (void)removeSubViewAtIndex:(NSInteger)index;

- (void)removeAllSubviews;

@end

NS_ASSUME_NONNULL_END
