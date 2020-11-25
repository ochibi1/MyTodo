//
//  ObjcDetailViewController.h
//  MyTodo
//
//  Created by Laflora on 2020/11/23.
//

#ifndef ObjcDetailViewController_h
#define ObjcDetailViewController_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MyTodo-Swift.h"
@interface ObjcDetailViewController : UIViewController
{
    UILabel *label;
    UIButton *deleteBtn;
    Task *task;
}
- (instancetype)init;
@end
#endif /* ObjcDetailViewController_h */
