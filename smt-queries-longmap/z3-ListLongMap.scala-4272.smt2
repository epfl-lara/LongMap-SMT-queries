; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59360 () Bool)

(assert start!59360)

(declare-fun b!655669 () Bool)

(declare-datatypes ((Unit!22592 0))(
  ( (Unit!22593) )
))
(declare-fun e!376529 () Unit!22592)

(declare-fun Unit!22594 () Unit!22592)

(assert (=> b!655669 (= e!376529 Unit!22594)))

(declare-fun b!655670 () Bool)

(declare-fun res!425401 () Bool)

(declare-fun e!376532 () Bool)

(assert (=> b!655670 (=> (not res!425401) (not e!376532))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38691 0))(
  ( (array!38692 (arr!18545 (Array (_ BitVec 32) (_ BitVec 64))) (size!18910 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38691)

(assert (=> b!655670 (= res!425401 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18545 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655671 () Bool)

(declare-fun res!425391 () Bool)

(declare-fun e!376537 () Bool)

(assert (=> b!655671 (=> (not res!425391) (not e!376537))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!655671 (= res!425391 (and (= (size!18910 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18910 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655672 () Bool)

(declare-fun e!376536 () Unit!22592)

(declare-fun Unit!22595 () Unit!22592)

(assert (=> b!655672 (= e!376536 Unit!22595)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!425399 () Bool)

(assert (=> b!655672 (= res!425399 (= (select (store (arr!18545 a!2986) i!1108 k0!1786) index!984) (select (arr!18545 a!2986) j!136)))))

(declare-fun e!376538 () Bool)

(assert (=> b!655672 (=> (not res!425399) (not e!376538))))

(assert (=> b!655672 e!376538))

(declare-fun c!75510 () Bool)

(assert (=> b!655672 (= c!75510 (bvslt j!136 index!984))))

(declare-fun lt!305873 () Unit!22592)

(assert (=> b!655672 (= lt!305873 e!376529)))

(declare-fun c!75509 () Bool)

(assert (=> b!655672 (= c!75509 (bvslt index!984 j!136))))

(declare-fun lt!305881 () Unit!22592)

(declare-fun e!376535 () Unit!22592)

(assert (=> b!655672 (= lt!305881 e!376535)))

(assert (=> b!655672 false))

(declare-fun b!655674 () Bool)

(declare-fun e!376533 () Bool)

(declare-fun e!376527 () Bool)

(assert (=> b!655674 (= e!376533 e!376527)))

(declare-fun res!425397 () Bool)

(assert (=> b!655674 (=> (not res!425397) (not e!376527))))

(declare-datatypes ((SeekEntryResult!6982 0))(
  ( (MissingZero!6982 (index!30287 (_ BitVec 32))) (Found!6982 (index!30288 (_ BitVec 32))) (Intermediate!6982 (undefined!7794 Bool) (index!30289 (_ BitVec 32)) (x!59082 (_ BitVec 32))) (Undefined!6982) (MissingVacant!6982 (index!30290 (_ BitVec 32))) )
))
(declare-fun lt!305871 () SeekEntryResult!6982)

(assert (=> b!655674 (= res!425397 (and (= lt!305871 (Found!6982 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18545 a!2986) index!984) (select (arr!18545 a!2986) j!136))) (not (= (select (arr!18545 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38691 (_ BitVec 32)) SeekEntryResult!6982)

(assert (=> b!655674 (= lt!305871 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655675 () Bool)

(assert (=> b!655675 (= e!376532 e!376533)))

(declare-fun res!425395 () Bool)

(assert (=> b!655675 (=> (not res!425395) (not e!376533))))

(assert (=> b!655675 (= res!425395 (= (select (store (arr!18545 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!305875 () array!38691)

(assert (=> b!655675 (= lt!305875 (array!38692 (store (arr!18545 a!2986) i!1108 k0!1786) (size!18910 a!2986)))))

(declare-fun b!655676 () Bool)

(declare-fun res!425398 () Bool)

(assert (=> b!655676 (=> (not res!425398) (not e!376537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655676 (= res!425398 (validKeyInArray!0 (select (arr!18545 a!2986) j!136)))))

(declare-fun b!655677 () Bool)

(declare-fun res!425402 () Bool)

(assert (=> b!655677 (=> (not res!425402) (not e!376537))))

(declare-fun arrayContainsKey!0 (array!38691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655677 (= res!425402 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655678 () Bool)

(declare-fun e!376525 () Bool)

(declare-fun lt!305869 () SeekEntryResult!6982)

(assert (=> b!655678 (= e!376525 (= lt!305871 lt!305869))))

(declare-fun b!655679 () Bool)

(declare-fun res!425396 () Bool)

(assert (=> b!655679 (= res!425396 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136))))

(declare-fun e!376528 () Bool)

(assert (=> b!655679 (=> (not res!425396) (not e!376528))))

(declare-fun e!376534 () Bool)

(assert (=> b!655679 (= e!376534 e!376528)))

(declare-fun b!655680 () Bool)

(assert (=> b!655680 false))

(declare-fun lt!305885 () Unit!22592)

(declare-datatypes ((List!12625 0))(
  ( (Nil!12622) (Cons!12621 (h!13666 (_ BitVec 64)) (t!18844 List!12625)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38691 (_ BitVec 64) (_ BitVec 32) List!12625) Unit!22592)

(assert (=> b!655680 (= lt!305885 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136 Nil!12622))))

(declare-fun arrayNoDuplicates!0 (array!38691 (_ BitVec 32) List!12625) Bool)

(assert (=> b!655680 (arrayNoDuplicates!0 lt!305875 j!136 Nil!12622)))

(declare-fun lt!305877 () Unit!22592)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38691 (_ BitVec 32) (_ BitVec 32)) Unit!22592)

(assert (=> b!655680 (= lt!305877 (lemmaNoDuplicateFromThenFromBigger!0 lt!305875 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655680 (arrayNoDuplicates!0 lt!305875 #b00000000000000000000000000000000 Nil!12622)))

(declare-fun lt!305879 () Unit!22592)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12625) Unit!22592)

(assert (=> b!655680 (= lt!305879 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12622))))

(assert (=> b!655680 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305878 () Unit!22592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22592)

(assert (=> b!655680 (= lt!305878 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22596 () Unit!22592)

(assert (=> b!655680 (= e!376529 Unit!22596)))

(declare-fun b!655681 () Bool)

(assert (=> b!655681 (= e!376528 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984))))

(declare-fun b!655682 () Bool)

(declare-fun Unit!22597 () Unit!22592)

(assert (=> b!655682 (= e!376536 Unit!22597)))

(declare-fun b!655683 () Bool)

(declare-fun e!376530 () Bool)

(assert (=> b!655683 (= e!376530 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984))))

(declare-fun b!655684 () Bool)

(declare-fun e!376526 () Unit!22592)

(declare-fun Unit!22598 () Unit!22592)

(assert (=> b!655684 (= e!376526 Unit!22598)))

(assert (=> b!655684 false))

(declare-fun b!655685 () Bool)

(declare-fun res!425393 () Bool)

(assert (=> b!655685 (=> (not res!425393) (not e!376537))))

(assert (=> b!655685 (= res!425393 (validKeyInArray!0 k0!1786))))

(declare-fun b!655686 () Bool)

(assert (=> b!655686 (= e!376537 e!376532)))

(declare-fun res!425392 () Bool)

(assert (=> b!655686 (=> (not res!425392) (not e!376532))))

(declare-fun lt!305883 () SeekEntryResult!6982)

(assert (=> b!655686 (= res!425392 (or (= lt!305883 (MissingZero!6982 i!1108)) (= lt!305883 (MissingVacant!6982 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38691 (_ BitVec 32)) SeekEntryResult!6982)

(assert (=> b!655686 (= lt!305883 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655687 () Bool)

(declare-fun res!425394 () Bool)

(assert (=> b!655687 (= res!425394 (bvsge j!136 index!984))))

(assert (=> b!655687 (=> res!425394 e!376534)))

(assert (=> b!655687 (= e!376538 e!376534)))

(declare-fun b!655688 () Bool)

(declare-fun lt!305884 () SeekEntryResult!6982)

(assert (=> b!655688 (= e!376527 (not (or (not (= lt!305884 (MissingVacant!6982 vacantSpotIndex!68))) (= (select (store (arr!18545 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!305882 () Unit!22592)

(assert (=> b!655688 (= lt!305882 e!376536)))

(declare-fun c!75507 () Bool)

(assert (=> b!655688 (= c!75507 (= lt!305884 (Found!6982 index!984)))))

(declare-fun lt!305880 () Unit!22592)

(assert (=> b!655688 (= lt!305880 e!376526)))

(declare-fun c!75508 () Bool)

(assert (=> b!655688 (= c!75508 (= lt!305884 Undefined!6982))))

(declare-fun lt!305872 () (_ BitVec 64))

(assert (=> b!655688 (= lt!305884 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305872 lt!305875 mask!3053))))

(assert (=> b!655688 e!376525))

(declare-fun res!425400 () Bool)

(assert (=> b!655688 (=> (not res!425400) (not e!376525))))

(declare-fun lt!305886 () (_ BitVec 32))

(assert (=> b!655688 (= res!425400 (= lt!305869 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 lt!305872 lt!305875 mask!3053)))))

(assert (=> b!655688 (= lt!305869 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655688 (= lt!305872 (select (store (arr!18545 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305876 () Unit!22592)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22592)

(assert (=> b!655688 (= lt!305876 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655688 (= lt!305886 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655689 () Bool)

(assert (=> b!655689 false))

(declare-fun lt!305870 () Unit!22592)

(assert (=> b!655689 (= lt!305870 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984 Nil!12622))))

(assert (=> b!655689 (arrayNoDuplicates!0 lt!305875 index!984 Nil!12622)))

(declare-fun lt!305868 () Unit!22592)

(assert (=> b!655689 (= lt!305868 (lemmaNoDuplicateFromThenFromBigger!0 lt!305875 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655689 (arrayNoDuplicates!0 lt!305875 #b00000000000000000000000000000000 Nil!12622)))

(declare-fun lt!305867 () Unit!22592)

(assert (=> b!655689 (= lt!305867 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12622))))

(assert (=> b!655689 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305874 () Unit!22592)

(assert (=> b!655689 (= lt!305874 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655689 e!376530))

(declare-fun res!425404 () Bool)

(assert (=> b!655689 (=> (not res!425404) (not e!376530))))

(assert (=> b!655689 (= res!425404 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136))))

(declare-fun Unit!22599 () Unit!22592)

(assert (=> b!655689 (= e!376535 Unit!22599)))

(declare-fun b!655690 () Bool)

(declare-fun Unit!22600 () Unit!22592)

(assert (=> b!655690 (= e!376526 Unit!22600)))

(declare-fun res!425403 () Bool)

(assert (=> start!59360 (=> (not res!425403) (not e!376537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59360 (= res!425403 (validMask!0 mask!3053))))

(assert (=> start!59360 e!376537))

(assert (=> start!59360 true))

(declare-fun array_inv!14428 (array!38691) Bool)

(assert (=> start!59360 (array_inv!14428 a!2986)))

(declare-fun b!655673 () Bool)

(declare-fun Unit!22601 () Unit!22592)

(assert (=> b!655673 (= e!376535 Unit!22601)))

(declare-fun b!655691 () Bool)

(declare-fun res!425389 () Bool)

(assert (=> b!655691 (=> (not res!425389) (not e!376532))))

(assert (=> b!655691 (= res!425389 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12622))))

(declare-fun b!655692 () Bool)

(declare-fun res!425390 () Bool)

(assert (=> b!655692 (=> (not res!425390) (not e!376532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38691 (_ BitVec 32)) Bool)

(assert (=> b!655692 (= res!425390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!59360 res!425403) b!655671))

(assert (= (and b!655671 res!425391) b!655676))

(assert (= (and b!655676 res!425398) b!655685))

(assert (= (and b!655685 res!425393) b!655677))

(assert (= (and b!655677 res!425402) b!655686))

(assert (= (and b!655686 res!425392) b!655692))

(assert (= (and b!655692 res!425390) b!655691))

(assert (= (and b!655691 res!425389) b!655670))

(assert (= (and b!655670 res!425401) b!655675))

(assert (= (and b!655675 res!425395) b!655674))

(assert (= (and b!655674 res!425397) b!655688))

(assert (= (and b!655688 res!425400) b!655678))

(assert (= (and b!655688 c!75508) b!655684))

(assert (= (and b!655688 (not c!75508)) b!655690))

(assert (= (and b!655688 c!75507) b!655672))

(assert (= (and b!655688 (not c!75507)) b!655682))

(assert (= (and b!655672 res!425399) b!655687))

(assert (= (and b!655687 (not res!425394)) b!655679))

(assert (= (and b!655679 res!425396) b!655681))

(assert (= (and b!655672 c!75510) b!655680))

(assert (= (and b!655672 (not c!75510)) b!655669))

(assert (= (and b!655672 c!75509) b!655689))

(assert (= (and b!655672 (not c!75509)) b!655673))

(assert (= (and b!655689 res!425404) b!655683))

(declare-fun m!628245 () Bool)

(assert (=> b!655670 m!628245))

(declare-fun m!628247 () Bool)

(assert (=> start!59360 m!628247))

(declare-fun m!628249 () Bool)

(assert (=> start!59360 m!628249))

(declare-fun m!628251 () Bool)

(assert (=> b!655686 m!628251))

(declare-fun m!628253 () Bool)

(assert (=> b!655679 m!628253))

(assert (=> b!655679 m!628253))

(declare-fun m!628255 () Bool)

(assert (=> b!655679 m!628255))

(assert (=> b!655681 m!628253))

(assert (=> b!655681 m!628253))

(declare-fun m!628257 () Bool)

(assert (=> b!655681 m!628257))

(declare-fun m!628259 () Bool)

(assert (=> b!655675 m!628259))

(declare-fun m!628261 () Bool)

(assert (=> b!655675 m!628261))

(declare-fun m!628263 () Bool)

(assert (=> b!655692 m!628263))

(assert (=> b!655676 m!628253))

(assert (=> b!655676 m!628253))

(declare-fun m!628265 () Bool)

(assert (=> b!655676 m!628265))

(declare-fun m!628267 () Bool)

(assert (=> b!655677 m!628267))

(assert (=> b!655683 m!628253))

(assert (=> b!655683 m!628253))

(assert (=> b!655683 m!628257))

(assert (=> b!655689 m!628253))

(declare-fun m!628269 () Bool)

(assert (=> b!655689 m!628269))

(assert (=> b!655689 m!628253))

(declare-fun m!628271 () Bool)

(assert (=> b!655689 m!628271))

(assert (=> b!655689 m!628253))

(declare-fun m!628273 () Bool)

(assert (=> b!655689 m!628273))

(assert (=> b!655689 m!628253))

(assert (=> b!655689 m!628255))

(declare-fun m!628275 () Bool)

(assert (=> b!655689 m!628275))

(declare-fun m!628277 () Bool)

(assert (=> b!655689 m!628277))

(declare-fun m!628279 () Bool)

(assert (=> b!655689 m!628279))

(declare-fun m!628281 () Bool)

(assert (=> b!655689 m!628281))

(assert (=> b!655689 m!628253))

(declare-fun m!628283 () Bool)

(assert (=> b!655674 m!628283))

(assert (=> b!655674 m!628253))

(assert (=> b!655674 m!628253))

(declare-fun m!628285 () Bool)

(assert (=> b!655674 m!628285))

(assert (=> b!655672 m!628259))

(declare-fun m!628287 () Bool)

(assert (=> b!655672 m!628287))

(assert (=> b!655672 m!628253))

(assert (=> b!655680 m!628253))

(declare-fun m!628289 () Bool)

(assert (=> b!655680 m!628289))

(assert (=> b!655680 m!628253))

(declare-fun m!628291 () Bool)

(assert (=> b!655680 m!628291))

(declare-fun m!628293 () Bool)

(assert (=> b!655680 m!628293))

(declare-fun m!628295 () Bool)

(assert (=> b!655680 m!628295))

(assert (=> b!655680 m!628253))

(declare-fun m!628297 () Bool)

(assert (=> b!655680 m!628297))

(assert (=> b!655680 m!628279))

(assert (=> b!655680 m!628281))

(assert (=> b!655680 m!628253))

(declare-fun m!628299 () Bool)

(assert (=> b!655685 m!628299))

(declare-fun m!628301 () Bool)

(assert (=> b!655691 m!628301))

(declare-fun m!628303 () Bool)

(assert (=> b!655688 m!628303))

(declare-fun m!628305 () Bool)

(assert (=> b!655688 m!628305))

(assert (=> b!655688 m!628253))

(declare-fun m!628307 () Bool)

(assert (=> b!655688 m!628307))

(assert (=> b!655688 m!628259))

(declare-fun m!628309 () Bool)

(assert (=> b!655688 m!628309))

(assert (=> b!655688 m!628253))

(declare-fun m!628311 () Bool)

(assert (=> b!655688 m!628311))

(assert (=> b!655688 m!628287))

(declare-fun m!628313 () Bool)

(assert (=> b!655688 m!628313))

(check-sat (not b!655674) (not b!655691) (not b!655679) (not b!655688) (not b!655692) (not b!655686) (not b!655677) (not b!655685) (not b!655681) (not b!655683) (not b!655680) (not b!655689) (not b!655676) (not start!59360))
(check-sat)
(get-model)

(declare-fun d!92377 () Bool)

(assert (=> d!92377 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59360 d!92377))

(declare-fun d!92379 () Bool)

(assert (=> d!92379 (= (array_inv!14428 a!2986) (bvsge (size!18910 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59360 d!92379))

(declare-fun d!92381 () Bool)

(declare-fun res!425505 () Bool)

(declare-fun e!376627 () Bool)

(assert (=> d!92381 (=> res!425505 e!376627)))

(assert (=> d!92381 (= res!425505 (= (select (arr!18545 lt!305875) index!984) (select (arr!18545 a!2986) j!136)))))

(assert (=> d!92381 (= (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984) e!376627)))

(declare-fun b!655841 () Bool)

(declare-fun e!376628 () Bool)

(assert (=> b!655841 (= e!376627 e!376628)))

(declare-fun res!425506 () Bool)

(assert (=> b!655841 (=> (not res!425506) (not e!376628))))

(assert (=> b!655841 (= res!425506 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18910 lt!305875)))))

(declare-fun b!655842 () Bool)

(assert (=> b!655842 (= e!376628 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92381 (not res!425505)) b!655841))

(assert (= (and b!655841 res!425506) b!655842))

(declare-fun m!628455 () Bool)

(assert (=> d!92381 m!628455))

(assert (=> b!655842 m!628253))

(declare-fun m!628457 () Bool)

(assert (=> b!655842 m!628457))

(assert (=> b!655681 d!92381))

(declare-fun bm!33805 () Bool)

(declare-fun call!33808 () Bool)

(assert (=> bm!33805 (= call!33808 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!655851 () Bool)

(declare-fun e!376637 () Bool)

(assert (=> b!655851 (= e!376637 call!33808)))

(declare-fun b!655852 () Bool)

(declare-fun e!376636 () Bool)

(assert (=> b!655852 (= e!376637 e!376636)))

(declare-fun lt!306013 () (_ BitVec 64))

(assert (=> b!655852 (= lt!306013 (select (arr!18545 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306015 () Unit!22592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38691 (_ BitVec 64) (_ BitVec 32)) Unit!22592)

(assert (=> b!655852 (= lt!306015 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306013 #b00000000000000000000000000000000))))

(assert (=> b!655852 (arrayContainsKey!0 a!2986 lt!306013 #b00000000000000000000000000000000)))

(declare-fun lt!306014 () Unit!22592)

(assert (=> b!655852 (= lt!306014 lt!306015)))

(declare-fun res!425511 () Bool)

(assert (=> b!655852 (= res!425511 (= (seekEntryOrOpen!0 (select (arr!18545 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6982 #b00000000000000000000000000000000)))))

(assert (=> b!655852 (=> (not res!425511) (not e!376636))))

(declare-fun d!92383 () Bool)

(declare-fun res!425512 () Bool)

(declare-fun e!376635 () Bool)

(assert (=> d!92383 (=> res!425512 e!376635)))

(assert (=> d!92383 (= res!425512 (bvsge #b00000000000000000000000000000000 (size!18910 a!2986)))))

(assert (=> d!92383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!376635)))

(declare-fun b!655853 () Bool)

(assert (=> b!655853 (= e!376635 e!376637)))

(declare-fun c!75537 () Bool)

(assert (=> b!655853 (= c!75537 (validKeyInArray!0 (select (arr!18545 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!655854 () Bool)

(assert (=> b!655854 (= e!376636 call!33808)))

(assert (= (and d!92383 (not res!425512)) b!655853))

(assert (= (and b!655853 c!75537) b!655852))

(assert (= (and b!655853 (not c!75537)) b!655851))

(assert (= (and b!655852 res!425511) b!655854))

(assert (= (or b!655854 b!655851) bm!33805))

(declare-fun m!628459 () Bool)

(assert (=> bm!33805 m!628459))

(declare-fun m!628461 () Bool)

(assert (=> b!655852 m!628461))

(declare-fun m!628463 () Bool)

(assert (=> b!655852 m!628463))

(declare-fun m!628465 () Bool)

(assert (=> b!655852 m!628465))

(assert (=> b!655852 m!628461))

(declare-fun m!628467 () Bool)

(assert (=> b!655852 m!628467))

(assert (=> b!655853 m!628461))

(assert (=> b!655853 m!628461))

(declare-fun m!628469 () Bool)

(assert (=> b!655853 m!628469))

(assert (=> b!655692 d!92383))

(declare-fun b!655865 () Bool)

(declare-fun e!376647 () Bool)

(declare-fun call!33811 () Bool)

(assert (=> b!655865 (= e!376647 call!33811)))

(declare-fun d!92385 () Bool)

(declare-fun res!425519 () Bool)

(declare-fun e!376648 () Bool)

(assert (=> d!92385 (=> res!425519 e!376648)))

(assert (=> d!92385 (= res!425519 (bvsge #b00000000000000000000000000000000 (size!18910 a!2986)))))

(assert (=> d!92385 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12622) e!376648)))

(declare-fun b!655866 () Bool)

(declare-fun e!376649 () Bool)

(assert (=> b!655866 (= e!376649 e!376647)))

(declare-fun c!75540 () Bool)

(assert (=> b!655866 (= c!75540 (validKeyInArray!0 (select (arr!18545 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!655867 () Bool)

(assert (=> b!655867 (= e!376648 e!376649)))

(declare-fun res!425520 () Bool)

(assert (=> b!655867 (=> (not res!425520) (not e!376649))))

(declare-fun e!376646 () Bool)

(assert (=> b!655867 (= res!425520 (not e!376646))))

(declare-fun res!425521 () Bool)

(assert (=> b!655867 (=> (not res!425521) (not e!376646))))

(assert (=> b!655867 (= res!425521 (validKeyInArray!0 (select (arr!18545 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33808 () Bool)

(assert (=> bm!33808 (= call!33811 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75540 (Cons!12621 (select (arr!18545 a!2986) #b00000000000000000000000000000000) Nil!12622) Nil!12622)))))

(declare-fun b!655868 () Bool)

(declare-fun contains!3174 (List!12625 (_ BitVec 64)) Bool)

(assert (=> b!655868 (= e!376646 (contains!3174 Nil!12622 (select (arr!18545 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!655869 () Bool)

(assert (=> b!655869 (= e!376647 call!33811)))

(assert (= (and d!92385 (not res!425519)) b!655867))

(assert (= (and b!655867 res!425521) b!655868))

(assert (= (and b!655867 res!425520) b!655866))

(assert (= (and b!655866 c!75540) b!655865))

(assert (= (and b!655866 (not c!75540)) b!655869))

(assert (= (or b!655865 b!655869) bm!33808))

(assert (=> b!655866 m!628461))

(assert (=> b!655866 m!628461))

(assert (=> b!655866 m!628469))

(assert (=> b!655867 m!628461))

(assert (=> b!655867 m!628461))

(assert (=> b!655867 m!628469))

(assert (=> bm!33808 m!628461))

(declare-fun m!628471 () Bool)

(assert (=> bm!33808 m!628471))

(assert (=> b!655868 m!628461))

(assert (=> b!655868 m!628461))

(declare-fun m!628473 () Bool)

(assert (=> b!655868 m!628473))

(assert (=> b!655691 d!92385))

(declare-fun d!92387 () Bool)

(assert (=> d!92387 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306018 () Unit!22592)

(declare-fun choose!114 (array!38691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22592)

(assert (=> d!92387 (= lt!306018 (choose!114 lt!305875 (select (arr!18545 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92387 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92387 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306018)))

(declare-fun bs!19494 () Bool)

(assert (= bs!19494 d!92387))

(assert (=> bs!19494 m!628253))

(assert (=> bs!19494 m!628297))

(assert (=> bs!19494 m!628253))

(declare-fun m!628475 () Bool)

(assert (=> bs!19494 m!628475))

(assert (=> b!655680 d!92387))

(declare-fun d!92389 () Bool)

(assert (=> d!92389 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18910 lt!305875)) (not (= (select (arr!18545 lt!305875) j!136) (select (arr!18545 a!2986) j!136))))))

(declare-fun lt!306021 () Unit!22592)

(declare-fun choose!21 (array!38691 (_ BitVec 64) (_ BitVec 32) List!12625) Unit!22592)

(assert (=> d!92389 (= lt!306021 (choose!21 lt!305875 (select (arr!18545 a!2986) j!136) j!136 Nil!12622))))

(assert (=> d!92389 (bvslt (size!18910 lt!305875) #b01111111111111111111111111111111)))

(assert (=> d!92389 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136 Nil!12622) lt!306021)))

(declare-fun bs!19495 () Bool)

(assert (= bs!19495 d!92389))

(declare-fun m!628477 () Bool)

(assert (=> bs!19495 m!628477))

(assert (=> bs!19495 m!628253))

(declare-fun m!628479 () Bool)

(assert (=> bs!19495 m!628479))

(assert (=> b!655680 d!92389))

(declare-fun b!655870 () Bool)

(declare-fun e!376651 () Bool)

(declare-fun call!33812 () Bool)

(assert (=> b!655870 (= e!376651 call!33812)))

(declare-fun d!92391 () Bool)

(declare-fun res!425522 () Bool)

(declare-fun e!376652 () Bool)

(assert (=> d!92391 (=> res!425522 e!376652)))

(assert (=> d!92391 (= res!425522 (bvsge j!136 (size!18910 lt!305875)))))

(assert (=> d!92391 (= (arrayNoDuplicates!0 lt!305875 j!136 Nil!12622) e!376652)))

(declare-fun b!655871 () Bool)

(declare-fun e!376653 () Bool)

(assert (=> b!655871 (= e!376653 e!376651)))

(declare-fun c!75541 () Bool)

(assert (=> b!655871 (= c!75541 (validKeyInArray!0 (select (arr!18545 lt!305875) j!136)))))

(declare-fun b!655872 () Bool)

(assert (=> b!655872 (= e!376652 e!376653)))

(declare-fun res!425523 () Bool)

(assert (=> b!655872 (=> (not res!425523) (not e!376653))))

(declare-fun e!376650 () Bool)

(assert (=> b!655872 (= res!425523 (not e!376650))))

(declare-fun res!425524 () Bool)

(assert (=> b!655872 (=> (not res!425524) (not e!376650))))

(assert (=> b!655872 (= res!425524 (validKeyInArray!0 (select (arr!18545 lt!305875) j!136)))))

(declare-fun bm!33809 () Bool)

(assert (=> bm!33809 (= call!33812 (arrayNoDuplicates!0 lt!305875 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75541 (Cons!12621 (select (arr!18545 lt!305875) j!136) Nil!12622) Nil!12622)))))

(declare-fun b!655873 () Bool)

(assert (=> b!655873 (= e!376650 (contains!3174 Nil!12622 (select (arr!18545 lt!305875) j!136)))))

(declare-fun b!655874 () Bool)

(assert (=> b!655874 (= e!376651 call!33812)))

(assert (= (and d!92391 (not res!425522)) b!655872))

(assert (= (and b!655872 res!425524) b!655873))

(assert (= (and b!655872 res!425523) b!655871))

(assert (= (and b!655871 c!75541) b!655870))

(assert (= (and b!655871 (not c!75541)) b!655874))

(assert (= (or b!655870 b!655874) bm!33809))

(assert (=> b!655871 m!628477))

(assert (=> b!655871 m!628477))

(declare-fun m!628481 () Bool)

(assert (=> b!655871 m!628481))

(assert (=> b!655872 m!628477))

(assert (=> b!655872 m!628477))

(assert (=> b!655872 m!628481))

(assert (=> bm!33809 m!628477))

(declare-fun m!628483 () Bool)

(assert (=> bm!33809 m!628483))

(assert (=> b!655873 m!628477))

(assert (=> b!655873 m!628477))

(declare-fun m!628485 () Bool)

(assert (=> b!655873 m!628485))

(assert (=> b!655680 d!92391))

(declare-fun b!655875 () Bool)

(declare-fun e!376655 () Bool)

(declare-fun call!33813 () Bool)

(assert (=> b!655875 (= e!376655 call!33813)))

(declare-fun d!92393 () Bool)

(declare-fun res!425525 () Bool)

(declare-fun e!376656 () Bool)

(assert (=> d!92393 (=> res!425525 e!376656)))

(assert (=> d!92393 (= res!425525 (bvsge #b00000000000000000000000000000000 (size!18910 lt!305875)))))

(assert (=> d!92393 (= (arrayNoDuplicates!0 lt!305875 #b00000000000000000000000000000000 Nil!12622) e!376656)))

(declare-fun b!655876 () Bool)

(declare-fun e!376657 () Bool)

(assert (=> b!655876 (= e!376657 e!376655)))

(declare-fun c!75542 () Bool)

(assert (=> b!655876 (= c!75542 (validKeyInArray!0 (select (arr!18545 lt!305875) #b00000000000000000000000000000000)))))

(declare-fun b!655877 () Bool)

(assert (=> b!655877 (= e!376656 e!376657)))

(declare-fun res!425526 () Bool)

(assert (=> b!655877 (=> (not res!425526) (not e!376657))))

(declare-fun e!376654 () Bool)

(assert (=> b!655877 (= res!425526 (not e!376654))))

(declare-fun res!425527 () Bool)

(assert (=> b!655877 (=> (not res!425527) (not e!376654))))

(assert (=> b!655877 (= res!425527 (validKeyInArray!0 (select (arr!18545 lt!305875) #b00000000000000000000000000000000)))))

(declare-fun bm!33810 () Bool)

(assert (=> bm!33810 (= call!33813 (arrayNoDuplicates!0 lt!305875 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75542 (Cons!12621 (select (arr!18545 lt!305875) #b00000000000000000000000000000000) Nil!12622) Nil!12622)))))

(declare-fun b!655878 () Bool)

(assert (=> b!655878 (= e!376654 (contains!3174 Nil!12622 (select (arr!18545 lt!305875) #b00000000000000000000000000000000)))))

(declare-fun b!655879 () Bool)

(assert (=> b!655879 (= e!376655 call!33813)))

(assert (= (and d!92393 (not res!425525)) b!655877))

(assert (= (and b!655877 res!425527) b!655878))

(assert (= (and b!655877 res!425526) b!655876))

(assert (= (and b!655876 c!75542) b!655875))

(assert (= (and b!655876 (not c!75542)) b!655879))

(assert (= (or b!655875 b!655879) bm!33810))

(declare-fun m!628487 () Bool)

(assert (=> b!655876 m!628487))

(assert (=> b!655876 m!628487))

(declare-fun m!628489 () Bool)

(assert (=> b!655876 m!628489))

(assert (=> b!655877 m!628487))

(assert (=> b!655877 m!628487))

(assert (=> b!655877 m!628489))

(assert (=> bm!33810 m!628487))

(declare-fun m!628491 () Bool)

(assert (=> bm!33810 m!628491))

(assert (=> b!655878 m!628487))

(assert (=> b!655878 m!628487))

(declare-fun m!628493 () Bool)

(assert (=> b!655878 m!628493))

(assert (=> b!655680 d!92393))

(declare-fun d!92395 () Bool)

(declare-fun e!376664 () Bool)

(assert (=> d!92395 e!376664))

(declare-fun res!425534 () Bool)

(assert (=> d!92395 (=> (not res!425534) (not e!376664))))

(assert (=> d!92395 (= res!425534 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986))))))

(declare-fun lt!306024 () Unit!22592)

(declare-fun choose!41 (array!38691 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12625) Unit!22592)

(assert (=> d!92395 (= lt!306024 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12622))))

(assert (=> d!92395 (bvslt (size!18910 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92395 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12622) lt!306024)))

(declare-fun b!655886 () Bool)

(assert (=> b!655886 (= e!376664 (arrayNoDuplicates!0 (array!38692 (store (arr!18545 a!2986) i!1108 k0!1786) (size!18910 a!2986)) #b00000000000000000000000000000000 Nil!12622))))

(assert (= (and d!92395 res!425534) b!655886))

(declare-fun m!628495 () Bool)

(assert (=> d!92395 m!628495))

(assert (=> b!655886 m!628259))

(declare-fun m!628497 () Bool)

(assert (=> b!655886 m!628497))

(assert (=> b!655680 d!92395))

(declare-fun d!92401 () Bool)

(assert (=> d!92401 (arrayNoDuplicates!0 lt!305875 j!136 Nil!12622)))

(declare-fun lt!306027 () Unit!22592)

(declare-fun choose!39 (array!38691 (_ BitVec 32) (_ BitVec 32)) Unit!22592)

(assert (=> d!92401 (= lt!306027 (choose!39 lt!305875 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92401 (bvslt (size!18910 lt!305875) #b01111111111111111111111111111111)))

(assert (=> d!92401 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!305875 #b00000000000000000000000000000000 j!136) lt!306027)))

(declare-fun bs!19496 () Bool)

(assert (= bs!19496 d!92401))

(assert (=> bs!19496 m!628295))

(declare-fun m!628507 () Bool)

(assert (=> bs!19496 m!628507))

(assert (=> b!655680 d!92401))

(declare-fun d!92407 () Bool)

(declare-fun res!425539 () Bool)

(declare-fun e!376669 () Bool)

(assert (=> d!92407 (=> res!425539 e!376669)))

(assert (=> d!92407 (= res!425539 (= (select (arr!18545 lt!305875) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18545 a!2986) j!136)))))

(assert (=> d!92407 (= (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!376669)))

(declare-fun b!655891 () Bool)

(declare-fun e!376670 () Bool)

(assert (=> b!655891 (= e!376669 e!376670)))

(declare-fun res!425540 () Bool)

(assert (=> b!655891 (=> (not res!425540) (not e!376670))))

(assert (=> b!655891 (= res!425540 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18910 lt!305875)))))

(declare-fun b!655892 () Bool)

(assert (=> b!655892 (= e!376670 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92407 (not res!425539)) b!655891))

(assert (= (and b!655891 res!425540) b!655892))

(declare-fun m!628509 () Bool)

(assert (=> d!92407 m!628509))

(assert (=> b!655892 m!628253))

(declare-fun m!628511 () Bool)

(assert (=> b!655892 m!628511))

(assert (=> b!655680 d!92407))

(declare-fun d!92409 () Bool)

(declare-fun res!425541 () Bool)

(declare-fun e!376671 () Bool)

(assert (=> d!92409 (=> res!425541 e!376671)))

(assert (=> d!92409 (= res!425541 (= (select (arr!18545 lt!305875) j!136) (select (arr!18545 a!2986) j!136)))))

(assert (=> d!92409 (= (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136) e!376671)))

(declare-fun b!655893 () Bool)

(declare-fun e!376672 () Bool)

(assert (=> b!655893 (= e!376671 e!376672)))

(declare-fun res!425542 () Bool)

(assert (=> b!655893 (=> (not res!425542) (not e!376672))))

(assert (=> b!655893 (= res!425542 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18910 lt!305875)))))

(declare-fun b!655894 () Bool)

(assert (=> b!655894 (= e!376672 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92409 (not res!425541)) b!655893))

(assert (= (and b!655893 res!425542) b!655894))

(assert (=> d!92409 m!628477))

(assert (=> b!655894 m!628253))

(declare-fun m!628513 () Bool)

(assert (=> b!655894 m!628513))

(assert (=> b!655679 d!92409))

(declare-fun d!92411 () Bool)

(assert (=> d!92411 (arrayNoDuplicates!0 lt!305875 index!984 Nil!12622)))

(declare-fun lt!306028 () Unit!22592)

(assert (=> d!92411 (= lt!306028 (choose!39 lt!305875 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92411 (bvslt (size!18910 lt!305875) #b01111111111111111111111111111111)))

(assert (=> d!92411 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!305875 #b00000000000000000000000000000000 index!984) lt!306028)))

(declare-fun bs!19497 () Bool)

(assert (= bs!19497 d!92411))

(assert (=> bs!19497 m!628275))

(declare-fun m!628515 () Bool)

(assert (=> bs!19497 m!628515))

(assert (=> b!655689 d!92411))

(assert (=> b!655689 d!92393))

(declare-fun d!92413 () Bool)

(assert (=> d!92413 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306029 () Unit!22592)

(assert (=> d!92413 (= lt!306029 (choose!114 lt!305875 (select (arr!18545 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92413 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92413 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305875 (select (arr!18545 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306029)))

(declare-fun bs!19498 () Bool)

(assert (= bs!19498 d!92413))

(assert (=> bs!19498 m!628253))

(assert (=> bs!19498 m!628271))

(assert (=> bs!19498 m!628253))

(declare-fun m!628517 () Bool)

(assert (=> bs!19498 m!628517))

(assert (=> b!655689 d!92413))

(assert (=> b!655689 d!92395))

(declare-fun d!92415 () Bool)

(assert (=> d!92415 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18910 lt!305875)) (not (= (select (arr!18545 lt!305875) index!984) (select (arr!18545 a!2986) j!136))))))

(declare-fun lt!306030 () Unit!22592)

(assert (=> d!92415 (= lt!306030 (choose!21 lt!305875 (select (arr!18545 a!2986) j!136) index!984 Nil!12622))))

(assert (=> d!92415 (bvslt (size!18910 lt!305875) #b01111111111111111111111111111111)))

(assert (=> d!92415 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305875 (select (arr!18545 a!2986) j!136) index!984 Nil!12622) lt!306030)))

(declare-fun bs!19499 () Bool)

(assert (= bs!19499 d!92415))

(assert (=> bs!19499 m!628455))

(assert (=> bs!19499 m!628253))

(declare-fun m!628519 () Bool)

(assert (=> bs!19499 m!628519))

(assert (=> b!655689 d!92415))

(declare-fun d!92417 () Bool)

(declare-fun res!425543 () Bool)

(declare-fun e!376673 () Bool)

(assert (=> d!92417 (=> res!425543 e!376673)))

(assert (=> d!92417 (= res!425543 (= (select (arr!18545 lt!305875) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18545 a!2986) j!136)))))

(assert (=> d!92417 (= (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!376673)))

(declare-fun b!655895 () Bool)

(declare-fun e!376674 () Bool)

(assert (=> b!655895 (= e!376673 e!376674)))

(declare-fun res!425544 () Bool)

(assert (=> b!655895 (=> (not res!425544) (not e!376674))))

(assert (=> b!655895 (= res!425544 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18910 lt!305875)))))

(declare-fun b!655896 () Bool)

(assert (=> b!655896 (= e!376674 (arrayContainsKey!0 lt!305875 (select (arr!18545 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92417 (not res!425543)) b!655895))

(assert (= (and b!655895 res!425544) b!655896))

(declare-fun m!628521 () Bool)

(assert (=> d!92417 m!628521))

(assert (=> b!655896 m!628253))

(declare-fun m!628523 () Bool)

(assert (=> b!655896 m!628523))

(assert (=> b!655689 d!92417))

(assert (=> b!655689 d!92409))

(declare-fun b!655897 () Bool)

(declare-fun e!376676 () Bool)

(declare-fun call!33814 () Bool)

(assert (=> b!655897 (= e!376676 call!33814)))

(declare-fun d!92419 () Bool)

(declare-fun res!425545 () Bool)

(declare-fun e!376677 () Bool)

(assert (=> d!92419 (=> res!425545 e!376677)))

(assert (=> d!92419 (= res!425545 (bvsge index!984 (size!18910 lt!305875)))))

(assert (=> d!92419 (= (arrayNoDuplicates!0 lt!305875 index!984 Nil!12622) e!376677)))

(declare-fun b!655898 () Bool)

(declare-fun e!376678 () Bool)

(assert (=> b!655898 (= e!376678 e!376676)))

(declare-fun c!75543 () Bool)

(assert (=> b!655898 (= c!75543 (validKeyInArray!0 (select (arr!18545 lt!305875) index!984)))))

(declare-fun b!655899 () Bool)

(assert (=> b!655899 (= e!376677 e!376678)))

(declare-fun res!425546 () Bool)

(assert (=> b!655899 (=> (not res!425546) (not e!376678))))

(declare-fun e!376675 () Bool)

(assert (=> b!655899 (= res!425546 (not e!376675))))

(declare-fun res!425547 () Bool)

(assert (=> b!655899 (=> (not res!425547) (not e!376675))))

(assert (=> b!655899 (= res!425547 (validKeyInArray!0 (select (arr!18545 lt!305875) index!984)))))

(declare-fun bm!33811 () Bool)

(assert (=> bm!33811 (= call!33814 (arrayNoDuplicates!0 lt!305875 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75543 (Cons!12621 (select (arr!18545 lt!305875) index!984) Nil!12622) Nil!12622)))))

(declare-fun b!655900 () Bool)

(assert (=> b!655900 (= e!376675 (contains!3174 Nil!12622 (select (arr!18545 lt!305875) index!984)))))

(declare-fun b!655901 () Bool)

(assert (=> b!655901 (= e!376676 call!33814)))

(assert (= (and d!92419 (not res!425545)) b!655899))

(assert (= (and b!655899 res!425547) b!655900))

(assert (= (and b!655899 res!425546) b!655898))

(assert (= (and b!655898 c!75543) b!655897))

(assert (= (and b!655898 (not c!75543)) b!655901))

(assert (= (or b!655897 b!655901) bm!33811))

(assert (=> b!655898 m!628455))

(assert (=> b!655898 m!628455))

(declare-fun m!628525 () Bool)

(assert (=> b!655898 m!628525))

(assert (=> b!655899 m!628455))

(assert (=> b!655899 m!628455))

(assert (=> b!655899 m!628525))

(assert (=> bm!33811 m!628455))

(declare-fun m!628527 () Bool)

(assert (=> bm!33811 m!628527))

(assert (=> b!655900 m!628455))

(assert (=> b!655900 m!628455))

(declare-fun m!628529 () Bool)

(assert (=> b!655900 m!628529))

(assert (=> b!655689 d!92419))

(declare-fun d!92421 () Bool)

(declare-fun res!425548 () Bool)

(declare-fun e!376679 () Bool)

(assert (=> d!92421 (=> res!425548 e!376679)))

(assert (=> d!92421 (= res!425548 (= (select (arr!18545 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92421 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!376679)))

(declare-fun b!655902 () Bool)

(declare-fun e!376680 () Bool)

(assert (=> b!655902 (= e!376679 e!376680)))

(declare-fun res!425549 () Bool)

(assert (=> b!655902 (=> (not res!425549) (not e!376680))))

(assert (=> b!655902 (= res!425549 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18910 a!2986)))))

(declare-fun b!655903 () Bool)

(assert (=> b!655903 (= e!376680 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92421 (not res!425548)) b!655902))

(assert (= (and b!655902 res!425549) b!655903))

(assert (=> d!92421 m!628461))

(declare-fun m!628531 () Bool)

(assert (=> b!655903 m!628531))

(assert (=> b!655677 d!92421))

(declare-fun b!655931 () Bool)

(declare-fun e!376700 () SeekEntryResult!6982)

(assert (=> b!655931 (= e!376700 (Found!6982 lt!305886))))

(declare-fun b!655932 () Bool)

(declare-fun c!75554 () Bool)

(declare-fun lt!306038 () (_ BitVec 64))

(assert (=> b!655932 (= c!75554 (= lt!306038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376699 () SeekEntryResult!6982)

(assert (=> b!655932 (= e!376700 e!376699)))

(declare-fun b!655933 () Bool)

(assert (=> b!655933 (= e!376699 (MissingVacant!6982 vacantSpotIndex!68))))

(declare-fun lt!306039 () SeekEntryResult!6982)

(declare-fun d!92423 () Bool)

(get-info :version)

(assert (=> d!92423 (and (or ((_ is Undefined!6982) lt!306039) (not ((_ is Found!6982) lt!306039)) (and (bvsge (index!30288 lt!306039) #b00000000000000000000000000000000) (bvslt (index!30288 lt!306039) (size!18910 lt!305875)))) (or ((_ is Undefined!6982) lt!306039) ((_ is Found!6982) lt!306039) (not ((_ is MissingVacant!6982) lt!306039)) (not (= (index!30290 lt!306039) vacantSpotIndex!68)) (and (bvsge (index!30290 lt!306039) #b00000000000000000000000000000000) (bvslt (index!30290 lt!306039) (size!18910 lt!305875)))) (or ((_ is Undefined!6982) lt!306039) (ite ((_ is Found!6982) lt!306039) (= (select (arr!18545 lt!305875) (index!30288 lt!306039)) lt!305872) (and ((_ is MissingVacant!6982) lt!306039) (= (index!30290 lt!306039) vacantSpotIndex!68) (= (select (arr!18545 lt!305875) (index!30290 lt!306039)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!376701 () SeekEntryResult!6982)

(assert (=> d!92423 (= lt!306039 e!376701)))

(declare-fun c!75555 () Bool)

(assert (=> d!92423 (= c!75555 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92423 (= lt!306038 (select (arr!18545 lt!305875) lt!305886))))

(assert (=> d!92423 (validMask!0 mask!3053)))

(assert (=> d!92423 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 lt!305872 lt!305875 mask!3053) lt!306039)))

(declare-fun b!655934 () Bool)

(assert (=> b!655934 (= e!376701 e!376700)))

(declare-fun c!75553 () Bool)

(assert (=> b!655934 (= c!75553 (= lt!306038 lt!305872))))

(declare-fun b!655935 () Bool)

(assert (=> b!655935 (= e!376699 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!305886 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!305872 lt!305875 mask!3053))))

(declare-fun b!655936 () Bool)

(assert (=> b!655936 (= e!376701 Undefined!6982)))

(assert (= (and d!92423 c!75555) b!655936))

(assert (= (and d!92423 (not c!75555)) b!655934))

(assert (= (and b!655934 c!75553) b!655931))

(assert (= (and b!655934 (not c!75553)) b!655932))

(assert (= (and b!655932 c!75554) b!655933))

(assert (= (and b!655932 (not c!75554)) b!655935))

(declare-fun m!628547 () Bool)

(assert (=> d!92423 m!628547))

(declare-fun m!628551 () Bool)

(assert (=> d!92423 m!628551))

(declare-fun m!628553 () Bool)

(assert (=> d!92423 m!628553))

(assert (=> d!92423 m!628247))

(declare-fun m!628555 () Bool)

(assert (=> b!655935 m!628555))

(assert (=> b!655935 m!628555))

(declare-fun m!628557 () Bool)

(assert (=> b!655935 m!628557))

(assert (=> b!655688 d!92423))

(declare-fun d!92435 () Bool)

(declare-fun e!376713 () Bool)

(assert (=> d!92435 e!376713))

(declare-fun res!425569 () Bool)

(assert (=> d!92435 (=> (not res!425569) (not e!376713))))

(assert (=> d!92435 (= res!425569 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18910 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18910 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18910 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18910 a!2986))))))

(declare-fun lt!306051 () Unit!22592)

(declare-fun choose!9 (array!38691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22592)

(assert (=> d!92435 (= lt!306051 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92435 (validMask!0 mask!3053)))

(assert (=> d!92435 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 mask!3053) lt!306051)))

(declare-fun b!655949 () Bool)

(assert (=> b!655949 (= e!376713 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 (select (store (arr!18545 a!2986) i!1108 k0!1786) j!136) (array!38692 (store (arr!18545 a!2986) i!1108 k0!1786) (size!18910 a!2986)) mask!3053)))))

(assert (= (and d!92435 res!425569) b!655949))

(declare-fun m!628573 () Bool)

(assert (=> d!92435 m!628573))

(assert (=> d!92435 m!628247))

(assert (=> b!655949 m!628305))

(assert (=> b!655949 m!628305))

(declare-fun m!628575 () Bool)

(assert (=> b!655949 m!628575))

(assert (=> b!655949 m!628259))

(assert (=> b!655949 m!628253))

(assert (=> b!655949 m!628311))

(assert (=> b!655949 m!628253))

(assert (=> b!655688 d!92435))

(declare-fun b!655950 () Bool)

(declare-fun e!376715 () SeekEntryResult!6982)

(assert (=> b!655950 (= e!376715 (Found!6982 lt!305886))))

(declare-fun b!655951 () Bool)

(declare-fun c!75558 () Bool)

(declare-fun lt!306052 () (_ BitVec 64))

(assert (=> b!655951 (= c!75558 (= lt!306052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376714 () SeekEntryResult!6982)

(assert (=> b!655951 (= e!376715 e!376714)))

(declare-fun b!655952 () Bool)

(assert (=> b!655952 (= e!376714 (MissingVacant!6982 vacantSpotIndex!68))))

(declare-fun lt!306053 () SeekEntryResult!6982)

(declare-fun d!92447 () Bool)

(assert (=> d!92447 (and (or ((_ is Undefined!6982) lt!306053) (not ((_ is Found!6982) lt!306053)) (and (bvsge (index!30288 lt!306053) #b00000000000000000000000000000000) (bvslt (index!30288 lt!306053) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306053) ((_ is Found!6982) lt!306053) (not ((_ is MissingVacant!6982) lt!306053)) (not (= (index!30290 lt!306053) vacantSpotIndex!68)) (and (bvsge (index!30290 lt!306053) #b00000000000000000000000000000000) (bvslt (index!30290 lt!306053) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306053) (ite ((_ is Found!6982) lt!306053) (= (select (arr!18545 a!2986) (index!30288 lt!306053)) (select (arr!18545 a!2986) j!136)) (and ((_ is MissingVacant!6982) lt!306053) (= (index!30290 lt!306053) vacantSpotIndex!68) (= (select (arr!18545 a!2986) (index!30290 lt!306053)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!376716 () SeekEntryResult!6982)

(assert (=> d!92447 (= lt!306053 e!376716)))

(declare-fun c!75559 () Bool)

(assert (=> d!92447 (= c!75559 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92447 (= lt!306052 (select (arr!18545 a!2986) lt!305886))))

(assert (=> d!92447 (validMask!0 mask!3053)))

(assert (=> d!92447 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305886 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053) lt!306053)))

(declare-fun b!655953 () Bool)

(assert (=> b!655953 (= e!376716 e!376715)))

(declare-fun c!75557 () Bool)

(assert (=> b!655953 (= c!75557 (= lt!306052 (select (arr!18545 a!2986) j!136)))))

(declare-fun b!655954 () Bool)

(assert (=> b!655954 (= e!376714 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!305886 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655955 () Bool)

(assert (=> b!655955 (= e!376716 Undefined!6982)))

(assert (= (and d!92447 c!75559) b!655955))

(assert (= (and d!92447 (not c!75559)) b!655953))

(assert (= (and b!655953 c!75557) b!655950))

(assert (= (and b!655953 (not c!75557)) b!655951))

(assert (= (and b!655951 c!75558) b!655952))

(assert (= (and b!655951 (not c!75558)) b!655954))

(declare-fun m!628577 () Bool)

(assert (=> d!92447 m!628577))

(declare-fun m!628579 () Bool)

(assert (=> d!92447 m!628579))

(declare-fun m!628581 () Bool)

(assert (=> d!92447 m!628581))

(assert (=> d!92447 m!628247))

(assert (=> b!655954 m!628555))

(assert (=> b!655954 m!628555))

(assert (=> b!655954 m!628253))

(declare-fun m!628583 () Bool)

(assert (=> b!655954 m!628583))

(assert (=> b!655688 d!92447))

(declare-fun d!92449 () Bool)

(declare-fun lt!306062 () (_ BitVec 32))

(assert (=> d!92449 (and (bvsge lt!306062 #b00000000000000000000000000000000) (bvslt lt!306062 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92449 (= lt!306062 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92449 (validMask!0 mask!3053)))

(assert (=> d!92449 (= (nextIndex!0 index!984 x!910 mask!3053) lt!306062)))

(declare-fun bs!19503 () Bool)

(assert (= bs!19503 d!92449))

(declare-fun m!628585 () Bool)

(assert (=> bs!19503 m!628585))

(assert (=> bs!19503 m!628247))

(assert (=> b!655688 d!92449))

(declare-fun b!655964 () Bool)

(declare-fun e!376724 () SeekEntryResult!6982)

(assert (=> b!655964 (= e!376724 (Found!6982 index!984))))

(declare-fun b!655965 () Bool)

(declare-fun c!75563 () Bool)

(declare-fun lt!306063 () (_ BitVec 64))

(assert (=> b!655965 (= c!75563 (= lt!306063 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376723 () SeekEntryResult!6982)

(assert (=> b!655965 (= e!376724 e!376723)))

(declare-fun b!655966 () Bool)

(assert (=> b!655966 (= e!376723 (MissingVacant!6982 vacantSpotIndex!68))))

(declare-fun lt!306064 () SeekEntryResult!6982)

(declare-fun d!92451 () Bool)

(assert (=> d!92451 (and (or ((_ is Undefined!6982) lt!306064) (not ((_ is Found!6982) lt!306064)) (and (bvsge (index!30288 lt!306064) #b00000000000000000000000000000000) (bvslt (index!30288 lt!306064) (size!18910 lt!305875)))) (or ((_ is Undefined!6982) lt!306064) ((_ is Found!6982) lt!306064) (not ((_ is MissingVacant!6982) lt!306064)) (not (= (index!30290 lt!306064) vacantSpotIndex!68)) (and (bvsge (index!30290 lt!306064) #b00000000000000000000000000000000) (bvslt (index!30290 lt!306064) (size!18910 lt!305875)))) (or ((_ is Undefined!6982) lt!306064) (ite ((_ is Found!6982) lt!306064) (= (select (arr!18545 lt!305875) (index!30288 lt!306064)) lt!305872) (and ((_ is MissingVacant!6982) lt!306064) (= (index!30290 lt!306064) vacantSpotIndex!68) (= (select (arr!18545 lt!305875) (index!30290 lt!306064)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!376725 () SeekEntryResult!6982)

(assert (=> d!92451 (= lt!306064 e!376725)))

(declare-fun c!75564 () Bool)

(assert (=> d!92451 (= c!75564 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92451 (= lt!306063 (select (arr!18545 lt!305875) index!984))))

(assert (=> d!92451 (validMask!0 mask!3053)))

(assert (=> d!92451 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305872 lt!305875 mask!3053) lt!306064)))

(declare-fun b!655967 () Bool)

(assert (=> b!655967 (= e!376725 e!376724)))

(declare-fun c!75562 () Bool)

(assert (=> b!655967 (= c!75562 (= lt!306063 lt!305872))))

(declare-fun b!655968 () Bool)

(assert (=> b!655968 (= e!376723 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!305872 lt!305875 mask!3053))))

(declare-fun b!655969 () Bool)

(assert (=> b!655969 (= e!376725 Undefined!6982)))

(assert (= (and d!92451 c!75564) b!655969))

(assert (= (and d!92451 (not c!75564)) b!655967))

(assert (= (and b!655967 c!75562) b!655964))

(assert (= (and b!655967 (not c!75562)) b!655965))

(assert (= (and b!655965 c!75563) b!655966))

(assert (= (and b!655965 (not c!75563)) b!655968))

(declare-fun m!628587 () Bool)

(assert (=> d!92451 m!628587))

(declare-fun m!628589 () Bool)

(assert (=> d!92451 m!628589))

(assert (=> d!92451 m!628455))

(assert (=> d!92451 m!628247))

(assert (=> b!655968 m!628303))

(assert (=> b!655968 m!628303))

(declare-fun m!628591 () Bool)

(assert (=> b!655968 m!628591))

(assert (=> b!655688 d!92451))

(declare-fun d!92453 () Bool)

(assert (=> d!92453 (= (validKeyInArray!0 (select (arr!18545 a!2986) j!136)) (and (not (= (select (arr!18545 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18545 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!655676 d!92453))

(declare-fun b!656044 () Bool)

(declare-fun c!75590 () Bool)

(declare-fun lt!306097 () (_ BitVec 64))

(assert (=> b!656044 (= c!75590 (= lt!306097 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376777 () SeekEntryResult!6982)

(declare-fun e!376775 () SeekEntryResult!6982)

(assert (=> b!656044 (= e!376777 e!376775)))

(declare-fun b!656045 () Bool)

(declare-fun lt!306096 () SeekEntryResult!6982)

(assert (=> b!656045 (= e!376777 (Found!6982 (index!30289 lt!306096)))))

(declare-fun d!92455 () Bool)

(declare-fun lt!306098 () SeekEntryResult!6982)

(assert (=> d!92455 (and (or ((_ is Undefined!6982) lt!306098) (not ((_ is Found!6982) lt!306098)) (and (bvsge (index!30288 lt!306098) #b00000000000000000000000000000000) (bvslt (index!30288 lt!306098) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306098) ((_ is Found!6982) lt!306098) (not ((_ is MissingZero!6982) lt!306098)) (and (bvsge (index!30287 lt!306098) #b00000000000000000000000000000000) (bvslt (index!30287 lt!306098) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306098) ((_ is Found!6982) lt!306098) ((_ is MissingZero!6982) lt!306098) (not ((_ is MissingVacant!6982) lt!306098)) (and (bvsge (index!30290 lt!306098) #b00000000000000000000000000000000) (bvslt (index!30290 lt!306098) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306098) (ite ((_ is Found!6982) lt!306098) (= (select (arr!18545 a!2986) (index!30288 lt!306098)) k0!1786) (ite ((_ is MissingZero!6982) lt!306098) (= (select (arr!18545 a!2986) (index!30287 lt!306098)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6982) lt!306098) (= (select (arr!18545 a!2986) (index!30290 lt!306098)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!376776 () SeekEntryResult!6982)

(assert (=> d!92455 (= lt!306098 e!376776)))

(declare-fun c!75592 () Bool)

(assert (=> d!92455 (= c!75592 (and ((_ is Intermediate!6982) lt!306096) (undefined!7794 lt!306096)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38691 (_ BitVec 32)) SeekEntryResult!6982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92455 (= lt!306096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92455 (validMask!0 mask!3053)))

(assert (=> d!92455 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!306098)))

(declare-fun b!656046 () Bool)

(assert (=> b!656046 (= e!376775 (seekKeyOrZeroReturnVacant!0 (x!59082 lt!306096) (index!30289 lt!306096) (index!30289 lt!306096) k0!1786 a!2986 mask!3053))))

(declare-fun b!656047 () Bool)

(assert (=> b!656047 (= e!376775 (MissingZero!6982 (index!30289 lt!306096)))))

(declare-fun b!656048 () Bool)

(assert (=> b!656048 (= e!376776 Undefined!6982)))

(declare-fun b!656049 () Bool)

(assert (=> b!656049 (= e!376776 e!376777)))

(assert (=> b!656049 (= lt!306097 (select (arr!18545 a!2986) (index!30289 lt!306096)))))

(declare-fun c!75591 () Bool)

(assert (=> b!656049 (= c!75591 (= lt!306097 k0!1786))))

(assert (= (and d!92455 c!75592) b!656048))

(assert (= (and d!92455 (not c!75592)) b!656049))

(assert (= (and b!656049 c!75591) b!656045))

(assert (= (and b!656049 (not c!75591)) b!656044))

(assert (= (and b!656044 c!75590) b!656047))

(assert (= (and b!656044 (not c!75590)) b!656046))

(declare-fun m!628645 () Bool)

(assert (=> d!92455 m!628645))

(declare-fun m!628647 () Bool)

(assert (=> d!92455 m!628647))

(assert (=> d!92455 m!628247))

(declare-fun m!628649 () Bool)

(assert (=> d!92455 m!628649))

(assert (=> d!92455 m!628645))

(declare-fun m!628651 () Bool)

(assert (=> d!92455 m!628651))

(declare-fun m!628653 () Bool)

(assert (=> d!92455 m!628653))

(declare-fun m!628655 () Bool)

(assert (=> b!656046 m!628655))

(declare-fun m!628657 () Bool)

(assert (=> b!656049 m!628657))

(assert (=> b!655686 d!92455))

(declare-fun d!92481 () Bool)

(assert (=> d!92481 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!655685 d!92481))

(declare-fun b!656060 () Bool)

(declare-fun e!376784 () SeekEntryResult!6982)

(assert (=> b!656060 (= e!376784 (Found!6982 index!984))))

(declare-fun b!656061 () Bool)

(declare-fun c!75599 () Bool)

(declare-fun lt!306101 () (_ BitVec 64))

(assert (=> b!656061 (= c!75599 (= lt!306101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!376783 () SeekEntryResult!6982)

(assert (=> b!656061 (= e!376784 e!376783)))

(declare-fun b!656062 () Bool)

(assert (=> b!656062 (= e!376783 (MissingVacant!6982 vacantSpotIndex!68))))

(declare-fun d!92483 () Bool)

(declare-fun lt!306102 () SeekEntryResult!6982)

(assert (=> d!92483 (and (or ((_ is Undefined!6982) lt!306102) (not ((_ is Found!6982) lt!306102)) (and (bvsge (index!30288 lt!306102) #b00000000000000000000000000000000) (bvslt (index!30288 lt!306102) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306102) ((_ is Found!6982) lt!306102) (not ((_ is MissingVacant!6982) lt!306102)) (not (= (index!30290 lt!306102) vacantSpotIndex!68)) (and (bvsge (index!30290 lt!306102) #b00000000000000000000000000000000) (bvslt (index!30290 lt!306102) (size!18910 a!2986)))) (or ((_ is Undefined!6982) lt!306102) (ite ((_ is Found!6982) lt!306102) (= (select (arr!18545 a!2986) (index!30288 lt!306102)) (select (arr!18545 a!2986) j!136)) (and ((_ is MissingVacant!6982) lt!306102) (= (index!30290 lt!306102) vacantSpotIndex!68) (= (select (arr!18545 a!2986) (index!30290 lt!306102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!376785 () SeekEntryResult!6982)

(assert (=> d!92483 (= lt!306102 e!376785)))

(declare-fun c!75600 () Bool)

(assert (=> d!92483 (= c!75600 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92483 (= lt!306101 (select (arr!18545 a!2986) index!984))))

(assert (=> d!92483 (validMask!0 mask!3053)))

(assert (=> d!92483 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053) lt!306102)))

(declare-fun b!656063 () Bool)

(assert (=> b!656063 (= e!376785 e!376784)))

(declare-fun c!75598 () Bool)

(assert (=> b!656063 (= c!75598 (= lt!306101 (select (arr!18545 a!2986) j!136)))))

(declare-fun b!656064 () Bool)

(assert (=> b!656064 (= e!376783 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18545 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656065 () Bool)

(assert (=> b!656065 (= e!376785 Undefined!6982)))

(assert (= (and d!92483 c!75600) b!656065))

(assert (= (and d!92483 (not c!75600)) b!656063))

(assert (= (and b!656063 c!75598) b!656060))

(assert (= (and b!656063 (not c!75598)) b!656061))

(assert (= (and b!656061 c!75599) b!656062))

(assert (= (and b!656061 (not c!75599)) b!656064))

(declare-fun m!628669 () Bool)

(assert (=> d!92483 m!628669))

(declare-fun m!628671 () Bool)

(assert (=> d!92483 m!628671))

(assert (=> d!92483 m!628283))

(assert (=> d!92483 m!628247))

(assert (=> b!656064 m!628303))

(assert (=> b!656064 m!628303))

(assert (=> b!656064 m!628253))

(declare-fun m!628673 () Bool)

(assert (=> b!656064 m!628673))

(assert (=> b!655674 d!92483))

(assert (=> b!655683 d!92381))

(check-sat (not b!655968) (not b!655886) (not b!655873) (not b!655894) (not b!655898) (not b!655900) (not b!655903) (not d!92411) (not b!655954) (not b!655896) (not d!92423) (not d!92401) (not b!655871) (not b!655867) (not bm!33805) (not d!92389) (not d!92483) (not b!655866) (not bm!33810) (not b!655853) (not b!655852) (not bm!33809) (not bm!33811) (not b!655935) (not b!655877) (not b!655892) (not d!92435) (not b!655872) (not d!92413) (not d!92451) (not b!655868) (not b!655842) (not b!655949) (not b!655899) (not d!92395) (not d!92447) (not d!92415) (not b!655878) (not d!92387) (not b!656046) (not d!92449) (not bm!33808) (not b!655876) (not b!656064) (not d!92455))
(check-sat)
