//
//  MainViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 15/12/2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var styleTextField: UITextField!
    
    
    @IBOutlet weak var viewLabel: UILabel!
    
    var to:String!
    var from:String!
    
    @IBOutlet weak var fromButton: UIButton!
    
    
    @IBOutlet weak var toButton: UIButton!
    
    
    
    let array = [ "Afghan Afghani(AFN)",  "Albanian Lek(ALL)",  "Algerian Dinar(DZD)",  "Angolan Kwanza(AOA)",  "Argentine Peso(ARS)",  "Armenian Dram(AMD)",  "Aruban Florin(AWG)",  "Australian Dollar(AUD)",  "Azerbaijani Manat(AZN)",  "Bahamian Dollar(BSD)",  "Bahraini Dinar(BHD)",  "Bangladeshi Taka(BDT)",  "Barbadian Dollar(BBD)",  "Belarusian Ruble(BYR)",  "Belize Dollar(BZD)",  "Bermudan Dollar(BMD)",  "Bhutanese Ngultrum(BTN)",  "Bitcoin(BTC)",  "Bolivian Boliviano(BOB)",  "Bosnia And Herzegovina Konvertibilna Marka(BAM)",  "Botswana Pula(BWP)",  "Brazilian Real(BRL)",  "British Pound(GBP)",  "Brunei Dollar(BND)",  "Bulgarian Lev(BGN)",  "Burundi Franc(BIF)",  "CFP Franc(XPF)",  "Cambodian Riel(KHR)",  "Canadian Dollar(CAD)",  "Cape Verdean Escudo(CVE)",  "Cayman Islands Dollar(KYD)",  "Central African CFA) Franc(XAF)",  "Chilean Peso(CLP)",  "Chilean Unit Of Account(CLF)",  "Chinese Yuan(CNY)",  "Colombian Peso(COP)",  "Comorian Franc(KMF)",  "Congolese Franc(CDF)",  "Costa Rican Colon(CRC)",  "Croatian Kuna(HRK)",  "Cuban Convertible Peso(CUC)",  "Cuban Peso(CUP)",  "Czech Koruna(CZK)",  "Danish Krone(DKK)",  "Djiboutian Franc(DJF)",  "Dominican Peso(DOP)",  "East Caribbean Dollar(XCD)",  "Egyptian Pound(EGP)",  "Eritrean Nakfa(ERN)",  "Ethiopian Birr(ETB)",  "Euro(EUR)",  "Falkland Islands Pound(FKP)",  "Fijian Dfollar(FJD)",  "Gambian Dalasi(GMD)",  "Georgian Lari(GEL)",  "Ghanaian Cedi(GHS)",  "Gibraltar Pound(GIP)",  "Guatemalan Quetzal(GTQ)",  "Guernsey Pound(GGP)",  "Guinean Franc(GNF)",  "Guyanese Dollar(GYD)",  "Haitian Gourde(HTG)",  "Honduran Lempira(HNL)",  "Hong Kong Dollar(HKD)",  "Hungarian Forint(HUF)",  "Icelandic Króna(ISK)",  "Indian Rupee(INR)",  "Indonesian Rupiah(R)",  "Iranian Rial(IRR)",  "Iraqi Dinar(IQD)",  "Israeli New Sheqel(ILS)",  "Jamaican Dollar(JMD)",  "Japanese Yen(JPY)",  "Jersey Pound(JEP)",  "Jordanian Dinar(JOD)",  "Kazakhstani Tenge(KZT)",  "Kenyan Shilling(KES)",  "Kuwaiti Dinar(KWD)",  "Kyrgyzstani Som(KGS)",  "Lao Kip(LAK)",  "Latvian Lats(LVL)",  "Lebanese Lira(LBP)",  "Lesotho Loti(LSL)",  "Liberian Dollar(LRD)",  "Libyan Dinar(LYD)",  "Macanese Pataca(MOP)",  "Macedonian Denar(MKD)",  "Malagasy Ariary(MGA)",  "Malawian Kwacha(MWK)",  "Malaysian Ringgit(MYR)",  "Maldivian Rufiyaa(MVR)",  "Manx pound(IMP)",  "Mauritanian Ouguiya(MRO)",  "Mauritian Rupee(MUR)",  "Mexican Peso(MXN)",  "Moldovan Leu(MDL)",  "Mongolian Tugrik(MNT)",  "Moroccan Dirham(MAD)",  "Mozambican Metical(MZN)",  "Myanma Kyat(MMK)",  "Namibian Dollar(NAD)",  "Nepalese Rupee(NPR)",  "Netherlands Antillean Gulden(ANG)",  "New Belarusian Ruble(BYN)",  "New Taiwan Dollar(TWD)",  "New Zealand Dollar(NZD)",  "Nicaraguan Cordoba(NIO)",  "Nigerian Naira(NGN)",  "North Korean Won(KPW)",  "Norwegian Krone(NOK)",  "Old Zambian Kwacha(ZMK)",  "Omani Rial(OMR)",  "Paanga(TOP)",  "Pakistani Rupee(PKR)",  "Panamanian Balboa(PAB)",  "Papua New Guinean Kina(PGK)",  "Paraguayan Guarani(PYG)",  "Peruvian Nuevo Sol(PEN)",  "Philippine Peso(PHP)",  "Polish Zloty(PLN)",  "Qatari Riyal(QAR)",  "Romanian Leu(RON)",  "Russian Ruble(RUB)",  "Rwandan Franc(RWF)",  "Saint Helena Pound(SHP)",  "Salvadoran Colón(SVC)",  "Samoan Tala(WST)",  "Sao Tome And Principe Dobra(STD)",  "Saudi Riyal(SAR)",  "Serbian Dinar(RSD)",  "Seychellois Rupee(SCR)",  "Sierra Leonean Leone(SLL)",  "Silver (troy ounce) (XAG)",  "Singapore Dollar(SGD)",  "Solomon Islands Dollar(SBD)",  "Somali Shilling(SOS)",  "South African Rand(ZAR)",  "South Korean Won(KRW)",  "Special Drawing Rights(XDR)",  "Sri Lankan Rupee(LKR)",  "Sudanese Pound(SDG)",  "Surinamese Dollar(SRD)",  "Swazi Lilangeni(SZL)",  "Swedish Krona(SEK)",  "Swiss Franc(CHF)",  "Syrian Pound(SYP)",  "Tajikistani Somoni(TJS)",  "Tanzanian Shilling(TZS)",  "Thai Baht(THB)",  "Trinad and Tobago Dollar(TTD)",  "Tunisian Dinar(TND)",  "Turkish New Lira(TRY)",  "Turkmenistan Manat(TMT)",  "UAE Dirham(AED)",  "Ugandan Shilling(UGX)",  "Ukrainian Hryvnia(UAH)",  "United States Dollar(USD)",  "Uruguayan Peso(UYU)",  "Uzbekistani Som(UZS)",  "Vanuatu Vatu(VUV)",  "Venezuelan Bolivar(VEF)",  "Vietnamese Dong(VND)",  "West African CFA Franc(XOF)",  "Yemeni Rial(YER)",  "Zambian Kwacha(ZMW)",  "Zimbabwean Dollar(ZWL)"]
    
    var selectType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showFrom":
            selectType = "from"
            if let vc = segue.destination as? RcordeViewController {
                vc.selectType = "from"
            }
            
        case "showTo":
            selectType = "to"
            if let vc = segue.destination as? RcordeViewController {
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
                
                if amount.isInt == true {
                    let BigResult = "\((result as? Double)! * Double(amount)!)"
                    DispatchQueue.main.async {
                        viewLabel.text = "= \(BigResult)"
                    }
                    
                }
                else {
                    let elseResult = (result as? Double)! * 1
                    DispatchQueue.main.async {
                        viewLabel.text = "= \(elseResult)"
                    }
                    
                }
                
            }
            
            
            catch let error {
                print("Error: \(error)")
            }
            
        }
        task.resume()
    }
}


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
