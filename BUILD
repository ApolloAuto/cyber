load("//tools:cpplint.bzl", "cpplint")
load("@rules_cc//cc:defs.bzl", "cc_library")
load("//tools/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

exports_files([
    "CPPLINT.cfg",
    "tox.ini",
])

cc_library(
    name = "cyber",
    deps = [
        "//cyber",
    ],
)

filegroup(
    name = "cyber_conf",
    srcs = glob([
        "conf/*.conf",
    ]),
)

install(
    name = "install",
    data = [
        ":cyber_conf",
        "//cyber_py3:runtime_files",
    ],
    deps = [
        ":pb_cyber",
        "//cyber/mainboard:install",
        "//cyber/tools:install",
        "//cyber_py3/internal:install",
    ],
)

install_files(
    name = "pb_cyber",
    dest = "cyber",
    files = [
        "//cyber/proto:record_py_pb2",
    ],
)

cpplint()
