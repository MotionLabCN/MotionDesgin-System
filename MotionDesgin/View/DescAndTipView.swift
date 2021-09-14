//
//  DescAndTipView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/10.
//

import SwiftUI
import MotionComponents

struct DescAndTipView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30.0) {
                Spacer()
                MTDescriptionView(title: .random(ofLength: 100))
                
                MTDescriptionView(title: .random(ofLength: 100), subTitle: .random(ofLength: 140))
                Spacer()
            }
            .frame(width: ScreenWidth(),height: ScreenHeight() )
        }
        .navigationBarTitle("说明与提示", displayMode: .inline)

    }
}

struct DescAndTipView_Previews: PreviewProvider {
    static var previews: some View {
        DescAndTipView()
    }
}
