//
//  StudentSqliteTool.m
//  36-SQLite的封装
//
//  Created by Mac on 14-10-22.
//  Copyright (c) 2014年 MN. All rights reserved.
//

#import "StudentSqliteTool.h"
#import "Student.h"
#import <sqlite3.h>

@implementation StudentSqliteTool


static sqlite3 *_db;


+ (void)initialize{
  
    
    NSString *filePath =  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)  lastObject]  stringByAppendingPathComponent:@"student.sqlite"];
    
        NSLog(@"%@", filePath );
    
    // 1.先打开创建一个数据库
    
    int result =  sqlite3_open(filePath.UTF8String, &_db);
    
    if(result == SQLITE_OK){
        
        NSLog(@"创建数据库成功！");
        
        // 4. 写要执行的数据库代码
        NSString *sql = [NSString stringWithFormat:@"create table if not exists t_student (id integer primary key autoincrement,name text,age integer);" ];
        
        char *error;
        // 3、创建数据库成功之后要执行创建表的语句
        
        int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
        
        if(result == SQLITE_OK){
            NSLog( @"创建table表成功!");
        }else {
            NSLog(@"创建table表失败！%s",error);
        }
        
    }else{
        NSLog(@"创建数据库失败！");
        
    }

}



+ (BOOL)addStudent:(Student*)stu{
  
        NSString *name = [NSString stringWithFormat:@"%@", stu.name];
        int age = stu.age;
        
        
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_student (name,age) values('%@',%i)",name,age];
        
        char *error;
        
        int result = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &error);
        
        if(result == SQLITE_OK){
             return  YES;
        }else {
             return  NO;
        }


    
}
@end
