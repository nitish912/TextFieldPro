// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


public struct TextFieldPro: View {
    @Binding var text: String
    var placeholder: String
    var style: TextFieldStyle = .borderless
    var font: Font = .body
    var accentColor: Color = .blue
    var clearsOnBeginEditing: Bool = false
    var onEditingEnded: (() -> Void)? = nil
    var multilineTextAlignment: TextAlignment = .leading
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType? = nil
    var autocapitalization: TextInputAutocapitalization = .sentences
    var autocorrectionDisabled: Bool = false
    var isSecure: Bool = false
    var submitLabel: SubmitLabel = .return
    var onSubmit: (() -> Void)? = nil
    var backgroundColor: Color = .clear
    var cornerRadius: CGFloat = 0
    var characterLimit: Int?
    
    // Closure that is called when character limit is exceeded
    var onCharacterLimitExceeded: ((Bool) -> Void)?
   
    @FocusState private var isFocused: Bool
    
    public init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    public func style(_ style: TextFieldStyle) -> Self {
        var copy = self
        copy.style = style
        return copy
    }
    
    public func accentColor(_ color: Color) -> Self {
        var copy = self
        copy.accentColor = color
        return copy
    }
    
    public func clearsOnBeginEditing(_ clears: Bool) -> Self {
        var copy = self
        copy.clearsOnBeginEditing = clears
        return copy
    }
    
    public func onEditingEnded(_ action: @escaping () -> Void) -> Self {
        var copy = self
        copy.onEditingEnded = action
        return copy
    }
    
    public func multilineTextAlignment(_ alignment: TextAlignment) -> Self {
        var copy = self
        copy.multilineTextAlignment = alignment
        return copy
    }
    
    public func keyboardType(_ type: UIKeyboardType) -> Self {
        var copy = self
        copy.keyboardType = type
        return copy
    }
    
    public func textContentType(_ type: UITextContentType) -> Self {
        var copy = self
        copy.textContentType = type
        return copy
    }
    
    public func autocapitalization(_ style: TextInputAutocapitalization) -> Self {
        var copy = self
        copy.autocapitalization = style
        return copy
    }
    
    public func autocorrectionDisabled(_ disabled: Bool) -> Self {
        var copy = self
        copy.autocorrectionDisabled = disabled
        return copy
    }
    
    public func isSecure(_ secure: Bool) -> Self {
        var copy = self
        copy.isSecure = secure
        return copy
    }
    
    public func submitLabel(_ label: SubmitLabel) -> Self {
        var copy = self
        copy.submitLabel = label
        return copy
    }
    
    public func onSubmit(_ action: @escaping () -> Void) -> Self {
        var copy = self
        copy.onSubmit = action
        return copy
    }
    
    public func backgroundColor(_ color: Color) -> Self {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
    
    public func cornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }
    
    public func characterLimit(_ limit: Int, onExceeded: @escaping (Bool) -> Void) -> Self {
        var copy = self
        copy.characterLimit = limit
        copy.onCharacterLimitExceeded = onExceeded
        return copy
    }
    
    public var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .onChange(of: text) { newValue in
            applyCharacterLimit(newValue)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(backgroundView)
        .accentColor(accentColor)
        .focused($isFocused)
        .multilineTextAlignment(multilineTextAlignment)
        .keyboardType(keyboardType)
        .autocorrectionDisabled(autocorrectionDisabled)
        .submitLabel(submitLabel)
        .onSubmit { onSubmit?() }
        .onTapGesture {
            if clearsOnBeginEditing {
                text = ""
            }
        }
    }
    
    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .borderless:
            EmptyView()
        case .underline(let color, let width, let activeColor):
            Rectangle()
                .frame(height: width)
                .foregroundColor(isFocused ? (activeColor ?? color) : color)
                .offset(y: 18)
        case .bordered(let color, let width, let activeColor):
            RoundedRectangle(cornerRadius: 4)
                .stroke(isFocused ? (activeColor ?? color) : color, lineWidth: width)
        case .rounded(let color, let width, let cornerRadius, let activeColor):
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(isFocused ? (activeColor ?? color) : color, lineWidth: width)
        case .dashed(let color, let width, let dashPattern, let activeColor):
            RoundedRectangle(cornerRadius: 4)
                .stroke(style: StrokeStyle(lineWidth: width, dash: dashPattern))
                .foregroundColor(isFocused ? (activeColor ?? color) : color)
        case .dotted(let color, let width, let dotPattern, let activeColor):
            RoundedRectangle(cornerRadius: 4)
                .stroke(style: StrokeStyle(lineWidth: width, dash: dotPattern))
                .foregroundColor(isFocused ? (activeColor ?? color) : color)
        }
    }
    
    private func applyCharacterLimit(_ newValue: String) {
        if let limit = characterLimit {
            let exceeded = newValue.count > limit
            onCharacterLimitExceeded?(exceeded)
            
            if exceeded {
                text = String(newValue.prefix(limit))
            }
        }
    }
}
