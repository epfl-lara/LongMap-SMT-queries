; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55140 () Bool)

(assert start!55140)

(declare-fun b!604311 () Bool)

(declare-fun res!388360 () Bool)

(declare-fun e!345774 () Bool)

(assert (=> b!604311 (=> (not res!388360) (not e!345774))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604311 (= res!388360 (validKeyInArray!0 k0!1786))))

(declare-fun b!604312 () Bool)

(declare-fun e!345776 () Bool)

(declare-fun e!345779 () Bool)

(assert (=> b!604312 (= e!345776 (not e!345779))))

(declare-fun res!388358 () Bool)

(assert (=> b!604312 (=> res!388358 e!345779)))

(declare-datatypes ((SeekEntryResult!6307 0))(
  ( (MissingZero!6307 (index!27491 (_ BitVec 32))) (Found!6307 (index!27492 (_ BitVec 32))) (Intermediate!6307 (undefined!7119 Bool) (index!27493 (_ BitVec 32)) (x!56295 (_ BitVec 32))) (Undefined!6307) (MissingVacant!6307 (index!27494 (_ BitVec 32))) )
))
(declare-fun lt!275531 () SeekEntryResult!6307)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604312 (= res!388358 (not (= lt!275531 (Found!6307 index!984))))))

(declare-datatypes ((Unit!19224 0))(
  ( (Unit!19225) )
))
(declare-fun lt!275538 () Unit!19224)

(declare-fun e!345772 () Unit!19224)

(assert (=> b!604312 (= lt!275538 e!345772)))

(declare-fun c!68349 () Bool)

(assert (=> b!604312 (= c!68349 (= lt!275531 Undefined!6307))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!275532 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37227 0))(
  ( (array!37228 (arr!17870 (Array (_ BitVec 32) (_ BitVec 64))) (size!18235 (_ BitVec 32))) )
))
(declare-fun lt!275526 () array!37227)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37227 (_ BitVec 32)) SeekEntryResult!6307)

(assert (=> b!604312 (= lt!275531 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275532 lt!275526 mask!3053))))

(declare-fun e!345777 () Bool)

(assert (=> b!604312 e!345777))

(declare-fun res!388359 () Bool)

(assert (=> b!604312 (=> (not res!388359) (not e!345777))))

(declare-fun lt!275535 () SeekEntryResult!6307)

(declare-fun lt!275529 () (_ BitVec 32))

(assert (=> b!604312 (= res!388359 (= lt!275535 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 lt!275532 lt!275526 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37227)

(assert (=> b!604312 (= lt!275535 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!604312 (= lt!275532 (select (store (arr!17870 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!275528 () Unit!19224)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19224)

(assert (=> b!604312 (= lt!275528 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604312 (= lt!275529 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604313 () Bool)

(declare-fun res!388362 () Bool)

(assert (=> b!604313 (=> (not res!388362) (not e!345774))))

(assert (=> b!604313 (= res!388362 (validKeyInArray!0 (select (arr!17870 a!2986) j!136)))))

(declare-fun b!604314 () Bool)

(declare-fun e!345786 () Bool)

(assert (=> b!604314 (= e!345786 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18235 a!2986)) (bvslt (size!18235 a!2986) #b01111111111111111111111111111111)))))

(declare-fun arrayContainsKey!0 (array!37227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604314 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275539 () Unit!19224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19224)

(assert (=> b!604314 (= lt!275539 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345783 () Bool)

(assert (=> b!604314 e!345783))

(declare-fun res!388349 () Bool)

(assert (=> b!604314 (=> (not res!388349) (not e!345783))))

(assert (=> b!604314 (= res!388349 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136))))

(declare-fun b!604315 () Bool)

(declare-fun res!388361 () Bool)

(declare-fun e!345778 () Bool)

(assert (=> b!604315 (=> (not res!388361) (not e!345778))))

(assert (=> b!604315 (= res!388361 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17870 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604316 () Bool)

(declare-fun e!345781 () Unit!19224)

(declare-fun Unit!19226 () Unit!19224)

(assert (=> b!604316 (= e!345781 Unit!19226)))

(declare-fun lt!275530 () Unit!19224)

(assert (=> b!604316 (= lt!275530 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275526 (select (arr!17870 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604316 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275533 () Unit!19224)

(declare-datatypes ((List!11950 0))(
  ( (Nil!11947) (Cons!11946 (h!12991 (_ BitVec 64)) (t!18169 List!11950)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11950) Unit!19224)

(assert (=> b!604316 (= lt!275533 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11947))))

(declare-fun arrayNoDuplicates!0 (array!37227 (_ BitVec 32) List!11950) Bool)

(assert (=> b!604316 (arrayNoDuplicates!0 lt!275526 #b00000000000000000000000000000000 Nil!11947)))

(declare-fun lt!275527 () Unit!19224)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37227 (_ BitVec 32) (_ BitVec 32)) Unit!19224)

(assert (=> b!604316 (= lt!275527 (lemmaNoDuplicateFromThenFromBigger!0 lt!275526 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604316 (arrayNoDuplicates!0 lt!275526 j!136 Nil!11947)))

(declare-fun lt!275537 () Unit!19224)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37227 (_ BitVec 64) (_ BitVec 32) List!11950) Unit!19224)

(assert (=> b!604316 (= lt!275537 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136 Nil!11947))))

(assert (=> b!604316 false))

(declare-fun b!604317 () Bool)

(declare-fun res!388366 () Bool)

(assert (=> b!604317 (=> (not res!388366) (not e!345774))))

(assert (=> b!604317 (= res!388366 (and (= (size!18235 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18235 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604319 () Bool)

(declare-fun Unit!19227 () Unit!19224)

(assert (=> b!604319 (= e!345772 Unit!19227)))

(declare-fun b!604320 () Bool)

(declare-fun Unit!19228 () Unit!19224)

(assert (=> b!604320 (= e!345772 Unit!19228)))

(assert (=> b!604320 false))

(declare-fun b!604321 () Bool)

(declare-fun e!345782 () Bool)

(assert (=> b!604321 (= e!345782 e!345786)))

(declare-fun res!388356 () Bool)

(assert (=> b!604321 (=> res!388356 e!345786)))

(assert (=> b!604321 (= res!388356 (bvsge index!984 j!136))))

(declare-fun lt!275534 () Unit!19224)

(assert (=> b!604321 (= lt!275534 e!345781)))

(declare-fun c!68348 () Bool)

(assert (=> b!604321 (= c!68348 (bvslt j!136 index!984))))

(declare-fun e!345785 () Bool)

(declare-fun b!604322 () Bool)

(assert (=> b!604322 (= e!345785 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) index!984))))

(declare-fun b!604323 () Bool)

(assert (=> b!604323 (= e!345779 e!345782)))

(declare-fun res!388353 () Bool)

(assert (=> b!604323 (=> res!388353 e!345782)))

(declare-fun lt!275524 () (_ BitVec 64))

(assert (=> b!604323 (= res!388353 (or (not (= (select (arr!17870 a!2986) j!136) lt!275532)) (not (= (select (arr!17870 a!2986) j!136) lt!275524))))))

(declare-fun e!345784 () Bool)

(assert (=> b!604323 e!345784))

(declare-fun res!388357 () Bool)

(assert (=> b!604323 (=> (not res!388357) (not e!345784))))

(assert (=> b!604323 (= res!388357 (= lt!275524 (select (arr!17870 a!2986) j!136)))))

(assert (=> b!604323 (= lt!275524 (select (store (arr!17870 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!604324 () Bool)

(assert (=> b!604324 (= e!345774 e!345778)))

(declare-fun res!388352 () Bool)

(assert (=> b!604324 (=> (not res!388352) (not e!345778))))

(declare-fun lt!275525 () SeekEntryResult!6307)

(assert (=> b!604324 (= res!388352 (or (= lt!275525 (MissingZero!6307 i!1108)) (= lt!275525 (MissingVacant!6307 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37227 (_ BitVec 32)) SeekEntryResult!6307)

(assert (=> b!604324 (= lt!275525 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!604325 () Bool)

(declare-fun res!388364 () Bool)

(assert (=> b!604325 (=> (not res!388364) (not e!345778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37227 (_ BitVec 32)) Bool)

(assert (=> b!604325 (= res!388364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604326 () Bool)

(assert (=> b!604326 (= e!345783 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) index!984))))

(declare-fun b!604327 () Bool)

(declare-fun e!345780 () Bool)

(assert (=> b!604327 (= e!345780 e!345785)))

(declare-fun res!388354 () Bool)

(assert (=> b!604327 (=> (not res!388354) (not e!345785))))

(assert (=> b!604327 (= res!388354 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136))))

(declare-fun b!604328 () Bool)

(declare-fun e!345773 () Bool)

(assert (=> b!604328 (= e!345778 e!345773)))

(declare-fun res!388350 () Bool)

(assert (=> b!604328 (=> (not res!388350) (not e!345773))))

(assert (=> b!604328 (= res!388350 (= (select (store (arr!17870 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604328 (= lt!275526 (array!37228 (store (arr!17870 a!2986) i!1108 k0!1786) (size!18235 a!2986)))))

(declare-fun b!604329 () Bool)

(declare-fun Unit!19229 () Unit!19224)

(assert (=> b!604329 (= e!345781 Unit!19229)))

(declare-fun b!604318 () Bool)

(declare-fun res!388351 () Bool)

(assert (=> b!604318 (=> (not res!388351) (not e!345778))))

(assert (=> b!604318 (= res!388351 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11947))))

(declare-fun res!388365 () Bool)

(assert (=> start!55140 (=> (not res!388365) (not e!345774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55140 (= res!388365 (validMask!0 mask!3053))))

(assert (=> start!55140 e!345774))

(assert (=> start!55140 true))

(declare-fun array_inv!13753 (array!37227) Bool)

(assert (=> start!55140 (array_inv!13753 a!2986)))

(declare-fun b!604330 () Bool)

(declare-fun res!388367 () Bool)

(assert (=> b!604330 (=> (not res!388367) (not e!345774))))

(assert (=> b!604330 (= res!388367 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604331 () Bool)

(declare-fun lt!275536 () SeekEntryResult!6307)

(assert (=> b!604331 (= e!345777 (= lt!275536 lt!275535))))

(declare-fun b!604332 () Bool)

(assert (=> b!604332 (= e!345773 e!345776)))

(declare-fun res!388355 () Bool)

(assert (=> b!604332 (=> (not res!388355) (not e!345776))))

(assert (=> b!604332 (= res!388355 (and (= lt!275536 (Found!6307 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17870 a!2986) index!984) (select (arr!17870 a!2986) j!136))) (not (= (select (arr!17870 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604332 (= lt!275536 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604333 () Bool)

(assert (=> b!604333 (= e!345784 e!345780)))

(declare-fun res!388363 () Bool)

(assert (=> b!604333 (=> res!388363 e!345780)))

(assert (=> b!604333 (= res!388363 (or (not (= (select (arr!17870 a!2986) j!136) lt!275532)) (not (= (select (arr!17870 a!2986) j!136) lt!275524)) (bvsge j!136 index!984)))))

(assert (= (and start!55140 res!388365) b!604317))

(assert (= (and b!604317 res!388366) b!604313))

(assert (= (and b!604313 res!388362) b!604311))

(assert (= (and b!604311 res!388360) b!604330))

(assert (= (and b!604330 res!388367) b!604324))

(assert (= (and b!604324 res!388352) b!604325))

(assert (= (and b!604325 res!388364) b!604318))

(assert (= (and b!604318 res!388351) b!604315))

(assert (= (and b!604315 res!388361) b!604328))

(assert (= (and b!604328 res!388350) b!604332))

(assert (= (and b!604332 res!388355) b!604312))

(assert (= (and b!604312 res!388359) b!604331))

(assert (= (and b!604312 c!68349) b!604320))

(assert (= (and b!604312 (not c!68349)) b!604319))

(assert (= (and b!604312 (not res!388358)) b!604323))

(assert (= (and b!604323 res!388357) b!604333))

(assert (= (and b!604333 (not res!388363)) b!604327))

(assert (= (and b!604327 res!388354) b!604322))

(assert (= (and b!604323 (not res!388353)) b!604321))

(assert (= (and b!604321 c!68348) b!604316))

(assert (= (and b!604321 (not c!68348)) b!604329))

(assert (= (and b!604321 (not res!388356)) b!604314))

(assert (= (and b!604314 res!388349) b!604326))

(declare-fun m!580705 () Bool)

(assert (=> b!604324 m!580705))

(declare-fun m!580707 () Bool)

(assert (=> b!604313 m!580707))

(assert (=> b!604313 m!580707))

(declare-fun m!580709 () Bool)

(assert (=> b!604313 m!580709))

(assert (=> b!604326 m!580707))

(assert (=> b!604326 m!580707))

(declare-fun m!580711 () Bool)

(assert (=> b!604326 m!580711))

(declare-fun m!580713 () Bool)

(assert (=> b!604328 m!580713))

(declare-fun m!580715 () Bool)

(assert (=> b!604328 m!580715))

(declare-fun m!580717 () Bool)

(assert (=> b!604325 m!580717))

(declare-fun m!580719 () Bool)

(assert (=> b!604311 m!580719))

(assert (=> b!604316 m!580707))

(declare-fun m!580721 () Bool)

(assert (=> b!604316 m!580721))

(declare-fun m!580723 () Bool)

(assert (=> b!604316 m!580723))

(assert (=> b!604316 m!580707))

(declare-fun m!580725 () Bool)

(assert (=> b!604316 m!580725))

(declare-fun m!580727 () Bool)

(assert (=> b!604316 m!580727))

(assert (=> b!604316 m!580707))

(assert (=> b!604316 m!580707))

(declare-fun m!580729 () Bool)

(assert (=> b!604316 m!580729))

(declare-fun m!580731 () Bool)

(assert (=> b!604316 m!580731))

(declare-fun m!580733 () Bool)

(assert (=> b!604316 m!580733))

(assert (=> b!604322 m!580707))

(assert (=> b!604322 m!580707))

(assert (=> b!604322 m!580711))

(assert (=> b!604314 m!580707))

(assert (=> b!604314 m!580707))

(declare-fun m!580735 () Bool)

(assert (=> b!604314 m!580735))

(assert (=> b!604314 m!580707))

(declare-fun m!580737 () Bool)

(assert (=> b!604314 m!580737))

(assert (=> b!604314 m!580707))

(declare-fun m!580739 () Bool)

(assert (=> b!604314 m!580739))

(assert (=> b!604323 m!580707))

(assert (=> b!604323 m!580713))

(declare-fun m!580741 () Bool)

(assert (=> b!604323 m!580741))

(declare-fun m!580743 () Bool)

(assert (=> b!604315 m!580743))

(declare-fun m!580745 () Bool)

(assert (=> b!604318 m!580745))

(declare-fun m!580747 () Bool)

(assert (=> start!55140 m!580747))

(declare-fun m!580749 () Bool)

(assert (=> start!55140 m!580749))

(declare-fun m!580751 () Bool)

(assert (=> b!604330 m!580751))

(declare-fun m!580753 () Bool)

(assert (=> b!604332 m!580753))

(assert (=> b!604332 m!580707))

(assert (=> b!604332 m!580707))

(declare-fun m!580755 () Bool)

(assert (=> b!604332 m!580755))

(declare-fun m!580757 () Bool)

(assert (=> b!604312 m!580757))

(declare-fun m!580759 () Bool)

(assert (=> b!604312 m!580759))

(assert (=> b!604312 m!580707))

(declare-fun m!580761 () Bool)

(assert (=> b!604312 m!580761))

(assert (=> b!604312 m!580707))

(assert (=> b!604312 m!580713))

(declare-fun m!580763 () Bool)

(assert (=> b!604312 m!580763))

(declare-fun m!580765 () Bool)

(assert (=> b!604312 m!580765))

(declare-fun m!580767 () Bool)

(assert (=> b!604312 m!580767))

(assert (=> b!604333 m!580707))

(assert (=> b!604327 m!580707))

(assert (=> b!604327 m!580707))

(assert (=> b!604327 m!580739))

(check-sat (not b!604312) (not b!604311) (not start!55140) (not b!604332) (not b!604314) (not b!604330) (not b!604316) (not b!604322) (not b!604327) (not b!604324) (not b!604313) (not b!604325) (not b!604318) (not b!604326))
(check-sat)
(get-model)

(declare-fun d!87223 () Bool)

(declare-fun res!388486 () Bool)

(declare-fun e!345881 () Bool)

(assert (=> d!87223 (=> res!388486 e!345881)))

(assert (=> d!87223 (= res!388486 (= (select (arr!17870 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87223 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!345881)))

(declare-fun b!604476 () Bool)

(declare-fun e!345882 () Bool)

(assert (=> b!604476 (= e!345881 e!345882)))

(declare-fun res!388487 () Bool)

(assert (=> b!604476 (=> (not res!388487) (not e!345882))))

(assert (=> b!604476 (= res!388487 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18235 a!2986)))))

(declare-fun b!604477 () Bool)

(assert (=> b!604477 (= e!345882 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87223 (not res!388486)) b!604476))

(assert (= (and b!604476 res!388487) b!604477))

(declare-fun m!580897 () Bool)

(assert (=> d!87223 m!580897))

(declare-fun m!580899 () Bool)

(assert (=> b!604477 m!580899))

(assert (=> b!604330 d!87223))

(declare-fun b!604488 () Bool)

(declare-fun e!345892 () Bool)

(declare-fun e!345894 () Bool)

(assert (=> b!604488 (= e!345892 e!345894)))

(declare-fun c!68364 () Bool)

(assert (=> b!604488 (= c!68364 (validKeyInArray!0 (select (arr!17870 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!604489 () Bool)

(declare-fun call!32992 () Bool)

(assert (=> b!604489 (= e!345894 call!32992)))

(declare-fun d!87225 () Bool)

(declare-fun res!388496 () Bool)

(declare-fun e!345893 () Bool)

(assert (=> d!87225 (=> res!388496 e!345893)))

(assert (=> d!87225 (= res!388496 (bvsge #b00000000000000000000000000000000 (size!18235 a!2986)))))

(assert (=> d!87225 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11947) e!345893)))

(declare-fun bm!32989 () Bool)

(assert (=> bm!32989 (= call!32992 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68364 (Cons!11946 (select (arr!17870 a!2986) #b00000000000000000000000000000000) Nil!11947) Nil!11947)))))

(declare-fun b!604490 () Bool)

(declare-fun e!345891 () Bool)

(declare-fun contains!2977 (List!11950 (_ BitVec 64)) Bool)

(assert (=> b!604490 (= e!345891 (contains!2977 Nil!11947 (select (arr!17870 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!604491 () Bool)

(assert (=> b!604491 (= e!345893 e!345892)))

(declare-fun res!388495 () Bool)

(assert (=> b!604491 (=> (not res!388495) (not e!345892))))

(assert (=> b!604491 (= res!388495 (not e!345891))))

(declare-fun res!388494 () Bool)

(assert (=> b!604491 (=> (not res!388494) (not e!345891))))

(assert (=> b!604491 (= res!388494 (validKeyInArray!0 (select (arr!17870 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!604492 () Bool)

(assert (=> b!604492 (= e!345894 call!32992)))

(assert (= (and d!87225 (not res!388496)) b!604491))

(assert (= (and b!604491 res!388494) b!604490))

(assert (= (and b!604491 res!388495) b!604488))

(assert (= (and b!604488 c!68364) b!604492))

(assert (= (and b!604488 (not c!68364)) b!604489))

(assert (= (or b!604492 b!604489) bm!32989))

(assert (=> b!604488 m!580897))

(assert (=> b!604488 m!580897))

(declare-fun m!580901 () Bool)

(assert (=> b!604488 m!580901))

(assert (=> bm!32989 m!580897))

(declare-fun m!580903 () Bool)

(assert (=> bm!32989 m!580903))

(assert (=> b!604490 m!580897))

(assert (=> b!604490 m!580897))

(declare-fun m!580905 () Bool)

(assert (=> b!604490 m!580905))

(assert (=> b!604491 m!580897))

(assert (=> b!604491 m!580897))

(assert (=> b!604491 m!580901))

(assert (=> b!604318 d!87225))

(declare-fun d!87227 () Bool)

(declare-fun res!388497 () Bool)

(declare-fun e!345895 () Bool)

(assert (=> d!87227 (=> res!388497 e!345895)))

(assert (=> d!87227 (= res!388497 (= (select (arr!17870 lt!275526) index!984) (select (arr!17870 a!2986) j!136)))))

(assert (=> d!87227 (= (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) index!984) e!345895)))

(declare-fun b!604493 () Bool)

(declare-fun e!345896 () Bool)

(assert (=> b!604493 (= e!345895 e!345896)))

(declare-fun res!388498 () Bool)

(assert (=> b!604493 (=> (not res!388498) (not e!345896))))

(assert (=> b!604493 (= res!388498 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18235 lt!275526)))))

(declare-fun b!604494 () Bool)

(assert (=> b!604494 (= e!345896 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87227 (not res!388497)) b!604493))

(assert (= (and b!604493 res!388498) b!604494))

(declare-fun m!580907 () Bool)

(assert (=> d!87227 m!580907))

(assert (=> b!604494 m!580707))

(declare-fun m!580909 () Bool)

(assert (=> b!604494 m!580909))

(assert (=> b!604326 d!87227))

(declare-fun b!604495 () Bool)

(declare-fun e!345898 () Bool)

(declare-fun e!345900 () Bool)

(assert (=> b!604495 (= e!345898 e!345900)))

(declare-fun c!68365 () Bool)

(assert (=> b!604495 (= c!68365 (validKeyInArray!0 (select (arr!17870 lt!275526) j!136)))))

(declare-fun b!604496 () Bool)

(declare-fun call!32993 () Bool)

(assert (=> b!604496 (= e!345900 call!32993)))

(declare-fun d!87229 () Bool)

(declare-fun res!388501 () Bool)

(declare-fun e!345899 () Bool)

(assert (=> d!87229 (=> res!388501 e!345899)))

(assert (=> d!87229 (= res!388501 (bvsge j!136 (size!18235 lt!275526)))))

(assert (=> d!87229 (= (arrayNoDuplicates!0 lt!275526 j!136 Nil!11947) e!345899)))

(declare-fun bm!32990 () Bool)

(assert (=> bm!32990 (= call!32993 (arrayNoDuplicates!0 lt!275526 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68365 (Cons!11946 (select (arr!17870 lt!275526) j!136) Nil!11947) Nil!11947)))))

(declare-fun b!604497 () Bool)

(declare-fun e!345897 () Bool)

(assert (=> b!604497 (= e!345897 (contains!2977 Nil!11947 (select (arr!17870 lt!275526) j!136)))))

(declare-fun b!604498 () Bool)

(assert (=> b!604498 (= e!345899 e!345898)))

(declare-fun res!388500 () Bool)

(assert (=> b!604498 (=> (not res!388500) (not e!345898))))

(assert (=> b!604498 (= res!388500 (not e!345897))))

(declare-fun res!388499 () Bool)

(assert (=> b!604498 (=> (not res!388499) (not e!345897))))

(assert (=> b!604498 (= res!388499 (validKeyInArray!0 (select (arr!17870 lt!275526) j!136)))))

(declare-fun b!604499 () Bool)

(assert (=> b!604499 (= e!345900 call!32993)))

(assert (= (and d!87229 (not res!388501)) b!604498))

(assert (= (and b!604498 res!388499) b!604497))

(assert (= (and b!604498 res!388500) b!604495))

(assert (= (and b!604495 c!68365) b!604499))

(assert (= (and b!604495 (not c!68365)) b!604496))

(assert (= (or b!604499 b!604496) bm!32990))

(declare-fun m!580911 () Bool)

(assert (=> b!604495 m!580911))

(assert (=> b!604495 m!580911))

(declare-fun m!580913 () Bool)

(assert (=> b!604495 m!580913))

(assert (=> bm!32990 m!580911))

(declare-fun m!580915 () Bool)

(assert (=> bm!32990 m!580915))

(assert (=> b!604497 m!580911))

(assert (=> b!604497 m!580911))

(declare-fun m!580917 () Bool)

(assert (=> b!604497 m!580917))

(assert (=> b!604498 m!580911))

(assert (=> b!604498 m!580911))

(assert (=> b!604498 m!580913))

(assert (=> b!604316 d!87229))

(declare-fun b!604500 () Bool)

(declare-fun e!345902 () Bool)

(declare-fun e!345904 () Bool)

(assert (=> b!604500 (= e!345902 e!345904)))

(declare-fun c!68366 () Bool)

(assert (=> b!604500 (= c!68366 (validKeyInArray!0 (select (arr!17870 lt!275526) #b00000000000000000000000000000000)))))

(declare-fun b!604501 () Bool)

(declare-fun call!32994 () Bool)

(assert (=> b!604501 (= e!345904 call!32994)))

(declare-fun d!87231 () Bool)

(declare-fun res!388504 () Bool)

(declare-fun e!345903 () Bool)

(assert (=> d!87231 (=> res!388504 e!345903)))

(assert (=> d!87231 (= res!388504 (bvsge #b00000000000000000000000000000000 (size!18235 lt!275526)))))

(assert (=> d!87231 (= (arrayNoDuplicates!0 lt!275526 #b00000000000000000000000000000000 Nil!11947) e!345903)))

(declare-fun bm!32991 () Bool)

(assert (=> bm!32991 (= call!32994 (arrayNoDuplicates!0 lt!275526 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68366 (Cons!11946 (select (arr!17870 lt!275526) #b00000000000000000000000000000000) Nil!11947) Nil!11947)))))

(declare-fun b!604502 () Bool)

(declare-fun e!345901 () Bool)

(assert (=> b!604502 (= e!345901 (contains!2977 Nil!11947 (select (arr!17870 lt!275526) #b00000000000000000000000000000000)))))

(declare-fun b!604503 () Bool)

(assert (=> b!604503 (= e!345903 e!345902)))

(declare-fun res!388503 () Bool)

(assert (=> b!604503 (=> (not res!388503) (not e!345902))))

(assert (=> b!604503 (= res!388503 (not e!345901))))

(declare-fun res!388502 () Bool)

(assert (=> b!604503 (=> (not res!388502) (not e!345901))))

(assert (=> b!604503 (= res!388502 (validKeyInArray!0 (select (arr!17870 lt!275526) #b00000000000000000000000000000000)))))

(declare-fun b!604504 () Bool)

(assert (=> b!604504 (= e!345904 call!32994)))

(assert (= (and d!87231 (not res!388504)) b!604503))

(assert (= (and b!604503 res!388502) b!604502))

(assert (= (and b!604503 res!388503) b!604500))

(assert (= (and b!604500 c!68366) b!604504))

(assert (= (and b!604500 (not c!68366)) b!604501))

(assert (= (or b!604504 b!604501) bm!32991))

(declare-fun m!580919 () Bool)

(assert (=> b!604500 m!580919))

(assert (=> b!604500 m!580919))

(declare-fun m!580921 () Bool)

(assert (=> b!604500 m!580921))

(assert (=> bm!32991 m!580919))

(declare-fun m!580923 () Bool)

(assert (=> bm!32991 m!580923))

(assert (=> b!604502 m!580919))

(assert (=> b!604502 m!580919))

(declare-fun m!580925 () Bool)

(assert (=> b!604502 m!580925))

(assert (=> b!604503 m!580919))

(assert (=> b!604503 m!580919))

(assert (=> b!604503 m!580921))

(assert (=> b!604316 d!87231))

(declare-fun d!87233 () Bool)

(assert (=> d!87233 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275638 () Unit!19224)

(declare-fun choose!114 (array!37227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19224)

(assert (=> d!87233 (= lt!275638 (choose!114 lt!275526 (select (arr!17870 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87233 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87233 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275526 (select (arr!17870 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!275638)))

(declare-fun bs!18469 () Bool)

(assert (= bs!18469 d!87233))

(assert (=> bs!18469 m!580707))

(assert (=> bs!18469 m!580721))

(assert (=> bs!18469 m!580707))

(declare-fun m!580927 () Bool)

(assert (=> bs!18469 m!580927))

(assert (=> b!604316 d!87233))

(declare-fun d!87235 () Bool)

(declare-fun res!388505 () Bool)

(declare-fun e!345905 () Bool)

(assert (=> d!87235 (=> res!388505 e!345905)))

(assert (=> d!87235 (= res!388505 (= (select (arr!17870 lt!275526) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17870 a!2986) j!136)))))

(assert (=> d!87235 (= (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!345905)))

(declare-fun b!604505 () Bool)

(declare-fun e!345906 () Bool)

(assert (=> b!604505 (= e!345905 e!345906)))

(declare-fun res!388506 () Bool)

(assert (=> b!604505 (=> (not res!388506) (not e!345906))))

(assert (=> b!604505 (= res!388506 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18235 lt!275526)))))

(declare-fun b!604506 () Bool)

(assert (=> b!604506 (= e!345906 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87235 (not res!388505)) b!604505))

(assert (= (and b!604505 res!388506) b!604506))

(declare-fun m!580929 () Bool)

(assert (=> d!87235 m!580929))

(assert (=> b!604506 m!580707))

(declare-fun m!580931 () Bool)

(assert (=> b!604506 m!580931))

(assert (=> b!604316 d!87235))

(declare-fun d!87237 () Bool)

(assert (=> d!87237 (arrayNoDuplicates!0 lt!275526 j!136 Nil!11947)))

(declare-fun lt!275641 () Unit!19224)

(declare-fun choose!39 (array!37227 (_ BitVec 32) (_ BitVec 32)) Unit!19224)

(assert (=> d!87237 (= lt!275641 (choose!39 lt!275526 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87237 (bvslt (size!18235 lt!275526) #b01111111111111111111111111111111)))

(assert (=> d!87237 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!275526 #b00000000000000000000000000000000 j!136) lt!275641)))

(declare-fun bs!18470 () Bool)

(assert (= bs!18470 d!87237))

(assert (=> bs!18470 m!580727))

(declare-fun m!580933 () Bool)

(assert (=> bs!18470 m!580933))

(assert (=> b!604316 d!87237))

(declare-fun d!87239 () Bool)

(assert (=> d!87239 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18235 lt!275526)) (not (= (select (arr!17870 lt!275526) j!136) (select (arr!17870 a!2986) j!136))))))

(declare-fun lt!275644 () Unit!19224)

(declare-fun choose!21 (array!37227 (_ BitVec 64) (_ BitVec 32) List!11950) Unit!19224)

(assert (=> d!87239 (= lt!275644 (choose!21 lt!275526 (select (arr!17870 a!2986) j!136) j!136 Nil!11947))))

(assert (=> d!87239 (bvslt (size!18235 lt!275526) #b01111111111111111111111111111111)))

(assert (=> d!87239 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136 Nil!11947) lt!275644)))

(declare-fun bs!18471 () Bool)

(assert (= bs!18471 d!87239))

(assert (=> bs!18471 m!580911))

(assert (=> bs!18471 m!580707))

(declare-fun m!580935 () Bool)

(assert (=> bs!18471 m!580935))

(assert (=> b!604316 d!87239))

(declare-fun d!87241 () Bool)

(declare-fun e!345909 () Bool)

(assert (=> d!87241 e!345909))

(declare-fun res!388509 () Bool)

(assert (=> d!87241 (=> (not res!388509) (not e!345909))))

(assert (=> d!87241 (= res!388509 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986))))))

(declare-fun lt!275647 () Unit!19224)

(declare-fun choose!41 (array!37227 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11950) Unit!19224)

(assert (=> d!87241 (= lt!275647 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11947))))

(assert (=> d!87241 (bvslt (size!18235 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87241 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11947) lt!275647)))

(declare-fun b!604509 () Bool)

(assert (=> b!604509 (= e!345909 (arrayNoDuplicates!0 (array!37228 (store (arr!17870 a!2986) i!1108 k0!1786) (size!18235 a!2986)) #b00000000000000000000000000000000 Nil!11947))))

(assert (= (and d!87241 res!388509) b!604509))

(declare-fun m!580937 () Bool)

(assert (=> d!87241 m!580937))

(assert (=> b!604509 m!580713))

(declare-fun m!580939 () Bool)

(assert (=> b!604509 m!580939))

(assert (=> b!604316 d!87241))

(declare-fun d!87243 () Bool)

(declare-fun res!388510 () Bool)

(declare-fun e!345910 () Bool)

(assert (=> d!87243 (=> res!388510 e!345910)))

(assert (=> d!87243 (= res!388510 (= (select (arr!17870 lt!275526) j!136) (select (arr!17870 a!2986) j!136)))))

(assert (=> d!87243 (= (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136) e!345910)))

(declare-fun b!604510 () Bool)

(declare-fun e!345911 () Bool)

(assert (=> b!604510 (= e!345910 e!345911)))

(declare-fun res!388511 () Bool)

(assert (=> b!604510 (=> (not res!388511) (not e!345911))))

(assert (=> b!604510 (= res!388511 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18235 lt!275526)))))

(declare-fun b!604511 () Bool)

(assert (=> b!604511 (= e!345911 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87243 (not res!388510)) b!604510))

(assert (= (and b!604510 res!388511) b!604511))

(assert (=> d!87243 m!580911))

(assert (=> b!604511 m!580707))

(declare-fun m!580941 () Bool)

(assert (=> b!604511 m!580941))

(assert (=> b!604327 d!87243))

(declare-fun d!87245 () Bool)

(declare-fun res!388512 () Bool)

(declare-fun e!345912 () Bool)

(assert (=> d!87245 (=> res!388512 e!345912)))

(assert (=> d!87245 (= res!388512 (= (select (arr!17870 lt!275526) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17870 a!2986) j!136)))))

(assert (=> d!87245 (= (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!345912)))

(declare-fun b!604512 () Bool)

(declare-fun e!345913 () Bool)

(assert (=> b!604512 (= e!345912 e!345913)))

(declare-fun res!388513 () Bool)

(assert (=> b!604512 (=> (not res!388513) (not e!345913))))

(assert (=> b!604512 (= res!388513 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18235 lt!275526)))))

(declare-fun b!604513 () Bool)

(assert (=> b!604513 (= e!345913 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87245 (not res!388512)) b!604512))

(assert (= (and b!604512 res!388513) b!604513))

(declare-fun m!580943 () Bool)

(assert (=> d!87245 m!580943))

(assert (=> b!604513 m!580707))

(declare-fun m!580945 () Bool)

(assert (=> b!604513 m!580945))

(assert (=> b!604314 d!87245))

(declare-fun d!87247 () Bool)

(assert (=> d!87247 (arrayContainsKey!0 lt!275526 (select (arr!17870 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!275648 () Unit!19224)

(assert (=> d!87247 (= lt!275648 (choose!114 lt!275526 (select (arr!17870 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87247 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87247 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275526 (select (arr!17870 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!275648)))

(declare-fun bs!18472 () Bool)

(assert (= bs!18472 d!87247))

(assert (=> bs!18472 m!580707))

(assert (=> bs!18472 m!580735))

(assert (=> bs!18472 m!580707))

(declare-fun m!580947 () Bool)

(assert (=> bs!18472 m!580947))

(assert (=> b!604314 d!87247))

(assert (=> b!604314 d!87243))

(declare-fun b!604522 () Bool)

(declare-fun e!345921 () Bool)

(declare-fun e!345920 () Bool)

(assert (=> b!604522 (= e!345921 e!345920)))

(declare-fun c!68369 () Bool)

(assert (=> b!604522 (= c!68369 (validKeyInArray!0 (select (arr!17870 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87249 () Bool)

(declare-fun res!388518 () Bool)

(assert (=> d!87249 (=> res!388518 e!345921)))

(assert (=> d!87249 (= res!388518 (bvsge #b00000000000000000000000000000000 (size!18235 a!2986)))))

(assert (=> d!87249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!345921)))

(declare-fun bm!32994 () Bool)

(declare-fun call!32997 () Bool)

(assert (=> bm!32994 (= call!32997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!604523 () Bool)

(declare-fun e!345922 () Bool)

(assert (=> b!604523 (= e!345920 e!345922)))

(declare-fun lt!275657 () (_ BitVec 64))

(assert (=> b!604523 (= lt!275657 (select (arr!17870 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!275655 () Unit!19224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37227 (_ BitVec 64) (_ BitVec 32)) Unit!19224)

(assert (=> b!604523 (= lt!275655 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!275657 #b00000000000000000000000000000000))))

(assert (=> b!604523 (arrayContainsKey!0 a!2986 lt!275657 #b00000000000000000000000000000000)))

(declare-fun lt!275656 () Unit!19224)

(assert (=> b!604523 (= lt!275656 lt!275655)))

(declare-fun res!388519 () Bool)

(assert (=> b!604523 (= res!388519 (= (seekEntryOrOpen!0 (select (arr!17870 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6307 #b00000000000000000000000000000000)))))

(assert (=> b!604523 (=> (not res!388519) (not e!345922))))

(declare-fun b!604524 () Bool)

(assert (=> b!604524 (= e!345920 call!32997)))

(declare-fun b!604525 () Bool)

(assert (=> b!604525 (= e!345922 call!32997)))

(assert (= (and d!87249 (not res!388518)) b!604522))

(assert (= (and b!604522 c!68369) b!604523))

(assert (= (and b!604522 (not c!68369)) b!604524))

(assert (= (and b!604523 res!388519) b!604525))

(assert (= (or b!604525 b!604524) bm!32994))

(assert (=> b!604522 m!580897))

(assert (=> b!604522 m!580897))

(assert (=> b!604522 m!580901))

(declare-fun m!580949 () Bool)

(assert (=> bm!32994 m!580949))

(assert (=> b!604523 m!580897))

(declare-fun m!580951 () Bool)

(assert (=> b!604523 m!580951))

(declare-fun m!580953 () Bool)

(assert (=> b!604523 m!580953))

(assert (=> b!604523 m!580897))

(declare-fun m!580955 () Bool)

(assert (=> b!604523 m!580955))

(assert (=> b!604325 d!87249))

(declare-fun d!87251 () Bool)

(assert (=> d!87251 (= (validKeyInArray!0 (select (arr!17870 a!2986) j!136)) (and (not (= (select (arr!17870 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17870 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604313 d!87251))

(declare-fun lt!275665 () SeekEntryResult!6307)

(declare-fun e!345930 () SeekEntryResult!6307)

(declare-fun b!604538 () Bool)

(assert (=> b!604538 (= e!345930 (seekKeyOrZeroReturnVacant!0 (x!56295 lt!275665) (index!27493 lt!275665) (index!27493 lt!275665) k0!1786 a!2986 mask!3053))))

(declare-fun b!604539 () Bool)

(assert (=> b!604539 (= e!345930 (MissingZero!6307 (index!27493 lt!275665)))))

(declare-fun b!604540 () Bool)

(declare-fun e!345929 () SeekEntryResult!6307)

(assert (=> b!604540 (= e!345929 (Found!6307 (index!27493 lt!275665)))))

(declare-fun b!604541 () Bool)

(declare-fun c!68376 () Bool)

(declare-fun lt!275664 () (_ BitVec 64))

(assert (=> b!604541 (= c!68376 (= lt!275664 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!604541 (= e!345929 e!345930)))

(declare-fun b!604542 () Bool)

(declare-fun e!345931 () SeekEntryResult!6307)

(assert (=> b!604542 (= e!345931 e!345929)))

(assert (=> b!604542 (= lt!275664 (select (arr!17870 a!2986) (index!27493 lt!275665)))))

(declare-fun c!68378 () Bool)

(assert (=> b!604542 (= c!68378 (= lt!275664 k0!1786))))

(declare-fun b!604543 () Bool)

(assert (=> b!604543 (= e!345931 Undefined!6307)))

(declare-fun d!87253 () Bool)

(declare-fun lt!275666 () SeekEntryResult!6307)

(get-info :version)

(assert (=> d!87253 (and (or ((_ is Undefined!6307) lt!275666) (not ((_ is Found!6307) lt!275666)) (and (bvsge (index!27492 lt!275666) #b00000000000000000000000000000000) (bvslt (index!27492 lt!275666) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275666) ((_ is Found!6307) lt!275666) (not ((_ is MissingZero!6307) lt!275666)) (and (bvsge (index!27491 lt!275666) #b00000000000000000000000000000000) (bvslt (index!27491 lt!275666) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275666) ((_ is Found!6307) lt!275666) ((_ is MissingZero!6307) lt!275666) (not ((_ is MissingVacant!6307) lt!275666)) (and (bvsge (index!27494 lt!275666) #b00000000000000000000000000000000) (bvslt (index!27494 lt!275666) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275666) (ite ((_ is Found!6307) lt!275666) (= (select (arr!17870 a!2986) (index!27492 lt!275666)) k0!1786) (ite ((_ is MissingZero!6307) lt!275666) (= (select (arr!17870 a!2986) (index!27491 lt!275666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6307) lt!275666) (= (select (arr!17870 a!2986) (index!27494 lt!275666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87253 (= lt!275666 e!345931)))

(declare-fun c!68377 () Bool)

(assert (=> d!87253 (= c!68377 (and ((_ is Intermediate!6307) lt!275665) (undefined!7119 lt!275665)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37227 (_ BitVec 32)) SeekEntryResult!6307)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87253 (= lt!275665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87253 (validMask!0 mask!3053)))

(assert (=> d!87253 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!275666)))

(assert (= (and d!87253 c!68377) b!604543))

(assert (= (and d!87253 (not c!68377)) b!604542))

(assert (= (and b!604542 c!68378) b!604540))

(assert (= (and b!604542 (not c!68378)) b!604541))

(assert (= (and b!604541 c!68376) b!604539))

(assert (= (and b!604541 (not c!68376)) b!604538))

(declare-fun m!580957 () Bool)

(assert (=> b!604538 m!580957))

(declare-fun m!580959 () Bool)

(assert (=> b!604542 m!580959))

(declare-fun m!580961 () Bool)

(assert (=> d!87253 m!580961))

(declare-fun m!580963 () Bool)

(assert (=> d!87253 m!580963))

(declare-fun m!580965 () Bool)

(assert (=> d!87253 m!580965))

(assert (=> d!87253 m!580961))

(declare-fun m!580967 () Bool)

(assert (=> d!87253 m!580967))

(assert (=> d!87253 m!580747))

(declare-fun m!580969 () Bool)

(assert (=> d!87253 m!580969))

(assert (=> b!604324 d!87253))

(assert (=> b!604322 d!87227))

(declare-fun b!604574 () Bool)

(declare-fun c!68389 () Bool)

(declare-fun lt!275680 () (_ BitVec 64))

(assert (=> b!604574 (= c!68389 (= lt!275680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!345953 () SeekEntryResult!6307)

(declare-fun e!345954 () SeekEntryResult!6307)

(assert (=> b!604574 (= e!345953 e!345954)))

(declare-fun b!604575 () Bool)

(declare-fun e!345955 () SeekEntryResult!6307)

(assert (=> b!604575 (= e!345955 e!345953)))

(declare-fun c!68390 () Bool)

(assert (=> b!604575 (= c!68390 (= lt!275680 lt!275532))))

(declare-fun lt!275681 () SeekEntryResult!6307)

(declare-fun d!87255 () Bool)

(assert (=> d!87255 (and (or ((_ is Undefined!6307) lt!275681) (not ((_ is Found!6307) lt!275681)) (and (bvsge (index!27492 lt!275681) #b00000000000000000000000000000000) (bvslt (index!27492 lt!275681) (size!18235 lt!275526)))) (or ((_ is Undefined!6307) lt!275681) ((_ is Found!6307) lt!275681) (not ((_ is MissingVacant!6307) lt!275681)) (not (= (index!27494 lt!275681) vacantSpotIndex!68)) (and (bvsge (index!27494 lt!275681) #b00000000000000000000000000000000) (bvslt (index!27494 lt!275681) (size!18235 lt!275526)))) (or ((_ is Undefined!6307) lt!275681) (ite ((_ is Found!6307) lt!275681) (= (select (arr!17870 lt!275526) (index!27492 lt!275681)) lt!275532) (and ((_ is MissingVacant!6307) lt!275681) (= (index!27494 lt!275681) vacantSpotIndex!68) (= (select (arr!17870 lt!275526) (index!27494 lt!275681)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87255 (= lt!275681 e!345955)))

(declare-fun c!68388 () Bool)

(assert (=> d!87255 (= c!68388 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87255 (= lt!275680 (select (arr!17870 lt!275526) lt!275529))))

(assert (=> d!87255 (validMask!0 mask!3053)))

(assert (=> d!87255 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 lt!275532 lt!275526 mask!3053) lt!275681)))

(declare-fun b!604576 () Bool)

(assert (=> b!604576 (= e!345954 (MissingVacant!6307 vacantSpotIndex!68))))

(declare-fun b!604577 () Bool)

(assert (=> b!604577 (= e!345954 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275529 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!275532 lt!275526 mask!3053))))

(declare-fun b!604578 () Bool)

(assert (=> b!604578 (= e!345955 Undefined!6307)))

(declare-fun b!604579 () Bool)

(assert (=> b!604579 (= e!345953 (Found!6307 lt!275529))))

(assert (= (and d!87255 c!68388) b!604578))

(assert (= (and d!87255 (not c!68388)) b!604575))

(assert (= (and b!604575 c!68390) b!604579))

(assert (= (and b!604575 (not c!68390)) b!604574))

(assert (= (and b!604574 c!68389) b!604576))

(assert (= (and b!604574 (not c!68389)) b!604577))

(declare-fun m!580987 () Bool)

(assert (=> d!87255 m!580987))

(declare-fun m!580989 () Bool)

(assert (=> d!87255 m!580989))

(declare-fun m!580991 () Bool)

(assert (=> d!87255 m!580991))

(assert (=> d!87255 m!580747))

(declare-fun m!580993 () Bool)

(assert (=> b!604577 m!580993))

(assert (=> b!604577 m!580993))

(declare-fun m!580995 () Bool)

(assert (=> b!604577 m!580995))

(assert (=> b!604312 d!87255))

(declare-fun b!604580 () Bool)

(declare-fun c!68392 () Bool)

(declare-fun lt!275682 () (_ BitVec 64))

(assert (=> b!604580 (= c!68392 (= lt!275682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!345956 () SeekEntryResult!6307)

(declare-fun e!345957 () SeekEntryResult!6307)

(assert (=> b!604580 (= e!345956 e!345957)))

(declare-fun b!604581 () Bool)

(declare-fun e!345958 () SeekEntryResult!6307)

(assert (=> b!604581 (= e!345958 e!345956)))

(declare-fun c!68393 () Bool)

(assert (=> b!604581 (= c!68393 (= lt!275682 (select (arr!17870 a!2986) j!136)))))

(declare-fun d!87265 () Bool)

(declare-fun lt!275683 () SeekEntryResult!6307)

(assert (=> d!87265 (and (or ((_ is Undefined!6307) lt!275683) (not ((_ is Found!6307) lt!275683)) (and (bvsge (index!27492 lt!275683) #b00000000000000000000000000000000) (bvslt (index!27492 lt!275683) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275683) ((_ is Found!6307) lt!275683) (not ((_ is MissingVacant!6307) lt!275683)) (not (= (index!27494 lt!275683) vacantSpotIndex!68)) (and (bvsge (index!27494 lt!275683) #b00000000000000000000000000000000) (bvslt (index!27494 lt!275683) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275683) (ite ((_ is Found!6307) lt!275683) (= (select (arr!17870 a!2986) (index!27492 lt!275683)) (select (arr!17870 a!2986) j!136)) (and ((_ is MissingVacant!6307) lt!275683) (= (index!27494 lt!275683) vacantSpotIndex!68) (= (select (arr!17870 a!2986) (index!27494 lt!275683)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87265 (= lt!275683 e!345958)))

(declare-fun c!68391 () Bool)

(assert (=> d!87265 (= c!68391 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87265 (= lt!275682 (select (arr!17870 a!2986) lt!275529))))

(assert (=> d!87265 (validMask!0 mask!3053)))

(assert (=> d!87265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053) lt!275683)))

(declare-fun b!604582 () Bool)

(assert (=> b!604582 (= e!345957 (MissingVacant!6307 vacantSpotIndex!68))))

(declare-fun b!604583 () Bool)

(assert (=> b!604583 (= e!345957 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!275529 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604584 () Bool)

(assert (=> b!604584 (= e!345958 Undefined!6307)))

(declare-fun b!604585 () Bool)

(assert (=> b!604585 (= e!345956 (Found!6307 lt!275529))))

(assert (= (and d!87265 c!68391) b!604584))

(assert (= (and d!87265 (not c!68391)) b!604581))

(assert (= (and b!604581 c!68393) b!604585))

(assert (= (and b!604581 (not c!68393)) b!604580))

(assert (= (and b!604580 c!68392) b!604582))

(assert (= (and b!604580 (not c!68392)) b!604583))

(declare-fun m!580997 () Bool)

(assert (=> d!87265 m!580997))

(declare-fun m!580999 () Bool)

(assert (=> d!87265 m!580999))

(declare-fun m!581001 () Bool)

(assert (=> d!87265 m!581001))

(assert (=> d!87265 m!580747))

(assert (=> b!604583 m!580993))

(assert (=> b!604583 m!580993))

(assert (=> b!604583 m!580707))

(declare-fun m!581003 () Bool)

(assert (=> b!604583 m!581003))

(assert (=> b!604312 d!87265))

(declare-fun d!87267 () Bool)

(declare-fun e!345988 () Bool)

(assert (=> d!87267 e!345988))

(declare-fun res!388554 () Bool)

(assert (=> d!87267 (=> (not res!388554) (not e!345988))))

(assert (=> d!87267 (= res!388554 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18235 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18235 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18235 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18235 a!2986))))))

(declare-fun lt!275704 () Unit!19224)

(declare-fun choose!9 (array!37227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19224)

(assert (=> d!87267 (= lt!275704 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87267 (validMask!0 mask!3053)))

(assert (=> d!87267 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 mask!3053) lt!275704)))

(declare-fun b!604622 () Bool)

(assert (=> b!604622 (= e!345988 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275529 vacantSpotIndex!68 (select (store (arr!17870 a!2986) i!1108 k0!1786) j!136) (array!37228 (store (arr!17870 a!2986) i!1108 k0!1786) (size!18235 a!2986)) mask!3053)))))

(assert (= (and d!87267 res!388554) b!604622))

(declare-fun m!581039 () Bool)

(assert (=> d!87267 m!581039))

(assert (=> d!87267 m!580747))

(assert (=> b!604622 m!580713))

(assert (=> b!604622 m!580707))

(assert (=> b!604622 m!580759))

(assert (=> b!604622 m!580759))

(declare-fun m!581043 () Bool)

(assert (=> b!604622 m!581043))

(assert (=> b!604622 m!580707))

(assert (=> b!604622 m!580761))

(assert (=> b!604312 d!87267))

(declare-fun d!87283 () Bool)

(declare-fun lt!275707 () (_ BitVec 32))

(assert (=> d!87283 (and (bvsge lt!275707 #b00000000000000000000000000000000) (bvslt lt!275707 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87283 (= lt!275707 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87283 (validMask!0 mask!3053)))

(assert (=> d!87283 (= (nextIndex!0 index!984 x!910 mask!3053) lt!275707)))

(declare-fun bs!18476 () Bool)

(assert (= bs!18476 d!87283))

(declare-fun m!581045 () Bool)

(assert (=> bs!18476 m!581045))

(assert (=> bs!18476 m!580747))

(assert (=> b!604312 d!87283))

(declare-fun b!604623 () Bool)

(declare-fun c!68402 () Bool)

(declare-fun lt!275708 () (_ BitVec 64))

(assert (=> b!604623 (= c!68402 (= lt!275708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!345989 () SeekEntryResult!6307)

(declare-fun e!345990 () SeekEntryResult!6307)

(assert (=> b!604623 (= e!345989 e!345990)))

(declare-fun b!604624 () Bool)

(declare-fun e!345991 () SeekEntryResult!6307)

(assert (=> b!604624 (= e!345991 e!345989)))

(declare-fun c!68403 () Bool)

(assert (=> b!604624 (= c!68403 (= lt!275708 lt!275532))))

(declare-fun d!87285 () Bool)

(declare-fun lt!275709 () SeekEntryResult!6307)

(assert (=> d!87285 (and (or ((_ is Undefined!6307) lt!275709) (not ((_ is Found!6307) lt!275709)) (and (bvsge (index!27492 lt!275709) #b00000000000000000000000000000000) (bvslt (index!27492 lt!275709) (size!18235 lt!275526)))) (or ((_ is Undefined!6307) lt!275709) ((_ is Found!6307) lt!275709) (not ((_ is MissingVacant!6307) lt!275709)) (not (= (index!27494 lt!275709) vacantSpotIndex!68)) (and (bvsge (index!27494 lt!275709) #b00000000000000000000000000000000) (bvslt (index!27494 lt!275709) (size!18235 lt!275526)))) (or ((_ is Undefined!6307) lt!275709) (ite ((_ is Found!6307) lt!275709) (= (select (arr!17870 lt!275526) (index!27492 lt!275709)) lt!275532) (and ((_ is MissingVacant!6307) lt!275709) (= (index!27494 lt!275709) vacantSpotIndex!68) (= (select (arr!17870 lt!275526) (index!27494 lt!275709)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87285 (= lt!275709 e!345991)))

(declare-fun c!68401 () Bool)

(assert (=> d!87285 (= c!68401 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87285 (= lt!275708 (select (arr!17870 lt!275526) index!984))))

(assert (=> d!87285 (validMask!0 mask!3053)))

(assert (=> d!87285 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275532 lt!275526 mask!3053) lt!275709)))

(declare-fun b!604625 () Bool)

(assert (=> b!604625 (= e!345990 (MissingVacant!6307 vacantSpotIndex!68))))

(declare-fun b!604626 () Bool)

(assert (=> b!604626 (= e!345990 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!275532 lt!275526 mask!3053))))

(declare-fun b!604627 () Bool)

(assert (=> b!604627 (= e!345991 Undefined!6307)))

(declare-fun b!604628 () Bool)

(assert (=> b!604628 (= e!345989 (Found!6307 index!984))))

(assert (= (and d!87285 c!68401) b!604627))

(assert (= (and d!87285 (not c!68401)) b!604624))

(assert (= (and b!604624 c!68403) b!604628))

(assert (= (and b!604624 (not c!68403)) b!604623))

(assert (= (and b!604623 c!68402) b!604625))

(assert (= (and b!604623 (not c!68402)) b!604626))

(declare-fun m!581047 () Bool)

(assert (=> d!87285 m!581047))

(declare-fun m!581049 () Bool)

(assert (=> d!87285 m!581049))

(assert (=> d!87285 m!580907))

(assert (=> d!87285 m!580747))

(assert (=> b!604626 m!580757))

(assert (=> b!604626 m!580757))

(declare-fun m!581051 () Bool)

(assert (=> b!604626 m!581051))

(assert (=> b!604312 d!87285))

(declare-fun b!604631 () Bool)

(declare-fun c!68405 () Bool)

(declare-fun lt!275712 () (_ BitVec 64))

(assert (=> b!604631 (= c!68405 (= lt!275712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!345994 () SeekEntryResult!6307)

(declare-fun e!345995 () SeekEntryResult!6307)

(assert (=> b!604631 (= e!345994 e!345995)))

(declare-fun b!604632 () Bool)

(declare-fun e!345996 () SeekEntryResult!6307)

(assert (=> b!604632 (= e!345996 e!345994)))

(declare-fun c!68406 () Bool)

(assert (=> b!604632 (= c!68406 (= lt!275712 (select (arr!17870 a!2986) j!136)))))

(declare-fun lt!275713 () SeekEntryResult!6307)

(declare-fun d!87287 () Bool)

(assert (=> d!87287 (and (or ((_ is Undefined!6307) lt!275713) (not ((_ is Found!6307) lt!275713)) (and (bvsge (index!27492 lt!275713) #b00000000000000000000000000000000) (bvslt (index!27492 lt!275713) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275713) ((_ is Found!6307) lt!275713) (not ((_ is MissingVacant!6307) lt!275713)) (not (= (index!27494 lt!275713) vacantSpotIndex!68)) (and (bvsge (index!27494 lt!275713) #b00000000000000000000000000000000) (bvslt (index!27494 lt!275713) (size!18235 a!2986)))) (or ((_ is Undefined!6307) lt!275713) (ite ((_ is Found!6307) lt!275713) (= (select (arr!17870 a!2986) (index!27492 lt!275713)) (select (arr!17870 a!2986) j!136)) (and ((_ is MissingVacant!6307) lt!275713) (= (index!27494 lt!275713) vacantSpotIndex!68) (= (select (arr!17870 a!2986) (index!27494 lt!275713)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87287 (= lt!275713 e!345996)))

(declare-fun c!68404 () Bool)

(assert (=> d!87287 (= c!68404 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87287 (= lt!275712 (select (arr!17870 a!2986) index!984))))

(assert (=> d!87287 (validMask!0 mask!3053)))

(assert (=> d!87287 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053) lt!275713)))

(declare-fun b!604633 () Bool)

(assert (=> b!604633 (= e!345995 (MissingVacant!6307 vacantSpotIndex!68))))

(declare-fun b!604634 () Bool)

(assert (=> b!604634 (= e!345995 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17870 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604635 () Bool)

(assert (=> b!604635 (= e!345996 Undefined!6307)))

(declare-fun b!604636 () Bool)

(assert (=> b!604636 (= e!345994 (Found!6307 index!984))))

(assert (= (and d!87287 c!68404) b!604635))

(assert (= (and d!87287 (not c!68404)) b!604632))

(assert (= (and b!604632 c!68406) b!604636))

(assert (= (and b!604632 (not c!68406)) b!604631))

(assert (= (and b!604631 c!68405) b!604633))

(assert (= (and b!604631 (not c!68405)) b!604634))

(declare-fun m!581053 () Bool)

(assert (=> d!87287 m!581053))

(declare-fun m!581055 () Bool)

(assert (=> d!87287 m!581055))

(assert (=> d!87287 m!580753))

(assert (=> d!87287 m!580747))

(assert (=> b!604634 m!580757))

(assert (=> b!604634 m!580757))

(assert (=> b!604634 m!580707))

(declare-fun m!581057 () Bool)

(assert (=> b!604634 m!581057))

(assert (=> b!604332 d!87287))

(declare-fun d!87289 () Bool)

(assert (=> d!87289 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55140 d!87289))

(declare-fun d!87299 () Bool)

(assert (=> d!87299 (= (array_inv!13753 a!2986) (bvsge (size!18235 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55140 d!87299))

(declare-fun d!87301 () Bool)

(assert (=> d!87301 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!604311 d!87301))

(check-sat (not b!604498) (not b!604577) (not d!87255) (not b!604622) (not b!604523) (not b!604488) (not d!87237) (not b!604495) (not b!604634) (not b!604522) (not d!87285) (not d!87283) (not b!604538) (not b!604626) (not b!604513) (not b!604511) (not bm!32990) (not b!604503) (not d!87239) (not b!604490) (not d!87241) (not d!87247) (not d!87287) (not b!604500) (not b!604477) (not d!87233) (not b!604502) (not b!604494) (not bm!32994) (not d!87253) (not b!604506) (not bm!32991) (not bm!32989) (not d!87265) (not d!87267) (not b!604491) (not b!604497) (not b!604583) (not b!604509))
(check-sat)
