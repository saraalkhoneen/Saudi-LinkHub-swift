import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingSignUp: Bool = false

    var body: some View {
        VStack {
            //Spacer()
            // Replace "logo-placeholder" with your actual logo image asset name
            Image("LOGO")
                .resizable()
                .scaledToFit()
                //.frame(height: 120)
                //.padding(.bottom, 50)

            CustomTextField(iconName: "person.fill", placeholder: "username", text: $username)

            CustomSecureField(iconName: "lock.fill", placeholder: "password", text: $password)

            Button(action: signIn) {
                Text("sign in")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "2E3C2D")) // The dark green color
                    .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.top, 20)

            Spacer()
            
            Button(action: {
                isShowingSignUp = true
            }) {
               
            }
            .padding(.bottom, 20)

            NavigationLink("", destination: SignUpView(), isActive: $isShowingSignUp)
        }
        .padding()
        .navigationBarHidden(true)
    }

    func signIn() {
        // Implement your sign-in logic here
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
