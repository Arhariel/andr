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
