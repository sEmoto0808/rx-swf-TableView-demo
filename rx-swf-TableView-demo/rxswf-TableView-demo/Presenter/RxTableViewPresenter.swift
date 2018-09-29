//
//  RxTableViewPresenter.swift
//  rxswf-TableView-demo
//
//  Created by Sho Emoto on 2018/09/28.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

final class RamenPresenter {
    
    // 表示用データの具体的な設定をする
    let ramens = Observable.just([
        SectionModel(model: "醤油", items: [
            Ramen(name: "豚骨醤油ラーメン",taste: "濃いめ", imageId: "sample005"),
            Ramen(name: "喜多方ラーメン", taste: "あっさり", imageId: "sample009"),
            Ramen(name: "チャーシューメン", taste: "あっさり", imageId: "sample010")
            ]),
        SectionModel(model: "塩", items: [
            Ramen(name: "野菜たっぷりタンメン", taste: "あっさり", imageId: "sample007")
            ]),
        SectionModel(model: "味噌", items: [
            Ramen(name: "8番ラーメン味噌味", taste: "ふつう", imageId: "sample001"),
            Ramen(name: "もやしそば味噌味", taste: "濃いめ", imageId: "sample008")
            ]),
        SectionModel(model: "その他", items: [
            Ramen(name: "台湾風まぜそば", taste: "濃いめ", imageId: "sample002"),
            Ramen(name: "長崎ちゃんぽん", taste: "ふつう", imageId: "sample003"),
            Ramen(name: "酸辣湯麺", taste: "ふつう", imageId: "sample004"),
            Ramen(name: "トマトと野菜のラーメン", taste: "あっさり", imageId: "sample006")
            ])
        ])
    
}
