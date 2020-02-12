//
//  PhonesTableViewController.swift
//  PhoneBookWithCoreData
//
//  Created by MacOS on 11.02.2020.
//  Copyright © 2020 MacOS. All rights reserved.
//

import UIKit
import CoreData

class PhonesTableViewController: UITableViewController {

    var phones:Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName : "Phone")
        
        do{
            phones = try context.fetch(fetchRequest)
            tableView.reloadData()
        }catch{
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return phones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PhonesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "phoneCell", for: indexPath) as! PhonesTableViewCell
        
        let data : NSManagedObject = phones[indexPath.row] as! NSManagedObject
        
        cell.firstName.text = data.value(forKey: "firstName") as? String

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

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if editingStyle == .delete {
            
            context.delete(phones[indexPath.row] as! NSManagedObject)
            
            phones.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            do{
                
                try context.save()
            }catch{
                
            }
            
        }
    }
    

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
        
        let destination:AddPhoneViewController = segue.destination as! AddPhoneViewController
        
        if segue.identifier == "editSegue" {
            
            destination.updateData = phones[(tableView.indexPathForSelectedRow?.row)!] as! NSManagedObject
        }
    }
    

}
