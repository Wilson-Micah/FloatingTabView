//
//  TabItem.swift
//  FloatingTabView
//
//  Created by Micah Wilson on 11/5/19.
//  Copyright © 2019 micahwilson. All rights reserved.
//

import SwiftUI

public struct TabItem {
	public let image: Image
	public let title: String
	public let selectedColor: Color
	public let defaultColor: Color
	public let view: AnyView
	
	public init<Content: View>(image: Image, title: String, selectedColor: Color, defaultColor: Color = .white, content: Content) {
		self.image = image
		self.title = title
		self.selectedColor = selectedColor
		self.defaultColor = defaultColor
		self.view = AnyView(content)
	}
}
