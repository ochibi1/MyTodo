//
//  ObjcDetailViewController.m
//  MyTodo
//
//  Created by Laflora on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ObjcDetailViewController.h"
#import "Model/Task+CoreDataClass.swift"
@implementation ObjcDetailViewController
- (UILabel *)label
{
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = UIListContentTextAlignmentCenter;
    return label;
}

- (UIButton *)deleteBtn
{
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame: CGRectZero];
    deleteBtn.backgroundColor = [UIColor redColor];
    [deleteBtn setTitle:@"削除" forState:UIControlStateNormal];
    return deleteBtn;
}

- (Task *)task
{
    Task *task = [[Task allocc] init];
}

@end

