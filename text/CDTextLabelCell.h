//
//  CDTextLabelCell.h
//  text
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 dony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDTextLabelCell : UITableViewCell

@property (nonatomic,strong)UILabel *cellTextLabel;

-(void)setCellTextLabelText:(NSString *)text;
+(CDTextLabelCell *)cellToTableView:(UITableView *)tableView;
@end
