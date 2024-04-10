; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59562 () Bool)

(assert start!59562)

(declare-fun res!426357 () Bool)

(declare-fun e!377689 () Bool)

(assert (=> start!59562 (=> (not res!426357) (not e!377689))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59562 (= res!426357 (validMask!0 mask!3053))))

(assert (=> start!59562 e!377689))

(assert (=> start!59562 true))

(declare-datatypes ((array!38720 0))(
  ( (array!38721 (arr!18557 (Array (_ BitVec 32) (_ BitVec 64))) (size!18921 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38720)

(declare-fun array_inv!14353 (array!38720) Bool)

(assert (=> start!59562 (array_inv!14353 a!2986)))

(declare-fun b!657479 () Bool)

(declare-fun res!426346 () Bool)

(assert (=> b!657479 (=> (not res!426346) (not e!377689))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657479 (= res!426346 (validKeyInArray!0 (select (arr!18557 a!2986) j!136)))))

(declare-fun b!657480 () Bool)

(assert (=> b!657480 false))

(declare-fun lt!307103 () array!38720)

(declare-datatypes ((Unit!22724 0))(
  ( (Unit!22725) )
))
(declare-fun lt!307096 () Unit!22724)

(declare-datatypes ((List!12598 0))(
  ( (Nil!12595) (Cons!12594 (h!13639 (_ BitVec 64)) (t!18826 List!12598)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38720 (_ BitVec 64) (_ BitVec 32) List!12598) Unit!22724)

(assert (=> b!657480 (= lt!307096 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307103 (select (arr!18557 a!2986) j!136) j!136 Nil!12595))))

(declare-fun arrayNoDuplicates!0 (array!38720 (_ BitVec 32) List!12598) Bool)

(assert (=> b!657480 (arrayNoDuplicates!0 lt!307103 j!136 Nil!12595)))

(declare-fun lt!307106 () Unit!22724)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38720 (_ BitVec 32) (_ BitVec 32)) Unit!22724)

(assert (=> b!657480 (= lt!307106 (lemmaNoDuplicateFromThenFromBigger!0 lt!307103 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657480 (arrayNoDuplicates!0 lt!307103 #b00000000000000000000000000000000 Nil!12595)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!307090 () Unit!22724)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12598) Unit!22724)

(assert (=> b!657480 (= lt!307090 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12595))))

(declare-fun arrayContainsKey!0 (array!38720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657480 (arrayContainsKey!0 lt!307103 (select (arr!18557 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307100 () Unit!22724)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38720 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22724)

(assert (=> b!657480 (= lt!307100 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307103 (select (arr!18557 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377692 () Unit!22724)

(declare-fun Unit!22726 () Unit!22724)

(assert (=> b!657480 (= e!377692 Unit!22726)))

(declare-fun b!657481 () Bool)

(declare-fun e!377684 () Unit!22724)

(declare-fun Unit!22727 () Unit!22724)

(assert (=> b!657481 (= e!377684 Unit!22727)))

(assert (=> b!657481 false))

(declare-fun b!657482 () Bool)

(declare-fun e!377688 () Bool)

(declare-fun e!377696 () Bool)

(assert (=> b!657482 (= e!377688 e!377696)))

(declare-fun res!426345 () Bool)

(assert (=> b!657482 (=> (not res!426345) (not e!377696))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!657482 (= res!426345 (= (select (store (arr!18557 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657482 (= lt!307103 (array!38721 (store (arr!18557 a!2986) i!1108 k!1786) (size!18921 a!2986)))))

(declare-fun b!657483 () Bool)

(declare-fun res!426353 () Bool)

(assert (=> b!657483 (= res!426353 (bvsge j!136 index!984))))

(declare-fun e!377685 () Bool)

(assert (=> b!657483 (=> res!426353 e!377685)))

(declare-fun e!377686 () Bool)

(assert (=> b!657483 (= e!377686 e!377685)))

(declare-fun b!657484 () Bool)

(declare-fun res!426355 () Bool)

(assert (=> b!657484 (=> (not res!426355) (not e!377688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38720 (_ BitVec 32)) Bool)

(assert (=> b!657484 (= res!426355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657485 () Bool)

(declare-fun e!377697 () Bool)

(assert (=> b!657485 (= e!377697 true)))

(assert (=> b!657485 (= (select (store (arr!18557 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657486 () Bool)

(declare-fun res!426356 () Bool)

(assert (=> b!657486 (=> (not res!426356) (not e!377689))))

(assert (=> b!657486 (= res!426356 (and (= (size!18921 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18921 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18921 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657487 () Bool)

(declare-fun e!377693 () Unit!22724)

(declare-fun Unit!22728 () Unit!22724)

(assert (=> b!657487 (= e!377693 Unit!22728)))

(declare-fun b!657488 () Bool)

(declare-fun e!377690 () Bool)

(assert (=> b!657488 (= e!377690 (arrayContainsKey!0 lt!307103 (select (arr!18557 a!2986) j!136) index!984))))

(declare-fun b!657489 () Bool)

(declare-fun e!377683 () Bool)

(assert (=> b!657489 (= e!377696 e!377683)))

(declare-fun res!426347 () Bool)

(assert (=> b!657489 (=> (not res!426347) (not e!377683))))

(declare-datatypes ((SeekEntryResult!6997 0))(
  ( (MissingZero!6997 (index!30353 (_ BitVec 32))) (Found!6997 (index!30354 (_ BitVec 32))) (Intermediate!6997 (undefined!7809 Bool) (index!30355 (_ BitVec 32)) (x!59144 (_ BitVec 32))) (Undefined!6997) (MissingVacant!6997 (index!30356 (_ BitVec 32))) )
))
(declare-fun lt!307091 () SeekEntryResult!6997)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657489 (= res!426347 (and (= lt!307091 (Found!6997 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18557 a!2986) index!984) (select (arr!18557 a!2986) j!136))) (not (= (select (arr!18557 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38720 (_ BitVec 32)) SeekEntryResult!6997)

(assert (=> b!657489 (= lt!307091 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18557 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657490 () Bool)

(declare-fun e!377694 () Unit!22724)

(declare-fun Unit!22729 () Unit!22724)

(assert (=> b!657490 (= e!377694 Unit!22729)))

(declare-fun res!426354 () Bool)

(assert (=> b!657490 (= res!426354 (= (select (store (arr!18557 a!2986) i!1108 k!1786) index!984) (select (arr!18557 a!2986) j!136)))))

(assert (=> b!657490 (=> (not res!426354) (not e!377686))))

(assert (=> b!657490 e!377686))

(declare-fun c!75935 () Bool)

(assert (=> b!657490 (= c!75935 (bvslt j!136 index!984))))

(declare-fun lt!307097 () Unit!22724)

(assert (=> b!657490 (= lt!307097 e!377692)))

(declare-fun c!75938 () Bool)

(assert (=> b!657490 (= c!75938 (bvslt index!984 j!136))))

(declare-fun lt!307102 () Unit!22724)

(assert (=> b!657490 (= lt!307102 e!377693)))

(assert (=> b!657490 false))

(declare-fun b!657491 () Bool)

(assert (=> b!657491 (= e!377683 (not e!377697))))

(declare-fun res!426348 () Bool)

(assert (=> b!657491 (=> res!426348 e!377697)))

(declare-fun lt!307095 () SeekEntryResult!6997)

(assert (=> b!657491 (= res!426348 (not (= lt!307095 (MissingVacant!6997 vacantSpotIndex!68))))))

(declare-fun lt!307108 () Unit!22724)

(assert (=> b!657491 (= lt!307108 e!377694)))

(declare-fun c!75936 () Bool)

(assert (=> b!657491 (= c!75936 (= lt!307095 (Found!6997 index!984)))))

(declare-fun lt!307094 () Unit!22724)

(assert (=> b!657491 (= lt!307094 e!377684)))

(declare-fun c!75937 () Bool)

(assert (=> b!657491 (= c!75937 (= lt!307095 Undefined!6997))))

(declare-fun lt!307098 () (_ BitVec 64))

(assert (=> b!657491 (= lt!307095 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307098 lt!307103 mask!3053))))

(declare-fun e!377695 () Bool)

(assert (=> b!657491 e!377695))

(declare-fun res!426350 () Bool)

(assert (=> b!657491 (=> (not res!426350) (not e!377695))))

(declare-fun lt!307089 () SeekEntryResult!6997)

(declare-fun lt!307093 () (_ BitVec 32))

(assert (=> b!657491 (= res!426350 (= lt!307089 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307093 vacantSpotIndex!68 lt!307098 lt!307103 mask!3053)))))

(assert (=> b!657491 (= lt!307089 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307093 vacantSpotIndex!68 (select (arr!18557 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657491 (= lt!307098 (select (store (arr!18557 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!307104 () Unit!22724)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38720 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22724)

(assert (=> b!657491 (= lt!307104 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307093 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657491 (= lt!307093 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657492 () Bool)

(declare-fun Unit!22730 () Unit!22724)

(assert (=> b!657492 (= e!377694 Unit!22730)))

(declare-fun b!657493 () Bool)

(declare-fun res!426349 () Bool)

(assert (=> b!657493 (=> (not res!426349) (not e!377688))))

(assert (=> b!657493 (= res!426349 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12595))))

(declare-fun e!377691 () Bool)

(declare-fun b!657494 () Bool)

(assert (=> b!657494 (= e!377691 (arrayContainsKey!0 lt!307103 (select (arr!18557 a!2986) j!136) index!984))))

(declare-fun b!657495 () Bool)

(declare-fun res!426358 () Bool)

(assert (=> b!657495 (=> (not res!426358) (not e!377689))))

(assert (=> b!657495 (= res!426358 (validKeyInArray!0 k!1786))))

(declare-fun b!657496 () Bool)

(declare-fun Unit!22731 () Unit!22724)

(assert (=> b!657496 (= e!377684 Unit!22731)))

(declare-fun b!657497 () Bool)

(declare-fun res!426352 () Bool)

(assert (=> b!657497 (=> (not res!426352) (not e!377688))))

(assert (=> b!657497 (= res!426352 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18557 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657498 () Bool)

(declare-fun res!426343 () Bool)

(assert (=> b!657498 (= res!426343 (arrayContainsKey!0 lt!307103 (select (arr!18557 a!2986) j!136) j!136))))

(assert (=> b!657498 (=> (not res!426343) (not e!377691))))

(assert (=> b!657498 (= e!377685 e!377691)))

(declare-fun b!657499 () Bool)

(declare-fun Unit!22732 () Unit!22724)

(assert (=> b!657499 (= e!377692 Unit!22732)))

(declare-fun b!657500 () Bool)

(declare-fun res!426344 () Bool)

(assert (=> b!657500 (=> (not res!426344) (not e!377689))))

(assert (=> b!657500 (= res!426344 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657501 () Bool)

(assert (=> b!657501 false))

(declare-fun lt!307107 () Unit!22724)

(assert (=> b!657501 (= lt!307107 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307103 (select (arr!18557 a!2986) j!136) index!984 Nil!12595))))

(assert (=> b!657501 (arrayNoDuplicates!0 lt!307103 index!984 Nil!12595)))

(declare-fun lt!307105 () Unit!22724)

(assert (=> b!657501 (= lt!307105 (lemmaNoDuplicateFromThenFromBigger!0 lt!307103 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657501 (arrayNoDuplicates!0 lt!307103 #b00000000000000000000000000000000 Nil!12595)))

(declare-fun lt!307099 () Unit!22724)

(assert (=> b!657501 (= lt!307099 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12595))))

(assert (=> b!657501 (arrayContainsKey!0 lt!307103 (select (arr!18557 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307092 () Unit!22724)

(assert (=> b!657501 (= lt!307092 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307103 (select (arr!18557 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657501 e!377690))

(declare-fun res!426351 () Bool)

(assert (=> b!657501 (=> (not res!426351) (not e!377690))))

(assert (=> b!657501 (= res!426351 (arrayContainsKey!0 lt!307103 (select (arr!18557 a!2986) j!136) j!136))))

(declare-fun Unit!22733 () Unit!22724)

(assert (=> b!657501 (= e!377693 Unit!22733)))

(declare-fun b!657502 () Bool)

(assert (=> b!657502 (= e!377689 e!377688)))

(declare-fun res!426359 () Bool)

(assert (=> b!657502 (=> (not res!426359) (not e!377688))))

(declare-fun lt!307101 () SeekEntryResult!6997)

(assert (=> b!657502 (= res!426359 (or (= lt!307101 (MissingZero!6997 i!1108)) (= lt!307101 (MissingVacant!6997 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38720 (_ BitVec 32)) SeekEntryResult!6997)

(assert (=> b!657502 (= lt!307101 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657503 () Bool)

(assert (=> b!657503 (= e!377695 (= lt!307091 lt!307089))))

(assert (= (and start!59562 res!426357) b!657486))

(assert (= (and b!657486 res!426356) b!657479))

(assert (= (and b!657479 res!426346) b!657495))

(assert (= (and b!657495 res!426358) b!657500))

(assert (= (and b!657500 res!426344) b!657502))

(assert (= (and b!657502 res!426359) b!657484))

(assert (= (and b!657484 res!426355) b!657493))

(assert (= (and b!657493 res!426349) b!657497))

(assert (= (and b!657497 res!426352) b!657482))

(assert (= (and b!657482 res!426345) b!657489))

(assert (= (and b!657489 res!426347) b!657491))

(assert (= (and b!657491 res!426350) b!657503))

(assert (= (and b!657491 c!75937) b!657481))

(assert (= (and b!657491 (not c!75937)) b!657496))

(assert (= (and b!657491 c!75936) b!657490))

(assert (= (and b!657491 (not c!75936)) b!657492))

(assert (= (and b!657490 res!426354) b!657483))

(assert (= (and b!657483 (not res!426353)) b!657498))

(assert (= (and b!657498 res!426343) b!657494))

(assert (= (and b!657490 c!75935) b!657480))

(assert (= (and b!657490 (not c!75935)) b!657499))

(assert (= (and b!657490 c!75938) b!657501))

(assert (= (and b!657490 (not c!75938)) b!657487))

(assert (= (and b!657501 res!426351) b!657488))

(assert (= (and b!657491 (not res!426348)) b!657485))

(declare-fun m!630517 () Bool)

(assert (=> b!657488 m!630517))

(assert (=> b!657488 m!630517))

(declare-fun m!630519 () Bool)

(assert (=> b!657488 m!630519))

(assert (=> b!657498 m!630517))

(assert (=> b!657498 m!630517))

(declare-fun m!630521 () Bool)

(assert (=> b!657498 m!630521))

(declare-fun m!630523 () Bool)

(assert (=> b!657484 m!630523))

(declare-fun m!630525 () Bool)

(assert (=> b!657495 m!630525))

(assert (=> b!657480 m!630517))

(assert (=> b!657480 m!630517))

(declare-fun m!630527 () Bool)

(assert (=> b!657480 m!630527))

(declare-fun m!630529 () Bool)

(assert (=> b!657480 m!630529))

(declare-fun m!630531 () Bool)

(assert (=> b!657480 m!630531))

(declare-fun m!630533 () Bool)

(assert (=> b!657480 m!630533))

(assert (=> b!657480 m!630517))

(declare-fun m!630535 () Bool)

(assert (=> b!657480 m!630535))

(assert (=> b!657480 m!630517))

(declare-fun m!630537 () Bool)

(assert (=> b!657480 m!630537))

(declare-fun m!630539 () Bool)

(assert (=> b!657480 m!630539))

(declare-fun m!630541 () Bool)

(assert (=> b!657500 m!630541))

(assert (=> b!657479 m!630517))

(assert (=> b!657479 m!630517))

(declare-fun m!630543 () Bool)

(assert (=> b!657479 m!630543))

(declare-fun m!630545 () Bool)

(assert (=> b!657497 m!630545))

(declare-fun m!630547 () Bool)

(assert (=> b!657491 m!630547))

(declare-fun m!630549 () Bool)

(assert (=> b!657491 m!630549))

(declare-fun m!630551 () Bool)

(assert (=> b!657491 m!630551))

(assert (=> b!657491 m!630517))

(declare-fun m!630553 () Bool)

(assert (=> b!657491 m!630553))

(assert (=> b!657491 m!630517))

(declare-fun m!630555 () Bool)

(assert (=> b!657491 m!630555))

(declare-fun m!630557 () Bool)

(assert (=> b!657491 m!630557))

(declare-fun m!630559 () Bool)

(assert (=> b!657491 m!630559))

(declare-fun m!630561 () Bool)

(assert (=> b!657489 m!630561))

(assert (=> b!657489 m!630517))

(assert (=> b!657489 m!630517))

(declare-fun m!630563 () Bool)

(assert (=> b!657489 m!630563))

(declare-fun m!630565 () Bool)

(assert (=> b!657493 m!630565))

(assert (=> b!657494 m!630517))

(assert (=> b!657494 m!630517))

(assert (=> b!657494 m!630519))

(assert (=> b!657501 m!630533))

(assert (=> b!657501 m!630517))

(assert (=> b!657501 m!630517))

(declare-fun m!630567 () Bool)

(assert (=> b!657501 m!630567))

(assert (=> b!657501 m!630517))

(assert (=> b!657501 m!630521))

(assert (=> b!657501 m!630517))

(declare-fun m!630569 () Bool)

(assert (=> b!657501 m!630569))

(assert (=> b!657501 m!630517))

(declare-fun m!630571 () Bool)

(assert (=> b!657501 m!630571))

(declare-fun m!630573 () Bool)

(assert (=> b!657501 m!630573))

(declare-fun m!630575 () Bool)

(assert (=> b!657501 m!630575))

(assert (=> b!657501 m!630539))

(declare-fun m!630577 () Bool)

(assert (=> start!59562 m!630577))

(declare-fun m!630579 () Bool)

(assert (=> start!59562 m!630579))

(declare-fun m!630581 () Bool)

(assert (=> b!657502 m!630581))

(assert (=> b!657482 m!630559))

(declare-fun m!630583 () Bool)

(assert (=> b!657482 m!630583))

(assert (=> b!657490 m!630559))

(declare-fun m!630585 () Bool)

(assert (=> b!657490 m!630585))

(assert (=> b!657490 m!630517))

(assert (=> b!657485 m!630559))

(assert (=> b!657485 m!630585))

(push 1)

