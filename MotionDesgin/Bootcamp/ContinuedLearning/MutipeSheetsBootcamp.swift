//
//  MutipeSheetsBootcamp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/14.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MutipeSheetsBootcamp: View {
    @State var showSheet =  false
    
    @State var selectedModel: RandomModel? = nil
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel = .init(title: "index \(index)")
                        showSheet.toggle()
                    }
                    .padding()
                }
            }
            /*
             错误 ，解决方法
             1. use a binding
             2.  use multiple sheet
             3.
             */
    //        .sheet(isPresented: $showSheet, content: {
    //            NextScreen(selectedModel: selectedModel)
    //        })
            .sheet(item: $selectedModel) { value in
                NextScreen(selectedModel: value)
        }
        }
    }
}

struct NextScreen: View {
    let selectedModel : RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MutipeSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MutipeSheetsBootcamp()
    }
}
