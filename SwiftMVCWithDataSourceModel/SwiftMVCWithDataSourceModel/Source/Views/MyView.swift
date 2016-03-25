//
//  MyView.swift
//  SwiftMVCWithDataSourceModel
//
//  Created by 史翔新 on 2016/03/26.
//  Copyright © 2016年 史翔新. All rights reserved.
//

import UIKit

protocol MyViewDataSource {
	var titleString: String { get }
}

class MyView: UIView {
	
	var dataSource: MyViewDataSource?
	
	let titleLabel: UILabel
	
	init() {
		
		self.titleLabel = UILabel()
		
		super.init(frame: .zero)
		
		self.backgroundColor = .whiteColor()
		
		self.titleLabel.frame = CGRect(origin: .zero, size: self.frame.size)
		self.addSubview(self.titleLabel)
		self.titleLabel.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		self.titleLabel = UILabel()
		
		super.init(coder: aDecoder)
		
		self.titleLabel.frame = CGRect(origin: .zero, size: self.frame.size)
		self.addSubview(self.titleLabel)
		self.titleLabel.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		
	}
	
	override func didMoveToSuperview() {
		
		super.didMoveToSuperview()
		
		self.updateView()
		
	}
	
	func updateView() {
		
		self.titleLabel.text = self.dataSource?.titleString
		
	}
	
}
