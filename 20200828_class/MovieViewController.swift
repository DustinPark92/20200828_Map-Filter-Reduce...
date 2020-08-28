//
//  MovieViewController.swift
//  20200828_class
//
//  Created by Dustin on 2020/08/28.
//  Copyright © 2020 Dustin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit

private let reuseIdentifier = "MovieTableTableViewCell"

class MovieViewController: UIViewController {
    
    var movieNameList = [String]()
    
    var movieTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(movieTableView)
        movieTableView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.bottom.equalTo(view)
            make.right.equalTo(view)
        }
        movieTableView.register(MovieTableTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        NetworkManager.shared.getBoxOffice(url: UrlComponent.boxOffice, success: { json in
            self.movieNameList = json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue.map {
                $0["movieNm"].stringValue
            }
            
            self.movieTableView.reloadData()
        }) {
            print("실패")
        }
        view.backgroundColor = .white
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showAlertOK(mainTitle: "아아", mainMessage: "아아", alertMessage: "아아") { jack in
            print(jack)
            self.movieTableView.backgroundColor = .red
        }
    }
    
}

extension MovieViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MovieTableTableViewCell
        
        cell.textLabel?.text = movieNameList[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
}
