//
//  ScheduleSidebar.swift
//  swiftschedule
//
//  Created by artem alanov on 16.11.2024.
//

import SwiftUI

struct ScheduleSidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: ScheduleView()){
                Label("Расписание", systemImage: "calendar")
            }
            //other
        }
        .safeAreaInset(edge: .bottom) {
            NavigationLink(destination: OptionsView()){
                Label("Настройки", systemImage: "gear")
            }
            .tint(Color(.controlAccentColor))
            .padding(.vertical, 10)
            .padding(.horizontal, 17)
            .frame(maxWidth: .infinity, alignment: .leading)
            .buttonStyle(.borderless)
        }
        .navigationTitle("Menu")
    }
}

#Preview {
    ScheduleSidebar()
}
