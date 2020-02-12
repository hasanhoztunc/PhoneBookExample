//
//  AddPhoneViewController.swift
//  PhoneBookWithCoreData
//
//  Created by MacOS on 11.02.2020.
//  Copyright © 2020 MacOS. All rights reserved.
//

import UIKit
import CoreData

class AddPhoneViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    var updateData : NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if updateData != nil {
            self.firstName.text = updateData.value(forKey: "firstName") as! String
            self.lastName.text = updateData.value(forKey: "lastName") as! String
            self.phoneNumber.text = updateData.value(forKey: "phoneNumber") as! String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func savePhone(_ sender: Any) {
        
        let appDelegate : AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        
        let context = appDelegate.persistentContainer.viewContext
        
        let phoneEntity  = NSEntityDescription.entity(forEntityName: "Phone", in: context)
        
        if updateData == nil {
        
            if self.firstName.text != "" && self.lastName.text != "" && self.phoneNumber.text != "" {
            
                let phone = NSManagedObject(entity: phoneEntity!, insertInto: context)
                
                phone.setValue(firstName, forKey: "firstName")
                phone.setValue(lastName, forKey: "lastName")
                phone.setValue(phoneNumber, forKey: "phoneNumber")
            
            }else {
                let alert = UIAlertController(title: "Empty", message: "Field cant be empty", preferredStyle: .alert)
                
                let alertAction = UIAlertAction(title: "Empty", style: .default, handler: nil)
                
                alert.addAction(alertAction)
                
                present(alert, animated: true, completion: nil)
                
            }
        }else{
            updateData.setValue(firstName.text, forKey: "firstName")
            updateData.setValue(lastName.text, forKey: "lastName")
            updateData.setValue(phoneNumber.text, forKey: "phoneNumber")

            
        }
        
        do{
            try context.save()
        }catch let error as NSError {
            print("\(error)")
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
}
