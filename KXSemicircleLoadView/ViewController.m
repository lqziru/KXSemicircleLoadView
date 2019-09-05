//
//  ViewController.m
//  KXSemicircleLoadView
//
//  Created by ldhonline on 2019/9/6.
//  Copyright © 2019 com.aidoutu.kit. All rights reserved.
//

#import "ViewController.h"
#import "KXSemicircleLoadView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    KXSemicircleLoadView *loader;
    UIButton *btn;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    loader = [[KXSemicircleLoadView alloc] initWithFrame:CGRectMake(50, 100, 40, 40)];
    loader.color = [UIColor redColor];
    
    [self.view addSubview: loader];
    
    [loader start];
    
    loader = [[KXSemicircleLoadView alloc] initWithFrame:CGRectMake(100, 100, 20, 20)];
    loader.color = [UIColor grayColor];
    
    [self.view addSubview: loader];
    
    [loader start];
    
    loader = [[KXSemicircleLoadView alloc] initWithFrame:CGRectMake(130, 100, 70, 70)];
    loader.color = [UIColor blueColor];
    loader.lineWidth = 10;
    
    [self.view addSubview: loader];
    
    [loader start];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(120, 200, 100, 44)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"stop" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
}

- (void)stop
{
    static BOOL toggle;
    toggle = !toggle;
    [btn setTitle:(toggle?@"start":@"stop") forState:UIControlStateNormal];
    if (toggle) {
        [loader stop];
    } else {
        [loader start];
    }
    
}


@end
