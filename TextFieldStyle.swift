//
//  TextFieldStyle.swift
//  TextFieldPro
//
//  Created by Nitish Kumar on 29/03/25.
//


import SwiftUI

public enum TextFieldStyle {
    case borderless
    case underline(color: Color, width: CGFloat, activeColor: Color?)
    case bordered(color: Color, width: CGFloat, activeColor: Color?)
    case rounded(color: Color, width: CGFloat, cornerRadius: CGFloat, activeColor: Color?)
    case dashed(color: Color, width: CGFloat, dashPattern: [CGFloat], activeColor: Color?)
    case dotted(color: Color, width: CGFloat, dotPattern: [CGFloat], activeColor: Color?)
}
