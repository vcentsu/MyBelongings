//
//  AddItemViewController.swift
//  MyBelongings
//
//  Created by Vincentius Sutanto on 28/04/22.
//

import UIKit

class AddItemViewController: UIViewController {

    private var type: Bool!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var category: UIButton!
    @IBOutlet weak var descText: UITextField!
    
    @IBOutlet weak var importantBtn: UIButton!
    @IBOutlet weak var normalBtn: UIButton!
    
    var selectedCategory : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        normalBtn.titleLabel?.textColor = .black
        importantBtn.titleLabel?.textColor = .black
        
    }
    
    @objc func didTapClose(){
        dismiss(animated: true)
    }
    
    @IBAction func selectImportant(_ sender: Any) {
        type = true
        if (type) {
            print("Important")
        }
        importantBtn.backgroundColor = .yellow
        normalBtn.backgroundColor = .clear
    }
    
    @IBAction func selectNormal(_ sender: Any) {
        type = false
        if (type == false) {
            print("Normal")
        }
        normalBtn.backgroundColor = .yellow
        importantBtn.backgroundColor = .clear
    }
    
    @IBAction func selectCategory(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "category") as? CategoryViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pressAdd(_ sender: Any) {
        if checkInput(){
        
        }
    }
    
    func checkInput() -> Bool {

        let inputTitle = titleText.text
        let inputType = ""
        let inputCat = ""

        if !inputTitle!.isEmpty && !inputType.isEmpty && !inputCat.isEmpty {

            if selectedCategory != "" {
                return true
            }
            else{
                showCatAlert()
                return false
            }
        }
        showAlert()
        return false
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Empty Input", message: "Fill all the input to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
    }
    
    func showCatAlert(){
        let alert = UIAlertController(title: "No Category Selected", message: "Select a category to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        if let vc = seg.source as? CategoryViewController {
            category.setTitle(vc.pickCategory, for: .normal)
            print(vc.pickCategory)
            selectedCategory = vc.pickCategory
        }
    }
}
