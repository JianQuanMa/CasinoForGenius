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
    private var isInclusive: Bool?
    private var isIntOnly: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUptextFields()
        setUpTextView()
        
    }
    //MARK: helper funcs
    private func setUptextFields(){
        self.minTextField.delegate = self
        self.maxTextField.delegate = self
    }
    private func setUpTextView(){
        self.inputTextView.delegate = self
    }
    private func convertTextToNumbers(text: String) -> [Int]{
        
        
        return []
    }
    
    //MARK: UI Actions
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        
    }
    
    
}

extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let digitSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let componentsSeperatedByCharInSet = string.components(separatedBy: digitSet)
        let numberFilted = componentsSeperatedByCharInSet.joined(separator: "")
        return string == numberFilted
    }
}

extension ViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let digitSet = NSCharacterSet(charactersIn: "0123456789, ").inverted
        let componentsSeperatedByCharInSet = text.components(separatedBy: digitSet)
        let numberFilted = componentsSeperatedByCharInSet.joined(separator: "")
        return text == numberFilted
    }
}

