//
//  File.swift
//  sara pages
//
//  Created by sara alkhoneen on 14/06/1445 AH.
//
import SwiftUI

struct ChatDetailView: View {
    @State private var messageText = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            )
                        Text("Welcome! Embracing Vision 2030's dynamic market, we're the first local firm offering 360 marketing solutions. Let's drive your growth together in this new era!")
                            .padding()
                            .background(Color(hex: "2C3E50")) // Assuming this extension is defined elsewhere
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                }
            }

            Spacer()

            // Message input field
            HStack {
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: sendMessage) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .padding()
            }
        }
        .navigationBarTitle("Ways Marketing Solutions", displayMode: .inline)
      
    }

    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
        }
    }

    func sendMessage() {
        // Handle the message send action
        print("Message sent: \(messageText)")
        messageText = "" // Clear the input field
    }
}

struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatDetailView()
        }
    }
}
