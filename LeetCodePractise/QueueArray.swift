//
//  QueueArray.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public struct QueueArray<T>: Queue {
  
  private var array: [T] = []
  public init() {}

  public var isEmpty: Bool {
    array.isEmpty
  }
  
  public var peek: T? {
    array.first
  }
  
  public mutating func enqueue(_ element: T) -> Bool {
    array.append(element)
    return true
  }
  
  public mutating func dequeue() -> T? {
    isEmpty ? nil : array.removeFirst()
  }
}

extension QueueArray: CustomStringConvertible {
  
  public var description: String {
    String(describing: array)
  }
}
