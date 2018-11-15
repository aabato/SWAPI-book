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

        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
