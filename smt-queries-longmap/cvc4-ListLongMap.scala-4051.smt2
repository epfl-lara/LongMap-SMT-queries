; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55442 () Bool)

(assert start!55442)

(declare-fun b!606598 () Bool)

(declare-fun res!389716 () Bool)

(declare-fun e!347317 () Bool)

(assert (=> b!606598 (=> (not res!389716) (not e!347317))))

(declare-datatypes ((array!37266 0))(
  ( (array!37267 (arr!17885 (Array (_ BitVec 32) (_ BitVec 64))) (size!18249 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37266)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!606598 (= res!389716 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!606599 () Bool)

(declare-fun res!389697 () Bool)

(declare-fun e!347316 () Bool)

(assert (=> b!606599 (=> (not res!389697) (not e!347316))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37266 (_ BitVec 32)) Bool)

(assert (=> b!606599 (= res!389697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!606600 () Bool)

(declare-datatypes ((Unit!19330 0))(
  ( (Unit!19331) )
))
(declare-fun e!347308 () Unit!19330)

(declare-fun Unit!19332 () Unit!19330)

(assert (=> b!606600 (= e!347308 Unit!19332)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276878 () Unit!19330)

(declare-fun lt!276871 () array!37266)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19330)

(assert (=> b!606600 (= lt!276878 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276871 (select (arr!17885 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!606600 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!276884 () Unit!19330)

(declare-datatypes ((List!11926 0))(
  ( (Nil!11923) (Cons!11922 (h!12967 (_ BitVec 64)) (t!18154 List!11926)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11926) Unit!19330)

(assert (=> b!606600 (= lt!276884 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11923))))

(declare-fun arrayNoDuplicates!0 (array!37266 (_ BitVec 32) List!11926) Bool)

(assert (=> b!606600 (arrayNoDuplicates!0 lt!276871 #b00000000000000000000000000000000 Nil!11923)))

(declare-fun lt!276875 () Unit!19330)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37266 (_ BitVec 32) (_ BitVec 32)) Unit!19330)

(assert (=> b!606600 (= lt!276875 (lemmaNoDuplicateFromThenFromBigger!0 lt!276871 #b00000000000000000000000000000000 j!136))))

(assert (=> b!606600 (arrayNoDuplicates!0 lt!276871 j!136 Nil!11923)))

(declare-fun lt!276881 () Unit!19330)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37266 (_ BitVec 64) (_ BitVec 32) List!11926) Unit!19330)

(assert (=> b!606600 (= lt!276881 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276871 (select (arr!17885 a!2986) j!136) j!136 Nil!11923))))

(assert (=> b!606600 false))

(declare-fun b!606601 () Bool)

(declare-fun res!389711 () Bool)

(declare-fun e!347306 () Bool)

(assert (=> b!606601 (=> res!389711 e!347306)))

(declare-fun noDuplicate!308 (List!11926) Bool)

(assert (=> b!606601 (= res!389711 (not (noDuplicate!308 Nil!11923)))))

(declare-fun b!606602 () Bool)

(declare-fun res!389710 () Bool)

(assert (=> b!606602 (=> (not res!389710) (not e!347316))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!606602 (= res!389710 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17885 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606603 () Bool)

(declare-fun e!347315 () Unit!19330)

(declare-fun Unit!19333 () Unit!19330)

(assert (=> b!606603 (= e!347315 Unit!19333)))

(declare-fun b!606604 () Bool)

(declare-fun e!347311 () Bool)

(declare-fun e!347307 () Bool)

(assert (=> b!606604 (= e!347311 e!347307)))

(declare-fun res!389709 () Bool)

(assert (=> b!606604 (=> (not res!389709) (not e!347307))))

(assert (=> b!606604 (= res!389709 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) j!136))))

(declare-fun b!606605 () Bool)

(declare-fun e!347303 () Bool)

(assert (=> b!606605 (= e!347306 e!347303)))

(declare-fun res!389707 () Bool)

(assert (=> b!606605 (=> (not res!389707) (not e!347303))))

(declare-fun contains!3002 (List!11926 (_ BitVec 64)) Bool)

(assert (=> b!606605 (= res!389707 (not (contains!3002 Nil!11923 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606606 () Bool)

(declare-fun res!389706 () Bool)

(assert (=> b!606606 (=> (not res!389706) (not e!347317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!606606 (= res!389706 (validKeyInArray!0 (select (arr!17885 a!2986) j!136)))))

(declare-fun b!606607 () Bool)

(declare-fun res!389703 () Bool)

(assert (=> b!606607 (=> (not res!389703) (not e!347317))))

(assert (=> b!606607 (= res!389703 (and (= (size!18249 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18249 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18249 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!606608 () Bool)

(declare-fun e!347310 () Bool)

(declare-datatypes ((SeekEntryResult!6325 0))(
  ( (MissingZero!6325 (index!27572 (_ BitVec 32))) (Found!6325 (index!27573 (_ BitVec 32))) (Intermediate!6325 (undefined!7137 Bool) (index!27574 (_ BitVec 32)) (x!56377 (_ BitVec 32))) (Undefined!6325) (MissingVacant!6325 (index!27575 (_ BitVec 32))) )
))
(declare-fun lt!276882 () SeekEntryResult!6325)

(declare-fun lt!276872 () SeekEntryResult!6325)

(assert (=> b!606608 (= e!347310 (= lt!276882 lt!276872))))

(declare-fun e!347312 () Bool)

(declare-fun b!606609 () Bool)

(assert (=> b!606609 (= e!347312 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) index!984))))

(declare-fun b!606610 () Bool)

(declare-fun Unit!19334 () Unit!19330)

(assert (=> b!606610 (= e!347308 Unit!19334)))

(declare-fun b!606611 () Bool)

(assert (=> b!606611 (= e!347303 (not (contains!3002 Nil!11923 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!606612 () Bool)

(assert (=> b!606612 (= e!347317 e!347316)))

(declare-fun res!389698 () Bool)

(assert (=> b!606612 (=> (not res!389698) (not e!347316))))

(declare-fun lt!276885 () SeekEntryResult!6325)

(assert (=> b!606612 (= res!389698 (or (= lt!276885 (MissingZero!6325 i!1108)) (= lt!276885 (MissingVacant!6325 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37266 (_ BitVec 32)) SeekEntryResult!6325)

(assert (=> b!606612 (= lt!276885 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!389700 () Bool)

(assert (=> start!55442 (=> (not res!389700) (not e!347317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55442 (= res!389700 (validMask!0 mask!3053))))

(assert (=> start!55442 e!347317))

(assert (=> start!55442 true))

(declare-fun array_inv!13681 (array!37266) Bool)

(assert (=> start!55442 (array_inv!13681 a!2986)))

(declare-fun b!606613 () Bool)

(declare-fun e!347309 () Bool)

(declare-fun e!347305 () Bool)

(assert (=> b!606613 (= e!347309 e!347305)))

(declare-fun res!389708 () Bool)

(assert (=> b!606613 (=> res!389708 e!347305)))

(assert (=> b!606613 (= res!389708 (bvsge index!984 j!136))))

(declare-fun lt!276886 () Unit!19330)

(assert (=> b!606613 (= lt!276886 e!347308)))

(declare-fun c!68818 () Bool)

(assert (=> b!606613 (= c!68818 (bvslt j!136 index!984))))

(declare-fun b!606614 () Bool)

(declare-fun res!389705 () Bool)

(assert (=> b!606614 (=> (not res!389705) (not e!347317))))

(assert (=> b!606614 (= res!389705 (validKeyInArray!0 k!1786))))

(declare-fun b!606615 () Bool)

(declare-fun res!389714 () Bool)

(assert (=> b!606615 (=> (not res!389714) (not e!347316))))

(assert (=> b!606615 (= res!389714 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11923))))

(declare-fun b!606616 () Bool)

(declare-fun e!347304 () Bool)

(assert (=> b!606616 (= e!347316 e!347304)))

(declare-fun res!389701 () Bool)

(assert (=> b!606616 (=> (not res!389701) (not e!347304))))

(assert (=> b!606616 (= res!389701 (= (select (store (arr!17885 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606616 (= lt!276871 (array!37267 (store (arr!17885 a!2986) i!1108 k!1786) (size!18249 a!2986)))))

(declare-fun b!606617 () Bool)

(assert (=> b!606617 (= e!347305 e!347306)))

(declare-fun res!389715 () Bool)

(assert (=> b!606617 (=> res!389715 e!347306)))

(assert (=> b!606617 (= res!389715 (or (bvsgt #b00000000000000000000000000000000 (size!18249 a!2986)) (bvsge (size!18249 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!606617 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276883 () Unit!19330)

(assert (=> b!606617 (= lt!276883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276871 (select (arr!17885 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!606617 e!347312))

(declare-fun res!389713 () Bool)

(assert (=> b!606617 (=> (not res!389713) (not e!347312))))

(assert (=> b!606617 (= res!389713 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) j!136))))

(declare-fun b!606618 () Bool)

(assert (=> b!606618 (= e!347307 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) index!984))))

(declare-fun b!606619 () Bool)

(declare-fun Unit!19335 () Unit!19330)

(assert (=> b!606619 (= e!347315 Unit!19335)))

(assert (=> b!606619 false))

(declare-fun b!606620 () Bool)

(declare-fun e!347319 () Bool)

(declare-fun e!347313 () Bool)

(assert (=> b!606620 (= e!347319 (not e!347313))))

(declare-fun res!389702 () Bool)

(assert (=> b!606620 (=> res!389702 e!347313)))

(declare-fun lt!276874 () SeekEntryResult!6325)

(assert (=> b!606620 (= res!389702 (not (= lt!276874 (Found!6325 index!984))))))

(declare-fun lt!276877 () Unit!19330)

(assert (=> b!606620 (= lt!276877 e!347315)))

(declare-fun c!68819 () Bool)

(assert (=> b!606620 (= c!68819 (= lt!276874 Undefined!6325))))

(declare-fun lt!276873 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37266 (_ BitVec 32)) SeekEntryResult!6325)

(assert (=> b!606620 (= lt!276874 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276873 lt!276871 mask!3053))))

(assert (=> b!606620 e!347310))

(declare-fun res!389712 () Bool)

(assert (=> b!606620 (=> (not res!389712) (not e!347310))))

(declare-fun lt!276880 () (_ BitVec 32))

(assert (=> b!606620 (= res!389712 (= lt!276872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 lt!276873 lt!276871 mask!3053)))))

(assert (=> b!606620 (= lt!276872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!606620 (= lt!276873 (select (store (arr!17885 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!276879 () Unit!19330)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19330)

(assert (=> b!606620 (= lt!276879 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!606620 (= lt!276880 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!606621 () Bool)

(assert (=> b!606621 (= e!347313 e!347309)))

(declare-fun res!389704 () Bool)

(assert (=> b!606621 (=> res!389704 e!347309)))

(declare-fun lt!276876 () (_ BitVec 64))

(assert (=> b!606621 (= res!389704 (or (not (= (select (arr!17885 a!2986) j!136) lt!276873)) (not (= (select (arr!17885 a!2986) j!136) lt!276876))))))

(declare-fun e!347318 () Bool)

(assert (=> b!606621 e!347318))

(declare-fun res!389696 () Bool)

(assert (=> b!606621 (=> (not res!389696) (not e!347318))))

(assert (=> b!606621 (= res!389696 (= lt!276876 (select (arr!17885 a!2986) j!136)))))

(assert (=> b!606621 (= lt!276876 (select (store (arr!17885 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!606622 () Bool)

(assert (=> b!606622 (= e!347318 e!347311)))

(declare-fun res!389717 () Bool)

(assert (=> b!606622 (=> res!389717 e!347311)))

(assert (=> b!606622 (= res!389717 (or (not (= (select (arr!17885 a!2986) j!136) lt!276873)) (not (= (select (arr!17885 a!2986) j!136) lt!276876)) (bvsge j!136 index!984)))))

(declare-fun b!606623 () Bool)

(assert (=> b!606623 (= e!347304 e!347319)))

(declare-fun res!389699 () Bool)

(assert (=> b!606623 (=> (not res!389699) (not e!347319))))

(assert (=> b!606623 (= res!389699 (and (= lt!276882 (Found!6325 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17885 a!2986) index!984) (select (arr!17885 a!2986) j!136))) (not (= (select (arr!17885 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!606623 (= lt!276882 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55442 res!389700) b!606607))

(assert (= (and b!606607 res!389703) b!606606))

(assert (= (and b!606606 res!389706) b!606614))

(assert (= (and b!606614 res!389705) b!606598))

(assert (= (and b!606598 res!389716) b!606612))

(assert (= (and b!606612 res!389698) b!606599))

(assert (= (and b!606599 res!389697) b!606615))

(assert (= (and b!606615 res!389714) b!606602))

(assert (= (and b!606602 res!389710) b!606616))

(assert (= (and b!606616 res!389701) b!606623))

(assert (= (and b!606623 res!389699) b!606620))

(assert (= (and b!606620 res!389712) b!606608))

(assert (= (and b!606620 c!68819) b!606619))

(assert (= (and b!606620 (not c!68819)) b!606603))

(assert (= (and b!606620 (not res!389702)) b!606621))

(assert (= (and b!606621 res!389696) b!606622))

(assert (= (and b!606622 (not res!389717)) b!606604))

(assert (= (and b!606604 res!389709) b!606618))

(assert (= (and b!606621 (not res!389704)) b!606613))

(assert (= (and b!606613 c!68818) b!606600))

(assert (= (and b!606613 (not c!68818)) b!606610))

(assert (= (and b!606613 (not res!389708)) b!606617))

(assert (= (and b!606617 res!389713) b!606609))

(assert (= (and b!606617 (not res!389715)) b!606601))

(assert (= (and b!606601 (not res!389711)) b!606605))

(assert (= (and b!606605 res!389707) b!606611))

(declare-fun m!583393 () Bool)

(assert (=> b!606602 m!583393))

(declare-fun m!583395 () Bool)

(assert (=> b!606622 m!583395))

(declare-fun m!583397 () Bool)

(assert (=> b!606620 m!583397))

(assert (=> b!606620 m!583395))

(declare-fun m!583399 () Bool)

(assert (=> b!606620 m!583399))

(assert (=> b!606620 m!583395))

(declare-fun m!583401 () Bool)

(assert (=> b!606620 m!583401))

(declare-fun m!583403 () Bool)

(assert (=> b!606620 m!583403))

(declare-fun m!583405 () Bool)

(assert (=> b!606620 m!583405))

(declare-fun m!583407 () Bool)

(assert (=> b!606620 m!583407))

(declare-fun m!583409 () Bool)

(assert (=> b!606620 m!583409))

(declare-fun m!583411 () Bool)

(assert (=> b!606615 m!583411))

(assert (=> b!606618 m!583395))

(assert (=> b!606618 m!583395))

(declare-fun m!583413 () Bool)

(assert (=> b!606618 m!583413))

(declare-fun m!583415 () Bool)

(assert (=> b!606614 m!583415))

(declare-fun m!583417 () Bool)

(assert (=> b!606598 m!583417))

(declare-fun m!583419 () Bool)

(assert (=> start!55442 m!583419))

(declare-fun m!583421 () Bool)

(assert (=> start!55442 m!583421))

(declare-fun m!583423 () Bool)

(assert (=> b!606623 m!583423))

(assert (=> b!606623 m!583395))

(assert (=> b!606623 m!583395))

(declare-fun m!583425 () Bool)

(assert (=> b!606623 m!583425))

(assert (=> b!606604 m!583395))

(assert (=> b!606604 m!583395))

(declare-fun m!583427 () Bool)

(assert (=> b!606604 m!583427))

(declare-fun m!583429 () Bool)

(assert (=> b!606605 m!583429))

(assert (=> b!606617 m!583395))

(assert (=> b!606617 m!583395))

(declare-fun m!583431 () Bool)

(assert (=> b!606617 m!583431))

(assert (=> b!606617 m!583395))

(declare-fun m!583433 () Bool)

(assert (=> b!606617 m!583433))

(assert (=> b!606617 m!583395))

(assert (=> b!606617 m!583427))

(declare-fun m!583435 () Bool)

(assert (=> b!606611 m!583435))

(assert (=> b!606606 m!583395))

(assert (=> b!606606 m!583395))

(declare-fun m!583437 () Bool)

(assert (=> b!606606 m!583437))

(assert (=> b!606621 m!583395))

(assert (=> b!606621 m!583401))

(declare-fun m!583439 () Bool)

(assert (=> b!606621 m!583439))

(declare-fun m!583441 () Bool)

(assert (=> b!606599 m!583441))

(declare-fun m!583443 () Bool)

(assert (=> b!606601 m!583443))

(assert (=> b!606609 m!583395))

(assert (=> b!606609 m!583395))

(assert (=> b!606609 m!583413))

(assert (=> b!606600 m!583395))

(assert (=> b!606600 m!583395))

(declare-fun m!583445 () Bool)

(assert (=> b!606600 m!583445))

(assert (=> b!606600 m!583395))

(declare-fun m!583447 () Bool)

(assert (=> b!606600 m!583447))

(assert (=> b!606600 m!583395))

(declare-fun m!583449 () Bool)

(assert (=> b!606600 m!583449))

(declare-fun m!583451 () Bool)

(assert (=> b!606600 m!583451))

(declare-fun m!583453 () Bool)

(assert (=> b!606600 m!583453))

(declare-fun m!583455 () Bool)

(assert (=> b!606600 m!583455))

(declare-fun m!583457 () Bool)

(assert (=> b!606600 m!583457))

(declare-fun m!583459 () Bool)

(assert (=> b!606612 m!583459))

(assert (=> b!606616 m!583401))

(declare-fun m!583461 () Bool)

(assert (=> b!606616 m!583461))

(push 1)

(assert (not b!606611))

(assert (not b!606623))

(assert (not b!606604))

(assert (not b!606617))

(assert (not start!55442))

(assert (not b!606620))

(assert (not b!606599))

(assert (not b!606606))

(assert (not b!606615))

(assert (not b!606612))

(assert (not b!606614))

(assert (not b!606601))

(assert (not b!606618))

(assert (not b!606609))

(assert (not b!606598))

(assert (not b!606600))

(assert (not b!606605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87921 () Bool)

(assert (=> d!87921 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55442 d!87921))

(declare-fun d!87937 () Bool)

(assert (=> d!87937 (= (array_inv!13681 a!2986) (bvsge (size!18249 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55442 d!87937))

(declare-fun d!87939 () Bool)

(declare-fun res!389765 () Bool)

(declare-fun e!347371 () Bool)

(assert (=> d!87939 (=> res!389765 e!347371)))

(assert (=> d!87939 (= res!389765 (= (select (arr!17885 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!87939 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!347371)))

(declare-fun b!606679 () Bool)

(declare-fun e!347372 () Bool)

(assert (=> b!606679 (= e!347371 e!347372)))

(declare-fun res!389766 () Bool)

(assert (=> b!606679 (=> (not res!389766) (not e!347372))))

(assert (=> b!606679 (= res!389766 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18249 a!2986)))))

(declare-fun b!606680 () Bool)

(assert (=> b!606680 (= e!347372 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87939 (not res!389765)) b!606679))

(assert (= (and b!606679 res!389766) b!606680))

(declare-fun m!583513 () Bool)

(assert (=> d!87939 m!583513))

(declare-fun m!583515 () Bool)

(assert (=> b!606680 m!583515))

(assert (=> b!606598 d!87939))

(declare-fun d!87941 () Bool)

(declare-fun res!389767 () Bool)

(declare-fun e!347375 () Bool)

(assert (=> d!87941 (=> res!389767 e!347375)))

(assert (=> d!87941 (= res!389767 (= (select (arr!17885 lt!276871) index!984) (select (arr!17885 a!2986) j!136)))))

(assert (=> d!87941 (= (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) index!984) e!347375)))

(declare-fun b!606685 () Bool)

(declare-fun e!347376 () Bool)

(assert (=> b!606685 (= e!347375 e!347376)))

(declare-fun res!389768 () Bool)

(assert (=> b!606685 (=> (not res!389768) (not e!347376))))

(assert (=> b!606685 (= res!389768 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18249 lt!276871)))))

(declare-fun b!606686 () Bool)

(assert (=> b!606686 (= e!347376 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87941 (not res!389767)) b!606685))

(assert (= (and b!606685 res!389768) b!606686))

(declare-fun m!583517 () Bool)

(assert (=> d!87941 m!583517))

(assert (=> b!606686 m!583395))

(declare-fun m!583519 () Bool)

(assert (=> b!606686 m!583519))

(assert (=> b!606609 d!87941))

(declare-fun b!606761 () Bool)

(declare-fun e!347424 () SeekEntryResult!6325)

(declare-fun e!347426 () SeekEntryResult!6325)

(assert (=> b!606761 (= e!347424 e!347426)))

(declare-fun c!68855 () Bool)

(declare-fun lt!276934 () (_ BitVec 64))

(assert (=> b!606761 (= c!68855 (= lt!276934 lt!276873))))

(declare-fun e!347425 () SeekEntryResult!6325)

(declare-fun b!606762 () Bool)

(assert (=> b!606762 (= e!347425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276880 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276873 lt!276871 mask!3053))))

(declare-fun b!606763 () Bool)

(assert (=> b!606763 (= e!347425 (MissingVacant!6325 vacantSpotIndex!68))))

(declare-fun d!87943 () Bool)

(declare-fun lt!276933 () SeekEntryResult!6325)

(assert (=> d!87943 (and (or (is-Undefined!6325 lt!276933) (not (is-Found!6325 lt!276933)) (and (bvsge (index!27573 lt!276933) #b00000000000000000000000000000000) (bvslt (index!27573 lt!276933) (size!18249 lt!276871)))) (or (is-Undefined!6325 lt!276933) (is-Found!6325 lt!276933) (not (is-MissingVacant!6325 lt!276933)) (not (= (index!27575 lt!276933) vacantSpotIndex!68)) (and (bvsge (index!27575 lt!276933) #b00000000000000000000000000000000) (bvslt (index!27575 lt!276933) (size!18249 lt!276871)))) (or (is-Undefined!6325 lt!276933) (ite (is-Found!6325 lt!276933) (= (select (arr!17885 lt!276871) (index!27573 lt!276933)) lt!276873) (and (is-MissingVacant!6325 lt!276933) (= (index!27575 lt!276933) vacantSpotIndex!68) (= (select (arr!17885 lt!276871) (index!27575 lt!276933)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87943 (= lt!276933 e!347424)))

(declare-fun c!68853 () Bool)

(assert (=> d!87943 (= c!68853 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87943 (= lt!276934 (select (arr!17885 lt!276871) lt!276880))))

(assert (=> d!87943 (validMask!0 mask!3053)))

(assert (=> d!87943 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 lt!276873 lt!276871 mask!3053) lt!276933)))

(declare-fun b!606764 () Bool)

(declare-fun c!68854 () Bool)

(assert (=> b!606764 (= c!68854 (= lt!276934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606764 (= e!347426 e!347425)))

(declare-fun b!606765 () Bool)

(assert (=> b!606765 (= e!347426 (Found!6325 lt!276880))))

(declare-fun b!606766 () Bool)

(assert (=> b!606766 (= e!347424 Undefined!6325)))

(assert (= (and d!87943 c!68853) b!606766))

(assert (= (and d!87943 (not c!68853)) b!606761))

(assert (= (and b!606761 c!68855) b!606765))

(assert (= (and b!606761 (not c!68855)) b!606764))

(assert (= (and b!606764 c!68854) b!606763))

(assert (= (and b!606764 (not c!68854)) b!606762))

(declare-fun m!583591 () Bool)

(assert (=> b!606762 m!583591))

(assert (=> b!606762 m!583591))

(declare-fun m!583595 () Bool)

(assert (=> b!606762 m!583595))

(declare-fun m!583597 () Bool)

(assert (=> d!87943 m!583597))

(declare-fun m!583599 () Bool)

(assert (=> d!87943 m!583599))

(declare-fun m!583601 () Bool)

(assert (=> d!87943 m!583601))

(assert (=> d!87943 m!583419))

(assert (=> b!606620 d!87943))

(declare-fun d!87975 () Bool)

(declare-fun e!347438 () Bool)

(assert (=> d!87975 e!347438))

(declare-fun res!389799 () Bool)

(assert (=> d!87975 (=> (not res!389799) (not e!347438))))

(assert (=> d!87975 (= res!389799 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18249 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18249 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18249 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18249 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18249 a!2986))))))

(declare-fun lt!276940 () Unit!19330)

(declare-fun choose!9 (array!37266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19330)

(assert (=> d!87975 (= lt!276940 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87975 (validMask!0 mask!3053)))

(assert (=> d!87975 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 mask!3053) lt!276940)))

(declare-fun b!606779 () Bool)

(assert (=> b!606779 (= e!347438 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 (select (store (arr!17885 a!2986) i!1108 k!1786) j!136) (array!37267 (store (arr!17885 a!2986) i!1108 k!1786) (size!18249 a!2986)) mask!3053)))))

(assert (= (and d!87975 res!389799) b!606779))

(declare-fun m!583613 () Bool)

(assert (=> d!87975 m!583613))

(assert (=> d!87975 m!583419))

(assert (=> b!606779 m!583397))

(assert (=> b!606779 m!583397))

(declare-fun m!583615 () Bool)

(assert (=> b!606779 m!583615))

(assert (=> b!606779 m!583401))

(assert (=> b!606779 m!583395))

(assert (=> b!606779 m!583399))

(assert (=> b!606779 m!583395))

(assert (=> b!606620 d!87975))

(declare-fun d!87983 () Bool)

(declare-fun lt!276950 () (_ BitVec 32))

(assert (=> d!87983 (and (bvsge lt!276950 #b00000000000000000000000000000000) (bvslt lt!276950 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87983 (= lt!276950 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87983 (validMask!0 mask!3053)))

(assert (=> d!87983 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276950)))

(declare-fun bs!18563 () Bool)

(assert (= bs!18563 d!87983))

(declare-fun m!583621 () Bool)

(assert (=> bs!18563 m!583621))

(assert (=> bs!18563 m!583419))

(assert (=> b!606620 d!87983))

(declare-fun b!606794 () Bool)

(declare-fun e!347447 () SeekEntryResult!6325)

(declare-fun e!347449 () SeekEntryResult!6325)

(assert (=> b!606794 (= e!347447 e!347449)))

(declare-fun lt!276952 () (_ BitVec 64))

(declare-fun c!68865 () Bool)

(assert (=> b!606794 (= c!68865 (= lt!276952 (select (arr!17885 a!2986) j!136)))))

(declare-fun e!347448 () SeekEntryResult!6325)

(declare-fun b!606795 () Bool)

(assert (=> b!606795 (= e!347448 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276880 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!606796 () Bool)

(assert (=> b!606796 (= e!347448 (MissingVacant!6325 vacantSpotIndex!68))))

(declare-fun lt!276951 () SeekEntryResult!6325)

(declare-fun d!87985 () Bool)

(assert (=> d!87985 (and (or (is-Undefined!6325 lt!276951) (not (is-Found!6325 lt!276951)) (and (bvsge (index!27573 lt!276951) #b00000000000000000000000000000000) (bvslt (index!27573 lt!276951) (size!18249 a!2986)))) (or (is-Undefined!6325 lt!276951) (is-Found!6325 lt!276951) (not (is-MissingVacant!6325 lt!276951)) (not (= (index!27575 lt!276951) vacantSpotIndex!68)) (and (bvsge (index!27575 lt!276951) #b00000000000000000000000000000000) (bvslt (index!27575 lt!276951) (size!18249 a!2986)))) (or (is-Undefined!6325 lt!276951) (ite (is-Found!6325 lt!276951) (= (select (arr!17885 a!2986) (index!27573 lt!276951)) (select (arr!17885 a!2986) j!136)) (and (is-MissingVacant!6325 lt!276951) (= (index!27575 lt!276951) vacantSpotIndex!68) (= (select (arr!17885 a!2986) (index!27575 lt!276951)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87985 (= lt!276951 e!347447)))

(declare-fun c!68863 () Bool)

(assert (=> d!87985 (= c!68863 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87985 (= lt!276952 (select (arr!17885 a!2986) lt!276880))))

(assert (=> d!87985 (validMask!0 mask!3053)))

(assert (=> d!87985 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276880 vacantSpotIndex!68 (select (arr!17885 a!2986) j!136) a!2986 mask!3053) lt!276951)))

(declare-fun b!606797 () Bool)

(declare-fun c!68864 () Bool)

(assert (=> b!606797 (= c!68864 (= lt!276952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606797 (= e!347449 e!347448)))

(declare-fun b!606798 () Bool)

(assert (=> b!606798 (= e!347449 (Found!6325 lt!276880))))

(declare-fun b!606799 () Bool)

(assert (=> b!606799 (= e!347447 Undefined!6325)))

(assert (= (and d!87985 c!68863) b!606799))

(assert (= (and d!87985 (not c!68863)) b!606794))

(assert (= (and b!606794 c!68865) b!606798))

(assert (= (and b!606794 (not c!68865)) b!606797))

(assert (= (and b!606797 c!68864) b!606796))

(assert (= (and b!606797 (not c!68864)) b!606795))

(assert (=> b!606795 m!583591))

(assert (=> b!606795 m!583591))

(assert (=> b!606795 m!583395))

(declare-fun m!583623 () Bool)

(assert (=> b!606795 m!583623))

(declare-fun m!583625 () Bool)

(assert (=> d!87985 m!583625))

(declare-fun m!583627 () Bool)

(assert (=> d!87985 m!583627))

(declare-fun m!583629 () Bool)

(assert (=> d!87985 m!583629))

(assert (=> d!87985 m!583419))

(assert (=> b!606620 d!87985))

(declare-fun b!606800 () Bool)

(declare-fun e!347450 () SeekEntryResult!6325)

(declare-fun e!347452 () SeekEntryResult!6325)

(assert (=> b!606800 (= e!347450 e!347452)))

(declare-fun c!68868 () Bool)

(declare-fun lt!276954 () (_ BitVec 64))

(assert (=> b!606800 (= c!68868 (= lt!276954 lt!276873))))

(declare-fun e!347451 () SeekEntryResult!6325)

(declare-fun b!606801 () Bool)

(assert (=> b!606801 (= e!347451 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276873 lt!276871 mask!3053))))

(declare-fun b!606802 () Bool)

(assert (=> b!606802 (= e!347451 (MissingVacant!6325 vacantSpotIndex!68))))

(declare-fun d!87987 () Bool)

(declare-fun lt!276953 () SeekEntryResult!6325)

(assert (=> d!87987 (and (or (is-Undefined!6325 lt!276953) (not (is-Found!6325 lt!276953)) (and (bvsge (index!27573 lt!276953) #b00000000000000000000000000000000) (bvslt (index!27573 lt!276953) (size!18249 lt!276871)))) (or (is-Undefined!6325 lt!276953) (is-Found!6325 lt!276953) (not (is-MissingVacant!6325 lt!276953)) (not (= (index!27575 lt!276953) vacantSpotIndex!68)) (and (bvsge (index!27575 lt!276953) #b00000000000000000000000000000000) (bvslt (index!27575 lt!276953) (size!18249 lt!276871)))) (or (is-Undefined!6325 lt!276953) (ite (is-Found!6325 lt!276953) (= (select (arr!17885 lt!276871) (index!27573 lt!276953)) lt!276873) (and (is-MissingVacant!6325 lt!276953) (= (index!27575 lt!276953) vacantSpotIndex!68) (= (select (arr!17885 lt!276871) (index!27575 lt!276953)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87987 (= lt!276953 e!347450)))

(declare-fun c!68866 () Bool)

(assert (=> d!87987 (= c!68866 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87987 (= lt!276954 (select (arr!17885 lt!276871) index!984))))

(assert (=> d!87987 (validMask!0 mask!3053)))

(assert (=> d!87987 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276873 lt!276871 mask!3053) lt!276953)))

(declare-fun b!606803 () Bool)

(declare-fun c!68867 () Bool)

(assert (=> b!606803 (= c!68867 (= lt!276954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!606803 (= e!347452 e!347451)))

(declare-fun b!606804 () Bool)

(assert (=> b!606804 (= e!347452 (Found!6325 index!984))))

(declare-fun b!606805 () Bool)

(assert (=> b!606805 (= e!347450 Undefined!6325)))

(assert (= (and d!87987 c!68866) b!606805))

(assert (= (and d!87987 (not c!68866)) b!606800))

(assert (= (and b!606800 c!68868) b!606804))

(assert (= (and b!606800 (not c!68868)) b!606803))

(assert (= (and b!606803 c!68867) b!606802))

(assert (= (and b!606803 (not c!68867)) b!606801))

(assert (=> b!606801 m!583407))

(assert (=> b!606801 m!583407))

(declare-fun m!583631 () Bool)

(assert (=> b!606801 m!583631))

(declare-fun m!583633 () Bool)

(assert (=> d!87987 m!583633))

(declare-fun m!583635 () Bool)

(assert (=> d!87987 m!583635))

(assert (=> d!87987 m!583517))

(assert (=> d!87987 m!583419))

(assert (=> b!606620 d!87987))

(declare-fun b!606828 () Bool)

(declare-fun e!347468 () Bool)

(declare-fun call!33099 () Bool)

(assert (=> b!606828 (= e!347468 call!33099)))

(declare-fun b!606829 () Bool)

(declare-fun e!347469 () Bool)

(assert (=> b!606829 (= e!347469 call!33099)))

(declare-fun b!606830 () Bool)

(declare-fun e!347470 () Bool)

(assert (=> b!606830 (= e!347470 e!347468)))

(declare-fun c!68876 () Bool)

(assert (=> b!606830 (= c!68876 (validKeyInArray!0 (select (arr!17885 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!606831 () Bool)

(assert (=> b!606831 (= e!347468 e!347469)))

(declare-fun lt!276972 () (_ BitVec 64))

(assert (=> b!606831 (= lt!276972 (select (arr!17885 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276970 () Unit!19330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37266 (_ BitVec 64) (_ BitVec 32)) Unit!19330)

(assert (=> b!606831 (= lt!276970 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276972 #b00000000000000000000000000000000))))

(assert (=> b!606831 (arrayContainsKey!0 a!2986 lt!276972 #b00000000000000000000000000000000)))

(declare-fun lt!276971 () Unit!19330)

(assert (=> b!606831 (= lt!276971 lt!276970)))

(declare-fun res!389810 () Bool)

(assert (=> b!606831 (= res!389810 (= (seekEntryOrOpen!0 (select (arr!17885 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6325 #b00000000000000000000000000000000)))))

(assert (=> b!606831 (=> (not res!389810) (not e!347469))))

(declare-fun bm!33096 () Bool)

(assert (=> bm!33096 (= call!33099 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!87989 () Bool)

(declare-fun res!389811 () Bool)

(assert (=> d!87989 (=> res!389811 e!347470)))

(assert (=> d!87989 (= res!389811 (bvsge #b00000000000000000000000000000000 (size!18249 a!2986)))))

(assert (=> d!87989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!347470)))

(assert (= (and d!87989 (not res!389811)) b!606830))

(assert (= (and b!606830 c!68876) b!606831))

(assert (= (and b!606830 (not c!68876)) b!606828))

(assert (= (and b!606831 res!389810) b!606829))

(assert (= (or b!606829 b!606828) bm!33096))

(assert (=> b!606830 m!583513))

(assert (=> b!606830 m!583513))

(declare-fun m!583651 () Bool)

(assert (=> b!606830 m!583651))

(assert (=> b!606831 m!583513))

(declare-fun m!583653 () Bool)

(assert (=> b!606831 m!583653))

(declare-fun m!583655 () Bool)

(assert (=> b!606831 m!583655))

(assert (=> b!606831 m!583513))

(declare-fun m!583657 () Bool)

(assert (=> b!606831 m!583657))

(declare-fun m!583659 () Bool)

(assert (=> bm!33096 m!583659))

(assert (=> b!606599 d!87989))

(declare-fun d!87993 () Bool)

(declare-fun res!389812 () Bool)

(declare-fun e!347471 () Bool)

(assert (=> d!87993 (=> res!389812 e!347471)))

(assert (=> d!87993 (= res!389812 (= (select (arr!17885 lt!276871) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17885 a!2986) j!136)))))

(assert (=> d!87993 (= (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!347471)))

(declare-fun b!606832 () Bool)

(declare-fun e!347472 () Bool)

(assert (=> b!606832 (= e!347471 e!347472)))

(declare-fun res!389813 () Bool)

(assert (=> b!606832 (=> (not res!389813) (not e!347472))))

(assert (=> b!606832 (= res!389813 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18249 lt!276871)))))

(declare-fun b!606833 () Bool)

(assert (=> b!606833 (= e!347472 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87993 (not res!389812)) b!606832))

(assert (= (and b!606832 res!389813) b!606833))

(declare-fun m!583661 () Bool)

(assert (=> d!87993 m!583661))

(assert (=> b!606833 m!583395))

(declare-fun m!583663 () Bool)

(assert (=> b!606833 m!583663))

(assert (=> b!606600 d!87993))

(declare-fun d!87995 () Bool)

(assert (=> d!87995 (arrayNoDuplicates!0 lt!276871 j!136 Nil!11923)))

(declare-fun lt!276984 () Unit!19330)

(declare-fun choose!39 (array!37266 (_ BitVec 32) (_ BitVec 32)) Unit!19330)

(assert (=> d!87995 (= lt!276984 (choose!39 lt!276871 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87995 (bvslt (size!18249 lt!276871) #b01111111111111111111111111111111)))

(assert (=> d!87995 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276871 #b00000000000000000000000000000000 j!136) lt!276984)))

(declare-fun bs!18564 () Bool)

(assert (= bs!18564 d!87995))

(assert (=> bs!18564 m!583453))

(declare-fun m!583673 () Bool)

(assert (=> bs!18564 m!583673))

(assert (=> b!606600 d!87995))

(declare-fun d!87999 () Bool)

(assert (=> d!87999 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18249 lt!276871)) (not (= (select (arr!17885 lt!276871) j!136) (select (arr!17885 a!2986) j!136))))))

(declare-fun lt!276990 () Unit!19330)

(declare-fun choose!21 (array!37266 (_ BitVec 64) (_ BitVec 32) List!11926) Unit!19330)

(assert (=> d!87999 (= lt!276990 (choose!21 lt!276871 (select (arr!17885 a!2986) j!136) j!136 Nil!11923))))

(assert (=> d!87999 (bvslt (size!18249 lt!276871) #b01111111111111111111111111111111)))

(assert (=> d!87999 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276871 (select (arr!17885 a!2986) j!136) j!136 Nil!11923) lt!276990)))

(declare-fun bs!18565 () Bool)

(assert (= bs!18565 d!87999))

(declare-fun m!583675 () Bool)

(assert (=> bs!18565 m!583675))

(assert (=> bs!18565 m!583395))

(declare-fun m!583677 () Bool)

(assert (=> bs!18565 m!583677))

(assert (=> b!606600 d!87999))

(declare-fun d!88001 () Bool)

(assert (=> d!88001 (arrayContainsKey!0 lt!276871 (select (arr!17885 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276994 () Unit!19330)

(declare-fun choose!114 (array!37266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19330)

(assert (=> d!88001 (= lt!276994 (choose!114 lt!276871 (select (arr!17885 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88001 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88001 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276871 (select (arr!17885 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276994)))

(declare-fun bs!18567 () Bool)

(assert (= bs!18567 d!88001))

(assert (=> bs!18567 m!583395))

(assert (=> bs!18567 m!583447))

(assert (=> bs!18567 m!583395))

(declare-fun m!583699 () Bool)

(assert (=> bs!18567 m!583699))

(assert (=> b!606600 d!88001))

(declare-fun b!606876 () Bool)

(declare-fun e!347504 () Bool)

(declare-fun e!347501 () Bool)

(assert (=> b!606876 (= e!347504 e!347501)))

(declare-fun res!389830 () Bool)

(assert (=> b!606876 (=> (not res!389830) (not e!347501))))

(declare-fun e!347502 () Bool)

(assert (=> b!606876 (= res!389830 (not e!347502))))

(declare-fun res!389829 () Bool)

(assert (=> b!606876 (=> (not res!389829) (not e!347502))))

(assert (=> b!606876 (= res!389829 (validKeyInArray!0 (select (arr!17885 lt!276871) #b00000000000000000000000000000000)))))

(declare-fun b!606877 () Bool)

(declare-fun e!347503 () Bool)

(assert (=> b!606877 (= e!347501 e!347503)))

(declare-fun c!68891 () Bool)

(assert (=> b!606877 (= c!68891 (validKeyInArray!0 (select (arr!17885 lt!276871) #b00000000000000000000000000000000)))))

(declare-fun bm!33104 () Bool)

(declare-fun call!33107 () Bool)

(assert (=> bm!33104 (= call!33107 (arrayNoDuplicates!0 lt!276871 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68891 (Cons!11922 (select (arr!17885 lt!276871) #b00000000000000000000000000000000) Nil!11923) Nil!11923)))))

(declare-fun b!606878 () Bool)

(assert (=> b!606878 (= e!347503 call!33107)))

(declare-fun b!606879 () Bool)

(assert (=> b!606879 (= e!347502 (contains!3002 Nil!11923 (select (arr!17885 lt!276871) #b00000000000000000000000000000000)))))

(declare-fun b!606880 () Bool)

(assert (=> b!606880 (= e!347503 call!33107)))

(declare-fun d!88009 () Bool)

(declare-fun res!389828 () Bool)

(assert (=> d!88009 (=> res!389828 e!347504)))

(assert (=> d!88009 (= res!389828 (bvsge #b00000000000000000000000000000000 (size!18249 lt!276871)))))

(assert (=> d!88009 (= (arrayNoDuplicates!0 lt!276871 #b00000000000000000000000000000000 Nil!11923) e!347504)))

(assert (= (and d!88009 (not res!389828)) b!606876))

(assert (= (and b!606876 res!389829) b!606879))

(assert (= (and b!606876 res!389830) b!606877))

(assert (= (and b!606877 c!68891) b!606878))

(assert (= (and b!606877 (not c!68891)) b!606880))

(assert (= (or b!606878 b!606880) bm!33104))

(declare-fun m!583701 () Bool)

(assert (=> b!606876 m!583701))

(assert (=> b!606876 m!583701))

(declare-fun m!583703 () Bool)

(assert (=> b!606876 m!583703))

(assert (=> b!606877 m!583701))

(assert (=> b!606877 m!583701))

(assert (=> b!606877 m!583703))

(assert (=> bm!33104 m!583701))

(declare-fun m!583705 () Bool)

(assert (=> bm!33104 m!583705))

(assert (=> b!606879 m!583701))

(assert (=> b!606879 m!583701))

(declare-fun m!583707 () Bool)

(assert (=> b!606879 m!583707))

(assert (=> b!606600 d!88009))

(declare-fun b!606881 () Bool)

(declare-fun e!347508 () Bool)

(declare-fun e!347505 () Bool)

(assert (=> b!606881 (= e!347508 e!347505)))

(declare-fun res!389833 () Bool)

(assert (=> b!606881 (=> (not res!389833) (not e!347505))))

(declare-fun e!347506 () Bool)

(assert (=> b!606881 (= res!389833 (not e!347506))))

