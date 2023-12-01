// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "git2",
    products: [
        .library(
            name: "git2",
            targets: ["libgit2"]),
    ],
    targets: [
        .target(
            name: "libgit2",
            path: ".",
            exclude: [
                "src/util/win32",
            ],
            sources: [
                "src/libgit2",
                // "deps/http-parser",
                // "deps/ntlmclient",
                // "deps/pcre",
                // "deps/xdiff",
                // "deps/zlib",
                // "src/libgit2",
                // "src/util",
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("src/libgit2"),
                .headerSearchPath("src/util"),
                .headerSearchPath("deps/http-parser"),
                .headerSearchPath("deps/ntlmclient"),
                .headerSearchPath("deps/pcre"),
                .headerSearchPath("deps/xdiff"),
                .headerSearchPath("deps/zlib"),
                .headerSearchPath("include/git2"),

                // -- Enabled features:
                // * nanoseconds, support nanosecond precision file mtimes and ctimes
                // * HTTPS, using SecureTransport
                // * SHA1, using CollisionDetection
                // * SHA256, using CommonCrypto
                // * http-parser, http-parser support (bundled)
                // * regex, using system regcomp_l
                // * xdiff, xdiff support (bundled)
                // * zlib, using system zlib
                // * futimens, futimens support
                // * threadsafe, threadsafe support
                // * ntlmclient, NTLM authentication support for Unix
                // * iconv, iconv encoding conversion support

                // -- Disabled features:
                // * SHA256 API, experimental SHA256 APIs
                // * debugpool, debug pool allocator
                // * debugalloc, debug strict allocators
                // * debugopen, path validation in open
                // * GSSAPI, GSSAPI support for SPNEGO authentication
                // * SSH, SSH transport support

                .define("LIBGIT2_NO_FEATURES_H"),

//                    .define("GIT_DEBUG_POOL", to: "0", .when(configuration: .debug)),
//                .define("GIT_DEBUG_STRICT_ALLOC", to: "0", .when(configuration: .debug)),
//                .define("GIT_DEBUG_STRICT_OPEN", to: "0", .when(configuration: .debug)),

                .define("GIT_THREADS", to: "0"),
                .define("GIT_WIN32_LEAKCHECK", to: "0"),

                .define("GIT_ARCH_64", to: "1"),
//                .define("GIT_ARCH_32", to: "0"),

//                .define("GIT_USE_ICONV", to: "0"),
//                .define("GIT_USE_NSEC", to: "0"),
//                .define("GIT_USE_STAT_MTIM", to: "0"),
//                .define("GIT_USE_STAT_MTIMESPEC", to: "0"),
//                .define("GIT_USE_STAT_MTIME_NSEC", to: "0"),
//                .define("GIT_USE_FUTIMENS", to: "0"),

//                .define("GIT_REGEX_REGCOMP_L"),
//                .define("GIT_REGEX_REGCOMP"),
//                .define("GIT_REGEX_PCRE"),
//                .define("GIT_REGEX_PCRE2"),
//                .define("GIT_REGEX_BUILTIN", to: "1"),

//                 .define("GIT_QSORT_BSD"),
//                 .define("GIT_QSORT_GNU"),
//                 .define("GIT_QSORT_C11"),
//                 .define("GIT_QSORT_MSC"),

//                .define("GIT_SSH", to: "0"),
//                .define("GIT_SSH_EXEC", to: "0"),
//                .define("GIT_SSH_LIBSSH2", to: "0"),
//                .define("GIT_SSH_LIBSSH2_MEMORY_CREDENTIALS", to: "0"),

//                .define("GIT_NTLM", to: "0"),
//                .define("GIT_GSSAPI", to: "0"),
//                .define("GIT_GSSFRAMEWORK", to: "0"),

//                .define("GIT_WINHTTP", to: "0"),
//                .define("GIT_HTTPS", to: "0"),
//                .define("GIT_OPENSSL", to: "0"),
//                .define("GIT_OPENSSL_DYNAMIC", to: "0"),
//                .define("GIT_SECURE_TRANSPORT", to: "0"),
//                .define("GIT_MBEDTLS", to: "0"),
//                .define("GIT_SCHANNEL", to: "0"),

//                .define("GIT_SHA1_COLLISIONDETECT", to: "0"),
//                .define("GIT_SHA1_WIN32", to: "0"),
                .define("GIT_SHA1_COMMON_CRYPTO", to: "1"),
//                .define("GIT_SHA1_OPENSSL", to: "0"),
//                .define("GIT_SHA1_OPENSSL_DYNAMIC", to: "0"),
//                .define("GIT_SHA1_MBEDTLS", to: "0"),

//                .define("GIT_SHA256_BUILTIN", to: "0"),
//                .define("GIT_SHA256_WIN32", to: "0"),
                .define("GIT_SHA256_COMMON_CRYPTO", to: "1"),
//                .define("GIT_SHA256_OPENSSL", to: "0"),
//                .define("GIT_SHA256_OPENSSL_DYNAMIC", to: "0"),
//                .define("GIT_SHA256_MBEDTLS", to: "0"),

//                .define("GIT_RAND_GETENTROPY", to: "0"),
//                .define("GIT_RAND_GETLOADAVG", to: "0"),

//                .define("GIT_IO_POLL", to: "0"),
//                .define("GIT_IO_WSAPOLL", to: "0"),
//                .define("GIT_IO_SELECT", to: "0"),
            ]
        ),
    ]
)
