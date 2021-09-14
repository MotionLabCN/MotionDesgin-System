//
//  UtilityRoomView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/10.
//

import SwiftUI
import MotionComponents

struct UtilityRoomView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer.mt.max()
            
            Group {
                VStack(alignment: .leading) {
                    Text("Divider")
                        .font(.mt.body1.mtBlod(), textColor: .mt.gray_900)

                    Divider()
                    Text("Defult")
                        .font(.mt.body2, textColor: .mt.gray_600)

                }
                .padding([.leading], 16)
                .frame(width: 100)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer.mt.max()
            
            VStack {
                Text("Spacer")
                    .font(.mt.body1.mtBlod(), textColor: .mt.gray_900)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(MTSpaceing.allCases) { item in
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            item.value
                                .background(Color.mt.accent_purple)
                            Text("\(item.id)")
                                .font(.mt.body2, textColor: .mt.gray_600)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding([.leading], 16)


            Spacer()
        }
        .navigationBarTitle("杂物间", displayMode: .inline)
        
    }
}

struct UtilityRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UtilityRoomView()
        }
    }
}
