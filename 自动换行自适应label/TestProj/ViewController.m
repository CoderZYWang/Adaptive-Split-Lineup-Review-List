//
//  ViewController.m
//  TestProj
//
//  Created by 王中尧 on 2017/9/18.
//  Copyright © 2017年 lexingtianxia. All rights reserved.
//

#import "ViewController.h"

#import "UIView+Frame.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_9_0
#define FONTSYSTEM(s) [UIFont fontWithName:@"PingFang SC" size:s]
#else
#define FONTSYSTEM(s) [UIFont fontWithName:@"Heiti SC" size:s]
#endif

#define MS_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define MS_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define HEXCOLOR(hex, a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:a]

/** callback height */
typedef void (^RequestDataHeightBlock)(double height);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [self setCellWithArr:@[@"无知",@"风云变幻",@"施耐庵",@"唉哈哈哈",@"西门吹雪",@"呵呵哒",@"快看看",@"窿窿啦啦",@"一杆禽兽狙",@"合欢花",@"暴走大事件",@"非诚勿扰",@"呵呵呵"] titleFont:FONTSYSTEM(15) borderColor:HEXCOLOR(0xD2D2D2, 1) requestDataBlock:^(double height) {
        
        
        // 可以拿到整个结果的行高，下面的视图帮助大家观察
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MS_SCREEN_WIDTH, height)];
        view.backgroundColor = [UIColor blueColor];
        view.alpha = 0.3;
        [weakSelf.view addSubview:view];
    }];
}

- (void)setCellWithArr:(NSArray *)titlesArr titleFont:(UIFont *)titleFont borderColor:(UIColor *)borderColor requestDataBlock:(RequestDataHeightBlock)requestDataBlock {
    CGFloat firstLabelTopMargin = 50; // 第一行 label 边框 与屏幕上侧的 margin
    CGFloat lastLabelBottomMargin = 50; // 最后一行 label 边框 与屏幕下侧的 margin
    
    CGFloat labelBorderMarginV = 5; // label 边框 与 当前 label 文本之间 上下间距
    CGFloat labelBorderMarginH = 10; // label 边框 与 当前 label 文本之间 左右间距
    
    CGFloat borderToBorderMarginV = 15; // label 边框 与 另一个 label 边框 上下间距
    CGFloat borderToBorderMarginH = 15; // 边框与边框左右间距
    
    CGFloat lastMaxX = borderToBorderMarginH; // 保存前一个 label 的最大 x (第一个 label.x 应是 borderToBorderMarginH)
    
    CGFloat maxHeight = 0; // 记录返回的高度
    
    for (int i = 0; i < titlesArr.count; i++) {
    
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.layer.borderWidth = 1;
        label.layer.borderColor = borderColor.CGColor;
        label.font = titleFont;
        label.text = titlesArr[i];
        
        // 根据计算文字的大小
        CGRect labelFrame = [titlesArr[i] boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil];
        
        CGFloat textWidth = labelFrame.size.width;
        CGFloat textHeight = labelFrame.size.height;

        // 设置textWidth的frame
        label.frame = CGRectMake(lastMaxX, firstLabelTopMargin, textWidth + labelBorderMarginH * 2, textHeight + labelBorderMarginV * 2);
        label.layer.cornerRadius = label.frame.size.height * 0.5;
        label.layer.masksToBounds = YES;
        
        // 当下一个 label 摆放会超出屏幕边缘时换行（这里实际上指父视图的宽度）
        // 该判断意为 前一个 label 的最大 x 值 + 横向 label margin + 当前 label 宽度 + 距离右侧横向 margin
        if (lastMaxX + borderToBorderMarginH + textWidth + borderToBorderMarginH > MS_SCREEN_WIDTH) {
            lastMaxX = borderToBorderMarginH; // 换行时将 lastMaxX 置为 0
            firstLabelTopMargin = firstLabelTopMargin + label.frame.size.height + borderToBorderMarginV; // 距离父视图也变化
            label.frame = CGRectMake(lastMaxX, firstLabelTopMargin, textWidth + labelBorderMarginH * 2, textHeight + labelBorderMarginV * 2); // 重设 label 的 frame
        }
        
        lastMaxX = label.width + label.x + borderToBorderMarginH;
        [self.view addSubview:label];
        
        if (i == titlesArr.count - 1) {
            maxHeight = CGRectGetMaxY(label.frame) + lastLabelBottomMargin;
        }
    }
    
    requestDataBlock(maxHeight);
    
    NSLog(@"maxHeight --- %.2f", maxHeight);
}

@end
