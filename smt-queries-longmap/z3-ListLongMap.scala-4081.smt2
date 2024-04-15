; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55968 () Bool)

(assert start!55968)

(declare-fun b!614513 () Bool)

(declare-fun res!395864 () Bool)

(declare-fun e!352321 () Bool)

(assert (=> b!614513 (=> (not res!395864) (not e!352321))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614513 (= res!395864 (validKeyInArray!0 k0!1786))))

(declare-fun b!614514 () Bool)

(declare-fun res!395852 () Bool)

(declare-fun e!352316 () Bool)

(assert (=> b!614514 (=> (not res!395852) (not e!352316))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37452 0))(
  ( (array!37453 (arr!17972 (Array (_ BitVec 32) (_ BitVec 64))) (size!18337 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37452)

(assert (=> b!614514 (= res!395852 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17972 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!614515 () Bool)

(declare-datatypes ((Unit!19836 0))(
  ( (Unit!19837) )
))
(declare-fun e!352319 () Unit!19836)

(declare-fun Unit!19838 () Unit!19836)

(assert (=> b!614515 (= e!352319 Unit!19838)))

(declare-fun b!614516 () Bool)

(declare-fun e!352315 () Unit!19836)

(declare-fun Unit!19839 () Unit!19836)

(assert (=> b!614516 (= e!352315 Unit!19839)))

(declare-fun b!614517 () Bool)

(declare-fun res!395860 () Bool)

(assert (=> b!614517 (=> (not res!395860) (not e!352321))))

(declare-fun arrayContainsKey!0 (array!37452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614517 (= res!395860 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614518 () Bool)

(declare-fun res!395855 () Bool)

(assert (=> b!614518 (=> (not res!395855) (not e!352316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37452 (_ BitVec 32)) Bool)

(assert (=> b!614518 (= res!395855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614519 () Bool)

(declare-fun res!395854 () Bool)

(assert (=> b!614519 (=> (not res!395854) (not e!352321))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!614519 (= res!395854 (validKeyInArray!0 (select (arr!17972 a!2986) j!136)))))

(declare-fun b!614520 () Bool)

(declare-fun res!395849 () Bool)

(assert (=> b!614520 (=> (not res!395849) (not e!352316))))

(declare-datatypes ((List!12052 0))(
  ( (Nil!12049) (Cons!12048 (h!13093 (_ BitVec 64)) (t!18271 List!12052)) )
))
(declare-fun arrayNoDuplicates!0 (array!37452 (_ BitVec 32) List!12052) Bool)

(assert (=> b!614520 (= res!395849 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12049))))

(declare-fun b!614521 () Bool)

(declare-fun res!395851 () Bool)

(assert (=> b!614521 (= res!395851 (bvsge j!136 index!984))))

(declare-fun e!352320 () Bool)

(assert (=> b!614521 (=> res!395851 e!352320)))

(declare-fun e!352313 () Bool)

(assert (=> b!614521 (= e!352313 e!352320)))

(declare-fun b!614522 () Bool)

(assert (=> b!614522 false))

(declare-fun lt!281920 () Unit!19836)

(declare-fun lt!281921 () array!37452)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37452 (_ BitVec 64) (_ BitVec 32) List!12052) Unit!19836)

(assert (=> b!614522 (= lt!281920 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281921 (select (arr!17972 a!2986) j!136) j!136 Nil!12049))))

(assert (=> b!614522 (arrayNoDuplicates!0 lt!281921 j!136 Nil!12049)))

(declare-fun lt!281919 () Unit!19836)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37452 (_ BitVec 32) (_ BitVec 32)) Unit!19836)

(assert (=> b!614522 (= lt!281919 (lemmaNoDuplicateFromThenFromBigger!0 lt!281921 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614522 (arrayNoDuplicates!0 lt!281921 #b00000000000000000000000000000000 Nil!12049)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!281914 () Unit!19836)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12052) Unit!19836)

(assert (=> b!614522 (= lt!281914 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12049))))

(assert (=> b!614522 (arrayContainsKey!0 lt!281921 (select (arr!17972 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281916 () Unit!19836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37452 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19836)

(assert (=> b!614522 (= lt!281916 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281921 (select (arr!17972 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352318 () Unit!19836)

(declare-fun Unit!19840 () Unit!19836)

(assert (=> b!614522 (= e!352318 Unit!19840)))

(declare-fun b!614523 () Bool)

(declare-fun Unit!19841 () Unit!19836)

(assert (=> b!614523 (= e!352318 Unit!19841)))

(declare-fun b!614524 () Bool)

(declare-fun e!352322 () Unit!19836)

(declare-fun Unit!19842 () Unit!19836)

(assert (=> b!614524 (= e!352322 Unit!19842)))

(declare-fun b!614525 () Bool)

(assert (=> b!614525 (= e!352321 e!352316)))

(declare-fun res!395863 () Bool)

(assert (=> b!614525 (=> (not res!395863) (not e!352316))))

(declare-datatypes ((SeekEntryResult!6409 0))(
  ( (MissingZero!6409 (index!27920 (_ BitVec 32))) (Found!6409 (index!27921 (_ BitVec 32))) (Intermediate!6409 (undefined!7221 Bool) (index!27922 (_ BitVec 32)) (x!56732 (_ BitVec 32))) (Undefined!6409) (MissingVacant!6409 (index!27923 (_ BitVec 32))) )
))
(declare-fun lt!281911 () SeekEntryResult!6409)

(assert (=> b!614525 (= res!395863 (or (= lt!281911 (MissingZero!6409 i!1108)) (= lt!281911 (MissingVacant!6409 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37452 (_ BitVec 32)) SeekEntryResult!6409)

(assert (=> b!614525 (= lt!281911 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!614526 () Bool)

(declare-fun Unit!19843 () Unit!19836)

(assert (=> b!614526 (= e!352319 Unit!19843)))

(declare-fun res!395857 () Bool)

(assert (=> b!614526 (= res!395857 (= (select (store (arr!17972 a!2986) i!1108 k0!1786) index!984) (select (arr!17972 a!2986) j!136)))))

(assert (=> b!614526 (=> (not res!395857) (not e!352313))))

(assert (=> b!614526 e!352313))

(declare-fun c!69699 () Bool)

(assert (=> b!614526 (= c!69699 (bvslt j!136 index!984))))

(declare-fun lt!281910 () Unit!19836)

(assert (=> b!614526 (= lt!281910 e!352318)))

(declare-fun c!69700 () Bool)

(assert (=> b!614526 (= c!69700 (bvslt index!984 j!136))))

(declare-fun lt!281904 () Unit!19836)

(assert (=> b!614526 (= lt!281904 e!352315)))

(assert (=> b!614526 false))

(declare-fun e!352312 () Bool)

(declare-fun b!614527 () Bool)

(assert (=> b!614527 (= e!352312 (arrayContainsKey!0 lt!281921 (select (arr!17972 a!2986) j!136) index!984))))

(declare-fun b!614528 () Bool)

(assert (=> b!614528 false))

(declare-fun lt!281922 () Unit!19836)

(assert (=> b!614528 (= lt!281922 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281921 (select (arr!17972 a!2986) j!136) index!984 Nil!12049))))

(assert (=> b!614528 (arrayNoDuplicates!0 lt!281921 index!984 Nil!12049)))

(declare-fun lt!281907 () Unit!19836)

(assert (=> b!614528 (= lt!281907 (lemmaNoDuplicateFromThenFromBigger!0 lt!281921 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614528 (arrayNoDuplicates!0 lt!281921 #b00000000000000000000000000000000 Nil!12049)))

(declare-fun lt!281908 () Unit!19836)

(assert (=> b!614528 (= lt!281908 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12049))))

(assert (=> b!614528 (arrayContainsKey!0 lt!281921 (select (arr!17972 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281912 () Unit!19836)

(assert (=> b!614528 (= lt!281912 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281921 (select (arr!17972 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352317 () Bool)

(assert (=> b!614528 e!352317))

(declare-fun res!395853 () Bool)

(assert (=> b!614528 (=> (not res!395853) (not e!352317))))

(assert (=> b!614528 (= res!395853 (arrayContainsKey!0 lt!281921 (select (arr!17972 a!2986) j!136) j!136))))

(declare-fun Unit!19844 () Unit!19836)

(assert (=> b!614528 (= e!352315 Unit!19844)))

(declare-fun b!614529 () Bool)

(declare-fun e!352314 () Bool)

(assert (=> b!614529 (= e!352316 e!352314)))

(declare-fun res!395862 () Bool)

(assert (=> b!614529 (=> (not res!395862) (not e!352314))))

(assert (=> b!614529 (= res!395862 (= (select (store (arr!17972 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!614529 (= lt!281921 (array!37453 (store (arr!17972 a!2986) i!1108 k0!1786) (size!18337 a!2986)))))

(declare-fun b!614530 () Bool)

(declare-fun e!352310 () Bool)

(assert (=> b!614530 (= e!352314 e!352310)))

(declare-fun res!395859 () Bool)

(assert (=> b!614530 (=> (not res!395859) (not e!352310))))

(declare-fun lt!281905 () SeekEntryResult!6409)

(assert (=> b!614530 (= res!395859 (and (= lt!281905 (Found!6409 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17972 a!2986) index!984) (select (arr!17972 a!2986) j!136))) (not (= (select (arr!17972 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37452 (_ BitVec 32)) SeekEntryResult!6409)

(assert (=> b!614530 (= lt!281905 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17972 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614531 () Bool)

(declare-fun e!352311 () Bool)

(declare-fun lt!281915 () SeekEntryResult!6409)

(assert (=> b!614531 (= e!352311 (= lt!281905 lt!281915))))

(declare-fun b!614532 () Bool)

(assert (=> b!614532 (= e!352310 (not true))))

(declare-fun lt!281913 () Unit!19836)

(assert (=> b!614532 (= lt!281913 e!352319)))

(declare-fun c!69702 () Bool)

(declare-fun lt!281917 () SeekEntryResult!6409)

(assert (=> b!614532 (= c!69702 (= lt!281917 (Found!6409 index!984)))))

(declare-fun lt!281918 () Unit!19836)

(assert (=> b!614532 (= lt!281918 e!352322)))

(declare-fun c!69701 () Bool)

(assert (=> b!614532 (= c!69701 (= lt!281917 Undefined!6409))))

(declare-fun lt!281923 () (_ BitVec 64))

(assert (=> b!614532 (= lt!281917 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281923 lt!281921 mask!3053))))

(assert (=> b!614532 e!352311))

(declare-fun res!395856 () Bool)

(assert (=> b!614532 (=> (not res!395856) (not e!352311))))

(declare-fun lt!281906 () (_ BitVec 32))

(assert (=> b!614532 (= res!395856 (= lt!281915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281906 vacantSpotIndex!68 lt!281923 lt!281921 mask!3053)))))

(assert (=> b!614532 (= lt!281915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281906 vacantSpotIndex!68 (select (arr!17972 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614532 (= lt!281923 (select (store (arr!17972 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281909 () Unit!19836)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37452 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19836)

(assert (=> b!614532 (= lt!281909 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281906 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614532 (= lt!281906 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!395861 () Bool)

(assert (=> start!55968 (=> (not res!395861) (not e!352321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55968 (= res!395861 (validMask!0 mask!3053))))

(assert (=> start!55968 e!352321))

(assert (=> start!55968 true))

(declare-fun array_inv!13855 (array!37452) Bool)

(assert (=> start!55968 (array_inv!13855 a!2986)))

(declare-fun b!614533 () Bool)

(assert (=> b!614533 (= e!352317 (arrayContainsKey!0 lt!281921 (select (arr!17972 a!2986) j!136) index!984))))

(declare-fun b!614534 () Bool)

(declare-fun res!395858 () Bool)

(assert (=> b!614534 (=> (not res!395858) (not e!352321))))

(assert (=> b!614534 (= res!395858 (and (= (size!18337 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18337 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18337 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!614535 () Bool)

(declare-fun res!395850 () Bool)

(assert (=> b!614535 (= res!395850 (arrayContainsKey!0 lt!281921 (select (arr!17972 a!2986) j!136) j!136))))

(assert (=> b!614535 (=> (not res!395850) (not e!352312))))

(assert (=> b!614535 (= e!352320 e!352312)))

(declare-fun b!614536 () Bool)

(declare-fun Unit!19845 () Unit!19836)

(assert (=> b!614536 (= e!352322 Unit!19845)))

(assert (=> b!614536 false))

(assert (= (and start!55968 res!395861) b!614534))

(assert (= (and b!614534 res!395858) b!614519))

(assert (= (and b!614519 res!395854) b!614513))

(assert (= (and b!614513 res!395864) b!614517))

(assert (= (and b!614517 res!395860) b!614525))

(assert (= (and b!614525 res!395863) b!614518))

(assert (= (and b!614518 res!395855) b!614520))

(assert (= (and b!614520 res!395849) b!614514))

(assert (= (and b!614514 res!395852) b!614529))

(assert (= (and b!614529 res!395862) b!614530))

(assert (= (and b!614530 res!395859) b!614532))

(assert (= (and b!614532 res!395856) b!614531))

(assert (= (and b!614532 c!69701) b!614536))

(assert (= (and b!614532 (not c!69701)) b!614524))

(assert (= (and b!614532 c!69702) b!614526))

(assert (= (and b!614532 (not c!69702)) b!614515))

(assert (= (and b!614526 res!395857) b!614521))

(assert (= (and b!614521 (not res!395851)) b!614535))

(assert (= (and b!614535 res!395850) b!614527))

(assert (= (and b!614526 c!69699) b!614522))

(assert (= (and b!614526 (not c!69699)) b!614523))

(assert (= (and b!614526 c!69700) b!614528))

(assert (= (and b!614526 (not c!69700)) b!614516))

(assert (= (and b!614528 res!395853) b!614533))

(declare-fun m!590233 () Bool)

(assert (=> b!614528 m!590233))

(declare-fun m!590235 () Bool)

(assert (=> b!614528 m!590235))

(declare-fun m!590237 () Bool)

(assert (=> b!614528 m!590237))

(assert (=> b!614528 m!590233))

(declare-fun m!590239 () Bool)

(assert (=> b!614528 m!590239))

(assert (=> b!614528 m!590233))

(declare-fun m!590241 () Bool)

(assert (=> b!614528 m!590241))

(declare-fun m!590243 () Bool)

(assert (=> b!614528 m!590243))

(declare-fun m!590245 () Bool)

(assert (=> b!614528 m!590245))

(declare-fun m!590247 () Bool)

(assert (=> b!614528 m!590247))

(assert (=> b!614528 m!590233))

(declare-fun m!590249 () Bool)

(assert (=> b!614528 m!590249))

(assert (=> b!614528 m!590233))

(assert (=> b!614519 m!590233))

(assert (=> b!614519 m!590233))

(declare-fun m!590251 () Bool)

(assert (=> b!614519 m!590251))

(assert (=> b!614527 m!590233))

(assert (=> b!614527 m!590233))

(declare-fun m!590253 () Bool)

(assert (=> b!614527 m!590253))

(declare-fun m!590255 () Bool)

(assert (=> start!55968 m!590255))

(declare-fun m!590257 () Bool)

(assert (=> start!55968 m!590257))

(declare-fun m!590259 () Bool)

(assert (=> b!614529 m!590259))

(declare-fun m!590261 () Bool)

(assert (=> b!614529 m!590261))

(declare-fun m!590263 () Bool)

(assert (=> b!614514 m!590263))

(assert (=> b!614522 m!590233))

(declare-fun m!590265 () Bool)

(assert (=> b!614522 m!590265))

(declare-fun m!590267 () Bool)

(assert (=> b!614522 m!590267))

(assert (=> b!614522 m!590233))

(assert (=> b!614522 m!590233))

(declare-fun m!590269 () Bool)

(assert (=> b!614522 m!590269))

(assert (=> b!614522 m!590233))

(declare-fun m!590271 () Bool)

(assert (=> b!614522 m!590271))

(declare-fun m!590273 () Bool)

(assert (=> b!614522 m!590273))

(assert (=> b!614522 m!590245))

(assert (=> b!614522 m!590247))

(declare-fun m!590275 () Bool)

(assert (=> b!614517 m!590275))

(assert (=> b!614535 m!590233))

(assert (=> b!614535 m!590233))

(assert (=> b!614535 m!590239))

(declare-fun m!590277 () Bool)

(assert (=> b!614518 m!590277))

(declare-fun m!590279 () Bool)

(assert (=> b!614532 m!590279))

(declare-fun m!590281 () Bool)

(assert (=> b!614532 m!590281))

(declare-fun m!590283 () Bool)

(assert (=> b!614532 m!590283))

(assert (=> b!614532 m!590233))

(assert (=> b!614532 m!590259))

(declare-fun m!590285 () Bool)

(assert (=> b!614532 m!590285))

(declare-fun m!590287 () Bool)

(assert (=> b!614532 m!590287))

(assert (=> b!614532 m!590233))

(declare-fun m!590289 () Bool)

(assert (=> b!614532 m!590289))

(declare-fun m!590291 () Bool)

(assert (=> b!614525 m!590291))

(assert (=> b!614533 m!590233))

(assert (=> b!614533 m!590233))

(assert (=> b!614533 m!590253))

(declare-fun m!590293 () Bool)

(assert (=> b!614520 m!590293))

(assert (=> b!614526 m!590259))

(declare-fun m!590295 () Bool)

(assert (=> b!614526 m!590295))

(assert (=> b!614526 m!590233))

(declare-fun m!590297 () Bool)

(assert (=> b!614513 m!590297))

(declare-fun m!590299 () Bool)

(assert (=> b!614530 m!590299))

(assert (=> b!614530 m!590233))

(assert (=> b!614530 m!590233))

(declare-fun m!590301 () Bool)

(assert (=> b!614530 m!590301))

(check-sat (not b!614532) (not b!614518) (not b!614522) (not b!614525) (not start!55968) (not b!614535) (not b!614533) (not b!614517) (not b!614520) (not b!614528) (not b!614519) (not b!614513) (not b!614530) (not b!614527))
(check-sat)
