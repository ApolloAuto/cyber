"""Loads the ncurses5 library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def repo():
    http_archive(
        name = "ncurses5",
        sha256 = "db9e3e06816fc6220eb04470813f0d46802fc9a0d41ce4aa4950ce1a669d65bb",
        strip_prefix = "ncurses5",
        urls = [
            "https://apollo-edu.bj.bcebos.com/cyber_car/third_party/ncurses5.tar.gz?authorization=bce-auth-v1/0824ae9513f643518e120667fc2a6d50/2022-01-29T09%3A24%3A56Z/-1/host/7c40a070db6774cbcd426269ddbe3f9b4e0066967958c293286e1a70b26398a4",
        ],
    )