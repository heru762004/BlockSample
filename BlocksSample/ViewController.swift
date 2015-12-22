//
//  ViewController.swift
//  BlocksSample
//
//  Created by Cassis Dev on 22/12/15.
//  Copyright © 2015 heru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let conn = ConnectionHandler(urlString: "http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=2de143494c0b295cca9337e1e96b00e0", completion: { (finalString:String) -> Void in
            if !finalString.isEmpty {
                let resultString = finalString
                print("resultString = \(resultString)")
            }
        })
        conn.sendRequest()
        
        let conn2 = ConnectionHandlerB(urlString: "http://apia.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=2de143494c0b295cca9337e1e96b00e0", completion: { (resultString, error) -> Void in
            
            if error != nil && error.code != -1  {
                print("error connection = \(error.description)")
            } else {
                print("resultString = \(resultString)")
            }
        
        })
        conn2.sendRequest()
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

