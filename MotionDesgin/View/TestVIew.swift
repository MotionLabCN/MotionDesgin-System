//
//  TestVIew.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/11.
//

import SwiftUI
import MotionComponents
struct MM {
    var title = ""
    var dd = ""
}
struct TestVIew: View {
    //                         .flipsForRightToLeftLayoutDirection(layout == .rightToLeft) //flips the whole view when RTL detected 左右切换
    @State var offest: CGFloat = 0
    var body: some View {
        VStack {
               Label("Lightning", systemImage: "bolt.fill")
                     .labelStyle(TitleOnlyLabelStyle())
            ///
            /// Conversely, there's also an icon-only label style:
            ///
             Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(IconOnlyLabelStyle())
            ///
            /// Some containers might apply a different default label style, such as only
            /// showing icons within toolbars on macOS and iOS. To opt in to showing both
            /// the title and the icon, you can apply the ``TitleAndIconLabelStyle`` label
            /// style:
            ///
//             Label("Lightning", systemImage: "bolt.fill")
//                   .labelStyle(TitleAndIconLabelStyle())
            Spacer()
        }

    }
}

struct TestVIew_Previews: PreviewProvider {
    static var previews: some View {
        TestVIew()
    }
}



