; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56142 () Bool)

(assert start!56142)

(declare-fun b!618982 () Bool)

(declare-fun e!354984 () Bool)

(declare-fun e!354992 () Bool)

(assert (=> b!618982 (= e!354984 e!354992)))

(declare-fun res!398781 () Bool)

(assert (=> b!618982 (=> (not res!398781) (not e!354992))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6418 0))(
  ( (MissingZero!6418 (index!27956 (_ BitVec 32))) (Found!6418 (index!27957 (_ BitVec 32))) (Intermediate!6418 (undefined!7230 Bool) (index!27958 (_ BitVec 32)) (x!56893 (_ BitVec 32))) (Undefined!6418) (MissingVacant!6418 (index!27959 (_ BitVec 32))) )
))
(declare-fun lt!285484 () SeekEntryResult!6418)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37557 0))(
  ( (array!37558 (arr!18022 (Array (_ BitVec 32) (_ BitVec 64))) (size!18386 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37557)

(assert (=> b!618982 (= res!398781 (and (= lt!285484 (Found!6418 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18022 a!2986) index!984) (select (arr!18022 a!2986) j!136))) (not (= (select (arr!18022 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37557 (_ BitVec 32)) SeekEntryResult!6418)

(assert (=> b!618982 (= lt!285484 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18022 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618983 () Bool)

(declare-fun res!398780 () Bool)

(declare-fun e!354994 () Bool)

(assert (=> b!618983 (=> (not res!398780) (not e!354994))))

(assert (=> b!618983 (= res!398780 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18022 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618984 () Bool)

(declare-fun res!398775 () Bool)

(declare-fun e!354987 () Bool)

(assert (=> b!618984 (=> (not res!398775) (not e!354987))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!618984 (= res!398775 (and (= (size!18386 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18386 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18386 a!2986)) (not (= i!1108 j!136))))))

(declare-fun lt!285482 () array!37557)

(declare-fun res!398787 () Bool)

(declare-fun b!618985 () Bool)

(declare-fun arrayContainsKey!0 (array!37557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618985 (= res!398787 (arrayContainsKey!0 lt!285482 (select (arr!18022 a!2986) j!136) j!136))))

(declare-fun e!354982 () Bool)

(assert (=> b!618985 (=> (not res!398787) (not e!354982))))

(declare-fun e!354988 () Bool)

(assert (=> b!618985 (= e!354988 e!354982)))

(declare-fun b!618986 () Bool)

(declare-datatypes ((Unit!20377 0))(
  ( (Unit!20378) )
))
(declare-fun e!354986 () Unit!20377)

(declare-fun Unit!20379 () Unit!20377)

(assert (=> b!618986 (= e!354986 Unit!20379)))

(declare-fun b!618987 () Bool)

(declare-fun e!354996 () Unit!20377)

(declare-fun Unit!20380 () Unit!20377)

(assert (=> b!618987 (= e!354996 Unit!20380)))

(declare-fun res!398789 () Bool)

(assert (=> start!56142 (=> (not res!398789) (not e!354987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56142 (= res!398789 (validMask!0 mask!3053))))

(assert (=> start!56142 e!354987))

(assert (=> start!56142 true))

(declare-fun array_inv!13881 (array!37557) Bool)

(assert (=> start!56142 (array_inv!13881 a!2986)))

(declare-fun b!618988 () Bool)

(assert (=> b!618988 false))

(declare-fun lt!285480 () Unit!20377)

(declare-datatypes ((List!11970 0))(
  ( (Nil!11967) (Cons!11966 (h!13014 (_ BitVec 64)) (t!18190 List!11970)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37557 (_ BitVec 64) (_ BitVec 32) List!11970) Unit!20377)

(assert (=> b!618988 (= lt!285480 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285482 (select (arr!18022 a!2986) j!136) index!984 Nil!11967))))

(declare-fun arrayNoDuplicates!0 (array!37557 (_ BitVec 32) List!11970) Bool)

(assert (=> b!618988 (arrayNoDuplicates!0 lt!285482 index!984 Nil!11967)))

(declare-fun lt!285491 () Unit!20377)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37557 (_ BitVec 32) (_ BitVec 32)) Unit!20377)

(assert (=> b!618988 (= lt!285491 (lemmaNoDuplicateFromThenFromBigger!0 lt!285482 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618988 (arrayNoDuplicates!0 lt!285482 #b00000000000000000000000000000000 Nil!11967)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!285496 () Unit!20377)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11970) Unit!20377)

(assert (=> b!618988 (= lt!285496 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11967))))

(assert (=> b!618988 (arrayContainsKey!0 lt!285482 (select (arr!18022 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285498 () Unit!20377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37557 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20377)

(assert (=> b!618988 (= lt!285498 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285482 (select (arr!18022 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354990 () Bool)

(assert (=> b!618988 e!354990))

(declare-fun res!398777 () Bool)

(assert (=> b!618988 (=> (not res!398777) (not e!354990))))

(assert (=> b!618988 (= res!398777 (arrayContainsKey!0 lt!285482 (select (arr!18022 a!2986) j!136) j!136))))

(declare-fun Unit!20381 () Unit!20377)

(assert (=> b!618988 (= e!354986 Unit!20381)))

(declare-fun b!618989 () Bool)

(declare-fun Unit!20382 () Unit!20377)

(assert (=> b!618989 (= e!354996 Unit!20382)))

(assert (=> b!618989 false))

(declare-fun b!618990 () Bool)

(declare-fun e!354989 () Bool)

(declare-fun lt!285485 () SeekEntryResult!6418)

(assert (=> b!618990 (= e!354989 (= lt!285484 lt!285485))))

(declare-fun b!618991 () Bool)

(assert (=> b!618991 (= e!354994 e!354984)))

(declare-fun res!398782 () Bool)

(assert (=> b!618991 (=> (not res!398782) (not e!354984))))

(assert (=> b!618991 (= res!398782 (= (select (store (arr!18022 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618991 (= lt!285482 (array!37558 (store (arr!18022 a!2986) i!1108 k0!1786) (size!18386 a!2986)))))

(declare-fun b!618992 () Bool)

(assert (=> b!618992 (= e!354990 (arrayContainsKey!0 lt!285482 (select (arr!18022 a!2986) j!136) index!984))))

(declare-fun b!618993 () Bool)

(assert (=> b!618993 (= e!354982 (arrayContainsKey!0 lt!285482 (select (arr!18022 a!2986) j!136) index!984))))

(declare-fun b!618994 () Bool)

(declare-fun res!398778 () Bool)

(assert (=> b!618994 (=> (not res!398778) (not e!354987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618994 (= res!398778 (validKeyInArray!0 (select (arr!18022 a!2986) j!136)))))

(declare-fun b!618995 () Bool)

(declare-fun res!398784 () Bool)

(assert (=> b!618995 (=> (not res!398784) (not e!354987))))

(assert (=> b!618995 (= res!398784 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618996 () Bool)

(declare-fun e!354995 () Unit!20377)

(declare-fun Unit!20383 () Unit!20377)

(assert (=> b!618996 (= e!354995 Unit!20383)))

(declare-fun b!618997 () Bool)

(declare-fun res!398785 () Bool)

(assert (=> b!618997 (=> (not res!398785) (not e!354987))))

(assert (=> b!618997 (= res!398785 (validKeyInArray!0 k0!1786))))

(declare-fun b!618998 () Bool)

(declare-fun e!354991 () Unit!20377)

(declare-fun Unit!20384 () Unit!20377)

(assert (=> b!618998 (= e!354991 Unit!20384)))

(declare-fun res!398790 () Bool)

(assert (=> b!618998 (= res!398790 (= (select (store (arr!18022 a!2986) i!1108 k0!1786) index!984) (select (arr!18022 a!2986) j!136)))))

(declare-fun e!354985 () Bool)

(assert (=> b!618998 (=> (not res!398790) (not e!354985))))

(assert (=> b!618998 e!354985))

(declare-fun c!70472 () Bool)

(assert (=> b!618998 (= c!70472 (bvslt j!136 index!984))))

(declare-fun lt!285493 () Unit!20377)

(assert (=> b!618998 (= lt!285493 e!354995)))

(declare-fun c!70475 () Bool)

(assert (=> b!618998 (= c!70475 (bvslt index!984 j!136))))

(declare-fun lt!285488 () Unit!20377)

(assert (=> b!618998 (= lt!285488 e!354986)))

(assert (=> b!618998 false))

(declare-fun b!618999 () Bool)

(declare-fun res!398776 () Bool)

(assert (=> b!618999 (=> (not res!398776) (not e!354994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37557 (_ BitVec 32)) Bool)

(assert (=> b!618999 (= res!398776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619000 () Bool)

(declare-fun res!398791 () Bool)

(assert (=> b!619000 (=> (not res!398791) (not e!354994))))

(assert (=> b!619000 (= res!398791 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11967))))

(declare-fun b!619001 () Bool)

(declare-fun res!398779 () Bool)

(assert (=> b!619001 (= res!398779 (bvsge j!136 index!984))))

(assert (=> b!619001 (=> res!398779 e!354988)))

(assert (=> b!619001 (= e!354985 e!354988)))

(declare-fun b!619002 () Bool)

(declare-fun e!354993 () Bool)

(assert (=> b!619002 (= e!354993 true)))

(assert (=> b!619002 (= (select (store (arr!18022 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619003 () Bool)

(assert (=> b!619003 false))

(declare-fun lt!285497 () Unit!20377)

(assert (=> b!619003 (= lt!285497 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285482 (select (arr!18022 a!2986) j!136) j!136 Nil!11967))))

(assert (=> b!619003 (arrayNoDuplicates!0 lt!285482 j!136 Nil!11967)))

(declare-fun lt!285492 () Unit!20377)

(assert (=> b!619003 (= lt!285492 (lemmaNoDuplicateFromThenFromBigger!0 lt!285482 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619003 (arrayNoDuplicates!0 lt!285482 #b00000000000000000000000000000000 Nil!11967)))

(declare-fun lt!285487 () Unit!20377)

(assert (=> b!619003 (= lt!285487 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11967))))

(assert (=> b!619003 (arrayContainsKey!0 lt!285482 (select (arr!18022 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285495 () Unit!20377)

(assert (=> b!619003 (= lt!285495 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285482 (select (arr!18022 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20385 () Unit!20377)

(assert (=> b!619003 (= e!354995 Unit!20385)))

(declare-fun b!619004 () Bool)

(assert (=> b!619004 (= e!354992 (not e!354993))))

(declare-fun res!398788 () Bool)

(assert (=> b!619004 (=> res!398788 e!354993)))

(declare-fun lt!285486 () SeekEntryResult!6418)

(assert (=> b!619004 (= res!398788 (not (= lt!285486 (MissingVacant!6418 vacantSpotIndex!68))))))

(declare-fun lt!285494 () Unit!20377)

(assert (=> b!619004 (= lt!285494 e!354991)))

(declare-fun c!70474 () Bool)

(assert (=> b!619004 (= c!70474 (= lt!285486 (Found!6418 index!984)))))

(declare-fun lt!285490 () Unit!20377)

(assert (=> b!619004 (= lt!285490 e!354996)))

(declare-fun c!70473 () Bool)

(assert (=> b!619004 (= c!70473 (= lt!285486 Undefined!6418))))

(declare-fun lt!285483 () (_ BitVec 64))

(assert (=> b!619004 (= lt!285486 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285483 lt!285482 mask!3053))))

(assert (=> b!619004 e!354989))

(declare-fun res!398783 () Bool)

(assert (=> b!619004 (=> (not res!398783) (not e!354989))))

(declare-fun lt!285489 () (_ BitVec 32))

(assert (=> b!619004 (= res!398783 (= lt!285485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285489 vacantSpotIndex!68 lt!285483 lt!285482 mask!3053)))))

(assert (=> b!619004 (= lt!285485 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285489 vacantSpotIndex!68 (select (arr!18022 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619004 (= lt!285483 (select (store (arr!18022 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285481 () Unit!20377)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20377)

(assert (=> b!619004 (= lt!285481 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285489 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619004 (= lt!285489 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!619005 () Bool)

(assert (=> b!619005 (= e!354987 e!354994)))

(declare-fun res!398786 () Bool)

(assert (=> b!619005 (=> (not res!398786) (not e!354994))))

(declare-fun lt!285499 () SeekEntryResult!6418)

(assert (=> b!619005 (= res!398786 (or (= lt!285499 (MissingZero!6418 i!1108)) (= lt!285499 (MissingVacant!6418 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37557 (_ BitVec 32)) SeekEntryResult!6418)

(assert (=> b!619005 (= lt!285499 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619006 () Bool)

(declare-fun Unit!20386 () Unit!20377)

(assert (=> b!619006 (= e!354991 Unit!20386)))

(assert (= (and start!56142 res!398789) b!618984))

(assert (= (and b!618984 res!398775) b!618994))

(assert (= (and b!618994 res!398778) b!618997))

(assert (= (and b!618997 res!398785) b!618995))

(assert (= (and b!618995 res!398784) b!619005))

(assert (= (and b!619005 res!398786) b!618999))

(assert (= (and b!618999 res!398776) b!619000))

(assert (= (and b!619000 res!398791) b!618983))

(assert (= (and b!618983 res!398780) b!618991))

(assert (= (and b!618991 res!398782) b!618982))

(assert (= (and b!618982 res!398781) b!619004))

(assert (= (and b!619004 res!398783) b!618990))

(assert (= (and b!619004 c!70473) b!618989))

(assert (= (and b!619004 (not c!70473)) b!618987))

(assert (= (and b!619004 c!70474) b!618998))

(assert (= (and b!619004 (not c!70474)) b!619006))

(assert (= (and b!618998 res!398790) b!619001))

(assert (= (and b!619001 (not res!398779)) b!618985))

(assert (= (and b!618985 res!398787) b!618993))

(assert (= (and b!618998 c!70472) b!619003))

(assert (= (and b!618998 (not c!70472)) b!618996))

(assert (= (and b!618998 c!70475) b!618988))

(assert (= (and b!618998 (not c!70475)) b!618986))

(assert (= (and b!618988 res!398777) b!618992))

(assert (= (and b!619004 (not res!398788)) b!619002))

(declare-fun m!595277 () Bool)

(assert (=> b!618992 m!595277))

(assert (=> b!618992 m!595277))

(declare-fun m!595279 () Bool)

(assert (=> b!618992 m!595279))

(assert (=> b!619003 m!595277))

(declare-fun m!595281 () Bool)

(assert (=> b!619003 m!595281))

(assert (=> b!619003 m!595277))

(declare-fun m!595283 () Bool)

(assert (=> b!619003 m!595283))

(declare-fun m!595285 () Bool)

(assert (=> b!619003 m!595285))

(declare-fun m!595287 () Bool)

(assert (=> b!619003 m!595287))

(declare-fun m!595289 () Bool)

(assert (=> b!619003 m!595289))

(assert (=> b!619003 m!595277))

(declare-fun m!595291 () Bool)

(assert (=> b!619003 m!595291))

(assert (=> b!619003 m!595277))

(declare-fun m!595293 () Bool)

(assert (=> b!619003 m!595293))

(assert (=> b!618993 m!595277))

(assert (=> b!618993 m!595277))

(assert (=> b!618993 m!595279))

(declare-fun m!595295 () Bool)

(assert (=> b!619004 m!595295))

(declare-fun m!595297 () Bool)

(assert (=> b!619004 m!595297))

(declare-fun m!595299 () Bool)

(assert (=> b!619004 m!595299))

(declare-fun m!595301 () Bool)

(assert (=> b!619004 m!595301))

(declare-fun m!595303 () Bool)

(assert (=> b!619004 m!595303))

(assert (=> b!619004 m!595277))

(declare-fun m!595305 () Bool)

(assert (=> b!619004 m!595305))

(declare-fun m!595307 () Bool)

(assert (=> b!619004 m!595307))

(assert (=> b!619004 m!595277))

(declare-fun m!595309 () Bool)

(assert (=> start!56142 m!595309))

(declare-fun m!595311 () Bool)

(assert (=> start!56142 m!595311))

(declare-fun m!595313 () Bool)

(assert (=> b!618982 m!595313))

(assert (=> b!618982 m!595277))

(assert (=> b!618982 m!595277))

(declare-fun m!595315 () Bool)

(assert (=> b!618982 m!595315))

(assert (=> b!619002 m!595301))

(declare-fun m!595317 () Bool)

(assert (=> b!619002 m!595317))

(declare-fun m!595319 () Bool)

(assert (=> b!618983 m!595319))

(declare-fun m!595321 () Bool)

(assert (=> b!619000 m!595321))

(assert (=> b!618994 m!595277))

(assert (=> b!618994 m!595277))

(declare-fun m!595323 () Bool)

(assert (=> b!618994 m!595323))

(assert (=> b!618998 m!595301))

(assert (=> b!618998 m!595317))

(assert (=> b!618998 m!595277))

(assert (=> b!618985 m!595277))

(assert (=> b!618985 m!595277))

(declare-fun m!595325 () Bool)

(assert (=> b!618985 m!595325))

(assert (=> b!618991 m!595301))

(declare-fun m!595327 () Bool)

(assert (=> b!618991 m!595327))

(declare-fun m!595329 () Bool)

(assert (=> b!618999 m!595329))

(declare-fun m!595331 () Bool)

(assert (=> b!618995 m!595331))

(declare-fun m!595333 () Bool)

(assert (=> b!619005 m!595333))

(assert (=> b!618988 m!595277))

(declare-fun m!595335 () Bool)

(assert (=> b!618988 m!595335))

(assert (=> b!618988 m!595277))

(declare-fun m!595337 () Bool)

(assert (=> b!618988 m!595337))

(assert (=> b!618988 m!595277))

(declare-fun m!595339 () Bool)

(assert (=> b!618988 m!595339))

(declare-fun m!595341 () Bool)

(assert (=> b!618988 m!595341))

(assert (=> b!618988 m!595277))

(assert (=> b!618988 m!595325))

(assert (=> b!618988 m!595285))

(assert (=> b!618988 m!595277))

(declare-fun m!595343 () Bool)

(assert (=> b!618988 m!595343))

(assert (=> b!618988 m!595287))

(declare-fun m!595345 () Bool)

(assert (=> b!618997 m!595345))

(check-sat (not b!618997) (not b!619003) (not b!619004) (not b!619005) (not b!618992) (not b!618985) (not b!618993) (not b!618995) (not b!618988) (not b!618994) (not start!56142) (not b!618982) (not b!618999) (not b!619000))
(check-sat)
