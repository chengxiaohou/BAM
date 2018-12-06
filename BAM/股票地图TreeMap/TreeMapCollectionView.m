//
//  TreeMapVIew.m
//  BAM
//
//  Created by 橙晓侯 on 2018/1/19.
//  Copyright © 2018年 橙晓侯. All rights reserved.
//

#import "TreeMapCollectionView.h"
#import "TreeMapLayout.h"

@implementation TreeMapCollectionView
{
    NSArray *tempValues;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // 屏幕旋转重新布局
    [[NSNotificationCenter defaultCenter] addObserverForName:NOTI_ChangeStatusBarOrientation object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self reloadData];
        });
    }];
    
    // 模拟数据
    tempValues = @[@445, @203, @110, @105, @95, @65, @33, @21, @10];

    self.delegate = self;
    self.dataSource = self;
    TreeMapLayout *layout = [[TreeMapLayout alloc] init];
    [layout configData:tempValues];
    
    self.collectionViewLayout = layout;
    
    [self reloadData];
}


#pragma mark - ......::::::: UICollectionViewDataSource :::::::......

#pragma mark CV段数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    //  偏移20/64适配
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    return 1;
}

#pragma mark CV行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    //  偏移20/64适配
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    return tempValues.count;
}

#pragma mark ［配置CV单元格］
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //  偏移20/64适配
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tree" forIndexPath:indexPath];
    cell.backgroundColor = RANDOM_COLOR;
    return cell;
}



#pragma mark 点击CV单元格
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
