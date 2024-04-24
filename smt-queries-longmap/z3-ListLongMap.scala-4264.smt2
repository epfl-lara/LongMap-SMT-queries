; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59382 () Bool)

(assert start!59382)

(declare-fun b!654468 () Bool)

(declare-fun e!375836 () Bool)

(declare-fun e!375833 () Bool)

(assert (=> b!654468 (= e!375836 e!375833)))

(declare-fun res!424445 () Bool)

(assert (=> b!654468 (=> (not res!424445) (not e!375833))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6913 0))(
  ( (MissingZero!6913 (index!30011 (_ BitVec 32))) (Found!6913 (index!30012 (_ BitVec 32))) (Intermediate!6913 (undefined!7725 Bool) (index!30013 (_ BitVec 32)) (x!58957 (_ BitVec 32))) (Undefined!6913) (MissingVacant!6913 (index!30014 (_ BitVec 32))) )
))
(declare-fun lt!304807 () SeekEntryResult!6913)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38640 0))(
  ( (array!38641 (arr!18517 (Array (_ BitVec 32) (_ BitVec 64))) (size!18881 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38640)

(assert (=> b!654468 (= res!424445 (and (= lt!304807 (Found!6913 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18517 a!2986) index!984) (select (arr!18517 a!2986) j!136))) (not (= (select (arr!18517 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38640 (_ BitVec 32)) SeekEntryResult!6913)

(assert (=> b!654468 (= lt!304807 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18517 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654469 () Bool)

(declare-fun res!424444 () Bool)

(declare-fun e!375829 () Bool)

(assert (=> b!654469 (=> (not res!424444) (not e!375829))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654469 (= res!424444 (validKeyInArray!0 k0!1786))))

(declare-fun b!654470 () Bool)

(declare-fun e!375837 () Bool)

(declare-fun e!375831 () Bool)

(assert (=> b!654470 (= e!375837 e!375831)))

(declare-fun res!424436 () Bool)

(assert (=> b!654470 (=> res!424436 e!375831)))

(declare-fun lt!304796 () (_ BitVec 64))

(declare-fun lt!304808 () (_ BitVec 64))

(assert (=> b!654470 (= res!424436 (or (not (= (select (arr!18517 a!2986) j!136) lt!304808)) (not (= (select (arr!18517 a!2986) j!136) lt!304796)) (bvsge j!136 index!984)))))

(declare-fun b!654471 () Bool)

(declare-fun e!375830 () Bool)

(declare-fun lt!304803 () SeekEntryResult!6913)

(assert (=> b!654471 (= e!375830 (= lt!304807 lt!304803))))

(declare-fun b!654472 () Bool)

(declare-fun res!424443 () Bool)

(declare-fun e!375825 () Bool)

(assert (=> b!654472 (=> (not res!424443) (not e!375825))))

(declare-datatypes ((List!12465 0))(
  ( (Nil!12462) (Cons!12461 (h!13509 (_ BitVec 64)) (t!18685 List!12465)) )
))
(declare-fun arrayNoDuplicates!0 (array!38640 (_ BitVec 32) List!12465) Bool)

(assert (=> b!654472 (= res!424443 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12462))))

(declare-fun b!654473 () Bool)

(assert (=> b!654473 (= e!375825 e!375836)))

(declare-fun res!424438 () Bool)

(assert (=> b!654473 (=> (not res!424438) (not e!375836))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!654473 (= res!424438 (= (select (store (arr!18517 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!304805 () array!38640)

(assert (=> b!654473 (= lt!304805 (array!38641 (store (arr!18517 a!2986) i!1108 k0!1786) (size!18881 a!2986)))))

(declare-fun b!654474 () Bool)

(declare-datatypes ((Unit!22377 0))(
  ( (Unit!22378) )
))
(declare-fun e!375823 () Unit!22377)

(declare-fun Unit!22379 () Unit!22377)

(assert (=> b!654474 (= e!375823 Unit!22379)))

(declare-fun b!654475 () Bool)

(declare-fun res!424440 () Bool)

(assert (=> b!654475 (=> (not res!424440) (not e!375829))))

(declare-fun arrayContainsKey!0 (array!38640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654475 (= res!424440 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654476 () Bool)

(declare-fun e!375832 () Bool)

(declare-fun e!375834 () Bool)

(assert (=> b!654476 (= e!375832 e!375834)))

(declare-fun res!424446 () Bool)

(assert (=> b!654476 (=> res!424446 e!375834)))

(assert (=> b!654476 (= res!424446 (or (not (= (select (arr!18517 a!2986) j!136) lt!304808)) (not (= (select (arr!18517 a!2986) j!136) lt!304796))))))

(assert (=> b!654476 e!375837))

(declare-fun res!424430 () Bool)

(assert (=> b!654476 (=> (not res!424430) (not e!375837))))

(assert (=> b!654476 (= res!424430 (= lt!304796 (select (arr!18517 a!2986) j!136)))))

(assert (=> b!654476 (= lt!304796 (select (store (arr!18517 a!2986) i!1108 k0!1786) index!984))))

(declare-fun e!375827 () Bool)

(declare-fun b!654478 () Bool)

(assert (=> b!654478 (= e!375827 (arrayContainsKey!0 lt!304805 (select (arr!18517 a!2986) j!136) index!984))))

(declare-fun b!654479 () Bool)

(declare-fun res!424437 () Bool)

(assert (=> b!654479 (=> (not res!424437) (not e!375825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38640 (_ BitVec 32)) Bool)

(assert (=> b!654479 (= res!424437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654480 () Bool)

(declare-fun e!375826 () Bool)

(assert (=> b!654480 (= e!375826 true)))

(assert (=> b!654480 false))

(declare-fun lt!304799 () Unit!22377)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38640 (_ BitVec 64) (_ BitVec 32) List!12465) Unit!22377)

(assert (=> b!654480 (= lt!304799 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304805 (select (arr!18517 a!2986) j!136) index!984 Nil!12462))))

(assert (=> b!654480 (arrayNoDuplicates!0 lt!304805 index!984 Nil!12462)))

(declare-fun lt!304797 () Unit!22377)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38640 (_ BitVec 32) (_ BitVec 32)) Unit!22377)

(assert (=> b!654480 (= lt!304797 (lemmaNoDuplicateFromThenFromBigger!0 lt!304805 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654480 (arrayNoDuplicates!0 lt!304805 #b00000000000000000000000000000000 Nil!12462)))

(declare-fun lt!304804 () Unit!22377)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12465) Unit!22377)

(assert (=> b!654480 (= lt!304804 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12462))))

(assert (=> b!654480 (arrayContainsKey!0 lt!304805 (select (arr!18517 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304795 () Unit!22377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22377)

(assert (=> b!654480 (= lt!304795 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304805 (select (arr!18517 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!375828 () Bool)

(assert (=> b!654480 e!375828))

(declare-fun res!424441 () Bool)

(assert (=> b!654480 (=> (not res!424441) (not e!375828))))

(assert (=> b!654480 (= res!424441 (arrayContainsKey!0 lt!304805 (select (arr!18517 a!2986) j!136) j!136))))

(declare-fun b!654481 () Bool)

(assert (=> b!654481 (= e!375829 e!375825)))

(declare-fun res!424435 () Bool)

(assert (=> b!654481 (=> (not res!424435) (not e!375825))))

(declare-fun lt!304810 () SeekEntryResult!6913)

(assert (=> b!654481 (= res!424435 (or (= lt!304810 (MissingZero!6913 i!1108)) (= lt!304810 (MissingVacant!6913 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38640 (_ BitVec 32)) SeekEntryResult!6913)

(assert (=> b!654481 (= lt!304810 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654482 () Bool)

(declare-fun e!375824 () Unit!22377)

(declare-fun Unit!22380 () Unit!22377)

(assert (=> b!654482 (= e!375824 Unit!22380)))

(declare-fun b!654483 () Bool)

(assert (=> b!654483 (= e!375831 e!375827)))

(declare-fun res!424429 () Bool)

(assert (=> b!654483 (=> (not res!424429) (not e!375827))))

(assert (=> b!654483 (= res!424429 (arrayContainsKey!0 lt!304805 (select (arr!18517 a!2986) j!136) j!136))))

(declare-fun b!654484 () Bool)

(declare-fun res!424447 () Bool)

(assert (=> b!654484 (=> (not res!424447) (not e!375829))))

(assert (=> b!654484 (= res!424447 (and (= (size!18881 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18881 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18881 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654485 () Bool)

(declare-fun res!424442 () Bool)

(assert (=> b!654485 (=> (not res!424442) (not e!375829))))

(assert (=> b!654485 (= res!424442 (validKeyInArray!0 (select (arr!18517 a!2986) j!136)))))

(declare-fun b!654486 () Bool)

(assert (=> b!654486 (= e!375828 (arrayContainsKey!0 lt!304805 (select (arr!18517 a!2986) j!136) index!984))))

(declare-fun b!654487 () Bool)

(declare-fun Unit!22381 () Unit!22377)

(assert (=> b!654487 (= e!375824 Unit!22381)))

(declare-fun lt!304802 () Unit!22377)

(assert (=> b!654487 (= lt!304802 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304805 (select (arr!18517 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654487 (arrayContainsKey!0 lt!304805 (select (arr!18517 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304801 () Unit!22377)

(assert (=> b!654487 (= lt!304801 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12462))))

(assert (=> b!654487 (arrayNoDuplicates!0 lt!304805 #b00000000000000000000000000000000 Nil!12462)))

(declare-fun lt!304806 () Unit!22377)

(assert (=> b!654487 (= lt!304806 (lemmaNoDuplicateFromThenFromBigger!0 lt!304805 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654487 (arrayNoDuplicates!0 lt!304805 j!136 Nil!12462)))

(declare-fun lt!304792 () Unit!22377)

(assert (=> b!654487 (= lt!304792 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304805 (select (arr!18517 a!2986) j!136) j!136 Nil!12462))))

(assert (=> b!654487 false))

(declare-fun b!654488 () Bool)

(assert (=> b!654488 (= e!375833 (not e!375832))))

(declare-fun res!424439 () Bool)

(assert (=> b!654488 (=> res!424439 e!375832)))

(declare-fun lt!304798 () SeekEntryResult!6913)

(assert (=> b!654488 (= res!424439 (not (= lt!304798 (Found!6913 index!984))))))

(declare-fun lt!304809 () Unit!22377)

(assert (=> b!654488 (= lt!304809 e!375823)))

(declare-fun c!75388 () Bool)

(assert (=> b!654488 (= c!75388 (= lt!304798 Undefined!6913))))

(assert (=> b!654488 (= lt!304798 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304808 lt!304805 mask!3053))))

(assert (=> b!654488 e!375830))

(declare-fun res!424431 () Bool)

(assert (=> b!654488 (=> (not res!424431) (not e!375830))))

(declare-fun lt!304793 () (_ BitVec 32))

(assert (=> b!654488 (= res!424431 (= lt!304803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304793 vacantSpotIndex!68 lt!304808 lt!304805 mask!3053)))))

(assert (=> b!654488 (= lt!304803 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304793 vacantSpotIndex!68 (select (arr!18517 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654488 (= lt!304808 (select (store (arr!18517 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304794 () Unit!22377)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38640 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22377)

(assert (=> b!654488 (= lt!304794 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304793 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654488 (= lt!304793 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!424434 () Bool)

(assert (=> start!59382 (=> (not res!424434) (not e!375829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59382 (= res!424434 (validMask!0 mask!3053))))

(assert (=> start!59382 e!375829))

(assert (=> start!59382 true))

(declare-fun array_inv!14376 (array!38640) Bool)

(assert (=> start!59382 (array_inv!14376 a!2986)))

(declare-fun b!654477 () Bool)

(declare-fun Unit!22382 () Unit!22377)

(assert (=> b!654477 (= e!375823 Unit!22382)))

(assert (=> b!654477 false))

(declare-fun b!654489 () Bool)

(assert (=> b!654489 (= e!375834 e!375826)))

(declare-fun res!424432 () Bool)

(assert (=> b!654489 (=> res!424432 e!375826)))

(assert (=> b!654489 (= res!424432 (bvsge index!984 j!136))))

(declare-fun lt!304800 () Unit!22377)

(assert (=> b!654489 (= lt!304800 e!375824)))

(declare-fun c!75389 () Bool)

(assert (=> b!654489 (= c!75389 (bvslt j!136 index!984))))

(declare-fun b!654490 () Bool)

(declare-fun res!424433 () Bool)

(assert (=> b!654490 (=> (not res!424433) (not e!375825))))

(assert (=> b!654490 (= res!424433 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18517 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59382 res!424434) b!654484))

(assert (= (and b!654484 res!424447) b!654485))

(assert (= (and b!654485 res!424442) b!654469))

(assert (= (and b!654469 res!424444) b!654475))

(assert (= (and b!654475 res!424440) b!654481))

(assert (= (and b!654481 res!424435) b!654479))

(assert (= (and b!654479 res!424437) b!654472))

(assert (= (and b!654472 res!424443) b!654490))

(assert (= (and b!654490 res!424433) b!654473))

(assert (= (and b!654473 res!424438) b!654468))

(assert (= (and b!654468 res!424445) b!654488))

(assert (= (and b!654488 res!424431) b!654471))

(assert (= (and b!654488 c!75388) b!654477))

(assert (= (and b!654488 (not c!75388)) b!654474))

(assert (= (and b!654488 (not res!424439)) b!654476))

(assert (= (and b!654476 res!424430) b!654470))

(assert (= (and b!654470 (not res!424436)) b!654483))

(assert (= (and b!654483 res!424429) b!654478))

(assert (= (and b!654476 (not res!424446)) b!654489))

(assert (= (and b!654489 c!75389) b!654487))

(assert (= (and b!654489 (not c!75389)) b!654482))

(assert (= (and b!654489 (not res!424432)) b!654480))

(assert (= (and b!654480 res!424441) b!654486))

(declare-fun m!628027 () Bool)

(assert (=> b!654486 m!628027))

(assert (=> b!654486 m!628027))

(declare-fun m!628029 () Bool)

(assert (=> b!654486 m!628029))

(assert (=> b!654478 m!628027))

(assert (=> b!654478 m!628027))

(assert (=> b!654478 m!628029))

(assert (=> b!654483 m!628027))

(assert (=> b!654483 m!628027))

(declare-fun m!628031 () Bool)

(assert (=> b!654483 m!628031))

(assert (=> b!654470 m!628027))

(declare-fun m!628033 () Bool)

(assert (=> b!654472 m!628033))

(declare-fun m!628035 () Bool)

(assert (=> b!654475 m!628035))

(declare-fun m!628037 () Bool)

(assert (=> b!654473 m!628037))

(declare-fun m!628039 () Bool)

(assert (=> b!654473 m!628039))

(assert (=> b!654476 m!628027))

(assert (=> b!654476 m!628037))

(declare-fun m!628041 () Bool)

(assert (=> b!654476 m!628041))

(assert (=> b!654487 m!628027))

(assert (=> b!654487 m!628027))

(declare-fun m!628043 () Bool)

(assert (=> b!654487 m!628043))

(assert (=> b!654487 m!628027))

(declare-fun m!628045 () Bool)

(assert (=> b!654487 m!628045))

(declare-fun m!628047 () Bool)

(assert (=> b!654487 m!628047))

(assert (=> b!654487 m!628027))

(declare-fun m!628049 () Bool)

(assert (=> b!654487 m!628049))

(declare-fun m!628051 () Bool)

(assert (=> b!654487 m!628051))

(declare-fun m!628053 () Bool)

(assert (=> b!654487 m!628053))

(declare-fun m!628055 () Bool)

(assert (=> b!654487 m!628055))

(assert (=> b!654485 m!628027))

(assert (=> b!654485 m!628027))

(declare-fun m!628057 () Bool)

(assert (=> b!654485 m!628057))

(declare-fun m!628059 () Bool)

(assert (=> b!654479 m!628059))

(declare-fun m!628061 () Bool)

(assert (=> b!654469 m!628061))

(declare-fun m!628063 () Bool)

(assert (=> b!654468 m!628063))

(assert (=> b!654468 m!628027))

(assert (=> b!654468 m!628027))

(declare-fun m!628065 () Bool)

(assert (=> b!654468 m!628065))

(declare-fun m!628067 () Bool)

(assert (=> b!654490 m!628067))

(declare-fun m!628069 () Bool)

(assert (=> b!654481 m!628069))

(assert (=> b!654480 m!628027))

(assert (=> b!654480 m!628053))

(assert (=> b!654480 m!628027))

(declare-fun m!628071 () Bool)

(assert (=> b!654480 m!628071))

(assert (=> b!654480 m!628027))

(declare-fun m!628073 () Bool)

(assert (=> b!654480 m!628073))

(declare-fun m!628075 () Bool)

(assert (=> b!654480 m!628075))

(declare-fun m!628077 () Bool)

(assert (=> b!654480 m!628077))

(assert (=> b!654480 m!628051))

(assert (=> b!654480 m!628027))

(declare-fun m!628079 () Bool)

(assert (=> b!654480 m!628079))

(assert (=> b!654480 m!628027))

(assert (=> b!654480 m!628031))

(declare-fun m!628081 () Bool)

(assert (=> start!59382 m!628081))

(declare-fun m!628083 () Bool)

(assert (=> start!59382 m!628083))

(declare-fun m!628085 () Bool)

(assert (=> b!654488 m!628085))

(declare-fun m!628087 () Bool)

(assert (=> b!654488 m!628087))

(assert (=> b!654488 m!628027))

(declare-fun m!628089 () Bool)

(assert (=> b!654488 m!628089))

(assert (=> b!654488 m!628037))

(declare-fun m!628091 () Bool)

(assert (=> b!654488 m!628091))

(assert (=> b!654488 m!628027))

(declare-fun m!628093 () Bool)

(assert (=> b!654488 m!628093))

(declare-fun m!628095 () Bool)

(assert (=> b!654488 m!628095))

(check-sat (not b!654488) (not start!59382) (not b!654469) (not b!654468) (not b!654481) (not b!654487) (not b!654486) (not b!654479) (not b!654475) (not b!654478) (not b!654480) (not b!654483) (not b!654472) (not b!654485))
(check-sat)
