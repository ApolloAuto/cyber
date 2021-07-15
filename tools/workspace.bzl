# Cyber external dependencies that can be loaded in WORKSPACE files.

load("//third_party/absl:workspace.bzl", absl = "repo")
load("//third_party/cpplint:workspace.bzl", cpplint = "repo")
load("//third_party/fastrtps:workspace.bzl", fastrtps = "repo")
load("//third_party/glog:workspace.bzl", glog = "repo")
load("//third_party/gtest:workspace.bzl", gtest = "repo")
load("//third_party/gflags:workspace.bzl", gflags = "repo")
load("//third_party/ncurses5:workspace.bzl", ncurses5 = "repo")
load("//third_party/protobuf:workspace.bzl", protobuf = "repo")
load("//third_party/uuid:workspace.bzl", uuid = "repo")

load("//third_party/py:python_configure.bzl", "python_configure")

def initialize_third_party():
    """ Load third party repositories.  See above load() statements. """

    absl()
    cpplint()
    fastrtps()
    gflags()
    glog()
    gtest()
    ncurses5()
    protobuf()
    uuid()

# Define all external repositories required by
def cyber_repositories():
    python_configure(name = "local_config_python")

    initialize_third_party()
