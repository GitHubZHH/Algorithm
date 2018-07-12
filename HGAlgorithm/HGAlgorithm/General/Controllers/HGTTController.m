//
//  HGTTController.m
//  HGAlgorithm
//
//  Created by ZhuHong on 2018/7/11.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGTTController.h"

@interface HGTTController ()

@end

@implementation HGTTController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        // 调试
        NSString* str1 = @"1234";
        // 字符
        const char *str = [str1 UTF8String];
        // 字符串长度
        NSUInteger length = [str1 length];
        // 动态分配空间
        char *pReverse = (char*)malloc(length+1);
        // 将 str copy 到 pReverse 中
        strcpy(pReverse, str);
        
        [self reverseOptimizeFromSubString:pReverse startPosition:1 endPosition:2];
        
        NSLog(@"%s 转换后 %s", str, pReverse);
    } else if (indexPath.row == 0) {
        // 普通实现
        // 原始字符串
        NSString* string = @"i am a student.";
        // 反转后的字符串
        NSString* reverseString = [self reverseWithString:string];
        // 打印
        NSLog(@"%@", reverseString);
    } else  {
        // 进阶实现
        // 原始字符串
        NSString* string = @"    i  am    a student.    ";
        // 反转后的字符串
        NSString* reverseString = [self reverseOptimizeFromString:string];
        // 打印
        NSLog(@"%@", reverseString);
    }
}

/**
 字符串反转
 
 @note 如题: 把字符串“i am a student.”，翻转为“i ma a .tneduts”
 
 @param string 原始字符串
 @return 返回结果
 */
- (NSString*)reverseWithString:(NSString*)string {
    // 有效性
    if (!string || (string.length == 0)) {
        return @"";
    }
    // 空格常量
    static NSString* const spaceString = @" ";
    // 将字符串分割成数组
    NSArray* array = [string componentsSeparatedByString:spaceString];
    // 中间变量
    NSMutableArray* arrM = [NSMutableArray array];
    // 转一转
    for (int i=0; i<array.count; i++) {
        NSString* str = [self reverseFromString:array[i]];
        [arrM addObject:str];
    }
    return [arrM componentsJoinedByString:spaceString];
}

/**
 字符串反转
 
 @note 这个与 reverseWithString: 有所不同, 不用处理空格的情况
 如题: 把字符串“student.”，翻转为“.tneduts”
 */
- (NSString*)reverseFromString:(NSString*)string {
    // 有效性
    if (!string || (string.length <= 1) ) {
        return string;
    }
    
    // 字符
    const char *str = [string UTF8String];
    // 字符串长度
    NSUInteger length = [string length];
    // 动态分配空间
    char *pReverse = (char*)malloc(length+1);
    // 将 str copy 到 pReverse 中
    strcpy(pReverse, str);
    // 开始交换
    [self reverseOptimizeFromSubString:pReverse startPosition:0 endPosition:(length-1)];
    
    // 生成字符串
    NSString *pstr = [NSString stringWithUTF8String:pReverse];
    // 释放
    free(pReverse);
    // 返回
    return pstr;
}

/**
 字符串反转 优化版本
 
 @note 如题: 把字符串“i am a student.”，翻转为“i ma a .tneduts”
 
 @param string 原始字符串
 @return 返回结果
 */
- (NSString*)reverseOptimizeFromString:(NSString*)string {
    // 有效性
    if (!string || (string.length <= 1) ) {
        return string;
    }
    // 字符
    const char *chars = [string UTF8String];
    // 字符串长度
    NSUInteger length = [string length];
    // 动态分配空间
    char *pReverse = (char*)malloc(length+1);
    // 将 str copy 到 pReverse 中
    strcpy(pReverse, chars);
    
    // 记录某个单词的开始位置
    NSUInteger startPosition = 0;
    
    // 空格字符
    char spaceChar = ' ';
    
    // 遍历 & 开始交换
    for (NSUInteger i=0; i<length; i++) {
        // 当前的字符
        char c = pReverse[i];
        if (c == spaceChar) {
            NSLog(@"相等");
            // 遇到空格了
            // 要注意现在 i 的位置已经是在空格的位置了
            // 所以需要交换的是 i 的前一个位置之前到 startPosition 的位置
            // 开始交换
            [self reverseOptimizeFromSubString:pReverse startPosition:startPosition endPosition:(i-1)];
            
            // 每次都自动将 startPosition 的位置移动到最后, 就是当前的 i 的下一个
            // 目的就是不希望起始位置咋空格的位置上
            // 主要也是为了处理连续多个空格的情况
            startPosition = i+1;
        }
        
        // 考虑最后一个单词
        if (i == (length - 1)) {
            // 开始交换
            [self reverseOptimizeFromSubString:pReverse startPosition:startPosition endPosition:i];
        }
    }
    // 生成字符串
    NSString *pstr = [NSString stringWithUTF8String:pReverse];
    // 释放
    free(pReverse);
    // 返回
    return pstr;
}


/**
 交换局部字符集
 
 @description 比如 将 "1234" 换成 "1324" 那么 startPosition = 1, endPosition = 2
 
 @param pReverse 即将要个交换的字符串
 @param startPosition 起始位置
 @param endPosition 结束位置
 @return 返回  这个返回值可有可无, 因为 pReverse 是指针
 */
- (char *)reverseOptimizeFromSubString:(char *)pReverse startPosition:(NSUInteger)startPosition endPosition:(NSUInteger)endPosition {
    // 只能是大于 0 的情况下 交换才有意义
    if ((endPosition - startPosition) < 1) {
        return pReverse;
    }
    // 开始交换
    for(NSUInteger j=startPosition; j<(startPosition + ((endPosition+1)-startPosition)/2); j++) {
        char cc = pReverse[j];
        NSUInteger k = endPosition - (j - startPosition);
        pReverse[j] = pReverse[k];
        pReverse[k] = cc;
    }
    return pReverse;
}

@end
