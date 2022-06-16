//
//  HomeView.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
        ZStack {
            Color("Home Color")
                .ignoresSafeArea(.all)
            VStack {
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        CircleGroupView(shapeColor: .white, shapeOpacity: 0.5)
                        Image("character-2")
                            .resizable()
                            .scaledToFit()
                            .opacity(isAnimating ? 1 : 0)
                            .offset(x: isAnimating ? 0 : 40)
                            .animation(.easeIn(duration: 1), value: isAnimating)
                    }
                    Text("""
                    즐거운 명상 중.. 즐거운 명상 중..
                    즐거운 명상 중.. 즐거운 명상 중..
                    """)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            self.isOnboardingViewActive = true
                            playSound(sound: "success", type: "m4a")
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "repeat.circle")
                                .font(.largeTitle)
                            Text("처음으로")
                                .font(.system(size: 30))
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeIn(duration: 0.5), value: isAnimating)
                    
                    
//                    Button(action: {
//                        self.isOnboardingViewActive = true
//                    }, label: {
//                        Text("처음으로")
//                    })
                }
            }
        } // ZStack
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
