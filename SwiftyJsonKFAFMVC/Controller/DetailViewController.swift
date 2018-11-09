//
//  DetailViewController.swift
//  SwiftyJsonKFAFMVC
//
//  Created by vamshi on 17/10/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var collection: UILabel!
    
    @IBOutlet weak var collectionID: UILabel!
    
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var lastLabel: UILabel!
    
    var model = JsonDataModel()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool)
    {
        artist.text = model.artistName
        collection.text = model.collectionCensoredName
        collectionID.text = model.collectionId
        country.text = model.country
        myImage.kf.setImage(with:URL(string:model.artworkUrl100)!)

    }
    
    
    
    
    
    
}
