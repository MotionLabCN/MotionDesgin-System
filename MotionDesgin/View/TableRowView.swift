//
//  TableRowView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI
import MotionComponents

struct MTTableRowPressedStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed
        configuration.label
            .overlay(
                Group {
                    if isPressed {
                        Color.red.opacity(0.4)
                    }
                }
            )
            .transition(AnyTransition.opacity)
//            .animation(.spring())
    }
}

struct MTTableRow: View {
    enum Style {
        case noraml, icon, textAndRight, none, text, toggle, bottomDesc, topDesc
    }
    
    
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                HStack {
                    Text("账号")
                    Spacer()
                    Image.mt.load(.Chevron_right_On)
                        .foregroundColor(.mt.gray_400)
                    
                }
                .padding()
                
                NavigationLink("", destination: Text(""))
                    .background(Color.red)
//                Color.red
            }
        })
        .buttonStyle(MTTableRowPressedStyle())
    }
    
}

struct TableRowView: View {
    var body: some View {
        VStack(spacing: 10.0, content: {
            MTTableRow()

        })
    }
}

struct TableRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TableRowView()
        }
    }
}
