//
//  SKNetworkRequest.m
//  Masonry111
//
//  Created by shavekevin on 16/3/8.
//  Copyright © 2016年 shavekevin. All rights reserved.
//

#import "SKNetworkRequest.h"

@implementation SKNetworkRequest

//请求成功
-(void)requestSuccessCompleteFilter {
    
    [self dealWithData];
}


- (NSTimeInterval)requestTimeoutInterval{
    return 6.0f;
}

// 重载

- (void)dealWithData {
    
}
@end