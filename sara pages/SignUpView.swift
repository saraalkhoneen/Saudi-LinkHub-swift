//
//  SignUpView.swift
//  sara pages
//
//  Created by sara alkhoneen on 14/06/1445 AH.
//
import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var selectedUserType: UserType = .none
    @State private var isShowingSignInView = false // State to control navigation to SignInView

    var body: some View {
        VStack (spacing: 20){
            Text("Almost there!")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("we are excited to continue with you!")
                .font(.headline)
                .foregroundColor(.secondary)
            
            VStack(spacing: 20) {
                CustomTextField(iconName: "person.fill", placeholder: "username", text: $username)
                    .padding(.horizontal)

                CustomTextField(iconName: "envelope.fill", placeholder: "Email", text: $email)
                    .padding(.horizontal)

                CustomSecureField(iconName: "lock.fill", placeholder: "password", text: $password)
                    .padding(.horizontal)

                CustomSecureField(iconName: "lock.fill", placeholder: "Confirm Password", text: $confirmPassword)
                    .padding(.horizontal)
                
                HStack (spacing: 40) {
                    ChoiceButton(title: "Investor", isSelected: selectedUserType == .investor) {
                        selectedUserType = .investor
                    }
                    //Spacer()
                    ChoiceButton(title: "Company", isSelected: selectedUserType == .company) {
                        selectedUserType = .company
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)

            Button(action: signUp) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "2E3C2D")) // Dark green color
                    .cornerRadius(25)
            }
            .padding()

            //Spacer()

            HStack {
                Text("already have an account?")
                Button(action: {
                    isShowingSignInView = true // Trigger navigation to SignInView
                }) {
                    Text("sign in")
                        .fontWeight(.semibold)
                }
            }
            .foregroundColor(.secondary)
            .padding()
        }
        .padding()
        .sheet(isPresented: $isShowingSignInView) {
            SignInView() // Present SignInView
        }
    }

    func signUp() {
        // Implement sign up logic
    }

    func signIn() {
        // Implement sign in logic (now handled by the isShowingSignInView state)
    }
}

struct CustomTextField: View {
    var iconName: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .cornerRadius(12)
            .padding(.horizontal, 40)
            .overlay(HStack {
                Image(systemName: iconName)
                    .foregroundColor(.gray)
                    .padding(.leading)
                Spacer()
            })
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.2))) // Light gray background
    }

}

struct CustomSecureField: View {
    var iconName: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        SecureField(placeholder, text: $text)
            .padding()
            .cornerRadius(12)
            .padding(.horizontal, 40)
            .overlay(HStack {
                Image(systemName: iconName)
                    .foregroundColor(.gray)
                    .padding(.leading)
                Spacer()
            })
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.2))) // Light gray background
    }
}

struct ChoiceButton: View {
    let title: String
    var isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                Text(title)
            }
            .foregroundColor(isSelected ? Color(hex: "2E3C2D") : .secondary)
        }
    }
}

enum UserType {
    case investor, company, none
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
