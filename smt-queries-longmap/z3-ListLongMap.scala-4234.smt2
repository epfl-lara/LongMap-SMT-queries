; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58328 () Bool)

(assert start!58328)

(declare-fun b!644192 () Bool)

(declare-fun e!369076 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38436 0))(
  ( (array!38437 (arr!18431 (Array (_ BitVec 32) (_ BitVec 64))) (size!18796 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38436)

(assert (=> b!644192 (= e!369076 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (size!18796 a!2986) #b01111111111111111111111111111111)))))

(declare-fun e!369066 () Bool)

(assert (=> b!644192 e!369066))

(declare-fun res!417425 () Bool)

(assert (=> b!644192 (=> (not res!417425) (not e!369066))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!298486 () array!38436)

(declare-fun arrayContainsKey!0 (array!38436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644192 (= res!417425 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) j!136))))

(declare-fun b!644193 () Bool)

(declare-fun e!369075 () Bool)

(declare-fun e!369079 () Bool)

(assert (=> b!644193 (= e!369075 e!369079)))

(declare-fun res!417427 () Bool)

(assert (=> b!644193 (=> res!417427 e!369079)))

(declare-fun lt!298481 () (_ BitVec 64))

(declare-fun lt!298491 () (_ BitVec 64))

(assert (=> b!644193 (= res!417427 (or (not (= (select (arr!18431 a!2986) j!136) lt!298491)) (not (= (select (arr!18431 a!2986) j!136) lt!298481)) (bvsge j!136 index!984)))))

(declare-fun b!644194 () Bool)

(declare-fun e!369077 () Bool)

(declare-fun e!369080 () Bool)

(assert (=> b!644194 (= e!369077 (not e!369080))))

(declare-fun res!417413 () Bool)

(assert (=> b!644194 (=> res!417413 e!369080)))

(declare-datatypes ((SeekEntryResult!6868 0))(
  ( (MissingZero!6868 (index!29804 (_ BitVec 32))) (Found!6868 (index!29805 (_ BitVec 32))) (Intermediate!6868 (undefined!7680 Bool) (index!29806 (_ BitVec 32)) (x!58583 (_ BitVec 32))) (Undefined!6868) (MissingVacant!6868 (index!29807 (_ BitVec 32))) )
))
(declare-fun lt!298483 () SeekEntryResult!6868)

(assert (=> b!644194 (= res!417413 (not (= lt!298483 (Found!6868 index!984))))))

(declare-datatypes ((Unit!21836 0))(
  ( (Unit!21837) )
))
(declare-fun lt!298478 () Unit!21836)

(declare-fun e!369072 () Unit!21836)

(assert (=> b!644194 (= lt!298478 e!369072)))

(declare-fun c!73758 () Bool)

(assert (=> b!644194 (= c!73758 (= lt!298483 Undefined!6868))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38436 (_ BitVec 32)) SeekEntryResult!6868)

(assert (=> b!644194 (= lt!298483 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298491 lt!298486 mask!3053))))

(declare-fun e!369078 () Bool)

(assert (=> b!644194 e!369078))

(declare-fun res!417426 () Bool)

(assert (=> b!644194 (=> (not res!417426) (not e!369078))))

(declare-fun lt!298482 () (_ BitVec 32))

(declare-fun lt!298485 () SeekEntryResult!6868)

(assert (=> b!644194 (= res!417426 (= lt!298485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 lt!298491 lt!298486 mask!3053)))))

(assert (=> b!644194 (= lt!298485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!644194 (= lt!298491 (select (store (arr!18431 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298487 () Unit!21836)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21836)

(assert (=> b!644194 (= lt!298487 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644194 (= lt!298482 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!644195 () Bool)

(declare-fun res!417416 () Bool)

(declare-fun e!369070 () Bool)

(assert (=> b!644195 (=> (not res!417416) (not e!369070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644195 (= res!417416 (validKeyInArray!0 (select (arr!18431 a!2986) j!136)))))

(declare-fun res!417415 () Bool)

(assert (=> start!58328 (=> (not res!417415) (not e!369070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58328 (= res!417415 (validMask!0 mask!3053))))

(assert (=> start!58328 e!369070))

(assert (=> start!58328 true))

(declare-fun array_inv!14314 (array!38436) Bool)

(assert (=> start!58328 (array_inv!14314 a!2986)))

(declare-fun b!644196 () Bool)

(declare-fun e!369071 () Unit!21836)

(declare-fun Unit!21838 () Unit!21836)

(assert (=> b!644196 (= e!369071 Unit!21838)))

(declare-fun b!644197 () Bool)

(declare-fun res!417421 () Bool)

(declare-fun e!369069 () Bool)

(assert (=> b!644197 (=> (not res!417421) (not e!369069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38436 (_ BitVec 32)) Bool)

(assert (=> b!644197 (= res!417421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644198 () Bool)

(declare-fun Unit!21839 () Unit!21836)

(assert (=> b!644198 (= e!369072 Unit!21839)))

(declare-fun b!644199 () Bool)

(declare-fun e!369067 () Bool)

(assert (=> b!644199 (= e!369067 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) index!984))))

(declare-fun b!644200 () Bool)

(declare-fun res!417429 () Bool)

(assert (=> b!644200 (=> (not res!417429) (not e!369069))))

(declare-datatypes ((List!12511 0))(
  ( (Nil!12508) (Cons!12507 (h!13552 (_ BitVec 64)) (t!18730 List!12511)) )
))
(declare-fun arrayNoDuplicates!0 (array!38436 (_ BitVec 32) List!12511) Bool)

(assert (=> b!644200 (= res!417429 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12508))))

(declare-fun b!644201 () Bool)

(declare-fun res!417424 () Bool)

(assert (=> b!644201 (=> (not res!417424) (not e!369069))))

(assert (=> b!644201 (= res!417424 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18431 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644202 () Bool)

(declare-fun Unit!21840 () Unit!21836)

(assert (=> b!644202 (= e!369071 Unit!21840)))

(declare-fun lt!298479 () Unit!21836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21836)

(assert (=> b!644202 (= lt!298479 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298486 (select (arr!18431 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644202 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298480 () Unit!21836)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12511) Unit!21836)

(assert (=> b!644202 (= lt!298480 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12508))))

(assert (=> b!644202 (arrayNoDuplicates!0 lt!298486 #b00000000000000000000000000000000 Nil!12508)))

(declare-fun lt!298488 () Unit!21836)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38436 (_ BitVec 32) (_ BitVec 32)) Unit!21836)

(assert (=> b!644202 (= lt!298488 (lemmaNoDuplicateFromThenFromBigger!0 lt!298486 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644202 (arrayNoDuplicates!0 lt!298486 j!136 Nil!12508)))

(declare-fun lt!298484 () Unit!21836)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38436 (_ BitVec 64) (_ BitVec 32) List!12511) Unit!21836)

(assert (=> b!644202 (= lt!298484 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298486 (select (arr!18431 a!2986) j!136) j!136 Nil!12508))))

(assert (=> b!644202 false))

(declare-fun b!644203 () Bool)

(declare-fun res!417418 () Bool)

(assert (=> b!644203 (=> (not res!417418) (not e!369070))))

(assert (=> b!644203 (= res!417418 (and (= (size!18796 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18796 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18796 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644204 () Bool)

(declare-fun res!417417 () Bool)

(assert (=> b!644204 (=> (not res!417417) (not e!369070))))

(assert (=> b!644204 (= res!417417 (validKeyInArray!0 k0!1786))))

(declare-fun b!644205 () Bool)

(declare-fun e!369068 () Bool)

(assert (=> b!644205 (= e!369068 e!369076)))

(declare-fun res!417420 () Bool)

(assert (=> b!644205 (=> res!417420 e!369076)))

(assert (=> b!644205 (= res!417420 (bvsge index!984 j!136))))

(declare-fun lt!298489 () Unit!21836)

(assert (=> b!644205 (= lt!298489 e!369071)))

(declare-fun c!73757 () Bool)

(assert (=> b!644205 (= c!73757 (bvslt j!136 index!984))))

(declare-fun b!644206 () Bool)

(assert (=> b!644206 (= e!369070 e!369069)))

(declare-fun res!417428 () Bool)

(assert (=> b!644206 (=> (not res!417428) (not e!369069))))

(declare-fun lt!298477 () SeekEntryResult!6868)

(assert (=> b!644206 (= res!417428 (or (= lt!298477 (MissingZero!6868 i!1108)) (= lt!298477 (MissingVacant!6868 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38436 (_ BitVec 32)) SeekEntryResult!6868)

(assert (=> b!644206 (= lt!298477 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644207 () Bool)

(assert (=> b!644207 (= e!369066 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) index!984))))

(declare-fun b!644208 () Bool)

(declare-fun res!417412 () Bool)

(assert (=> b!644208 (=> (not res!417412) (not e!369070))))

(assert (=> b!644208 (= res!417412 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644209 () Bool)

(declare-fun e!369074 () Bool)

(assert (=> b!644209 (= e!369074 e!369077)))

(declare-fun res!417419 () Bool)

(assert (=> b!644209 (=> (not res!417419) (not e!369077))))

(declare-fun lt!298490 () SeekEntryResult!6868)

(assert (=> b!644209 (= res!417419 (and (= lt!298490 (Found!6868 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18431 a!2986) index!984) (select (arr!18431 a!2986) j!136))) (not (= (select (arr!18431 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!644209 (= lt!298490 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644210 () Bool)

(declare-fun Unit!21841 () Unit!21836)

(assert (=> b!644210 (= e!369072 Unit!21841)))

(assert (=> b!644210 false))

(declare-fun b!644211 () Bool)

(assert (=> b!644211 (= e!369078 (= lt!298490 lt!298485))))

(declare-fun b!644212 () Bool)

(assert (=> b!644212 (= e!369080 e!369068)))

(declare-fun res!417430 () Bool)

(assert (=> b!644212 (=> res!417430 e!369068)))

(assert (=> b!644212 (= res!417430 (or (not (= (select (arr!18431 a!2986) j!136) lt!298491)) (not (= (select (arr!18431 a!2986) j!136) lt!298481))))))

(assert (=> b!644212 e!369075))

(declare-fun res!417422 () Bool)

(assert (=> b!644212 (=> (not res!417422) (not e!369075))))

(assert (=> b!644212 (= res!417422 (= lt!298481 (select (arr!18431 a!2986) j!136)))))

(assert (=> b!644212 (= lt!298481 (select (store (arr!18431 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644213 () Bool)

(assert (=> b!644213 (= e!369069 e!369074)))

(declare-fun res!417423 () Bool)

(assert (=> b!644213 (=> (not res!417423) (not e!369074))))

(assert (=> b!644213 (= res!417423 (= (select (store (arr!18431 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644213 (= lt!298486 (array!38437 (store (arr!18431 a!2986) i!1108 k0!1786) (size!18796 a!2986)))))

(declare-fun b!644214 () Bool)

(assert (=> b!644214 (= e!369079 e!369067)))

(declare-fun res!417414 () Bool)

(assert (=> b!644214 (=> (not res!417414) (not e!369067))))

(assert (=> b!644214 (= res!417414 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) j!136))))

(assert (= (and start!58328 res!417415) b!644203))

(assert (= (and b!644203 res!417418) b!644195))

(assert (= (and b!644195 res!417416) b!644204))

(assert (= (and b!644204 res!417417) b!644208))

(assert (= (and b!644208 res!417412) b!644206))

(assert (= (and b!644206 res!417428) b!644197))

(assert (= (and b!644197 res!417421) b!644200))

(assert (= (and b!644200 res!417429) b!644201))

(assert (= (and b!644201 res!417424) b!644213))

(assert (= (and b!644213 res!417423) b!644209))

(assert (= (and b!644209 res!417419) b!644194))

(assert (= (and b!644194 res!417426) b!644211))

(assert (= (and b!644194 c!73758) b!644210))

(assert (= (and b!644194 (not c!73758)) b!644198))

(assert (= (and b!644194 (not res!417413)) b!644212))

(assert (= (and b!644212 res!417422) b!644193))

(assert (= (and b!644193 (not res!417427)) b!644214))

(assert (= (and b!644214 res!417414) b!644199))

(assert (= (and b!644212 (not res!417430)) b!644205))

(assert (= (and b!644205 c!73757) b!644202))

(assert (= (and b!644205 (not c!73757)) b!644196))

(assert (= (and b!644205 (not res!417420)) b!644192))

(assert (= (and b!644192 res!417425) b!644207))

(declare-fun m!617307 () Bool)

(assert (=> b!644214 m!617307))

(assert (=> b!644214 m!617307))

(declare-fun m!617309 () Bool)

(assert (=> b!644214 m!617309))

(declare-fun m!617311 () Bool)

(assert (=> b!644200 m!617311))

(declare-fun m!617313 () Bool)

(assert (=> b!644194 m!617313))

(declare-fun m!617315 () Bool)

(assert (=> b!644194 m!617315))

(assert (=> b!644194 m!617307))

(declare-fun m!617317 () Bool)

(assert (=> b!644194 m!617317))

(declare-fun m!617319 () Bool)

(assert (=> b!644194 m!617319))

(assert (=> b!644194 m!617307))

(declare-fun m!617321 () Bool)

(assert (=> b!644194 m!617321))

(declare-fun m!617323 () Bool)

(assert (=> b!644194 m!617323))

(declare-fun m!617325 () Bool)

(assert (=> b!644194 m!617325))

(assert (=> b!644207 m!617307))

(assert (=> b!644207 m!617307))

(declare-fun m!617327 () Bool)

(assert (=> b!644207 m!617327))

(declare-fun m!617329 () Bool)

(assert (=> b!644206 m!617329))

(declare-fun m!617331 () Bool)

(assert (=> b!644208 m!617331))

(declare-fun m!617333 () Bool)

(assert (=> b!644201 m!617333))

(declare-fun m!617335 () Bool)

(assert (=> b!644204 m!617335))

(declare-fun m!617337 () Bool)

(assert (=> b!644209 m!617337))

(assert (=> b!644209 m!617307))

(assert (=> b!644209 m!617307))

(declare-fun m!617339 () Bool)

(assert (=> b!644209 m!617339))

(declare-fun m!617341 () Bool)

(assert (=> start!58328 m!617341))

(declare-fun m!617343 () Bool)

(assert (=> start!58328 m!617343))

(assert (=> b!644213 m!617325))

(declare-fun m!617345 () Bool)

(assert (=> b!644213 m!617345))

(assert (=> b!644212 m!617307))

(assert (=> b!644212 m!617325))

(declare-fun m!617347 () Bool)

(assert (=> b!644212 m!617347))

(assert (=> b!644199 m!617307))

(assert (=> b!644199 m!617307))

(assert (=> b!644199 m!617327))

(assert (=> b!644195 m!617307))

(assert (=> b!644195 m!617307))

(declare-fun m!617349 () Bool)

(assert (=> b!644195 m!617349))

(declare-fun m!617351 () Bool)

(assert (=> b!644197 m!617351))

(declare-fun m!617353 () Bool)

(assert (=> b!644202 m!617353))

(declare-fun m!617355 () Bool)

(assert (=> b!644202 m!617355))

(declare-fun m!617357 () Bool)

(assert (=> b!644202 m!617357))

(assert (=> b!644202 m!617307))

(declare-fun m!617359 () Bool)

(assert (=> b!644202 m!617359))

(assert (=> b!644202 m!617307))

(declare-fun m!617361 () Bool)

(assert (=> b!644202 m!617361))

(declare-fun m!617363 () Bool)

(assert (=> b!644202 m!617363))

(assert (=> b!644202 m!617307))

(declare-fun m!617365 () Bool)

(assert (=> b!644202 m!617365))

(assert (=> b!644202 m!617307))

(assert (=> b!644192 m!617307))

(assert (=> b!644192 m!617307))

(assert (=> b!644192 m!617309))

(assert (=> b!644193 m!617307))

(check-sat (not b!644208) (not b!644200) (not b!644195) (not b!644192) (not b!644199) (not b!644207) (not b!644204) (not b!644202) (not b!644194) (not start!58328) (not b!644209) (not b!644197) (not b!644206) (not b!644214))
(check-sat)
(get-model)

(declare-fun b!644361 () Bool)

(declare-fun e!369178 () Bool)

(declare-fun e!369179 () Bool)

(assert (=> b!644361 (= e!369178 e!369179)))

(declare-fun c!73773 () Bool)

(assert (=> b!644361 (= c!73773 (validKeyInArray!0 (select (arr!18431 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!644362 () Bool)

(declare-fun e!369177 () Bool)

(declare-fun call!33583 () Bool)

(assert (=> b!644362 (= e!369177 call!33583)))

(declare-fun d!90855 () Bool)

(declare-fun res!417550 () Bool)

(assert (=> d!90855 (=> res!417550 e!369178)))

(assert (=> d!90855 (= res!417550 (bvsge #b00000000000000000000000000000000 (size!18796 a!2986)))))

(assert (=> d!90855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!369178)))

(declare-fun b!644363 () Bool)

(assert (=> b!644363 (= e!369179 call!33583)))

(declare-fun bm!33580 () Bool)

(assert (=> bm!33580 (= call!33583 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!644364 () Bool)

(assert (=> b!644364 (= e!369179 e!369177)))

(declare-fun lt!298588 () (_ BitVec 64))

(assert (=> b!644364 (= lt!298588 (select (arr!18431 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!298590 () Unit!21836)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38436 (_ BitVec 64) (_ BitVec 32)) Unit!21836)

(assert (=> b!644364 (= lt!298590 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!298588 #b00000000000000000000000000000000))))

(assert (=> b!644364 (arrayContainsKey!0 a!2986 lt!298588 #b00000000000000000000000000000000)))

(declare-fun lt!298589 () Unit!21836)

(assert (=> b!644364 (= lt!298589 lt!298590)))

(declare-fun res!417549 () Bool)

(assert (=> b!644364 (= res!417549 (= (seekEntryOrOpen!0 (select (arr!18431 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6868 #b00000000000000000000000000000000)))))

(assert (=> b!644364 (=> (not res!417549) (not e!369177))))

(assert (= (and d!90855 (not res!417550)) b!644361))

(assert (= (and b!644361 c!73773) b!644364))

(assert (= (and b!644361 (not c!73773)) b!644363))

(assert (= (and b!644364 res!417549) b!644362))

(assert (= (or b!644362 b!644363) bm!33580))

(declare-fun m!617487 () Bool)

(assert (=> b!644361 m!617487))

(assert (=> b!644361 m!617487))

(declare-fun m!617489 () Bool)

(assert (=> b!644361 m!617489))

(declare-fun m!617491 () Bool)

(assert (=> bm!33580 m!617491))

(assert (=> b!644364 m!617487))

(declare-fun m!617493 () Bool)

(assert (=> b!644364 m!617493))

(declare-fun m!617495 () Bool)

(assert (=> b!644364 m!617495))

(assert (=> b!644364 m!617487))

(declare-fun m!617497 () Bool)

(assert (=> b!644364 m!617497))

(assert (=> b!644197 d!90855))

(declare-fun d!90857 () Bool)

(declare-fun res!417555 () Bool)

(declare-fun e!369184 () Bool)

(assert (=> d!90857 (=> res!417555 e!369184)))

(assert (=> d!90857 (= res!417555 (= (select (arr!18431 lt!298486) index!984) (select (arr!18431 a!2986) j!136)))))

(assert (=> d!90857 (= (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) index!984) e!369184)))

(declare-fun b!644369 () Bool)

(declare-fun e!369185 () Bool)

(assert (=> b!644369 (= e!369184 e!369185)))

(declare-fun res!417556 () Bool)

(assert (=> b!644369 (=> (not res!417556) (not e!369185))))

(assert (=> b!644369 (= res!417556 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18796 lt!298486)))))

(declare-fun b!644370 () Bool)

(assert (=> b!644370 (= e!369185 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90857 (not res!417555)) b!644369))

(assert (= (and b!644369 res!417556) b!644370))

(declare-fun m!617499 () Bool)

(assert (=> d!90857 m!617499))

(assert (=> b!644370 m!617307))

(declare-fun m!617501 () Bool)

(assert (=> b!644370 m!617501))

(assert (=> b!644207 d!90857))

(declare-fun b!644383 () Bool)

(declare-fun e!369192 () SeekEntryResult!6868)

(declare-fun e!369193 () SeekEntryResult!6868)

(assert (=> b!644383 (= e!369192 e!369193)))

(declare-fun lt!298599 () (_ BitVec 64))

(declare-fun lt!298598 () SeekEntryResult!6868)

(assert (=> b!644383 (= lt!298599 (select (arr!18431 a!2986) (index!29806 lt!298598)))))

(declare-fun c!73780 () Bool)

(assert (=> b!644383 (= c!73780 (= lt!298599 k0!1786))))

(declare-fun b!644384 () Bool)

(assert (=> b!644384 (= e!369192 Undefined!6868)))

(declare-fun e!369194 () SeekEntryResult!6868)

(declare-fun b!644385 () Bool)

(assert (=> b!644385 (= e!369194 (seekKeyOrZeroReturnVacant!0 (x!58583 lt!298598) (index!29806 lt!298598) (index!29806 lt!298598) k0!1786 a!2986 mask!3053))))

(declare-fun b!644386 () Bool)

(assert (=> b!644386 (= e!369194 (MissingZero!6868 (index!29806 lt!298598)))))

(declare-fun b!644387 () Bool)

(assert (=> b!644387 (= e!369193 (Found!6868 (index!29806 lt!298598)))))

(declare-fun d!90859 () Bool)

(declare-fun lt!298597 () SeekEntryResult!6868)

(get-info :version)

(assert (=> d!90859 (and (or ((_ is Undefined!6868) lt!298597) (not ((_ is Found!6868) lt!298597)) (and (bvsge (index!29805 lt!298597) #b00000000000000000000000000000000) (bvslt (index!29805 lt!298597) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298597) ((_ is Found!6868) lt!298597) (not ((_ is MissingZero!6868) lt!298597)) (and (bvsge (index!29804 lt!298597) #b00000000000000000000000000000000) (bvslt (index!29804 lt!298597) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298597) ((_ is Found!6868) lt!298597) ((_ is MissingZero!6868) lt!298597) (not ((_ is MissingVacant!6868) lt!298597)) (and (bvsge (index!29807 lt!298597) #b00000000000000000000000000000000) (bvslt (index!29807 lt!298597) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298597) (ite ((_ is Found!6868) lt!298597) (= (select (arr!18431 a!2986) (index!29805 lt!298597)) k0!1786) (ite ((_ is MissingZero!6868) lt!298597) (= (select (arr!18431 a!2986) (index!29804 lt!298597)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6868) lt!298597) (= (select (arr!18431 a!2986) (index!29807 lt!298597)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90859 (= lt!298597 e!369192)))

(declare-fun c!73781 () Bool)

(assert (=> d!90859 (= c!73781 (and ((_ is Intermediate!6868) lt!298598) (undefined!7680 lt!298598)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38436 (_ BitVec 32)) SeekEntryResult!6868)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90859 (= lt!298598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90859 (validMask!0 mask!3053)))

(assert (=> d!90859 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!298597)))

(declare-fun b!644388 () Bool)

(declare-fun c!73782 () Bool)

(assert (=> b!644388 (= c!73782 (= lt!298599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644388 (= e!369193 e!369194)))

(assert (= (and d!90859 c!73781) b!644384))

(assert (= (and d!90859 (not c!73781)) b!644383))

(assert (= (and b!644383 c!73780) b!644387))

(assert (= (and b!644383 (not c!73780)) b!644388))

(assert (= (and b!644388 c!73782) b!644386))

(assert (= (and b!644388 (not c!73782)) b!644385))

(declare-fun m!617503 () Bool)

(assert (=> b!644383 m!617503))

(declare-fun m!617505 () Bool)

(assert (=> b!644385 m!617505))

(declare-fun m!617507 () Bool)

(assert (=> d!90859 m!617507))

(declare-fun m!617509 () Bool)

(assert (=> d!90859 m!617509))

(assert (=> d!90859 m!617507))

(declare-fun m!617511 () Bool)

(assert (=> d!90859 m!617511))

(assert (=> d!90859 m!617341))

(declare-fun m!617513 () Bool)

(assert (=> d!90859 m!617513))

(declare-fun m!617515 () Bool)

(assert (=> d!90859 m!617515))

(assert (=> b!644206 d!90859))

(declare-fun d!90861 () Bool)

(assert (=> d!90861 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58328 d!90861))

(declare-fun d!90871 () Bool)

(assert (=> d!90871 (= (array_inv!14314 a!2986) (bvsge (size!18796 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58328 d!90871))

(declare-fun d!90875 () Bool)

(assert (=> d!90875 (= (validKeyInArray!0 (select (arr!18431 a!2986) j!136)) (and (not (= (select (arr!18431 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18431 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644195 d!90875))

(assert (=> b!644199 d!90857))

(declare-fun d!90877 () Bool)

(declare-fun lt!298626 () SeekEntryResult!6868)

(assert (=> d!90877 (and (or ((_ is Undefined!6868) lt!298626) (not ((_ is Found!6868) lt!298626)) (and (bvsge (index!29805 lt!298626) #b00000000000000000000000000000000) (bvslt (index!29805 lt!298626) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298626) ((_ is Found!6868) lt!298626) (not ((_ is MissingVacant!6868) lt!298626)) (not (= (index!29807 lt!298626) vacantSpotIndex!68)) (and (bvsge (index!29807 lt!298626) #b00000000000000000000000000000000) (bvslt (index!29807 lt!298626) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298626) (ite ((_ is Found!6868) lt!298626) (= (select (arr!18431 a!2986) (index!29805 lt!298626)) (select (arr!18431 a!2986) j!136)) (and ((_ is MissingVacant!6868) lt!298626) (= (index!29807 lt!298626) vacantSpotIndex!68) (= (select (arr!18431 a!2986) (index!29807 lt!298626)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369247 () SeekEntryResult!6868)

(assert (=> d!90877 (= lt!298626 e!369247)))

(declare-fun c!73809 () Bool)

(assert (=> d!90877 (= c!73809 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298627 () (_ BitVec 64))

(assert (=> d!90877 (= lt!298627 (select (arr!18431 a!2986) index!984))))

(assert (=> d!90877 (validMask!0 mask!3053)))

(assert (=> d!90877 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053) lt!298626)))

(declare-fun b!644465 () Bool)

(declare-fun e!369246 () SeekEntryResult!6868)

(assert (=> b!644465 (= e!369246 (MissingVacant!6868 vacantSpotIndex!68))))

(declare-fun b!644466 () Bool)

(declare-fun e!369248 () SeekEntryResult!6868)

(assert (=> b!644466 (= e!369248 (Found!6868 index!984))))

(declare-fun b!644467 () Bool)

(assert (=> b!644467 (= e!369247 e!369248)))

(declare-fun c!73810 () Bool)

(assert (=> b!644467 (= c!73810 (= lt!298627 (select (arr!18431 a!2986) j!136)))))

(declare-fun b!644468 () Bool)

(assert (=> b!644468 (= e!369246 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644469 () Bool)

(assert (=> b!644469 (= e!369247 Undefined!6868)))

(declare-fun b!644470 () Bool)

(declare-fun c!73808 () Bool)

(assert (=> b!644470 (= c!73808 (= lt!298627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644470 (= e!369248 e!369246)))

(assert (= (and d!90877 c!73809) b!644469))

(assert (= (and d!90877 (not c!73809)) b!644467))

(assert (= (and b!644467 c!73810) b!644466))

(assert (= (and b!644467 (not c!73810)) b!644470))

(assert (= (and b!644470 c!73808) b!644465))

(assert (= (and b!644470 (not c!73808)) b!644468))

(declare-fun m!617577 () Bool)

(assert (=> d!90877 m!617577))

(declare-fun m!617579 () Bool)

(assert (=> d!90877 m!617579))

(assert (=> d!90877 m!617337))

(assert (=> d!90877 m!617341))

(assert (=> b!644468 m!617313))

(assert (=> b!644468 m!617313))

(assert (=> b!644468 m!617307))

(declare-fun m!617581 () Bool)

(assert (=> b!644468 m!617581))

(assert (=> b!644209 d!90877))

(declare-fun d!90897 () Bool)

(declare-fun res!417583 () Bool)

(declare-fun e!369249 () Bool)

(assert (=> d!90897 (=> res!417583 e!369249)))

(assert (=> d!90897 (= res!417583 (= (select (arr!18431 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90897 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!369249)))

(declare-fun b!644471 () Bool)

(declare-fun e!369250 () Bool)

(assert (=> b!644471 (= e!369249 e!369250)))

(declare-fun res!417584 () Bool)

(assert (=> b!644471 (=> (not res!417584) (not e!369250))))

(assert (=> b!644471 (= res!417584 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18796 a!2986)))))

(declare-fun b!644472 () Bool)

(assert (=> b!644472 (= e!369250 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90897 (not res!417583)) b!644471))

(assert (= (and b!644471 res!417584) b!644472))

(assert (=> d!90897 m!617487))

(declare-fun m!617583 () Bool)

(assert (=> b!644472 m!617583))

(assert (=> b!644208 d!90897))

(declare-fun d!90899 () Bool)

(assert (=> d!90899 (arrayNoDuplicates!0 lt!298486 j!136 Nil!12508)))

(declare-fun lt!298633 () Unit!21836)

(declare-fun choose!39 (array!38436 (_ BitVec 32) (_ BitVec 32)) Unit!21836)

(assert (=> d!90899 (= lt!298633 (choose!39 lt!298486 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90899 (bvslt (size!18796 lt!298486) #b01111111111111111111111111111111)))

(assert (=> d!90899 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!298486 #b00000000000000000000000000000000 j!136) lt!298633)))

(declare-fun bs!19243 () Bool)

(assert (= bs!19243 d!90899))

(assert (=> bs!19243 m!617353))

(declare-fun m!617591 () Bool)

(assert (=> bs!19243 m!617591))

(assert (=> b!644202 d!90899))

(declare-fun b!644502 () Bool)

(declare-fun e!369278 () Bool)

(declare-fun call!33592 () Bool)

(assert (=> b!644502 (= e!369278 call!33592)))

(declare-fun bm!33589 () Bool)

(declare-fun c!73815 () Bool)

(assert (=> bm!33589 (= call!33592 (arrayNoDuplicates!0 lt!298486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73815 (Cons!12507 (select (arr!18431 lt!298486) #b00000000000000000000000000000000) Nil!12508) Nil!12508)))))

(declare-fun b!644503 () Bool)

(declare-fun e!369277 () Bool)

(assert (=> b!644503 (= e!369277 e!369278)))

(assert (=> b!644503 (= c!73815 (validKeyInArray!0 (select (arr!18431 lt!298486) #b00000000000000000000000000000000)))))

(declare-fun b!644504 () Bool)

(declare-fun e!369276 () Bool)

(declare-fun contains!3128 (List!12511 (_ BitVec 64)) Bool)

(assert (=> b!644504 (= e!369276 (contains!3128 Nil!12508 (select (arr!18431 lt!298486) #b00000000000000000000000000000000)))))

(declare-fun d!90907 () Bool)

(declare-fun res!417607 () Bool)

(declare-fun e!369279 () Bool)

(assert (=> d!90907 (=> res!417607 e!369279)))

(assert (=> d!90907 (= res!417607 (bvsge #b00000000000000000000000000000000 (size!18796 lt!298486)))))

(assert (=> d!90907 (= (arrayNoDuplicates!0 lt!298486 #b00000000000000000000000000000000 Nil!12508) e!369279)))

(declare-fun b!644505 () Bool)

(assert (=> b!644505 (= e!369278 call!33592)))

(declare-fun b!644506 () Bool)

(assert (=> b!644506 (= e!369279 e!369277)))

(declare-fun res!417606 () Bool)

(assert (=> b!644506 (=> (not res!417606) (not e!369277))))

(assert (=> b!644506 (= res!417606 (not e!369276))))

(declare-fun res!417608 () Bool)

(assert (=> b!644506 (=> (not res!417608) (not e!369276))))

(assert (=> b!644506 (= res!417608 (validKeyInArray!0 (select (arr!18431 lt!298486) #b00000000000000000000000000000000)))))

(assert (= (and d!90907 (not res!417607)) b!644506))

(assert (= (and b!644506 res!417608) b!644504))

(assert (= (and b!644506 res!417606) b!644503))

(assert (= (and b!644503 c!73815) b!644502))

(assert (= (and b!644503 (not c!73815)) b!644505))

(assert (= (or b!644502 b!644505) bm!33589))

(declare-fun m!617601 () Bool)

(assert (=> bm!33589 m!617601))

(declare-fun m!617603 () Bool)

(assert (=> bm!33589 m!617603))

(assert (=> b!644503 m!617601))

(assert (=> b!644503 m!617601))

(declare-fun m!617605 () Bool)

(assert (=> b!644503 m!617605))

(assert (=> b!644504 m!617601))

(assert (=> b!644504 m!617601))

(declare-fun m!617609 () Bool)

(assert (=> b!644504 m!617609))

(assert (=> b!644506 m!617601))

(assert (=> b!644506 m!617601))

(assert (=> b!644506 m!617605))

(assert (=> b!644202 d!90907))

(declare-fun d!90913 () Bool)

(assert (=> d!90913 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298648 () Unit!21836)

(declare-fun choose!114 (array!38436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21836)

(assert (=> d!90913 (= lt!298648 (choose!114 lt!298486 (select (arr!18431 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90913 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90913 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298486 (select (arr!18431 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298648)))

(declare-fun bs!19244 () Bool)

(assert (= bs!19244 d!90913))

(assert (=> bs!19244 m!617307))

(assert (=> bs!19244 m!617361))

(assert (=> bs!19244 m!617307))

(declare-fun m!617625 () Bool)

(assert (=> bs!19244 m!617625))

(assert (=> b!644202 d!90913))

(declare-fun d!90921 () Bool)

(declare-fun res!417615 () Bool)

(declare-fun e!369288 () Bool)

(assert (=> d!90921 (=> res!417615 e!369288)))

(assert (=> d!90921 (= res!417615 (= (select (arr!18431 lt!298486) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18431 a!2986) j!136)))))

(assert (=> d!90921 (= (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!369288)))

(declare-fun b!644517 () Bool)

(declare-fun e!369289 () Bool)

(assert (=> b!644517 (= e!369288 e!369289)))

(declare-fun res!417616 () Bool)

(assert (=> b!644517 (=> (not res!417616) (not e!369289))))

(assert (=> b!644517 (= res!417616 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18796 lt!298486)))))

(declare-fun b!644518 () Bool)

(assert (=> b!644518 (= e!369289 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90921 (not res!417615)) b!644517))

(assert (= (and b!644517 res!417616) b!644518))

(declare-fun m!617629 () Bool)

(assert (=> d!90921 m!617629))

(assert (=> b!644518 m!617307))

(declare-fun m!617631 () Bool)

(assert (=> b!644518 m!617631))

(assert (=> b!644202 d!90921))

(declare-fun b!644519 () Bool)

(declare-fun e!369292 () Bool)

(declare-fun call!33595 () Bool)

(assert (=> b!644519 (= e!369292 call!33595)))

(declare-fun c!73818 () Bool)

(declare-fun bm!33592 () Bool)

(assert (=> bm!33592 (= call!33595 (arrayNoDuplicates!0 lt!298486 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73818 (Cons!12507 (select (arr!18431 lt!298486) j!136) Nil!12508) Nil!12508)))))

(declare-fun b!644520 () Bool)

(declare-fun e!369291 () Bool)

(assert (=> b!644520 (= e!369291 e!369292)))

(assert (=> b!644520 (= c!73818 (validKeyInArray!0 (select (arr!18431 lt!298486) j!136)))))

(declare-fun b!644521 () Bool)

(declare-fun e!369290 () Bool)

(assert (=> b!644521 (= e!369290 (contains!3128 Nil!12508 (select (arr!18431 lt!298486) j!136)))))

(declare-fun d!90925 () Bool)

(declare-fun res!417618 () Bool)

(declare-fun e!369293 () Bool)

(assert (=> d!90925 (=> res!417618 e!369293)))

(assert (=> d!90925 (= res!417618 (bvsge j!136 (size!18796 lt!298486)))))

(assert (=> d!90925 (= (arrayNoDuplicates!0 lt!298486 j!136 Nil!12508) e!369293)))

(declare-fun b!644522 () Bool)

(assert (=> b!644522 (= e!369292 call!33595)))

(declare-fun b!644523 () Bool)

(assert (=> b!644523 (= e!369293 e!369291)))

(declare-fun res!417617 () Bool)

(assert (=> b!644523 (=> (not res!417617) (not e!369291))))

(assert (=> b!644523 (= res!417617 (not e!369290))))

(declare-fun res!417619 () Bool)

(assert (=> b!644523 (=> (not res!417619) (not e!369290))))

(assert (=> b!644523 (= res!417619 (validKeyInArray!0 (select (arr!18431 lt!298486) j!136)))))

(assert (= (and d!90925 (not res!417618)) b!644523))

(assert (= (and b!644523 res!417619) b!644521))

(assert (= (and b!644523 res!417617) b!644520))

(assert (= (and b!644520 c!73818) b!644519))

(assert (= (and b!644520 (not c!73818)) b!644522))

(assert (= (or b!644519 b!644522) bm!33592))

(declare-fun m!617633 () Bool)

(assert (=> bm!33592 m!617633))

(declare-fun m!617635 () Bool)

(assert (=> bm!33592 m!617635))

(assert (=> b!644520 m!617633))

(assert (=> b!644520 m!617633))

(declare-fun m!617637 () Bool)

(assert (=> b!644520 m!617637))

(assert (=> b!644521 m!617633))

(assert (=> b!644521 m!617633))

(declare-fun m!617639 () Bool)

(assert (=> b!644521 m!617639))

(assert (=> b!644523 m!617633))

(assert (=> b!644523 m!617633))

(assert (=> b!644523 m!617637))

(assert (=> b!644202 d!90925))

(declare-fun d!90927 () Bool)

(declare-fun e!369296 () Bool)

(assert (=> d!90927 e!369296))

(declare-fun res!417622 () Bool)

(assert (=> d!90927 (=> (not res!417622) (not e!369296))))

(assert (=> d!90927 (= res!417622 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18796 a!2986))))))

(declare-fun lt!298651 () Unit!21836)

(declare-fun choose!41 (array!38436 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12511) Unit!21836)

(assert (=> d!90927 (= lt!298651 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12508))))

(assert (=> d!90927 (bvslt (size!18796 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90927 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12508) lt!298651)))

(declare-fun b!644526 () Bool)

(assert (=> b!644526 (= e!369296 (arrayNoDuplicates!0 (array!38437 (store (arr!18431 a!2986) i!1108 k0!1786) (size!18796 a!2986)) #b00000000000000000000000000000000 Nil!12508))))

(assert (= (and d!90927 res!417622) b!644526))

(declare-fun m!617641 () Bool)

(assert (=> d!90927 m!617641))

(assert (=> b!644526 m!617325))

(declare-fun m!617643 () Bool)

(assert (=> b!644526 m!617643))

(assert (=> b!644202 d!90927))

(declare-fun d!90929 () Bool)

(assert (=> d!90929 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18796 lt!298486)) (not (= (select (arr!18431 lt!298486) j!136) (select (arr!18431 a!2986) j!136))))))

(declare-fun lt!298654 () Unit!21836)

(declare-fun choose!21 (array!38436 (_ BitVec 64) (_ BitVec 32) List!12511) Unit!21836)

(assert (=> d!90929 (= lt!298654 (choose!21 lt!298486 (select (arr!18431 a!2986) j!136) j!136 Nil!12508))))

(assert (=> d!90929 (bvslt (size!18796 lt!298486) #b01111111111111111111111111111111)))

(assert (=> d!90929 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298486 (select (arr!18431 a!2986) j!136) j!136 Nil!12508) lt!298654)))

(declare-fun bs!19245 () Bool)

(assert (= bs!19245 d!90929))

(assert (=> bs!19245 m!617633))

(assert (=> bs!19245 m!617307))

(declare-fun m!617649 () Bool)

(assert (=> bs!19245 m!617649))

(assert (=> b!644202 d!90929))

(declare-fun b!644529 () Bool)

(declare-fun e!369301 () Bool)

(declare-fun call!33596 () Bool)

(assert (=> b!644529 (= e!369301 call!33596)))

(declare-fun bm!33593 () Bool)

(declare-fun c!73819 () Bool)

(assert (=> bm!33593 (= call!33596 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73819 (Cons!12507 (select (arr!18431 a!2986) #b00000000000000000000000000000000) Nil!12508) Nil!12508)))))

(declare-fun b!644530 () Bool)

(declare-fun e!369300 () Bool)

(assert (=> b!644530 (= e!369300 e!369301)))

(assert (=> b!644530 (= c!73819 (validKeyInArray!0 (select (arr!18431 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!644531 () Bool)

(declare-fun e!369299 () Bool)

(assert (=> b!644531 (= e!369299 (contains!3128 Nil!12508 (select (arr!18431 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90937 () Bool)

(declare-fun res!417626 () Bool)

(declare-fun e!369302 () Bool)

(assert (=> d!90937 (=> res!417626 e!369302)))

(assert (=> d!90937 (= res!417626 (bvsge #b00000000000000000000000000000000 (size!18796 a!2986)))))

(assert (=> d!90937 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12508) e!369302)))

(declare-fun b!644532 () Bool)

(assert (=> b!644532 (= e!369301 call!33596)))

(declare-fun b!644533 () Bool)

(assert (=> b!644533 (= e!369302 e!369300)))

(declare-fun res!417625 () Bool)

(assert (=> b!644533 (=> (not res!417625) (not e!369300))))

(assert (=> b!644533 (= res!417625 (not e!369299))))

(declare-fun res!417627 () Bool)

(assert (=> b!644533 (=> (not res!417627) (not e!369299))))

(assert (=> b!644533 (= res!417627 (validKeyInArray!0 (select (arr!18431 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90937 (not res!417626)) b!644533))

(assert (= (and b!644533 res!417627) b!644531))

(assert (= (and b!644533 res!417625) b!644530))

(assert (= (and b!644530 c!73819) b!644529))

(assert (= (and b!644530 (not c!73819)) b!644532))

(assert (= (or b!644529 b!644532) bm!33593))

(assert (=> bm!33593 m!617487))

(declare-fun m!617651 () Bool)

(assert (=> bm!33593 m!617651))

(assert (=> b!644530 m!617487))

(assert (=> b!644530 m!617487))

(assert (=> b!644530 m!617489))

(assert (=> b!644531 m!617487))

(assert (=> b!644531 m!617487))

(declare-fun m!617653 () Bool)

(assert (=> b!644531 m!617653))

(assert (=> b!644533 m!617487))

(assert (=> b!644533 m!617487))

(assert (=> b!644533 m!617489))

(assert (=> b!644200 d!90937))

(declare-fun d!90939 () Bool)

(declare-fun e!369342 () Bool)

(assert (=> d!90939 e!369342))

(declare-fun res!417648 () Bool)

(assert (=> d!90939 (=> (not res!417648) (not e!369342))))

(assert (=> d!90939 (= res!417648 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18796 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18796 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18796 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18796 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18796 a!2986))))))

(declare-fun lt!298679 () Unit!21836)

(declare-fun choose!9 (array!38436 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21836)

(assert (=> d!90939 (= lt!298679 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90939 (validMask!0 mask!3053)))

(assert (=> d!90939 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 mask!3053) lt!298679)))

(declare-fun b!644592 () Bool)

(assert (=> b!644592 (= e!369342 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 (select (store (arr!18431 a!2986) i!1108 k0!1786) j!136) (array!38437 (store (arr!18431 a!2986) i!1108 k0!1786) (size!18796 a!2986)) mask!3053)))))

(assert (= (and d!90939 res!417648) b!644592))

(declare-fun m!617697 () Bool)

(assert (=> d!90939 m!617697))

(assert (=> d!90939 m!617341))

(assert (=> b!644592 m!617315))

(declare-fun m!617699 () Bool)

(assert (=> b!644592 m!617699))

(assert (=> b!644592 m!617325))

(assert (=> b!644592 m!617307))

(assert (=> b!644592 m!617321))

(assert (=> b!644592 m!617307))

(assert (=> b!644592 m!617315))

(assert (=> b!644194 d!90939))

(declare-fun d!90955 () Bool)

(declare-fun lt!298681 () SeekEntryResult!6868)

(assert (=> d!90955 (and (or ((_ is Undefined!6868) lt!298681) (not ((_ is Found!6868) lt!298681)) (and (bvsge (index!29805 lt!298681) #b00000000000000000000000000000000) (bvslt (index!29805 lt!298681) (size!18796 lt!298486)))) (or ((_ is Undefined!6868) lt!298681) ((_ is Found!6868) lt!298681) (not ((_ is MissingVacant!6868) lt!298681)) (not (= (index!29807 lt!298681) vacantSpotIndex!68)) (and (bvsge (index!29807 lt!298681) #b00000000000000000000000000000000) (bvslt (index!29807 lt!298681) (size!18796 lt!298486)))) (or ((_ is Undefined!6868) lt!298681) (ite ((_ is Found!6868) lt!298681) (= (select (arr!18431 lt!298486) (index!29805 lt!298681)) lt!298491) (and ((_ is MissingVacant!6868) lt!298681) (= (index!29807 lt!298681) vacantSpotIndex!68) (= (select (arr!18431 lt!298486) (index!29807 lt!298681)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369348 () SeekEntryResult!6868)

(assert (=> d!90955 (= lt!298681 e!369348)))

(declare-fun c!73841 () Bool)

(assert (=> d!90955 (= c!73841 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!298682 () (_ BitVec 64))

(assert (=> d!90955 (= lt!298682 (select (arr!18431 lt!298486) index!984))))

(assert (=> d!90955 (validMask!0 mask!3053)))

(assert (=> d!90955 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298491 lt!298486 mask!3053) lt!298681)))

(declare-fun b!644598 () Bool)

(declare-fun e!369347 () SeekEntryResult!6868)

(assert (=> b!644598 (= e!369347 (MissingVacant!6868 vacantSpotIndex!68))))

(declare-fun b!644599 () Bool)

(declare-fun e!369349 () SeekEntryResult!6868)

(assert (=> b!644599 (= e!369349 (Found!6868 index!984))))

(declare-fun b!644600 () Bool)

(assert (=> b!644600 (= e!369348 e!369349)))

(declare-fun c!73842 () Bool)

(assert (=> b!644600 (= c!73842 (= lt!298682 lt!298491))))

(declare-fun b!644601 () Bool)

(assert (=> b!644601 (= e!369347 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!298491 lt!298486 mask!3053))))

(declare-fun b!644602 () Bool)

(assert (=> b!644602 (= e!369348 Undefined!6868)))

(declare-fun b!644603 () Bool)

(declare-fun c!73840 () Bool)

(assert (=> b!644603 (= c!73840 (= lt!298682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644603 (= e!369349 e!369347)))

(assert (= (and d!90955 c!73841) b!644602))

(assert (= (and d!90955 (not c!73841)) b!644600))

(assert (= (and b!644600 c!73842) b!644599))

(assert (= (and b!644600 (not c!73842)) b!644603))

(assert (= (and b!644603 c!73840) b!644598))

(assert (= (and b!644603 (not c!73840)) b!644601))

(declare-fun m!617709 () Bool)

(assert (=> d!90955 m!617709))

(declare-fun m!617711 () Bool)

(assert (=> d!90955 m!617711))

(assert (=> d!90955 m!617499))

(assert (=> d!90955 m!617341))

(assert (=> b!644601 m!617313))

(assert (=> b!644601 m!617313))

(declare-fun m!617713 () Bool)

(assert (=> b!644601 m!617713))

(assert (=> b!644194 d!90955))

(declare-fun lt!298683 () SeekEntryResult!6868)

(declare-fun d!90961 () Bool)

(assert (=> d!90961 (and (or ((_ is Undefined!6868) lt!298683) (not ((_ is Found!6868) lt!298683)) (and (bvsge (index!29805 lt!298683) #b00000000000000000000000000000000) (bvslt (index!29805 lt!298683) (size!18796 lt!298486)))) (or ((_ is Undefined!6868) lt!298683) ((_ is Found!6868) lt!298683) (not ((_ is MissingVacant!6868) lt!298683)) (not (= (index!29807 lt!298683) vacantSpotIndex!68)) (and (bvsge (index!29807 lt!298683) #b00000000000000000000000000000000) (bvslt (index!29807 lt!298683) (size!18796 lt!298486)))) (or ((_ is Undefined!6868) lt!298683) (ite ((_ is Found!6868) lt!298683) (= (select (arr!18431 lt!298486) (index!29805 lt!298683)) lt!298491) (and ((_ is MissingVacant!6868) lt!298683) (= (index!29807 lt!298683) vacantSpotIndex!68) (= (select (arr!18431 lt!298486) (index!29807 lt!298683)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369351 () SeekEntryResult!6868)

(assert (=> d!90961 (= lt!298683 e!369351)))

(declare-fun c!73844 () Bool)

(assert (=> d!90961 (= c!73844 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298684 () (_ BitVec 64))

(assert (=> d!90961 (= lt!298684 (select (arr!18431 lt!298486) lt!298482))))

(assert (=> d!90961 (validMask!0 mask!3053)))

(assert (=> d!90961 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 lt!298491 lt!298486 mask!3053) lt!298683)))

(declare-fun b!644604 () Bool)

(declare-fun e!369350 () SeekEntryResult!6868)

(assert (=> b!644604 (= e!369350 (MissingVacant!6868 vacantSpotIndex!68))))

(declare-fun b!644605 () Bool)

(declare-fun e!369352 () SeekEntryResult!6868)

(assert (=> b!644605 (= e!369352 (Found!6868 lt!298482))))

(declare-fun b!644606 () Bool)

(assert (=> b!644606 (= e!369351 e!369352)))

(declare-fun c!73845 () Bool)

(assert (=> b!644606 (= c!73845 (= lt!298684 lt!298491))))

(declare-fun b!644607 () Bool)

(assert (=> b!644607 (= e!369350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298482 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!298491 lt!298486 mask!3053))))

(declare-fun b!644608 () Bool)

(assert (=> b!644608 (= e!369351 Undefined!6868)))

(declare-fun b!644609 () Bool)

(declare-fun c!73843 () Bool)

(assert (=> b!644609 (= c!73843 (= lt!298684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644609 (= e!369352 e!369350)))

(assert (= (and d!90961 c!73844) b!644608))

(assert (= (and d!90961 (not c!73844)) b!644606))

(assert (= (and b!644606 c!73845) b!644605))

(assert (= (and b!644606 (not c!73845)) b!644609))

(assert (= (and b!644609 c!73843) b!644604))

(assert (= (and b!644609 (not c!73843)) b!644607))

(declare-fun m!617715 () Bool)

(assert (=> d!90961 m!617715))

(declare-fun m!617717 () Bool)

(assert (=> d!90961 m!617717))

(declare-fun m!617719 () Bool)

(assert (=> d!90961 m!617719))

(assert (=> d!90961 m!617341))

(declare-fun m!617721 () Bool)

(assert (=> b!644607 m!617721))

(assert (=> b!644607 m!617721))

(declare-fun m!617723 () Bool)

(assert (=> b!644607 m!617723))

(assert (=> b!644194 d!90961))

(declare-fun d!90965 () Bool)

(declare-fun lt!298693 () (_ BitVec 32))

(assert (=> d!90965 (and (bvsge lt!298693 #b00000000000000000000000000000000) (bvslt lt!298693 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90965 (= lt!298693 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90965 (validMask!0 mask!3053)))

(assert (=> d!90965 (= (nextIndex!0 index!984 x!910 mask!3053) lt!298693)))

(declare-fun bs!19249 () Bool)

(assert (= bs!19249 d!90965))

(declare-fun m!617729 () Bool)

(assert (=> bs!19249 m!617729))

(assert (=> bs!19249 m!617341))

(assert (=> b!644194 d!90965))

(declare-fun lt!298694 () SeekEntryResult!6868)

(declare-fun d!90971 () Bool)

(assert (=> d!90971 (and (or ((_ is Undefined!6868) lt!298694) (not ((_ is Found!6868) lt!298694)) (and (bvsge (index!29805 lt!298694) #b00000000000000000000000000000000) (bvslt (index!29805 lt!298694) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298694) ((_ is Found!6868) lt!298694) (not ((_ is MissingVacant!6868) lt!298694)) (not (= (index!29807 lt!298694) vacantSpotIndex!68)) (and (bvsge (index!29807 lt!298694) #b00000000000000000000000000000000) (bvslt (index!29807 lt!298694) (size!18796 a!2986)))) (or ((_ is Undefined!6868) lt!298694) (ite ((_ is Found!6868) lt!298694) (= (select (arr!18431 a!2986) (index!29805 lt!298694)) (select (arr!18431 a!2986) j!136)) (and ((_ is MissingVacant!6868) lt!298694) (= (index!29807 lt!298694) vacantSpotIndex!68) (= (select (arr!18431 a!2986) (index!29807 lt!298694)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369354 () SeekEntryResult!6868)

(assert (=> d!90971 (= lt!298694 e!369354)))

(declare-fun c!73847 () Bool)

(assert (=> d!90971 (= c!73847 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298695 () (_ BitVec 64))

(assert (=> d!90971 (= lt!298695 (select (arr!18431 a!2986) lt!298482))))

(assert (=> d!90971 (validMask!0 mask!3053)))

(assert (=> d!90971 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298482 vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053) lt!298694)))

(declare-fun b!644610 () Bool)

(declare-fun e!369353 () SeekEntryResult!6868)

(assert (=> b!644610 (= e!369353 (MissingVacant!6868 vacantSpotIndex!68))))

(declare-fun b!644611 () Bool)

(declare-fun e!369355 () SeekEntryResult!6868)

(assert (=> b!644611 (= e!369355 (Found!6868 lt!298482))))

(declare-fun b!644612 () Bool)

(assert (=> b!644612 (= e!369354 e!369355)))

(declare-fun c!73848 () Bool)

(assert (=> b!644612 (= c!73848 (= lt!298695 (select (arr!18431 a!2986) j!136)))))

(declare-fun b!644613 () Bool)

(assert (=> b!644613 (= e!369353 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298482 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18431 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644614 () Bool)

(assert (=> b!644614 (= e!369354 Undefined!6868)))

(declare-fun b!644615 () Bool)

(declare-fun c!73846 () Bool)

(assert (=> b!644615 (= c!73846 (= lt!298695 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644615 (= e!369355 e!369353)))

(assert (= (and d!90971 c!73847) b!644614))

(assert (= (and d!90971 (not c!73847)) b!644612))

(assert (= (and b!644612 c!73848) b!644611))

(assert (= (and b!644612 (not c!73848)) b!644615))

(assert (= (and b!644615 c!73846) b!644610))

(assert (= (and b!644615 (not c!73846)) b!644613))

(declare-fun m!617731 () Bool)

(assert (=> d!90971 m!617731))

(declare-fun m!617733 () Bool)

(assert (=> d!90971 m!617733))

(declare-fun m!617735 () Bool)

(assert (=> d!90971 m!617735))

(assert (=> d!90971 m!617341))

(assert (=> b!644613 m!617721))

(assert (=> b!644613 m!617721))

(assert (=> b!644613 m!617307))

(declare-fun m!617737 () Bool)

(assert (=> b!644613 m!617737))

(assert (=> b!644194 d!90971))

(declare-fun d!90973 () Bool)

(assert (=> d!90973 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644204 d!90973))

(declare-fun d!90975 () Bool)

(declare-fun res!417652 () Bool)

(declare-fun e!369356 () Bool)

(assert (=> d!90975 (=> res!417652 e!369356)))

(assert (=> d!90975 (= res!417652 (= (select (arr!18431 lt!298486) j!136) (select (arr!18431 a!2986) j!136)))))

(assert (=> d!90975 (= (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) j!136) e!369356)))

(declare-fun b!644616 () Bool)

(declare-fun e!369357 () Bool)

(assert (=> b!644616 (= e!369356 e!369357)))

(declare-fun res!417653 () Bool)

(assert (=> b!644616 (=> (not res!417653) (not e!369357))))

(assert (=> b!644616 (= res!417653 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18796 lt!298486)))))

(declare-fun b!644617 () Bool)

(assert (=> b!644617 (= e!369357 (arrayContainsKey!0 lt!298486 (select (arr!18431 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90975 (not res!417652)) b!644616))

(assert (= (and b!644616 res!417653) b!644617))

(assert (=> d!90975 m!617633))

(assert (=> b!644617 m!617307))

(declare-fun m!617739 () Bool)

(assert (=> b!644617 m!617739))

(assert (=> b!644214 d!90975))

(assert (=> b!644192 d!90975))

(check-sat (not bm!33592) (not b!644521) (not d!90961) (not b!644503) (not d!90965) (not b!644472) (not bm!33593) (not b!644607) (not b!644370) (not b!644601) (not d!90877) (not b!644592) (not b!644468) (not d!90913) (not d!90955) (not b!644530) (not b!644617) (not b!644526) (not d!90859) (not bm!33589) (not d!90899) (not d!90927) (not d!90939) (not b!644533) (not b!644531) (not b!644613) (not b!644523) (not b!644361) (not b!644506) (not bm!33580) (not d!90929) (not d!90971) (not b!644518) (not b!644364) (not b!644520) (not b!644385) (not b!644504))
(check-sat)
