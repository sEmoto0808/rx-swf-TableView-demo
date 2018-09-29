//
//  RxTableViewLibraryViewController.swift
//  rxswf-TableView-demo
//
//  Created by Sho Emoto on 2018/09/28.
//  Copyright © 2018年 Sho Emoto. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RxTableViewLibraryViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var rxTableView: UITableView!
    
    // MARK: - Properties
    
    // 1.Presenter層にあたるクラスから表示するデータの取得
    private let ramensData = RamenPresenter()
    
    // 2.DataSourceの生成にRxTableViewSectionedReloadDataSourceメソッドを用いる
    private let rxDataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Ramen>>(
        // セルを生成
        configureCell: {_, tableView, indexPath, ramens in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = ramens.name
            cell.detailTextLabel?.text = ramens.taste
            cell.imageView?.image = ramens.image
            return cell
    },
        // セクションヘッダを生成
        titleForHeaderInSection: { dataSource, sectionIndex in
        
        return dataSource[sectionIndex].model
    })
    
    let disposeBag = DisposeBag()
    

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 作成したデータと表示するTableViewをバインドする
        ramensData.ramens.bind(to: rxTableView.rx.items(dataSource: rxDataSource)).disposed(by: disposeBag)
        
        // RxSwiftを利用してUITableViewDelegateおを設定する
        rxTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDelegate
extension RxTableViewLibraryViewController: UITableViewDelegate {
    
    // UITableViewCellのセル高さを設定する
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(65)
    }
}
