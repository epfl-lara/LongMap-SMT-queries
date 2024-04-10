; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54854 () Bool)

(assert start!54854)

(declare-fun b!599459 () Bool)

(declare-fun res!384439 () Bool)

(declare-fun e!342720 () Bool)

(assert (=> b!599459 (=> res!384439 e!342720)))

(declare-datatypes ((List!11845 0))(
  ( (Nil!11842) (Cons!11841 (h!12886 (_ BitVec 64)) (t!18073 List!11845)) )
))
(declare-fun contains!2961 (List!11845 (_ BitVec 64)) Bool)

(assert (=> b!599459 (= res!384439 (contains!2961 Nil!11842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599460 () Bool)

(declare-fun e!342717 () Bool)

(declare-fun e!342718 () Bool)

(assert (=> b!599460 (= e!342717 (not e!342718))))

(declare-fun res!384448 () Bool)

(assert (=> b!599460 (=> res!384448 e!342718)))

(declare-datatypes ((SeekEntryResult!6244 0))(
  ( (MissingZero!6244 (index!27233 (_ BitVec 32))) (Found!6244 (index!27234 (_ BitVec 32))) (Intermediate!6244 (undefined!7056 Bool) (index!27235 (_ BitVec 32)) (x!56035 (_ BitVec 32))) (Undefined!6244) (MissingVacant!6244 (index!27236 (_ BitVec 32))) )
))
(declare-fun lt!272510 () SeekEntryResult!6244)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599460 (= res!384448 (not (= lt!272510 (Found!6244 index!984))))))

(declare-datatypes ((Unit!18894 0))(
  ( (Unit!18895) )
))
(declare-fun lt!272508 () Unit!18894)

(declare-fun e!342719 () Unit!18894)

(assert (=> b!599460 (= lt!272508 e!342719)))

(declare-fun c!67880 () Bool)

(assert (=> b!599460 (= c!67880 (= lt!272510 Undefined!6244))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37089 0))(
  ( (array!37090 (arr!17804 (Array (_ BitVec 32) (_ BitVec 64))) (size!18168 (_ BitVec 32))) )
))
(declare-fun lt!272518 () array!37089)

(declare-fun lt!272513 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37089 (_ BitVec 32)) SeekEntryResult!6244)

(assert (=> b!599460 (= lt!272510 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272513 lt!272518 mask!3053))))

(declare-fun e!342722 () Bool)

(assert (=> b!599460 e!342722))

(declare-fun res!384446 () Bool)

(assert (=> b!599460 (=> (not res!384446) (not e!342722))))

(declare-fun lt!272520 () (_ BitVec 32))

(declare-fun lt!272515 () SeekEntryResult!6244)

(assert (=> b!599460 (= res!384446 (= lt!272515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272520 vacantSpotIndex!68 lt!272513 lt!272518 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37089)

(assert (=> b!599460 (= lt!272515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272520 vacantSpotIndex!68 (select (arr!17804 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!599460 (= lt!272513 (select (store (arr!17804 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272509 () Unit!18894)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37089 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18894)

(assert (=> b!599460 (= lt!272509 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272520 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599460 (= lt!272520 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599461 () Bool)

(declare-fun e!342726 () Bool)

(assert (=> b!599461 (= e!342726 e!342717)))

(declare-fun res!384450 () Bool)

(assert (=> b!599461 (=> (not res!384450) (not e!342717))))

(declare-fun lt!272521 () SeekEntryResult!6244)

(assert (=> b!599461 (= res!384450 (and (= lt!272521 (Found!6244 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17804 a!2986) index!984) (select (arr!17804 a!2986) j!136))) (not (= (select (arr!17804 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599461 (= lt!272521 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17804 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599462 () Bool)

(declare-fun e!342723 () Bool)

(declare-fun arrayContainsKey!0 (array!37089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599462 (= e!342723 (arrayContainsKey!0 lt!272518 (select (arr!17804 a!2986) j!136) index!984))))

(declare-fun b!599464 () Bool)

(declare-fun res!384437 () Bool)

(declare-fun e!342715 () Bool)

(assert (=> b!599464 (=> (not res!384437) (not e!342715))))

(assert (=> b!599464 (= res!384437 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17804 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599465 () Bool)

(declare-fun e!342714 () Bool)

(assert (=> b!599465 (= e!342714 e!342720)))

(declare-fun res!384438 () Bool)

(assert (=> b!599465 (=> res!384438 e!342720)))

(assert (=> b!599465 (= res!384438 (or (bvsge (size!18168 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18168 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37089 (_ BitVec 32) List!11845) Bool)

(assert (=> b!599465 (arrayNoDuplicates!0 lt!272518 j!136 Nil!11842)))

(declare-fun lt!272512 () Unit!18894)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37089 (_ BitVec 32) (_ BitVec 32)) Unit!18894)

(assert (=> b!599465 (= lt!272512 (lemmaNoDuplicateFromThenFromBigger!0 lt!272518 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599465 (arrayNoDuplicates!0 lt!272518 #b00000000000000000000000000000000 Nil!11842)))

(declare-fun lt!272517 () Unit!18894)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11845) Unit!18894)

(assert (=> b!599465 (= lt!272517 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11842))))

(assert (=> b!599465 (arrayContainsKey!0 lt!272518 (select (arr!17804 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272516 () Unit!18894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18894)

(assert (=> b!599465 (= lt!272516 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272518 (select (arr!17804 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599466 () Bool)

(declare-fun Unit!18896 () Unit!18894)

(assert (=> b!599466 (= e!342719 Unit!18896)))

(assert (=> b!599466 false))

(declare-fun b!599467 () Bool)

(declare-fun res!384434 () Bool)

(declare-fun e!342725 () Bool)

(assert (=> b!599467 (=> (not res!384434) (not e!342725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599467 (= res!384434 (validKeyInArray!0 k!1786))))

(declare-fun b!599468 () Bool)

(declare-fun e!342716 () Bool)

(declare-fun e!342721 () Bool)

(assert (=> b!599468 (= e!342716 e!342721)))

(declare-fun res!384435 () Bool)

(assert (=> b!599468 (=> res!384435 e!342721)))

(declare-fun lt!272511 () (_ BitVec 64))

(assert (=> b!599468 (= res!384435 (or (not (= (select (arr!17804 a!2986) j!136) lt!272513)) (not (= (select (arr!17804 a!2986) j!136) lt!272511)) (bvsge j!136 index!984)))))

(declare-fun b!599469 () Bool)

(assert (=> b!599469 (= e!342721 e!342723)))

(declare-fun res!384445 () Bool)

(assert (=> b!599469 (=> (not res!384445) (not e!342723))))

(assert (=> b!599469 (= res!384445 (arrayContainsKey!0 lt!272518 (select (arr!17804 a!2986) j!136) j!136))))

(declare-fun b!599470 () Bool)

(declare-fun res!384447 () Bool)

(assert (=> b!599470 (=> (not res!384447) (not e!342715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37089 (_ BitVec 32)) Bool)

(assert (=> b!599470 (= res!384447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599471 () Bool)

(assert (=> b!599471 (= e!342715 e!342726)))

(declare-fun res!384443 () Bool)

(assert (=> b!599471 (=> (not res!384443) (not e!342726))))

(assert (=> b!599471 (= res!384443 (= (select (store (arr!17804 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599471 (= lt!272518 (array!37090 (store (arr!17804 a!2986) i!1108 k!1786) (size!18168 a!2986)))))

(declare-fun b!599472 () Bool)

(declare-fun res!384452 () Bool)

(assert (=> b!599472 (=> (not res!384452) (not e!342725))))

(assert (=> b!599472 (= res!384452 (validKeyInArray!0 (select (arr!17804 a!2986) j!136)))))

(declare-fun b!599473 () Bool)

(assert (=> b!599473 (= e!342725 e!342715)))

(declare-fun res!384441 () Bool)

(assert (=> b!599473 (=> (not res!384441) (not e!342715))))

(declare-fun lt!272514 () SeekEntryResult!6244)

(assert (=> b!599473 (= res!384441 (or (= lt!272514 (MissingZero!6244 i!1108)) (= lt!272514 (MissingVacant!6244 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37089 (_ BitVec 32)) SeekEntryResult!6244)

(assert (=> b!599473 (= lt!272514 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599474 () Bool)

(declare-fun res!384440 () Bool)

(assert (=> b!599474 (=> (not res!384440) (not e!342725))))

(assert (=> b!599474 (= res!384440 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599475 () Bool)

(assert (=> b!599475 (= e!342718 e!342714)))

(declare-fun res!384451 () Bool)

(assert (=> b!599475 (=> res!384451 e!342714)))

(assert (=> b!599475 (= res!384451 (or (not (= (select (arr!17804 a!2986) j!136) lt!272513)) (not (= (select (arr!17804 a!2986) j!136) lt!272511)) (bvsge j!136 index!984)))))

(assert (=> b!599475 e!342716))

(declare-fun res!384433 () Bool)

(assert (=> b!599475 (=> (not res!384433) (not e!342716))))

(assert (=> b!599475 (= res!384433 (= lt!272511 (select (arr!17804 a!2986) j!136)))))

(assert (=> b!599475 (= lt!272511 (select (store (arr!17804 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599476 () Bool)

(declare-fun Unit!18897 () Unit!18894)

(assert (=> b!599476 (= e!342719 Unit!18897)))

(declare-fun b!599477 () Bool)

(assert (=> b!599477 (= e!342720 true)))

(declare-fun lt!272519 () Bool)

(assert (=> b!599477 (= lt!272519 (contains!2961 Nil!11842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599463 () Bool)

(declare-fun res!384444 () Bool)

(assert (=> b!599463 (=> (not res!384444) (not e!342725))))

(assert (=> b!599463 (= res!384444 (and (= (size!18168 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18168 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18168 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!384442 () Bool)

(assert (=> start!54854 (=> (not res!384442) (not e!342725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54854 (= res!384442 (validMask!0 mask!3053))))

(assert (=> start!54854 e!342725))

(assert (=> start!54854 true))

(declare-fun array_inv!13600 (array!37089) Bool)

(assert (=> start!54854 (array_inv!13600 a!2986)))

(declare-fun b!599478 () Bool)

(declare-fun res!384449 () Bool)

(assert (=> b!599478 (=> res!384449 e!342720)))

(declare-fun noDuplicate!278 (List!11845) Bool)

(assert (=> b!599478 (= res!384449 (not (noDuplicate!278 Nil!11842)))))

(declare-fun b!599479 () Bool)

(declare-fun res!384436 () Bool)

(assert (=> b!599479 (=> (not res!384436) (not e!342715))))

(assert (=> b!599479 (= res!384436 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11842))))

(declare-fun b!599480 () Bool)

(assert (=> b!599480 (= e!342722 (= lt!272521 lt!272515))))

(assert (= (and start!54854 res!384442) b!599463))

(assert (= (and b!599463 res!384444) b!599472))

(assert (= (and b!599472 res!384452) b!599467))

(assert (= (and b!599467 res!384434) b!599474))

(assert (= (and b!599474 res!384440) b!599473))

(assert (= (and b!599473 res!384441) b!599470))

(assert (= (and b!599470 res!384447) b!599479))

(assert (= (and b!599479 res!384436) b!599464))

(assert (= (and b!599464 res!384437) b!599471))

(assert (= (and b!599471 res!384443) b!599461))

(assert (= (and b!599461 res!384450) b!599460))

(assert (= (and b!599460 res!384446) b!599480))

(assert (= (and b!599460 c!67880) b!599466))

(assert (= (and b!599460 (not c!67880)) b!599476))

(assert (= (and b!599460 (not res!384448)) b!599475))

(assert (= (and b!599475 res!384433) b!599468))

(assert (= (and b!599468 (not res!384435)) b!599469))

(assert (= (and b!599469 res!384445) b!599462))

(assert (= (and b!599475 (not res!384451)) b!599465))

(assert (= (and b!599465 (not res!384438)) b!599478))

(assert (= (and b!599478 (not res!384449)) b!599459))

(assert (= (and b!599459 (not res!384439)) b!599477))

(declare-fun m!576709 () Bool)

(assert (=> b!599465 m!576709))

(declare-fun m!576711 () Bool)

(assert (=> b!599465 m!576711))

(declare-fun m!576713 () Bool)

(assert (=> b!599465 m!576713))

(declare-fun m!576715 () Bool)

(assert (=> b!599465 m!576715))

(assert (=> b!599465 m!576713))

(declare-fun m!576717 () Bool)

(assert (=> b!599465 m!576717))

(assert (=> b!599465 m!576713))

(declare-fun m!576719 () Bool)

(assert (=> b!599465 m!576719))

(declare-fun m!576721 () Bool)

(assert (=> b!599465 m!576721))

(declare-fun m!576723 () Bool)

(assert (=> b!599473 m!576723))

(declare-fun m!576725 () Bool)

(assert (=> start!54854 m!576725))

(declare-fun m!576727 () Bool)

(assert (=> start!54854 m!576727))

(assert (=> b!599462 m!576713))

(assert (=> b!599462 m!576713))

(declare-fun m!576729 () Bool)

(assert (=> b!599462 m!576729))

(declare-fun m!576731 () Bool)

(assert (=> b!599479 m!576731))

(declare-fun m!576733 () Bool)

(assert (=> b!599464 m!576733))

(declare-fun m!576735 () Bool)

(assert (=> b!599461 m!576735))

(assert (=> b!599461 m!576713))

(assert (=> b!599461 m!576713))

(declare-fun m!576737 () Bool)

(assert (=> b!599461 m!576737))

(declare-fun m!576739 () Bool)

(assert (=> b!599478 m!576739))

(declare-fun m!576741 () Bool)

(assert (=> b!599460 m!576741))

(declare-fun m!576743 () Bool)

(assert (=> b!599460 m!576743))

(assert (=> b!599460 m!576713))

(declare-fun m!576745 () Bool)

(assert (=> b!599460 m!576745))

(declare-fun m!576747 () Bool)

(assert (=> b!599460 m!576747))

(assert (=> b!599460 m!576713))

(declare-fun m!576749 () Bool)

(assert (=> b!599460 m!576749))

(declare-fun m!576751 () Bool)

(assert (=> b!599460 m!576751))

(declare-fun m!576753 () Bool)

(assert (=> b!599460 m!576753))

(declare-fun m!576755 () Bool)

(assert (=> b!599470 m!576755))

(assert (=> b!599475 m!576713))

(assert (=> b!599475 m!576745))

(declare-fun m!576757 () Bool)

(assert (=> b!599475 m!576757))

(assert (=> b!599468 m!576713))

(assert (=> b!599472 m!576713))

(assert (=> b!599472 m!576713))

(declare-fun m!576759 () Bool)

(assert (=> b!599472 m!576759))

(declare-fun m!576761 () Bool)

(assert (=> b!599474 m!576761))

(assert (=> b!599469 m!576713))

(assert (=> b!599469 m!576713))

(declare-fun m!576763 () Bool)

(assert (=> b!599469 m!576763))

(assert (=> b!599471 m!576745))

(declare-fun m!576765 () Bool)

(assert (=> b!599471 m!576765))

(declare-fun m!576767 () Bool)

(assert (=> b!599477 m!576767))

(declare-fun m!576769 () Bool)

(assert (=> b!599467 m!576769))

(declare-fun m!576771 () Bool)

(assert (=> b!599459 m!576771))

(push 1)

