//
//  CompanyView.swift
//  sara pages
//
//  Created by sara alkhoneen on 18/06/1445 AH.
//
import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Companies")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                    .padding(.leading) // Align to the left
                
                SearchBar(text: .constant(""))
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(CompanyData.all.indices, id: \.self) { index in
                            if index == 0 {
                                NavigationLink(destination: CompanyInfo()) {
                                    CompanyCard(company: CompanyData.all[index], showImage: index == 1, showFirstImage: index == 0, showFourthImage: index == 2, showFifthImage: index == 3, showSixthImage: index == 4)
                                }
                            } else {
                                CompanyCard(company: CompanyData.all[index], showImage: index == 1, showFirstImage: index == 0, showFourthImage: index == 2, showFifthImage: index == 3, showSixthImage: index == 4)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
              
            }
            .background(Color(UIColor.systemGroupedBackground))
            .navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search...", text: $text)
        }
        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CompanyCard: View {
    let company: Company
    let showImage: Bool
    let showFirstImage: Bool
    let showFourthImage: Bool
    let showFifthImage: Bool
    let showSixthImage: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 46/255, green: 60/255, blue: 45/255))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 4)
            
            HStack {
                if showFirstImage {
                    Image("ways2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if showImage {
                    Image("merkai")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if showFourthImage {
                    Image("right_click")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if showFifthImage {
                    Image("Jazyl")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if showSixthImage {
                    Image("Rabeez")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image(systemName: "square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(company.name)
                        .font(.headline)
                        .foregroundColor(.white) // Set text color to black
                    
                    Text(company.service)
                        .font(.subheadline)
                        .foregroundColor(.gray) // Set text color to gray
                    
                    HStack {
                        ForEach(0..<company.rating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                
                }
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(15)
    }
}

struct TabBarButton: View {
    var imageName: String
    var text: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .frame(width: 25, height: 25)
            Text(text)
                .font(.caption)
        }
    }
}

// ExploreView
struct ExploreView: View {
    var body: some View {
        Text("Explore")
    }
}

// Sample data model for companies
struct Company: Hashable {
    var logo: String
    var name: String
    var service: String
    var rating: Int
}

// Sample data
extension CompanyData {
    static let all = [
        Company(logo: "ways", name: "ways", service: "Marketing solutions", rating: 5),
        Company(logo: "merkai", name: "merkai", service: "Digital marketing", rating: 4),
        Company(logo: "rightclick", name: "right click", service: "Digital marketing", rating: 4),
        Company(logo: "jazyl", name: "Jazyl", service: "Creative content", rating: 4),
        Company(logo: "rabeez", name: "RABEEZ", service: "Brand Strategy", rating: 4)
    ]
}

struct CompanyDetailsView: View {
    let company: Company
    
    var body: some View {
        // Your detailed view for the company goes here
        Text("Details for \(company.name)")
    }
}

struct CompanyData {}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
