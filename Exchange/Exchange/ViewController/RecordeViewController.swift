//
//  RcordeViewController.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 21/12/2021.
//

import UIKit

class RecordeViewController: UIViewController,
                            UITableViewDelegate,
                            UITableViewDataSource,
                            UISearchBarDelegate {
    
    let array = [ "Afghan Afghani(AFN)",  "Albanian Lek(ALL)",  "Algerian Dinar(DZD)",  "Angolan Kwanza(AOA)",  "Argentine Peso(ARS)",  "Armenian Dram(AMD)",  "Aruban Florin(AWG)",  "Australian Dollar(AUD)",  "Azerbaijani Manat(AZN)",  "Bahamian Dollar(BSD)",  "Bahraini Dinar(BHD)",  "Bangladeshi Taka(BDT)",  "Barbadian Dollar(BBD)",  "Belarusian Ruble(BYR)",  "Belize Dollar(BZD)",  "Bermudan Dollar(BMD)",  "Bhutanese Ngultrum(BTN)",  "Bitcoin(BTC)",  "Bolivian Boliviano(BOB)",  "Bosnia And Herzegovina Konvertibilna Marka(BAM)",  "Botswana Pula(BWP)",  "Brazilian Real(BRL)",  "British Pound(GBP)",  "Brunei Dollar(BND)",  "Bulgarian Lev(BGN)",  "Burundi Franc(BIF)",  "CFP Franc(XPF)",  "Cambodian Riel(KHR)",  "Canadian Dollar(CAD)",  "Cape Verdean Escudo(CVE)",  "Cayman Islands Dollar(KYD)",  "Central African CFA) Franc(XAF)",  "Chilean Peso(CLP)",  "Chilean Unit Of Account(CLF)",  "Chinese Yuan(CNY)",  "Colombian Peso(COP)",  "Comorian Franc(KMF)",  "Congolese Franc(CDF)",  "Costa Rican Colon(CRC)",  "Croatian Kuna(HRK)",  "Cuban Convertible Peso(CUC)",  "Cuban Peso(CUP)",  "Czech Koruna(CZK)",  "Danish Krone(DKK)",  "Djiboutian Franc(DJF)",  "Dominican Peso(DOP)",  "East Caribbean Dollar(XCD)",  "Egyptian Pound(EGP)",  "Eritrean Nakfa(ERN)",  "Ethiopian Birr(ETB)",  "Euro(EUR)",  "Falkland Islands Pound(FKP)",  "Fijian Dfollar(FJD)",  "Gambian Dalasi(GMD)",  "Georgian Lari(GEL)",  "Ghanaian Cedi(GHS)",  "Gibraltar Pound(GIP)",  "Guatemalan Quetzal(GTQ)",  "Guernsey Pound(GGP)",  "Guinean Franc(GNF)",  "Guyanese Dollar(GYD)",  "Haitian Gourde(HTG)",  "Honduran Lempira(HNL)",  "Hong Kong Dollar(HKD)",  "Hungarian Forint(HUF)",  "Icelandic Króna(ISK)",  "Indian Rupee(INR)",  "Indonesian Rupiah(R)",  "Iranian Rial(IRR)",  "Iraqi Dinar(IQD)",  "Israeli New Sheqel(ILS)",  "Jamaican Dollar(JMD)",  "Japanese Yen(JPY)",  "Jersey Pound(JEP)",  "Jordanian Dinar(JOD)",  "Kazakhstani Tenge(KZT)",  "Kenyan Shilling(KES)",  "Kuwaiti Dinar(KWD)",  "Kyrgyzstani Som(KGS)",  "Lao Kip(LAK)",  "Latvian Lats(LVL)",  "Lebanese Lira(LBP)",  "Lesotho Loti(LSL)",  "Liberian Dollar(LRD)",  "Libyan Dinar(LYD)",  "Macanese Pataca(MOP)",  "Macedonian Denar(MKD)",  "Malagasy Ariary(MGA)",  "Malawian Kwacha(MWK)",  "Malaysian Ringgit(MYR)",  "Maldivian Rufiyaa(MVR)",  "Manx pound(IMP)",  "Mauritanian Ouguiya(MRO)",  "Mauritian Rupee(MUR)",  "Mexican Peso(MXN)",  "Moldovan Leu(MDL)",  "Mongolian Tugrik(MNT)",  "Moroccan Dirham(MAD)",  "Mozambican Metical(MZN)",  "Myanma Kyat(MMK)",  "Namibian Dollar(NAD)",  "Nepalese Rupee(NPR)",  "Netherlands Antillean Gulden(ANG)",  "New Belarusian Ruble(BYN)",  "New Taiwan Dollar(TWD)",  "New Zealand Dollar(NZD)",  "Nicaraguan Cordoba(NIO)",  "Nigerian Naira(NGN)",  "North Korean Won(KPW)",  "Norwegian Krone(NOK)",  "Old Zambian Kwacha(ZMK)",  "Omani Rial(OMR)",  "Paanga(TOP)",  "Pakistani Rupee(PKR)",  "Panamanian Balboa(PAB)",  "Papua New Guinean Kina(PGK)",  "Paraguayan Guarani(PYG)",  "Peruvian Nuevo Sol(PEN)",  "Philippine Peso(PHP)",  "Polish Zloty(PLN)",  "Qatari Riyal(QAR)",  "Romanian Leu(RON)",  "Russian Ruble(RUB)",  "Rwandan Franc(RWF)",  "Saint Helena Pound(SHP)",  "Salvadoran Colón(SVC)",  "Samoan Tala(WST)",  "Sao Tome And Principe Dobra(STD)",  "Saudi Riyal(SAR)",  "Serbian Dinar(RSD)",  "Seychellois Rupee(SCR)",  "Sierra Leonean Leone(SLL)",  "Silver (troy ounce) (XAG)",  "Singapore Dollar(SGD)",  "Solomon Islands Dollar(SBD)",  "Somali Shilling(SOS)",  "South African Rand(ZAR)",  "South Korean Won(KRW)",  "Special Drawing Rights(XDR)",  "Sri Lankan Rupee(LKR)",  "Sudanese Pound(SDG)",  "Surinamese Dollar(SRD)",  "Swazi Lilangeni(SZL)",  "Swedish Krona(SEK)",  "Swiss Franc(CHF)",  "Syrian Pound(SYP)",  "Tajikistani Somoni(TJS)",  "Tanzanian Shilling(TZS)",  "Thai Baht(THB)",  "Trinad and Tobago Dollar(TTD)",  "Tunisian Dinar(TND)",  "Turkish New Lira(TRY)",  "Turkmenistan Manat(TMT)",  "UAE Dirham(AED)",  "Ugandan Shilling(UGX)",  "Ukrainian Hryvnia(UAH)",  "United States Dollar(USD)",  "Uruguayan Peso(UYU)",  "Uzbekistani Som(UZS)",  "Vanuatu Vatu(VUV)",  "Venezuelan Bolivar(VEF)",  "Vietnamese Dong(VND)",  "West African CFA Franc(XOF)",  "Yemeni Rial(YER)",  "Zambian Kwacha(ZMW)",  "Zimbabwean Dollar(ZWL)"]
    
    var filterdata:[String]!
    
    var selectType:String!
    var selectedData:String!
  
  
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tblview: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        filterdata = array
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        //ترتيب البحث
        if filterdata.count != 0 {
            cell.textLabel!.text = filterdata[indexPath.row]
        }
        else {
            cell.textLabel!.text = array[indexPath.row]
        }
        
        return cell
    }
    
    //محرك البحث ودخال البينات
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterdata  = searchText.isEmpty ? array : array.filter {(item : String) -> Bool in
            
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        tblview.reloadData()
    }
    
    //ارسال المعلومت
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedData = filterdata[indexPath.row]
        let data = ["userInfo": ["data": selectedData!]]
        NotificationCenter.default
            .post(name: NSNotification.Name("pass data"),
                  object: nil,
                  userInfo: data)
        self.navigationController?.popViewController(animated: true)
        
    }
    
}


