; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57780 () Bool)

(assert start!57780)

(declare-fun b!638818 () Bool)

(declare-fun e!365558 () Bool)

(declare-fun e!365559 () Bool)

(assert (=> b!638818 (= e!365558 e!365559)))

(declare-fun res!413522 () Bool)

(assert (=> b!638818 (=> res!413522 e!365559)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295456 () (_ BitVec 64))

(declare-fun lt!295457 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38289 0))(
  ( (array!38290 (arr!18364 (Array (_ BitVec 32) (_ BitVec 64))) (size!18728 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38289)

(assert (=> b!638818 (= res!413522 (or (not (= (select (arr!18364 a!2986) j!136) lt!295457)) (not (= (select (arr!18364 a!2986) j!136) lt!295456)) (bvsge j!136 index!984)))))

(declare-fun b!638819 () Bool)

(declare-fun e!365561 () Bool)

(declare-fun e!365560 () Bool)

(assert (=> b!638819 (= e!365561 e!365560)))

(declare-fun res!413516 () Bool)

(assert (=> b!638819 (=> res!413516 e!365560)))

(assert (=> b!638819 (= res!413516 (or (not (= (select (arr!18364 a!2986) j!136) lt!295457)) (not (= (select (arr!18364 a!2986) j!136) lt!295456)) (bvsge j!136 index!984)))))

(assert (=> b!638819 e!365558))

(declare-fun res!413527 () Bool)

(assert (=> b!638819 (=> (not res!413527) (not e!365558))))

(assert (=> b!638819 (= res!413527 (= lt!295456 (select (arr!18364 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!638819 (= lt!295456 (select (store (arr!18364 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!638820 () Bool)

(declare-fun e!365563 () Bool)

(declare-fun e!365556 () Bool)

(assert (=> b!638820 (= e!365563 e!365556)))

(declare-fun res!413518 () Bool)

(assert (=> b!638820 (=> (not res!413518) (not e!365556))))

(declare-datatypes ((SeekEntryResult!6760 0))(
  ( (MissingZero!6760 (index!29354 (_ BitVec 32))) (Found!6760 (index!29355 (_ BitVec 32))) (Intermediate!6760 (undefined!7572 Bool) (index!29356 (_ BitVec 32)) (x!58261 (_ BitVec 32))) (Undefined!6760) (MissingVacant!6760 (index!29357 (_ BitVec 32))) )
))
(declare-fun lt!295452 () SeekEntryResult!6760)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638820 (= res!413518 (and (= lt!295452 (Found!6760 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18364 a!2986) index!984) (select (arr!18364 a!2986) j!136))) (not (= (select (arr!18364 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38289 (_ BitVec 32)) SeekEntryResult!6760)

(assert (=> b!638820 (= lt!295452 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638821 () Bool)

(declare-fun res!413526 () Bool)

(declare-fun e!365557 () Bool)

(assert (=> b!638821 (=> (not res!413526) (not e!365557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638821 (= res!413526 (validKeyInArray!0 k0!1786))))

(declare-fun b!638823 () Bool)

(declare-fun e!365554 () Bool)

(assert (=> b!638823 (= e!365559 e!365554)))

(declare-fun res!413519 () Bool)

(assert (=> b!638823 (=> (not res!413519) (not e!365554))))

(declare-fun lt!295460 () array!38289)

(declare-fun arrayContainsKey!0 (array!38289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638823 (= res!413519 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) j!136))))

(declare-fun b!638824 () Bool)

(assert (=> b!638824 (= e!365560 (bvslt (size!18728 a!2986) #b01111111111111111111111111111111))))

(declare-datatypes ((List!12312 0))(
  ( (Nil!12309) (Cons!12308 (h!13356 (_ BitVec 64)) (t!18532 List!12312)) )
))
(declare-fun arrayNoDuplicates!0 (array!38289 (_ BitVec 32) List!12312) Bool)

(assert (=> b!638824 (arrayNoDuplicates!0 lt!295460 #b00000000000000000000000000000000 Nil!12309)))

(declare-datatypes ((Unit!21549 0))(
  ( (Unit!21550) )
))
(declare-fun lt!295458 () Unit!21549)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12312) Unit!21549)

(assert (=> b!638824 (= lt!295458 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12309))))

(assert (=> b!638824 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295459 () Unit!21549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21549)

(assert (=> b!638824 (= lt!295459 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295460 (select (arr!18364 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638825 () Bool)

(declare-fun e!365562 () Unit!21549)

(declare-fun Unit!21551 () Unit!21549)

(assert (=> b!638825 (= e!365562 Unit!21551)))

(declare-fun b!638826 () Bool)

(declare-fun res!413524 () Bool)

(declare-fun e!365565 () Bool)

(assert (=> b!638826 (=> (not res!413524) (not e!365565))))

(assert (=> b!638826 (= res!413524 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18364 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638827 () Bool)

(declare-fun Unit!21552 () Unit!21549)

(assert (=> b!638827 (= e!365562 Unit!21552)))

(assert (=> b!638827 false))

(declare-fun b!638828 () Bool)

(declare-fun res!413512 () Bool)

(assert (=> b!638828 (=> (not res!413512) (not e!365557))))

(assert (=> b!638828 (= res!413512 (validKeyInArray!0 (select (arr!18364 a!2986) j!136)))))

(declare-fun b!638829 () Bool)

(assert (=> b!638829 (= e!365556 (not e!365561))))

(declare-fun res!413525 () Bool)

(assert (=> b!638829 (=> res!413525 e!365561)))

(declare-fun lt!295462 () SeekEntryResult!6760)

(assert (=> b!638829 (= res!413525 (not (= lt!295462 (Found!6760 index!984))))))

(declare-fun lt!295454 () Unit!21549)

(assert (=> b!638829 (= lt!295454 e!365562)))

(declare-fun c!73022 () Bool)

(assert (=> b!638829 (= c!73022 (= lt!295462 Undefined!6760))))

(assert (=> b!638829 (= lt!295462 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295457 lt!295460 mask!3053))))

(declare-fun e!365564 () Bool)

(assert (=> b!638829 e!365564))

(declare-fun res!413521 () Bool)

(assert (=> b!638829 (=> (not res!413521) (not e!365564))))

(declare-fun lt!295451 () SeekEntryResult!6760)

(declare-fun lt!295461 () (_ BitVec 32))

(assert (=> b!638829 (= res!413521 (= lt!295451 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 lt!295457 lt!295460 mask!3053)))))

(assert (=> b!638829 (= lt!295451 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638829 (= lt!295457 (select (store (arr!18364 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295453 () Unit!21549)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21549)

(assert (=> b!638829 (= lt!295453 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638829 (= lt!295461 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!638830 () Bool)

(assert (=> b!638830 (= e!365557 e!365565)))

(declare-fun res!413513 () Bool)

(assert (=> b!638830 (=> (not res!413513) (not e!365565))))

(declare-fun lt!295455 () SeekEntryResult!6760)

(assert (=> b!638830 (= res!413513 (or (= lt!295455 (MissingZero!6760 i!1108)) (= lt!295455 (MissingVacant!6760 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38289 (_ BitVec 32)) SeekEntryResult!6760)

(assert (=> b!638830 (= lt!295455 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!638831 () Bool)

(declare-fun res!413515 () Bool)

(assert (=> b!638831 (=> (not res!413515) (not e!365557))))

(assert (=> b!638831 (= res!413515 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!413523 () Bool)

(assert (=> start!57780 (=> (not res!413523) (not e!365557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57780 (= res!413523 (validMask!0 mask!3053))))

(assert (=> start!57780 e!365557))

(assert (=> start!57780 true))

(declare-fun array_inv!14223 (array!38289) Bool)

(assert (=> start!57780 (array_inv!14223 a!2986)))

(declare-fun b!638822 () Bool)

(declare-fun res!413514 () Bool)

(assert (=> b!638822 (=> (not res!413514) (not e!365557))))

(assert (=> b!638822 (= res!413514 (and (= (size!18728 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18728 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18728 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638832 () Bool)

(declare-fun res!413520 () Bool)

(assert (=> b!638832 (=> (not res!413520) (not e!365565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38289 (_ BitVec 32)) Bool)

(assert (=> b!638832 (= res!413520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638833 () Bool)

(declare-fun res!413511 () Bool)

(assert (=> b!638833 (=> (not res!413511) (not e!365565))))

(assert (=> b!638833 (= res!413511 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12309))))

(declare-fun b!638834 () Bool)

(assert (=> b!638834 (= e!365554 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) index!984))))

(declare-fun b!638835 () Bool)

(assert (=> b!638835 (= e!365565 e!365563)))

(declare-fun res!413517 () Bool)

(assert (=> b!638835 (=> (not res!413517) (not e!365563))))

(assert (=> b!638835 (= res!413517 (= (select (store (arr!18364 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638835 (= lt!295460 (array!38290 (store (arr!18364 a!2986) i!1108 k0!1786) (size!18728 a!2986)))))

(declare-fun b!638836 () Bool)

(assert (=> b!638836 (= e!365564 (= lt!295452 lt!295451))))

(assert (= (and start!57780 res!413523) b!638822))

(assert (= (and b!638822 res!413514) b!638828))

(assert (= (and b!638828 res!413512) b!638821))

(assert (= (and b!638821 res!413526) b!638831))

(assert (= (and b!638831 res!413515) b!638830))

(assert (= (and b!638830 res!413513) b!638832))

(assert (= (and b!638832 res!413520) b!638833))

(assert (= (and b!638833 res!413511) b!638826))

(assert (= (and b!638826 res!413524) b!638835))

(assert (= (and b!638835 res!413517) b!638820))

(assert (= (and b!638820 res!413518) b!638829))

(assert (= (and b!638829 res!413521) b!638836))

(assert (= (and b!638829 c!73022) b!638827))

(assert (= (and b!638829 (not c!73022)) b!638825))

(assert (= (and b!638829 (not res!413525)) b!638819))

(assert (= (and b!638819 res!413527) b!638818))

(assert (= (and b!638818 (not res!413522)) b!638823))

(assert (= (and b!638823 res!413519) b!638834))

(assert (= (and b!638819 (not res!413516)) b!638824))

(declare-fun m!613105 () Bool)

(assert (=> b!638830 m!613105))

(declare-fun m!613107 () Bool)

(assert (=> start!57780 m!613107))

(declare-fun m!613109 () Bool)

(assert (=> start!57780 m!613109))

(declare-fun m!613111 () Bool)

(assert (=> b!638833 m!613111))

(declare-fun m!613113 () Bool)

(assert (=> b!638834 m!613113))

(assert (=> b!638834 m!613113))

(declare-fun m!613115 () Bool)

(assert (=> b!638834 m!613115))

(assert (=> b!638828 m!613113))

(assert (=> b!638828 m!613113))

(declare-fun m!613117 () Bool)

(assert (=> b!638828 m!613117))

(declare-fun m!613119 () Bool)

(assert (=> b!638835 m!613119))

(declare-fun m!613121 () Bool)

(assert (=> b!638835 m!613121))

(declare-fun m!613123 () Bool)

(assert (=> b!638826 m!613123))

(declare-fun m!613125 () Bool)

(assert (=> b!638821 m!613125))

(assert (=> b!638819 m!613113))

(assert (=> b!638819 m!613119))

(declare-fun m!613127 () Bool)

(assert (=> b!638819 m!613127))

(assert (=> b!638823 m!613113))

(assert (=> b!638823 m!613113))

(declare-fun m!613129 () Bool)

(assert (=> b!638823 m!613129))

(assert (=> b!638818 m!613113))

(declare-fun m!613131 () Bool)

(assert (=> b!638820 m!613131))

(assert (=> b!638820 m!613113))

(assert (=> b!638820 m!613113))

(declare-fun m!613133 () Bool)

(assert (=> b!638820 m!613133))

(declare-fun m!613135 () Bool)

(assert (=> b!638831 m!613135))

(declare-fun m!613137 () Bool)

(assert (=> b!638832 m!613137))

(assert (=> b!638829 m!613113))

(declare-fun m!613139 () Bool)

(assert (=> b!638829 m!613139))

(declare-fun m!613141 () Bool)

(assert (=> b!638829 m!613141))

(declare-fun m!613143 () Bool)

(assert (=> b!638829 m!613143))

(assert (=> b!638829 m!613113))

(declare-fun m!613145 () Bool)

(assert (=> b!638829 m!613145))

(assert (=> b!638829 m!613119))

(declare-fun m!613147 () Bool)

(assert (=> b!638829 m!613147))

(declare-fun m!613149 () Bool)

(assert (=> b!638829 m!613149))

(assert (=> b!638824 m!613113))

(assert (=> b!638824 m!613113))

(declare-fun m!613151 () Bool)

(assert (=> b!638824 m!613151))

(declare-fun m!613153 () Bool)

(assert (=> b!638824 m!613153))

(assert (=> b!638824 m!613113))

(declare-fun m!613155 () Bool)

(assert (=> b!638824 m!613155))

(declare-fun m!613157 () Bool)

(assert (=> b!638824 m!613157))

(check-sat (not b!638830) (not b!638828) (not b!638832) (not b!638820) (not b!638833) (not b!638834) (not b!638824) (not b!638831) (not start!57780) (not b!638829) (not b!638823) (not b!638821))
(check-sat)
(get-model)

(declare-fun d!90335 () Bool)

(declare-fun e!365640 () Bool)

(assert (=> d!90335 e!365640))

(declare-fun res!413632 () Bool)

(assert (=> d!90335 (=> (not res!413632) (not e!365640))))

(assert (=> d!90335 (= res!413632 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18728 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18728 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18728 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18728 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18728 a!2986))))))

(declare-fun lt!295537 () Unit!21549)

(declare-fun choose!9 (array!38289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21549)

(assert (=> d!90335 (= lt!295537 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90335 (validMask!0 mask!3053)))

(assert (=> d!90335 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 mask!3053) lt!295537)))

(declare-fun b!638953 () Bool)

(assert (=> b!638953 (= e!365640 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 (select (store (arr!18364 a!2986) i!1108 k0!1786) j!136) (array!38290 (store (arr!18364 a!2986) i!1108 k0!1786) (size!18728 a!2986)) mask!3053)))))

(assert (= (and d!90335 res!413632) b!638953))

(declare-fun m!613267 () Bool)

(assert (=> d!90335 m!613267))

(assert (=> d!90335 m!613107))

(assert (=> b!638953 m!613113))

(assert (=> b!638953 m!613113))

(assert (=> b!638953 m!613139))

(assert (=> b!638953 m!613143))

(declare-fun m!613269 () Bool)

(assert (=> b!638953 m!613269))

(assert (=> b!638953 m!613143))

(assert (=> b!638953 m!613119))

(assert (=> b!638829 d!90335))

(declare-fun b!638966 () Bool)

(declare-fun c!73035 () Bool)

(declare-fun lt!295542 () (_ BitVec 64))

(assert (=> b!638966 (= c!73035 (= lt!295542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!365647 () SeekEntryResult!6760)

(declare-fun e!365649 () SeekEntryResult!6760)

(assert (=> b!638966 (= e!365647 e!365649)))

(declare-fun b!638967 () Bool)

(declare-fun e!365648 () SeekEntryResult!6760)

(assert (=> b!638967 (= e!365648 e!365647)))

(declare-fun c!73036 () Bool)

(assert (=> b!638967 (= c!73036 (= lt!295542 (select (arr!18364 a!2986) j!136)))))

(declare-fun b!638968 () Bool)

(assert (=> b!638968 (= e!365648 Undefined!6760)))

(declare-fun b!638969 () Bool)

(assert (=> b!638969 (= e!365647 (Found!6760 lt!295461))))

(declare-fun b!638970 () Bool)

(assert (=> b!638970 (= e!365649 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295461 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!90337 () Bool)

(declare-fun lt!295543 () SeekEntryResult!6760)

(get-info :version)

(assert (=> d!90337 (and (or ((_ is Undefined!6760) lt!295543) (not ((_ is Found!6760) lt!295543)) (and (bvsge (index!29355 lt!295543) #b00000000000000000000000000000000) (bvslt (index!29355 lt!295543) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295543) ((_ is Found!6760) lt!295543) (not ((_ is MissingVacant!6760) lt!295543)) (not (= (index!29357 lt!295543) vacantSpotIndex!68)) (and (bvsge (index!29357 lt!295543) #b00000000000000000000000000000000) (bvslt (index!29357 lt!295543) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295543) (ite ((_ is Found!6760) lt!295543) (= (select (arr!18364 a!2986) (index!29355 lt!295543)) (select (arr!18364 a!2986) j!136)) (and ((_ is MissingVacant!6760) lt!295543) (= (index!29357 lt!295543) vacantSpotIndex!68) (= (select (arr!18364 a!2986) (index!29357 lt!295543)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90337 (= lt!295543 e!365648)))

(declare-fun c!73037 () Bool)

(assert (=> d!90337 (= c!73037 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90337 (= lt!295542 (select (arr!18364 a!2986) lt!295461))))

(assert (=> d!90337 (validMask!0 mask!3053)))

(assert (=> d!90337 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053) lt!295543)))

(declare-fun b!638971 () Bool)

(assert (=> b!638971 (= e!365649 (MissingVacant!6760 vacantSpotIndex!68))))

(assert (= (and d!90337 c!73037) b!638968))

(assert (= (and d!90337 (not c!73037)) b!638967))

(assert (= (and b!638967 c!73036) b!638969))

(assert (= (and b!638967 (not c!73036)) b!638966))

(assert (= (and b!638966 c!73035) b!638971))

(assert (= (and b!638966 (not c!73035)) b!638970))

(declare-fun m!613271 () Bool)

(assert (=> b!638970 m!613271))

(assert (=> b!638970 m!613271))

(assert (=> b!638970 m!613113))

(declare-fun m!613273 () Bool)

(assert (=> b!638970 m!613273))

(declare-fun m!613275 () Bool)

(assert (=> d!90337 m!613275))

(declare-fun m!613277 () Bool)

(assert (=> d!90337 m!613277))

(declare-fun m!613279 () Bool)

(assert (=> d!90337 m!613279))

(assert (=> d!90337 m!613107))

(assert (=> b!638829 d!90337))

(declare-fun b!638972 () Bool)

(declare-fun c!73038 () Bool)

(declare-fun lt!295544 () (_ BitVec 64))

(assert (=> b!638972 (= c!73038 (= lt!295544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!365650 () SeekEntryResult!6760)

(declare-fun e!365652 () SeekEntryResult!6760)

(assert (=> b!638972 (= e!365650 e!365652)))

(declare-fun b!638973 () Bool)

(declare-fun e!365651 () SeekEntryResult!6760)

(assert (=> b!638973 (= e!365651 e!365650)))

(declare-fun c!73039 () Bool)

(assert (=> b!638973 (= c!73039 (= lt!295544 lt!295457))))

(declare-fun b!638974 () Bool)

(assert (=> b!638974 (= e!365651 Undefined!6760)))

(declare-fun b!638975 () Bool)

(assert (=> b!638975 (= e!365650 (Found!6760 lt!295461))))

(declare-fun b!638976 () Bool)

(assert (=> b!638976 (= e!365652 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295461 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!295457 lt!295460 mask!3053))))

(declare-fun d!90339 () Bool)

(declare-fun lt!295545 () SeekEntryResult!6760)

(assert (=> d!90339 (and (or ((_ is Undefined!6760) lt!295545) (not ((_ is Found!6760) lt!295545)) (and (bvsge (index!29355 lt!295545) #b00000000000000000000000000000000) (bvslt (index!29355 lt!295545) (size!18728 lt!295460)))) (or ((_ is Undefined!6760) lt!295545) ((_ is Found!6760) lt!295545) (not ((_ is MissingVacant!6760) lt!295545)) (not (= (index!29357 lt!295545) vacantSpotIndex!68)) (and (bvsge (index!29357 lt!295545) #b00000000000000000000000000000000) (bvslt (index!29357 lt!295545) (size!18728 lt!295460)))) (or ((_ is Undefined!6760) lt!295545) (ite ((_ is Found!6760) lt!295545) (= (select (arr!18364 lt!295460) (index!29355 lt!295545)) lt!295457) (and ((_ is MissingVacant!6760) lt!295545) (= (index!29357 lt!295545) vacantSpotIndex!68) (= (select (arr!18364 lt!295460) (index!29357 lt!295545)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90339 (= lt!295545 e!365651)))

(declare-fun c!73040 () Bool)

(assert (=> d!90339 (= c!73040 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90339 (= lt!295544 (select (arr!18364 lt!295460) lt!295461))))

(assert (=> d!90339 (validMask!0 mask!3053)))

(assert (=> d!90339 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295461 vacantSpotIndex!68 lt!295457 lt!295460 mask!3053) lt!295545)))

(declare-fun b!638977 () Bool)

(assert (=> b!638977 (= e!365652 (MissingVacant!6760 vacantSpotIndex!68))))

(assert (= (and d!90339 c!73040) b!638974))

(assert (= (and d!90339 (not c!73040)) b!638973))

(assert (= (and b!638973 c!73039) b!638975))

(assert (= (and b!638973 (not c!73039)) b!638972))

(assert (= (and b!638972 c!73038) b!638977))

(assert (= (and b!638972 (not c!73038)) b!638976))

(assert (=> b!638976 m!613271))

(assert (=> b!638976 m!613271))

(declare-fun m!613281 () Bool)

(assert (=> b!638976 m!613281))

(declare-fun m!613283 () Bool)

(assert (=> d!90339 m!613283))

(declare-fun m!613285 () Bool)

(assert (=> d!90339 m!613285))

(declare-fun m!613287 () Bool)

(assert (=> d!90339 m!613287))

(assert (=> d!90339 m!613107))

(assert (=> b!638829 d!90339))

(declare-fun b!638978 () Bool)

(declare-fun c!73041 () Bool)

(declare-fun lt!295546 () (_ BitVec 64))

(assert (=> b!638978 (= c!73041 (= lt!295546 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!365653 () SeekEntryResult!6760)

(declare-fun e!365655 () SeekEntryResult!6760)

(assert (=> b!638978 (= e!365653 e!365655)))

(declare-fun b!638979 () Bool)

(declare-fun e!365654 () SeekEntryResult!6760)

(assert (=> b!638979 (= e!365654 e!365653)))

(declare-fun c!73042 () Bool)

(assert (=> b!638979 (= c!73042 (= lt!295546 lt!295457))))

(declare-fun b!638980 () Bool)

(assert (=> b!638980 (= e!365654 Undefined!6760)))

(declare-fun b!638981 () Bool)

(assert (=> b!638981 (= e!365653 (Found!6760 index!984))))

(declare-fun b!638982 () Bool)

(assert (=> b!638982 (= e!365655 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!295457 lt!295460 mask!3053))))

(declare-fun d!90341 () Bool)

(declare-fun lt!295547 () SeekEntryResult!6760)

(assert (=> d!90341 (and (or ((_ is Undefined!6760) lt!295547) (not ((_ is Found!6760) lt!295547)) (and (bvsge (index!29355 lt!295547) #b00000000000000000000000000000000) (bvslt (index!29355 lt!295547) (size!18728 lt!295460)))) (or ((_ is Undefined!6760) lt!295547) ((_ is Found!6760) lt!295547) (not ((_ is MissingVacant!6760) lt!295547)) (not (= (index!29357 lt!295547) vacantSpotIndex!68)) (and (bvsge (index!29357 lt!295547) #b00000000000000000000000000000000) (bvslt (index!29357 lt!295547) (size!18728 lt!295460)))) (or ((_ is Undefined!6760) lt!295547) (ite ((_ is Found!6760) lt!295547) (= (select (arr!18364 lt!295460) (index!29355 lt!295547)) lt!295457) (and ((_ is MissingVacant!6760) lt!295547) (= (index!29357 lt!295547) vacantSpotIndex!68) (= (select (arr!18364 lt!295460) (index!29357 lt!295547)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90341 (= lt!295547 e!365654)))

(declare-fun c!73043 () Bool)

(assert (=> d!90341 (= c!73043 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90341 (= lt!295546 (select (arr!18364 lt!295460) index!984))))

(assert (=> d!90341 (validMask!0 mask!3053)))

(assert (=> d!90341 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295457 lt!295460 mask!3053) lt!295547)))

(declare-fun b!638983 () Bool)

(assert (=> b!638983 (= e!365655 (MissingVacant!6760 vacantSpotIndex!68))))

(assert (= (and d!90341 c!73043) b!638980))

(assert (= (and d!90341 (not c!73043)) b!638979))

(assert (= (and b!638979 c!73042) b!638981))

(assert (= (and b!638979 (not c!73042)) b!638978))

(assert (= (and b!638978 c!73041) b!638983))

(assert (= (and b!638978 (not c!73041)) b!638982))

(declare-fun m!613289 () Bool)

(assert (=> b!638982 m!613289))

(assert (=> b!638982 m!613289))

(declare-fun m!613291 () Bool)

(assert (=> b!638982 m!613291))

(declare-fun m!613293 () Bool)

(assert (=> d!90341 m!613293))

(declare-fun m!613295 () Bool)

(assert (=> d!90341 m!613295))

(declare-fun m!613297 () Bool)

(assert (=> d!90341 m!613297))

(assert (=> d!90341 m!613107))

(assert (=> b!638829 d!90341))

(declare-fun d!90343 () Bool)

(declare-fun lt!295550 () (_ BitVec 32))

(assert (=> d!90343 (and (bvsge lt!295550 #b00000000000000000000000000000000) (bvslt lt!295550 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90343 (= lt!295550 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90343 (validMask!0 mask!3053)))

(assert (=> d!90343 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!295550)))

(declare-fun bs!19169 () Bool)

(assert (= bs!19169 d!90343))

(declare-fun m!613299 () Bool)

(assert (=> bs!19169 m!613299))

(assert (=> bs!19169 m!613107))

(assert (=> b!638829 d!90343))

(declare-fun b!638984 () Bool)

(declare-fun c!73044 () Bool)

(declare-fun lt!295551 () (_ BitVec 64))

(assert (=> b!638984 (= c!73044 (= lt!295551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!365656 () SeekEntryResult!6760)

(declare-fun e!365658 () SeekEntryResult!6760)

(assert (=> b!638984 (= e!365656 e!365658)))

(declare-fun b!638985 () Bool)

(declare-fun e!365657 () SeekEntryResult!6760)

(assert (=> b!638985 (= e!365657 e!365656)))

(declare-fun c!73045 () Bool)

(assert (=> b!638985 (= c!73045 (= lt!295551 (select (arr!18364 a!2986) j!136)))))

(declare-fun b!638986 () Bool)

(assert (=> b!638986 (= e!365657 Undefined!6760)))

(declare-fun b!638987 () Bool)

(assert (=> b!638987 (= e!365656 (Found!6760 index!984))))

(declare-fun b!638988 () Bool)

(assert (=> b!638988 (= e!365658 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!295552 () SeekEntryResult!6760)

(declare-fun d!90345 () Bool)

(assert (=> d!90345 (and (or ((_ is Undefined!6760) lt!295552) (not ((_ is Found!6760) lt!295552)) (and (bvsge (index!29355 lt!295552) #b00000000000000000000000000000000) (bvslt (index!29355 lt!295552) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295552) ((_ is Found!6760) lt!295552) (not ((_ is MissingVacant!6760) lt!295552)) (not (= (index!29357 lt!295552) vacantSpotIndex!68)) (and (bvsge (index!29357 lt!295552) #b00000000000000000000000000000000) (bvslt (index!29357 lt!295552) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295552) (ite ((_ is Found!6760) lt!295552) (= (select (arr!18364 a!2986) (index!29355 lt!295552)) (select (arr!18364 a!2986) j!136)) (and ((_ is MissingVacant!6760) lt!295552) (= (index!29357 lt!295552) vacantSpotIndex!68) (= (select (arr!18364 a!2986) (index!29357 lt!295552)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90345 (= lt!295552 e!365657)))

(declare-fun c!73046 () Bool)

(assert (=> d!90345 (= c!73046 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90345 (= lt!295551 (select (arr!18364 a!2986) index!984))))

(assert (=> d!90345 (validMask!0 mask!3053)))

(assert (=> d!90345 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18364 a!2986) j!136) a!2986 mask!3053) lt!295552)))

(declare-fun b!638989 () Bool)

(assert (=> b!638989 (= e!365658 (MissingVacant!6760 vacantSpotIndex!68))))

(assert (= (and d!90345 c!73046) b!638986))

(assert (= (and d!90345 (not c!73046)) b!638985))

(assert (= (and b!638985 c!73045) b!638987))

(assert (= (and b!638985 (not c!73045)) b!638984))

(assert (= (and b!638984 c!73044) b!638989))

(assert (= (and b!638984 (not c!73044)) b!638988))

(assert (=> b!638988 m!613289))

(assert (=> b!638988 m!613289))

(assert (=> b!638988 m!613113))

(declare-fun m!613301 () Bool)

(assert (=> b!638988 m!613301))

(declare-fun m!613303 () Bool)

(assert (=> d!90345 m!613303))

(declare-fun m!613305 () Bool)

(assert (=> d!90345 m!613305))

(assert (=> d!90345 m!613131))

(assert (=> d!90345 m!613107))

(assert (=> b!638820 d!90345))

(declare-fun b!639039 () Bool)

(declare-fun e!365698 () SeekEntryResult!6760)

(declare-fun e!365697 () SeekEntryResult!6760)

(assert (=> b!639039 (= e!365698 e!365697)))

(declare-fun lt!295563 () (_ BitVec 64))

(declare-fun lt!295562 () SeekEntryResult!6760)

(assert (=> b!639039 (= lt!295563 (select (arr!18364 a!2986) (index!29356 lt!295562)))))

(declare-fun c!73061 () Bool)

(assert (=> b!639039 (= c!73061 (= lt!295563 k0!1786))))

(declare-fun b!639040 () Bool)

(declare-fun e!365696 () SeekEntryResult!6760)

(assert (=> b!639040 (= e!365696 (MissingZero!6760 (index!29356 lt!295562)))))

(declare-fun d!90347 () Bool)

(declare-fun lt!295564 () SeekEntryResult!6760)

(assert (=> d!90347 (and (or ((_ is Undefined!6760) lt!295564) (not ((_ is Found!6760) lt!295564)) (and (bvsge (index!29355 lt!295564) #b00000000000000000000000000000000) (bvslt (index!29355 lt!295564) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295564) ((_ is Found!6760) lt!295564) (not ((_ is MissingZero!6760) lt!295564)) (and (bvsge (index!29354 lt!295564) #b00000000000000000000000000000000) (bvslt (index!29354 lt!295564) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295564) ((_ is Found!6760) lt!295564) ((_ is MissingZero!6760) lt!295564) (not ((_ is MissingVacant!6760) lt!295564)) (and (bvsge (index!29357 lt!295564) #b00000000000000000000000000000000) (bvslt (index!29357 lt!295564) (size!18728 a!2986)))) (or ((_ is Undefined!6760) lt!295564) (ite ((_ is Found!6760) lt!295564) (= (select (arr!18364 a!2986) (index!29355 lt!295564)) k0!1786) (ite ((_ is MissingZero!6760) lt!295564) (= (select (arr!18364 a!2986) (index!29354 lt!295564)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6760) lt!295564) (= (select (arr!18364 a!2986) (index!29357 lt!295564)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90347 (= lt!295564 e!365698)))

(declare-fun c!73060 () Bool)

(assert (=> d!90347 (= c!73060 (and ((_ is Intermediate!6760) lt!295562) (undefined!7572 lt!295562)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38289 (_ BitVec 32)) SeekEntryResult!6760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90347 (= lt!295562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90347 (validMask!0 mask!3053)))

(assert (=> d!90347 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!295564)))

(declare-fun b!639041 () Bool)

(assert (=> b!639041 (= e!365697 (Found!6760 (index!29356 lt!295562)))))

(declare-fun b!639042 () Bool)

(declare-fun c!73059 () Bool)

(assert (=> b!639042 (= c!73059 (= lt!295563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639042 (= e!365697 e!365696)))

(declare-fun b!639043 () Bool)

(assert (=> b!639043 (= e!365696 (seekKeyOrZeroReturnVacant!0 (x!58261 lt!295562) (index!29356 lt!295562) (index!29356 lt!295562) k0!1786 a!2986 mask!3053))))

(declare-fun b!639044 () Bool)

(assert (=> b!639044 (= e!365698 Undefined!6760)))

(assert (= (and d!90347 c!73060) b!639044))

(assert (= (and d!90347 (not c!73060)) b!639039))

(assert (= (and b!639039 c!73061) b!639041))

(assert (= (and b!639039 (not c!73061)) b!639042))

(assert (= (and b!639042 c!73059) b!639040))

(assert (= (and b!639042 (not c!73059)) b!639043))

(declare-fun m!613327 () Bool)

(assert (=> b!639039 m!613327))

(declare-fun m!613329 () Bool)

(assert (=> d!90347 m!613329))

(declare-fun m!613331 () Bool)

(assert (=> d!90347 m!613331))

(declare-fun m!613333 () Bool)

(assert (=> d!90347 m!613333))

(declare-fun m!613335 () Bool)

(assert (=> d!90347 m!613335))

(assert (=> d!90347 m!613329))

(declare-fun m!613337 () Bool)

(assert (=> d!90347 m!613337))

(assert (=> d!90347 m!613107))

(declare-fun m!613341 () Bool)

(assert (=> b!639043 m!613341))

(assert (=> b!638830 d!90347))

(declare-fun d!90361 () Bool)

(assert (=> d!90361 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638821 d!90361))

(declare-fun d!90365 () Bool)

(declare-fun res!413680 () Bool)

(declare-fun e!365726 () Bool)

(assert (=> d!90365 (=> res!413680 e!365726)))

(assert (=> d!90365 (= res!413680 (bvsge #b00000000000000000000000000000000 (size!18728 a!2986)))))

(assert (=> d!90365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!365726)))

(declare-fun b!639073 () Bool)

(declare-fun e!365725 () Bool)

(assert (=> b!639073 (= e!365726 e!365725)))

(declare-fun c!73065 () Bool)

(assert (=> b!639073 (= c!73065 (validKeyInArray!0 (select (arr!18364 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639074 () Bool)

(declare-fun call!33484 () Bool)

(assert (=> b!639074 (= e!365725 call!33484)))

(declare-fun bm!33481 () Bool)

(assert (=> bm!33481 (= call!33484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!639075 () Bool)

(declare-fun e!365724 () Bool)

(assert (=> b!639075 (= e!365724 call!33484)))

(declare-fun b!639076 () Bool)

(assert (=> b!639076 (= e!365725 e!365724)))

(declare-fun lt!295580 () (_ BitVec 64))

(assert (=> b!639076 (= lt!295580 (select (arr!18364 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!295581 () Unit!21549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38289 (_ BitVec 64) (_ BitVec 32)) Unit!21549)

(assert (=> b!639076 (= lt!295581 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!295580 #b00000000000000000000000000000000))))

(assert (=> b!639076 (arrayContainsKey!0 a!2986 lt!295580 #b00000000000000000000000000000000)))

(declare-fun lt!295582 () Unit!21549)

(assert (=> b!639076 (= lt!295582 lt!295581)))

(declare-fun res!413681 () Bool)

(assert (=> b!639076 (= res!413681 (= (seekEntryOrOpen!0 (select (arr!18364 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6760 #b00000000000000000000000000000000)))))

(assert (=> b!639076 (=> (not res!413681) (not e!365724))))

(assert (= (and d!90365 (not res!413680)) b!639073))

(assert (= (and b!639073 c!73065) b!639076))

(assert (= (and b!639073 (not c!73065)) b!639074))

(assert (= (and b!639076 res!413681) b!639075))

(assert (= (or b!639075 b!639074) bm!33481))

(declare-fun m!613371 () Bool)

(assert (=> b!639073 m!613371))

(assert (=> b!639073 m!613371))

(declare-fun m!613373 () Bool)

(assert (=> b!639073 m!613373))

(declare-fun m!613375 () Bool)

(assert (=> bm!33481 m!613375))

(assert (=> b!639076 m!613371))

(declare-fun m!613377 () Bool)

(assert (=> b!639076 m!613377))

(declare-fun m!613379 () Bool)

(assert (=> b!639076 m!613379))

(assert (=> b!639076 m!613371))

(declare-fun m!613381 () Bool)

(assert (=> b!639076 m!613381))

(assert (=> b!638832 d!90365))

(declare-fun d!90381 () Bool)

(declare-fun res!413686 () Bool)

(declare-fun e!365731 () Bool)

(assert (=> d!90381 (=> res!413686 e!365731)))

(assert (=> d!90381 (= res!413686 (= (select (arr!18364 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90381 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!365731)))

(declare-fun b!639081 () Bool)

(declare-fun e!365732 () Bool)

(assert (=> b!639081 (= e!365731 e!365732)))

(declare-fun res!413687 () Bool)

(assert (=> b!639081 (=> (not res!413687) (not e!365732))))

(assert (=> b!639081 (= res!413687 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18728 a!2986)))))

(declare-fun b!639082 () Bool)

(assert (=> b!639082 (= e!365732 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90381 (not res!413686)) b!639081))

(assert (= (and b!639081 res!413687) b!639082))

(assert (=> d!90381 m!613371))

(declare-fun m!613383 () Bool)

(assert (=> b!639082 m!613383))

(assert (=> b!638831 d!90381))

(declare-fun b!639117 () Bool)

(declare-fun e!365757 () Bool)

(declare-fun e!365756 () Bool)

(assert (=> b!639117 (= e!365757 e!365756)))

(declare-fun c!73077 () Bool)

(assert (=> b!639117 (= c!73077 (validKeyInArray!0 (select (arr!18364 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!639118 () Bool)

(declare-fun call!33490 () Bool)

(assert (=> b!639118 (= e!365756 call!33490)))

(declare-fun b!639120 () Bool)

(assert (=> b!639120 (= e!365756 call!33490)))

(declare-fun bm!33487 () Bool)

(assert (=> bm!33487 (= call!33490 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73077 (Cons!12308 (select (arr!18364 a!2986) #b00000000000000000000000000000000) Nil!12309) Nil!12309)))))

(declare-fun b!639121 () Bool)

(declare-fun e!365758 () Bool)

(declare-fun contains!3101 (List!12312 (_ BitVec 64)) Bool)

(assert (=> b!639121 (= e!365758 (contains!3101 Nil!12309 (select (arr!18364 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90383 () Bool)

(declare-fun res!413702 () Bool)

(declare-fun e!365759 () Bool)

(assert (=> d!90383 (=> res!413702 e!365759)))

(assert (=> d!90383 (= res!413702 (bvsge #b00000000000000000000000000000000 (size!18728 a!2986)))))

(assert (=> d!90383 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12309) e!365759)))

(declare-fun b!639119 () Bool)

(assert (=> b!639119 (= e!365759 e!365757)))

(declare-fun res!413700 () Bool)

(assert (=> b!639119 (=> (not res!413700) (not e!365757))))

(assert (=> b!639119 (= res!413700 (not e!365758))))

(declare-fun res!413701 () Bool)

(assert (=> b!639119 (=> (not res!413701) (not e!365758))))

(assert (=> b!639119 (= res!413701 (validKeyInArray!0 (select (arr!18364 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90383 (not res!413702)) b!639119))

(assert (= (and b!639119 res!413701) b!639121))

(assert (= (and b!639119 res!413700) b!639117))

(assert (= (and b!639117 c!73077) b!639118))

(assert (= (and b!639117 (not c!73077)) b!639120))

(assert (= (or b!639118 b!639120) bm!33487))

(assert (=> b!639117 m!613371))

(assert (=> b!639117 m!613371))

(assert (=> b!639117 m!613373))

(assert (=> bm!33487 m!613371))

(declare-fun m!613393 () Bool)

(assert (=> bm!33487 m!613393))

(assert (=> b!639121 m!613371))

(assert (=> b!639121 m!613371))

(declare-fun m!613395 () Bool)

(assert (=> b!639121 m!613395))

(assert (=> b!639119 m!613371))

(assert (=> b!639119 m!613371))

(assert (=> b!639119 m!613373))

(assert (=> b!638833 d!90383))

(declare-fun d!90387 () Bool)

(assert (=> d!90387 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57780 d!90387))

(declare-fun d!90393 () Bool)

(assert (=> d!90393 (= (array_inv!14223 a!2986) (bvsge (size!18728 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57780 d!90393))

(declare-fun b!639134 () Bool)

(declare-fun e!365767 () Bool)

(declare-fun e!365766 () Bool)

(assert (=> b!639134 (= e!365767 e!365766)))

(declare-fun c!73084 () Bool)

(assert (=> b!639134 (= c!73084 (validKeyInArray!0 (select (arr!18364 lt!295460) #b00000000000000000000000000000000)))))

(declare-fun b!639135 () Bool)

(declare-fun call!33491 () Bool)

(assert (=> b!639135 (= e!365766 call!33491)))

(declare-fun b!639137 () Bool)

(assert (=> b!639137 (= e!365766 call!33491)))

(declare-fun bm!33488 () Bool)

(assert (=> bm!33488 (= call!33491 (arrayNoDuplicates!0 lt!295460 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73084 (Cons!12308 (select (arr!18364 lt!295460) #b00000000000000000000000000000000) Nil!12309) Nil!12309)))))

(declare-fun b!639138 () Bool)

(declare-fun e!365768 () Bool)

(assert (=> b!639138 (= e!365768 (contains!3101 Nil!12309 (select (arr!18364 lt!295460) #b00000000000000000000000000000000)))))

(declare-fun d!90395 () Bool)

(declare-fun res!413705 () Bool)

(declare-fun e!365769 () Bool)

(assert (=> d!90395 (=> res!413705 e!365769)))

(assert (=> d!90395 (= res!413705 (bvsge #b00000000000000000000000000000000 (size!18728 lt!295460)))))

(assert (=> d!90395 (= (arrayNoDuplicates!0 lt!295460 #b00000000000000000000000000000000 Nil!12309) e!365769)))

(declare-fun b!639136 () Bool)

(assert (=> b!639136 (= e!365769 e!365767)))

(declare-fun res!413703 () Bool)

(assert (=> b!639136 (=> (not res!413703) (not e!365767))))

(assert (=> b!639136 (= res!413703 (not e!365768))))

(declare-fun res!413704 () Bool)

(assert (=> b!639136 (=> (not res!413704) (not e!365768))))

(assert (=> b!639136 (= res!413704 (validKeyInArray!0 (select (arr!18364 lt!295460) #b00000000000000000000000000000000)))))

(assert (= (and d!90395 (not res!413705)) b!639136))

(assert (= (and b!639136 res!413704) b!639138))

(assert (= (and b!639136 res!413703) b!639134))

(assert (= (and b!639134 c!73084) b!639135))

(assert (= (and b!639134 (not c!73084)) b!639137))

(assert (= (or b!639135 b!639137) bm!33488))

(declare-fun m!613415 () Bool)

(assert (=> b!639134 m!613415))

(assert (=> b!639134 m!613415))

(declare-fun m!613417 () Bool)

(assert (=> b!639134 m!613417))

(assert (=> bm!33488 m!613415))

(declare-fun m!613419 () Bool)

(assert (=> bm!33488 m!613419))

(assert (=> b!639138 m!613415))

(assert (=> b!639138 m!613415))

(declare-fun m!613421 () Bool)

(assert (=> b!639138 m!613421))

(assert (=> b!639136 m!613415))

(assert (=> b!639136 m!613415))

(assert (=> b!639136 m!613417))

(assert (=> b!638824 d!90395))

(declare-fun d!90397 () Bool)

(declare-fun e!365783 () Bool)

(assert (=> d!90397 e!365783))

(declare-fun res!413710 () Bool)

(assert (=> d!90397 (=> (not res!413710) (not e!365783))))

(assert (=> d!90397 (= res!413710 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18728 a!2986))))))

(declare-fun lt!295610 () Unit!21549)

(declare-fun choose!41 (array!38289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12312) Unit!21549)

(assert (=> d!90397 (= lt!295610 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12309))))

(assert (=> d!90397 (bvslt (size!18728 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90397 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12309) lt!295610)))

(declare-fun b!639161 () Bool)

(assert (=> b!639161 (= e!365783 (arrayNoDuplicates!0 (array!38290 (store (arr!18364 a!2986) i!1108 k0!1786) (size!18728 a!2986)) #b00000000000000000000000000000000 Nil!12309))))

(assert (= (and d!90397 res!413710) b!639161))

(declare-fun m!613431 () Bool)

(assert (=> d!90397 m!613431))

(assert (=> b!639161 m!613119))

(declare-fun m!613433 () Bool)

(assert (=> b!639161 m!613433))

(assert (=> b!638824 d!90397))

(declare-fun d!90401 () Bool)

(declare-fun res!413712 () Bool)

(declare-fun e!365785 () Bool)

(assert (=> d!90401 (=> res!413712 e!365785)))

(assert (=> d!90401 (= res!413712 (= (select (arr!18364 lt!295460) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18364 a!2986) j!136)))))

(assert (=> d!90401 (= (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!365785)))

(declare-fun b!639163 () Bool)

(declare-fun e!365786 () Bool)

(assert (=> b!639163 (= e!365785 e!365786)))

(declare-fun res!413713 () Bool)

(assert (=> b!639163 (=> (not res!413713) (not e!365786))))

(assert (=> b!639163 (= res!413713 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18728 lt!295460)))))

(declare-fun b!639164 () Bool)

(assert (=> b!639164 (= e!365786 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90401 (not res!413712)) b!639163))

(assert (= (and b!639163 res!413713) b!639164))

(declare-fun m!613435 () Bool)

(assert (=> d!90401 m!613435))

(assert (=> b!639164 m!613113))

(declare-fun m!613437 () Bool)

(assert (=> b!639164 m!613437))

(assert (=> b!638824 d!90401))

(declare-fun d!90403 () Bool)

(assert (=> d!90403 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295614 () Unit!21549)

(declare-fun choose!114 (array!38289 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21549)

(assert (=> d!90403 (= lt!295614 (choose!114 lt!295460 (select (arr!18364 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90403 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90403 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295460 (select (arr!18364 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!295614)))

(declare-fun bs!19172 () Bool)

(assert (= bs!19172 d!90403))

(assert (=> bs!19172 m!613113))

(assert (=> bs!19172 m!613155))

(assert (=> bs!19172 m!613113))

(declare-fun m!613443 () Bool)

(assert (=> bs!19172 m!613443))

(assert (=> b!638824 d!90403))

(declare-fun d!90407 () Bool)

(declare-fun res!413714 () Bool)

(declare-fun e!365787 () Bool)

(assert (=> d!90407 (=> res!413714 e!365787)))

(assert (=> d!90407 (= res!413714 (= (select (arr!18364 lt!295460) j!136) (select (arr!18364 a!2986) j!136)))))

(assert (=> d!90407 (= (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) j!136) e!365787)))

(declare-fun b!639165 () Bool)

(declare-fun e!365788 () Bool)

(assert (=> b!639165 (= e!365787 e!365788)))

(declare-fun res!413715 () Bool)

(assert (=> b!639165 (=> (not res!413715) (not e!365788))))

(assert (=> b!639165 (= res!413715 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18728 lt!295460)))))

(declare-fun b!639166 () Bool)

(assert (=> b!639166 (= e!365788 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90407 (not res!413714)) b!639165))

(assert (= (and b!639165 res!413715) b!639166))

(declare-fun m!613445 () Bool)

(assert (=> d!90407 m!613445))

(assert (=> b!639166 m!613113))

(declare-fun m!613447 () Bool)

(assert (=> b!639166 m!613447))

(assert (=> b!638823 d!90407))

(declare-fun d!90409 () Bool)

(declare-fun res!413716 () Bool)

(declare-fun e!365789 () Bool)

(assert (=> d!90409 (=> res!413716 e!365789)))

(assert (=> d!90409 (= res!413716 (= (select (arr!18364 lt!295460) index!984) (select (arr!18364 a!2986) j!136)))))

(assert (=> d!90409 (= (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) index!984) e!365789)))

(declare-fun b!639167 () Bool)

(declare-fun e!365790 () Bool)

(assert (=> b!639167 (= e!365789 e!365790)))

(declare-fun res!413717 () Bool)

(assert (=> b!639167 (=> (not res!413717) (not e!365790))))

(assert (=> b!639167 (= res!413717 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18728 lt!295460)))))

(declare-fun b!639168 () Bool)

(assert (=> b!639168 (= e!365790 (arrayContainsKey!0 lt!295460 (select (arr!18364 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90409 (not res!413716)) b!639167))

(assert (= (and b!639167 res!413717) b!639168))

(assert (=> d!90409 m!613297))

(assert (=> b!639168 m!613113))

(declare-fun m!613449 () Bool)

(assert (=> b!639168 m!613449))

(assert (=> b!638834 d!90409))

(declare-fun d!90411 () Bool)

(assert (=> d!90411 (= (validKeyInArray!0 (select (arr!18364 a!2986) j!136)) (and (not (= (select (arr!18364 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18364 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638828 d!90411))

(check-sat (not d!90345) (not b!638970) (not d!90341) (not b!639166) (not b!639136) (not b!639073) (not bm!33488) (not d!90347) (not bm!33481) (not d!90335) (not d!90343) (not d!90403) (not b!639119) (not b!639043) (not b!639076) (not b!638976) (not d!90337) (not b!638953) (not b!639134) (not b!639082) (not d!90397) (not b!639161) (not b!638988) (not b!639121) (not b!639168) (not d!90339) (not b!639138) (not b!639117) (not b!638982) (not b!639164) (not bm!33487))
(check-sat)
