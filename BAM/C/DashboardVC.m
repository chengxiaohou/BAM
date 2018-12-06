//
//  DashboardVC.m
//  BAM
//
//  Created by 橙晓侯 on 2018/1/25.
//  Copyright © 2018年 橙晓侯. All rights reserved.
//

#import "DashboardVC.h"

@interface DashboardVC ()

@end

@implementation DashboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}


#pragma mark 配置UI
- (void)configUI
{
    MJWeakSelf
    /** 侧滑 */
    [self cw_registerShowIntractiveWithEdgeGesture:1 direction:CWDrawerTransitionDirectionLeft transitionBlock:^{
        
        [weakSelf onLeft:nil];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLeft:(id)sender {
    
    UIViewController *vc = [Worker MainSB:@"SlideVC"];
    [self cw_showDrawerViewController:vc animationType:0 configuration:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
