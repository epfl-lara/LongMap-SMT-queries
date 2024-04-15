; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59570 () Bool)

(assert start!59570)

(declare-fun b!657931 () Bool)

(assert (=> b!657931 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22802 0))(
  ( (Unit!22803) )
))
(declare-fun lt!307443 () Unit!22802)

(declare-datatypes ((array!38739 0))(
  ( (array!38740 (arr!18566 (Array (_ BitVec 32) (_ BitVec 64))) (size!18931 (_ BitVec 32))) )
))
(declare-fun lt!307433 () array!38739)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38739)

(declare-datatypes ((List!12646 0))(
  ( (Nil!12643) (Cons!12642 (h!13687 (_ BitVec 64)) (t!18865 List!12646)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38739 (_ BitVec 64) (_ BitVec 32) List!12646) Unit!22802)

(assert (=> b!657931 (= lt!307443 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307433 (select (arr!18566 a!2986) j!136) index!984 Nil!12643))))

(declare-fun arrayNoDuplicates!0 (array!38739 (_ BitVec 32) List!12646) Bool)

(assert (=> b!657931 (arrayNoDuplicates!0 lt!307433 index!984 Nil!12643)))

(declare-fun lt!307442 () Unit!22802)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38739 (_ BitVec 32) (_ BitVec 32)) Unit!22802)

(assert (=> b!657931 (= lt!307442 (lemmaNoDuplicateFromThenFromBigger!0 lt!307433 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657931 (arrayNoDuplicates!0 lt!307433 #b00000000000000000000000000000000 Nil!12643)))

(declare-fun lt!307438 () Unit!22802)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12646) Unit!22802)

(assert (=> b!657931 (= lt!307438 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12643))))

(declare-fun arrayContainsKey!0 (array!38739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657931 (arrayContainsKey!0 lt!307433 (select (arr!18566 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!307434 () Unit!22802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22802)

(assert (=> b!657931 (= lt!307434 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307433 (select (arr!18566 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377954 () Bool)

(assert (=> b!657931 e!377954))

(declare-fun res!426715 () Bool)

(assert (=> b!657931 (=> (not res!426715) (not e!377954))))

(assert (=> b!657931 (= res!426715 (arrayContainsKey!0 lt!307433 (select (arr!18566 a!2986) j!136) j!136))))

(declare-fun e!377951 () Unit!22802)

(declare-fun Unit!22804 () Unit!22802)

(assert (=> b!657931 (= e!377951 Unit!22804)))

(declare-fun b!657932 () Bool)

(declare-fun res!426722 () Bool)

(assert (=> b!657932 (= res!426722 (arrayContainsKey!0 lt!307433 (select (arr!18566 a!2986) j!136) j!136))))

(declare-fun e!377953 () Bool)

(assert (=> b!657932 (=> (not res!426722) (not e!377953))))

(declare-fun e!377941 () Bool)

(assert (=> b!657932 (= e!377941 e!377953)))

(declare-fun b!657933 () Bool)

(declare-fun res!426725 () Bool)

(declare-fun e!377947 () Bool)

(assert (=> b!657933 (=> (not res!426725) (not e!377947))))

(assert (=> b!657933 (= res!426725 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657934 () Bool)

(assert (=> b!657934 (= e!377953 (arrayContainsKey!0 lt!307433 (select (arr!18566 a!2986) j!136) index!984))))

(declare-fun b!657935 () Bool)

(declare-fun e!377943 () Bool)

(declare-fun e!377949 () Bool)

(assert (=> b!657935 (= e!377943 e!377949)))

(declare-fun res!426718 () Bool)

(assert (=> b!657935 (=> (not res!426718) (not e!377949))))

(declare-datatypes ((SeekEntryResult!7003 0))(
  ( (MissingZero!7003 (index!30377 (_ BitVec 32))) (Found!7003 (index!30378 (_ BitVec 32))) (Intermediate!7003 (undefined!7815 Bool) (index!30379 (_ BitVec 32)) (x!59177 (_ BitVec 32))) (Undefined!7003) (MissingVacant!7003 (index!30380 (_ BitVec 32))) )
))
(declare-fun lt!307449 () SeekEntryResult!7003)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!657935 (= res!426718 (and (= lt!307449 (Found!7003 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18566 a!2986) index!984) (select (arr!18566 a!2986) j!136))) (not (= (select (arr!18566 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38739 (_ BitVec 32)) SeekEntryResult!7003)

(assert (=> b!657935 (= lt!307449 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18566 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657936 () Bool)

(declare-fun e!377945 () Bool)

(assert (=> b!657936 (= e!377947 e!377945)))

(declare-fun res!426717 () Bool)

(assert (=> b!657936 (=> (not res!426717) (not e!377945))))

(declare-fun lt!307435 () SeekEntryResult!7003)

(assert (=> b!657936 (= res!426717 (or (= lt!307435 (MissingZero!7003 i!1108)) (= lt!307435 (MissingVacant!7003 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38739 (_ BitVec 32)) SeekEntryResult!7003)

(assert (=> b!657936 (= lt!307435 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!657937 () Bool)

(declare-fun res!426729 () Bool)

(assert (=> b!657937 (=> (not res!426729) (not e!377947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657937 (= res!426729 (validKeyInArray!0 k0!1786))))

(declare-fun b!657938 () Bool)

(declare-fun res!426720 () Bool)

(assert (=> b!657938 (=> (not res!426720) (not e!377945))))

(assert (=> b!657938 (= res!426720 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18566 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!426716 () Bool)

(assert (=> start!59570 (=> (not res!426716) (not e!377947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59570 (= res!426716 (validMask!0 mask!3053))))

(assert (=> start!59570 e!377947))

(assert (=> start!59570 true))

(declare-fun array_inv!14449 (array!38739) Bool)

(assert (=> start!59570 (array_inv!14449 a!2986)))

(declare-fun b!657939 () Bool)

(declare-fun res!426719 () Bool)

(assert (=> b!657939 (= res!426719 (bvsge j!136 index!984))))

(assert (=> b!657939 (=> res!426719 e!377941)))

(declare-fun e!377946 () Bool)

(assert (=> b!657939 (= e!377946 e!377941)))

(declare-fun b!657940 () Bool)

(declare-fun e!377942 () Unit!22802)

(declare-fun Unit!22805 () Unit!22802)

(assert (=> b!657940 (= e!377942 Unit!22805)))

(declare-fun b!657941 () Bool)

(declare-fun Unit!22806 () Unit!22802)

(assert (=> b!657941 (= e!377942 Unit!22806)))

(assert (=> b!657941 false))

(declare-fun b!657942 () Bool)

(assert (=> b!657942 (= e!377949 (not true))))

(declare-fun lt!307451 () Unit!22802)

(declare-fun e!377952 () Unit!22802)

(assert (=> b!657942 (= lt!307451 e!377952)))

(declare-fun c!75977 () Bool)

(declare-fun lt!307444 () SeekEntryResult!7003)

(assert (=> b!657942 (= c!75977 (= lt!307444 (Found!7003 index!984)))))

(declare-fun lt!307446 () Unit!22802)

(assert (=> b!657942 (= lt!307446 e!377942)))

(declare-fun c!75978 () Bool)

(assert (=> b!657942 (= c!75978 (= lt!307444 Undefined!7003))))

(declare-fun lt!307450 () (_ BitVec 64))

(assert (=> b!657942 (= lt!307444 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!307450 lt!307433 mask!3053))))

(declare-fun e!377944 () Bool)

(assert (=> b!657942 e!377944))

(declare-fun res!426730 () Bool)

(assert (=> b!657942 (=> (not res!426730) (not e!377944))))

(declare-fun lt!307437 () SeekEntryResult!7003)

(declare-fun lt!307452 () (_ BitVec 32))

(assert (=> b!657942 (= res!426730 (= lt!307437 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307452 vacantSpotIndex!68 lt!307450 lt!307433 mask!3053)))))

(assert (=> b!657942 (= lt!307437 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!307452 vacantSpotIndex!68 (select (arr!18566 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657942 (= lt!307450 (select (store (arr!18566 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!307448 () Unit!22802)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22802)

(assert (=> b!657942 (= lt!307448 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!307452 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657942 (= lt!307452 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657943 () Bool)

(declare-fun Unit!22807 () Unit!22802)

(assert (=> b!657943 (= e!377951 Unit!22807)))

(declare-fun b!657944 () Bool)

(assert (=> b!657944 false))

(declare-fun lt!307441 () Unit!22802)

(assert (=> b!657944 (= lt!307441 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!307433 (select (arr!18566 a!2986) j!136) j!136 Nil!12643))))

(assert (=> b!657944 (arrayNoDuplicates!0 lt!307433 j!136 Nil!12643)))

(declare-fun lt!307439 () Unit!22802)

(assert (=> b!657944 (= lt!307439 (lemmaNoDuplicateFromThenFromBigger!0 lt!307433 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657944 (arrayNoDuplicates!0 lt!307433 #b00000000000000000000000000000000 Nil!12643)))

(declare-fun lt!307436 () Unit!22802)

(assert (=> b!657944 (= lt!307436 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12643))))

(assert (=> b!657944 (arrayContainsKey!0 lt!307433 (select (arr!18566 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!307445 () Unit!22802)

(assert (=> b!657944 (= lt!307445 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!307433 (select (arr!18566 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377948 () Unit!22802)

(declare-fun Unit!22808 () Unit!22802)

(assert (=> b!657944 (= e!377948 Unit!22808)))

(declare-fun b!657945 () Bool)

(declare-fun Unit!22809 () Unit!22802)

(assert (=> b!657945 (= e!377952 Unit!22809)))

(declare-fun b!657946 () Bool)

(declare-fun Unit!22810 () Unit!22802)

(assert (=> b!657946 (= e!377948 Unit!22810)))

(declare-fun b!657947 () Bool)

(declare-fun res!426726 () Bool)

(assert (=> b!657947 (=> (not res!426726) (not e!377945))))

(assert (=> b!657947 (= res!426726 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12643))))

(declare-fun b!657948 () Bool)

(assert (=> b!657948 (= e!377945 e!377943)))

(declare-fun res!426724 () Bool)

(assert (=> b!657948 (=> (not res!426724) (not e!377943))))

(assert (=> b!657948 (= res!426724 (= (select (store (arr!18566 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657948 (= lt!307433 (array!38740 (store (arr!18566 a!2986) i!1108 k0!1786) (size!18931 a!2986)))))

(declare-fun b!657949 () Bool)

(declare-fun Unit!22811 () Unit!22802)

(assert (=> b!657949 (= e!377952 Unit!22811)))

(declare-fun res!426723 () Bool)

(assert (=> b!657949 (= res!426723 (= (select (store (arr!18566 a!2986) i!1108 k0!1786) index!984) (select (arr!18566 a!2986) j!136)))))

(assert (=> b!657949 (=> (not res!426723) (not e!377946))))

(assert (=> b!657949 e!377946))

(declare-fun c!75976 () Bool)

(assert (=> b!657949 (= c!75976 (bvslt j!136 index!984))))

(declare-fun lt!307440 () Unit!22802)

(assert (=> b!657949 (= lt!307440 e!377948)))

(declare-fun c!75975 () Bool)

(assert (=> b!657949 (= c!75975 (bvslt index!984 j!136))))

(declare-fun lt!307447 () Unit!22802)

(assert (=> b!657949 (= lt!307447 e!377951)))

(assert (=> b!657949 false))

(declare-fun b!657950 () Bool)

(assert (=> b!657950 (= e!377954 (arrayContainsKey!0 lt!307433 (select (arr!18566 a!2986) j!136) index!984))))

(declare-fun b!657951 () Bool)

(declare-fun res!426721 () Bool)

(assert (=> b!657951 (=> (not res!426721) (not e!377947))))

(assert (=> b!657951 (= res!426721 (and (= (size!18931 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18931 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18931 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657952 () Bool)

(declare-fun res!426728 () Bool)

(assert (=> b!657952 (=> (not res!426728) (not e!377945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38739 (_ BitVec 32)) Bool)

(assert (=> b!657952 (= res!426728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657953 () Bool)

(declare-fun res!426727 () Bool)

(assert (=> b!657953 (=> (not res!426727) (not e!377947))))

(assert (=> b!657953 (= res!426727 (validKeyInArray!0 (select (arr!18566 a!2986) j!136)))))

(declare-fun b!657954 () Bool)

(assert (=> b!657954 (= e!377944 (= lt!307449 lt!307437))))

(assert (= (and start!59570 res!426716) b!657951))

(assert (= (and b!657951 res!426721) b!657953))

(assert (= (and b!657953 res!426727) b!657937))

(assert (= (and b!657937 res!426729) b!657933))

(assert (= (and b!657933 res!426725) b!657936))

(assert (= (and b!657936 res!426717) b!657952))

(assert (= (and b!657952 res!426728) b!657947))

(assert (= (and b!657947 res!426726) b!657938))

(assert (= (and b!657938 res!426720) b!657948))

(assert (= (and b!657948 res!426724) b!657935))

(assert (= (and b!657935 res!426718) b!657942))

(assert (= (and b!657942 res!426730) b!657954))

(assert (= (and b!657942 c!75978) b!657941))

(assert (= (and b!657942 (not c!75978)) b!657940))

(assert (= (and b!657942 c!75977) b!657949))

(assert (= (and b!657942 (not c!75977)) b!657945))

(assert (= (and b!657949 res!426723) b!657939))

(assert (= (and b!657939 (not res!426719)) b!657932))

(assert (= (and b!657932 res!426722) b!657934))

(assert (= (and b!657949 c!75976) b!657944))

(assert (= (and b!657949 (not c!75976)) b!657946))

(assert (= (and b!657949 c!75975) b!657931))

(assert (= (and b!657949 (not c!75975)) b!657943))

(assert (= (and b!657931 res!426715) b!657950))

(declare-fun m!630435 () Bool)

(assert (=> b!657952 m!630435))

(declare-fun m!630437 () Bool)

(assert (=> b!657948 m!630437))

(declare-fun m!630439 () Bool)

(assert (=> b!657948 m!630439))

(declare-fun m!630441 () Bool)

(assert (=> b!657944 m!630441))

(declare-fun m!630443 () Bool)

(assert (=> b!657944 m!630443))

(declare-fun m!630445 () Bool)

(assert (=> b!657944 m!630445))

(declare-fun m!630447 () Bool)

(assert (=> b!657944 m!630447))

(assert (=> b!657944 m!630443))

(declare-fun m!630449 () Bool)

(assert (=> b!657944 m!630449))

(declare-fun m!630451 () Bool)

(assert (=> b!657944 m!630451))

(assert (=> b!657944 m!630443))

(declare-fun m!630453 () Bool)

(assert (=> b!657944 m!630453))

(assert (=> b!657944 m!630443))

(declare-fun m!630455 () Bool)

(assert (=> b!657944 m!630455))

(declare-fun m!630457 () Bool)

(assert (=> b!657942 m!630457))

(declare-fun m!630459 () Bool)

(assert (=> b!657942 m!630459))

(declare-fun m!630461 () Bool)

(assert (=> b!657942 m!630461))

(assert (=> b!657942 m!630443))

(declare-fun m!630463 () Bool)

(assert (=> b!657942 m!630463))

(assert (=> b!657942 m!630443))

(declare-fun m!630465 () Bool)

(assert (=> b!657942 m!630465))

(declare-fun m!630467 () Bool)

(assert (=> b!657942 m!630467))

(assert (=> b!657942 m!630437))

(assert (=> b!657950 m!630443))

(assert (=> b!657950 m!630443))

(declare-fun m!630469 () Bool)

(assert (=> b!657950 m!630469))

(declare-fun m!630471 () Bool)

(assert (=> b!657936 m!630471))

(declare-fun m!630473 () Bool)

(assert (=> b!657937 m!630473))

(declare-fun m!630475 () Bool)

(assert (=> b!657933 m!630475))

(assert (=> b!657949 m!630437))

(declare-fun m!630477 () Bool)

(assert (=> b!657949 m!630477))

(assert (=> b!657949 m!630443))

(declare-fun m!630479 () Bool)

(assert (=> b!657947 m!630479))

(declare-fun m!630481 () Bool)

(assert (=> b!657938 m!630481))

(assert (=> b!657934 m!630443))

(assert (=> b!657934 m!630443))

(assert (=> b!657934 m!630469))

(assert (=> b!657953 m!630443))

(assert (=> b!657953 m!630443))

(declare-fun m!630483 () Bool)

(assert (=> b!657953 m!630483))

(declare-fun m!630485 () Bool)

(assert (=> start!59570 m!630485))

(declare-fun m!630487 () Bool)

(assert (=> start!59570 m!630487))

(assert (=> b!657932 m!630443))

(assert (=> b!657932 m!630443))

(declare-fun m!630489 () Bool)

(assert (=> b!657932 m!630489))

(assert (=> b!657931 m!630443))

(declare-fun m!630491 () Bool)

(assert (=> b!657931 m!630491))

(assert (=> b!657931 m!630443))

(assert (=> b!657931 m!630447))

(assert (=> b!657931 m!630443))

(declare-fun m!630493 () Bool)

(assert (=> b!657931 m!630493))

(assert (=> b!657931 m!630443))

(assert (=> b!657931 m!630489))

(assert (=> b!657931 m!630443))

(declare-fun m!630495 () Bool)

(assert (=> b!657931 m!630495))

(declare-fun m!630497 () Bool)

(assert (=> b!657931 m!630497))

(declare-fun m!630499 () Bool)

(assert (=> b!657931 m!630499))

(assert (=> b!657931 m!630451))

(declare-fun m!630501 () Bool)

(assert (=> b!657935 m!630501))

(assert (=> b!657935 m!630443))

(assert (=> b!657935 m!630443))

(declare-fun m!630503 () Bool)

(assert (=> b!657935 m!630503))

(check-sat (not b!657944) (not b!657934) (not b!657947) (not b!657950) (not b!657931) (not b!657953) (not b!657937) (not b!657936) (not b!657933) (not b!657952) (not b!657932) (not b!657942) (not start!59570) (not b!657935))
(check-sat)
