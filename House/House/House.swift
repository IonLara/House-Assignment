//
//  House.swift
//  Assignment1
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

class House {
  var border: Character
  var fill: Character
  var size: Int
  
  var perimeter: Int {
    return (size * 2) + ((size + 2) * 3)
  }
  
  var area: Double {
      return Double(Double((size * size)) + Double((Double((size * size)) * (3.squareRoot())) / 4))
  }
  
  func grow() {
      size = size < 37 ? size + 1 : size
  }
  
  func shrink() {
      size = size > 3 ? size - 1 : size
  }
  
  func draw() {
      for i in 0..<(size + size + 1) {
          if i > 0 {
              if i < size + 2 {
                  if size >= i {
                      for _ in 0..<size - i + 1{
                          print(" ", terminator: "")
                      }
                  }
                  print(border, terminator: " ")
                  for _ in 0..<i - 1 {
                      print(fill, terminator: " ")
                  }
                  print(border, terminator: "")
              } else {
                  print("  ", terminator: "")
                  print(border, terminator: " ")
                  for _ in 0..<(size - 2) {
                      if i == size * 2 {
                          print(border, terminator: " ")
                      } else {
                          print(fill, terminator: " ")
                      }
                  }
                  print(border, terminator: "")
              }
          } else {
              if size % 2 == 0 {
                  print(" ", terminator: "")
              }
              for j in 0..<size {
                  if j < size - (size / 2){
                      print(" ", terminator: "")
                  } else {
                      print(border, terminator: "")
                      break
                  }
                  print(" ", terminator: "")
              }
          }
          print()
      }
      print()
  }
    
    //Initializer
    init (size: Int, border: Character = "X", fill: Character = "*") {
        self.size = min(max(size, 3), 37)
        if let borderASCII = border.asciiValue {
            self.border = borderASCII >= 33 && borderASCII <= 126 ? border : "X"
        } else {
            self.border = "X"
        }
        if let fillASCII = fill.asciiValue {
            self.fill = fillASCII >= 33 && fillASCII <= 126 ? fill : "*"
        } else {
            self.fill = "*"
        }
    }
}
