; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57520 () Bool)

(assert start!57520)

(declare-fun b!636389 () Bool)

(declare-fun e!364062 () Bool)

(declare-fun e!364055 () Bool)

(assert (=> b!636389 (= e!364062 e!364055)))

(declare-fun res!411732 () Bool)

(assert (=> b!636389 (=> (not res!411732) (not e!364055))))

(declare-datatypes ((List!12387 0))(
  ( (Nil!12384) (Cons!12383 (h!13428 (_ BitVec 64)) (t!18615 List!12387)) )
))
(declare-fun contains!3101 (List!12387 (_ BitVec 64)) Bool)

(assert (=> b!636389 (= res!411732 (not (contains!3101 Nil!12384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636391 () Bool)

(declare-fun e!364060 () Bool)

(declare-fun e!364061 () Bool)

(assert (=> b!636391 (= e!364060 e!364061)))

(declare-fun res!411738 () Bool)

(assert (=> b!636391 (=> res!411738 e!364061)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!294280 () (_ BitVec 64))

(declare-fun lt!294278 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38241 0))(
  ( (array!38242 (arr!18346 (Array (_ BitVec 32) (_ BitVec 64))) (size!18710 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38241)

(assert (=> b!636391 (= res!411738 (or (not (= (select (arr!18346 a!2986) j!136) lt!294280)) (not (= (select (arr!18346 a!2986) j!136) lt!294278)) (bvsge j!136 index!984)))))

(declare-fun b!636392 () Bool)

(assert (=> b!636392 (= e!364055 (not (contains!3101 Nil!12384 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636393 () Bool)

(declare-datatypes ((Unit!21478 0))(
  ( (Unit!21479) )
))
(declare-fun e!364058 () Unit!21478)

(declare-fun Unit!21480 () Unit!21478)

(assert (=> b!636393 (= e!364058 Unit!21480)))

(declare-fun b!636394 () Bool)

(declare-fun res!411746 () Bool)

(declare-fun e!364067 () Bool)

(assert (=> b!636394 (=> (not res!411746) (not e!364067))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636394 (= res!411746 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636395 () Bool)

(declare-fun res!411740 () Bool)

(declare-fun e!364056 () Bool)

(assert (=> b!636395 (=> (not res!411740) (not e!364056))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38241 (_ BitVec 32)) Bool)

(assert (=> b!636395 (= res!411740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636396 () Bool)

(declare-fun res!411734 () Bool)

(assert (=> b!636396 (=> (not res!411734) (not e!364056))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!636396 (= res!411734 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18346 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636397 () Bool)

(declare-fun e!364066 () Bool)

(assert (=> b!636397 (= e!364061 e!364066)))

(declare-fun res!411742 () Bool)

(assert (=> b!636397 (=> (not res!411742) (not e!364066))))

(declare-fun lt!294277 () array!38241)

(assert (=> b!636397 (= res!411742 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) j!136))))

(declare-fun b!636398 () Bool)

(declare-fun res!411730 () Bool)

(assert (=> b!636398 (=> (not res!411730) (not e!364067))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636398 (= res!411730 (and (= (size!18710 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18710 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18710 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636399 () Bool)

(declare-fun e!364063 () Bool)

(declare-fun e!364065 () Bool)

(assert (=> b!636399 (= e!364063 e!364065)))

(declare-fun res!411735 () Bool)

(assert (=> b!636399 (=> (not res!411735) (not e!364065))))

(declare-datatypes ((SeekEntryResult!6786 0))(
  ( (MissingZero!6786 (index!29452 (_ BitVec 32))) (Found!6786 (index!29453 (_ BitVec 32))) (Intermediate!6786 (undefined!7598 Bool) (index!29454 (_ BitVec 32)) (x!58202 (_ BitVec 32))) (Undefined!6786) (MissingVacant!6786 (index!29455 (_ BitVec 32))) )
))
(declare-fun lt!294282 () SeekEntryResult!6786)

(assert (=> b!636399 (= res!411735 (and (= lt!294282 (Found!6786 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18346 a!2986) index!984) (select (arr!18346 a!2986) j!136))) (not (= (select (arr!18346 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38241 (_ BitVec 32)) SeekEntryResult!6786)

(assert (=> b!636399 (= lt!294282 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636400 () Bool)

(assert (=> b!636400 (= e!364056 e!364063)))

(declare-fun res!411727 () Bool)

(assert (=> b!636400 (=> (not res!411727) (not e!364063))))

(assert (=> b!636400 (= res!411727 (= (select (store (arr!18346 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636400 (= lt!294277 (array!38242 (store (arr!18346 a!2986) i!1108 k0!1786) (size!18710 a!2986)))))

(declare-fun b!636401 () Bool)

(declare-fun res!411743 () Bool)

(assert (=> b!636401 (=> (not res!411743) (not e!364067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636401 (= res!411743 (validKeyInArray!0 (select (arr!18346 a!2986) j!136)))))

(declare-fun b!636402 () Bool)

(assert (=> b!636402 (= e!364066 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) index!984))))

(declare-fun res!411744 () Bool)

(assert (=> start!57520 (=> (not res!411744) (not e!364067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57520 (= res!411744 (validMask!0 mask!3053))))

(assert (=> start!57520 e!364067))

(assert (=> start!57520 true))

(declare-fun array_inv!14142 (array!38241) Bool)

(assert (=> start!57520 (array_inv!14142 a!2986)))

(declare-fun b!636390 () Bool)

(declare-fun Unit!21481 () Unit!21478)

(assert (=> b!636390 (= e!364058 Unit!21481)))

(assert (=> b!636390 false))

(declare-fun b!636403 () Bool)

(declare-fun e!364059 () Bool)

(assert (=> b!636403 (= e!364065 (not e!364059))))

(declare-fun res!411731 () Bool)

(assert (=> b!636403 (=> res!411731 e!364059)))

(declare-fun lt!294276 () SeekEntryResult!6786)

(assert (=> b!636403 (= res!411731 (not (= lt!294276 (Found!6786 index!984))))))

(declare-fun lt!294281 () Unit!21478)

(assert (=> b!636403 (= lt!294281 e!364058)))

(declare-fun c!72698 () Bool)

(assert (=> b!636403 (= c!72698 (= lt!294276 Undefined!6786))))

(assert (=> b!636403 (= lt!294276 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294280 lt!294277 mask!3053))))

(declare-fun e!364057 () Bool)

(assert (=> b!636403 e!364057))

(declare-fun res!411739 () Bool)

(assert (=> b!636403 (=> (not res!411739) (not e!364057))))

(declare-fun lt!294279 () (_ BitVec 32))

(declare-fun lt!294273 () SeekEntryResult!6786)

(assert (=> b!636403 (= res!411739 (= lt!294273 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 lt!294280 lt!294277 mask!3053)))))

(assert (=> b!636403 (= lt!294273 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636403 (= lt!294280 (select (store (arr!18346 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294283 () Unit!21478)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21478)

(assert (=> b!636403 (= lt!294283 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636403 (= lt!294279 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636404 () Bool)

(assert (=> b!636404 (= e!364057 (= lt!294282 lt!294273))))

(declare-fun b!636405 () Bool)

(declare-fun e!364064 () Bool)

(assert (=> b!636405 (= e!364064 e!364062)))

(declare-fun res!411728 () Bool)

(assert (=> b!636405 (=> res!411728 e!364062)))

(assert (=> b!636405 (= res!411728 (or (bvsge (size!18710 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18710 a!2986))))))

(assert (=> b!636405 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294274 () Unit!21478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38241 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21478)

(assert (=> b!636405 (= lt!294274 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294277 (select (arr!18346 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636406 () Bool)

(assert (=> b!636406 (= e!364059 e!364064)))

(declare-fun res!411745 () Bool)

(assert (=> b!636406 (=> res!411745 e!364064)))

(assert (=> b!636406 (= res!411745 (or (not (= (select (arr!18346 a!2986) j!136) lt!294280)) (not (= (select (arr!18346 a!2986) j!136) lt!294278)) (bvsge j!136 index!984)))))

(assert (=> b!636406 e!364060))

(declare-fun res!411741 () Bool)

(assert (=> b!636406 (=> (not res!411741) (not e!364060))))

(assert (=> b!636406 (= res!411741 (= lt!294278 (select (arr!18346 a!2986) j!136)))))

(assert (=> b!636406 (= lt!294278 (select (store (arr!18346 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!636407 () Bool)

(declare-fun res!411737 () Bool)

(assert (=> b!636407 (=> res!411737 e!364062)))

(declare-fun noDuplicate!379 (List!12387) Bool)

(assert (=> b!636407 (= res!411737 (not (noDuplicate!379 Nil!12384)))))

(declare-fun b!636408 () Bool)

(declare-fun res!411729 () Bool)

(assert (=> b!636408 (=> (not res!411729) (not e!364056))))

(declare-fun arrayNoDuplicates!0 (array!38241 (_ BitVec 32) List!12387) Bool)

(assert (=> b!636408 (= res!411729 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12384))))

(declare-fun b!636409 () Bool)

(declare-fun res!411736 () Bool)

(assert (=> b!636409 (=> (not res!411736) (not e!364067))))

(assert (=> b!636409 (= res!411736 (validKeyInArray!0 k0!1786))))

(declare-fun b!636410 () Bool)

(assert (=> b!636410 (= e!364067 e!364056)))

(declare-fun res!411733 () Bool)

(assert (=> b!636410 (=> (not res!411733) (not e!364056))))

(declare-fun lt!294275 () SeekEntryResult!6786)

(assert (=> b!636410 (= res!411733 (or (= lt!294275 (MissingZero!6786 i!1108)) (= lt!294275 (MissingVacant!6786 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38241 (_ BitVec 32)) SeekEntryResult!6786)

(assert (=> b!636410 (= lt!294275 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!57520 res!411744) b!636398))

(assert (= (and b!636398 res!411730) b!636401))

(assert (= (and b!636401 res!411743) b!636409))

(assert (= (and b!636409 res!411736) b!636394))

(assert (= (and b!636394 res!411746) b!636410))

(assert (= (and b!636410 res!411733) b!636395))

(assert (= (and b!636395 res!411740) b!636408))

(assert (= (and b!636408 res!411729) b!636396))

(assert (= (and b!636396 res!411734) b!636400))

(assert (= (and b!636400 res!411727) b!636399))

(assert (= (and b!636399 res!411735) b!636403))

(assert (= (and b!636403 res!411739) b!636404))

(assert (= (and b!636403 c!72698) b!636390))

(assert (= (and b!636403 (not c!72698)) b!636393))

(assert (= (and b!636403 (not res!411731)) b!636406))

(assert (= (and b!636406 res!411741) b!636391))

(assert (= (and b!636391 (not res!411738)) b!636397))

(assert (= (and b!636397 res!411742) b!636402))

(assert (= (and b!636406 (not res!411745)) b!636405))

(assert (= (and b!636405 (not res!411728)) b!636407))

(assert (= (and b!636407 (not res!411737)) b!636389))

(assert (= (and b!636389 res!411732) b!636392))

(declare-fun m!610609 () Bool)

(assert (=> b!636410 m!610609))

(declare-fun m!610611 () Bool)

(assert (=> b!636402 m!610611))

(assert (=> b!636402 m!610611))

(declare-fun m!610613 () Bool)

(assert (=> b!636402 m!610613))

(declare-fun m!610615 () Bool)

(assert (=> b!636400 m!610615))

(declare-fun m!610617 () Bool)

(assert (=> b!636400 m!610617))

(declare-fun m!610619 () Bool)

(assert (=> b!636407 m!610619))

(assert (=> b!636391 m!610611))

(declare-fun m!610621 () Bool)

(assert (=> b!636409 m!610621))

(assert (=> b!636397 m!610611))

(assert (=> b!636397 m!610611))

(declare-fun m!610623 () Bool)

(assert (=> b!636397 m!610623))

(declare-fun m!610625 () Bool)

(assert (=> b!636392 m!610625))

(declare-fun m!610627 () Bool)

(assert (=> b!636395 m!610627))

(assert (=> b!636406 m!610611))

(assert (=> b!636406 m!610615))

(declare-fun m!610629 () Bool)

(assert (=> b!636406 m!610629))

(declare-fun m!610631 () Bool)

(assert (=> b!636394 m!610631))

(assert (=> b!636401 m!610611))

(assert (=> b!636401 m!610611))

(declare-fun m!610633 () Bool)

(assert (=> b!636401 m!610633))

(assert (=> b!636405 m!610611))

(assert (=> b!636405 m!610611))

(declare-fun m!610635 () Bool)

(assert (=> b!636405 m!610635))

(assert (=> b!636405 m!610611))

(declare-fun m!610637 () Bool)

(assert (=> b!636405 m!610637))

(declare-fun m!610639 () Bool)

(assert (=> b!636396 m!610639))

(declare-fun m!610641 () Bool)

(assert (=> b!636408 m!610641))

(declare-fun m!610643 () Bool)

(assert (=> b!636403 m!610643))

(declare-fun m!610645 () Bool)

(assert (=> b!636403 m!610645))

(assert (=> b!636403 m!610611))

(assert (=> b!636403 m!610615))

(declare-fun m!610647 () Bool)

(assert (=> b!636403 m!610647))

(assert (=> b!636403 m!610611))

(declare-fun m!610649 () Bool)

(assert (=> b!636403 m!610649))

(declare-fun m!610651 () Bool)

(assert (=> b!636403 m!610651))

(declare-fun m!610653 () Bool)

(assert (=> b!636403 m!610653))

(declare-fun m!610655 () Bool)

(assert (=> start!57520 m!610655))

(declare-fun m!610657 () Bool)

(assert (=> start!57520 m!610657))

(declare-fun m!610659 () Bool)

(assert (=> b!636399 m!610659))

(assert (=> b!636399 m!610611))

(assert (=> b!636399 m!610611))

(declare-fun m!610661 () Bool)

(assert (=> b!636399 m!610661))

(declare-fun m!610663 () Bool)

(assert (=> b!636389 m!610663))

(check-sat (not b!636408) (not b!636394) (not b!636399) (not b!636410) (not b!636402) (not b!636395) (not b!636389) (not b!636397) (not b!636401) (not b!636403) (not b!636392) (not b!636405) (not b!636407) (not start!57520) (not b!636409))
(check-sat)
(get-model)

(declare-fun d!89939 () Bool)

(assert (=> d!89939 (= (validKeyInArray!0 (select (arr!18346 a!2986) j!136)) (and (not (= (select (arr!18346 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18346 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636401 d!89939))

(declare-fun b!636489 () Bool)

(declare-fun e!364117 () SeekEntryResult!6786)

(declare-fun e!364119 () SeekEntryResult!6786)

(assert (=> b!636489 (= e!364117 e!364119)))

(declare-fun c!72708 () Bool)

(declare-fun lt!294321 () (_ BitVec 64))

(assert (=> b!636489 (= c!72708 (= lt!294321 (select (arr!18346 a!2986) j!136)))))

(declare-fun b!636490 () Bool)

(assert (=> b!636490 (= e!364117 Undefined!6786)))

(declare-fun b!636491 () Bool)

(declare-fun e!364118 () SeekEntryResult!6786)

(assert (=> b!636491 (= e!364118 (MissingVacant!6786 vacantSpotIndex!68))))

(declare-fun b!636492 () Bool)

(assert (=> b!636492 (= e!364118 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636493 () Bool)

(assert (=> b!636493 (= e!364119 (Found!6786 index!984))))

(declare-fun b!636494 () Bool)

(declare-fun c!72709 () Bool)

(assert (=> b!636494 (= c!72709 (= lt!294321 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636494 (= e!364119 e!364118)))

(declare-fun lt!294322 () SeekEntryResult!6786)

(declare-fun d!89941 () Bool)

(get-info :version)

(assert (=> d!89941 (and (or ((_ is Undefined!6786) lt!294322) (not ((_ is Found!6786) lt!294322)) (and (bvsge (index!29453 lt!294322) #b00000000000000000000000000000000) (bvslt (index!29453 lt!294322) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294322) ((_ is Found!6786) lt!294322) (not ((_ is MissingVacant!6786) lt!294322)) (not (= (index!29455 lt!294322) vacantSpotIndex!68)) (and (bvsge (index!29455 lt!294322) #b00000000000000000000000000000000) (bvslt (index!29455 lt!294322) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294322) (ite ((_ is Found!6786) lt!294322) (= (select (arr!18346 a!2986) (index!29453 lt!294322)) (select (arr!18346 a!2986) j!136)) (and ((_ is MissingVacant!6786) lt!294322) (= (index!29455 lt!294322) vacantSpotIndex!68) (= (select (arr!18346 a!2986) (index!29455 lt!294322)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89941 (= lt!294322 e!364117)))

(declare-fun c!72710 () Bool)

(assert (=> d!89941 (= c!72710 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89941 (= lt!294321 (select (arr!18346 a!2986) index!984))))

(assert (=> d!89941 (validMask!0 mask!3053)))

(assert (=> d!89941 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053) lt!294322)))

(assert (= (and d!89941 c!72710) b!636490))

(assert (= (and d!89941 (not c!72710)) b!636489))

(assert (= (and b!636489 c!72708) b!636493))

(assert (= (and b!636489 (not c!72708)) b!636494))

(assert (= (and b!636494 c!72709) b!636491))

(assert (= (and b!636494 (not c!72709)) b!636492))

(assert (=> b!636492 m!610643))

(assert (=> b!636492 m!610643))

(assert (=> b!636492 m!610611))

(declare-fun m!610721 () Bool)

(assert (=> b!636492 m!610721))

(declare-fun m!610723 () Bool)

(assert (=> d!89941 m!610723))

(declare-fun m!610725 () Bool)

(assert (=> d!89941 m!610725))

(assert (=> d!89941 m!610659))

(assert (=> d!89941 m!610655))

(assert (=> b!636399 d!89941))

(declare-fun b!636507 () Bool)

(declare-fun e!364126 () SeekEntryResult!6786)

(assert (=> b!636507 (= e!364126 Undefined!6786)))

(declare-fun d!89943 () Bool)

(declare-fun lt!294329 () SeekEntryResult!6786)

(assert (=> d!89943 (and (or ((_ is Undefined!6786) lt!294329) (not ((_ is Found!6786) lt!294329)) (and (bvsge (index!29453 lt!294329) #b00000000000000000000000000000000) (bvslt (index!29453 lt!294329) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294329) ((_ is Found!6786) lt!294329) (not ((_ is MissingZero!6786) lt!294329)) (and (bvsge (index!29452 lt!294329) #b00000000000000000000000000000000) (bvslt (index!29452 lt!294329) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294329) ((_ is Found!6786) lt!294329) ((_ is MissingZero!6786) lt!294329) (not ((_ is MissingVacant!6786) lt!294329)) (and (bvsge (index!29455 lt!294329) #b00000000000000000000000000000000) (bvslt (index!29455 lt!294329) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294329) (ite ((_ is Found!6786) lt!294329) (= (select (arr!18346 a!2986) (index!29453 lt!294329)) k0!1786) (ite ((_ is MissingZero!6786) lt!294329) (= (select (arr!18346 a!2986) (index!29452 lt!294329)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6786) lt!294329) (= (select (arr!18346 a!2986) (index!29455 lt!294329)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89943 (= lt!294329 e!364126)))

(declare-fun c!72719 () Bool)

(declare-fun lt!294330 () SeekEntryResult!6786)

(assert (=> d!89943 (= c!72719 (and ((_ is Intermediate!6786) lt!294330) (undefined!7598 lt!294330)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38241 (_ BitVec 32)) SeekEntryResult!6786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89943 (= lt!294330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89943 (validMask!0 mask!3053)))

(assert (=> d!89943 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!294329)))

(declare-fun b!636508 () Bool)

(declare-fun c!72717 () Bool)

(declare-fun lt!294331 () (_ BitVec 64))

(assert (=> b!636508 (= c!72717 (= lt!294331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364127 () SeekEntryResult!6786)

(declare-fun e!364128 () SeekEntryResult!6786)

(assert (=> b!636508 (= e!364127 e!364128)))

(declare-fun b!636509 () Bool)

(assert (=> b!636509 (= e!364128 (MissingZero!6786 (index!29454 lt!294330)))))

(declare-fun b!636510 () Bool)

(assert (=> b!636510 (= e!364128 (seekKeyOrZeroReturnVacant!0 (x!58202 lt!294330) (index!29454 lt!294330) (index!29454 lt!294330) k0!1786 a!2986 mask!3053))))

(declare-fun b!636511 () Bool)

(assert (=> b!636511 (= e!364126 e!364127)))

(assert (=> b!636511 (= lt!294331 (select (arr!18346 a!2986) (index!29454 lt!294330)))))

(declare-fun c!72718 () Bool)

(assert (=> b!636511 (= c!72718 (= lt!294331 k0!1786))))

(declare-fun b!636512 () Bool)

(assert (=> b!636512 (= e!364127 (Found!6786 (index!29454 lt!294330)))))

(assert (= (and d!89943 c!72719) b!636507))

(assert (= (and d!89943 (not c!72719)) b!636511))

(assert (= (and b!636511 c!72718) b!636512))

(assert (= (and b!636511 (not c!72718)) b!636508))

(assert (= (and b!636508 c!72717) b!636509))

(assert (= (and b!636508 (not c!72717)) b!636510))

(declare-fun m!610727 () Bool)

(assert (=> d!89943 m!610727))

(declare-fun m!610729 () Bool)

(assert (=> d!89943 m!610729))

(declare-fun m!610731 () Bool)

(assert (=> d!89943 m!610731))

(assert (=> d!89943 m!610655))

(assert (=> d!89943 m!610731))

(declare-fun m!610733 () Bool)

(assert (=> d!89943 m!610733))

(declare-fun m!610735 () Bool)

(assert (=> d!89943 m!610735))

(declare-fun m!610737 () Bool)

(assert (=> b!636510 m!610737))

(declare-fun m!610739 () Bool)

(assert (=> b!636511 m!610739))

(assert (=> b!636410 d!89943))

(declare-fun d!89953 () Bool)

(declare-fun lt!294337 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!241 (List!12387) (InoxSet (_ BitVec 64)))

(assert (=> d!89953 (= lt!294337 (select (content!241 Nil!12384) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364140 () Bool)

(assert (=> d!89953 (= lt!294337 e!364140)))

(declare-fun res!411818 () Bool)

(assert (=> d!89953 (=> (not res!411818) (not e!364140))))

(assert (=> d!89953 (= res!411818 ((_ is Cons!12383) Nil!12384))))

(assert (=> d!89953 (= (contains!3101 Nil!12384 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294337)))

(declare-fun b!636523 () Bool)

(declare-fun e!364139 () Bool)

(assert (=> b!636523 (= e!364140 e!364139)))

(declare-fun res!411817 () Bool)

(assert (=> b!636523 (=> res!411817 e!364139)))

(assert (=> b!636523 (= res!411817 (= (h!13428 Nil!12384) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636524 () Bool)

(assert (=> b!636524 (= e!364139 (contains!3101 (t!18615 Nil!12384) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!89953 res!411818) b!636523))

(assert (= (and b!636523 (not res!411817)) b!636524))

(declare-fun m!610747 () Bool)

(assert (=> d!89953 m!610747))

(declare-fun m!610749 () Bool)

(assert (=> d!89953 m!610749))

(declare-fun m!610751 () Bool)

(assert (=> b!636524 m!610751))

(assert (=> b!636389 d!89953))

(declare-fun b!636541 () Bool)

(declare-fun e!364158 () Bool)

(declare-fun e!364156 () Bool)

(assert (=> b!636541 (= e!364158 e!364156)))

(declare-fun c!72722 () Bool)

(assert (=> b!636541 (= c!72722 (validKeyInArray!0 (select (arr!18346 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33431 () Bool)

(declare-fun call!33434 () Bool)

(assert (=> bm!33431 (= call!33434 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72722 (Cons!12383 (select (arr!18346 a!2986) #b00000000000000000000000000000000) Nil!12384) Nil!12384)))))

(declare-fun b!636542 () Bool)

(assert (=> b!636542 (= e!364156 call!33434)))

(declare-fun d!89957 () Bool)

(declare-fun res!411832 () Bool)

(declare-fun e!364155 () Bool)

(assert (=> d!89957 (=> res!411832 e!364155)))

(assert (=> d!89957 (= res!411832 (bvsge #b00000000000000000000000000000000 (size!18710 a!2986)))))

(assert (=> d!89957 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12384) e!364155)))

(declare-fun b!636543 () Bool)

(declare-fun e!364157 () Bool)

(assert (=> b!636543 (= e!364157 (contains!3101 Nil!12384 (select (arr!18346 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636544 () Bool)

(assert (=> b!636544 (= e!364155 e!364158)))

(declare-fun res!411833 () Bool)

(assert (=> b!636544 (=> (not res!411833) (not e!364158))))

(assert (=> b!636544 (= res!411833 (not e!364157))))

(declare-fun res!411831 () Bool)

(assert (=> b!636544 (=> (not res!411831) (not e!364157))))

(assert (=> b!636544 (= res!411831 (validKeyInArray!0 (select (arr!18346 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!636545 () Bool)

(assert (=> b!636545 (= e!364156 call!33434)))

(assert (= (and d!89957 (not res!411832)) b!636544))

(assert (= (and b!636544 res!411831) b!636543))

(assert (= (and b!636544 res!411833) b!636541))

(assert (= (and b!636541 c!72722) b!636545))

(assert (= (and b!636541 (not c!72722)) b!636542))

(assert (= (or b!636545 b!636542) bm!33431))

(declare-fun m!610757 () Bool)

(assert (=> b!636541 m!610757))

(assert (=> b!636541 m!610757))

(declare-fun m!610761 () Bool)

(assert (=> b!636541 m!610761))

(assert (=> bm!33431 m!610757))

(declare-fun m!610763 () Bool)

(assert (=> bm!33431 m!610763))

(assert (=> b!636543 m!610757))

(assert (=> b!636543 m!610757))

(declare-fun m!610765 () Bool)

(assert (=> b!636543 m!610765))

(assert (=> b!636544 m!610757))

(assert (=> b!636544 m!610757))

(assert (=> b!636544 m!610761))

(assert (=> b!636408 d!89957))

(declare-fun d!89965 () Bool)

(assert (=> d!89965 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57520 d!89965))

(declare-fun d!89975 () Bool)

(assert (=> d!89975 (= (array_inv!14142 a!2986) (bvsge (size!18710 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57520 d!89975))

(declare-fun d!89977 () Bool)

(assert (=> d!89977 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636409 d!89977))

(declare-fun d!89979 () Bool)

(declare-fun res!411862 () Bool)

(declare-fun e!364187 () Bool)

(assert (=> d!89979 (=> res!411862 e!364187)))

(assert (=> d!89979 (= res!411862 ((_ is Nil!12384) Nil!12384))))

(assert (=> d!89979 (= (noDuplicate!379 Nil!12384) e!364187)))

(declare-fun b!636574 () Bool)

(declare-fun e!364188 () Bool)

(assert (=> b!636574 (= e!364187 e!364188)))

(declare-fun res!411863 () Bool)

(assert (=> b!636574 (=> (not res!411863) (not e!364188))))

(assert (=> b!636574 (= res!411863 (not (contains!3101 (t!18615 Nil!12384) (h!13428 Nil!12384))))))

(declare-fun b!636575 () Bool)

(assert (=> b!636575 (= e!364188 (noDuplicate!379 (t!18615 Nil!12384)))))

(assert (= (and d!89979 (not res!411862)) b!636574))

(assert (= (and b!636574 res!411863) b!636575))

(declare-fun m!610785 () Bool)

(assert (=> b!636574 m!610785))

(declare-fun m!610787 () Bool)

(assert (=> b!636575 m!610787))

(assert (=> b!636407 d!89979))

(declare-fun d!89981 () Bool)

(declare-fun res!411872 () Bool)

(declare-fun e!364197 () Bool)

(assert (=> d!89981 (=> res!411872 e!364197)))

(assert (=> d!89981 (= res!411872 (= (select (arr!18346 lt!294277) j!136) (select (arr!18346 a!2986) j!136)))))

(assert (=> d!89981 (= (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) j!136) e!364197)))

(declare-fun b!636584 () Bool)

(declare-fun e!364198 () Bool)

(assert (=> b!636584 (= e!364197 e!364198)))

(declare-fun res!411873 () Bool)

(assert (=> b!636584 (=> (not res!411873) (not e!364198))))

(assert (=> b!636584 (= res!411873 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18710 lt!294277)))))

(declare-fun b!636585 () Bool)

(assert (=> b!636585 (= e!364198 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89981 (not res!411872)) b!636584))

(assert (= (and b!636584 res!411873) b!636585))

(declare-fun m!610797 () Bool)

(assert (=> d!89981 m!610797))

(assert (=> b!636585 m!610611))

(declare-fun m!610799 () Bool)

(assert (=> b!636585 m!610799))

(assert (=> b!636397 d!89981))

(declare-fun b!636610 () Bool)

(declare-fun e!364215 () Bool)

(declare-fun e!364216 () Bool)

(assert (=> b!636610 (= e!364215 e!364216)))

(declare-fun c!72731 () Bool)

(assert (=> b!636610 (= c!72731 (validKeyInArray!0 (select (arr!18346 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33434 () Bool)

(declare-fun call!33437 () Bool)

(assert (=> bm!33434 (= call!33437 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89987 () Bool)

(declare-fun res!411882 () Bool)

(assert (=> d!89987 (=> res!411882 e!364215)))

(assert (=> d!89987 (= res!411882 (bvsge #b00000000000000000000000000000000 (size!18710 a!2986)))))

(assert (=> d!89987 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!364215)))

(declare-fun b!636611 () Bool)

(declare-fun e!364217 () Bool)

(assert (=> b!636611 (= e!364216 e!364217)))

(declare-fun lt!294360 () (_ BitVec 64))

(assert (=> b!636611 (= lt!294360 (select (arr!18346 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!294359 () Unit!21478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38241 (_ BitVec 64) (_ BitVec 32)) Unit!21478)

(assert (=> b!636611 (= lt!294359 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!294360 #b00000000000000000000000000000000))))

(assert (=> b!636611 (arrayContainsKey!0 a!2986 lt!294360 #b00000000000000000000000000000000)))

(declare-fun lt!294358 () Unit!21478)

(assert (=> b!636611 (= lt!294358 lt!294359)))

(declare-fun res!411883 () Bool)

(assert (=> b!636611 (= res!411883 (= (seekEntryOrOpen!0 (select (arr!18346 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6786 #b00000000000000000000000000000000)))))

(assert (=> b!636611 (=> (not res!411883) (not e!364217))))

(declare-fun b!636612 () Bool)

(assert (=> b!636612 (= e!364217 call!33437)))

(declare-fun b!636613 () Bool)

(assert (=> b!636613 (= e!364216 call!33437)))

(assert (= (and d!89987 (not res!411882)) b!636610))

(assert (= (and b!636610 c!72731) b!636611))

(assert (= (and b!636610 (not c!72731)) b!636613))

(assert (= (and b!636611 res!411883) b!636612))

(assert (= (or b!636612 b!636613) bm!33434))

(assert (=> b!636610 m!610757))

(assert (=> b!636610 m!610757))

(assert (=> b!636610 m!610761))

(declare-fun m!610811 () Bool)

(assert (=> bm!33434 m!610811))

(assert (=> b!636611 m!610757))

(declare-fun m!610813 () Bool)

(assert (=> b!636611 m!610813))

(declare-fun m!610815 () Bool)

(assert (=> b!636611 m!610815))

(assert (=> b!636611 m!610757))

(declare-fun m!610817 () Bool)

(assert (=> b!636611 m!610817))

(assert (=> b!636395 d!89987))

(declare-fun d!89995 () Bool)

(declare-fun res!411884 () Bool)

(declare-fun e!364218 () Bool)

(assert (=> d!89995 (=> res!411884 e!364218)))

(assert (=> d!89995 (= res!411884 (= (select (arr!18346 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89995 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!364218)))

(declare-fun b!636614 () Bool)

(declare-fun e!364219 () Bool)

(assert (=> b!636614 (= e!364218 e!364219)))

(declare-fun res!411885 () Bool)

(assert (=> b!636614 (=> (not res!411885) (not e!364219))))

(assert (=> b!636614 (= res!411885 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18710 a!2986)))))

(declare-fun b!636615 () Bool)

(assert (=> b!636615 (= e!364219 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89995 (not res!411884)) b!636614))

(assert (= (and b!636614 res!411885) b!636615))

(assert (=> d!89995 m!610757))

(declare-fun m!610819 () Bool)

(assert (=> b!636615 m!610819))

(assert (=> b!636394 d!89995))

(declare-fun d!89997 () Bool)

(declare-fun res!411886 () Bool)

(declare-fun e!364220 () Bool)

(assert (=> d!89997 (=> res!411886 e!364220)))

(assert (=> d!89997 (= res!411886 (= (select (arr!18346 lt!294277) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18346 a!2986) j!136)))))

(assert (=> d!89997 (= (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364220)))

(declare-fun b!636616 () Bool)

(declare-fun e!364221 () Bool)

(assert (=> b!636616 (= e!364220 e!364221)))

(declare-fun res!411887 () Bool)

(assert (=> b!636616 (=> (not res!411887) (not e!364221))))

(assert (=> b!636616 (= res!411887 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18710 lt!294277)))))

(declare-fun b!636617 () Bool)

(assert (=> b!636617 (= e!364221 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89997 (not res!411886)) b!636616))

(assert (= (and b!636616 res!411887) b!636617))

(declare-fun m!610821 () Bool)

(assert (=> d!89997 m!610821))

(assert (=> b!636617 m!610611))

(declare-fun m!610823 () Bool)

(assert (=> b!636617 m!610823))

(assert (=> b!636405 d!89997))

(declare-fun d!89999 () Bool)

(assert (=> d!89999 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294363 () Unit!21478)

(declare-fun choose!114 (array!38241 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21478)

(assert (=> d!89999 (= lt!294363 (choose!114 lt!294277 (select (arr!18346 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!89999 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!89999 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294277 (select (arr!18346 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294363)))

(declare-fun bs!19116 () Bool)

(assert (= bs!19116 d!89999))

(assert (=> bs!19116 m!610611))

(assert (=> bs!19116 m!610635))

(assert (=> bs!19116 m!610611))

(declare-fun m!610825 () Bool)

(assert (=> bs!19116 m!610825))

(assert (=> b!636405 d!89999))

(declare-fun d!90001 () Bool)

(declare-fun lt!294364 () Bool)

(assert (=> d!90001 (= lt!294364 (select (content!241 Nil!12384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364223 () Bool)

(assert (=> d!90001 (= lt!294364 e!364223)))

(declare-fun res!411889 () Bool)

(assert (=> d!90001 (=> (not res!411889) (not e!364223))))

(assert (=> d!90001 (= res!411889 ((_ is Cons!12383) Nil!12384))))

(assert (=> d!90001 (= (contains!3101 Nil!12384 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294364)))

(declare-fun b!636618 () Bool)

(declare-fun e!364222 () Bool)

(assert (=> b!636618 (= e!364223 e!364222)))

(declare-fun res!411888 () Bool)

(assert (=> b!636618 (=> res!411888 e!364222)))

(assert (=> b!636618 (= res!411888 (= (h!13428 Nil!12384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636619 () Bool)

(assert (=> b!636619 (= e!364222 (contains!3101 (t!18615 Nil!12384) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90001 res!411889) b!636618))

(assert (= (and b!636618 (not res!411888)) b!636619))

(assert (=> d!90001 m!610747))

(declare-fun m!610827 () Bool)

(assert (=> d!90001 m!610827))

(declare-fun m!610829 () Bool)

(assert (=> b!636619 m!610829))

(assert (=> b!636392 d!90001))

(declare-fun b!636626 () Bool)

(declare-fun e!364227 () SeekEntryResult!6786)

(declare-fun e!364229 () SeekEntryResult!6786)

(assert (=> b!636626 (= e!364227 e!364229)))

(declare-fun lt!294367 () (_ BitVec 64))

(declare-fun c!72735 () Bool)

(assert (=> b!636626 (= c!72735 (= lt!294367 (select (arr!18346 a!2986) j!136)))))

(declare-fun b!636627 () Bool)

(assert (=> b!636627 (= e!364227 Undefined!6786)))

(declare-fun b!636628 () Bool)

(declare-fun e!364228 () SeekEntryResult!6786)

(assert (=> b!636628 (= e!364228 (MissingVacant!6786 vacantSpotIndex!68))))

(declare-fun b!636629 () Bool)

(assert (=> b!636629 (= e!364228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294279 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636630 () Bool)

(assert (=> b!636630 (= e!364229 (Found!6786 lt!294279))))

(declare-fun b!636631 () Bool)

(declare-fun c!72736 () Bool)

(assert (=> b!636631 (= c!72736 (= lt!294367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636631 (= e!364229 e!364228)))

(declare-fun d!90003 () Bool)

(declare-fun lt!294368 () SeekEntryResult!6786)

(assert (=> d!90003 (and (or ((_ is Undefined!6786) lt!294368) (not ((_ is Found!6786) lt!294368)) (and (bvsge (index!29453 lt!294368) #b00000000000000000000000000000000) (bvslt (index!29453 lt!294368) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294368) ((_ is Found!6786) lt!294368) (not ((_ is MissingVacant!6786) lt!294368)) (not (= (index!29455 lt!294368) vacantSpotIndex!68)) (and (bvsge (index!29455 lt!294368) #b00000000000000000000000000000000) (bvslt (index!29455 lt!294368) (size!18710 a!2986)))) (or ((_ is Undefined!6786) lt!294368) (ite ((_ is Found!6786) lt!294368) (= (select (arr!18346 a!2986) (index!29453 lt!294368)) (select (arr!18346 a!2986) j!136)) (and ((_ is MissingVacant!6786) lt!294368) (= (index!29455 lt!294368) vacantSpotIndex!68) (= (select (arr!18346 a!2986) (index!29455 lt!294368)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90003 (= lt!294368 e!364227)))

(declare-fun c!72737 () Bool)

(assert (=> d!90003 (= c!72737 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90003 (= lt!294367 (select (arr!18346 a!2986) lt!294279))))

(assert (=> d!90003 (validMask!0 mask!3053)))

(assert (=> d!90003 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053) lt!294368)))

(assert (= (and d!90003 c!72737) b!636627))

(assert (= (and d!90003 (not c!72737)) b!636626))

(assert (= (and b!636626 c!72735) b!636630))

(assert (= (and b!636626 (not c!72735)) b!636631))

(assert (= (and b!636631 c!72736) b!636628))

(assert (= (and b!636631 (not c!72736)) b!636629))

(declare-fun m!610833 () Bool)

(assert (=> b!636629 m!610833))

(assert (=> b!636629 m!610833))

(assert (=> b!636629 m!610611))

(declare-fun m!610837 () Bool)

(assert (=> b!636629 m!610837))

(declare-fun m!610841 () Bool)

(assert (=> d!90003 m!610841))

(declare-fun m!610845 () Bool)

(assert (=> d!90003 m!610845))

(declare-fun m!610847 () Bool)

(assert (=> d!90003 m!610847))

(assert (=> d!90003 m!610655))

(assert (=> b!636403 d!90003))

(declare-fun d!90007 () Bool)

(declare-fun lt!294373 () (_ BitVec 32))

(assert (=> d!90007 (and (bvsge lt!294373 #b00000000000000000000000000000000) (bvslt lt!294373 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90007 (= lt!294373 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90007 (validMask!0 mask!3053)))

(assert (=> d!90007 (= (nextIndex!0 index!984 x!910 mask!3053) lt!294373)))

(declare-fun bs!19117 () Bool)

(assert (= bs!19117 d!90007))

(declare-fun m!610859 () Bool)

(assert (=> bs!19117 m!610859))

(assert (=> bs!19117 m!610655))

(assert (=> b!636403 d!90007))

(declare-fun b!636638 () Bool)

(declare-fun e!364233 () SeekEntryResult!6786)

(declare-fun e!364235 () SeekEntryResult!6786)

(assert (=> b!636638 (= e!364233 e!364235)))

(declare-fun c!72741 () Bool)

(declare-fun lt!294374 () (_ BitVec 64))

(assert (=> b!636638 (= c!72741 (= lt!294374 lt!294280))))

(declare-fun b!636639 () Bool)

(assert (=> b!636639 (= e!364233 Undefined!6786)))

(declare-fun b!636640 () Bool)

(declare-fun e!364234 () SeekEntryResult!6786)

(assert (=> b!636640 (= e!364234 (MissingVacant!6786 vacantSpotIndex!68))))

(declare-fun b!636641 () Bool)

(assert (=> b!636641 (= e!364234 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!294280 lt!294277 mask!3053))))

(declare-fun b!636642 () Bool)

(assert (=> b!636642 (= e!364235 (Found!6786 index!984))))

(declare-fun b!636643 () Bool)

(declare-fun c!72742 () Bool)

(assert (=> b!636643 (= c!72742 (= lt!294374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636643 (= e!364235 e!364234)))

(declare-fun lt!294375 () SeekEntryResult!6786)

(declare-fun d!90011 () Bool)

(assert (=> d!90011 (and (or ((_ is Undefined!6786) lt!294375) (not ((_ is Found!6786) lt!294375)) (and (bvsge (index!29453 lt!294375) #b00000000000000000000000000000000) (bvslt (index!29453 lt!294375) (size!18710 lt!294277)))) (or ((_ is Undefined!6786) lt!294375) ((_ is Found!6786) lt!294375) (not ((_ is MissingVacant!6786) lt!294375)) (not (= (index!29455 lt!294375) vacantSpotIndex!68)) (and (bvsge (index!29455 lt!294375) #b00000000000000000000000000000000) (bvslt (index!29455 lt!294375) (size!18710 lt!294277)))) (or ((_ is Undefined!6786) lt!294375) (ite ((_ is Found!6786) lt!294375) (= (select (arr!18346 lt!294277) (index!29453 lt!294375)) lt!294280) (and ((_ is MissingVacant!6786) lt!294375) (= (index!29455 lt!294375) vacantSpotIndex!68) (= (select (arr!18346 lt!294277) (index!29455 lt!294375)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90011 (= lt!294375 e!364233)))

(declare-fun c!72743 () Bool)

(assert (=> d!90011 (= c!72743 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90011 (= lt!294374 (select (arr!18346 lt!294277) index!984))))

(assert (=> d!90011 (validMask!0 mask!3053)))

(assert (=> d!90011 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294280 lt!294277 mask!3053) lt!294375)))

(assert (= (and d!90011 c!72743) b!636639))

(assert (= (and d!90011 (not c!72743)) b!636638))

(assert (= (and b!636638 c!72741) b!636642))

(assert (= (and b!636638 (not c!72741)) b!636643))

(assert (= (and b!636643 c!72742) b!636640))

(assert (= (and b!636643 (not c!72742)) b!636641))

(assert (=> b!636641 m!610643))

(assert (=> b!636641 m!610643))

(declare-fun m!610861 () Bool)

(assert (=> b!636641 m!610861))

(declare-fun m!610863 () Bool)

(assert (=> d!90011 m!610863))

(declare-fun m!610865 () Bool)

(assert (=> d!90011 m!610865))

(declare-fun m!610867 () Bool)

(assert (=> d!90011 m!610867))

(assert (=> d!90011 m!610655))

(assert (=> b!636403 d!90011))

(declare-fun d!90013 () Bool)

(declare-fun e!364240 () Bool)

(assert (=> d!90013 e!364240))

(declare-fun res!411894 () Bool)

(assert (=> d!90013 (=> (not res!411894) (not e!364240))))

(assert (=> d!90013 (= res!411894 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18710 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18710 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18710 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18710 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18710 a!2986))))))

(declare-fun lt!294378 () Unit!21478)

(declare-fun choose!9 (array!38241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21478)

(assert (=> d!90013 (= lt!294378 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90013 (validMask!0 mask!3053)))

(assert (=> d!90013 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 mask!3053) lt!294378)))

(declare-fun b!636648 () Bool)

(assert (=> b!636648 (= e!364240 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 (select (arr!18346 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 (select (store (arr!18346 a!2986) i!1108 k0!1786) j!136) (array!38242 (store (arr!18346 a!2986) i!1108 k0!1786) (size!18710 a!2986)) mask!3053)))))

(assert (= (and d!90013 res!411894) b!636648))

(declare-fun m!610873 () Bool)

(assert (=> d!90013 m!610873))

(assert (=> d!90013 m!610655))

(assert (=> b!636648 m!610645))

(assert (=> b!636648 m!610611))

(assert (=> b!636648 m!610649))

(assert (=> b!636648 m!610645))

(declare-fun m!610875 () Bool)

(assert (=> b!636648 m!610875))

(assert (=> b!636648 m!610611))

(assert (=> b!636648 m!610615))

(assert (=> b!636403 d!90013))

(declare-fun b!636649 () Bool)

(declare-fun e!364241 () SeekEntryResult!6786)

(declare-fun e!364243 () SeekEntryResult!6786)

(assert (=> b!636649 (= e!364241 e!364243)))

(declare-fun c!72744 () Bool)

(declare-fun lt!294379 () (_ BitVec 64))

(assert (=> b!636649 (= c!72744 (= lt!294379 lt!294280))))

(declare-fun b!636650 () Bool)

(assert (=> b!636650 (= e!364241 Undefined!6786)))

(declare-fun b!636651 () Bool)

(declare-fun e!364242 () SeekEntryResult!6786)

(assert (=> b!636651 (= e!364242 (MissingVacant!6786 vacantSpotIndex!68))))

(declare-fun b!636652 () Bool)

(assert (=> b!636652 (= e!364242 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!294279 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!294280 lt!294277 mask!3053))))

(declare-fun b!636653 () Bool)

(assert (=> b!636653 (= e!364243 (Found!6786 lt!294279))))

(declare-fun b!636654 () Bool)

(declare-fun c!72745 () Bool)

(assert (=> b!636654 (= c!72745 (= lt!294379 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636654 (= e!364243 e!364242)))

(declare-fun d!90023 () Bool)

(declare-fun lt!294380 () SeekEntryResult!6786)

(assert (=> d!90023 (and (or ((_ is Undefined!6786) lt!294380) (not ((_ is Found!6786) lt!294380)) (and (bvsge (index!29453 lt!294380) #b00000000000000000000000000000000) (bvslt (index!29453 lt!294380) (size!18710 lt!294277)))) (or ((_ is Undefined!6786) lt!294380) ((_ is Found!6786) lt!294380) (not ((_ is MissingVacant!6786) lt!294380)) (not (= (index!29455 lt!294380) vacantSpotIndex!68)) (and (bvsge (index!29455 lt!294380) #b00000000000000000000000000000000) (bvslt (index!29455 lt!294380) (size!18710 lt!294277)))) (or ((_ is Undefined!6786) lt!294380) (ite ((_ is Found!6786) lt!294380) (= (select (arr!18346 lt!294277) (index!29453 lt!294380)) lt!294280) (and ((_ is MissingVacant!6786) lt!294380) (= (index!29455 lt!294380) vacantSpotIndex!68) (= (select (arr!18346 lt!294277) (index!29455 lt!294380)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90023 (= lt!294380 e!364241)))

(declare-fun c!72746 () Bool)

(assert (=> d!90023 (= c!72746 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90023 (= lt!294379 (select (arr!18346 lt!294277) lt!294279))))

(assert (=> d!90023 (validMask!0 mask!3053)))

(assert (=> d!90023 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294279 vacantSpotIndex!68 lt!294280 lt!294277 mask!3053) lt!294380)))

(assert (= (and d!90023 c!72746) b!636650))

(assert (= (and d!90023 (not c!72746)) b!636649))

(assert (= (and b!636649 c!72744) b!636653))

(assert (= (and b!636649 (not c!72744)) b!636654))

(assert (= (and b!636654 c!72745) b!636651))

(assert (= (and b!636654 (not c!72745)) b!636652))

(assert (=> b!636652 m!610833))

(assert (=> b!636652 m!610833))

(declare-fun m!610877 () Bool)

(assert (=> b!636652 m!610877))

(declare-fun m!610879 () Bool)

(assert (=> d!90023 m!610879))

(declare-fun m!610881 () Bool)

(assert (=> d!90023 m!610881))

(declare-fun m!610883 () Bool)

(assert (=> d!90023 m!610883))

(assert (=> d!90023 m!610655))

(assert (=> b!636403 d!90023))

(declare-fun d!90025 () Bool)

(declare-fun res!411895 () Bool)

(declare-fun e!364244 () Bool)

(assert (=> d!90025 (=> res!411895 e!364244)))

(assert (=> d!90025 (= res!411895 (= (select (arr!18346 lt!294277) index!984) (select (arr!18346 a!2986) j!136)))))

(assert (=> d!90025 (= (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) index!984) e!364244)))

(declare-fun b!636655 () Bool)

(declare-fun e!364245 () Bool)

(assert (=> b!636655 (= e!364244 e!364245)))

(declare-fun res!411896 () Bool)

(assert (=> b!636655 (=> (not res!411896) (not e!364245))))

(assert (=> b!636655 (= res!411896 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18710 lt!294277)))))

(declare-fun b!636656 () Bool)

(assert (=> b!636656 (= e!364245 (arrayContainsKey!0 lt!294277 (select (arr!18346 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90025 (not res!411895)) b!636655))

(assert (= (and b!636655 res!411896) b!636656))

(assert (=> d!90025 m!610867))

(assert (=> b!636656 m!610611))

(declare-fun m!610885 () Bool)

(assert (=> b!636656 m!610885))

(assert (=> b!636402 d!90025))

(check-sat (not b!636656) (not bm!33434) (not b!636641) (not d!89941) (not b!636617) (not b!636629) (not d!90001) (not d!90013) (not b!636524) (not b!636619) (not b!636648) (not bm!33431) (not d!89999) (not b!636492) (not d!90023) (not b!636574) (not b!636543) (not d!90007) (not d!90011) (not d!89953) (not d!90003) (not b!636544) (not b!636575) (not b!636510) (not b!636610) (not b!636585) (not b!636615) (not b!636541) (not d!89943) (not b!636611) (not b!636652))
(check-sat)
