mode = ScriptMode.Verbose

packageName   = "nimbus"
version       = "0.1.0"
author        = "Status Research & Development GmbH"
description   = "An Ethereum 2.0 Sharding Client for Resource-Restricted Devices"
license       = "Apache License 2.0"
skipDirs      = @["tests", "examples"]
bin           = @["nimbus/nimbus"]

requires "nim >= 0.18.1",
         "nimcrypto",
         "rlp",
         "stint",
         "rocksdb",
         "eth_trie",
         "eth_common",
         "json_rpc",
         "asyncdispatch2",
         "eth_p2p",
         "eth_keyfile",
         "eth_keys",
         "https://github.com/status-im/nim-bncurve >= 1.0.1"

proc buildBinary(name: string, srcDir = ".", lang = "c") =
  if not dirExists "build": mkDir "build"
  switch("out", ("./build/" & name))
  setCommand lang, srcDir & name & ".nim"

proc test(name: string, lang = "c") =
  buildBinary name, "tests/"
  --run

task test, "Run tests":
  test "all_tests"

task nimbus, "Build Nimbus":
  buildBinary "nimbus", "nimbus/"
