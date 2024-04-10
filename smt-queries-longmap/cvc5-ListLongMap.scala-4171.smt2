; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56822 () Bool)

(assert start!56822)

(declare-fun b!629392 () Bool)

(declare-fun res!406795 () Bool)

(declare-fun e!359978 () Bool)

(assert (=> b!629392 (=> (not res!406795) (not e!359978))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38012 0))(
  ( (array!38013 (arr!18243 (Array (_ BitVec 32) (_ BitVec 64))) (size!18607 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38012)

(assert (=> b!629392 (= res!406795 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18243 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18243 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629393 () Bool)

(declare-fun res!406793 () Bool)

(declare-fun e!359979 () Bool)

(assert (=> b!629393 (=> (not res!406793) (not e!359979))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629393 (= res!406793 (and (= (size!18607 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18607 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18607 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629394 () Bool)

(declare-fun res!406790 () Bool)

(assert (=> b!629394 (=> (not res!406790) (not e!359978))))

(assert (=> b!629394 (= res!406790 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18243 a!2986) index!984) (select (arr!18243 a!2986) j!136))) (not (= (select (arr!18243 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629395 () Bool)

(assert (=> b!629395 (= e!359979 e!359978)))

(declare-fun res!406796 () Bool)

(assert (=> b!629395 (=> (not res!406796) (not e!359978))))

(declare-datatypes ((SeekEntryResult!6683 0))(
  ( (MissingZero!6683 (index!29016 (_ BitVec 32))) (Found!6683 (index!29017 (_ BitVec 32))) (Intermediate!6683 (undefined!7495 Bool) (index!29018 (_ BitVec 32)) (x!57755 (_ BitVec 32))) (Undefined!6683) (MissingVacant!6683 (index!29019 (_ BitVec 32))) )
))
(declare-fun lt!290740 () SeekEntryResult!6683)

(assert (=> b!629395 (= res!406796 (or (= lt!290740 (MissingZero!6683 i!1108)) (= lt!290740 (MissingVacant!6683 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38012 (_ BitVec 32)) SeekEntryResult!6683)

(assert (=> b!629395 (= lt!290740 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629396 () Bool)

(declare-fun res!406794 () Bool)

(assert (=> b!629396 (=> (not res!406794) (not e!359978))))

(declare-datatypes ((List!12284 0))(
  ( (Nil!12281) (Cons!12280 (h!13325 (_ BitVec 64)) (t!18512 List!12284)) )
))
(declare-fun arrayNoDuplicates!0 (array!38012 (_ BitVec 32) List!12284) Bool)

(assert (=> b!629396 (= res!406794 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12281))))

(declare-fun b!629397 () Bool)

(assert (=> b!629397 (= e!359978 (not true))))

(declare-fun lt!290739 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38012 (_ BitVec 32)) SeekEntryResult!6683)

(assert (=> b!629397 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290739 vacantSpotIndex!68 (select (arr!18243 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290739 vacantSpotIndex!68 (select (store (arr!18243 a!2986) i!1108 k!1786) j!136) (array!38013 (store (arr!18243 a!2986) i!1108 k!1786) (size!18607 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21108 0))(
  ( (Unit!21109) )
))
(declare-fun lt!290738 () Unit!21108)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38012 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21108)

(assert (=> b!629397 (= lt!290738 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290739 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629397 (= lt!290739 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629398 () Bool)

(declare-fun res!406788 () Bool)

(assert (=> b!629398 (=> (not res!406788) (not e!359979))))

(declare-fun arrayContainsKey!0 (array!38012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629398 (= res!406788 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629399 () Bool)

(declare-fun res!406787 () Bool)

(assert (=> b!629399 (=> (not res!406787) (not e!359978))))

(assert (=> b!629399 (= res!406787 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18243 a!2986) j!136) a!2986 mask!3053) (Found!6683 j!136)))))

(declare-fun b!629400 () Bool)

(declare-fun res!406786 () Bool)

(assert (=> b!629400 (=> (not res!406786) (not e!359979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629400 (= res!406786 (validKeyInArray!0 (select (arr!18243 a!2986) j!136)))))

(declare-fun res!406791 () Bool)

(assert (=> start!56822 (=> (not res!406791) (not e!359979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56822 (= res!406791 (validMask!0 mask!3053))))

(assert (=> start!56822 e!359979))

(assert (=> start!56822 true))

(declare-fun array_inv!14039 (array!38012) Bool)

(assert (=> start!56822 (array_inv!14039 a!2986)))

(declare-fun b!629401 () Bool)

(declare-fun res!406792 () Bool)

(assert (=> b!629401 (=> (not res!406792) (not e!359978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38012 (_ BitVec 32)) Bool)

(assert (=> b!629401 (= res!406792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629402 () Bool)

(declare-fun res!406789 () Bool)

(assert (=> b!629402 (=> (not res!406789) (not e!359979))))

(assert (=> b!629402 (= res!406789 (validKeyInArray!0 k!1786))))

(assert (= (and start!56822 res!406791) b!629393))

(assert (= (and b!629393 res!406793) b!629400))

(assert (= (and b!629400 res!406786) b!629402))

(assert (= (and b!629402 res!406789) b!629398))

(assert (= (and b!629398 res!406788) b!629395))

(assert (= (and b!629395 res!406796) b!629401))

(assert (= (and b!629401 res!406792) b!629396))

(assert (= (and b!629396 res!406794) b!629392))

(assert (= (and b!629392 res!406795) b!629399))

(assert (= (and b!629399 res!406787) b!629394))

(assert (= (and b!629394 res!406790) b!629397))

(declare-fun m!604389 () Bool)

(assert (=> b!629392 m!604389))

(declare-fun m!604391 () Bool)

(assert (=> b!629392 m!604391))

(declare-fun m!604393 () Bool)

(assert (=> b!629392 m!604393))

(declare-fun m!604395 () Bool)

(assert (=> b!629402 m!604395))

(declare-fun m!604397 () Bool)

(assert (=> b!629401 m!604397))

(declare-fun m!604399 () Bool)

(assert (=> start!56822 m!604399))

(declare-fun m!604401 () Bool)

(assert (=> start!56822 m!604401))

(declare-fun m!604403 () Bool)

(assert (=> b!629399 m!604403))

(assert (=> b!629399 m!604403))

(declare-fun m!604405 () Bool)

(assert (=> b!629399 m!604405))

(declare-fun m!604407 () Bool)

(assert (=> b!629396 m!604407))

(declare-fun m!604409 () Bool)

(assert (=> b!629395 m!604409))

(assert (=> b!629400 m!604403))

(assert (=> b!629400 m!604403))

(declare-fun m!604411 () Bool)

(assert (=> b!629400 m!604411))

(declare-fun m!604413 () Bool)

(assert (=> b!629398 m!604413))

(declare-fun m!604415 () Bool)

(assert (=> b!629397 m!604415))

(declare-fun m!604417 () Bool)

(assert (=> b!629397 m!604417))

(assert (=> b!629397 m!604403))

(assert (=> b!629397 m!604391))

(assert (=> b!629397 m!604417))

(declare-fun m!604419 () Bool)

(assert (=> b!629397 m!604419))

(declare-fun m!604421 () Bool)

(assert (=> b!629397 m!604421))

(assert (=> b!629397 m!604403))

(declare-fun m!604423 () Bool)

(assert (=> b!629397 m!604423))

(declare-fun m!604425 () Bool)

(assert (=> b!629394 m!604425))

(assert (=> b!629394 m!604403))

(push 1)

(assert (not start!56822))

(assert (not b!629401))

(assert (not b!629396))

(assert (not b!629400))

(assert (not b!629397))

(assert (not b!629398))

(assert (not b!629402))

(assert (not b!629399))

(assert (not b!629395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

