//
//  ObjcDetailViewController.m
//  MyTodo
//
//  Created by Laflora on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ObjcDetailViewControllerHeader.h"
@implementation DetailViewController
- (UILabel *)label
{
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = UIListContentTextAlignmentCenter;
    return label;
}

- (UIButton *)deleteBtn
{
    UIButton *deleteBtn = [[UIButton alloc]init];
    deleteBtn.backgroundColor = [UIColor redColor];
    deleteBtn.frame = UIRectFrame(CGRectZero);
    
}

@end

