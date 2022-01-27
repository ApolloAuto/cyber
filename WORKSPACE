workspace(name = "cyber")

load("//tools:workspace.bzl", "cyber_repositories")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

cyber_repositories()

# grpc
http_archive(
    name = "com_github_grpc_grpc",
    sha256 = "8c11467bf90165626a75795b26485dd9e9d2e2ee29cc57233b34faf663f8bdaf",
    strip_prefix = "grpc-1.30.0",
    urls = [
        "https://apollo-edu.bj.bcebos.com/cyber_car/third_party/grpc-1.30.0.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2022-01-26T11%3A07%3A24Z/-1/host/b6fdbcf3315b1786260f3f4eaf3db47d5285cc101691647e16088e38105d9f19",
    ],
)

load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()

load("@com_github_grpc_grpc//bazel:grpc_extra_deps.bzl", "grpc_extra_deps")

grpc_extra_deps()
