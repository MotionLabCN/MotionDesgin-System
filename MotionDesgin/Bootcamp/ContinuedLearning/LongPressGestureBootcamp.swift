//
//  LongPressGesture.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/13.
//

import SwiftUI

struct LongPressGesture: View {
    @State var isComplete = false
    @State var isSuccess = false
    
    
    var title: String {
        isComplete ? "完成" : "no complete"
    }
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ?  Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            
            HStack {
                Text("click here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) { isPressing in
                        // start of press -> min duration
                        if isPressing {
                            withAnimation(.easeIn(duration: 1)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    isComplete = false
                                }
                            }
                            
                        }
                    } perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }

                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
            
          
        }
        
        
        
        
        
        
//        Text(title)
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 3, maximumDistance: 50) {
//                isComplete.toggle()
//            }
        
    }
}

struct LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGesture()
    }
}
