//
//  NayeViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 30/12/2021.
//

import UIKit
import Firebase

class NayeViewController: UIViewController,UITextFieldDelegate {
    
    
    var to:String!
    var from:String!
    var selectType:String!
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 3
        return nf
    }()
    
    @IBOutlet weak var money: UITextField!
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var toButton: UIButton!
    @IBOutlet weak var Date: UIDatePicker!
    @IBOutlet weak var workPrice: UILabel!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var dateView: UIView!
    
    var datePicker:UIDatePicker!
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        money.delegate = self
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        // Let it size itself to its preferred size
        datePicker.sizeToFit()
        // Set the frame without changing the size
        datePicker.center = CGPoint(x: dateView.bounds.midX + 50,
                                    y: dateView.bounds.midY);
        
        
        Utilities.styleTextField(money)
        
        dateView.addSubview(datePicker)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dissmisKeyboard(_ sender: Any) {
        money.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // استلام البيانات
        //notification observer
        NotificationCenter.default.addObserver(self, selector: #selector(printDataFromNotificationCenter), name: NSNotification.Name("pass data"), object: nil)
    }
    
    
    @IBAction func savePreased(_ sender: UIButton) {
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "yyy-MM-dd"
        let dateSelected = dateFormate.string(from: datePicker.date)
        saveData(from: from, to: to, amount: money.text!, currencyRate: workPrice.text!, date: dateSelected)
        
        
        print("~~ \(dateSelected)")
    }
    
    
    
    
    
    
    func saveData(from:String,
                  to:String,
                  amount:String,
                  currencyRate:String,
                  date:String){
        
        let db = Firestore.firestore()
        let auth = Auth.auth().currentUser!
        let ID = UUID().uuidString
        db.collection("record")
            .document(auth.uid).setData([ID:[
                                            "id":ID,
                                            "from":from,
                                            "to":to,
                                            "amount":amount,
                                            "currencyRate":currencyRate,
                                            "date":date]], merge: true) { error in
                if error != nil {
                    
                } else {
                    self.navigationController?.popViewController(animated: true)
                    
                }
            }
        
        
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string.isInt {
            if from != nil && to != nil {
                API(amount: money.text!, from: from, to: to)
            }
            return true
        }
        
        return false
    }
    
    
    @objc func printDataFromNotificationCenter(_ notification: Notification) {
        let data = notification.userInfo?["userInfo"] as? [String: Any] ?? [:]
        let string = data["data"] as! String
        if selectType == "to" {
            to = "\(string.byWords.last!)"
            toButton.setTitle(to, for: .normal)
            
        } else {
            print("~~ \(string.byWords.last!)")
            from = "\(string.byWords.last!)"
            fromButton.setTitle(from, for: .normal)
        }
        
        if from != nil && to != nil && !money.text!.isEmpty {
            API(amount: money.text!, from: from, to: to)
        }
    }
    
    
    func API(amount: String, from: String, to: String) {
        print("From \(from), To \(to)")
        let url = URL(string: "https://free.currconv.com/api/v7/convert?q=\(from)_\(to)&compact=ultra&apiKey=7f5a14d64a54862e52bd")
        let task = URLSession.shared.dataTask(with: ((url ?? URL(string: "https://api.frankfurter.app/latest?amount=10&from=GBP&to=USD"))!)) { [self] (data, response, error) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                print(jsonResponse)
                guard let newValue = jsonResponse as? [String:Any] else {
                    print("invalid format")
                    return
                }
                
                let result = newValue["\(from)_\(to)"]
                //العمليه الحسابيه عند التحويل
                if amount.isInt == true {
                    let BigResult = (result as? Double)! * Double(amount)!
                    DispatchQueue.main.async {
                        workPrice.text = numberFormatter.string(from: NSNumber(value: BigResult))
                    }
                    
                }
                //العملة ضرب واحد فحال لم يتم اختيار عمله اخرآ
                else {
                    let elseResult = (result as? Double)! * 1
                    DispatchQueue.main.async {
                        workPrice.text = numberFormatter.string(from: NSNumber(value: elseResult))
                    }
                    
                }
                
            }
            
            
            catch let error {
                print("Error: \(error)")
            }
            
        }
        task.resume()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showFrom2":
            selectType = "from"
            if let vc = segue.destination as? RcordeViewController {
                vc.selectType = "from"
            }
            
        case "showTo2":
            selectType = "to"
            if let vc = segue.destination as? RcordeViewController {
                vc.selectType = "to"
            }
        default:
            print("ff")
        }
    }
    
}
