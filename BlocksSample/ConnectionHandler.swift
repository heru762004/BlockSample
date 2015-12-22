//
//  ConnectionHandler.swift
//  BlocksSample
//
//  Created by Cassis Dev on 22/12/15.
//  Copyright © 2015 heru. All rights reserved.
//

import Foundation

class ConnectionHandler: NSObject, NSURLConnectionDelegate {
    var urlString:String
    var myData:NSMutableData
    var error:NSError
    let completion: (String -> ())?
    
    init(urlString: String, completion: (String -> ())?) {
        self.urlString = urlString
        self.completion = completion
        self.myData =  NSMutableData()
        self.error = NSError(domain: "", code: 0, userInfo: nil)
        super.init();
    }
    
    func sendRequest() {
        let request = NSURLRequest(URL: NSURL(string: self.urlString)!)
        let connection =  NSURLConnection(request:request, delegate: self, startImmediately: true)
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        myData.appendData(data)
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError) {
        self.error = error
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let resultString = NSString(data: myData, encoding: NSUTF8StringEncoding)
        resultString.flatMap { completion?($0 as String) }
    }
    
}



