# NoPrint

`NoPrint` is a code snippet that removes `print` statements in the Release build.

## Why Use NoPrint?

Almost all Xcode projects include `print` statements. However, Xcode does not disable or prevent their output in the Release version, even for iOS projects. This leads to two problems:  
1. `print` statements still occupy a line of code in the Release build.  
2. The `print` operation consumes runtime, especially when used inside loops.  
3. The parameters of the `print` function also incur unnecessary overhead.

`NoPrint` solves this problem by compiling different print functions based on the current environment. In Debug mode, it behaves exactly like the system’s built-in `print` statement. In Release mode, however, it becomes an empty function. According to Swift compiler optimization rules, empty functions are completely removed in the Release version. `NoPrint` leverages this principle to eliminate the overhead caused by `print` statements in production environments.

With `NoPrint`, you don’t need to modify your existing code. Simply import `NoPrint` at the beginning of the files where you want to remove `print` statements, and it will change the default behavior of `print`, making it disabled or completely removed in the Release version.

## Usage

### Using `pr` (Recommended)
```swift
import NoPrint

// Using a closure to avoid the overhead of function parameters
pr {"This message will only appear in Debug mode."}
```

### Using `print`
```swift
import NoPrint

print("This message will only appear in Debug mode.")
```

## Installation

To integrate `NoPrint` into your Swift project, add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/wuyu2015/NoPrint.git", from: "1.0.1")
]
```

### Or Install via Xcode

1. Open your Xcode project.
2. Go to **File** -> **Swift Packages** -> **Add Package Dependency**.
3. Enter the GitHub repository URL: `https://github.com/wuyu2015/NoPrint.git`.
4. Choose the desired version (e.g., `1.0.1`) and complete the installation.

Now, you can use `NoPrint` in your project.

## However, I recommend copying the code directly into your project instead of using `import NoPrint`

For modules imported via `import`, the compiler does not optimize them as it would with internal code. It cannot confirm whether these functions might be dynamically called in future code (even if they are not used currently).

So the best approach is to directly copy the `pr.swift` file from the `Sources/NoPrint/` directory into your project.

## License

This project is licensed under the MIT License.

---

# NoPrint

`NoPrint` 是一个代码片段，能够删除 Release 发布版中的 print 语句。

## 为什么使用 NoPrint？

几乎所有的 Xcode 项目都会包含 `print` 语句。然而，Xcode 并不会在 Release 版本中禁用或阻止它们输出，即使是 iOS 项目也不例外。
这会导致两个问题：  
1. `print` 语句在 Release 版本中仍然占用一条指令。  
2. `print` 操作会消耗运行时间，尤其是在循环内部使用时。
3.  `print` 函数的参数同样带来不必要的开销。

`NoPrint` 通过根据当前环境编译不同的打印函数来解决这个问题。在 Debug 模式下，它的行为与系统自带的 `print` 语句一模一样。而在 Release 模式下，它则变成一个空函数。根据 Swift 编译器的优化规则，空函数在 Release 版本中会被完全移除。`NoPrint` 正是利用这一原理，消除生产环境中 `print` 语句带来的开销。

使用 `NoPrint` 你不需要改动原有的代码，只需在需要消除 `print` 语句的文件头部引入 `NoPrint` 即可，它会更改 `print` 语句的默认行为，让它们在 Release 版本中被禁用或直接消失

## 使用方法

### 使用 `pr`（推荐）
```swift
import NoPrint

// 使用 closure 可避免函数参数带来的开销
pr {"此消息仅在 Debug 模式下显示。"}
```

### 使用 `print`
```swift
import NoPrint

print("此消息仅在 Debug 模式下显示。")
```

## 安装

要将 `NoPrint` 集成到您的 Swift 项目中，请在 `Package.swift` 文件中添加以下内容：

```swift
dependencies: [
    .package(url: "https://github.com/wuyu2015/NoPrint.git", from: "1.0.1")
]
```

### 或通过 Xcode 安装

1. 打开您的 Xcode 项目。
2. 转到 **File** -> **Swift Packages** -> **Add Package Dependency**。
3. 输入 GitHub 仓库 URL: `https://github.com/wuyu2015/NoPrint.git`。
4. 选择所需版本（例如 `1.0.1`），完成安装。

现在，您可以在项目中使用 `NoPrint`。

## 但我建议你把代码复制到你的项目，而不是用 import 的方式使用 `NoPrint`

因为对于通过 import 引入的模块，编译器并不会像对待内部代码一样进行优化，它不能确认这些函数是否在未来的代码中会被动态调用（即使当前没有被使用）。

所以最好的方法是把 `Sources/NoPrint/` 目录的 `pr.swift` 直接复制到你的项目。

## 许可

该项目使用 MIT 许可证。
