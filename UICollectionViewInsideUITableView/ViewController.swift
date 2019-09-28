//
//  ViewController.swift
//  UICollectionViewInsideUITableView
//
//  Created by Alireza Hajebrahimi on 2019/09/28.
//  Copyright © 2019 Alireza Hajebrahimi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var animeTABLEVIEW: UITableView!
    var myAnime = [Anime]()
    let dataURL = "https://api.jikan.moe/v3/top/anime/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        animeTABLEVIEW.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animeGET(url: dataURL)
    }

    
    
    // MARK: -- UITableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "animeTableCell") as! AnimesTableViewCell
        tableCell.myANIMEtableCellArray.append(contentsOf: myAnime)
        return tableCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // MARK: -- Alamofire
    func animeGET(url:String) {
        Alamofire.request(url).responseJSON { (responseData) -> Void in
            if ((responseData.result.value) != nil) {
                let animesData = JSON(responseData.result.value!)
                if animesData["request_cached"] == true {
                    print("⚠️ \(animesData["request_cached"].boolValue)")
                    if let animesDATA = animesData["top"].array {
                        for animeItems in animesDATA {
                            self.myAnime.append(Anime(title: animeItems["title"].stringValue, animeItems["image_url"].stringValue))
                        }
                        self.animeTABLEVIEW.isHidden = false
                        self.animeTABLEVIEW.reloadData()
                    }
                }
                for i in self.myAnime {
                    print("👉 \(i.title )")
                }
            }
        }
    }
    
    
}

// MARK: -- ANIME CLASS
class Anime {
    var title, image_url:String
    init(title:String, _ image_url:String) {
        self.title = title
        self.image_url = image_url
    }
}
