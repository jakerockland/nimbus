import
  ../constants, ../errors, ../computation, ../vm_state, ../types, .. / vm / [stack], ttmath

{.this: computation.}
{.experimental.}

using
  computation: var BaseComputation

proc blockhash*(computation) =
  let blockNumber = stack.popInt()
  let blockHash = vmState.getAncestorHash(blockNumber)
  stack.push(blockHash)

proc coinbase*(computation) =
  stack.push(vmState.coinbase)

proc timestamp*(computation) =
  # TODO: EthTime is an alias of Time, which is a distinct int64 so can't use u256(int64)
  # This may have implications for different platforms.
  stack.push(vmState.timestamp.uint64.u256) 

proc number*(computation) =
  stack.push(vmState.blockNumber)

proc difficulty*(computation) =
  stack.push(vmState.difficulty)

proc gaslimit*(computation) =
  stack.push(vmState.gasLimit)

