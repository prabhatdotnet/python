import "sub_1.wdl" as other

task test {
  String my_var
  command {
    ./script ${my_var}
  }
  output {
    File results = stdout()
  }
}

workflow wf {
  Array[String] arr = ["a", "b", "c"]
  call test
  call test as test2
  call other.sub_1
  output {
    test.results
    sub_1.results
  }
  scatter(x in arr) {
    call test as scattered_test {
      input: my_var=x
    }
  }
}