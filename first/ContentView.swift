import SwiftUI

// first
struct SearchListView: View {
    @State private var searchText: String = ""
    @State private var items: [String] = ["Almaty", "Astana", "Los-Angeles", "New-York", "San-Francisco", "Tokyo", "Beijing", "Seoul", "Paris", "Berlin", "Rome", "London", "Madrid", "Barcelona", "Karaganda", "Shymkent"]
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Search...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            List(filteredItems, id: \.self) { item in
                Text(item)
                    .padding()
            }
            
            Button("Reset") {
                searchText = ""
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

// seoncd
import SwiftUI

struct MaterialView: View {
    @State private var isDarkMode = true
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            (isDarkMode ? Color.black : Color.white)
                .ignoresSafeArea()
            
            VStack {
                Text("Animation")
                    .font(.title)
                    .foregroundColor(isDarkMode ? .white : .black)
                
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                    .shadow(radius: 10)
                    .offset(y: yOffset)
                    .onTapGesture {
                        withAnimation(.interpolatingSpring(stiffness: 150, damping: 10)) {
                            yOffset = 100
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.spring()) {
                                yOffset = 0
                            }
                        }
                    }
                    .padding(.top, 50)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isDarkMode.toggle()
                    }
                }) {
                    Text("dark/light mode")
                        .font(.headline)
                        .foregroundColor(isDarkMode ? .black : .white)
                        .padding()
                        .background(isDarkMode ? Color.white : Color.black)
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                }
                .padding(.bottom, 30)
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
        TabView {
            SearchListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("first task")
                }
            
            MaterialView()
                .tabItem {
                    Image(systemName: "moon.stars")
                    Text("second task")
                }
        }
    }
}
