# Common Component Example of the CyberRT framework

## How to Build

```bash
bazel build //examples/common_component_example/...
```

## How to Run

### Enable logging to stderr

- Change `GLOG_alsologtostderr` from `0` to `1` in `setup.bash`
- Run `source setup.bash` in current console.

```bash
export GLOG_alsologtostderr=1
```

### Start the sample component

```bash
cyber_launch start examples/common_component_example/common.launch
```

Or

```bash
mainbooard -d examples/common_component_example/common.dag
```

### Start the writer nodes

Open two more terminals, run the following commands respectively.

```bash
bazel run  //examples/common_component_example:channel_test_writer
```

and ...

```bash
bazel run //examples/common_component_example:channel_prediction_writer
```

Now you should see console output of the `CommonComponentSample` example from the first terminal.
