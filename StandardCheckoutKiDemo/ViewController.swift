//
//  ViewController.swift
//  StandardCheckoutKiDemo
//
//  Created by Vinicius on 09/06/17.
//  Copyright © 2017 Paymentz. All rights reserved.
//

import UIKit
import StandardCheckoutKit

class ViewController: UIViewController, StandardCheckoutDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    @IBAction func pay(_ sender: UIButton) {
        
//        let secureKey = "bzI93aEQeYDeE50Pa929NiDk3us8XTbU"
        let secureKey = "YOiHKCvM2XSHcMEMbBrHCYzNS8iIZOi4"
        
        let requestParameters = RequestParameters()
        requestParameters.memberId = "13219"
//        requestParameters.paymentMode = PaymentMode().cc
        requestParameters.paymentMode = ""
        requestParameters.terminalId = ""
        requestParameters.merchantTransactionId = "random566"
        requestParameters.amount = "50.00"
        requestParameters.currency = "INR"
        requestParameters.toType = "paymentz"
//        requestParameters.paymentBrand = PaymentBrand().visa
        requestParameters.paymentBrand = ""
        requestParameters.merchantRedirectUrl = "www.paymentz.com"
        requestParameters.tmplAmount = "50.00"
        requestParameters.tmplCurrency = "INR"
        requestParameters.orderDescription = "Test"
        requestParameters.country = "IN"
        requestParameters.state = "MH"
        requestParameters.street = "Malad"
        requestParameters.city = "Mumbai"
        requestParameters.email = "snehal@paymentz.com"
        requestParameters.postCode = "400064"
        requestParameters.telnocc = "+91"
        requestParameters.phone = "9096831666"
//        requestParameters.hostUrl = "https://sandbox.paymentplug.com/transaction/Checkout"
        requestParameters.hostUrl = "https://test.paymentz.com/transaction/Checkout"
        requestParameters.device = "ios"
        let standardCheckout = StandardCheckout(viewController: self)
        standardCheckout.initPayment(requestParameters: requestParameters, standardCheckoutDelegate: self, secureKey: secureKey)
    }

    // Delegate methods is where you will receive the payment result
    func onSuccess(standardCheckoutResult: StandardCheckoutResult) {
        let resultViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        let json = standardCheckoutResult.json
        resultViewController.standardCheckoutResult = "\(json)"
        resultViewController.modalPresentationStyle = .currentContext
        let resultNavigationController: UINavigationController = UINavigationController(rootViewController: resultViewController)
        self.present(resultNavigationController, animated: true, completion: nil)
    }
    
    func onFail() {
        let alert = UIAlertController(title: "Fail", message: "Fail transaction", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

