//
//  ViewController.m
//  ChangeColorByTap
//
//  Created by YangCun on 15/1/5.
//  Copyright (c) 2015年 backslash112. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSDate *preTapDate;
    NSDate *currentTapDate;
    NSInteger tappedTimes;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [tapRecognizer setNumberOfTapsRequired:3];
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UITapGestureRecognizer*)sender {
    self.view.backgroundColor = [UIColor redColor];
    [self reset];
    return;
    currentTapDate = [NSDate new];
    NSInteger second = [self getSecondWithFistTapDate:preTapDate andSecondTapDate:currentTapDate];
    BOOL isMultiTap = [self isMultiTap:second];
    if (isMultiTap) {
        tappedTimes++;
        if (tappedTimes >= 3) {
            self.view.backgroundColor = [UIColor redColor];
            tappedTimes = 0;
            [self reset];
        }
    } else {
        tappedTimes = 0;
    }
    preTapDate = currentTapDate;
}

// 两次点击时间差在2秒之内即是有效的连续点击
- (BOOL)isMultiTap:(NSInteger) second {
    if (second <= 2 && second >= 0) {
        return YES;
    }
    return NO;
}

// 根据两个date获取时间差
// return: second
- (NSInteger)getSecondWithFistTapDate:(NSDate*)firstDate andSecondTapDate:(NSDate*) secondDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componets = [calendar components:NSCalendarUnitSecond fromDate:firstDate toDate:secondDate options:0];
    return componets.second;
}

- (void)reset
{
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.view.backgroundColor =[UIColor whiteColor];
    } completion:^(BOOL finished) {
        
    }];
}

@end
