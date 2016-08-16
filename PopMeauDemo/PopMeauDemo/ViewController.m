//
//  ViewController.m
//  PopMeauDemo
//
//  Created by Alvin on 16/8/15.
//  Copyright © 2016年 Alvin. All rights reserved.
//

#import "ViewController.h"
#import "MeauView.h"

@interface ViewController ()
@property(nonatomic, assign) BOOL isCheck;
@property(nonatomic, strong) MeauView *menuV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonAction:)];
    
    self.isCheck = YES;
    
}


- (void)rightBarButtonAction:(id)sender{
    if (self.isCheck) {
        [self.menuV showMenuWithAnimation:YES];
        self.isCheck = NO;
    } else {
        [self.menuV showMenuWithAnimation:NO];
        self.isCheck = YES;
        self.menuV = nil;
        
    }
}

- (MeauView *)menuV {
    if (_menuV == nil) {
        _menuV = [[MeauView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds
                                                            .size.width / 3 * 2, 10, [UIScreen mainScreen].bounds
                                                            .size.width / 3, 200)];
        _menuV.layer.anchorPoint = CGPointMake(0.85, 0);
        _menuV.layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width / 3 * 2 + 90, 54);
        _menuV.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [self.navigationController.view addSubview:_menuV];
    }
    return _menuV;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
