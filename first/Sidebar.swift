import Foundation
import SwiftUI

struct Sidebar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SearchListView()) {
                    Label("Задание 1", systemImage: "list.bullet")
                }
                NavigationLink(destination: MaterialView()) {
                    Label("Задание 2", systemImage: "moon.stars")
                }
                NavigationLink(destination: AdvancedAnimationView()) {
                    Label("Задание 3", systemImage: "sparkles")
                }
                NavigationLink(destination: UniqueBatteryWidgetView()) {
                    Label("Задание 4", systemImage: "battery.100")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Задания")
            
            
            Text("Выберите задание")
                .foregroundColor(.secondary)
        }
    }
}
