load("@rules_python//python:defs.bzl", "py_test")

py_test(
    name = "record_test",
    timeout = "short",
    srcs = ["record_test.py"],
    deps = [
        "//cyber/proto:record_py_pb2",
        "//cyber_py3:record",
        "//examples/proto:simple_msg_py_pb2",
    ],
)

py_test(
    name = "init_test",
    timeout = "short",
    srcs = ["init_test.py"],
    deps = [
        "//cyber_py3:cyber",
    ],
)

py_test(
    name = "cyber_test",
    timeout = "short",
    srcs = ["cyber_test.py"],
    deps = [
        "//cyber_py3:cyber",
        "//examples/proto:simple_msg_py_pb2",
    ],
)

# FIXME(all): parameter_test seems to run forever
# py_test(
#     name = "parameter_test",
#     timeout = "short",
#     srcs = ["parameter_test.py"],
#     deps = [
#         "//cyber_py3:cyber",
#         "//cyber_py3:parameter",
#     ],
# )

py_test(
    name = "cyber_time_test",
    timeout = "short",
    srcs = ["cyber_time_test.py"],
    deps = [
        "//cyber_py3:cyber",
        "//cyber_py3:cyber_time",
    ],
)

# FIXME(all): cyber_timer_test can't terminate
# py_test(
#     name = "cyber_timer_test",
#     timeout = "short",
#     srcs = ["cyber_timer_test.py"],
#     deps = [
#         "//cyber_py3:cyber",
#         "//cyber_py3:cyber_timer",
#     ],
# )
