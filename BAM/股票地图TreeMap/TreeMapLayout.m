//
//  TreeMapLayout.m
//  BAM
//
//  Created by 橙晓侯 on 2018/1/19.
//  Copyright © 2018年 橙晓侯. All rights reserved.
//

#import "TreeMapLayout.h"


@interface TreeMapLayout ()
/** attrs的数组 */
@property (strong, nonatomic) NSMutableArray *attrsArr;
/** 计算的rect列表 */
@property (strong, nonatomic) NSMutableArray <NSValue *> *treeMapValues;
/** 数据源 */
@property (strong, nonatomic) NSArray *values;

@end

@implementation TreeMapLayout



#pragma mark 配置数据
- (void)configData:(NSArray *)values
{
    _values = values;
}


-(void)prepareLayout
{
    [super prepareLayout];
    
    // 懒加载
    [self.attrsArr removeAllObjects];
    
    
    NSAssert(_values != nil, @"TreeMap的values不能为nil，请先配置数据源");
    
    [self.collectionView setNeedsLayout];
    [self.collectionView layoutIfNeeded];
    NSLog(@"CXHLog========================== :%@", NSStringFromCGRect(self.collectionView.bounds));
    YMTreeMap *tm = [[YMTreeMap alloc] initWithValues:_values];
    NSArray *tempArr = [tm tessellateInRect:self.collectionView.bounds];
    _treeMapValues = [NSMutableArray new];
    for (id obj in tempArr) {
        [_treeMapValues addObject:obj];
    }
    
    NSInteger count =[self.collectionView numberOfItemsInSection:0];
    
    for (int i=0; i<count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArr addObject:attrs];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return _attrsArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes * attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSValue *value = _treeMapValues[indexPath.item];
    attrs.frame = value.CGRectValue;

//    NSLog(@"CXHLog:%@", NSStringFromCGRect(attrs.frame));
    return attrs;
}

-(NSMutableArray *)attrsArr
{
    if(!_attrsArr){
        _attrsArr=[[NSMutableArray alloc] init];
    }
    return _attrsArr;
}

@end
