load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("//tools:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "libcommon_component_example.so",
    linkshared = True,
    linkstatic = False,
    deps = [":common_component_example_lib"],
)

cc_library(
    name = "common_component_example_lib",
    srcs = ["common_component_example.cc"],
    hdrs = ["common_component_example.h"],
    deps = [
        "//cyber",
        "//examples/proto:driver_cc_proto",
    ],
)

cc_binary(
    name = "channel_test_writer",
    srcs = ["channel_test_writer.cc"],
    deps = [
        "//cyber",
        "//examples/proto:driver_cc_proto",
    ],
)

cc_binary(
    name = "channel_prediction_writer",
    srcs = ["channel_prediction_writer.cc"],
    deps = [
        "//cyber",
        "//examples/proto:driver_cc_proto",
    ],
)

cpplint()
