//
//  JsonDataModel.swift
//  SwiftyJsonKFAFMVC
//
//  Created by vamshi on 17/10/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import Foundation
import SwiftyJSON


struct JsonDataModel
{
    var artistName:String = ""
    var collectionCensoredName:String = ""
    var artworkUrl100:String = ""
    var collectionId:String = ""
    var country:String = ""

    init(){}

    init(json:JSON)    //arr["artistName"].stringvalue
    {
        self.artistName = json["artistName"].stringValue
        self.collectionCensoredName = json["collectionCensoredName"].stringValue
        self.artworkUrl100 = json["artworkUrl100"].stringValue
        self.collectionId = json["collectionId"].stringValue
        self.country = json["country"].stringValue

    }
    
    
}
