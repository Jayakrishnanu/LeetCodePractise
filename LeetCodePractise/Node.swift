//
//  Node.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/6/24.
//

import Foundation

public class Node<Value> {
  
  public var val: Value
  public var next: Node?
  
  public init(_ value: Value, _ next: Node? = nil) {
    self.val = value
    self.next = next
  }
}

extension Node: CustomStringConvertible {
  
  public var description: String {
    guard let next = next else {
      return "\(val)"
    }
    return "\(val) -> " + String(describing: next) + " "
  }
}
