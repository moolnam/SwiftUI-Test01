//
//  OnboardingView.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 100
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var arrowOpacity: Double = 1.0
    @State private var textChage: String = "Share"
    
    let hapticFeadback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            
            Color("Launch Screen")
                .ignoresSafeArea(.all)
            
            VStack {
                
                VStack {
                    Text(textChage)
                        .font(.system(size: 60))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .id(textChage)
                    Text("""
                    나의 사랑을 받아랏!
                    나의 사랑을 받아랏!
                    """)
                } // VStack
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.5)
                        .offset(x: imageOffset.width * -0.5)
                        .blur(radius: abs(imageOffset.width / 30))
                        .animation(.spring(response: 0.7, dampingFraction: 0.1, blendDuration: 0.1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: isAnimating ? 0 : 40)
                        .offset(x: imageOffset.width * 1.2)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 180 {
                                        imageOffset = gesture.translation
                                        withAnimation() {
                                            arrowOpacity = 0
                                            textChage = "Give"
                                        }
                                        
                                    }
                                    if abs(imageOffset.width) >= 170 {
                                        self.isOnboardingViewActive = false
                                        playSound(sound: "chimeup", type: "mp3")
                                    }
                                })
                                .onEnded({ gesture in
                                    imageOffset.width = .zero
                                    withAnimation() {
                                        arrowOpacity = 1
                                        textChage = "Share"
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 0.3), value: imageOffset)
                }
                .overlay(
                    Image(systemName: "person.and.arrow.left.and.arrow.right")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .blur(radius: abs(imageOffset.width) / 40)
                        .opacity(arrowOpacity)
                    ,alignment: .bottom
                )
                
                
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                        .padding()
                    
                    
                    Text("시작하기")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    HStack {
                        Capsule()
                            .fill(Color.red.opacity(0.5))
                            .frame(width: buttonOffset + 100)
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            
                            Circle()
                                .fill().opacity(0.8)
                                .padding()
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 50))
                                .foregroundColor(.blue)
                        }
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 100 {
                                        buttonOffset = gesture.translation.width
                                        
                                    }
                                }
                                .onEnded({ gesture in
                                    withAnimation(.easeOut(duration: 0.3)) {
                                        if buttonOffset >= buttonWidth / 2 {
                                            hapticFeadback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 100
                                            self.isOnboardingViewActive = false
                                        }
                                        else {
                                            hapticFeadback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                    
                                })
                        )
                        Spacer()
                    }
                } // ZStack
                .frame(width: buttonWidth, height: 100, alignment: .center)
                .padding(.horizontal, 20)
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
            } // VStack
        } // ZStack
        .onAppear() {
            self.isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
