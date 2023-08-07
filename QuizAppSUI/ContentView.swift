//
//  ContentView.swift
//  QuizAppSUI
//
//  Created by shafique dassu on 04/08/2023.
//

import SwiftUI

struct Question {
    let questionImage: String
    let correctAnswer: Int
    let answer1: String
    let answer2: String
    let answer3: String
}

struct ContentView: View {
    
    @State var score = 0
    @State var presentAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var currentQuestionIndex = 0
    @State var showScore = false
    @State var questions: [Question] = [
        Question(questionImage: "lion", correctAnswer: 2, answer1: "Giraffe", answer2: "Lion", answer3: "Buffalo"),
        Question(questionImage: "giraffe", correctAnswer: 1, answer1: "Giraffe", answer2: "Lion", answer3: "Chicken"),
        Question(questionImage: "buffalo", correctAnswer: 3, answer1: "Bird", answer2: "Hyena", answer3: "Buffalo")
    ]
    
    var body: some View {
        VStack {
            Image(questions[currentQuestionIndex].questionImage)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
            
            HStack{
                Spacer()
                Text("Score = \(score)")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.trailing, 20)
                    .padding(.top, 15)
            }
            
            QuizButton(title: questions[currentQuestionIndex].answer1, presentAlert: $presentAlert, handler: {
               checkAnswer(selection: 1)
            })
                .padding(.top, 30)
            
            QuizButton(title: questions[currentQuestionIndex].answer2, presentAlert: $presentAlert, handler: {
               checkAnswer(selection: 2)
            })
                .padding(.top, 15)
            
            QuizButton(title: questions[currentQuestionIndex].answer3, presentAlert: $presentAlert, handler: {
                checkAnswer(selection: 3)
            })
            .padding(.top, 15)
            Spacer()
        }
        
        .sheet(isPresented: $showScore, onDismiss: {
            currentQuestionIndex = 0
            score = 0
        }, content: {
            ScoreView(score: score)
        })
        .alert(alertTitle, isPresented: $presentAlert) {
            Button("OK", action: {
                if questions.count - 1 == currentQuestionIndex {
                    showScore = true
                } else {
                    currentQuestionIndex += 1
                }
            })
        } message: {
            Text(alertMessage)
        }
    }

    func loadQuestion() {
        currentQuestionIndex += 1
    }
    
    func checkAnswer(selection: Int) {
        if questions[currentQuestionIndex].correctAnswer == selection {
            alertTitle = "Quiz Answer"
            alertMessage = "You got the right answer"
            score += 1
        } else {
            alertTitle = "Quiz Answer"
            alertMessage = "You got the wrong answer"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct QuizButton: View {
    
    let title: String
    @Binding var presentAlert: Bool
    var handler: () -> Void
    
    var body: some View {
        Button {
            handler()
            presentAlert = true
        
        } label: {
            Text(title)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 45)
        .background(Color.green)
        .cornerRadius(8)
        .padding(.horizontal, 25)
    }
}

//            Button {
//                alertTitle = "Quiz Answer"
//                alertMessage = "You got the wrong answer"
//                presentAlert = true
//            } label: {
//                Text("Giraffe")
//                    .font(.system(size: 15, weight: .semibold))
//                    .foregroundColor(Color.white)
//                    .frame(maxWidth: .infinity)
//            }
//            .frame(height: 45)
//            .background(Color.green)
//            .cornerRadius(8)
//            .padding(.horizontal, 25)
//            .padding(.top, 30)
//
//            Button {
//                alertTitle = "Quiz Answer"
//                alertMessage = "You got the right answer"
//                presentAlert = true
//                score += 1
//            } label: {
//                Text("Lion")
//                    .font(.system(size: 15, weight: .semibold))
//                    .foregroundColor(Color.white)
//                    .frame(maxWidth: .infinity)
//            }
//            .frame(height: 45)
//            .background(Color.green)
//            .cornerRadius(8)
//            .padding(.horizontal, 25)
//            .padding(.top, 10)
//
//            Button {
//                alertTitle = "Quiz Answer"
//                alertMessage = "You got the wrong answer"
//                presentAlert = true
//            } label: {
//                Text("Buffalo")
//                    .font(.system(size: 15, weight: .semibold))
//                    .foregroundColor(Color.white)
//                    .frame(maxWidth: .infinity)
//            }
//            .frame(height: 45)
//            .background(Color.green)
//            .cornerRadius(8)
//            .padding(.horizontal, 25)
//            .padding(.top, 10)
