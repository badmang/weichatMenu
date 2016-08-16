//
//  MeauView.m
//  PopMeauDemo
//
//  Created by Alvin on 16/8/15.
//  Copyright © 2016年 Alvin. All rights reserved.
//

#import "MeauView.h"
#import "MenuTableViewCell.h"

@interface MeauView() <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableV;

@end
@implementation MeauView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 178)];
    imageV.image = [UIImage imageNamed:@"pop_black_backGround"];
    [self addSubview:imageV];
    
    self.tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 18, 100, 160) style:UITableViewStylePlain];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.rowHeight = 40;
    self.tableV.backgroundColor = [UIColor clearColor];
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [imageV addSubview:self.tableV];
    
    [self.tableV registerClass:[MenuTableViewCell class] forCellReuseIdentifier:@"cell"];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellStr = @"cell";
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
    
}

- (void)showMenuWithAnimation:(BOOL)isCheck{
    [UIView animateWithDuration:0.25 animations:^{
        if (isCheck) {
            self.alpha = 1;
            self.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }else{
            self.alpha = 0;
            self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        }
    } completion:^(BOOL finished) {
        if (!isCheck) {
            [self removeFromSuperview];
        }
    }];
}


@end
