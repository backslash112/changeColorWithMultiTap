//
//  ViewController.m
//  ChangeColorByTap
//
//  Created by YangCun on 15/1/5.
//  Copyright (c) 2015年 backslash112. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [tapRecognizer setNumberOfTapsRequired:3];
    [self.view addGestureRecognizer:tapRecognizer];
}

- (IBAction)tap:(UITapGestureRecognizer*)sender {
    self.view.backgroundColor = [UIColor redColor];
    [self reset];
    return;
}

- (void)reset
{
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.view.backgroundColor =[UIColor whiteColor];
    } completion:^(BOOL finished) {
        
    }];
}

@end
