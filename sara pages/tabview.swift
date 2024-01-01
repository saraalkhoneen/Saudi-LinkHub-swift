//
//  tabview.swift
//  sara pages
//
//  Created by sara alkhoneen on 18/06/1445 AH.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Companies Tab")
                .tabItem {
                    Label("Companies", systemImage: "building.2")
                }

            Text("explore Tab")
                .tabItem {
                    Label("Explor", systemImage: "globe.americas")
                    
                }
                .ChatView()
                .tabItem {
                    Label("Chat", systemImage: "bubble.left.and.bubble.right")
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
