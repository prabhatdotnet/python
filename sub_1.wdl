task sub_1 {
  input {
    File in
  }
  command {
    sh setup.sh ${in}
  }
  output {
    File results = stdout()
  }
}