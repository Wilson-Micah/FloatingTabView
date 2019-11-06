//
//  TabItem.swift
//  FloatingTabView
//
//  Created by Micah Wilson on 11/5/19.
//  Copyright © 2019 micahwilson. All rights reserved.
//

import SwiftUI

public struct TabItem: Identifiable {
	public let image: Image
	public let title: String
	public let selectedColor: Color
	public let defaultColor: Color
	public var id: String {
		title
	}
	
	public init(image: Image, title: String, selectedColor: Color, defaultColor: Color = .white) {
		self.image = image
		self.title = title
		self.selectedColor = selectedColor
		self.defaultColor = defaultColor
	}
}
