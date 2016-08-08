//
//  ViewController.m
//  GooeySlideMenuDemo
//
//  Created by Kitten Yang on 15/8/9.
//  Copyright (c) 2015年 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "GooeySlideMenu.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController{
    GooeySlideMenu *menu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    // Do any additional setup after loading the view, typically from a nib.
//    这个是侧边栏的button的title
    menu = [[GooeySlideMenu alloc]initWithTitles:@[@"首页",@"消息",@"发布",@"发现",@"个人",@"设置"]];
//    这是一个block，
    menu.menuClickBlock = ^(NSInteger index,NSString *title,NSInteger titleCounts){
//        当点击侧边栏button的时候触发下面的事件
        NSLog(@"index:%ld title:%@ titleCounts:%ld",index,title,titleCounts);
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//点击button触发事件
- (IBAction)buttonTrigger:(id)sender {
//    这个就是它的用法，让侧边栏弹出
    [menu trigger];
}



#pragma mark -- UITabel View Datasource
//代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"demoCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"NO.%ld",(long)indexPath.row];
    
    return cell;
}

@end
