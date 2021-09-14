//
//  ShadowListView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/10.
//

import SwiftUI
import MotionComponents

struct ShadowListView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40.0) {
                ForEach(MTShadow.allCases) { type in
                    itemFor(type)
                }

                Spacer()
            }
            .padding(.all, 38)
            .navigationBarTitle("阴影", displayMode: .automatic)
        }
    }
    
    func itemFor(_ item: MTShadow) -> some View {
        VStack {
            Rectangle()
                .frame( height: 100)
                .foregroundColor(.white)
                .shadow(type: item)
            
            Text(item.rawValue)
                .font(.mt.body2)
                .foregroundColor(.mt.gray_600)

        }
    }
}

struct ShadowListView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowListView()
    }
}
