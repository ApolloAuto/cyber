workspace(name = "cyber")

load("//tools:workspace.bzl", "cyber_repositories")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

cyber_repositories()

http_archive(
    name = "bazel_skylib",
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    urls = [
        "https://apollo-system.cdn.bcebos.com/archive/6.0/bazel-skylib-1.0.3.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
    ],
)

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@bazel_skylib//lib:versions.bzl", "versions")

versions.check(minimum_bazel_version = "3.7.0")

http_archive(
    name = "rules_proto",
    sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
    strip_prefix = "rules_proto-97d8af4dc474595af3900dd85cb3a29ad28cc313",
    urls = [
        "https://apollo-edu.bj.bcebos.com/cyber_car/third_party/rules_proto.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2021-12-21T06%3A48%3A04Z/-1/host/22970a701273e815f6534484ecd789e5ed109fe0165d71d3cfc042664c7e0aed",
        "https://github.com/bazelbuild/rules_proto/archive/97d8af4dc474595af3900dd85cb3a29ad28cc313.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

http_archive(
    name = "rules_python",
    sha256 = "b6d46438523a3ec0f3cead544190ee13223a52f6a6765a29eae7b7cc24cc83a0",
    urls = [
        "https://apollo-edu.bj.bcebos.com/cyber_car/third_party/rules_python-0.1.0.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2021-12-21T06%3A46%3A30Z/-1/host/f8c149aebd82d7560038c10b9d51b8f6e67f7d39bf0d07ec5223697b195634e9",
        "https://github.com/bazelbuild/rules_python/releases/download/0.1.0/rules_python-0.1.0.tar.gz",
    ],
)

# load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
# grpc
http_archive(
    name = "com_github_grpc_grpc",
    sha256 = "419dba362eaf8f1d36849ceee17c3e2ff8ff12ac666b42d3ff02a164ebe090e9",
    strip_prefix = "grpc-1.30.0",
    urls = [
        "https://apollo-system.cdn.bcebos.com/archive/6.0/v1.30.0.tar.gz",
        "https://github.com/grpc/grpc/archive/v1.30.0.tar.gz",
    ],
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()
