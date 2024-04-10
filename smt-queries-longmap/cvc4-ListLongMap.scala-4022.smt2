; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54842 () Bool)

(assert start!54842)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!342494 () Bool)

(declare-fun b!599093 () Bool)

(declare-datatypes ((array!37077 0))(
  ( (array!37078 (arr!17798 (Array (_ BitVec 32) (_ BitVec 64))) (size!18162 (_ BitVec 32))) )
))
(declare-fun lt!272281 () array!37077)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37077)

(declare-fun arrayContainsKey!0 (array!37077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599093 (= e!342494 (arrayContainsKey!0 lt!272281 (select (arr!17798 a!2986) j!136) index!984))))

(declare-fun b!599094 () Bool)

(declare-datatypes ((Unit!18870 0))(
  ( (Unit!18871) )
))
(declare-fun e!342496 () Unit!18870)

(declare-fun Unit!18872 () Unit!18870)

(assert (=> b!599094 (= e!342496 Unit!18872)))

(declare-fun b!599095 () Bool)

(declare-fun e!342497 () Bool)

(declare-fun e!342500 () Bool)

(assert (=> b!599095 (= e!342497 e!342500)))

(declare-fun res!384119 () Bool)

(assert (=> b!599095 (=> res!384119 e!342500)))

(declare-fun lt!272280 () (_ BitVec 64))

(declare-fun lt!272286 () (_ BitVec 64))

(assert (=> b!599095 (= res!384119 (or (not (= (select (arr!17798 a!2986) j!136) lt!272280)) (not (= (select (arr!17798 a!2986) j!136) lt!272286)) (bvsge j!136 index!984)))))

(declare-fun e!342493 () Bool)

(assert (=> b!599095 e!342493))

(declare-fun res!384104 () Bool)

(assert (=> b!599095 (=> (not res!384104) (not e!342493))))

(assert (=> b!599095 (= res!384104 (= lt!272286 (select (arr!17798 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!599095 (= lt!272286 (select (store (arr!17798 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599096 () Bool)

(assert (=> b!599096 (= e!342500 true)))

(declare-datatypes ((List!11839 0))(
  ( (Nil!11836) (Cons!11835 (h!12880 (_ BitVec 64)) (t!18067 List!11839)) )
))
(declare-fun arrayNoDuplicates!0 (array!37077 (_ BitVec 32) List!11839) Bool)

(assert (=> b!599096 (arrayNoDuplicates!0 lt!272281 #b00000000000000000000000000000000 Nil!11836)))

(declare-fun lt!272283 () Unit!18870)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37077 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11839) Unit!18870)

(assert (=> b!599096 (= lt!272283 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11836))))

(assert (=> b!599096 (arrayContainsKey!0 lt!272281 (select (arr!17798 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272277 () Unit!18870)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37077 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18870)

(assert (=> b!599096 (= lt!272277 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272281 (select (arr!17798 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599097 () Bool)

(declare-fun e!342499 () Bool)

(declare-fun e!342492 () Bool)

(assert (=> b!599097 (= e!342499 e!342492)))

(declare-fun res!384105 () Bool)

(assert (=> b!599097 (=> (not res!384105) (not e!342492))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599097 (= res!384105 (= (select (store (arr!17798 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599097 (= lt!272281 (array!37078 (store (arr!17798 a!2986) i!1108 k!1786) (size!18162 a!2986)))))

(declare-fun b!599098 () Bool)

(declare-fun e!342501 () Bool)

(declare-datatypes ((SeekEntryResult!6238 0))(
  ( (MissingZero!6238 (index!27209 (_ BitVec 32))) (Found!6238 (index!27210 (_ BitVec 32))) (Intermediate!6238 (undefined!7050 Bool) (index!27211 (_ BitVec 32)) (x!56013 (_ BitVec 32))) (Undefined!6238) (MissingVacant!6238 (index!27212 (_ BitVec 32))) )
))
(declare-fun lt!272282 () SeekEntryResult!6238)

(declare-fun lt!272278 () SeekEntryResult!6238)

(assert (=> b!599098 (= e!342501 (= lt!272282 lt!272278))))

(declare-fun b!599099 () Bool)

(declare-fun e!342498 () Bool)

(assert (=> b!599099 (= e!342498 (not e!342497))))

(declare-fun res!384109 () Bool)

(assert (=> b!599099 (=> res!384109 e!342497)))

(declare-fun lt!272284 () SeekEntryResult!6238)

(assert (=> b!599099 (= res!384109 (not (= lt!272284 (Found!6238 index!984))))))

(declare-fun lt!272279 () Unit!18870)

(assert (=> b!599099 (= lt!272279 e!342496)))

(declare-fun c!67862 () Bool)

(assert (=> b!599099 (= c!67862 (= lt!272284 Undefined!6238))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37077 (_ BitVec 32)) SeekEntryResult!6238)

(assert (=> b!599099 (= lt!272284 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272280 lt!272281 mask!3053))))

(assert (=> b!599099 e!342501))

(declare-fun res!384108 () Bool)

(assert (=> b!599099 (=> (not res!384108) (not e!342501))))

(declare-fun lt!272276 () (_ BitVec 32))

(assert (=> b!599099 (= res!384108 (= lt!272278 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272276 vacantSpotIndex!68 lt!272280 lt!272281 mask!3053)))))

(assert (=> b!599099 (= lt!272278 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272276 vacantSpotIndex!68 (select (arr!17798 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599099 (= lt!272280 (select (store (arr!17798 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272285 () Unit!18870)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37077 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18870)

(assert (=> b!599099 (= lt!272285 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272276 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599099 (= lt!272276 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599100 () Bool)

(declare-fun res!384118 () Bool)

(assert (=> b!599100 (=> (not res!384118) (not e!342499))))

(assert (=> b!599100 (= res!384118 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17798 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!384103 () Bool)

(declare-fun e!342495 () Bool)

(assert (=> start!54842 (=> (not res!384103) (not e!342495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54842 (= res!384103 (validMask!0 mask!3053))))

(assert (=> start!54842 e!342495))

(assert (=> start!54842 true))

(declare-fun array_inv!13594 (array!37077) Bool)

(assert (=> start!54842 (array_inv!13594 a!2986)))

(declare-fun b!599101 () Bool)

(declare-fun res!384117 () Bool)

(assert (=> b!599101 (=> (not res!384117) (not e!342495))))

(assert (=> b!599101 (= res!384117 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599102 () Bool)

(assert (=> b!599102 (= e!342492 e!342498)))

(declare-fun res!384112 () Bool)

(assert (=> b!599102 (=> (not res!384112) (not e!342498))))

(assert (=> b!599102 (= res!384112 (and (= lt!272282 (Found!6238 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17798 a!2986) index!984) (select (arr!17798 a!2986) j!136))) (not (= (select (arr!17798 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599102 (= lt!272282 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17798 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599103 () Bool)

(declare-fun res!384116 () Bool)

(assert (=> b!599103 (=> (not res!384116) (not e!342499))))

(assert (=> b!599103 (= res!384116 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11836))))

(declare-fun b!599104 () Bool)

(declare-fun e!342490 () Bool)

(assert (=> b!599104 (= e!342493 e!342490)))

(declare-fun res!384110 () Bool)

(assert (=> b!599104 (=> res!384110 e!342490)))

(assert (=> b!599104 (= res!384110 (or (not (= (select (arr!17798 a!2986) j!136) lt!272280)) (not (= (select (arr!17798 a!2986) j!136) lt!272286)) (bvsge j!136 index!984)))))

(declare-fun b!599105 () Bool)

(declare-fun res!384113 () Bool)

(assert (=> b!599105 (=> (not res!384113) (not e!342499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37077 (_ BitVec 32)) Bool)

(assert (=> b!599105 (= res!384113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599106 () Bool)

(assert (=> b!599106 (= e!342495 e!342499)))

(declare-fun res!384114 () Bool)

(assert (=> b!599106 (=> (not res!384114) (not e!342499))))

(declare-fun lt!272287 () SeekEntryResult!6238)

(assert (=> b!599106 (= res!384114 (or (= lt!272287 (MissingZero!6238 i!1108)) (= lt!272287 (MissingVacant!6238 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37077 (_ BitVec 32)) SeekEntryResult!6238)

(assert (=> b!599106 (= lt!272287 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599107 () Bool)

(declare-fun res!384107 () Bool)

(assert (=> b!599107 (=> (not res!384107) (not e!342495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599107 (= res!384107 (validKeyInArray!0 (select (arr!17798 a!2986) j!136)))))

(declare-fun b!599108 () Bool)

(declare-fun res!384106 () Bool)

(assert (=> b!599108 (=> (not res!384106) (not e!342495))))

(assert (=> b!599108 (= res!384106 (validKeyInArray!0 k!1786))))

(declare-fun b!599109 () Bool)

(declare-fun res!384111 () Bool)

(assert (=> b!599109 (=> (not res!384111) (not e!342495))))

(assert (=> b!599109 (= res!384111 (and (= (size!18162 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18162 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18162 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599110 () Bool)

(declare-fun Unit!18873 () Unit!18870)

(assert (=> b!599110 (= e!342496 Unit!18873)))

(assert (=> b!599110 false))

(declare-fun b!599111 () Bool)

(assert (=> b!599111 (= e!342490 e!342494)))

(declare-fun res!384115 () Bool)

(assert (=> b!599111 (=> (not res!384115) (not e!342494))))

(assert (=> b!599111 (= res!384115 (arrayContainsKey!0 lt!272281 (select (arr!17798 a!2986) j!136) j!136))))

(assert (= (and start!54842 res!384103) b!599109))

(assert (= (and b!599109 res!384111) b!599107))

(assert (= (and b!599107 res!384107) b!599108))

(assert (= (and b!599108 res!384106) b!599101))

(assert (= (and b!599101 res!384117) b!599106))

(assert (= (and b!599106 res!384114) b!599105))

(assert (= (and b!599105 res!384113) b!599103))

(assert (= (and b!599103 res!384116) b!599100))

(assert (= (and b!599100 res!384118) b!599097))

(assert (= (and b!599097 res!384105) b!599102))

(assert (= (and b!599102 res!384112) b!599099))

(assert (= (and b!599099 res!384108) b!599098))

(assert (= (and b!599099 c!67862) b!599110))

(assert (= (and b!599099 (not c!67862)) b!599094))

(assert (= (and b!599099 (not res!384109)) b!599095))

(assert (= (and b!599095 res!384104) b!599104))

(assert (= (and b!599104 (not res!384110)) b!599111))

(assert (= (and b!599111 res!384115) b!599093))

(assert (= (and b!599095 (not res!384119)) b!599096))

(declare-fun m!576365 () Bool)

(assert (=> b!599096 m!576365))

(declare-fun m!576367 () Bool)

(assert (=> b!599096 m!576367))

(assert (=> b!599096 m!576365))

(assert (=> b!599096 m!576365))

(declare-fun m!576369 () Bool)

(assert (=> b!599096 m!576369))

(declare-fun m!576371 () Bool)

(assert (=> b!599096 m!576371))

(declare-fun m!576373 () Bool)

(assert (=> b!599096 m!576373))

(assert (=> b!599093 m!576365))

(assert (=> b!599093 m!576365))

(declare-fun m!576375 () Bool)

(assert (=> b!599093 m!576375))

(declare-fun m!576377 () Bool)

(assert (=> b!599103 m!576377))

(declare-fun m!576379 () Bool)

(assert (=> b!599108 m!576379))

(declare-fun m!576381 () Bool)

(assert (=> b!599105 m!576381))

(assert (=> b!599095 m!576365))

(declare-fun m!576383 () Bool)

(assert (=> b!599095 m!576383))

(declare-fun m!576385 () Bool)

(assert (=> b!599095 m!576385))

(declare-fun m!576387 () Bool)

(assert (=> b!599101 m!576387))

(declare-fun m!576389 () Bool)

(assert (=> b!599106 m!576389))

(declare-fun m!576391 () Bool)

(assert (=> start!54842 m!576391))

(declare-fun m!576393 () Bool)

(assert (=> start!54842 m!576393))

(assert (=> b!599111 m!576365))

(assert (=> b!599111 m!576365))

(declare-fun m!576395 () Bool)

(assert (=> b!599111 m!576395))

(assert (=> b!599104 m!576365))

(declare-fun m!576397 () Bool)

(assert (=> b!599099 m!576397))

(declare-fun m!576399 () Bool)

(assert (=> b!599099 m!576399))

(assert (=> b!599099 m!576365))

(assert (=> b!599099 m!576383))

(declare-fun m!576401 () Bool)

(assert (=> b!599099 m!576401))

(assert (=> b!599099 m!576365))

(declare-fun m!576403 () Bool)

(assert (=> b!599099 m!576403))

(declare-fun m!576405 () Bool)

(assert (=> b!599099 m!576405))

(declare-fun m!576407 () Bool)

(assert (=> b!599099 m!576407))

(assert (=> b!599097 m!576383))

(declare-fun m!576409 () Bool)

(assert (=> b!599097 m!576409))

(declare-fun m!576411 () Bool)

(assert (=> b!599102 m!576411))

(assert (=> b!599102 m!576365))

(assert (=> b!599102 m!576365))

(declare-fun m!576413 () Bool)

(assert (=> b!599102 m!576413))

(assert (=> b!599107 m!576365))

(assert (=> b!599107 m!576365))

(declare-fun m!576415 () Bool)

(assert (=> b!599107 m!576415))

(declare-fun m!576417 () Bool)

(assert (=> b!599100 m!576417))

(push 1)

