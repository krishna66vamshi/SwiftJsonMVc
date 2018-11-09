//
//  TableViewCell.swift
//  SwiftyJsonKFAFMVC
//
//  Created by vamshi on 17/10/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {

    @IBOutlet weak var censoredNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    func setUpCell(withArtistName  artist:String ,And censoredName:String,And image:String)
    {
        artistNameLabel.text = artist
        censoredNameLabel.text = censoredName
        myImage.kf.setImage(with: URL(string: image))
    }
    
    
}
