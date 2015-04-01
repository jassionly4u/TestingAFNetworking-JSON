//
//  JSViewController.m
//  TestingAFNetworking+JSON
//
//  Created by Jasvinder Singh on 31/03/15.
//  Copyright (c) 2015 Jasvinder Singh. All rights reserved.
//

#import "JSViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface JSViewController ()

@end

@implementation JSViewController

- (void)method1
{
    // Method 1
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",nil]];
    
    NSDictionary *dateDic = @{@"data":@{@"name":@"name", @"age":@"40"}};
    
    [manager POST:@"http://localhost/Testing/testJson.php" parameters:dateDic success:^(AFHTTPRequestOperation* operation, id responseObject) {
        NSLog(@"response %@",responseObject);
        
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
        NSLog(@"eror %@",error);
        
    }];
}

- (void)method2
{
    // Method 2
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",nil]];
    NSDictionary *dateDic = @{@"data":@{@"name":@"name", @"age":@"40"}};
    
    [manager POST:@"http://localhost/Testing/testJson.php"
       parameters:dateDic
          success:^(NSURLSessionDataTask *task, id responseObject) {
              NSLog(@"response %@",responseObject);
              NSDictionary *dict = (NSDictionary *)responseObject;
              
              NSLog(@"age - %@",[dict valueForKeyPath:@"data.age"]);
              
          }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              NSLog(@"eror %@",error);
          }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self method1];
    
    //[self method2];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
