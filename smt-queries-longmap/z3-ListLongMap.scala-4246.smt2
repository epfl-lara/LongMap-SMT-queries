; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58850 () Bool)

(assert start!58850)

(declare-fun b!648595 () Bool)

(declare-fun e!371998 () Bool)

(declare-datatypes ((SeekEntryResult!6904 0))(
  ( (MissingZero!6904 (index!29963 (_ BitVec 32))) (Found!6904 (index!29964 (_ BitVec 32))) (Intermediate!6904 (undefined!7716 Bool) (index!29965 (_ BitVec 32)) (x!58760 (_ BitVec 32))) (Undefined!6904) (MissingVacant!6904 (index!29966 (_ BitVec 32))) )
))
(declare-fun lt!300979 () SeekEntryResult!6904)

(declare-fun lt!300978 () SeekEntryResult!6904)

(assert (=> b!648595 (= e!371998 (= lt!300979 lt!300978))))

(declare-fun b!648596 () Bool)

(declare-fun e!371984 () Bool)

(declare-fun e!371990 () Bool)

(assert (=> b!648596 (= e!371984 e!371990)))

(declare-fun res!420349 () Bool)

(assert (=> b!648596 (=> (not res!420349) (not e!371990))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38523 0))(
  ( (array!38524 (arr!18467 (Array (_ BitVec 32) (_ BitVec 64))) (size!18832 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38523)

(assert (=> b!648596 (= res!420349 (and (= lt!300979 (Found!6904 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18467 a!2986) index!984) (select (arr!18467 a!2986) j!136))) (not (= (select (arr!18467 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38523 (_ BitVec 32)) SeekEntryResult!6904)

(assert (=> b!648596 (= lt!300979 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18467 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648597 () Bool)

(declare-fun res!420353 () Bool)

(declare-fun e!371993 () Bool)

(assert (=> b!648597 (=> (not res!420353) (not e!371993))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648597 (= res!420353 (and (= (size!18832 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18832 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18832 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648598 () Bool)

(declare-fun res!420350 () Bool)

(declare-fun e!371985 () Bool)

(assert (=> b!648598 (=> (not res!420350) (not e!371985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38523 (_ BitVec 32)) Bool)

(assert (=> b!648598 (= res!420350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648600 () Bool)

(declare-fun res!420354 () Bool)

(assert (=> b!648600 (=> (not res!420354) (not e!371985))))

(declare-datatypes ((List!12547 0))(
  ( (Nil!12544) (Cons!12543 (h!13588 (_ BitVec 64)) (t!18766 List!12547)) )
))
(declare-fun arrayNoDuplicates!0 (array!38523 (_ BitVec 32) List!12547) Bool)

(assert (=> b!648600 (= res!420354 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12544))))

(declare-fun e!371999 () Bool)

(declare-fun b!648601 () Bool)

(declare-fun lt!300977 () array!38523)

(declare-fun arrayContainsKey!0 (array!38523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648601 (= e!371999 (arrayContainsKey!0 lt!300977 (select (arr!18467 a!2986) j!136) index!984))))

(declare-fun b!648602 () Bool)

(declare-fun e!371989 () Bool)

(declare-fun e!371995 () Bool)

(assert (=> b!648602 (= e!371989 e!371995)))

(declare-fun res!420347 () Bool)

(assert (=> b!648602 (=> res!420347 e!371995)))

(declare-fun lt!300980 () (_ BitVec 64))

(declare-fun lt!300970 () (_ BitVec 64))

(assert (=> b!648602 (= res!420347 (or (not (= (select (arr!18467 a!2986) j!136) lt!300980)) (not (= (select (arr!18467 a!2986) j!136) lt!300970))))))

(declare-fun e!371987 () Bool)

(assert (=> b!648602 e!371987))

(declare-fun res!420339 () Bool)

(assert (=> b!648602 (=> (not res!420339) (not e!371987))))

(assert (=> b!648602 (= res!420339 (= lt!300970 (select (arr!18467 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!648602 (= lt!300970 (select (store (arr!18467 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648603 () Bool)

(declare-fun e!371986 () Bool)

(assert (=> b!648603 (= e!371986 (arrayContainsKey!0 lt!300977 (select (arr!18467 a!2986) j!136) index!984))))

(declare-fun b!648604 () Bool)

(declare-fun e!371997 () Bool)

(assert (=> b!648604 (= e!371987 e!371997)))

(declare-fun res!420342 () Bool)

(assert (=> b!648604 (=> res!420342 e!371997)))

(assert (=> b!648604 (= res!420342 (or (not (= (select (arr!18467 a!2986) j!136) lt!300980)) (not (= (select (arr!18467 a!2986) j!136) lt!300970)) (bvsge j!136 index!984)))))

(declare-fun b!648605 () Bool)

(declare-fun res!420344 () Bool)

(declare-fun e!371992 () Bool)

(assert (=> b!648605 (=> res!420344 e!371992)))

(declare-fun noDuplicate!431 (List!12547) Bool)

(assert (=> b!648605 (= res!420344 (not (noDuplicate!431 Nil!12544)))))

(declare-fun b!648606 () Bool)

(assert (=> b!648606 (= e!371985 e!371984)))

(declare-fun res!420343 () Bool)

(assert (=> b!648606 (=> (not res!420343) (not e!371984))))

(assert (=> b!648606 (= res!420343 (= (select (store (arr!18467 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648606 (= lt!300977 (array!38524 (store (arr!18467 a!2986) i!1108 k0!1786) (size!18832 a!2986)))))

(declare-fun b!648607 () Bool)

(declare-fun res!420340 () Bool)

(assert (=> b!648607 (=> res!420340 e!371992)))

(declare-fun contains!3148 (List!12547 (_ BitVec 64)) Bool)

(assert (=> b!648607 (= res!420340 (contains!3148 Nil!12544 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648608 () Bool)

(declare-fun res!420337 () Bool)

(assert (=> b!648608 (=> (not res!420337) (not e!371985))))

(assert (=> b!648608 (= res!420337 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18467 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648609 () Bool)

(declare-fun res!420345 () Bool)

(assert (=> b!648609 (=> (not res!420345) (not e!371993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648609 (= res!420345 (validKeyInArray!0 k0!1786))))

(declare-fun b!648610 () Bool)

(declare-fun res!420346 () Bool)

(assert (=> b!648610 (=> res!420346 e!371992)))

(assert (=> b!648610 (= res!420346 (contains!3148 Nil!12544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648611 () Bool)

(declare-datatypes ((Unit!22052 0))(
  ( (Unit!22053) )
))
(declare-fun e!371996 () Unit!22052)

(declare-fun Unit!22054 () Unit!22052)

(assert (=> b!648611 (= e!371996 Unit!22054)))

(declare-fun lt!300976 () Unit!22052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38523 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22052)

(assert (=> b!648611 (= lt!300976 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300977 (select (arr!18467 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648611 (arrayContainsKey!0 lt!300977 (select (arr!18467 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300974 () Unit!22052)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38523 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12547) Unit!22052)

(assert (=> b!648611 (= lt!300974 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12544))))

(assert (=> b!648611 (arrayNoDuplicates!0 lt!300977 #b00000000000000000000000000000000 Nil!12544)))

(declare-fun lt!300969 () Unit!22052)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38523 (_ BitVec 32) (_ BitVec 32)) Unit!22052)

(assert (=> b!648611 (= lt!300969 (lemmaNoDuplicateFromThenFromBigger!0 lt!300977 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648611 (arrayNoDuplicates!0 lt!300977 j!136 Nil!12544)))

(declare-fun lt!300982 () Unit!22052)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38523 (_ BitVec 64) (_ BitVec 32) List!12547) Unit!22052)

(assert (=> b!648611 (= lt!300982 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300977 (select (arr!18467 a!2986) j!136) j!136 Nil!12544))))

(assert (=> b!648611 false))

(declare-fun b!648612 () Bool)

(declare-fun e!371994 () Unit!22052)

(declare-fun Unit!22055 () Unit!22052)

(assert (=> b!648612 (= e!371994 Unit!22055)))

(declare-fun b!648613 () Bool)

(declare-fun res!420348 () Bool)

(assert (=> b!648613 (=> (not res!420348) (not e!371993))))

(assert (=> b!648613 (= res!420348 (validKeyInArray!0 (select (arr!18467 a!2986) j!136)))))

(declare-fun b!648614 () Bool)

(declare-fun res!420335 () Bool)

(assert (=> b!648614 (=> (not res!420335) (not e!371993))))

(assert (=> b!648614 (= res!420335 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648615 () Bool)

(declare-fun Unit!22056 () Unit!22052)

(assert (=> b!648615 (= e!371994 Unit!22056)))

(assert (=> b!648615 false))

(declare-fun b!648616 () Bool)

(assert (=> b!648616 (= e!371997 e!371999)))

(declare-fun res!420352 () Bool)

(assert (=> b!648616 (=> (not res!420352) (not e!371999))))

(assert (=> b!648616 (= res!420352 (arrayContainsKey!0 lt!300977 (select (arr!18467 a!2986) j!136) j!136))))

(declare-fun b!648617 () Bool)

(declare-fun e!371991 () Bool)

(assert (=> b!648617 (= e!371995 e!371991)))

(declare-fun res!420351 () Bool)

(assert (=> b!648617 (=> res!420351 e!371991)))

(assert (=> b!648617 (= res!420351 (bvsge index!984 j!136))))

(declare-fun lt!300984 () Unit!22052)

(assert (=> b!648617 (= lt!300984 e!371996)))

(declare-fun c!74498 () Bool)

(assert (=> b!648617 (= c!74498 (bvslt j!136 index!984))))

(declare-fun b!648618 () Bool)

(assert (=> b!648618 (= e!371993 e!371985)))

(declare-fun res!420336 () Bool)

(assert (=> b!648618 (=> (not res!420336) (not e!371985))))

(declare-fun lt!300981 () SeekEntryResult!6904)

(assert (=> b!648618 (= res!420336 (or (= lt!300981 (MissingZero!6904 i!1108)) (= lt!300981 (MissingVacant!6904 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38523 (_ BitVec 32)) SeekEntryResult!6904)

(assert (=> b!648618 (= lt!300981 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648599 () Bool)

(assert (=> b!648599 (= e!371990 (not e!371989))))

(declare-fun res!420334 () Bool)

(assert (=> b!648599 (=> res!420334 e!371989)))

(declare-fun lt!300983 () SeekEntryResult!6904)

(assert (=> b!648599 (= res!420334 (not (= lt!300983 (Found!6904 index!984))))))

(declare-fun lt!300968 () Unit!22052)

(assert (=> b!648599 (= lt!300968 e!371994)))

(declare-fun c!74499 () Bool)

(assert (=> b!648599 (= c!74499 (= lt!300983 Undefined!6904))))

(assert (=> b!648599 (= lt!300983 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300980 lt!300977 mask!3053))))

(assert (=> b!648599 e!371998))

(declare-fun res!420333 () Bool)

(assert (=> b!648599 (=> (not res!420333) (not e!371998))))

(declare-fun lt!300971 () (_ BitVec 32))

(assert (=> b!648599 (= res!420333 (= lt!300978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300971 vacantSpotIndex!68 lt!300980 lt!300977 mask!3053)))))

(assert (=> b!648599 (= lt!300978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300971 vacantSpotIndex!68 (select (arr!18467 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648599 (= lt!300980 (select (store (arr!18467 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300975 () Unit!22052)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22052)

(assert (=> b!648599 (= lt!300975 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300971 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648599 (= lt!300971 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!420355 () Bool)

(assert (=> start!58850 (=> (not res!420355) (not e!371993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58850 (= res!420355 (validMask!0 mask!3053))))

(assert (=> start!58850 e!371993))

(assert (=> start!58850 true))

(declare-fun array_inv!14350 (array!38523) Bool)

(assert (=> start!58850 (array_inv!14350 a!2986)))

(declare-fun b!648619 () Bool)

(declare-fun Unit!22057 () Unit!22052)

(assert (=> b!648619 (= e!371996 Unit!22057)))

(declare-fun b!648620 () Bool)

(assert (=> b!648620 (= e!371991 e!371992)))

(declare-fun res!420338 () Bool)

(assert (=> b!648620 (=> res!420338 e!371992)))

(assert (=> b!648620 (= res!420338 (or (bvsge (size!18832 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18832 a!2986))))))

(assert (=> b!648620 (arrayContainsKey!0 lt!300977 (select (arr!18467 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300973 () Unit!22052)

(assert (=> b!648620 (= lt!300973 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300977 (select (arr!18467 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648620 e!371986))

(declare-fun res!420341 () Bool)

(assert (=> b!648620 (=> (not res!420341) (not e!371986))))

(assert (=> b!648620 (= res!420341 (arrayContainsKey!0 lt!300977 (select (arr!18467 a!2986) j!136) j!136))))

(declare-fun b!648621 () Bool)

(assert (=> b!648621 (= e!371992 true)))

(declare-fun lt!300972 () Bool)

(assert (=> b!648621 (= lt!300972 (contains!3148 Nil!12544 k0!1786))))

(assert (= (and start!58850 res!420355) b!648597))

(assert (= (and b!648597 res!420353) b!648613))

(assert (= (and b!648613 res!420348) b!648609))

(assert (= (and b!648609 res!420345) b!648614))

(assert (= (and b!648614 res!420335) b!648618))

(assert (= (and b!648618 res!420336) b!648598))

(assert (= (and b!648598 res!420350) b!648600))

(assert (= (and b!648600 res!420354) b!648608))

(assert (= (and b!648608 res!420337) b!648606))

(assert (= (and b!648606 res!420343) b!648596))

(assert (= (and b!648596 res!420349) b!648599))

(assert (= (and b!648599 res!420333) b!648595))

(assert (= (and b!648599 c!74499) b!648615))

(assert (= (and b!648599 (not c!74499)) b!648612))

(assert (= (and b!648599 (not res!420334)) b!648602))

(assert (= (and b!648602 res!420339) b!648604))

(assert (= (and b!648604 (not res!420342)) b!648616))

(assert (= (and b!648616 res!420352) b!648601))

(assert (= (and b!648602 (not res!420347)) b!648617))

(assert (= (and b!648617 c!74498) b!648611))

(assert (= (and b!648617 (not c!74498)) b!648619))

(assert (= (and b!648617 (not res!420351)) b!648620))

(assert (= (and b!648620 res!420341) b!648603))

(assert (= (and b!648620 (not res!420338)) b!648605))

(assert (= (and b!648605 (not res!420344)) b!648610))

(assert (= (and b!648610 (not res!420346)) b!648607))

(assert (= (and b!648607 (not res!420340)) b!648621))

(declare-fun m!621423 () Bool)

(assert (=> b!648600 m!621423))

(declare-fun m!621425 () Bool)

(assert (=> b!648605 m!621425))

(declare-fun m!621427 () Bool)

(assert (=> b!648603 m!621427))

(assert (=> b!648603 m!621427))

(declare-fun m!621429 () Bool)

(assert (=> b!648603 m!621429))

(declare-fun m!621431 () Bool)

(assert (=> b!648610 m!621431))

(declare-fun m!621433 () Bool)

(assert (=> start!58850 m!621433))

(declare-fun m!621435 () Bool)

(assert (=> start!58850 m!621435))

(declare-fun m!621437 () Bool)

(assert (=> b!648606 m!621437))

(declare-fun m!621439 () Bool)

(assert (=> b!648606 m!621439))

(declare-fun m!621441 () Bool)

(assert (=> b!648599 m!621441))

(declare-fun m!621443 () Bool)

(assert (=> b!648599 m!621443))

(assert (=> b!648599 m!621437))

(declare-fun m!621445 () Bool)

(assert (=> b!648599 m!621445))

(declare-fun m!621447 () Bool)

(assert (=> b!648599 m!621447))

(assert (=> b!648599 m!621427))

(declare-fun m!621449 () Bool)

(assert (=> b!648599 m!621449))

(assert (=> b!648599 m!621427))

(declare-fun m!621451 () Bool)

(assert (=> b!648599 m!621451))

(declare-fun m!621453 () Bool)

(assert (=> b!648596 m!621453))

(assert (=> b!648596 m!621427))

(assert (=> b!648596 m!621427))

(declare-fun m!621455 () Bool)

(assert (=> b!648596 m!621455))

(declare-fun m!621457 () Bool)

(assert (=> b!648608 m!621457))

(assert (=> b!648604 m!621427))

(assert (=> b!648616 m!621427))

(assert (=> b!648616 m!621427))

(declare-fun m!621459 () Bool)

(assert (=> b!648616 m!621459))

(declare-fun m!621461 () Bool)

(assert (=> b!648611 m!621461))

(declare-fun m!621463 () Bool)

(assert (=> b!648611 m!621463))

(declare-fun m!621465 () Bool)

(assert (=> b!648611 m!621465))

(assert (=> b!648611 m!621427))

(declare-fun m!621467 () Bool)

(assert (=> b!648611 m!621467))

(assert (=> b!648611 m!621427))

(declare-fun m!621469 () Bool)

(assert (=> b!648611 m!621469))

(declare-fun m!621471 () Bool)

(assert (=> b!648611 m!621471))

(assert (=> b!648611 m!621427))

(declare-fun m!621473 () Bool)

(assert (=> b!648611 m!621473))

(assert (=> b!648611 m!621427))

(assert (=> b!648613 m!621427))

(assert (=> b!648613 m!621427))

(declare-fun m!621475 () Bool)

(assert (=> b!648613 m!621475))

(assert (=> b!648620 m!621427))

(assert (=> b!648620 m!621427))

(declare-fun m!621477 () Bool)

(assert (=> b!648620 m!621477))

(assert (=> b!648620 m!621427))

(declare-fun m!621479 () Bool)

(assert (=> b!648620 m!621479))

(assert (=> b!648620 m!621427))

(assert (=> b!648620 m!621459))

(assert (=> b!648602 m!621427))

(assert (=> b!648602 m!621437))

(declare-fun m!621481 () Bool)

(assert (=> b!648602 m!621481))

(declare-fun m!621483 () Bool)

(assert (=> b!648618 m!621483))

(declare-fun m!621485 () Bool)

(assert (=> b!648609 m!621485))

(declare-fun m!621487 () Bool)

(assert (=> b!648621 m!621487))

(declare-fun m!621489 () Bool)

(assert (=> b!648614 m!621489))

(assert (=> b!648601 m!621427))

(assert (=> b!648601 m!621427))

(assert (=> b!648601 m!621429))

(declare-fun m!621491 () Bool)

(assert (=> b!648598 m!621491))

(declare-fun m!621493 () Bool)

(assert (=> b!648607 m!621493))

(check-sat (not b!648620) (not b!648599) (not b!648613) (not b!648614) (not b!648596) (not b!648603) (not b!648616) (not b!648600) (not b!648607) (not b!648610) (not b!648605) (not b!648609) (not start!58850) (not b!648621) (not b!648601) (not b!648598) (not b!648611) (not b!648618))
(check-sat)
