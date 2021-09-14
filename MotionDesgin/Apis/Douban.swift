//
//  Douban.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/10.
//

import MotionComponents
import Moya

enum DouBanApi: CustomTargetType  {
    case cha
    
    
    var path: String {
        "j/app/radio/channels"
    }
}


enum Login: CustomTargetType {
    case one , two
    
    var path: String {
        "j/app/radio/channels"
    }
    
    var method:  Moya.Method {
        return .post
    }
}
