; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55302 () Bool)

(assert start!55302)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37239 0))(
  ( (array!37240 (arr!17872 (Array (_ BitVec 32) (_ BitVec 64))) (size!18236 (_ BitVec 32))) )
))
(declare-fun lt!276295 () array!37239)

(declare-fun e!346573 () Bool)

(declare-fun b!605538 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37239)

(declare-fun arrayContainsKey!0 (array!37239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605538 (= e!346573 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) index!984))))

(declare-fun b!605539 () Bool)

(declare-fun e!346586 () Bool)

(declare-fun e!346578 () Bool)

(assert (=> b!605539 (= e!346586 e!346578)))

(declare-fun res!389063 () Bool)

(assert (=> b!605539 (=> (not res!389063) (not e!346578))))

(declare-datatypes ((SeekEntryResult!6268 0))(
  ( (MissingZero!6268 (index!27338 (_ BitVec 32))) (Found!6268 (index!27339 (_ BitVec 32))) (Intermediate!6268 (undefined!7080 Bool) (index!27340 (_ BitVec 32)) (x!56289 (_ BitVec 32))) (Undefined!6268) (MissingVacant!6268 (index!27341 (_ BitVec 32))) )
))
(declare-fun lt!276305 () SeekEntryResult!6268)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!605539 (= res!389063 (and (= lt!276305 (Found!6268 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17872 a!2986) index!984) (select (arr!17872 a!2986) j!136))) (not (= (select (arr!17872 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37239 (_ BitVec 32)) SeekEntryResult!6268)

(assert (=> b!605539 (= lt!276305 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605540 () Bool)

(declare-datatypes ((Unit!19261 0))(
  ( (Unit!19262) )
))
(declare-fun e!346575 () Unit!19261)

(declare-fun Unit!19263 () Unit!19261)

(assert (=> b!605540 (= e!346575 Unit!19263)))

(assert (=> b!605540 false))

(declare-fun b!605541 () Bool)

(declare-fun e!346577 () Bool)

(declare-fun e!346581 () Bool)

(assert (=> b!605541 (= e!346577 e!346581)))

(declare-fun res!389054 () Bool)

(assert (=> b!605541 (=> res!389054 e!346581)))

(declare-fun lt!276310 () (_ BitVec 64))

(declare-fun lt!276309 () (_ BitVec 64))

(assert (=> b!605541 (= res!389054 (or (not (= (select (arr!17872 a!2986) j!136) lt!276310)) (not (= (select (arr!17872 a!2986) j!136) lt!276309))))))

(declare-fun e!346579 () Bool)

(assert (=> b!605541 e!346579))

(declare-fun res!389055 () Bool)

(assert (=> b!605541 (=> (not res!389055) (not e!346579))))

(assert (=> b!605541 (= res!389055 (= lt!276309 (select (arr!17872 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!605541 (= lt!276309 (select (store (arr!17872 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!605542 () Bool)

(declare-fun res!389060 () Bool)

(declare-fun e!346582 () Bool)

(assert (=> b!605542 (=> (not res!389060) (not e!346582))))

(assert (=> b!605542 (= res!389060 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun e!346580 () Bool)

(declare-fun b!605543 () Bool)

(assert (=> b!605543 (= e!346580 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) index!984))))

(declare-fun res!389065 () Bool)

(assert (=> start!55302 (=> (not res!389065) (not e!346582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55302 (= res!389065 (validMask!0 mask!3053))))

(assert (=> start!55302 e!346582))

(assert (=> start!55302 true))

(declare-fun array_inv!13731 (array!37239) Bool)

(assert (=> start!55302 (array_inv!13731 a!2986)))

(declare-fun b!605544 () Bool)

(declare-fun res!389048 () Bool)

(assert (=> b!605544 (=> (not res!389048) (not e!346582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605544 (= res!389048 (validKeyInArray!0 (select (arr!17872 a!2986) j!136)))))

(declare-fun b!605545 () Bool)

(declare-fun e!346583 () Bool)

(assert (=> b!605545 (= e!346583 e!346573)))

(declare-fun res!389061 () Bool)

(assert (=> b!605545 (=> (not res!389061) (not e!346573))))

(assert (=> b!605545 (= res!389061 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136))))

(declare-fun b!605546 () Bool)

(declare-fun Unit!19264 () Unit!19261)

(assert (=> b!605546 (= e!346575 Unit!19264)))

(declare-fun b!605547 () Bool)

(declare-fun res!389049 () Bool)

(assert (=> b!605547 (=> (not res!389049) (not e!346582))))

(assert (=> b!605547 (= res!389049 (and (= (size!18236 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18236 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605548 () Bool)

(declare-fun res!389056 () Bool)

(assert (=> b!605548 (=> (not res!389056) (not e!346582))))

(assert (=> b!605548 (= res!389056 (validKeyInArray!0 k0!1786))))

(declare-fun b!605549 () Bool)

(declare-fun e!346574 () Bool)

(assert (=> b!605549 (= e!346582 e!346574)))

(declare-fun res!389047 () Bool)

(assert (=> b!605549 (=> (not res!389047) (not e!346574))))

(declare-fun lt!276296 () SeekEntryResult!6268)

(assert (=> b!605549 (= res!389047 (or (= lt!276296 (MissingZero!6268 i!1108)) (= lt!276296 (MissingVacant!6268 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37239 (_ BitVec 32)) SeekEntryResult!6268)

(assert (=> b!605549 (= lt!276296 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605550 () Bool)

(declare-fun res!389057 () Bool)

(assert (=> b!605550 (=> (not res!389057) (not e!346574))))

(assert (=> b!605550 (= res!389057 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17872 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605551 () Bool)

(declare-fun res!389052 () Bool)

(assert (=> b!605551 (=> (not res!389052) (not e!346574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37239 (_ BitVec 32)) Bool)

(assert (=> b!605551 (= res!389052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605552 () Bool)

(assert (=> b!605552 (= e!346574 e!346586)))

(declare-fun res!389058 () Bool)

(assert (=> b!605552 (=> (not res!389058) (not e!346586))))

(assert (=> b!605552 (= res!389058 (= (select (store (arr!17872 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605552 (= lt!276295 (array!37240 (store (arr!17872 a!2986) i!1108 k0!1786) (size!18236 a!2986)))))

(declare-fun b!605553 () Bool)

(declare-fun e!346576 () Unit!19261)

(declare-fun Unit!19265 () Unit!19261)

(assert (=> b!605553 (= e!346576 Unit!19265)))

(declare-fun lt!276302 () Unit!19261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19261)

(assert (=> b!605553 (= lt!276302 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276295 (select (arr!17872 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605553 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276303 () Unit!19261)

(declare-datatypes ((List!11820 0))(
  ( (Nil!11817) (Cons!11816 (h!12864 (_ BitVec 64)) (t!18040 List!11820)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11820) Unit!19261)

(assert (=> b!605553 (= lt!276303 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11817))))

(declare-fun arrayNoDuplicates!0 (array!37239 (_ BitVec 32) List!11820) Bool)

(assert (=> b!605553 (arrayNoDuplicates!0 lt!276295 #b00000000000000000000000000000000 Nil!11817)))

(declare-fun lt!276301 () Unit!19261)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37239 (_ BitVec 32) (_ BitVec 32)) Unit!19261)

(assert (=> b!605553 (= lt!276301 (lemmaNoDuplicateFromThenFromBigger!0 lt!276295 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605553 (arrayNoDuplicates!0 lt!276295 j!136 Nil!11817)))

(declare-fun lt!276297 () Unit!19261)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37239 (_ BitVec 64) (_ BitVec 32) List!11820) Unit!19261)

(assert (=> b!605553 (= lt!276297 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136 Nil!11817))))

(assert (=> b!605553 false))

(declare-fun b!605554 () Bool)

(assert (=> b!605554 (= e!346578 (not e!346577))))

(declare-fun res!389064 () Bool)

(assert (=> b!605554 (=> res!389064 e!346577)))

(declare-fun lt!276304 () SeekEntryResult!6268)

(assert (=> b!605554 (= res!389064 (not (= lt!276304 (Found!6268 index!984))))))

(declare-fun lt!276300 () Unit!19261)

(assert (=> b!605554 (= lt!276300 e!346575)))

(declare-fun c!68615 () Bool)

(assert (=> b!605554 (= c!68615 (= lt!276304 Undefined!6268))))

(assert (=> b!605554 (= lt!276304 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276310 lt!276295 mask!3053))))

(declare-fun e!346584 () Bool)

(assert (=> b!605554 e!346584))

(declare-fun res!389059 () Bool)

(assert (=> b!605554 (=> (not res!389059) (not e!346584))))

(declare-fun lt!276307 () (_ BitVec 32))

(declare-fun lt!276299 () SeekEntryResult!6268)

(assert (=> b!605554 (= res!389059 (= lt!276299 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 lt!276310 lt!276295 mask!3053)))))

(assert (=> b!605554 (= lt!276299 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605554 (= lt!276310 (select (store (arr!17872 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276306 () Unit!19261)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37239 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19261)

(assert (=> b!605554 (= lt!276306 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605554 (= lt!276307 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!605555 () Bool)

(declare-fun res!389051 () Bool)

(assert (=> b!605555 (=> (not res!389051) (not e!346574))))

(assert (=> b!605555 (= res!389051 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11817))))

(declare-fun b!605556 () Bool)

(declare-fun Unit!19266 () Unit!19261)

(assert (=> b!605556 (= e!346576 Unit!19266)))

(declare-fun b!605557 () Bool)

(assert (=> b!605557 (= e!346584 (= lt!276305 lt!276299))))

(declare-fun b!605558 () Bool)

(assert (=> b!605558 (= e!346579 e!346583)))

(declare-fun res!389062 () Bool)

(assert (=> b!605558 (=> res!389062 e!346583)))

(assert (=> b!605558 (= res!389062 (or (not (= (select (arr!17872 a!2986) j!136) lt!276310)) (not (= (select (arr!17872 a!2986) j!136) lt!276309)) (bvsge j!136 index!984)))))

(declare-fun b!605559 () Bool)

(declare-fun e!346585 () Bool)

(assert (=> b!605559 (= e!346581 e!346585)))

(declare-fun res!389053 () Bool)

(assert (=> b!605559 (=> res!389053 e!346585)))

(assert (=> b!605559 (= res!389053 (bvsge index!984 j!136))))

(declare-fun lt!276308 () Unit!19261)

(assert (=> b!605559 (= lt!276308 e!346576)))

(declare-fun c!68614 () Bool)

(assert (=> b!605559 (= c!68614 (bvslt j!136 index!984))))

(declare-fun b!605560 () Bool)

(assert (=> b!605560 (= e!346585 (or (bvsgt #b00000000000000000000000000000000 (size!18236 a!2986)) (bvslt (size!18236 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605560 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276298 () Unit!19261)

(assert (=> b!605560 (= lt!276298 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605560 e!346580))

(declare-fun res!389050 () Bool)

(assert (=> b!605560 (=> (not res!389050) (not e!346580))))

(assert (=> b!605560 (= res!389050 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136))))

(assert (= (and start!55302 res!389065) b!605547))

(assert (= (and b!605547 res!389049) b!605544))

(assert (= (and b!605544 res!389048) b!605548))

(assert (= (and b!605548 res!389056) b!605542))

(assert (= (and b!605542 res!389060) b!605549))

(assert (= (and b!605549 res!389047) b!605551))

(assert (= (and b!605551 res!389052) b!605555))

(assert (= (and b!605555 res!389051) b!605550))

(assert (= (and b!605550 res!389057) b!605552))

(assert (= (and b!605552 res!389058) b!605539))

(assert (= (and b!605539 res!389063) b!605554))

(assert (= (and b!605554 res!389059) b!605557))

(assert (= (and b!605554 c!68615) b!605540))

(assert (= (and b!605554 (not c!68615)) b!605546))

(assert (= (and b!605554 (not res!389064)) b!605541))

(assert (= (and b!605541 res!389055) b!605558))

(assert (= (and b!605558 (not res!389062)) b!605545))

(assert (= (and b!605545 res!389061) b!605538))

(assert (= (and b!605541 (not res!389054)) b!605559))

(assert (= (and b!605559 c!68614) b!605553))

(assert (= (and b!605559 (not c!68614)) b!605556))

(assert (= (and b!605559 (not res!389053)) b!605560))

(assert (= (and b!605560 res!389050) b!605543))

(declare-fun m!582641 () Bool)

(assert (=> b!605552 m!582641))

(declare-fun m!582643 () Bool)

(assert (=> b!605552 m!582643))

(declare-fun m!582645 () Bool)

(assert (=> b!605555 m!582645))

(declare-fun m!582647 () Bool)

(assert (=> b!605549 m!582647))

(declare-fun m!582649 () Bool)

(assert (=> b!605554 m!582649))

(declare-fun m!582651 () Bool)

(assert (=> b!605554 m!582651))

(declare-fun m!582653 () Bool)

(assert (=> b!605554 m!582653))

(assert (=> b!605554 m!582641))

(declare-fun m!582655 () Bool)

(assert (=> b!605554 m!582655))

(declare-fun m!582657 () Bool)

(assert (=> b!605554 m!582657))

(declare-fun m!582659 () Bool)

(assert (=> b!605554 m!582659))

(assert (=> b!605554 m!582653))

(declare-fun m!582661 () Bool)

(assert (=> b!605554 m!582661))

(assert (=> b!605543 m!582653))

(assert (=> b!605543 m!582653))

(declare-fun m!582663 () Bool)

(assert (=> b!605543 m!582663))

(assert (=> b!605538 m!582653))

(assert (=> b!605538 m!582653))

(assert (=> b!605538 m!582663))

(declare-fun m!582665 () Bool)

(assert (=> b!605542 m!582665))

(assert (=> b!605541 m!582653))

(assert (=> b!605541 m!582641))

(declare-fun m!582667 () Bool)

(assert (=> b!605541 m!582667))

(declare-fun m!582669 () Bool)

(assert (=> b!605539 m!582669))

(assert (=> b!605539 m!582653))

(assert (=> b!605539 m!582653))

(declare-fun m!582671 () Bool)

(assert (=> b!605539 m!582671))

(declare-fun m!582673 () Bool)

(assert (=> start!55302 m!582673))

(declare-fun m!582675 () Bool)

(assert (=> start!55302 m!582675))

(declare-fun m!582677 () Bool)

(assert (=> b!605548 m!582677))

(assert (=> b!605560 m!582653))

(assert (=> b!605560 m!582653))

(declare-fun m!582679 () Bool)

(assert (=> b!605560 m!582679))

(assert (=> b!605560 m!582653))

(declare-fun m!582681 () Bool)

(assert (=> b!605560 m!582681))

(assert (=> b!605560 m!582653))

(declare-fun m!582683 () Bool)

(assert (=> b!605560 m!582683))

(assert (=> b!605558 m!582653))

(assert (=> b!605553 m!582653))

(declare-fun m!582685 () Bool)

(assert (=> b!605553 m!582685))

(assert (=> b!605553 m!582653))

(declare-fun m!582687 () Bool)

(assert (=> b!605553 m!582687))

(declare-fun m!582689 () Bool)

(assert (=> b!605553 m!582689))

(declare-fun m!582691 () Bool)

(assert (=> b!605553 m!582691))

(assert (=> b!605553 m!582653))

(declare-fun m!582693 () Bool)

(assert (=> b!605553 m!582693))

(assert (=> b!605553 m!582653))

(declare-fun m!582695 () Bool)

(assert (=> b!605553 m!582695))

(declare-fun m!582697 () Bool)

(assert (=> b!605553 m!582697))

(assert (=> b!605545 m!582653))

(assert (=> b!605545 m!582653))

(assert (=> b!605545 m!582683))

(declare-fun m!582699 () Bool)

(assert (=> b!605551 m!582699))

(declare-fun m!582701 () Bool)

(assert (=> b!605550 m!582701))

(assert (=> b!605544 m!582653))

(assert (=> b!605544 m!582653))

(declare-fun m!582703 () Bool)

(assert (=> b!605544 m!582703))

(check-sat (not b!605555) (not b!605560) (not b!605549) (not b!605538) (not b!605554) (not b!605545) (not b!605544) (not start!55302) (not b!605539) (not b!605542) (not b!605548) (not b!605553) (not b!605551) (not b!605543))
(check-sat)
(get-model)

(declare-fun d!87703 () Bool)

(declare-fun res!389184 () Bool)

(declare-fun e!346682 () Bool)

(assert (=> d!87703 (=> res!389184 e!346682)))

(assert (=> d!87703 (= res!389184 (= (select (arr!17872 lt!276295) j!136) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87703 (= (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136) e!346682)))

(declare-fun b!605703 () Bool)

(declare-fun e!346683 () Bool)

(assert (=> b!605703 (= e!346682 e!346683)))

(declare-fun res!389185 () Bool)

(assert (=> b!605703 (=> (not res!389185) (not e!346683))))

(assert (=> b!605703 (= res!389185 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18236 lt!276295)))))

(declare-fun b!605704 () Bool)

(assert (=> b!605704 (= e!346683 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87703 (not res!389184)) b!605703))

(assert (= (and b!605703 res!389185) b!605704))

(declare-fun m!582833 () Bool)

(assert (=> d!87703 m!582833))

(assert (=> b!605704 m!582653))

(declare-fun m!582835 () Bool)

(assert (=> b!605704 m!582835))

(assert (=> b!605545 d!87703))

(declare-fun d!87705 () Bool)

(declare-fun res!389193 () Bool)

(declare-fun e!346693 () Bool)

(assert (=> d!87705 (=> res!389193 e!346693)))

(assert (=> d!87705 (= res!389193 (bvsge #b00000000000000000000000000000000 (size!18236 a!2986)))))

(assert (=> d!87705 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11817) e!346693)))

(declare-fun b!605715 () Bool)

(declare-fun e!346692 () Bool)

(declare-fun call!33045 () Bool)

(assert (=> b!605715 (= e!346692 call!33045)))

(declare-fun b!605716 () Bool)

(declare-fun e!346694 () Bool)

(declare-fun contains!2970 (List!11820 (_ BitVec 64)) Bool)

(assert (=> b!605716 (= e!346694 (contains!2970 Nil!11817 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605717 () Bool)

(assert (=> b!605717 (= e!346692 call!33045)))

(declare-fun bm!33042 () Bool)

(declare-fun c!68630 () Bool)

(assert (=> bm!33042 (= call!33045 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68630 (Cons!11816 (select (arr!17872 a!2986) #b00000000000000000000000000000000) Nil!11817) Nil!11817)))))

(declare-fun b!605718 () Bool)

(declare-fun e!346695 () Bool)

(assert (=> b!605718 (= e!346693 e!346695)))

(declare-fun res!389194 () Bool)

(assert (=> b!605718 (=> (not res!389194) (not e!346695))))

(assert (=> b!605718 (= res!389194 (not e!346694))))

(declare-fun res!389192 () Bool)

(assert (=> b!605718 (=> (not res!389192) (not e!346694))))

(assert (=> b!605718 (= res!389192 (validKeyInArray!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605719 () Bool)

(assert (=> b!605719 (= e!346695 e!346692)))

(assert (=> b!605719 (= c!68630 (validKeyInArray!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87705 (not res!389193)) b!605718))

(assert (= (and b!605718 res!389192) b!605716))

(assert (= (and b!605718 res!389194) b!605719))

(assert (= (and b!605719 c!68630) b!605715))

(assert (= (and b!605719 (not c!68630)) b!605717))

(assert (= (or b!605715 b!605717) bm!33042))

(declare-fun m!582837 () Bool)

(assert (=> b!605716 m!582837))

(assert (=> b!605716 m!582837))

(declare-fun m!582839 () Bool)

(assert (=> b!605716 m!582839))

(assert (=> bm!33042 m!582837))

(declare-fun m!582841 () Bool)

(assert (=> bm!33042 m!582841))

(assert (=> b!605718 m!582837))

(assert (=> b!605718 m!582837))

(declare-fun m!582843 () Bool)

(assert (=> b!605718 m!582843))

(assert (=> b!605719 m!582837))

(assert (=> b!605719 m!582837))

(assert (=> b!605719 m!582843))

(assert (=> b!605555 d!87705))

(declare-fun d!87707 () Bool)

(declare-fun res!389195 () Bool)

(declare-fun e!346696 () Bool)

(assert (=> d!87707 (=> res!389195 e!346696)))

(assert (=> d!87707 (= res!389195 (= (select (arr!17872 lt!276295) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87707 (= (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346696)))

(declare-fun b!605720 () Bool)

(declare-fun e!346697 () Bool)

(assert (=> b!605720 (= e!346696 e!346697)))

(declare-fun res!389196 () Bool)

(assert (=> b!605720 (=> (not res!389196) (not e!346697))))

(assert (=> b!605720 (= res!389196 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18236 lt!276295)))))

(declare-fun b!605721 () Bool)

(assert (=> b!605721 (= e!346697 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87707 (not res!389195)) b!605720))

(assert (= (and b!605720 res!389196) b!605721))

(declare-fun m!582845 () Bool)

(assert (=> d!87707 m!582845))

(assert (=> b!605721 m!582653))

(declare-fun m!582847 () Bool)

(assert (=> b!605721 m!582847))

(assert (=> b!605560 d!87707))

(declare-fun d!87709 () Bool)

(assert (=> d!87709 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276409 () Unit!19261)

(declare-fun choose!114 (array!37239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19261)

(assert (=> d!87709 (= lt!276409 (choose!114 lt!276295 (select (arr!17872 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87709 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87709 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276409)))

(declare-fun bs!18539 () Bool)

(assert (= bs!18539 d!87709))

(assert (=> bs!18539 m!582653))

(assert (=> bs!18539 m!582679))

(assert (=> bs!18539 m!582653))

(declare-fun m!582849 () Bool)

(assert (=> bs!18539 m!582849))

(assert (=> b!605560 d!87709))

(assert (=> b!605560 d!87703))

(declare-fun b!605734 () Bool)

(declare-fun c!68638 () Bool)

(declare-fun lt!276417 () (_ BitVec 64))

(assert (=> b!605734 (= c!68638 (= lt!276417 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346705 () SeekEntryResult!6268)

(declare-fun e!346706 () SeekEntryResult!6268)

(assert (=> b!605734 (= e!346705 e!346706)))

(declare-fun b!605735 () Bool)

(declare-fun lt!276418 () SeekEntryResult!6268)

(assert (=> b!605735 (= e!346705 (Found!6268 (index!27340 lt!276418)))))

(declare-fun b!605736 () Bool)

(assert (=> b!605736 (= e!346706 (seekKeyOrZeroReturnVacant!0 (x!56289 lt!276418) (index!27340 lt!276418) (index!27340 lt!276418) k0!1786 a!2986 mask!3053))))

(declare-fun b!605737 () Bool)

(assert (=> b!605737 (= e!346706 (MissingZero!6268 (index!27340 lt!276418)))))

(declare-fun b!605738 () Bool)

(declare-fun e!346704 () SeekEntryResult!6268)

(assert (=> b!605738 (= e!346704 Undefined!6268)))

(declare-fun d!87711 () Bool)

(declare-fun lt!276416 () SeekEntryResult!6268)

(get-info :version)

(assert (=> d!87711 (and (or ((_ is Undefined!6268) lt!276416) (not ((_ is Found!6268) lt!276416)) (and (bvsge (index!27339 lt!276416) #b00000000000000000000000000000000) (bvslt (index!27339 lt!276416) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276416) ((_ is Found!6268) lt!276416) (not ((_ is MissingZero!6268) lt!276416)) (and (bvsge (index!27338 lt!276416) #b00000000000000000000000000000000) (bvslt (index!27338 lt!276416) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276416) ((_ is Found!6268) lt!276416) ((_ is MissingZero!6268) lt!276416) (not ((_ is MissingVacant!6268) lt!276416)) (and (bvsge (index!27341 lt!276416) #b00000000000000000000000000000000) (bvslt (index!27341 lt!276416) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276416) (ite ((_ is Found!6268) lt!276416) (= (select (arr!17872 a!2986) (index!27339 lt!276416)) k0!1786) (ite ((_ is MissingZero!6268) lt!276416) (= (select (arr!17872 a!2986) (index!27338 lt!276416)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6268) lt!276416) (= (select (arr!17872 a!2986) (index!27341 lt!276416)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87711 (= lt!276416 e!346704)))

(declare-fun c!68639 () Bool)

(assert (=> d!87711 (= c!68639 (and ((_ is Intermediate!6268) lt!276418) (undefined!7080 lt!276418)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37239 (_ BitVec 32)) SeekEntryResult!6268)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87711 (= lt!276418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87711 (validMask!0 mask!3053)))

(assert (=> d!87711 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276416)))

(declare-fun b!605739 () Bool)

(assert (=> b!605739 (= e!346704 e!346705)))

(assert (=> b!605739 (= lt!276417 (select (arr!17872 a!2986) (index!27340 lt!276418)))))

(declare-fun c!68637 () Bool)

(assert (=> b!605739 (= c!68637 (= lt!276417 k0!1786))))

(assert (= (and d!87711 c!68639) b!605738))

(assert (= (and d!87711 (not c!68639)) b!605739))

(assert (= (and b!605739 c!68637) b!605735))

(assert (= (and b!605739 (not c!68637)) b!605734))

(assert (= (and b!605734 c!68638) b!605737))

(assert (= (and b!605734 (not c!68638)) b!605736))

(declare-fun m!582851 () Bool)

(assert (=> b!605736 m!582851))

(declare-fun m!582853 () Bool)

(assert (=> d!87711 m!582853))

(assert (=> d!87711 m!582673))

(declare-fun m!582855 () Bool)

(assert (=> d!87711 m!582855))

(declare-fun m!582857 () Bool)

(assert (=> d!87711 m!582857))

(assert (=> d!87711 m!582853))

(declare-fun m!582859 () Bool)

(assert (=> d!87711 m!582859))

(declare-fun m!582861 () Bool)

(assert (=> d!87711 m!582861))

(declare-fun m!582863 () Bool)

(assert (=> b!605739 m!582863))

(assert (=> b!605549 d!87711))

(declare-fun d!87713 () Bool)

(declare-fun res!389197 () Bool)

(declare-fun e!346707 () Bool)

(assert (=> d!87713 (=> res!389197 e!346707)))

(assert (=> d!87713 (= res!389197 (= (select (arr!17872 lt!276295) index!984) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87713 (= (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) index!984) e!346707)))

(declare-fun b!605740 () Bool)

(declare-fun e!346708 () Bool)

(assert (=> b!605740 (= e!346707 e!346708)))

(declare-fun res!389198 () Bool)

(assert (=> b!605740 (=> (not res!389198) (not e!346708))))

(assert (=> b!605740 (= res!389198 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18236 lt!276295)))))

(declare-fun b!605741 () Bool)

(assert (=> b!605741 (= e!346708 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87713 (not res!389197)) b!605740))

(assert (= (and b!605740 res!389198) b!605741))

(declare-fun m!582865 () Bool)

(assert (=> d!87713 m!582865))

(assert (=> b!605741 m!582653))

(declare-fun m!582867 () Bool)

(assert (=> b!605741 m!582867))

(assert (=> b!605538 d!87713))

(declare-fun d!87715 () Bool)

(assert (=> d!87715 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55302 d!87715))

(declare-fun d!87717 () Bool)

(assert (=> d!87717 (= (array_inv!13731 a!2986) (bvsge (size!18236 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55302 d!87717))

(declare-fun d!87719 () Bool)

(assert (=> d!87719 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605548 d!87719))

(declare-fun b!605758 () Bool)

(declare-fun e!346724 () Bool)

(declare-fun e!346723 () Bool)

(assert (=> b!605758 (= e!346724 e!346723)))

(declare-fun lt!276426 () (_ BitVec 64))

(assert (=> b!605758 (= lt!276426 (select (arr!17872 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276425 () Unit!19261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37239 (_ BitVec 64) (_ BitVec 32)) Unit!19261)

(assert (=> b!605758 (= lt!276425 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276426 #b00000000000000000000000000000000))))

(assert (=> b!605758 (arrayContainsKey!0 a!2986 lt!276426 #b00000000000000000000000000000000)))

(declare-fun lt!276427 () Unit!19261)

(assert (=> b!605758 (= lt!276427 lt!276425)))

(declare-fun res!389212 () Bool)

(assert (=> b!605758 (= res!389212 (= (seekEntryOrOpen!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6268 #b00000000000000000000000000000000)))))

(assert (=> b!605758 (=> (not res!389212) (not e!346723))))

(declare-fun b!605759 () Bool)

(declare-fun call!33048 () Bool)

(assert (=> b!605759 (= e!346724 call!33048)))

(declare-fun d!87721 () Bool)

(declare-fun res!389211 () Bool)

(declare-fun e!346725 () Bool)

(assert (=> d!87721 (=> res!389211 e!346725)))

(assert (=> d!87721 (= res!389211 (bvsge #b00000000000000000000000000000000 (size!18236 a!2986)))))

(assert (=> d!87721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346725)))

(declare-fun b!605760 () Bool)

(assert (=> b!605760 (= e!346723 call!33048)))

(declare-fun bm!33045 () Bool)

(assert (=> bm!33045 (= call!33048 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!605761 () Bool)

(assert (=> b!605761 (= e!346725 e!346724)))

(declare-fun c!68642 () Bool)

(assert (=> b!605761 (= c!68642 (validKeyInArray!0 (select (arr!17872 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!87721 (not res!389211)) b!605761))

(assert (= (and b!605761 c!68642) b!605758))

(assert (= (and b!605761 (not c!68642)) b!605759))

(assert (= (and b!605758 res!389212) b!605760))

(assert (= (or b!605760 b!605759) bm!33045))

(assert (=> b!605758 m!582837))

(declare-fun m!582877 () Bool)

(assert (=> b!605758 m!582877))

(declare-fun m!582879 () Bool)

(assert (=> b!605758 m!582879))

(assert (=> b!605758 m!582837))

(declare-fun m!582881 () Bool)

(assert (=> b!605758 m!582881))

(declare-fun m!582883 () Bool)

(assert (=> bm!33045 m!582883))

(assert (=> b!605761 m!582837))

(assert (=> b!605761 m!582837))

(assert (=> b!605761 m!582843))

(assert (=> b!605551 d!87721))

(declare-fun b!605816 () Bool)

(declare-fun e!346769 () SeekEntryResult!6268)

(assert (=> b!605816 (= e!346769 (Found!6268 index!984))))

(declare-fun b!605817 () Bool)

(declare-fun c!68656 () Bool)

(declare-fun lt!276454 () (_ BitVec 64))

(assert (=> b!605817 (= c!68656 (= lt!276454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346767 () SeekEntryResult!6268)

(assert (=> b!605817 (= e!346769 e!346767)))

(declare-fun b!605818 () Bool)

(declare-fun e!346768 () SeekEntryResult!6268)

(assert (=> b!605818 (= e!346768 Undefined!6268)))

(declare-fun b!605820 () Bool)

(assert (=> b!605820 (= e!346767 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605821 () Bool)

(assert (=> b!605821 (= e!346767 (MissingVacant!6268 vacantSpotIndex!68))))

(declare-fun d!87731 () Bool)

(declare-fun lt!276453 () SeekEntryResult!6268)

(assert (=> d!87731 (and (or ((_ is Undefined!6268) lt!276453) (not ((_ is Found!6268) lt!276453)) (and (bvsge (index!27339 lt!276453) #b00000000000000000000000000000000) (bvslt (index!27339 lt!276453) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276453) ((_ is Found!6268) lt!276453) (not ((_ is MissingVacant!6268) lt!276453)) (not (= (index!27341 lt!276453) vacantSpotIndex!68)) (and (bvsge (index!27341 lt!276453) #b00000000000000000000000000000000) (bvslt (index!27341 lt!276453) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276453) (ite ((_ is Found!6268) lt!276453) (= (select (arr!17872 a!2986) (index!27339 lt!276453)) (select (arr!17872 a!2986) j!136)) (and ((_ is MissingVacant!6268) lt!276453) (= (index!27341 lt!276453) vacantSpotIndex!68) (= (select (arr!17872 a!2986) (index!27341 lt!276453)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87731 (= lt!276453 e!346768)))

(declare-fun c!68658 () Bool)

(assert (=> d!87731 (= c!68658 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87731 (= lt!276454 (select (arr!17872 a!2986) index!984))))

(assert (=> d!87731 (validMask!0 mask!3053)))

(assert (=> d!87731 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053) lt!276453)))

(declare-fun b!605819 () Bool)

(assert (=> b!605819 (= e!346768 e!346769)))

(declare-fun c!68657 () Bool)

(assert (=> b!605819 (= c!68657 (= lt!276454 (select (arr!17872 a!2986) j!136)))))

(assert (= (and d!87731 c!68658) b!605818))

(assert (= (and d!87731 (not c!68658)) b!605819))

(assert (= (and b!605819 c!68657) b!605816))

(assert (= (and b!605819 (not c!68657)) b!605817))

(assert (= (and b!605817 c!68656) b!605821))

(assert (= (and b!605817 (not c!68656)) b!605820))

(declare-fun m!582931 () Bool)

(assert (=> b!605820 m!582931))

(assert (=> b!605820 m!582931))

(assert (=> b!605820 m!582653))

(declare-fun m!582933 () Bool)

(assert (=> b!605820 m!582933))

(declare-fun m!582935 () Bool)

(assert (=> d!87731 m!582935))

(declare-fun m!582937 () Bool)

(assert (=> d!87731 m!582937))

(assert (=> d!87731 m!582669))

(assert (=> d!87731 m!582673))

(assert (=> b!605539 d!87731))

(declare-fun d!87759 () Bool)

(assert (=> d!87759 (= (validKeyInArray!0 (select (arr!17872 a!2986) j!136)) (and (not (= (select (arr!17872 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17872 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605544 d!87759))

(declare-fun b!605829 () Bool)

(declare-fun e!346778 () SeekEntryResult!6268)

(assert (=> b!605829 (= e!346778 (Found!6268 index!984))))

(declare-fun b!605830 () Bool)

(declare-fun c!68660 () Bool)

(declare-fun lt!276456 () (_ BitVec 64))

(assert (=> b!605830 (= c!68660 (= lt!276456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346776 () SeekEntryResult!6268)

(assert (=> b!605830 (= e!346778 e!346776)))

(declare-fun b!605831 () Bool)

(declare-fun e!346777 () SeekEntryResult!6268)

(assert (=> b!605831 (= e!346777 Undefined!6268)))

(declare-fun b!605833 () Bool)

(assert (=> b!605833 (= e!346776 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!276310 lt!276295 mask!3053))))

(declare-fun b!605834 () Bool)

(assert (=> b!605834 (= e!346776 (MissingVacant!6268 vacantSpotIndex!68))))

(declare-fun lt!276455 () SeekEntryResult!6268)

(declare-fun d!87763 () Bool)

(assert (=> d!87763 (and (or ((_ is Undefined!6268) lt!276455) (not ((_ is Found!6268) lt!276455)) (and (bvsge (index!27339 lt!276455) #b00000000000000000000000000000000) (bvslt (index!27339 lt!276455) (size!18236 lt!276295)))) (or ((_ is Undefined!6268) lt!276455) ((_ is Found!6268) lt!276455) (not ((_ is MissingVacant!6268) lt!276455)) (not (= (index!27341 lt!276455) vacantSpotIndex!68)) (and (bvsge (index!27341 lt!276455) #b00000000000000000000000000000000) (bvslt (index!27341 lt!276455) (size!18236 lt!276295)))) (or ((_ is Undefined!6268) lt!276455) (ite ((_ is Found!6268) lt!276455) (= (select (arr!17872 lt!276295) (index!27339 lt!276455)) lt!276310) (and ((_ is MissingVacant!6268) lt!276455) (= (index!27341 lt!276455) vacantSpotIndex!68) (= (select (arr!17872 lt!276295) (index!27341 lt!276455)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87763 (= lt!276455 e!346777)))

(declare-fun c!68662 () Bool)

(assert (=> d!87763 (= c!68662 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87763 (= lt!276456 (select (arr!17872 lt!276295) index!984))))

(assert (=> d!87763 (validMask!0 mask!3053)))

(assert (=> d!87763 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276310 lt!276295 mask!3053) lt!276455)))

(declare-fun b!605832 () Bool)

(assert (=> b!605832 (= e!346777 e!346778)))

(declare-fun c!68661 () Bool)

(assert (=> b!605832 (= c!68661 (= lt!276456 lt!276310))))

(assert (= (and d!87763 c!68662) b!605831))

(assert (= (and d!87763 (not c!68662)) b!605832))

(assert (= (and b!605832 c!68661) b!605829))

(assert (= (and b!605832 (not c!68661)) b!605830))

(assert (= (and b!605830 c!68660) b!605834))

(assert (= (and b!605830 (not c!68660)) b!605833))

(assert (=> b!605833 m!582931))

(assert (=> b!605833 m!582931))

(declare-fun m!582945 () Bool)

(assert (=> b!605833 m!582945))

(declare-fun m!582947 () Bool)

(assert (=> d!87763 m!582947))

(declare-fun m!582949 () Bool)

(assert (=> d!87763 m!582949))

(assert (=> d!87763 m!582865))

(assert (=> d!87763 m!582673))

(assert (=> b!605554 d!87763))

(declare-fun b!605835 () Bool)

(declare-fun e!346781 () SeekEntryResult!6268)

(assert (=> b!605835 (= e!346781 (Found!6268 lt!276307))))

(declare-fun b!605836 () Bool)

(declare-fun c!68663 () Bool)

(declare-fun lt!276458 () (_ BitVec 64))

(assert (=> b!605836 (= c!68663 (= lt!276458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346779 () SeekEntryResult!6268)

(assert (=> b!605836 (= e!346781 e!346779)))

(declare-fun b!605837 () Bool)

(declare-fun e!346780 () SeekEntryResult!6268)

(assert (=> b!605837 (= e!346780 Undefined!6268)))

(declare-fun b!605839 () Bool)

(assert (=> b!605839 (= e!346779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276307 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!276310 lt!276295 mask!3053))))

(declare-fun b!605840 () Bool)

(assert (=> b!605840 (= e!346779 (MissingVacant!6268 vacantSpotIndex!68))))

(declare-fun lt!276457 () SeekEntryResult!6268)

(declare-fun d!87765 () Bool)

(assert (=> d!87765 (and (or ((_ is Undefined!6268) lt!276457) (not ((_ is Found!6268) lt!276457)) (and (bvsge (index!27339 lt!276457) #b00000000000000000000000000000000) (bvslt (index!27339 lt!276457) (size!18236 lt!276295)))) (or ((_ is Undefined!6268) lt!276457) ((_ is Found!6268) lt!276457) (not ((_ is MissingVacant!6268) lt!276457)) (not (= (index!27341 lt!276457) vacantSpotIndex!68)) (and (bvsge (index!27341 lt!276457) #b00000000000000000000000000000000) (bvslt (index!27341 lt!276457) (size!18236 lt!276295)))) (or ((_ is Undefined!6268) lt!276457) (ite ((_ is Found!6268) lt!276457) (= (select (arr!17872 lt!276295) (index!27339 lt!276457)) lt!276310) (and ((_ is MissingVacant!6268) lt!276457) (= (index!27341 lt!276457) vacantSpotIndex!68) (= (select (arr!17872 lt!276295) (index!27341 lt!276457)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87765 (= lt!276457 e!346780)))

(declare-fun c!68665 () Bool)

(assert (=> d!87765 (= c!68665 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87765 (= lt!276458 (select (arr!17872 lt!276295) lt!276307))))

(assert (=> d!87765 (validMask!0 mask!3053)))

(assert (=> d!87765 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 lt!276310 lt!276295 mask!3053) lt!276457)))

(declare-fun b!605838 () Bool)

(assert (=> b!605838 (= e!346780 e!346781)))

(declare-fun c!68664 () Bool)

(assert (=> b!605838 (= c!68664 (= lt!276458 lt!276310))))

(assert (= (and d!87765 c!68665) b!605837))

(assert (= (and d!87765 (not c!68665)) b!605838))

(assert (= (and b!605838 c!68664) b!605835))

(assert (= (and b!605838 (not c!68664)) b!605836))

(assert (= (and b!605836 c!68663) b!605840))

(assert (= (and b!605836 (not c!68663)) b!605839))

(declare-fun m!582951 () Bool)

(assert (=> b!605839 m!582951))

(assert (=> b!605839 m!582951))

(declare-fun m!582953 () Bool)

(assert (=> b!605839 m!582953))

(declare-fun m!582955 () Bool)

(assert (=> d!87765 m!582955))

(declare-fun m!582957 () Bool)

(assert (=> d!87765 m!582957))

(declare-fun m!582959 () Bool)

(assert (=> d!87765 m!582959))

(assert (=> d!87765 m!582673))

(assert (=> b!605554 d!87765))

(declare-fun b!605843 () Bool)

(declare-fun e!346786 () SeekEntryResult!6268)

(assert (=> b!605843 (= e!346786 (Found!6268 lt!276307))))

(declare-fun b!605844 () Bool)

(declare-fun c!68666 () Bool)

(declare-fun lt!276462 () (_ BitVec 64))

(assert (=> b!605844 (= c!68666 (= lt!276462 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346784 () SeekEntryResult!6268)

(assert (=> b!605844 (= e!346786 e!346784)))

(declare-fun b!605845 () Bool)

(declare-fun e!346785 () SeekEntryResult!6268)

(assert (=> b!605845 (= e!346785 Undefined!6268)))

(declare-fun b!605847 () Bool)

(assert (=> b!605847 (= e!346784 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276307 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605848 () Bool)

(assert (=> b!605848 (= e!346784 (MissingVacant!6268 vacantSpotIndex!68))))

(declare-fun d!87767 () Bool)

(declare-fun lt!276461 () SeekEntryResult!6268)

(assert (=> d!87767 (and (or ((_ is Undefined!6268) lt!276461) (not ((_ is Found!6268) lt!276461)) (and (bvsge (index!27339 lt!276461) #b00000000000000000000000000000000) (bvslt (index!27339 lt!276461) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276461) ((_ is Found!6268) lt!276461) (not ((_ is MissingVacant!6268) lt!276461)) (not (= (index!27341 lt!276461) vacantSpotIndex!68)) (and (bvsge (index!27341 lt!276461) #b00000000000000000000000000000000) (bvslt (index!27341 lt!276461) (size!18236 a!2986)))) (or ((_ is Undefined!6268) lt!276461) (ite ((_ is Found!6268) lt!276461) (= (select (arr!17872 a!2986) (index!27339 lt!276461)) (select (arr!17872 a!2986) j!136)) (and ((_ is MissingVacant!6268) lt!276461) (= (index!27341 lt!276461) vacantSpotIndex!68) (= (select (arr!17872 a!2986) (index!27341 lt!276461)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87767 (= lt!276461 e!346785)))

(declare-fun c!68668 () Bool)

(assert (=> d!87767 (= c!68668 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87767 (= lt!276462 (select (arr!17872 a!2986) lt!276307))))

(assert (=> d!87767 (validMask!0 mask!3053)))

(assert (=> d!87767 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053) lt!276461)))

(declare-fun b!605846 () Bool)

(assert (=> b!605846 (= e!346785 e!346786)))

(declare-fun c!68667 () Bool)

(assert (=> b!605846 (= c!68667 (= lt!276462 (select (arr!17872 a!2986) j!136)))))

(assert (= (and d!87767 c!68668) b!605845))

(assert (= (and d!87767 (not c!68668)) b!605846))

(assert (= (and b!605846 c!68667) b!605843))

(assert (= (and b!605846 (not c!68667)) b!605844))

(assert (= (and b!605844 c!68666) b!605848))

(assert (= (and b!605844 (not c!68666)) b!605847))

(assert (=> b!605847 m!582951))

(assert (=> b!605847 m!582951))

(assert (=> b!605847 m!582653))

(declare-fun m!582961 () Bool)

(assert (=> b!605847 m!582961))

(declare-fun m!582963 () Bool)

(assert (=> d!87767 m!582963))

(declare-fun m!582965 () Bool)

(assert (=> d!87767 m!582965))

(declare-fun m!582969 () Bool)

(assert (=> d!87767 m!582969))

(assert (=> d!87767 m!582673))

(assert (=> b!605554 d!87767))

(declare-fun d!87769 () Bool)

(declare-fun e!346813 () Bool)

(assert (=> d!87769 e!346813))

(declare-fun res!389259 () Bool)

(assert (=> d!87769 (=> (not res!389259) (not e!346813))))

(assert (=> d!87769 (= res!389259 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18236 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18236 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18236 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986))))))

(declare-fun lt!276486 () Unit!19261)

(declare-fun choose!9 (array!37239 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19261)

(assert (=> d!87769 (= lt!276486 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87769 (validMask!0 mask!3053)))

(assert (=> d!87769 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 mask!3053) lt!276486)))

(declare-fun b!605890 () Bool)

(assert (=> b!605890 (= e!346813 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 (select (arr!17872 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276307 vacantSpotIndex!68 (select (store (arr!17872 a!2986) i!1108 k0!1786) j!136) (array!37240 (store (arr!17872 a!2986) i!1108 k0!1786) (size!18236 a!2986)) mask!3053)))))

(assert (= (and d!87769 res!389259) b!605890))

(declare-fun m!583009 () Bool)

(assert (=> d!87769 m!583009))

(assert (=> d!87769 m!582673))

(assert (=> b!605890 m!582653))

(assert (=> b!605890 m!582651))

(declare-fun m!583011 () Bool)

(assert (=> b!605890 m!583011))

(assert (=> b!605890 m!582651))

(assert (=> b!605890 m!582641))

(assert (=> b!605890 m!582653))

(assert (=> b!605890 m!582661))

(assert (=> b!605554 d!87769))

(declare-fun d!87783 () Bool)

(declare-fun lt!276491 () (_ BitVec 32))

(assert (=> d!87783 (and (bvsge lt!276491 #b00000000000000000000000000000000) (bvslt lt!276491 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87783 (= lt!276491 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!87783 (validMask!0 mask!3053)))

(assert (=> d!87783 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!276491)))

(declare-fun bs!18547 () Bool)

(assert (= bs!18547 d!87783))

(declare-fun m!583013 () Bool)

(assert (=> bs!18547 m!583013))

(assert (=> bs!18547 m!582673))

(assert (=> b!605554 d!87783))

(assert (=> b!605543 d!87713))

(declare-fun d!87785 () Bool)

(assert (=> d!87785 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18236 lt!276295)) (not (= (select (arr!17872 lt!276295) j!136) (select (arr!17872 a!2986) j!136))))))

(declare-fun lt!276498 () Unit!19261)

(declare-fun choose!21 (array!37239 (_ BitVec 64) (_ BitVec 32) List!11820) Unit!19261)

(assert (=> d!87785 (= lt!276498 (choose!21 lt!276295 (select (arr!17872 a!2986) j!136) j!136 Nil!11817))))

(assert (=> d!87785 (bvslt (size!18236 lt!276295) #b01111111111111111111111111111111)))

(assert (=> d!87785 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276295 (select (arr!17872 a!2986) j!136) j!136 Nil!11817) lt!276498)))

(declare-fun bs!18549 () Bool)

(assert (= bs!18549 d!87785))

(assert (=> bs!18549 m!582833))

(assert (=> bs!18549 m!582653))

(declare-fun m!583035 () Bool)

(assert (=> bs!18549 m!583035))

(assert (=> b!605553 d!87785))

(declare-fun d!87797 () Bool)

(declare-fun res!389268 () Bool)

(declare-fun e!346825 () Bool)

(assert (=> d!87797 (=> res!389268 e!346825)))

(assert (=> d!87797 (= res!389268 (bvsge j!136 (size!18236 lt!276295)))))

(assert (=> d!87797 (= (arrayNoDuplicates!0 lt!276295 j!136 Nil!11817) e!346825)))

(declare-fun b!605904 () Bool)

(declare-fun e!346824 () Bool)

(declare-fun call!33060 () Bool)

(assert (=> b!605904 (= e!346824 call!33060)))

(declare-fun b!605905 () Bool)

(declare-fun e!346826 () Bool)

(assert (=> b!605905 (= e!346826 (contains!2970 Nil!11817 (select (arr!17872 lt!276295) j!136)))))

(declare-fun b!605906 () Bool)

(assert (=> b!605906 (= e!346824 call!33060)))

(declare-fun c!68687 () Bool)

(declare-fun bm!33057 () Bool)

(assert (=> bm!33057 (= call!33060 (arrayNoDuplicates!0 lt!276295 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68687 (Cons!11816 (select (arr!17872 lt!276295) j!136) Nil!11817) Nil!11817)))))

(declare-fun b!605907 () Bool)

(declare-fun e!346827 () Bool)

(assert (=> b!605907 (= e!346825 e!346827)))

(declare-fun res!389269 () Bool)

(assert (=> b!605907 (=> (not res!389269) (not e!346827))))

(assert (=> b!605907 (= res!389269 (not e!346826))))

(declare-fun res!389267 () Bool)

(assert (=> b!605907 (=> (not res!389267) (not e!346826))))

(assert (=> b!605907 (= res!389267 (validKeyInArray!0 (select (arr!17872 lt!276295) j!136)))))

(declare-fun b!605908 () Bool)

(assert (=> b!605908 (= e!346827 e!346824)))

(assert (=> b!605908 (= c!68687 (validKeyInArray!0 (select (arr!17872 lt!276295) j!136)))))

(assert (= (and d!87797 (not res!389268)) b!605907))

(assert (= (and b!605907 res!389267) b!605905))

(assert (= (and b!605907 res!389269) b!605908))

(assert (= (and b!605908 c!68687) b!605904))

(assert (= (and b!605908 (not c!68687)) b!605906))

(assert (= (or b!605904 b!605906) bm!33057))

(assert (=> b!605905 m!582833))

(assert (=> b!605905 m!582833))

(declare-fun m!583037 () Bool)

(assert (=> b!605905 m!583037))

(assert (=> bm!33057 m!582833))

(declare-fun m!583039 () Bool)

(assert (=> bm!33057 m!583039))

(assert (=> b!605907 m!582833))

(assert (=> b!605907 m!582833))

(declare-fun m!583041 () Bool)

(assert (=> b!605907 m!583041))

(assert (=> b!605908 m!582833))

(assert (=> b!605908 m!582833))

(assert (=> b!605908 m!583041))

(assert (=> b!605553 d!87797))

(declare-fun d!87799 () Bool)

(assert (=> d!87799 (arrayNoDuplicates!0 lt!276295 j!136 Nil!11817)))

(declare-fun lt!276511 () Unit!19261)

(declare-fun choose!39 (array!37239 (_ BitVec 32) (_ BitVec 32)) Unit!19261)

(assert (=> d!87799 (= lt!276511 (choose!39 lt!276295 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87799 (bvslt (size!18236 lt!276295) #b01111111111111111111111111111111)))

(assert (=> d!87799 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276295 #b00000000000000000000000000000000 j!136) lt!276511)))

(declare-fun bs!18550 () Bool)

(assert (= bs!18550 d!87799))

(assert (=> bs!18550 m!582689))

(declare-fun m!583043 () Bool)

(assert (=> bs!18550 m!583043))

(assert (=> b!605553 d!87799))

(declare-fun d!87801 () Bool)

(declare-fun res!389274 () Bool)

(declare-fun e!346840 () Bool)

(assert (=> d!87801 (=> res!389274 e!346840)))

(assert (=> d!87801 (= res!389274 (= (select (arr!17872 lt!276295) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17872 a!2986) j!136)))))

(assert (=> d!87801 (= (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346840)))

(declare-fun b!605929 () Bool)

(declare-fun e!346841 () Bool)

(assert (=> b!605929 (= e!346840 e!346841)))

(declare-fun res!389275 () Bool)

(assert (=> b!605929 (=> (not res!389275) (not e!346841))))

(assert (=> b!605929 (= res!389275 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18236 lt!276295)))))

(declare-fun b!605930 () Bool)

(assert (=> b!605930 (= e!346841 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87801 (not res!389274)) b!605929))

(assert (= (and b!605929 res!389275) b!605930))

(declare-fun m!583045 () Bool)

(assert (=> d!87801 m!583045))

(assert (=> b!605930 m!582653))

(declare-fun m!583047 () Bool)

(assert (=> b!605930 m!583047))

(assert (=> b!605553 d!87801))

(declare-fun d!87803 () Bool)

(declare-fun res!389277 () Bool)

(declare-fun e!346843 () Bool)

(assert (=> d!87803 (=> res!389277 e!346843)))

(assert (=> d!87803 (= res!389277 (bvsge #b00000000000000000000000000000000 (size!18236 lt!276295)))))

(assert (=> d!87803 (= (arrayNoDuplicates!0 lt!276295 #b00000000000000000000000000000000 Nil!11817) e!346843)))

(declare-fun b!605931 () Bool)

(declare-fun e!346842 () Bool)

(declare-fun call!33063 () Bool)

(assert (=> b!605931 (= e!346842 call!33063)))

(declare-fun b!605932 () Bool)

(declare-fun e!346844 () Bool)

(assert (=> b!605932 (= e!346844 (contains!2970 Nil!11817 (select (arr!17872 lt!276295) #b00000000000000000000000000000000)))))

(declare-fun b!605933 () Bool)

(assert (=> b!605933 (= e!346842 call!33063)))

(declare-fun bm!33060 () Bool)

(declare-fun c!68696 () Bool)

(assert (=> bm!33060 (= call!33063 (arrayNoDuplicates!0 lt!276295 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68696 (Cons!11816 (select (arr!17872 lt!276295) #b00000000000000000000000000000000) Nil!11817) Nil!11817)))))

(declare-fun b!605934 () Bool)

(declare-fun e!346845 () Bool)

(assert (=> b!605934 (= e!346843 e!346845)))

(declare-fun res!389278 () Bool)

(assert (=> b!605934 (=> (not res!389278) (not e!346845))))

(assert (=> b!605934 (= res!389278 (not e!346844))))

(declare-fun res!389276 () Bool)

(assert (=> b!605934 (=> (not res!389276) (not e!346844))))

(assert (=> b!605934 (= res!389276 (validKeyInArray!0 (select (arr!17872 lt!276295) #b00000000000000000000000000000000)))))

(declare-fun b!605935 () Bool)

(assert (=> b!605935 (= e!346845 e!346842)))

(assert (=> b!605935 (= c!68696 (validKeyInArray!0 (select (arr!17872 lt!276295) #b00000000000000000000000000000000)))))

(assert (= (and d!87803 (not res!389277)) b!605934))

(assert (= (and b!605934 res!389276) b!605932))

(assert (= (and b!605934 res!389278) b!605935))

(assert (= (and b!605935 c!68696) b!605931))

(assert (= (and b!605935 (not c!68696)) b!605933))

(assert (= (or b!605931 b!605933) bm!33060))

(declare-fun m!583049 () Bool)

(assert (=> b!605932 m!583049))

(assert (=> b!605932 m!583049))

(declare-fun m!583051 () Bool)

(assert (=> b!605932 m!583051))

(assert (=> bm!33060 m!583049))

(declare-fun m!583053 () Bool)

(assert (=> bm!33060 m!583053))

(assert (=> b!605934 m!583049))

(assert (=> b!605934 m!583049))

(declare-fun m!583055 () Bool)

(assert (=> b!605934 m!583055))

(assert (=> b!605935 m!583049))

(assert (=> b!605935 m!583049))

(assert (=> b!605935 m!583055))

(assert (=> b!605553 d!87803))

(declare-fun d!87805 () Bool)

(assert (=> d!87805 (arrayContainsKey!0 lt!276295 (select (arr!17872 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276515 () Unit!19261)

(assert (=> d!87805 (= lt!276515 (choose!114 lt!276295 (select (arr!17872 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87805 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87805 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276295 (select (arr!17872 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276515)))

(declare-fun bs!18551 () Bool)

(assert (= bs!18551 d!87805))

(assert (=> bs!18551 m!582653))

(assert (=> bs!18551 m!582695))

(assert (=> bs!18551 m!582653))

(declare-fun m!583065 () Bool)

(assert (=> bs!18551 m!583065))

(assert (=> b!605553 d!87805))

(declare-fun d!87807 () Bool)

(declare-fun e!346864 () Bool)

(assert (=> d!87807 e!346864))

(declare-fun res!389292 () Bool)

(assert (=> d!87807 (=> (not res!389292) (not e!346864))))

(assert (=> d!87807 (= res!389292 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18236 a!2986))))))

(declare-fun lt!276521 () Unit!19261)

(declare-fun choose!41 (array!37239 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11820) Unit!19261)

(assert (=> d!87807 (= lt!276521 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11817))))

(assert (=> d!87807 (bvslt (size!18236 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87807 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11817) lt!276521)))

(declare-fun b!605959 () Bool)

(assert (=> b!605959 (= e!346864 (arrayNoDuplicates!0 (array!37240 (store (arr!17872 a!2986) i!1108 k0!1786) (size!18236 a!2986)) #b00000000000000000000000000000000 Nil!11817))))

(assert (= (and d!87807 res!389292) b!605959))

(declare-fun m!583093 () Bool)

(assert (=> d!87807 m!583093))

(assert (=> b!605959 m!582641))

(declare-fun m!583095 () Bool)

(assert (=> b!605959 m!583095))

(assert (=> b!605553 d!87807))

(declare-fun d!87825 () Bool)

(declare-fun res!389293 () Bool)

(declare-fun e!346865 () Bool)

(assert (=> d!87825 (=> res!389293 e!346865)))

(assert (=> d!87825 (= res!389293 (= (select (arr!17872 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87825 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346865)))

(declare-fun b!605960 () Bool)

(declare-fun e!346866 () Bool)

(assert (=> b!605960 (= e!346865 e!346866)))

(declare-fun res!389294 () Bool)

(assert (=> b!605960 (=> (not res!389294) (not e!346866))))

(assert (=> b!605960 (= res!389294 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18236 a!2986)))))

(declare-fun b!605961 () Bool)

(assert (=> b!605961 (= e!346866 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87825 (not res!389293)) b!605960))

(assert (= (and b!605960 res!389294) b!605961))

(assert (=> d!87825 m!582837))

(declare-fun m!583097 () Bool)

(assert (=> b!605961 m!583097))

(assert (=> b!605542 d!87825))

(check-sat (not d!87765) (not b!605890) (not bm!33057) (not d!87767) (not b!605719) (not b!605704) (not d!87783) (not d!87785) (not d!87709) (not d!87807) (not b!605908) (not b!605820) (not b!605935) (not d!87763) (not d!87769) (not b!605718) (not b!605961) (not d!87711) (not d!87805) (not b!605907) (not b!605930) (not b!605741) (not b!605758) (not d!87731) (not b!605721) (not b!605833) (not bm!33042) (not b!605839) (not b!605959) (not bm!33060) (not b!605847) (not b!605761) (not b!605716) (not b!605934) (not b!605905) (not b!605932) (not b!605736) (not bm!33045) (not d!87799))
(check-sat)
