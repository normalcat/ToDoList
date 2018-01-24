//
//  AddThingViewController.swift
//  TodoList
//
//  Created by Chao-I Chen on 1/23/18.
//  Copyright © 2018 Chao-I Chen. All rights reserved.
//

import UIKit

class AddThingViewController: UIViewController {

    @IBOutlet weak var taskText: UITextField!
    @IBOutlet weak var selectedDate: UIDatePicker!
    @IBOutlet weak var titleText: UITextField!
    weak var delegate: SubmitAddThingDelegate?

    @IBAction func submitPressed(_ sender: UIButton) {
        let text = titleText.text
        let note = taskText.text
        
        delegate?.itemSubmit(by: self, with: text!, with: note!, and: selectedDate.date)
    }
    @IBOutlet weak var titleField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
