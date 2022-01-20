// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "libgit2",
  platforms: [.macOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "libgit2",
      type: .dynamic,
      targets: ["libgit2"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "libgit2",
      dependencies: [],
      path: ".",
      exclude: [
        "tests",
        "fuzzers",
        "ci",
        "docs",
        "examples",
        "cmake",
        "deps",
        "script",

        "COPYING", "AUTHORS", "README.md", "SECURITY.md",
        "CMakeLists.txt", "package.json", "git.git-authors", "api.docurium",

        "src/CMakeLists.txt",
        "src/win32",
        "src/hash",
        "src/features.h.in",
        "src/xdiff",

        "src/unix",
        "src/allocators",
        "src/streams",
        "src/transports",
      ],
      sources: ["src"],
      publicHeadersPath: "include",
      cSettings: [
        .headerSearchPath("src"),
        .headerSearchPath("include"),
        .headerSearchPath("deps/http-parser"),
        .headerSearchPath("deps/ntlmclient"),

        .unsafeFlags([
          "-DSHA1DC_CUSTOM_INCLUDE_SHA1_C=\"common.h\"",
          "-DSHA1DC_CUSTOM_INCLUDE_UBC_CHECK_C=\"common.h\"",
          "-DSHA1DC_NO_STANDARD_INCLUDES=1",
          "-D_FILE_OFFSET_BITS=64",
        ]),
      ],
      linkerSettings: [
        .linkedLibrary("iconv"),
        .linkedLibrary("boringssl"),
      ]
    ),
  ]
)
