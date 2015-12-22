//
//  ConnectionHandlerB.swift
//  BlocksSample
//
//  Created by Cassis Dev on 22/12/15.
//  Copyright © 2015 heru. All rights reserved.
//

import Foundation

class ConnectionHandlerB: NSObject, NSURLConnectionDelegate {
    var urlString:String
    var myData:NSMutableData
    var error:NSError
    typealias myCompletion = (String, NSError!) -> Void
    var callback:myCompletion
    
    init(urlString: String, completion: myCompletion) {
        self.urlString = urlString
        self.myData =  NSMutableData()
        self.error = NSError(domain: "", code: -1, userInfo: nil)
        self.callback = completion
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
        callback("", error)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let resultString = NSString(data: myData, encoding: NSUTF8StringEncoding)
        callback((resultString as! String), error)
    }
    
}
