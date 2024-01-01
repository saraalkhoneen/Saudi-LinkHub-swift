//
//  sara_pagesApp.swift
//  sara pages
//
//  Created by sara alkhoneen on 12/06/1445 AH.
//
import SwiftUI

@main
struct sara_pagesApp: App {
    @AppStorage("onboardingCompleted") var onboardingCompleted: Bool = false

   
    var body: some Scene {
        WindowGroup {
            if onboardingCompleted {
                MainTabView()
            } else {
                Onboarding1View(onboardingCompleted: $onboardingCompleted)
            }
        }
    }
}
