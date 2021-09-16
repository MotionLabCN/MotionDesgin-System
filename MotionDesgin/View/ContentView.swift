//
//  ContentView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/6.
//

import SwiftUI
import UIKit
import MotionComponents
import Combine

struct Chan: Convertible {
    var name_en = "" //: "Personal Radio",
    var seq_id = "" //: 0,
    var abbr_en = "" //: "My",
    var name = "" //: "私人兆赫",
    var channel_id = "" //: 0
}

class VM: ObservableObject {
    var disposeBag = Set<AnyCancellable>()
    
    @Published var list: [Chan] = []
    
    var name: String {
        list.first?.name ?? ""
    }
    
    
    
    
    func testApi() {
            Networking.requestPublisher(DouBanApi.cha)
            .mapArray(Chan.self, atKeyPath: "channels")
            .sink { _ in
                
            } receiveValue: { [weak self] model in
                let amodel = model
                print("")
                self?.list = model
            }
            .store(in: &disposeBag)
    }
}


struct ContentView: View {
    @StateObject var vm = VM()
    
    enum HomePageData: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        case 字体排印, 颜色体系, ICON, 按钮, 阴影, 杂物间, 全局提示1, 说明与建议, 全局提示2, 全局加载, TextFiled
//             , MTSheet , TableRow
        func destination() -> some View {
            Group {
                switch self {
                case .字体排印: FontListView()
                case .颜色体系: ColorListView()
                case .ICON: IconListView()
                case .按钮: ButtonListView()
                case .阴影: ShadowListView()
                case .杂物间: UtilityRoomView()
                case .全局提示1: GlobalPush()
                case .说明与建议: DescAndTipView()
                case .全局提示2: GlobalPush2()
                case .TextFiled: TextFiledsView()
                case .全局加载: ProgressListView()
               
//                case .TableRow: TableRowView()
//                case .MTSheet:Text("待完善")
                    
                }
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20.0) {
                    ForEach(HomePageData.allCases) { item in
                        NavigationLink(
                            destination: item.destination(),
                            label: {
                                Text(item.rawValue)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.init(top: 12, leading: 16, bottom: 12, trailing: 0))
                                    .foregroundColor(.black)
                                    .background(Color.mt.gray_050)
                                    .cornerRadius(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .strokeBorder(Color.mt.gray_100)
                                    )
                            })
                            .isDetailLink(true)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 60)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: ToolbarItemPlacement.principal) {
                    Image.mt.load(.Logo)
                        .resizable()
                        .frame(width: 38, height: 38)
                }
            })
            
        }
        .onAppear(perform: {
            
        })
        
       
        
        
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
