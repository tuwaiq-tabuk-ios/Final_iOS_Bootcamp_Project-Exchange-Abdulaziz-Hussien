//
//  RecordTableViewCell.swift
//  CurrencyConverter
//
//  Created by azooz alhwiti on 30/12/2021.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    //العمله الاولئ
    @IBOutlet weak var currency: UILabel!
    //العمله الثانيه
    @IBOutlet weak var currency1: UILabel!
    
    @IBOutlet weak var todaysDate: UILabel!
    
    @IBOutlet weak var Currencies: UILabel!
    
    @IBOutlet weak var TransferAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    
}

