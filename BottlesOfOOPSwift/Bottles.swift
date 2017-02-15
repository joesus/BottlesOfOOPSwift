//
//  Bottles.swift
//  BottlesOfOOPSwift
//
//  Created by Joesus on 2/13/17.
//  Copyright © 2017 Joesus. All rights reserved.
//

import Foundation

class Bottles {
    static var song: String {
        return verses(99, 0)
    }

    static func verses(_ end: Int, _ start: Int) -> String {
        return (start...end).reversed().map {
            verse($0)
            }.joined(separator: "\n")
    }

    static func container(_ number: Int) -> String {
        switch number {
        case 1:
            return "bottle"
        default:
            return "bottles"
        }
    }

    static func pronoun(_ number: Int) -> String {
        if number == 1 {
            return "it"
        }
        return "one"
    }

    static func quantity(_ number: Int = 0) -> String {
        if number == 0 {
            return "no more"
        }
        return "\(number)"
    }

    static func action(_ number: Int) -> String {
        if number == 0 {
            return "Go to the store and buy some more"
        }
        return "Take \(pronoun(number)) down and pass it around"
    }

    static func successor(_ number: Int) -> Int {
        if number == 0 {
            return 99
        }
        return number - 1
    }

    static func verse(_ number: Int) -> String {
        return "\(String(quantity(number).characters.prefix(1)).capitalized + String(quantity(number).characters.dropFirst())) \(container(number)) of beer on the wall, " +
            "\(quantity(number)) \(container(number)) of beer.\n" +
            "\(action(number)), " +
            "\(quantity(successor(number))) \(container(successor(number))) of beer on the wall.\n"
    }
}
