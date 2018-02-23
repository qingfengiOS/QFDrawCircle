//
//  ViewController.m
//  QFDrawCircle
//
//  Created by iosyf-02 on 2018/2/23.
//  Copyright © 2018年 情风. All rights reserved.
//

#import "ViewController.h"
#import "QFCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QFCircleView *circleView = [[QFCircleView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:circleView];
    
    //设置开始点的位置
    circleView.pointArray = @[@0,@(M_PI / 2),@(M_PI),@(M_PI*3/2)];
    
    //设置开始点和结束点的颜色
    circleView.colorArray = @[[UIColor redColor],[UIColor yellowColor],[UIColor greenColor],[UIColor blueColor]];
    //设置类型
    circleView.style = CircleStyleFill;
    //设置线宽
    circleView.lineWidth = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
