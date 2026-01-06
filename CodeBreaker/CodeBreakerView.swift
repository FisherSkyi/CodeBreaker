//
//  CodeBreakerView.swift
//  Assignment0
//
//  Created by SKY on 31/12/25.
//

import SwiftUI

struct CodeBreakerView: View {
    // `@State` create a State Class
    @State var game = CodeBreaker()
    
    var body: some View {
        VStack{
            view(for: game.masterCode)
            view(for: game.guess)
            Divider()
            ScrollView {
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    view(for: game.attempts[index])
                }
               
            }
        }
        .padding()
    }
    
    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
            }
        }.font(.system(size: 80)).minimumScaleFactor(0.1)
    }
    
    // Note there should never be mutating function in View
    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .overlay {
                        if code.pegs[index] == Code.missing {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.gray)
                        }
                    }
                    .contentShape(Rectangle())
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(code.pegs[index])
                    .onTapGesture {
                        if code.kind == Code.Kind.guess {
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
            MatchMarker(matches: code.matches)
                .overlay {
                    if code.kind == .guess {
                        guessButton
                    }
                }
        }
    }
}



#Preview {
    CodeBreakerView()
}
