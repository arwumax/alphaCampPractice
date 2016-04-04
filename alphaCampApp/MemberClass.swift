//
//  MemberDetailModel.swift
//  alphaCampApp
//
//  Created by WuKwok Ho on 4/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import Foundation

class Member {
    //一個課程把課程裡面所有資料都放進同一個Class
    var name: String?
    var info: String?
    var image: String?
    
    init(name: String, image: String, info: String) {
        self.name = name
        self.info = info
        self.image = image
    }
}