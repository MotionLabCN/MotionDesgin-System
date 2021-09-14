//
//  RotationGestureBootcamp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged({ value in
                        angle = value
                    })
                    .onEnded({ value in
                        withAnimation {
                            angle = Angle(degrees: 0)
                        }
                    })
            )
        
//        Text("angle: \(angle.degrees)    lastAmount:  ")
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}
