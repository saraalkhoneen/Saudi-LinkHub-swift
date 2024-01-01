//
//  MainTabView.swift
//  sara pages
//
//  Created by sara alkhoneen on 18/06/1445 AH.
//
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                ContentView()
            }
                    .tabItem {
                        Label("Companies", systemImage: "building")
                    }
                    .tag(0) // Unique identifier for this tab
          
            InvestmentView() // Replace with your view for the "Discover" tab
                .tabItem {
                    Label("Discover", systemImage: "globe.asia.australia")
                }
                .tag(1) // Unique identifier for this tab

            ChatView() // Assuming this is your view for the "Chat" tab
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.and.bubble.right.fill")
                }
                .tag(2) // Unique identifier for this tab
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
