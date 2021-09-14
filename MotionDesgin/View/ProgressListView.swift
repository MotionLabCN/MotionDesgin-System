//
//  ProgressListView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI
import MotionComponents




struct ProgressListView: View {
    var body: some View {
        ZStack {
            Color.random
            Color(hex: "e5e5e5")
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40.0) {
                    Spacer.mt.max()
                    
                    ZStack {
                        Color.white
                            .padding(.init(top: -100, leading: 0, bottom: 0, trailing: 0))
                        VStack(spacing: 25.0) {
                            VStack(spacing: 11.0) {
                                ProgressView().mt(style: .mid)
                                Text("Progress")
                                    .font(.mt.body2, textColor: .mt.gray_600)
                            }
                            
                            VStack(spacing: 11.0) {
                                ProgressView().mt(style: .mini)
                                Text("Progress.mini")
                                    .font(.mt.body2, textColor: .mt.gray_600)
                            }
                            
                            VStack(spacing: 11.0) {
                                ProgressView().mt(style: .mini, withText: .random(ofLength: 20))
                                Text("Progress.withText")
                                    .font(.mt.body2, textColor: .mt.gray_600)
                            }
                        }
                        .padding(.bottom, 30)
                    }
                    
                    
                    VStack(content: {
                        Text("ProgressLine")
                            .font(.mt.body1.mtBlod(), textColor: .mt.gray_900)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(16)
                        
                        VStack {
                            ProgressView(value: 0.4, total: 1)
                                .mtProgressLine()
                            Text("Long")
                                .font(.mt.body2, textColor: .mt.gray_600)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()

                        VStack {
                            HStack {
                                ProgressView(value: 0.4, total: 1)
                                    .mtProgressLine()
                                    .frame(width: 200)
                                Spacer()
                            }
                            Text("Mini")
                                .font(.mt.body2, textColor: .mt.gray_600)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding()
                        
                        Text("用于整个App中的加载状态提醒。 通常出现在Tabbar上方或navigationbar下方。另：Mini版本进度条出现在屏幕正中央。")
                            .font(.mt.body2, textColor: .mt.gray_600)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .padding(.bottom, 30)
                    
                    })
                                        
                }
                .navigationTitle("全局加载")
            }
        }
    }
}

struct ProgressListView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressListView()
    }
}
