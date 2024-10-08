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
    
    // Leet: 418 Medium
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var globalMax = nums[0]
        var globalMin = nums[0]
        var curMax = 0
        var curMin = 0
        var total = 0
        for num in nums {
            curMax = max(curMax, 0)
            curMax += num
            curMin = min(curMin, 0)
            curMin += num
            total += num
            globalMax = max(globalMax, curMax)
            globalMin = min(globalMin, curMin)
        }
        if globalMax < 0 {
            return globalMax
        } else {
            return max(globalMax, total - globalMin)
        }
    }
}
