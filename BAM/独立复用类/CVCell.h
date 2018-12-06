//
//  CVCell.h
//  MingPian
//
//  Created by 橙晓侯 on 2017/6/18.
//  Copyright © 2017年 橙晓侯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVCell : BaseCVCell

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

@property (weak, nonatomic) IBOutlet UIImageView *imgView1;
@property (weak, nonatomic) IBOutlet UIImageView *imgView2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint1;

@property (weak, nonatomic) IBOutlet UIView *line;
/** cell的对象 */
@property (strong, nonatomic) id info;

@end
