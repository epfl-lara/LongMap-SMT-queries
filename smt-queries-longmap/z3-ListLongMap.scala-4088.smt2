; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56076 () Bool)

(assert start!56076)

(declare-fun res!397097 () Bool)

(declare-fun e!353497 () Bool)

(assert (=> start!56076 (=> (not res!397097) (not e!353497))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56076 (= res!397097 (validMask!0 mask!3053))))

(assert (=> start!56076 e!353497))

(assert (=> start!56076 true))

(declare-datatypes ((array!37491 0))(
  ( (array!37492 (arr!17989 (Array (_ BitVec 32) (_ BitVec 64))) (size!18353 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37491)

(declare-fun array_inv!13848 (array!37491) Bool)

(assert (=> start!56076 (array_inv!13848 a!2986)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!397107 () Bool)

(declare-fun b!616507 () Bool)

(declare-fun lt!283507 () array!37491)

(declare-fun arrayContainsKey!0 (array!37491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616507 (= res!397107 (arrayContainsKey!0 lt!283507 (select (arr!17989 a!2986) j!136) j!136))))

(declare-fun e!353501 () Bool)

(assert (=> b!616507 (=> (not res!397107) (not e!353501))))

(declare-fun e!353504 () Bool)

(assert (=> b!616507 (= e!353504 e!353501)))

(declare-fun b!616508 () Bool)

(declare-datatypes ((Unit!20047 0))(
  ( (Unit!20048) )
))
(declare-fun e!353502 () Unit!20047)

(declare-fun Unit!20049 () Unit!20047)

(assert (=> b!616508 (= e!353502 Unit!20049)))

(declare-fun b!616509 () Bool)

(declare-fun e!353499 () Bool)

(declare-fun e!353509 () Bool)

(assert (=> b!616509 (= e!353499 e!353509)))

(declare-fun res!397093 () Bool)

(assert (=> b!616509 (=> (not res!397093) (not e!353509))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616509 (= res!397093 (= (select (store (arr!17989 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616509 (= lt!283507 (array!37492 (store (arr!17989 a!2986) i!1108 k0!1786) (size!18353 a!2986)))))

(declare-fun b!616510 () Bool)

(declare-fun res!397101 () Bool)

(assert (=> b!616510 (=> (not res!397101) (not e!353497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616510 (= res!397101 (validKeyInArray!0 (select (arr!17989 a!2986) j!136)))))

(declare-fun b!616511 () Bool)

(declare-fun e!353503 () Bool)

(declare-fun lt!283516 () (_ BitVec 64))

(assert (=> b!616511 (= e!353503 (validKeyInArray!0 lt!283516))))

(declare-fun b!616512 () Bool)

(declare-fun e!353505 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616512 (= e!353505 (arrayContainsKey!0 lt!283507 (select (arr!17989 a!2986) j!136) index!984))))

(declare-fun b!616513 () Bool)

(assert (=> b!616513 (= e!353497 e!353499)))

(declare-fun res!397106 () Bool)

(assert (=> b!616513 (=> (not res!397106) (not e!353499))))

(declare-datatypes ((SeekEntryResult!6385 0))(
  ( (MissingZero!6385 (index!27824 (_ BitVec 32))) (Found!6385 (index!27825 (_ BitVec 32))) (Intermediate!6385 (undefined!7197 Bool) (index!27826 (_ BitVec 32)) (x!56772 (_ BitVec 32))) (Undefined!6385) (MissingVacant!6385 (index!27827 (_ BitVec 32))) )
))
(declare-fun lt!283519 () SeekEntryResult!6385)

(assert (=> b!616513 (= res!397106 (or (= lt!283519 (MissingZero!6385 i!1108)) (= lt!283519 (MissingVacant!6385 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37491 (_ BitVec 32)) SeekEntryResult!6385)

(assert (=> b!616513 (= lt!283519 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616514 () Bool)

(declare-fun res!397104 () Bool)

(assert (=> b!616514 (=> (not res!397104) (not e!353497))))

(assert (=> b!616514 (= res!397104 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616515 () Bool)

(declare-fun e!353500 () Unit!20047)

(declare-fun Unit!20050 () Unit!20047)

(assert (=> b!616515 (= e!353500 Unit!20050)))

(declare-fun b!616516 () Bool)

(declare-fun res!397108 () Bool)

(assert (=> b!616516 (= res!397108 (bvsge j!136 index!984))))

(assert (=> b!616516 (=> res!397108 e!353504)))

(declare-fun e!353506 () Bool)

(assert (=> b!616516 (= e!353506 e!353504)))

(declare-fun b!616517 () Bool)

(declare-fun res!397103 () Bool)

(assert (=> b!616517 (=> (not res!397103) (not e!353499))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!616517 (= res!397103 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17989 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616518 () Bool)

(assert (=> b!616518 (= e!353501 (arrayContainsKey!0 lt!283507 (select (arr!17989 a!2986) j!136) index!984))))

(declare-fun b!616519 () Bool)

(declare-fun e!353510 () Unit!20047)

(declare-fun Unit!20051 () Unit!20047)

(assert (=> b!616519 (= e!353510 Unit!20051)))

(assert (=> b!616519 false))

(declare-fun b!616520 () Bool)

(declare-fun res!397096 () Bool)

(assert (=> b!616520 (=> (not res!397096) (not e!353499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37491 (_ BitVec 32)) Bool)

(assert (=> b!616520 (= res!397096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616521 () Bool)

(declare-fun res!397092 () Bool)

(assert (=> b!616521 (=> (not res!397092) (not e!353497))))

(assert (=> b!616521 (= res!397092 (and (= (size!18353 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18353 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18353 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616522 () Bool)

(declare-fun e!353498 () Bool)

(assert (=> b!616522 (= e!353498 (not e!353503))))

(declare-fun res!397102 () Bool)

(assert (=> b!616522 (=> res!397102 e!353503)))

(assert (=> b!616522 (= res!397102 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!283504 () Unit!20047)

(assert (=> b!616522 (= lt!283504 e!353500)))

(declare-fun c!70076 () Bool)

(declare-fun lt!283500 () SeekEntryResult!6385)

(assert (=> b!616522 (= c!70076 (= lt!283500 (Found!6385 index!984)))))

(declare-fun lt!283509 () Unit!20047)

(assert (=> b!616522 (= lt!283509 e!353510)))

(declare-fun c!70079 () Bool)

(assert (=> b!616522 (= c!70079 (= lt!283500 Undefined!6385))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37491 (_ BitVec 32)) SeekEntryResult!6385)

(assert (=> b!616522 (= lt!283500 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283516 lt!283507 mask!3053))))

(declare-fun e!353508 () Bool)

(assert (=> b!616522 e!353508))

(declare-fun res!397100 () Bool)

(assert (=> b!616522 (=> (not res!397100) (not e!353508))))

(declare-fun lt!283508 () (_ BitVec 32))

(declare-fun lt!283501 () SeekEntryResult!6385)

(assert (=> b!616522 (= res!397100 (= lt!283501 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283508 vacantSpotIndex!68 lt!283516 lt!283507 mask!3053)))))

(assert (=> b!616522 (= lt!283501 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283508 vacantSpotIndex!68 (select (arr!17989 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!616522 (= lt!283516 (select (store (arr!17989 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283510 () Unit!20047)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20047)

(assert (=> b!616522 (= lt!283510 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283508 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616522 (= lt!283508 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!616523 () Bool)

(declare-fun Unit!20052 () Unit!20047)

(assert (=> b!616523 (= e!353510 Unit!20052)))

(declare-fun b!616524 () Bool)

(assert (=> b!616524 false))

(declare-fun lt!283511 () Unit!20047)

(declare-datatypes ((List!11937 0))(
  ( (Nil!11934) (Cons!11933 (h!12981 (_ BitVec 64)) (t!18157 List!11937)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37491 (_ BitVec 64) (_ BitVec 32) List!11937) Unit!20047)

(assert (=> b!616524 (= lt!283511 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283507 (select (arr!17989 a!2986) j!136) j!136 Nil!11934))))

(declare-fun arrayNoDuplicates!0 (array!37491 (_ BitVec 32) List!11937) Bool)

(assert (=> b!616524 (arrayNoDuplicates!0 lt!283507 j!136 Nil!11934)))

(declare-fun lt!283518 () Unit!20047)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37491 (_ BitVec 32) (_ BitVec 32)) Unit!20047)

(assert (=> b!616524 (= lt!283518 (lemmaNoDuplicateFromThenFromBigger!0 lt!283507 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616524 (arrayNoDuplicates!0 lt!283507 #b00000000000000000000000000000000 Nil!11934)))

(declare-fun lt!283513 () Unit!20047)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11937) Unit!20047)

(assert (=> b!616524 (= lt!283513 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11934))))

(assert (=> b!616524 (arrayContainsKey!0 lt!283507 (select (arr!17989 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283505 () Unit!20047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20047)

(assert (=> b!616524 (= lt!283505 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283507 (select (arr!17989 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353511 () Unit!20047)

(declare-fun Unit!20053 () Unit!20047)

(assert (=> b!616524 (= e!353511 Unit!20053)))

(declare-fun b!616525 () Bool)

(declare-fun lt!283503 () SeekEntryResult!6385)

(assert (=> b!616525 (= e!353508 (= lt!283503 lt!283501))))

(declare-fun b!616526 () Bool)

(assert (=> b!616526 (= e!353509 e!353498)))

(declare-fun res!397105 () Bool)

(assert (=> b!616526 (=> (not res!397105) (not e!353498))))

(assert (=> b!616526 (= res!397105 (and (= lt!283503 (Found!6385 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17989 a!2986) index!984) (select (arr!17989 a!2986) j!136))) (not (= (select (arr!17989 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616526 (= lt!283503 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17989 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616527 () Bool)

(declare-fun Unit!20054 () Unit!20047)

(assert (=> b!616527 (= e!353511 Unit!20054)))

(declare-fun b!616528 () Bool)

(declare-fun res!397094 () Bool)

(assert (=> b!616528 (=> (not res!397094) (not e!353499))))

(assert (=> b!616528 (= res!397094 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11934))))

(declare-fun b!616529 () Bool)

(assert (=> b!616529 false))

(declare-fun lt!283502 () Unit!20047)

(assert (=> b!616529 (= lt!283502 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283507 (select (arr!17989 a!2986) j!136) index!984 Nil!11934))))

(assert (=> b!616529 (arrayNoDuplicates!0 lt!283507 index!984 Nil!11934)))

(declare-fun lt!283514 () Unit!20047)

(assert (=> b!616529 (= lt!283514 (lemmaNoDuplicateFromThenFromBigger!0 lt!283507 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616529 (arrayNoDuplicates!0 lt!283507 #b00000000000000000000000000000000 Nil!11934)))

(declare-fun lt!283515 () Unit!20047)

(assert (=> b!616529 (= lt!283515 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11934))))

(assert (=> b!616529 (arrayContainsKey!0 lt!283507 (select (arr!17989 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283506 () Unit!20047)

(assert (=> b!616529 (= lt!283506 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283507 (select (arr!17989 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616529 e!353505))

(declare-fun res!397095 () Bool)

(assert (=> b!616529 (=> (not res!397095) (not e!353505))))

(assert (=> b!616529 (= res!397095 (arrayContainsKey!0 lt!283507 (select (arr!17989 a!2986) j!136) j!136))))

(declare-fun Unit!20055 () Unit!20047)

(assert (=> b!616529 (= e!353502 Unit!20055)))

(declare-fun b!616530 () Bool)

(declare-fun Unit!20056 () Unit!20047)

(assert (=> b!616530 (= e!353500 Unit!20056)))

(declare-fun res!397098 () Bool)

(assert (=> b!616530 (= res!397098 (= (select (store (arr!17989 a!2986) i!1108 k0!1786) index!984) (select (arr!17989 a!2986) j!136)))))

(assert (=> b!616530 (=> (not res!397098) (not e!353506))))

(assert (=> b!616530 e!353506))

(declare-fun c!70078 () Bool)

(assert (=> b!616530 (= c!70078 (bvslt j!136 index!984))))

(declare-fun lt!283517 () Unit!20047)

(assert (=> b!616530 (= lt!283517 e!353511)))

(declare-fun c!70077 () Bool)

(assert (=> b!616530 (= c!70077 (bvslt index!984 j!136))))

(declare-fun lt!283512 () Unit!20047)

(assert (=> b!616530 (= lt!283512 e!353502)))

(assert (=> b!616530 false))

(declare-fun b!616531 () Bool)

(declare-fun res!397099 () Bool)

(assert (=> b!616531 (=> (not res!397099) (not e!353497))))

(assert (=> b!616531 (= res!397099 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56076 res!397097) b!616521))

(assert (= (and b!616521 res!397092) b!616510))

(assert (= (and b!616510 res!397101) b!616531))

(assert (= (and b!616531 res!397099) b!616514))

(assert (= (and b!616514 res!397104) b!616513))

(assert (= (and b!616513 res!397106) b!616520))

(assert (= (and b!616520 res!397096) b!616528))

(assert (= (and b!616528 res!397094) b!616517))

(assert (= (and b!616517 res!397103) b!616509))

(assert (= (and b!616509 res!397093) b!616526))

(assert (= (and b!616526 res!397105) b!616522))

(assert (= (and b!616522 res!397100) b!616525))

(assert (= (and b!616522 c!70079) b!616519))

(assert (= (and b!616522 (not c!70079)) b!616523))

(assert (= (and b!616522 c!70076) b!616530))

(assert (= (and b!616522 (not c!70076)) b!616515))

(assert (= (and b!616530 res!397098) b!616516))

(assert (= (and b!616516 (not res!397108)) b!616507))

(assert (= (and b!616507 res!397107) b!616518))

(assert (= (and b!616530 c!70078) b!616524))

(assert (= (and b!616530 (not c!70078)) b!616527))

(assert (= (and b!616530 c!70077) b!616529))

(assert (= (and b!616530 (not c!70077)) b!616508))

(assert (= (and b!616529 res!397095) b!616512))

(assert (= (and b!616522 (not res!397102)) b!616511))

(declare-fun m!592961 () Bool)

(assert (=> b!616530 m!592961))

(declare-fun m!592963 () Bool)

(assert (=> b!616530 m!592963))

(declare-fun m!592965 () Bool)

(assert (=> b!616530 m!592965))

(declare-fun m!592967 () Bool)

(assert (=> b!616514 m!592967))

(assert (=> b!616512 m!592965))

(assert (=> b!616512 m!592965))

(declare-fun m!592969 () Bool)

(assert (=> b!616512 m!592969))

(assert (=> b!616529 m!592965))

(declare-fun m!592971 () Bool)

(assert (=> b!616529 m!592971))

(assert (=> b!616529 m!592965))

(declare-fun m!592973 () Bool)

(assert (=> b!616529 m!592973))

(assert (=> b!616529 m!592965))

(declare-fun m!592975 () Bool)

(assert (=> b!616529 m!592975))

(assert (=> b!616529 m!592965))

(declare-fun m!592977 () Bool)

(assert (=> b!616529 m!592977))

(declare-fun m!592979 () Bool)

(assert (=> b!616529 m!592979))

(declare-fun m!592981 () Bool)

(assert (=> b!616529 m!592981))

(declare-fun m!592983 () Bool)

(assert (=> b!616529 m!592983))

(assert (=> b!616529 m!592965))

(declare-fun m!592985 () Bool)

(assert (=> b!616529 m!592985))

(assert (=> b!616509 m!592961))

(declare-fun m!592987 () Bool)

(assert (=> b!616509 m!592987))

(assert (=> b!616524 m!592965))

(declare-fun m!592989 () Bool)

(assert (=> b!616524 m!592989))

(assert (=> b!616524 m!592975))

(assert (=> b!616524 m!592965))

(declare-fun m!592991 () Bool)

(assert (=> b!616524 m!592991))

(declare-fun m!592993 () Bool)

(assert (=> b!616524 m!592993))

(assert (=> b!616524 m!592965))

(declare-fun m!592995 () Bool)

(assert (=> b!616524 m!592995))

(assert (=> b!616524 m!592965))

(declare-fun m!592997 () Bool)

(assert (=> b!616524 m!592997))

(assert (=> b!616524 m!592981))

(declare-fun m!592999 () Bool)

(assert (=> b!616528 m!592999))

(declare-fun m!593001 () Bool)

(assert (=> b!616526 m!593001))

(assert (=> b!616526 m!592965))

(assert (=> b!616526 m!592965))

(declare-fun m!593003 () Bool)

(assert (=> b!616526 m!593003))

(declare-fun m!593005 () Bool)

(assert (=> b!616531 m!593005))

(declare-fun m!593007 () Bool)

(assert (=> start!56076 m!593007))

(declare-fun m!593009 () Bool)

(assert (=> start!56076 m!593009))

(declare-fun m!593011 () Bool)

(assert (=> b!616522 m!593011))

(declare-fun m!593013 () Bool)

(assert (=> b!616522 m!593013))

(declare-fun m!593015 () Bool)

(assert (=> b!616522 m!593015))

(assert (=> b!616522 m!592965))

(assert (=> b!616522 m!592961))

(assert (=> b!616522 m!592965))

(declare-fun m!593017 () Bool)

(assert (=> b!616522 m!593017))

(declare-fun m!593019 () Bool)

(assert (=> b!616522 m!593019))

(declare-fun m!593021 () Bool)

(assert (=> b!616522 m!593021))

(declare-fun m!593023 () Bool)

(assert (=> b!616511 m!593023))

(assert (=> b!616518 m!592965))

(assert (=> b!616518 m!592965))

(assert (=> b!616518 m!592969))

(declare-fun m!593025 () Bool)

(assert (=> b!616517 m!593025))

(assert (=> b!616507 m!592965))

(assert (=> b!616507 m!592965))

(assert (=> b!616507 m!592985))

(declare-fun m!593027 () Bool)

(assert (=> b!616513 m!593027))

(declare-fun m!593029 () Bool)

(assert (=> b!616520 m!593029))

(assert (=> b!616510 m!592965))

(assert (=> b!616510 m!592965))

(declare-fun m!593031 () Bool)

(assert (=> b!616510 m!593031))

(check-sat (not b!616514) (not b!616529) (not b!616518) (not b!616524) (not b!616512) (not b!616526) (not b!616522) (not b!616520) (not b!616531) (not start!56076) (not b!616513) (not b!616507) (not b!616511) (not b!616510) (not b!616528))
(check-sat)
