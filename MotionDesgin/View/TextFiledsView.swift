//
//  TextFiledView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI
import Combine
import MotionComponents







struct TextFiledsView: View {
    @State private var username: String = ""
    @State private var username2: String = "输入"

    @State private var isEditing = false

    @State var textFiledConfig = MTTextFieldStyle.Config()
    
    @State var isS = true
    var body: some View {
        ScrollView {
            Spacer.mt.max()
            
            VStack(spacing: 20.0) {
                
            
                
                Group {
                    
                    ZStack {
                        TextField(
                            "User name (email address)",
                            text: $username
                        )
                        .mtTextFieldStyle($username, config: .init(desc:"底部说明", subText: "提示语"))
                        .opacity(isS ? 0 : 1)
                    
                        SecureField("123", text: $username)
                            .textFieldStyle(MTTextFieldStyle(text: $username, config: .init(desc:"底部说明", subText: "提示语")))
                            .opacity(isS ? 1 : 0)
                    }
                    
                   
                    
                    Button("change") {
                        isS.toggle()
                    }
                    
                    TextField(
                        "User name (email address)",
                        text: $username2
                    )
                    .mtTextFieldStyle($username2, config: .init(desc:"底部说明", subText: "提示语"))
                    
                    TextField(
                        "User name (email address)",
                        text: $username2
                    )
                    .mtTextFieldStyle($username, config: .init(desc:"底部说明", subText: "提示语", isShowLoading: true))
                    
                    
                    TextField(
                        "User name (email address)",
                        text: $username2
                    )
                    .mtTextFieldStyle($username, config: .init(desc:"底部说明", subText: "错误", subTextColor: .mt.status_danger, lineColor: .mt.status_danger,isShowLoading: false))
                }
                .padding()
        
            }
            .padding(.top, 35)

        }
        .navigationBarTitle("TextFields", displayMode: .inline)
        .flipsForRightToLeftLayoutDirection(true)

    }
}



struct TextFiledsView_Previews: PreviewProvider {
    static var previews: some View {
        TextFiledsView()
    }
}




final class KeyboardResponder: ObservableObject {
    let _center: NotificationCenter
    @Published var currentHeight: CGFloat = 0

    init(center: NotificationCenter = .default) {
        _center = center
        _center.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        _center.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    deinit {
        _center.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }

    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
