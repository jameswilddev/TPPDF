//
//  PDFTableContent.swift
//  TPPDF
//
//  Created by Philip Niedertscheider on 13/06/2017.
//
//

public class PDFTableContent : TPJSONSerializable {
    
    enum ContentType : TPJSONSerializable {
        case none
        case string
        case attributedString
        case image
        
        var JSONRepresentation: AnyObject {
            return self.hashValue as AnyObject
        }
    }
    
    var type: ContentType = ContentType.none
    var content: Any?
    
    public init(content: Any?) throws {
        try self.setContent(content: content)
    }
    
    func setContent(content: Any?) throws {
        if content == nil {
            self.type = .none
            self.content = nil
        } else if content is String {
            self.type = .string
            self.content = content
        } else if content is UIImage {
            self.type = .image
            self.content = content
        } else if content is NSAttributedString {
            self.type = .attributedString
            self.content = content
        } else if content is Int || content is Double || content is Float {
            self.type = .string
            self.content = String(describing: content)
        } else {
            throw PDFError.tableContentInvalid(value: content)
        }
    }
    
    var isString: Bool {
        return type == .string
    }
    
    var isAttributedString: Bool {
        return type == .attributedString
    }
    
    var isImage: Bool {
        return type == .image
    }
    
    var stringValue: String? {
        return type == .string ? content as? String : nil
    }
    
    var attributedStringValue: NSAttributedString? {
        return type == .attributedString ? content as? NSAttributedString : nil
    }
    
    var imageValue: UIImage? {
        return type == .image ? content as? UIImage : nil
    }
    
    public var JSONRepresentation: AnyObject {
        return "CONTENT" as AnyObject
    }
}

public extension String {
    
    func toPDFTableContent() -> PDFTableContent {
        return try! PDFTableContent(content: self)
    }
}

public extension NSAttributedString {
    
    func toPDFTableContent() -> PDFTableContent {
        return try! PDFTableContent(content: self)
    }
}

public extension UIImage {
    
    func toPDFTableContent() -> PDFTableContent {
        return try! PDFTableContent(content: self)
    }
}
