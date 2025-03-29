# TextFieldPro
TextFieldPro is a versatile and customizable SwiftUI text field component with a variety of styling options, character limit enforcement, and other robust features.

## Features

- **Customizable Styles**: Options include borderless, underline, bordered, rounded, dashed, and dotted styles.
- **Character Limit**: Enforces character limits with callbacks for when limits are exceeded.
- **Secure Entry**: Toggle between secure and regular text entry.
- **Text Alignment and Input Options**: Supports multiline text alignment, keyboard types, and text content type configurations.
- **Autocapitalization and Autocorrection**: Configure autocapitalization and disable autocorrection as needed.
- **Accent Color**: Customize the accent color of the text field.
- **Submit Handling**: Handle submission actions with customizable submit labels and callbacks.
- **Background and Corner Radius**: Customize background color and corner radius.
- **Focus Management**: Provides focus state management.

## Installation

### Swift Package Manager

To include `TextFieldPro` in your project, add it as a dependency using Swift Package Manager.

1. **Open Your Project in Xcode**.
2. **Navigate to File > Add Packages**.
3. **Enter the Repository URL** for `TextFieldPro`:
https://github.com/yourusername/TextFieldPro.git
4. **Select the Version**: Choose the version of the package you want to integrate.
5. **Add the Package**: Follow the prompts to complete the integration.

Alternatively, you can add the package manually by editing your `Package.swift` file:
swift dependencies: [ .package(url: "https://github.com/nitish912/TextFieldPro.git", from: "1.0.0")
] ```

Update your target dependencies as well:

.target(
    name: "YourTargetName",
    dependencies: [
        "TextFieldPro"
    ]
),
Usage

Here's how you can use TextFieldPro in your SwiftUI views:
```swift
import SwiftUI
import TextFieldPro

struct DemoView: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var text3: String = ""
    @State private var text4: String = ""
    @State private var text5: String = ""
    @State private var text6: String = ""

    var body: some View {
        VStack(spacing: 20) {
            // Borderless style
            TextFieldPro("Borderless", text: $text1)
                .style(.borderless)
                .frame(height: 50)

            // Underline style
            TextFieldPro("Underline", text: $text2)
                .style(.underline(color: .red, width: 2, activeColor: .green))
                .frame(height: 50)

            // Bordered style
            TextFieldPro("Bordered", text: $text3)
                .style(.bordered(color: .blue, width: 2, activeColor: .orange))
                .frame(height: 50)

            // Rounded style
            TextFieldPro("Rounded", text: $text4)
                .style(.rounded(color: .purple, width: 2, cornerRadius: 15, activeColor: .pink))
                .frame(height: 50)

            // Dashed style
            TextFieldPro("Dashed", text: $text5)
                .style(.dashed(color: .gray, width: 2, dashPattern: [5, 3], activeColor: .red))
                .frame(height: 50)

            // Dotted style
            TextFieldPro("Dotted", text: $text6)
                .style(.dotted(color: .black, width: 2, dotPattern: [1, 3], activeColor: .yellow))
                .frame(height: 50)
        }
        .padding()
    }
}
```

<img width="236" alt="Screenshot 2025-03-29 at 4 59 33 PM" src="https://github.com/user-attachments/assets/d3ddab84-d5f2-4be9-99dd-5017fc7c5df9" />


Configuration

Style Configuration: Use style(_:) to set styles such as .borderless, .underline, etc.
Character Limit: Use characterLimit(_:onExceeded:) to enforce a character limit.
Secure Entry: Set isSecure(_:) to enable or disable secure text entry.
Accent Color and Submit Handling: Customize using accentColor(_:) and submitLabel(_:).

```swift
 TextFieldPro("Enter text", text: $text1)
   .style(.bordered(color: .green, width: 2, activeColor: .orange))
   .isSecure(true)
   .characterLimit(5, onExceeded: { isExceeded in
      if isExceeded {
          print("Character Limit Exceed")
      }
 })
```


![ScreenRecording2025-03-29at5 37 03PM-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/5818230a-1cea-4675-8315-0219b524c9f6)




Contributions are welcome! Please fork the repository and submit a pull request with any improvements or fixes.

License

This project is licensed under the MIT License.

```

Tips for the README

Repository URL:  https://github.com/nitish912/TextFieldPro.git that hosts the TextFieldPro package.

SPM Integration: Ensure that your package is correctly configured in your GitHub repository with a Package.swift file at its root.

Version Management: Indicate the latest stable version in the installation instructions.

Usage Examples: Provide real-world code snippets to help users quickly understand how to implement and use the component in their projects.
