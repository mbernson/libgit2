// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "libgit2",
    products: [
        .library(name: "libgit2", targets: ["libgit2"]),
    ],
    targets: [
        .target(
            name: "libgit2",
            path: ".",
            exclude: [
                "src/libgit2/experimental.h.in",
                "src/libgit2/git2.rc",
                "src/libgit2/CMakeLists.txt",
                "src/util/win32",
                "src/util/hash/win32.c",
                "src/util/hash/win32.h",
                "src/util/hash/openssl.c",
                "src/util/hash/openssl.h",
                "src/util/hash/builtin.c",
                "src/util/hash/builtin.h",
                "src/util/hash/collisiondetect.c",
                "src/util/hash/collisiondetect.h",
                "deps/http-parser/CMakeLists.txt",
                "deps/http-parser/COPYING",
                "deps/xdiff/CMakeLists.txt",
                "deps/zlib/CMakeLists.txt",
                "deps/zlib/COPYING",
            ],
            sources: [
                "src/libgit2",
                "src/util",
                "deps/http-parser",
                "deps/prcre",
                "deps/xdiff",
                "deps/zlib",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .unsafeFlags([
                  /// NOTE: Only one necessary flag. Disable -fmodules flag. Clang finds (struct entry) in different file ( search.h ).
                  "-fno-modules",
                ]),

                .headerSearchPath("src/libgit2"),
                .headerSearchPath("src/util"),
                .headerSearchPath("deps/http-parser"),
                .headerSearchPath("deps/pcre"),
                .headerSearchPath("deps/xdiff"),
                .headerSearchPath("deps/zlib"),

                .define("LIBGIT2_NO_FEATURES_H"),

                .define("GIT_THREADS", to: "1"),

                .define("GIT_ARCH_64", to: "1"),

                .define("GIT_REGEX_BUILTIN", to: "1"),

                .define("GIT_QSORT_BSD"),

                 .define("GIT_SSH", to: "1"),
                // .define("GIT_SSH_EXEC", to: "0"),
                // .define("GIT_SSH_LIBSSH2", to: "0"),
                // .define("GIT_SSH_LIBSSH2_MEMORY_CREDENTIALS", to: "0"),

                // .define("GIT_NTLM", to: "0"),
                // .define("GIT_GSSAPI", to: "0"),
                // .define("GIT_GSSFRAMEWORK", to: "0"),

                 .define("GIT_HTTPS", to: "1"),
                // .define("GIT_OPENSSL", to: "0"),
                // .define("GIT_OPENSSL_DYNAMIC", to: "0"),
                // .define("GIT_SECURE_TRANSPORT", to: "0"),
                // .define("GIT_MBEDTLS", to: "0"),
                // .define("GIT_SCHANNEL", to: "0"),

//                .define("GIT_SHA1_COLLISIONDETECT", to: "1"),
                .define("GIT_SHA1_COMMON_CRYPTO", to: "1"),
                // .define("GIT_SHA1_OPENSSL", to: "0"),
                // .define("GIT_SHA1_OPENSSL_DYNAMIC", to: "0"),
                // .define("GIT_SHA1_MBEDTLS", to: "0"),

//                 .define("GIT_SHA256_BUILTIN", to: "0"),
                // .define("GIT_SHA256_WIN32", to: "0"),
                .define("GIT_SHA256_COMMON_CRYPTO", to: "1"),
                // .define("GIT_SHA256_OPENSSL", to: "0"),
                // .define("GIT_SHA256_OPENSSL_DYNAMIC", to: "0"),
                // .define("GIT_SHA256_MBEDTLS", to: "0"),

                // .define("GIT_RAND_GETENTROPY", to: "0"),
                // .define("GIT_RAND_GETLOADAVG", to: "0"),

                .define("GIT_IO_POLL", to: "1"),
                // .define("GIT_IO_WSAPOLL", to: "0"),
                // .define("GIT_IO_SELECT", to: "0"),
            ]
        ),
    ]
)
