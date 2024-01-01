import SwiftUI

struct ChatDetailView: View {
    @State private var messageText = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Welcome! Embracing Vision 2030's dynamic market, we're the first local firm offering 360 marketing solutions. Let's drive your growth together in this new era!")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Ways Marketing Solutions")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
            })

            Spacer()

            // Message input field
            HStack {
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: sendMessage) {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
            .padding()
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
