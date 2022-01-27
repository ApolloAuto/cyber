"""Loads the protobuf library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "com_google_protobuf",
        sha256 = "9fd4519ce2962517f180d08d9abb053833a1921e88c0350cd3e25cf0fb9a45f0",
        strip_prefix = "protobuf-3.14.0",
        urls = [
            "https://apollo-edu.bj.bcebos.com/cyber_car/third_party/protobuf-3.14.0.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2022-01-26T02%3A37%3A41Z/-1/host/8322483a18cca103cd626059039ac32d7c03957acf4f776e03947d1acb735813"
        ],
    )
