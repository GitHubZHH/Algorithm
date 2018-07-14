//
//  HGLinkBasicController.m
//  HGAlgorithm
//
//  Created by ZhuHong on 2018/7/13.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "HGLinkBasicController.h"
#import "HGLinkDefine.h"

@interface HGLinkBasicController ()

@end

@implementation HGLinkBasicController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        // 创建一个节点
        [self createNode];
    } else if (indexPath.row == 1) {
        // 创建一个链表
        [self createLink];
    } else if (indexPath.row == 2) {
        // 遍历链表
        [self traverseLink];
    } else {
        // 单链表反转
        [self reverse];
    }
}

// 创建一个节点
- (HGNode*)createNode {
    HGNode* node = (HGNode*)malloc(sizeof(HGNode));
    // 现在是一个空的节点
    return node;
}

// 创建一个链表 返回一个头节点
- (HGNode*)createLink {
    // 先创建一个 head 节点
    HGNode* head = [self createNode];
    {
        // 数据
        head->data = "head";
    }
    
    // 创建其它的节点
    // 第一个节点
    HGNode* node1 = [self createNode];
    {
        // 数据
        node1->data = "A";
        // 接到 head
        head->next = node1;
    }
    
    // 第二个节点
    HGNode* node2 = [self createNode];
    {
        // 数据
        node2->data = "B";
        // 接到 node1
        node1->next = node2;
    }
    
    // 第三个节点
    HGNode* node3 = [self createNode];
    {
        // 数据
        node3->data = "C";
        // 接到 node2
        node2->next = node3;
    }
    
    return head;
}

// 遍历链表
- (void)traverseLink {
    HGNode* head = [self createLink];
    // 打印
    [self printWithLink:head];
}


// 单链表反转
- (void)reverse {
    HGNode* head = [self createLink];
    // 打印当前链表
    [self printWithLink:head];
    
    // 反转
    [self reverseWithLink:head];
    
    // 打印反转之后的链表
    [self printWithLink:head];
    
}


// 单链表反转
- (void)reverseWithLink:(HGNode*)headeLink {
    // 当前节点为 头结点的下一个节点
    HGNode *curP = headeLink->next;
    
    // 记录当前节点的上一个节点
    HGNode* lastP = [self recursionReverseWithLink:curP];
    
    // 现在 lastP 就是之前节点的最后一个节点
    headeLink->next = lastP;
}

// 链表递归反转
// 这里不包括头节点就是将除了头节点的链表都反转
- (HGNode*)recursionReverseWithLink:(HGNode*)node {
    // 说明 node 已经是最后一个节点
    if (node->next == NULL) {
        return node;
    }
    
    // 保留下一个节点
    HGNode* preNode = node->next;
    // 当前的先一个节点已经没有意义了, 因为要反转最好是先断开
    node->next = NULL;
    // 开始递归 preNode 节点
    HGNode* reverseNode = [self recursionReverseWithLink:preNode];
    // node变成最后一个节点
    preNode->next = node;
    // 这一个 reverseNode 就是 node 对应的最后的一个节点
    return reverseNode;
}

// 单链表反转
- (void)reverseWithLink1:(HGNode*)headeLink {
    // curP 是当前移动的节点
    // pre 是 curP 的下一个节点
    HGNode *curP, *pre;
    
    // 当前节点为 头结点的下一个节点
    curP = headeLink->next;
    
    // 记录当前节点的上一个节点
    HGNode* lastP = NULL;
    
    // 开始遍历
    while (curP) {
        // 保留当前节点的写一个节点
        pre = curP->next;
        // 当前节点的下一个节点换成上一个节点(反转)
        curP->next = lastP;
        
        // 指针向前移动
        lastP = curP;
        curP = pre;
    }
    
    // 现在 lastP 就是之前节点的最后一个节点
    headeLink->next = lastP;
}


// 打印
- (void)printWithLink:(HGNode*)headeLink {
    NSMutableArray* tmpArrM = [NSMutableArray array];
    // 遍历单列表
    HGNode* tmpLink = headeLink;
    
    while (tmpLink) {
        [tmpArrM addObject:[NSString stringWithFormat:@"%s", tmpLink->data]];
        tmpLink = tmpLink->next;
    }
    
    NSLog(@"链表打印: %@", [tmpArrM componentsJoinedByString:@"-->"]);
}


@end
