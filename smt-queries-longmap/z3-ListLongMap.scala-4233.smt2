; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58392 () Bool)

(assert start!58392)

(declare-fun b!644505 () Bool)

(declare-fun res!417499 () Bool)

(declare-fun e!369270 () Bool)

(assert (=> b!644505 (=> (not res!417499) (not e!369270))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38427 0))(
  ( (array!38428 (arr!18424 (Array (_ BitVec 32) (_ BitVec 64))) (size!18788 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38427)

(assert (=> b!644505 (= res!417499 (and (= (size!18788 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18788 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18788 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644506 () Bool)

(declare-fun res!417494 () Bool)

(assert (=> b!644506 (=> (not res!417494) (not e!369270))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644506 (= res!417494 (validKeyInArray!0 k0!1786))))

(declare-fun b!644507 () Bool)

(declare-fun res!417504 () Bool)

(declare-fun e!369267 () Bool)

(assert (=> b!644507 (=> (not res!417504) (not e!369267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38427 (_ BitVec 32)) Bool)

(assert (=> b!644507 (= res!417504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644508 () Bool)

(declare-fun e!369276 () Bool)

(declare-fun e!369275 () Bool)

(assert (=> b!644508 (= e!369276 e!369275)))

(declare-fun res!417496 () Bool)

(assert (=> b!644508 (=> res!417496 e!369275)))

(declare-fun lt!298706 () (_ BitVec 64))

(declare-fun lt!298709 () (_ BitVec 64))

(assert (=> b!644508 (= res!417496 (or (not (= (select (arr!18424 a!2986) j!136) lt!298709)) (not (= (select (arr!18424 a!2986) j!136) lt!298706))))))

(declare-fun e!369269 () Bool)

(assert (=> b!644508 e!369269))

(declare-fun res!417493 () Bool)

(assert (=> b!644508 (=> (not res!417493) (not e!369269))))

(assert (=> b!644508 (= res!417493 (= lt!298706 (select (arr!18424 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!644508 (= lt!298706 (select (store (arr!18424 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!417500 () Bool)

(assert (=> start!58392 (=> (not res!417500) (not e!369270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58392 (= res!417500 (validMask!0 mask!3053))))

(assert (=> start!58392 e!369270))

(assert (=> start!58392 true))

(declare-fun array_inv!14283 (array!38427) Bool)

(assert (=> start!58392 (array_inv!14283 a!2986)))

(declare-fun b!644509 () Bool)

(declare-fun res!417490 () Bool)

(assert (=> b!644509 (=> (not res!417490) (not e!369270))))

(declare-fun arrayContainsKey!0 (array!38427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644509 (= res!417490 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!644510 () Bool)

(declare-datatypes ((Unit!21819 0))(
  ( (Unit!21820) )
))
(declare-fun e!369271 () Unit!21819)

(declare-fun Unit!21821 () Unit!21819)

(assert (=> b!644510 (= e!369271 Unit!21821)))

(declare-fun b!644511 () Bool)

(declare-fun e!369266 () Bool)

(assert (=> b!644511 (= e!369269 e!369266)))

(declare-fun res!417501 () Bool)

(assert (=> b!644511 (=> res!417501 e!369266)))

(assert (=> b!644511 (= res!417501 (or (not (= (select (arr!18424 a!2986) j!136) lt!298709)) (not (= (select (arr!18424 a!2986) j!136) lt!298706)) (bvsge j!136 index!984)))))

(declare-fun b!644512 () Bool)

(declare-fun e!369265 () Unit!21819)

(declare-fun Unit!21822 () Unit!21819)

(assert (=> b!644512 (= e!369265 Unit!21822)))

(declare-fun b!644513 () Bool)

(declare-fun e!369268 () Bool)

(assert (=> b!644513 (= e!369275 e!369268)))

(declare-fun res!417503 () Bool)

(assert (=> b!644513 (=> res!417503 e!369268)))

(assert (=> b!644513 (= res!417503 (bvsge index!984 j!136))))

(declare-fun lt!298708 () Unit!21819)

(assert (=> b!644513 (= lt!298708 e!369265)))

(declare-fun c!73876 () Bool)

(assert (=> b!644513 (= c!73876 (bvslt j!136 index!984))))

(declare-fun b!644514 () Bool)

(declare-fun res!417505 () Bool)

(assert (=> b!644514 (=> (not res!417505) (not e!369267))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644514 (= res!417505 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18424 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644515 () Bool)

(declare-fun lt!298704 () array!38427)

(declare-fun e!369264 () Bool)

(assert (=> b!644515 (= e!369264 (arrayContainsKey!0 lt!298704 (select (arr!18424 a!2986) j!136) index!984))))

(declare-fun b!644516 () Bool)

(declare-fun e!369272 () Bool)

(declare-fun e!369273 () Bool)

(assert (=> b!644516 (= e!369272 e!369273)))

(declare-fun res!417491 () Bool)

(assert (=> b!644516 (=> (not res!417491) (not e!369273))))

(declare-datatypes ((SeekEntryResult!6820 0))(
  ( (MissingZero!6820 (index!29612 (_ BitVec 32))) (Found!6820 (index!29613 (_ BitVec 32))) (Intermediate!6820 (undefined!7632 Bool) (index!29614 (_ BitVec 32)) (x!58535 (_ BitVec 32))) (Undefined!6820) (MissingVacant!6820 (index!29615 (_ BitVec 32))) )
))
(declare-fun lt!298711 () SeekEntryResult!6820)

(assert (=> b!644516 (= res!417491 (and (= lt!298711 (Found!6820 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18424 a!2986) index!984) (select (arr!18424 a!2986) j!136))) (not (= (select (arr!18424 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38427 (_ BitVec 32)) SeekEntryResult!6820)

(assert (=> b!644516 (= lt!298711 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18424 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644517 () Bool)

(assert (=> b!644517 (= e!369273 (not e!369276))))

(declare-fun res!417502 () Bool)

(assert (=> b!644517 (=> res!417502 e!369276)))

(declare-fun lt!298712 () SeekEntryResult!6820)

(assert (=> b!644517 (= res!417502 (not (= lt!298712 (Found!6820 index!984))))))

(declare-fun lt!298713 () Unit!21819)

(assert (=> b!644517 (= lt!298713 e!369271)))

(declare-fun c!73877 () Bool)

(assert (=> b!644517 (= c!73877 (= lt!298712 Undefined!6820))))

(assert (=> b!644517 (= lt!298712 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298709 lt!298704 mask!3053))))

(declare-fun e!369274 () Bool)

(assert (=> b!644517 e!369274))

(declare-fun res!417508 () Bool)

(assert (=> b!644517 (=> (not res!417508) (not e!369274))))

(declare-fun lt!298714 () (_ BitVec 32))

(declare-fun lt!298701 () SeekEntryResult!6820)

(assert (=> b!644517 (= res!417508 (= lt!298701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298714 vacantSpotIndex!68 lt!298709 lt!298704 mask!3053)))))

(assert (=> b!644517 (= lt!298701 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298714 vacantSpotIndex!68 (select (arr!18424 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644517 (= lt!298709 (select (store (arr!18424 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298705 () Unit!21819)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38427 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21819)

(assert (=> b!644517 (= lt!298705 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298714 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644517 (= lt!298714 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!644518 () Bool)

(declare-fun e!369262 () Bool)

(assert (=> b!644518 (= e!369266 e!369262)))

(declare-fun res!417492 () Bool)

(assert (=> b!644518 (=> (not res!417492) (not e!369262))))

(assert (=> b!644518 (= res!417492 (arrayContainsKey!0 lt!298704 (select (arr!18424 a!2986) j!136) j!136))))

(declare-fun b!644519 () Bool)

(assert (=> b!644519 (= e!369267 e!369272)))

(declare-fun res!417507 () Bool)

(assert (=> b!644519 (=> (not res!417507) (not e!369272))))

(assert (=> b!644519 (= res!417507 (= (select (store (arr!18424 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644519 (= lt!298704 (array!38428 (store (arr!18424 a!2986) i!1108 k0!1786) (size!18788 a!2986)))))

(declare-fun b!644520 () Bool)

(assert (=> b!644520 (= e!369274 (= lt!298711 lt!298701))))

(declare-fun b!644521 () Bool)

(declare-fun res!417506 () Bool)

(assert (=> b!644521 (=> (not res!417506) (not e!369267))))

(declare-datatypes ((List!12372 0))(
  ( (Nil!12369) (Cons!12368 (h!13416 (_ BitVec 64)) (t!18592 List!12372)) )
))
(declare-fun arrayNoDuplicates!0 (array!38427 (_ BitVec 32) List!12372) Bool)

(assert (=> b!644521 (= res!417506 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12369))))

(declare-fun b!644522 () Bool)

(declare-fun Unit!21823 () Unit!21819)

(assert (=> b!644522 (= e!369271 Unit!21823)))

(assert (=> b!644522 false))

(declare-fun b!644523 () Bool)

(declare-fun Unit!21824 () Unit!21819)

(assert (=> b!644523 (= e!369265 Unit!21824)))

(declare-fun lt!298710 () Unit!21819)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38427 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21819)

(assert (=> b!644523 (= lt!298710 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298704 (select (arr!18424 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644523 (arrayContainsKey!0 lt!298704 (select (arr!18424 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298700 () Unit!21819)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38427 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12372) Unit!21819)

(assert (=> b!644523 (= lt!298700 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12369))))

(assert (=> b!644523 (arrayNoDuplicates!0 lt!298704 #b00000000000000000000000000000000 Nil!12369)))

(declare-fun lt!298703 () Unit!21819)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38427 (_ BitVec 32) (_ BitVec 32)) Unit!21819)

(assert (=> b!644523 (= lt!298703 (lemmaNoDuplicateFromThenFromBigger!0 lt!298704 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644523 (arrayNoDuplicates!0 lt!298704 j!136 Nil!12369)))

(declare-fun lt!298707 () Unit!21819)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38427 (_ BitVec 64) (_ BitVec 32) List!12372) Unit!21819)

(assert (=> b!644523 (= lt!298707 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298704 (select (arr!18424 a!2986) j!136) j!136 Nil!12369))))

(assert (=> b!644523 false))

(declare-fun b!644524 () Bool)

(assert (=> b!644524 (= e!369262 (arrayContainsKey!0 lt!298704 (select (arr!18424 a!2986) j!136) index!984))))

(declare-fun b!644525 () Bool)

(declare-fun res!417498 () Bool)

(assert (=> b!644525 (=> (not res!417498) (not e!369270))))

(assert (=> b!644525 (= res!417498 (validKeyInArray!0 (select (arr!18424 a!2986) j!136)))))

(declare-fun b!644526 () Bool)

(assert (=> b!644526 (= e!369270 e!369267)))

(declare-fun res!417495 () Bool)

(assert (=> b!644526 (=> (not res!417495) (not e!369267))))

(declare-fun lt!298702 () SeekEntryResult!6820)

(assert (=> b!644526 (= res!417495 (or (= lt!298702 (MissingZero!6820 i!1108)) (= lt!298702 (MissingVacant!6820 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38427 (_ BitVec 32)) SeekEntryResult!6820)

(assert (=> b!644526 (= lt!298702 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644527 () Bool)

(assert (=> b!644527 (= e!369268 true)))

(assert (=> b!644527 e!369264))

(declare-fun res!417497 () Bool)

(assert (=> b!644527 (=> (not res!417497) (not e!369264))))

(assert (=> b!644527 (= res!417497 (arrayContainsKey!0 lt!298704 (select (arr!18424 a!2986) j!136) j!136))))

(assert (= (and start!58392 res!417500) b!644505))

(assert (= (and b!644505 res!417499) b!644525))

(assert (= (and b!644525 res!417498) b!644506))

(assert (= (and b!644506 res!417494) b!644509))

(assert (= (and b!644509 res!417490) b!644526))

(assert (= (and b!644526 res!417495) b!644507))

(assert (= (and b!644507 res!417504) b!644521))

(assert (= (and b!644521 res!417506) b!644514))

(assert (= (and b!644514 res!417505) b!644519))

(assert (= (and b!644519 res!417507) b!644516))

(assert (= (and b!644516 res!417491) b!644517))

(assert (= (and b!644517 res!417508) b!644520))

(assert (= (and b!644517 c!73877) b!644522))

(assert (= (and b!644517 (not c!73877)) b!644510))

(assert (= (and b!644517 (not res!417502)) b!644508))

(assert (= (and b!644508 res!417493) b!644511))

(assert (= (and b!644511 (not res!417501)) b!644518))

(assert (= (and b!644518 res!417492) b!644524))

(assert (= (and b!644508 (not res!417496)) b!644513))

(assert (= (and b!644513 c!73876) b!644523))

(assert (= (and b!644513 (not c!73876)) b!644512))

(assert (= (and b!644513 (not res!417503)) b!644527))

(assert (= (and b!644527 res!417497) b!644515))

(declare-fun m!618535 () Bool)

(assert (=> b!644508 m!618535))

(declare-fun m!618537 () Bool)

(assert (=> b!644508 m!618537))

(declare-fun m!618539 () Bool)

(assert (=> b!644508 m!618539))

(assert (=> b!644511 m!618535))

(assert (=> b!644515 m!618535))

(assert (=> b!644515 m!618535))

(declare-fun m!618541 () Bool)

(assert (=> b!644515 m!618541))

(declare-fun m!618543 () Bool)

(assert (=> b!644516 m!618543))

(assert (=> b!644516 m!618535))

(assert (=> b!644516 m!618535))

(declare-fun m!618545 () Bool)

(assert (=> b!644516 m!618545))

(declare-fun m!618547 () Bool)

(assert (=> b!644507 m!618547))

(assert (=> b!644525 m!618535))

(assert (=> b!644525 m!618535))

(declare-fun m!618549 () Bool)

(assert (=> b!644525 m!618549))

(declare-fun m!618551 () Bool)

(assert (=> b!644506 m!618551))

(declare-fun m!618553 () Bool)

(assert (=> start!58392 m!618553))

(declare-fun m!618555 () Bool)

(assert (=> start!58392 m!618555))

(assert (=> b!644524 m!618535))

(assert (=> b!644524 m!618535))

(assert (=> b!644524 m!618541))

(declare-fun m!618557 () Bool)

(assert (=> b!644526 m!618557))

(assert (=> b!644527 m!618535))

(assert (=> b!644527 m!618535))

(declare-fun m!618559 () Bool)

(assert (=> b!644527 m!618559))

(assert (=> b!644518 m!618535))

(assert (=> b!644518 m!618535))

(assert (=> b!644518 m!618559))

(declare-fun m!618561 () Bool)

(assert (=> b!644523 m!618561))

(declare-fun m!618563 () Bool)

(assert (=> b!644523 m!618563))

(assert (=> b!644523 m!618535))

(declare-fun m!618565 () Bool)

(assert (=> b!644523 m!618565))

(assert (=> b!644523 m!618535))

(declare-fun m!618567 () Bool)

(assert (=> b!644523 m!618567))

(declare-fun m!618569 () Bool)

(assert (=> b!644523 m!618569))

(declare-fun m!618571 () Bool)

(assert (=> b!644523 m!618571))

(assert (=> b!644523 m!618535))

(assert (=> b!644523 m!618535))

(declare-fun m!618573 () Bool)

(assert (=> b!644523 m!618573))

(assert (=> b!644519 m!618537))

(declare-fun m!618575 () Bool)

(assert (=> b!644519 m!618575))

(declare-fun m!618577 () Bool)

(assert (=> b!644521 m!618577))

(declare-fun m!618579 () Bool)

(assert (=> b!644517 m!618579))

(assert (=> b!644517 m!618535))

(assert (=> b!644517 m!618537))

(declare-fun m!618581 () Bool)

(assert (=> b!644517 m!618581))

(assert (=> b!644517 m!618535))

(declare-fun m!618583 () Bool)

(assert (=> b!644517 m!618583))

(declare-fun m!618585 () Bool)

(assert (=> b!644517 m!618585))

(declare-fun m!618587 () Bool)

(assert (=> b!644517 m!618587))

(declare-fun m!618589 () Bool)

(assert (=> b!644517 m!618589))

(declare-fun m!618591 () Bool)

(assert (=> b!644509 m!618591))

(declare-fun m!618593 () Bool)

(assert (=> b!644514 m!618593))

(check-sat (not b!644523) (not start!58392) (not b!644516) (not b!644527) (not b!644518) (not b!644524) (not b!644515) (not b!644526) (not b!644507) (not b!644506) (not b!644521) (not b!644509) (not b!644517) (not b!644525))
(check-sat)
