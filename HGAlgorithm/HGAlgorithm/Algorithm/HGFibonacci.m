//
//   HGFibonacci.m
//  HGAlgorithm
//
//  Created  by hong.zhu on 2018/12/25.
//  Copyright © 2018年 CoderHG. All rights reserved.
//  相关 博客 https://xiaozhuanlan.com/topic/4271098563

#import "HGFibonacci.h"

@implementation HGFibonacci

#pragma mark -
#pragma mark - Fibonacci
// 常规算法, 好处是不会出现过多的重复计算
- (NSInteger)fibonacci2:(NSInteger)n {
    if (n<=2) {
        return n;
    }
    NSInteger fibOne = 1;
    NSInteger fibTwo = 1;
    NSInteger fibN = 0;
    for (NSInteger i=2; i<n; i++) {
        fibN = fibOne+fibTwo;
        fibTwo = fibOne;
        fibOne = fibN;
    }
    return fibN;
}

// 递归
- (NSInteger)fibonacci:(NSInteger)n {
    if (n<=2) {
        return n;
    }
    return [self fibonacci:(n-1)] + [self fibonacci:(n-2)];
}

@end
