//
//  PDFTableCellStyle.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 11/08/2017.
//
//

public typealias PDFTableCellBorders = (left: PDFLineStyle, top: PDFLineStyle, right: PDFLineStyle, bottom: PDFLineStyle)

public struct PDFTableCellStyle : TPJSONSerializable {
    
    public var colors: (fill: UIColor, text: UIColor)
    public var borders: PDFTableCellBorders
    public var font: UIFont
    
    public init(colors: (fill: UIColor, text: UIColor) = (UIColor.clear, UIColor.black), borders: PDFTableCellBorders = (PDFLineStyle(), PDFLineStyle(), PDFLineStyle(), PDFLineStyle()), font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)) {
        self.colors = colors
        self.borders = borders
        self.font = font
    }
    
    public var JSONRepresentation: AnyObject {
        return "STYLE" as AnyObject
    }
}
