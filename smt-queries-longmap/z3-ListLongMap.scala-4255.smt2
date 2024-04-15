; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58988 () Bool)

(assert start!58988)

(declare-fun b!650891 () Bool)

(declare-fun e!373462 () Bool)

(declare-fun e!373465 () Bool)

(assert (=> b!650891 (= e!373462 e!373465)))

(declare-fun res!422109 () Bool)

(assert (=> b!650891 (=> (not res!422109) (not e!373465))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38580 0))(
  ( (array!38581 (arr!18494 (Array (_ BitVec 32) (_ BitVec 64))) (size!18859 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38580)

(assert (=> b!650891 (= res!422109 (= (select (store (arr!18494 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!302495 () array!38580)

(assert (=> b!650891 (= lt!302495 (array!38581 (store (arr!18494 a!2986) i!1108 k0!1786) (size!18859 a!2986)))))

(declare-fun b!650892 () Bool)

(declare-fun e!373464 () Bool)

(declare-fun e!373461 () Bool)

(assert (=> b!650892 (= e!373464 e!373461)))

(declare-fun res!422111 () Bool)

(assert (=> b!650892 (=> res!422111 e!373461)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!650892 (= res!422111 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22214 0))(
  ( (Unit!22215) )
))
(declare-fun lt!302509 () Unit!22214)

(declare-fun e!373456 () Unit!22214)

(assert (=> b!650892 (= lt!302509 e!373456)))

(declare-fun c!74766 () Bool)

(assert (=> b!650892 (= c!74766 (bvslt j!136 index!984))))

(declare-fun b!650893 () Bool)

(declare-fun e!373457 () Bool)

(declare-fun e!373466 () Bool)

(assert (=> b!650893 (= e!373457 e!373466)))

(declare-fun res!422104 () Bool)

(assert (=> b!650893 (=> res!422104 e!373466)))

(declare-fun lt!302494 () (_ BitVec 64))

(declare-fun lt!302511 () (_ BitVec 64))

(assert (=> b!650893 (= res!422104 (or (not (= (select (arr!18494 a!2986) j!136) lt!302494)) (not (= (select (arr!18494 a!2986) j!136) lt!302511)) (bvsge j!136 index!984)))))

(declare-fun b!650894 () Bool)

(declare-fun e!373463 () Bool)

(declare-datatypes ((SeekEntryResult!6931 0))(
  ( (MissingZero!6931 (index!30074 (_ BitVec 32))) (Found!6931 (index!30075 (_ BitVec 32))) (Intermediate!6931 (undefined!7743 Bool) (index!30076 (_ BitVec 32)) (x!58868 (_ BitVec 32))) (Undefined!6931) (MissingVacant!6931 (index!30077 (_ BitVec 32))) )
))
(declare-fun lt!302508 () SeekEntryResult!6931)

(declare-fun lt!302510 () SeekEntryResult!6931)

(assert (=> b!650894 (= e!373463 (= lt!302508 lt!302510))))

(declare-fun b!650895 () Bool)

(declare-fun res!422108 () Bool)

(declare-fun e!373452 () Bool)

(assert (=> b!650895 (=> (not res!422108) (not e!373452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650895 (= res!422108 (validKeyInArray!0 k0!1786))))

(declare-fun b!650896 () Bool)

(declare-fun res!422095 () Bool)

(assert (=> b!650896 (=> (not res!422095) (not e!373462))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!650896 (= res!422095 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18494 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!650897 () Bool)

(declare-fun res!422112 () Bool)

(assert (=> b!650897 (=> (not res!422112) (not e!373462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38580 (_ BitVec 32)) Bool)

(assert (=> b!650897 (= res!422112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!422098 () Bool)

(assert (=> start!58988 (=> (not res!422098) (not e!373452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58988 (= res!422098 (validMask!0 mask!3053))))

(assert (=> start!58988 e!373452))

(assert (=> start!58988 true))

(declare-fun array_inv!14377 (array!38580) Bool)

(assert (=> start!58988 (array_inv!14377 a!2986)))

(declare-fun b!650898 () Bool)

(declare-fun e!373455 () Bool)

(assert (=> b!650898 (= e!373466 e!373455)))

(declare-fun res!422100 () Bool)

(assert (=> b!650898 (=> (not res!422100) (not e!373455))))

(declare-fun arrayContainsKey!0 (array!38580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650898 (= res!422100 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136))))

(declare-fun b!650899 () Bool)

(declare-fun e!373454 () Unit!22214)

(declare-fun Unit!22216 () Unit!22214)

(assert (=> b!650899 (= e!373454 Unit!22216)))

(declare-fun b!650900 () Bool)

(declare-fun e!373459 () Bool)

(declare-fun e!373460 () Bool)

(assert (=> b!650900 (= e!373459 (not e!373460))))

(declare-fun res!422106 () Bool)

(assert (=> b!650900 (=> res!422106 e!373460)))

(declare-fun lt!302500 () SeekEntryResult!6931)

(assert (=> b!650900 (= res!422106 (not (= lt!302500 (Found!6931 index!984))))))

(declare-fun lt!302496 () Unit!22214)

(assert (=> b!650900 (= lt!302496 e!373454)))

(declare-fun c!74765 () Bool)

(assert (=> b!650900 (= c!74765 (= lt!302500 Undefined!6931))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38580 (_ BitVec 32)) SeekEntryResult!6931)

(assert (=> b!650900 (= lt!302500 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302494 lt!302495 mask!3053))))

(assert (=> b!650900 e!373463))

(declare-fun res!422110 () Bool)

(assert (=> b!650900 (=> (not res!422110) (not e!373463))))

(declare-fun lt!302499 () (_ BitVec 32))

(assert (=> b!650900 (= res!422110 (= lt!302510 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 lt!302494 lt!302495 mask!3053)))))

(assert (=> b!650900 (= lt!302510 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650900 (= lt!302494 (select (store (arr!18494 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302506 () Unit!22214)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22214)

(assert (=> b!650900 (= lt!302506 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650900 (= lt!302499 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650901 () Bool)

(declare-fun res!422103 () Bool)

(assert (=> b!650901 (=> (not res!422103) (not e!373452))))

(assert (=> b!650901 (= res!422103 (validKeyInArray!0 (select (arr!18494 a!2986) j!136)))))

(declare-fun b!650902 () Bool)

(assert (=> b!650902 (= e!373461 (bvslt (size!18859 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12574 0))(
  ( (Nil!12571) (Cons!12570 (h!13615 (_ BitVec 64)) (t!18793 List!12574)) )
))
(declare-fun arrayNoDuplicates!0 (array!38580 (_ BitVec 32) List!12574) Bool)

(assert (=> b!650902 (arrayNoDuplicates!0 lt!302495 index!984 Nil!12571)))

(declare-fun lt!302505 () Unit!22214)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38580 (_ BitVec 32) (_ BitVec 32)) Unit!22214)

(assert (=> b!650902 (= lt!302505 (lemmaNoDuplicateFromThenFromBigger!0 lt!302495 #b00000000000000000000000000000000 index!984))))

(assert (=> b!650902 (arrayNoDuplicates!0 lt!302495 #b00000000000000000000000000000000 Nil!12571)))

(declare-fun lt!302507 () Unit!22214)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12574) Unit!22214)

(assert (=> b!650902 (= lt!302507 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12571))))

(assert (=> b!650902 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302498 () Unit!22214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22214)

(assert (=> b!650902 (= lt!302498 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!373453 () Bool)

(assert (=> b!650902 e!373453))

(declare-fun res!422101 () Bool)

(assert (=> b!650902 (=> (not res!422101) (not e!373453))))

(assert (=> b!650902 (= res!422101 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136))))

(declare-fun b!650903 () Bool)

(assert (=> b!650903 (= e!373460 e!373464)))

(declare-fun res!422096 () Bool)

(assert (=> b!650903 (=> res!422096 e!373464)))

(assert (=> b!650903 (= res!422096 (or (not (= (select (arr!18494 a!2986) j!136) lt!302494)) (not (= (select (arr!18494 a!2986) j!136) lt!302511))))))

(assert (=> b!650903 e!373457))

(declare-fun res!422107 () Bool)

(assert (=> b!650903 (=> (not res!422107) (not e!373457))))

(assert (=> b!650903 (= res!422107 (= lt!302511 (select (arr!18494 a!2986) j!136)))))

(assert (=> b!650903 (= lt!302511 (select (store (arr!18494 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650904 () Bool)

(declare-fun Unit!22217 () Unit!22214)

(assert (=> b!650904 (= e!373456 Unit!22217)))

(declare-fun lt!302501 () Unit!22214)

(assert (=> b!650904 (= lt!302501 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302495 (select (arr!18494 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650904 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302503 () Unit!22214)

(assert (=> b!650904 (= lt!302503 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12571))))

(assert (=> b!650904 (arrayNoDuplicates!0 lt!302495 #b00000000000000000000000000000000 Nil!12571)))

(declare-fun lt!302502 () Unit!22214)

(assert (=> b!650904 (= lt!302502 (lemmaNoDuplicateFromThenFromBigger!0 lt!302495 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650904 (arrayNoDuplicates!0 lt!302495 j!136 Nil!12571)))

(declare-fun lt!302497 () Unit!22214)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38580 (_ BitVec 64) (_ BitVec 32) List!12574) Unit!22214)

(assert (=> b!650904 (= lt!302497 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136 Nil!12571))))

(assert (=> b!650904 false))

(declare-fun b!650905 () Bool)

(assert (=> b!650905 (= e!373452 e!373462)))

(declare-fun res!422105 () Bool)

(assert (=> b!650905 (=> (not res!422105) (not e!373462))))

(declare-fun lt!302504 () SeekEntryResult!6931)

(assert (=> b!650905 (= res!422105 (or (= lt!302504 (MissingZero!6931 i!1108)) (= lt!302504 (MissingVacant!6931 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38580 (_ BitVec 32)) SeekEntryResult!6931)

(assert (=> b!650905 (= lt!302504 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650906 () Bool)

(assert (=> b!650906 (= e!373453 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) index!984))))

(declare-fun b!650907 () Bool)

(declare-fun res!422102 () Bool)

(assert (=> b!650907 (=> (not res!422102) (not e!373452))))

(assert (=> b!650907 (= res!422102 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650908 () Bool)

(declare-fun Unit!22218 () Unit!22214)

(assert (=> b!650908 (= e!373454 Unit!22218)))

(assert (=> b!650908 false))

(declare-fun b!650909 () Bool)

(declare-fun res!422113 () Bool)

(assert (=> b!650909 (=> (not res!422113) (not e!373452))))

(assert (=> b!650909 (= res!422113 (and (= (size!18859 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18859 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650910 () Bool)

(declare-fun res!422099 () Bool)

(assert (=> b!650910 (=> (not res!422099) (not e!373462))))

(assert (=> b!650910 (= res!422099 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12571))))

(declare-fun b!650911 () Bool)

(assert (=> b!650911 (= e!373455 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) index!984))))

(declare-fun b!650912 () Bool)

(assert (=> b!650912 (= e!373465 e!373459)))

(declare-fun res!422097 () Bool)

(assert (=> b!650912 (=> (not res!422097) (not e!373459))))

(assert (=> b!650912 (= res!422097 (and (= lt!302508 (Found!6931 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18494 a!2986) index!984) (select (arr!18494 a!2986) j!136))) (not (= (select (arr!18494 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!650912 (= lt!302508 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650913 () Bool)

(declare-fun Unit!22219 () Unit!22214)

(assert (=> b!650913 (= e!373456 Unit!22219)))

(assert (= (and start!58988 res!422098) b!650909))

(assert (= (and b!650909 res!422113) b!650901))

(assert (= (and b!650901 res!422103) b!650895))

(assert (= (and b!650895 res!422108) b!650907))

(assert (= (and b!650907 res!422102) b!650905))

(assert (= (and b!650905 res!422105) b!650897))

(assert (= (and b!650897 res!422112) b!650910))

(assert (= (and b!650910 res!422099) b!650896))

(assert (= (and b!650896 res!422095) b!650891))

(assert (= (and b!650891 res!422109) b!650912))

(assert (= (and b!650912 res!422097) b!650900))

(assert (= (and b!650900 res!422110) b!650894))

(assert (= (and b!650900 c!74765) b!650908))

(assert (= (and b!650900 (not c!74765)) b!650899))

(assert (= (and b!650900 (not res!422106)) b!650903))

(assert (= (and b!650903 res!422107) b!650893))

(assert (= (and b!650893 (not res!422104)) b!650898))

(assert (= (and b!650898 res!422100) b!650911))

(assert (= (and b!650903 (not res!422096)) b!650892))

(assert (= (and b!650892 c!74766) b!650904))

(assert (= (and b!650892 (not c!74766)) b!650913))

(assert (= (and b!650892 (not res!422111)) b!650902))

(assert (= (and b!650902 res!422101) b!650906))

(declare-fun m!623553 () Bool)

(assert (=> b!650902 m!623553))

(declare-fun m!623555 () Bool)

(assert (=> b!650902 m!623555))

(assert (=> b!650902 m!623553))

(assert (=> b!650902 m!623553))

(declare-fun m!623557 () Bool)

(assert (=> b!650902 m!623557))

(declare-fun m!623559 () Bool)

(assert (=> b!650902 m!623559))

(declare-fun m!623561 () Bool)

(assert (=> b!650902 m!623561))

(assert (=> b!650902 m!623553))

(declare-fun m!623563 () Bool)

(assert (=> b!650902 m!623563))

(declare-fun m!623565 () Bool)

(assert (=> b!650902 m!623565))

(declare-fun m!623567 () Bool)

(assert (=> b!650902 m!623567))

(declare-fun m!623569 () Bool)

(assert (=> b!650900 m!623569))

(declare-fun m!623571 () Bool)

(assert (=> b!650900 m!623571))

(assert (=> b!650900 m!623553))

(declare-fun m!623573 () Bool)

(assert (=> b!650900 m!623573))

(declare-fun m!623575 () Bool)

(assert (=> b!650900 m!623575))

(declare-fun m!623577 () Bool)

(assert (=> b!650900 m!623577))

(declare-fun m!623579 () Bool)

(assert (=> b!650900 m!623579))

(assert (=> b!650900 m!623553))

(declare-fun m!623581 () Bool)

(assert (=> b!650900 m!623581))

(assert (=> b!650891 m!623575))

(declare-fun m!623583 () Bool)

(assert (=> b!650891 m!623583))

(assert (=> b!650898 m!623553))

(assert (=> b!650898 m!623553))

(assert (=> b!650898 m!623557))

(declare-fun m!623585 () Bool)

(assert (=> start!58988 m!623585))

(declare-fun m!623587 () Bool)

(assert (=> start!58988 m!623587))

(assert (=> b!650903 m!623553))

(assert (=> b!650903 m!623575))

(declare-fun m!623589 () Bool)

(assert (=> b!650903 m!623589))

(declare-fun m!623591 () Bool)

(assert (=> b!650895 m!623591))

(declare-fun m!623593 () Bool)

(assert (=> b!650907 m!623593))

(assert (=> b!650911 m!623553))

(assert (=> b!650911 m!623553))

(declare-fun m!623595 () Bool)

(assert (=> b!650911 m!623595))

(assert (=> b!650906 m!623553))

(assert (=> b!650906 m!623553))

(assert (=> b!650906 m!623595))

(assert (=> b!650893 m!623553))

(declare-fun m!623597 () Bool)

(assert (=> b!650896 m!623597))

(declare-fun m!623599 () Bool)

(assert (=> b!650905 m!623599))

(declare-fun m!623601 () Bool)

(assert (=> b!650897 m!623601))

(declare-fun m!623603 () Bool)

(assert (=> b!650912 m!623603))

(assert (=> b!650912 m!623553))

(assert (=> b!650912 m!623553))

(declare-fun m!623605 () Bool)

(assert (=> b!650912 m!623605))

(declare-fun m!623607 () Bool)

(assert (=> b!650910 m!623607))

(declare-fun m!623609 () Bool)

(assert (=> b!650904 m!623609))

(assert (=> b!650904 m!623553))

(declare-fun m!623611 () Bool)

(assert (=> b!650904 m!623611))

(assert (=> b!650904 m!623553))

(assert (=> b!650904 m!623553))

(declare-fun m!623613 () Bool)

(assert (=> b!650904 m!623613))

(assert (=> b!650904 m!623567))

(assert (=> b!650904 m!623553))

(declare-fun m!623615 () Bool)

(assert (=> b!650904 m!623615))

(declare-fun m!623617 () Bool)

(assert (=> b!650904 m!623617))

(assert (=> b!650904 m!623565))

(assert (=> b!650901 m!623553))

(assert (=> b!650901 m!623553))

(declare-fun m!623619 () Bool)

(assert (=> b!650901 m!623619))

(check-sat (not b!650907) (not b!650901) (not b!650906) (not b!650897) (not b!650912) (not start!58988) (not b!650910) (not b!650904) (not b!650905) (not b!650902) (not b!650898) (not b!650911) (not b!650895) (not b!650900))
(check-sat)
(get-model)

(declare-fun d!91833 () Bool)

(declare-fun res!422232 () Bool)

(declare-fun e!373561 () Bool)

(assert (=> d!91833 (=> res!422232 e!373561)))

(assert (=> d!91833 (= res!422232 (= (select (arr!18494 lt!302495) index!984) (select (arr!18494 a!2986) j!136)))))

(assert (=> d!91833 (= (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) index!984) e!373561)))

(declare-fun b!651056 () Bool)

(declare-fun e!373562 () Bool)

(assert (=> b!651056 (= e!373561 e!373562)))

(declare-fun res!422233 () Bool)

(assert (=> b!651056 (=> (not res!422233) (not e!373562))))

(assert (=> b!651056 (= res!422233 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18859 lt!302495)))))

(declare-fun b!651057 () Bool)

(assert (=> b!651057 (= e!373562 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91833 (not res!422232)) b!651056))

(assert (= (and b!651056 res!422233) b!651057))

(declare-fun m!623757 () Bool)

(assert (=> d!91833 m!623757))

(assert (=> b!651057 m!623553))

(declare-fun m!623759 () Bool)

(assert (=> b!651057 m!623759))

(assert (=> b!650906 d!91833))

(declare-fun d!91835 () Bool)

(assert (=> d!91835 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58988 d!91835))

(declare-fun d!91837 () Bool)

(assert (=> d!91837 (= (array_inv!14377 a!2986) (bvsge (size!18859 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58988 d!91837))

(declare-fun d!91839 () Bool)

(assert (=> d!91839 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!650895 d!91839))

(declare-fun b!651070 () Bool)

(declare-fun e!373569 () SeekEntryResult!6931)

(declare-fun e!373570 () SeekEntryResult!6931)

(assert (=> b!651070 (= e!373569 e!373570)))

(declare-fun lt!302627 () (_ BitVec 64))

(declare-fun lt!302628 () SeekEntryResult!6931)

(assert (=> b!651070 (= lt!302627 (select (arr!18494 a!2986) (index!30076 lt!302628)))))

(declare-fun c!74786 () Bool)

(assert (=> b!651070 (= c!74786 (= lt!302627 k0!1786))))

(declare-fun b!651071 () Bool)

(assert (=> b!651071 (= e!373570 (Found!6931 (index!30076 lt!302628)))))

(declare-fun b!651072 () Bool)

(assert (=> b!651072 (= e!373569 Undefined!6931)))

(declare-fun b!651073 () Bool)

(declare-fun e!373571 () SeekEntryResult!6931)

(assert (=> b!651073 (= e!373571 (MissingZero!6931 (index!30076 lt!302628)))))

(declare-fun b!651075 () Bool)

(declare-fun c!74785 () Bool)

(assert (=> b!651075 (= c!74785 (= lt!302627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651075 (= e!373570 e!373571)))

(declare-fun b!651074 () Bool)

(assert (=> b!651074 (= e!373571 (seekKeyOrZeroReturnVacant!0 (x!58868 lt!302628) (index!30076 lt!302628) (index!30076 lt!302628) k0!1786 a!2986 mask!3053))))

(declare-fun d!91841 () Bool)

(declare-fun lt!302626 () SeekEntryResult!6931)

(get-info :version)

(assert (=> d!91841 (and (or ((_ is Undefined!6931) lt!302626) (not ((_ is Found!6931) lt!302626)) (and (bvsge (index!30075 lt!302626) #b00000000000000000000000000000000) (bvslt (index!30075 lt!302626) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302626) ((_ is Found!6931) lt!302626) (not ((_ is MissingZero!6931) lt!302626)) (and (bvsge (index!30074 lt!302626) #b00000000000000000000000000000000) (bvslt (index!30074 lt!302626) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302626) ((_ is Found!6931) lt!302626) ((_ is MissingZero!6931) lt!302626) (not ((_ is MissingVacant!6931) lt!302626)) (and (bvsge (index!30077 lt!302626) #b00000000000000000000000000000000) (bvslt (index!30077 lt!302626) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302626) (ite ((_ is Found!6931) lt!302626) (= (select (arr!18494 a!2986) (index!30075 lt!302626)) k0!1786) (ite ((_ is MissingZero!6931) lt!302626) (= (select (arr!18494 a!2986) (index!30074 lt!302626)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6931) lt!302626) (= (select (arr!18494 a!2986) (index!30077 lt!302626)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91841 (= lt!302626 e!373569)))

(declare-fun c!74787 () Bool)

(assert (=> d!91841 (= c!74787 (and ((_ is Intermediate!6931) lt!302628) (undefined!7743 lt!302628)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38580 (_ BitVec 32)) SeekEntryResult!6931)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91841 (= lt!302628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91841 (validMask!0 mask!3053)))

(assert (=> d!91841 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!302626)))

(assert (= (and d!91841 c!74787) b!651072))

(assert (= (and d!91841 (not c!74787)) b!651070))

(assert (= (and b!651070 c!74786) b!651071))

(assert (= (and b!651070 (not c!74786)) b!651075))

(assert (= (and b!651075 c!74785) b!651073))

(assert (= (and b!651075 (not c!74785)) b!651074))

(declare-fun m!623761 () Bool)

(assert (=> b!651070 m!623761))

(declare-fun m!623763 () Bool)

(assert (=> b!651074 m!623763))

(declare-fun m!623765 () Bool)

(assert (=> d!91841 m!623765))

(declare-fun m!623767 () Bool)

(assert (=> d!91841 m!623767))

(assert (=> d!91841 m!623585))

(assert (=> d!91841 m!623765))

(declare-fun m!623769 () Bool)

(assert (=> d!91841 m!623769))

(declare-fun m!623771 () Bool)

(assert (=> d!91841 m!623771))

(declare-fun m!623773 () Bool)

(assert (=> d!91841 m!623773))

(assert (=> b!650905 d!91841))

(declare-fun d!91843 () Bool)

(assert (=> d!91843 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302631 () Unit!22214)

(declare-fun choose!114 (array!38580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22214)

(assert (=> d!91843 (= lt!302631 (choose!114 lt!302495 (select (arr!18494 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91843 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91843 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302495 (select (arr!18494 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!302631)))

(declare-fun bs!19389 () Bool)

(assert (= bs!19389 d!91843))

(assert (=> bs!19389 m!623553))

(assert (=> bs!19389 m!623611))

(assert (=> bs!19389 m!623553))

(declare-fun m!623775 () Bool)

(assert (=> bs!19389 m!623775))

(assert (=> b!650904 d!91843))

(declare-fun d!91845 () Bool)

(assert (=> d!91845 (arrayNoDuplicates!0 lt!302495 j!136 Nil!12571)))

(declare-fun lt!302634 () Unit!22214)

(declare-fun choose!39 (array!38580 (_ BitVec 32) (_ BitVec 32)) Unit!22214)

(assert (=> d!91845 (= lt!302634 (choose!39 lt!302495 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91845 (bvslt (size!18859 lt!302495) #b01111111111111111111111111111111)))

(assert (=> d!91845 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302495 #b00000000000000000000000000000000 j!136) lt!302634)))

(declare-fun bs!19390 () Bool)

(assert (= bs!19390 d!91845))

(assert (=> bs!19390 m!623617))

(declare-fun m!623777 () Bool)

(assert (=> bs!19390 m!623777))

(assert (=> b!650904 d!91845))

(declare-fun d!91847 () Bool)

(declare-fun res!422242 () Bool)

(declare-fun e!373583 () Bool)

(assert (=> d!91847 (=> res!422242 e!373583)))

(assert (=> d!91847 (= res!422242 (bvsge #b00000000000000000000000000000000 (size!18859 lt!302495)))))

(assert (=> d!91847 (= (arrayNoDuplicates!0 lt!302495 #b00000000000000000000000000000000 Nil!12571) e!373583)))

(declare-fun b!651086 () Bool)

(declare-fun e!373580 () Bool)

(declare-fun contains!3160 (List!12574 (_ BitVec 64)) Bool)

(assert (=> b!651086 (= e!373580 (contains!3160 Nil!12571 (select (arr!18494 lt!302495) #b00000000000000000000000000000000)))))

(declare-fun bm!33724 () Bool)

(declare-fun call!33727 () Bool)

(declare-fun c!74790 () Bool)

(assert (=> bm!33724 (= call!33727 (arrayNoDuplicates!0 lt!302495 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74790 (Cons!12570 (select (arr!18494 lt!302495) #b00000000000000000000000000000000) Nil!12571) Nil!12571)))))

(declare-fun b!651087 () Bool)

(declare-fun e!373581 () Bool)

(assert (=> b!651087 (= e!373581 call!33727)))

(declare-fun b!651088 () Bool)

(declare-fun e!373582 () Bool)

(assert (=> b!651088 (= e!373582 e!373581)))

(assert (=> b!651088 (= c!74790 (validKeyInArray!0 (select (arr!18494 lt!302495) #b00000000000000000000000000000000)))))

(declare-fun b!651089 () Bool)

(assert (=> b!651089 (= e!373583 e!373582)))

(declare-fun res!422240 () Bool)

(assert (=> b!651089 (=> (not res!422240) (not e!373582))))

(assert (=> b!651089 (= res!422240 (not e!373580))))

(declare-fun res!422241 () Bool)

(assert (=> b!651089 (=> (not res!422241) (not e!373580))))

(assert (=> b!651089 (= res!422241 (validKeyInArray!0 (select (arr!18494 lt!302495) #b00000000000000000000000000000000)))))

(declare-fun b!651090 () Bool)

(assert (=> b!651090 (= e!373581 call!33727)))

(assert (= (and d!91847 (not res!422242)) b!651089))

(assert (= (and b!651089 res!422241) b!651086))

(assert (= (and b!651089 res!422240) b!651088))

(assert (= (and b!651088 c!74790) b!651090))

(assert (= (and b!651088 (not c!74790)) b!651087))

(assert (= (or b!651090 b!651087) bm!33724))

(declare-fun m!623779 () Bool)

(assert (=> b!651086 m!623779))

(assert (=> b!651086 m!623779))

(declare-fun m!623781 () Bool)

(assert (=> b!651086 m!623781))

(assert (=> bm!33724 m!623779))

(declare-fun m!623783 () Bool)

(assert (=> bm!33724 m!623783))

(assert (=> b!651088 m!623779))

(assert (=> b!651088 m!623779))

(declare-fun m!623785 () Bool)

(assert (=> b!651088 m!623785))

(assert (=> b!651089 m!623779))

(assert (=> b!651089 m!623779))

(assert (=> b!651089 m!623785))

(assert (=> b!650904 d!91847))

(declare-fun d!91849 () Bool)

(declare-fun res!422245 () Bool)

(declare-fun e!373587 () Bool)

(assert (=> d!91849 (=> res!422245 e!373587)))

(assert (=> d!91849 (= res!422245 (bvsge j!136 (size!18859 lt!302495)))))

(assert (=> d!91849 (= (arrayNoDuplicates!0 lt!302495 j!136 Nil!12571) e!373587)))

(declare-fun b!651091 () Bool)

(declare-fun e!373584 () Bool)

(assert (=> b!651091 (= e!373584 (contains!3160 Nil!12571 (select (arr!18494 lt!302495) j!136)))))

(declare-fun call!33728 () Bool)

(declare-fun c!74791 () Bool)

(declare-fun bm!33725 () Bool)

(assert (=> bm!33725 (= call!33728 (arrayNoDuplicates!0 lt!302495 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74791 (Cons!12570 (select (arr!18494 lt!302495) j!136) Nil!12571) Nil!12571)))))

(declare-fun b!651092 () Bool)

(declare-fun e!373585 () Bool)

(assert (=> b!651092 (= e!373585 call!33728)))

(declare-fun b!651093 () Bool)

(declare-fun e!373586 () Bool)

(assert (=> b!651093 (= e!373586 e!373585)))

(assert (=> b!651093 (= c!74791 (validKeyInArray!0 (select (arr!18494 lt!302495) j!136)))))

(declare-fun b!651094 () Bool)

(assert (=> b!651094 (= e!373587 e!373586)))

(declare-fun res!422243 () Bool)

(assert (=> b!651094 (=> (not res!422243) (not e!373586))))

(assert (=> b!651094 (= res!422243 (not e!373584))))

(declare-fun res!422244 () Bool)

(assert (=> b!651094 (=> (not res!422244) (not e!373584))))

(assert (=> b!651094 (= res!422244 (validKeyInArray!0 (select (arr!18494 lt!302495) j!136)))))

(declare-fun b!651095 () Bool)

(assert (=> b!651095 (= e!373585 call!33728)))

(assert (= (and d!91849 (not res!422245)) b!651094))

(assert (= (and b!651094 res!422244) b!651091))

(assert (= (and b!651094 res!422243) b!651093))

(assert (= (and b!651093 c!74791) b!651095))

(assert (= (and b!651093 (not c!74791)) b!651092))

(assert (= (or b!651095 b!651092) bm!33725))

(declare-fun m!623787 () Bool)

(assert (=> b!651091 m!623787))

(assert (=> b!651091 m!623787))

(declare-fun m!623789 () Bool)

(assert (=> b!651091 m!623789))

(assert (=> bm!33725 m!623787))

(declare-fun m!623791 () Bool)

(assert (=> bm!33725 m!623791))

(assert (=> b!651093 m!623787))

(assert (=> b!651093 m!623787))

(declare-fun m!623793 () Bool)

(assert (=> b!651093 m!623793))

(assert (=> b!651094 m!623787))

(assert (=> b!651094 m!623787))

(assert (=> b!651094 m!623793))

(assert (=> b!650904 d!91849))

(declare-fun d!91851 () Bool)

(declare-fun res!422246 () Bool)

(declare-fun e!373588 () Bool)

(assert (=> d!91851 (=> res!422246 e!373588)))

(assert (=> d!91851 (= res!422246 (= (select (arr!18494 lt!302495) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18494 a!2986) j!136)))))

(assert (=> d!91851 (= (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!373588)))

(declare-fun b!651096 () Bool)

(declare-fun e!373589 () Bool)

(assert (=> b!651096 (= e!373588 e!373589)))

(declare-fun res!422247 () Bool)

(assert (=> b!651096 (=> (not res!422247) (not e!373589))))

(assert (=> b!651096 (= res!422247 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18859 lt!302495)))))

(declare-fun b!651097 () Bool)

(assert (=> b!651097 (= e!373589 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91851 (not res!422246)) b!651096))

(assert (= (and b!651096 res!422247) b!651097))

(declare-fun m!623795 () Bool)

(assert (=> d!91851 m!623795))

(assert (=> b!651097 m!623553))

(declare-fun m!623797 () Bool)

(assert (=> b!651097 m!623797))

(assert (=> b!650904 d!91851))

(declare-fun d!91853 () Bool)

(declare-fun e!373592 () Bool)

(assert (=> d!91853 e!373592))

(declare-fun res!422250 () Bool)

(assert (=> d!91853 (=> (not res!422250) (not e!373592))))

(assert (=> d!91853 (= res!422250 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986))))))

(declare-fun lt!302637 () Unit!22214)

(declare-fun choose!41 (array!38580 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12574) Unit!22214)

(assert (=> d!91853 (= lt!302637 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12571))))

(assert (=> d!91853 (bvslt (size!18859 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91853 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12571) lt!302637)))

(declare-fun b!651100 () Bool)

(assert (=> b!651100 (= e!373592 (arrayNoDuplicates!0 (array!38581 (store (arr!18494 a!2986) i!1108 k0!1786) (size!18859 a!2986)) #b00000000000000000000000000000000 Nil!12571))))

(assert (= (and d!91853 res!422250) b!651100))

(declare-fun m!623799 () Bool)

(assert (=> d!91853 m!623799))

(assert (=> b!651100 m!623575))

(declare-fun m!623801 () Bool)

(assert (=> b!651100 m!623801))

(assert (=> b!650904 d!91853))

(declare-fun d!91859 () Bool)

(assert (=> d!91859 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18859 lt!302495)) (not (= (select (arr!18494 lt!302495) j!136) (select (arr!18494 a!2986) j!136))))))

(declare-fun lt!302643 () Unit!22214)

(declare-fun choose!21 (array!38580 (_ BitVec 64) (_ BitVec 32) List!12574) Unit!22214)

(assert (=> d!91859 (= lt!302643 (choose!21 lt!302495 (select (arr!18494 a!2986) j!136) j!136 Nil!12571))))

(assert (=> d!91859 (bvslt (size!18859 lt!302495) #b01111111111111111111111111111111)))

(assert (=> d!91859 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136 Nil!12571) lt!302643)))

(declare-fun bs!19392 () Bool)

(assert (= bs!19392 d!91859))

(assert (=> bs!19392 m!623787))

(assert (=> bs!19392 m!623553))

(declare-fun m!623807 () Bool)

(assert (=> bs!19392 m!623807))

(assert (=> b!650904 d!91859))

(declare-fun d!91863 () Bool)

(declare-fun res!422251 () Bool)

(declare-fun e!373593 () Bool)

(assert (=> d!91863 (=> res!422251 e!373593)))

(assert (=> d!91863 (= res!422251 (= (select (arr!18494 lt!302495) j!136) (select (arr!18494 a!2986) j!136)))))

(assert (=> d!91863 (= (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136) e!373593)))

(declare-fun b!651101 () Bool)

(declare-fun e!373594 () Bool)

(assert (=> b!651101 (= e!373593 e!373594)))

(declare-fun res!422252 () Bool)

(assert (=> b!651101 (=> (not res!422252) (not e!373594))))

(assert (=> b!651101 (= res!422252 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18859 lt!302495)))))

(declare-fun b!651102 () Bool)

(assert (=> b!651102 (= e!373594 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91863 (not res!422251)) b!651101))

(assert (= (and b!651101 res!422252) b!651102))

(assert (=> d!91863 m!623787))

(assert (=> b!651102 m!623553))

(declare-fun m!623809 () Bool)

(assert (=> b!651102 m!623809))

(assert (=> b!650898 d!91863))

(declare-fun b!651121 () Bool)

(declare-fun e!373611 () Bool)

(declare-fun call!33733 () Bool)

(assert (=> b!651121 (= e!373611 call!33733)))

(declare-fun d!91865 () Bool)

(declare-fun res!422264 () Bool)

(declare-fun e!373609 () Bool)

(assert (=> d!91865 (=> res!422264 e!373609)))

(assert (=> d!91865 (= res!422264 (bvsge #b00000000000000000000000000000000 (size!18859 a!2986)))))

(assert (=> d!91865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!373609)))

(declare-fun b!651122 () Bool)

(assert (=> b!651122 (= e!373609 e!373611)))

(declare-fun c!74796 () Bool)

(assert (=> b!651122 (= c!74796 (validKeyInArray!0 (select (arr!18494 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651123 () Bool)

(declare-fun e!373610 () Bool)

(assert (=> b!651123 (= e!373611 e!373610)))

(declare-fun lt!302658 () (_ BitVec 64))

(assert (=> b!651123 (= lt!302658 (select (arr!18494 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!302657 () Unit!22214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38580 (_ BitVec 64) (_ BitVec 32)) Unit!22214)

(assert (=> b!651123 (= lt!302657 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!302658 #b00000000000000000000000000000000))))

(assert (=> b!651123 (arrayContainsKey!0 a!2986 lt!302658 #b00000000000000000000000000000000)))

(declare-fun lt!302656 () Unit!22214)

(assert (=> b!651123 (= lt!302656 lt!302657)))

(declare-fun res!422263 () Bool)

(assert (=> b!651123 (= res!422263 (= (seekEntryOrOpen!0 (select (arr!18494 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6931 #b00000000000000000000000000000000)))))

(assert (=> b!651123 (=> (not res!422263) (not e!373610))))

(declare-fun bm!33730 () Bool)

(assert (=> bm!33730 (= call!33733 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!651124 () Bool)

(assert (=> b!651124 (= e!373610 call!33733)))

(assert (= (and d!91865 (not res!422264)) b!651122))

(assert (= (and b!651122 c!74796) b!651123))

(assert (= (and b!651122 (not c!74796)) b!651121))

(assert (= (and b!651123 res!422263) b!651124))

(assert (= (or b!651124 b!651121) bm!33730))

(declare-fun m!623815 () Bool)

(assert (=> b!651122 m!623815))

(assert (=> b!651122 m!623815))

(declare-fun m!623817 () Bool)

(assert (=> b!651122 m!623817))

(assert (=> b!651123 m!623815))

(declare-fun m!623819 () Bool)

(assert (=> b!651123 m!623819))

(declare-fun m!623821 () Bool)

(assert (=> b!651123 m!623821))

(assert (=> b!651123 m!623815))

(declare-fun m!623823 () Bool)

(assert (=> b!651123 m!623823))

(declare-fun m!623825 () Bool)

(assert (=> bm!33730 m!623825))

(assert (=> b!650897 d!91865))

(declare-fun d!91871 () Bool)

(declare-fun res!422265 () Bool)

(declare-fun e!373612 () Bool)

(assert (=> d!91871 (=> res!422265 e!373612)))

(assert (=> d!91871 (= res!422265 (= (select (arr!18494 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91871 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!373612)))

(declare-fun b!651125 () Bool)

(declare-fun e!373613 () Bool)

(assert (=> b!651125 (= e!373612 e!373613)))

(declare-fun res!422266 () Bool)

(assert (=> b!651125 (=> (not res!422266) (not e!373613))))

(assert (=> b!651125 (= res!422266 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18859 a!2986)))))

(declare-fun b!651126 () Bool)

(assert (=> b!651126 (= e!373613 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91871 (not res!422265)) b!651125))

(assert (= (and b!651125 res!422266) b!651126))

(assert (=> d!91871 m!623815))

(declare-fun m!623827 () Bool)

(assert (=> b!651126 m!623827))

(assert (=> b!650907 d!91871))

(declare-fun d!91873 () Bool)

(assert (=> d!91873 (= (validKeyInArray!0 (select (arr!18494 a!2986) j!136)) (and (not (= (select (arr!18494 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18494 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!650901 d!91873))

(declare-fun d!91875 () Bool)

(declare-fun e!373644 () Bool)

(assert (=> d!91875 e!373644))

(declare-fun res!422286 () Bool)

(assert (=> d!91875 (=> (not res!422286) (not e!373644))))

(assert (=> d!91875 (= res!422286 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18859 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18859 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18859 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18859 a!2986))))))

(declare-fun lt!302670 () Unit!22214)

(declare-fun choose!9 (array!38580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22214)

(assert (=> d!91875 (= lt!302670 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91875 (validMask!0 mask!3053)))

(assert (=> d!91875 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 mask!3053) lt!302670)))

(declare-fun b!651168 () Bool)

(assert (=> b!651168 (= e!373644 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 (select (store (arr!18494 a!2986) i!1108 k0!1786) j!136) (array!38581 (store (arr!18494 a!2986) i!1108 k0!1786) (size!18859 a!2986)) mask!3053)))))

(assert (= (and d!91875 res!422286) b!651168))

(declare-fun m!623865 () Bool)

(assert (=> d!91875 m!623865))

(assert (=> d!91875 m!623585))

(assert (=> b!651168 m!623553))

(assert (=> b!651168 m!623579))

(declare-fun m!623867 () Bool)

(assert (=> b!651168 m!623867))

(assert (=> b!651168 m!623579))

(assert (=> b!651168 m!623553))

(assert (=> b!651168 m!623581))

(assert (=> b!651168 m!623575))

(assert (=> b!650900 d!91875))

(declare-fun lt!302689 () SeekEntryResult!6931)

(declare-fun d!91889 () Bool)

(assert (=> d!91889 (and (or ((_ is Undefined!6931) lt!302689) (not ((_ is Found!6931) lt!302689)) (and (bvsge (index!30075 lt!302689) #b00000000000000000000000000000000) (bvslt (index!30075 lt!302689) (size!18859 lt!302495)))) (or ((_ is Undefined!6931) lt!302689) ((_ is Found!6931) lt!302689) (not ((_ is MissingVacant!6931) lt!302689)) (not (= (index!30077 lt!302689) vacantSpotIndex!68)) (and (bvsge (index!30077 lt!302689) #b00000000000000000000000000000000) (bvslt (index!30077 lt!302689) (size!18859 lt!302495)))) (or ((_ is Undefined!6931) lt!302689) (ite ((_ is Found!6931) lt!302689) (= (select (arr!18494 lt!302495) (index!30075 lt!302689)) lt!302494) (and ((_ is MissingVacant!6931) lt!302689) (= (index!30077 lt!302689) vacantSpotIndex!68) (= (select (arr!18494 lt!302495) (index!30077 lt!302689)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373665 () SeekEntryResult!6931)

(assert (=> d!91889 (= lt!302689 e!373665)))

(declare-fun c!74827 () Bool)

(assert (=> d!91889 (= c!74827 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302688 () (_ BitVec 64))

(assert (=> d!91889 (= lt!302688 (select (arr!18494 lt!302495) lt!302499))))

(assert (=> d!91889 (validMask!0 mask!3053)))

(assert (=> d!91889 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 lt!302494 lt!302495 mask!3053) lt!302689)))

(declare-fun b!651205 () Bool)

(declare-fun e!373664 () SeekEntryResult!6931)

(assert (=> b!651205 (= e!373664 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302499 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!302494 lt!302495 mask!3053))))

(declare-fun b!651206 () Bool)

(declare-fun e!373663 () SeekEntryResult!6931)

(assert (=> b!651206 (= e!373663 (Found!6931 lt!302499))))

(declare-fun b!651207 () Bool)

(assert (=> b!651207 (= e!373664 (MissingVacant!6931 vacantSpotIndex!68))))

(declare-fun b!651208 () Bool)

(declare-fun c!74828 () Bool)

(assert (=> b!651208 (= c!74828 (= lt!302688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651208 (= e!373663 e!373664)))

(declare-fun b!651209 () Bool)

(assert (=> b!651209 (= e!373665 Undefined!6931)))

(declare-fun b!651210 () Bool)

(assert (=> b!651210 (= e!373665 e!373663)))

(declare-fun c!74826 () Bool)

(assert (=> b!651210 (= c!74826 (= lt!302688 lt!302494))))

(assert (= (and d!91889 c!74827) b!651209))

(assert (= (and d!91889 (not c!74827)) b!651210))

(assert (= (and b!651210 c!74826) b!651206))

(assert (= (and b!651210 (not c!74826)) b!651208))

(assert (= (and b!651208 c!74828) b!651207))

(assert (= (and b!651208 (not c!74828)) b!651205))

(declare-fun m!623887 () Bool)

(assert (=> d!91889 m!623887))

(declare-fun m!623889 () Bool)

(assert (=> d!91889 m!623889))

(declare-fun m!623891 () Bool)

(assert (=> d!91889 m!623891))

(assert (=> d!91889 m!623585))

(declare-fun m!623893 () Bool)

(assert (=> b!651205 m!623893))

(assert (=> b!651205 m!623893))

(declare-fun m!623895 () Bool)

(assert (=> b!651205 m!623895))

(assert (=> b!650900 d!91889))

(declare-fun d!91897 () Bool)

(declare-fun lt!302697 () (_ BitVec 32))

(assert (=> d!91897 (and (bvsge lt!302697 #b00000000000000000000000000000000) (bvslt lt!302697 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91897 (= lt!302697 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91897 (validMask!0 mask!3053)))

(assert (=> d!91897 (= (nextIndex!0 index!984 x!910 mask!3053) lt!302697)))

(declare-fun bs!19396 () Bool)

(assert (= bs!19396 d!91897))

(declare-fun m!623911 () Bool)

(assert (=> bs!19396 m!623911))

(assert (=> bs!19396 m!623585))

(assert (=> b!650900 d!91897))

(declare-fun d!91901 () Bool)

(declare-fun lt!302699 () SeekEntryResult!6931)

(assert (=> d!91901 (and (or ((_ is Undefined!6931) lt!302699) (not ((_ is Found!6931) lt!302699)) (and (bvsge (index!30075 lt!302699) #b00000000000000000000000000000000) (bvslt (index!30075 lt!302699) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302699) ((_ is Found!6931) lt!302699) (not ((_ is MissingVacant!6931) lt!302699)) (not (= (index!30077 lt!302699) vacantSpotIndex!68)) (and (bvsge (index!30077 lt!302699) #b00000000000000000000000000000000) (bvslt (index!30077 lt!302699) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302699) (ite ((_ is Found!6931) lt!302699) (= (select (arr!18494 a!2986) (index!30075 lt!302699)) (select (arr!18494 a!2986) j!136)) (and ((_ is MissingVacant!6931) lt!302699) (= (index!30077 lt!302699) vacantSpotIndex!68) (= (select (arr!18494 a!2986) (index!30077 lt!302699)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373673 () SeekEntryResult!6931)

(assert (=> d!91901 (= lt!302699 e!373673)))

(declare-fun c!74833 () Bool)

(assert (=> d!91901 (= c!74833 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302698 () (_ BitVec 64))

(assert (=> d!91901 (= lt!302698 (select (arr!18494 a!2986) lt!302499))))

(assert (=> d!91901 (validMask!0 mask!3053)))

(assert (=> d!91901 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302499 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053) lt!302699)))

(declare-fun e!373672 () SeekEntryResult!6931)

(declare-fun b!651219 () Bool)

(assert (=> b!651219 (= e!373672 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302499 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651220 () Bool)

(declare-fun e!373671 () SeekEntryResult!6931)

(assert (=> b!651220 (= e!373671 (Found!6931 lt!302499))))

(declare-fun b!651221 () Bool)

(assert (=> b!651221 (= e!373672 (MissingVacant!6931 vacantSpotIndex!68))))

(declare-fun b!651222 () Bool)

(declare-fun c!74834 () Bool)

(assert (=> b!651222 (= c!74834 (= lt!302698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651222 (= e!373671 e!373672)))

(declare-fun b!651223 () Bool)

(assert (=> b!651223 (= e!373673 Undefined!6931)))

(declare-fun b!651224 () Bool)

(assert (=> b!651224 (= e!373673 e!373671)))

(declare-fun c!74832 () Bool)

(assert (=> b!651224 (= c!74832 (= lt!302698 (select (arr!18494 a!2986) j!136)))))

(assert (= (and d!91901 c!74833) b!651223))

(assert (= (and d!91901 (not c!74833)) b!651224))

(assert (= (and b!651224 c!74832) b!651220))

(assert (= (and b!651224 (not c!74832)) b!651222))

(assert (= (and b!651222 c!74834) b!651221))

(assert (= (and b!651222 (not c!74834)) b!651219))

(declare-fun m!623917 () Bool)

(assert (=> d!91901 m!623917))

(declare-fun m!623919 () Bool)

(assert (=> d!91901 m!623919))

(declare-fun m!623921 () Bool)

(assert (=> d!91901 m!623921))

(assert (=> d!91901 m!623585))

(assert (=> b!651219 m!623893))

(assert (=> b!651219 m!623893))

(assert (=> b!651219 m!623553))

(declare-fun m!623923 () Bool)

(assert (=> b!651219 m!623923))

(assert (=> b!650900 d!91901))

(declare-fun lt!302701 () SeekEntryResult!6931)

(declare-fun d!91909 () Bool)

(assert (=> d!91909 (and (or ((_ is Undefined!6931) lt!302701) (not ((_ is Found!6931) lt!302701)) (and (bvsge (index!30075 lt!302701) #b00000000000000000000000000000000) (bvslt (index!30075 lt!302701) (size!18859 lt!302495)))) (or ((_ is Undefined!6931) lt!302701) ((_ is Found!6931) lt!302701) (not ((_ is MissingVacant!6931) lt!302701)) (not (= (index!30077 lt!302701) vacantSpotIndex!68)) (and (bvsge (index!30077 lt!302701) #b00000000000000000000000000000000) (bvslt (index!30077 lt!302701) (size!18859 lt!302495)))) (or ((_ is Undefined!6931) lt!302701) (ite ((_ is Found!6931) lt!302701) (= (select (arr!18494 lt!302495) (index!30075 lt!302701)) lt!302494) (and ((_ is MissingVacant!6931) lt!302701) (= (index!30077 lt!302701) vacantSpotIndex!68) (= (select (arr!18494 lt!302495) (index!30077 lt!302701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373678 () SeekEntryResult!6931)

(assert (=> d!91909 (= lt!302701 e!373678)))

(declare-fun c!74836 () Bool)

(assert (=> d!91909 (= c!74836 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302700 () (_ BitVec 64))

(assert (=> d!91909 (= lt!302700 (select (arr!18494 lt!302495) index!984))))

(assert (=> d!91909 (validMask!0 mask!3053)))

(assert (=> d!91909 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302494 lt!302495 mask!3053) lt!302701)))

(declare-fun e!373677 () SeekEntryResult!6931)

(declare-fun b!651227 () Bool)

(assert (=> b!651227 (= e!373677 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!302494 lt!302495 mask!3053))))

(declare-fun b!651228 () Bool)

(declare-fun e!373676 () SeekEntryResult!6931)

(assert (=> b!651228 (= e!373676 (Found!6931 index!984))))

(declare-fun b!651229 () Bool)

(assert (=> b!651229 (= e!373677 (MissingVacant!6931 vacantSpotIndex!68))))

(declare-fun b!651230 () Bool)

(declare-fun c!74837 () Bool)

(assert (=> b!651230 (= c!74837 (= lt!302700 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651230 (= e!373676 e!373677)))

(declare-fun b!651231 () Bool)

(assert (=> b!651231 (= e!373678 Undefined!6931)))

(declare-fun b!651232 () Bool)

(assert (=> b!651232 (= e!373678 e!373676)))

(declare-fun c!74835 () Bool)

(assert (=> b!651232 (= c!74835 (= lt!302700 lt!302494))))

(assert (= (and d!91909 c!74836) b!651231))

(assert (= (and d!91909 (not c!74836)) b!651232))

(assert (= (and b!651232 c!74835) b!651228))

(assert (= (and b!651232 (not c!74835)) b!651230))

(assert (= (and b!651230 c!74837) b!651229))

(assert (= (and b!651230 (not c!74837)) b!651227))

(declare-fun m!623925 () Bool)

(assert (=> d!91909 m!623925))

(declare-fun m!623927 () Bool)

(assert (=> d!91909 m!623927))

(assert (=> d!91909 m!623757))

(assert (=> d!91909 m!623585))

(assert (=> b!651227 m!623569))

(assert (=> b!651227 m!623569))

(declare-fun m!623931 () Bool)

(assert (=> b!651227 m!623931))

(assert (=> b!650900 d!91909))

(assert (=> b!650911 d!91833))

(declare-fun d!91911 () Bool)

(declare-fun res!422294 () Bool)

(declare-fun e!373683 () Bool)

(assert (=> d!91911 (=> res!422294 e!373683)))

(assert (=> d!91911 (= res!422294 (bvsge #b00000000000000000000000000000000 (size!18859 a!2986)))))

(assert (=> d!91911 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12571) e!373683)))

(declare-fun b!651234 () Bool)

(declare-fun e!373680 () Bool)

(assert (=> b!651234 (= e!373680 (contains!3160 Nil!12571 (select (arr!18494 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33733 () Bool)

(declare-fun call!33736 () Bool)

(declare-fun c!74838 () Bool)

(assert (=> bm!33733 (= call!33736 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74838 (Cons!12570 (select (arr!18494 a!2986) #b00000000000000000000000000000000) Nil!12571) Nil!12571)))))

(declare-fun b!651235 () Bool)

(declare-fun e!373681 () Bool)

(assert (=> b!651235 (= e!373681 call!33736)))

(declare-fun b!651236 () Bool)

(declare-fun e!373682 () Bool)

(assert (=> b!651236 (= e!373682 e!373681)))

(assert (=> b!651236 (= c!74838 (validKeyInArray!0 (select (arr!18494 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651237 () Bool)

(assert (=> b!651237 (= e!373683 e!373682)))

(declare-fun res!422292 () Bool)

(assert (=> b!651237 (=> (not res!422292) (not e!373682))))

(assert (=> b!651237 (= res!422292 (not e!373680))))

(declare-fun res!422293 () Bool)

(assert (=> b!651237 (=> (not res!422293) (not e!373680))))

(assert (=> b!651237 (= res!422293 (validKeyInArray!0 (select (arr!18494 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651238 () Bool)

(assert (=> b!651238 (= e!373681 call!33736)))

(assert (= (and d!91911 (not res!422294)) b!651237))

(assert (= (and b!651237 res!422293) b!651234))

(assert (= (and b!651237 res!422292) b!651236))

(assert (= (and b!651236 c!74838) b!651238))

(assert (= (and b!651236 (not c!74838)) b!651235))

(assert (= (or b!651238 b!651235) bm!33733))

(assert (=> b!651234 m!623815))

(assert (=> b!651234 m!623815))

(declare-fun m!623935 () Bool)

(assert (=> b!651234 m!623935))

(assert (=> bm!33733 m!623815))

(declare-fun m!623937 () Bool)

(assert (=> bm!33733 m!623937))

(assert (=> b!651236 m!623815))

(assert (=> b!651236 m!623815))

(assert (=> b!651236 m!623817))

(assert (=> b!651237 m!623815))

(assert (=> b!651237 m!623815))

(assert (=> b!651237 m!623817))

(assert (=> b!650910 d!91911))

(declare-fun d!91915 () Bool)

(assert (=> d!91915 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302703 () Unit!22214)

(assert (=> d!91915 (= lt!302703 (choose!114 lt!302495 (select (arr!18494 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91915 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91915 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302495 (select (arr!18494 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!302703)))

(declare-fun bs!19397 () Bool)

(assert (= bs!19397 d!91915))

(assert (=> bs!19397 m!623553))

(assert (=> bs!19397 m!623555))

(assert (=> bs!19397 m!623553))

(declare-fun m!623939 () Bool)

(assert (=> bs!19397 m!623939))

(assert (=> b!650902 d!91915))

(declare-fun d!91917 () Bool)

(declare-fun res!422295 () Bool)

(declare-fun e!373684 () Bool)

(assert (=> d!91917 (=> res!422295 e!373684)))

(assert (=> d!91917 (= res!422295 (= (select (arr!18494 lt!302495) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18494 a!2986) j!136)))))

(assert (=> d!91917 (= (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!373684)))

(declare-fun b!651239 () Bool)

(declare-fun e!373685 () Bool)

(assert (=> b!651239 (= e!373684 e!373685)))

(declare-fun res!422296 () Bool)

(assert (=> b!651239 (=> (not res!422296) (not e!373685))))

(assert (=> b!651239 (= res!422296 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18859 lt!302495)))))

(declare-fun b!651240 () Bool)

(assert (=> b!651240 (= e!373685 (arrayContainsKey!0 lt!302495 (select (arr!18494 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91917 (not res!422295)) b!651239))

(assert (= (and b!651239 res!422296) b!651240))

(declare-fun m!623941 () Bool)

(assert (=> d!91917 m!623941))

(assert (=> b!651240 m!623553))

(declare-fun m!623943 () Bool)

(assert (=> b!651240 m!623943))

(assert (=> b!650902 d!91917))

(declare-fun d!91919 () Bool)

(assert (=> d!91919 (arrayNoDuplicates!0 lt!302495 index!984 Nil!12571)))

(declare-fun lt!302704 () Unit!22214)

(assert (=> d!91919 (= lt!302704 (choose!39 lt!302495 #b00000000000000000000000000000000 index!984))))

(assert (=> d!91919 (bvslt (size!18859 lt!302495) #b01111111111111111111111111111111)))

(assert (=> d!91919 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302495 #b00000000000000000000000000000000 index!984) lt!302704)))

(declare-fun bs!19398 () Bool)

(assert (= bs!19398 d!91919))

(assert (=> bs!19398 m!623561))

(declare-fun m!623945 () Bool)

(assert (=> bs!19398 m!623945))

(assert (=> b!650902 d!91919))

(declare-fun d!91921 () Bool)

(declare-fun res!422303 () Bool)

(declare-fun e!373693 () Bool)

(assert (=> d!91921 (=> res!422303 e!373693)))

(assert (=> d!91921 (= res!422303 (bvsge index!984 (size!18859 lt!302495)))))

(assert (=> d!91921 (= (arrayNoDuplicates!0 lt!302495 index!984 Nil!12571) e!373693)))

(declare-fun b!651245 () Bool)

(declare-fun e!373690 () Bool)

(assert (=> b!651245 (= e!373690 (contains!3160 Nil!12571 (select (arr!18494 lt!302495) index!984)))))

(declare-fun call!33737 () Bool)

(declare-fun bm!33734 () Bool)

(declare-fun c!74839 () Bool)

(assert (=> bm!33734 (= call!33737 (arrayNoDuplicates!0 lt!302495 (bvadd index!984 #b00000000000000000000000000000001) (ite c!74839 (Cons!12570 (select (arr!18494 lt!302495) index!984) Nil!12571) Nil!12571)))))

(declare-fun b!651246 () Bool)

(declare-fun e!373691 () Bool)

(assert (=> b!651246 (= e!373691 call!33737)))

(declare-fun b!651247 () Bool)

(declare-fun e!373692 () Bool)

(assert (=> b!651247 (= e!373692 e!373691)))

(assert (=> b!651247 (= c!74839 (validKeyInArray!0 (select (arr!18494 lt!302495) index!984)))))

(declare-fun b!651248 () Bool)

(assert (=> b!651248 (= e!373693 e!373692)))

(declare-fun res!422301 () Bool)

(assert (=> b!651248 (=> (not res!422301) (not e!373692))))

(assert (=> b!651248 (= res!422301 (not e!373690))))

(declare-fun res!422302 () Bool)

(assert (=> b!651248 (=> (not res!422302) (not e!373690))))

(assert (=> b!651248 (= res!422302 (validKeyInArray!0 (select (arr!18494 lt!302495) index!984)))))

(declare-fun b!651249 () Bool)

(assert (=> b!651249 (= e!373691 call!33737)))

(assert (= (and d!91921 (not res!422303)) b!651248))

(assert (= (and b!651248 res!422302) b!651245))

(assert (= (and b!651248 res!422301) b!651247))

(assert (= (and b!651247 c!74839) b!651249))

(assert (= (and b!651247 (not c!74839)) b!651246))

(assert (= (or b!651249 b!651246) bm!33734))

(assert (=> b!651245 m!623757))

(assert (=> b!651245 m!623757))

(declare-fun m!623947 () Bool)

(assert (=> b!651245 m!623947))

(assert (=> bm!33734 m!623757))

(declare-fun m!623949 () Bool)

(assert (=> bm!33734 m!623949))

(assert (=> b!651247 m!623757))

(assert (=> b!651247 m!623757))

(declare-fun m!623951 () Bool)

(assert (=> b!651247 m!623951))

(assert (=> b!651248 m!623757))

(assert (=> b!651248 m!623757))

(assert (=> b!651248 m!623951))

(assert (=> b!650902 d!91921))

(assert (=> b!650902 d!91863))

(assert (=> b!650902 d!91847))

(assert (=> b!650902 d!91853))

(declare-fun d!91923 () Bool)

(declare-fun lt!302706 () SeekEntryResult!6931)

(assert (=> d!91923 (and (or ((_ is Undefined!6931) lt!302706) (not ((_ is Found!6931) lt!302706)) (and (bvsge (index!30075 lt!302706) #b00000000000000000000000000000000) (bvslt (index!30075 lt!302706) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302706) ((_ is Found!6931) lt!302706) (not ((_ is MissingVacant!6931) lt!302706)) (not (= (index!30077 lt!302706) vacantSpotIndex!68)) (and (bvsge (index!30077 lt!302706) #b00000000000000000000000000000000) (bvslt (index!30077 lt!302706) (size!18859 a!2986)))) (or ((_ is Undefined!6931) lt!302706) (ite ((_ is Found!6931) lt!302706) (= (select (arr!18494 a!2986) (index!30075 lt!302706)) (select (arr!18494 a!2986) j!136)) (and ((_ is MissingVacant!6931) lt!302706) (= (index!30077 lt!302706) vacantSpotIndex!68) (= (select (arr!18494 a!2986) (index!30077 lt!302706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373696 () SeekEntryResult!6931)

(assert (=> d!91923 (= lt!302706 e!373696)))

(declare-fun c!74841 () Bool)

(assert (=> d!91923 (= c!74841 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302705 () (_ BitVec 64))

(assert (=> d!91923 (= lt!302705 (select (arr!18494 a!2986) index!984))))

(assert (=> d!91923 (validMask!0 mask!3053)))

(assert (=> d!91923 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053) lt!302706)))

(declare-fun e!373695 () SeekEntryResult!6931)

(declare-fun b!651250 () Bool)

(assert (=> b!651250 (= e!373695 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18494 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651251 () Bool)

(declare-fun e!373694 () SeekEntryResult!6931)

(assert (=> b!651251 (= e!373694 (Found!6931 index!984))))

(declare-fun b!651252 () Bool)

(assert (=> b!651252 (= e!373695 (MissingVacant!6931 vacantSpotIndex!68))))

(declare-fun b!651253 () Bool)

(declare-fun c!74842 () Bool)

(assert (=> b!651253 (= c!74842 (= lt!302705 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651253 (= e!373694 e!373695)))

(declare-fun b!651254 () Bool)

(assert (=> b!651254 (= e!373696 Undefined!6931)))

(declare-fun b!651255 () Bool)

(assert (=> b!651255 (= e!373696 e!373694)))

(declare-fun c!74840 () Bool)

(assert (=> b!651255 (= c!74840 (= lt!302705 (select (arr!18494 a!2986) j!136)))))

(assert (= (and d!91923 c!74841) b!651254))

(assert (= (and d!91923 (not c!74841)) b!651255))

(assert (= (and b!651255 c!74840) b!651251))

(assert (= (and b!651255 (not c!74840)) b!651253))

(assert (= (and b!651253 c!74842) b!651252))

(assert (= (and b!651253 (not c!74842)) b!651250))

(declare-fun m!623957 () Bool)

(assert (=> d!91923 m!623957))

(declare-fun m!623959 () Bool)

(assert (=> d!91923 m!623959))

(assert (=> d!91923 m!623603))

(assert (=> d!91923 m!623585))

(assert (=> b!651250 m!623569))

(assert (=> b!651250 m!623569))

(assert (=> b!651250 m!623553))

(declare-fun m!623961 () Bool)

(assert (=> b!651250 m!623961))

(assert (=> b!650912 d!91923))

(check-sat (not b!651100) (not b!651122) (not d!91915) (not d!91875) (not d!91845) (not b!651086) (not b!651123) (not bm!33733) (not b!651057) (not d!91901) (not bm!33734) (not d!91919) (not b!651250) (not d!91841) (not b!651097) (not b!651074) (not b!651168) (not b!651093) (not b!651219) (not b!651247) (not b!651094) (not b!651091) (not d!91853) (not b!651088) (not bm!33724) (not d!91897) (not b!651126) (not d!91859) (not b!651234) (not bm!33725) (not b!651089) (not b!651205) (not b!651245) (not d!91843) (not bm!33730) (not b!651240) (not b!651227) (not d!91909) (not d!91889) (not b!651237) (not d!91923) (not b!651102) (not b!651236) (not b!651248))
(check-sat)
