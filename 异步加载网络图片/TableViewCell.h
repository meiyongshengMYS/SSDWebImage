//
//  TableViewCell.h
//  异步加载网络图片
//
//  Created by 梅 on 2017/6/22.
//  Copyright © 2017年 mei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class appModel;
@interface TableViewCell : UITableViewCell
//@property(nonatomic,strong)appModel *app;
@property(nonatomic,weak)IBOutlet UIImageView *iconImageView;
@property(nonatomic,weak)IBOutlet UILabel *nameLabel;
@property(nonatomic,weak)IBOutlet UILabel *downloadLabel;
@end
