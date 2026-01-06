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
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack {
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
        }
    }
    
    @ViewBuilder
    func matchMarker(peg: Int) -> some View {
        // in-line closure
        let exactCount = matches.count { $0 == .exact }
        let foundCount = matches.count { $0 != .nomatch }
        Circle()
            .fill(exactCount > peg ? .primary : Color.clear)
            .strokeBorder(foundCount > peg ? .primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    MatchMarker(matches: [.exact, .inexact, .nomatch, .inexact])
}
