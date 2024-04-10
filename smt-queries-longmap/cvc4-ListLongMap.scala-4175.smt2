; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56910 () Bool)

(assert start!56910)

(declare-fun b!630097 () Bool)

(declare-fun e!360308 () Bool)

(declare-fun e!360309 () Bool)

(assert (=> b!630097 (= e!360308 e!360309)))

(declare-fun res!407313 () Bool)

(assert (=> b!630097 (=> (not res!407313) (not e!360309))))

(declare-datatypes ((SeekEntryResult!6697 0))(
  ( (MissingZero!6697 (index!29075 (_ BitVec 32))) (Found!6697 (index!29076 (_ BitVec 32))) (Intermediate!6697 (undefined!7509 Bool) (index!29077 (_ BitVec 32)) (x!57810 (_ BitVec 32))) (Undefined!6697) (MissingVacant!6697 (index!29078 (_ BitVec 32))) )
))
(declare-fun lt!291018 () SeekEntryResult!6697)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630097 (= res!407313 (or (= lt!291018 (MissingZero!6697 i!1108)) (= lt!291018 (MissingVacant!6697 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!38043 0))(
  ( (array!38044 (arr!18257 (Array (_ BitVec 32) (_ BitVec 64))) (size!18621 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38043)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38043 (_ BitVec 32)) SeekEntryResult!6697)

(assert (=> b!630097 (= lt!291018 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630098 () Bool)

(declare-fun res!407318 () Bool)

(assert (=> b!630098 (=> (not res!407318) (not e!360309))))

(declare-datatypes ((List!12298 0))(
  ( (Nil!12295) (Cons!12294 (h!13339 (_ BitVec 64)) (t!18526 List!12298)) )
))
(declare-fun arrayNoDuplicates!0 (array!38043 (_ BitVec 32) List!12298) Bool)

(assert (=> b!630098 (= res!407318 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12295))))

(declare-fun b!630099 () Bool)

(declare-fun res!407321 () Bool)

(assert (=> b!630099 (=> (not res!407321) (not e!360308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630099 (= res!407321 (validKeyInArray!0 k!1786))))

(declare-fun b!630100 () Bool)

(declare-fun res!407316 () Bool)

(assert (=> b!630100 (=> (not res!407316) (not e!360309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38043 (_ BitVec 32)) Bool)

(assert (=> b!630100 (= res!407316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630101 () Bool)

(declare-fun res!407312 () Bool)

(assert (=> b!630101 (=> (not res!407312) (not e!360308))))

(declare-fun arrayContainsKey!0 (array!38043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630101 (= res!407312 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630102 () Bool)

(declare-fun res!407315 () Bool)

(assert (=> b!630102 (=> (not res!407315) (not e!360309))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630102 (= res!407315 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18257 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18257 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630103 () Bool)

(declare-fun res!407314 () Bool)

(assert (=> b!630103 (=> (not res!407314) (not e!360308))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!630103 (= res!407314 (and (= (size!18621 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18621 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18621 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630104 () Bool)

(declare-fun e!360312 () Bool)

(assert (=> b!630104 (= e!360309 e!360312)))

(declare-fun res!407311 () Bool)

(assert (=> b!630104 (=> (not res!407311) (not e!360312))))

(declare-fun lt!291020 () SeekEntryResult!6697)

(assert (=> b!630104 (= res!407311 (and (= lt!291020 (Found!6697 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18257 a!2986) index!984) (select (arr!18257 a!2986) j!136))) (not (= (select (arr!18257 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38043 (_ BitVec 32)) SeekEntryResult!6697)

(assert (=> b!630104 (= lt!291020 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18257 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630105 () Bool)

(declare-fun res!407320 () Bool)

(assert (=> b!630105 (=> (not res!407320) (not e!360308))))

(assert (=> b!630105 (= res!407320 (validKeyInArray!0 (select (arr!18257 a!2986) j!136)))))

(declare-fun b!630106 () Bool)

(assert (=> b!630106 (= e!360312 (not true))))

(declare-fun e!360311 () Bool)

(assert (=> b!630106 e!360311))

(declare-fun res!407319 () Bool)

(assert (=> b!630106 (=> (not res!407319) (not e!360311))))

(declare-fun lt!291019 () (_ BitVec 32))

(declare-fun lt!291022 () SeekEntryResult!6697)

(assert (=> b!630106 (= res!407319 (= lt!291022 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291019 vacantSpotIndex!68 (select (store (arr!18257 a!2986) i!1108 k!1786) j!136) (array!38044 (store (arr!18257 a!2986) i!1108 k!1786) (size!18621 a!2986)) mask!3053)))))

(assert (=> b!630106 (= lt!291022 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291019 vacantSpotIndex!68 (select (arr!18257 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!21136 0))(
  ( (Unit!21137) )
))
(declare-fun lt!291021 () Unit!21136)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38043 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21136)

(assert (=> b!630106 (= lt!291021 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291019 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630106 (= lt!291019 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!407317 () Bool)

(assert (=> start!56910 (=> (not res!407317) (not e!360308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56910 (= res!407317 (validMask!0 mask!3053))))

(assert (=> start!56910 e!360308))

(assert (=> start!56910 true))

(declare-fun array_inv!14053 (array!38043) Bool)

(assert (=> start!56910 (array_inv!14053 a!2986)))

(declare-fun b!630107 () Bool)

(assert (=> b!630107 (= e!360311 (= lt!291020 lt!291022))))

(assert (= (and start!56910 res!407317) b!630103))

(assert (= (and b!630103 res!407314) b!630105))

(assert (= (and b!630105 res!407320) b!630099))

(assert (= (and b!630099 res!407321) b!630101))

(assert (= (and b!630101 res!407312) b!630097))

(assert (= (and b!630097 res!407313) b!630100))

(assert (= (and b!630100 res!407316) b!630098))

(assert (= (and b!630098 res!407318) b!630102))

(assert (= (and b!630102 res!407315) b!630104))

(assert (= (and b!630104 res!407311) b!630106))

(assert (= (and b!630106 res!407319) b!630107))

(declare-fun m!605101 () Bool)

(assert (=> b!630098 m!605101))

(declare-fun m!605103 () Bool)

(assert (=> start!56910 m!605103))

(declare-fun m!605105 () Bool)

(assert (=> start!56910 m!605105))

(declare-fun m!605107 () Bool)

(assert (=> b!630101 m!605107))

(declare-fun m!605109 () Bool)

(assert (=> b!630100 m!605109))

(declare-fun m!605111 () Bool)

(assert (=> b!630099 m!605111))

(declare-fun m!605113 () Bool)

(assert (=> b!630104 m!605113))

(declare-fun m!605115 () Bool)

(assert (=> b!630104 m!605115))

(assert (=> b!630104 m!605115))

(declare-fun m!605117 () Bool)

(assert (=> b!630104 m!605117))

(assert (=> b!630105 m!605115))

(assert (=> b!630105 m!605115))

(declare-fun m!605119 () Bool)

(assert (=> b!630105 m!605119))

(declare-fun m!605121 () Bool)

(assert (=> b!630097 m!605121))

(declare-fun m!605123 () Bool)

(assert (=> b!630102 m!605123))

(declare-fun m!605125 () Bool)

(assert (=> b!630102 m!605125))

(declare-fun m!605127 () Bool)

(assert (=> b!630102 m!605127))

(declare-fun m!605129 () Bool)

(assert (=> b!630106 m!605129))

(declare-fun m!605131 () Bool)

(assert (=> b!630106 m!605131))

(assert (=> b!630106 m!605115))

(assert (=> b!630106 m!605115))

(declare-fun m!605133 () Bool)

(assert (=> b!630106 m!605133))

(assert (=> b!630106 m!605125))

(assert (=> b!630106 m!605131))

(declare-fun m!605135 () Bool)

(assert (=> b!630106 m!605135))

(declare-fun m!605137 () Bool)

(assert (=> b!630106 m!605137))

(push 1)

(assert (not b!630106))

