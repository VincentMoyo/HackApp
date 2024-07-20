//
//  CardLinkingViewController.swift
//  HackApp
//
//  Created by Vincent Moyo on 2024/07/20.
//

import UIKit

class CardLinkingViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var monthDate: UITextField!
    @IBOutlet weak var yearDate: UITextField!
    @IBOutlet weak var cvvNumber: UITextField!
    @IBOutlet weak var accountType: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    @IBAction func payButton(_ sender: Any) {
        guard let cardName = cardName.text, !cardName.isEmpty,
              let cardNumber = cardNumber.text, validateCardNumber(cardNumber),
              let month = monthDate.text, validateMonth(month),
              let year = yearDate.text, validateYear(year),
              let cvv = cvvNumber.text, validateCVV(cvv) else {
                  
            let payButton = sender as? UIButton
            payButton?.isEnabled = false
            showAlert("Invalid input", "Please check your card details and try again.")
            payButton?.isEnabled = true
            return
        }
        
        // ID
        let cardID = UUID().uuidString
        
        // Create card details
        let cardDetails: [String: Any] = [
            "cardName": cardName,
            "cardNumber": cardNumber,
            "expiryMonth": month,
            "expiryYear": year,
            "cvv": cvv,
            "cardID": cardID
        ]
        
        // Send card details to the API
//        sendCardDetailsToAPI(cardDetails)
    }
    
   
    func validateCardNumber(_ cardNumber: String) -> Bool {
        let cardNumberRegex = "^[0-9]{16}$"
        let cardNumberTest = NSPredicate(format: "SELF MATCHES %@", cardNumberRegex)
        return cardNumberTest.evaluate(with: cardNumber)
    }
    
    func validateMonth(_ month: String) -> Bool {
        let monthRegex = "^(0[1-9]|1[0-2])$"
        let monthTest = NSPredicate(format: "SELF MATCHES %@", monthRegex)
        return monthTest.evaluate(with: month)
    }
    
    func validateYear(_ year: String) -> Bool {
        let yearRegex = "^[0-9]{2}$"
        let yearTest = NSPredicate(format: "SELF MATCHES %@", yearRegex)
        return yearTest.evaluate(with: year)
    }
    
    func validateCVV(_ cvv: String) -> Bool {
        let cvvRegex = "^[0-9]{3,4}$"
        let cvvTest = NSPredicate(format: "SELF MATCHES %@", cvvRegex)
        return cvvTest.evaluate(with: cvv)
    }
    
    func showAlert(_ title: String, _ message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
//    func sendCardDetailsToAPI(_ cardDetails: [String: Any]) {
//
//        let apiUrl = "https://yourapi.com/card-linking"
//
//
//        guard let jsonData = try? JSONSerialization.data(withJSONObject: cardDetails, options: []) else {
//            showAlert("Error", "Failed to encode card details")
//            return
//        }
//
//        URLSession.shared.request(endpoint: apiUrl, method: .post) { (result: Result<YourResponseModel, APIError>) in
//            switch result {
//            case .success(let response):
//                DispatchQueue.main.async {
//                    self.showAlert("Success", "Card linked successfully: \(response)") { _ in
//                        self.performSegue(withIdentifier: "CardLinkedSegue", sender: self)
//                    }
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self.showAlert("Error", "Failed to send card details: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
}
