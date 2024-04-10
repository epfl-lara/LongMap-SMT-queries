; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58872 () Bool)

(assert start!58872)

(declare-fun b!649296 () Bool)

(declare-fun res!420822 () Bool)

(declare-fun e!372427 () Bool)

(assert (=> b!649296 (=> (not res!420822) (not e!372427))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38534 0))(
  ( (array!38535 (arr!18473 (Array (_ BitVec 32) (_ BitVec 64))) (size!18837 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38534)

(assert (=> b!649296 (= res!420822 (and (= (size!18837 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18837 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18837 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649297 () Bool)

(declare-fun res!420816 () Bool)

(assert (=> b!649297 (=> (not res!420816) (not e!372427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649297 (= res!420816 (validKeyInArray!0 (select (arr!18473 a!2986) j!136)))))

(declare-fun b!649298 () Bool)

(declare-fun res!420829 () Bool)

(declare-fun e!372417 () Bool)

(assert (=> b!649298 (=> res!420829 e!372417)))

(declare-datatypes ((List!12514 0))(
  ( (Nil!12511) (Cons!12510 (h!13555 (_ BitVec 64)) (t!18742 List!12514)) )
))
(declare-fun noDuplicate!431 (List!12514) Bool)

(assert (=> b!649298 (= res!420829 (not (noDuplicate!431 Nil!12511)))))

(declare-fun b!649299 () Bool)

(declare-fun e!372425 () Bool)

(declare-fun e!372415 () Bool)

(assert (=> b!649299 (= e!372425 e!372415)))

(declare-fun res!420814 () Bool)

(assert (=> b!649299 (=> (not res!420814) (not e!372415))))

(declare-fun lt!301481 () array!38534)

(declare-fun arrayContainsKey!0 (array!38534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649299 (= res!420814 (arrayContainsKey!0 lt!301481 (select (arr!18473 a!2986) j!136) j!136))))

(declare-fun b!649300 () Bool)

(declare-fun e!372422 () Bool)

(assert (=> b!649300 (= e!372422 e!372417)))

(declare-fun res!420817 () Bool)

(assert (=> b!649300 (=> res!420817 e!372417)))

(assert (=> b!649300 (= res!420817 (or (bvsge (size!18837 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18837 a!2986))))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649300 (arrayContainsKey!0 lt!301481 (select (arr!18473 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22104 0))(
  ( (Unit!22105) )
))
(declare-fun lt!301489 () Unit!22104)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22104)

(assert (=> b!649300 (= lt!301489 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301481 (select (arr!18473 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372429 () Bool)

(assert (=> b!649300 e!372429))

(declare-fun res!420832 () Bool)

(assert (=> b!649300 (=> (not res!420832) (not e!372429))))

(assert (=> b!649300 (= res!420832 (arrayContainsKey!0 lt!301481 (select (arr!18473 a!2986) j!136) j!136))))

(declare-fun res!420819 () Bool)

(assert (=> start!58872 (=> (not res!420819) (not e!372427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58872 (= res!420819 (validMask!0 mask!3053))))

(assert (=> start!58872 e!372427))

(assert (=> start!58872 true))

(declare-fun array_inv!14269 (array!38534) Bool)

(assert (=> start!58872 (array_inv!14269 a!2986)))

(declare-fun b!649301 () Bool)

(declare-fun e!372426 () Bool)

(assert (=> b!649301 (= e!372426 e!372425)))

(declare-fun res!420830 () Bool)

(assert (=> b!649301 (=> res!420830 e!372425)))

(declare-fun lt!301487 () (_ BitVec 64))

(declare-fun lt!301482 () (_ BitVec 64))

(assert (=> b!649301 (= res!420830 (or (not (= (select (arr!18473 a!2986) j!136) lt!301482)) (not (= (select (arr!18473 a!2986) j!136) lt!301487)) (bvsge j!136 index!984)))))

(declare-fun b!649302 () Bool)

(declare-fun res!420831 () Bool)

(assert (=> b!649302 (=> res!420831 e!372417)))

(declare-fun contains!3169 (List!12514 (_ BitVec 64)) Bool)

(assert (=> b!649302 (= res!420831 (contains!3169 Nil!12511 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649303 () Bool)

(declare-fun res!420821 () Bool)

(declare-fun e!372414 () Bool)

(assert (=> b!649303 (=> (not res!420821) (not e!372414))))

(declare-fun arrayNoDuplicates!0 (array!38534 (_ BitVec 32) List!12514) Bool)

(assert (=> b!649303 (= res!420821 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12511))))

(declare-fun b!649304 () Bool)

(declare-fun e!372421 () Unit!22104)

(declare-fun Unit!22106 () Unit!22104)

(assert (=> b!649304 (= e!372421 Unit!22106)))

(assert (=> b!649304 false))

(declare-fun b!649305 () Bool)

(declare-fun res!420826 () Bool)

(assert (=> b!649305 (=> (not res!420826) (not e!372414))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!649305 (= res!420826 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18473 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649306 () Bool)

(assert (=> b!649306 (= e!372429 (arrayContainsKey!0 lt!301481 (select (arr!18473 a!2986) j!136) index!984))))

(declare-fun b!649307 () Bool)

(declare-fun e!372428 () Bool)

(declare-fun e!372419 () Bool)

(assert (=> b!649307 (= e!372428 e!372419)))

(declare-fun res!420836 () Bool)

(assert (=> b!649307 (=> res!420836 e!372419)))

(assert (=> b!649307 (= res!420836 (or (not (= (select (arr!18473 a!2986) j!136) lt!301482)) (not (= (select (arr!18473 a!2986) j!136) lt!301487))))))

(assert (=> b!649307 e!372426))

(declare-fun res!420824 () Bool)

(assert (=> b!649307 (=> (not res!420824) (not e!372426))))

(assert (=> b!649307 (= res!420824 (= lt!301487 (select (arr!18473 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!649307 (= lt!301487 (select (store (arr!18473 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!649308 () Bool)

(declare-fun e!372416 () Unit!22104)

(declare-fun Unit!22107 () Unit!22104)

(assert (=> b!649308 (= e!372416 Unit!22107)))

(declare-fun b!649309 () Bool)

(assert (=> b!649309 (= e!372427 e!372414)))

(declare-fun res!420833 () Bool)

(assert (=> b!649309 (=> (not res!420833) (not e!372414))))

(declare-datatypes ((SeekEntryResult!6913 0))(
  ( (MissingZero!6913 (index!29999 (_ BitVec 32))) (Found!6913 (index!30000 (_ BitVec 32))) (Intermediate!6913 (undefined!7725 Bool) (index!30001 (_ BitVec 32)) (x!58782 (_ BitVec 32))) (Undefined!6913) (MissingVacant!6913 (index!30002 (_ BitVec 32))) )
))
(declare-fun lt!301486 () SeekEntryResult!6913)

(assert (=> b!649309 (= res!420833 (or (= lt!301486 (MissingZero!6913 i!1108)) (= lt!301486 (MissingVacant!6913 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38534 (_ BitVec 32)) SeekEntryResult!6913)

(assert (=> b!649309 (= lt!301486 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!649310 () Bool)

(assert (=> b!649310 (= e!372417 true)))

(declare-fun lt!301488 () Bool)

(assert (=> b!649310 (= lt!301488 (contains!3169 Nil!12511 k!1786))))

(declare-fun b!649311 () Bool)

(declare-fun Unit!22108 () Unit!22104)

(assert (=> b!649311 (= e!372416 Unit!22108)))

(declare-fun lt!301495 () Unit!22104)

(assert (=> b!649311 (= lt!301495 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301481 (select (arr!18473 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649311 (arrayContainsKey!0 lt!301481 (select (arr!18473 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301485 () Unit!22104)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38534 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12514) Unit!22104)

(assert (=> b!649311 (= lt!301485 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12511))))

(assert (=> b!649311 (arrayNoDuplicates!0 lt!301481 #b00000000000000000000000000000000 Nil!12511)))

(declare-fun lt!301492 () Unit!22104)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38534 (_ BitVec 32) (_ BitVec 32)) Unit!22104)

(assert (=> b!649311 (= lt!301492 (lemmaNoDuplicateFromThenFromBigger!0 lt!301481 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649311 (arrayNoDuplicates!0 lt!301481 j!136 Nil!12511)))

(declare-fun lt!301494 () Unit!22104)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38534 (_ BitVec 64) (_ BitVec 32) List!12514) Unit!22104)

(assert (=> b!649311 (= lt!301494 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301481 (select (arr!18473 a!2986) j!136) j!136 Nil!12511))))

(assert (=> b!649311 false))

(declare-fun b!649312 () Bool)

(declare-fun res!420818 () Bool)

(assert (=> b!649312 (=> res!420818 e!372417)))

(assert (=> b!649312 (= res!420818 (contains!3169 Nil!12511 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649313 () Bool)

(declare-fun e!372423 () Bool)

(declare-fun lt!301491 () SeekEntryResult!6913)

(declare-fun lt!301480 () SeekEntryResult!6913)

(assert (=> b!649313 (= e!372423 (= lt!301491 lt!301480))))

(declare-fun b!649314 () Bool)

(declare-fun Unit!22109 () Unit!22104)

(assert (=> b!649314 (= e!372421 Unit!22109)))

(declare-fun b!649315 () Bool)

(declare-fun res!420815 () Bool)

(assert (=> b!649315 (=> (not res!420815) (not e!372427))))

(assert (=> b!649315 (= res!420815 (validKeyInArray!0 k!1786))))

(declare-fun b!649316 () Bool)

(declare-fun e!372420 () Bool)

(declare-fun e!372424 () Bool)

(assert (=> b!649316 (= e!372420 e!372424)))

(declare-fun res!420827 () Bool)

(assert (=> b!649316 (=> (not res!420827) (not e!372424))))

(assert (=> b!649316 (= res!420827 (and (= lt!301491 (Found!6913 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18473 a!2986) index!984) (select (arr!18473 a!2986) j!136))) (not (= (select (arr!18473 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38534 (_ BitVec 32)) SeekEntryResult!6913)

(assert (=> b!649316 (= lt!301491 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18473 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649317 () Bool)

(assert (=> b!649317 (= e!372415 (arrayContainsKey!0 lt!301481 (select (arr!18473 a!2986) j!136) index!984))))

(declare-fun b!649318 () Bool)

(assert (=> b!649318 (= e!372424 (not e!372428))))

(declare-fun res!420835 () Bool)

(assert (=> b!649318 (=> res!420835 e!372428)))

(declare-fun lt!301483 () SeekEntryResult!6913)

(assert (=> b!649318 (= res!420835 (not (= lt!301483 (Found!6913 index!984))))))

(declare-fun lt!301479 () Unit!22104)

(assert (=> b!649318 (= lt!301479 e!372421)))

(declare-fun c!74608 () Bool)

(assert (=> b!649318 (= c!74608 (= lt!301483 Undefined!6913))))

(assert (=> b!649318 (= lt!301483 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301482 lt!301481 mask!3053))))

(assert (=> b!649318 e!372423))

(declare-fun res!420825 () Bool)

(assert (=> b!649318 (=> (not res!420825) (not e!372423))))

(declare-fun lt!301490 () (_ BitVec 32))

(assert (=> b!649318 (= res!420825 (= lt!301480 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301490 vacantSpotIndex!68 lt!301482 lt!301481 mask!3053)))))

(assert (=> b!649318 (= lt!301480 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301490 vacantSpotIndex!68 (select (arr!18473 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649318 (= lt!301482 (select (store (arr!18473 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!301493 () Unit!22104)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38534 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22104)

(assert (=> b!649318 (= lt!301493 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301490 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649318 (= lt!301490 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649319 () Bool)

(assert (=> b!649319 (= e!372419 e!372422)))

(declare-fun res!420834 () Bool)

(assert (=> b!649319 (=> res!420834 e!372422)))

(assert (=> b!649319 (= res!420834 (bvsge index!984 j!136))))

(declare-fun lt!301484 () Unit!22104)

(assert (=> b!649319 (= lt!301484 e!372416)))

(declare-fun c!74609 () Bool)

(assert (=> b!649319 (= c!74609 (bvslt j!136 index!984))))

(declare-fun b!649320 () Bool)

(declare-fun res!420828 () Bool)

(assert (=> b!649320 (=> (not res!420828) (not e!372414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38534 (_ BitVec 32)) Bool)

(assert (=> b!649320 (= res!420828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649321 () Bool)

(declare-fun res!420823 () Bool)

(assert (=> b!649321 (=> (not res!420823) (not e!372427))))

(assert (=> b!649321 (= res!420823 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649322 () Bool)

(assert (=> b!649322 (= e!372414 e!372420)))

(declare-fun res!420820 () Bool)

(assert (=> b!649322 (=> (not res!420820) (not e!372420))))

(assert (=> b!649322 (= res!420820 (= (select (store (arr!18473 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649322 (= lt!301481 (array!38535 (store (arr!18473 a!2986) i!1108 k!1786) (size!18837 a!2986)))))

(assert (= (and start!58872 res!420819) b!649296))

(assert (= (and b!649296 res!420822) b!649297))

(assert (= (and b!649297 res!420816) b!649315))

(assert (= (and b!649315 res!420815) b!649321))

(assert (= (and b!649321 res!420823) b!649309))

(assert (= (and b!649309 res!420833) b!649320))

(assert (= (and b!649320 res!420828) b!649303))

(assert (= (and b!649303 res!420821) b!649305))

(assert (= (and b!649305 res!420826) b!649322))

(assert (= (and b!649322 res!420820) b!649316))

(assert (= (and b!649316 res!420827) b!649318))

(assert (= (and b!649318 res!420825) b!649313))

(assert (= (and b!649318 c!74608) b!649304))

(assert (= (and b!649318 (not c!74608)) b!649314))

(assert (= (and b!649318 (not res!420835)) b!649307))

(assert (= (and b!649307 res!420824) b!649301))

(assert (= (and b!649301 (not res!420830)) b!649299))

(assert (= (and b!649299 res!420814) b!649317))

(assert (= (and b!649307 (not res!420836)) b!649319))

(assert (= (and b!649319 c!74609) b!649311))

(assert (= (and b!649319 (not c!74609)) b!649308))

(assert (= (and b!649319 (not res!420834)) b!649300))

(assert (= (and b!649300 res!420832) b!649306))

(assert (= (and b!649300 (not res!420817)) b!649298))

(assert (= (and b!649298 (not res!420829)) b!649312))

(assert (= (and b!649312 (not res!420818)) b!649302))

(assert (= (and b!649302 (not res!420831)) b!649310))

(declare-fun m!622565 () Bool)

(assert (=> b!649300 m!622565))

(assert (=> b!649300 m!622565))

(declare-fun m!622567 () Bool)

(assert (=> b!649300 m!622567))

(assert (=> b!649300 m!622565))

(declare-fun m!622569 () Bool)

(assert (=> b!649300 m!622569))

(assert (=> b!649300 m!622565))

(declare-fun m!622571 () Bool)

(assert (=> b!649300 m!622571))

(declare-fun m!622573 () Bool)

(assert (=> b!649318 m!622573))

(declare-fun m!622575 () Bool)

(assert (=> b!649318 m!622575))

(declare-fun m!622577 () Bool)

(assert (=> b!649318 m!622577))

(declare-fun m!622579 () Bool)

(assert (=> b!649318 m!622579))

(declare-fun m!622581 () Bool)

(assert (=> b!649318 m!622581))

(declare-fun m!622583 () Bool)

(assert (=> b!649318 m!622583))

(assert (=> b!649318 m!622565))

(declare-fun m!622585 () Bool)

(assert (=> b!649318 m!622585))

(assert (=> b!649318 m!622565))

(declare-fun m!622587 () Bool)

(assert (=> b!649303 m!622587))

(assert (=> b!649306 m!622565))

(assert (=> b!649306 m!622565))

(declare-fun m!622589 () Bool)

(assert (=> b!649306 m!622589))

(assert (=> b!649307 m!622565))

(assert (=> b!649307 m!622577))

(declare-fun m!622591 () Bool)

(assert (=> b!649307 m!622591))

(declare-fun m!622593 () Bool)

(assert (=> b!649320 m!622593))

(assert (=> b!649299 m!622565))

(assert (=> b!649299 m!622565))

(assert (=> b!649299 m!622571))

(declare-fun m!622595 () Bool)

(assert (=> b!649316 m!622595))

(assert (=> b!649316 m!622565))

(assert (=> b!649316 m!622565))

(declare-fun m!622597 () Bool)

(assert (=> b!649316 m!622597))

(declare-fun m!622599 () Bool)

(assert (=> b!649312 m!622599))

(declare-fun m!622601 () Bool)

(assert (=> b!649321 m!622601))

(declare-fun m!622603 () Bool)

(assert (=> b!649310 m!622603))

(declare-fun m!622605 () Bool)

(assert (=> b!649298 m!622605))

(declare-fun m!622607 () Bool)

(assert (=> b!649305 m!622607))

(assert (=> b!649322 m!622577))

(declare-fun m!622609 () Bool)

(assert (=> b!649322 m!622609))

(declare-fun m!622611 () Bool)

(assert (=> b!649302 m!622611))

(assert (=> b!649297 m!622565))

(assert (=> b!649297 m!622565))

(declare-fun m!622613 () Bool)

(assert (=> b!649297 m!622613))

(declare-fun m!622615 () Bool)

(assert (=> b!649309 m!622615))

(assert (=> b!649301 m!622565))

(declare-fun m!622617 () Bool)

(assert (=> start!58872 m!622617))

(declare-fun m!622619 () Bool)

(assert (=> start!58872 m!622619))

(assert (=> b!649317 m!622565))

(assert (=> b!649317 m!622565))

(assert (=> b!649317 m!622589))

(assert (=> b!649311 m!622565))

(assert (=> b!649311 m!622565))

(declare-fun m!622621 () Bool)

(assert (=> b!649311 m!622621))

(declare-fun m!622623 () Bool)

(assert (=> b!649311 m!622623))

(assert (=> b!649311 m!622565))

(declare-fun m!622625 () Bool)

(assert (=> b!649311 m!622625))

(assert (=> b!649311 m!622565))

(declare-fun m!622627 () Bool)

(assert (=> b!649311 m!622627))

(declare-fun m!622629 () Bool)

(assert (=> b!649311 m!622629))

(declare-fun m!622631 () Bool)

(assert (=> b!649311 m!622631))

(declare-fun m!622633 () Bool)

(assert (=> b!649311 m!622633))

(declare-fun m!622635 () Bool)

(assert (=> b!649315 m!622635))

(push 1)

