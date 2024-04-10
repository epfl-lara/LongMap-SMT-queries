; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59330 () Bool)

(assert start!59330)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38650 0))(
  ( (array!38651 (arr!18525 (Array (_ BitVec 32) (_ BitVec 64))) (size!18889 (_ BitVec 32))) )
))
(declare-fun lt!304864 () array!38650)

(declare-fun b!654453 () Bool)

(declare-fun e!375819 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38650)

(declare-fun arrayContainsKey!0 (array!38650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654453 (= e!375819 (arrayContainsKey!0 lt!304864 (select (arr!18525 a!2986) j!136) index!984))))

(declare-fun b!654454 () Bool)

(declare-fun res!424499 () Bool)

(declare-fun e!375830 () Bool)

(assert (=> b!654454 (=> (not res!424499) (not e!375830))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!654454 (= res!424499 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!424495 () Bool)

(assert (=> start!59330 (=> (not res!424495) (not e!375830))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59330 (= res!424495 (validMask!0 mask!3053))))

(assert (=> start!59330 e!375830))

(assert (=> start!59330 true))

(declare-fun array_inv!14321 (array!38650) Bool)

(assert (=> start!59330 (array_inv!14321 a!2986)))

(declare-fun b!654455 () Bool)

(declare-fun e!375829 () Bool)

(declare-datatypes ((SeekEntryResult!6965 0))(
  ( (MissingZero!6965 (index!30219 (_ BitVec 32))) (Found!6965 (index!30220 (_ BitVec 32))) (Intermediate!6965 (undefined!7777 Bool) (index!30221 (_ BitVec 32)) (x!59014 (_ BitVec 32))) (Undefined!6965) (MissingVacant!6965 (index!30222 (_ BitVec 32))) )
))
(declare-fun lt!304865 () SeekEntryResult!6965)

(declare-fun lt!304879 () SeekEntryResult!6965)

(assert (=> b!654455 (= e!375829 (= lt!304865 lt!304879))))

(declare-fun b!654456 () Bool)

(declare-fun res!424490 () Bool)

(declare-fun e!375821 () Bool)

(assert (=> b!654456 (=> (not res!424490) (not e!375821))))

(declare-datatypes ((List!12566 0))(
  ( (Nil!12563) (Cons!12562 (h!13607 (_ BitVec 64)) (t!18794 List!12566)) )
))
(declare-fun arrayNoDuplicates!0 (array!38650 (_ BitVec 32) List!12566) Bool)

(assert (=> b!654456 (= res!424490 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12563))))

(declare-fun b!654457 () Bool)

(declare-fun res!424497 () Bool)

(assert (=> b!654457 (=> (not res!424497) (not e!375821))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654457 (= res!424497 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18525 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654458 () Bool)

(declare-fun e!375826 () Bool)

(assert (=> b!654458 (= e!375826 false)))

(declare-datatypes ((Unit!22416 0))(
  ( (Unit!22417) )
))
(declare-fun lt!304869 () Unit!22416)

(declare-fun e!375822 () Unit!22416)

(assert (=> b!654458 (= lt!304869 e!375822)))

(declare-fun c!75351 () Bool)

(assert (=> b!654458 (= c!75351 (bvslt index!984 j!136))))

(declare-fun lt!304880 () Unit!22416)

(declare-fun e!375827 () Unit!22416)

(assert (=> b!654458 (= lt!304880 e!375827)))

(declare-fun c!75353 () Bool)

(assert (=> b!654458 (= c!75353 (bvslt j!136 index!984))))

(declare-fun b!654459 () Bool)

(assert (=> b!654459 (= e!375830 e!375821)))

(declare-fun res!424491 () Bool)

(assert (=> b!654459 (=> (not res!424491) (not e!375821))))

(declare-fun lt!304877 () SeekEntryResult!6965)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!654459 (= res!424491 (or (= lt!304877 (MissingZero!6965 i!1108)) (= lt!304877 (MissingVacant!6965 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38650 (_ BitVec 32)) SeekEntryResult!6965)

(assert (=> b!654459 (= lt!304877 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654460 () Bool)

(declare-fun res!424502 () Bool)

(assert (=> b!654460 (=> (not res!424502) (not e!375830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654460 (= res!424502 (validKeyInArray!0 k!1786))))

(declare-fun b!654461 () Bool)

(declare-fun res!424494 () Bool)

(assert (=> b!654461 (=> (not res!424494) (not e!375830))))

(assert (=> b!654461 (= res!424494 (and (= (size!18889 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18889 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18889 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!375818 () Bool)

(declare-fun b!654462 () Bool)

(assert (=> b!654462 (= e!375818 (arrayContainsKey!0 lt!304864 (select (arr!18525 a!2986) j!136) index!984))))

(declare-fun b!654463 () Bool)

(declare-fun e!375823 () Unit!22416)

(declare-fun Unit!22418 () Unit!22416)

(assert (=> b!654463 (= e!375823 Unit!22418)))

(assert (=> b!654463 false))

(declare-fun b!654464 () Bool)

(declare-fun res!424489 () Bool)

(assert (=> b!654464 (=> (not res!424489) (not e!375830))))

(assert (=> b!654464 (= res!424489 (validKeyInArray!0 (select (arr!18525 a!2986) j!136)))))

(declare-fun b!654465 () Bool)

(declare-fun e!375817 () Bool)

(assert (=> b!654465 (= e!375817 e!375819)))

(declare-fun res!424500 () Bool)

(assert (=> b!654465 (=> (not res!424500) (not e!375819))))

(assert (=> b!654465 (= res!424500 (arrayContainsKey!0 lt!304864 (select (arr!18525 a!2986) j!136) j!136))))

(declare-fun b!654466 () Bool)

(declare-fun res!424485 () Bool)

(assert (=> b!654466 (=> (not res!424485) (not e!375821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38650 (_ BitVec 32)) Bool)

(assert (=> b!654466 (= res!424485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654467 () Bool)

(declare-fun e!375828 () Bool)

(assert (=> b!654467 (= e!375828 e!375826)))

(declare-fun res!424496 () Bool)

(assert (=> b!654467 (=> res!424496 e!375826)))

(declare-fun lt!304873 () (_ BitVec 64))

(declare-fun lt!304875 () (_ BitVec 64))

(assert (=> b!654467 (= res!424496 (or (not (= (select (arr!18525 a!2986) j!136) lt!304873)) (not (= (select (arr!18525 a!2986) j!136) lt!304875))))))

(declare-fun e!375831 () Bool)

(assert (=> b!654467 e!375831))

(declare-fun res!424492 () Bool)

(assert (=> b!654467 (=> (not res!424492) (not e!375831))))

(assert (=> b!654467 (= res!424492 (= lt!304875 (select (arr!18525 a!2986) j!136)))))

(assert (=> b!654467 (= lt!304875 (select (store (arr!18525 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!654468 () Bool)

(declare-fun Unit!22419 () Unit!22416)

(assert (=> b!654468 (= e!375822 Unit!22419)))

(declare-fun res!424501 () Bool)

(assert (=> b!654468 (= res!424501 (arrayContainsKey!0 lt!304864 (select (arr!18525 a!2986) j!136) j!136))))

(assert (=> b!654468 (=> (not res!424501) (not e!375818))))

(assert (=> b!654468 e!375818))

(declare-fun lt!304868 () Unit!22416)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22416)

(assert (=> b!654468 (= lt!304868 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304864 (select (arr!18525 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654468 (arrayContainsKey!0 lt!304864 (select (arr!18525 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304874 () Unit!22416)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12566) Unit!22416)

(assert (=> b!654468 (= lt!304874 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12563))))

(assert (=> b!654468 (arrayNoDuplicates!0 lt!304864 #b00000000000000000000000000000000 Nil!12563)))

(declare-fun lt!304866 () Unit!22416)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38650 (_ BitVec 32) (_ BitVec 32)) Unit!22416)

(assert (=> b!654468 (= lt!304866 (lemmaNoDuplicateFromThenFromBigger!0 lt!304864 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654468 (arrayNoDuplicates!0 lt!304864 index!984 Nil!12563)))

(declare-fun lt!304870 () Unit!22416)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38650 (_ BitVec 64) (_ BitVec 32) List!12566) Unit!22416)

(assert (=> b!654468 (= lt!304870 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304864 (select (arr!18525 a!2986) j!136) index!984 Nil!12563))))

(assert (=> b!654468 false))

(declare-fun b!654469 () Bool)

(declare-fun e!375825 () Bool)

(declare-fun e!375824 () Bool)

(assert (=> b!654469 (= e!375825 e!375824)))

(declare-fun res!424493 () Bool)

(assert (=> b!654469 (=> (not res!424493) (not e!375824))))

(assert (=> b!654469 (= res!424493 (and (= lt!304865 (Found!6965 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18525 a!2986) index!984) (select (arr!18525 a!2986) j!136))) (not (= (select (arr!18525 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38650 (_ BitVec 32)) SeekEntryResult!6965)

(assert (=> b!654469 (= lt!304865 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18525 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654470 () Bool)

(assert (=> b!654470 (= e!375831 e!375817)))

(declare-fun res!424486 () Bool)

(assert (=> b!654470 (=> res!424486 e!375817)))

(assert (=> b!654470 (= res!424486 (or (not (= (select (arr!18525 a!2986) j!136) lt!304873)) (not (= (select (arr!18525 a!2986) j!136) lt!304875)) (bvsge j!136 index!984)))))

(declare-fun b!654471 () Bool)

(assert (=> b!654471 (= e!375821 e!375825)))

(declare-fun res!424487 () Bool)

(assert (=> b!654471 (=> (not res!424487) (not e!375825))))

(assert (=> b!654471 (= res!424487 (= (select (store (arr!18525 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654471 (= lt!304864 (array!38651 (store (arr!18525 a!2986) i!1108 k!1786) (size!18889 a!2986)))))

(declare-fun b!654472 () Bool)

(assert (=> b!654472 (= e!375824 (not e!375828))))

(declare-fun res!424488 () Bool)

(assert (=> b!654472 (=> res!424488 e!375828)))

(declare-fun lt!304881 () SeekEntryResult!6965)

(assert (=> b!654472 (= res!424488 (not (= lt!304881 (Found!6965 index!984))))))

(declare-fun lt!304878 () Unit!22416)

(assert (=> b!654472 (= lt!304878 e!375823)))

(declare-fun c!75352 () Bool)

(assert (=> b!654472 (= c!75352 (= lt!304881 Undefined!6965))))

(assert (=> b!654472 (= lt!304881 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304873 lt!304864 mask!3053))))

(assert (=> b!654472 e!375829))

(declare-fun res!424498 () Bool)

(assert (=> b!654472 (=> (not res!424498) (not e!375829))))

(declare-fun lt!304863 () (_ BitVec 32))

(assert (=> b!654472 (= res!424498 (= lt!304879 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304863 vacantSpotIndex!68 lt!304873 lt!304864 mask!3053)))))

(assert (=> b!654472 (= lt!304879 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304863 vacantSpotIndex!68 (select (arr!18525 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654472 (= lt!304873 (select (store (arr!18525 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!304882 () Unit!22416)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38650 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22416)

(assert (=> b!654472 (= lt!304882 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304863 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654472 (= lt!304863 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654473 () Bool)

(declare-fun Unit!22420 () Unit!22416)

(assert (=> b!654473 (= e!375827 Unit!22420)))

(declare-fun lt!304871 () Unit!22416)

(assert (=> b!654473 (= lt!304871 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304864 (select (arr!18525 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654473 (arrayContainsKey!0 lt!304864 (select (arr!18525 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304872 () Unit!22416)

(assert (=> b!654473 (= lt!304872 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12563))))

(assert (=> b!654473 (arrayNoDuplicates!0 lt!304864 #b00000000000000000000000000000000 Nil!12563)))

(declare-fun lt!304867 () Unit!22416)

(assert (=> b!654473 (= lt!304867 (lemmaNoDuplicateFromThenFromBigger!0 lt!304864 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654473 (arrayNoDuplicates!0 lt!304864 j!136 Nil!12563)))

(declare-fun lt!304876 () Unit!22416)

(assert (=> b!654473 (= lt!304876 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304864 (select (arr!18525 a!2986) j!136) j!136 Nil!12563))))

(assert (=> b!654473 false))

(declare-fun b!654474 () Bool)

(declare-fun Unit!22421 () Unit!22416)

(assert (=> b!654474 (= e!375822 Unit!22421)))

(declare-fun b!654475 () Bool)

(declare-fun Unit!22422 () Unit!22416)

(assert (=> b!654475 (= e!375827 Unit!22422)))

(declare-fun b!654476 () Bool)

(declare-fun Unit!22423 () Unit!22416)

(assert (=> b!654476 (= e!375823 Unit!22423)))

(assert (= (and start!59330 res!424495) b!654461))

(assert (= (and b!654461 res!424494) b!654464))

(assert (= (and b!654464 res!424489) b!654460))

(assert (= (and b!654460 res!424502) b!654454))

(assert (= (and b!654454 res!424499) b!654459))

(assert (= (and b!654459 res!424491) b!654466))

(assert (= (and b!654466 res!424485) b!654456))

(assert (= (and b!654456 res!424490) b!654457))

(assert (= (and b!654457 res!424497) b!654471))

(assert (= (and b!654471 res!424487) b!654469))

(assert (= (and b!654469 res!424493) b!654472))

(assert (= (and b!654472 res!424498) b!654455))

(assert (= (and b!654472 c!75352) b!654463))

(assert (= (and b!654472 (not c!75352)) b!654476))

(assert (= (and b!654472 (not res!424488)) b!654467))

(assert (= (and b!654467 res!424492) b!654470))

(assert (= (and b!654470 (not res!424486)) b!654465))

(assert (= (and b!654465 res!424500) b!654453))

(assert (= (and b!654467 (not res!424496)) b!654458))

(assert (= (and b!654458 c!75353) b!654473))

(assert (= (and b!654458 (not c!75353)) b!654475))

(assert (= (and b!654458 c!75351) b!654468))

(assert (= (and b!654458 (not c!75351)) b!654474))

(assert (= (and b!654468 res!424501) b!654462))

(declare-fun m!627557 () Bool)

(assert (=> b!654466 m!627557))

(declare-fun m!627559 () Bool)

(assert (=> b!654456 m!627559))

(declare-fun m!627561 () Bool)

(assert (=> b!654453 m!627561))

(assert (=> b!654453 m!627561))

(declare-fun m!627563 () Bool)

(assert (=> b!654453 m!627563))

(declare-fun m!627565 () Bool)

(assert (=> b!654471 m!627565))

(declare-fun m!627567 () Bool)

(assert (=> b!654471 m!627567))

(declare-fun m!627569 () Bool)

(assert (=> b!654457 m!627569))

(assert (=> b!654467 m!627561))

(assert (=> b!654467 m!627565))

(declare-fun m!627571 () Bool)

(assert (=> b!654467 m!627571))

(assert (=> b!654465 m!627561))

(assert (=> b!654465 m!627561))

(declare-fun m!627573 () Bool)

(assert (=> b!654465 m!627573))

(declare-fun m!627575 () Bool)

(assert (=> b!654473 m!627575))

(assert (=> b!654473 m!627561))

(declare-fun m!627577 () Bool)

(assert (=> b!654473 m!627577))

(assert (=> b!654473 m!627561))

(assert (=> b!654473 m!627561))

(declare-fun m!627579 () Bool)

(assert (=> b!654473 m!627579))

(declare-fun m!627581 () Bool)

(assert (=> b!654473 m!627581))

(declare-fun m!627583 () Bool)

(assert (=> b!654473 m!627583))

(assert (=> b!654473 m!627561))

(declare-fun m!627585 () Bool)

(assert (=> b!654473 m!627585))

(declare-fun m!627587 () Bool)

(assert (=> b!654473 m!627587))

(assert (=> b!654470 m!627561))

(assert (=> b!654462 m!627561))

(assert (=> b!654462 m!627561))

(assert (=> b!654462 m!627563))

(declare-fun m!627589 () Bool)

(assert (=> b!654459 m!627589))

(declare-fun m!627591 () Bool)

(assert (=> b!654472 m!627591))

(declare-fun m!627593 () Bool)

(assert (=> b!654472 m!627593))

(declare-fun m!627595 () Bool)

(assert (=> b!654472 m!627595))

(assert (=> b!654472 m!627561))

(assert (=> b!654472 m!627565))

(assert (=> b!654472 m!627561))

(declare-fun m!627597 () Bool)

(assert (=> b!654472 m!627597))

(declare-fun m!627599 () Bool)

(assert (=> b!654472 m!627599))

(declare-fun m!627601 () Bool)

(assert (=> b!654472 m!627601))

(assert (=> b!654468 m!627561))

(assert (=> b!654468 m!627561))

(declare-fun m!627603 () Bool)

(assert (=> b!654468 m!627603))

(assert (=> b!654468 m!627583))

(assert (=> b!654468 m!627561))

(declare-fun m!627605 () Bool)

(assert (=> b!654468 m!627605))

(declare-fun m!627607 () Bool)

(assert (=> b!654468 m!627607))

(assert (=> b!654468 m!627561))

(declare-fun m!627609 () Bool)

(assert (=> b!654468 m!627609))

(assert (=> b!654468 m!627587))

(assert (=> b!654468 m!627561))

(assert (=> b!654468 m!627573))

(declare-fun m!627611 () Bool)

(assert (=> b!654468 m!627611))

(declare-fun m!627613 () Bool)

(assert (=> b!654460 m!627613))

(declare-fun m!627615 () Bool)

(assert (=> b!654454 m!627615))

(declare-fun m!627617 () Bool)

(assert (=> start!59330 m!627617))

(declare-fun m!627619 () Bool)

(assert (=> start!59330 m!627619))

(declare-fun m!627621 () Bool)

(assert (=> b!654469 m!627621))

(assert (=> b!654469 m!627561))

(assert (=> b!654469 m!627561))

(declare-fun m!627623 () Bool)

(assert (=> b!654469 m!627623))

(assert (=> b!654464 m!627561))

(assert (=> b!654464 m!627561))

(declare-fun m!627625 () Bool)

(assert (=> b!654464 m!627625))

(push 1)

(assert (not b!654456))

(assert (not b!654464))

(assert (not b!654460))

(assert (not b!654459))

(assert (not b!654473))

(assert (not b!654468))

(assert (not b!654454))

(assert (not b!654465))

(assert (not b!654462))

(assert (not b!654469))

(assert (not b!654453))

(assert (not b!654466))

(assert (not start!59330))

(assert (not b!654472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

