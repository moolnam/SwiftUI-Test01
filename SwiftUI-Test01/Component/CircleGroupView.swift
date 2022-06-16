//
//  CircleGroupView.swift
//  SwiftUI-Test01
//
//  Created by KimJongHee on 2022/06/15.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 50)
                .frame(width: 300, height: 300, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 50)
                .frame(width: 250, height: 250, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear() {
            self.isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Onboading Color")
                .edgesIgnoringSafeArea(.all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.5)
        }
    }
}
