"""Loads the cyber_ws library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "fastcdr",
        sha256 = "749a106339c25fb169c9a599a99e4afbac5ca8a717d6fb3fbaa1556507744b9f",
        strip_prefix = "fast-rtps",
        urls = ["https://apollo-edu.bj.bcebos.com/cyber_car/third_party/fast-rtps.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2022-01-29T10%3A00%3A35Z/-1/host/3972d5dd3a9b62757dbad220dc01529405013a907d9875542a35ff43a5eb7238"],
    )
    http_archive(
        name = "fastrtps",
        sha256 = "749a106339c25fb169c9a599a99e4afbac5ca8a717d6fb3fbaa1556507744b9f",
        strip_prefix = "fast-rtps",
        urls = ["https://apollo-edu.bj.bcebos.com/cyber_car/third_party/fast-rtps.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2022-01-29T10%3A00%3A35Z/-1/host/3972d5dd3a9b62757dbad220dc01529405013a907d9875542a35ff43a5eb7238"],
    )
