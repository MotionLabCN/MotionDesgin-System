//
//  ButtonListView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/8.
//

import SwiftUI
import MotionComponents

//typealias Color = SwiftUI.Color
//typealias Image = SwiftUI.Image

struct ButtonListView: View {
    
    
    let smallBtnsLayout: [GridItem] = [
//        .init(.adaptive(minimum: 120)),
        .init(.flexible(minimum: 91)),
        .init(.flexible(minimum: 91)),
        .init(.flexible(minimum: 91)),
    ]
    
    let smallBtns: [MTButtonStyle.Style] = [.smallDefult(), .smallDefult(isEnable: false), .smallStorker(), .smallStorker(isEnable: false)]
    let mainBtns: [MTButtonStyle.Style] = [.mainDefult(), .mainDefult(isEnable: false), .mainStorKer(), .mainStorKer(isEnable: false)]
    let cricleBtns: [MTButtonStyle.Style] = [.cricleDefult(.mt.accent_500), .cricleDefult(.mt.accent_purple), .cricleMini(.mt.accent_purple), .cricleMini(.red)]
    
    fileprivate func headerForText(_ text: String) -> some View {
       Text(text)
        .font(.mt.body1.mtBlod())
            .foregroundColor(.mt.gray_900)
            .frame(maxWidth:.infinity, alignment: .leading)
            .padding([.leading, .top], 16)
    }
    
  
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: smallBtnsLayout, alignment: .center, spacing: 32, pinnedViews: []) {
                Section (header:
                            headerForText("SmallBtn")
                ) {
                    ForEach(smallBtns) { item in
                        ButtonItemView(item: item)
                    }
                    
                }
            }
            
            Spacer.mt.max()
            
            //MainBtn
        
            headerForText("MainBtn")
            Spacer.mt.max()

            VStack(spacing: 22) {
                ForEach(mainBtns) { item in
                    VStack(spacing: 0.0) {
                        Button("按钮", action: {
                            
                        })
                        .custom(item)
                        
                        Spacer.mt.min()
                        
                        Text(item.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.mt.gray_600)
                        
                    }
                }
                

                VStack(spacing: 0.0) {
                    Button(action: {}, label: {
                        Text("去APPStore更新")
                            .modifier(MTButtonStyleModifier(style: .mainDefult(isEnable: true), customBackground: true))
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.mt.accent_purple, Color.black]), startPoint: .bottomLeading, endPoint: .topTrailing)
                                    .clipShape(Capsule())
                            )
                    })
                    .mtAnimation()

                    
                    Spacer.mt.min()
                    
                    Text("Custom")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.mt.gray_600)
                }
            }
            .padding(.horizontal, 16)

            Spacer.mt.max()

            /// Cricle
            Section (header:
                        headerForText("Cricle")
            ) {
                Spacer.mt.max()

                HStack(alignment: .bottom, spacing: 0.0) {
                    ForEach(cricleBtns) { item in

                        VStack(spacing: 0.0) {

                            Button(action: {

                            }, label: {
                                Image.mt.load(.Add)
                                    .foregroundColor(.white)
                            })
                            .custom(item)
                            .shadow(type: .shadowLow)


                            Spacer.mt.min()

                            Text(item.title)
                                .foregroundColor(.mt.gray_600)
                        }
                        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)

                        Spacer.mt.max()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
            }
            
            Spacer.mt.max()
            

            CodeExampleView(content:"""
                Button("按钮", action: action).custom(.samllDefult)
                """)

        }
        .navigationTitle("按钮")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @State var isPressed = false
}


extension ButtonListView {
    struct ButtonItemView: View {
        let item: MTButtonStyle.Style
        var body: some View {
            VStack(spacing: 0.0) {
                Button("按钮", action: {
                    
                })
                .custom(item)

                
                Spacer.mt.min()
                
                Text(item.title)
                    .foregroundColor(.mt.gray_600)
            }
        }
    }

}






struct ButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonListView()
            
            //            ForEach([MTButtonStyle.Style.smallDefult, MTButtonStyle.Style.smallUnable, MTButtonStyle.Style.smallStorker, MTButtonStyle.Style.smallStorkerUnable]) { style in
            //                MTButton(text: "按钮") {
            //                }
            //                .custom(style)
            //                .previewLayout(.fixed(width: 100.0, height: 100.0))
            //            }
            //
            //            ForEach([MTButtonStyle.Style.mainDefult, MTButtonStyle.Style.mainUnable]) { style in
            //                MTButton(text: "按钮") {
            //                }
            //                .custom(style)
            //                .padding()
            //                .previewLayout(.fixed(width: 300.0, height: 100.0))
            //            }
        }
    }
}
