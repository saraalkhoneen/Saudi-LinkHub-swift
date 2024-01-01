//
//  ContentView.swift
//  sara pages
//
//  Created by sara alkhoneen on 12/06/1445 AH.
//
import SwiftUI
import CoreGraphics

// Extension for using hex colors
extension Color {
    init(hexColor: String) {
        let hex = hexColor.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct TypewriterText: ViewModifier {
    var delay: Double
    @State private var isVisible = false

    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0)
            .offset(y: isVisible ? 0 : 20)
            .onAppear {
                withAnimation(.easeOut(duration: 1).delay(delay)) {
                    self.isVisible = true
                }
            }
    }
}

extension View {
    func typewriterEffect(delay: Double) -> some View {
        self.modifier(TypewriterText(delay: delay))
    }
}

struct InvestmentView: View {
    var body: some View {
        ScrollView {
            VStack {
                GlobeView()
                    .frame(height: 300)
                content
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Saudi Arabian culture combines historical heritage, Islamic traditions, and family values with elements like traditional dances, Arabic language, and hospitable cuisine, reflecting a diverse society.")
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 3)
                .typewriterEffect(delay: 0.5)
            
            ForEach(0..<quotes.count, id: \.self) { index in
                let quote = quotes[index]
                quoteBlock(text: quote.text, author: quote.author, alignment: index % 2 == 0 ? .leading : .trailing, backgroundColor: index % 2 == 0 ? Color(hexColor: "2C3E50") : Color(hexColor: "B08E6C"))
                    .typewriterEffect(delay: 0.75 + Double(index) * 0.25)
            }
        }
        .padding()
    }

    var quotes: [(text: String, author: String)] {
        [
            ("Our country has great investment capabilities, and we will seek to be our economic engine. Welcome to our country, and this is our second success factor", "Mohammed bin Salman"),
            ("We are not just opening the economy. We are restructuring the economy and making it more competitive.", "Mohammed bin Salman"),
            ("Investing in Saudi Arabia was successful thanks to a favorable environment, government support, and transparent policies, amidst economic stability and diversification initiative.", "Alexander Harrison"),
            ("Enjoyed rich culture and hospitality, both enhancing professional and cultured experience. Positive impact on personal and social aspects through interactions with locals and understanding their traditions.", "Lauren Cooperman")
        ]
    }

    func quoteBlock(text: String, author: String, alignment: HorizontalAlignment, backgroundColor: Color) -> some View {
        HStack {
            if alignment == .trailing {
                Spacer()
            }
            
            VStack(alignment: alignment) {
                Text(text)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(10)
                
                Text(author)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding([.leading, .bottom])
            }
            
            if alignment == .leading {
                Spacer()
            }
        }
    }
}

struct GlobeView: View {
    @State private var waveOffset = CGSize.zero
    let animation = Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)
    
    var body: some View {
        GeometryReader { geometry in
            Image("globe") // Ensure this image is in your assets
                .resizable()
                .scaledToFit()
                .frame(width: geometry.size.width, height: 300)
                .offset(y: waveOffset.height)
                .onAppear {
                    withAnimation(self.animation) {
                        self.waveOffset = CGSize(width: 0, height: 20)
                    }
                }
        }
    }
}

struct InvestmentView_Previews: PreviewProvider {
    static var previews: some View {
        InvestmentView()
    }
}
