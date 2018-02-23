//
//  QFCircleView.h
//  QFDrawCircle
//
//  Created by iosyf-02 on 2018/2/23.
//  Copyright © 2018年 情风. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, CircleStyle){
    
    CircleStyleDefault = 0, //默认空心圆
    CircleStyleFill // 实心图
};

@interface QFCircleView : UIView


/**
 类型
 */
@property (nonatomic, assign) CircleStyle style;

/**
 颜色数组
 */
@property (nonatomic ,copy) NSArray *colorArray;


/**
 分割点坐标
 */
@property (nonatomic ,copy) NSArray *pointArray;

/**
 当为空心形状的图形时
 */
@property (nonatomic, assign) CGFloat lineWidth;

@end
