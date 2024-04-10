; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58140 () Bool)

(assert start!58140)

(declare-fun b!642740 () Bool)

(declare-fun e!368107 () Bool)

(declare-fun e!368111 () Bool)

(assert (=> b!642740 (= e!368107 e!368111)))

(declare-fun res!416424 () Bool)

(assert (=> b!642740 (=> (not res!416424) (not e!368111))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38399 0))(
  ( (array!38400 (arr!18416 (Array (_ BitVec 32) (_ BitVec 64))) (size!18780 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38399)

(declare-fun lt!297739 () array!38399)

(declare-fun arrayContainsKey!0 (array!38399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642740 (= res!416424 (arrayContainsKey!0 lt!297739 (select (arr!18416 a!2986) j!136) j!136))))

(declare-fun b!642741 () Bool)

(declare-fun res!416417 () Bool)

(declare-fun e!368115 () Bool)

(assert (=> b!642741 (=> (not res!416417) (not e!368115))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!642741 (= res!416417 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!416418 () Bool)

(assert (=> start!58140 (=> (not res!416418) (not e!368115))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58140 (= res!416418 (validMask!0 mask!3053))))

(assert (=> start!58140 e!368115))

(assert (=> start!58140 true))

(declare-fun array_inv!14212 (array!38399) Bool)

(assert (=> start!58140 (array_inv!14212 a!2986)))

(declare-fun b!642742 () Bool)

(declare-datatypes ((Unit!21762 0))(
  ( (Unit!21763) )
))
(declare-fun e!368110 () Unit!21762)

(declare-fun Unit!21764 () Unit!21762)

(assert (=> b!642742 (= e!368110 Unit!21764)))

(declare-fun e!368105 () Bool)

(declare-fun b!642743 () Bool)

(assert (=> b!642743 (= e!368105 (arrayContainsKey!0 lt!297739 (select (arr!18416 a!2986) j!136) j!136))))

(declare-fun b!642744 () Bool)

(declare-fun res!416415 () Bool)

(assert (=> b!642744 (=> (not res!416415) (not e!368115))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642744 (= res!416415 (and (= (size!18780 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18780 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18780 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642745 () Bool)

(declare-fun res!416422 () Bool)

(declare-fun e!368103 () Bool)

(assert (=> b!642745 (=> (not res!416422) (not e!368103))))

(declare-datatypes ((List!12457 0))(
  ( (Nil!12454) (Cons!12453 (h!13498 (_ BitVec 64)) (t!18685 List!12457)) )
))
(declare-fun arrayNoDuplicates!0 (array!38399 (_ BitVec 32) List!12457) Bool)

(assert (=> b!642745 (= res!416422 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12454))))

(declare-fun b!642746 () Bool)

(declare-fun e!368109 () Bool)

(declare-fun e!368104 () Bool)

(assert (=> b!642746 (= e!368109 e!368104)))

(declare-fun res!416427 () Bool)

(assert (=> b!642746 (=> (not res!416427) (not e!368104))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6856 0))(
  ( (MissingZero!6856 (index!29750 (_ BitVec 32))) (Found!6856 (index!29751 (_ BitVec 32))) (Intermediate!6856 (undefined!7668 Bool) (index!29752 (_ BitVec 32)) (x!58510 (_ BitVec 32))) (Undefined!6856) (MissingVacant!6856 (index!29753 (_ BitVec 32))) )
))
(declare-fun lt!297732 () SeekEntryResult!6856)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642746 (= res!416427 (and (= lt!297732 (Found!6856 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18416 a!2986) index!984) (select (arr!18416 a!2986) j!136))) (not (= (select (arr!18416 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38399 (_ BitVec 32)) SeekEntryResult!6856)

(assert (=> b!642746 (= lt!297732 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642747 () Bool)

(assert (=> b!642747 (= e!368115 e!368103)))

(declare-fun res!416414 () Bool)

(assert (=> b!642747 (=> (not res!416414) (not e!368103))))

(declare-fun lt!297730 () SeekEntryResult!6856)

(assert (=> b!642747 (= res!416414 (or (= lt!297730 (MissingZero!6856 i!1108)) (= lt!297730 (MissingVacant!6856 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38399 (_ BitVec 32)) SeekEntryResult!6856)

(assert (=> b!642747 (= lt!297730 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!642748 () Bool)

(declare-fun e!368113 () Bool)

(declare-fun e!368102 () Bool)

(assert (=> b!642748 (= e!368113 e!368102)))

(declare-fun res!416426 () Bool)

(assert (=> b!642748 (=> res!416426 e!368102)))

(declare-fun lt!297728 () (_ BitVec 64))

(declare-fun lt!297735 () (_ BitVec 64))

(assert (=> b!642748 (= res!416426 (or (not (= (select (arr!18416 a!2986) j!136) lt!297728)) (not (= (select (arr!18416 a!2986) j!136) lt!297735))))))

(declare-fun e!368106 () Bool)

(assert (=> b!642748 e!368106))

(declare-fun res!416420 () Bool)

(assert (=> b!642748 (=> (not res!416420) (not e!368106))))

(assert (=> b!642748 (= res!416420 (= lt!297735 (select (arr!18416 a!2986) j!136)))))

(assert (=> b!642748 (= lt!297735 (select (store (arr!18416 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!642749 () Bool)

(declare-fun e!368112 () Unit!21762)

(declare-fun Unit!21765 () Unit!21762)

(assert (=> b!642749 (= e!368112 Unit!21765)))

(assert (=> b!642749 false))

(declare-fun b!642750 () Bool)

(assert (=> b!642750 (= e!368111 (arrayContainsKey!0 lt!297739 (select (arr!18416 a!2986) j!136) index!984))))

(declare-fun b!642751 () Bool)

(declare-fun res!416412 () Bool)

(assert (=> b!642751 (=> (not res!416412) (not e!368115))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642751 (= res!416412 (validKeyInArray!0 k!1786))))

(declare-fun b!642752 () Bool)

(declare-fun res!416421 () Bool)

(assert (=> b!642752 (=> (not res!416421) (not e!368103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38399 (_ BitVec 32)) Bool)

(assert (=> b!642752 (= res!416421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642753 () Bool)

(assert (=> b!642753 (= e!368104 (not e!368113))))

(declare-fun res!416428 () Bool)

(assert (=> b!642753 (=> res!416428 e!368113)))

(declare-fun lt!297737 () SeekEntryResult!6856)

(assert (=> b!642753 (= res!416428 (not (= lt!297737 (Found!6856 index!984))))))

(declare-fun lt!297733 () Unit!21762)

(assert (=> b!642753 (= lt!297733 e!368112)))

(declare-fun c!73532 () Bool)

(assert (=> b!642753 (= c!73532 (= lt!297737 Undefined!6856))))

(assert (=> b!642753 (= lt!297737 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297728 lt!297739 mask!3053))))

(declare-fun e!368108 () Bool)

(assert (=> b!642753 e!368108))

(declare-fun res!416416 () Bool)

(assert (=> b!642753 (=> (not res!416416) (not e!368108))))

(declare-fun lt!297726 () SeekEntryResult!6856)

(declare-fun lt!297738 () (_ BitVec 32))

(assert (=> b!642753 (= res!416416 (= lt!297726 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297738 vacantSpotIndex!68 lt!297728 lt!297739 mask!3053)))))

(assert (=> b!642753 (= lt!297726 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297738 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642753 (= lt!297728 (select (store (arr!18416 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297727 () Unit!21762)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38399 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21762)

(assert (=> b!642753 (= lt!297727 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297738 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642753 (= lt!297738 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642754 () Bool)

(assert (=> b!642754 (= e!368108 (= lt!297732 lt!297726))))

(declare-fun b!642755 () Bool)

(assert (=> b!642755 (= e!368102 e!368105)))

(declare-fun res!416425 () Bool)

(assert (=> b!642755 (=> res!416425 e!368105)))

(assert (=> b!642755 (= res!416425 (bvsge index!984 j!136))))

(declare-fun lt!297734 () Unit!21762)

(assert (=> b!642755 (= lt!297734 e!368110)))

(declare-fun c!73531 () Bool)

(assert (=> b!642755 (= c!73531 (bvslt j!136 index!984))))

(declare-fun b!642756 () Bool)

(declare-fun res!416423 () Bool)

(assert (=> b!642756 (=> (not res!416423) (not e!368103))))

(assert (=> b!642756 (= res!416423 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18416 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642757 () Bool)

(declare-fun Unit!21766 () Unit!21762)

(assert (=> b!642757 (= e!368112 Unit!21766)))

(declare-fun b!642758 () Bool)

(assert (=> b!642758 (= e!368106 e!368107)))

(declare-fun res!416413 () Bool)

(assert (=> b!642758 (=> res!416413 e!368107)))

(assert (=> b!642758 (= res!416413 (or (not (= (select (arr!18416 a!2986) j!136) lt!297728)) (not (= (select (arr!18416 a!2986) j!136) lt!297735)) (bvsge j!136 index!984)))))

(declare-fun b!642759 () Bool)

(assert (=> b!642759 (= e!368103 e!368109)))

(declare-fun res!416429 () Bool)

(assert (=> b!642759 (=> (not res!416429) (not e!368109))))

(assert (=> b!642759 (= res!416429 (= (select (store (arr!18416 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642759 (= lt!297739 (array!38400 (store (arr!18416 a!2986) i!1108 k!1786) (size!18780 a!2986)))))

(declare-fun b!642760 () Bool)

(declare-fun res!416419 () Bool)

(assert (=> b!642760 (=> (not res!416419) (not e!368115))))

(assert (=> b!642760 (= res!416419 (validKeyInArray!0 (select (arr!18416 a!2986) j!136)))))

(declare-fun b!642761 () Bool)

(declare-fun Unit!21767 () Unit!21762)

(assert (=> b!642761 (= e!368110 Unit!21767)))

(declare-fun lt!297736 () Unit!21762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38399 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21762)

(assert (=> b!642761 (= lt!297736 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297739 (select (arr!18416 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!642761 (arrayContainsKey!0 lt!297739 (select (arr!18416 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297731 () Unit!21762)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38399 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12457) Unit!21762)

(assert (=> b!642761 (= lt!297731 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12454))))

(assert (=> b!642761 (arrayNoDuplicates!0 lt!297739 #b00000000000000000000000000000000 Nil!12454)))

(declare-fun lt!297729 () Unit!21762)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38399 (_ BitVec 32) (_ BitVec 32)) Unit!21762)

(assert (=> b!642761 (= lt!297729 (lemmaNoDuplicateFromThenFromBigger!0 lt!297739 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642761 (arrayNoDuplicates!0 lt!297739 j!136 Nil!12454)))

(declare-fun lt!297725 () Unit!21762)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38399 (_ BitVec 64) (_ BitVec 32) List!12457) Unit!21762)

(assert (=> b!642761 (= lt!297725 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297739 (select (arr!18416 a!2986) j!136) j!136 Nil!12454))))

(assert (=> b!642761 false))

(assert (= (and start!58140 res!416418) b!642744))

(assert (= (and b!642744 res!416415) b!642760))

(assert (= (and b!642760 res!416419) b!642751))

(assert (= (and b!642751 res!416412) b!642741))

(assert (= (and b!642741 res!416417) b!642747))

(assert (= (and b!642747 res!416414) b!642752))

(assert (= (and b!642752 res!416421) b!642745))

(assert (= (and b!642745 res!416422) b!642756))

(assert (= (and b!642756 res!416423) b!642759))

(assert (= (and b!642759 res!416429) b!642746))

(assert (= (and b!642746 res!416427) b!642753))

(assert (= (and b!642753 res!416416) b!642754))

(assert (= (and b!642753 c!73532) b!642749))

(assert (= (and b!642753 (not c!73532)) b!642757))

(assert (= (and b!642753 (not res!416428)) b!642748))

(assert (= (and b!642748 res!416420) b!642758))

(assert (= (and b!642758 (not res!416413)) b!642740))

(assert (= (and b!642740 res!416424) b!642750))

(assert (= (and b!642748 (not res!416426)) b!642755))

(assert (= (and b!642755 c!73531) b!642761))

(assert (= (and b!642755 (not c!73531)) b!642742))

(assert (= (and b!642755 (not res!416425)) b!642743))

(declare-fun m!616505 () Bool)

(assert (=> b!642746 m!616505))

(declare-fun m!616507 () Bool)

(assert (=> b!642746 m!616507))

(assert (=> b!642746 m!616507))

(declare-fun m!616509 () Bool)

(assert (=> b!642746 m!616509))

(declare-fun m!616511 () Bool)

(assert (=> start!58140 m!616511))

(declare-fun m!616513 () Bool)

(assert (=> start!58140 m!616513))

(declare-fun m!616515 () Bool)

(assert (=> b!642747 m!616515))

(declare-fun m!616517 () Bool)

(assert (=> b!642741 m!616517))

(declare-fun m!616519 () Bool)

(assert (=> b!642756 m!616519))

(assert (=> b!642750 m!616507))

(assert (=> b!642750 m!616507))

(declare-fun m!616521 () Bool)

(assert (=> b!642750 m!616521))

(assert (=> b!642743 m!616507))

(assert (=> b!642743 m!616507))

(declare-fun m!616523 () Bool)

(assert (=> b!642743 m!616523))

(declare-fun m!616525 () Bool)

(assert (=> b!642753 m!616525))

(declare-fun m!616527 () Bool)

(assert (=> b!642753 m!616527))

(declare-fun m!616529 () Bool)

(assert (=> b!642753 m!616529))

(assert (=> b!642753 m!616507))

(declare-fun m!616531 () Bool)

(assert (=> b!642753 m!616531))

(assert (=> b!642753 m!616507))

(declare-fun m!616533 () Bool)

(assert (=> b!642753 m!616533))

(declare-fun m!616535 () Bool)

(assert (=> b!642753 m!616535))

(declare-fun m!616537 () Bool)

(assert (=> b!642753 m!616537))

(assert (=> b!642758 m!616507))

(declare-fun m!616539 () Bool)

(assert (=> b!642751 m!616539))

(assert (=> b!642760 m!616507))

(assert (=> b!642760 m!616507))

(declare-fun m!616541 () Bool)

(assert (=> b!642760 m!616541))

(declare-fun m!616543 () Bool)

(assert (=> b!642752 m!616543))

(assert (=> b!642740 m!616507))

(assert (=> b!642740 m!616507))

(assert (=> b!642740 m!616523))

(assert (=> b!642748 m!616507))

(assert (=> b!642748 m!616531))

(declare-fun m!616545 () Bool)

(assert (=> b!642748 m!616545))

(assert (=> b!642759 m!616531))

(declare-fun m!616547 () Bool)

(assert (=> b!642759 m!616547))

(declare-fun m!616549 () Bool)

(assert (=> b!642761 m!616549))

(assert (=> b!642761 m!616507))

(assert (=> b!642761 m!616507))

(declare-fun m!616551 () Bool)

(assert (=> b!642761 m!616551))

(declare-fun m!616553 () Bool)

(assert (=> b!642761 m!616553))

(assert (=> b!642761 m!616507))

(declare-fun m!616555 () Bool)

(assert (=> b!642761 m!616555))

(declare-fun m!616557 () Bool)

(assert (=> b!642761 m!616557))

(assert (=> b!642761 m!616507))

(declare-fun m!616559 () Bool)

(assert (=> b!642761 m!616559))

(declare-fun m!616561 () Bool)

(assert (=> b!642761 m!616561))

(declare-fun m!616563 () Bool)

(assert (=> b!642745 m!616563))

(push 1)

(assert (not b!642740))

(assert (not b!642760))

(assert (not b!642752))

(assert (not b!642750))

(assert (not b!642753))

(assert (not b!642746))

(assert (not b!642747))

(assert (not b!642751))

(assert (not b!642761))

(assert (not b!642741))

(assert (not start!58140))

(assert (not b!642745))

(assert (not b!642743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!642850 () Bool)

(declare-fun c!73563 () Bool)

(declare-fun lt!297776 () (_ BitVec 64))

(assert (=> b!642850 (= c!73563 (= lt!297776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368178 () SeekEntryResult!6856)

(declare-fun e!368176 () SeekEntryResult!6856)

(assert (=> b!642850 (= e!368178 e!368176)))

(declare-fun b!642851 () Bool)

(declare-fun lt!297777 () SeekEntryResult!6856)

(assert (=> b!642851 (= e!368176 (MissingZero!6856 (index!29752 lt!297777)))))

(declare-fun d!90805 () Bool)

(declare-fun lt!297778 () SeekEntryResult!6856)

(assert (=> d!90805 (and (or (is-Undefined!6856 lt!297778) (not (is-Found!6856 lt!297778)) (and (bvsge (index!29751 lt!297778) #b00000000000000000000000000000000) (bvslt (index!29751 lt!297778) (size!18780 a!2986)))) (or (is-Undefined!6856 lt!297778) (is-Found!6856 lt!297778) (not (is-MissingZero!6856 lt!297778)) (and (bvsge (index!29750 lt!297778) #b00000000000000000000000000000000) (bvslt (index!29750 lt!297778) (size!18780 a!2986)))) (or (is-Undefined!6856 lt!297778) (is-Found!6856 lt!297778) (is-MissingZero!6856 lt!297778) (not (is-MissingVacant!6856 lt!297778)) (and (bvsge (index!29753 lt!297778) #b00000000000000000000000000000000) (bvslt (index!29753 lt!297778) (size!18780 a!2986)))) (or (is-Undefined!6856 lt!297778) (ite (is-Found!6856 lt!297778) (= (select (arr!18416 a!2986) (index!29751 lt!297778)) k!1786) (ite (is-MissingZero!6856 lt!297778) (= (select (arr!18416 a!2986) (index!29750 lt!297778)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6856 lt!297778) (= (select (arr!18416 a!2986) (index!29753 lt!297778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!368177 () SeekEntryResult!6856)

(assert (=> d!90805 (= lt!297778 e!368177)))

(declare-fun c!73561 () Bool)

(assert (=> d!90805 (= c!73561 (and (is-Intermediate!6856 lt!297777) (undefined!7668 lt!297777)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38399 (_ BitVec 32)) SeekEntryResult!6856)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90805 (= lt!297777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90805 (validMask!0 mask!3053)))

(assert (=> d!90805 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!297778)))

(declare-fun b!642852 () Bool)

(assert (=> b!642852 (= e!368178 (Found!6856 (index!29752 lt!297777)))))

(declare-fun b!642853 () Bool)

(assert (=> b!642853 (= e!368176 (seekKeyOrZeroReturnVacant!0 (x!58510 lt!297777) (index!29752 lt!297777) (index!29752 lt!297777) k!1786 a!2986 mask!3053))))

(declare-fun b!642854 () Bool)

(assert (=> b!642854 (= e!368177 Undefined!6856)))

(declare-fun b!642855 () Bool)

(assert (=> b!642855 (= e!368177 e!368178)))

(assert (=> b!642855 (= lt!297776 (select (arr!18416 a!2986) (index!29752 lt!297777)))))

(declare-fun c!73562 () Bool)

(assert (=> b!642855 (= c!73562 (= lt!297776 k!1786))))

(assert (= (and d!90805 c!73561) b!642854))

(assert (= (and d!90805 (not c!73561)) b!642855))

(assert (= (and b!642855 c!73562) b!642852))

(assert (= (and b!642855 (not c!73562)) b!642850))

(assert (= (and b!642850 c!73563) b!642851))

(assert (= (and b!642850 (not c!73563)) b!642853))

(declare-fun m!616641 () Bool)

(assert (=> d!90805 m!616641))

(declare-fun m!616643 () Bool)

(assert (=> d!90805 m!616643))

(assert (=> d!90805 m!616641))

(assert (=> d!90805 m!616511))

(declare-fun m!616645 () Bool)

(assert (=> d!90805 m!616645))

(declare-fun m!616647 () Bool)

(assert (=> d!90805 m!616647))

(declare-fun m!616649 () Bool)

(assert (=> d!90805 m!616649))

(declare-fun m!616651 () Bool)

(assert (=> b!642853 m!616651))

(declare-fun m!616653 () Bool)

(assert (=> b!642855 m!616653))

(assert (=> b!642747 d!90805))

(declare-fun b!642901 () Bool)

(declare-fun e!368209 () SeekEntryResult!6856)

(declare-fun e!368210 () SeekEntryResult!6856)

(assert (=> b!642901 (= e!368209 e!368210)))

(declare-fun c!73582 () Bool)

(declare-fun lt!297798 () (_ BitVec 64))

(assert (=> b!642901 (= c!73582 (= lt!297798 (select (arr!18416 a!2986) j!136)))))

(declare-fun b!642902 () Bool)

(assert (=> b!642902 (= e!368209 Undefined!6856)))

(declare-fun b!642904 () Bool)

(assert (=> b!642904 (= e!368210 (Found!6856 index!984))))

(declare-fun b!642905 () Bool)

(declare-fun c!73581 () Bool)

(assert (=> b!642905 (= c!73581 (= lt!297798 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368208 () SeekEntryResult!6856)

(assert (=> b!642905 (= e!368210 e!368208)))

(declare-fun b!642906 () Bool)

(assert (=> b!642906 (= e!368208 (MissingVacant!6856 vacantSpotIndex!68))))

(declare-fun lt!297799 () SeekEntryResult!6856)

(declare-fun d!90819 () Bool)

(assert (=> d!90819 (and (or (is-Undefined!6856 lt!297799) (not (is-Found!6856 lt!297799)) (and (bvsge (index!29751 lt!297799) #b00000000000000000000000000000000) (bvslt (index!29751 lt!297799) (size!18780 a!2986)))) (or (is-Undefined!6856 lt!297799) (is-Found!6856 lt!297799) (not (is-MissingVacant!6856 lt!297799)) (not (= (index!29753 lt!297799) vacantSpotIndex!68)) (and (bvsge (index!29753 lt!297799) #b00000000000000000000000000000000) (bvslt (index!29753 lt!297799) (size!18780 a!2986)))) (or (is-Undefined!6856 lt!297799) (ite (is-Found!6856 lt!297799) (= (select (arr!18416 a!2986) (index!29751 lt!297799)) (select (arr!18416 a!2986) j!136)) (and (is-MissingVacant!6856 lt!297799) (= (index!29753 lt!297799) vacantSpotIndex!68) (= (select (arr!18416 a!2986) (index!29753 lt!297799)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90819 (= lt!297799 e!368209)))

(declare-fun c!73580 () Bool)

(assert (=> d!90819 (= c!73580 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90819 (= lt!297798 (select (arr!18416 a!2986) index!984))))

(assert (=> d!90819 (validMask!0 mask!3053)))

(assert (=> d!90819 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053) lt!297799)))

(declare-fun b!642903 () Bool)

(assert (=> b!642903 (= e!368208 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!90819 c!73580) b!642902))

(assert (= (and d!90819 (not c!73580)) b!642901))

(assert (= (and b!642901 c!73582) b!642904))

(assert (= (and b!642901 (not c!73582)) b!642905))

(assert (= (and b!642905 c!73581) b!642906))

(assert (= (and b!642905 (not c!73581)) b!642903))

(declare-fun m!616675 () Bool)

(assert (=> d!90819 m!616675))

(declare-fun m!616677 () Bool)

(assert (=> d!90819 m!616677))

(assert (=> d!90819 m!616505))

(assert (=> d!90819 m!616511))

(assert (=> b!642903 m!616525))

(assert (=> b!642903 m!616525))

(assert (=> b!642903 m!616507))

(declare-fun m!616679 () Bool)

(assert (=> b!642903 m!616679))

(assert (=> b!642746 d!90819))

(declare-fun b!642923 () Bool)

(declare-fun e!368225 () Bool)

(declare-fun contains!3140 (List!12457 (_ BitVec 64)) Bool)

(assert (=> b!642923 (= e!368225 (contains!3140 Nil!12454 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!642924 () Bool)

(declare-fun e!368224 () Bool)

(declare-fun e!368222 () Bool)

(assert (=> b!642924 (= e!368224 e!368222)))

(declare-fun res!416483 () Bool)

(assert (=> b!642924 (=> (not res!416483) (not e!368222))))

(assert (=> b!642924 (= res!416483 (not e!368225))))

(declare-fun res!416481 () Bool)

(assert (=> b!642924 (=> (not res!416481) (not e!368225))))

(assert (=> b!642924 (= res!416481 (validKeyInArray!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!642925 () Bool)

(declare-fun e!368223 () Bool)

(declare-fun call!33571 () Bool)

(assert (=> b!642925 (= e!368223 call!33571)))

(declare-fun bm!33568 () Bool)

(declare-fun c!73588 () Bool)

(assert (=> bm!33568 (= call!33571 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73588 (Cons!12453 (select (arr!18416 a!2986) #b00000000000000000000000000000000) Nil!12454) Nil!12454)))))

(declare-fun d!90837 () Bool)

(declare-fun res!416482 () Bool)

(assert (=> d!90837 (=> res!416482 e!368224)))

(assert (=> d!90837 (= res!416482 (bvsge #b00000000000000000000000000000000 (size!18780 a!2986)))))

(assert (=> d!90837 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12454) e!368224)))

(declare-fun b!642926 () Bool)

(assert (=> b!642926 (= e!368223 call!33571)))

(declare-fun b!642927 () Bool)

(assert (=> b!642927 (= e!368222 e!368223)))

(assert (=> b!642927 (= c!73588 (validKeyInArray!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90837 (not res!416482)) b!642924))

(assert (= (and b!642924 res!416481) b!642923))

(assert (= (and b!642924 res!416483) b!642927))

(assert (= (and b!642927 c!73588) b!642926))

(assert (= (and b!642927 (not c!73588)) b!642925))

(assert (= (or b!642926 b!642925) bm!33568))

(declare-fun m!616695 () Bool)

(assert (=> b!642923 m!616695))

(assert (=> b!642923 m!616695))

(declare-fun m!616697 () Bool)

(assert (=> b!642923 m!616697))

(assert (=> b!642924 m!616695))

(assert (=> b!642924 m!616695))

(declare-fun m!616699 () Bool)

(assert (=> b!642924 m!616699))

(assert (=> bm!33568 m!616695))

(declare-fun m!616701 () Bool)

(assert (=> bm!33568 m!616701))

(assert (=> b!642927 m!616695))

(assert (=> b!642927 m!616695))

(assert (=> b!642927 m!616699))

(assert (=> b!642745 d!90837))

(declare-fun d!90841 () Bool)

(declare-fun res!416488 () Bool)

(declare-fun e!368230 () Bool)

(assert (=> d!90841 (=> res!416488 e!368230)))

(assert (=> d!90841 (= res!416488 (= (select (arr!18416 lt!297739) j!136) (select (arr!18416 a!2986) j!136)))))

(assert (=> d!90841 (= (arrayContainsKey!0 lt!297739 (select (arr!18416 a!2986) j!136) j!136) e!368230)))

(declare-fun b!642932 () Bool)

(declare-fun e!368231 () Bool)

(assert (=> b!642932 (= e!368230 e!368231)))

(declare-fun res!416489 () Bool)

(assert (=> b!642932 (=> (not res!416489) (not e!368231))))

(assert (=> b!642932 (= res!416489 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18780 lt!297739)))))

(declare-fun b!642933 () Bool)

(assert (=> b!642933 (= e!368231 (arrayContainsKey!0 lt!297739 (select (arr!18416 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90841 (not res!416488)) b!642932))

(assert (= (and b!642932 res!416489) b!642933))

(declare-fun m!616703 () Bool)

(assert (=> d!90841 m!616703))

(assert (=> b!642933 m!616507))

(declare-fun m!616705 () Bool)

(assert (=> b!642933 m!616705))

(assert (=> b!642743 d!90841))

(declare-fun bm!33574 () Bool)

(declare-fun call!33577 () Bool)

(assert (=> bm!33574 (= call!33577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!642966 () Bool)

(declare-fun e!368254 () Bool)

(declare-fun e!368255 () Bool)

(assert (=> b!642966 (= e!368254 e!368255)))

(declare-fun c!73600 () Bool)

(assert (=> b!642966 (= c!73600 (validKeyInArray!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90843 () Bool)

(declare-fun res!416501 () Bool)

(assert (=> d!90843 (=> res!416501 e!368254)))

(assert (=> d!90843 (= res!416501 (bvsge #b00000000000000000000000000000000 (size!18780 a!2986)))))

(assert (=> d!90843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368254)))

(declare-fun b!642967 () Bool)

(assert (=> b!642967 (= e!368255 call!33577)))

(declare-fun b!642968 () Bool)

(declare-fun e!368253 () Bool)

(assert (=> b!642968 (= e!368255 e!368253)))

(declare-fun lt!297825 () (_ BitVec 64))

(assert (=> b!642968 (= lt!297825 (select (arr!18416 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297826 () Unit!21762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38399 (_ BitVec 64) (_ BitVec 32)) Unit!21762)

(assert (=> b!642968 (= lt!297826 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297825 #b00000000000000000000000000000000))))

(assert (=> b!642968 (arrayContainsKey!0 a!2986 lt!297825 #b00000000000000000000000000000000)))

(declare-fun lt!297824 () Unit!21762)

(assert (=> b!642968 (= lt!297824 lt!297826)))

(declare-fun res!416500 () Bool)

(assert (=> b!642968 (= res!416500 (= (seekEntryOrOpen!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6856 #b00000000000000000000000000000000)))))

(assert (=> b!642968 (=> (not res!416500) (not e!368253))))

(declare-fun b!642969 () Bool)

(assert (=> b!642969 (= e!368253 call!33577)))

(assert (= (and d!90843 (not res!416501)) b!642966))

(assert (= (and b!642966 c!73600) b!642968))

(assert (= (and b!642966 (not c!73600)) b!642967))

(assert (= (and b!642968 res!416500) b!642969))

(assert (= (or b!642969 b!642967) bm!33574))

(declare-fun m!616719 () Bool)

(assert (=> bm!33574 m!616719))

(assert (=> b!642966 m!616695))

(assert (=> b!642966 m!616695))

(assert (=> b!642966 m!616699))

(assert (=> b!642968 m!616695))

(declare-fun m!616721 () Bool)

(assert (=> b!642968 m!616721))

(declare-fun m!616723 () Bool)

(assert (=> b!642968 m!616723))

(assert (=> b!642968 m!616695))

(declare-fun m!616725 () Bool)

(assert (=> b!642968 m!616725))

(assert (=> b!642752 d!90843))

(declare-fun d!90847 () Bool)

(declare-fun lt!297832 () (_ BitVec 32))

(assert (=> d!90847 (and (bvsge lt!297832 #b00000000000000000000000000000000) (bvslt lt!297832 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90847 (= lt!297832 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90847 (validMask!0 mask!3053)))

(assert (=> d!90847 (= (nextIndex!0 index!984 x!910 mask!3053) lt!297832)))

(declare-fun bs!19232 () Bool)

(assert (= bs!19232 d!90847))

(declare-fun m!616743 () Bool)

(assert (=> bs!19232 m!616743))

(assert (=> bs!19232 m!616511))

(assert (=> b!642753 d!90847))

(declare-fun b!642978 () Bool)

(declare-fun e!368262 () SeekEntryResult!6856)

(declare-fun e!368263 () SeekEntryResult!6856)

(assert (=> b!642978 (= e!368262 e!368263)))

(declare-fun c!73606 () Bool)

(declare-fun lt!297833 () (_ BitVec 64))

(assert (=> b!642978 (= c!73606 (= lt!297833 lt!297728))))

(declare-fun b!642979 () Bool)

(assert (=> b!642979 (= e!368262 Undefined!6856)))

(declare-fun b!642981 () Bool)

(assert (=> b!642981 (= e!368263 (Found!6856 index!984))))

(declare-fun b!642982 () Bool)

(declare-fun c!73605 () Bool)

(assert (=> b!642982 (= c!73605 (= lt!297833 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368261 () SeekEntryResult!6856)

(assert (=> b!642982 (= e!368263 e!368261)))

(declare-fun b!642983 () Bool)

(assert (=> b!642983 (= e!368261 (MissingVacant!6856 vacantSpotIndex!68))))

(declare-fun d!90851 () Bool)

(declare-fun lt!297834 () SeekEntryResult!6856)

(assert (=> d!90851 (and (or (is-Undefined!6856 lt!297834) (not (is-Found!6856 lt!297834)) (and (bvsge (index!29751 lt!297834) #b00000000000000000000000000000000) (bvslt (index!29751 lt!297834) (size!18780 lt!297739)))) (or (is-Undefined!6856 lt!297834) (is-Found!6856 lt!297834) (not (is-MissingVacant!6856 lt!297834)) (not (= (index!29753 lt!297834) vacantSpotIndex!68)) (and (bvsge (index!29753 lt!297834) #b00000000000000000000000000000000) (bvslt (index!29753 lt!297834) (size!18780 lt!297739)))) (or (is-Undefined!6856 lt!297834) (ite (is-Found!6856 lt!297834) (= (select (arr!18416 lt!297739) (index!29751 lt!297834)) lt!297728) (and (is-MissingVacant!6856 lt!297834) (= (index!29753 lt!297834) vacantSpotIndex!68) (= (select (arr!18416 lt!297739) (index!29753 lt!297834)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90851 (= lt!297834 e!368262)))

(declare-fun c!73604 () Bool)

(assert (=> d!90851 (= c!73604 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90851 (= lt!297833 (select (arr!18416 lt!297739) index!984))))

(assert (=> d!90851 (validMask!0 mask!3053)))

(assert (=> d!90851 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297728 lt!297739 mask!3053) lt!297834)))

(declare-fun b!642980 () Bool)

(assert (=> b!642980 (= e!368261 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297728 lt!297739 mask!3053))))

(assert (= (and d!90851 c!73604) b!642979))

(assert (= (and d!90851 (not c!73604)) b!642978))

