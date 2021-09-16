//
//  ScrollViewReaderBootcamp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/14.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var textFieldText = ""
    @State var scrollToIndex = 0
    
    var body: some View {
        VStack {
            TextField("输入", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("click To Go To") {
//                withAnimation(.spring()) {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
//                }
            }
            
            ScrollView {
                ScrollViewReader(content: { proxy in
                    ForEach(0..<50) { index in
                        Text("this is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(type: .shadowLow)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex, perform: { value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value, anchor: .none)
                        }
                    })
                })
            }
        }
    }
    
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderBootcamp()
    }
}
