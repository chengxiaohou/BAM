//
//  TVCell.h
//  TianZiCai
//
//  Created by 橙晓侯 on 2017/1/22.
//  Copyright © 2017年 橙晓侯. All rights reserved.
//

#import "BaseTVCell.h"

@interface TVCell : BaseTVCell

@property (weak, nonatomic) IBOutlet UILabel *lb1;
@property (weak, nonatomic) IBOutlet UILabel *lb2;
@property (weak, nonatomic) IBOutlet UILabel *lb3;
@property (weak, nonatomic) IBOutlet UILabel *lb4;
@property (weak, nonatomic) IBOutlet UILabel *lb5;
@property (weak, nonatomic) IBOutlet UILabel *lb6;

@property (weak, nonatomic) IBOutlet EEButton *btn1;
@property (weak, nonatomic) IBOutlet EEButton *btn2;
@property (weak, nonatomic) IBOutlet EEButton *btn3;

@property (weak, nonatomic) IBOutlet EEView *view1;

@property (weak, nonatomic) IBOutlet EETextView *textView1;

@property (weak, nonatomic) IBOutlet EEImageView *imgView1;
@property (weak, nonatomic) IBOutlet EEImageView *imgView2;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint1;
@property (weak, nonatomic) IBOutlet UIView *line;
/** cell的对象 */
@property (strong, nonatomic) id info;

@end
