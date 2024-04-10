; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57726 () Bool)

(assert start!57726)

(declare-fun b!638708 () Bool)

(declare-fun res!413507 () Bool)

(declare-fun e!365494 () Bool)

(assert (=> b!638708 (=> (not res!413507) (not e!365494))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638708 (= res!413507 (validKeyInArray!0 k!1786))))

(declare-fun b!638709 () Bool)

(declare-fun res!413504 () Bool)

(declare-fun e!365485 () Bool)

(assert (=> b!638709 (=> (not res!413504) (not e!365485))))

(declare-datatypes ((array!38297 0))(
  ( (array!38298 (arr!18371 (Array (_ BitVec 32) (_ BitVec 64))) (size!18735 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38297)

(declare-datatypes ((List!12412 0))(
  ( (Nil!12409) (Cons!12408 (h!13453 (_ BitVec 64)) (t!18640 List!12412)) )
))
(declare-fun arrayNoDuplicates!0 (array!38297 (_ BitVec 32) List!12412) Bool)

(assert (=> b!638709 (= res!413504 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12409))))

(declare-fun b!638710 () Bool)

(declare-fun e!365489 () Bool)

(assert (=> b!638710 (= e!365485 e!365489)))

(declare-fun res!413506 () Bool)

(assert (=> b!638710 (=> (not res!413506) (not e!365489))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!638710 (= res!413506 (= (select (store (arr!18371 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!295427 () array!38297)

(assert (=> b!638710 (= lt!295427 (array!38298 (store (arr!18371 a!2986) i!1108 k!1786) (size!18735 a!2986)))))

(declare-fun b!638711 () Bool)

(declare-fun res!413502 () Bool)

(assert (=> b!638711 (=> (not res!413502) (not e!365494))))

(declare-fun arrayContainsKey!0 (array!38297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638711 (= res!413502 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638712 () Bool)

(declare-fun res!413503 () Bool)

(assert (=> b!638712 (=> (not res!413503) (not e!365494))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!638712 (= res!413503 (validKeyInArray!0 (select (arr!18371 a!2986) j!136)))))

(declare-fun b!638714 () Bool)

(declare-fun e!365487 () Bool)

(declare-fun e!365496 () Bool)

(assert (=> b!638714 (= e!365487 e!365496)))

(declare-fun res!413501 () Bool)

(assert (=> b!638714 (=> res!413501 e!365496)))

(declare-fun lt!295432 () (_ BitVec 64))

(declare-fun lt!295431 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638714 (= res!413501 (or (not (= (select (arr!18371 a!2986) j!136) lt!295431)) (not (= (select (arr!18371 a!2986) j!136) lt!295432)) (bvsge j!136 index!984)))))

(declare-fun e!365490 () Bool)

(assert (=> b!638714 e!365490))

(declare-fun res!413512 () Bool)

(assert (=> b!638714 (=> (not res!413512) (not e!365490))))

(assert (=> b!638714 (= res!413512 (= lt!295432 (select (arr!18371 a!2986) j!136)))))

(assert (=> b!638714 (= lt!295432 (select (store (arr!18371 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!638715 () Bool)

(declare-fun e!365488 () Bool)

(declare-datatypes ((SeekEntryResult!6811 0))(
  ( (MissingZero!6811 (index!29558 (_ BitVec 32))) (Found!6811 (index!29559 (_ BitVec 32))) (Intermediate!6811 (undefined!7623 Bool) (index!29560 (_ BitVec 32)) (x!58309 (_ BitVec 32))) (Undefined!6811) (MissingVacant!6811 (index!29561 (_ BitVec 32))) )
))
(declare-fun lt!295421 () SeekEntryResult!6811)

(declare-fun lt!295425 () SeekEntryResult!6811)

(assert (=> b!638715 (= e!365488 (= lt!295421 lt!295425))))

(declare-fun b!638716 () Bool)

(declare-fun res!413505 () Bool)

(assert (=> b!638716 (=> (not res!413505) (not e!365485))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!638716 (= res!413505 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18371 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638717 () Bool)

(declare-fun res!413515 () Bool)

(assert (=> b!638717 (=> (not res!413515) (not e!365485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38297 (_ BitVec 32)) Bool)

(assert (=> b!638717 (= res!413515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638718 () Bool)

(declare-fun e!365492 () Bool)

(assert (=> b!638718 (= e!365492 (arrayContainsKey!0 lt!295427 (select (arr!18371 a!2986) j!136) index!984))))

(declare-fun b!638719 () Bool)

(declare-datatypes ((Unit!21578 0))(
  ( (Unit!21579) )
))
(declare-fun e!365495 () Unit!21578)

(declare-fun Unit!21580 () Unit!21578)

(assert (=> b!638719 (= e!365495 Unit!21580)))

(assert (=> b!638719 false))

(declare-fun b!638720 () Bool)

(declare-fun Unit!21581 () Unit!21578)

(assert (=> b!638720 (= e!365495 Unit!21581)))

(declare-fun b!638721 () Bool)

(declare-fun e!365486 () Bool)

(assert (=> b!638721 (= e!365489 e!365486)))

(declare-fun res!413500 () Bool)

(assert (=> b!638721 (=> (not res!413500) (not e!365486))))

(assert (=> b!638721 (= res!413500 (and (= lt!295421 (Found!6811 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18371 a!2986) index!984) (select (arr!18371 a!2986) j!136))) (not (= (select (arr!18371 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38297 (_ BitVec 32)) SeekEntryResult!6811)

(assert (=> b!638721 (= lt!295421 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18371 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638722 () Bool)

(assert (=> b!638722 (= e!365486 (not e!365487))))

(declare-fun res!413509 () Bool)

(assert (=> b!638722 (=> res!413509 e!365487)))

(declare-fun lt!295429 () SeekEntryResult!6811)

(assert (=> b!638722 (= res!413509 (not (= lt!295429 (Found!6811 index!984))))))

(declare-fun lt!295423 () Unit!21578)

(assert (=> b!638722 (= lt!295423 e!365495)))

(declare-fun c!72971 () Bool)

(assert (=> b!638722 (= c!72971 (= lt!295429 Undefined!6811))))

(assert (=> b!638722 (= lt!295429 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295431 lt!295427 mask!3053))))

(assert (=> b!638722 e!365488))

(declare-fun res!413508 () Bool)

(assert (=> b!638722 (=> (not res!413508) (not e!365488))))

(declare-fun lt!295426 () (_ BitVec 32))

(assert (=> b!638722 (= res!413508 (= lt!295425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295426 vacantSpotIndex!68 lt!295431 lt!295427 mask!3053)))))

(assert (=> b!638722 (= lt!295425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295426 vacantSpotIndex!68 (select (arr!18371 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638722 (= lt!295431 (select (store (arr!18371 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295424 () Unit!21578)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21578)

(assert (=> b!638722 (= lt!295424 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295426 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638722 (= lt!295426 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638723 () Bool)

(assert (=> b!638723 (= e!365496 (bvslt (size!18735 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!638723 (arrayNoDuplicates!0 lt!295427 #b00000000000000000000000000000000 Nil!12409)))

(declare-fun lt!295430 () Unit!21578)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12412) Unit!21578)

(assert (=> b!638723 (= lt!295430 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12409))))

(assert (=> b!638723 (arrayContainsKey!0 lt!295427 (select (arr!18371 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295428 () Unit!21578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38297 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21578)

(assert (=> b!638723 (= lt!295428 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295427 (select (arr!18371 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638724 () Bool)

(declare-fun e!365491 () Bool)

(assert (=> b!638724 (= e!365490 e!365491)))

(declare-fun res!413516 () Bool)

(assert (=> b!638724 (=> res!413516 e!365491)))

(assert (=> b!638724 (= res!413516 (or (not (= (select (arr!18371 a!2986) j!136) lt!295431)) (not (= (select (arr!18371 a!2986) j!136) lt!295432)) (bvsge j!136 index!984)))))

(declare-fun res!413511 () Bool)

(assert (=> start!57726 (=> (not res!413511) (not e!365494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57726 (= res!413511 (validMask!0 mask!3053))))

(assert (=> start!57726 e!365494))

(assert (=> start!57726 true))

(declare-fun array_inv!14167 (array!38297) Bool)

(assert (=> start!57726 (array_inv!14167 a!2986)))

(declare-fun b!638713 () Bool)

(declare-fun res!413513 () Bool)

(assert (=> b!638713 (=> (not res!413513) (not e!365494))))

(assert (=> b!638713 (= res!413513 (and (= (size!18735 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18735 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18735 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638725 () Bool)

(assert (=> b!638725 (= e!365494 e!365485)))

(declare-fun res!413510 () Bool)

(assert (=> b!638725 (=> (not res!413510) (not e!365485))))

(declare-fun lt!295422 () SeekEntryResult!6811)

(assert (=> b!638725 (= res!413510 (or (= lt!295422 (MissingZero!6811 i!1108)) (= lt!295422 (MissingVacant!6811 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38297 (_ BitVec 32)) SeekEntryResult!6811)

(assert (=> b!638725 (= lt!295422 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638726 () Bool)

(assert (=> b!638726 (= e!365491 e!365492)))

(declare-fun res!413514 () Bool)

(assert (=> b!638726 (=> (not res!413514) (not e!365492))))

(assert (=> b!638726 (= res!413514 (arrayContainsKey!0 lt!295427 (select (arr!18371 a!2986) j!136) j!136))))

(assert (= (and start!57726 res!413511) b!638713))

(assert (= (and b!638713 res!413513) b!638712))

(assert (= (and b!638712 res!413503) b!638708))

(assert (= (and b!638708 res!413507) b!638711))

(assert (= (and b!638711 res!413502) b!638725))

(assert (= (and b!638725 res!413510) b!638717))

(assert (= (and b!638717 res!413515) b!638709))

(assert (= (and b!638709 res!413504) b!638716))

(assert (= (and b!638716 res!413505) b!638710))

(assert (= (and b!638710 res!413506) b!638721))

(assert (= (and b!638721 res!413500) b!638722))

(assert (= (and b!638722 res!413508) b!638715))

(assert (= (and b!638722 c!72971) b!638719))

(assert (= (and b!638722 (not c!72971)) b!638720))

(assert (= (and b!638722 (not res!413509)) b!638714))

(assert (= (and b!638714 res!413512) b!638724))

(assert (= (and b!638724 (not res!413516)) b!638726))

(assert (= (and b!638726 res!413514) b!638718))

(assert (= (and b!638714 (not res!413501)) b!638723))

(declare-fun m!612623 () Bool)

(assert (=> b!638712 m!612623))

(assert (=> b!638712 m!612623))

(declare-fun m!612625 () Bool)

(assert (=> b!638712 m!612625))

(declare-fun m!612627 () Bool)

(assert (=> b!638709 m!612627))

(declare-fun m!612629 () Bool)

(assert (=> b!638717 m!612629))

(assert (=> b!638714 m!612623))

(declare-fun m!612631 () Bool)

(assert (=> b!638714 m!612631))

(declare-fun m!612633 () Bool)

(assert (=> b!638714 m!612633))

(declare-fun m!612635 () Bool)

(assert (=> b!638721 m!612635))

(assert (=> b!638721 m!612623))

(assert (=> b!638721 m!612623))

(declare-fun m!612637 () Bool)

(assert (=> b!638721 m!612637))

(assert (=> b!638724 m!612623))

(declare-fun m!612639 () Bool)

(assert (=> b!638711 m!612639))

(assert (=> b!638726 m!612623))

(assert (=> b!638726 m!612623))

(declare-fun m!612641 () Bool)

(assert (=> b!638726 m!612641))

(assert (=> b!638710 m!612631))

(declare-fun m!612643 () Bool)

(assert (=> b!638710 m!612643))

(declare-fun m!612645 () Bool)

(assert (=> b!638708 m!612645))

(declare-fun m!612647 () Bool)

(assert (=> b!638716 m!612647))

(assert (=> b!638718 m!612623))

(assert (=> b!638718 m!612623))

(declare-fun m!612649 () Bool)

(assert (=> b!638718 m!612649))

(assert (=> b!638723 m!612623))

(declare-fun m!612651 () Bool)

(assert (=> b!638723 m!612651))

(assert (=> b!638723 m!612623))

(assert (=> b!638723 m!612623))

(declare-fun m!612653 () Bool)

(assert (=> b!638723 m!612653))

(declare-fun m!612655 () Bool)

(assert (=> b!638723 m!612655))

(declare-fun m!612657 () Bool)

(assert (=> b!638723 m!612657))

(declare-fun m!612659 () Bool)

(assert (=> b!638722 m!612659))

(declare-fun m!612661 () Bool)

(assert (=> b!638722 m!612661))

(assert (=> b!638722 m!612623))

(declare-fun m!612663 () Bool)

(assert (=> b!638722 m!612663))

(assert (=> b!638722 m!612623))

(assert (=> b!638722 m!612631))

(declare-fun m!612665 () Bool)

(assert (=> b!638722 m!612665))

(declare-fun m!612667 () Bool)

(assert (=> b!638722 m!612667))

(declare-fun m!612669 () Bool)

(assert (=> b!638722 m!612669))

(declare-fun m!612671 () Bool)

(assert (=> start!57726 m!612671))

(declare-fun m!612673 () Bool)

(assert (=> start!57726 m!612673))

(declare-fun m!612675 () Bool)

(assert (=> b!638725 m!612675))

(push 1)

(assert (not b!638726))

(assert (not b!638712))

(assert (not b!638711))

(assert (not start!57726))

(assert (not b!638725))

(assert (not b!638709))

(assert (not b!638722))

(assert (not b!638721))

(assert (not b!638718))

(assert (not b!638717))

(assert (not b!638723))

(assert (not b!638708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90231 () Bool)

(declare-fun res!413552 () Bool)

(declare-fun e!365548 () Bool)

(assert (=> d!90231 (=> res!413552 e!365548)))

(assert (=> d!90231 (= res!413552 (= (select (arr!18371 lt!295427) index!984) (select (arr!18371 a!2986) j!136)))))

(assert (=> d!90231 (= (arrayContainsKey!0 lt!295427 (select (arr!18371 a!2986) j!136) index!984) e!365548)))

(declare-fun b!638794 () Bool)

(declare-fun e!365549 () Bool)

(assert (=> b!638794 (= e!365548 e!365549)))

(declare-fun res!413553 () Bool)

(assert (=> b!638794 (=> (not res!413553) (not e!365549))))

(assert (=> b!638794 (= res!413553 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18735 lt!295427)))))

(declare-fun b!638795 () Bool)

(assert (=> b!638795 (= e!365549 (arrayContainsKey!0 lt!295427 (select (arr!18371 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90231 (not res!413552)) b!638794))

(assert (= (and b!638794 res!413553) b!638795))

(declare-fun m!612731 () Bool)

(assert (=> d!90231 m!612731))

(assert (=> b!638795 m!612623))

(declare-fun m!612733 () Bool)

(assert (=> b!638795 m!612733))

(assert (=> b!638718 d!90231))

(declare-fun d!90241 () Bool)

(assert (=> d!90241 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!638708 d!90241))

(declare-fun b!638806 () Bool)

(declare-fun e!365561 () Bool)

(declare-fun e!365560 () Bool)

(assert (=> b!638806 (= e!365561 e!365560)))

(declare-fun res!413562 () Bool)

(assert (=> b!638806 (=> (not res!413562) (not e!365560))))

(declare-fun e!365558 () Bool)

(assert (=> b!638806 (= res!413562 (not e!365558))))

(declare-fun res!413561 () Bool)

(assert (=> b!638806 (=> (not res!413561) (not e!365558))))

(assert (=> b!638806 (= res!413561 (validKeyInArray!0 (select (arr!18371 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!638807 () Bool)

(declare-fun e!365559 () Bool)

(assert (=> b!638807 (= e!365560 e!365559)))

(declare-fun c!72990 () Bool)

(assert (=> b!638807 (= c!72990 (validKeyInArray!0 (select (arr!18371 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90243 () Bool)

(declare-fun res!413560 () Bool)

(assert (=> d!90243 (=> res!413560 e!365561)))

(assert (=> d!90243 (= res!413560 (bvsge #b00000000000000000000000000000000 (size!18735 a!2986)))))

(assert (=> d!90243 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12409) e!365561)))

(declare-fun b!638808 () Bool)

(declare-fun call!33477 () Bool)

(assert (=> b!638808 (= e!365559 call!33477)))

(declare-fun bm!33474 () Bool)

(assert (=> bm!33474 (= call!33477 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72990 (Cons!12408 (select (arr!18371 a!2986) #b00000000000000000000000000000000) Nil!12409) Nil!12409)))))

(declare-fun b!638809 () Bool)

(assert (=> b!638809 (= e!365559 call!33477)))

(declare-fun b!638810 () Bool)

(declare-fun contains!3122 (List!12412 (_ BitVec 64)) Bool)

(assert (=> b!638810 (= e!365558 (contains!3122 Nil!12409 (select (arr!18371 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90243 (not res!413560)) b!638806))

(assert (= (and b!638806 res!413561) b!638810))

(assert (= (and b!638806 res!413562) b!638807))

(assert (= (and b!638807 c!72990) b!638808))

(assert (= (and b!638807 (not c!72990)) b!638809))

(assert (= (or b!638808 b!638809) bm!33474))

(declare-fun m!612735 () Bool)

(assert (=> b!638806 m!612735))

(assert (=> b!638806 m!612735))

(declare-fun m!612737 () Bool)

(assert (=> b!638806 m!612737))

(assert (=> b!638807 m!612735))

(assert (=> b!638807 m!612735))

(assert (=> b!638807 m!612737))

(assert (=> bm!33474 m!612735))

(declare-fun m!612739 () Bool)

(assert (=> bm!33474 m!612739))

(assert (=> b!638810 m!612735))

(assert (=> b!638810 m!612735))

(declare-fun m!612741 () Bool)

(assert (=> b!638810 m!612741))

(assert (=> b!638709 d!90243))

(declare-fun b!638880 () Bool)

(declare-fun e!365604 () SeekEntryResult!6811)

(assert (=> b!638880 (= e!365604 Undefined!6811)))

(declare-fun b!638881 () Bool)

(declare-fun e!365606 () SeekEntryResult!6811)

(assert (=> b!638881 (= e!365606 (MissingVacant!6811 vacantSpotIndex!68))))

(declare-fun b!638882 () Bool)

(declare-fun e!365605 () SeekEntryResult!6811)

(assert (=> b!638882 (= e!365605 (Found!6811 index!984))))

(declare-fun lt!295473 () SeekEntryResult!6811)

(declare-fun d!90245 () Bool)

(assert (=> d!90245 (and (or (is-Undefined!6811 lt!295473) (not (is-Found!6811 lt!295473)) (and (bvsge (index!29559 lt!295473) #b00000000000000000000000000000000) (bvslt (index!29559 lt!295473) (size!18735 a!2986)))) (or (is-Undefined!6811 lt!295473) (is-Found!6811 lt!295473) (not (is-MissingVacant!6811 lt!295473)) (not (= (index!29561 lt!295473) vacantSpotIndex!68)) (and (bvsge (index!29561 lt!295473) #b00000000000000000000000000000000) (bvslt (index!29561 lt!295473) (size!18735 a!2986)))) (or (is-Undefined!6811 lt!295473) (ite (is-Found!6811 lt!295473) (= (select (arr!18371 a!2986) (index!29559 lt!295473)) (select (arr!18371 a!2986) j!136)) (and (is-MissingVacant!6811 lt!295473) (= (index!29561 lt!295473) vacantSpotIndex!68) (= (select (arr!18371 a!2986) (index!29561 lt!295473)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90245 (= lt!295473 e!365604)))

(declare-fun c!73020 () Bool)

(assert (=> d!90245 (= c!73020 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295474 () (_ BitVec 64))

(assert (=> d!90245 (= lt!295474 (select (arr!18371 a!2986) index!984))))

(assert (=> d!90245 (validMask!0 mask!3053)))

(assert (=> d!90245 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18371 a!2986) j!136) a!2986 mask!3053) lt!295473)))

(declare-fun b!638883 () Bool)

(declare-fun c!73018 () Bool)

(assert (=> b!638883 (= c!73018 (= lt!295474 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638883 (= e!365605 e!365606)))

(declare-fun b!638884 () Bool)

(assert (=> b!638884 (= e!365606 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18371 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638885 () Bool)

(assert (=> b!638885 (= e!365604 e!365605)))

(declare-fun c!73019 () Bool)

(assert (=> b!638885 (= c!73019 (= lt!295474 (select (arr!18371 a!2986) j!136)))))

(assert (= (and d!90245 c!73020) b!638880))

(assert (= (and d!90245 (not c!73020)) b!638885))

(assert (= (and b!638885 c!73019) b!638882))

(assert (= (and b!638885 (not c!73019)) b!638883))

(assert (= (and b!638883 c!73018) b!638881))

(assert (= (and b!638883 (not c!73018)) b!638884))

(declare-fun m!612767 () Bool)

(assert (=> d!90245 m!612767))

(declare-fun m!612769 () Bool)

(assert (=> d!90245 m!612769))

(assert (=> d!90245 m!612635))

(assert (=> d!90245 m!612671))

(assert (=> b!638884 m!612659))

(assert (=> b!638884 m!612659))

(assert (=> b!638884 m!612623))

(declare-fun m!612771 () Bool)

(assert (=> b!638884 m!612771))

(assert (=> b!638721 d!90245))

(declare-fun d!90257 () Bool)

(declare-fun res!413578 () Bool)

(declare-fun e!365607 () Bool)

(assert (=> d!90257 (=> res!413578 e!365607)))

(assert (=> d!90257 (= res!413578 (= (select (arr!18371 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90257 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!365607)))

(declare-fun b!638886 () Bool)

(declare-fun e!365608 () Bool)

(assert (=> b!638886 (= e!365607 e!365608)))

(declare-fun res!413579 () Bool)

(assert (=> b!638886 (=> (not res!413579) (not e!365608))))

(assert (=> b!638886 (= res!413579 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18735 a!2986)))))

(declare-fun b!638887 () Bool)

(assert (=> b!638887 (= e!365608 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90257 (not res!413578)) b!638886))

(assert (= (and b!638886 res!413579) b!638887))

(assert (=> d!90257 m!612735))

(declare-fun m!612773 () Bool)

(assert (=> b!638887 m!612773))

(assert (=> b!638711 d!90257))

(declare-fun d!90259 () Bool)

(declare-fun lt!295481 () (_ BitVec 32))

(assert (=> d!90259 (and (bvsge lt!295481 #b00000000000000000000000000000000) (bvslt lt!295481 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90259 (= lt!295481 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90259 (validMask!0 mask!3053)))

(assert (=> d!90259 (= (nextIndex!0 index!984 x!910 mask!3053) lt!295481)))

(declare-fun bs!19151 () Bool)

(assert (= bs!19151 d!90259))

(declare-fun m!612785 () Bool)

(assert (=> bs!19151 m!612785))

(assert (=> bs!19151 m!612671))

(assert (=> b!638722 d!90259))

(declare-fun b!638898 () Bool)

(declare-fun e!365616 () SeekEntryResult!6811)

(assert (=> b!638898 (= e!365616 Undefined!6811)))

(declare-fun b!638899 () Bool)

(declare-fun e!365618 () SeekEntryResult!6811)

(assert (=> b!638899 (= e!365618 (MissingVacant!6811 vacantSpotIndex!68))))

(declare-fun b!638900 () Bool)

(declare-fun e!365617 () SeekEntryResult!6811)

(assert (=> b!638900 (= e!365617 (Found!6811 lt!295426))))

(declare-fun lt!295482 () SeekEntryResult!6811)

(declare-fun d!90269 () Bool)

(assert (=> d!90269 (and (or (is-Undefined!6811 lt!295482) (not (is-Found!6811 lt!295482)) (and (bvsge (index!29559 lt!295482) #b00000000000000000000000000000000) (bvslt (index!29559 lt!295482) (size!18735 lt!295427)))) (or (is-Undefined!6811 lt!295482) (is-Found!6811 lt!295482) (not (is-MissingVacant!6811 lt!295482)) (not (= (index!29561 lt!295482) vacantSpotIndex!68)) (and (bvsge (index!29561 lt!295482) #b00000000000000000000000000000000) (bvslt (index!29561 lt!295482) (size!18735 lt!295427)))) (or (is-Undefined!6811 lt!295482) (ite (is-Found!6811 lt!295482) (= (select (arr!18371 lt!295427) (index!29559 lt!295482)) lt!295431) (and (is-MissingVacant!6811 lt!295482) (= (index!29561 lt!295482) vacantSpotIndex!68) (= (select (arr!18371 lt!295427) (index!29561 lt!295482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90269 (= lt!295482 e!365616)))

(declare-fun c!73026 () Bool)

(assert (=> d!90269 (= c!73026 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!295483 () (_ BitVec 64))

(assert (=> d!90269 (= lt!295483 (select (arr!18371 lt!295427) lt!295426))))

(assert (=> d!90269 (validMask!0 mask!3053)))

(assert (=> d!90269 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295426 vacantSpotIndex!68 lt!295431 lt!295427 mask!3053) lt!295482)))

(declare-fun b!638901 () Bool)

(declare-fun c!73024 () Bool)

(assert (=> b!638901 (= c!73024 (= lt!295483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638901 (= e!365617 e!365618)))

(declare-fun b!638902 () Bool)

(assert (=> b!638902 (= e!365618 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!295426 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!295431 lt!295427 mask!3053))))

(declare-fun b!638903 () Bool)

(assert (=> b!638903 (= e!365616 e!365617)))

(declare-fun c!73025 () Bool)

(assert (=> b!638903 (= c!73025 (= lt!295483 lt!295431))))

(assert (= (and d!90269 c!73026) b!638898))

(assert (= (and d!90269 (not c!73026)) b!638903))

(assert (= (and b!638903 c!73025) b!638900))

(assert (= (and b!638903 (not c!73025)) b!638901))

(assert (= (and b!638901 c!73024) b!638899))

(assert (= (and b!638901 (not c!73024)) b!638902))

(declare-fun m!612787 () Bool)

(assert (=> d!90269 m!612787))

(declare-fun m!612789 () Bool)

(assert (=> d!90269 m!612789))

(declare-fun m!612791 () Bool)

(assert (=> d!90269 m!612791))

(assert (=> d!90269 m!612671))

(declare-fun m!612793 () Bool)

(assert (=> b!638902 m!612793))

(assert (=> b!638902 m!612793))

(declare-fun m!612797 () Bool)

(assert (=> b!638902 m!612797))

(assert (=> b!638722 d!90269))

(declare-fun b!638905 () Bool)

(declare-fun e!365620 () SeekEntryResult!6811)

(assert (=> b!638905 (= e!365620 Undefined!6811)))

(declare-fun b!638906 () Bool)

(declare-fun e!365622 () SeekEntryResult!6811)

(assert (=> b!638906 (= e!365622 (MissingVacant!6811 vacantSpotIndex!68))))

(declare-fun b!638907 () Bool)

(declare-fun e!365621 () SeekEntryResult!6811)

(assert (=> b!638907 (= e!365621 (Found!6811 index!984))))

(declare-fun d!90271 () Bool)

(declare-fun lt!295487 () SeekEntryResult!6811)

(assert (=> d!90271 (and (or (is-Undefined!6811 lt!295487) (not (is-Found!6811 lt!295487)) (and (bvsge (index!29559 lt!295487) #b00000000000000000000000000000000) (bvslt (index!29559 lt!295487) (size!18735 lt!295427)))) (or (is-Undefined!6811 lt!295487) (is-Found!6811 lt!295487) (not (is-MissingVacant!6811 lt!295487)) (not (= (index!29561 lt!295487) vacantSpotIndex!68)) (and (bvsge (index!29561 lt!295487) #b00000000000000000000000000000000) (bvslt (index!29561 lt!295487) (size!18735 lt!295427)))) (or (is-Undefined!6811 lt!295487) (ite (is-Found!6811 lt!295487) (= (select (arr!18371 lt!295427) (index!29559 lt!295487)) lt!295431) (and (is-MissingVacant!6811 lt!295487) (= (index!29561 lt!295487) vacantSpotIndex!68) (= (select (arr!18371 lt!295427) (index!29561 lt!295487)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90271 (= lt!295487 e!365620)))

(declare-fun c!73029 () Bool)

(assert (=> d!90271 (= c!73029 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!295488 () (_ BitVec 64))

(assert (=> d!90271 (= lt!295488 (select (arr!18371 lt!295427) index!984))))

(assert (=> d!90271 (validMask!0 mask!3053)))

(assert (=> d!90271 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295431 lt!295427 mask!3053) lt!295487)))

(declare-fun b!638908 () Bool)

(declare-fun c!73027 () Bool)

(assert (=> b!638908 (= c!73027 (= lt!295488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638908 (= e!365621 e!365622)))

