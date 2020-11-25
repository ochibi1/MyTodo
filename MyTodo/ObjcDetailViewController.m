//
//  ObjcDetailViewController.m
//  MyTodo
//
//  Created by Laflora on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SnapKit/SnapKit-Swift.h>
#import "ObjcDetailViewController.h"
#import "MyTodo-Bridging-Header.h"
#import "MyTodo-Swift.h"
@implementation ObjcDetailViewController
- (UILabel *)label
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
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

- (instancetype)init {
    self->task = task;
    self = [super init];
    self.title = @"詳細画面";
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    self.label.text = task.taskName;
    
    NSLayoutConstraint* topAnchor = [label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.0];
    NSLayoutConstraint* heightAnchor = [label.heightAnchor constraintEqualToAnchor:self.view.heightAnchor constant:45.0];
    NSLayoutConstraint* leftAnchor = [label.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:40.0];
    NSLayoutConstraint* rightAnchor = [label.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-40.0];
    [self.view addConstraint:topAnchor];
    [self.view addConstraint:heightAnchor];
    [self.view addConstraint:leftAnchor];
    [self.view addConstraint:rightAnchor];
    
    [self.view addSubview:self.deleteBtn];
    NSLayoutConstraint* top = [deleteBtn.top constraintEqualToAnchor:self.label.snp.bottom constant:<#(CGFloat)#>];
    return self;
}

@end

