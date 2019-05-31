//
//  RootViewController.swift
//  AlternateIcons
//
//  Created by Alex Nagy on 31/05/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    let icons = ["Blue", "Red"]
    let cellReuseId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App Icons"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseId)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath)
        cell.textLabel?.text = icons[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if UIApplication.shared.supportsAlternateIcons {
            let row = indexPath.row
            
            switch row {
            case 0:
                setAppIcon(nil)
            case 1:
                setAppIcon("IconRed")
            default:
                setAppIcon(nil)
            }
        } else {
            print("App does not support alternate icons")
        }
    }
    
    fileprivate func setAppIcon(_ named: String?) {
        UIApplication.shared.setAlternateIconName(named) { (err) in
            if let err = err {
                print(err.localizedDescription)
            } else {
                print("Done!")
            }
        }
    }
    
}



