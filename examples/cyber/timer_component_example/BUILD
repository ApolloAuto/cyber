load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("//tools:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "libtimer_component_example.so",
    linkshared = True,
    linkstatic = False,
    deps = [":timer_component_example_lib"],
)

cc_library(
    name = "timer_component_example_lib",
    srcs = ["timer_component_example.cc"],
    hdrs = ["timer_component_example.h"],
    deps = [
        "//cyber",
        "//examples/proto:driver_cc_proto",
    ],
)

cpplint()
