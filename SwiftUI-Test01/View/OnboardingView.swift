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
    
    var body: some View {
        ZStack {
            
            Color("Launch Screen")
                .ignoresSafeArea(.all)
            
            VStack {
                
                VStack {
                    
                    Text("Share")
                        .font(.system(size: 60))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("""
                    나의 사랑을 받아랏!
                    나의 사랑을 받아랏!
                    """)
                } // VStack
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                
                ZStack {
                    ZStack {
                        CircleGroupView(shapeColor: .white, shapeOpacity: 0.5)
                        Image("character-1")
                            .resizable()
                            .scaledToFit()
                    }
                } // ZStack
                
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                        .padding()
                    HStack {
                        Capsule()
                            .fill(Color.red.opacity(0.7))
                            .frame(width: 100, height: 100, alignment: .center)
                        Spacer()
                    }
                    Text("시작하기")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.red.opacity(0.8))
                            
                            Circle()
                                .fill().opacity(0.2)
                                .padding()
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 50))
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
                                })
                        Spacer()
                    }
                } // ZStack
                .frame(width: buttonWidth, height: 100, alignment: .center)
                .padding(.horizontal, 20)
            } // VStack
        } // ZStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
