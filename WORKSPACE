load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

http_archive(
    name = "bazel_skylib",
    sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

http_archive(
    name = "rules_cc",
    integrity = "sha256-ZbZ7gcbaN48TbMfn4U7gjVuTdZc0J+zrjHc6T2n6fkk=",
    strip_prefix = "rules_cc-0.0.10",
    urls = [
        "https://github.com/bazelbuild/rules_cc/releases/download/0.0.10/rules_cc-0.0.10.tar.gz",
    ],
)

http_archive(
    name = "io_tweag_rules_nixpkgs",
    sha256 = "480df4a7777a5e3ee7a755ab38d18ecb3ddb7b2e2435f24ad2037c1b084faa65",
    strip_prefix = "rules_nixpkgs-126e9f66b833337be2c35103ce46ab66b4e44799",
    urls = ["https://github.com/tweag/rules_nixpkgs/archive/126e9f66b833337be2c35103ce46ab66b4e44799.tar.gz"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:repositories.bzl", "rules_nixpkgs_dependencies")

rules_nixpkgs_dependencies()

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_local_repository")

nixpkgs_local_repository(
    name = "nixpkgs",
    nix_file_deps = ["//:flake.lock"],
    nix_flake_lock_file = "//:flake.lock",
)

# Configure the C++ toolchain
load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl", "nixpkgs_cc_configure")

nixpkgs_cc_configure(
    name = "nixpkgs_config_cc",
    attribute_path = "clang_18",
    repository = "@nixpkgs",
)

load("@rules_cc//cc:repositories.bzl", "rules_cc_dependencies", "rules_cc_toolchains")

rules_cc_dependencies()

rules_cc_toolchains()

git_repository(
    name = "bazel_local_nix",
    remote = "https://github.com/filmil/bazel_local_nix",
    commit = "ab000de15929f7c8cd252913d2d5be90aaafef32",
)

load("@bazel_local_nix//:repositories.bzl", "bazel_local_nix_dependencies")
bazel_local_nix_dependencies()

# Using from git directly because latest release 0.9.0 has a visibility bug.
git_repository(
    name = "rules_foreign_cc",
    commit = "6ecc134b114f6e086537f5f0148d166467042226",
    remote = "https://github.com/bazelbuild/rules_foreign_cc",
    shallow_since = "1686730970 +0000",
)

load("@rules_foreign_cc//foreign_cc:repositories.bzl", "rules_foreign_cc_dependencies")

rules_foreign_cc_dependencies()

# This is for gotopt, should probably be changed.
http_archive(
    name = "io_bazel_rules_go",
    integrity = "sha256-M6zErg9wUC20uJPJ/B3Xqb+ZjCPn/yxFF3QdQEmpdvg=",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.48.0/rules_go-v0.48.0.zip",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.48.0/rules_go-v0.48.0.zip",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.22.4")


http_archive(
    name = "bazel_gazelle",
    sha256 = "efbbba6ac1a4fd342d5122cbdfdb82aeb2cf2862e35022c752eaddffada7c3f3",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.27.0/bazel-gazelle-v0.27.0.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.27.0/bazel-gazelle-v0.27.0.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies", "go_repository")

gazelle_dependencies()

load(":deps.bzl", go_local_deps = "go_dependencies")
# Try to override the repo used in nvc_repositories below, since we need to
# patch it for hermetic compilation.
new_git_repository(
    name = "nvc",
    build_file = "//third_party/nvc:nvc.BUILD.bazel",
    commit = "af2dd6b2289e6f3114b405f441763fb34742b652",
    patch_args = [
        "-p1",
    ],
    patches = [
        # Allows selecting zlib via pkg-config.  This should probably
        # be upstreamed.
        "//third_party/nvc:001.patch",
    ],
    remote = "https://github.com/nickg/nvc",
)

# NVC VHDL compiler.
git_repository(
    name = "bazel_rules_nvc",
    commit = "ab1102750d3fbd9de1a38e2955a642474edc225b",
    remote = "https://github.com/filmil/bazel_rules_nvc",
)


load("@bazel_rules_nvc//build/nvc:repositories.bzl", "nvc_repositories")

nvc_repositories()

register_toolchains("@bazel_rules_nvc//build/nvc:nvc_linux_toolchain")

load("@gotopt2//build:deps.bzl", "gotopt2_dependencies")

gotopt2_dependencies()

rules_hdl_git_hash = "40e5e109069cb91cbab6a32f83c7a71aefae527e"

rules_hdl_git_sha256 = "sha256-OYdXWz7ph0ykUaU1CIcsuvWOXLSqbMuA/PQzFTX1dy4="

maybe(
    http_archive,
    name = "rules_hdl",
    integrity = rules_hdl_git_sha256,
    strip_prefix = "bazel_rules_hdl-%s" % rules_hdl_git_hash,
    urls = [
        "https://github.com/hdl/bazel_rules_hdl/archive/%s.tar.gz" % rules_hdl_git_hash,
    ],
)

load("@rules_hdl//dependency_support:dependency_support.bzl", rules_hdl_dependency_support = "dependency_support")

rules_hdl_dependency_support()

load("@rules_hdl//:init.bzl", rules_hdl_init = "init")

rules_hdl_init()

load(
    "@rules_hdl//dependency_support:dependency_support.bzl",
    rules_hdl_dependency_support = "dependency_support",
)

rules_hdl_dependency_support()

load("@rules_hdl//:init.bzl", rules_hdl_init = "init")

rules_hdl_init(python_interpreter_target = "@rules_hdl_cpython//:install/bin/python3")

http_archive(
    name = "com_grail_bazel_toolchain",
    sha256 = "ddad1bde0eb9d470ea58500681a7deacdf55c714adf4b89271392c4687acb425",
    strip_prefix = "toolchains_llvm-7e7c7cf1f965f348861085183d79b6a241764390",
    urls = ["https://github.com/grailbio/bazel-toolchain/archive/7e7c7cf1f965f348861085183d79b6a241764390.tar.gz"],
)

load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "10.0.1",
    sha256 = {
        "linux": "02a73cfa031dfe073ba8d6c608baf795aa2ddc78eed1b3e08f3739b803545046",
    },
    strip_prefix = {
        "linux": "clang+llvm-10.0.1-x86_64-pc-linux-gnu",
    },
    urls = {
        "linux": [
            # Use a custom built Clang+LLVM binary distribution that is more portable than
            # the official builds because it's built against an older glibc and does not have
            # dynamic library dependencies to tinfo, gcc_s or stdlibc++.
            #
            # For more details, see the files under toolchains/clang.
            "https://github.com/retone/deps/releases/download/na5/clang+llvm-10.0.1-x86_64-pc-linux-gnu.tar.xz",
        ],
    },
)

register_toolchains(
    "@llvm_toolchain//:cc-toolchain-linux",
    "@llvm_toolchain//:cc-toolchain-darwin",
)

git_repository(
    name = "rules_fusesoc",
    commit = "6d944b3893b03d947f307b436cde79925c4b3052",
    remote = "https://github.com/filmil/bazel_rules_fusesoc",
    shallow_since = "1717828162 -0700",
)

# Used for docker execution of GHDL.
maybe(
    git_repository,
    name = "bazel_rules_bid",
    commit = "794d3c63d8d4a36888b873f307f20ef285b79f0d",
    remote = "https://github.com/filmil/bazel-rules-bid",
)

load("@rules_fusesoc//:deps.bzl", "rules_fusesoc_dependencies")

rules_fusesoc_dependencies()  # @bazel_rules_bid, ...

load("@bazel_rules_bid//build:repositories.bzl", "bazel_bid_repositories")

bazel_bid_repositories()

# Requires prodaccess.
http_archive(
    name = "fuchsia_prebuilts",
    build_file = "//third_party/fuchsia:fuchsia.BUILD.bazel",
    sha256 = "e755c132ce40bac6366fb4984641577c090f86a378f7b3373a6af0af03ad6827",
    strip_prefix = "fuchsia_prebuilts",
    url = "file:///google/data/ro/users/fm/fmil/www/files/cp/third_party/fuchsia_prebuilts-1.tgz",
)

# Requires prodaccess.
http_archive(
    name = "muntjac_toolchain",
    build_file = "//build/toolchain/muntjac-baremetal:BUILD.muntjac_toolchain.bazel",
    patch_args = ["-p1"],
    patches = ["//third_party/muntjac_toolchain:0001-Change-the-memory-map.patch"],
    sha256 = "0ce482d45783e0ea9aa986cafd5961de5f490068fd6c7d737b78b4366a3ff579",
    strip_prefix = "lowrisc-toolchain-rv64imac-20230228-1-muntjac",
    urls = [
        "https://storage.googleapis.com/filmil-storage/lowrisc-toolchain-rv64imac-20230228-1-muntjac.tar.gz",
    ],
)

git_repository(
    name = "bazel_lib",
    commit = "be41c1d686cc06fc27c8b0bffa8cba417e1cca71",
    remote = "https://github.com/aspect-build/bazel-lib",
    shallow_since = "1678393484 -0800",
)

# Device Tree Compiler
git_repository(
    name = "rules_dtc",
    commit = "77f2be02ece3899ce529515ad5f130bd8be5d3d9",
    remote = "https://github.com/filmil/bazel_rules_dtc",
)

load("@rules_dtc//:deps.bzl", "rules_dtc_dependencies")

rules_dtc_dependencies()  # @dtc//

# UART VHDL code
new_git_repository(
    name = "uart_vhdl",
    build_file = "//third_party/uart:uart.BUILD.bazel",
    commit = "ba6d1c3a7acbec274282c59af11dae64eaec2618",
    remote = "https://github.com/pabennett/uart",
)

# Used for VHDL to Verilog conversion
maybe(
    git_repository,
    name = "bazel_rules_ghdl",
    commit = "66aba87ec84be79678d539287e05fbfe8fb99c4a",
    remote = "https://github.com/filmil/bazel_rules_ghdl",
)

# Use vivado for synthesis.
maybe(
    git_repository,
    name = "rules_vivado",
    commit = "03f7c446665f7daa0039943343c165eba0d2c285",
    remote = "https://github.com/filmil/bazel_rules_vivado",
)

load("@rules_vivado//:deps.bzl", "rules_vivado_dependencies")

rules_vivado_dependencies()

# No-DLL DDR3 module
new_git_repository(
    name = "core_ddr3_controller",
    build_file = "//third_party/core_ddr3_controller:core_ddr3_controller.BUILD.bazel",
    commit = "a03492a6000ca0185c615060b171bda64806a7bb",
    remote = "https://github.com/ultraembedded/core_ddr3_controller",
)

# serv 32-bit riscv
new_git_repository(
    name = "serv",
    build_file = "//third_party/serv:serv.BUILD.bazel",
    commit = "24006a7297b69caec78a69953ce10d93deeb9106",
    remote = "https://github.com/olofk/serv",
)

git_repository(
    name = "vcd_parser",
    commit = "986b3579bec53df688e7657f3e5a2da05cc617fe",
    remote = "https://github.com/filmil/go-vcd-parser",
)
load("@vcd_parser//:deps.bzl", vcd_go_dependencies = "go_dependencies")
vcd_go_dependencies()

load("//:deps.bzl", "go_dependencies")
go_dependencies()

