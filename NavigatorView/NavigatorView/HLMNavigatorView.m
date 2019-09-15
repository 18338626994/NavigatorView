//
//  HLMNavigatorView.m
//  UIStackView-Demo
//
//  Created by 于云飞 on 2019/9/15.
//  Copyright © 2019 PnR. All rights reserved.
//

#import "HLMNavigatorView.h"
#import <objc/runtime.h>

static void *kNavibarBackgroundColorContext;
static void *kNavibarAlphaContext;
static void *kNavibarObservedScrollOffsetContext;

@interface HLMNavigatorView ()

@property (nonatomic, strong) LayoutView *leftStackView;
@property (nonatomic, strong) LayoutView *rightStackView;

@end

@implementation HLMNavigatorView

+ (id)defaultView {
    return [[HLMNavigatorView alloc] init];
}

- (id)init {
    self = [super init];
    if (self) {
        [self.containerView addSubview:self.leftStackView];
        [self.containerView addSubview:self.rightStackView];
    }
    return self;
}

#pragma mark - LayoutSubviews

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGSize containerSize = self.containerView.frame.size;
    
    // titleView layout
    if ([self.titleView superview]) {
        self.titleView.center = CGPointMake(containerSize.width/2.0, containerSize.height/2.0);
        if ([self.titleView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.titleView;
            CGSize titleSize = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 24) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:NULL].size;
            float maxWidth = MIN(titleSize.width + 10, kScreenWidth*0.75);
            label.bounds = CGRectMake(0, 0, maxWidth, 24);
        }
    }
    
    
    // leftItems layout
    
    CGRect leftStackRect = self.leftStackView.frame;
    
    leftStackRect.origin.x = self.leftStackView.marginLeft;
    leftStackRect.origin.y = ((containerSize.height) - (self.leftStackView.frame.size.height))/2.0;
    
    self.leftStackView.frame = leftStackRect;
    
    // rightItems layout
    
    CGRect rightStackRect = self.rightStackView.frame;
    
    rightStackRect.origin.x = containerSize.width - (self.rightStackView.marginRight + self.rightStackView.frame.size.width);
    rightStackRect.origin.y = ((containerSize.height) - (self.rightStackView.frame.size.height))/2.0;
    
    self.rightStackView.frame = rightStackRect;
}

#pragma mark - NavigatiorItemConfig

- (void)setTitle:(NSString *)title {
    _title = title;
    if (!self.titleView) {
        self.titleLabel.text = title;
        [self.containerView addSubview:self.titleLabel];
        [self.containerView setNeedsLayout];
    }else {
        if (![self.titleView isKindOfClass:[UILabel class]]) {
            NSLog(@"you had already set titleView(%@),can't be set title",[self.titleView class]);
        }else {
            UILabel *label = (UILabel *)_titleView;
            label.text = title;
            
            if (![label superview]) { [self.containerView addSubview:label]; }
            
            [self setNeedsLayout];
        }
    }
}

- (void)setLeftItems:(nullable NSArray<UIButton *> *)items {
    [self.leftStackView resetSubviews:items];
    [self setNeedsLayout];
}

- (void)setRightItems:(nullable NSArray<UIButton *> *)items {
    [self.rightStackView resetSubviews:items];
    [self setNeedsLayout];
}

- (void)addLeftItem:(nonnull UIButton *)button {
    [self.leftStackView addSubview:button];
    [self setNeedsLayout];
}

- (void)addRightItem:(nonnull UIButton *)button {
    [self.rightStackView addSubview:button];
    [self setNeedsLayout];
}

- (void)insertLeftItem:(nonnull UIButton *)button atIndex:(NSUInteger)index {
    [self.leftStackView addSubview:button atIndex:index];
    [self setNeedsLayout];
}

- (void)insertRightItem:(nonnull UIButton *)button atIndex:(NSUInteger)index {
    [self.rightStackView addSubview:button atIndex:index];
    [self setNeedsLayout];
}

- (void)addLeftTitled:(nonnull NSString *)title action:(void(^)(UIButton *))handler {
    UIButton *titleBtn = [self buttonWithTitle:title action:handler];
    if (titleBtn) {
        [_leftStackView addSubview:titleBtn];
        [self setNeedsLayout];
    }else {
        NSLog(@"** [%@ class] please title value **",NSStringFromClass([self class]));
    }
}

- (void)addRightTitled:(nonnull NSString *)title action:(void(^)(UIButton *))handler {
    UIButton *titleBtn = [self buttonWithTitle:title action:handler];
    if (titleBtn) {
        [_rightStackView addSubview:titleBtn];
        [self setNeedsLayout];
    }else {
        NSLog(@"** [%@ class] please title value **",NSStringFromClass([self class]));
    }
}

- (void)addLeftImaged:(nonnull UIImage *)image action:(void(^)(UIButton *))handler {
    UIButton *imageBtn = [self buttonWithImage:image action:handler];
    if (imageBtn) {
        [_leftStackView addSubview:imageBtn];
        [self setNeedsLayout];
    }else {
        NSLog(@"** [%@ class] please image value **",NSStringFromClass([self class]));
    }
}

- (void)addRightImaged:(nonnull UIImage *)image action:(void(^)(UIButton *))handler {
    UIButton *imageBtn = [self buttonWithImage:image action:handler];
    if (imageBtn) {
        [_rightStackView addSubview:imageBtn];
        [self setNeedsLayout];
    }else {
        NSLog(@"** [%@ class] please image value **",NSStringFromClass([self class]));
    }
}

- (void)removeLeftItem:(UIView *)view {
    [self.leftStackView removeSubView:view];
}

- (void)removeLeftItemAtIndex:(NSInteger)index {
    [self.leftStackView removeSubViewAtIndex:index];
}

- (void)removeRightItem:(UIView *)view  {
    [self.rightStackView removeSubView:view];
}

- (void)removeRightItemAtIndex:(NSInteger)index {
    [self.rightStackView removeSubViewAtIndex:index];
}

- (void)clearLeftItems {
    [self.leftStackView removeAllSubviews];
}

- (void)clearRightItems {
    [self.rightStackView removeAllSubviews];
}
#pragma mark - Get



- (NSArray *)leftItems {
    return self.leftStackView.subviews;
}

- (NSArray *)rightItems {
    return self.rightStackView.subviews;
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = self.titleLabel;
    }
    return _titleView;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(0, 0, 200, 24);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.8];
        _titleLabel.textColor = self.titleColor ? : [UIColor colorWithWhite:0.20 alpha:1];
        _titleLabel.font = self.titleFont ? : [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

- (LayoutView *)leftStackView {
    if (!_leftStackView) {
        _leftStackView = [[LayoutView alloc] init];
        _leftStackView.space = 10;
        _leftStackView.marginLeft = 10;
        _leftStackView.aligment = AligmentTypeLeft;
    }
    return _leftStackView;
}

- (LayoutView *)rightStackView {
    if (!_rightStackView) {
        _rightStackView = [[LayoutView alloc] init];
        _rightStackView.space = 10;
        _rightStackView.marginRight = 10;
        _rightStackView.aligment = AligmentTypeRight;
    }
    return _rightStackView;
}

#pragma mark - Private methods

- (CGSize)sizeWithText:(NSString *)text font:(nonnull UIFont *)font maxSize:(CGSize)size {
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (UIButton *)buttonWithTitle:(NSString *)title action:(void(^)(UIButton *))handler {
    
    if ((!title)||(![title isKindOfClass:[NSString class]])||([title length] == 0)) return nil;
    
    UIColor *color = _tintColor ? :[UIColor colorWithWhite:0.6 alpha:1];
    UIFont *font = _subTextFont ? :[UIFont systemFontOfSize:14];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    [button setHandler:handler];
    
    CGSize size = [self sizeWithText:title font:font maxSize:CGSizeMake(MAXFLOAT, 30)];
    button.frame = CGRectMake(0, 0, floorf(size.width) + 4, 24);
    
    return button;
}

- (UIButton *)buttonWithImage:(UIImage *)image action:(void(^)(UIButton *))handler {
    
    if (!image || ![image isKindOfClass:[UIImage class]]) return nil;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor whiteColor];
    [button setImage:image forState:UIControlStateNormal];
    [button setHandler:handler];
    
    CGSize size = image.size;
    button.bounds = CGRectMake(0, 0, size.width + 4, 24);
    
    return button;
}

@end



@implementation UIButton (Handler)

void *kCatogeryHandlerKey;

- (void)setHandler:(clickHandler)handler {
    objc_setAssociatedObject(self, kCatogeryHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self removeTarget:self action:@selector(handler_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    if (handler) {
        [self addTarget:self action:@selector(handler_buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (clickHandler)handler {
    return objc_getAssociatedObject(self, kCatogeryHandlerKey);
}

- (void)handler_buttonClick:(UIButton *)sender {
    if (self.handler) {
        self.handler(sender);
    }
}

@end
