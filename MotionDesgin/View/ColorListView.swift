//
//  ColorListView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/7.
//

import SwiftUI
import MotionComponents


struct ColorListView: View {
    var list = MTColor.allCases
   
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(showsIndicators: false) {
            main
            Divider()
            
            CodeExampleView(content:
                """
                let color = Color.mt.status_play
                View.foregroundColor(.mt.accent_purple)
                View.foregroundColor(MTColor.gray.value)
                """
            )
        }
        .navigationBarTitle("颜色体系")
        .padding(.bottom, 20)
    }
    
    var main: some View {
        LazyVStack(spacing: 20.0) {
            ForEach(list) { item in
                VStack(alignment: .leading, spacing: 5.0) {
                    item.value
                        .frame(height: 42, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(1)

                    Text(item.rawValue)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .foregroundColor(.mt.gray_500)
                }
            }
            .padding([.leading, .trailing], 16)

        }
        .padding([.top], 16)
    }
}

struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorListView()
        }
    }
}


