//
//  TabView.swift
//  sara pages
//
//  Created by sara alkhoneen on 18/06/1445 AH.
//
import SwiftUI

// MainView with built-in TabView
struct MainView: View {
    var body: some View {
        TabView {
            CompaniesView()
                .tabItem {
                    Label("Companies", systemImage: "building.2")
                }

            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "globe.americas")
                }

            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.and.bubble.right")
                }
        }
    }
}

// Placeholder views for CompaniesView, ExploreView, and ChatView
struct CompaniesView: View {
    var body: some View {
        Text("Companies View Placeholder")
    }
}

struct ExploreView: View {
    var body: some View {
        Text("Explore View Placeholder")
    }
}

struct ChatView: View {
    var body: some View {
        Text("Chat View Placeholder")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
