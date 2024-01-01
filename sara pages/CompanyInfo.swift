//
//  CompanyInfo.swift
//  sara pages
//
//  Created by sara alkhoneen on 18/06/1445 AH.
//
import SwiftUI

struct CompanyInfo: View {
    @State private var offset: CGFloat = 0 // Track scrolling position
    @State private var showButtons = false // State to control button visibility
    @State private var selection = 0 // Track tab selection
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    // Page title
                    Text("OverView")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 10) // Decrease top padding
                        .padding(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading) // Align title to the left
                }
                
                Divider() // Divider line
                
                // Gray border with increased width
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 300, height: 200) // Increased width
                        .padding()
                    
                    Image("ways2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 180) // Adjust image size as needed
                        .cornerRadius(10)
                }
                // Company name centered below the gray-bordered box
                Text("Ways Marketing Solutions")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 5) // Decrease top padding
                
                // ScrollView for lengthy company information
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        // Ways company details
                        Text("Ways is one of the top marketing solutions company based in the kingdom of Saudi Arabia. It is well known for providing diversified marketing services such as, market research, social media management, PR and Influencers, digital marketing, creative concepts and other solutions. Ways has experience in every industry within the kingdom and some of the highlights would be retail, banking, pharmaceuticals, real estate, food and beverage as well as the government sector.\n\nWe have been able to reach a high position among the companies of the Kingdom and have been able to establish a base of relations with major companies. Ways is a marketing company providing services and marketing solutions in all fields.\n\nWebsite\nwww.waysmarketingsolutions.com\n\nIndustry\nMarketing Services\n\nCompany size\n201-500 employees\n230 associated members LinkedIn members who’ve listed Ways Marketing Solutions as their current workplace on their profile.\n\nFounded\n2016\n\nSpecialties\nMarketing, Graphic Design, Social Media, Digital Marketing, Visual Production, and Public Relations")
                            .font(.body)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .onAppear {
                                // Show buttons when the text appears completely
                                showButtons = true
                            }
                    }
                    .offset(y: offset) // Apply scrolling offset
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offset = value.translation.height
                            }
                            .onEnded { _ in
                                offset = 0
                            }
                    )
                }
                
                // Buttons displayed after reading the text
                if showButtons {
                    HStack(spacing: 20) {
                        Spacer()
                        
                        // Navigate to SignUpView on bookmark button press
                        NavigationLink(destination: SignUpView()) {
                            Image(systemName: "bookmark")
                                .foregroundColor(.white)
                                .frame(width: 120, height: 40)
                                .background(Color(red: 46/255, green: 60/255, blue: 45/255))
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                        
                        // Navigate to ChatDetailView on bubble.right button press
                        NavigationLink
                        {
                            ChatDetailView()
                        }
                        label :{
                            Image(systemName: "bubble.right")
                                .foregroundColor(.white)
                                .frame(width: 120, height: 40)
                                .background(Color(red: 46/255, green: 60/255, blue: 45/255))
                                .cornerRadius(10)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
    
}

              struct CompanyInfo_Previews: PreviewProvider {
                  static var previews: some View {
                      CompanyInfo()
                  }
              }
