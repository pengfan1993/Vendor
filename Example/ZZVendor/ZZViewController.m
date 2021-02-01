//
//  ZZViewController.m
//  ZZVendor
//
//  Created by pengfan on 01/08/2021.
//  Copyright (c) 2021 pengfan. All rights reserved.
//

#import "ZZViewController.h"
#import "ZZVendor_Example-Swift.h"
@interface ZZViewController ()

@end

@implementation ZZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [Alamofire requestWithUrl:@"http://www.baidu.com"];
}
@end
