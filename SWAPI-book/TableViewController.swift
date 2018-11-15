//
//  TableViewController.swift
//  SWAPI-book
//
//  Created by Angelica Bato on 11/14/18.
//  Copyright © 2018 Angelica Bato. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let apiURLString = "https://swapi.co/api/people/"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task = URLSession.shared.dataTask(with: URL(string: apiURLString)!) { (data, response, error) in
            guard let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let dictionary = json as? [String: Any],
                let results = dictionary["results"] else { return }
            
        
            //This is the NOT the way to decode JSON in Swift, by the way. If you're interested in a better, more advanced way, check out the Codable protocol: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
            
            
            //Check out the debugger to see what kind of data we got back from SWAPI.
            //#warning Incomplete implementation. Create objects with these results.
            print(results)
            
            self.tableView.reloadData()
        }
        
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCharacterCell", for: indexPath)
        
//         Configure the cell...

        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        

    }

}
