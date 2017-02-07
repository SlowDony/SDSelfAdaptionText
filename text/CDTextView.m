//
//  CDTextView.m
//  text
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "CDTextView.h"


@interface CDTextView()

{
    UILabel *pLabel ;
}

@end
@implementation CDTextView 



-(instancetype )initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        
        
      // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
//        UITextView *smalTextView =[[UITextView alloc]init];
        self.frame =frame;
        self.layer.borderWidth=0.5;
        self.layer.cornerRadius=6;
        self.layer.masksToBounds=YES;
        self.font=[UIFont systemFontOfSize:14];
        self.delegate=self;
        self.layer.borderColor=[UIColor colorWithWhite:0.6 alpha:1].CGColor;
        
        [self setScrollEnabled:YES];
//        self.automaticallyAdjustsScrollViewInsets=NO; //使textView编辑从第一行编辑.
        pLabel=[[UILabel alloc]init];
        
        pLabel.frame =CGRectMake(5, 5, 200, 20);
        pLabel.textColor=[UIColor redColor];
        [self addSubview:pLabel];
        
        
    }
    return  self;
}

/*
    监听文字改变
 
 */

-(void)textDidChange{
    
}


-(void)textViewDidChange:(UITextView *)textView{
    CGRect textRect =self.frame;
    
    CGFloat textHeight =[self contentTextViewHeight:textView.text].height;
    textRect.size.height =textHeight+25;
    self.frame=textRect; 
    if (textView.text.length==0){
        pLabel.hidden=NO;
    }else {
         pLabel.hidden=YES;
    }
}

- (CGSize )contentTextViewHeight:(NSString *)text{
    
    CGSize size =CGSizeMake(self.frame.size.width-10, 1000);
    self.text=text;
    NSDictionary *attribute =[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName ,nil];
    size =[text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;

    return size;
}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
