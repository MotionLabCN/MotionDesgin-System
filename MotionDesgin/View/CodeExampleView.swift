//
//  CodeExampleView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI


//struct CodeExampleView<Content: View>: View {
struct CodeExampleView: View {
    
//    let content : Content
    let content : String

    
//    @inlinable public init(@ViewBuilder content: () -> Content)
//    init(@ViewBuilder content: () -> Content) {
//        self.content = content()
//    }
    
    var body: some View {
        VStack {
            Text("示例代码")
                .font(.mt.largeTitle.mtBlod())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(content)
                .foregroundColor(.pink)
                .font(.mt.body1)
                .frame( maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding()
        }
        .padding()

        
    }
}

struct CodeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CodeExampleView(content:
            """
            let color = Color.mt.status_play
            View.foregroundColor(.mt.accent_purple)
            View.foregroundColor(MTColor.gray.value)
            """
        )
    }
}
