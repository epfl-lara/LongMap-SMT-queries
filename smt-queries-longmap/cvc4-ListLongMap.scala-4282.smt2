; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59604 () Bool)

(assert start!59604)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!378606 () Bool)

(declare-datatypes ((array!38762 0))(
  ( (array!38763 (arr!18578 (Array (_ BitVec 32) (_ BitVec 64))) (size!18942 (_ BitVec 32))) )
))
(declare-fun lt!308365 () array!38762)

(declare-fun b!659019 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38762)

(declare-fun arrayContainsKey!0 (array!38762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!659019 (= e!378606 (arrayContainsKey!0 lt!308365 (select (arr!18578 a!2986) j!136) index!984))))

(declare-fun b!659020 () Bool)

(declare-fun res!427390 () Bool)

(declare-fun e!378605 () Bool)

(assert (=> b!659020 (=> (not res!427390) (not e!378605))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!659020 (= res!427390 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!427384 () Bool)

(assert (=> start!59604 (=> (not res!427384) (not e!378605))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59604 (= res!427384 (validMask!0 mask!3053))))

(assert (=> start!59604 e!378605))

(assert (=> start!59604 true))

(declare-fun array_inv!14374 (array!38762) Bool)

(assert (=> start!59604 (array_inv!14374 a!2986)))

(declare-fun b!659021 () Bool)

(declare-fun e!378598 () Bool)

(assert (=> b!659021 (= e!378605 e!378598)))

(declare-fun res!427381 () Bool)

(assert (=> b!659021 (=> (not res!427381) (not e!378598))))

(declare-datatypes ((SeekEntryResult!7018 0))(
  ( (MissingZero!7018 (index!30437 (_ BitVec 32))) (Found!7018 (index!30438 (_ BitVec 32))) (Intermediate!7018 (undefined!7830 Bool) (index!30439 (_ BitVec 32)) (x!59221 (_ BitVec 32))) (Undefined!7018) (MissingVacant!7018 (index!30440 (_ BitVec 32))) )
))
(declare-fun lt!308357 () SeekEntryResult!7018)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!659021 (= res!427381 (or (= lt!308357 (MissingZero!7018 i!1108)) (= lt!308357 (MissingVacant!7018 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38762 (_ BitVec 32)) SeekEntryResult!7018)

(assert (=> b!659021 (= lt!308357 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!659022 () Bool)

(declare-fun res!427391 () Bool)

(assert (=> b!659022 (=> (not res!427391) (not e!378605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!659022 (= res!427391 (validKeyInArray!0 (select (arr!18578 a!2986) j!136)))))

(declare-fun b!659023 () Bool)

(declare-fun res!427380 () Bool)

(assert (=> b!659023 (=> (not res!427380) (not e!378598))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!659023 (= res!427380 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18578 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659024 () Bool)

(assert (=> b!659024 false))

(declare-datatypes ((Unit!22934 0))(
  ( (Unit!22935) )
))
(declare-fun lt!308362 () Unit!22934)

(declare-datatypes ((List!12619 0))(
  ( (Nil!12616) (Cons!12615 (h!13660 (_ BitVec 64)) (t!18847 List!12619)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38762 (_ BitVec 64) (_ BitVec 32) List!12619) Unit!22934)

(assert (=> b!659024 (= lt!308362 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308365 (select (arr!18578 a!2986) j!136) j!136 Nil!12616))))

(declare-fun arrayNoDuplicates!0 (array!38762 (_ BitVec 32) List!12619) Bool)

(assert (=> b!659024 (arrayNoDuplicates!0 lt!308365 j!136 Nil!12616)))

(declare-fun lt!308361 () Unit!22934)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38762 (_ BitVec 32) (_ BitVec 32)) Unit!22934)

(assert (=> b!659024 (= lt!308361 (lemmaNoDuplicateFromThenFromBigger!0 lt!308365 #b00000000000000000000000000000000 j!136))))

(assert (=> b!659024 (arrayNoDuplicates!0 lt!308365 #b00000000000000000000000000000000 Nil!12616)))

(declare-fun lt!308368 () Unit!22934)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12619) Unit!22934)

(assert (=> b!659024 (= lt!308368 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12616))))

(assert (=> b!659024 (arrayContainsKey!0 lt!308365 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308350 () Unit!22934)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38762 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22934)

(assert (=> b!659024 (= lt!308350 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308365 (select (arr!18578 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378601 () Unit!22934)

(declare-fun Unit!22936 () Unit!22934)

(assert (=> b!659024 (= e!378601 Unit!22936)))

(declare-fun b!659025 () Bool)

(declare-fun e!378597 () Bool)

(assert (=> b!659025 (= e!378597 (arrayContainsKey!0 lt!308365 (select (arr!18578 a!2986) j!136) index!984))))

(declare-fun b!659026 () Bool)

(declare-fun e!378600 () Bool)

(assert (=> b!659026 (= e!378600 (not true))))

(declare-fun lt!308358 () Unit!22934)

(declare-fun e!378595 () Unit!22934)

(assert (=> b!659026 (= lt!308358 e!378595)))

(declare-fun c!76190 () Bool)

(declare-fun lt!308353 () SeekEntryResult!7018)

(assert (=> b!659026 (= c!76190 (= lt!308353 (Found!7018 index!984)))))

(declare-fun lt!308351 () Unit!22934)

(declare-fun e!378602 () Unit!22934)

(assert (=> b!659026 (= lt!308351 e!378602)))

(declare-fun c!76189 () Bool)

(assert (=> b!659026 (= c!76189 (= lt!308353 Undefined!7018))))

(declare-fun lt!308349 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38762 (_ BitVec 32)) SeekEntryResult!7018)

(assert (=> b!659026 (= lt!308353 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308349 lt!308365 mask!3053))))

(declare-fun e!378594 () Bool)

(assert (=> b!659026 e!378594))

(declare-fun res!427393 () Bool)

(assert (=> b!659026 (=> (not res!427393) (not e!378594))))

(declare-fun lt!308356 () SeekEntryResult!7018)

(declare-fun lt!308355 () (_ BitVec 32))

(assert (=> b!659026 (= res!427393 (= lt!308356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308355 vacantSpotIndex!68 lt!308349 lt!308365 mask!3053)))))

(assert (=> b!659026 (= lt!308356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308355 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!659026 (= lt!308349 (select (store (arr!18578 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!308367 () Unit!22934)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38762 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22934)

(assert (=> b!659026 (= lt!308367 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308355 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!659026 (= lt!308355 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!659027 () Bool)

(declare-fun Unit!22937 () Unit!22934)

(assert (=> b!659027 (= e!378595 Unit!22937)))

(declare-fun res!427392 () Bool)

(assert (=> b!659027 (= res!427392 (= (select (store (arr!18578 a!2986) i!1108 k!1786) index!984) (select (arr!18578 a!2986) j!136)))))

(declare-fun e!378596 () Bool)

(assert (=> b!659027 (=> (not res!427392) (not e!378596))))

(assert (=> b!659027 e!378596))

(declare-fun c!76187 () Bool)

(assert (=> b!659027 (= c!76187 (bvslt j!136 index!984))))

(declare-fun lt!308364 () Unit!22934)

(assert (=> b!659027 (= lt!308364 e!378601)))

(declare-fun c!76188 () Bool)

(assert (=> b!659027 (= c!76188 (bvslt index!984 j!136))))

(declare-fun lt!308360 () Unit!22934)

(declare-fun e!378593 () Unit!22934)

(assert (=> b!659027 (= lt!308360 e!378593)))

(assert (=> b!659027 false))

(declare-fun b!659028 () Bool)

(declare-fun Unit!22938 () Unit!22934)

(assert (=> b!659028 (= e!378602 Unit!22938)))

(declare-fun b!659029 () Bool)

(declare-fun Unit!22939 () Unit!22934)

(assert (=> b!659029 (= e!378601 Unit!22939)))

(declare-fun b!659030 () Bool)

(assert (=> b!659030 false))

(declare-fun lt!308366 () Unit!22934)

(assert (=> b!659030 (= lt!308366 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308365 (select (arr!18578 a!2986) j!136) index!984 Nil!12616))))

(assert (=> b!659030 (arrayNoDuplicates!0 lt!308365 index!984 Nil!12616)))

(declare-fun lt!308363 () Unit!22934)

(assert (=> b!659030 (= lt!308363 (lemmaNoDuplicateFromThenFromBigger!0 lt!308365 #b00000000000000000000000000000000 index!984))))

(assert (=> b!659030 (arrayNoDuplicates!0 lt!308365 #b00000000000000000000000000000000 Nil!12616)))

(declare-fun lt!308352 () Unit!22934)

(assert (=> b!659030 (= lt!308352 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12616))))

(assert (=> b!659030 (arrayContainsKey!0 lt!308365 (select (arr!18578 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308354 () Unit!22934)

(assert (=> b!659030 (= lt!308354 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308365 (select (arr!18578 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!659030 e!378597))

(declare-fun res!427383 () Bool)

(assert (=> b!659030 (=> (not res!427383) (not e!378597))))

(assert (=> b!659030 (= res!427383 (arrayContainsKey!0 lt!308365 (select (arr!18578 a!2986) j!136) j!136))))

(declare-fun Unit!22940 () Unit!22934)

(assert (=> b!659030 (= e!378593 Unit!22940)))

(declare-fun b!659031 () Bool)

(declare-fun Unit!22941 () Unit!22934)

(assert (=> b!659031 (= e!378593 Unit!22941)))

(declare-fun b!659032 () Bool)

(declare-fun Unit!22942 () Unit!22934)

(assert (=> b!659032 (= e!378595 Unit!22942)))

(declare-fun b!659033 () Bool)

(declare-fun res!427382 () Bool)

(assert (=> b!659033 (=> (not res!427382) (not e!378598))))

(assert (=> b!659033 (= res!427382 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12616))))

(declare-fun b!659034 () Bool)

(declare-fun lt!308359 () SeekEntryResult!7018)

(assert (=> b!659034 (= e!378594 (= lt!308359 lt!308356))))

(declare-fun b!659035 () Bool)

(declare-fun Unit!22943 () Unit!22934)

(assert (=> b!659035 (= e!378602 Unit!22943)))

(assert (=> b!659035 false))

(declare-fun b!659036 () Bool)

(declare-fun e!378603 () Bool)

(assert (=> b!659036 (= e!378598 e!378603)))

(declare-fun res!427386 () Bool)

(assert (=> b!659036 (=> (not res!427386) (not e!378603))))

(assert (=> b!659036 (= res!427386 (= (select (store (arr!18578 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659036 (= lt!308365 (array!38763 (store (arr!18578 a!2986) i!1108 k!1786) (size!18942 a!2986)))))

(declare-fun b!659037 () Bool)

(declare-fun res!427387 () Bool)

(assert (=> b!659037 (= res!427387 (arrayContainsKey!0 lt!308365 (select (arr!18578 a!2986) j!136) j!136))))

(assert (=> b!659037 (=> (not res!427387) (not e!378606))))

(declare-fun e!378599 () Bool)

(assert (=> b!659037 (= e!378599 e!378606)))

(declare-fun b!659038 () Bool)

(declare-fun res!427388 () Bool)

(assert (=> b!659038 (=> (not res!427388) (not e!378598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38762 (_ BitVec 32)) Bool)

(assert (=> b!659038 (= res!427388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!659039 () Bool)

(declare-fun res!427389 () Bool)

(assert (=> b!659039 (=> (not res!427389) (not e!378605))))

(assert (=> b!659039 (= res!427389 (and (= (size!18942 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18942 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18942 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!659040 () Bool)

(declare-fun res!427385 () Bool)

(assert (=> b!659040 (=> (not res!427385) (not e!378605))))

(assert (=> b!659040 (= res!427385 (validKeyInArray!0 k!1786))))

(declare-fun b!659041 () Bool)

(declare-fun res!427379 () Bool)

(assert (=> b!659041 (= res!427379 (bvsge j!136 index!984))))

(assert (=> b!659041 (=> res!427379 e!378599)))

(assert (=> b!659041 (= e!378596 e!378599)))

(declare-fun b!659042 () Bool)

(assert (=> b!659042 (= e!378603 e!378600)))

(declare-fun res!427394 () Bool)

(assert (=> b!659042 (=> (not res!427394) (not e!378600))))

(assert (=> b!659042 (= res!427394 (and (= lt!308359 (Found!7018 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18578 a!2986) index!984) (select (arr!18578 a!2986) j!136))) (not (= (select (arr!18578 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!659042 (= lt!308359 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18578 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!59604 res!427384) b!659039))

(assert (= (and b!659039 res!427389) b!659022))

(assert (= (and b!659022 res!427391) b!659040))

(assert (= (and b!659040 res!427385) b!659020))

(assert (= (and b!659020 res!427390) b!659021))

(assert (= (and b!659021 res!427381) b!659038))

(assert (= (and b!659038 res!427388) b!659033))

(assert (= (and b!659033 res!427382) b!659023))

(assert (= (and b!659023 res!427380) b!659036))

(assert (= (and b!659036 res!427386) b!659042))

(assert (= (and b!659042 res!427394) b!659026))

(assert (= (and b!659026 res!427393) b!659034))

(assert (= (and b!659026 c!76189) b!659035))

(assert (= (and b!659026 (not c!76189)) b!659028))

(assert (= (and b!659026 c!76190) b!659027))

(assert (= (and b!659026 (not c!76190)) b!659032))

(assert (= (and b!659027 res!427392) b!659041))

(assert (= (and b!659041 (not res!427379)) b!659037))

(assert (= (and b!659037 res!427387) b!659019))

(assert (= (and b!659027 c!76187) b!659024))

(assert (= (and b!659027 (not c!76187)) b!659029))

(assert (= (and b!659027 c!76188) b!659030))

(assert (= (and b!659027 (not c!76188)) b!659031))

(assert (= (and b!659030 res!427383) b!659025))

(declare-fun m!631987 () Bool)

(assert (=> b!659037 m!631987))

(assert (=> b!659037 m!631987))

(declare-fun m!631989 () Bool)

(assert (=> b!659037 m!631989))

(assert (=> b!659025 m!631987))

(assert (=> b!659025 m!631987))

(declare-fun m!631991 () Bool)

(assert (=> b!659025 m!631991))

(declare-fun m!631993 () Bool)

(assert (=> b!659021 m!631993))

(declare-fun m!631995 () Bool)

(assert (=> start!59604 m!631995))

(declare-fun m!631997 () Bool)

(assert (=> start!59604 m!631997))

(declare-fun m!631999 () Bool)

(assert (=> b!659038 m!631999))

(assert (=> b!659024 m!631987))

(declare-fun m!632001 () Bool)

(assert (=> b!659024 m!632001))

(assert (=> b!659024 m!631987))

(declare-fun m!632003 () Bool)

(assert (=> b!659024 m!632003))

(declare-fun m!632005 () Bool)

(assert (=> b!659024 m!632005))

(assert (=> b!659024 m!631987))

(declare-fun m!632007 () Bool)

(assert (=> b!659024 m!632007))

(assert (=> b!659024 m!631987))

(declare-fun m!632009 () Bool)

(assert (=> b!659024 m!632009))

(declare-fun m!632011 () Bool)

(assert (=> b!659024 m!632011))

(declare-fun m!632013 () Bool)

(assert (=> b!659024 m!632013))

(declare-fun m!632015 () Bool)

(assert (=> b!659020 m!632015))

(declare-fun m!632017 () Bool)

(assert (=> b!659042 m!632017))

(assert (=> b!659042 m!631987))

(assert (=> b!659042 m!631987))

(declare-fun m!632019 () Bool)

(assert (=> b!659042 m!632019))

(assert (=> b!659019 m!631987))

(assert (=> b!659019 m!631987))

(assert (=> b!659019 m!631991))

(assert (=> b!659022 m!631987))

(assert (=> b!659022 m!631987))

(declare-fun m!632021 () Bool)

(assert (=> b!659022 m!632021))

(declare-fun m!632023 () Bool)

(assert (=> b!659026 m!632023))

(declare-fun m!632025 () Bool)

(assert (=> b!659026 m!632025))

(assert (=> b!659026 m!631987))

(declare-fun m!632027 () Bool)

(assert (=> b!659026 m!632027))

(declare-fun m!632029 () Bool)

(assert (=> b!659026 m!632029))

(assert (=> b!659026 m!631987))

(declare-fun m!632031 () Bool)

(assert (=> b!659026 m!632031))

(declare-fun m!632033 () Bool)

(assert (=> b!659026 m!632033))

(declare-fun m!632035 () Bool)

(assert (=> b!659026 m!632035))

(declare-fun m!632037 () Bool)

(assert (=> b!659023 m!632037))

(assert (=> b!659036 m!632029))

(declare-fun m!632039 () Bool)

(assert (=> b!659036 m!632039))

(assert (=> b!659030 m!631987))

(assert (=> b!659030 m!632003))

(declare-fun m!632041 () Bool)

(assert (=> b!659030 m!632041))

(declare-fun m!632043 () Bool)

(assert (=> b!659030 m!632043))

(assert (=> b!659030 m!631987))

(declare-fun m!632045 () Bool)

(assert (=> b!659030 m!632045))

(assert (=> b!659030 m!631987))

(assert (=> b!659030 m!631989))

(assert (=> b!659030 m!632013))

(assert (=> b!659030 m!631987))

(declare-fun m!632047 () Bool)

(assert (=> b!659030 m!632047))

(assert (=> b!659030 m!631987))

(declare-fun m!632049 () Bool)

(assert (=> b!659030 m!632049))

(assert (=> b!659027 m!632029))

(declare-fun m!632051 () Bool)

(assert (=> b!659027 m!632051))

(assert (=> b!659027 m!631987))

(declare-fun m!632053 () Bool)

(assert (=> b!659033 m!632053))

(declare-fun m!632055 () Bool)

(assert (=> b!659040 m!632055))

(push 1)

