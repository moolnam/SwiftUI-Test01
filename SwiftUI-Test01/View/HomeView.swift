//
//  HomeView.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
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
                    }
                    Text("""
                    즐거운 명상 중.. 즐거운 명상 중..
                    즐거운 명상 중.. 즐거운 명상 중..
                    """)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        self.isOnboardingViewActive = true
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
                    
                    
//                    Button(action: {
//                        self.isOnboardingViewActive = true
//                    }, label: {
//                        Text("처음으로")
//                    })
                }
            }
        } // ZStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
