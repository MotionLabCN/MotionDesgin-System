//
//  MotionDesginApp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/6.
//

import SwiftUI
import MotionComponents

class UISatus: ObservableObject {
    private var showNofiWorkITem: DispatchWorkItem?
    @Published var notifiConfig = MTPushNofi.Config(text: "", isShow: false)
    func pushNotifiAutomic(text: String) {
        notifiConfig.text = text
        //        withAnimation(.easeInOut(duration: 20)) {
        notifiConfig.isShow = true
        //        }
        showNofiWorkITem?.cancel()
        showNofiWorkITem = DispatchWorkItem { [weak self] in
            //            withAnimation {
            self?.notifiConfig.isShow = false
            //            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: showNofiWorkITem!)
    }
}

@main
struct MotionDesginApp: App {
    @StateObject var status = UISatus()
    @State var isPresented = false
   
    var body: some Scene {
        AppearConfig.config()
        
        return WindowGroup {
//            DragGestureBootcamp2()
            ContentView()
//                .mtToast(isPresented: $isPresented)
//                .overlay(
//                    Button("click me", action: {
//                        isPresented = true
//                    })
//                    .custom(.mainDefult(isEnable: true))
//                
//                )
                
//            ZStack(alignment: .bottom) {
//                TabView {
//                    Group {
//                        TextFiledsView()
//                            .tabItem { Text("456") }
//
//                        ContentView()
//                            .tabItem { Text("123") }
//
//
//
//                    }
//                    .overlay(
//                        Group {
//
//                            if status.notifiConfig.isShow {
//                                MTPushNofi(text: .init(randomOfLength: 30))
//                                    .transition(AnyTransition.asymmetric(insertion:
//                                                                            .move(edge: .bottom).combined(with: .opacity),
//                                                                         removal: .opacity))
//                                //                                    .padding(.bottom, 100)
//                            }
//                        }
//                        .animation(.easeInOut(duration: 3))
//
//
//                        , alignment: .bottom )
//                    .overlay(
//                        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
//                            MTPushNofi(text: .init(randomOfLength: 30), isCancellable: true) {
//                                status.pushNotifiAutomic(text: "123456")
//                            }
//                            Spacer()
//
//                        })
//                    )
//                }
//            }
     
    
            
            
        }
    }
}
