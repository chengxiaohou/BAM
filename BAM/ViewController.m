//
//  ViewController.m
//  BAM
//
//  Created by 橙晓侯 on 2017/12/14.
//  Copyright © 2017年 橙晓侯. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()
@property (weak, nonatomic) IBOutlet EEButton *test;
@property (weak, nonatomic) IBOutlet EEButton *test1;
@property (weak, nonatomic) IBOutlet EETextField *tf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.isSecondAppear) {
        
    }
    [super viewWillAppear:animated];
    

//    NET.session.securityPolicy.allowInvalidCertificates = YES;
//    NET.session.securityPolicy.validatesDomainName = NO;
//    NET.session.responseSerializer = [AFXMLParserResponseSerializer serializer];
//    [NET.session.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/rss+xml", nil]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSData *rssData;
- (IBAction)ontest:(id)sender {
//    @"http://www.zhihu.com/rss"
    
    NSString *url = @"http://www.zhihu.com/rss";
    
    [MBProgressHUD showHUDAddedTo:Window animated:YES]; // 动画开始
    // 下载rss原始Data
    if (!rssData) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            rssData = [IDNFeedParser dataFromUrl:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [MBProgressHUD hideHUDForView:Window animated:YES];// 动画隐藏
            });
        });
    }
    else
    {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            
            // 获取RSS源信息
            IDNFeedInfo* info = [IDNFeedParser feedInfoWithData:rssData fromUrl:url];
//            IDNFeedInfo* info = [IDNFeedParser feedInfoWithUrl:url];
            NSLog(@"CXHLog:%@", info);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [MBProgressHUD hideHUDForView:Window animated:YES];// 动画隐藏
                [self showNormalAlertWithTitle:nil message:[NSString stringWithFormat:@"%@",info]];
            });
        });
    }
}

- (IBAction)ontest2:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:Window animated:YES]; // 动画开始
    NSString *url = @"http://www.zhihu.com/rss";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 获取文章列表
        NSArray* items = [IDNFeedParser feedItemsWithData:rssData fromUrl:url];
        NSLog(@"CXHLog:%@", items);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD hideHUDForView:Window animated:YES];// 动画隐藏
            [self showNormalAlertWithTitle:nil message:[NSString stringWithFormat:@"%@",items]];
        });
    });
}

- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        
        // 第三方登录数据(为空表示平台未提供)
        // 授权数据
        NSLog(@" uid: %@", resp.uid);
        NSLog(@" openid: %@", resp.openid);
        NSLog(@" accessToken: %@", resp.accessToken);
        NSLog(@" refreshToken: %@", resp.refreshToken);
        NSLog(@" expiration: %@", resp.expiration);
        
        // 用户数据
        NSLog(@" name: %@", resp.name);
        NSLog(@" iconurl: %@", resp.iconurl);
        NSLog(@" gender: %@", resp.unionGender);
        
        // 第三方平台SDK原始数据
        id mod = resp.originalResponse;
        NSLog(@"MyLog:%@", mod);
    }];
}

- (IBAction)fontChanged:(UISlider *)sender {
    
    FontIncrement = sender.value;
}

- (IBAction)onID:(id)sender {

    rssData = nil;// 清空rss
    
    
    
}

@end
