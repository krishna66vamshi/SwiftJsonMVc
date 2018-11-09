//
//  ViewController.swift
//  SwiftyJsonKFAFMVC
//
//  Created by vamshi on 17/10/18.
//  Copyright © 2018 vamshi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher





struct Router {
    static let baseUrl = "http://139.59.62.104:3000/api/"
}


class ViewController: UIViewController {

    @IBOutlet weak var myTBV: UITableView!
    
    var myModel = [JsonDataModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController?.navigationBar.
        title = "TableView"
       fetchJsonResponseUsingAlamofire()
        
        let params = [
            "email":"test@gmail.com",
            "password":"123456"
        ]
        let header:HTTPHeaders = [
            "Content-Type":"application/json"
        ]
    //    getResponseFromServer(url: Router.baseUrl, parameters: params, withHeader: header)
        
    }
    
//    func getResponseFromServer(url:String,parameters:[String:Any],withHeader:[String:Any]){
//
//
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.prettyPrinted, headers: withHeader).responseJSON { (resp) in
//            print(resp)
//        }
//    }
    
    
    
//
//    func getWeatherData(url: String, parameters: [String: String]) {
//
//        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
//            response in
//            if response.result.isSuccess {
//
//                print("Success! Got the weather data")
//                let weatherJSON : JSON = JSON(response.result.value!)
//
//
//                print(weatherJSON)
//
//                self.updateWeatherData(json: weatherJSON)
//
//            }
//            else {
//                print("Error \(String(describing: response.result.error))")
//                self.cityLabel.text = "Connection Issues"
//            }
//        }
//
//    }
//
//
    
    
    
    

   func fetchJsonResponseUsingAlamofire()
    {
        
        
        Alamofire.request(URL(string: "https://itunes.apple.com/search?media=music&term=bollywood")!).responseJSON
            {
            (response) in
            
                if response.result.isSuccess
                {
                    let data = JSON(response.result.value!)
                    let results = data["results"]
                    
                    for arr in results.arrayValue
                    {
                        
                        self.myModel.append(JsonDataModel(json: arr))
                        
                    }
                    
                    DispatchQueue.main.async {
                      self.myTBV.reloadData()
                    }

                }
                else
                {
                    print("Error in getting Response")
                }
        }
    
    
    }
    

}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  myModel.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        
        cell.setUpCell(withArtistName: myModel[indexPath.row].artistName,And: myModel[indexPath.row].collectionCensoredName,And: myModel[indexPath.row].artworkUrl100)
        
     //  cell.artistNameLabel.text = myModel[indexPath.row].artistName
      //  cell.censoredNameLabel.text = myModel[indexPath.row].collectionCensoredName
 //  cell.myImage.kf.setImage(with: URL(string: myModel[indexPath.row].artworkUrl100))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        dvc.model = myModel[indexPath.row]
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    
    
    
    
    
}

