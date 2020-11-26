//
//  ObjcDetailViewController.h
//  MyTodo
//
//  Created by Laflora on 2020/11/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Task;
@interface ObjcDetailViewController: UIViewController

@property UILabel *label;
@property UILabel *numberLabel;
@property UIButton *deleteBtn;
@property Task *task;

- (instancetype)initWithTask: (Task *)task;

@end
