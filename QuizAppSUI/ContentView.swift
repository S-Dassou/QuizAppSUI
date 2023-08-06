//
//  ContentView.swift
//  QuizAppSUI
//
//  Created by shafique dassu on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("lion")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
            
            HStack{
                Spacer()
                Text("Score")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.trailing, 20)
                    .padding(.top, 15)
            }
            
            Button {
            } label: {
                Text("Giraffe")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 45)
            .background(Color.green)
            .cornerRadius(8)
            .padding(.horizontal, 25)
            .padding(.top, 30)
            
            Button {
            } label: {
                Text("Lion")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 45)
            .background(Color.green)
            .cornerRadius(8)
            .padding(.horizontal, 25)
            .padding(.top, 10)
            
            Button {
            } label: {
                Text("Buffalo")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 45)
            .background(Color.green)
            .cornerRadius(8)
            .padding(.horizontal, 25)
            .padding(.top, 10)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
