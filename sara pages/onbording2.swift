//
//  onbording2.swift
//  sara pages
//
//  Created by sara alkhoneen on 19/06/1445 AH.
//
import SwiftUI

struct NextView: View {
    @Binding var onboardingCompleted: Bool

    var body: some View {
        VStack {
            Image("onb1")
                .resizable()
                .scaledToFit()
                .frame(width: 370.0, height: 250.0)
                .padding(.top, 20)
            
            Text("Connect With Local Marketing Companies Easily And Confidently")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            Button(action: {
                // Set onboardingCompleted to true to switch to MainTabView
                onboardingCompleted = true
            }) {
                Text("Get Started")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 46/255, green: 60/255, blue: 45/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            .padding(.bottom, 20)

            // Page indicator dots
            HStack(spacing: 12) {
                ForEach(0..<2, id: \.self) { index in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(index == 1 ? .black : .gray)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NextView_Previews: PreviewProvider {
    static var previews: some View {
        NextView(onboardingCompleted: .constant(false))
    }
}
