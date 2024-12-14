//
//  ContentView.swift
//  swiftschedule
//
//  Created by artem alanov on 16.11.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            ScheduleSidebar()
        } detail: {
            ScheduleView()
        }
    }
}

#Preview {
    ContentView()
}
