import SwiftUI

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
