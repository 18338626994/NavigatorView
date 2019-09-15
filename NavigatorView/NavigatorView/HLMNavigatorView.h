//
//  HLMNavigatorView.h
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import "NavigatorView.h"
#import "LayoutView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HLMNavigatorView : NavigatorView


@property (nonatomic, copy, readonly) NSArray *leftItems; // left button items
@property (nonatomic, copy, readonly) NSArray *rightItems;// right button items

//@property (nonatomic, assign) BOOL     showSecondaryText;
@property (nonatomic, strong) UIView   *titleView; // default UILabel(titleLabel)

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, strong) UIColor  *titleColor;
@property (nonatomic, strong) UIFont   *titleFont;
@property (nonatomic, strong) UIFont   *subTextFont;
@property (nonatomic, strong) UILabel  *titleLabel;
@property (nonatomic, strong) UIColor  *tintColor;

// leftItems and rightItems layout based on UIStackView, support version iOS9.0 later \
if leftItems or rightItems nill, will remove all items

- (void)setLeftItems:(nullable NSArray<UIButton *> *)items;
- (void)setRightItems:(nullable NSArray<UIButton *> *)items;

// add a button(nonull) in the last index of leftItems;
- (void)addLeftItem:(nonnull UIButton *)button;
- (void)addRightItem:(nonnull UIButton *)button;

// insert a button(nonull) in the index of rightItems;
- (void)insertLeftItem:(nonnull UIButton *)button atIndex:(NSUInteger)index;
- (void)insertRightItem:(nonnull UIButton *)button atIndex:(NSUInteger)index;

// conveniently add a button with title/image and action callback in the last of array;
- (void)addLeftTitled:(nonnull NSString *)title action:(void(^)(UIButton *))handler;
- (void)addRightTitled:(nonnull NSString *)title action:(void(^)(UIButton *))handler;

- (void)addLeftImaged:(nonnull UIImage *)image action:(void(^)(UIButton *))handler;
- (void)addRightImaged:(nonnull UIImage *)image action:(void(^)(UIButton *))handler;

// remove left or right items;
- (void)removeLeftItem:(UIView *)view;
- (void)removeLeftItemAtIndex:(NSInteger)index;

- (void)removeRightItem:(UIView *)view;
- (void)removeRightItemAtIndex:(NSInteger)index;

- (void)clearLeftItems;
- (void)clearRightItems;

@end

#pragma mark - gradient change config

@interface HLMNavigatorView (Gradient)

@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;

@property (nonatomic, assign) CGFloat gradientThreshold; // 渐变阀值
@property (nonatomic, weak)   UIScrollView *scrollView;

@property (nonatomic, copy)   void(^gradientLight)(id sender);
@property (nonatomic, copy)   void(^gradientDeep)(id sender);


@end

typedef void(^clickHandler)(UIButton *);

@interface UIButton (Handler)

@property (nonatomic, copy) clickHandler handler;

@end

NS_ASSUME_NONNULL_END
