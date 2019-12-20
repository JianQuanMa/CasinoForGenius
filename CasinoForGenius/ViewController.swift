//
//  ViewController.swift
//  CasinoForGenius
//
//  Created by Jian Ma on 12/20/19.
//  Copyright © 2019 Jian Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: UI outlets
    @IBOutlet weak var minTextField: UITextField!
    @IBOutlet weak var inclusiveSwitch: UISwitch!
    @IBOutlet weak var maxTextField: UITextField!
    @IBOutlet weak var isIntOnlySwitch: UISwitch!
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: UI Actions
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
    
}

