"""Loads the cyber_ws library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "fastcdr",
        sha256 = "3b8ddedd3b251563e1eb835de5b9f9324a957788e74e88ec3022016bc7824b54",
        strip_prefix = "fast-rtps",
        urls = ["https://apollo-edu.bj.bcebos.com/cyber_car/third_party/fast-rtps.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2021-12-21T09%3A02%3A47Z/-1/host/ebd46572b0439078fadd8cb4a6fba94eafda49106c2e9f4d521d4c66307981e4"],
    )
    http_archive(
        name = "fastrtps",
        sha256 = "3b8ddedd3b251563e1eb835de5b9f9324a957788e74e88ec3022016bc7824b54",
        strip_prefix = "fast-rtps",
        urls = ["https://apollo-edu.bj.bcebos.com/cyber_car/third_party/fast-rtps.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2021-12-21T09%3A02%3A47Z/-1/host/ebd46572b0439078fadd8cb4a6fba94eafda49106c2e9f4d521d4c66307981e4"],
    )
