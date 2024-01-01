//
//  page2.swift
//  sara pages
//
//  Created by sara alkhoneen on 12/06/1445 AH.
//
import SwiftUI

// Extension to allow initialization of Color with hex values
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ChatView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(chatData) { chat in
                        ChatRow(chat: chat)
                    }
                }
                .padding()
            }
            
            .navigationTitle("Chat")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "magnifyingglass")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis.circle")
                }
            }
            .background(Color("Background")) 
        }
    }
}

struct ChatRow: View {
    var chat: Chat

    var body: some View {
        HStack {
            Image(chat.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))

            VStack(alignment: .leading) {
                Text(chat.name)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(chat.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)

            Spacer()
        }
        .padding()
        .background(Color(hex: "2C3E50"))
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color(hex: "2C3E50"), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let lastMessage: String
    let imageName: String
}

// Sample data for the list
let chatData = [
    Chat(name: "Ways M Solutions", lastMessage: "Last message", imageName: "ways2"),
    Chat(name: "Merkai", lastMessage: "Last message", imageName: "merkai"),
    Chat(name: "Right Click", lastMessage: "Last message", imageName: "right_click"),
    Chat(name: "JazyI", lastMessage: "Last message", imageName: "Jazyl"),
    Chat(name: "Rabeez", lastMessage: "Last message", imageName: "Rabeez")
    
]

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
