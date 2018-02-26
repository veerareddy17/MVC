//
//  WebserviesHandler.swift
//  MVC(Model-View-Controller)
//
//  Created by Vera on 07/12/1939 Saka.
//  Copyright © 1939 XeperTechnologies. All rights reserved.
//

import Foundation


struct HealthAaadhar {
    static let shared = HealthAaadhar()
    
    func apiRequestWithParameters(_ url: String,_ parameters:String?,completionHandler:@escaping (_ response:[String:AnyObject])->Void){
        let urlRequest :NSMutableURLRequest = NSMutableURLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = parameters?.data(using: String.Encoding.utf8, allowLossyConversion: false)
        //create the session object
        
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    completionHandler(json as [String : AnyObject])
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
}
