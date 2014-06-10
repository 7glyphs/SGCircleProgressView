//
//  SGCircleProgressView.m
//  7 glyphs Ltd.
//  http://7glyphs.com
//
//  Created by Igor Anany on 27/04/13.
//  Copyright (c) 2014 7 glyphs Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SGCircleProgressViewType) {
    SGCircleProgressViewTypePieFill,
    SGCircleProgressViewTypeRingFill
};

@interface SGCircleProgressView : UIView

@property (nonatomic, assign) CGFloat max;
@property (nonatomic, assign) CGFloat current;
@property (nonatomic, strong) UIColor * strokeColor;
@property (nonatomic, strong) UIColor * fillColor;
@property (nonatomic, assign) CGFloat lineWidth;

- (instancetype)initWithFrame:(CGRect)frame type:(SGCircleProgressViewType)type;

@end
