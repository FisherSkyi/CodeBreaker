//
//  ContentView.swift
//  Assignment0
//
//  Created by SKY on 31/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            pegs(colors: [Color.red, .green, .yellow, .blue])
            pegs(colors: [.blue, .red, .yellow, .blue])
            pegs(colors: [.red, .green, .blue, .red])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[index])
            }
            MatchMarker(matches: [.exact, .inexact, .nomatch, .exact])
        }
    }
}



#Preview {
    ContentView()
}
