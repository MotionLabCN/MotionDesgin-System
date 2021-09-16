////
////  PopupView.swift
////  MotionDesgin
////
////  Created by 梁泽 on 2021/9/14.
////
//
//import SwiftUI
//
//
//
//public struct Popup<PopupContent>: ViewModifier where PopupContent: View {
//    
//    init(isPresented: Binding<Bool>,
//         type: PopupType,
//         position: Position,
//         animation: Animation,
//         autohideIn: Double?,
//         dragToDismiss: Bool,
//         closeOnTap: Bool,
//         closeOnTapOutside: Bool,
//         dismissCallback: @escaping () -> (),
//         view: @escaping () -> PopupContent) {
//        self._isPresented = isPresented
//        self.type = type
//        self.position = position
//        self.animation = animation
//        self.autohideIn = autohideIn
//        self.dragToDismiss = dragToDismiss
//        self.closeOnTap = closeOnTap
//        self.closeOnTapOutside = closeOnTapOutside
//        self.dismissCallback = dismissCallback
//        self.view = view
//        self.isPresentedRef = ClassReference(self.$isPresented)
//    }
//    
//    public enum PopupType {
//
//        case `default`
//        case toast
//        case floater(verticalPadding: CGFloat = 50)
//
//        func shouldBeCentered() -> Bool {
//            switch self {
//            case .`default`:
//                return true
//            default:
//                return false
//            }
//        }
//    }
//
//    public enum Position {
//        case top
//        case bottom
//    }
//
//    private enum DragState {
//        case inactive
//        case dragging(translation: CGSize)
//
//        var translation: CGSize {
//            switch self {
//            case .inactive:
//                return .zero
//            case .dragging(let translation):
//                return translation
//            }
//        }
//
//        var isDragging: Bool {
//            switch self {
//            case .inactive:
//                return false
//            case .dragging:
//                return true
//            }
//        }
//    }
//
//    // MARK: - Public Properties
//    /// Tells if the sheet should be presented or not
//    @Binding var isPresented: Bool
//
//    var type: PopupType
//    var position: Position
//
//    var animation: Animation
//
//    /// If nil - niver hides on its own
//    var autohideIn: Double?
//
//    /// Should close on tap - default is `true`
//    var closeOnTap: Bool
//
//    /// Should allow dismiss by dragging
//    var dragToDismiss: Bool
//
//    /// Should close on tap outside - default is `true`
//    var closeOnTapOutside: Bool
//
//    /// is called on any close action
//    var dismissCallback: () -> ()
//
//    var view: () -> PopupContent
//
//    /// holder for autohiding dispatch work (to be able to cancel it when needed)
//    var dispatchWorkHolder = DispatchWorkHolder()
//
//    // MARK: - Private Properties
//    
//    /// Class reference for capturing a weak reference later in dispatch work holder.
//    private var isPresentedRef: ClassReference<Binding<Bool>>?
//
//    /// The rect of the hosting controller
//    @State private var presenterContentRect: CGRect = .zero
//
//    /// The rect of popup content
//    @State private var sheetContentRect: CGRect = .zero
//
//    /// Drag to dismiss gesture state
//    @GestureState private var dragState = DragState.inactive
//
//    /// Last position for drag gesture
//    @State private var lastDragPosition: CGFloat = 0
//
//    /// The offset when the popup is displayed
//    private var displayedOffset: CGFloat {
//        switch type {
//        case .`default`:
//            return  -presenterContentRect.midY + screenHeight/2
//        case .toast:
//            if position == .bottom {
//                return screenHeight - presenterContentRect.midY - sheetContentRect.height/2
//            } else {
//                return -presenterContentRect.midY + sheetContentRect.height/2
//            }
//        case .floater(let verticalPadding):
//            if position == .bottom {
//                return screenHeight - presenterContentRect.midY - sheetContentRect.height/2 - verticalPadding
//            } else {
//                return -presenterContentRect.midY + sheetContentRect.height/2 + verticalPadding
//            }
//        }
//    }
//
//    /// The offset when the popup is hidden
//    private var hiddenOffset: CGFloat {
//        if position == .top {
//            if presenterContentRect.isEmpty {
//                return -1000
//            }
//            return -presenterContentRect.midY - sheetContentRect.height/2 - 5
//        } else {
//            if presenterContentRect.isEmpty {
//                return 1000
//            }
//            return screenHeight - presenterContentRect.midY + sheetContentRect.height/2 + 5
//        }
//    }
//
//    /// The current offset, based on the **presented** property
//    private var currentOffset: CGFloat {
//        return isPresented ? displayedOffset : hiddenOffset
//    }
//
//    private var screenSize: CGSize {
//        #if os(iOS) || os(tvOS)
//        return UIScreen.main.bounds.size
//        #elseif os(watchOS)
//        return WKInterfaceDevice.current().screenBounds.size
//        #else
//        return NSScreen.main?.frame.size ?? .zero
//        #endif
//    }
//
//    private var screenHeight: CGFloat {
//        screenSize.height
//    }
//
//    // MARK: - Content Builders
//    public func body(content: Content) -> some View {
//        ZStack {
//            content
//                .background(
//                    GeometryReader { proxy -> AnyView in
//                        let rect = proxy.frame(in: .global)
//                        // This avoids an infinite layout loop
//                        if rect.integral != self.presenterContentRect.integral {
//                            DispatchQueue.main.async {
//                                self.presenterContentRect = rect
//                            }
//                        }
//                        AnyView(EmptyView())
//                    }
//                )
//            
//            if isPresented && closeOnTapOutside {
//                Color.clear.edgesIgnoringSafeArea(.all)
//                    .contentShape(Rectangle())
//                    .addTapIfNotTV(if: closeOnTapOutside) {
//                        dismiss()
//                    }
//            }
//        }
//        .overlay(sheet())
//    }
//
//    /// This is the builder for the sheet content
//    func sheet() -> some View {
//
//        // if needed, dispatch autohide and cancel previous one
//        if let autohideIn = autohideIn {
//            dispatchWorkHolder.work?.cancel()
//            
//            // Weak reference to avoid the work item capturing the struct,
//            // which would create a retain cycle with the work holder itself.
//            
//            let block = dismissCallback
//            dispatchWorkHolder.work = DispatchWorkItem(block: { [weak isPresentedRef] in
//                isPresentedRef?.value.wrappedValue = false
//                block()
//            })
//            if isPresented, let work = dispatchWorkHolder.work {
//                DispatchQueue.main.asyncAfter(deadline: .now() + autohideIn, execute: work)
//            }
//        }
//
//        let sheet = ZStack {
//            self.view()
//                .addTapIfNotTV(if: closeOnTap) {
//                    dismiss()
//                }
//                .background(
//                    GeometryReader { proxy -> AnyView in
//                        let rect = proxy.frame(in: .global)
//                        // This avoids an infinite layout loop
//                        if rect.integral != self.sheetContentRect.integral {
//                            DispatchQueue.main.async {
//                                self.sheetContentRect = rect
//                            }
//                        }
//                        return AnyView(EmptyView())
//                    }
//                )
//                .frame(width: screenSize.width)
//                .offset(x: 0, y: currentOffset)
//                .animation(animation)
//        }
//
//        #if !os(tvOS)
//        let drag = DragGesture()
//            .updating($dragState) { drag, state, _ in
//                state = .dragging(translation: drag.translation)
//            }
//            .onEnded(onDragEnded)
//
//        return sheet
//            .applyIf(dragToDismiss) {
//                $0.offset(y: dragOffset())
//                    .simultaneousGesture(drag)
//            }
//        #else
//        return sheet
//        #endif
//    }
//
//    #if !os(tvOS)
//    func dragOffset() -> CGFloat {
//        if (position == .bottom && dragState.translation.height > 0) ||
//           (position == .top && dragState.translation.height < 0) {
//            return dragState.translation.height
//        }
//        return lastDragPosition
//    }
//
//    private func onDragEnded(drag: DragGesture.Value) {
//        let reference = sheetContentRect.height / 3
//        if (position == .bottom && drag.translation.height > reference) ||
//            (position == .top && drag.translation.height < -reference) {
//            lastDragPosition = drag.translation.height
//            withAnimation {
//                isPresented = false
//                lastDragPosition = 0
//            }
//            dispatchWorkHolder.work?.cancel()
//            dismissCallback()
//        }
//    }
//    #endif
//    
//    private func dismiss() {
//        dispatchWorkHolder.work?.cancel()
//        isPresented = false
//        dismissCallback()
//    }
//}
