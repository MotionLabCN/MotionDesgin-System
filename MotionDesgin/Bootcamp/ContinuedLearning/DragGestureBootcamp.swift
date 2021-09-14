//
//  DragGestureBootcamp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
             
            
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmout()))
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        })
            )
            
            
        }
        
    }
    
    
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAuount = abs(offset.width)
        let percentage = currentAuount / max
        return 1 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmout() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAuount = offset.width
        let percentage = currentAuount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}



struct DragGestureBootcamp2: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                Image(systemName: "chevron.up")
                 
            }
        }
    }
}
