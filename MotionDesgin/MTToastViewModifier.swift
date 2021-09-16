//
//  MTToastViewModifier.swift
//  MotionComponents
//
//  Created by 梁泽 on 2021/9/14.
//

import SwiftUI
import MotionComponents

extension ToastViewModifier {
    enum DismissTime {
        case auto(duration: Double)
        case never
    }
    
    enum Postion {
        case bottom(offsetY: CGFloat)
        case top(offsetY: CGFloat)

    }
    
    //MARK: - 辅助方法
    class DispatchWorkHolder {
        var work: DispatchWorkItem?
    }

    private final class ClassReference<T> {
        var value: T
        
        init(_ value: T) {
            self.value = value
        }
    }
}


//MARK: - ToastViewModifier
struct ToastViewModifier<MTContent: View>: ViewModifier {
    @Binding var isPresented: Bool
    private let mtContent:  MTContent

    private var dispatchWorkHolder = DispatchWorkHolder()
    private var isPresentedRef: ClassReference<Binding<Bool>>?

    private var dismissTime: DismissTime
    private var postion: Postion
    
    @GestureState private var dragOffsetY: CGFloat = 0

    init(isPresented: Binding<Bool>, dismissTime: DismissTime = .auto(duration: 3), postion: Postion = .top(offsetY: 0), @ViewBuilder content: () -> MTContent) {
        self._isPresented = isPresented
        self.dismissTime = dismissTime
        self.postion = postion
        self.mtContent = content()
        self.isPresentedRef = ClassReference(self.$isPresented)
        checkDismiss()
    }
    
    
    func checkDismiss() {
        switch dismissTime {
        case  let .auto(duration):
            dispatchWorkHolder.work?.cancel()
            
            dispatchWorkHolder.work = DispatchWorkItem(block: {
                isPresented = false
                //dissmiss completion
                
            })
            if isPresented, let work = dispatchWorkHolder.work {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: work)
            }
        default:
            break
        }
    }
    
    
    func body(content: Content) -> some View {
//        ZStack {
//            content
//            if isPresented {
//                Color.clear.edgesIgnoringSafeArea(.all)
////                    .contentShape(Rectangle())
//            }
//        }
        content.overlay(
            Group {
                if isPresented {
                    switch postion {
                    case let .bottom(offsetY):
                        VStack {
                            Spacer()
                            mtContent
                                .simultaneousGesture(dragGesture)
                                .padding(.bottom, offsetY)
                                .offset(y: dragOffsetY)
                                
                        }
                        .transition(.move(edge: .bottom))
                        .animation(.default)
                    case let .top(offsetY):
                        VStack {
                            mtContent
                                .simultaneousGesture(dragGesture)
                                .padding(.top, offsetY)
                                .offset(y: dragOffsetY)
                            Spacer()
                                
                        }
                        .transition(.move(edge: .top))
                        .animation(.default)
                    }
                    
                }
               
            }
        )
        
    }
    
    var dragGesture: some Gesture {
      DragGesture()
            .updating($dragOffsetY, body: { currentstate, gestureState, transaction in
                gestureState = currentstate.translation.height
            })
            .onChanged({ _ in
                dispatchWorkHolder.work?.cancel()
            })
            .onEnded({ value in
                checkDismiss()
            })
    }
    
    
    
    
}







extension View {
    func mtToast(isPresented: Binding<Bool>) -> some View {
        modifier(ToastViewModifier(isPresented: isPresented, content: {
            MTPushNofi(text: "12345", style: .danger)
        }))
    }
}

