//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by SKY on 6/1/26.
//

import SwiftUI

typealias Peg = Color

// Model
struct CodeBreaker {
    var masterCode = Code(kind: .master)
    var guess = Code(kind: .guess)
    var attempts: [Code] = []
    let pegChoice: [Peg]
    
    init(pegChoice: [Peg] = [.red, .green, .blue, .yellow]) {
        self.pegChoice = pegChoice // initializer is allowed to assign initial value of a `let`
        masterCode.randomize(from: pegChoice)
        print(masterCode)
    }
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoice.firstIndex(of: existingPeg) {
            let newPegIndex = (indexOfExistingPegInPegChoices + 1) % pegChoice.count
            let newPeg = pegChoice[newPegIndex]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoice.first ?? Code.missing
        }
    }
    
    mutating func attemptGuess() {
        var attempt = guess // value type
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
    }
}

struct Code {
    var kind: Code.Kind
    var pegs: [Peg] = Array(repeating: Code.missing, count: 4)
    
    static let missing = Peg.clear
    
    enum Kind: Equatable {
        case master
        case guess
        case attempt([Match])
        case unknown
    }
    
    mutating func randomize(from pegChoices: [Peg]) {
        for index in pegChoices.indices {
            pegs[index] = pegChoices.randomElement() ?? Code.missing
        }
    }
    
    var matches: [Match] {
        switch kind {
        // If kind is .attempt and it has an associated value, bind that value to a local constant named matches.
        case .attempt(let matches): return matches
        default: return []
        }
    }
    
    func match(against otherCode: Code) -> [Match] {
        return [.exact, .exact, .exact, .exact]
    }
}

