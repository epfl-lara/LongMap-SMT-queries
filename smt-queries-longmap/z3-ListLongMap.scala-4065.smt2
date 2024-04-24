; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55752 () Bool)

(assert start!55752)

(declare-fun b!610676 () Bool)

(declare-datatypes ((Unit!19549 0))(
  ( (Unit!19550) )
))
(declare-fun e!349840 () Unit!19549)

(declare-fun Unit!19551 () Unit!19549)

(assert (=> b!610676 (= e!349840 Unit!19551)))

(assert (=> b!610676 false))

(declare-fun b!610677 () Bool)

(declare-fun e!349847 () Bool)

(declare-fun e!349846 () Bool)

(assert (=> b!610677 (= e!349847 e!349846)))

(declare-fun res!392782 () Bool)

(assert (=> b!610677 (=> res!392782 e!349846)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279320 () (_ BitVec 64))

(declare-datatypes ((array!37347 0))(
  ( (array!37348 (arr!17920 (Array (_ BitVec 32) (_ BitVec 64))) (size!18284 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37347)

(declare-fun lt!279328 () (_ BitVec 64))

(assert (=> b!610677 (= res!392782 (or (not (= (select (arr!17920 a!2986) j!136) lt!279320)) (not (= (select (arr!17920 a!2986) j!136) lt!279328))))))

(declare-fun e!349838 () Bool)

(assert (=> b!610677 e!349838))

(declare-fun res!392786 () Bool)

(assert (=> b!610677 (=> (not res!392786) (not e!349838))))

(assert (=> b!610677 (= res!392786 (= lt!279328 (select (arr!17920 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!610677 (= lt!279328 (select (store (arr!17920 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!610678 () Bool)

(declare-fun e!349837 () Bool)

(assert (=> b!610678 (= e!349837 (not e!349847))))

(declare-fun res!392788 () Bool)

(assert (=> b!610678 (=> res!392788 e!349847)))

(declare-datatypes ((SeekEntryResult!6316 0))(
  ( (MissingZero!6316 (index!27542 (_ BitVec 32))) (Found!6316 (index!27543 (_ BitVec 32))) (Intermediate!6316 (undefined!7128 Bool) (index!27544 (_ BitVec 32)) (x!56501 (_ BitVec 32))) (Undefined!6316) (MissingVacant!6316 (index!27545 (_ BitVec 32))) )
))
(declare-fun lt!279323 () SeekEntryResult!6316)

(assert (=> b!610678 (= res!392788 (not (= lt!279323 (Found!6316 index!984))))))

(declare-fun lt!279321 () Unit!19549)

(assert (=> b!610678 (= lt!279321 e!349840)))

(declare-fun c!69322 () Bool)

(assert (=> b!610678 (= c!69322 (= lt!279323 Undefined!6316))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!279318 () array!37347)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37347 (_ BitVec 32)) SeekEntryResult!6316)

(assert (=> b!610678 (= lt!279323 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279320 lt!279318 mask!3053))))

(declare-fun e!349842 () Bool)

(assert (=> b!610678 e!349842))

(declare-fun res!392775 () Bool)

(assert (=> b!610678 (=> (not res!392775) (not e!349842))))

(declare-fun lt!279319 () SeekEntryResult!6316)

(declare-fun lt!279325 () (_ BitVec 32))

(assert (=> b!610678 (= res!392775 (= lt!279319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 lt!279320 lt!279318 mask!3053)))))

(assert (=> b!610678 (= lt!279319 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!610678 (= lt!279320 (select (store (arr!17920 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279334 () Unit!19549)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19549)

(assert (=> b!610678 (= lt!279334 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!610678 (= lt!279325 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!610679 () Bool)

(declare-fun e!349843 () Unit!19549)

(declare-fun Unit!19552 () Unit!19549)

(assert (=> b!610679 (= e!349843 Unit!19552)))

(declare-fun b!610680 () Bool)

(declare-fun e!349834 () Bool)

(assert (=> b!610680 (= e!349838 e!349834)))

(declare-fun res!392776 () Bool)

(assert (=> b!610680 (=> res!392776 e!349834)))

(assert (=> b!610680 (= res!392776 (or (not (= (select (arr!17920 a!2986) j!136) lt!279320)) (not (= (select (arr!17920 a!2986) j!136) lt!279328)) (bvsge j!136 index!984)))))

(declare-fun b!610681 () Bool)

(declare-fun e!349844 () Bool)

(assert (=> b!610681 (= e!349846 e!349844)))

(declare-fun res!392772 () Bool)

(assert (=> b!610681 (=> res!392772 e!349844)))

(assert (=> b!610681 (= res!392772 (bvsge index!984 j!136))))

(declare-fun lt!279327 () Unit!19549)

(assert (=> b!610681 (= lt!279327 e!349843)))

(declare-fun c!69323 () Bool)

(assert (=> b!610681 (= c!69323 (bvslt j!136 index!984))))

(declare-fun b!610682 () Bool)

(declare-fun res!392769 () Bool)

(declare-fun e!349833 () Bool)

(assert (=> b!610682 (=> (not res!392769) (not e!349833))))

(declare-fun arrayContainsKey!0 (array!37347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!610682 (= res!392769 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!610683 () Bool)

(declare-fun Unit!19553 () Unit!19549)

(assert (=> b!610683 (= e!349843 Unit!19553)))

(declare-fun lt!279331 () Unit!19549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19549)

(assert (=> b!610683 (= lt!279331 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279318 (select (arr!17920 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!610683 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279326 () Unit!19549)

(declare-datatypes ((List!11868 0))(
  ( (Nil!11865) (Cons!11864 (h!12912 (_ BitVec 64)) (t!18088 List!11868)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11868) Unit!19549)

(assert (=> b!610683 (= lt!279326 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11865))))

(declare-fun arrayNoDuplicates!0 (array!37347 (_ BitVec 32) List!11868) Bool)

(assert (=> b!610683 (arrayNoDuplicates!0 lt!279318 #b00000000000000000000000000000000 Nil!11865)))

(declare-fun lt!279332 () Unit!19549)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37347 (_ BitVec 32) (_ BitVec 32)) Unit!19549)

(assert (=> b!610683 (= lt!279332 (lemmaNoDuplicateFromThenFromBigger!0 lt!279318 #b00000000000000000000000000000000 j!136))))

(assert (=> b!610683 (arrayNoDuplicates!0 lt!279318 j!136 Nil!11865)))

(declare-fun lt!279333 () Unit!19549)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37347 (_ BitVec 64) (_ BitVec 32) List!11868) Unit!19549)

(assert (=> b!610683 (= lt!279333 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136 Nil!11865))))

(assert (=> b!610683 false))

(declare-fun b!610684 () Bool)

(declare-fun res!392787 () Bool)

(declare-fun e!349839 () Bool)

(assert (=> b!610684 (=> (not res!392787) (not e!349839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37347 (_ BitVec 32)) Bool)

(assert (=> b!610684 (= res!392787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!610686 () Bool)

(declare-fun Unit!19554 () Unit!19549)

(assert (=> b!610686 (= e!349840 Unit!19554)))

(declare-fun b!610687 () Bool)

(declare-fun e!349835 () Bool)

(declare-fun noDuplicate!346 (List!11868) Bool)

(assert (=> b!610687 (= e!349835 (noDuplicate!346 Nil!11865))))

(declare-fun b!610688 () Bool)

(assert (=> b!610688 (= e!349844 e!349835)))

(declare-fun res!392785 () Bool)

(assert (=> b!610688 (=> res!392785 e!349835)))

(assert (=> b!610688 (= res!392785 (or (bvsgt #b00000000000000000000000000000000 (size!18284 a!2986)) (bvsge (size!18284 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!610688 (arrayNoDuplicates!0 lt!279318 #b00000000000000000000000000000000 Nil!11865)))

(declare-fun lt!279329 () Unit!19549)

(assert (=> b!610688 (= lt!279329 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11865))))

(assert (=> b!610688 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279324 () Unit!19549)

(assert (=> b!610688 (= lt!279324 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!349845 () Bool)

(assert (=> b!610688 e!349845))

(declare-fun res!392779 () Bool)

(assert (=> b!610688 (=> (not res!392779) (not e!349845))))

(assert (=> b!610688 (= res!392779 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136))))

(declare-fun b!610689 () Bool)

(declare-fun e!349848 () Bool)

(assert (=> b!610689 (= e!349839 e!349848)))

(declare-fun res!392781 () Bool)

(assert (=> b!610689 (=> (not res!392781) (not e!349848))))

(assert (=> b!610689 (= res!392781 (= (select (store (arr!17920 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610689 (= lt!279318 (array!37348 (store (arr!17920 a!2986) i!1108 k0!1786) (size!18284 a!2986)))))

(declare-fun b!610690 () Bool)

(declare-fun res!392771 () Bool)

(assert (=> b!610690 (=> (not res!392771) (not e!349833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!610690 (= res!392771 (validKeyInArray!0 (select (arr!17920 a!2986) j!136)))))

(declare-fun b!610691 () Bool)

(declare-fun res!392784 () Bool)

(assert (=> b!610691 (=> (not res!392784) (not e!349833))))

(assert (=> b!610691 (= res!392784 (and (= (size!18284 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18284 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18284 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!610692 () Bool)

(declare-fun e!349836 () Bool)

(assert (=> b!610692 (= e!349834 e!349836)))

(declare-fun res!392773 () Bool)

(assert (=> b!610692 (=> (not res!392773) (not e!349836))))

(assert (=> b!610692 (= res!392773 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136))))

(declare-fun b!610693 () Bool)

(assert (=> b!610693 (= e!349833 e!349839)))

(declare-fun res!392780 () Bool)

(assert (=> b!610693 (=> (not res!392780) (not e!349839))))

(declare-fun lt!279322 () SeekEntryResult!6316)

(assert (=> b!610693 (= res!392780 (or (= lt!279322 (MissingZero!6316 i!1108)) (= lt!279322 (MissingVacant!6316 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37347 (_ BitVec 32)) SeekEntryResult!6316)

(assert (=> b!610693 (= lt!279322 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!610694 () Bool)

(declare-fun lt!279330 () SeekEntryResult!6316)

(assert (=> b!610694 (= e!349842 (= lt!279330 lt!279319))))

(declare-fun b!610695 () Bool)

(declare-fun res!392777 () Bool)

(assert (=> b!610695 (=> (not res!392777) (not e!349833))))

(assert (=> b!610695 (= res!392777 (validKeyInArray!0 k0!1786))))

(declare-fun b!610696 () Bool)

(assert (=> b!610696 (= e!349836 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) index!984))))

(declare-fun b!610697 () Bool)

(assert (=> b!610697 (= e!349848 e!349837)))

(declare-fun res!392770 () Bool)

(assert (=> b!610697 (=> (not res!392770) (not e!349837))))

(assert (=> b!610697 (= res!392770 (and (= lt!279330 (Found!6316 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17920 a!2986) index!984) (select (arr!17920 a!2986) j!136))) (not (= (select (arr!17920 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!610697 (= lt!279330 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!610698 () Bool)

(declare-fun res!392774 () Bool)

(assert (=> b!610698 (=> (not res!392774) (not e!349839))))

(assert (=> b!610698 (= res!392774 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11865))))

(declare-fun b!610699 () Bool)

(assert (=> b!610699 (= e!349845 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) index!984))))

(declare-fun res!392778 () Bool)

(assert (=> start!55752 (=> (not res!392778) (not e!349833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55752 (= res!392778 (validMask!0 mask!3053))))

(assert (=> start!55752 e!349833))

(assert (=> start!55752 true))

(declare-fun array_inv!13779 (array!37347) Bool)

(assert (=> start!55752 (array_inv!13779 a!2986)))

(declare-fun b!610685 () Bool)

(declare-fun res!392783 () Bool)

(assert (=> b!610685 (=> (not res!392783) (not e!349839))))

(assert (=> b!610685 (= res!392783 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17920 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55752 res!392778) b!610691))

(assert (= (and b!610691 res!392784) b!610690))

(assert (= (and b!610690 res!392771) b!610695))

(assert (= (and b!610695 res!392777) b!610682))

(assert (= (and b!610682 res!392769) b!610693))

(assert (= (and b!610693 res!392780) b!610684))

(assert (= (and b!610684 res!392787) b!610698))

(assert (= (and b!610698 res!392774) b!610685))

(assert (= (and b!610685 res!392783) b!610689))

(assert (= (and b!610689 res!392781) b!610697))

(assert (= (and b!610697 res!392770) b!610678))

(assert (= (and b!610678 res!392775) b!610694))

(assert (= (and b!610678 c!69322) b!610676))

(assert (= (and b!610678 (not c!69322)) b!610686))

(assert (= (and b!610678 (not res!392788)) b!610677))

(assert (= (and b!610677 res!392786) b!610680))

(assert (= (and b!610680 (not res!392776)) b!610692))

(assert (= (and b!610692 res!392773) b!610696))

(assert (= (and b!610677 (not res!392782)) b!610681))

(assert (= (and b!610681 c!69323) b!610683))

(assert (= (and b!610681 (not c!69323)) b!610679))

(assert (= (and b!610681 (not res!392772)) b!610688))

(assert (= (and b!610688 res!392779) b!610699))

(assert (= (and b!610688 (not res!392785)) b!610687))

(declare-fun m!587399 () Bool)

(assert (=> b!610697 m!587399))

(declare-fun m!587401 () Bool)

(assert (=> b!610697 m!587401))

(assert (=> b!610697 m!587401))

(declare-fun m!587403 () Bool)

(assert (=> b!610697 m!587403))

(assert (=> b!610692 m!587401))

(assert (=> b!610692 m!587401))

(declare-fun m!587405 () Bool)

(assert (=> b!610692 m!587405))

(declare-fun m!587407 () Bool)

(assert (=> b!610678 m!587407))

(declare-fun m!587409 () Bool)

(assert (=> b!610678 m!587409))

(assert (=> b!610678 m!587401))

(declare-fun m!587411 () Bool)

(assert (=> b!610678 m!587411))

(assert (=> b!610678 m!587401))

(declare-fun m!587413 () Bool)

(assert (=> b!610678 m!587413))

(declare-fun m!587415 () Bool)

(assert (=> b!610678 m!587415))

(declare-fun m!587417 () Bool)

(assert (=> b!610678 m!587417))

(declare-fun m!587419 () Bool)

(assert (=> b!610678 m!587419))

(declare-fun m!587421 () Bool)

(assert (=> b!610698 m!587421))

(assert (=> b!610688 m!587401))

(assert (=> b!610688 m!587405))

(declare-fun m!587423 () Bool)

(assert (=> b!610688 m!587423))

(assert (=> b!610688 m!587401))

(declare-fun m!587425 () Bool)

(assert (=> b!610688 m!587425))

(declare-fun m!587427 () Bool)

(assert (=> b!610688 m!587427))

(assert (=> b!610688 m!587401))

(declare-fun m!587429 () Bool)

(assert (=> b!610688 m!587429))

(assert (=> b!610688 m!587401))

(assert (=> b!610690 m!587401))

(assert (=> b!610690 m!587401))

(declare-fun m!587431 () Bool)

(assert (=> b!610690 m!587431))

(declare-fun m!587433 () Bool)

(assert (=> b!610687 m!587433))

(assert (=> b!610696 m!587401))

(assert (=> b!610696 m!587401))

(declare-fun m!587435 () Bool)

(assert (=> b!610696 m!587435))

(assert (=> b!610680 m!587401))

(declare-fun m!587437 () Bool)

(assert (=> start!55752 m!587437))

(declare-fun m!587439 () Bool)

(assert (=> start!55752 m!587439))

(declare-fun m!587441 () Bool)

(assert (=> b!610693 m!587441))

(assert (=> b!610699 m!587401))

(assert (=> b!610699 m!587401))

(assert (=> b!610699 m!587435))

(declare-fun m!587443 () Bool)

(assert (=> b!610695 m!587443))

(declare-fun m!587445 () Bool)

(assert (=> b!610682 m!587445))

(assert (=> b!610677 m!587401))

(assert (=> b!610677 m!587417))

(declare-fun m!587447 () Bool)

(assert (=> b!610677 m!587447))

(declare-fun m!587449 () Bool)

(assert (=> b!610685 m!587449))

(assert (=> b!610689 m!587417))

(declare-fun m!587451 () Bool)

(assert (=> b!610689 m!587451))

(declare-fun m!587453 () Bool)

(assert (=> b!610684 m!587453))

(declare-fun m!587455 () Bool)

(assert (=> b!610683 m!587455))

(assert (=> b!610683 m!587401))

(assert (=> b!610683 m!587423))

(assert (=> b!610683 m!587401))

(declare-fun m!587457 () Bool)

(assert (=> b!610683 m!587457))

(assert (=> b!610683 m!587401))

(declare-fun m!587459 () Bool)

(assert (=> b!610683 m!587459))

(declare-fun m!587461 () Bool)

(assert (=> b!610683 m!587461))

(assert (=> b!610683 m!587401))

(declare-fun m!587463 () Bool)

(assert (=> b!610683 m!587463))

(assert (=> b!610683 m!587427))

(check-sat (not b!610693) (not b!610697) (not b!610699) (not b!610682) (not b!610678) (not b!610684) (not b!610687) (not b!610698) (not b!610690) (not b!610696) (not start!55752) (not b!610683) (not b!610695) (not b!610688) (not b!610692))
(check-sat)
(get-model)

(declare-fun d!88359 () Bool)

(declare-fun res!392913 () Bool)

(declare-fun e!349953 () Bool)

(assert (=> d!88359 (=> res!392913 e!349953)))

(assert (=> d!88359 (= res!392913 (bvsge #b00000000000000000000000000000000 (size!18284 a!2986)))))

(assert (=> d!88359 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!349953)))

(declare-fun b!610852 () Bool)

(declare-fun e!349952 () Bool)

(declare-fun e!349951 () Bool)

(assert (=> b!610852 (= e!349952 e!349951)))

(declare-fun lt!279443 () (_ BitVec 64))

(assert (=> b!610852 (= lt!279443 (select (arr!17920 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279444 () Unit!19549)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37347 (_ BitVec 64) (_ BitVec 32)) Unit!19549)

(assert (=> b!610852 (= lt!279444 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279443 #b00000000000000000000000000000000))))

(assert (=> b!610852 (arrayContainsKey!0 a!2986 lt!279443 #b00000000000000000000000000000000)))

(declare-fun lt!279445 () Unit!19549)

(assert (=> b!610852 (= lt!279445 lt!279444)))

(declare-fun res!392914 () Bool)

(assert (=> b!610852 (= res!392914 (= (seekEntryOrOpen!0 (select (arr!17920 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6316 #b00000000000000000000000000000000)))))

(assert (=> b!610852 (=> (not res!392914) (not e!349951))))

(declare-fun b!610853 () Bool)

(declare-fun call!33141 () Bool)

(assert (=> b!610853 (= e!349951 call!33141)))

(declare-fun b!610854 () Bool)

(assert (=> b!610854 (= e!349952 call!33141)))

(declare-fun b!610855 () Bool)

(assert (=> b!610855 (= e!349953 e!349952)))

(declare-fun c!69338 () Bool)

(assert (=> b!610855 (= c!69338 (validKeyInArray!0 (select (arr!17920 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33138 () Bool)

(assert (=> bm!33138 (= call!33141 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!88359 (not res!392913)) b!610855))

(assert (= (and b!610855 c!69338) b!610852))

(assert (= (and b!610855 (not c!69338)) b!610854))

(assert (= (and b!610852 res!392914) b!610853))

(assert (= (or b!610853 b!610854) bm!33138))

(declare-fun m!587597 () Bool)

(assert (=> b!610852 m!587597))

(declare-fun m!587599 () Bool)

(assert (=> b!610852 m!587599))

(declare-fun m!587601 () Bool)

(assert (=> b!610852 m!587601))

(assert (=> b!610852 m!587597))

(declare-fun m!587603 () Bool)

(assert (=> b!610852 m!587603))

(assert (=> b!610855 m!587597))

(assert (=> b!610855 m!587597))

(declare-fun m!587605 () Bool)

(assert (=> b!610855 m!587605))

(declare-fun m!587607 () Bool)

(assert (=> bm!33138 m!587607))

(assert (=> b!610684 d!88359))

(declare-fun d!88361 () Bool)

(assert (=> d!88361 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610695 d!88361))

(declare-fun d!88363 () Bool)

(assert (=> d!88363 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18284 lt!279318)) (not (= (select (arr!17920 lt!279318) j!136) (select (arr!17920 a!2986) j!136))))))

(declare-fun lt!279448 () Unit!19549)

(declare-fun choose!21 (array!37347 (_ BitVec 64) (_ BitVec 32) List!11868) Unit!19549)

(assert (=> d!88363 (= lt!279448 (choose!21 lt!279318 (select (arr!17920 a!2986) j!136) j!136 Nil!11865))))

(assert (=> d!88363 (bvslt (size!18284 lt!279318) #b01111111111111111111111111111111)))

(assert (=> d!88363 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136 Nil!11865) lt!279448)))

(declare-fun bs!18647 () Bool)

(assert (= bs!18647 d!88363))

(declare-fun m!587609 () Bool)

(assert (=> bs!18647 m!587609))

(assert (=> bs!18647 m!587401))

(declare-fun m!587611 () Bool)

(assert (=> bs!18647 m!587611))

(assert (=> b!610683 d!88363))

(declare-fun b!610866 () Bool)

(declare-fun e!349964 () Bool)

(declare-fun call!33144 () Bool)

(assert (=> b!610866 (= e!349964 call!33144)))

(declare-fun d!88365 () Bool)

(declare-fun res!392923 () Bool)

(declare-fun e!349965 () Bool)

(assert (=> d!88365 (=> res!392923 e!349965)))

(assert (=> d!88365 (= res!392923 (bvsge j!136 (size!18284 lt!279318)))))

(assert (=> d!88365 (= (arrayNoDuplicates!0 lt!279318 j!136 Nil!11865) e!349965)))

(declare-fun b!610867 () Bool)

(declare-fun e!349963 () Bool)

(assert (=> b!610867 (= e!349965 e!349963)))

(declare-fun res!392922 () Bool)

(assert (=> b!610867 (=> (not res!392922) (not e!349963))))

(declare-fun e!349962 () Bool)

(assert (=> b!610867 (= res!392922 (not e!349962))))

(declare-fun res!392921 () Bool)

(assert (=> b!610867 (=> (not res!392921) (not e!349962))))

(assert (=> b!610867 (= res!392921 (validKeyInArray!0 (select (arr!17920 lt!279318) j!136)))))

(declare-fun b!610868 () Bool)

(assert (=> b!610868 (= e!349963 e!349964)))

(declare-fun c!69341 () Bool)

(assert (=> b!610868 (= c!69341 (validKeyInArray!0 (select (arr!17920 lt!279318) j!136)))))

(declare-fun bm!33141 () Bool)

(assert (=> bm!33141 (= call!33144 (arrayNoDuplicates!0 lt!279318 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69341 (Cons!11864 (select (arr!17920 lt!279318) j!136) Nil!11865) Nil!11865)))))

(declare-fun b!610869 () Bool)

(declare-fun contains!3015 (List!11868 (_ BitVec 64)) Bool)

(assert (=> b!610869 (= e!349962 (contains!3015 Nil!11865 (select (arr!17920 lt!279318) j!136)))))

(declare-fun b!610870 () Bool)

(assert (=> b!610870 (= e!349964 call!33144)))

(assert (= (and d!88365 (not res!392923)) b!610867))

(assert (= (and b!610867 res!392921) b!610869))

(assert (= (and b!610867 res!392922) b!610868))

(assert (= (and b!610868 c!69341) b!610866))

(assert (= (and b!610868 (not c!69341)) b!610870))

(assert (= (or b!610866 b!610870) bm!33141))

(assert (=> b!610867 m!587609))

(assert (=> b!610867 m!587609))

(declare-fun m!587613 () Bool)

(assert (=> b!610867 m!587613))

(assert (=> b!610868 m!587609))

(assert (=> b!610868 m!587609))

(assert (=> b!610868 m!587613))

(assert (=> bm!33141 m!587609))

(declare-fun m!587615 () Bool)

(assert (=> bm!33141 m!587615))

(assert (=> b!610869 m!587609))

(assert (=> b!610869 m!587609))

(declare-fun m!587617 () Bool)

(assert (=> b!610869 m!587617))

(assert (=> b!610683 d!88365))

(declare-fun b!610871 () Bool)

(declare-fun e!349968 () Bool)

(declare-fun call!33145 () Bool)

(assert (=> b!610871 (= e!349968 call!33145)))

(declare-fun d!88367 () Bool)

(declare-fun res!392926 () Bool)

(declare-fun e!349969 () Bool)

(assert (=> d!88367 (=> res!392926 e!349969)))

(assert (=> d!88367 (= res!392926 (bvsge #b00000000000000000000000000000000 (size!18284 lt!279318)))))

(assert (=> d!88367 (= (arrayNoDuplicates!0 lt!279318 #b00000000000000000000000000000000 Nil!11865) e!349969)))

(declare-fun b!610872 () Bool)

(declare-fun e!349967 () Bool)

(assert (=> b!610872 (= e!349969 e!349967)))

(declare-fun res!392925 () Bool)

(assert (=> b!610872 (=> (not res!392925) (not e!349967))))

(declare-fun e!349966 () Bool)

(assert (=> b!610872 (= res!392925 (not e!349966))))

(declare-fun res!392924 () Bool)

(assert (=> b!610872 (=> (not res!392924) (not e!349966))))

(assert (=> b!610872 (= res!392924 (validKeyInArray!0 (select (arr!17920 lt!279318) #b00000000000000000000000000000000)))))

(declare-fun b!610873 () Bool)

(assert (=> b!610873 (= e!349967 e!349968)))

(declare-fun c!69342 () Bool)

(assert (=> b!610873 (= c!69342 (validKeyInArray!0 (select (arr!17920 lt!279318) #b00000000000000000000000000000000)))))

(declare-fun bm!33142 () Bool)

(assert (=> bm!33142 (= call!33145 (arrayNoDuplicates!0 lt!279318 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69342 (Cons!11864 (select (arr!17920 lt!279318) #b00000000000000000000000000000000) Nil!11865) Nil!11865)))))

(declare-fun b!610874 () Bool)

(assert (=> b!610874 (= e!349966 (contains!3015 Nil!11865 (select (arr!17920 lt!279318) #b00000000000000000000000000000000)))))

(declare-fun b!610875 () Bool)

(assert (=> b!610875 (= e!349968 call!33145)))

(assert (= (and d!88367 (not res!392926)) b!610872))

(assert (= (and b!610872 res!392924) b!610874))

(assert (= (and b!610872 res!392925) b!610873))

(assert (= (and b!610873 c!69342) b!610871))

(assert (= (and b!610873 (not c!69342)) b!610875))

(assert (= (or b!610871 b!610875) bm!33142))

(declare-fun m!587619 () Bool)

(assert (=> b!610872 m!587619))

(assert (=> b!610872 m!587619))

(declare-fun m!587621 () Bool)

(assert (=> b!610872 m!587621))

(assert (=> b!610873 m!587619))

(assert (=> b!610873 m!587619))

(assert (=> b!610873 m!587621))

(assert (=> bm!33142 m!587619))

(declare-fun m!587623 () Bool)

(assert (=> bm!33142 m!587623))

(assert (=> b!610874 m!587619))

(assert (=> b!610874 m!587619))

(declare-fun m!587625 () Bool)

(assert (=> b!610874 m!587625))

(assert (=> b!610683 d!88367))

(declare-fun d!88369 () Bool)

(assert (=> d!88369 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279451 () Unit!19549)

(declare-fun choose!114 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19549)

(assert (=> d!88369 (= lt!279451 (choose!114 lt!279318 (select (arr!17920 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88369 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88369 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279318 (select (arr!17920 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279451)))

(declare-fun bs!18648 () Bool)

(assert (= bs!18648 d!88369))

(assert (=> bs!18648 m!587401))

(assert (=> bs!18648 m!587463))

(assert (=> bs!18648 m!587401))

(declare-fun m!587627 () Bool)

(assert (=> bs!18648 m!587627))

(assert (=> b!610683 d!88369))

(declare-fun d!88371 () Bool)

(declare-fun e!349972 () Bool)

(assert (=> d!88371 e!349972))

(declare-fun res!392929 () Bool)

(assert (=> d!88371 (=> (not res!392929) (not e!349972))))

(assert (=> d!88371 (= res!392929 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18284 a!2986))))))

(declare-fun lt!279454 () Unit!19549)

(declare-fun choose!41 (array!37347 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11868) Unit!19549)

(assert (=> d!88371 (= lt!279454 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11865))))

(assert (=> d!88371 (bvslt (size!18284 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88371 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11865) lt!279454)))

(declare-fun b!610878 () Bool)

(assert (=> b!610878 (= e!349972 (arrayNoDuplicates!0 (array!37348 (store (arr!17920 a!2986) i!1108 k0!1786) (size!18284 a!2986)) #b00000000000000000000000000000000 Nil!11865))))

(assert (= (and d!88371 res!392929) b!610878))

(declare-fun m!587629 () Bool)

(assert (=> d!88371 m!587629))

(assert (=> b!610878 m!587417))

(declare-fun m!587631 () Bool)

(assert (=> b!610878 m!587631))

(assert (=> b!610683 d!88371))

(declare-fun d!88373 () Bool)

(declare-fun res!392934 () Bool)

(declare-fun e!349977 () Bool)

(assert (=> d!88373 (=> res!392934 e!349977)))

(assert (=> d!88373 (= res!392934 (= (select (arr!17920 lt!279318) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17920 a!2986) j!136)))))

(assert (=> d!88373 (= (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!349977)))

(declare-fun b!610883 () Bool)

(declare-fun e!349978 () Bool)

(assert (=> b!610883 (= e!349977 e!349978)))

(declare-fun res!392935 () Bool)

(assert (=> b!610883 (=> (not res!392935) (not e!349978))))

(assert (=> b!610883 (= res!392935 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18284 lt!279318)))))

(declare-fun b!610884 () Bool)

(assert (=> b!610884 (= e!349978 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88373 (not res!392934)) b!610883))

(assert (= (and b!610883 res!392935) b!610884))

(declare-fun m!587633 () Bool)

(assert (=> d!88373 m!587633))

(assert (=> b!610884 m!587401))

(declare-fun m!587635 () Bool)

(assert (=> b!610884 m!587635))

(assert (=> b!610683 d!88373))

(declare-fun d!88375 () Bool)

(assert (=> d!88375 (arrayNoDuplicates!0 lt!279318 j!136 Nil!11865)))

(declare-fun lt!279457 () Unit!19549)

(declare-fun choose!39 (array!37347 (_ BitVec 32) (_ BitVec 32)) Unit!19549)

(assert (=> d!88375 (= lt!279457 (choose!39 lt!279318 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88375 (bvslt (size!18284 lt!279318) #b01111111111111111111111111111111)))

(assert (=> d!88375 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279318 #b00000000000000000000000000000000 j!136) lt!279457)))

(declare-fun bs!18649 () Bool)

(assert (= bs!18649 d!88375))

(assert (=> bs!18649 m!587461))

(declare-fun m!587637 () Bool)

(assert (=> bs!18649 m!587637))

(assert (=> b!610683 d!88375))

(declare-fun d!88377 () Bool)

(declare-fun res!392936 () Bool)

(declare-fun e!349979 () Bool)

(assert (=> d!88377 (=> res!392936 e!349979)))

(assert (=> d!88377 (= res!392936 (= (select (arr!17920 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88377 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!349979)))

(declare-fun b!610885 () Bool)

(declare-fun e!349980 () Bool)

(assert (=> b!610885 (= e!349979 e!349980)))

(declare-fun res!392937 () Bool)

(assert (=> b!610885 (=> (not res!392937) (not e!349980))))

(assert (=> b!610885 (= res!392937 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18284 a!2986)))))

(declare-fun b!610886 () Bool)

(assert (=> b!610886 (= e!349980 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88377 (not res!392936)) b!610885))

(assert (= (and b!610885 res!392937) b!610886))

(assert (=> d!88377 m!587597))

(declare-fun m!587639 () Bool)

(assert (=> b!610886 m!587639))

(assert (=> b!610682 d!88377))

(declare-fun b!610899 () Bool)

(declare-fun e!349987 () SeekEntryResult!6316)

(declare-fun e!349989 () SeekEntryResult!6316)

(assert (=> b!610899 (= e!349987 e!349989)))

(declare-fun lt!279465 () (_ BitVec 64))

(declare-fun lt!279464 () SeekEntryResult!6316)

(assert (=> b!610899 (= lt!279465 (select (arr!17920 a!2986) (index!27544 lt!279464)))))

(declare-fun c!69349 () Bool)

(assert (=> b!610899 (= c!69349 (= lt!279465 k0!1786))))

(declare-fun b!610900 () Bool)

(declare-fun e!349988 () SeekEntryResult!6316)

(assert (=> b!610900 (= e!349988 (MissingZero!6316 (index!27544 lt!279464)))))

(declare-fun b!610901 () Bool)

(declare-fun c!69350 () Bool)

(assert (=> b!610901 (= c!69350 (= lt!279465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!610901 (= e!349989 e!349988)))

(declare-fun b!610902 () Bool)

(assert (=> b!610902 (= e!349988 (seekKeyOrZeroReturnVacant!0 (x!56501 lt!279464) (index!27544 lt!279464) (index!27544 lt!279464) k0!1786 a!2986 mask!3053))))

(declare-fun d!88379 () Bool)

(declare-fun lt!279466 () SeekEntryResult!6316)

(get-info :version)

(assert (=> d!88379 (and (or ((_ is Undefined!6316) lt!279466) (not ((_ is Found!6316) lt!279466)) (and (bvsge (index!27543 lt!279466) #b00000000000000000000000000000000) (bvslt (index!27543 lt!279466) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279466) ((_ is Found!6316) lt!279466) (not ((_ is MissingZero!6316) lt!279466)) (and (bvsge (index!27542 lt!279466) #b00000000000000000000000000000000) (bvslt (index!27542 lt!279466) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279466) ((_ is Found!6316) lt!279466) ((_ is MissingZero!6316) lt!279466) (not ((_ is MissingVacant!6316) lt!279466)) (and (bvsge (index!27545 lt!279466) #b00000000000000000000000000000000) (bvslt (index!27545 lt!279466) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279466) (ite ((_ is Found!6316) lt!279466) (= (select (arr!17920 a!2986) (index!27543 lt!279466)) k0!1786) (ite ((_ is MissingZero!6316) lt!279466) (= (select (arr!17920 a!2986) (index!27542 lt!279466)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6316) lt!279466) (= (select (arr!17920 a!2986) (index!27545 lt!279466)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88379 (= lt!279466 e!349987)))

(declare-fun c!69351 () Bool)

(assert (=> d!88379 (= c!69351 (and ((_ is Intermediate!6316) lt!279464) (undefined!7128 lt!279464)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37347 (_ BitVec 32)) SeekEntryResult!6316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88379 (= lt!279464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88379 (validMask!0 mask!3053)))

(assert (=> d!88379 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279466)))

(declare-fun b!610903 () Bool)

(assert (=> b!610903 (= e!349987 Undefined!6316)))

(declare-fun b!610904 () Bool)

(assert (=> b!610904 (= e!349989 (Found!6316 (index!27544 lt!279464)))))

(assert (= (and d!88379 c!69351) b!610903))

(assert (= (and d!88379 (not c!69351)) b!610899))

(assert (= (and b!610899 c!69349) b!610904))

(assert (= (and b!610899 (not c!69349)) b!610901))

(assert (= (and b!610901 c!69350) b!610900))

(assert (= (and b!610901 (not c!69350)) b!610902))

(declare-fun m!587641 () Bool)

(assert (=> b!610899 m!587641))

(declare-fun m!587643 () Bool)

(assert (=> b!610902 m!587643))

(assert (=> d!88379 m!587437))

(declare-fun m!587645 () Bool)

(assert (=> d!88379 m!587645))

(declare-fun m!587647 () Bool)

(assert (=> d!88379 m!587647))

(assert (=> d!88379 m!587647))

(declare-fun m!587649 () Bool)

(assert (=> d!88379 m!587649))

(declare-fun m!587651 () Bool)

(assert (=> d!88379 m!587651))

(declare-fun m!587653 () Bool)

(assert (=> d!88379 m!587653))

(assert (=> b!610693 d!88379))

(declare-fun d!88385 () Bool)

(declare-fun res!392942 () Bool)

(declare-fun e!349994 () Bool)

(assert (=> d!88385 (=> res!392942 e!349994)))

(assert (=> d!88385 (= res!392942 (= (select (arr!17920 lt!279318) j!136) (select (arr!17920 a!2986) j!136)))))

(assert (=> d!88385 (= (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136) e!349994)))

(declare-fun b!610909 () Bool)

(declare-fun e!349995 () Bool)

(assert (=> b!610909 (= e!349994 e!349995)))

(declare-fun res!392943 () Bool)

(assert (=> b!610909 (=> (not res!392943) (not e!349995))))

(assert (=> b!610909 (= res!392943 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18284 lt!279318)))))

(declare-fun b!610910 () Bool)

(assert (=> b!610910 (= e!349995 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88385 (not res!392942)) b!610909))

(assert (= (and b!610909 res!392943) b!610910))

(assert (=> d!88385 m!587609))

(assert (=> b!610910 m!587401))

(declare-fun m!587655 () Bool)

(assert (=> b!610910 m!587655))

(assert (=> b!610692 d!88385))

(declare-fun d!88387 () Bool)

(assert (=> d!88387 (= (validKeyInArray!0 (select (arr!17920 a!2986) j!136)) (and (not (= (select (arr!17920 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17920 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!610690 d!88387))

(declare-fun lt!279482 () SeekEntryResult!6316)

(declare-fun d!88389 () Bool)

(assert (=> d!88389 (and (or ((_ is Undefined!6316) lt!279482) (not ((_ is Found!6316) lt!279482)) (and (bvsge (index!27543 lt!279482) #b00000000000000000000000000000000) (bvslt (index!27543 lt!279482) (size!18284 lt!279318)))) (or ((_ is Undefined!6316) lt!279482) ((_ is Found!6316) lt!279482) (not ((_ is MissingVacant!6316) lt!279482)) (not (= (index!27545 lt!279482) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!279482) #b00000000000000000000000000000000) (bvslt (index!27545 lt!279482) (size!18284 lt!279318)))) (or ((_ is Undefined!6316) lt!279482) (ite ((_ is Found!6316) lt!279482) (= (select (arr!17920 lt!279318) (index!27543 lt!279482)) lt!279320) (and ((_ is MissingVacant!6316) lt!279482) (= (index!27545 lt!279482) vacantSpotIndex!68) (= (select (arr!17920 lt!279318) (index!27545 lt!279482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350025 () SeekEntryResult!6316)

(assert (=> d!88389 (= lt!279482 e!350025)))

(declare-fun c!69374 () Bool)

(assert (=> d!88389 (= c!69374 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279481 () (_ BitVec 64))

(assert (=> d!88389 (= lt!279481 (select (arr!17920 lt!279318) lt!279325))))

(assert (=> d!88389 (validMask!0 mask!3053)))

(assert (=> d!88389 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 lt!279320 lt!279318 mask!3053) lt!279482)))

(declare-fun b!610961 () Bool)

(declare-fun c!69375 () Bool)

(assert (=> b!610961 (= c!69375 (= lt!279481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350026 () SeekEntryResult!6316)

(declare-fun e!350027 () SeekEntryResult!6316)

(assert (=> b!610961 (= e!350026 e!350027)))

(declare-fun b!610962 () Bool)

(assert (=> b!610962 (= e!350025 Undefined!6316)))

(declare-fun b!610963 () Bool)

(assert (=> b!610963 (= e!350027 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279325 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!279320 lt!279318 mask!3053))))

(declare-fun b!610964 () Bool)

(assert (=> b!610964 (= e!350025 e!350026)))

(declare-fun c!69373 () Bool)

(assert (=> b!610964 (= c!69373 (= lt!279481 lt!279320))))

(declare-fun b!610965 () Bool)

(assert (=> b!610965 (= e!350026 (Found!6316 lt!279325))))

(declare-fun b!610966 () Bool)

(assert (=> b!610966 (= e!350027 (MissingVacant!6316 vacantSpotIndex!68))))

(assert (= (and d!88389 c!69374) b!610962))

(assert (= (and d!88389 (not c!69374)) b!610964))

(assert (= (and b!610964 c!69373) b!610965))

(assert (= (and b!610964 (not c!69373)) b!610961))

(assert (= (and b!610961 c!69375) b!610966))

(assert (= (and b!610961 (not c!69375)) b!610963))

(declare-fun m!587673 () Bool)

(assert (=> d!88389 m!587673))

(declare-fun m!587675 () Bool)

(assert (=> d!88389 m!587675))

(declare-fun m!587677 () Bool)

(assert (=> d!88389 m!587677))

(assert (=> d!88389 m!587437))

(declare-fun m!587679 () Bool)

(assert (=> b!610963 m!587679))

(assert (=> b!610963 m!587679))

(declare-fun m!587681 () Bool)

(assert (=> b!610963 m!587681))

(assert (=> b!610678 d!88389))

(declare-fun d!88397 () Bool)

(declare-fun e!350048 () Bool)

(assert (=> d!88397 e!350048))

(declare-fun res!392966 () Bool)

(assert (=> d!88397 (=> (not res!392966) (not e!350048))))

(assert (=> d!88397 (= res!392966 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18284 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18284 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18284 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18284 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18284 a!2986))))))

(declare-fun lt!279499 () Unit!19549)

(declare-fun choose!9 (array!37347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19549)

(assert (=> d!88397 (= lt!279499 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88397 (validMask!0 mask!3053)))

(assert (=> d!88397 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 mask!3053) lt!279499)))

(declare-fun b!610993 () Bool)

(assert (=> b!610993 (= e!350048 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 (select (store (arr!17920 a!2986) i!1108 k0!1786) j!136) (array!37348 (store (arr!17920 a!2986) i!1108 k0!1786) (size!18284 a!2986)) mask!3053)))))

(assert (= (and d!88397 res!392966) b!610993))

(declare-fun m!587709 () Bool)

(assert (=> d!88397 m!587709))

(assert (=> d!88397 m!587437))

(assert (=> b!610993 m!587409))

(assert (=> b!610993 m!587401))

(assert (=> b!610993 m!587413))

(assert (=> b!610993 m!587401))

(assert (=> b!610993 m!587409))

(declare-fun m!587715 () Bool)

(assert (=> b!610993 m!587715))

(assert (=> b!610993 m!587417))

(assert (=> b!610678 d!88397))

(declare-fun lt!279501 () SeekEntryResult!6316)

(declare-fun d!88415 () Bool)

(assert (=> d!88415 (and (or ((_ is Undefined!6316) lt!279501) (not ((_ is Found!6316) lt!279501)) (and (bvsge (index!27543 lt!279501) #b00000000000000000000000000000000) (bvslt (index!27543 lt!279501) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279501) ((_ is Found!6316) lt!279501) (not ((_ is MissingVacant!6316) lt!279501)) (not (= (index!27545 lt!279501) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!279501) #b00000000000000000000000000000000) (bvslt (index!27545 lt!279501) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279501) (ite ((_ is Found!6316) lt!279501) (= (select (arr!17920 a!2986) (index!27543 lt!279501)) (select (arr!17920 a!2986) j!136)) (and ((_ is MissingVacant!6316) lt!279501) (= (index!27545 lt!279501) vacantSpotIndex!68) (= (select (arr!17920 a!2986) (index!27545 lt!279501)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350053 () SeekEntryResult!6316)

(assert (=> d!88415 (= lt!279501 e!350053)))

(declare-fun c!69383 () Bool)

(assert (=> d!88415 (= c!69383 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279500 () (_ BitVec 64))

(assert (=> d!88415 (= lt!279500 (select (arr!17920 a!2986) lt!279325))))

(assert (=> d!88415 (validMask!0 mask!3053)))

(assert (=> d!88415 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279325 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053) lt!279501)))

(declare-fun b!610998 () Bool)

(declare-fun c!69384 () Bool)

(assert (=> b!610998 (= c!69384 (= lt!279500 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350054 () SeekEntryResult!6316)

(declare-fun e!350055 () SeekEntryResult!6316)

(assert (=> b!610998 (= e!350054 e!350055)))

(declare-fun b!610999 () Bool)

(assert (=> b!610999 (= e!350053 Undefined!6316)))

(declare-fun b!611000 () Bool)

(assert (=> b!611000 (= e!350055 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279325 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611001 () Bool)

(assert (=> b!611001 (= e!350053 e!350054)))

(declare-fun c!69382 () Bool)

(assert (=> b!611001 (= c!69382 (= lt!279500 (select (arr!17920 a!2986) j!136)))))

(declare-fun b!611002 () Bool)

(assert (=> b!611002 (= e!350054 (Found!6316 lt!279325))))

(declare-fun b!611003 () Bool)

(assert (=> b!611003 (= e!350055 (MissingVacant!6316 vacantSpotIndex!68))))

(assert (= (and d!88415 c!69383) b!610999))

(assert (= (and d!88415 (not c!69383)) b!611001))

(assert (= (and b!611001 c!69382) b!611002))

(assert (= (and b!611001 (not c!69382)) b!610998))

(assert (= (and b!610998 c!69384) b!611003))

(assert (= (and b!610998 (not c!69384)) b!611000))

(declare-fun m!587721 () Bool)

(assert (=> d!88415 m!587721))

(declare-fun m!587723 () Bool)

(assert (=> d!88415 m!587723))

(declare-fun m!587725 () Bool)

(assert (=> d!88415 m!587725))

(assert (=> d!88415 m!587437))

(assert (=> b!611000 m!587679))

(assert (=> b!611000 m!587679))

(assert (=> b!611000 m!587401))

(declare-fun m!587727 () Bool)

(assert (=> b!611000 m!587727))

(assert (=> b!610678 d!88415))

(declare-fun d!88419 () Bool)

(declare-fun lt!279504 () (_ BitVec 32))

(assert (=> d!88419 (and (bvsge lt!279504 #b00000000000000000000000000000000) (bvslt lt!279504 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88419 (= lt!279504 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!88419 (validMask!0 mask!3053)))

(assert (=> d!88419 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!279504)))

(declare-fun bs!18651 () Bool)

(assert (= bs!18651 d!88419))

(declare-fun m!587729 () Bool)

(assert (=> bs!18651 m!587729))

(assert (=> bs!18651 m!587437))

(assert (=> b!610678 d!88419))

(declare-fun lt!279508 () SeekEntryResult!6316)

(declare-fun d!88421 () Bool)

(assert (=> d!88421 (and (or ((_ is Undefined!6316) lt!279508) (not ((_ is Found!6316) lt!279508)) (and (bvsge (index!27543 lt!279508) #b00000000000000000000000000000000) (bvslt (index!27543 lt!279508) (size!18284 lt!279318)))) (or ((_ is Undefined!6316) lt!279508) ((_ is Found!6316) lt!279508) (not ((_ is MissingVacant!6316) lt!279508)) (not (= (index!27545 lt!279508) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!279508) #b00000000000000000000000000000000) (bvslt (index!27545 lt!279508) (size!18284 lt!279318)))) (or ((_ is Undefined!6316) lt!279508) (ite ((_ is Found!6316) lt!279508) (= (select (arr!17920 lt!279318) (index!27543 lt!279508)) lt!279320) (and ((_ is MissingVacant!6316) lt!279508) (= (index!27545 lt!279508) vacantSpotIndex!68) (= (select (arr!17920 lt!279318) (index!27545 lt!279508)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350058 () SeekEntryResult!6316)

(assert (=> d!88421 (= lt!279508 e!350058)))

(declare-fun c!69386 () Bool)

(assert (=> d!88421 (= c!69386 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279507 () (_ BitVec 64))

(assert (=> d!88421 (= lt!279507 (select (arr!17920 lt!279318) index!984))))

(assert (=> d!88421 (validMask!0 mask!3053)))

(assert (=> d!88421 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279320 lt!279318 mask!3053) lt!279508)))

(declare-fun b!611004 () Bool)

(declare-fun c!69387 () Bool)

(assert (=> b!611004 (= c!69387 (= lt!279507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350059 () SeekEntryResult!6316)

(declare-fun e!350060 () SeekEntryResult!6316)

(assert (=> b!611004 (= e!350059 e!350060)))

(declare-fun b!611005 () Bool)

(assert (=> b!611005 (= e!350058 Undefined!6316)))

(declare-fun b!611006 () Bool)

(assert (=> b!611006 (= e!350060 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!279320 lt!279318 mask!3053))))

(declare-fun b!611007 () Bool)

(assert (=> b!611007 (= e!350058 e!350059)))

(declare-fun c!69385 () Bool)

(assert (=> b!611007 (= c!69385 (= lt!279507 lt!279320))))

(declare-fun b!611008 () Bool)

(assert (=> b!611008 (= e!350059 (Found!6316 index!984))))

(declare-fun b!611009 () Bool)

(assert (=> b!611009 (= e!350060 (MissingVacant!6316 vacantSpotIndex!68))))

(assert (= (and d!88421 c!69386) b!611005))

(assert (= (and d!88421 (not c!69386)) b!611007))

(assert (= (and b!611007 c!69385) b!611008))

(assert (= (and b!611007 (not c!69385)) b!611004))

(assert (= (and b!611004 c!69387) b!611009))

(assert (= (and b!611004 (not c!69387)) b!611006))

(declare-fun m!587731 () Bool)

(assert (=> d!88421 m!587731))

(declare-fun m!587733 () Bool)

(assert (=> d!88421 m!587733))

(declare-fun m!587735 () Bool)

(assert (=> d!88421 m!587735))

(assert (=> d!88421 m!587437))

(declare-fun m!587737 () Bool)

(assert (=> b!611006 m!587737))

(assert (=> b!611006 m!587737))

(declare-fun m!587739 () Bool)

(assert (=> b!611006 m!587739))

(assert (=> b!610678 d!88421))

(declare-fun d!88423 () Bool)

(assert (=> d!88423 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279509 () Unit!19549)

(assert (=> d!88423 (= lt!279509 (choose!114 lt!279318 (select (arr!17920 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88423 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88423 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279318 (select (arr!17920 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279509)))

(declare-fun bs!18652 () Bool)

(assert (= bs!18652 d!88423))

(assert (=> bs!18652 m!587401))

(assert (=> bs!18652 m!587429))

(assert (=> bs!18652 m!587401))

(declare-fun m!587741 () Bool)

(assert (=> bs!18652 m!587741))

(assert (=> b!610688 d!88423))

(assert (=> b!610688 d!88367))

(assert (=> b!610688 d!88385))

(assert (=> b!610688 d!88371))

(declare-fun d!88425 () Bool)

(declare-fun res!392974 () Bool)

(declare-fun e!350062 () Bool)

(assert (=> d!88425 (=> res!392974 e!350062)))

(assert (=> d!88425 (= res!392974 (= (select (arr!17920 lt!279318) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17920 a!2986) j!136)))))

(assert (=> d!88425 (= (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!350062)))

(declare-fun b!611013 () Bool)

(declare-fun e!350063 () Bool)

(assert (=> b!611013 (= e!350062 e!350063)))

(declare-fun res!392975 () Bool)

(assert (=> b!611013 (=> (not res!392975) (not e!350063))))

(assert (=> b!611013 (= res!392975 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18284 lt!279318)))))

(declare-fun b!611014 () Bool)

(assert (=> b!611014 (= e!350063 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88425 (not res!392974)) b!611013))

(assert (= (and b!611013 res!392975) b!611014))

(declare-fun m!587747 () Bool)

(assert (=> d!88425 m!587747))

(assert (=> b!611014 m!587401))

(declare-fun m!587749 () Bool)

(assert (=> b!611014 m!587749))

(assert (=> b!610688 d!88425))

(declare-fun d!88429 () Bool)

(declare-fun res!392976 () Bool)

(declare-fun e!350064 () Bool)

(assert (=> d!88429 (=> res!392976 e!350064)))

(assert (=> d!88429 (= res!392976 (= (select (arr!17920 lt!279318) index!984) (select (arr!17920 a!2986) j!136)))))

(assert (=> d!88429 (= (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) index!984) e!350064)))

(declare-fun b!611015 () Bool)

(declare-fun e!350065 () Bool)

(assert (=> b!611015 (= e!350064 e!350065)))

(declare-fun res!392977 () Bool)

(assert (=> b!611015 (=> (not res!392977) (not e!350065))))

(assert (=> b!611015 (= res!392977 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18284 lt!279318)))))

(declare-fun b!611016 () Bool)

(assert (=> b!611016 (= e!350065 (arrayContainsKey!0 lt!279318 (select (arr!17920 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88429 (not res!392976)) b!611015))

(assert (= (and b!611015 res!392977) b!611016))

(assert (=> d!88429 m!587735))

(assert (=> b!611016 m!587401))

(declare-fun m!587751 () Bool)

(assert (=> b!611016 m!587751))

(assert (=> b!610699 d!88429))

(declare-fun b!611017 () Bool)

(declare-fun e!350068 () Bool)

(declare-fun call!33149 () Bool)

(assert (=> b!611017 (= e!350068 call!33149)))

(declare-fun d!88431 () Bool)

(declare-fun res!392980 () Bool)

(declare-fun e!350069 () Bool)

(assert (=> d!88431 (=> res!392980 e!350069)))

(assert (=> d!88431 (= res!392980 (bvsge #b00000000000000000000000000000000 (size!18284 a!2986)))))

(assert (=> d!88431 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11865) e!350069)))

(declare-fun b!611018 () Bool)

(declare-fun e!350067 () Bool)

(assert (=> b!611018 (= e!350069 e!350067)))

(declare-fun res!392979 () Bool)

(assert (=> b!611018 (=> (not res!392979) (not e!350067))))

(declare-fun e!350066 () Bool)

(assert (=> b!611018 (= res!392979 (not e!350066))))

(declare-fun res!392978 () Bool)

(assert (=> b!611018 (=> (not res!392978) (not e!350066))))

(assert (=> b!611018 (= res!392978 (validKeyInArray!0 (select (arr!17920 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611019 () Bool)

(assert (=> b!611019 (= e!350067 e!350068)))

(declare-fun c!69388 () Bool)

(assert (=> b!611019 (= c!69388 (validKeyInArray!0 (select (arr!17920 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33146 () Bool)

(assert (=> bm!33146 (= call!33149 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69388 (Cons!11864 (select (arr!17920 a!2986) #b00000000000000000000000000000000) Nil!11865) Nil!11865)))))

(declare-fun b!611020 () Bool)

(assert (=> b!611020 (= e!350066 (contains!3015 Nil!11865 (select (arr!17920 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611021 () Bool)

(assert (=> b!611021 (= e!350068 call!33149)))

(assert (= (and d!88431 (not res!392980)) b!611018))

(assert (= (and b!611018 res!392978) b!611020))

(assert (= (and b!611018 res!392979) b!611019))

(assert (= (and b!611019 c!69388) b!611017))

(assert (= (and b!611019 (not c!69388)) b!611021))

(assert (= (or b!611017 b!611021) bm!33146))

(assert (=> b!611018 m!587597))

(assert (=> b!611018 m!587597))

(assert (=> b!611018 m!587605))

(assert (=> b!611019 m!587597))

(assert (=> b!611019 m!587597))

(assert (=> b!611019 m!587605))

(assert (=> bm!33146 m!587597))

(declare-fun m!587753 () Bool)

(assert (=> bm!33146 m!587753))

(assert (=> b!611020 m!587597))

(assert (=> b!611020 m!587597))

(declare-fun m!587755 () Bool)

(assert (=> b!611020 m!587755))

(assert (=> b!610698 d!88431))

(declare-fun d!88433 () Bool)

(declare-fun res!392991 () Bool)

(declare-fun e!350082 () Bool)

(assert (=> d!88433 (=> res!392991 e!350082)))

(assert (=> d!88433 (= res!392991 ((_ is Nil!11865) Nil!11865))))

(assert (=> d!88433 (= (noDuplicate!346 Nil!11865) e!350082)))

(declare-fun b!611036 () Bool)

(declare-fun e!350083 () Bool)

(assert (=> b!611036 (= e!350082 e!350083)))

(declare-fun res!392992 () Bool)

(assert (=> b!611036 (=> (not res!392992) (not e!350083))))

(assert (=> b!611036 (= res!392992 (not (contains!3015 (t!18088 Nil!11865) (h!12912 Nil!11865))))))

(declare-fun b!611037 () Bool)

(assert (=> b!611037 (= e!350083 (noDuplicate!346 (t!18088 Nil!11865)))))

(assert (= (and d!88433 (not res!392991)) b!611036))

(assert (= (and b!611036 res!392992) b!611037))

(declare-fun m!587757 () Bool)

(assert (=> b!611036 m!587757))

(declare-fun m!587759 () Bool)

(assert (=> b!611037 m!587759))

(assert (=> b!610687 d!88433))

(declare-fun d!88435 () Bool)

(assert (=> d!88435 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55752 d!88435))

(declare-fun d!88443 () Bool)

(assert (=> d!88443 (= (array_inv!13779 a!2986) (bvsge (size!18284 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55752 d!88443))

(declare-fun d!88445 () Bool)

(declare-fun lt!279530 () SeekEntryResult!6316)

(assert (=> d!88445 (and (or ((_ is Undefined!6316) lt!279530) (not ((_ is Found!6316) lt!279530)) (and (bvsge (index!27543 lt!279530) #b00000000000000000000000000000000) (bvslt (index!27543 lt!279530) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279530) ((_ is Found!6316) lt!279530) (not ((_ is MissingVacant!6316) lt!279530)) (not (= (index!27545 lt!279530) vacantSpotIndex!68)) (and (bvsge (index!27545 lt!279530) #b00000000000000000000000000000000) (bvslt (index!27545 lt!279530) (size!18284 a!2986)))) (or ((_ is Undefined!6316) lt!279530) (ite ((_ is Found!6316) lt!279530) (= (select (arr!17920 a!2986) (index!27543 lt!279530)) (select (arr!17920 a!2986) j!136)) (and ((_ is MissingVacant!6316) lt!279530) (= (index!27545 lt!279530) vacantSpotIndex!68) (= (select (arr!17920 a!2986) (index!27545 lt!279530)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350103 () SeekEntryResult!6316)

(assert (=> d!88445 (= lt!279530 e!350103)))

(declare-fun c!69404 () Bool)

(assert (=> d!88445 (= c!69404 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279529 () (_ BitVec 64))

(assert (=> d!88445 (= lt!279529 (select (arr!17920 a!2986) index!984))))

(assert (=> d!88445 (validMask!0 mask!3053)))

(assert (=> d!88445 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053) lt!279530)))

(declare-fun b!611069 () Bool)

(declare-fun c!69405 () Bool)

(assert (=> b!611069 (= c!69405 (= lt!279529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350104 () SeekEntryResult!6316)

(declare-fun e!350105 () SeekEntryResult!6316)

(assert (=> b!611069 (= e!350104 e!350105)))

(declare-fun b!611070 () Bool)

(assert (=> b!611070 (= e!350103 Undefined!6316)))

(declare-fun b!611071 () Bool)

(assert (=> b!611071 (= e!350105 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17920 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611072 () Bool)

(assert (=> b!611072 (= e!350103 e!350104)))

(declare-fun c!69403 () Bool)

(assert (=> b!611072 (= c!69403 (= lt!279529 (select (arr!17920 a!2986) j!136)))))

(declare-fun b!611073 () Bool)

(assert (=> b!611073 (= e!350104 (Found!6316 index!984))))

(declare-fun b!611074 () Bool)

(assert (=> b!611074 (= e!350105 (MissingVacant!6316 vacantSpotIndex!68))))

(assert (= (and d!88445 c!69404) b!611070))

(assert (= (and d!88445 (not c!69404)) b!611072))

(assert (= (and b!611072 c!69403) b!611073))

(assert (= (and b!611072 (not c!69403)) b!611069))

(assert (= (and b!611069 c!69405) b!611074))

(assert (= (and b!611069 (not c!69405)) b!611071))

(declare-fun m!587785 () Bool)

(assert (=> d!88445 m!587785))

(declare-fun m!587787 () Bool)

(assert (=> d!88445 m!587787))

(assert (=> d!88445 m!587399))

(assert (=> d!88445 m!587437))

(assert (=> b!611071 m!587737))

(assert (=> b!611071 m!587737))

(assert (=> b!611071 m!587401))

(declare-fun m!587789 () Bool)

(assert (=> b!611071 m!587789))

(assert (=> b!610697 d!88445))

(assert (=> b!610696 d!88429))

(check-sat (not b!610886) (not b!610852) (not d!88423) (not b!610869) (not d!88369) (not d!88421) (not d!88397) (not bm!33141) (not b!611014) (not b!611006) (not b!611071) (not d!88375) (not b!610868) (not d!88389) (not bm!33146) (not b!611020) (not d!88371) (not b!610872) (not b!610878) (not b!610873) (not b!611036) (not b!611016) (not d!88419) (not b!610855) (not b!611037) (not b!610884) (not d!88445) (not d!88415) (not b!610910) (not bm!33142) (not b!610963) (not b!611018) (not b!610993) (not b!610867) (not bm!33138) (not b!610874) (not d!88363) (not b!611000) (not d!88379) (not b!611019) (not b!610902))
(check-sat)
