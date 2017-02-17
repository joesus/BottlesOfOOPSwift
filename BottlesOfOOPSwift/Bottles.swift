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
        let bottleNumber = BottleNumber.bottleNumber(for: number)

        return "\(bottleNumber) of beer on the wall, ".capitalizingFirstLetter() +
            "\(bottleNumber) of beer.\n" +
            "\(bottleNumber.action()), " +
            "\(bottleNumber.successor()) of beer on the wall.\n"
    }
}

protocol BottleNumerable {
    var number: Int { get set }
    func successor() -> BottleNumerable
    func action() -> String
}

class BottleNumber: BottleNumerable, CustomStringConvertible {

    var number: Int

    var description: String {
        return "\(quantity()) \(container())"
    }

    init(_ number: Int) {
        self.number = number
    }

    static func bottleNumber(for number: Int) -> BottleNumerable {
        switch number {
        case 0:
            return BottleNumber0(number)
        case 1:
            return BottleNumber1(number)
        case 6:
            return BottleNumber6(number)
        default:
            return BottleNumber(number)
        }
    }

    func container() -> String {
        return "bottles"
    }

    func pronoun() -> String {
        return "one"
    }

    func quantity() -> String {
        return "\(number)"
    }

    func action() -> String {
        return "Take \(pronoun()) down and pass it around"
    }

    func successor() -> BottleNumerable {
        return BottleNumber.bottleNumber(for: number - 1)
    }
}

class BottleNumber0: BottleNumber {
    override func quantity() -> String {
        return "no more"
    }

    override func action() -> String {
        return "Go to the store and buy some more"
    }

    override func successor() -> BottleNumerable {
        return BottleNumber.bottleNumber(for: 99)
    }
}

class BottleNumber1: BottleNumber {
    override func container() -> String {
        return "bottle"
    }

    override func pronoun() -> String {
        return "it"
    }
}

class BottleNumber6: BottleNumber {
    override func quantity() -> String {
        return "1"
    }

    override func container() -> String {
        return "six-pack"
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
}
