//
//  ViewController.swift
//  indiKadai-2
//
//  Created by Taishi Kusunose on 2021/11/21.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var calcSegmentControll: UISegmentedControl!
    @IBOutlet private weak var resultLabel: UILabel!
    
    @IBAction private func didTapCalcButton(_ sender: Any){
        let num = calcSegmentControll.selectedSegmentIndex
        let calcOption = CalculationOption(rawValue: num) ?? .plus
        resultLabel.text = calculate(option: calcOption)}
    
    private func calculate(option: CalculationOption) -> String? {
        guard let num1 = textField1.text.flatMap({ Double($0) }), let num2 = textField2.text.flatMap({ Double($0) }) else {
            return "エラー：数値を入力してください"
        }

        do {
            let result = try option.calclate(with: num1, num2)
            return String(result)
        } catch CalculationOption.Error.divisorIsZero {
            return "割る数には0以外を入力してください"
        } catch {
            return nil
        }
    }
}

enum CalculationOption: Int {
    enum Error: Swift.Error {
        case divisorIsZero
    }

    case plus
    case minus
    case multiple
    case division

    func calclate(with num1: Double, _ num2: Double) throws -> Double {
        switch self {
        case .plus:
            return num1 + num2
        case .minus:
            return num1 - num2
        case .multiple:
            return num1 * num2
        case .division:
            guard num2 != 0 else {
                throw Error.divisorIsZero
            }
            return num1 / num2
        }
    }
}
