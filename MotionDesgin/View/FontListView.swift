//
//  FontListView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/7.
//

import SwiftUI
import MotionComponents
struct FontListView: View {
    var list = MTFont.allCases
    
    var body: some View {
        ScrollView {
            main
            
            Divider()
            
            CodeExampleView(content:
                                """
                let font = Font.mt.largeTitle
                Text("字体").font(.mt.body)
                Text("字体").font(MTFont.title.value)
                """
            )
            
        }
        .navigationBarTitle("字体排印", displayMode: .large)
        .padding(.bottom, 20)
    }
    
    var main: some View {
        LazyVStack(spacing: 12.0) {
            ForEach(list) { item in
                VStack(alignment: .leading, spacing: 5.0) {
                    Group {
                        Text(item.text)
                        Text(item.text)
                            .bold()
                    }
                    .font(item.value)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
            }
            .padding(.leading, 16)
            
        }
        .padding([.top, .bottom], 16)
    }
    
}

struct FontListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FontListView()
        }
    }
}
