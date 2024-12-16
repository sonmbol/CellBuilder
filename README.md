# CellBuilder

**CellBuilder** is a powerful Swift framework designed to convert any `UITableViewCell` into a `SwiftUI` view, making it configurable and responsive to `Publisher`. It simplifies the process of integrating your existing `UITableViewCell` components into `SwiftUI`, enhancing your development journey with efficiency and excitement.

## Features

- **Seamless Integration**: Convert any `UITableViewCell` to a `SwiftUI` view.
- **Configurable and Responsive**: Fully compatible with `SwiftUI` and responsive to `Publisher`.
- **Result Builder**: Simplifies the implementation of `UITableViewCell` as `SwiftUI` view using `CellBuilder`.

## Installation
### Swift Package Manager

To integrate `CellBuilder` into your project using Swift Package Manager, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/sonmbol/CellBuilder.git", from: "1.0.0")
]

---

#### CocoaPods

```markdown
### CocoaPods

To integrate `CellBuilder` using CocoaPods, add the following to your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '14.0'

target 'YourAppTargetName' do
  use_frameworks!
  pod 'CellBuilder', :path => '../Packages/CellBuilder'
end
Run pod install to install the dependencies.

---

### Usage

```markdown
## Usage

The idea behind `CellBuilder` is to convert any `UITableViewCell` into a `SwiftUI` view, making it configurable and responsive to `Publisher`. Here's a quick example to get you started:

### Example

#### Single Cell

```swift
@CellBuilder
func label() -> some View {
    LabelTableViewCell { cell in
        cell.label.text = "Welcome to SwiftUI"
    }
}

---

##### Multiple Cells

```markdown
#### Multiple Cells

```swift
@CellBuilder
func labels() -> some View {
    LabelTableViewCell { cell in
        cell.label.text = "First"
    }
    LabelTableViewCell { cell in
        cell.label.text = "Second"
    }
    LabelTableViewCell { cell in
        cell.label.text = "Third"
    }
}

---

### How It Works

```markdown
## How It Works

- **Extraction**: The `UITableViewCell` is first extracted as a `UIView`.
- **Container**: A container is added around it to override `intrinsicContentSize` since `SwiftUI` respects the size only, not the constraint.
- **Content Integration**: The cell content is added inside the container.
- **Result Builder**: To make the view easy to use in `SwiftUI`, a result builder called `CellBuilder` is used.

By following this approach, you can easily integrate your existing `UITableViewCell` components into `SwiftUI`, making your development process smoother and more efficient.

