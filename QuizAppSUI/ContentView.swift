//
//  ContentView.swift
//  QuizAppSUI
//
//  Created by shafique dassu on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    @State var presentAlert = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    var body: some View {
        VStack {
            Image("lion")
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
            
            QuizButton(title: "Giraffe", presentAlert: $presentAlert, handler: {
                alertTitle = "Quiz Answer"
                alertMessage = "You got the wrong answer"
               
            })
                .padding(.top, 30)
            
            QuizButton(title: "Lion", presentAlert: $presentAlert, handler: {
                alertTitle = "Quiz Answer"
                alertMessage = "You got the right answer"
               
                score += 1
            })
            
            QuizButton(title: "Buffalo", presentAlert: $presentAlert, handler: {
                alertTitle = "Quiz Answer"
                alertMessage = "You got the wrong answer"
                
            })
            
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
            
        }
        .alert(alertTitle, isPresented: $presentAlert) {
            Button("OK", action: { })
        } message: {
            Text(alertMessage)
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
