import SwiftUI


struct BatteryIndicator: View {
    let deviceName: String
    let batteryLevel: Double
    let iconName: String
    let isCharging: Bool

    @State private var isPulsing: Bool = false

    var batteryColor: Color {
        switch batteryLevel {
        case 0.7...1.0:
            return .green
        case 0.3..<0.7:
            return .yellow
        default:
            return .red
        }
    }
    
    var batteryPercentage: String {
        "\(Int(batteryLevel * 100))%"
    }
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: iconName)
                .font(.system(size: 40))
                .foregroundColor(.white)
                .frame(width: 50)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(deviceName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white.opacity(0.3))
                        .frame(width: 150, height: 10)
                    RoundedRectangle(cornerRadius: 5)
                        .fill(batteryColor)
                        .frame(width: CGFloat(batteryLevel) * 150, height: 10)
                        .animation(.easeInOut(duration: 1), value: batteryLevel)
                }
                
                Text(batteryPercentage)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .background(
            Group {
                if isCharging {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(batteryColor, lineWidth: 4)
                        .scaleEffect(isPulsing ? 1.1 : 1.0)
                        .opacity(isPulsing ? 0.7 : 1.0)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                isPulsing = true
                            }
                        }
                } else {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.black.opacity(0.3))
                }
            }
        )
    }
}


struct UniqueBatteryWidgetView: View {
    let iPhoneBattery: Double = 0.85
    let watchBattery: Double = 0.55
    let airPodsBattery: Double = 0.20

    @State private var isCharging: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Battery Status")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(.top)
            
            BatteryIndicator(deviceName: "iPhone", batteryLevel: iPhoneBattery, iconName: "iphone", isCharging: isCharging)
            BatteryIndicator(deviceName: "Apple Watch", batteryLevel: watchBattery, iconName: "applewatch", isCharging: isCharging)
            BatteryIndicator(deviceName: "AirPods", batteryLevel: airPodsBattery, iconName: "headphones", isCharging: isCharging)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    isCharging.toggle()
                }
            }) {
                Text(isCharging ? "Charging..." : "Charge")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
            }
            .padding(.bottom, 10)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
            .shadow(radius: 10)
        )
        .frame(width: 300, height: 500)
    }
}

