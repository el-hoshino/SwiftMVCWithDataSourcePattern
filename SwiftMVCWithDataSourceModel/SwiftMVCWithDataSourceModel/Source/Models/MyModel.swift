//
//  MyModel.swift
//  SwiftMVCWithDataSourceModel
//
//  Created by 史翔新 on 2016/03/26.
//  Copyright © 2016年 史翔新. All rights reserved.
//

import UIKit

protocol MyModelDelegate {
	func dataHasUpdated()
}

class MyModel: NSObject {
	
	var delegate: MyModelDelegate?
	
	var title: String {
		didSet {
			self.delegate?.dataHasUpdated()
		}
	}
	
	override init() {
		
		self.title = "Hello, world!"
		
		super.init()
		
	}
	
	func increaseTitle() {
		
		self.title += "!"
		
	}
	
}

extension MyModel: MyViewDataSource {
	var titleString: String {
		return self.title
	}
}
