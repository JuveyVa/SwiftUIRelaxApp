//
//  MainView.swift
//  RelaxApp
//
//  Created by ITIT on 06/03/25.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.primary
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            ChatView().tabItem {
                Label("Chat", systemImage: "message")
            }
            ExcercisesView().tabItem {
                Label("Excercises", systemImage: "person.circle")
            }
            CalendarView().tabItem {
                Label("Calendar", systemImage: "calendar")
            }
            NotificationView().tabItem {
                Label("Notification", systemImage: "bell")
            }
        }.accentColor(Color.button)
    }
}

#Preview {
    MainView()
}
