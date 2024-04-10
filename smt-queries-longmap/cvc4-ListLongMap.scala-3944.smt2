; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53678 () Bool)

(assert start!53678)

(declare-fun b!585114 () Bool)

(declare-fun res!372933 () Bool)

(declare-fun e!334878 () Bool)

(assert (=> b!585114 (=> (not res!372933) (not e!334878))))

(declare-datatypes ((array!36579 0))(
  ( (array!36580 (arr!17564 (Array (_ BitVec 32) (_ BitVec 64))) (size!17928 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36579)

(declare-datatypes ((List!11605 0))(
  ( (Nil!11602) (Cons!11601 (h!12646 (_ BitVec 64)) (t!17833 List!11605)) )
))
(declare-fun arrayNoDuplicates!0 (array!36579 (_ BitVec 32) List!11605) Bool)

(assert (=> b!585114 (= res!372933 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11602))))

(declare-fun b!585115 () Bool)

(declare-fun res!372936 () Bool)

(declare-fun e!334875 () Bool)

(assert (=> b!585115 (=> (not res!372936) (not e!334875))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585115 (= res!372936 (validKeyInArray!0 k!1786))))

(declare-fun b!585116 () Bool)

(declare-fun res!372941 () Bool)

(assert (=> b!585116 (=> (not res!372941) (not e!334875))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585116 (= res!372941 (and (= (size!17928 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17928 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17928 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585117 () Bool)

(declare-fun res!372940 () Bool)

(assert (=> b!585117 (=> (not res!372940) (not e!334878))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585117 (= res!372940 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17564 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17564 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585118 () Bool)

(declare-fun e!334877 () Bool)

(assert (=> b!585118 (= e!334878 e!334877)))

(declare-fun res!372935 () Bool)

(assert (=> b!585118 (=> (not res!372935) (not e!334877))))

(declare-fun lt!265744 () (_ BitVec 32))

(assert (=> b!585118 (= res!372935 (and (bvsge lt!265744 #b00000000000000000000000000000000) (bvslt lt!265744 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585118 (= lt!265744 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585119 () Bool)

(declare-fun res!372939 () Bool)

(assert (=> b!585119 (=> (not res!372939) (not e!334878))))

(assert (=> b!585119 (= res!372939 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17564 a!2986) index!984) (select (arr!17564 a!2986) j!136))) (not (= (select (arr!17564 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585121 () Bool)

(assert (=> b!585121 (= e!334877 false)))

(declare-datatypes ((SeekEntryResult!6004 0))(
  ( (MissingZero!6004 (index!26243 (_ BitVec 32))) (Found!6004 (index!26244 (_ BitVec 32))) (Intermediate!6004 (undefined!6816 Bool) (index!26245 (_ BitVec 32)) (x!55065 (_ BitVec 32))) (Undefined!6004) (MissingVacant!6004 (index!26246 (_ BitVec 32))) )
))
(declare-fun lt!265742 () SeekEntryResult!6004)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36579 (_ BitVec 32)) SeekEntryResult!6004)

(assert (=> b!585121 (= lt!265742 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265744 vacantSpotIndex!68 (select (arr!17564 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585122 () Bool)

(declare-fun res!372932 () Bool)

(assert (=> b!585122 (=> (not res!372932) (not e!334875))))

(assert (=> b!585122 (= res!372932 (validKeyInArray!0 (select (arr!17564 a!2986) j!136)))))

(declare-fun b!585123 () Bool)

(declare-fun res!372937 () Bool)

(assert (=> b!585123 (=> (not res!372937) (not e!334875))))

(declare-fun arrayContainsKey!0 (array!36579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585123 (= res!372937 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585120 () Bool)

(assert (=> b!585120 (= e!334875 e!334878)))

(declare-fun res!372930 () Bool)

(assert (=> b!585120 (=> (not res!372930) (not e!334878))))

(declare-fun lt!265743 () SeekEntryResult!6004)

(assert (=> b!585120 (= res!372930 (or (= lt!265743 (MissingZero!6004 i!1108)) (= lt!265743 (MissingVacant!6004 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36579 (_ BitVec 32)) SeekEntryResult!6004)

(assert (=> b!585120 (= lt!265743 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!372938 () Bool)

(assert (=> start!53678 (=> (not res!372938) (not e!334875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53678 (= res!372938 (validMask!0 mask!3053))))

(assert (=> start!53678 e!334875))

(assert (=> start!53678 true))

(declare-fun array_inv!13360 (array!36579) Bool)

(assert (=> start!53678 (array_inv!13360 a!2986)))

(declare-fun b!585124 () Bool)

(declare-fun res!372931 () Bool)

(assert (=> b!585124 (=> (not res!372931) (not e!334878))))

(assert (=> b!585124 (= res!372931 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17564 a!2986) j!136) a!2986 mask!3053) (Found!6004 j!136)))))

(declare-fun b!585125 () Bool)

(declare-fun res!372934 () Bool)

(assert (=> b!585125 (=> (not res!372934) (not e!334878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36579 (_ BitVec 32)) Bool)

(assert (=> b!585125 (= res!372934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53678 res!372938) b!585116))

(assert (= (and b!585116 res!372941) b!585122))

(assert (= (and b!585122 res!372932) b!585115))

(assert (= (and b!585115 res!372936) b!585123))

(assert (= (and b!585123 res!372937) b!585120))

(assert (= (and b!585120 res!372930) b!585125))

(assert (= (and b!585125 res!372934) b!585114))

(assert (= (and b!585114 res!372933) b!585117))

(assert (= (and b!585117 res!372940) b!585124))

(assert (= (and b!585124 res!372931) b!585119))

(assert (= (and b!585119 res!372939) b!585118))

(assert (= (and b!585118 res!372935) b!585121))

(declare-fun m!563393 () Bool)

(assert (=> b!585122 m!563393))

(assert (=> b!585122 m!563393))

(declare-fun m!563395 () Bool)

(assert (=> b!585122 m!563395))

(declare-fun m!563397 () Bool)

(assert (=> b!585119 m!563397))

(assert (=> b!585119 m!563393))

(declare-fun m!563399 () Bool)

(assert (=> b!585114 m!563399))

(declare-fun m!563401 () Bool)

(assert (=> b!585118 m!563401))

(declare-fun m!563403 () Bool)

(assert (=> b!585115 m!563403))

(assert (=> b!585124 m!563393))

(assert (=> b!585124 m!563393))

(declare-fun m!563405 () Bool)

(assert (=> b!585124 m!563405))

(declare-fun m!563407 () Bool)

(assert (=> b!585117 m!563407))

(declare-fun m!563409 () Bool)

(assert (=> b!585117 m!563409))

(declare-fun m!563411 () Bool)

(assert (=> b!585117 m!563411))

(assert (=> b!585121 m!563393))

(assert (=> b!585121 m!563393))

(declare-fun m!563413 () Bool)

(assert (=> b!585121 m!563413))

(declare-fun m!563415 () Bool)

(assert (=> b!585123 m!563415))

(declare-fun m!563417 () Bool)

(assert (=> b!585125 m!563417))

(declare-fun m!563419 () Bool)

(assert (=> b!585120 m!563419))

(declare-fun m!563421 () Bool)

(assert (=> start!53678 m!563421))

(declare-fun m!563423 () Bool)

(assert (=> start!53678 m!563423))

(push 1)

(assert (not start!53678))

(assert (not b!585122))

(assert (not b!585124))

