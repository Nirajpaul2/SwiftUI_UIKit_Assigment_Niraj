//
//  CustomSearchBar.swift
//  IlaBankDemoUIKit_Niraj
//
//  Created by niraj paul on 26/12/24.
//

import UIKit

class TextFieldView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Varibales
    var textDidChange: ((String?) -> Bool)?
    var textFieldShouldReturn: (() -> Bool)?
    
    var text: String? {
        didSet { textField.text = text }
    }
    var placeholder: String? {
        didSet { textField.placeholder = placeholder }
    }
    var textColor: UIColor? {
        didSet { textField.textColor = textColor }
    }
    var font: UIFont? {
        didSet { textField.font = font }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

private extension TextFieldView {
    func commonInit() {
        Bundle.main.loadNibNamed(self.className, owner: self, options: nil)
        contentView.setFixInView(self)
        textField.delegate = self
    }
}

// MARK: TextField delegate method
extension TextFieldView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let textDidChange = textDidChange else {
            return true
        }
        guard let text = textField.text else {
            return false
        }
        guard let stringRange = Range(range, in: text) else {
            return false
        }

        let newString = text.replacingCharacters(in: stringRange, with: string)
        let shouldChange = textDidChange(newString)
        return shouldChange
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textFieldShouldReturn = textFieldShouldReturn else {
            return true
        }
        let shouldReturn = textFieldShouldReturn()
        return shouldReturn
    }
}
