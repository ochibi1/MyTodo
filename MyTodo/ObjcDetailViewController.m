//
//  ObjcDetailViewController.m
//  MyTodo
//
//  Created by Laflora on 2020/11/20.
//

#import "ObjcDetailViewController.h"
#import "MyTodo-Swift.h"

@implementation ObjcDetailViewController

- (instancetype)initWithTask:(Task *)task {
    self = [super initWithNibName:nil bundle:nil];
    self.title = @"詳細画面";
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    self.task = task;
    
    self.numberLabel = [UILabel new];
    self.numberLabel.backgroundColor = UIColor.whiteColor;
    self.numberLabel.textAlignment = UIListContentTextAlignmentCenter;
    [self.numberLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.numberLabel.text = [NSString stringWithFormat:@"%d", task.taskNumber];
    [self.view addSubview:self.numberLabel];
    
    self.label = [UILabel new];
    self.label.backgroundColor = UIColor.whiteColor;
    self.label.textAlignment = UIListContentTextAlignmentCenter;
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.label.text = task.taskName;
    [self.view addSubview:self.label];
    
    self.deleteBtn = [UIButton new];
    self.deleteBtn.backgroundColor = UIColor.redColor;
    [self.deleteBtn setTitle:@"削除" forState:UIControlStateNormal];
    [self.deleteBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.deleteBtn addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.deleteBtn];
    
    NSArray<NSLayoutConstraint *> *numberLabelConstraints = @[
        [self.numberLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:150.0],
        [self.numberLabel.heightAnchor constraintEqualToConstant:45.0],
        [self.numberLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:40.0],
        [self.numberLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-40.0],
    ];
    
    [self.view addConstraints:numberLabelConstraints];
    
    NSArray<NSLayoutConstraint *> *labelConstraints = @[
        [self.label.topAnchor constraintEqualToAnchor:self.numberLabel.bottomAnchor constant:30.0],
        [self.label.heightAnchor constraintEqualToAnchor:self.numberLabel.heightAnchor],
        [self.label.leftAnchor constraintEqualToAnchor:self.numberLabel.leftAnchor],
        [self.label.rightAnchor constraintEqualToAnchor:self.numberLabel.rightAnchor],
    ];
    
    [self.view addConstraints:labelConstraints];
    
    NSArray<NSLayoutConstraint *> *deleteBtnConstraints = @[
        [self.deleteBtn.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:50.0],
        [self.deleteBtn.heightAnchor constraintEqualToAnchor:self.label.heightAnchor],
        [self.deleteBtn.widthAnchor constraintEqualToConstant:70.0],
        [self.deleteBtn.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    ];
    [self.view addConstraints:deleteBtnConstraints];
    
    return self;
}

    
- (void)deleteData {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"確認"
                                                   message:@"本当に削除してよろしいですか？"
                                                   preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *_Nonnull action){
                               //[self.task delete];
                               //[self.task save];
                               [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"キャンセル"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];

}

@end

