//
//  ViewController.m
//  36-SQLite的封装
//
//  Created by Mac on 14-10-22.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "StudentSqliteTool.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Student *stu = [[Student alloc] init];
    
    stu.name = @"jack";
    
    stu.age = 20;
    
    int result = [StudentSqliteTool addStudent:stu];
    
    NSLog(@"%i",result);
    
}



@end
