//
//  MainViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 15/12/2021.
//

import UIKit
import Foundation


class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout {
  
  var arrayLabel = [CurrencyRate]()
  
  var to:String!
  var from:String!
  
  
  let currencies = [ "Afghan Afghani(AFN)", "Albanian Lek(ALL)", "Algerian Dinar(DZD)",
                "Angolan Kwanza(AOA)", "Argentine Peso(ARS)", "Armenian Dram(AMD)",
                "Aruban Florin(AWG)", "Australian Dollar(AUD)",
                "Azerbaijani Manat(AZN)",
                "Bahamian Dollar(BSD)",
                "Bahraini Dinar(BHD)",
                "Bangladeshi Taka(BDT)",
                "Barbadian Dollar(BBD)",
                "Belarusian Ruble(BYR)",
                "Belize Dollar(BZD)",
                "Bermudan Dollar(BMD)",
                "Bhutanese Ngultrum(BTN)",
                "Bitcoin(BTC)",
                "Bolivian Boliviano(BOB)",
                "Bosnia And Herzegovina Konvertibilna Marka(BAM)",
                "Botswana Pula(BWP)",
                "Brazilian Real(BRL)",
                "British Pound(GBP)",
                "Brunei Dollar(BND)",
                "Bulgarian Lev(BGN)",  "Burundi Franc(BIF)",  "CFP Franc(XPF)",  "Cambodian Riel(KHR)",  "Canadian Dollar(CAD)",  "Cape Verdean Escudo(CVE)",  "Cayman Islands Dollar(KYD)",  "Central African CFA) Franc(XAF)",  "Chilean Peso(CLP)",  "Chilean Unit Of Account(CLF)",
                "Chinese Yuan(CNY)",  "Colombian Peso(COP)",  "Comorian Franc(KMF)",  "Congolese Franc(CDF)",  "Costa Rican Colon(CRC)",  "Croatian Kuna(HRK)",  "Cuban Convertible Peso(CUC)",  "Cuban Peso(CUP)",  "Czech Koruna(CZK)",  "Danish Krone(DKK)",
                "Djiboutian Franc(DJF)",  "Dominican Peso(DOP)",  "East Caribbean Dollar(XCD)",  "Egyptian Pound(EGP)",
                "Eritrean Nakfa(ERN)",  "Ethiopian Birr(ETB)",  "Euro(EUR)",  "Falkland Islands Pound(FKP)",  "Fijian Dfollar(FJD)",  "Gambian Dalasi(GMD)",  "Georgian Lari(GEL)",  "Ghanaian Cedi(GHS)",  "Gibraltar Pound(GIP)",  "Guatemalan Quetzal(GTQ)",  "Guernsey Pound(GGP)",  "Guinean Franc(GNF)",  "Guyanese Dollar(GYD)",  "Haitian Gourde(HTG)",  "Honduran Lempira(HNL)",  "Hong Kong Dollar(HKD)",  "Hungarian Forint(HUF)",  "Icelandic Króna(ISK)",  "Indian Rupee(INR)",  "Indonesian Rupiah(R)",  "Iranian Rial(IRR)",  "Iraqi Dinar(IQD)",  "Israeli New Sheqel(ILS)",  "Jamaican Dollar(JMD)",  "Japanese Yen(JPY)",  "Jersey Pound(JEP)",  "Jordanian Dinar(JOD)",  "Kazakhstani Tenge(KZT)",  "Kenyan Shilling(KES)",  "Kuwaiti Dinar(KWD)",  "Kyrgyzstani Som(KGS)",  "Lao Kip(LAK)",  "Latvian Lats(LVL)",  "Lebanese Lira(LBP)",  "Lesotho Loti(LSL)",  "Liberian Dollar(LRD)",  "Libyan Dinar(LYD)",  "Macanese Pataca(MOP)",  "Macedonian Denar(MKD)",  "Malagasy Ariary(MGA)",  "Malawian Kwacha(MWK)",  "Malaysian Ringgit(MYR)",  "Maldivian Rufiyaa(MVR)",  "Manx pound(IMP)",  "Mauritanian Ouguiya(MRO)",  "Mauritian Rupee(MUR)",  "Mexican Peso(MXN)",  "Moldovan Leu(MDL)",  "Mongolian Tugrik(MNT)",  "Moroccan Dirham(MAD)",  "Mozambican Metical(MZN)",  "Myanma Kyat(MMK)",  "Namibian Dollar(NAD)",  "Nepalese Rupee(NPR)",  "Netherlands Antillean Gulden(ANG)",  "New Belarusian Ruble(BYN)",  "New Taiwan Dollar(TWD)",  "New Zealand Dollar(NZD)",  "Nicaraguan Cordoba(NIO)",  "Nigerian Naira(NGN)",  "North Korean Won(KPW)",  "Norwegian Krone(NOK)",  "Old Zambian Kwacha(ZMK)",  "Omani Rial(OMR)",  "Paanga(TOP)",  "Pakistani Rupee(PKR)",  "Panamanian Balboa(PAB)",  "Papua New Guinean Kina(PGK)",  "Paraguayan Guarani(PYG)",  "Peruvian Nuevo Sol(PEN)",  "Philippine Peso(PHP)",  "Polish Zloty(PLN)",  "Qatari Riyal(QAR)",  "Romanian Leu(RON)",  "Russian Ruble(RUB)",  "Rwandan Franc(RWF)",  "Saint Helena Pound(SHP)",  "Salvadoran Colón(SVC)",  "Samoan Tala(WST)",  "Sao Tome And Principe Dobra(STD)",  "Saudi Riyal(SAR)",  "Serbian Dinar(RSD)",  "Seychellois Rupee(SCR)",  "Sierra Leonean Leone(SLL)",  "Silver (troy ounce) (XAG)",  "Singapore Dollar(SGD)",  "Solomon Islands Dollar(SBD)",  "Somali Shilling(SOS)",  "South African Rand(ZAR)",  "South Korean Won(KRW)",  "Special Drawing Rights(XDR)",  "Sri Lankan Rupee(LKR)",  "Sudanese Pound(SDG)",  "Surinamese Dollar(SRD)",  "Swazi Lilangeni(SZL)",  "Swedish Krona(SEK)",  "Swiss Franc(CHF)",  "Syrian Pound(SYP)",  "Tajikistani Somoni(TJS)",  "Tanzanian Shilling(TZS)",  "Thai Baht(THB)",  "Trinad and Tobago Dollar(TTD)",  "Tunisian Dinar(TND)",  "Turkish New Lira(TRY)",  "Turkmenistan Manat(TMT)",  "UAE Dirham(AED)",  "Ugandan Shilling(UGX)",  "Ukrainian Hryvnia(UAH)",  "United States Dollar(USD)",  "Uruguayan Peso(UYU)",  "Uzbekistani Som(UZS)",  "Vanuatu Vatu(VUV)",  "Venezuelan Bolivar(VEF)",  "Vietnamese Dong(VND)",  "West African CFA Franc(XOF)",  "Yemeni Rial(YER)",  "Zambian Kwacha(ZMW)",  "Zimbabwean Dollar(ZWL)"]
  
  @IBOutlet weak var collection: UICollectionView!
  
  @IBOutlet weak var styleTextField: UITextField!
  
  @IBOutlet weak var viewLabel: UILabel!
  
  @IBOutlet weak var fromButton: UIButton!
  
  @IBOutlet weak var toButton: UIButton!
  
  @IBOutlet weak var calculate: UIButton!
  
  @IBOutlet weak var record: UIButton!
  
  
  
  
  var selectType:String!
  
  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0   //اقل رقم
    nf.maximumFractionDigits = 3   // اكثر رقم عشري
    return nf
  }()
  
  let numberFormatter2: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 6
    return nf
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //        Utilities.styleAcshnButton(fromButton)
    //        Utilities.styleAcshnButton(toButton)
    Utilities.styleTextField(styleTextField)
    //        Utilities.stylewidthButton(calculate)
    //        Utilities.stylewidthButton(record)
    // Do any additional setup after loading the view.
    
    let dateformat = DateFormatter()
    dateformat.dateFormat = "yyyy-MM-dd"
    let today =  dateformat.string(from: Date())
    let yesterdayDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    let yesterday =  dateformat.string(from: yesterdayDate)
    
    rateAPI(from: "USD", to: "SAR", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "TRY", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "EGP", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "EUR", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "CNY", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "LBP", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "CAD", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "JOD", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "KWD", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "BHD", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "EUR", today: today,yestarday: yesterday)
    rateAPI(from: "USD", to: "CHF", today: today,yestarday: yesterday)
    rateAPI(from: "SAR", to: "USD", today: today,yestarday: yesterday)
    rateAPI(from: "SAR", to: "TRY", today: today,yestarday: yesterday)
    rateAPI(from: "SAR", to: "CHF", today: today,yestarday: yesterday)
    rateAPI(from: "SAR", to: "KWD", today: today,yestarday: yesterday)
  }
  
  
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // استلام البيانات
    //notification observer
    NotificationCenter.default.addObserver(self, selector: #selector(printDataFromNotificationCenter), name: NSNotification.Name("pass data"), object: nil)
  }
  
  @objc func printDataFromNotificationCenter(_ notification: Notification) {
    let data = notification.userInfo?["userInfo"] as? [String: Any] ?? [:]
    let string = data["data"] as! String
    if selectType == "to" {
      to = "\(string.byWords.last!)"
      toButton.setTitle(to, for: .normal)
      
    }else {
      from = "\(string.byWords.last!)"
      fromButton.setTitle(from, for: .normal)
    }
  }
  
  @IBAction func calculateButtonTapped(_ sender: UIButton) {
    if (from == nil) || (to == nil) {
      let alert = UIAlertController(title: "Oops!", message: "You forgot to fill in a field! Please try again", preferredStyle: .alert)
      let alertAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
      alert.addAction(alertAction)
      present(alert, animated: true)
      
    } else {
      API(amount: styleTextField.text!, from: from, to: to)
    }
  }
  //فنكش تبديل العملات
  @IBAction func switche(_ sender: UIButton) {
    if fromButton.titleLabel?.text != "" && toButton.titleLabel?.text != "" {
      DispatchQueue.main.async {
        let fromTitle = self.fromButton.titleLabel?.text
        self.fromButton.setTitle("\(self.toButton.titleLabel?.text ?? "")", for: .normal)
        self.from = self.toButton.titleLabel?.text
        self.toButton.setTitle("\(fromTitle ?? "")", for: .normal)
        self.to = fromTitle
        
      }
    }
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "showFrom":
      selectType = "from"
      if let vc = segue.destination as? RecordeViewController {
        vc.selectType = "from"
      }
      
    case "showTo":
      selectType = "to"
      if let vc = segue.destination as? RecordeViewController {
        vc.selectType = "to"
      }
    default:
      print("ff")
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
            viewLabel.text = numberFormatter.string(from: NSNumber(value: BigResult))
          }
          
        }
        //العملة ضرب واحد فحال لم يتم اختيار عمله اخرآ
        else {
          let elseResult = (result as? Double)! * 1
          DispatchQueue.main.async {
            viewLabel.text = numberFormatter.string(from: NSNumber(value: elseResult))
          }
          
        }
        
      }
      
      
      catch let error {
        print("Error: \(error)")
      }
      
    }
    task.resume()
  }
  
  
  func rateAPI(from: String, to: String,today:String,yestarday:String) {
    let url = URL(string: "https://free.currconv.com/api/v7/convert?q=\(from)_\(to)&compact=ultra&date=\(yestarday)&endDate=\(today)&apiKey=7f5a14d64a54862e52bd")
    
    print("\n\n\n#####url :: \(url)")
    let task = URLSession.shared.dataTask(with: ((url ?? URL(string: "https://api.frankfurter.app/latest?amount=10&from=GBP&to=USD"))!)) { [self] (data, response, error) in
      
      do {
        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
        guard let newValue = jsonResponse as? [String:Any] else {
          print("invalid format")
          return
        }
        
        print("~~ \(jsonResponse)")
        let result = newValue["\(from)_\(to)"] as! [String : Any]
        
        DispatchQueue.main.async {
          let todayRate = result[today]! as! Double
          let yestardayRate = result[yestarday]! as! Double
          let sum = todayRate - yestardayRate
          let sumFormate = numberFormatter2.string(from: NSNumber(value: sum))
          arrayLabel.append(CurrencyRate(name: "\(from)/\(to)", rate: String(describing: sumFormate!)))
          collection.reloadData()
        }
        
        
      }
      catch let error {
        print("Error: \(error)")
      }
      
    }
    
    task.resume()
    
  }
}


// MARK: - Collection data source

extension MainViewController:  UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return arrayLabel.count
  }
  
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
    var plus = ""
    cell.name.text = arrayLabel[indexPath.row].name
    if Double(arrayLabel[indexPath.row].rate)! > 0 {
      cell.rate.textColor = .systemGreen
      plus = "+"
    } else if Double(arrayLabel[indexPath.row].rate)! < 0 {
      cell.rate.textColor = .systemRed
    } else {
      cell.rate.textColor = .systemGray
    }
    cell.rate.text = plus + arrayLabel[indexPath.row].rate
    return cell
  }
}


//البحث عن العملاتعن طريق الكتابه
extension StringProtocol {
  var byWords: [SubSequence] {
    var byWords: [SubSequence] = []
    enumerateSubstrings(in: startIndex..., options: .byWords) { _, range, _, _ in
      byWords.append(self[range])
    }
    return byWords
  }
}


extension String {
  var isInt: Bool {
    return Int(self) != nil
  }
}
