//
//  loogViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 21/12/2021.
//

import UIKit
import Firebase

struct Recorder {
    let id:String
    let from:String
    let to: String
    let amount: String
    let currencyRate: String
    let date: String
}

class loogViewController: UITableViewController {
   
    
    var orders:[Recorder] = [Recorder]()

    
    @IBAction func addBoetn(_ sender: UIButton) {
    }
    
    
    @IBAction func editBoten(_ sender: UIButton) {
        if isEditing {
            // Change text of button to inform user of state
            sender.setTitle("Edit", for: .normal)
            // Turn off editing mode
            setEditing(false, animated: true)
        } else {
            // Change text of button to inform user of state
            sender.setTitle("Done", for: .normal)
            // Enter editing mode
            setEditing(true, animated: true)
        }
    }

    //الحذف
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let db = Firestore.firestore()
            let auth = Auth.auth().currentUser!
            
            db.collection("record").document(auth.uid).setData(["\(orders[indexPath.row].id)":[]],merge: true)
            orders.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    func getData() {
        let db = Firestore.firestore()
        let auth = Auth.auth().currentUser!
        
        db.collection("record").document(auth.uid).getDocument { snapshot, error in
            if error != nil {
                
            } else {
                self.orders.removeAll()
                let data = snapshot!.data()
                
                if data != nil {
                
                for (key,value) in data! {
                 let recorder = value as! Dictionary<String,Any>
                    
                
                    let record = Recorder(id: recorder["id"] as! String,
                                          from: recorder["from"] as! String,
                                          to: recorder["to"] as! String,
                                          amount: recorder["amount"] as! String,
                                          currencyRate: recorder["currencyRate"] as! String,
                                          date: recorder["date"] as! String)
                    
                    self.orders.append(record)
                    self.tableView.reloadData()
                }
            }
                
                
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
        return orders.count
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
      
      // Get a new or recycled cell
          let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
              for: indexPath) as! RecordTableViewCell
        cell.currency.text = orders[indexPath.row].from
        cell.currency1.text = orders[indexPath.row].to
        cell.todaysDate.text = orders[indexPath.row].currencyRate
        cell.Currencies.text = orders[indexPath.row].date
        cell.TransferAmount.text = orders[indexPath.row].amount
      return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
