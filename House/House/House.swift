//
//  House.swift
//  Assignment1
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

class House: CustomStringConvertible {
    let border: Character
    let fill: Character
    private (set) var size: Int
    
    //Overriding description
    var description: String {
        //Set the area as a string using only 2 decimal places
        let areaForm = String(format: "%.2f", area)
        //Printing the description before calling the draw method
        print("House width and height base to roof = \(size) units.\nPerimeter of house = \(perimeter).\nArea of house = \(areaForm).\nHouse looks like:")
        //Call the draw method to show a picture of the house
        self.draw()
        return ""
    }
    
    var perimeter: Int {
        return (size * 2) + ((size + 2) * 3)
    }
    
    var area: Double {
        return Double(Double((size * size)) + Double((Double((size * size)) * (3.squareRoot())) / 4))
    }
    
    func grow() { //If possible increase size by 1 unit, if not, stay the same
        size = size < 37 ? size + 1 : size
    }
    
    func shrink() { //If possible decrease the size by 1 unit, if not, stay the same
        size = size > 3 ? size - 1 : size
    }
    
    func draw() {
        //This loop runs once for each line in the final image
        for i in 0..<(size + size + 1) {
            if i > 0 { //Check if its the first line
                if i < size + 2 { //This is used to check if we are printing the triangle or the square area
                    if size >= i { //This check is to avoid running the next code when there shouldn't be any spaces
                        for _ in 0..<size - i + 1{
                            //Print the spaces in each line of the triangle (More spaces in the first lines
                            print(" ", terminator: "")
                        }
                    }
                    //After the spaces we print the border before the fill
                    print(border, terminator: " ")
                    for _ in 0..<i - 1 { //This will not be run if there is no fill in this line
                        print(fill, terminator: " ")
                    }
                    //Close up the line with a border
                    print(border, terminator: "")
                } else { //After printing the triangle we print the square part
                    print("  ", terminator: "") //We always start by printing two spaces to align the square with the roof
                    print(border, terminator: " ")
                    for _ in 0..<(size - 2) {
                        if i == size * 2 { //If we are printing the last line then use only border characters
                            print(border, terminator: " ")
                        } else {
                            print(fill, terminator: " ")
                        }
                    }
                    print(border, terminator: "")
                }
            } else { //This code is ran only for the first line, the top of the roof
                if size % 2 == 0 { //We add an extra space if the size is even to center the character
                    print(" ", terminator: "")
                }
                for j in 0..<size {
                    if j < size - (size / 2){ //We print spaces before the character
                        print(" ", terminator: "")
                    } else {
                        print(border, terminator: "") //After printing the character we don't need to print any more spaces
                        break
                    }
                    print(" ", terminator: "")
                }
            }
            print() //Go to next row
        }
        print() //Go to next line after finishing
    }
    
    //Initializer
    init (size: Int, border: Character = "X", fill: Character = "*") {
        //If size is less than min then set as min, if it's higher than max then set as max
        self.size = min(max(size, 3), 37)
        if let borderASCII = border.asciiValue { //Verify if character is not nil
            self.border = borderASCII >= 33 && borderASCII <= 126 ? border : "X" //Check character is accepted
        } else {
            self.border = "X"
        }
        if let fillASCII = fill.asciiValue { //Verify is character is nil
            self.fill = fillASCII >= 33 && fillASCII <= 126 ? fill : "*" //Check character is accepted
        } else {
            self.fill = "*"
        }
    }
}
