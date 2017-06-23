//
//  ViewController.m
//  异步加载网络图片
//
//  Created by 梅 on 2017/6/22.
//  Copyright © 2017年 mei. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "appModel.h"
#import "TableViewCell.h"

@interface ViewController ()
@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadData];
}
- (void)loadData
{
    NSString *URLString = @"https://raw.githubusercontent.com/zhangxiaochuZXC/SHHM06/master/apps.json";
    [[AFHTTPSessionManager manager]GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
#pragma mark
#pragma mark - AFNetworking.h 取得反序列化结果responseObject
        NSArray *dictArr = responseObject;
#pragma mark
#pragma mark - YYModel.h 字典转模型
        self.dataArray = [NSArray yy_modelArrayWithClass:[appModel class] json:dictArr];
        NSLog(@"11111:%@",self.dataArray);
        
#pragma mark
#pragma mark - 不要忘记刷新UI
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"kk" forIndexPath:indexPath];
    appModel *app = self.dataArray[indexPath.row];
    cell.nameLabel.text = app.name;
    cell.downloadLabel.text = app.download;
    
    
    
    
    
    
    
    
    
    
    return cell;
}


@end
