//
//  CDTextLabelCell.m
//  text
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 dony. All rights reserved.
//

#import "CDTextLabelCell.h"
#define mDeviceWidth [UIScreen mainScreen].bounds.size.width        //屏幕宽
#define mDeviceHeight [UIScreen mainScreen].bounds.size.height
#define mSystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
@implementation CDTextLabelCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        UILabel *labelText = [[UILabel alloc] init];

        labelText.backgroundColor = [UIColor clearColor];
        labelText.textColor = [UIColor blackColor];

        labelText.textAlignment = NSTextAlignmentLeft;
        labelText.font = [UIFont systemFontOfSize:12];
        labelText.numberOfLines = 0;
        self.cellTextLabel =labelText;
        [self addSubview:labelText];
    }
    
    return  self;
}


+(CDTextLabelCell *)cellToTableView:(UITableView *)tableView{
    static NSString *cellId = @"cellID";
    CDTextLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell =[[CDTextLabelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    return cell;
}
-(void)setCellTextLabelText:(NSString *)text{
    CGRect frame =[self frame];
    CGSize size =CGSizeMake(mDeviceWidth-20, 1000);
    self.cellTextLabel.text =text;

    CGSize labelSize;

    if (mSystemVersion >7.0){
        
        NSDictionary *attribute =@{NSFontAttributeName:self.cellTextLabel.font};
        labelSize =[self.cellTextLabel.text boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin| NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    }else {
        labelSize = [self.cellTextLabel.text sizeWithFont:self.cellTextLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    }
    
    
    self.cellTextLabel.frame = CGRectMake(self.cellTextLabel.frame.origin.x, self.cellTextLabel.frame.origin.y, labelSize.width, labelSize.height+20);
    frame.size.height=labelSize.height+20;
    
    self.frame=frame;
    
    
}
























@end
