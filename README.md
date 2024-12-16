# CellBuilder

**CellBuilder** is a powerful Swift framework designed to convert any `UIView`, `UITableViewCell`, or `UICollectionViewCell` into a `SwiftUI` view, making it configurable and responsive to `Publisher`. It simplifies the process of integrating your existing `UIView`, `UITableViewCell`, or `UICollectionViewCell` components into `SwiftUI`, enhancing your development journey with efficiency and excitement.

## Features

- **Seamless Integration**: Convert any `UIView`, `UITableViewCell`, or `UICollectionViewCell` to a `SwiftUI` view.
- **Configurable and Responsive**: Fully compatible with `SwiftUI` and responsive to `Publisher`.
- **Result Builder**: Simplifies the implementation of `UIView`, `UITableViewCell`, or `UICollectionViewCell` as `SwiftUI` view using `CellBuilder`.

## Installation
### Swift Package Manager

To integrate `CellBuilder` into your project using Swift Package Manager, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/sonmbol/CellBuilder.git", from: "1.0.1")
]

```

#### CocoaPods

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

```

### Usage

## Usage

The idea behind `CellBuilder` is to convert any `UIView`, `UITableViewCell`, or `UICollectionViewCell` into a `SwiftUI` view, making it configurable and responsive to `Publisher`. Here's a quick example to get you started:

### Example

#### Single Cell

```swift
@CellBuilder
func labelView() -> some View {
    LabelView { view in
        view.label.text = "SwiftUI View UIView"
    }
}

@CellBuilder
func tableViewCell() -> some View {
    LabelTableViewCell { cell in
        cell.label.text = "SwiftUI View TableViewCell"
    }
}

@CellBuilder
func collectionViewCell() -> some View {
    LabelCollectionViewCell { cell in
        cell.label.text = "SwiftUI View CollectionViewCell"
    }
}

```

##### Multiple Cells

```swift
@CellBuilder
func labelViews() -> some View {
    LabelView { cell in
        cell.label.text = "first UIView"
    }
    LabelView { cell in
        cell.label.text = "second UIView"
    }
    LabelView { cell in
        cell.label.text = "third UIView"
    }
}

@CellBuilder
func tableViewCells() -> some View {
    LabelTableViewCell { cell in
        cell.label.text = "first TableViewCell"
    }
    LabelTableViewCell { cell in
        cell.label.text = "second TableViewCell"
    }
    LabelTableViewCell { cell in
        cell.label.text = "third TableViewCell"
    }
}

@CellBuilder
func collectionViewCells() -> some View {
    LabelCollectionViewCell { cell in
        cell.label.text = "first CollectionViewCell"
    }
    LabelCollectionViewCell { cell in
        cell.label.text = "second CollectionViewCell"
    }
    LabelCollectionViewCell { cell in
        cell.label.text = "third CollectionViewCell"
    }
}

```

### How It Works

- **Extraction**: The `UIView`, `UITableViewCell`, or `UICollectionViewCell` is first extracted as a `UIView`.
- **Container**: A container is added around it to override `intrinsicContentSize` since `SwiftUI` respects the size only, not the constraint.
- **Content Integration**: The cell content is added inside the container.
- **Result Builder**: To make the view easy to use in `SwiftUI`, a result builder called `CellBuilder` is used.

By following this approach, you can easily integrate your existing `UIView`, `UITableViewCell`, or `UICollectionViewCell` components into `SwiftUI`, making your development process smoother and more efficient.

