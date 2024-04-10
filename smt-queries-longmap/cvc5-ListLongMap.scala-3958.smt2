; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53758 () Bool)

(assert start!53758)

(declare-fun b!586471 () Bool)

(declare-fun e!335274 () Bool)

(declare-fun e!335272 () Bool)

(assert (=> b!586471 (= e!335274 e!335272)))

(declare-fun res!374293 () Bool)

(assert (=> b!586471 (=> (not res!374293) (not e!335272))))

(declare-datatypes ((SeekEntryResult!6044 0))(
  ( (MissingZero!6044 (index!26403 (_ BitVec 32))) (Found!6044 (index!26404 (_ BitVec 32))) (Intermediate!6044 (undefined!6856 Bool) (index!26405 (_ BitVec 32)) (x!55217 (_ BitVec 32))) (Undefined!6044) (MissingVacant!6044 (index!26406 (_ BitVec 32))) )
))
(declare-fun lt!266102 () SeekEntryResult!6044)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!586471 (= res!374293 (or (= lt!266102 (MissingZero!6044 i!1108)) (= lt!266102 (MissingVacant!6044 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36659 0))(
  ( (array!36660 (arr!17604 (Array (_ BitVec 32) (_ BitVec 64))) (size!17968 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36659)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36659 (_ BitVec 32)) SeekEntryResult!6044)

(assert (=> b!586471 (= lt!266102 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!586472 () Bool)

(declare-fun res!374297 () Bool)

(assert (=> b!586472 (=> (not res!374297) (not e!335272))))

(declare-datatypes ((List!11645 0))(
  ( (Nil!11642) (Cons!11641 (h!12686 (_ BitVec 64)) (t!17873 List!11645)) )
))
(declare-fun arrayNoDuplicates!0 (array!36659 (_ BitVec 32) List!11645) Bool)

(assert (=> b!586472 (= res!374297 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11642))))

(declare-fun b!586473 () Bool)

(declare-fun res!374288 () Bool)

(assert (=> b!586473 (=> (not res!374288) (not e!335274))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!586473 (= res!374288 (and (= (size!17968 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17968 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17968 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586474 () Bool)

(declare-fun res!374291 () Bool)

(assert (=> b!586474 (=> (not res!374291) (not e!335272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36659 (_ BitVec 32)) Bool)

(assert (=> b!586474 (= res!374291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586475 () Bool)

(assert (=> b!586475 (= e!335272 (not (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266103 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36659 (_ BitVec 32)) SeekEntryResult!6044)

(assert (=> b!586475 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266103 vacantSpotIndex!68 (select (arr!17604 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266103 vacantSpotIndex!68 (select (store (arr!17604 a!2986) i!1108 k!1786) j!136) (array!36660 (store (arr!17604 a!2986) i!1108 k!1786) (size!17968 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18208 0))(
  ( (Unit!18209) )
))
(declare-fun lt!266104 () Unit!18208)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18208)

(assert (=> b!586475 (= lt!266104 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266103 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586475 (= lt!266103 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586476 () Bool)

(declare-fun res!374289 () Bool)

(assert (=> b!586476 (=> (not res!374289) (not e!335272))))

(assert (=> b!586476 (= res!374289 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17604 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17604 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586477 () Bool)

(declare-fun res!374287 () Bool)

(assert (=> b!586477 (=> (not res!374287) (not e!335274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586477 (= res!374287 (validKeyInArray!0 (select (arr!17604 a!2986) j!136)))))

(declare-fun b!586478 () Bool)

(declare-fun res!374296 () Bool)

(assert (=> b!586478 (=> (not res!374296) (not e!335274))))

(declare-fun arrayContainsKey!0 (array!36659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586478 (= res!374296 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586479 () Bool)

(declare-fun res!374295 () Bool)

(assert (=> b!586479 (=> (not res!374295) (not e!335272))))

(assert (=> b!586479 (= res!374295 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17604 a!2986) j!136) a!2986 mask!3053) (Found!6044 j!136)))))

(declare-fun b!586480 () Bool)

(declare-fun res!374294 () Bool)

(assert (=> b!586480 (=> (not res!374294) (not e!335274))))

(assert (=> b!586480 (= res!374294 (validKeyInArray!0 k!1786))))

(declare-fun res!374292 () Bool)

(assert (=> start!53758 (=> (not res!374292) (not e!335274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53758 (= res!374292 (validMask!0 mask!3053))))

(assert (=> start!53758 e!335274))

(assert (=> start!53758 true))

(declare-fun array_inv!13400 (array!36659) Bool)

(assert (=> start!53758 (array_inv!13400 a!2986)))

(declare-fun b!586481 () Bool)

(declare-fun res!374290 () Bool)

(assert (=> b!586481 (=> (not res!374290) (not e!335272))))

(assert (=> b!586481 (= res!374290 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17604 a!2986) index!984) (select (arr!17604 a!2986) j!136))) (not (= (select (arr!17604 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!53758 res!374292) b!586473))

(assert (= (and b!586473 res!374288) b!586477))

(assert (= (and b!586477 res!374287) b!586480))

(assert (= (and b!586480 res!374294) b!586478))

(assert (= (and b!586478 res!374296) b!586471))

(assert (= (and b!586471 res!374293) b!586474))

(assert (= (and b!586474 res!374291) b!586472))

(assert (= (and b!586472 res!374297) b!586476))

(assert (= (and b!586476 res!374289) b!586479))

(assert (= (and b!586479 res!374295) b!586481))

(assert (= (and b!586481 res!374290) b!586475))

(declare-fun m!564835 () Bool)

(assert (=> b!586475 m!564835))

(declare-fun m!564837 () Bool)

(assert (=> b!586475 m!564837))

(declare-fun m!564839 () Bool)

(assert (=> b!586475 m!564839))

(declare-fun m!564841 () Bool)

(assert (=> b!586475 m!564841))

(declare-fun m!564843 () Bool)

(assert (=> b!586475 m!564843))

(assert (=> b!586475 m!564837))

(declare-fun m!564845 () Bool)

(assert (=> b!586475 m!564845))

(assert (=> b!586475 m!564839))

(declare-fun m!564847 () Bool)

(assert (=> b!586475 m!564847))

(declare-fun m!564849 () Bool)

(assert (=> b!586481 m!564849))

(assert (=> b!586481 m!564839))

(declare-fun m!564851 () Bool)

(assert (=> b!586478 m!564851))

(declare-fun m!564853 () Bool)

(assert (=> start!53758 m!564853))

(declare-fun m!564855 () Bool)

(assert (=> start!53758 m!564855))

(declare-fun m!564857 () Bool)

(assert (=> b!586480 m!564857))

(declare-fun m!564859 () Bool)

(assert (=> b!586472 m!564859))

(declare-fun m!564861 () Bool)

(assert (=> b!586476 m!564861))

(assert (=> b!586476 m!564841))

(declare-fun m!564863 () Bool)

(assert (=> b!586476 m!564863))

(assert (=> b!586479 m!564839))

(assert (=> b!586479 m!564839))

(declare-fun m!564865 () Bool)

(assert (=> b!586479 m!564865))

(declare-fun m!564867 () Bool)

(assert (=> b!586474 m!564867))

(declare-fun m!564869 () Bool)

(assert (=> b!586471 m!564869))

(assert (=> b!586477 m!564839))

(assert (=> b!586477 m!564839))

(declare-fun m!564871 () Bool)

(assert (=> b!586477 m!564871))

(push 1)

(assert (not b!586471))

(assert (not b!586477))

(assert (not b!586472))

(assert (not b!586480))

(assert (not start!53758))

(assert (not b!586475))

(assert (not b!586478))

(assert (not b!586474))

(assert (not b!586479))

(check-sat)

(pop 1)

