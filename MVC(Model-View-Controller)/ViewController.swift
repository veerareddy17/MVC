//
//  ViewController.swift
//  MVC(Model-View-Controller)
//
//  Created by Vera on 07/12/1939 Saka.
//  Copyright © 1939 XeperTechnologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblVC: UITableView!
    
    var data = [RHS]()
    
    var responseData:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblVC.estimatedRowHeight = 100
        self.tblVC.rowHeight = UITableViewAutomaticDimension
        self.tblVC.register(UINib(nibName: "CustomTVC", bundle: nil), forCellReuseIdentifier: "CustomTVC")
        self.tblVC.delegate = self
        self.tblVC.dataSource = self
        
        let parameters = "method=fetchingrhs"
        
        HealthAaadhar.shared.apiRequestWithParameters(basic_URL, parameters) { (response) in
            
            print(response as NSDictionary)
            print(response["info"] as! NSArray)
            self.responseData = response["info"] as! NSArray
            print(self.responseData)
            
            for i in 0..<self.responseData.count{
                let parse = RHS().parseRhsData(dictionary: self.responseData[i] as! NSDictionary)
                self.data.append(parse)
                print(self.data.count)
                print(self.data[i].title!)
                DispatchQueue.main.async {
                    self.tblVC.reloadData()
                }
            }
            
        }
        
        
      }
    }

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVC.dequeueReusableCell(withIdentifier: "CustomTVC", for: indexPath) as! CustomTVC
        cell.cellView.layer.borderColor = UIColor.gray.cgColor
        cell.cellView.layer.borderWidth = 1.0
        cell.cellView.layer.cornerRadius = 5.0
        
        cell.title.text = "\(self.data[indexPath.row].des!)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}
