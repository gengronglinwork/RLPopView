//
//  PopMenuView.h
//  PopView
//
//  Created by 耿荣林 on 18/4/4.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,GRLDirectionType)
{
    GRLTypeOfUpLeft,     // 上左
    GRLTypeOfUpCenter,   // 上中
    GRLTypeOfUpRight,    // 上右
    
    GRLTypeOfDownLeft,   // 下左
    GRLTypeOfDownCenter, // 下中
    GRLTypeOfDownRight,  // 下右
    
    GRLTypeOfLeftUp,     // 左上
    GRLTypeOfLeftCenter, // 左中
    GRLTypeOfLeftDown,   // 左下
    
    GRLTypeOfRightUp,    // 右上
    GRLTypeOfRightCenter,// 右中
    GRLTypeOfRightDown,  // 右下
};

@protocol SelectIndexDelegate <NSObject>

- (void)selectIndexPathRow:(NSInteger)index;

@end

@interface PopMenuView : UIView

@property (nonatomic,weak) id<SelectIndexDelegate> delegate;
/*字体大小*/
@property (nonatomic,assign) CGFloat fontSize;
/*列表行高*/
@property (nonatomic,assign) NSInteger row_height;
/*文字数字*/
@property (nonatomic,strong) NSArray *dataArr;
/*图片数组*/
@property (nonatomic,strong) NSArray *imgArr;
/*文字颜色*/
@property (nonatomic,strong) UIColor *textColor;
/*背景视图*/
@property (nonatomic,strong) UIView *backGroundView;

- (void)popView;

- (instancetype)initWidthOrigin:(CGPoint)origin withWidth:(CGFloat)width withHeight:(CGFloat)height withType:(GRLDirectionType)type withColor:(UIColor *)color;


@end
