; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58864 () Bool)

(assert start!58864)

(declare-fun res!420547 () Bool)

(declare-fun e!372224 () Bool)

(assert (=> start!58864 (=> (not res!420547) (not e!372224))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58864 (= res!420547 (validMask!0 mask!3053))))

(assert (=> start!58864 e!372224))

(assert (=> start!58864 true))

(declare-datatypes ((array!38526 0))(
  ( (array!38527 (arr!18469 (Array (_ BitVec 32) (_ BitVec 64))) (size!18833 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38526)

(declare-fun array_inv!14265 (array!38526) Bool)

(assert (=> start!58864 (array_inv!14265 a!2986)))

(declare-fun b!648972 () Bool)

(declare-fun e!372222 () Bool)

(declare-fun e!372229 () Bool)

(assert (=> b!648972 (= e!372222 e!372229)))

(declare-fun res!420555 () Bool)

(assert (=> b!648972 (=> res!420555 e!372229)))

(assert (=> b!648972 (= res!420555 (or (bvsge (size!18833 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18833 a!2986))))))

(declare-fun lt!301275 () array!38526)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648972 (arrayContainsKey!0 lt!301275 (select (arr!18469 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22080 0))(
  ( (Unit!22081) )
))
(declare-fun lt!301280 () Unit!22080)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22080)

(assert (=> b!648972 (= lt!301280 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301275 (select (arr!18469 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372225 () Bool)

(assert (=> b!648972 e!372225))

(declare-fun res!420552 () Bool)

(assert (=> b!648972 (=> (not res!420552) (not e!372225))))

(assert (=> b!648972 (= res!420552 (arrayContainsKey!0 lt!301275 (select (arr!18469 a!2986) j!136) j!136))))

(declare-fun b!648973 () Bool)

(assert (=> b!648973 (= e!372229 true)))

(declare-fun lt!301282 () Bool)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((List!12510 0))(
  ( (Nil!12507) (Cons!12506 (h!13551 (_ BitVec 64)) (t!18738 List!12510)) )
))
(declare-fun contains!3165 (List!12510 (_ BitVec 64)) Bool)

(assert (=> b!648973 (= lt!301282 (contains!3165 Nil!12507 k0!1786))))

(declare-fun b!648974 () Bool)

(declare-fun res!420540 () Bool)

(assert (=> b!648974 (=> (not res!420540) (not e!372224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648974 (= res!420540 (validKeyInArray!0 k0!1786))))

(declare-fun b!648975 () Bool)

(declare-fun e!372223 () Unit!22080)

(declare-fun Unit!22082 () Unit!22080)

(assert (=> b!648975 (= e!372223 Unit!22082)))

(declare-fun lt!301289 () Unit!22080)

(assert (=> b!648975 (= lt!301289 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301275 (select (arr!18469 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648975 (arrayContainsKey!0 lt!301275 (select (arr!18469 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!301276 () Unit!22080)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38526 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12510) Unit!22080)

(assert (=> b!648975 (= lt!301276 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12507))))

(declare-fun arrayNoDuplicates!0 (array!38526 (_ BitVec 32) List!12510) Bool)

(assert (=> b!648975 (arrayNoDuplicates!0 lt!301275 #b00000000000000000000000000000000 Nil!12507)))

(declare-fun lt!301279 () Unit!22080)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38526 (_ BitVec 32) (_ BitVec 32)) Unit!22080)

(assert (=> b!648975 (= lt!301279 (lemmaNoDuplicateFromThenFromBigger!0 lt!301275 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648975 (arrayNoDuplicates!0 lt!301275 j!136 Nil!12507)))

(declare-fun lt!301281 () Unit!22080)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38526 (_ BitVec 64) (_ BitVec 32) List!12510) Unit!22080)

(assert (=> b!648975 (= lt!301281 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301275 (select (arr!18469 a!2986) j!136) j!136 Nil!12507))))

(assert (=> b!648975 false))

(declare-fun b!648976 () Bool)

(declare-fun res!420558 () Bool)

(declare-fun e!372227 () Bool)

(assert (=> b!648976 (=> (not res!420558) (not e!372227))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!648976 (= res!420558 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18469 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648977 () Bool)

(declare-fun e!372233 () Unit!22080)

(declare-fun Unit!22083 () Unit!22080)

(assert (=> b!648977 (= e!372233 Unit!22083)))

(declare-fun b!648978 () Bool)

(declare-fun Unit!22084 () Unit!22080)

(assert (=> b!648978 (= e!372233 Unit!22084)))

(assert (=> b!648978 false))

(declare-fun b!648979 () Bool)

(declare-fun e!372232 () Bool)

(assert (=> b!648979 (= e!372232 e!372222)))

(declare-fun res!420538 () Bool)

(assert (=> b!648979 (=> res!420538 e!372222)))

(assert (=> b!648979 (= res!420538 (bvsge index!984 j!136))))

(declare-fun lt!301285 () Unit!22080)

(assert (=> b!648979 (= lt!301285 e!372223)))

(declare-fun c!74584 () Bool)

(assert (=> b!648979 (= c!74584 (bvslt j!136 index!984))))

(declare-fun b!648980 () Bool)

(declare-fun e!372235 () Bool)

(declare-fun e!372234 () Bool)

(assert (=> b!648980 (= e!372235 e!372234)))

(declare-fun res!420539 () Bool)

(assert (=> b!648980 (=> res!420539 e!372234)))

(declare-fun lt!301284 () (_ BitVec 64))

(declare-fun lt!301277 () (_ BitVec 64))

(assert (=> b!648980 (= res!420539 (or (not (= (select (arr!18469 a!2986) j!136) lt!301277)) (not (= (select (arr!18469 a!2986) j!136) lt!301284)) (bvsge j!136 index!984)))))

(declare-fun b!648981 () Bool)

(declare-fun res!420556 () Bool)

(assert (=> b!648981 (=> res!420556 e!372229)))

(assert (=> b!648981 (= res!420556 (contains!3165 Nil!12507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648982 () Bool)

(declare-fun e!372230 () Bool)

(assert (=> b!648982 (= e!372227 e!372230)))

(declare-fun res!420546 () Bool)

(assert (=> b!648982 (=> (not res!420546) (not e!372230))))

(assert (=> b!648982 (= res!420546 (= (select (store (arr!18469 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648982 (= lt!301275 (array!38527 (store (arr!18469 a!2986) i!1108 k0!1786) (size!18833 a!2986)))))

(declare-fun b!648983 () Bool)

(declare-fun res!420549 () Bool)

(assert (=> b!648983 (=> (not res!420549) (not e!372227))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38526 (_ BitVec 32)) Bool)

(assert (=> b!648983 (= res!420549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648984 () Bool)

(declare-fun e!372236 () Bool)

(declare-fun e!372231 () Bool)

(assert (=> b!648984 (= e!372236 (not e!372231))))

(declare-fun res!420554 () Bool)

(assert (=> b!648984 (=> res!420554 e!372231)))

(declare-datatypes ((SeekEntryResult!6909 0))(
  ( (MissingZero!6909 (index!29983 (_ BitVec 32))) (Found!6909 (index!29984 (_ BitVec 32))) (Intermediate!6909 (undefined!7721 Bool) (index!29985 (_ BitVec 32)) (x!58770 (_ BitVec 32))) (Undefined!6909) (MissingVacant!6909 (index!29986 (_ BitVec 32))) )
))
(declare-fun lt!301278 () SeekEntryResult!6909)

(assert (=> b!648984 (= res!420554 (not (= lt!301278 (Found!6909 index!984))))))

(declare-fun lt!301291 () Unit!22080)

(assert (=> b!648984 (= lt!301291 e!372233)))

(declare-fun c!74585 () Bool)

(assert (=> b!648984 (= c!74585 (= lt!301278 Undefined!6909))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38526 (_ BitVec 32)) SeekEntryResult!6909)

(assert (=> b!648984 (= lt!301278 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301277 lt!301275 mask!3053))))

(declare-fun e!372237 () Bool)

(assert (=> b!648984 e!372237))

(declare-fun res!420560 () Bool)

(assert (=> b!648984 (=> (not res!420560) (not e!372237))))

(declare-fun lt!301283 () (_ BitVec 32))

(declare-fun lt!301286 () SeekEntryResult!6909)

(assert (=> b!648984 (= res!420560 (= lt!301286 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301283 vacantSpotIndex!68 lt!301277 lt!301275 mask!3053)))))

(assert (=> b!648984 (= lt!301286 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301283 vacantSpotIndex!68 (select (arr!18469 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648984 (= lt!301277 (select (store (arr!18469 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301290 () Unit!22080)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38526 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22080)

(assert (=> b!648984 (= lt!301290 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301283 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648984 (= lt!301283 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648985 () Bool)

(declare-fun e!372228 () Bool)

(assert (=> b!648985 (= e!372234 e!372228)))

(declare-fun res!420553 () Bool)

(assert (=> b!648985 (=> (not res!420553) (not e!372228))))

(assert (=> b!648985 (= res!420553 (arrayContainsKey!0 lt!301275 (select (arr!18469 a!2986) j!136) j!136))))

(declare-fun b!648986 () Bool)

(declare-fun res!420557 () Bool)

(assert (=> b!648986 (=> res!420557 e!372229)))

(declare-fun noDuplicate!427 (List!12510) Bool)

(assert (=> b!648986 (= res!420557 (not (noDuplicate!427 Nil!12507)))))

(declare-fun b!648987 () Bool)

(declare-fun res!420551 () Bool)

(assert (=> b!648987 (=> (not res!420551) (not e!372224))))

(assert (=> b!648987 (= res!420551 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648988 () Bool)

(assert (=> b!648988 (= e!372225 (arrayContainsKey!0 lt!301275 (select (arr!18469 a!2986) j!136) index!984))))

(declare-fun b!648989 () Bool)

(declare-fun lt!301287 () SeekEntryResult!6909)

(assert (=> b!648989 (= e!372237 (= lt!301287 lt!301286))))

(declare-fun b!648990 () Bool)

(declare-fun res!420543 () Bool)

(assert (=> b!648990 (=> (not res!420543) (not e!372224))))

(assert (=> b!648990 (= res!420543 (and (= (size!18833 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18833 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18833 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648991 () Bool)

(declare-fun Unit!22085 () Unit!22080)

(assert (=> b!648991 (= e!372223 Unit!22085)))

(declare-fun b!648992 () Bool)

(assert (=> b!648992 (= e!372231 e!372232)))

(declare-fun res!420541 () Bool)

(assert (=> b!648992 (=> res!420541 e!372232)))

(assert (=> b!648992 (= res!420541 (or (not (= (select (arr!18469 a!2986) j!136) lt!301277)) (not (= (select (arr!18469 a!2986) j!136) lt!301284))))))

(assert (=> b!648992 e!372235))

(declare-fun res!420550 () Bool)

(assert (=> b!648992 (=> (not res!420550) (not e!372235))))

(assert (=> b!648992 (= res!420550 (= lt!301284 (select (arr!18469 a!2986) j!136)))))

(assert (=> b!648992 (= lt!301284 (select (store (arr!18469 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648993 () Bool)

(declare-fun res!420559 () Bool)

(assert (=> b!648993 (=> (not res!420559) (not e!372224))))

(assert (=> b!648993 (= res!420559 (validKeyInArray!0 (select (arr!18469 a!2986) j!136)))))

(declare-fun b!648994 () Bool)

(assert (=> b!648994 (= e!372224 e!372227)))

(declare-fun res!420544 () Bool)

(assert (=> b!648994 (=> (not res!420544) (not e!372227))))

(declare-fun lt!301288 () SeekEntryResult!6909)

(assert (=> b!648994 (= res!420544 (or (= lt!301288 (MissingZero!6909 i!1108)) (= lt!301288 (MissingVacant!6909 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38526 (_ BitVec 32)) SeekEntryResult!6909)

(assert (=> b!648994 (= lt!301288 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648995 () Bool)

(declare-fun res!420542 () Bool)

(assert (=> b!648995 (=> res!420542 e!372229)))

(assert (=> b!648995 (= res!420542 (contains!3165 Nil!12507 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648996 () Bool)

(assert (=> b!648996 (= e!372228 (arrayContainsKey!0 lt!301275 (select (arr!18469 a!2986) j!136) index!984))))

(declare-fun b!648997 () Bool)

(declare-fun res!420548 () Bool)

(assert (=> b!648997 (=> (not res!420548) (not e!372227))))

(assert (=> b!648997 (= res!420548 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12507))))

(declare-fun b!648998 () Bool)

(assert (=> b!648998 (= e!372230 e!372236)))

(declare-fun res!420545 () Bool)

(assert (=> b!648998 (=> (not res!420545) (not e!372236))))

(assert (=> b!648998 (= res!420545 (and (= lt!301287 (Found!6909 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18469 a!2986) index!984) (select (arr!18469 a!2986) j!136))) (not (= (select (arr!18469 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648998 (= lt!301287 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18469 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!58864 res!420547) b!648990))

(assert (= (and b!648990 res!420543) b!648993))

(assert (= (and b!648993 res!420559) b!648974))

(assert (= (and b!648974 res!420540) b!648987))

(assert (= (and b!648987 res!420551) b!648994))

(assert (= (and b!648994 res!420544) b!648983))

(assert (= (and b!648983 res!420549) b!648997))

(assert (= (and b!648997 res!420548) b!648976))

(assert (= (and b!648976 res!420558) b!648982))

(assert (= (and b!648982 res!420546) b!648998))

(assert (= (and b!648998 res!420545) b!648984))

(assert (= (and b!648984 res!420560) b!648989))

(assert (= (and b!648984 c!74585) b!648978))

(assert (= (and b!648984 (not c!74585)) b!648977))

(assert (= (and b!648984 (not res!420554)) b!648992))

(assert (= (and b!648992 res!420550) b!648980))

(assert (= (and b!648980 (not res!420539)) b!648985))

(assert (= (and b!648985 res!420553) b!648996))

(assert (= (and b!648992 (not res!420541)) b!648979))

(assert (= (and b!648979 c!74584) b!648975))

(assert (= (and b!648979 (not c!74584)) b!648991))

(assert (= (and b!648979 (not res!420538)) b!648972))

(assert (= (and b!648972 res!420552) b!648988))

(assert (= (and b!648972 (not res!420555)) b!648986))

(assert (= (and b!648986 (not res!420557)) b!648981))

(assert (= (and b!648981 (not res!420556)) b!648995))

(assert (= (and b!648995 (not res!420542)) b!648973))

(declare-fun m!622277 () Bool)

(assert (=> b!648992 m!622277))

(declare-fun m!622279 () Bool)

(assert (=> b!648992 m!622279))

(declare-fun m!622281 () Bool)

(assert (=> b!648992 m!622281))

(declare-fun m!622283 () Bool)

(assert (=> start!58864 m!622283))

(declare-fun m!622285 () Bool)

(assert (=> start!58864 m!622285))

(declare-fun m!622287 () Bool)

(assert (=> b!648986 m!622287))

(declare-fun m!622289 () Bool)

(assert (=> b!648997 m!622289))

(assert (=> b!648980 m!622277))

(declare-fun m!622291 () Bool)

(assert (=> b!648981 m!622291))

(assert (=> b!648993 m!622277))

(assert (=> b!648993 m!622277))

(declare-fun m!622293 () Bool)

(assert (=> b!648993 m!622293))

(assert (=> b!648988 m!622277))

(assert (=> b!648988 m!622277))

(declare-fun m!622295 () Bool)

(assert (=> b!648988 m!622295))

(declare-fun m!622297 () Bool)

(assert (=> b!648994 m!622297))

(declare-fun m!622299 () Bool)

(assert (=> b!648995 m!622299))

(assert (=> b!648982 m!622279))

(declare-fun m!622301 () Bool)

(assert (=> b!648982 m!622301))

(declare-fun m!622303 () Bool)

(assert (=> b!648974 m!622303))

(declare-fun m!622305 () Bool)

(assert (=> b!648987 m!622305))

(declare-fun m!622307 () Bool)

(assert (=> b!648975 m!622307))

(assert (=> b!648975 m!622277))

(declare-fun m!622309 () Bool)

(assert (=> b!648975 m!622309))

(assert (=> b!648975 m!622277))

(assert (=> b!648975 m!622277))

(declare-fun m!622311 () Bool)

(assert (=> b!648975 m!622311))

(declare-fun m!622313 () Bool)

(assert (=> b!648975 m!622313))

(declare-fun m!622315 () Bool)

(assert (=> b!648975 m!622315))

(assert (=> b!648975 m!622277))

(declare-fun m!622317 () Bool)

(assert (=> b!648975 m!622317))

(declare-fun m!622319 () Bool)

(assert (=> b!648975 m!622319))

(assert (=> b!648985 m!622277))

(assert (=> b!648985 m!622277))

(declare-fun m!622321 () Bool)

(assert (=> b!648985 m!622321))

(declare-fun m!622323 () Bool)

(assert (=> b!648998 m!622323))

(assert (=> b!648998 m!622277))

(assert (=> b!648998 m!622277))

(declare-fun m!622325 () Bool)

(assert (=> b!648998 m!622325))

(declare-fun m!622327 () Bool)

(assert (=> b!648983 m!622327))

(declare-fun m!622329 () Bool)

(assert (=> b!648976 m!622329))

(declare-fun m!622331 () Bool)

(assert (=> b!648984 m!622331))

(declare-fun m!622333 () Bool)

(assert (=> b!648984 m!622333))

(declare-fun m!622335 () Bool)

(assert (=> b!648984 m!622335))

(assert (=> b!648984 m!622277))

(assert (=> b!648984 m!622279))

(declare-fun m!622337 () Bool)

(assert (=> b!648984 m!622337))

(assert (=> b!648984 m!622277))

(declare-fun m!622339 () Bool)

(assert (=> b!648984 m!622339))

(declare-fun m!622341 () Bool)

(assert (=> b!648984 m!622341))

(assert (=> b!648996 m!622277))

(assert (=> b!648996 m!622277))

(assert (=> b!648996 m!622295))

(declare-fun m!622343 () Bool)

(assert (=> b!648973 m!622343))

(assert (=> b!648972 m!622277))

(assert (=> b!648972 m!622277))

(declare-fun m!622345 () Bool)

(assert (=> b!648972 m!622345))

(assert (=> b!648972 m!622277))

(declare-fun m!622347 () Bool)

(assert (=> b!648972 m!622347))

(assert (=> b!648972 m!622277))

(assert (=> b!648972 m!622321))

(check-sat (not b!648994) (not b!648972) (not b!648985) (not b!648986) (not b!648975) (not b!648981) (not b!648993) (not b!648996) (not b!648997) (not b!648983) (not b!648998) (not b!648987) (not start!58864) (not b!648973) (not b!648974) (not b!648988) (not b!648984) (not b!648995))
(check-sat)
