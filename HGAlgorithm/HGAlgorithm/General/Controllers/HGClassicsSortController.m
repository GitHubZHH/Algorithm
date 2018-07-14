//
//  HGClassicsSortController.m
//  HGAlgorithm
//
//  Created by ZhuHong on 2018/7/11.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGClassicsSortController.h"
#import "HGAlgorithm.h"

@interface HGClassicsSortController ()

@end

@implementation HGClassicsSortController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.section == 1) {
        
        switch (indexPath.row) {
            case 1:
            {
                // 计算连续最大和的子数组
                NSArray* arr = @[@1, @2, @(-4), @4, @10, @(-3), @4, @(-5), @1];
                
                NSArray* maxArrM = [HGAlgorithm maxPlusWithArray:arr];
                
                NSLog(@"最大和子数组 %@", maxArrM);
            }
                break;
            case 2:
            {
                // 字符串 反转
                char s[] = "12345678903";
                [HGAlgorithm reverseForChar:s];
                
                NSLog(@"%s", s);
                
            }
                break;
            case 3:
            {
                // 去除字符串中重复字符
                char* input = "qweqwertyuutrerty";
                char output[17] = {"0"};
                
                [HGAlgorithm removeRepeadtChar:input output:output];
                
                NSLog(@"%s_%s", input, output);
                
            }
                break;
                
            default:
                break;
        }
        
        return;
    }
    
    
    int array[5] = {34, 56, 12, 32, 21};
    // 排序前
    [HGAlgorithm printWithArray:array length:5];
    
    switch (indexPath.row) {
        case 0:
        {
            // 冒泡排序
            [HGAlgorithm bubbleSortWithArray:array length:5];
        }
            break;
        case 1:
        {
            // 快速排序
            [HGAlgorithm quickSortWithArray:array length:5];
            
        }
            break;
        case 2:
        {
            // 插入排序
            [HGAlgorithm insertSortWithArray:array length:5];
            
        }
            break;
        case 3:
        {
            // 归并排序
            [HGAlgorithm mergeSortWithArray:array length:5];
            
        }
            break;
        case 4:
        {
            // 堆排序,也叫选择排序
            [HGAlgorithm heapSortWithArray:array length:5];
            
        }
            break;
            
        default:
            break;
    }
    // 排序后
    [HGAlgorithm printWithArray:array length:5];
}


@end
