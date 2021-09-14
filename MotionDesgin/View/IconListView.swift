//
//  IconListView.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/8.
//

import SwiftUI
import MotionComponents

struct IconListView: View {
    let list: [IconItems] = [
        .init(title: "Action", items: MTActionIcon.allCases),
        .init(title: "Alert", items: MTAlertIcon.allCases),
        .init(title: "Content", items: MTContentIcon.allCases),
        .init(title: "Finacial", items: MTFinancialIcon.allCases),
        .init(title: "General", items: MTGeneralIcon.allCases),
        .init(title: "Map", items: MTMapIcon.allCases),
        .init(title: "Navigation", items: MTNavigationIcon.allCases),
        .init(title: "Social", items: MTSocialIcon.allCases),
        .init(title: "Toggle", items: MTToggleIcon.allCases)

    ]
    
    let layout: [GridItem] = [
        .init(.adaptive(minimum: 72), spacing: 30)
    ]
    
    var body: some View {
        ScrollView {
            ForEach(list) { item in
                Section(header:
                            Text(item.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.all, 16)
                            .font(.mt.body1.bold())
                            .foregroundColor(.mt.gray_800)
                ) {
                    LazyVGrid(columns: layout, spacing: 12) {
                        ForEach(item.items, id: \.id) { source in
                            IconItemView(source: source)
                                .frame(width:92, height: 120)
                        }
                    }
                    .padding(.horizontal, 35)
                }
            }
            
            Divider.mt.defult()
            
            CodeExampleView(content: """
                Image.mt.load(.Logo)
                
                MTActionIcon.Logo.value
                """)
        }
        .navigationBarTitle(Text("ICON"))
        .navigationBarTitleDisplayMode(.inline)
    }
}



extension IconListView {
    struct IconItemView: View {
        let source: MTImageSource
        
        var body: some View {
            VStack(spacing: 10.0) {
                Image.mt.load(source)
                    .scaledToFill()
                    .padding(.all, 24)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder()
                            .foregroundColor(.mt.gray_100)
                    )
                Text(source.named)
                    .foregroundColor(.mt.gray_900)
                    .font(.mt.body3)
                    .lineLimit(2)
            }
            .frame(minHeight: 140, alignment: .top)
            
           
        }
    }
}



























struct IconListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                IconListView()
            }
    
            IconListView()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
    }
}


