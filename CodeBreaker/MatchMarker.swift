//
//  MatchMarker.swift
//  Assignment0
//
//  Created by SKY on 3/1/26.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarker: View {
    var matches: [Match]
    
    var body: some View {
        HStack {
            VStack {
                matchmarker(peg: 0)
                matchmarker(peg: 1)
            }
            VStack {
                matchmarker(peg: 2)
                matchmarker(peg: 3)
            }
        }
    }
    
    func matchmarker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: { match in match == .exact})
        let foundCount: Int = matches.count(where: { match in match == .exact})
        return   Circle()
    }
}

#Preview {
    MatchMarker(matches: [.exact, .exact, .exact])
}
