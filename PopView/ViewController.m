//
//  ViewController.m
//  PopView
//
//  Created by 耿荣林 on 18/4/4.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "ViewController.h"
#import "define.h"

@interface ViewController ()<SelectIndexDelegate>
@property (weak, nonatomic) IBOutlet UIButton *mybutton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(UIButton *)sender {
    CGPoint point = CGPointMake(_mybutton.center.x, _mybutton.center.y + _mybutton.frame.size.height / 2);
    NSArray *dataArray = @[@"发起群聊",@"添加朋友", @"扫一扫", @"收付款"];
    NSArray *images = @[@"发起群聊",@"添加朋友", @"扫一扫", @"付款"];
    PopMenuView *popView = [[PopMenuView alloc]initWidthOrigin:point withWidth:self.view.bounds.size.width / 4.0 withHeight:44 * dataArray.count withType:GRLTypeOfUpCenter withColor:[UIColor blackColor]];
    popView.dataArr = dataArray;
    popView.imgArr = images;
    popView.row_height = 44;
    popView.fontSize = 14;
    popView.textColor = [UIColor whiteColor];
    popView.delegate = self;
    [popView popView];

}

- (void)selectIndexPathRow:(NSInteger)index{
    if (index == 0) {
        NSLog(@"%ld",index);
    }else if (index == 1){
        NSLog(@"%ld",index);
    }else if (index == 2){
        NSLog(@"%ld",index);
    }else if (index == 3){
        NSLog(@"%ld",index);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
