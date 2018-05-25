//
//  PopMenuView.m
//  PopView
//
//  Created by 耿荣林 on 18/4/4.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "PopMenuView.h"
#import "define.h"

@interface PopMenuView() <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGFloat width,height;
@property (nonatomic,assign) GRLDirectionType type;
@property (nonatomic,strong) UITableView *tableView;
@end
@implementation PopMenuView
- (instancetype)initWidthOrigin:(CGPoint)origin withWidth:(CGFloat)width withHeight:(CGFloat)height withType:(GRLDirectionType)type withColor:(UIColor *)color{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        /*箭头位置*/
        self.origin = origin;
        /*视图宽度*/
        self.width = width;
        /*视图高度*/
        self.height = height;
        //类型
        self.type = type;
        //表格视图背景
        self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        self.backGroundView.backgroundColor = color;
        [self addSubview:_backGroundView];
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.backGroundView.bounds.size.width, self.backGroundView.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        [self.backGroundView addSubview:_tableView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (self.type) {
        case GRLTypeOfUpLeft:
        case GRLTypeOfUpRight:
        case GRLTypeOfUpCenter:
        {
            CGFloat startX = self.origin.x;
            CGFloat startY = self.origin.y;
            CGContextMoveToPoint(context, startX, startY);
            CGContextAddLineToPoint(context, startX + LengthOne, startY + LengthOne);
            CGContextAddLineToPoint(context, startX - LengthOne, startY + LengthOne);
        }
            break;
        case GRLTypeOfLeftUp:
        case GRLTypeOfLeftDown:
        case GRLTypeOfLeftCenter:
        {
            CGFloat startX = self.origin.x;
            CGFloat startY = self.origin.y;
            CGContextMoveToPoint(context, startX, startY);
            CGContextAddLineToPoint(context, startX + LengthOne, startY - LengthOne);
            CGContextAddLineToPoint(context, startX + LengthOne, startY + LengthOne);
        }
            break;
        case GRLTypeOfDownLeft:
        case GRLTypeOfDownRight:
        case GRLTypeOfDownCenter:
        {
            CGFloat startX = self.origin.x;
            CGFloat startY = self.origin.y;
            CGContextMoveToPoint(context, startX, startY);
            CGContextAddLineToPoint(context, startX - LengthOne, startY - LengthOne);
            CGContextAddLineToPoint(context, startX + LengthOne, startY - LengthOne);
        }
            break;
        case GRLTypeOfRightUp:
        case GRLTypeOfRightDown:
        case GRLTypeOfRightCenter:
        {
            CGFloat startX = self.origin.x;
            CGFloat startY = self.origin.y;
            CGContextMoveToPoint(context, startX, startY);
            CGContextAddLineToPoint(context, startX - LengthOne, startY - LengthOne);
            CGContextAddLineToPoint(context, startX - LengthOne, startY + LengthOne);
        }
            break;
        default:
            break;
    }
    CGContextClosePath(context);
    [self.backGroundView.backgroundColor setFill];
    [self.backgroundColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)popView{
    NSArray *results = [self.backGroundView subviews];
    for (UIView *view in results) {
        view.hidden = YES;
    }
    UIWindow *windowView = [UIApplication sharedApplication].keyWindow;
    [windowView addSubview:self];
    switch (self.type) {
        case GRLTypeOfUpLeft:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y + LengthOne, 0, 0);
            CGFloat orgin_x = self.origin.x - LengthTow;
            CGFloat orgin_y = self.origin.y + LengthOne;
            CGFloat size_width = self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfUpCenter:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y + LengthOne, 0, 0);
            CGFloat orgin_x = self.origin.x - self.width / 2;
            CGFloat orgin_y = self.origin.y + LengthOne;
            CGFloat size_width = self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfUpRight:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y + LengthOne, 0, 0);
            CGFloat orgin_x = self.origin.x + LengthTow;
            CGFloat orgin_y = self.origin.y + LengthOne;
            CGFloat size_width = -self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfLeftUp:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x + LengthOne, self.origin.y, 0, 0);
            CGFloat orgin_x = self.origin.x + LengthOne;
            CGFloat orgin_y = self.origin.y - LengthTow;
            CGFloat size_width = self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfLeftCenter:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x + LengthOne, self.origin.y, 0, 0);
            CGFloat orgin_x = self.origin.x + LengthOne;
            CGFloat orgin_y = self.origin.y - self.height / 2;
            CGFloat size_width = self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfLeftDown:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x + LengthOne, self.origin.y, 0, 0);
            CGFloat orgin_x = self.origin.x + LengthOne;
            CGFloat orgin_y = self.origin.y - self.height + LengthTow;
            CGFloat size_width = self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfDownLeft:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y - LengthOne, 0, 0);
            CGFloat orgin_x = self.origin.x - LengthTow;
            CGFloat orgin_y = self.origin.y - LengthOne;
            CGFloat size_width = self.width;
            CGFloat size_height = -self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfDownCenter:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y - LengthOne, 0, 0);
            CGFloat orgin_x = self.origin.x - self.width / 2;
            CGFloat orgin_y = self.origin.y - LengthOne;
            CGFloat size_width = self.width;
            CGFloat size_height = -self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfDownRight:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y - LengthOne, 0, 0);
            CGFloat orgin_x = self.origin.x - self.width + LengthTow;
            CGFloat orgin_y = self.origin.y - LengthOne;
            CGFloat size_width = self.width;
            CGFloat size_height = -self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfRightUp:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x - LengthOne, self.origin.y, 0, 0);
            CGFloat orgin_x = self.origin.x - LengthOne;
            CGFloat orgin_y = self.origin.y - LengthTow;
            CGFloat size_width = -self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfRightCenter:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x - LengthOne, self.origin.y, 0, 0);
            CGFloat orgin_x = self.origin.x - LengthOne;
            CGFloat orgin_y = self.origin.y - self.height / 2;
            CGFloat size_width = -self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        case GRLTypeOfRightDown:
        {
            self.backGroundView.frame = CGRectMake(self.origin.x - LengthOne, self.origin.y, 0, 0);
            CGFloat orgin_x = self.origin.x - LengthTow;
            CGFloat orgin_y = self.origin.y + LengthOne;
            CGFloat size_width = -self.width;
            CGFloat size_height = self.height;
            [self startAnimateViewWithX:orgin_x withY:orgin_y withSizeWidth:size_width withSizeHeight:size_height];
        }
            break;
        default:
            break;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![[touches anyObject].view isEqual:self.backGroundView]) {
        [self dismiss];
    }
}

- (void)dismiss
{
    NSArray *results = [self.backGroundView subviews];
    for (UIView *view in results) {
        [view removeFromSuperview];
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.backGroundView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)startAnimateViewWithX:(CGFloat)x withY:(CGFloat)y withSizeWidth:(CGFloat)width withSizeHeight:(CGFloat)height{
    [UIView animateWithDuration:0.2 animations:^{
        self.backGroundView.frame = CGRectMake(x, y, width, height);
    } completion:^(BOOL finished) {
        NSArray *results = [self.backGroundView subviews];
        for (UIView *view in results) {
            [view setHidden:NO];
        }
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.row_height == 0) {
        return 44;
    }else{
        return self.row_height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"popCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:[self.imgArr objectAtIndex:indexPath.row]];
    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:self.fontSize];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = self.textColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexPathRow:)]) {
        [self.delegate selectIndexPathRow:indexPath.row];
    }
}

@end
