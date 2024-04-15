; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59078 () Bool)

(assert start!59078)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!651446 () Bool)

(declare-fun e!373832 () Bool)

(declare-datatypes ((array!38589 0))(
  ( (array!38590 (arr!18497 (Array (_ BitVec 32) (_ BitVec 64))) (size!18862 (_ BitVec 32))) )
))
(declare-fun lt!302817 () array!38589)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38589)

(declare-fun arrayContainsKey!0 (array!38589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651446 (= e!373832 (arrayContainsKey!0 lt!302817 (select (arr!18497 a!2986) j!136) index!984))))

(declare-fun b!651447 () Bool)

(declare-fun e!373831 () Bool)

(declare-fun e!373841 () Bool)

(assert (=> b!651447 (= e!373831 e!373841)))

(declare-fun res!422413 () Bool)

(assert (=> b!651447 (=> (not res!422413) (not e!373841))))

(assert (=> b!651447 (= res!422413 (arrayContainsKey!0 lt!302817 (select (arr!18497 a!2986) j!136) j!136))))

(declare-fun b!651448 () Bool)

(declare-fun e!373827 () Bool)

(assert (=> b!651448 (= e!373827 e!373831)))

(declare-fun res!422402 () Bool)

(assert (=> b!651448 (=> res!422402 e!373831)))

(declare-fun lt!302812 () (_ BitVec 64))

(declare-fun lt!302821 () (_ BitVec 64))

(assert (=> b!651448 (= res!422402 (or (not (= (select (arr!18497 a!2986) j!136) lt!302812)) (not (= (select (arr!18497 a!2986) j!136) lt!302821)) (bvsge j!136 index!984)))))

(declare-fun b!651449 () Bool)

(declare-fun res!422411 () Bool)

(declare-fun e!373837 () Bool)

(assert (=> b!651449 (=> (not res!422411) (not e!373837))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651449 (= res!422411 (validKeyInArray!0 k0!1786))))

(declare-fun b!651450 () Bool)

(declare-fun e!373835 () Bool)

(declare-fun e!373834 () Bool)

(assert (=> b!651450 (= e!373835 e!373834)))

(declare-fun res!422410 () Bool)

(assert (=> b!651450 (=> res!422410 e!373834)))

(assert (=> b!651450 (= res!422410 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22232 0))(
  ( (Unit!22233) )
))
(declare-fun lt!302816 () Unit!22232)

(declare-fun e!373828 () Unit!22232)

(assert (=> b!651450 (= lt!302816 e!373828)))

(declare-fun c!74891 () Bool)

(assert (=> b!651450 (= c!74891 (bvslt j!136 index!984))))

(declare-fun b!651452 () Bool)

(declare-fun res!422400 () Bool)

(declare-fun e!373833 () Bool)

(assert (=> b!651452 (=> (not res!422400) (not e!373833))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38589 (_ BitVec 32)) Bool)

(assert (=> b!651452 (= res!422400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!651453 () Bool)

(declare-fun e!373829 () Bool)

(declare-fun e!373840 () Bool)

(assert (=> b!651453 (= e!373829 (not e!373840))))

(declare-fun res!422404 () Bool)

(assert (=> b!651453 (=> res!422404 e!373840)))

(declare-datatypes ((SeekEntryResult!6934 0))(
  ( (MissingZero!6934 (index!30089 (_ BitVec 32))) (Found!6934 (index!30090 (_ BitVec 32))) (Intermediate!6934 (undefined!7746 Bool) (index!30091 (_ BitVec 32)) (x!58888 (_ BitVec 32))) (Undefined!6934) (MissingVacant!6934 (index!30092 (_ BitVec 32))) )
))
(declare-fun lt!302813 () SeekEntryResult!6934)

(assert (=> b!651453 (= res!422404 (not (= lt!302813 (Found!6934 index!984))))))

(declare-fun lt!302815 () Unit!22232)

(declare-fun e!373836 () Unit!22232)

(assert (=> b!651453 (= lt!302815 e!373836)))

(declare-fun c!74892 () Bool)

(assert (=> b!651453 (= c!74892 (= lt!302813 Undefined!6934))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38589 (_ BitVec 32)) SeekEntryResult!6934)

(assert (=> b!651453 (= lt!302813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302812 lt!302817 mask!3053))))

(declare-fun e!373830 () Bool)

(assert (=> b!651453 e!373830))

(declare-fun res!422399 () Bool)

(assert (=> b!651453 (=> (not res!422399) (not e!373830))))

(declare-fun lt!302806 () SeekEntryResult!6934)

(declare-fun lt!302819 () (_ BitVec 32))

(assert (=> b!651453 (= res!422399 (= lt!302806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302819 vacantSpotIndex!68 lt!302812 lt!302817 mask!3053)))))

(assert (=> b!651453 (= lt!302806 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302819 vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!651453 (= lt!302812 (select (store (arr!18497 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302811 () Unit!22232)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38589 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22232)

(assert (=> b!651453 (= lt!302811 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302819 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651453 (= lt!302819 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651454 () Bool)

(declare-fun Unit!22234 () Unit!22232)

(assert (=> b!651454 (= e!373836 Unit!22234)))

(declare-fun b!651455 () Bool)

(declare-fun res!422415 () Bool)

(assert (=> b!651455 (=> (not res!422415) (not e!373837))))

(assert (=> b!651455 (= res!422415 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651456 () Bool)

(declare-fun res!422401 () Bool)

(assert (=> b!651456 (=> (not res!422401) (not e!373837))))

(assert (=> b!651456 (= res!422401 (and (= (size!18862 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18862 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18862 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651457 () Bool)

(declare-fun e!373838 () Bool)

(assert (=> b!651457 (= e!373833 e!373838)))

(declare-fun res!422398 () Bool)

(assert (=> b!651457 (=> (not res!422398) (not e!373838))))

(assert (=> b!651457 (= res!422398 (= (select (store (arr!18497 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651457 (= lt!302817 (array!38590 (store (arr!18497 a!2986) i!1108 k0!1786) (size!18862 a!2986)))))

(declare-fun b!651458 () Bool)

(declare-fun res!422407 () Bool)

(assert (=> b!651458 (=> (not res!422407) (not e!373833))))

(assert (=> b!651458 (= res!422407 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18497 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651459 () Bool)

(declare-fun res!422406 () Bool)

(assert (=> b!651459 (=> (not res!422406) (not e!373837))))

(assert (=> b!651459 (= res!422406 (validKeyInArray!0 (select (arr!18497 a!2986) j!136)))))

(declare-fun b!651460 () Bool)

(assert (=> b!651460 (= e!373838 e!373829)))

(declare-fun res!422416 () Bool)

(assert (=> b!651460 (=> (not res!422416) (not e!373829))))

(declare-fun lt!302822 () SeekEntryResult!6934)

(assert (=> b!651460 (= res!422416 (and (= lt!302822 (Found!6934 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18497 a!2986) index!984) (select (arr!18497 a!2986) j!136))) (not (= (select (arr!18497 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!651460 (= lt!302822 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18497 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651461 () Bool)

(assert (=> b!651461 (= e!373830 (= lt!302822 lt!302806))))

(declare-fun b!651462 () Bool)

(declare-fun res!422408 () Bool)

(assert (=> b!651462 (=> (not res!422408) (not e!373833))))

(declare-datatypes ((List!12577 0))(
  ( (Nil!12574) (Cons!12573 (h!13618 (_ BitVec 64)) (t!18796 List!12577)) )
))
(declare-fun arrayNoDuplicates!0 (array!38589 (_ BitVec 32) List!12577) Bool)

(assert (=> b!651462 (= res!422408 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12574))))

(declare-fun b!651463 () Bool)

(assert (=> b!651463 (= e!373841 (arrayContainsKey!0 lt!302817 (select (arr!18497 a!2986) j!136) index!984))))

(declare-fun b!651464 () Bool)

(assert (=> b!651464 (= e!373840 e!373835)))

(declare-fun res!422412 () Bool)

(assert (=> b!651464 (=> res!422412 e!373835)))

(assert (=> b!651464 (= res!422412 (or (not (= (select (arr!18497 a!2986) j!136) lt!302812)) (not (= (select (arr!18497 a!2986) j!136) lt!302821))))))

(assert (=> b!651464 e!373827))

(declare-fun res!422403 () Bool)

(assert (=> b!651464 (=> (not res!422403) (not e!373827))))

(assert (=> b!651464 (= res!422403 (= lt!302821 (select (arr!18497 a!2986) j!136)))))

(assert (=> b!651464 (= lt!302821 (select (store (arr!18497 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651465 () Bool)

(declare-fun Unit!22235 () Unit!22232)

(assert (=> b!651465 (= e!373828 Unit!22235)))

(declare-fun b!651466 () Bool)

(declare-fun Unit!22236 () Unit!22232)

(assert (=> b!651466 (= e!373828 Unit!22236)))

(declare-fun lt!302810 () Unit!22232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22232)

(assert (=> b!651466 (= lt!302810 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302817 (select (arr!18497 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651466 (arrayContainsKey!0 lt!302817 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302807 () Unit!22232)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38589 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12577) Unit!22232)

(assert (=> b!651466 (= lt!302807 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12574))))

(assert (=> b!651466 (arrayNoDuplicates!0 lt!302817 #b00000000000000000000000000000000 Nil!12574)))

(declare-fun lt!302814 () Unit!22232)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38589 (_ BitVec 32) (_ BitVec 32)) Unit!22232)

(assert (=> b!651466 (= lt!302814 (lemmaNoDuplicateFromThenFromBigger!0 lt!302817 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651466 (arrayNoDuplicates!0 lt!302817 j!136 Nil!12574)))

(declare-fun lt!302809 () Unit!22232)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38589 (_ BitVec 64) (_ BitVec 32) List!12577) Unit!22232)

(assert (=> b!651466 (= lt!302809 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302817 (select (arr!18497 a!2986) j!136) j!136 Nil!12574))))

(assert (=> b!651466 false))

(declare-fun res!422414 () Bool)

(assert (=> start!59078 (=> (not res!422414) (not e!373837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59078 (= res!422414 (validMask!0 mask!3053))))

(assert (=> start!59078 e!373837))

(assert (=> start!59078 true))

(declare-fun array_inv!14380 (array!38589) Bool)

(assert (=> start!59078 (array_inv!14380 a!2986)))

(declare-fun b!651451 () Bool)

(assert (=> b!651451 (= e!373834 true)))

(assert (=> b!651451 (arrayNoDuplicates!0 lt!302817 index!984 Nil!12574)))

(declare-fun lt!302820 () Unit!22232)

(assert (=> b!651451 (= lt!302820 (lemmaNoDuplicateFromThenFromBigger!0 lt!302817 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651451 (arrayNoDuplicates!0 lt!302817 #b00000000000000000000000000000000 Nil!12574)))

(declare-fun lt!302823 () Unit!22232)

(assert (=> b!651451 (= lt!302823 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12574))))

(assert (=> b!651451 (arrayContainsKey!0 lt!302817 (select (arr!18497 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302808 () Unit!22232)

(assert (=> b!651451 (= lt!302808 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302817 (select (arr!18497 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651451 e!373832))

(declare-fun res!422409 () Bool)

(assert (=> b!651451 (=> (not res!422409) (not e!373832))))

(assert (=> b!651451 (= res!422409 (arrayContainsKey!0 lt!302817 (select (arr!18497 a!2986) j!136) j!136))))

(declare-fun b!651467 () Bool)

(assert (=> b!651467 (= e!373837 e!373833)))

(declare-fun res!422405 () Bool)

(assert (=> b!651467 (=> (not res!422405) (not e!373833))))

(declare-fun lt!302818 () SeekEntryResult!6934)

(assert (=> b!651467 (= res!422405 (or (= lt!302818 (MissingZero!6934 i!1108)) (= lt!302818 (MissingVacant!6934 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38589 (_ BitVec 32)) SeekEntryResult!6934)

(assert (=> b!651467 (= lt!302818 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651468 () Bool)

(declare-fun Unit!22237 () Unit!22232)

(assert (=> b!651468 (= e!373836 Unit!22237)))

(assert (=> b!651468 false))

(assert (= (and start!59078 res!422414) b!651456))

(assert (= (and b!651456 res!422401) b!651459))

(assert (= (and b!651459 res!422406) b!651449))

(assert (= (and b!651449 res!422411) b!651455))

(assert (= (and b!651455 res!422415) b!651467))

(assert (= (and b!651467 res!422405) b!651452))

(assert (= (and b!651452 res!422400) b!651462))

(assert (= (and b!651462 res!422408) b!651458))

(assert (= (and b!651458 res!422407) b!651457))

(assert (= (and b!651457 res!422398) b!651460))

(assert (= (and b!651460 res!422416) b!651453))

(assert (= (and b!651453 res!422399) b!651461))

(assert (= (and b!651453 c!74892) b!651468))

(assert (= (and b!651453 (not c!74892)) b!651454))

(assert (= (and b!651453 (not res!422404)) b!651464))

(assert (= (and b!651464 res!422403) b!651448))

(assert (= (and b!651448 (not res!422402)) b!651447))

(assert (= (and b!651447 res!422413) b!651463))

(assert (= (and b!651464 (not res!422412)) b!651450))

(assert (= (and b!651450 c!74891) b!651466))

(assert (= (and b!651450 (not c!74891)) b!651465))

(assert (= (and b!651450 (not res!422410)) b!651451))

(assert (= (and b!651451 res!422409) b!651446))

(declare-fun m!624111 () Bool)

(assert (=> b!651459 m!624111))

(assert (=> b!651459 m!624111))

(declare-fun m!624113 () Bool)

(assert (=> b!651459 m!624113))

(declare-fun m!624115 () Bool)

(assert (=> b!651457 m!624115))

(declare-fun m!624117 () Bool)

(assert (=> b!651457 m!624117))

(declare-fun m!624119 () Bool)

(assert (=> b!651462 m!624119))

(declare-fun m!624121 () Bool)

(assert (=> b!651452 m!624121))

(declare-fun m!624123 () Bool)

(assert (=> b!651458 m!624123))

(declare-fun m!624125 () Bool)

(assert (=> b!651453 m!624125))

(declare-fun m!624127 () Bool)

(assert (=> b!651453 m!624127))

(assert (=> b!651453 m!624115))

(assert (=> b!651453 m!624111))

(declare-fun m!624129 () Bool)

(assert (=> b!651453 m!624129))

(declare-fun m!624131 () Bool)

(assert (=> b!651453 m!624131))

(assert (=> b!651453 m!624111))

(declare-fun m!624133 () Bool)

(assert (=> b!651453 m!624133))

(declare-fun m!624135 () Bool)

(assert (=> b!651453 m!624135))

(assert (=> b!651463 m!624111))

(assert (=> b!651463 m!624111))

(declare-fun m!624137 () Bool)

(assert (=> b!651463 m!624137))

(assert (=> b!651446 m!624111))

(assert (=> b!651446 m!624111))

(assert (=> b!651446 m!624137))

(assert (=> b!651447 m!624111))

(assert (=> b!651447 m!624111))

(declare-fun m!624139 () Bool)

(assert (=> b!651447 m!624139))

(declare-fun m!624141 () Bool)

(assert (=> b!651455 m!624141))

(declare-fun m!624143 () Bool)

(assert (=> b!651467 m!624143))

(assert (=> b!651448 m!624111))

(assert (=> b!651464 m!624111))

(assert (=> b!651464 m!624115))

(declare-fun m!624145 () Bool)

(assert (=> b!651464 m!624145))

(assert (=> b!651451 m!624111))

(assert (=> b!651451 m!624111))

(assert (=> b!651451 m!624139))

(declare-fun m!624147 () Bool)

(assert (=> b!651451 m!624147))

(assert (=> b!651451 m!624111))

(declare-fun m!624149 () Bool)

(assert (=> b!651451 m!624149))

(declare-fun m!624151 () Bool)

(assert (=> b!651451 m!624151))

(declare-fun m!624153 () Bool)

(assert (=> b!651451 m!624153))

(assert (=> b!651451 m!624111))

(declare-fun m!624155 () Bool)

(assert (=> b!651451 m!624155))

(declare-fun m!624157 () Bool)

(assert (=> b!651451 m!624157))

(declare-fun m!624159 () Bool)

(assert (=> b!651466 m!624159))

(assert (=> b!651466 m!624111))

(assert (=> b!651466 m!624111))

(declare-fun m!624161 () Bool)

(assert (=> b!651466 m!624161))

(declare-fun m!624163 () Bool)

(assert (=> b!651466 m!624163))

(assert (=> b!651466 m!624111))

(declare-fun m!624165 () Bool)

(assert (=> b!651466 m!624165))

(assert (=> b!651466 m!624111))

(declare-fun m!624167 () Bool)

(assert (=> b!651466 m!624167))

(assert (=> b!651466 m!624153))

(assert (=> b!651466 m!624157))

(declare-fun m!624169 () Bool)

(assert (=> start!59078 m!624169))

(declare-fun m!624171 () Bool)

(assert (=> start!59078 m!624171))

(declare-fun m!624173 () Bool)

(assert (=> b!651460 m!624173))

(assert (=> b!651460 m!624111))

(assert (=> b!651460 m!624111))

(declare-fun m!624175 () Bool)

(assert (=> b!651460 m!624175))

(declare-fun m!624177 () Bool)

(assert (=> b!651449 m!624177))

(check-sat (not b!651455) (not b!651447) (not b!651453) (not start!59078) (not b!651463) (not b!651466) (not b!651451) (not b!651460) (not b!651459) (not b!651449) (not b!651452) (not b!651446) (not b!651467) (not b!651462))
(check-sat)
