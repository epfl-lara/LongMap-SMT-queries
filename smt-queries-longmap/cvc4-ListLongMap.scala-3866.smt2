; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53210 () Bool)

(assert start!53210)

(declare-fun b!578396 () Bool)

(declare-fun e!332637 () Bool)

(declare-fun e!332636 () Bool)

(assert (=> b!578396 (= e!332637 e!332636)))

(declare-fun res!366216 () Bool)

(assert (=> b!578396 (=> (not res!366216) (not e!332636))))

(declare-datatypes ((SeekEntryResult!5770 0))(
  ( (MissingZero!5770 (index!25307 (_ BitVec 32))) (Found!5770 (index!25308 (_ BitVec 32))) (Intermediate!5770 (undefined!6582 Bool) (index!25309 (_ BitVec 32)) (x!54207 (_ BitVec 32))) (Undefined!5770) (MissingVacant!5770 (index!25310 (_ BitVec 32))) )
))
(declare-fun lt!264249 () SeekEntryResult!5770)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578396 (= res!366216 (or (= lt!264249 (MissingZero!5770 i!1108)) (= lt!264249 (MissingVacant!5770 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36111 0))(
  ( (array!36112 (arr!17330 (Array (_ BitVec 32) (_ BitVec 64))) (size!17694 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36111)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36111 (_ BitVec 32)) SeekEntryResult!5770)

(assert (=> b!578396 (= lt!264249 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!578397 () Bool)

(declare-fun res!366213 () Bool)

(assert (=> b!578397 (=> (not res!366213) (not e!332637))))

(declare-fun arrayContainsKey!0 (array!36111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578397 (= res!366213 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578398 () Bool)

(declare-fun res!366217 () Bool)

(assert (=> b!578398 (=> (not res!366217) (not e!332636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36111 (_ BitVec 32)) Bool)

(assert (=> b!578398 (= res!366217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578399 () Bool)

(declare-fun res!366214 () Bool)

(assert (=> b!578399 (=> (not res!366214) (not e!332637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578399 (= res!366214 (validKeyInArray!0 k!1786))))

(declare-fun res!366215 () Bool)

(assert (=> start!53210 (=> (not res!366215) (not e!332637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53210 (= res!366215 (validMask!0 mask!3053))))

(assert (=> start!53210 e!332637))

(assert (=> start!53210 true))

(declare-fun array_inv!13126 (array!36111) Bool)

(assert (=> start!53210 (array_inv!13126 a!2986)))

(declare-fun b!578400 () Bool)

(declare-fun res!366218 () Bool)

(assert (=> b!578400 (=> (not res!366218) (not e!332637))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578400 (= res!366218 (validKeyInArray!0 (select (arr!17330 a!2986) j!136)))))

(declare-fun b!578401 () Bool)

(declare-fun res!366212 () Bool)

(assert (=> b!578401 (=> (not res!366212) (not e!332637))))

(assert (=> b!578401 (= res!366212 (and (= (size!17694 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17694 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17694 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578402 () Bool)

(assert (=> b!578402 (= e!332636 false)))

(declare-fun lt!264250 () Bool)

(declare-datatypes ((List!11371 0))(
  ( (Nil!11368) (Cons!11367 (h!12412 (_ BitVec 64)) (t!17599 List!11371)) )
))
(declare-fun arrayNoDuplicates!0 (array!36111 (_ BitVec 32) List!11371) Bool)

(assert (=> b!578402 (= lt!264250 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11368))))

(assert (= (and start!53210 res!366215) b!578401))

(assert (= (and b!578401 res!366212) b!578400))

(assert (= (and b!578400 res!366218) b!578399))

(assert (= (and b!578399 res!366214) b!578397))

(assert (= (and b!578397 res!366213) b!578396))

(assert (= (and b!578396 res!366216) b!578398))

(assert (= (and b!578398 res!366217) b!578402))

(declare-fun m!557089 () Bool)

(assert (=> b!578396 m!557089))

(declare-fun m!557091 () Bool)

(assert (=> b!578399 m!557091))

(declare-fun m!557093 () Bool)

(assert (=> start!53210 m!557093))

(declare-fun m!557095 () Bool)

(assert (=> start!53210 m!557095))

(declare-fun m!557097 () Bool)

(assert (=> b!578397 m!557097))

(declare-fun m!557099 () Bool)

(assert (=> b!578398 m!557099))

(declare-fun m!557101 () Bool)

(assert (=> b!578402 m!557101))

(declare-fun m!557103 () Bool)

(assert (=> b!578400 m!557103))

(assert (=> b!578400 m!557103))

(declare-fun m!557105 () Bool)

(assert (=> b!578400 m!557105))

(push 1)

(assert (not b!578397))

(assert (not start!53210))

(assert (not b!578402))

(assert (not b!578396))

(assert (not b!578400))

(assert (not b!578399))

(assert (not b!578398))

(check-sat)

