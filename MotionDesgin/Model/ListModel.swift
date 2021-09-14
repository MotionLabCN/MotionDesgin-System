//
//  IconListModel.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/8.
//

import MotionComponents



struct IconItems: Identifiable {
    var id: String { title }
    var title: String
    var items: [MTImageSource]
}



struct ButtonItems: Identifiable {
    var id: String { title }
    var title: String
    var items: [MTButtonStyle.Style]
}
