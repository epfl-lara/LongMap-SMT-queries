; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55020 () Bool)

(assert start!55020)

(declare-fun b!602465 () Bool)

(declare-fun e!344570 () Bool)

(declare-fun e!344558 () Bool)

(assert (=> b!602465 (= e!344570 e!344558)))

(declare-fun res!386884 () Bool)

(assert (=> b!602465 (=> (not res!386884) (not e!344558))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37174 0))(
  ( (array!37175 (arr!17845 (Array (_ BitVec 32) (_ BitVec 64))) (size!18209 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37174)

(assert (=> b!602465 (= res!386884 (= (select (store (arr!17845 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!274425 () array!37174)

(assert (=> b!602465 (= lt!274425 (array!37175 (store (arr!17845 a!2986) i!1108 k0!1786) (size!18209 a!2986)))))

(declare-fun b!602466 () Bool)

(declare-fun e!344560 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!602466 (= e!344560 (or (bvsge index!984 (size!18209 a!2986)) (bvslt (size!18209 a!2986) #b01111111111111111111111111111111)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!602466 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) j!136)))

(declare-fun b!602467 () Bool)

(declare-fun e!344571 () Bool)

(declare-fun e!344563 () Bool)

(assert (=> b!602467 (= e!344571 (not e!344563))))

(declare-fun res!386889 () Bool)

(assert (=> b!602467 (=> res!386889 e!344563)))

(declare-datatypes ((SeekEntryResult!6285 0))(
  ( (MissingZero!6285 (index!27400 (_ BitVec 32))) (Found!6285 (index!27401 (_ BitVec 32))) (Intermediate!6285 (undefined!7097 Bool) (index!27402 (_ BitVec 32)) (x!56197 (_ BitVec 32))) (Undefined!6285) (MissingVacant!6285 (index!27403 (_ BitVec 32))) )
))
(declare-fun lt!274428 () SeekEntryResult!6285)

(assert (=> b!602467 (= res!386889 (not (= lt!274428 (Found!6285 index!984))))))

(declare-datatypes ((Unit!19090 0))(
  ( (Unit!19091) )
))
(declare-fun lt!274433 () Unit!19090)

(declare-fun e!344559 () Unit!19090)

(assert (=> b!602467 (= lt!274433 e!344559)))

(declare-fun c!68159 () Bool)

(assert (=> b!602467 (= c!68159 (= lt!274428 Undefined!6285))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!274427 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37174 (_ BitVec 32)) SeekEntryResult!6285)

(assert (=> b!602467 (= lt!274428 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274427 lt!274425 mask!3053))))

(declare-fun e!344569 () Bool)

(assert (=> b!602467 e!344569))

(declare-fun res!386899 () Bool)

(assert (=> b!602467 (=> (not res!386899) (not e!344569))))

(declare-fun lt!274424 () SeekEntryResult!6285)

(declare-fun lt!274432 () (_ BitVec 32))

(assert (=> b!602467 (= res!386899 (= lt!274424 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 lt!274427 lt!274425 mask!3053)))))

(assert (=> b!602467 (= lt!274424 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!602467 (= lt!274427 (select (store (arr!17845 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274438 () Unit!19090)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37174 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19090)

(assert (=> b!602467 (= lt!274438 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!602467 (= lt!274432 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!602468 () Bool)

(declare-fun Unit!19092 () Unit!19090)

(assert (=> b!602468 (= e!344559 Unit!19092)))

(assert (=> b!602468 false))

(declare-fun b!602469 () Bool)

(declare-fun lt!274426 () SeekEntryResult!6285)

(assert (=> b!602469 (= e!344569 (= lt!274426 lt!274424))))

(declare-fun b!602470 () Bool)

(declare-fun res!386900 () Bool)

(declare-fun e!344565 () Bool)

(assert (=> b!602470 (=> (not res!386900) (not e!344565))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!602470 (= res!386900 (validKeyInArray!0 (select (arr!17845 a!2986) j!136)))))

(declare-fun b!602471 () Bool)

(declare-fun res!386890 () Bool)

(assert (=> b!602471 (=> (not res!386890) (not e!344565))))

(assert (=> b!602471 (= res!386890 (validKeyInArray!0 k0!1786))))

(declare-fun b!602472 () Bool)

(declare-fun e!344564 () Bool)

(assert (=> b!602472 (= e!344563 e!344564)))

(declare-fun res!386891 () Bool)

(assert (=> b!602472 (=> res!386891 e!344564)))

(declare-fun lt!274429 () (_ BitVec 64))

(assert (=> b!602472 (= res!386891 (or (not (= (select (arr!17845 a!2986) j!136) lt!274427)) (not (= (select (arr!17845 a!2986) j!136) lt!274429))))))

(declare-fun e!344568 () Bool)

(assert (=> b!602472 e!344568))

(declare-fun res!386897 () Bool)

(assert (=> b!602472 (=> (not res!386897) (not e!344568))))

(assert (=> b!602472 (= res!386897 (= lt!274429 (select (arr!17845 a!2986) j!136)))))

(assert (=> b!602472 (= lt!274429 (select (store (arr!17845 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!602473 () Bool)

(declare-fun res!386894 () Bool)

(assert (=> b!602473 (=> (not res!386894) (not e!344565))))

(assert (=> b!602473 (= res!386894 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!602474 () Bool)

(declare-fun res!386887 () Bool)

(assert (=> b!602474 (=> (not res!386887) (not e!344570))))

(declare-datatypes ((List!11886 0))(
  ( (Nil!11883) (Cons!11882 (h!12927 (_ BitVec 64)) (t!18114 List!11886)) )
))
(declare-fun arrayNoDuplicates!0 (array!37174 (_ BitVec 32) List!11886) Bool)

(assert (=> b!602474 (= res!386887 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11883))))

(declare-fun res!386896 () Bool)

(assert (=> start!55020 (=> (not res!386896) (not e!344565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55020 (= res!386896 (validMask!0 mask!3053))))

(assert (=> start!55020 e!344565))

(assert (=> start!55020 true))

(declare-fun array_inv!13641 (array!37174) Bool)

(assert (=> start!55020 (array_inv!13641 a!2986)))

(declare-fun b!602475 () Bool)

(assert (=> b!602475 (= e!344564 e!344560)))

(declare-fun res!386888 () Bool)

(assert (=> b!602475 (=> res!386888 e!344560)))

(assert (=> b!602475 (= res!386888 (bvsge index!984 j!136))))

(declare-fun lt!274430 () Unit!19090)

(declare-fun e!344566 () Unit!19090)

(assert (=> b!602475 (= lt!274430 e!344566)))

(declare-fun c!68158 () Bool)

(assert (=> b!602475 (= c!68158 (bvslt j!136 index!984))))

(declare-fun b!602476 () Bool)

(declare-fun res!386886 () Bool)

(assert (=> b!602476 (=> (not res!386886) (not e!344570))))

(assert (=> b!602476 (= res!386886 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17845 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!602477 () Bool)

(declare-fun Unit!19093 () Unit!19090)

(assert (=> b!602477 (= e!344566 Unit!19093)))

(declare-fun lt!274431 () Unit!19090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37174 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19090)

(assert (=> b!602477 (= lt!274431 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274425 (select (arr!17845 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!602477 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274434 () Unit!19090)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37174 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11886) Unit!19090)

(assert (=> b!602477 (= lt!274434 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11883))))

(assert (=> b!602477 (arrayNoDuplicates!0 lt!274425 #b00000000000000000000000000000000 Nil!11883)))

(declare-fun lt!274435 () Unit!19090)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37174 (_ BitVec 32) (_ BitVec 32)) Unit!19090)

(assert (=> b!602477 (= lt!274435 (lemmaNoDuplicateFromThenFromBigger!0 lt!274425 #b00000000000000000000000000000000 j!136))))

(assert (=> b!602477 (arrayNoDuplicates!0 lt!274425 j!136 Nil!11883)))

(declare-fun lt!274437 () Unit!19090)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37174 (_ BitVec 64) (_ BitVec 32) List!11886) Unit!19090)

(assert (=> b!602477 (= lt!274437 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274425 (select (arr!17845 a!2986) j!136) j!136 Nil!11883))))

(assert (=> b!602477 false))

(declare-fun b!602478 () Bool)

(declare-fun e!344562 () Bool)

(assert (=> b!602478 (= e!344568 e!344562)))

(declare-fun res!386895 () Bool)

(assert (=> b!602478 (=> res!386895 e!344562)))

(assert (=> b!602478 (= res!386895 (or (not (= (select (arr!17845 a!2986) j!136) lt!274427)) (not (= (select (arr!17845 a!2986) j!136) lt!274429)) (bvsge j!136 index!984)))))

(declare-fun b!602479 () Bool)

(declare-fun Unit!19094 () Unit!19090)

(assert (=> b!602479 (= e!344566 Unit!19094)))

(declare-fun b!602480 () Bool)

(assert (=> b!602480 (= e!344558 e!344571)))

(declare-fun res!386898 () Bool)

(assert (=> b!602480 (=> (not res!386898) (not e!344571))))

(assert (=> b!602480 (= res!386898 (and (= lt!274426 (Found!6285 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17845 a!2986) index!984) (select (arr!17845 a!2986) j!136))) (not (= (select (arr!17845 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!602480 (= lt!274426 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602481 () Bool)

(declare-fun Unit!19095 () Unit!19090)

(assert (=> b!602481 (= e!344559 Unit!19095)))

(declare-fun b!602482 () Bool)

(declare-fun e!344567 () Bool)

(assert (=> b!602482 (= e!344562 e!344567)))

(declare-fun res!386892 () Bool)

(assert (=> b!602482 (=> (not res!386892) (not e!344567))))

(assert (=> b!602482 (= res!386892 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) j!136))))

(declare-fun b!602483 () Bool)

(declare-fun res!386885 () Bool)

(assert (=> b!602483 (=> (not res!386885) (not e!344570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37174 (_ BitVec 32)) Bool)

(assert (=> b!602483 (= res!386885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!602484 () Bool)

(assert (=> b!602484 (= e!344567 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) index!984))))

(declare-fun b!602485 () Bool)

(assert (=> b!602485 (= e!344565 e!344570)))

(declare-fun res!386883 () Bool)

(assert (=> b!602485 (=> (not res!386883) (not e!344570))))

(declare-fun lt!274436 () SeekEntryResult!6285)

(assert (=> b!602485 (= res!386883 (or (= lt!274436 (MissingZero!6285 i!1108)) (= lt!274436 (MissingVacant!6285 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37174 (_ BitVec 32)) SeekEntryResult!6285)

(assert (=> b!602485 (= lt!274436 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!602486 () Bool)

(declare-fun res!386893 () Bool)

(assert (=> b!602486 (=> (not res!386893) (not e!344565))))

(assert (=> b!602486 (= res!386893 (and (= (size!18209 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18209 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18209 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55020 res!386896) b!602486))

(assert (= (and b!602486 res!386893) b!602470))

(assert (= (and b!602470 res!386900) b!602471))

(assert (= (and b!602471 res!386890) b!602473))

(assert (= (and b!602473 res!386894) b!602485))

(assert (= (and b!602485 res!386883) b!602483))

(assert (= (and b!602483 res!386885) b!602474))

(assert (= (and b!602474 res!386887) b!602476))

(assert (= (and b!602476 res!386886) b!602465))

(assert (= (and b!602465 res!386884) b!602480))

(assert (= (and b!602480 res!386898) b!602467))

(assert (= (and b!602467 res!386899) b!602469))

(assert (= (and b!602467 c!68159) b!602468))

(assert (= (and b!602467 (not c!68159)) b!602481))

(assert (= (and b!602467 (not res!386889)) b!602472))

(assert (= (and b!602472 res!386897) b!602478))

(assert (= (and b!602478 (not res!386895)) b!602482))

(assert (= (and b!602482 res!386892) b!602484))

(assert (= (and b!602472 (not res!386891)) b!602475))

(assert (= (and b!602475 c!68158) b!602477))

(assert (= (and b!602475 (not c!68158)) b!602479))

(assert (= (and b!602475 (not res!386888)) b!602466))

(declare-fun m!579581 () Bool)

(assert (=> b!602482 m!579581))

(assert (=> b!602482 m!579581))

(declare-fun m!579583 () Bool)

(assert (=> b!602482 m!579583))

(declare-fun m!579585 () Bool)

(assert (=> b!602477 m!579585))

(assert (=> b!602477 m!579581))

(declare-fun m!579587 () Bool)

(assert (=> b!602477 m!579587))

(assert (=> b!602477 m!579581))

(assert (=> b!602477 m!579581))

(declare-fun m!579589 () Bool)

(assert (=> b!602477 m!579589))

(assert (=> b!602477 m!579581))

(declare-fun m!579591 () Bool)

(assert (=> b!602477 m!579591))

(declare-fun m!579593 () Bool)

(assert (=> b!602477 m!579593))

(declare-fun m!579595 () Bool)

(assert (=> b!602477 m!579595))

(declare-fun m!579597 () Bool)

(assert (=> b!602477 m!579597))

(declare-fun m!579599 () Bool)

(assert (=> b!602480 m!579599))

(assert (=> b!602480 m!579581))

(assert (=> b!602480 m!579581))

(declare-fun m!579601 () Bool)

(assert (=> b!602480 m!579601))

(declare-fun m!579603 () Bool)

(assert (=> start!55020 m!579603))

(declare-fun m!579605 () Bool)

(assert (=> start!55020 m!579605))

(assert (=> b!602484 m!579581))

(assert (=> b!602484 m!579581))

(declare-fun m!579607 () Bool)

(assert (=> b!602484 m!579607))

(declare-fun m!579609 () Bool)

(assert (=> b!602465 m!579609))

(declare-fun m!579611 () Bool)

(assert (=> b!602465 m!579611))

(declare-fun m!579613 () Bool)

(assert (=> b!602485 m!579613))

(declare-fun m!579615 () Bool)

(assert (=> b!602471 m!579615))

(declare-fun m!579617 () Bool)

(assert (=> b!602467 m!579617))

(assert (=> b!602467 m!579581))

(assert (=> b!602467 m!579609))

(declare-fun m!579619 () Bool)

(assert (=> b!602467 m!579619))

(declare-fun m!579621 () Bool)

(assert (=> b!602467 m!579621))

(declare-fun m!579623 () Bool)

(assert (=> b!602467 m!579623))

(assert (=> b!602467 m!579581))

(declare-fun m!579625 () Bool)

(assert (=> b!602467 m!579625))

(declare-fun m!579627 () Bool)

(assert (=> b!602467 m!579627))

(declare-fun m!579629 () Bool)

(assert (=> b!602483 m!579629))

(assert (=> b!602466 m!579581))

(assert (=> b!602466 m!579581))

(assert (=> b!602466 m!579583))

(declare-fun m!579631 () Bool)

(assert (=> b!602476 m!579631))

(declare-fun m!579633 () Bool)

(assert (=> b!602474 m!579633))

(assert (=> b!602470 m!579581))

(assert (=> b!602470 m!579581))

(declare-fun m!579635 () Bool)

(assert (=> b!602470 m!579635))

(assert (=> b!602478 m!579581))

(assert (=> b!602472 m!579581))

(assert (=> b!602472 m!579609))

(declare-fun m!579637 () Bool)

(assert (=> b!602472 m!579637))

(declare-fun m!579639 () Bool)

(assert (=> b!602473 m!579639))

(check-sat (not b!602466) (not b!602474) (not b!602482) (not b!602471) (not b!602477) (not b!602485) (not start!55020) (not b!602473) (not b!602470) (not b!602483) (not b!602484) (not b!602480) (not b!602467))
(check-sat)
(get-model)

(declare-fun b!602565 () Bool)

(declare-fun e!344622 () SeekEntryResult!6285)

(declare-fun e!344621 () SeekEntryResult!6285)

(assert (=> b!602565 (= e!344622 e!344621)))

(declare-fun c!68173 () Bool)

(declare-fun lt!274489 () (_ BitVec 64))

(assert (=> b!602565 (= c!68173 (= lt!274489 lt!274427))))

(declare-fun b!602566 () Bool)

(assert (=> b!602566 (= e!344622 Undefined!6285)))

(declare-fun b!602568 () Bool)

(declare-fun c!68174 () Bool)

(assert (=> b!602568 (= c!68174 (= lt!274489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344620 () SeekEntryResult!6285)

(assert (=> b!602568 (= e!344621 e!344620)))

(declare-fun b!602569 () Bool)

(assert (=> b!602569 (= e!344620 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274432 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!274427 lt!274425 mask!3053))))

(declare-fun b!602570 () Bool)

(assert (=> b!602570 (= e!344621 (Found!6285 lt!274432))))

(declare-fun lt!274488 () SeekEntryResult!6285)

(declare-fun d!87281 () Bool)

(get-info :version)

(assert (=> d!87281 (and (or ((_ is Undefined!6285) lt!274488) (not ((_ is Found!6285) lt!274488)) (and (bvsge (index!27401 lt!274488) #b00000000000000000000000000000000) (bvslt (index!27401 lt!274488) (size!18209 lt!274425)))) (or ((_ is Undefined!6285) lt!274488) ((_ is Found!6285) lt!274488) (not ((_ is MissingVacant!6285) lt!274488)) (not (= (index!27403 lt!274488) vacantSpotIndex!68)) (and (bvsge (index!27403 lt!274488) #b00000000000000000000000000000000) (bvslt (index!27403 lt!274488) (size!18209 lt!274425)))) (or ((_ is Undefined!6285) lt!274488) (ite ((_ is Found!6285) lt!274488) (= (select (arr!17845 lt!274425) (index!27401 lt!274488)) lt!274427) (and ((_ is MissingVacant!6285) lt!274488) (= (index!27403 lt!274488) vacantSpotIndex!68) (= (select (arr!17845 lt!274425) (index!27403 lt!274488)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87281 (= lt!274488 e!344622)))

(declare-fun c!68172 () Bool)

(assert (=> d!87281 (= c!68172 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87281 (= lt!274489 (select (arr!17845 lt!274425) lt!274432))))

(assert (=> d!87281 (validMask!0 mask!3053)))

(assert (=> d!87281 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 lt!274427 lt!274425 mask!3053) lt!274488)))

(declare-fun b!602567 () Bool)

(assert (=> b!602567 (= e!344620 (MissingVacant!6285 vacantSpotIndex!68))))

(assert (= (and d!87281 c!68172) b!602566))

(assert (= (and d!87281 (not c!68172)) b!602565))

(assert (= (and b!602565 c!68173) b!602570))

(assert (= (and b!602565 (not c!68173)) b!602568))

(assert (= (and b!602568 c!68174) b!602567))

(assert (= (and b!602568 (not c!68174)) b!602569))

(declare-fun m!579701 () Bool)

(assert (=> b!602569 m!579701))

(assert (=> b!602569 m!579701))

(declare-fun m!579703 () Bool)

(assert (=> b!602569 m!579703))

(declare-fun m!579705 () Bool)

(assert (=> d!87281 m!579705))

(declare-fun m!579707 () Bool)

(assert (=> d!87281 m!579707))

(declare-fun m!579709 () Bool)

(assert (=> d!87281 m!579709))

(assert (=> d!87281 m!579603))

(assert (=> b!602467 d!87281))

(declare-fun b!602571 () Bool)

(declare-fun e!344625 () SeekEntryResult!6285)

(declare-fun e!344624 () SeekEntryResult!6285)

(assert (=> b!602571 (= e!344625 e!344624)))

(declare-fun lt!274491 () (_ BitVec 64))

(declare-fun c!68176 () Bool)

(assert (=> b!602571 (= c!68176 (= lt!274491 (select (arr!17845 a!2986) j!136)))))

(declare-fun b!602572 () Bool)

(assert (=> b!602572 (= e!344625 Undefined!6285)))

(declare-fun b!602574 () Bool)

(declare-fun c!68177 () Bool)

(assert (=> b!602574 (= c!68177 (= lt!274491 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344623 () SeekEntryResult!6285)

(assert (=> b!602574 (= e!344624 e!344623)))

(declare-fun b!602575 () Bool)

(assert (=> b!602575 (= e!344623 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!274432 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602576 () Bool)

(assert (=> b!602576 (= e!344624 (Found!6285 lt!274432))))

(declare-fun d!87283 () Bool)

(declare-fun lt!274490 () SeekEntryResult!6285)

(assert (=> d!87283 (and (or ((_ is Undefined!6285) lt!274490) (not ((_ is Found!6285) lt!274490)) (and (bvsge (index!27401 lt!274490) #b00000000000000000000000000000000) (bvslt (index!27401 lt!274490) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274490) ((_ is Found!6285) lt!274490) (not ((_ is MissingVacant!6285) lt!274490)) (not (= (index!27403 lt!274490) vacantSpotIndex!68)) (and (bvsge (index!27403 lt!274490) #b00000000000000000000000000000000) (bvslt (index!27403 lt!274490) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274490) (ite ((_ is Found!6285) lt!274490) (= (select (arr!17845 a!2986) (index!27401 lt!274490)) (select (arr!17845 a!2986) j!136)) (and ((_ is MissingVacant!6285) lt!274490) (= (index!27403 lt!274490) vacantSpotIndex!68) (= (select (arr!17845 a!2986) (index!27403 lt!274490)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87283 (= lt!274490 e!344625)))

(declare-fun c!68175 () Bool)

(assert (=> d!87283 (= c!68175 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87283 (= lt!274491 (select (arr!17845 a!2986) lt!274432))))

(assert (=> d!87283 (validMask!0 mask!3053)))

(assert (=> d!87283 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053) lt!274490)))

(declare-fun b!602573 () Bool)

(assert (=> b!602573 (= e!344623 (MissingVacant!6285 vacantSpotIndex!68))))

(assert (= (and d!87283 c!68175) b!602572))

(assert (= (and d!87283 (not c!68175)) b!602571))

(assert (= (and b!602571 c!68176) b!602576))

(assert (= (and b!602571 (not c!68176)) b!602574))

(assert (= (and b!602574 c!68177) b!602573))

(assert (= (and b!602574 (not c!68177)) b!602575))

(assert (=> b!602575 m!579701))

(assert (=> b!602575 m!579701))

(assert (=> b!602575 m!579581))

(declare-fun m!579711 () Bool)

(assert (=> b!602575 m!579711))

(declare-fun m!579713 () Bool)

(assert (=> d!87283 m!579713))

(declare-fun m!579715 () Bool)

(assert (=> d!87283 m!579715))

(declare-fun m!579717 () Bool)

(assert (=> d!87283 m!579717))

(assert (=> d!87283 m!579603))

(assert (=> b!602467 d!87283))

(declare-fun b!602577 () Bool)

(declare-fun e!344628 () SeekEntryResult!6285)

(declare-fun e!344627 () SeekEntryResult!6285)

(assert (=> b!602577 (= e!344628 e!344627)))

(declare-fun c!68179 () Bool)

(declare-fun lt!274493 () (_ BitVec 64))

(assert (=> b!602577 (= c!68179 (= lt!274493 lt!274427))))

(declare-fun b!602578 () Bool)

(assert (=> b!602578 (= e!344628 Undefined!6285)))

(declare-fun b!602580 () Bool)

(declare-fun c!68180 () Bool)

(assert (=> b!602580 (= c!68180 (= lt!274493 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344626 () SeekEntryResult!6285)

(assert (=> b!602580 (= e!344627 e!344626)))

(declare-fun b!602581 () Bool)

(assert (=> b!602581 (= e!344626 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!274427 lt!274425 mask!3053))))

(declare-fun b!602582 () Bool)

(assert (=> b!602582 (= e!344627 (Found!6285 index!984))))

(declare-fun lt!274492 () SeekEntryResult!6285)

(declare-fun d!87285 () Bool)

(assert (=> d!87285 (and (or ((_ is Undefined!6285) lt!274492) (not ((_ is Found!6285) lt!274492)) (and (bvsge (index!27401 lt!274492) #b00000000000000000000000000000000) (bvslt (index!27401 lt!274492) (size!18209 lt!274425)))) (or ((_ is Undefined!6285) lt!274492) ((_ is Found!6285) lt!274492) (not ((_ is MissingVacant!6285) lt!274492)) (not (= (index!27403 lt!274492) vacantSpotIndex!68)) (and (bvsge (index!27403 lt!274492) #b00000000000000000000000000000000) (bvslt (index!27403 lt!274492) (size!18209 lt!274425)))) (or ((_ is Undefined!6285) lt!274492) (ite ((_ is Found!6285) lt!274492) (= (select (arr!17845 lt!274425) (index!27401 lt!274492)) lt!274427) (and ((_ is MissingVacant!6285) lt!274492) (= (index!27403 lt!274492) vacantSpotIndex!68) (= (select (arr!17845 lt!274425) (index!27403 lt!274492)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87285 (= lt!274492 e!344628)))

(declare-fun c!68178 () Bool)

(assert (=> d!87285 (= c!68178 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87285 (= lt!274493 (select (arr!17845 lt!274425) index!984))))

(assert (=> d!87285 (validMask!0 mask!3053)))

(assert (=> d!87285 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274427 lt!274425 mask!3053) lt!274492)))

(declare-fun b!602579 () Bool)

(assert (=> b!602579 (= e!344626 (MissingVacant!6285 vacantSpotIndex!68))))

(assert (= (and d!87285 c!68178) b!602578))

(assert (= (and d!87285 (not c!68178)) b!602577))

(assert (= (and b!602577 c!68179) b!602582))

(assert (= (and b!602577 (not c!68179)) b!602580))

(assert (= (and b!602580 c!68180) b!602579))

(assert (= (and b!602580 (not c!68180)) b!602581))

(assert (=> b!602581 m!579623))

(assert (=> b!602581 m!579623))

(declare-fun m!579719 () Bool)

(assert (=> b!602581 m!579719))

(declare-fun m!579721 () Bool)

(assert (=> d!87285 m!579721))

(declare-fun m!579723 () Bool)

(assert (=> d!87285 m!579723))

(declare-fun m!579725 () Bool)

(assert (=> d!87285 m!579725))

(assert (=> d!87285 m!579603))

(assert (=> b!602467 d!87285))

(declare-fun d!87287 () Bool)

(declare-fun e!344631 () Bool)

(assert (=> d!87287 e!344631))

(declare-fun res!386957 () Bool)

(assert (=> d!87287 (=> (not res!386957) (not e!344631))))

(assert (=> d!87287 (= res!386957 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18209 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18209 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18209 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18209 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18209 a!2986))))))

(declare-fun lt!274496 () Unit!19090)

(declare-fun choose!9 (array!37174 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19090)

(assert (=> d!87287 (= lt!274496 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87287 (validMask!0 mask!3053)))

(assert (=> d!87287 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 mask!3053) lt!274496)))

(declare-fun b!602585 () Bool)

(assert (=> b!602585 (= e!344631 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274432 vacantSpotIndex!68 (select (store (arr!17845 a!2986) i!1108 k0!1786) j!136) (array!37175 (store (arr!17845 a!2986) i!1108 k0!1786) (size!18209 a!2986)) mask!3053)))))

(assert (= (and d!87287 res!386957) b!602585))

(declare-fun m!579727 () Bool)

(assert (=> d!87287 m!579727))

(assert (=> d!87287 m!579603))

(assert (=> b!602585 m!579581))

(assert (=> b!602585 m!579625))

(assert (=> b!602585 m!579617))

(assert (=> b!602585 m!579617))

(declare-fun m!579729 () Bool)

(assert (=> b!602585 m!579729))

(assert (=> b!602585 m!579609))

(assert (=> b!602585 m!579581))

(assert (=> b!602467 d!87287))

(declare-fun d!87289 () Bool)

(declare-fun lt!274499 () (_ BitVec 32))

(assert (=> d!87289 (and (bvsge lt!274499 #b00000000000000000000000000000000) (bvslt lt!274499 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87289 (= lt!274499 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87289 (validMask!0 mask!3053)))

(assert (=> d!87289 (= (nextIndex!0 index!984 x!910 mask!3053) lt!274499)))

(declare-fun bs!18460 () Bool)

(assert (= bs!18460 d!87289))

(declare-fun m!579731 () Bool)

(assert (=> bs!18460 m!579731))

(assert (=> bs!18460 m!579603))

(assert (=> b!602467 d!87289))

(declare-fun d!87291 () Bool)

(declare-fun res!386962 () Bool)

(declare-fun e!344636 () Bool)

(assert (=> d!87291 (=> res!386962 e!344636)))

(assert (=> d!87291 (= res!386962 (= (select (arr!17845 lt!274425) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17845 a!2986) j!136)))))

(assert (=> d!87291 (= (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344636)))

(declare-fun b!602590 () Bool)

(declare-fun e!344637 () Bool)

(assert (=> b!602590 (= e!344636 e!344637)))

(declare-fun res!386963 () Bool)

(assert (=> b!602590 (=> (not res!386963) (not e!344637))))

(assert (=> b!602590 (= res!386963 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18209 lt!274425)))))

(declare-fun b!602591 () Bool)

(assert (=> b!602591 (= e!344637 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87291 (not res!386962)) b!602590))

(assert (= (and b!602590 res!386963) b!602591))

(declare-fun m!579733 () Bool)

(assert (=> d!87291 m!579733))

(assert (=> b!602591 m!579581))

(declare-fun m!579735 () Bool)

(assert (=> b!602591 m!579735))

(assert (=> b!602477 d!87291))

(declare-fun b!602602 () Bool)

(declare-fun e!344648 () Bool)

(declare-fun e!344647 () Bool)

(assert (=> b!602602 (= e!344648 e!344647)))

(declare-fun res!386971 () Bool)

(assert (=> b!602602 (=> (not res!386971) (not e!344647))))

(declare-fun e!344646 () Bool)

(assert (=> b!602602 (= res!386971 (not e!344646))))

(declare-fun res!386972 () Bool)

(assert (=> b!602602 (=> (not res!386972) (not e!344646))))

(assert (=> b!602602 (= res!386972 (validKeyInArray!0 (select (arr!17845 lt!274425) #b00000000000000000000000000000000)))))

(declare-fun bm!32990 () Bool)

(declare-fun call!32993 () Bool)

(declare-fun c!68183 () Bool)

(assert (=> bm!32990 (= call!32993 (arrayNoDuplicates!0 lt!274425 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68183 (Cons!11882 (select (arr!17845 lt!274425) #b00000000000000000000000000000000) Nil!11883) Nil!11883)))))

(declare-fun b!602604 () Bool)

(declare-fun e!344649 () Bool)

(assert (=> b!602604 (= e!344647 e!344649)))

(assert (=> b!602604 (= c!68183 (validKeyInArray!0 (select (arr!17845 lt!274425) #b00000000000000000000000000000000)))))

(declare-fun b!602605 () Bool)

(assert (=> b!602605 (= e!344649 call!32993)))

(declare-fun b!602606 () Bool)

(declare-fun contains!2989 (List!11886 (_ BitVec 64)) Bool)

(assert (=> b!602606 (= e!344646 (contains!2989 Nil!11883 (select (arr!17845 lt!274425) #b00000000000000000000000000000000)))))

(declare-fun d!87293 () Bool)

(declare-fun res!386970 () Bool)

(assert (=> d!87293 (=> res!386970 e!344648)))

(assert (=> d!87293 (= res!386970 (bvsge #b00000000000000000000000000000000 (size!18209 lt!274425)))))

(assert (=> d!87293 (= (arrayNoDuplicates!0 lt!274425 #b00000000000000000000000000000000 Nil!11883) e!344648)))

(declare-fun b!602603 () Bool)

(assert (=> b!602603 (= e!344649 call!32993)))

(assert (= (and d!87293 (not res!386970)) b!602602))

(assert (= (and b!602602 res!386972) b!602606))

(assert (= (and b!602602 res!386971) b!602604))

(assert (= (and b!602604 c!68183) b!602603))

(assert (= (and b!602604 (not c!68183)) b!602605))

(assert (= (or b!602603 b!602605) bm!32990))

(declare-fun m!579737 () Bool)

(assert (=> b!602602 m!579737))

(assert (=> b!602602 m!579737))

(declare-fun m!579739 () Bool)

(assert (=> b!602602 m!579739))

(assert (=> bm!32990 m!579737))

(declare-fun m!579741 () Bool)

(assert (=> bm!32990 m!579741))

(assert (=> b!602604 m!579737))

(assert (=> b!602604 m!579737))

(assert (=> b!602604 m!579739))

(assert (=> b!602606 m!579737))

(assert (=> b!602606 m!579737))

(declare-fun m!579743 () Bool)

(assert (=> b!602606 m!579743))

(assert (=> b!602477 d!87293))

(declare-fun d!87299 () Bool)

(assert (=> d!87299 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18209 lt!274425)) (not (= (select (arr!17845 lt!274425) j!136) (select (arr!17845 a!2986) j!136))))))

(declare-fun lt!274502 () Unit!19090)

(declare-fun choose!21 (array!37174 (_ BitVec 64) (_ BitVec 32) List!11886) Unit!19090)

(assert (=> d!87299 (= lt!274502 (choose!21 lt!274425 (select (arr!17845 a!2986) j!136) j!136 Nil!11883))))

(assert (=> d!87299 (bvslt (size!18209 lt!274425) #b01111111111111111111111111111111)))

(assert (=> d!87299 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274425 (select (arr!17845 a!2986) j!136) j!136 Nil!11883) lt!274502)))

(declare-fun bs!18461 () Bool)

(assert (= bs!18461 d!87299))

(declare-fun m!579757 () Bool)

(assert (=> bs!18461 m!579757))

(assert (=> bs!18461 m!579581))

(declare-fun m!579759 () Bool)

(assert (=> bs!18461 m!579759))

(assert (=> b!602477 d!87299))

(declare-fun b!602621 () Bool)

(declare-fun e!344666 () Bool)

(declare-fun e!344665 () Bool)

(assert (=> b!602621 (= e!344666 e!344665)))

(declare-fun res!386988 () Bool)

(assert (=> b!602621 (=> (not res!386988) (not e!344665))))

(declare-fun e!344664 () Bool)

(assert (=> b!602621 (= res!386988 (not e!344664))))

(declare-fun res!386989 () Bool)

(assert (=> b!602621 (=> (not res!386989) (not e!344664))))

(assert (=> b!602621 (= res!386989 (validKeyInArray!0 (select (arr!17845 lt!274425) j!136)))))

(declare-fun call!32994 () Bool)

(declare-fun c!68184 () Bool)

(declare-fun bm!32991 () Bool)

(assert (=> bm!32991 (= call!32994 (arrayNoDuplicates!0 lt!274425 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68184 (Cons!11882 (select (arr!17845 lt!274425) j!136) Nil!11883) Nil!11883)))))

(declare-fun b!602623 () Bool)

(declare-fun e!344667 () Bool)

(assert (=> b!602623 (= e!344665 e!344667)))

(assert (=> b!602623 (= c!68184 (validKeyInArray!0 (select (arr!17845 lt!274425) j!136)))))

(declare-fun b!602624 () Bool)

(assert (=> b!602624 (= e!344667 call!32994)))

(declare-fun b!602625 () Bool)

(assert (=> b!602625 (= e!344664 (contains!2989 Nil!11883 (select (arr!17845 lt!274425) j!136)))))

(declare-fun d!87307 () Bool)

(declare-fun res!386987 () Bool)

(assert (=> d!87307 (=> res!386987 e!344666)))

(assert (=> d!87307 (= res!386987 (bvsge j!136 (size!18209 lt!274425)))))

(assert (=> d!87307 (= (arrayNoDuplicates!0 lt!274425 j!136 Nil!11883) e!344666)))

(declare-fun b!602622 () Bool)

(assert (=> b!602622 (= e!344667 call!32994)))

(assert (= (and d!87307 (not res!386987)) b!602621))

(assert (= (and b!602621 res!386989) b!602625))

(assert (= (and b!602621 res!386988) b!602623))

(assert (= (and b!602623 c!68184) b!602622))

(assert (= (and b!602623 (not c!68184)) b!602624))

(assert (= (or b!602622 b!602624) bm!32991))

(assert (=> b!602621 m!579757))

(assert (=> b!602621 m!579757))

(declare-fun m!579761 () Bool)

(assert (=> b!602621 m!579761))

(assert (=> bm!32991 m!579757))

(declare-fun m!579765 () Bool)

(assert (=> bm!32991 m!579765))

(assert (=> b!602623 m!579757))

(assert (=> b!602623 m!579757))

(assert (=> b!602623 m!579761))

(assert (=> b!602625 m!579757))

(assert (=> b!602625 m!579757))

(declare-fun m!579769 () Bool)

(assert (=> b!602625 m!579769))

(assert (=> b!602477 d!87307))

(declare-fun d!87315 () Bool)

(assert (=> d!87315 (arrayNoDuplicates!0 lt!274425 j!136 Nil!11883)))

(declare-fun lt!274505 () Unit!19090)

(declare-fun choose!39 (array!37174 (_ BitVec 32) (_ BitVec 32)) Unit!19090)

(assert (=> d!87315 (= lt!274505 (choose!39 lt!274425 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87315 (bvslt (size!18209 lt!274425) #b01111111111111111111111111111111)))

(assert (=> d!87315 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!274425 #b00000000000000000000000000000000 j!136) lt!274505)))

(declare-fun bs!18462 () Bool)

(assert (= bs!18462 d!87315))

(assert (=> bs!18462 m!579595))

(declare-fun m!579771 () Bool)

(assert (=> bs!18462 m!579771))

(assert (=> b!602477 d!87315))

(declare-fun d!87317 () Bool)

(assert (=> d!87317 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274508 () Unit!19090)

(declare-fun choose!114 (array!37174 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19090)

(assert (=> d!87317 (= lt!274508 (choose!114 lt!274425 (select (arr!17845 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87317 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87317 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274425 (select (arr!17845 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!274508)))

(declare-fun bs!18463 () Bool)

(assert (= bs!18463 d!87317))

(assert (=> bs!18463 m!579581))

(assert (=> bs!18463 m!579589))

(assert (=> bs!18463 m!579581))

(declare-fun m!579781 () Bool)

(assert (=> bs!18463 m!579781))

(assert (=> b!602477 d!87317))

(declare-fun d!87321 () Bool)

(declare-fun e!344684 () Bool)

(assert (=> d!87321 e!344684))

(declare-fun res!387003 () Bool)

(assert (=> d!87321 (=> (not res!387003) (not e!344684))))

(assert (=> d!87321 (= res!387003 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18209 a!2986))))))

(declare-fun lt!274514 () Unit!19090)

(declare-fun choose!41 (array!37174 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11886) Unit!19090)

(assert (=> d!87321 (= lt!274514 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11883))))

(assert (=> d!87321 (bvslt (size!18209 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87321 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11883) lt!274514)))

(declare-fun b!602645 () Bool)

(assert (=> b!602645 (= e!344684 (arrayNoDuplicates!0 (array!37175 (store (arr!17845 a!2986) i!1108 k0!1786) (size!18209 a!2986)) #b00000000000000000000000000000000 Nil!11883))))

(assert (= (and d!87321 res!387003) b!602645))

(declare-fun m!579785 () Bool)

(assert (=> d!87321 m!579785))

(assert (=> b!602645 m!579609))

(declare-fun m!579787 () Bool)

(assert (=> b!602645 m!579787))

(assert (=> b!602477 d!87321))

(declare-fun d!87325 () Bool)

(declare-fun res!387004 () Bool)

(declare-fun e!344685 () Bool)

(assert (=> d!87325 (=> res!387004 e!344685)))

(assert (=> d!87325 (= res!387004 (= (select (arr!17845 lt!274425) j!136) (select (arr!17845 a!2986) j!136)))))

(assert (=> d!87325 (= (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) j!136) e!344685)))

(declare-fun b!602646 () Bool)

(declare-fun e!344686 () Bool)

(assert (=> b!602646 (= e!344685 e!344686)))

(declare-fun res!387005 () Bool)

(assert (=> b!602646 (=> (not res!387005) (not e!344686))))

(assert (=> b!602646 (= res!387005 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18209 lt!274425)))))

(declare-fun b!602647 () Bool)

(assert (=> b!602647 (= e!344686 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87325 (not res!387004)) b!602646))

(assert (= (and b!602646 res!387005) b!602647))

(assert (=> d!87325 m!579757))

(assert (=> b!602647 m!579581))

(declare-fun m!579789 () Bool)

(assert (=> b!602647 m!579789))

(assert (=> b!602466 d!87325))

(declare-fun b!602648 () Bool)

(declare-fun e!344689 () SeekEntryResult!6285)

(declare-fun e!344688 () SeekEntryResult!6285)

(assert (=> b!602648 (= e!344689 e!344688)))

(declare-fun lt!274518 () (_ BitVec 64))

(declare-fun c!68189 () Bool)

(assert (=> b!602648 (= c!68189 (= lt!274518 (select (arr!17845 a!2986) j!136)))))

(declare-fun b!602649 () Bool)

(assert (=> b!602649 (= e!344689 Undefined!6285)))

(declare-fun b!602651 () Bool)

(declare-fun c!68190 () Bool)

(assert (=> b!602651 (= c!68190 (= lt!274518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!344687 () SeekEntryResult!6285)

(assert (=> b!602651 (= e!344688 e!344687)))

(declare-fun b!602652 () Bool)

(assert (=> b!602652 (= e!344687 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!602653 () Bool)

(assert (=> b!602653 (= e!344688 (Found!6285 index!984))))

(declare-fun d!87327 () Bool)

(declare-fun lt!274517 () SeekEntryResult!6285)

(assert (=> d!87327 (and (or ((_ is Undefined!6285) lt!274517) (not ((_ is Found!6285) lt!274517)) (and (bvsge (index!27401 lt!274517) #b00000000000000000000000000000000) (bvslt (index!27401 lt!274517) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274517) ((_ is Found!6285) lt!274517) (not ((_ is MissingVacant!6285) lt!274517)) (not (= (index!27403 lt!274517) vacantSpotIndex!68)) (and (bvsge (index!27403 lt!274517) #b00000000000000000000000000000000) (bvslt (index!27403 lt!274517) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274517) (ite ((_ is Found!6285) lt!274517) (= (select (arr!17845 a!2986) (index!27401 lt!274517)) (select (arr!17845 a!2986) j!136)) (and ((_ is MissingVacant!6285) lt!274517) (= (index!27403 lt!274517) vacantSpotIndex!68) (= (select (arr!17845 a!2986) (index!27403 lt!274517)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87327 (= lt!274517 e!344689)))

(declare-fun c!68188 () Bool)

(assert (=> d!87327 (= c!68188 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87327 (= lt!274518 (select (arr!17845 a!2986) index!984))))

(assert (=> d!87327 (validMask!0 mask!3053)))

(assert (=> d!87327 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17845 a!2986) j!136) a!2986 mask!3053) lt!274517)))

(declare-fun b!602650 () Bool)

(assert (=> b!602650 (= e!344687 (MissingVacant!6285 vacantSpotIndex!68))))

(assert (= (and d!87327 c!68188) b!602649))

(assert (= (and d!87327 (not c!68188)) b!602648))

(assert (= (and b!602648 c!68189) b!602653))

(assert (= (and b!602648 (not c!68189)) b!602651))

(assert (= (and b!602651 c!68190) b!602650))

(assert (= (and b!602651 (not c!68190)) b!602652))

(assert (=> b!602652 m!579623))

(assert (=> b!602652 m!579623))

(assert (=> b!602652 m!579581))

(declare-fun m!579793 () Bool)

(assert (=> b!602652 m!579793))

(declare-fun m!579795 () Bool)

(assert (=> d!87327 m!579795))

(declare-fun m!579797 () Bool)

(assert (=> d!87327 m!579797))

(assert (=> d!87327 m!579599))

(assert (=> d!87327 m!579603))

(assert (=> b!602480 d!87327))

(declare-fun d!87331 () Bool)

(assert (=> d!87331 (= (validKeyInArray!0 (select (arr!17845 a!2986) j!136)) (and (not (= (select (arr!17845 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17845 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602470 d!87331))

(declare-fun b!602682 () Bool)

(declare-fun e!344711 () Bool)

(declare-fun call!33001 () Bool)

(assert (=> b!602682 (= e!344711 call!33001)))

(declare-fun bm!32998 () Bool)

(assert (=> bm!32998 (= call!33001 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!602683 () Bool)

(declare-fun e!344710 () Bool)

(assert (=> b!602683 (= e!344710 call!33001)))

(declare-fun b!602684 () Bool)

(assert (=> b!602684 (= e!344710 e!344711)))

(declare-fun lt!274540 () (_ BitVec 64))

(assert (=> b!602684 (= lt!274540 (select (arr!17845 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!274538 () Unit!19090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37174 (_ BitVec 64) (_ BitVec 32)) Unit!19090)

(assert (=> b!602684 (= lt!274538 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!274540 #b00000000000000000000000000000000))))

(assert (=> b!602684 (arrayContainsKey!0 a!2986 lt!274540 #b00000000000000000000000000000000)))

(declare-fun lt!274539 () Unit!19090)

(assert (=> b!602684 (= lt!274539 lt!274538)))

(declare-fun res!387017 () Bool)

(assert (=> b!602684 (= res!387017 (= (seekEntryOrOpen!0 (select (arr!17845 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6285 #b00000000000000000000000000000000)))))

(assert (=> b!602684 (=> (not res!387017) (not e!344711))))

(declare-fun d!87333 () Bool)

(declare-fun res!387016 () Bool)

(declare-fun e!344709 () Bool)

(assert (=> d!87333 (=> res!387016 e!344709)))

(assert (=> d!87333 (= res!387016 (bvsge #b00000000000000000000000000000000 (size!18209 a!2986)))))

(assert (=> d!87333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!344709)))

(declare-fun b!602685 () Bool)

(assert (=> b!602685 (= e!344709 e!344710)))

(declare-fun c!68200 () Bool)

(assert (=> b!602685 (= c!68200 (validKeyInArray!0 (select (arr!17845 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87333 (not res!387016)) b!602685))

(assert (= (and b!602685 c!68200) b!602684))

(assert (= (and b!602685 (not c!68200)) b!602683))

(assert (= (and b!602684 res!387017) b!602682))

(assert (= (or b!602682 b!602683) bm!32998))

(declare-fun m!579813 () Bool)

(assert (=> bm!32998 m!579813))

(declare-fun m!579815 () Bool)

(assert (=> b!602684 m!579815))

(declare-fun m!579817 () Bool)

(assert (=> b!602684 m!579817))

(declare-fun m!579819 () Bool)

(assert (=> b!602684 m!579819))

(assert (=> b!602684 m!579815))

(declare-fun m!579821 () Bool)

(assert (=> b!602684 m!579821))

(assert (=> b!602685 m!579815))

(assert (=> b!602685 m!579815))

(declare-fun m!579823 () Bool)

(assert (=> b!602685 m!579823))

(assert (=> b!602483 d!87333))

(declare-fun d!87341 () Bool)

(declare-fun res!387018 () Bool)

(declare-fun e!344715 () Bool)

(assert (=> d!87341 (=> res!387018 e!344715)))

(assert (=> d!87341 (= res!387018 (= (select (arr!17845 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87341 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!344715)))

(declare-fun b!602692 () Bool)

(declare-fun e!344716 () Bool)

(assert (=> b!602692 (= e!344715 e!344716)))

(declare-fun res!387019 () Bool)

(assert (=> b!602692 (=> (not res!387019) (not e!344716))))

(assert (=> b!602692 (= res!387019 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18209 a!2986)))))

(declare-fun b!602693 () Bool)

(assert (=> b!602693 (= e!344716 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87341 (not res!387018)) b!602692))

(assert (= (and b!602692 res!387019) b!602693))

(assert (=> d!87341 m!579815))

(declare-fun m!579829 () Bool)

(assert (=> b!602693 m!579829))

(assert (=> b!602473 d!87341))

(declare-fun d!87343 () Bool)

(assert (=> d!87343 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!602471 d!87343))

(assert (=> b!602482 d!87325))

(declare-fun d!87345 () Bool)

(assert (=> d!87345 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55020 d!87345))

(declare-fun d!87349 () Bool)

(assert (=> d!87349 (= (array_inv!13641 a!2986) (bvsge (size!18209 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55020 d!87349))

(declare-fun d!87351 () Bool)

(declare-fun res!387023 () Bool)

(declare-fun e!344720 () Bool)

(assert (=> d!87351 (=> res!387023 e!344720)))

(assert (=> d!87351 (= res!387023 (= (select (arr!17845 lt!274425) index!984) (select (arr!17845 a!2986) j!136)))))

(assert (=> d!87351 (= (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) index!984) e!344720)))

(declare-fun b!602697 () Bool)

(declare-fun e!344721 () Bool)

(assert (=> b!602697 (= e!344720 e!344721)))

(declare-fun res!387024 () Bool)

(assert (=> b!602697 (=> (not res!387024) (not e!344721))))

(assert (=> b!602697 (= res!387024 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18209 lt!274425)))))

(declare-fun b!602698 () Bool)

(assert (=> b!602698 (= e!344721 (arrayContainsKey!0 lt!274425 (select (arr!17845 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87351 (not res!387023)) b!602697))

(assert (= (and b!602697 res!387024) b!602698))

(assert (=> d!87351 m!579725))

(assert (=> b!602698 m!579581))

(declare-fun m!579845 () Bool)

(assert (=> b!602698 m!579845))

(assert (=> b!602484 d!87351))

(declare-fun b!602767 () Bool)

(declare-fun e!344757 () SeekEntryResult!6285)

(declare-fun lt!274581 () SeekEntryResult!6285)

(assert (=> b!602767 (= e!344757 (Found!6285 (index!27402 lt!274581)))))

(declare-fun d!87355 () Bool)

(declare-fun lt!274579 () SeekEntryResult!6285)

(assert (=> d!87355 (and (or ((_ is Undefined!6285) lt!274579) (not ((_ is Found!6285) lt!274579)) (and (bvsge (index!27401 lt!274579) #b00000000000000000000000000000000) (bvslt (index!27401 lt!274579) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274579) ((_ is Found!6285) lt!274579) (not ((_ is MissingZero!6285) lt!274579)) (and (bvsge (index!27400 lt!274579) #b00000000000000000000000000000000) (bvslt (index!27400 lt!274579) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274579) ((_ is Found!6285) lt!274579) ((_ is MissingZero!6285) lt!274579) (not ((_ is MissingVacant!6285) lt!274579)) (and (bvsge (index!27403 lt!274579) #b00000000000000000000000000000000) (bvslt (index!27403 lt!274579) (size!18209 a!2986)))) (or ((_ is Undefined!6285) lt!274579) (ite ((_ is Found!6285) lt!274579) (= (select (arr!17845 a!2986) (index!27401 lt!274579)) k0!1786) (ite ((_ is MissingZero!6285) lt!274579) (= (select (arr!17845 a!2986) (index!27400 lt!274579)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6285) lt!274579) (= (select (arr!17845 a!2986) (index!27403 lt!274579)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!344758 () SeekEntryResult!6285)

(assert (=> d!87355 (= lt!274579 e!344758)))

(declare-fun c!68239 () Bool)

(assert (=> d!87355 (= c!68239 (and ((_ is Intermediate!6285) lt!274581) (undefined!7097 lt!274581)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37174 (_ BitVec 32)) SeekEntryResult!6285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87355 (= lt!274581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87355 (validMask!0 mask!3053)))

(assert (=> d!87355 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!274579)))

(declare-fun b!602768 () Bool)

(assert (=> b!602768 (= e!344758 e!344757)))

(declare-fun lt!274580 () (_ BitVec 64))

(assert (=> b!602768 (= lt!274580 (select (arr!17845 a!2986) (index!27402 lt!274581)))))

(declare-fun c!68238 () Bool)

(assert (=> b!602768 (= c!68238 (= lt!274580 k0!1786))))

(declare-fun b!602769 () Bool)

(declare-fun e!344759 () SeekEntryResult!6285)

(assert (=> b!602769 (= e!344759 (MissingZero!6285 (index!27402 lt!274581)))))

(declare-fun b!602770 () Bool)

(assert (=> b!602770 (= e!344758 Undefined!6285)))

(declare-fun b!602771 () Bool)

(assert (=> b!602771 (= e!344759 (seekKeyOrZeroReturnVacant!0 (x!56197 lt!274581) (index!27402 lt!274581) (index!27402 lt!274581) k0!1786 a!2986 mask!3053))))

(declare-fun b!602772 () Bool)

(declare-fun c!68237 () Bool)

(assert (=> b!602772 (= c!68237 (= lt!274580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!602772 (= e!344757 e!344759)))

(assert (= (and d!87355 c!68239) b!602770))

(assert (= (and d!87355 (not c!68239)) b!602768))

(assert (= (and b!602768 c!68238) b!602767))

(assert (= (and b!602768 (not c!68238)) b!602772))

(assert (= (and b!602772 c!68237) b!602769))

(assert (= (and b!602772 (not c!68237)) b!602771))

(declare-fun m!579893 () Bool)

(assert (=> d!87355 m!579893))

(declare-fun m!579895 () Bool)

(assert (=> d!87355 m!579895))

(declare-fun m!579897 () Bool)

(assert (=> d!87355 m!579897))

(declare-fun m!579899 () Bool)

(assert (=> d!87355 m!579899))

(assert (=> d!87355 m!579603))

(assert (=> d!87355 m!579895))

(declare-fun m!579901 () Bool)

(assert (=> d!87355 m!579901))

(declare-fun m!579903 () Bool)

(assert (=> b!602768 m!579903))

(declare-fun m!579905 () Bool)

(assert (=> b!602771 m!579905))

(assert (=> b!602485 d!87355))

(declare-fun b!602776 () Bool)

(declare-fun e!344766 () Bool)

(declare-fun e!344764 () Bool)

(assert (=> b!602776 (= e!344766 e!344764)))

(declare-fun res!387029 () Bool)

(assert (=> b!602776 (=> (not res!387029) (not e!344764))))

(declare-fun e!344763 () Bool)

(assert (=> b!602776 (= res!387029 (not e!344763))))

(declare-fun res!387032 () Bool)

(assert (=> b!602776 (=> (not res!387032) (not e!344763))))

(assert (=> b!602776 (= res!387032 (validKeyInArray!0 (select (arr!17845 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33000 () Bool)

(declare-fun call!33003 () Bool)

(declare-fun c!68240 () Bool)

(assert (=> bm!33000 (= call!33003 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68240 (Cons!11882 (select (arr!17845 a!2986) #b00000000000000000000000000000000) Nil!11883) Nil!11883)))))

(declare-fun b!602780 () Bool)

(declare-fun e!344767 () Bool)

(assert (=> b!602780 (= e!344764 e!344767)))

(assert (=> b!602780 (= c!68240 (validKeyInArray!0 (select (arr!17845 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!602781 () Bool)

(assert (=> b!602781 (= e!344767 call!33003)))

(declare-fun b!602782 () Bool)

(assert (=> b!602782 (= e!344763 (contains!2989 Nil!11883 (select (arr!17845 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87372 () Bool)

(declare-fun res!387027 () Bool)

(assert (=> d!87372 (=> res!387027 e!344766)))

(assert (=> d!87372 (= res!387027 (bvsge #b00000000000000000000000000000000 (size!18209 a!2986)))))

(assert (=> d!87372 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11883) e!344766)))

(declare-fun b!602779 () Bool)

(assert (=> b!602779 (= e!344767 call!33003)))

(assert (= (and d!87372 (not res!387027)) b!602776))

(assert (= (and b!602776 res!387032) b!602782))

(assert (= (and b!602776 res!387029) b!602780))

(assert (= (and b!602780 c!68240) b!602779))

(assert (= (and b!602780 (not c!68240)) b!602781))

(assert (= (or b!602779 b!602781) bm!33000))

(assert (=> b!602776 m!579815))

(assert (=> b!602776 m!579815))

(assert (=> b!602776 m!579823))

(assert (=> bm!33000 m!579815))

(declare-fun m!579913 () Bool)

(assert (=> bm!33000 m!579913))

(assert (=> b!602780 m!579815))

(assert (=> b!602780 m!579815))

(assert (=> b!602780 m!579823))

(assert (=> b!602782 m!579815))

(assert (=> b!602782 m!579815))

(declare-fun m!579919 () Bool)

(assert (=> b!602782 m!579919))

(assert (=> b!602474 d!87372))

(check-sat (not d!87283) (not b!602581) (not d!87285) (not d!87289) (not b!602782) (not b!602604) (not b!602776) (not b!602780) (not d!87355) (not d!87327) (not b!602684) (not d!87281) (not bm!33000) (not b!602621) (not b!602771) (not bm!32991) (not b!602685) (not d!87317) (not b!602606) (not d!87287) (not b!602602) (not b!602591) (not b!602693) (not b!602647) (not b!602569) (not bm!32998) (not b!602625) (not d!87315) (not bm!32990) (not d!87299) (not b!602575) (not b!602645) (not d!87321) (not b!602698) (not b!602585) (not b!602652) (not b!602623))
(check-sat)
