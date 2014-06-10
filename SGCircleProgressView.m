//
//  SGCircleProgressView.m
//  7 glyphs Ltd.
//  http://7glyphs.com
//
//  Created by Igor Anany on 27/04/13.
//  Copyright (c) 2014 7 glyphs Ltd. All rights reserved.
//

#import "SGCircleProgressView.h"

@interface SGCircleProgressView () {
    SGCircleProgressViewType _type;
    UIView *_circleView;
    CAShapeLayer *_shapeLayer;
}

@property (nonatomic, assign, readonly) CGFloat progress;

- (void)redraw;

@end

@implementation SGCircleProgressView

- (instancetype)initWithFrame:(CGRect)frame type:(SGCircleProgressViewType)type {
    self = [super initWithFrame:frame];
    if (self) {
        _type = type;
        _circleView = [[UIView alloc] initWithFrame:self.bounds];
        [_circleView setBackgroundColor:[UIColor clearColor]];
        [_circleView.layer setCornerRadius:self.width/2];
        [self addSubview:_circleView];
        
        _shapeLayer = [[CAShapeLayer alloc] init];
        [_shapeLayer setFrame:_circleView.bounds];
        if (type == SGCircleProgressViewTypeRingFill) {
            [_shapeLayer setFillColor:nil];
            [self setStrokeColor:[UIColor whiteColor]];
            [self setLineWidth:2.0];
        }
        else {
            [_shapeLayer setFillColor:[UIColor whiteColor].CGColor];
            [self setStrokeColor:[UIColor whiteColor]];
            [self setLineWidth:2.0];
        }
        [_circleView.layer addSublayer:_shapeLayer];

    }
    return self;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    if(_type == SGCircleProgressViewTypeRingFill) {
        _strokeColor = strokeColor;
        [_shapeLayer setStrokeColor:strokeColor.CGColor];
    }
    else {
        [_circleView.layer setBorderColor:strokeColor.CGColor];
    }
}

- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
}

- (void)setLineWidth:(CGFloat)lineWidth {
    if(_type == SGCircleProgressViewTypeRingFill) {
        _lineWidth = lineWidth;
        _shapeLayer.lineWidth = lineWidth;
        _shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(_circleView.bounds), CGRectGetMidY(_circleView.bounds)) radius:_circleView.bounds.size.width/2 + lineWidth/2 startAngle:3*M_PI_2 endAngle:3*M_PI_2 + 2*M_PI clockwise:YES].CGPath;
    }
    else {
        [_circleView.layer setBorderWidth:lineWidth];
    }
}

- (CGFloat)progress {
    return _max !=0 ? _current/_max : 0;
}

- (void)setCurrent:(CGFloat)current {
    _current = current;
    [self redraw];
}

- (void)redraw {
    if (_type == SGCircleProgressViewTypeRingFill) {
        _shapeLayer.strokeEnd = self.progress;
    }
    else {
        CGPoint center = CGPointMake(CGRectGetMidX(_circleView.bounds), CGRectGetMidY(_circleView.bounds));
        CGFloat radius = self.width/2;
        UIBezierPath *piePath = [UIBezierPath bezierPath];
        [piePath moveToPoint:center];
        [piePath addArcWithCenter:center radius:radius startAngle:3.0f * M_PI_2 endAngle:((self.progress * 2.0f * M_PI) - M_PI_2) clockwise:YES];
        [piePath closePath];
        _shapeLayer.path = piePath.CGPath;
    }
}

@end
