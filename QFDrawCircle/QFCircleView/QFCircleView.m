//
//  QFCircleView.m
//  QFDrawCircle
//
//  Created by iosyf-02 on 2018/2/23.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "QFCircleView.h"

@interface QFCircleView ()

@property (nonatomic ,strong) UIBezierPath *bezierPath;

@property (nonatomic ,strong) CAShapeLayer *shapeLayer;

@end

@implementation QFCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initAppearance];
    }
    return self;
}

#pragma mark - initAppearance
- (void)initAppearance {
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 绘制
- (void)drawRect:(CGRect)rect {
    
    //绘制圈
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:self.center radius:100.0f startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    UIColor *color = self.colorArray[self.colorArray.count - 1];
    
    if (self.style == CircleStyleDefault) {
        path.lineWidth = self.lineWidth;
        [color setStroke];
    } else {
        [path addLineToPoint:self.center];
        [path closePath];
        [color setFill];
        [path fill];
    }
    [path stroke];
    
    for (NSInteger idx = 0; idx <= self.pointArray.count - 2; idx++) {
        _bezierPath = [UIBezierPath bezierPath];
        [_bezierPath addArcWithCenter:self.center radius:100.0f startAngle:[self.pointArray[idx] floatValue] endAngle:[self.pointArray[idx + 1] floatValue] clockwise:YES];

        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = self.frame;
        _shapeLayer.position = self.center;
        _shapeLayer.path = _bezierPath.CGPath;
        [self addPathAndShapeLayer:_bezierPath shaperLayer:_shapeLayer color:((UIColor *)self.colorArray[idx])];
        [self.layer addSublayer:_shapeLayer];
    }
}


- (void)addPathAndShapeLayer:(UIBezierPath *)bezierPath shaperLayer:(CAShapeLayer *)shaperLayer color:(UIColor *)color {
    
    switch (self.style) {
        case CircleStyleFill:{
            [bezierPath addLineToPoint:self.center];
            [bezierPath closePath];
            [color setFill];
            [bezierPath fill];
            shaperLayer.fillColor = color.CGColor;
        }
            break;
        case CircleStyleDefault:{
            
            bezierPath.lineWidth = self.lineWidth;
            shaperLayer.lineCap = @"round";
            shaperLayer.fillColor = [UIColor clearColor].CGColor;
            shaperLayer.lineWidth = self.lineWidth;
            shaperLayer.strokeColor = color.CGColor;
        }
            break;
        default:
            break;
    }
    
}

@end
