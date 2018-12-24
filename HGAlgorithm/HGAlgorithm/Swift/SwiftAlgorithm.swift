//
//   SwiftAlgorithm.swift
//   HGAlgorithm
//
//   Created  by hong.zhu on 2018/12/24.
//   Copyright © 2018年 CoderHG. All rights reserved.
//

import UIKit

class SwiftAlgorithm: NSObject {
    // 100以内的素数
    func test(_: Void) -> Void {
        var array = [0]
        for n in 1...100 {
            array.append(n)
        }
        let resultArray = array.filter { (item) -> Bool in
            var n_sqrt = 0.0
            if item <= 1 {
                return false
            }
            
            if (item < 4) {
                return true
            }
            
            if ((item%6 != 1) && (item%6 != 5)) {
                return false
            }
            
            n_sqrt = sqrt(Double(item))
            
            let i1 = Int(n_sqrt)
            if i1 > 4 {
                for ii in 5...Int(n_sqrt) {
                    if ((item % ii == 0) || (item%(ii+2) == 0)) {
                        return false
                    }
                }
            }
            return true
        }
        print(resultArray)
    }
}
