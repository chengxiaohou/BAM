//
//  TVCell.m
//  TianZiCai
//
//  Created by 橙晓侯 on 2017/1/22.
//  Copyright © 2017年 橙晓侯. All rights reserved.
//

#import "TVCell.h"

@implementation TVCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // drawRect完成后能获取到实际的frame以及cell的tableView，此时是布局的唯一时机
}

- (void)setCellInfo:(id)info
{
    self.info = info;
    [self ee_layoutSubviews];
//    [self performSelector:@selector(ee_layoutSubviews) withObject:nil afterDelay:CGFLOAT_MIN];
}

- (void)ee_layoutSubviews
{
    
}


- (void)safariViewControllerDidFinish:(nonnull SFSafariViewController *)controller
{
    [controller.navigationController popViewControllerAnimated:1];
}

@end
