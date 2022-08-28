//
//  ViewController.swift
//  Layout.homework
//
//  Created by 100nout on 27.08.22.
//

import UIKit

protocol MyDataSendingDelegateProtocol {
    func sendDataToViewController(myData: String)
}

class ViewController: UIViewController, MyDataSendingDelegateProtocol {
    
    var delegate: MyDataSendingDelegateProtocol? = nil
    
    @IBOutlet weak var dataToSendTextField: UITextView!
    
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageName = "diy-paper-flowers-1582662788.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageViewWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: 150)
        let imageViewHeightConstrint = imageView.heightAnchor.constraint(equalToConstant: 150)
        NSLayoutConstraint.activate([imageViewWidthConstraint, imageViewHeightConstrint])
        
        let firstNameLabel                                   = UILabel()
        firstNameLabel.text                                  = String("First")
        
        let middleNameLabel                                  = UILabel()
        middleNameLabel.text                                 = String("Middle")
        
        let lastNameLabel                                    = UILabel()
        lastNameLabel.text                                   = String("Last")
        
        let firstNameTextField                               = UITextField()
        firstNameTextField.borderStyle                       = .roundedRect
        firstNameTextField.placeholder                       = "Enter First Name"
        
        let middleNameTextField                              = UITextField()
        middleNameTextField.borderStyle                      = .roundedRect
        middleNameTextField.placeholder                      = "Enter Middle Name"
        
        let lastNameTextField                                = UITextField()
        lastNameTextField.borderStyle                        = .roundedRect
        lastNameTextField.placeholder                        = "Enter Last Name"
        
        let saveButton                                       = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        
        let cancelButton                                     = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        
        let clearButton                                      = UIButton()
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(.systemBlue, for: .normal)
        
//        let textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.text = "Notes:"
        
        let outsideVStackView                                = UIStackView()
        outsideVStackView.axis                               = .vertical
        outsideVStackView.spacing                            = 10
        
        let topThirdHStackView                               = UIStackView()
        topThirdHStackView.axis                              = .horizontal
        topThirdHStackView.spacing                           = 10
        
        let topThirdVStackViewForLabels                      = UIStackView()
        topThirdVStackViewForLabels.axis                     = .vertical
        topThirdVStackViewForLabels.distribution             = .fillEqually
        topThirdVStackViewForLabels.spacing                  = 5
        
        let topThirdVStackViewForTextFields                  = UIStackView()
        topThirdVStackViewForTextFields.axis                 = .vertical
        topThirdVStackViewForTextFields.distribution         = .fillEqually
        topThirdVStackViewForTextFields.spacing              = 5
        
        let bottomThirdHStackView                            = UIStackView()
        bottomThirdHStackView.axis                           = .horizontal
        bottomThirdHStackView.distribution                   = .fillEqually
        bottomThirdHStackView.spacing                        = 10
        
        bottomThirdHStackView.addArrangedSubview(saveButton)
        bottomThirdHStackView.addArrangedSubview(cancelButton)
        bottomThirdHStackView.addArrangedSubview(clearButton)
        
        topThirdVStackViewForTextFields.addArrangedSubview(firstNameTextField)
        topThirdVStackViewForTextFields.addArrangedSubview(middleNameTextField)
        topThirdVStackViewForTextFields.addArrangedSubview(lastNameTextField)
        
        topThirdVStackViewForLabels.addArrangedSubview(firstNameLabel)
        topThirdVStackViewForLabels.addArrangedSubview(middleNameLabel)
        topThirdVStackViewForLabels.addArrangedSubview(lastNameLabel)
        
        topThirdHStackView.addArrangedSubview(imageView)
        topThirdHStackView.addArrangedSubview(topThirdVStackViewForLabels)
        topThirdHStackView.addArrangedSubview(topThirdVStackViewForTextFields)
        
        outsideVStackView.addArrangedSubview(topThirdHStackView)
        outsideVStackView.addArrangedSubview(textView)
        outsideVStackView.addArrangedSubview(bottomThirdHStackView)
        
        self.view.addSubview(outsideVStackView)
        outsideVStackView.translatesAutoresizingMaskIntoConstraints                                                      = false
        outsideVStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive       = true
        outsideVStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        outsideVStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive     = true
        outsideVStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive  = true
        
        // Do any additional setup after loading the view.
    }
    
    func sendDataToViewController(myData: String) {
            self.textView.text = "myData"
        }


}

