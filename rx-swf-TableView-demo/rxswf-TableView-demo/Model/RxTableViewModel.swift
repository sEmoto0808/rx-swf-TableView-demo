//
//  RxTableModel.swift
//  rxswf-TableView-demo
//
//  Created by Sho Emoto on 2018/09/28.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import Foundation
import UIKit
// RxSwiftでUITableViewとUICollectioViewのDataSourceを操作しやすくするライブラリ
import RxDataSources

struct Ramen {
    
    // データ構成
    let name: String
    let taste: String
    let imageId: String
    var image: UIImage?
    
    init(name: String, taste: String, imageId: String) {
        self.name = name
        self.taste = taste
        self.imageId = imageId
        self.image = UIImage(named: imageId)
    }
}

// 既存の独自型（RxDataSourcesで定義されているIdentifiableType）を拡張する
// RxDataSourcesでデータ定義を行う場合には必ず実装しなければいけない
extension Ramen: IdentifiableType {
    
    typealias Identity = String
    
    // 一意のIDとなるようなものを設定する
    var identity: Identity { return imageId }
}
