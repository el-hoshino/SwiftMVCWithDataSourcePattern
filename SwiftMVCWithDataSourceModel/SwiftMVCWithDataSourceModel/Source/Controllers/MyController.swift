//
//  MyController.swift
//  SwiftMVCWithDataSourceModel
//
//  Created by 史翔新 on 2016/03/26.
//  Copyright © 2016年 史翔新. All rights reserved.
//

import UIKit

class MyController: UIViewController {
	
	let myModel: MyModel
	let myView: MyView
	
	init() {
		
		self.myModel = MyModel()
		self.myView = MyView()
		
		super.init(nibName: nil, bundle: nil)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		self.myModel = MyModel()
		self.myView = MyView()
		super.init(nibName: nil, bundle: nil)
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.myModel.delegate = self
		self.myView.dataSource = self.myModel
		
		self.myView.frame = CGRect(origin: .zero, size: self.view.frame.size)
		self.view.addSubview(myView)
		self.myView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		super.touchesEnded(touches, withEvent: event)
		
		self.myModel.increaseTitle()
		
	}
	
}

extension MyController: MyModelDelegate {
	func dataHasUpdated() {
		self.myView.updateView()
	}
}
