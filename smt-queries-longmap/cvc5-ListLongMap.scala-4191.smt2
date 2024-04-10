; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57122 () Bool)

(assert start!57122)

(declare-fun b!632579 () Bool)

(declare-fun res!409168 () Bool)

(declare-fun e!361648 () Bool)

(assert (=> b!632579 (=> (not res!409168) (not e!361648))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38141 0))(
  ( (array!38142 (arr!18303 (Array (_ BitVec 32) (_ BitVec 64))) (size!18667 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38141)

(assert (=> b!632579 (= res!409168 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18303 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632580 () Bool)

(declare-fun e!361646 () Bool)

(declare-datatypes ((SeekEntryResult!6743 0))(
  ( (MissingZero!6743 (index!29265 (_ BitVec 32))) (Found!6743 (index!29266 (_ BitVec 32))) (Intermediate!6743 (undefined!7555 Bool) (index!29267 (_ BitVec 32)) (x!58002 (_ BitVec 32))) (Undefined!6743) (MissingVacant!6743 (index!29268 (_ BitVec 32))) )
))
(declare-fun lt!292378 () SeekEntryResult!6743)

(declare-fun lt!292377 () SeekEntryResult!6743)

(assert (=> b!632580 (= e!361646 (= lt!292378 lt!292377))))

(declare-fun b!632581 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!292376 () array!38141)

(declare-fun e!361652 () Bool)

(declare-fun arrayContainsKey!0 (array!38141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632581 (= e!361652 (arrayContainsKey!0 lt!292376 (select (arr!18303 a!2986) j!136) j!136))))

(declare-fun res!409164 () Bool)

(declare-fun e!361653 () Bool)

(assert (=> start!57122 (=> (not res!409164) (not e!361653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57122 (= res!409164 (validMask!0 mask!3053))))

(assert (=> start!57122 e!361653))

(assert (=> start!57122 true))

(declare-fun array_inv!14099 (array!38141) Bool)

(assert (=> start!57122 (array_inv!14099 a!2986)))

(declare-fun b!632582 () Bool)

(declare-fun res!409163 () Bool)

(assert (=> b!632582 (=> (not res!409163) (not e!361653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632582 (= res!409163 (validKeyInArray!0 (select (arr!18303 a!2986) j!136)))))

(declare-fun b!632583 () Bool)

(declare-fun res!409171 () Bool)

(assert (=> b!632583 (=> (not res!409171) (not e!361653))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!632583 (= res!409171 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632584 () Bool)

(declare-fun res!409170 () Bool)

(assert (=> b!632584 (=> (not res!409170) (not e!361653))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632584 (= res!409170 (and (= (size!18667 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18667 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18667 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632585 () Bool)

(declare-fun e!361645 () Bool)

(assert (=> b!632585 (= e!361645 e!361652)))

(declare-fun res!409162 () Bool)

(assert (=> b!632585 (=> res!409162 e!361652)))

(declare-fun lt!292375 () (_ BitVec 64))

(assert (=> b!632585 (= res!409162 (or (not (= (select (arr!18303 a!2986) j!136) lt!292375)) (not (= (select (arr!18303 a!2986) j!136) (select (store (arr!18303 a!2986) i!1108 k!1786) index!984))) (bvsge j!136 index!984)))))

(assert (=> b!632585 (= (select (store (arr!18303 a!2986) i!1108 k!1786) index!984) (select (arr!18303 a!2986) j!136))))

(declare-fun b!632586 () Bool)

(declare-datatypes ((Unit!21306 0))(
  ( (Unit!21307) )
))
(declare-fun e!361649 () Unit!21306)

(declare-fun Unit!21308 () Unit!21306)

(assert (=> b!632586 (= e!361649 Unit!21308)))

(declare-fun b!632587 () Bool)

(declare-fun res!409172 () Bool)

(assert (=> b!632587 (=> (not res!409172) (not e!361653))))

(assert (=> b!632587 (= res!409172 (validKeyInArray!0 k!1786))))

(declare-fun b!632588 () Bool)

(declare-fun res!409161 () Bool)

(assert (=> b!632588 (=> (not res!409161) (not e!361648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38141 (_ BitVec 32)) Bool)

(assert (=> b!632588 (= res!409161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632589 () Bool)

(declare-fun res!409159 () Bool)

(assert (=> b!632589 (=> (not res!409159) (not e!361648))))

(declare-datatypes ((List!12344 0))(
  ( (Nil!12341) (Cons!12340 (h!13385 (_ BitVec 64)) (t!18572 List!12344)) )
))
(declare-fun arrayNoDuplicates!0 (array!38141 (_ BitVec 32) List!12344) Bool)

(assert (=> b!632589 (= res!409159 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12341))))

(declare-fun b!632590 () Bool)

(assert (=> b!632590 (= e!361653 e!361648)))

(declare-fun res!409165 () Bool)

(assert (=> b!632590 (=> (not res!409165) (not e!361648))))

(declare-fun lt!292380 () SeekEntryResult!6743)

(assert (=> b!632590 (= res!409165 (or (= lt!292380 (MissingZero!6743 i!1108)) (= lt!292380 (MissingVacant!6743 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38141 (_ BitVec 32)) SeekEntryResult!6743)

(assert (=> b!632590 (= lt!292380 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!632591 () Bool)

(declare-fun e!361650 () Bool)

(declare-fun e!361647 () Bool)

(assert (=> b!632591 (= e!361650 e!361647)))

(declare-fun res!409169 () Bool)

(assert (=> b!632591 (=> (not res!409169) (not e!361647))))

(assert (=> b!632591 (= res!409169 (and (= lt!292378 (Found!6743 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18303 a!2986) index!984) (select (arr!18303 a!2986) j!136))) (not (= (select (arr!18303 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38141 (_ BitVec 32)) SeekEntryResult!6743)

(assert (=> b!632591 (= lt!292378 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18303 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632592 () Bool)

(declare-fun Unit!21309 () Unit!21306)

(assert (=> b!632592 (= e!361649 Unit!21309)))

(assert (=> b!632592 false))

(declare-fun b!632593 () Bool)

(assert (=> b!632593 (= e!361648 e!361650)))

(declare-fun res!409167 () Bool)

(assert (=> b!632593 (=> (not res!409167) (not e!361650))))

(assert (=> b!632593 (= res!409167 (= (select (store (arr!18303 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632593 (= lt!292376 (array!38142 (store (arr!18303 a!2986) i!1108 k!1786) (size!18667 a!2986)))))

(declare-fun b!632594 () Bool)

(assert (=> b!632594 (= e!361647 (not e!361645))))

(declare-fun res!409166 () Bool)

(assert (=> b!632594 (=> res!409166 e!361645)))

(declare-fun lt!292373 () SeekEntryResult!6743)

(assert (=> b!632594 (= res!409166 (not (= lt!292373 (Found!6743 index!984))))))

(declare-fun lt!292374 () Unit!21306)

(assert (=> b!632594 (= lt!292374 e!361649)))

(declare-fun c!72077 () Bool)

(assert (=> b!632594 (= c!72077 (= lt!292373 Undefined!6743))))

(assert (=> b!632594 (= lt!292373 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292375 lt!292376 mask!3053))))

(assert (=> b!632594 e!361646))

(declare-fun res!409160 () Bool)

(assert (=> b!632594 (=> (not res!409160) (not e!361646))))

(declare-fun lt!292379 () (_ BitVec 32))

(assert (=> b!632594 (= res!409160 (= lt!292377 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 lt!292375 lt!292376 mask!3053)))))

(assert (=> b!632594 (= lt!292377 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 (select (arr!18303 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632594 (= lt!292375 (select (store (arr!18303 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292381 () Unit!21306)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21306)

(assert (=> b!632594 (= lt!292381 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632594 (= lt!292379 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57122 res!409164) b!632584))

(assert (= (and b!632584 res!409170) b!632582))

(assert (= (and b!632582 res!409163) b!632587))

(assert (= (and b!632587 res!409172) b!632583))

(assert (= (and b!632583 res!409171) b!632590))

(assert (= (and b!632590 res!409165) b!632588))

(assert (= (and b!632588 res!409161) b!632589))

(assert (= (and b!632589 res!409159) b!632579))

(assert (= (and b!632579 res!409168) b!632593))

(assert (= (and b!632593 res!409167) b!632591))

(assert (= (and b!632591 res!409169) b!632594))

(assert (= (and b!632594 res!409160) b!632580))

(assert (= (and b!632594 c!72077) b!632592))

(assert (= (and b!632594 (not c!72077)) b!632586))

(assert (= (and b!632594 (not res!409166)) b!632585))

(assert (= (and b!632585 (not res!409162)) b!632581))

(declare-fun m!607395 () Bool)

(assert (=> b!632594 m!607395))

(declare-fun m!607397 () Bool)

(assert (=> b!632594 m!607397))

(declare-fun m!607399 () Bool)

(assert (=> b!632594 m!607399))

(declare-fun m!607401 () Bool)

(assert (=> b!632594 m!607401))

(declare-fun m!607403 () Bool)

(assert (=> b!632594 m!607403))

(declare-fun m!607405 () Bool)

(assert (=> b!632594 m!607405))

(assert (=> b!632594 m!607399))

(declare-fun m!607407 () Bool)

(assert (=> b!632594 m!607407))

(declare-fun m!607409 () Bool)

(assert (=> b!632594 m!607409))

(declare-fun m!607411 () Bool)

(assert (=> b!632589 m!607411))

(declare-fun m!607413 () Bool)

(assert (=> b!632590 m!607413))

(declare-fun m!607415 () Bool)

(assert (=> b!632588 m!607415))

(declare-fun m!607417 () Bool)

(assert (=> b!632579 m!607417))

(declare-fun m!607419 () Bool)

(assert (=> b!632583 m!607419))

(declare-fun m!607421 () Bool)

(assert (=> b!632591 m!607421))

(assert (=> b!632591 m!607399))

(assert (=> b!632591 m!607399))

(declare-fun m!607423 () Bool)

(assert (=> b!632591 m!607423))

(assert (=> b!632585 m!607399))

(assert (=> b!632585 m!607401))

(declare-fun m!607425 () Bool)

(assert (=> b!632585 m!607425))

(declare-fun m!607427 () Bool)

(assert (=> start!57122 m!607427))

(declare-fun m!607429 () Bool)

(assert (=> start!57122 m!607429))

(assert (=> b!632582 m!607399))

(assert (=> b!632582 m!607399))

(declare-fun m!607431 () Bool)

(assert (=> b!632582 m!607431))

(declare-fun m!607433 () Bool)

(assert (=> b!632587 m!607433))

(assert (=> b!632581 m!607399))

(assert (=> b!632581 m!607399))

(declare-fun m!607435 () Bool)

(assert (=> b!632581 m!607435))

(assert (=> b!632593 m!607401))

(declare-fun m!607437 () Bool)

(assert (=> b!632593 m!607437))

(push 1)

(assert (not b!632590))

(assert (not b!632581))

(assert (not b!632588))

(assert (not b!632582))

(assert (not start!57122))

(assert (not b!632587))

(assert (not b!632589))

(assert (not b!632594))

(assert (not b!632591))

(assert (not b!632583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!632761 () Bool)

(declare-fun e!361747 () SeekEntryResult!6743)

(assert (=> b!632761 (= e!361747 Undefined!6743)))

(declare-fun b!632762 () Bool)

(declare-fun e!361748 () SeekEntryResult!6743)

(assert (=> b!632762 (= e!361747 e!361748)))

(declare-fun c!72115 () Bool)

(declare-fun lt!292465 () (_ BitVec 64))

(assert (=> b!632762 (= c!72115 (= lt!292465 lt!292375))))

(declare-fun b!632763 () Bool)

(declare-fun e!361749 () SeekEntryResult!6743)

(assert (=> b!632763 (= e!361749 (MissingVacant!6743 vacantSpotIndex!68))))

(declare-fun b!632764 () Bool)

(assert (=> b!632764 (= e!361749 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292379 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292375 lt!292376 mask!3053))))

(declare-fun b!632765 () Bool)

(declare-fun c!72116 () Bool)

(assert (=> b!632765 (= c!72116 (= lt!292465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632765 (= e!361748 e!361749)))

(declare-fun lt!292464 () SeekEntryResult!6743)

(declare-fun d!89429 () Bool)

(assert (=> d!89429 (and (or (is-Undefined!6743 lt!292464) (not (is-Found!6743 lt!292464)) (and (bvsge (index!29266 lt!292464) #b00000000000000000000000000000000) (bvslt (index!29266 lt!292464) (size!18667 lt!292376)))) (or (is-Undefined!6743 lt!292464) (is-Found!6743 lt!292464) (not (is-MissingVacant!6743 lt!292464)) (not (= (index!29268 lt!292464) vacantSpotIndex!68)) (and (bvsge (index!29268 lt!292464) #b00000000000000000000000000000000) (bvslt (index!29268 lt!292464) (size!18667 lt!292376)))) (or (is-Undefined!6743 lt!292464) (ite (is-Found!6743 lt!292464) (= (select (arr!18303 lt!292376) (index!29266 lt!292464)) lt!292375) (and (is-MissingVacant!6743 lt!292464) (= (index!29268 lt!292464) vacantSpotIndex!68) (= (select (arr!18303 lt!292376) (index!29268 lt!292464)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89429 (= lt!292464 e!361747)))

(declare-fun c!72114 () Bool)

(assert (=> d!89429 (= c!72114 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89429 (= lt!292465 (select (arr!18303 lt!292376) lt!292379))))

(assert (=> d!89429 (validMask!0 mask!3053)))

(assert (=> d!89429 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 lt!292375 lt!292376 mask!3053) lt!292464)))

(declare-fun b!632760 () Bool)

(assert (=> b!632760 (= e!361748 (Found!6743 lt!292379))))

(assert (= (and d!89429 c!72114) b!632761))

(assert (= (and d!89429 (not c!72114)) b!632762))

(assert (= (and b!632762 c!72115) b!632760))

(assert (= (and b!632762 (not c!72115)) b!632765))

(assert (= (and b!632765 c!72116) b!632763))

(assert (= (and b!632765 (not c!72116)) b!632764))

(declare-fun m!607569 () Bool)

(assert (=> b!632764 m!607569))

(assert (=> b!632764 m!607569))

(declare-fun m!607571 () Bool)

(assert (=> b!632764 m!607571))

(declare-fun m!607573 () Bool)

(assert (=> d!89429 m!607573))

(declare-fun m!607575 () Bool)

(assert (=> d!89429 m!607575))

(declare-fun m!607577 () Bool)

(assert (=> d!89429 m!607577))

(assert (=> d!89429 m!607427))

(assert (=> b!632594 d!89429))

(declare-fun d!89433 () Bool)

(declare-fun lt!292475 () (_ BitVec 32))

(assert (=> d!89433 (and (bvsge lt!292475 #b00000000000000000000000000000000) (bvslt lt!292475 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89433 (= lt!292475 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89433 (validMask!0 mask!3053)))

(assert (=> d!89433 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292475)))

(declare-fun bs!19052 () Bool)

(assert (= bs!19052 d!89433))

(declare-fun m!607591 () Bool)

(assert (=> bs!19052 m!607591))

(assert (=> bs!19052 m!607427))

(assert (=> b!632594 d!89433))

(declare-fun b!632785 () Bool)

(declare-fun e!361759 () SeekEntryResult!6743)

(assert (=> b!632785 (= e!361759 Undefined!6743)))

(declare-fun b!632786 () Bool)

(declare-fun e!361760 () SeekEntryResult!6743)

(assert (=> b!632786 (= e!361759 e!361760)))

(declare-fun c!72127 () Bool)

(declare-fun lt!292477 () (_ BitVec 64))

(assert (=> b!632786 (= c!72127 (= lt!292477 lt!292375))))

(declare-fun b!632787 () Bool)

(declare-fun e!361761 () SeekEntryResult!6743)

(assert (=> b!632787 (= e!361761 (MissingVacant!6743 vacantSpotIndex!68))))

(declare-fun b!632788 () Bool)

(assert (=> b!632788 (= e!361761 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292375 lt!292376 mask!3053))))

(declare-fun b!632789 () Bool)

(declare-fun c!72128 () Bool)

(assert (=> b!632789 (= c!72128 (= lt!292477 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632789 (= e!361760 e!361761)))

(declare-fun d!89437 () Bool)

(declare-fun lt!292476 () SeekEntryResult!6743)

(assert (=> d!89437 (and (or (is-Undefined!6743 lt!292476) (not (is-Found!6743 lt!292476)) (and (bvsge (index!29266 lt!292476) #b00000000000000000000000000000000) (bvslt (index!29266 lt!292476) (size!18667 lt!292376)))) (or (is-Undefined!6743 lt!292476) (is-Found!6743 lt!292476) (not (is-MissingVacant!6743 lt!292476)) (not (= (index!29268 lt!292476) vacantSpotIndex!68)) (and (bvsge (index!29268 lt!292476) #b00000000000000000000000000000000) (bvslt (index!29268 lt!292476) (size!18667 lt!292376)))) (or (is-Undefined!6743 lt!292476) (ite (is-Found!6743 lt!292476) (= (select (arr!18303 lt!292376) (index!29266 lt!292476)) lt!292375) (and (is-MissingVacant!6743 lt!292476) (= (index!29268 lt!292476) vacantSpotIndex!68) (= (select (arr!18303 lt!292376) (index!29268 lt!292476)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89437 (= lt!292476 e!361759)))

(declare-fun c!72126 () Bool)

(assert (=> d!89437 (= c!72126 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89437 (= lt!292477 (select (arr!18303 lt!292376) index!984))))

(assert (=> d!89437 (validMask!0 mask!3053)))

(assert (=> d!89437 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292375 lt!292376 mask!3053) lt!292476)))

(declare-fun b!632784 () Bool)

(assert (=> b!632784 (= e!361760 (Found!6743 index!984))))

(assert (= (and d!89437 c!72126) b!632785))

(assert (= (and d!89437 (not c!72126)) b!632786))

(assert (= (and b!632786 c!72127) b!632784))

(assert (= (and b!632786 (not c!72127)) b!632789))

(assert (= (and b!632789 c!72128) b!632787))

(assert (= (and b!632789 (not c!72128)) b!632788))

(assert (=> b!632788 m!607395))

(assert (=> b!632788 m!607395))

(declare-fun m!607595 () Bool)

(assert (=> b!632788 m!607595))

(declare-fun m!607597 () Bool)

(assert (=> d!89437 m!607597))

(declare-fun m!607599 () Bool)

(assert (=> d!89437 m!607599))

(declare-fun m!607601 () Bool)

(assert (=> d!89437 m!607601))

(assert (=> d!89437 m!607427))

(assert (=> b!632594 d!89437))

(declare-fun b!632797 () Bool)

(declare-fun e!361765 () SeekEntryResult!6743)

(assert (=> b!632797 (= e!361765 Undefined!6743)))

(declare-fun b!632798 () Bool)

(declare-fun e!361766 () SeekEntryResult!6743)

(assert (=> b!632798 (= e!361765 e!361766)))

(declare-fun c!72133 () Bool)

(declare-fun lt!292481 () (_ BitVec 64))

(assert (=> b!632798 (= c!72133 (= lt!292481 (select (arr!18303 a!2986) j!136)))))

(declare-fun b!632799 () Bool)

(declare-fun e!361767 () SeekEntryResult!6743)

(assert (=> b!632799 (= e!361767 (MissingVacant!6743 vacantSpotIndex!68))))

(declare-fun b!632800 () Bool)

(assert (=> b!632800 (= e!361767 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292379 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18303 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632801 () Bool)

(declare-fun c!72134 () Bool)

(assert (=> b!632801 (= c!72134 (= lt!292481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632801 (= e!361766 e!361767)))

(declare-fun lt!292480 () SeekEntryResult!6743)

(declare-fun d!89439 () Bool)

(assert (=> d!89439 (and (or (is-Undefined!6743 lt!292480) (not (is-Found!6743 lt!292480)) (and (bvsge (index!29266 lt!292480) #b00000000000000000000000000000000) (bvslt (index!29266 lt!292480) (size!18667 a!2986)))) (or (is-Undefined!6743 lt!292480) (is-Found!6743 lt!292480) (not (is-MissingVacant!6743 lt!292480)) (not (= (index!29268 lt!292480) vacantSpotIndex!68)) (and (bvsge (index!29268 lt!292480) #b00000000000000000000000000000000) (bvslt (index!29268 lt!292480) (size!18667 a!2986)))) (or (is-Undefined!6743 lt!292480) (ite (is-Found!6743 lt!292480) (= (select (arr!18303 a!2986) (index!29266 lt!292480)) (select (arr!18303 a!2986) j!136)) (and (is-MissingVacant!6743 lt!292480) (= (index!29268 lt!292480) vacantSpotIndex!68) (= (select (arr!18303 a!2986) (index!29268 lt!292480)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89439 (= lt!292480 e!361765)))

(declare-fun c!72132 () Bool)

(assert (=> d!89439 (= c!72132 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89439 (= lt!292481 (select (arr!18303 a!2986) lt!292379))))

(assert (=> d!89439 (validMask!0 mask!3053)))

(assert (=> d!89439 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 (select (arr!18303 a!2986) j!136) a!2986 mask!3053) lt!292480)))

(declare-fun b!632796 () Bool)

(assert (=> b!632796 (= e!361766 (Found!6743 lt!292379))))

(assert (= (and d!89439 c!72132) b!632797))

(assert (= (and d!89439 (not c!72132)) b!632798))

(assert (= (and b!632798 c!72133) b!632796))

(assert (= (and b!632798 (not c!72133)) b!632801))

(assert (= (and b!632801 c!72134) b!632799))

(assert (= (and b!632801 (not c!72134)) b!632800))

(assert (=> b!632800 m!607569))

(assert (=> b!632800 m!607569))

(assert (=> b!632800 m!607399))

(declare-fun m!607613 () Bool)

(assert (=> b!632800 m!607613))

(declare-fun m!607615 () Bool)

(assert (=> d!89439 m!607615))

(declare-fun m!607617 () Bool)

(assert (=> d!89439 m!607617))

(declare-fun m!607619 () Bool)

(assert (=> d!89439 m!607619))

(assert (=> d!89439 m!607427))

(assert (=> b!632594 d!89439))

(declare-fun d!89445 () Bool)

(declare-fun e!361782 () Bool)

(assert (=> d!89445 e!361782))

(declare-fun res!409277 () Bool)

(assert (=> d!89445 (=> (not res!409277) (not e!361782))))

(assert (=> d!89445 (= res!409277 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18667 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18667 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18667 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18667 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18667 a!2986))))))

(declare-fun lt!292487 () Unit!21306)

(declare-fun choose!9 (array!38141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21306)

(assert (=> d!89445 (= lt!292487 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89445 (validMask!0 mask!3053)))

(assert (=> d!89445 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 mask!3053) lt!292487)))

(declare-fun b!632819 () Bool)

(assert (=> b!632819 (= e!361782 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 (select (arr!18303 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292379 vacantSpotIndex!68 (select (store (arr!18303 a!2986) i!1108 k!1786) j!136) (array!38142 (store (arr!18303 a!2986) i!1108 k!1786) (size!18667 a!2986)) mask!3053)))))

(assert (= (and d!89445 res!409277) b!632819))

(declare-fun m!607629 () Bool)

(assert (=> d!89445 m!607629))

(assert (=> d!89445 m!607427))

(assert (=> b!632819 m!607399))

(assert (=> b!632819 m!607407))

(assert (=> b!632819 m!607397))

(declare-fun m!607631 () Bool)

(assert (=> b!632819 m!607631))

(assert (=> b!632819 m!607397))

(assert (=> b!632819 m!607401))

(assert (=> b!632819 m!607399))

(assert (=> b!632594 d!89445))

(declare-fun b!632853 () Bool)

(declare-fun e!361806 () Bool)

(declare-fun e!361805 () Bool)

(assert (=> b!632853 (= e!361806 e!361805)))

(declare-fun c!72149 () Bool)

(assert (=> b!632853 (= c!72149 (validKeyInArray!0 (select (arr!18303 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632854 () Bool)

(declare-fun e!361807 () Bool)

(declare-fun contains!3092 (List!12344 (_ BitVec 64)) Bool)

(assert (=> b!632854 (= e!361807 (contains!3092 Nil!12341 (select (arr!18303 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89451 () Bool)

(declare-fun res!409289 () Bool)

(declare-fun e!361808 () Bool)

(assert (=> d!89451 (=> res!409289 e!361808)))

(assert (=> d!89451 (= res!409289 (bvsge #b00000000000000000000000000000000 (size!18667 a!2986)))))

(assert (=> d!89451 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12341) e!361808)))

(declare-fun bm!33347 () Bool)

(declare-fun call!33350 () Bool)

(assert (=> bm!33347 (= call!33350 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72149 (Cons!12340 (select (arr!18303 a!2986) #b00000000000000000000000000000000) Nil!12341) Nil!12341)))))

(declare-fun b!632855 () Bool)

(assert (=> b!632855 (= e!361805 call!33350)))

(declare-fun b!632856 () Bool)

(assert (=> b!632856 (= e!361805 call!33350)))

(declare-fun b!632857 () Bool)

(assert (=> b!632857 (= e!361808 e!361806)))

(declare-fun res!409291 () Bool)

(assert (=> b!632857 (=> (not res!409291) (not e!361806))))

(assert (=> b!632857 (= res!409291 (not e!361807))))

(declare-fun res!409290 () Bool)

(assert (=> b!632857 (=> (not res!409290) (not e!361807))))

(assert (=> b!632857 (= res!409290 (validKeyInArray!0 (select (arr!18303 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89451 (not res!409289)) b!632857))

(assert (= (and b!632857 res!409290) b!632854))

(assert (= (and b!632857 res!409291) b!632853))

(assert (= (and b!632853 c!72149) b!632856))

(assert (= (and b!632853 (not c!72149)) b!632855))

(assert (= (or b!632856 b!632855) bm!33347))

(declare-fun m!607663 () Bool)

(assert (=> b!632853 m!607663))

(assert (=> b!632853 m!607663))

(declare-fun m!607665 () Bool)

(assert (=> b!632853 m!607665))

(assert (=> b!632854 m!607663))

(assert (=> b!632854 m!607663))

(declare-fun m!607667 () Bool)

(assert (=> b!632854 m!607667))

(assert (=> bm!33347 m!607663))

(declare-fun m!607669 () Bool)

(assert (=> bm!33347 m!607669))

(assert (=> b!632857 m!607663))

(assert (=> b!632857 m!607663))

(assert (=> b!632857 m!607665))

(assert (=> b!632589 d!89451))

(declare-fun bm!33353 () Bool)

(declare-fun call!33356 () Bool)

(assert (=> bm!33353 (= call!33356 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89471 () Bool)

(declare-fun res!409309 () Bool)

(declare-fun e!361830 () Bool)

(assert (=> d!89471 (=> res!409309 e!361830)))

(assert (=> d!89471 (= res!409309 (bvsge #b00000000000000000000000000000000 (size!18667 a!2986)))))

(assert (=> d!89471 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361830)))

(declare-fun b!632884 () Bool)

(declare-fun e!361831 () Bool)

(assert (=> b!632884 (= e!361831 call!33356)))

(declare-fun b!632885 () Bool)

(declare-fun e!361832 () Bool)

(assert (=> b!632885 (= e!361831 e!361832)))

(declare-fun lt!292512 () (_ BitVec 64))

(assert (=> b!632885 (= lt!292512 (select (arr!18303 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292513 () Unit!21306)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38141 (_ BitVec 64) (_ BitVec 32)) Unit!21306)

(assert (=> b!632885 (= lt!292513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292512 #b00000000000000000000000000000000))))

(assert (=> b!632885 (arrayContainsKey!0 a!2986 lt!292512 #b00000000000000000000000000000000)))

(declare-fun lt!292514 () Unit!21306)

(assert (=> b!632885 (= lt!292514 lt!292513)))

(declare-fun res!409308 () Bool)

(assert (=> b!632885 (= res!409308 (= (seekEntryOrOpen!0 (select (arr!18303 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6743 #b00000000000000000000000000000000)))))

