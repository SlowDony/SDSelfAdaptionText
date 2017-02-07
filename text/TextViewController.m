//
//  TextViewController.m
//  text
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController () <UITextViewDelegate>
@property (nonatomic,strong)UITextView *textView;
@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"自适应textView";
    [self setUpTextView];
}

-(void)setUpTextView{
    
    UITextView *smalTextView =[[UITextView alloc]init];
    smalTextView.frame =CGRectMake(10, 65, 320, 30);
    smalTextView.layer.borderWidth=0.5;
    smalTextView.layer.cornerRadius=6;
    smalTextView.layer.masksToBounds=YES;
    smalTextView.font=[UIFont systemFontOfSize:14];
    smalTextView.delegate=self;
    smalTextView.layer.borderColor=[UIColor colorWithWhite:0.6 alpha:1].CGColor;
    self.textView =smalTextView;
    [smalTextView setScrollEnabled:YES];
    self.automaticallyAdjustsScrollViewInsets=NO; //使textView编辑从第一行编辑.
    
    [self.view addSubview:smalTextView];
    
}
-(void)textViewDidChange:(UITextView *)textView{
    CGRect textRect =self.textView.frame;
    
    CGFloat textHeight =[self contentTextViewHeight:textView.text];
    NSLog(@"textHeight:%f",textHeight);
    textRect.size.height =textHeight+25;
    self.textView.frame=textRect;

//    self.cellTextLabel.frame = CGRectMake(self.cellTextLabel.frame.origin.x, self.cellTextLabel.frame.origin.y, labelSize.width, labelSize.height+20);
//    frame.size.height=labelSize.height+20;
}

- (CGFloat )contentTextViewHeight:(NSString *)text{
    NSInteger ch;
    
    CGSize size =CGSizeMake(310, 1000);
    self.textView.text=text;
    NSDictionary *attribute =[NSDictionary dictionaryWithObjectsAndKeys:self.textView.font,NSFontAttributeName ,nil];
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    
    ch=size.height;
    return ch;
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
