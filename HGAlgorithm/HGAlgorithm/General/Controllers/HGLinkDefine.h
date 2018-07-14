//
//  HGLinkDefine.h
//  HGAlgorithm
//
//  Created by ZhuHong on 2018/7/13.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <Foundation/Foundation.h>

// 链表节点定义
typedef struct _node
{
    // 数据
    char* data;
    // 下一个指针
    struct _node* next;
} HGNode;

//@interface HGLinkDefine : NSObject
//
//@end
