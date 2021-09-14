//
//  GlobalPush2.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI
import MotionComponents

public struct MTWarningNofi: View {
    let image: Image
    let title: String?
    let content: String?
    let buttonTitle: String?
    let action: Block_T?
    
    public init(icon: Image, title: String?, content: String?, buttonTitle: String?, action: Block_T?) {
        self.image = icon
        self.title = title
        self.content = content
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    public var body: some View {
        VStack(spacing: 24.0) {
            mainView

            if buttonTitle != nil {
                btn
            }
        }
        .frame(maxWidth: ScreenWidth() - 32)
    }
    
  
    
    private var mainView: some View {
        VStack(spacing: 11.0) {
            image
                .foregroundColor(.mt.status_danger)
            
            Group {
                if let title = title {
                    Text(title)
                        .font(.mt.body1.mtBlod(), textColor: .mt.gray_900)
                }
                if let content = content {
                    Text(content)
                        .font(.mt.body2, textColor: .mt.gray_900)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.white.cornerRadius(12))
    }
    
    private var btn: some View {
        VStack {
            Button(buttonTitle!) {
                action?()
            }
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(Color.white.cornerRadius(12))

        }
    }
    
}


struct GlobalPush2: View {
    var body: some View {
        ZStack {
            Color.mt.gray_100
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Text("WarningNofi")
                    .font(.mt.body1.mtBlod(), textColor: .mt.gray_900)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.init(horizontal: 16, vertical: 24))
                    .padding(.bottom, 11)
                
                VStack(spacing: 32.0) {
                    MTWarningNofi(icon: .mt.load(.Remove), title: "无法连接网络", content: "要查看页面内容，你需先开启网络功能。", buttonTitle: "启用网络功能") {
                        print("启用网络功能")
                    }
                    
                    MTWarningNofi(icon: .mt.load(.Notification_important), title: "Title", content: .random(ofLength: 100), buttonTitle: "启用网络功能") {
                        print("启用网络功能")
                    }
                }
    
                Text("传入ICON名字、标题、详情和动作按钮Text，生成权限不足的提示。并引导用户打开相关权限。")
                    .font(.mt.body2, textColor: .mt.gray_600)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.init(horizontal: 16, vertical: 40))
            }
            .navigationBarTitle("全局提示", displayMode: .inline)
        }
        
    }
}

struct GlobalPush2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GlobalPush2()
        }
    }
}
