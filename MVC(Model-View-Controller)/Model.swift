//
//  Model.swift
//  MVC(Model-View-Controller)
//
//  Created by Vera on 07/12/1939 Saka.
//  Copyright © 1939 XeperTechnologies. All rights reserved.
//

import Foundation

class RHS: NSObject{
    
    var title:String?
    var des:String?
    var id:Int?
    var amount:Int?
    
    func parseRhsData(dictionary:NSDictionary)->RHS{
        if let titleValue = dictionary.object(forKey: "1271"){
            if let title = titleValue as? String{
                self.title = title
            }
        }
        if let desValue = dictionary.object(forKey: "1272"){
            if let des = desValue as? String{
                self.des = des
            }
        }
        if let idValue = dictionary.object(forKey: "1270"){
            if let id = idValue as? Int{
                self.id = id
            }
        }
        if let amountValue = dictionary.object(forKey: "1273"){
            if let amount = amountValue as? Int{
                self.amount = amount
            }
        }
        
        
        
        return self
    }
}
