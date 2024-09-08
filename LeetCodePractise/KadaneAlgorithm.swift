//
//  KadaneAlgorithm.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public class KadaneAlgorithm {
    
    // Leet: 53 Medium
    public func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var maxValue = nums[0]
        var currentMax = 0
        for num in nums {
            currentMax += num
            if currentMax > 0 {
                maxValue = maxValue > currentMax ? maxValue : currentMax
            } else {
                maxValue = maxValue > currentMax ? maxValue : num
                currentMax = 0
            }
        }
        return maxValue
    }
    
    // 
}
