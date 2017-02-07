//
//  CDTextView.h
//  text
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 dony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDTextView : UITextView <UITextViewDelegate>

@property (nonatomic,copy) NSString *placeholder; //提示语
@property (nonatomic,strong) UIColor *placeholderColor; //提示语的颜色
@end
