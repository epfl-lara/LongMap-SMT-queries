; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58138 () Bool)

(assert start!58138)

(declare-fun b!642674 () Bool)

(declare-datatypes ((Unit!21756 0))(
  ( (Unit!21757) )
))
(declare-fun e!368072 () Unit!21756)

(declare-fun Unit!21758 () Unit!21756)

(assert (=> b!642674 (= e!368072 Unit!21758)))

(assert (=> b!642674 false))

(declare-fun b!642675 () Bool)

(declare-fun e!368062 () Bool)

(declare-fun e!368071 () Bool)

(assert (=> b!642675 (= e!368062 e!368071)))

(declare-fun res!416359 () Bool)

(assert (=> b!642675 (=> (not res!416359) (not e!368071))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6855 0))(
  ( (MissingZero!6855 (index!29746 (_ BitVec 32))) (Found!6855 (index!29747 (_ BitVec 32))) (Intermediate!6855 (undefined!7667 Bool) (index!29748 (_ BitVec 32)) (x!58509 (_ BitVec 32))) (Undefined!6855) (MissingVacant!6855 (index!29749 (_ BitVec 32))) )
))
(declare-fun lt!297682 () SeekEntryResult!6855)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38397 0))(
  ( (array!38398 (arr!18415 (Array (_ BitVec 32) (_ BitVec 64))) (size!18779 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38397)

(assert (=> b!642675 (= res!416359 (and (= lt!297682 (Found!6855 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18415 a!2986) index!984) (select (arr!18415 a!2986) j!136))) (not (= (select (arr!18415 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38397 (_ BitVec 32)) SeekEntryResult!6855)

(assert (=> b!642675 (= lt!297682 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642676 () Bool)

(declare-fun res!416368 () Bool)

(declare-fun e!368067 () Bool)

(assert (=> b!642676 (=> (not res!416368) (not e!368067))))

(assert (=> b!642676 (= res!416368 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18415 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642677 () Bool)

(declare-fun res!416364 () Bool)

(declare-fun e!368066 () Bool)

(assert (=> b!642677 (=> (not res!416364) (not e!368066))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642677 (= res!416364 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642678 () Bool)

(declare-fun e!368060 () Bool)

(declare-fun e!368069 () Bool)

(assert (=> b!642678 (= e!368060 e!368069)))

(declare-fun res!416374 () Bool)

(assert (=> b!642678 (=> (not res!416374) (not e!368069))))

(declare-fun lt!297684 () array!38397)

(assert (=> b!642678 (= res!416374 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) j!136))))

(declare-fun b!642679 () Bool)

(declare-fun res!416372 () Bool)

(assert (=> b!642679 (=> (not res!416372) (not e!368067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38397 (_ BitVec 32)) Bool)

(assert (=> b!642679 (= res!416372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642680 () Bool)

(declare-fun Unit!21759 () Unit!21756)

(assert (=> b!642680 (= e!368072 Unit!21759)))

(declare-fun b!642681 () Bool)

(declare-fun res!416370 () Bool)

(assert (=> b!642681 (=> (not res!416370) (not e!368066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642681 (= res!416370 (validKeyInArray!0 k0!1786))))

(declare-fun b!642682 () Bool)

(declare-fun e!368070 () Bool)

(assert (=> b!642682 (= e!368070 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) j!136))))

(declare-fun b!642683 () Bool)

(assert (=> b!642683 (= e!368069 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) index!984))))

(declare-fun b!642684 () Bool)

(declare-fun e!368061 () Bool)

(assert (=> b!642684 (= e!368071 (not e!368061))))

(declare-fun res!416363 () Bool)

(assert (=> b!642684 (=> res!416363 e!368061)))

(declare-fun lt!297681 () SeekEntryResult!6855)

(assert (=> b!642684 (= res!416363 (not (= lt!297681 (Found!6855 index!984))))))

(declare-fun lt!297694 () Unit!21756)

(assert (=> b!642684 (= lt!297694 e!368072)))

(declare-fun c!73526 () Bool)

(assert (=> b!642684 (= c!73526 (= lt!297681 Undefined!6855))))

(declare-fun lt!297685 () (_ BitVec 64))

(assert (=> b!642684 (= lt!297681 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297685 lt!297684 mask!3053))))

(declare-fun e!368064 () Bool)

(assert (=> b!642684 e!368064))

(declare-fun res!416362 () Bool)

(assert (=> b!642684 (=> (not res!416362) (not e!368064))))

(declare-fun lt!297683 () (_ BitVec 32))

(declare-fun lt!297693 () SeekEntryResult!6855)

(assert (=> b!642684 (= res!416362 (= lt!297693 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 lt!297685 lt!297684 mask!3053)))))

(assert (=> b!642684 (= lt!297693 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642684 (= lt!297685 (select (store (arr!18415 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297687 () Unit!21756)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21756)

(assert (=> b!642684 (= lt!297687 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642684 (= lt!297683 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642685 () Bool)

(declare-fun e!368068 () Bool)

(assert (=> b!642685 (= e!368061 e!368068)))

(declare-fun res!416361 () Bool)

(assert (=> b!642685 (=> res!416361 e!368068)))

(declare-fun lt!297691 () (_ BitVec 64))

(assert (=> b!642685 (= res!416361 (or (not (= (select (arr!18415 a!2986) j!136) lt!297685)) (not (= (select (arr!18415 a!2986) j!136) lt!297691))))))

(declare-fun e!368073 () Bool)

(assert (=> b!642685 e!368073))

(declare-fun res!416371 () Bool)

(assert (=> b!642685 (=> (not res!416371) (not e!368073))))

(assert (=> b!642685 (= res!416371 (= lt!297691 (select (arr!18415 a!2986) j!136)))))

(assert (=> b!642685 (= lt!297691 (select (store (arr!18415 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642686 () Bool)

(declare-fun e!368063 () Unit!21756)

(declare-fun Unit!21760 () Unit!21756)

(assert (=> b!642686 (= e!368063 Unit!21760)))

(declare-fun lt!297686 () Unit!21756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21756)

(assert (=> b!642686 (= lt!297686 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297684 (select (arr!18415 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!642686 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297689 () Unit!21756)

(declare-datatypes ((List!12456 0))(
  ( (Nil!12453) (Cons!12452 (h!13497 (_ BitVec 64)) (t!18684 List!12456)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12456) Unit!21756)

(assert (=> b!642686 (= lt!297689 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453))))

(declare-fun arrayNoDuplicates!0 (array!38397 (_ BitVec 32) List!12456) Bool)

(assert (=> b!642686 (arrayNoDuplicates!0 lt!297684 #b00000000000000000000000000000000 Nil!12453)))

(declare-fun lt!297688 () Unit!21756)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38397 (_ BitVec 32) (_ BitVec 32)) Unit!21756)

(assert (=> b!642686 (= lt!297688 (lemmaNoDuplicateFromThenFromBigger!0 lt!297684 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642686 (arrayNoDuplicates!0 lt!297684 j!136 Nil!12453)))

(declare-fun lt!297692 () Unit!21756)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38397 (_ BitVec 64) (_ BitVec 32) List!12456) Unit!21756)

(assert (=> b!642686 (= lt!297692 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297684 (select (arr!18415 a!2986) j!136) j!136 Nil!12453))))

(assert (=> b!642686 false))

(declare-fun b!642688 () Bool)

(assert (=> b!642688 (= e!368066 e!368067)))

(declare-fun res!416366 () Bool)

(assert (=> b!642688 (=> (not res!416366) (not e!368067))))

(declare-fun lt!297690 () SeekEntryResult!6855)

(assert (=> b!642688 (= res!416366 (or (= lt!297690 (MissingZero!6855 i!1108)) (= lt!297690 (MissingVacant!6855 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38397 (_ BitVec 32)) SeekEntryResult!6855)

(assert (=> b!642688 (= lt!297690 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642689 () Bool)

(assert (=> b!642689 (= e!368068 e!368070)))

(declare-fun res!416367 () Bool)

(assert (=> b!642689 (=> res!416367 e!368070)))

(assert (=> b!642689 (= res!416367 (bvsge index!984 j!136))))

(declare-fun lt!297680 () Unit!21756)

(assert (=> b!642689 (= lt!297680 e!368063)))

(declare-fun c!73525 () Bool)

(assert (=> b!642689 (= c!73525 (bvslt j!136 index!984))))

(declare-fun b!642690 () Bool)

(declare-fun res!416365 () Bool)

(assert (=> b!642690 (=> (not res!416365) (not e!368066))))

(assert (=> b!642690 (= res!416365 (validKeyInArray!0 (select (arr!18415 a!2986) j!136)))))

(declare-fun b!642691 () Bool)

(declare-fun res!416373 () Bool)

(assert (=> b!642691 (=> (not res!416373) (not e!368066))))

(assert (=> b!642691 (= res!416373 (and (= (size!18779 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18779 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18779 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642692 () Bool)

(assert (=> b!642692 (= e!368064 (= lt!297682 lt!297693))))

(declare-fun b!642693 () Bool)

(declare-fun res!416369 () Bool)

(assert (=> b!642693 (=> (not res!416369) (not e!368067))))

(assert (=> b!642693 (= res!416369 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12453))))

(declare-fun b!642694 () Bool)

(assert (=> b!642694 (= e!368067 e!368062)))

(declare-fun res!416358 () Bool)

(assert (=> b!642694 (=> (not res!416358) (not e!368062))))

(assert (=> b!642694 (= res!416358 (= (select (store (arr!18415 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642694 (= lt!297684 (array!38398 (store (arr!18415 a!2986) i!1108 k0!1786) (size!18779 a!2986)))))

(declare-fun b!642695 () Bool)

(assert (=> b!642695 (= e!368073 e!368060)))

(declare-fun res!416375 () Bool)

(assert (=> b!642695 (=> res!416375 e!368060)))

(assert (=> b!642695 (= res!416375 (or (not (= (select (arr!18415 a!2986) j!136) lt!297685)) (not (= (select (arr!18415 a!2986) j!136) lt!297691)) (bvsge j!136 index!984)))))

(declare-fun b!642687 () Bool)

(declare-fun Unit!21761 () Unit!21756)

(assert (=> b!642687 (= e!368063 Unit!21761)))

(declare-fun res!416360 () Bool)

(assert (=> start!58138 (=> (not res!416360) (not e!368066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58138 (= res!416360 (validMask!0 mask!3053))))

(assert (=> start!58138 e!368066))

(assert (=> start!58138 true))

(declare-fun array_inv!14211 (array!38397) Bool)

(assert (=> start!58138 (array_inv!14211 a!2986)))

(assert (= (and start!58138 res!416360) b!642691))

(assert (= (and b!642691 res!416373) b!642690))

(assert (= (and b!642690 res!416365) b!642681))

(assert (= (and b!642681 res!416370) b!642677))

(assert (= (and b!642677 res!416364) b!642688))

(assert (= (and b!642688 res!416366) b!642679))

(assert (= (and b!642679 res!416372) b!642693))

(assert (= (and b!642693 res!416369) b!642676))

(assert (= (and b!642676 res!416368) b!642694))

(assert (= (and b!642694 res!416358) b!642675))

(assert (= (and b!642675 res!416359) b!642684))

(assert (= (and b!642684 res!416362) b!642692))

(assert (= (and b!642684 c!73526) b!642674))

(assert (= (and b!642684 (not c!73526)) b!642680))

(assert (= (and b!642684 (not res!416363)) b!642685))

(assert (= (and b!642685 res!416371) b!642695))

(assert (= (and b!642695 (not res!416375)) b!642678))

(assert (= (and b!642678 res!416374) b!642683))

(assert (= (and b!642685 (not res!416361)) b!642689))

(assert (= (and b!642689 c!73525) b!642686))

(assert (= (and b!642689 (not c!73525)) b!642687))

(assert (= (and b!642689 (not res!416367)) b!642682))

(declare-fun m!616445 () Bool)

(assert (=> b!642694 m!616445))

(declare-fun m!616447 () Bool)

(assert (=> b!642694 m!616447))

(declare-fun m!616449 () Bool)

(assert (=> start!58138 m!616449))

(declare-fun m!616451 () Bool)

(assert (=> start!58138 m!616451))

(declare-fun m!616453 () Bool)

(assert (=> b!642688 m!616453))

(declare-fun m!616455 () Bool)

(assert (=> b!642684 m!616455))

(declare-fun m!616457 () Bool)

(assert (=> b!642684 m!616457))

(declare-fun m!616459 () Bool)

(assert (=> b!642684 m!616459))

(assert (=> b!642684 m!616445))

(declare-fun m!616461 () Bool)

(assert (=> b!642684 m!616461))

(declare-fun m!616463 () Bool)

(assert (=> b!642684 m!616463))

(assert (=> b!642684 m!616459))

(declare-fun m!616465 () Bool)

(assert (=> b!642684 m!616465))

(declare-fun m!616467 () Bool)

(assert (=> b!642684 m!616467))

(declare-fun m!616469 () Bool)

(assert (=> b!642677 m!616469))

(assert (=> b!642683 m!616459))

(assert (=> b!642683 m!616459))

(declare-fun m!616471 () Bool)

(assert (=> b!642683 m!616471))

(assert (=> b!642685 m!616459))

(assert (=> b!642685 m!616445))

(declare-fun m!616473 () Bool)

(assert (=> b!642685 m!616473))

(declare-fun m!616475 () Bool)

(assert (=> b!642693 m!616475))

(assert (=> b!642686 m!616459))

(declare-fun m!616477 () Bool)

(assert (=> b!642686 m!616477))

(assert (=> b!642686 m!616459))

(declare-fun m!616479 () Bool)

(assert (=> b!642686 m!616479))

(declare-fun m!616481 () Bool)

(assert (=> b!642686 m!616481))

(declare-fun m!616483 () Bool)

(assert (=> b!642686 m!616483))

(declare-fun m!616485 () Bool)

(assert (=> b!642686 m!616485))

(assert (=> b!642686 m!616459))

(declare-fun m!616487 () Bool)

(assert (=> b!642686 m!616487))

(assert (=> b!642686 m!616459))

(declare-fun m!616489 () Bool)

(assert (=> b!642686 m!616489))

(declare-fun m!616491 () Bool)

(assert (=> b!642681 m!616491))

(assert (=> b!642690 m!616459))

(assert (=> b!642690 m!616459))

(declare-fun m!616493 () Bool)

(assert (=> b!642690 m!616493))

(declare-fun m!616495 () Bool)

(assert (=> b!642676 m!616495))

(assert (=> b!642678 m!616459))

(assert (=> b!642678 m!616459))

(declare-fun m!616497 () Bool)

(assert (=> b!642678 m!616497))

(assert (=> b!642695 m!616459))

(declare-fun m!616499 () Bool)

(assert (=> b!642675 m!616499))

(assert (=> b!642675 m!616459))

(assert (=> b!642675 m!616459))

(declare-fun m!616501 () Bool)

(assert (=> b!642675 m!616501))

(declare-fun m!616503 () Bool)

(assert (=> b!642679 m!616503))

(assert (=> b!642682 m!616459))

(assert (=> b!642682 m!616459))

(assert (=> b!642682 m!616497))

(check-sat (not b!642679) (not b!642686) (not b!642690) (not b!642675) (not b!642683) (not b!642678) (not b!642693) (not b!642684) (not b!642688) (not b!642681) (not b!642677) (not start!58138) (not b!642682))
(check-sat)
(get-model)

(declare-fun d!90783 () Bool)

(assert (=> d!90783 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18779 lt!297684)) (not (= (select (arr!18415 lt!297684) j!136) (select (arr!18415 a!2986) j!136))))))

(declare-fun lt!297742 () Unit!21756)

(declare-fun choose!21 (array!38397 (_ BitVec 64) (_ BitVec 32) List!12456) Unit!21756)

(assert (=> d!90783 (= lt!297742 (choose!21 lt!297684 (select (arr!18415 a!2986) j!136) j!136 Nil!12453))))

(assert (=> d!90783 (bvslt (size!18779 lt!297684) #b01111111111111111111111111111111)))

(assert (=> d!90783 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297684 (select (arr!18415 a!2986) j!136) j!136 Nil!12453) lt!297742)))

(declare-fun bs!19228 () Bool)

(assert (= bs!19228 d!90783))

(declare-fun m!616565 () Bool)

(assert (=> bs!19228 m!616565))

(assert (=> bs!19228 m!616459))

(declare-fun m!616567 () Bool)

(assert (=> bs!19228 m!616567))

(assert (=> b!642686 d!90783))

(declare-fun b!642772 () Bool)

(declare-fun e!368124 () Bool)

(declare-fun e!368127 () Bool)

(assert (=> b!642772 (= e!368124 e!368127)))

(declare-fun res!416436 () Bool)

(assert (=> b!642772 (=> (not res!416436) (not e!368127))))

(declare-fun e!368125 () Bool)

(assert (=> b!642772 (= res!416436 (not e!368125))))

(declare-fun res!416438 () Bool)

(assert (=> b!642772 (=> (not res!416438) (not e!368125))))

(assert (=> b!642772 (= res!416438 (validKeyInArray!0 (select (arr!18415 lt!297684) j!136)))))

(declare-fun b!642773 () Bool)

(declare-fun e!368126 () Bool)

(declare-fun call!33563 () Bool)

(assert (=> b!642773 (= e!368126 call!33563)))

(declare-fun b!642774 () Bool)

(declare-fun contains!3139 (List!12456 (_ BitVec 64)) Bool)

(assert (=> b!642774 (= e!368125 (contains!3139 Nil!12453 (select (arr!18415 lt!297684) j!136)))))

(declare-fun b!642775 () Bool)

(assert (=> b!642775 (= e!368126 call!33563)))

(declare-fun d!90785 () Bool)

(declare-fun res!416437 () Bool)

(assert (=> d!90785 (=> res!416437 e!368124)))

(assert (=> d!90785 (= res!416437 (bvsge j!136 (size!18779 lt!297684)))))

(assert (=> d!90785 (= (arrayNoDuplicates!0 lt!297684 j!136 Nil!12453) e!368124)))

(declare-fun b!642776 () Bool)

(assert (=> b!642776 (= e!368127 e!368126)))

(declare-fun c!73535 () Bool)

(assert (=> b!642776 (= c!73535 (validKeyInArray!0 (select (arr!18415 lt!297684) j!136)))))

(declare-fun bm!33560 () Bool)

(assert (=> bm!33560 (= call!33563 (arrayNoDuplicates!0 lt!297684 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73535 (Cons!12452 (select (arr!18415 lt!297684) j!136) Nil!12453) Nil!12453)))))

(assert (= (and d!90785 (not res!416437)) b!642772))

(assert (= (and b!642772 res!416438) b!642774))

(assert (= (and b!642772 res!416436) b!642776))

(assert (= (and b!642776 c!73535) b!642775))

(assert (= (and b!642776 (not c!73535)) b!642773))

(assert (= (or b!642775 b!642773) bm!33560))

(assert (=> b!642772 m!616565))

(assert (=> b!642772 m!616565))

(declare-fun m!616569 () Bool)

(assert (=> b!642772 m!616569))

(assert (=> b!642774 m!616565))

(assert (=> b!642774 m!616565))

(declare-fun m!616571 () Bool)

(assert (=> b!642774 m!616571))

(assert (=> b!642776 m!616565))

(assert (=> b!642776 m!616565))

(assert (=> b!642776 m!616569))

(assert (=> bm!33560 m!616565))

(declare-fun m!616573 () Bool)

(assert (=> bm!33560 m!616573))

(assert (=> b!642686 d!90785))

(declare-fun b!642777 () Bool)

(declare-fun e!368128 () Bool)

(declare-fun e!368131 () Bool)

(assert (=> b!642777 (= e!368128 e!368131)))

(declare-fun res!416439 () Bool)

(assert (=> b!642777 (=> (not res!416439) (not e!368131))))

(declare-fun e!368129 () Bool)

(assert (=> b!642777 (= res!416439 (not e!368129))))

(declare-fun res!416441 () Bool)

(assert (=> b!642777 (=> (not res!416441) (not e!368129))))

(assert (=> b!642777 (= res!416441 (validKeyInArray!0 (select (arr!18415 lt!297684) #b00000000000000000000000000000000)))))

(declare-fun b!642778 () Bool)

(declare-fun e!368130 () Bool)

(declare-fun call!33564 () Bool)

(assert (=> b!642778 (= e!368130 call!33564)))

(declare-fun b!642779 () Bool)

(assert (=> b!642779 (= e!368129 (contains!3139 Nil!12453 (select (arr!18415 lt!297684) #b00000000000000000000000000000000)))))

(declare-fun b!642780 () Bool)

(assert (=> b!642780 (= e!368130 call!33564)))

(declare-fun d!90787 () Bool)

(declare-fun res!416440 () Bool)

(assert (=> d!90787 (=> res!416440 e!368128)))

(assert (=> d!90787 (= res!416440 (bvsge #b00000000000000000000000000000000 (size!18779 lt!297684)))))

(assert (=> d!90787 (= (arrayNoDuplicates!0 lt!297684 #b00000000000000000000000000000000 Nil!12453) e!368128)))

(declare-fun b!642781 () Bool)

(assert (=> b!642781 (= e!368131 e!368130)))

(declare-fun c!73536 () Bool)

(assert (=> b!642781 (= c!73536 (validKeyInArray!0 (select (arr!18415 lt!297684) #b00000000000000000000000000000000)))))

(declare-fun bm!33561 () Bool)

(assert (=> bm!33561 (= call!33564 (arrayNoDuplicates!0 lt!297684 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73536 (Cons!12452 (select (arr!18415 lt!297684) #b00000000000000000000000000000000) Nil!12453) Nil!12453)))))

(assert (= (and d!90787 (not res!416440)) b!642777))

(assert (= (and b!642777 res!416441) b!642779))

(assert (= (and b!642777 res!416439) b!642781))

(assert (= (and b!642781 c!73536) b!642780))

(assert (= (and b!642781 (not c!73536)) b!642778))

(assert (= (or b!642780 b!642778) bm!33561))

(declare-fun m!616575 () Bool)

(assert (=> b!642777 m!616575))

(assert (=> b!642777 m!616575))

(declare-fun m!616577 () Bool)

(assert (=> b!642777 m!616577))

(assert (=> b!642779 m!616575))

(assert (=> b!642779 m!616575))

(declare-fun m!616579 () Bool)

(assert (=> b!642779 m!616579))

(assert (=> b!642781 m!616575))

(assert (=> b!642781 m!616575))

(assert (=> b!642781 m!616577))

(assert (=> bm!33561 m!616575))

(declare-fun m!616581 () Bool)

(assert (=> bm!33561 m!616581))

(assert (=> b!642686 d!90787))

(declare-fun d!90789 () Bool)

(assert (=> d!90789 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297745 () Unit!21756)

(declare-fun choose!114 (array!38397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21756)

(assert (=> d!90789 (= lt!297745 (choose!114 lt!297684 (select (arr!18415 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90789 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90789 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297684 (select (arr!18415 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!297745)))

(declare-fun bs!19229 () Bool)

(assert (= bs!19229 d!90789))

(assert (=> bs!19229 m!616459))

(assert (=> bs!19229 m!616489))

(assert (=> bs!19229 m!616459))

(declare-fun m!616583 () Bool)

(assert (=> bs!19229 m!616583))

(assert (=> b!642686 d!90789))

(declare-fun d!90791 () Bool)

(declare-fun res!416446 () Bool)

(declare-fun e!368136 () Bool)

(assert (=> d!90791 (=> res!416446 e!368136)))

(assert (=> d!90791 (= res!416446 (= (select (arr!18415 lt!297684) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18415 a!2986) j!136)))))

(assert (=> d!90791 (= (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368136)))

(declare-fun b!642786 () Bool)

(declare-fun e!368137 () Bool)

(assert (=> b!642786 (= e!368136 e!368137)))

(declare-fun res!416447 () Bool)

(assert (=> b!642786 (=> (not res!416447) (not e!368137))))

(assert (=> b!642786 (= res!416447 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18779 lt!297684)))))

(declare-fun b!642787 () Bool)

(assert (=> b!642787 (= e!368137 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90791 (not res!416446)) b!642786))

(assert (= (and b!642786 res!416447) b!642787))

(declare-fun m!616585 () Bool)

(assert (=> d!90791 m!616585))

(assert (=> b!642787 m!616459))

(declare-fun m!616587 () Bool)

(assert (=> b!642787 m!616587))

(assert (=> b!642686 d!90791))

(declare-fun d!90793 () Bool)

(assert (=> d!90793 (arrayNoDuplicates!0 lt!297684 j!136 Nil!12453)))

(declare-fun lt!297748 () Unit!21756)

(declare-fun choose!39 (array!38397 (_ BitVec 32) (_ BitVec 32)) Unit!21756)

(assert (=> d!90793 (= lt!297748 (choose!39 lt!297684 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90793 (bvslt (size!18779 lt!297684) #b01111111111111111111111111111111)))

(assert (=> d!90793 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297684 #b00000000000000000000000000000000 j!136) lt!297748)))

(declare-fun bs!19230 () Bool)

(assert (= bs!19230 d!90793))

(assert (=> bs!19230 m!616481))

(declare-fun m!616589 () Bool)

(assert (=> bs!19230 m!616589))

(assert (=> b!642686 d!90793))

(declare-fun d!90795 () Bool)

(declare-fun e!368140 () Bool)

(assert (=> d!90795 e!368140))

(declare-fun res!416450 () Bool)

(assert (=> d!90795 (=> (not res!416450) (not e!368140))))

(assert (=> d!90795 (= res!416450 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18779 a!2986))))))

(declare-fun lt!297751 () Unit!21756)

(declare-fun choose!41 (array!38397 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12456) Unit!21756)

(assert (=> d!90795 (= lt!297751 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453))))

(assert (=> d!90795 (bvslt (size!18779 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90795 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12453) lt!297751)))

(declare-fun b!642790 () Bool)

(assert (=> b!642790 (= e!368140 (arrayNoDuplicates!0 (array!38398 (store (arr!18415 a!2986) i!1108 k0!1786) (size!18779 a!2986)) #b00000000000000000000000000000000 Nil!12453))))

(assert (= (and d!90795 res!416450) b!642790))

(declare-fun m!616591 () Bool)

(assert (=> d!90795 m!616591))

(assert (=> b!642790 m!616445))

(declare-fun m!616593 () Bool)

(assert (=> b!642790 m!616593))

(assert (=> b!642686 d!90795))

(declare-fun d!90797 () Bool)

(declare-fun lt!297757 () SeekEntryResult!6855)

(get-info :version)

(assert (=> d!90797 (and (or ((_ is Undefined!6855) lt!297757) (not ((_ is Found!6855) lt!297757)) (and (bvsge (index!29747 lt!297757) #b00000000000000000000000000000000) (bvslt (index!29747 lt!297757) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297757) ((_ is Found!6855) lt!297757) (not ((_ is MissingVacant!6855) lt!297757)) (not (= (index!29749 lt!297757) vacantSpotIndex!68)) (and (bvsge (index!29749 lt!297757) #b00000000000000000000000000000000) (bvslt (index!29749 lt!297757) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297757) (ite ((_ is Found!6855) lt!297757) (= (select (arr!18415 a!2986) (index!29747 lt!297757)) (select (arr!18415 a!2986) j!136)) (and ((_ is MissingVacant!6855) lt!297757) (= (index!29749 lt!297757) vacantSpotIndex!68) (= (select (arr!18415 a!2986) (index!29749 lt!297757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368149 () SeekEntryResult!6855)

(assert (=> d!90797 (= lt!297757 e!368149)))

(declare-fun c!73543 () Bool)

(assert (=> d!90797 (= c!73543 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!297756 () (_ BitVec 64))

(assert (=> d!90797 (= lt!297756 (select (arr!18415 a!2986) index!984))))

(assert (=> d!90797 (validMask!0 mask!3053)))

(assert (=> d!90797 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053) lt!297757)))

(declare-fun b!642803 () Bool)

(declare-fun e!368148 () SeekEntryResult!6855)

(assert (=> b!642803 (= e!368148 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642804 () Bool)

(declare-fun e!368147 () SeekEntryResult!6855)

(assert (=> b!642804 (= e!368149 e!368147)))

(declare-fun c!73544 () Bool)

(assert (=> b!642804 (= c!73544 (= lt!297756 (select (arr!18415 a!2986) j!136)))))

(declare-fun b!642805 () Bool)

(assert (=> b!642805 (= e!368148 (MissingVacant!6855 vacantSpotIndex!68))))

(declare-fun b!642806 () Bool)

(assert (=> b!642806 (= e!368147 (Found!6855 index!984))))

(declare-fun b!642807 () Bool)

(assert (=> b!642807 (= e!368149 Undefined!6855)))

(declare-fun b!642808 () Bool)

(declare-fun c!73545 () Bool)

(assert (=> b!642808 (= c!73545 (= lt!297756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642808 (= e!368147 e!368148)))

(assert (= (and d!90797 c!73543) b!642807))

(assert (= (and d!90797 (not c!73543)) b!642804))

(assert (= (and b!642804 c!73544) b!642806))

(assert (= (and b!642804 (not c!73544)) b!642808))

(assert (= (and b!642808 c!73545) b!642805))

(assert (= (and b!642808 (not c!73545)) b!642803))

(declare-fun m!616595 () Bool)

(assert (=> d!90797 m!616595))

(declare-fun m!616597 () Bool)

(assert (=> d!90797 m!616597))

(assert (=> d!90797 m!616499))

(assert (=> d!90797 m!616449))

(assert (=> b!642803 m!616455))

(assert (=> b!642803 m!616455))

(assert (=> b!642803 m!616459))

(declare-fun m!616599 () Bool)

(assert (=> b!642803 m!616599))

(assert (=> b!642675 d!90797))

(declare-fun d!90799 () Bool)

(declare-fun lt!297759 () SeekEntryResult!6855)

(assert (=> d!90799 (and (or ((_ is Undefined!6855) lt!297759) (not ((_ is Found!6855) lt!297759)) (and (bvsge (index!29747 lt!297759) #b00000000000000000000000000000000) (bvslt (index!29747 lt!297759) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297759) ((_ is Found!6855) lt!297759) (not ((_ is MissingVacant!6855) lt!297759)) (not (= (index!29749 lt!297759) vacantSpotIndex!68)) (and (bvsge (index!29749 lt!297759) #b00000000000000000000000000000000) (bvslt (index!29749 lt!297759) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297759) (ite ((_ is Found!6855) lt!297759) (= (select (arr!18415 a!2986) (index!29747 lt!297759)) (select (arr!18415 a!2986) j!136)) (and ((_ is MissingVacant!6855) lt!297759) (= (index!29749 lt!297759) vacantSpotIndex!68) (= (select (arr!18415 a!2986) (index!29749 lt!297759)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368152 () SeekEntryResult!6855)

(assert (=> d!90799 (= lt!297759 e!368152)))

(declare-fun c!73546 () Bool)

(assert (=> d!90799 (= c!73546 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!297758 () (_ BitVec 64))

(assert (=> d!90799 (= lt!297758 (select (arr!18415 a!2986) lt!297683))))

(assert (=> d!90799 (validMask!0 mask!3053)))

(assert (=> d!90799 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053) lt!297759)))

(declare-fun e!368151 () SeekEntryResult!6855)

(declare-fun b!642809 () Bool)

(assert (=> b!642809 (= e!368151 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297683 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642810 () Bool)

(declare-fun e!368150 () SeekEntryResult!6855)

(assert (=> b!642810 (= e!368152 e!368150)))

(declare-fun c!73547 () Bool)

(assert (=> b!642810 (= c!73547 (= lt!297758 (select (arr!18415 a!2986) j!136)))))

(declare-fun b!642811 () Bool)

(assert (=> b!642811 (= e!368151 (MissingVacant!6855 vacantSpotIndex!68))))

(declare-fun b!642812 () Bool)

(assert (=> b!642812 (= e!368150 (Found!6855 lt!297683))))

(declare-fun b!642813 () Bool)

(assert (=> b!642813 (= e!368152 Undefined!6855)))

(declare-fun b!642814 () Bool)

(declare-fun c!73548 () Bool)

(assert (=> b!642814 (= c!73548 (= lt!297758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642814 (= e!368150 e!368151)))

(assert (= (and d!90799 c!73546) b!642813))

(assert (= (and d!90799 (not c!73546)) b!642810))

(assert (= (and b!642810 c!73547) b!642812))

(assert (= (and b!642810 (not c!73547)) b!642814))

(assert (= (and b!642814 c!73548) b!642811))

(assert (= (and b!642814 (not c!73548)) b!642809))

(declare-fun m!616601 () Bool)

(assert (=> d!90799 m!616601))

(declare-fun m!616603 () Bool)

(assert (=> d!90799 m!616603))

(declare-fun m!616605 () Bool)

(assert (=> d!90799 m!616605))

(assert (=> d!90799 m!616449))

(declare-fun m!616607 () Bool)

(assert (=> b!642809 m!616607))

(assert (=> b!642809 m!616607))

(assert (=> b!642809 m!616459))

(declare-fun m!616609 () Bool)

(assert (=> b!642809 m!616609))

(assert (=> b!642684 d!90799))

(declare-fun d!90801 () Bool)

(declare-fun lt!297761 () SeekEntryResult!6855)

(assert (=> d!90801 (and (or ((_ is Undefined!6855) lt!297761) (not ((_ is Found!6855) lt!297761)) (and (bvsge (index!29747 lt!297761) #b00000000000000000000000000000000) (bvslt (index!29747 lt!297761) (size!18779 lt!297684)))) (or ((_ is Undefined!6855) lt!297761) ((_ is Found!6855) lt!297761) (not ((_ is MissingVacant!6855) lt!297761)) (not (= (index!29749 lt!297761) vacantSpotIndex!68)) (and (bvsge (index!29749 lt!297761) #b00000000000000000000000000000000) (bvslt (index!29749 lt!297761) (size!18779 lt!297684)))) (or ((_ is Undefined!6855) lt!297761) (ite ((_ is Found!6855) lt!297761) (= (select (arr!18415 lt!297684) (index!29747 lt!297761)) lt!297685) (and ((_ is MissingVacant!6855) lt!297761) (= (index!29749 lt!297761) vacantSpotIndex!68) (= (select (arr!18415 lt!297684) (index!29749 lt!297761)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368155 () SeekEntryResult!6855)

(assert (=> d!90801 (= lt!297761 e!368155)))

(declare-fun c!73549 () Bool)

(assert (=> d!90801 (= c!73549 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!297760 () (_ BitVec 64))

(assert (=> d!90801 (= lt!297760 (select (arr!18415 lt!297684) index!984))))

(assert (=> d!90801 (validMask!0 mask!3053)))

(assert (=> d!90801 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297685 lt!297684 mask!3053) lt!297761)))

(declare-fun e!368154 () SeekEntryResult!6855)

(declare-fun b!642815 () Bool)

(assert (=> b!642815 (= e!368154 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297685 lt!297684 mask!3053))))

(declare-fun b!642816 () Bool)

(declare-fun e!368153 () SeekEntryResult!6855)

(assert (=> b!642816 (= e!368155 e!368153)))

(declare-fun c!73550 () Bool)

(assert (=> b!642816 (= c!73550 (= lt!297760 lt!297685))))

(declare-fun b!642817 () Bool)

(assert (=> b!642817 (= e!368154 (MissingVacant!6855 vacantSpotIndex!68))))

(declare-fun b!642818 () Bool)

(assert (=> b!642818 (= e!368153 (Found!6855 index!984))))

(declare-fun b!642819 () Bool)

(assert (=> b!642819 (= e!368155 Undefined!6855)))

(declare-fun b!642820 () Bool)

(declare-fun c!73551 () Bool)

(assert (=> b!642820 (= c!73551 (= lt!297760 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642820 (= e!368153 e!368154)))

(assert (= (and d!90801 c!73549) b!642819))

(assert (= (and d!90801 (not c!73549)) b!642816))

(assert (= (and b!642816 c!73550) b!642818))

(assert (= (and b!642816 (not c!73550)) b!642820))

(assert (= (and b!642820 c!73551) b!642817))

(assert (= (and b!642820 (not c!73551)) b!642815))

(declare-fun m!616611 () Bool)

(assert (=> d!90801 m!616611))

(declare-fun m!616613 () Bool)

(assert (=> d!90801 m!616613))

(declare-fun m!616615 () Bool)

(assert (=> d!90801 m!616615))

(assert (=> d!90801 m!616449))

(assert (=> b!642815 m!616455))

(assert (=> b!642815 m!616455))

(declare-fun m!616617 () Bool)

(assert (=> b!642815 m!616617))

(assert (=> b!642684 d!90801))

(declare-fun d!90803 () Bool)

(declare-fun e!368164 () Bool)

(assert (=> d!90803 e!368164))

(declare-fun res!416459 () Bool)

(assert (=> d!90803 (=> (not res!416459) (not e!368164))))

(assert (=> d!90803 (= res!416459 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18779 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18779 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18779 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18779 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18779 a!2986))))))

(declare-fun lt!297764 () Unit!21756)

(declare-fun choose!9 (array!38397 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21756)

(assert (=> d!90803 (= lt!297764 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90803 (validMask!0 mask!3053)))

(assert (=> d!90803 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 mask!3053) lt!297764)))

(declare-fun b!642829 () Bool)

(assert (=> b!642829 (= e!368164 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 (select (arr!18415 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 (select (store (arr!18415 a!2986) i!1108 k0!1786) j!136) (array!38398 (store (arr!18415 a!2986) i!1108 k0!1786) (size!18779 a!2986)) mask!3053)))))

(assert (= (and d!90803 res!416459) b!642829))

(declare-fun m!616623 () Bool)

(assert (=> d!90803 m!616623))

(assert (=> d!90803 m!616449))

(assert (=> b!642829 m!616459))

(assert (=> b!642829 m!616465))

(assert (=> b!642829 m!616457))

(assert (=> b!642829 m!616445))

(assert (=> b!642829 m!616459))

(assert (=> b!642829 m!616457))

(declare-fun m!616625 () Bool)

(assert (=> b!642829 m!616625))

(assert (=> b!642684 d!90803))

(declare-fun d!90811 () Bool)

(declare-fun lt!297767 () (_ BitVec 32))

(assert (=> d!90811 (and (bvsge lt!297767 #b00000000000000000000000000000000) (bvslt lt!297767 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90811 (= lt!297767 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90811 (validMask!0 mask!3053)))

(assert (=> d!90811 (= (nextIndex!0 index!984 x!910 mask!3053) lt!297767)))

(declare-fun bs!19231 () Bool)

(assert (= bs!19231 d!90811))

(declare-fun m!616631 () Bool)

(assert (=> bs!19231 m!616631))

(assert (=> bs!19231 m!616449))

(assert (=> b!642684 d!90811))

(declare-fun lt!297769 () SeekEntryResult!6855)

(declare-fun d!90815 () Bool)

(assert (=> d!90815 (and (or ((_ is Undefined!6855) lt!297769) (not ((_ is Found!6855) lt!297769)) (and (bvsge (index!29747 lt!297769) #b00000000000000000000000000000000) (bvslt (index!29747 lt!297769) (size!18779 lt!297684)))) (or ((_ is Undefined!6855) lt!297769) ((_ is Found!6855) lt!297769) (not ((_ is MissingVacant!6855) lt!297769)) (not (= (index!29749 lt!297769) vacantSpotIndex!68)) (and (bvsge (index!29749 lt!297769) #b00000000000000000000000000000000) (bvslt (index!29749 lt!297769) (size!18779 lt!297684)))) (or ((_ is Undefined!6855) lt!297769) (ite ((_ is Found!6855) lt!297769) (= (select (arr!18415 lt!297684) (index!29747 lt!297769)) lt!297685) (and ((_ is MissingVacant!6855) lt!297769) (= (index!29749 lt!297769) vacantSpotIndex!68) (= (select (arr!18415 lt!297684) (index!29749 lt!297769)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368169 () SeekEntryResult!6855)

(assert (=> d!90815 (= lt!297769 e!368169)))

(declare-fun c!73552 () Bool)

(assert (=> d!90815 (= c!73552 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!297768 () (_ BitVec 64))

(assert (=> d!90815 (= lt!297768 (select (arr!18415 lt!297684) lt!297683))))

(assert (=> d!90815 (validMask!0 mask!3053)))

(assert (=> d!90815 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297683 vacantSpotIndex!68 lt!297685 lt!297684 mask!3053) lt!297769)))

(declare-fun b!642832 () Bool)

(declare-fun e!368168 () SeekEntryResult!6855)

(assert (=> b!642832 (= e!368168 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297683 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297685 lt!297684 mask!3053))))

(declare-fun b!642833 () Bool)

(declare-fun e!368167 () SeekEntryResult!6855)

(assert (=> b!642833 (= e!368169 e!368167)))

(declare-fun c!73553 () Bool)

(assert (=> b!642833 (= c!73553 (= lt!297768 lt!297685))))

(declare-fun b!642834 () Bool)

(assert (=> b!642834 (= e!368168 (MissingVacant!6855 vacantSpotIndex!68))))

(declare-fun b!642835 () Bool)

(assert (=> b!642835 (= e!368167 (Found!6855 lt!297683))))

(declare-fun b!642836 () Bool)

(assert (=> b!642836 (= e!368169 Undefined!6855)))

(declare-fun b!642837 () Bool)

(declare-fun c!73554 () Bool)

(assert (=> b!642837 (= c!73554 (= lt!297768 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642837 (= e!368167 e!368168)))

(assert (= (and d!90815 c!73552) b!642836))

(assert (= (and d!90815 (not c!73552)) b!642833))

(assert (= (and b!642833 c!73553) b!642835))

(assert (= (and b!642833 (not c!73553)) b!642837))

(assert (= (and b!642837 c!73554) b!642834))

(assert (= (and b!642837 (not c!73554)) b!642832))

(declare-fun m!616633 () Bool)

(assert (=> d!90815 m!616633))

(declare-fun m!616635 () Bool)

(assert (=> d!90815 m!616635))

(declare-fun m!616637 () Bool)

(assert (=> d!90815 m!616637))

(assert (=> d!90815 m!616449))

(assert (=> b!642832 m!616607))

(assert (=> b!642832 m!616607))

(declare-fun m!616639 () Bool)

(assert (=> b!642832 m!616639))

(assert (=> b!642684 d!90815))

(declare-fun d!90817 () Bool)

(assert (=> d!90817 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58138 d!90817))

(declare-fun d!90821 () Bool)

(assert (=> d!90821 (= (array_inv!14211 a!2986) (bvsge (size!18779 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58138 d!90821))

(declare-fun b!642856 () Bool)

(declare-fun e!368179 () Bool)

(declare-fun e!368182 () Bool)

(assert (=> b!642856 (= e!368179 e!368182)))

(declare-fun res!416462 () Bool)

(assert (=> b!642856 (=> (not res!416462) (not e!368182))))

(declare-fun e!368180 () Bool)

(assert (=> b!642856 (= res!416462 (not e!368180))))

(declare-fun res!416464 () Bool)

(assert (=> b!642856 (=> (not res!416464) (not e!368180))))

(assert (=> b!642856 (= res!416464 (validKeyInArray!0 (select (arr!18415 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!642857 () Bool)

(declare-fun e!368181 () Bool)

(declare-fun call!33565 () Bool)

(assert (=> b!642857 (= e!368181 call!33565)))

(declare-fun b!642858 () Bool)

(assert (=> b!642858 (= e!368180 (contains!3139 Nil!12453 (select (arr!18415 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!642859 () Bool)

(assert (=> b!642859 (= e!368181 call!33565)))

(declare-fun d!90823 () Bool)

(declare-fun res!416463 () Bool)

(assert (=> d!90823 (=> res!416463 e!368179)))

(assert (=> d!90823 (= res!416463 (bvsge #b00000000000000000000000000000000 (size!18779 a!2986)))))

(assert (=> d!90823 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12453) e!368179)))

(declare-fun b!642860 () Bool)

(assert (=> b!642860 (= e!368182 e!368181)))

(declare-fun c!73564 () Bool)

(assert (=> b!642860 (= c!73564 (validKeyInArray!0 (select (arr!18415 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33562 () Bool)

(assert (=> bm!33562 (= call!33565 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73564 (Cons!12452 (select (arr!18415 a!2986) #b00000000000000000000000000000000) Nil!12453) Nil!12453)))))

(assert (= (and d!90823 (not res!416463)) b!642856))

(assert (= (and b!642856 res!416464) b!642858))

(assert (= (and b!642856 res!416462) b!642860))

(assert (= (and b!642860 c!73564) b!642859))

(assert (= (and b!642860 (not c!73564)) b!642857))

(assert (= (or b!642859 b!642857) bm!33562))

(declare-fun m!616655 () Bool)

(assert (=> b!642856 m!616655))

(assert (=> b!642856 m!616655))

(declare-fun m!616657 () Bool)

(assert (=> b!642856 m!616657))

(assert (=> b!642858 m!616655))

(assert (=> b!642858 m!616655))

(declare-fun m!616659 () Bool)

(assert (=> b!642858 m!616659))

(assert (=> b!642860 m!616655))

(assert (=> b!642860 m!616655))

(assert (=> b!642860 m!616657))

(assert (=> bm!33562 m!616655))

(declare-fun m!616661 () Bool)

(assert (=> bm!33562 m!616661))

(assert (=> b!642693 d!90823))

(declare-fun d!90825 () Bool)

(declare-fun res!416465 () Bool)

(declare-fun e!368183 () Bool)

(assert (=> d!90825 (=> res!416465 e!368183)))

(assert (=> d!90825 (= res!416465 (= (select (arr!18415 lt!297684) index!984) (select (arr!18415 a!2986) j!136)))))

(assert (=> d!90825 (= (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) index!984) e!368183)))

(declare-fun b!642861 () Bool)

(declare-fun e!368184 () Bool)

(assert (=> b!642861 (= e!368183 e!368184)))

(declare-fun res!416466 () Bool)

(assert (=> b!642861 (=> (not res!416466) (not e!368184))))

(assert (=> b!642861 (= res!416466 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18779 lt!297684)))))

(declare-fun b!642862 () Bool)

(assert (=> b!642862 (= e!368184 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90825 (not res!416465)) b!642861))

(assert (= (and b!642861 res!416466) b!642862))

(assert (=> d!90825 m!616615))

(assert (=> b!642862 m!616459))

(declare-fun m!616663 () Bool)

(assert (=> b!642862 m!616663))

(assert (=> b!642683 d!90825))

(declare-fun d!90827 () Bool)

(assert (=> d!90827 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642681 d!90827))

(declare-fun d!90829 () Bool)

(declare-fun res!416467 () Bool)

(declare-fun e!368185 () Bool)

(assert (=> d!90829 (=> res!416467 e!368185)))

(assert (=> d!90829 (= res!416467 (= (select (arr!18415 lt!297684) j!136) (select (arr!18415 a!2986) j!136)))))

(assert (=> d!90829 (= (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) j!136) e!368185)))

(declare-fun b!642863 () Bool)

(declare-fun e!368186 () Bool)

(assert (=> b!642863 (= e!368185 e!368186)))

(declare-fun res!416468 () Bool)

(assert (=> b!642863 (=> (not res!416468) (not e!368186))))

(assert (=> b!642863 (= res!416468 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18779 lt!297684)))))

(declare-fun b!642864 () Bool)

(assert (=> b!642864 (= e!368186 (arrayContainsKey!0 lt!297684 (select (arr!18415 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90829 (not res!416467)) b!642863))

(assert (= (and b!642863 res!416468) b!642864))

(assert (=> d!90829 m!616565))

(assert (=> b!642864 m!616459))

(declare-fun m!616665 () Bool)

(assert (=> b!642864 m!616665))

(assert (=> b!642682 d!90829))

(declare-fun d!90831 () Bool)

(assert (=> d!90831 (= (validKeyInArray!0 (select (arr!18415 a!2986) j!136)) (and (not (= (select (arr!18415 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18415 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642690 d!90831))

(declare-fun b!642893 () Bool)

(declare-fun e!368205 () Bool)

(declare-fun call!33568 () Bool)

(assert (=> b!642893 (= e!368205 call!33568)))

(declare-fun b!642894 () Bool)

(declare-fun e!368201 () Bool)

(assert (=> b!642894 (= e!368205 e!368201)))

(declare-fun lt!297796 () (_ BitVec 64))

(assert (=> b!642894 (= lt!297796 (select (arr!18415 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297797 () Unit!21756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38397 (_ BitVec 64) (_ BitVec 32)) Unit!21756)

(assert (=> b!642894 (= lt!297797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297796 #b00000000000000000000000000000000))))

(assert (=> b!642894 (arrayContainsKey!0 a!2986 lt!297796 #b00000000000000000000000000000000)))

(declare-fun lt!297795 () Unit!21756)

(assert (=> b!642894 (= lt!297795 lt!297797)))

(declare-fun res!416474 () Bool)

(assert (=> b!642894 (= res!416474 (= (seekEntryOrOpen!0 (select (arr!18415 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6855 #b00000000000000000000000000000000)))))

(assert (=> b!642894 (=> (not res!416474) (not e!368201))))

(declare-fun b!642895 () Bool)

(assert (=> b!642895 (= e!368201 call!33568)))

(declare-fun b!642896 () Bool)

(declare-fun e!368204 () Bool)

(assert (=> b!642896 (= e!368204 e!368205)))

(declare-fun c!73576 () Bool)

(assert (=> b!642896 (= c!73576 (validKeyInArray!0 (select (arr!18415 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33565 () Bool)

(assert (=> bm!33565 (= call!33568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90833 () Bool)

(declare-fun res!416473 () Bool)

(assert (=> d!90833 (=> res!416473 e!368204)))

(assert (=> d!90833 (= res!416473 (bvsge #b00000000000000000000000000000000 (size!18779 a!2986)))))

(assert (=> d!90833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368204)))

(assert (= (and d!90833 (not res!416473)) b!642896))

(assert (= (and b!642896 c!73576) b!642894))

(assert (= (and b!642896 (not c!73576)) b!642893))

(assert (= (and b!642894 res!416474) b!642895))

(assert (= (or b!642895 b!642893) bm!33565))

(assert (=> b!642894 m!616655))

(declare-fun m!616667 () Bool)

(assert (=> b!642894 m!616667))

(declare-fun m!616669 () Bool)

(assert (=> b!642894 m!616669))

(assert (=> b!642894 m!616655))

(declare-fun m!616671 () Bool)

(assert (=> b!642894 m!616671))

(assert (=> b!642896 m!616655))

(assert (=> b!642896 m!616655))

(assert (=> b!642896 m!616657))

(declare-fun m!616673 () Bool)

(assert (=> bm!33565 m!616673))

(assert (=> b!642679 d!90833))

(declare-fun b!642970 () Bool)

(declare-fun e!368258 () SeekEntryResult!6855)

(declare-fun e!368256 () SeekEntryResult!6855)

(assert (=> b!642970 (= e!368258 e!368256)))

(declare-fun lt!297829 () (_ BitVec 64))

(declare-fun lt!297828 () SeekEntryResult!6855)

(assert (=> b!642970 (= lt!297829 (select (arr!18415 a!2986) (index!29748 lt!297828)))))

(declare-fun c!73603 () Bool)

(assert (=> b!642970 (= c!73603 (= lt!297829 k0!1786))))

(declare-fun b!642971 () Bool)

(assert (=> b!642971 (= e!368258 Undefined!6855)))

(declare-fun d!90835 () Bool)

(declare-fun lt!297827 () SeekEntryResult!6855)

(assert (=> d!90835 (and (or ((_ is Undefined!6855) lt!297827) (not ((_ is Found!6855) lt!297827)) (and (bvsge (index!29747 lt!297827) #b00000000000000000000000000000000) (bvslt (index!29747 lt!297827) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297827) ((_ is Found!6855) lt!297827) (not ((_ is MissingZero!6855) lt!297827)) (and (bvsge (index!29746 lt!297827) #b00000000000000000000000000000000) (bvslt (index!29746 lt!297827) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297827) ((_ is Found!6855) lt!297827) ((_ is MissingZero!6855) lt!297827) (not ((_ is MissingVacant!6855) lt!297827)) (and (bvsge (index!29749 lt!297827) #b00000000000000000000000000000000) (bvslt (index!29749 lt!297827) (size!18779 a!2986)))) (or ((_ is Undefined!6855) lt!297827) (ite ((_ is Found!6855) lt!297827) (= (select (arr!18415 a!2986) (index!29747 lt!297827)) k0!1786) (ite ((_ is MissingZero!6855) lt!297827) (= (select (arr!18415 a!2986) (index!29746 lt!297827)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6855) lt!297827) (= (select (arr!18415 a!2986) (index!29749 lt!297827)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90835 (= lt!297827 e!368258)))

(declare-fun c!73601 () Bool)

(assert (=> d!90835 (= c!73601 (and ((_ is Intermediate!6855) lt!297828) (undefined!7667 lt!297828)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38397 (_ BitVec 32)) SeekEntryResult!6855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90835 (= lt!297828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90835 (validMask!0 mask!3053)))

(assert (=> d!90835 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!297827)))

(declare-fun b!642972 () Bool)

(declare-fun e!368257 () SeekEntryResult!6855)

(assert (=> b!642972 (= e!368257 (MissingZero!6855 (index!29748 lt!297828)))))

(declare-fun b!642973 () Bool)

(assert (=> b!642973 (= e!368257 (seekKeyOrZeroReturnVacant!0 (x!58509 lt!297828) (index!29748 lt!297828) (index!29748 lt!297828) k0!1786 a!2986 mask!3053))))

(declare-fun b!642974 () Bool)

(assert (=> b!642974 (= e!368256 (Found!6855 (index!29748 lt!297828)))))

(declare-fun b!642975 () Bool)

(declare-fun c!73602 () Bool)

(assert (=> b!642975 (= c!73602 (= lt!297829 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642975 (= e!368256 e!368257)))

(assert (= (and d!90835 c!73601) b!642971))

(assert (= (and d!90835 (not c!73601)) b!642970))

(assert (= (and b!642970 c!73603) b!642974))

(assert (= (and b!642970 (not c!73603)) b!642975))

(assert (= (and b!642975 c!73602) b!642972))

(assert (= (and b!642975 (not c!73602)) b!642973))

(declare-fun m!616727 () Bool)

(assert (=> b!642970 m!616727))

(declare-fun m!616729 () Bool)

(assert (=> d!90835 m!616729))

(declare-fun m!616731 () Bool)

(assert (=> d!90835 m!616731))

(declare-fun m!616733 () Bool)

(assert (=> d!90835 m!616733))

(declare-fun m!616735 () Bool)

(assert (=> d!90835 m!616735))

(declare-fun m!616737 () Bool)

(assert (=> d!90835 m!616737))

(assert (=> d!90835 m!616449))

(assert (=> d!90835 m!616729))

(declare-fun m!616739 () Bool)

(assert (=> b!642973 m!616739))

(assert (=> b!642688 d!90835))

(declare-fun d!90849 () Bool)

(declare-fun res!416502 () Bool)

(declare-fun e!368259 () Bool)

(assert (=> d!90849 (=> res!416502 e!368259)))

(assert (=> d!90849 (= res!416502 (= (select (arr!18415 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90849 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!368259)))

(declare-fun b!642976 () Bool)

(declare-fun e!368260 () Bool)

(assert (=> b!642976 (= e!368259 e!368260)))

(declare-fun res!416503 () Bool)

(assert (=> b!642976 (=> (not res!416503) (not e!368260))))

(assert (=> b!642976 (= res!416503 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18779 a!2986)))))

(declare-fun b!642977 () Bool)

(assert (=> b!642977 (= e!368260 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90849 (not res!416502)) b!642976))

(assert (= (and b!642976 res!416503) b!642977))

(assert (=> d!90849 m!616655))

(declare-fun m!616741 () Bool)

(assert (=> b!642977 m!616741))

(assert (=> b!642677 d!90849))

(assert (=> b!642678 d!90829))

(check-sat (not b!642856) (not b!642803) (not b!642864) (not b!642815) (not bm!33560) (not d!90815) (not b!642832) (not b!642973) (not b!642809) (not b!642896) (not b!642774) (not bm!33562) (not b!642779) (not bm!33561) (not b!642776) (not d!90811) (not d!90835) (not b!642772) (not b!642787) (not d!90799) (not b!642977) (not d!90803) (not b!642829) (not b!642862) (not d!90795) (not b!642860) (not b!642894) (not b!642790) (not b!642777) (not b!642781) (not b!642858) (not d!90783) (not d!90801) (not d!90789) (not d!90793) (not d!90797) (not bm!33565))
(check-sat)
