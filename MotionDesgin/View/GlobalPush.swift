//
//  GlobalPush.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/10.
//

import SwiftUI
import MotionComponents

struct GlobalPush: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
      
                Text("PushANofi")
                    .font(.mt.body1.mtBlod(), textColor: .mt.gray_900)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                    .padding(.top, 40)
                
                
                
                ForEach(MTPushNofi.PushNofiType.allCases) { item in
                    VStack(alignment: .leading, spacing: 8.0) {
                        MTPushNofi(text: .init(randomOfLength: 20), style: item)
                        
                        Text(item.rawValue)
                            .font(.mt.body2, textColor: .mt.gray_600)
                    }
                }
                
                
                ForEach(MTPushNofi.PushNofiType.allCases) { item in
                    VStack(alignment: .leading, spacing: 8.0) {
                        MTPushNofi(text: .init(randomOfLength: 20), style: item, isCancellable: true) {
                            print("xxx")
                        }
                        
                        Text(item.rawValue)
                            .font(.mt.body2, textColor: .mt.gray_600)
                    }
                }
                
               
                
                
                Spacer()
                
            }
        }
        .navigationBarTitle("全局提示Push", displayMode: .inline)

    }
}

struct GlobalPush_Previews: PreviewProvider {
   
    
    
    static var previews: some View {
//        ForEach(MTPushNofi.PushNofiType.allCases) { item in
//            GlobalPush(text: String(randomOfLength: 30), style: item)
//                .previewLayout(.fixed(width: ScreenWidth(), height: 80))
//        }
//
       
//
//        ForEach(MTPushNofi.PushNofiType.allCases) { item in
//            GlobalPush(text: String(randomOfLength: 130), style: item, isCancellable: true)
//                .previewLayout(.fixed(width: ScreenWidth(), height: 180))
//        }

        GlobalPush()
    }
}
