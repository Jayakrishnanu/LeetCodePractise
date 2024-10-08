//
//  StringProblems.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/10/24.
//

import Foundation

public class StringProblems {
    
    public func strStr(_ haystack: String, _ needle: String) -> Int {
        if haystack.count == needle.count {
            return haystack != needle ? -1 : 0
        }   else if let index = haystack.range(of: needle) {
            return haystack.distance(from: haystack.startIndex, to: index.lowerBound)
        } else {
            return needle.isEmpty ? 0 : -1
        }
    }
    
}
