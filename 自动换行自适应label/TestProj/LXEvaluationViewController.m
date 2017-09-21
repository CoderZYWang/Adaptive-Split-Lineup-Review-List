////
////  LXEvaluationViewController.m
////  LXYCSJ
////
////  Created by 王中尧 on 2017/9/18.
////  Copyright © 2017年 lexingtianxia. All rights reserved.
////
//
//#import "LXEvaluationViewController.h"
//

//

//
//@interface LXEvaluationViewController ()
//
//@property (nonatomic, strong) NSArray *evaluationTitleArr;
//
//@property (nonatomic, strong) NSMutableArray *titlesWidthArrM;
//
//@property (nonatomic, assign) CGFloat titleViewWidth;
///** 标题间距 */
//@property (nonatomic, assign) CGFloat titleMargin;
///** 字体 */
//@property (nonatomic, strong) UIFont *titleFont;
//
//@end
//
//@implementation LXEvaluationViewController
//
//- (NSMutableArray *)titlesWidthArrM {
//    if (!_titlesWidthArrM) {
//        _titlesWidthArrM = [NSMutableArray array];
//    }
//    return _titlesWidthArrM;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    _titleMargin = 15; // 评价框 和 评价框 之间间距
//    
//    [self setUpNavi];
//    [self setUpUI];
//    
//}
//
//- (void)loadData {
//    _evaluationTitleArr = @[@"附近地点", @"商城", @"快车好司机", @"学校", @"公交站点", @"电影院", @"政府机构以及社会团体"];
//    
//    [self setUpTitleWidth:_evaluationTitleArr titleFont:FONTSYSTEM(14)];
//}
//
///** 计算所有标题宽度 以及 x y */
//- (void)setUpTitleWidth:(NSArray *)titlesArr titleFont:(UIFont *)titleFont {
//
//    // 总长度
//    CGFloat totalWidth = 0;
//    
//    [titlesArr enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
//        CGRect titleBounds = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil];
//        
//        CGFloat width = titleBounds.size.width;
//    }];
//    
//    // 计算所有标题的宽度
//    for (NSString *title in titlesArr) {
//        
//        
//        
//        [self.titlesWidthArrM addObject:@(width)];
//        
//        totalWidth += width;
//    }
//    
//    
//}
//
////关键方法（其实思路理清楚就不难）
//
//- (void)setCellWithArr:(NSArray *)titlesArr titleFont:(UIFont *)titleFont {
//    
//    CGFloat marginH = 15; // 间距 —— 高
//    CGFloat marginW = 15; // 间距 —— 宽
//    
//    __block CGFloat totalWidth = 0; // 总宽
//    __block CGFloat totalHeight = 0; // 总高
//    
//    __block CGFloat beforeTotalWidth = totalWidth;
//    
//    [titlesArr enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
//   
//        CGRect titleBounds = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil];
//        
//        CGFloat width = titleBounds.size.width;
//        CGFloat height = titleBounds.size.height;
//        
//        totalWidth += width;
//        totalHeight += height;
//        
//        if (totalWidth > MS_SCREEN_WIDTH) { //如果宽度超过了屏幕宽 则折行
//            totalWidth = MS_SCREEN_WIDTH;
//            beforeTotalWidth = totalWidth;
//            totalWidth += MS_SCREEN_WIDTH + marginW; // 折行后数据的处理（难点，少了我不少脑细胞）
//            totalHeight += H_distance+autoScaleH(30);
//        }
//        
//        UILabel *textLabl = [[UILabel alloc]initWithFrame:CGRectMake(, sum_h+H_distance,numberOfStr*one_width, autoScaleH(30))];
//        textLabl.textAlignment = NSTextAlignmentCenter;
//        textLabl.layer.cornerRadius = autoScaleH(12);
//        textLabl.layer.masksToBounds = YES;
//        textLabl.layer.borderWidth = 1;
//        textLabl.layer.borderColor =bordercolor.CGColor;
//        textLabl.font = [UIFont systemFontOfSize:autoScaleW(15)];
//        textLabl.text = str;
//        [self addSubview:textLabl];
//        
//    }];
//    
//    sum_h += H_distance+H_distance+autoScaleH(30);
//    
//}
//
//- (void)setUpNavi {
//    self.title = @"我的评价";
//}
//
//- (void)setUpUI {
//    
//}
//
//@end
