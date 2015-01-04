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
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doSingleTap:)];
    [singleTapRecognizer setNumberOfTapsRequired:1];
    [self.view addGestureRecognizer:singleTapRecognizer];
    
    UITapGestureRecognizer *multiTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doMultiTap:)];
    [multiTapRecognizer setNumberOfTapsRequired:3];
    [self.view addGestureRecognizer:multiTapRecognizer];
    
    [singleTapRecognizer requireGestureRecognizerToFail:multiTapRecognizer];
}

- (void)doSingleTap:(UITapGestureRecognizer*)recognizer
{
    self.label.text = @"Single Tap, now Multi Tap the screen";
}

- (void)doMultiTap:(UITapGestureRecognizer*)recognizer
{
    self.label.text = @"3 Times";
    self.view.backgroundColor = [UIColor redColor];
    [self reset];
    return;
}

- (void)reset
{
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.view.backgroundColor =[UIColor whiteColor];
    } completion:^(BOOL finished) {
        self.label.text = @"Tap the Screen";
    }];
}

@end
