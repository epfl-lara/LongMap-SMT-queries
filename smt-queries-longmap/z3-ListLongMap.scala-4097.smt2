; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56082 () Bool)

(assert start!56082)

(declare-fun b!618398 () Bool)

(assert (=> b!618398 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37552 0))(
  ( (array!37553 (arr!18022 (Array (_ BitVec 32) (_ BitVec 64))) (size!18386 (_ BitVec 32))) )
))
(declare-fun lt!285092 () array!37552)

(declare-datatypes ((Unit!20348 0))(
  ( (Unit!20349) )
))
(declare-fun lt!285086 () Unit!20348)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37552)

(declare-datatypes ((List!12063 0))(
  ( (Nil!12060) (Cons!12059 (h!13104 (_ BitVec 64)) (t!18291 List!12063)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37552 (_ BitVec 64) (_ BitVec 32) List!12063) Unit!20348)

(assert (=> b!618398 (= lt!285086 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285092 (select (arr!18022 a!2986) j!136) index!984 Nil!12060))))

(declare-fun arrayNoDuplicates!0 (array!37552 (_ BitVec 32) List!12063) Bool)

(assert (=> b!618398 (arrayNoDuplicates!0 lt!285092 index!984 Nil!12060)))

(declare-fun lt!285082 () Unit!20348)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37552 (_ BitVec 32) (_ BitVec 32)) Unit!20348)

(assert (=> b!618398 (= lt!285082 (lemmaNoDuplicateFromThenFromBigger!0 lt!285092 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618398 (arrayNoDuplicates!0 lt!285092 #b00000000000000000000000000000000 Nil!12060)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!285085 () Unit!20348)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12063) Unit!20348)

(assert (=> b!618398 (= lt!285085 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12060))))

(declare-fun arrayContainsKey!0 (array!37552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618398 (arrayContainsKey!0 lt!285092 (select (arr!18022 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285088 () Unit!20348)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37552 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20348)

(assert (=> b!618398 (= lt!285088 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285092 (select (arr!18022 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354631 () Bool)

(assert (=> b!618398 e!354631))

(declare-fun res!398418 () Bool)

(assert (=> b!618398 (=> (not res!398418) (not e!354631))))

(assert (=> b!618398 (= res!398418 (arrayContainsKey!0 lt!285092 (select (arr!18022 a!2986) j!136) j!136))))

(declare-fun e!354640 () Unit!20348)

(declare-fun Unit!20350 () Unit!20348)

(assert (=> b!618398 (= e!354640 Unit!20350)))

(declare-fun b!618399 () Bool)

(declare-fun e!354639 () Unit!20348)

(declare-fun Unit!20351 () Unit!20348)

(assert (=> b!618399 (= e!354639 Unit!20351)))

(declare-fun b!618400 () Bool)

(declare-fun res!398423 () Bool)

(declare-fun e!354642 () Bool)

(assert (=> b!618400 (=> (not res!398423) (not e!354642))))

(assert (=> b!618400 (= res!398423 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618401 () Bool)

(declare-fun e!354630 () Bool)

(declare-datatypes ((SeekEntryResult!6462 0))(
  ( (MissingZero!6462 (index!28132 (_ BitVec 32))) (Found!6462 (index!28133 (_ BitVec 32))) (Intermediate!6462 (undefined!7274 Bool) (index!28134 (_ BitVec 32)) (x!56918 (_ BitVec 32))) (Undefined!6462) (MissingVacant!6462 (index!28135 (_ BitVec 32))) )
))
(declare-fun lt!285093 () SeekEntryResult!6462)

(declare-fun lt!285080 () SeekEntryResult!6462)

(assert (=> b!618401 (= e!354630 (= lt!285093 lt!285080))))

(declare-fun b!618402 () Bool)

(declare-fun res!398416 () Bool)

(assert (=> b!618402 (=> (not res!398416) (not e!354642))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!618402 (= res!398416 (and (= (size!18386 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18386 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18386 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618403 () Bool)

(declare-fun e!354634 () Bool)

(declare-fun e!354638 () Bool)

(assert (=> b!618403 (= e!354634 e!354638)))

(declare-fun res!398428 () Bool)

(assert (=> b!618403 (=> (not res!398428) (not e!354638))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618403 (= res!398428 (= (select (store (arr!18022 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618403 (= lt!285092 (array!37553 (store (arr!18022 a!2986) i!1108 k0!1786) (size!18386 a!2986)))))

(declare-fun e!354636 () Bool)

(declare-fun b!618404 () Bool)

(assert (=> b!618404 (= e!354636 (arrayContainsKey!0 lt!285092 (select (arr!18022 a!2986) j!136) index!984))))

(declare-fun b!618405 () Bool)

(declare-fun res!398421 () Bool)

(assert (=> b!618405 (= res!398421 (arrayContainsKey!0 lt!285092 (select (arr!18022 a!2986) j!136) j!136))))

(assert (=> b!618405 (=> (not res!398421) (not e!354636))))

(declare-fun e!354633 () Bool)

(assert (=> b!618405 (= e!354633 e!354636)))

(declare-fun b!618406 () Bool)

(declare-fun e!354635 () Bool)

(declare-fun e!354629 () Bool)

(assert (=> b!618406 (= e!354635 (not e!354629))))

(declare-fun res!398424 () Bool)

(assert (=> b!618406 (=> res!398424 e!354629)))

(declare-fun lt!285084 () SeekEntryResult!6462)

(assert (=> b!618406 (= res!398424 (not (= lt!285084 (MissingVacant!6462 vacantSpotIndex!68))))))

(declare-fun lt!285090 () Unit!20348)

(declare-fun e!354637 () Unit!20348)

(assert (=> b!618406 (= lt!285090 e!354637)))

(declare-fun c!70358 () Bool)

(assert (=> b!618406 (= c!70358 (= lt!285084 (Found!6462 index!984)))))

(declare-fun lt!285089 () Unit!20348)

(assert (=> b!618406 (= lt!285089 e!354639)))

(declare-fun c!70360 () Bool)

(assert (=> b!618406 (= c!70360 (= lt!285084 Undefined!6462))))

(declare-fun lt!285096 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37552 (_ BitVec 32)) SeekEntryResult!6462)

(assert (=> b!618406 (= lt!285084 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285096 lt!285092 mask!3053))))

(assert (=> b!618406 e!354630))

(declare-fun res!398420 () Bool)

(assert (=> b!618406 (=> (not res!398420) (not e!354630))))

(declare-fun lt!285087 () (_ BitVec 32))

(assert (=> b!618406 (= res!398420 (= lt!285080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285087 vacantSpotIndex!68 lt!285096 lt!285092 mask!3053)))))

(assert (=> b!618406 (= lt!285080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285087 vacantSpotIndex!68 (select (arr!18022 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618406 (= lt!285096 (select (store (arr!18022 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285095 () Unit!20348)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37552 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20348)

(assert (=> b!618406 (= lt!285095 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285087 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618406 (= lt!285087 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618407 () Bool)

(assert (=> b!618407 false))

(declare-fun lt!285078 () Unit!20348)

(assert (=> b!618407 (= lt!285078 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285092 (select (arr!18022 a!2986) j!136) j!136 Nil!12060))))

(assert (=> b!618407 (arrayNoDuplicates!0 lt!285092 j!136 Nil!12060)))

(declare-fun lt!285097 () Unit!20348)

(assert (=> b!618407 (= lt!285097 (lemmaNoDuplicateFromThenFromBigger!0 lt!285092 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618407 (arrayNoDuplicates!0 lt!285092 #b00000000000000000000000000000000 Nil!12060)))

(declare-fun lt!285081 () Unit!20348)

(assert (=> b!618407 (= lt!285081 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12060))))

(assert (=> b!618407 (arrayContainsKey!0 lt!285092 (select (arr!18022 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285079 () Unit!20348)

(assert (=> b!618407 (= lt!285079 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285092 (select (arr!18022 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354628 () Unit!20348)

(declare-fun Unit!20352 () Unit!20348)

(assert (=> b!618407 (= e!354628 Unit!20352)))

(declare-fun b!618408 () Bool)

(declare-fun res!398429 () Bool)

(assert (=> b!618408 (=> (not res!398429) (not e!354642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618408 (= res!398429 (validKeyInArray!0 k0!1786))))

(declare-fun b!618409 () Bool)

(declare-fun Unit!20353 () Unit!20348)

(assert (=> b!618409 (= e!354637 Unit!20353)))

(declare-fun b!618410 () Bool)

(declare-fun res!398430 () Bool)

(assert (=> b!618410 (= res!398430 (bvsge j!136 index!984))))

(assert (=> b!618410 (=> res!398430 e!354633)))

(declare-fun e!354632 () Bool)

(assert (=> b!618410 (= e!354632 e!354633)))

(declare-fun res!398432 () Bool)

(assert (=> start!56082 (=> (not res!398432) (not e!354642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56082 (= res!398432 (validMask!0 mask!3053))))

(assert (=> start!56082 e!354642))

(assert (=> start!56082 true))

(declare-fun array_inv!13818 (array!37552) Bool)

(assert (=> start!56082 (array_inv!13818 a!2986)))

(declare-fun b!618411 () Bool)

(declare-fun res!398422 () Bool)

(assert (=> b!618411 (=> (not res!398422) (not e!354634))))

(assert (=> b!618411 (= res!398422 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18022 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618412 () Bool)

(declare-fun Unit!20354 () Unit!20348)

(assert (=> b!618412 (= e!354628 Unit!20354)))

(declare-fun b!618413 () Bool)

(assert (=> b!618413 (= e!354642 e!354634)))

(declare-fun res!398417 () Bool)

(assert (=> b!618413 (=> (not res!398417) (not e!354634))))

(declare-fun lt!285091 () SeekEntryResult!6462)

(assert (=> b!618413 (= res!398417 (or (= lt!285091 (MissingZero!6462 i!1108)) (= lt!285091 (MissingVacant!6462 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37552 (_ BitVec 32)) SeekEntryResult!6462)

(assert (=> b!618413 (= lt!285091 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618414 () Bool)

(declare-fun res!398427 () Bool)

(assert (=> b!618414 (=> (not res!398427) (not e!354634))))

(assert (=> b!618414 (= res!398427 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12060))))

(declare-fun b!618415 () Bool)

(assert (=> b!618415 (= e!354629 true)))

(assert (=> b!618415 (= (select (store (arr!18022 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618416 () Bool)

(declare-fun res!398431 () Bool)

(assert (=> b!618416 (=> (not res!398431) (not e!354634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37552 (_ BitVec 32)) Bool)

(assert (=> b!618416 (= res!398431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618417 () Bool)

(declare-fun res!398419 () Bool)

(assert (=> b!618417 (=> (not res!398419) (not e!354642))))

(assert (=> b!618417 (= res!398419 (validKeyInArray!0 (select (arr!18022 a!2986) j!136)))))

(declare-fun b!618418 () Bool)

(declare-fun Unit!20355 () Unit!20348)

(assert (=> b!618418 (= e!354637 Unit!20355)))

(declare-fun res!398425 () Bool)

(assert (=> b!618418 (= res!398425 (= (select (store (arr!18022 a!2986) i!1108 k0!1786) index!984) (select (arr!18022 a!2986) j!136)))))

(assert (=> b!618418 (=> (not res!398425) (not e!354632))))

(assert (=> b!618418 e!354632))

(declare-fun c!70359 () Bool)

(assert (=> b!618418 (= c!70359 (bvslt j!136 index!984))))

(declare-fun lt!285094 () Unit!20348)

(assert (=> b!618418 (= lt!285094 e!354628)))

(declare-fun c!70361 () Bool)

(assert (=> b!618418 (= c!70361 (bvslt index!984 j!136))))

(declare-fun lt!285083 () Unit!20348)

(assert (=> b!618418 (= lt!285083 e!354640)))

(assert (=> b!618418 false))

(declare-fun b!618419 () Bool)

(assert (=> b!618419 (= e!354631 (arrayContainsKey!0 lt!285092 (select (arr!18022 a!2986) j!136) index!984))))

(declare-fun b!618420 () Bool)

(declare-fun Unit!20356 () Unit!20348)

(assert (=> b!618420 (= e!354639 Unit!20356)))

(assert (=> b!618420 false))

(declare-fun b!618421 () Bool)

(assert (=> b!618421 (= e!354638 e!354635)))

(declare-fun res!398426 () Bool)

(assert (=> b!618421 (=> (not res!398426) (not e!354635))))

(assert (=> b!618421 (= res!398426 (and (= lt!285093 (Found!6462 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18022 a!2986) index!984) (select (arr!18022 a!2986) j!136))) (not (= (select (arr!18022 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618421 (= lt!285093 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18022 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618422 () Bool)

(declare-fun Unit!20357 () Unit!20348)

(assert (=> b!618422 (= e!354640 Unit!20357)))

(assert (= (and start!56082 res!398432) b!618402))

(assert (= (and b!618402 res!398416) b!618417))

(assert (= (and b!618417 res!398419) b!618408))

(assert (= (and b!618408 res!398429) b!618400))

(assert (= (and b!618400 res!398423) b!618413))

(assert (= (and b!618413 res!398417) b!618416))

(assert (= (and b!618416 res!398431) b!618414))

(assert (= (and b!618414 res!398427) b!618411))

(assert (= (and b!618411 res!398422) b!618403))

(assert (= (and b!618403 res!398428) b!618421))

(assert (= (and b!618421 res!398426) b!618406))

(assert (= (and b!618406 res!398420) b!618401))

(assert (= (and b!618406 c!70360) b!618420))

(assert (= (and b!618406 (not c!70360)) b!618399))

(assert (= (and b!618406 c!70358) b!618418))

(assert (= (and b!618406 (not c!70358)) b!618409))

(assert (= (and b!618418 res!398425) b!618410))

(assert (= (and b!618410 (not res!398430)) b!618405))

(assert (= (and b!618405 res!398421) b!618404))

(assert (= (and b!618418 c!70359) b!618407))

(assert (= (and b!618418 (not c!70359)) b!618412))

(assert (= (and b!618418 c!70361) b!618398))

(assert (= (and b!618418 (not c!70361)) b!618422))

(assert (= (and b!618398 res!398418) b!618419))

(assert (= (and b!618406 (not res!398424)) b!618415))

(declare-fun m!594441 () Bool)

(assert (=> b!618421 m!594441))

(declare-fun m!594443 () Bool)

(assert (=> b!618421 m!594443))

(assert (=> b!618421 m!594443))

(declare-fun m!594445 () Bool)

(assert (=> b!618421 m!594445))

(declare-fun m!594447 () Bool)

(assert (=> b!618414 m!594447))

(declare-fun m!594449 () Bool)

(assert (=> start!56082 m!594449))

(declare-fun m!594451 () Bool)

(assert (=> start!56082 m!594451))

(declare-fun m!594453 () Bool)

(assert (=> b!618416 m!594453))

(declare-fun m!594455 () Bool)

(assert (=> b!618398 m!594455))

(assert (=> b!618398 m!594443))

(assert (=> b!618398 m!594443))

(declare-fun m!594457 () Bool)

(assert (=> b!618398 m!594457))

(assert (=> b!618398 m!594443))

(declare-fun m!594459 () Bool)

(assert (=> b!618398 m!594459))

(assert (=> b!618398 m!594443))

(declare-fun m!594461 () Bool)

(assert (=> b!618398 m!594461))

(declare-fun m!594463 () Bool)

(assert (=> b!618398 m!594463))

(declare-fun m!594465 () Bool)

(assert (=> b!618398 m!594465))

(assert (=> b!618398 m!594443))

(declare-fun m!594467 () Bool)

(assert (=> b!618398 m!594467))

(declare-fun m!594469 () Bool)

(assert (=> b!618398 m!594469))

(assert (=> b!618405 m!594443))

(assert (=> b!618405 m!594443))

(assert (=> b!618405 m!594457))

(declare-fun m!594471 () Bool)

(assert (=> b!618406 m!594471))

(declare-fun m!594473 () Bool)

(assert (=> b!618406 m!594473))

(declare-fun m!594475 () Bool)

(assert (=> b!618406 m!594475))

(assert (=> b!618406 m!594443))

(declare-fun m!594477 () Bool)

(assert (=> b!618406 m!594477))

(declare-fun m!594479 () Bool)

(assert (=> b!618406 m!594479))

(declare-fun m!594481 () Bool)

(assert (=> b!618406 m!594481))

(declare-fun m!594483 () Bool)

(assert (=> b!618406 m!594483))

(assert (=> b!618406 m!594443))

(assert (=> b!618418 m!594479))

(declare-fun m!594485 () Bool)

(assert (=> b!618418 m!594485))

(assert (=> b!618418 m!594443))

(declare-fun m!594487 () Bool)

(assert (=> b!618408 m!594487))

(assert (=> b!618417 m!594443))

(assert (=> b!618417 m!594443))

(declare-fun m!594489 () Bool)

(assert (=> b!618417 m!594489))

(assert (=> b!618407 m!594443))

(declare-fun m!594491 () Bool)

(assert (=> b!618407 m!594491))

(declare-fun m!594493 () Bool)

(assert (=> b!618407 m!594493))

(assert (=> b!618407 m!594443))

(declare-fun m!594495 () Bool)

(assert (=> b!618407 m!594495))

(assert (=> b!618407 m!594463))

(assert (=> b!618407 m!594465))

(assert (=> b!618407 m!594443))

(declare-fun m!594497 () Bool)

(assert (=> b!618407 m!594497))

(assert (=> b!618407 m!594443))

(declare-fun m!594499 () Bool)

(assert (=> b!618407 m!594499))

(assert (=> b!618415 m!594479))

(assert (=> b!618415 m!594485))

(declare-fun m!594501 () Bool)

(assert (=> b!618413 m!594501))

(assert (=> b!618404 m!594443))

(assert (=> b!618404 m!594443))

(declare-fun m!594503 () Bool)

(assert (=> b!618404 m!594503))

(declare-fun m!594505 () Bool)

(assert (=> b!618400 m!594505))

(assert (=> b!618403 m!594479))

(declare-fun m!594507 () Bool)

(assert (=> b!618403 m!594507))

(declare-fun m!594509 () Bool)

(assert (=> b!618411 m!594509))

(assert (=> b!618419 m!594443))

(assert (=> b!618419 m!594443))

(assert (=> b!618419 m!594503))

(check-sat (not b!618414) (not b!618405) (not b!618406) (not start!56082) (not b!618400) (not b!618419) (not b!618421) (not b!618408) (not b!618404) (not b!618416) (not b!618407) (not b!618398) (not b!618413) (not b!618417))
(check-sat)
