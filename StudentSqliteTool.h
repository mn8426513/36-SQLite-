//
//  StudentSqliteTool.h
//  36-SQLite的封装
//
//  Created by Mac on 14-10-22.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Student;

@interface StudentSqliteTool : NSObject

+(BOOL)addStudent:(Student*)stu;

@end
