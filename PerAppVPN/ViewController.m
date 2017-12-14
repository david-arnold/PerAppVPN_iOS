//
//  ViewController.m
//  PerAppVPN
//
//  Created by David Arnold on 11/12/2017.
//  Copyright © 2017 David Arnold. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) makeNetworkRequest:(id)sender {
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:operationQueue];
    
    //perhaps generate a guid and append to the URL to prevent caching ?
    
    [[[NSURLSessionConfiguration defaultSessionConfiguration] URLCache] removeAllCachedResponses];
    
    NSUUID *uuid = [[NSUUID alloc]init];
    
    NSString *urlString = [NSString stringWithFormat:@"http://attts-sql2008.attlab.sw.rim.net/Test/userinfo.aspx?randomGuid=%@",[uuid UUIDString]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSLog(@"Asynchronous NSURLSessionDataTask completionHandler");
                                  }];
    
    [task resume];
}


@end
