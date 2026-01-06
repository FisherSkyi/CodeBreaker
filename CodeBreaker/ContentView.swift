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
            pegs(colors: [Color.red, .green, .yellow])
            pegs(colors: [.blue, .red, .yellow])
            pegs(colors: [.red, .green, .blue])
        }
        .padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 20)
                    .aspectRatio(10/3, contentMode: .fit)
                    .foregroundStyle(colors[index])
                    .opacity(0.5)
            }
            MatchMarker(matches: [.exact, .inexact, .nomatch, .exact])
        }
    }
}



#Preview {
    ContentView()
}
