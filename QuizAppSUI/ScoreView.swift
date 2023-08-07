//
//  ScoreView.swift
//  QuizAppSUI
//
//  Created by shafique dassu on 07/08/2023.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    var body: some View {
        VStack {
            Text("Your Score is \(score) / 3")
        }
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 2)
    }
}
