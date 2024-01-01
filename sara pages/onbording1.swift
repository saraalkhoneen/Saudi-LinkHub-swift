//
//  onbording1.swift
//  sara pages
//
//  Created by sara alkhoneen on 19/06/1445 AH.
//
import SwiftUI

struct Onboarding1View: View {
    @Binding var onboardingCompleted: Bool
    @State private var isAnimating = false
    @State private var showNextView = false

    var body: some View {
        VStack {
            Image("key")
                .resizable()
                .scaledToFit()
                .frame(width: 210, height: 200)
                .padding()
                .offset(x: isAnimating ? -50 : -70, y: isAnimating ? -50 : -70)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                .onAppear {
                    isAnimating = true
                }

            Image("onb2") // Second image
                .resizable()
                .frame(width: 250.0, height: 250.0)
                .offset(x: 0, y: -80)

            Text("Discover The Investment Culture Keys To Success In Saudi Arabia")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .multilineTextAlignment(.center)
                .padding()
                .offset(y: -70)

            Button(action: {
                showNextView = true
            }) {
                Text("Next")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .offset(x: 0, y: -50)

            HStack {
                ForEach(0..<2, id: \.self) { _ in
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.gray)
                        .padding(2)
                        .offset(x: 0, y: -150)
                }
            }
        }
        .fullScreenCover(isPresented: $showNextView) {
            NextView(onboardingCompleted: $onboardingCompleted)
        }
    }
}

struct Onboarding1View_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1View(onboardingCompleted: .constant(false))
    }
}
