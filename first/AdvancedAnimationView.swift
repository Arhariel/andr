import SwiftUI

struct AdvancedAnimationView: View {
    @State private var currentImageIndex = 0
    @State private var isAnimatingIcon = false
    @State private var scaleEffectValue: CGFloat = 1.0
    
    @State private var slideIn = false
    @State private var pulsate = false
    @State private var colorToggle = false
    @State private var rotationToggle = false
    
    let images = ["image1", "image2", "image3"]

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Group {
                    // Slide-In Animation
                    VStack {
                        Text("Slide-In Animation")
                            .font(.headline)
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 200, height: 100)
                            .offset(x: slideIn ? 0 : -UIScreen.main.bounds.width)
                            .animation(.easeOut(duration: 1), value: slideIn)
                            .onAppear {
                                slideIn = true
                            }
                    }
                    
                    // Pulsating Circle
                    VStack {
                        Text("Pulsating Circle")
                            .font(.headline)
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 100, height: 100)
                            .scaleEffect(pulsate ? 1.2 : 0.8)
                            .opacity(pulsate ? 0.5 : 1.0)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: pulsate)
                            .onAppear {
                                pulsate = true
                            }
                    }
                    
                    // Color Transition Animation
                    VStack {
                        Text("Color Transition")
                            .font(.headline)
                        Rectangle()
                            .fill(colorToggle ? Color.green : Color.red)
                            .frame(width: 200, height: 100)
                            .animation(.easeInOut(duration: 1), value: colorToggle)
                            .onTapGesture {
                                colorToggle.toggle()
                            }
                        Text("Нажмите на прямоугольник для смены цвета")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    // Combined Rotation & Offset Animation
                    VStack {
                        Text("Combined Rotation & Offset")
                            .font(.headline)
                        Image(systemName: "arrow.2.circlepath")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .rotationEffect(rotationToggle ? .degrees(360) : .degrees(0))
                            .offset(x: rotationToggle ? 50 : -50)
                            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: true), value: rotationToggle)
                            .onAppear {
                                rotationToggle = true
                            }
                    }
                }
                Group {
                    //Переход между изображениями
                    VStack {
                        Text("Переход между изображениями")
                            .font(.headline)
                        Image(images[currentImageIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .transition(.opacity)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1)) {
                                    currentImageIndex = (currentImageIndex + 1) % images.count
                                }
                            }
                        Text("Нажмите на изображение для смены")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    //Анимированная иконка приложения
                    VStack {
                        Text("Анимированная иконка")
                            .font(.headline)
                        Image(systemName: "app.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .rotationEffect(isAnimatingIcon ? .degrees(360) : .degrees(0))
                            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimatingIcon)
                            .onAppear {
                                isAnimatingIcon = true
                            }
                    }
                    
                    //Анимация масштабирования
                    VStack {
                        Text("Анимация масштабирования")
                            .font(.headline)
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaleEffect(scaleEffectValue)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0)) {
                                    scaleEffectValue = scaleEffectValue == 1.0 ? 1.5 : 1.0
                                }
                            }
                        Text("Нажмите на звезду для масштабирования")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                
                
            }
            .padding()
        }
    }
}

