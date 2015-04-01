//
//  JSViewController.m
//  TestingAFNetworking+JSON
//
//  Created by Jasvinder Singh on 31/03/15.
//  Copyright (c) 2015 Jasvinder Singh. All rights reserved.
//

#import "JSViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface JSViewController ()<NSURLConnectionDelegate>

@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];

    
//    AFJSONRequestSerializer* requestSerializer = [AFJSONRequestSerializer serializer];
//    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    manager.requestSerializer = requestSerializer;
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/plain",@"application/json",@"text/html",nil]];
    
    NSDictionary *dateDic = @{@"data":@{@"name":@"name", @"age":@"40"}};
    NSError *error;
//    NSData *json = [NSJSONSerialization dataWithJSONObject:dateDic options:0 error:&error];
//    NSString *s = [NSString stringWithUTF8String:[json bytes]];
//    NSLog(@"error--->%@",error);
//    NSLog(@"s--->%@",s);
    
    /*[manager POST:@"http://localhost/Testing/testJson.php"
       parameters:dateDic
          success:^(NSURLSessionDataTask *task, id responseObject) {
              NSLog(@"response %@",responseObject);
              
              NSDictionary *dict = (NSDictionary *)responseObject;
              NSLog(@"dict %@",[dict valueForKeyPath:@"data.age"]);
              
          }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              NSLog(@"eror %@",error);
          }];*/
    [manager POST:@"http://localhost/Testing/testJson.php" parameters:dateDic success:^(AFHTTPRequestOperation* operation, id responseObject) {
        NSLog(@"response %@",responseObject);
        
    } failure:^(AFHTTPRequestOperation* operation, NSError* error) {
        //ICityError icity = [[ICityError alloc] init]
        NSLog(@"eror %@",error);
        
    }];
                                   
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
