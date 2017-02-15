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

    static func verse(_ number: Int) -> String {
        let bottleNumber = BottleNumber(number)
        let nextBottle = BottleNumber(bottleNumber.successor())

        return "\(String(bottleNumber.quantity().characters.prefix(1)).capitalized + String(bottleNumber.quantity().characters.dropFirst())) \(bottleNumber.container()) of beer on the wall, " +
            "\(bottleNumber.quantity()) \(bottleNumber.container()) of beer.\n" +
            "\(bottleNumber.action()), " +
            "\(nextBottle.quantity()) \(nextBottle.container()) of beer on the wall.\n"
    }
}

class BottleNumber {

    var number: Int

    init(_ number: Int) {
        self.number = number
    }

    func container() -> String {
        switch number {
        case 1:
            return "bottle"
        default:
            return "bottles"
        }
    }

    func pronoun() -> String {
        if number == 1 {
            return "it"
        }
        return "one"
    }

    func quantity() -> String {
        if number == 0 {
            return "no more"
        }
        return "\(number)"
    }

    func action() -> String {
        if number == 0 {
            return "Go to the store and buy some more"
        }
        return "Take \(pronoun()) down and pass it around"
    }

    func successor() -> Int {
        if number == 0 {
            return 99
        }
        return number - 1
    }
}
