//
//  DynamicProgramming.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public class DynamicProgramming {
    // Leet 134
    public func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let count = gas.count
        var dp = Array(repeating: Int.min, count: count)
        var loop = -1
        var i = 0
        var start = -1
        while loop < 1 {
            let index = i > 0 ? i - 1 : count - 1
            if dp[i] >= 0 && start == i { return start }
            if dp[index] >= 0 {
                dp[i] = dp[index] + gas[i] - cost[i]
            } else {
                dp[i] = gas[i] - cost[i]
                start = i
            }
            
            if dp[i] < 0 { start = i }
            i += 1
            if i == count { loop += 1 }
            i %= count
            
        }
        return -1
    }
}
