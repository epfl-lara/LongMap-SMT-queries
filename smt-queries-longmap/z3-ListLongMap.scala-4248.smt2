; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58932 () Bool)

(assert start!58932)

(declare-fun b!649601 () Bool)

(declare-fun e!372603 () Bool)

(declare-fun e!372609 () Bool)

(assert (=> b!649601 (= e!372603 e!372609)))

(declare-fun res!420999 () Bool)

(assert (=> b!649601 (=> (not res!420999) (not e!372609))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6865 0))(
  ( (MissingZero!6865 (index!29807 (_ BitVec 32))) (Found!6865 (index!29808 (_ BitVec 32))) (Intermediate!6865 (undefined!7677 Bool) (index!29809 (_ BitVec 32)) (x!58745 (_ BitVec 32))) (Undefined!6865) (MissingVacant!6865 (index!29810 (_ BitVec 32))) )
))
(declare-fun lt!301644 () SeekEntryResult!6865)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38532 0))(
  ( (array!38533 (arr!18469 (Array (_ BitVec 32) (_ BitVec 64))) (size!18833 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38532)

(assert (=> b!649601 (= res!420999 (and (= lt!301644 (Found!6865 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18469 a!2986) index!984) (select (arr!18469 a!2986) j!136))) (not (= (select (arr!18469 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38532 (_ BitVec 32)) SeekEntryResult!6865)

(assert (=> b!649601 (= lt!301644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18469 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649602 () Bool)

(declare-fun e!372618 () Bool)

(declare-fun lt!301640 () SeekEntryResult!6865)

(assert (=> b!649602 (= e!372618 (= lt!301644 lt!301640))))

(declare-fun b!649603 () Bool)

(declare-fun res!421007 () Bool)

(declare-fun e!372605 () Bool)

(assert (=> b!649603 (=> res!421007 e!372605)))

(declare-datatypes ((List!12417 0))(
  ( (Nil!12414) (Cons!12413 (h!13461 (_ BitVec 64)) (t!18637 List!12417)) )
))
(declare-fun noDuplicate!436 (List!12417) Bool)

(assert (=> b!649603 (= res!421007 (not (noDuplicate!436 Nil!12414)))))

(declare-fun b!649605 () Bool)

(declare-fun e!372607 () Bool)

(assert (=> b!649605 (= e!372607 e!372603)))

(declare-fun res!421002 () Bool)

(assert (=> b!649605 (=> (not res!421002) (not e!372603))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!649605 (= res!421002 (= (select (store (arr!18469 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301642 () array!38532)

(assert (=> b!649605 (= lt!301642 (array!38533 (store (arr!18469 a!2986) i!1108 k0!1786) (size!18833 a!2986)))))

(declare-fun b!649606 () Bool)

(declare-fun res!421000 () Bool)

(assert (=> b!649606 (=> (not res!421000) (not e!372607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38532 (_ BitVec 32)) Bool)

(assert (=> b!649606 (= res!421000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649607 () Bool)

(declare-fun e!372617 () Bool)

(declare-fun e!372612 () Bool)

(assert (=> b!649607 (= e!372617 e!372612)))

(declare-fun res!421016 () Bool)

(assert (=> b!649607 (=> res!421016 e!372612)))

(assert (=> b!649607 (= res!421016 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22089 0))(
  ( (Unit!22090) )
))
(declare-fun lt!301634 () Unit!22089)

(declare-fun e!372611 () Unit!22089)

(assert (=> b!649607 (= lt!301634 e!372611)))

(declare-fun c!74672 () Bool)

(assert (=> b!649607 (= c!74672 (bvslt j!136 index!984))))

(declare-fun e!372610 () Bool)

(declare-fun b!649608 () Bool)

(declare-fun arrayContainsKey!0 (array!38532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649608 (= e!372610 (arrayContainsKey!0 lt!301642 (select (arr!18469 a!2986) j!136) index!984))))

(declare-fun b!649609 () Bool)

(declare-fun res!421010 () Bool)

(assert (=> b!649609 (=> res!421010 e!372605)))

(declare-fun contains!3149 (List!12417 (_ BitVec 64)) Bool)

(assert (=> b!649609 (= res!421010 (contains!3149 Nil!12414 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649610 () Bool)

(declare-fun res!421006 () Bool)

(declare-fun e!372604 () Bool)

(assert (=> b!649610 (=> (not res!421006) (not e!372604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649610 (= res!421006 (validKeyInArray!0 k0!1786))))

(declare-fun b!649611 () Bool)

(declare-fun res!421013 () Bool)

(assert (=> b!649611 (=> (not res!421013) (not e!372604))))

(assert (=> b!649611 (= res!421013 (validKeyInArray!0 (select (arr!18469 a!2986) j!136)))))

(declare-fun b!649612 () Bool)

(declare-fun e!372615 () Unit!22089)

(declare-fun Unit!22091 () Unit!22089)

(assert (=> b!649612 (= e!372615 Unit!22091)))

(declare-fun b!649613 () Bool)

(assert (=> b!649613 (= e!372604 e!372607)))

(declare-fun res!421015 () Bool)

(assert (=> b!649613 (=> (not res!421015) (not e!372607))))

(declare-fun lt!301639 () SeekEntryResult!6865)

(assert (=> b!649613 (= res!421015 (or (= lt!301639 (MissingZero!6865 i!1108)) (= lt!301639 (MissingVacant!6865 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38532 (_ BitVec 32)) SeekEntryResult!6865)

(assert (=> b!649613 (= lt!301639 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649614 () Bool)

(assert (=> b!649614 (= e!372605 true)))

(declare-fun lt!301637 () Bool)

(assert (=> b!649614 (= lt!301637 (contains!3149 Nil!12414 k0!1786))))

(declare-fun b!649615 () Bool)

(declare-fun res!421018 () Bool)

(assert (=> b!649615 (=> (not res!421018) (not e!372607))))

(declare-fun arrayNoDuplicates!0 (array!38532 (_ BitVec 32) List!12417) Bool)

(assert (=> b!649615 (= res!421018 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12414))))

(declare-fun e!372614 () Bool)

(declare-fun b!649616 () Bool)

(assert (=> b!649616 (= e!372614 (arrayContainsKey!0 lt!301642 (select (arr!18469 a!2986) j!136) index!984))))

(declare-fun b!649617 () Bool)

(declare-fun e!372613 () Bool)

(assert (=> b!649617 (= e!372609 (not e!372613))))

(declare-fun res!421003 () Bool)

(assert (=> b!649617 (=> res!421003 e!372613)))

(declare-fun lt!301643 () SeekEntryResult!6865)

(assert (=> b!649617 (= res!421003 (not (= lt!301643 (Found!6865 index!984))))))

(declare-fun lt!301636 () Unit!22089)

(assert (=> b!649617 (= lt!301636 e!372615)))

(declare-fun c!74671 () Bool)

(assert (=> b!649617 (= c!74671 (= lt!301643 Undefined!6865))))

(declare-fun lt!301645 () (_ BitVec 64))

(assert (=> b!649617 (= lt!301643 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301645 lt!301642 mask!3053))))

(assert (=> b!649617 e!372618))

(declare-fun res!421001 () Bool)

(assert (=> b!649617 (=> (not res!421001) (not e!372618))))

(declare-fun lt!301641 () (_ BitVec 32))

(assert (=> b!649617 (= res!421001 (= lt!301640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301641 vacantSpotIndex!68 lt!301645 lt!301642 mask!3053)))))

(assert (=> b!649617 (= lt!301640 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301641 vacantSpotIndex!68 (select (arr!18469 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649617 (= lt!301645 (select (store (arr!18469 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301646 () Unit!22089)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38532 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22089)

(assert (=> b!649617 (= lt!301646 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301641 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649617 (= lt!301641 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!420998 () Bool)

(assert (=> start!58932 (=> (not res!420998) (not e!372604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58932 (= res!420998 (validMask!0 mask!3053))))

(assert (=> start!58932 e!372604))

(assert (=> start!58932 true))

(declare-fun array_inv!14328 (array!38532) Bool)

(assert (=> start!58932 (array_inv!14328 a!2986)))

(declare-fun b!649604 () Bool)

(declare-fun e!372608 () Bool)

(assert (=> b!649604 (= e!372608 e!372614)))

(declare-fun res!421004 () Bool)

(assert (=> b!649604 (=> (not res!421004) (not e!372614))))

(assert (=> b!649604 (= res!421004 (arrayContainsKey!0 lt!301642 (select (arr!18469 a!2986) j!136) j!136))))

(declare-fun b!649618 () Bool)

(assert (=> b!649618 (= e!372612 e!372605)))

(declare-fun res!421012 () Bool)

(assert (=> b!649618 (=> res!421012 e!372605)))

(assert (=> b!649618 (= res!421012 (or (bvsge (size!18833 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18833 a!2986))))))

(assert (=> b!649618 (arrayContainsKey!0 lt!301642 (select (arr!18469 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301648 () Unit!22089)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22089)

(assert (=> b!649618 (= lt!301648 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301642 (select (arr!18469 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649618 e!372610))

(declare-fun res!421011 () Bool)

(assert (=> b!649618 (=> (not res!421011) (not e!372610))))

(assert (=> b!649618 (= res!421011 (arrayContainsKey!0 lt!301642 (select (arr!18469 a!2986) j!136) j!136))))

(declare-fun b!649619 () Bool)

(declare-fun e!372606 () Bool)

(assert (=> b!649619 (= e!372606 e!372608)))

(declare-fun res!420996 () Bool)

(assert (=> b!649619 (=> res!420996 e!372608)))

(declare-fun lt!301632 () (_ BitVec 64))

(assert (=> b!649619 (= res!420996 (or (not (= (select (arr!18469 a!2986) j!136) lt!301645)) (not (= (select (arr!18469 a!2986) j!136) lt!301632)) (bvsge j!136 index!984)))))

(declare-fun b!649620 () Bool)

(declare-fun Unit!22092 () Unit!22089)

(assert (=> b!649620 (= e!372611 Unit!22092)))

(declare-fun lt!301638 () Unit!22089)

(assert (=> b!649620 (= lt!301638 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301642 (select (arr!18469 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649620 (arrayContainsKey!0 lt!301642 (select (arr!18469 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301647 () Unit!22089)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12417) Unit!22089)

(assert (=> b!649620 (= lt!301647 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12414))))

(assert (=> b!649620 (arrayNoDuplicates!0 lt!301642 #b00000000000000000000000000000000 Nil!12414)))

(declare-fun lt!301635 () Unit!22089)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38532 (_ BitVec 32) (_ BitVec 32)) Unit!22089)

(assert (=> b!649620 (= lt!301635 (lemmaNoDuplicateFromThenFromBigger!0 lt!301642 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649620 (arrayNoDuplicates!0 lt!301642 j!136 Nil!12414)))

(declare-fun lt!301633 () Unit!22089)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38532 (_ BitVec 64) (_ BitVec 32) List!12417) Unit!22089)

(assert (=> b!649620 (= lt!301633 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301642 (select (arr!18469 a!2986) j!136) j!136 Nil!12414))))

(assert (=> b!649620 false))

(declare-fun b!649621 () Bool)

(declare-fun res!421005 () Bool)

(assert (=> b!649621 (=> res!421005 e!372605)))

(assert (=> b!649621 (= res!421005 (contains!3149 Nil!12414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649622 () Bool)

(declare-fun res!421009 () Bool)

(assert (=> b!649622 (=> (not res!421009) (not e!372604))))

(assert (=> b!649622 (= res!421009 (and (= (size!18833 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18833 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18833 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649623 () Bool)

(declare-fun Unit!22093 () Unit!22089)

(assert (=> b!649623 (= e!372611 Unit!22093)))

(declare-fun b!649624 () Bool)

(assert (=> b!649624 (= e!372613 e!372617)))

(declare-fun res!421008 () Bool)

(assert (=> b!649624 (=> res!421008 e!372617)))

(assert (=> b!649624 (= res!421008 (or (not (= (select (arr!18469 a!2986) j!136) lt!301645)) (not (= (select (arr!18469 a!2986) j!136) lt!301632))))))

(assert (=> b!649624 e!372606))

(declare-fun res!421017 () Bool)

(assert (=> b!649624 (=> (not res!421017) (not e!372606))))

(assert (=> b!649624 (= res!421017 (= lt!301632 (select (arr!18469 a!2986) j!136)))))

(assert (=> b!649624 (= lt!301632 (select (store (arr!18469 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649625 () Bool)

(declare-fun res!421014 () Bool)

(assert (=> b!649625 (=> (not res!421014) (not e!372604))))

(assert (=> b!649625 (= res!421014 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649626 () Bool)

(declare-fun Unit!22094 () Unit!22089)

(assert (=> b!649626 (= e!372615 Unit!22094)))

(assert (=> b!649626 false))

(declare-fun b!649627 () Bool)

(declare-fun res!420997 () Bool)

(assert (=> b!649627 (=> (not res!420997) (not e!372607))))

(assert (=> b!649627 (= res!420997 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18469 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!58932 res!420998) b!649622))

(assert (= (and b!649622 res!421009) b!649611))

(assert (= (and b!649611 res!421013) b!649610))

(assert (= (and b!649610 res!421006) b!649625))

(assert (= (and b!649625 res!421014) b!649613))

(assert (= (and b!649613 res!421015) b!649606))

(assert (= (and b!649606 res!421000) b!649615))

(assert (= (and b!649615 res!421018) b!649627))

(assert (= (and b!649627 res!420997) b!649605))

(assert (= (and b!649605 res!421002) b!649601))

(assert (= (and b!649601 res!420999) b!649617))

(assert (= (and b!649617 res!421001) b!649602))

(assert (= (and b!649617 c!74671) b!649626))

(assert (= (and b!649617 (not c!74671)) b!649612))

(assert (= (and b!649617 (not res!421003)) b!649624))

(assert (= (and b!649624 res!421017) b!649619))

(assert (= (and b!649619 (not res!420996)) b!649604))

(assert (= (and b!649604 res!421004) b!649616))

(assert (= (and b!649624 (not res!421008)) b!649607))

(assert (= (and b!649607 c!74672) b!649620))

(assert (= (and b!649607 (not c!74672)) b!649623))

(assert (= (and b!649607 (not res!421016)) b!649618))

(assert (= (and b!649618 res!421011) b!649608))

(assert (= (and b!649618 (not res!421012)) b!649603))

(assert (= (and b!649603 (not res!421007)) b!649621))

(assert (= (and b!649621 (not res!421005)) b!649609))

(assert (= (and b!649609 (not res!421010)) b!649614))

(declare-fun m!623293 () Bool)

(assert (=> b!649613 m!623293))

(declare-fun m!623295 () Bool)

(assert (=> b!649619 m!623295))

(assert (=> b!649604 m!623295))

(assert (=> b!649604 m!623295))

(declare-fun m!623297 () Bool)

(assert (=> b!649604 m!623297))

(assert (=> b!649624 m!623295))

(declare-fun m!623299 () Bool)

(assert (=> b!649624 m!623299))

(declare-fun m!623301 () Bool)

(assert (=> b!649624 m!623301))

(assert (=> b!649616 m!623295))

(assert (=> b!649616 m!623295))

(declare-fun m!623303 () Bool)

(assert (=> b!649616 m!623303))

(declare-fun m!623305 () Bool)

(assert (=> start!58932 m!623305))

(declare-fun m!623307 () Bool)

(assert (=> start!58932 m!623307))

(declare-fun m!623309 () Bool)

(assert (=> b!649614 m!623309))

(declare-fun m!623311 () Bool)

(assert (=> b!649621 m!623311))

(declare-fun m!623313 () Bool)

(assert (=> b!649601 m!623313))

(assert (=> b!649601 m!623295))

(assert (=> b!649601 m!623295))

(declare-fun m!623315 () Bool)

(assert (=> b!649601 m!623315))

(declare-fun m!623317 () Bool)

(assert (=> b!649609 m!623317))

(declare-fun m!623319 () Bool)

(assert (=> b!649603 m!623319))

(assert (=> b!649605 m!623299))

(declare-fun m!623321 () Bool)

(assert (=> b!649605 m!623321))

(declare-fun m!623323 () Bool)

(assert (=> b!649625 m!623323))

(declare-fun m!623325 () Bool)

(assert (=> b!649615 m!623325))

(declare-fun m!623327 () Bool)

(assert (=> b!649610 m!623327))

(assert (=> b!649608 m!623295))

(assert (=> b!649608 m!623295))

(assert (=> b!649608 m!623303))

(declare-fun m!623329 () Bool)

(assert (=> b!649617 m!623329))

(declare-fun m!623331 () Bool)

(assert (=> b!649617 m!623331))

(declare-fun m!623333 () Bool)

(assert (=> b!649617 m!623333))

(assert (=> b!649617 m!623295))

(assert (=> b!649617 m!623299))

(assert (=> b!649617 m!623295))

(declare-fun m!623335 () Bool)

(assert (=> b!649617 m!623335))

(declare-fun m!623337 () Bool)

(assert (=> b!649617 m!623337))

(declare-fun m!623339 () Bool)

(assert (=> b!649617 m!623339))

(assert (=> b!649611 m!623295))

(assert (=> b!649611 m!623295))

(declare-fun m!623341 () Bool)

(assert (=> b!649611 m!623341))

(assert (=> b!649620 m!623295))

(declare-fun m!623343 () Bool)

(assert (=> b!649620 m!623343))

(assert (=> b!649620 m!623295))

(declare-fun m!623345 () Bool)

(assert (=> b!649620 m!623345))

(declare-fun m!623347 () Bool)

(assert (=> b!649620 m!623347))

(assert (=> b!649620 m!623295))

(declare-fun m!623349 () Bool)

(assert (=> b!649620 m!623349))

(declare-fun m!623351 () Bool)

(assert (=> b!649620 m!623351))

(declare-fun m!623353 () Bool)

(assert (=> b!649620 m!623353))

(assert (=> b!649620 m!623295))

(declare-fun m!623355 () Bool)

(assert (=> b!649620 m!623355))

(declare-fun m!623357 () Bool)

(assert (=> b!649606 m!623357))

(assert (=> b!649618 m!623295))

(assert (=> b!649618 m!623295))

(declare-fun m!623359 () Bool)

(assert (=> b!649618 m!623359))

(assert (=> b!649618 m!623295))

(declare-fun m!623361 () Bool)

(assert (=> b!649618 m!623361))

(assert (=> b!649618 m!623295))

(assert (=> b!649618 m!623297))

(declare-fun m!623363 () Bool)

(assert (=> b!649627 m!623363))

(check-sat (not b!649617) (not b!649610) (not b!649603) (not b!649616) (not b!649618) (not b!649609) (not b!649604) (not start!58932) (not b!649611) (not b!649614) (not b!649601) (not b!649621) (not b!649615) (not b!649620) (not b!649608) (not b!649606) (not b!649625) (not b!649613))
(check-sat)
