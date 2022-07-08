//
//  ViewController.swift
//  LEDBoard
//
//  Created by Y on 2022/07/06.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.numberOfLines = 0
        
        inputTextField.delegate = self
        
        designButton(buttonOutletVariableName: sendButton, buttonTitle: "전송")
        designTextField()
        
        inputTextField.returnKeyType = .done
        
        let buttonArray = [sendButton, textColorButton]
        for item in buttonArray {
            item?.backgroundColor = .blue
            item?.layer.cornerRadius = 2
            
        }
        
        // 아웃렛 컬렉션
        //for item in buttonList{
        //  item.backgroundColor = .blue
        //  item.layer.cornerRadius = 2
        //}
        
    }
    
    func designTextField() {
        inputTextField.placeholder = "내용을 작성해주세요."
        inputTextField.text = "안녕하세요."
        inputTextField.keyboardType = .emailAddress
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder() // TextField 비활성화
            return true
        }
    
    //buttonOutletVariableName = 외부 매개변수, Argugent Label, _로 생략가능(와일드 카드 식별자)
    //buttonName = 내부 매개변수, Parameter Name
    func designButton(buttonOutletVariableName buttonName: UIButton, buttonTitle: String) {
        buttonName.setTitle(buttonTitle, for: .normal)
        buttonName.setTitle("빨리보내!", for: .highlighted)
        buttonName.backgroundColor = .yellow
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(.red, for: .normal)
        buttonName.setTitleColor(.blue, for: .highlighted)
    }
    
    

    @IBAction func sendButtonClicked(_ sender: UIButton) {
        resultLabel.text = inputTextField.text
        view.endEditing(true)
    }
    
    
    
    
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
        if textView.isHidden == false{
            textView.isHidden = true
        } else if textView.isHidden == true{
            textView.isHidden = false
        }
        
    }
    
}

