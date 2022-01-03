//
//  loogViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 21/12/2021.
//

import UIKit

class loogViewController: UITableViewController {
   
    @IBAction func addBoetn(_ sender: UIButton) {
    }
    @IBAction func editBoten(_ sender: UIButton) {
    }
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
      return 20
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
      
      // Get a new or recycled cell
          let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell",
              for: indexPath) as! RecordTableViewCell
        cell.currency.text = "AS"
        cell.currency1.text = "USD"
        cell.todaysDate.text = "2021/1/1"
        cell.Currencies.text = "سعر العمله "
        cell.TransferAmount.text = "$$"
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
