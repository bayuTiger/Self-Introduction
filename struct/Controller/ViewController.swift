//
//  ViewController.swift
//  struct
//
//  Created by 高山虎之介 on 2021/01/15.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SetOKDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var person = Person()
    var personArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell",for:indexPath)
        
        let userName = cell.contentView.viewWithTag(1) as! UILabel
        userName.text = personArray[indexPath.row].name
        
        let hobby = cell.contentView.viewWithTag(2) as! UILabel
        hobby.text = personArray[indexPath.row].hobby
        
        let movie = cell.contentView.viewWithTag(3) as! UILabel
        movie.text = personArray[indexPath.row].movie
        
        return cell
      
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 259
    }

    @IBAction func favBotton(_ sender: Any)
    {
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    func setOK(check: Person) {
        personArray.append(check)
        tableView.reloadData()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            
            let nextVC = segue.destination as! NextViewController
            nextVC.setOKDelegate = self
            
            
        }
    }
    
 
    
}

