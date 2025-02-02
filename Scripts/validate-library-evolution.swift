#!/usr/bin/env xcrun swift

import Foundation

/**
 This script builds a custom swift package containing all frameworks inside of the xcarchive passed when launching.
 
 Input parameters:
  - CommandLine.arguments[1]: Path to the .xcarchive that contains all the frameworks that should be tested on library-evolution support
  - CommandLine.arguments[2]: Name of the project that allows testing (Has to be a name, not a path as it's reused as the scheme of the swift package)
 */

let fileManager = FileManager.default
let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath, isDirectory: true)

let xcarchiveURL = URL(fileURLWithPath: CommandLine.arguments[1], relativeTo: currentDirectoryURL)
let outputProjectURL = URL(fileURLWithPath: CommandLine.arguments[2], relativeTo: currentDirectoryURL)

let dSYMsDirectoryURL = xcarchiveURL.appending(path: "dSYMs")
let frameworksDirectoryURL = xcarchiveURL.appending(path: "Products/Library/Frameworks")

// MARK: - Convenience Methods

func infoPlistContent(for frameworkName: String) -> String {
    return """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>AvailableLibraries</key>
    <array>
        <dict>
            <key>BinaryPath</key>
            <string>\(frameworkName).framework/Adyen</string>
            <key>DebugSymbolsPath</key>
            <string>dSYMs</string>
            <key>LibraryIdentifier</key>
            <string>ios-arm64_x86_64-simulator</string>
            <key>LibraryPath</key>
            <string>\(frameworkName).framework</string>
            <key>SupportedArchitectures</key>
            <array>
                <string>arm64</string>
                <string>x86_64</string>
            </array>
            <key>SupportedPlatform</key>
            <string>ios</string>
            <key>SupportedPlatformVariant</key>
            <string>simulator</string>
        </dict>
    </array>
    <key>CFBundlePackageType</key>
    <string>XFWK</string>
    <key>XCFrameworkFormatVersion</key>
    <string>1.0</string>
</dict>
</plist>
"""
}

func packageFileContent(for frameworkNames: [String], scheme: String) -> String {
    
    let dependencies = frameworkNames.map { ".byName(name: \"\($0)\")"}.joined(separator: ",\n")
    let binaryTargets = frameworkNames.map { ".binaryTarget(name: \"\($0)\", path: \"\($0).xcframework\")"}.joined(separator: ",\n")
    
    return """
// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "\(scheme)",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "\(scheme)",
            targets: ["Target"]
        )
    ],
    targets: [
        .target(
            name: "Target",
            dependencies: [
                \(dependencies)
            ]
        ),
        \(binaryTargets)
    ]
)
"""
}

func sourceFile(including frameworkNames: [String]) -> String {
    var fileContent = frameworkNames.map{ "import \($0)" }.joined(separator: "\n")
    fileContent += "\nfinal class LibraryEvolutionTest {}"
    return fileContent
}

// MARK: -

let dSYMPaths = try! fileManager.contentsOfDirectory(atPath: dSYMsDirectoryURL.path())
let frameworkPaths = try! fileManager.contentsOfDirectory(atPath: frameworksDirectoryURL.path())

// Get all framework names based on the dSYMPaths - making sure the .framework file exists
let frameworkNames: [String] = dSYMPaths.compactMap { dSYMPath in
    guard let dSYMname = dSYMPath.split(separator: "/").last else { return nil }
    let frameworkForDsym = String(dSYMname).replacingOccurrences(of: ".dSYM", with: "")
    guard frameworkPaths.first(where: { $0.range(of: frameworkForDsym) != nil }) != nil else { return nil }
    return frameworkForDsym.replacingOccurrences(of: ".framework", with: "")
}

// Clearing and setting up the directory structure
try? fileManager.removeItem(at: outputProjectURL)
try! fileManager.createDirectory(at: outputProjectURL, withIntermediateDirectories: true)

// Copying and setting up `.xcframework`s
for frameworkName in frameworkNames {
    let xcframeworTargetURL = outputProjectURL.appending(path: "\(frameworkName).xcframework")
    let infoPlistTargetURL = xcframeworTargetURL.appending(path: "Info.plist")
    let libraryTargetURL = xcframeworTargetURL.appending(path: "ios-arm64_x86_64-simulator")
    let dSYMsTargetDirectoryURL = libraryTargetURL.appending(path: "dSYMs")
    
    // Setting up framework specific folders tructure
    try! fileManager.createDirectory(at: dSYMsTargetDirectoryURL, withIntermediateDirectories: true)
    
    let dotFrameworkSourceURL = frameworksDirectoryURL.appending(path: frameworkPaths.first(where: { $0.range(of: "\(frameworkName).framework") != nil })!)
    let dotFrameworkTargetURL = libraryTargetURL.appending(path: "\(frameworkName).framework")
    
    let dSYMsourceURL = dSYMsDirectoryURL.appending(path: dSYMPaths.first(where: { $0.range(of: "\(frameworkName).framework") != nil })!)
    let dSYMtargetURL = dSYMsTargetDirectoryURL.appending(path: "\(frameworkName).framework.dSYM")
    
    print("➡️  Creating \(infoPlistTargetURL.path())")
    fileManager.createFile(
        atPath: infoPlistTargetURL.path(),
        contents: infoPlistContent(for: frameworkName).data(using: .utf8)
    )
    
    print("➡️  Copying dSYM: \n\(dSYMsourceURL.absoluteString) to \n\(dSYMtargetURL.absoluteString)")
    try! fileManager.copyItem(
        at: dSYMsourceURL,
        to: dSYMtargetURL
    )
    print("➡️  Copying .framework: \n\(dotFrameworkSourceURL.absoluteString) to \n\(dotFrameworkTargetURL.absoluteString)")
    try! fileManager.copyItem(
        at: dotFrameworkSourceURL,
        to: dotFrameworkTargetURL
    )
}

let packageFileTargetURL = outputProjectURL.appending(path: "Package.swift")
fileManager.createFile(atPath: packageFileTargetURL.path(), contents: packageFileContent(for: frameworkNames, scheme: outputProjectURL.lastPathComponent).data(using: .utf8))

let sourceDirectoryURL = outputProjectURL.appending(path: "Sources").appending(path: "Target")
try! fileManager.createDirectory(
    at: sourceDirectoryURL,
    withIntermediateDirectories: true
)

let sourceFileURL = sourceDirectoryURL.appending(path: "File.swift")
print("➡️  Creating \(sourceFileURL.path())")
fileManager.createFile(
    atPath: sourceFileURL.path(),
    contents: sourceFile(including: frameworkNames).data(using: .utf8)
)
