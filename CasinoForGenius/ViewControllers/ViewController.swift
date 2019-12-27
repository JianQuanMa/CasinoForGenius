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
    var cal: Calculator!
    override func viewDidLoad() {
        super.viewDidLoad()
        cal = Calculator()
        setUptextFields()
        setUpTextView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    //MARK: helper funcs
    private func setUptextFields(){
        self.minTextField.delegate = self
        self.maxTextField.delegate = self
    }
    private func setUpTextView(){
        self.inputTextView.delegate = self
    }
    private func prompt(messsage: String){
        self.promptLabel.text = messsage
    }
    
    private func displayWarning(type: InputError){
        var string: String!
        switch type {
        case .minMissing:
            string = "lower boundary missing!"
        case .maxMissing:
            string = "upper boundary missing!"
        case .textMissing:
            string = "no numbers chosen"
        case .inputOutOfBoundaries:
            string = "input out of boundaries"
        }
        prompt(messsage: string)
    }
    
    //MARK: UI Actions
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if self.minTextField.text?.isEmpty ?? true {displayWarning(type: .minMissing); return }
        if self.maxTextField.text?.isEmpty ?? true {displayWarning(type: .maxMissing); return }
        if self.inputTextView.text?.isEmpty ?? true {displayWarning(type: .textMissing); return}
        do{ let result = cal.calculateAndAnalyize(min: try self.minTextField.text!.intValue(), max: try self.maxTextField.text!.intValue(), text: self.inputTextView.text)
            var displayString: String!
            switch result {
            case .inputOutOfBoundaries:
                displayString = "check your input, it is out of boundaries"
            case .exist(let intValue):
                displayString = "the winner is \(intValue)"
            case .notExist:
                displayString = "an error has ocurred!"
            }
            prompt(messsage: displayString)
        }catch {}
        
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
        let digitSet = NSCharacterSet(charactersIn: "0123456789,").inverted
        let componentsSeperatedByCharInSet = text.components(separatedBy: digitSet)
        let numberFilted = componentsSeperatedByCharInSet.joined(separator: "")
        return text == numberFilted
    }
}
