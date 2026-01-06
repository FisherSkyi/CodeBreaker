//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by SKY on 6/1/26.
//

import Foundation

struct CodeBreaker {
    var masterCode: Code
    var guess: Code
    var attempts: [Code]
    var pegChoice: [Peg]
    
    mutating
}

struct Code {
    var kind: Kind
    var pegs: [Peg]
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}
