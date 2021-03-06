//
//  ViewController.m
//  CoreData的使用
//
//  Created by 李志伟 on 15/3/30.
//  Copyright (c) 2015年 李志伟. All rights reserved.
//

#import "ViewController.h"
#import "XZCoreData.h"
#import "XZCoreDataTool.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self creat];
    
//    [self get];
    
    
    
  
}

//根据条件查询
-(void)getEntityWithFetchRequest{
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    //查询年龄以21开头的person
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"age like %@",@"*21"];
    request.predicate = pre;
    
    // 模糊查询
    // 名字以"wang"开头
    //    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name BEGINSWITH %@",@"wangwu1"];
    //    request.predicate = pre;
    
    // 名字以"1"结尾
    //    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name ENDSWITH %@",@"1"];
    //    request.predicate = pre;
    
    
    // 名字包含"wu1"
    //    NSPredicate *pre = [NSPredicate predicateWithFormat:@"name CONTAINS %@",@"wu1"];
    //    request.predicate = pre;
    
    
    
    //将person进行排序
    NSSortDescriptor *ageSort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    request.sortDescriptors = @[ageSort];
    
    //分页查询
    // 分页的起始索引
    request.fetchOffset = 0;
    
    // 分页的条数
    request.fetchLimit = 3;
    
    

    NSArray *persons =[XZCoreDataTool getEntityWithName:@"Person" AndFetchRequest:request];
    
    for (Person *p in persons) {
        NSLog(@"name = %@ age = %@",p.name,p.age);
        
    }
}

//创建一个实体
-(void)creat{
    
    NSDictionary *dic = @{@"name":@"lizhi",@"age":@"21"};
    [XZCoreDataTool creatEntityWithName:@"Person" AndAttribute:dic];
}

//获取实体
-(void)get{
    
    NSArray *persons = [XZCoreDataTool getEntityWithName:@"Person"];
    
    for (Person *p in persons) {
        NSLog(@"name = %@ age = %@",p.name,p.age);
        
    }
}


//更新实体
-(void)updateEntity{
    NSDictionary *dic = @{@"name":@"李志伟"};
    [XZCoreDataTool updateEntityWithName:@"Person" AndAttribute:dic AtIndex:1];
}


//删除一个实体
-(void)updata{
    [XZCoreDataTool deleteEntityWithName:@"Person" AndIndex:1];
}





@end
