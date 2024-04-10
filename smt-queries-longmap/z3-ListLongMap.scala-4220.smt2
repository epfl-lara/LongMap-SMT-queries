; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57916 () Bool)

(assert start!57916)

(declare-fun b!640487 () Bool)

(declare-fun e!366641 () Bool)

(declare-fun e!366643 () Bool)

(assert (=> b!640487 (= e!366641 e!366643)))

(declare-fun res!414758 () Bool)

(assert (=> b!640487 (=> res!414758 e!366643)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296433 () (_ BitVec 64))

(declare-fun lt!296435 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38343 0))(
  ( (array!38344 (arr!18391 (Array (_ BitVec 32) (_ BitVec 64))) (size!18755 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38343)

(assert (=> b!640487 (= res!414758 (or (not (= (select (arr!18391 a!2986) j!136) lt!296435)) (not (= (select (arr!18391 a!2986) j!136) lt!296433)) (bvsge j!136 index!984)))))

(declare-fun res!414746 () Bool)

(declare-fun e!366637 () Bool)

(assert (=> start!57916 (=> (not res!414746) (not e!366637))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57916 (= res!414746 (validMask!0 mask!3053))))

(assert (=> start!57916 e!366637))

(assert (=> start!57916 true))

(declare-fun array_inv!14187 (array!38343) Bool)

(assert (=> start!57916 (array_inv!14187 a!2986)))

(declare-fun b!640488 () Bool)

(declare-fun res!414748 () Bool)

(declare-fun e!366646 () Bool)

(assert (=> b!640488 (=> (not res!414748) (not e!366646))))

(declare-datatypes ((List!12432 0))(
  ( (Nil!12429) (Cons!12428 (h!13473 (_ BitVec 64)) (t!18660 List!12432)) )
))
(declare-fun arrayNoDuplicates!0 (array!38343 (_ BitVec 32) List!12432) Bool)

(assert (=> b!640488 (= res!414748 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12429))))

(declare-fun b!640489 () Bool)

(assert (=> b!640489 (= e!366637 e!366646)))

(declare-fun res!414755 () Bool)

(assert (=> b!640489 (=> (not res!414755) (not e!366646))))

(declare-datatypes ((SeekEntryResult!6831 0))(
  ( (MissingZero!6831 (index!29644 (_ BitVec 32))) (Found!6831 (index!29645 (_ BitVec 32))) (Intermediate!6831 (undefined!7643 Bool) (index!29646 (_ BitVec 32)) (x!58403 (_ BitVec 32))) (Undefined!6831) (MissingVacant!6831 (index!29647 (_ BitVec 32))) )
))
(declare-fun lt!296434 () SeekEntryResult!6831)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!640489 (= res!414755 (or (= lt!296434 (MissingZero!6831 i!1108)) (= lt!296434 (MissingVacant!6831 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38343 (_ BitVec 32)) SeekEntryResult!6831)

(assert (=> b!640489 (= lt!296434 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!640490 () Bool)

(declare-fun res!414752 () Bool)

(assert (=> b!640490 (=> (not res!414752) (not e!366646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38343 (_ BitVec 32)) Bool)

(assert (=> b!640490 (= res!414752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640491 () Bool)

(declare-fun res!414759 () Bool)

(assert (=> b!640491 (=> (not res!414759) (not e!366637))))

(assert (=> b!640491 (= res!414759 (and (= (size!18755 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18755 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18755 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640492 () Bool)

(declare-fun e!366642 () Bool)

(declare-fun e!366648 () Bool)

(assert (=> b!640492 (= e!366642 (not e!366648))))

(declare-fun res!414750 () Bool)

(assert (=> b!640492 (=> res!414750 e!366648)))

(declare-fun lt!296430 () SeekEntryResult!6831)

(assert (=> b!640492 (= res!414750 (not (= lt!296430 (Found!6831 index!984))))))

(declare-datatypes ((Unit!21658 0))(
  ( (Unit!21659) )
))
(declare-fun lt!296428 () Unit!21658)

(declare-fun e!366645 () Unit!21658)

(assert (=> b!640492 (= lt!296428 e!366645)))

(declare-fun c!73238 () Bool)

(assert (=> b!640492 (= c!73238 (= lt!296430 Undefined!6831))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!296425 () array!38343)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38343 (_ BitVec 32)) SeekEntryResult!6831)

(assert (=> b!640492 (= lt!296430 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296435 lt!296425 mask!3053))))

(declare-fun e!366638 () Bool)

(assert (=> b!640492 e!366638))

(declare-fun res!414757 () Bool)

(assert (=> b!640492 (=> (not res!414757) (not e!366638))))

(declare-fun lt!296429 () (_ BitVec 32))

(declare-fun lt!296431 () SeekEntryResult!6831)

(assert (=> b!640492 (= res!414757 (= lt!296431 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296429 vacantSpotIndex!68 lt!296435 lt!296425 mask!3053)))))

(assert (=> b!640492 (= lt!296431 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296429 vacantSpotIndex!68 (select (arr!18391 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640492 (= lt!296435 (select (store (arr!18391 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296427 () Unit!21658)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38343 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21658)

(assert (=> b!640492 (= lt!296427 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296429 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640492 (= lt!296429 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640493 () Bool)

(declare-fun res!414761 () Bool)

(assert (=> b!640493 (=> (not res!414761) (not e!366637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640493 (= res!414761 (validKeyInArray!0 (select (arr!18391 a!2986) j!136)))))

(declare-fun b!640494 () Bool)

(declare-fun e!366640 () Bool)

(assert (=> b!640494 (= e!366640 true)))

(assert (=> b!640494 (arrayNoDuplicates!0 lt!296425 j!136 Nil!12429)))

(declare-fun lt!296436 () Unit!21658)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38343 (_ BitVec 32) (_ BitVec 32)) Unit!21658)

(assert (=> b!640494 (= lt!296436 (lemmaNoDuplicateFromThenFromBigger!0 lt!296425 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640494 (arrayNoDuplicates!0 lt!296425 #b00000000000000000000000000000000 Nil!12429)))

(declare-fun lt!296432 () Unit!21658)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12432) Unit!21658)

(assert (=> b!640494 (= lt!296432 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12429))))

(declare-fun arrayContainsKey!0 (array!38343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640494 (arrayContainsKey!0 lt!296425 (select (arr!18391 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296437 () Unit!21658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38343 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21658)

(assert (=> b!640494 (= lt!296437 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296425 (select (arr!18391 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640495 () Bool)

(declare-fun res!414760 () Bool)

(assert (=> b!640495 (=> (not res!414760) (not e!366637))))

(assert (=> b!640495 (= res!414760 (validKeyInArray!0 k0!1786))))

(declare-fun b!640496 () Bool)

(declare-fun e!366647 () Bool)

(assert (=> b!640496 (= e!366647 e!366642)))

(declare-fun res!414747 () Bool)

(assert (=> b!640496 (=> (not res!414747) (not e!366642))))

(declare-fun lt!296426 () SeekEntryResult!6831)

(assert (=> b!640496 (= res!414747 (and (= lt!296426 (Found!6831 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18391 a!2986) index!984) (select (arr!18391 a!2986) j!136))) (not (= (select (arr!18391 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640496 (= lt!296426 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18391 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640497 () Bool)

(declare-fun res!414751 () Bool)

(assert (=> b!640497 (=> (not res!414751) (not e!366637))))

(assert (=> b!640497 (= res!414751 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640498 () Bool)

(assert (=> b!640498 (= e!366638 (= lt!296426 lt!296431))))

(declare-fun b!640499 () Bool)

(assert (=> b!640499 (= e!366648 e!366640)))

(declare-fun res!414756 () Bool)

(assert (=> b!640499 (=> res!414756 e!366640)))

(assert (=> b!640499 (= res!414756 (or (not (= (select (arr!18391 a!2986) j!136) lt!296435)) (not (= (select (arr!18391 a!2986) j!136) lt!296433)) (bvsge j!136 index!984)))))

(assert (=> b!640499 e!366641))

(declare-fun res!414753 () Bool)

(assert (=> b!640499 (=> (not res!414753) (not e!366641))))

(assert (=> b!640499 (= res!414753 (= lt!296433 (select (arr!18391 a!2986) j!136)))))

(assert (=> b!640499 (= lt!296433 (select (store (arr!18391 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640500 () Bool)

(assert (=> b!640500 (= e!366646 e!366647)))

(declare-fun res!414749 () Bool)

(assert (=> b!640500 (=> (not res!414749) (not e!366647))))

(assert (=> b!640500 (= res!414749 (= (select (store (arr!18391 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640500 (= lt!296425 (array!38344 (store (arr!18391 a!2986) i!1108 k0!1786) (size!18755 a!2986)))))

(declare-fun b!640501 () Bool)

(declare-fun e!366639 () Bool)

(assert (=> b!640501 (= e!366639 (arrayContainsKey!0 lt!296425 (select (arr!18391 a!2986) j!136) index!984))))

(declare-fun b!640502 () Bool)

(declare-fun Unit!21660 () Unit!21658)

(assert (=> b!640502 (= e!366645 Unit!21660)))

(declare-fun b!640503 () Bool)

(declare-fun res!414745 () Bool)

(assert (=> b!640503 (=> (not res!414745) (not e!366646))))

(assert (=> b!640503 (= res!414745 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18391 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640504 () Bool)

(declare-fun Unit!21661 () Unit!21658)

(assert (=> b!640504 (= e!366645 Unit!21661)))

(assert (=> b!640504 false))

(declare-fun b!640505 () Bool)

(assert (=> b!640505 (= e!366643 e!366639)))

(declare-fun res!414754 () Bool)

(assert (=> b!640505 (=> (not res!414754) (not e!366639))))

(assert (=> b!640505 (= res!414754 (arrayContainsKey!0 lt!296425 (select (arr!18391 a!2986) j!136) j!136))))

(assert (= (and start!57916 res!414746) b!640491))

(assert (= (and b!640491 res!414759) b!640493))

(assert (= (and b!640493 res!414761) b!640495))

(assert (= (and b!640495 res!414760) b!640497))

(assert (= (and b!640497 res!414751) b!640489))

(assert (= (and b!640489 res!414755) b!640490))

(assert (= (and b!640490 res!414752) b!640488))

(assert (= (and b!640488 res!414748) b!640503))

(assert (= (and b!640503 res!414745) b!640500))

(assert (= (and b!640500 res!414749) b!640496))

(assert (= (and b!640496 res!414747) b!640492))

(assert (= (and b!640492 res!414757) b!640498))

(assert (= (and b!640492 c!73238) b!640504))

(assert (= (and b!640492 (not c!73238)) b!640502))

(assert (= (and b!640492 (not res!414750)) b!640499))

(assert (= (and b!640499 res!414753) b!640487))

(assert (= (and b!640487 (not res!414758)) b!640505))

(assert (= (and b!640505 res!414754) b!640501))

(assert (= (and b!640499 (not res!414756)) b!640494))

(declare-fun m!614319 () Bool)

(assert (=> b!640501 m!614319))

(assert (=> b!640501 m!614319))

(declare-fun m!614321 () Bool)

(assert (=> b!640501 m!614321))

(declare-fun m!614323 () Bool)

(assert (=> start!57916 m!614323))

(declare-fun m!614325 () Bool)

(assert (=> start!57916 m!614325))

(declare-fun m!614327 () Bool)

(assert (=> b!640497 m!614327))

(declare-fun m!614329 () Bool)

(assert (=> b!640495 m!614329))

(assert (=> b!640499 m!614319))

(declare-fun m!614331 () Bool)

(assert (=> b!640499 m!614331))

(declare-fun m!614333 () Bool)

(assert (=> b!640499 m!614333))

(declare-fun m!614335 () Bool)

(assert (=> b!640489 m!614335))

(declare-fun m!614337 () Bool)

(assert (=> b!640503 m!614337))

(assert (=> b!640505 m!614319))

(assert (=> b!640505 m!614319))

(declare-fun m!614339 () Bool)

(assert (=> b!640505 m!614339))

(declare-fun m!614341 () Bool)

(assert (=> b!640490 m!614341))

(declare-fun m!614343 () Bool)

(assert (=> b!640488 m!614343))

(assert (=> b!640494 m!614319))

(assert (=> b!640494 m!614319))

(declare-fun m!614345 () Bool)

(assert (=> b!640494 m!614345))

(assert (=> b!640494 m!614319))

(declare-fun m!614347 () Bool)

(assert (=> b!640494 m!614347))

(declare-fun m!614349 () Bool)

(assert (=> b!640494 m!614349))

(declare-fun m!614351 () Bool)

(assert (=> b!640494 m!614351))

(declare-fun m!614353 () Bool)

(assert (=> b!640494 m!614353))

(declare-fun m!614355 () Bool)

(assert (=> b!640494 m!614355))

(assert (=> b!640500 m!614331))

(declare-fun m!614357 () Bool)

(assert (=> b!640500 m!614357))

(assert (=> b!640493 m!614319))

(assert (=> b!640493 m!614319))

(declare-fun m!614359 () Bool)

(assert (=> b!640493 m!614359))

(declare-fun m!614361 () Bool)

(assert (=> b!640496 m!614361))

(assert (=> b!640496 m!614319))

(assert (=> b!640496 m!614319))

(declare-fun m!614363 () Bool)

(assert (=> b!640496 m!614363))

(assert (=> b!640487 m!614319))

(declare-fun m!614365 () Bool)

(assert (=> b!640492 m!614365))

(declare-fun m!614367 () Bool)

(assert (=> b!640492 m!614367))

(assert (=> b!640492 m!614319))

(assert (=> b!640492 m!614331))

(declare-fun m!614369 () Bool)

(assert (=> b!640492 m!614369))

(declare-fun m!614371 () Bool)

(assert (=> b!640492 m!614371))

(assert (=> b!640492 m!614319))

(declare-fun m!614373 () Bool)

(assert (=> b!640492 m!614373))

(declare-fun m!614375 () Bool)

(assert (=> b!640492 m!614375))

(check-sat (not b!640496) (not b!640505) (not b!640495) (not b!640490) (not b!640497) (not b!640489) (not b!640488) (not b!640494) (not b!640492) (not b!640493) (not start!57916) (not b!640501))
(check-sat)
