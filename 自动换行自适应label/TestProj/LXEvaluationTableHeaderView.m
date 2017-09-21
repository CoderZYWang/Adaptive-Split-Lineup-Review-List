//
//  LXEvaluationTableHeaderView.m
//  TestProj
//
//  Created by 王中尧 on 2017/9/18.
//  Copyright © 2017年 lexingtianxia. All rights reserved.
//

#import "LXEvaluationTableHeaderView.h"

// 屏幕宽高
#define MS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define MS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@implementation LXEvaluationTableHeaderView

- (instancetype)evaluationTableHeaderView {
    LXEvaluationTableHeaderView *headView = [[LXEvaluationTableHeaderView alloc] init];
    
    CGFloat starX;
    CGFloat starW = 36;
    CGFloat middleMargin = ((MS_SCREEN_WIDTH - 40 * 2) - starW * 5) * 0.25;
    for (int i = 0; i < 5; i ++) {
        if (i == 0) {
            starX = 40;
        } else {
            starX = 40 + starW + i * middleMargin;
        }
        UIImageView *startImageView = [[UIImageView alloc] initWithFrame:CGRectMake(starX, 15, starW, starW)];
        
    }
    
    return headView;
}

@end
