//
//  ObjcDetailViewController.m
//  MyTodo
//
//  Created by Laflora on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
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
    
    NSLayoutConstraint* topAnchor = [self.label.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.0];
    NSLayoutConstraint* heightAnchor = [self.label.heightAnchor constraintEqualToAnchor:self.view.heightAnchor constant:45.0];
    NSLayoutConstraint* leftAnchor = [self.label.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:40.0];
    NSLayoutConstraint* rightAnchor = [self.label.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-40.0];
    NSLayoutConstraint* bottomAnchor = [self.label.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:195.0];
    [self.view addConstraint:topAnchor];
    [self.view addConstraint:heightAnchor];
    [self.view addConstraint:leftAnchor];
    [self.view addConstraint:rightAnchor];
    [self.view addConstraint:bottomAnchor];
    
    [self.view addSubview:self.deleteBtn];
    NSLayoutConstraint* topAnchorBtn = [self.deleteBtn.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:50.0];
    NSLayoutConstraint* hegihtAnchorBtn = [self.deleteBtn.heightAnchor constraintEqualToAnchor:self.label.heightAnchor constant:0];
    NSLayoutConstraint* leftAnchorBtn = [self.deleteBtn.leftAnchor constraintEqualToAnchor:self.label.leftAnchor constant:-150.0];
    NSLayoutConstraint* rightAnchorBtn = [self.deleteBtn.rightAnchor constraintEqualToAnchor:self.label.rightAnchor constant:-150.0];
    [self.view addConstraint:topAnchorBtn];
    [self.view addConstraint:hegihtAnchorBtn];
    [self.view addConstraint:leftAnchorBtn];
    [self.view addConstraint:rightAnchorBtn];
    
    [deleteBtn addTarget:self action:@selector(self:deleteData:) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (UIAlertController *)alert {
    UIAlertController * alert = [[UIAlertController alloc]init];
    [UIAlertController alertControllerWithTitle:@"確認" message:@"本当に削除してよろしいですか？" preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}
    
- (void)deleteData:(UIButton*)deleteBtn
{

}



@end

