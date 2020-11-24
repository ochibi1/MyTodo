//
//  ObjcDetailViewController.h
//  MyTodo
//
//  Created by RLSUU178449 on 2020/11/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Task;

@interface ObjcDetailViewController: UIViewController

@property UILabel *label;

@property UIButton *deleteBtn;

@property Task *task;

- (instancetype)initWithTask: (Task *)task;

@end
