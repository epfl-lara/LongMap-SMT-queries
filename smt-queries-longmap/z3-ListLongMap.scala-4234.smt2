; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58398 () Bool)

(assert start!58398)

(declare-fun b!644712 () Bool)

(declare-fun res!417664 () Bool)

(declare-fun e!369403 () Bool)

(assert (=> b!644712 (=> (not res!417664) (not e!369403))))

(declare-datatypes ((array!38433 0))(
  ( (array!38434 (arr!18427 (Array (_ BitVec 32) (_ BitVec 64))) (size!18791 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38433)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!644712 (= res!417664 (validKeyInArray!0 (select (arr!18427 a!2986) j!136)))))

(declare-fun b!644713 () Bool)

(declare-fun e!369410 () Bool)

(declare-fun lt!298846 () array!38433)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!644713 (= e!369410 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) index!984))))

(declare-fun b!644714 () Bool)

(declare-fun e!369399 () Bool)

(declare-fun e!369398 () Bool)

(assert (=> b!644714 (= e!369399 e!369398)))

(declare-fun res!417665 () Bool)

(assert (=> b!644714 (=> res!417665 e!369398)))

(assert (=> b!644714 (= res!417665 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!21837 0))(
  ( (Unit!21838) )
))
(declare-fun lt!298847 () Unit!21837)

(declare-fun e!369405 () Unit!21837)

(assert (=> b!644714 (= lt!298847 e!369405)))

(declare-fun c!73895 () Bool)

(assert (=> b!644714 (= c!73895 (bvslt j!136 index!984))))

(declare-fun b!644715 () Bool)

(declare-fun res!417674 () Bool)

(assert (=> b!644715 (=> (not res!417674) (not e!369403))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!644715 (= res!417674 (and (= (size!18791 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18791 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18791 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!644716 () Bool)

(declare-fun e!369402 () Bool)

(declare-datatypes ((SeekEntryResult!6823 0))(
  ( (MissingZero!6823 (index!29624 (_ BitVec 32))) (Found!6823 (index!29625 (_ BitVec 32))) (Intermediate!6823 (undefined!7635 Bool) (index!29626 (_ BitVec 32)) (x!58546 (_ BitVec 32))) (Undefined!6823) (MissingVacant!6823 (index!29627 (_ BitVec 32))) )
))
(declare-fun lt!298841 () SeekEntryResult!6823)

(declare-fun lt!298843 () SeekEntryResult!6823)

(assert (=> b!644716 (= e!369402 (= lt!298841 lt!298843))))

(declare-fun b!644717 () Bool)

(declare-fun e!369409 () Bool)

(declare-fun e!369400 () Bool)

(assert (=> b!644717 (= e!369409 e!369400)))

(declare-fun res!417666 () Bool)

(assert (=> b!644717 (=> res!417666 e!369400)))

(declare-fun lt!298835 () (_ BitVec 64))

(declare-fun lt!298844 () (_ BitVec 64))

(assert (=> b!644717 (= res!417666 (or (not (= (select (arr!18427 a!2986) j!136) lt!298844)) (not (= (select (arr!18427 a!2986) j!136) lt!298835)) (bvsge j!136 index!984)))))

(declare-fun b!644719 () Bool)

(declare-fun e!369407 () Bool)

(declare-fun e!369411 () Bool)

(assert (=> b!644719 (= e!369407 e!369411)))

(declare-fun res!417676 () Bool)

(assert (=> b!644719 (=> (not res!417676) (not e!369411))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!644719 (= res!417676 (and (= lt!298841 (Found!6823 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18427 a!2986) index!984) (select (arr!18427 a!2986) j!136))) (not (= (select (arr!18427 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38433 (_ BitVec 32)) SeekEntryResult!6823)

(assert (=> b!644719 (= lt!298841 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!644720 () Bool)

(declare-fun res!417663 () Bool)

(declare-fun e!369397 () Bool)

(assert (=> b!644720 (=> (not res!417663) (not e!369397))))

(declare-datatypes ((List!12375 0))(
  ( (Nil!12372) (Cons!12371 (h!13419 (_ BitVec 64)) (t!18595 List!12375)) )
))
(declare-fun arrayNoDuplicates!0 (array!38433 (_ BitVec 32) List!12375) Bool)

(assert (=> b!644720 (= res!417663 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12372))))

(declare-fun b!644721 () Bool)

(declare-fun res!417679 () Bool)

(assert (=> b!644721 (=> (not res!417679) (not e!369397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38433 (_ BitVec 32)) Bool)

(assert (=> b!644721 (= res!417679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!644722 () Bool)

(declare-fun e!369406 () Unit!21837)

(declare-fun Unit!21839 () Unit!21837)

(assert (=> b!644722 (= e!369406 Unit!21839)))

(assert (=> b!644722 false))

(declare-fun b!644723 () Bool)

(assert (=> b!644723 (= e!369403 e!369397)))

(declare-fun res!417673 () Bool)

(assert (=> b!644723 (=> (not res!417673) (not e!369397))))

(declare-fun lt!298840 () SeekEntryResult!6823)

(assert (=> b!644723 (= res!417673 (or (= lt!298840 (MissingZero!6823 i!1108)) (= lt!298840 (MissingVacant!6823 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38433 (_ BitVec 32)) SeekEntryResult!6823)

(assert (=> b!644723 (= lt!298840 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!644724 () Bool)

(declare-fun res!417668 () Bool)

(assert (=> b!644724 (=> (not res!417668) (not e!369403))))

(assert (=> b!644724 (= res!417668 (validKeyInArray!0 k0!1786))))

(declare-fun b!644725 () Bool)

(declare-fun e!369408 () Bool)

(assert (=> b!644725 (= e!369408 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) index!984))))

(declare-fun b!644726 () Bool)

(declare-fun Unit!21840 () Unit!21837)

(assert (=> b!644726 (= e!369405 Unit!21840)))

(declare-fun b!644727 () Bool)

(assert (=> b!644727 (= e!369397 e!369407)))

(declare-fun res!417678 () Bool)

(assert (=> b!644727 (=> (not res!417678) (not e!369407))))

(assert (=> b!644727 (= res!417678 (= (select (store (arr!18427 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!644727 (= lt!298846 (array!38434 (store (arr!18427 a!2986) i!1108 k0!1786) (size!18791 a!2986)))))

(declare-fun res!417669 () Bool)

(assert (=> start!58398 (=> (not res!417669) (not e!369403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58398 (= res!417669 (validMask!0 mask!3053))))

(assert (=> start!58398 e!369403))

(assert (=> start!58398 true))

(declare-fun array_inv!14286 (array!38433) Bool)

(assert (=> start!58398 (array_inv!14286 a!2986)))

(declare-fun b!644718 () Bool)

(declare-fun e!369401 () Bool)

(assert (=> b!644718 (= e!369411 (not e!369401))))

(declare-fun res!417677 () Bool)

(assert (=> b!644718 (=> res!417677 e!369401)))

(declare-fun lt!298849 () SeekEntryResult!6823)

(assert (=> b!644718 (= res!417677 (not (= lt!298849 (Found!6823 index!984))))))

(declare-fun lt!298837 () Unit!21837)

(assert (=> b!644718 (= lt!298837 e!369406)))

(declare-fun c!73894 () Bool)

(assert (=> b!644718 (= c!73894 (= lt!298849 Undefined!6823))))

(assert (=> b!644718 (= lt!298849 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298844 lt!298846 mask!3053))))

(assert (=> b!644718 e!369402))

(declare-fun res!417675 () Bool)

(assert (=> b!644718 (=> (not res!417675) (not e!369402))))

(declare-fun lt!298845 () (_ BitVec 32))

(assert (=> b!644718 (= res!417675 (= lt!298843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 lt!298844 lt!298846 mask!3053)))))

(assert (=> b!644718 (= lt!298843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!644718 (= lt!298844 (select (store (arr!18427 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298836 () Unit!21837)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21837)

(assert (=> b!644718 (= lt!298836 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!644718 (= lt!298845 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!644728 () Bool)

(assert (=> b!644728 (= e!369401 e!369399)))

(declare-fun res!417672 () Bool)

(assert (=> b!644728 (=> res!417672 e!369399)))

(assert (=> b!644728 (= res!417672 (or (not (= (select (arr!18427 a!2986) j!136) lt!298844)) (not (= (select (arr!18427 a!2986) j!136) lt!298835))))))

(assert (=> b!644728 e!369409))

(declare-fun res!417661 () Bool)

(assert (=> b!644728 (=> (not res!417661) (not e!369409))))

(assert (=> b!644728 (= res!417661 (= lt!298835 (select (arr!18427 a!2986) j!136)))))

(assert (=> b!644728 (= lt!298835 (select (store (arr!18427 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!644729 () Bool)

(assert (=> b!644729 (= e!369400 e!369408)))

(declare-fun res!417670 () Bool)

(assert (=> b!644729 (=> (not res!417670) (not e!369408))))

(assert (=> b!644729 (= res!417670 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) j!136))))

(declare-fun b!644730 () Bool)

(assert (=> b!644730 (= e!369398 (or (bvslt (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000) (bvslt (size!18791 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!644730 e!369410))

(declare-fun res!417667 () Bool)

(assert (=> b!644730 (=> (not res!417667) (not e!369410))))

(assert (=> b!644730 (= res!417667 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) j!136))))

(declare-fun b!644731 () Bool)

(declare-fun Unit!21841 () Unit!21837)

(assert (=> b!644731 (= e!369406 Unit!21841)))

(declare-fun b!644732 () Bool)

(declare-fun res!417662 () Bool)

(assert (=> b!644732 (=> (not res!417662) (not e!369397))))

(assert (=> b!644732 (= res!417662 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18427 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!644733 () Bool)

(declare-fun Unit!21842 () Unit!21837)

(assert (=> b!644733 (= e!369405 Unit!21842)))

(declare-fun lt!298842 () Unit!21837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21837)

(assert (=> b!644733 (= lt!298842 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298846 (select (arr!18427 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!644733 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298848 () Unit!21837)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12375) Unit!21837)

(assert (=> b!644733 (= lt!298848 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12372))))

(assert (=> b!644733 (arrayNoDuplicates!0 lt!298846 #b00000000000000000000000000000000 Nil!12372)))

(declare-fun lt!298838 () Unit!21837)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38433 (_ BitVec 32) (_ BitVec 32)) Unit!21837)

(assert (=> b!644733 (= lt!298838 (lemmaNoDuplicateFromThenFromBigger!0 lt!298846 #b00000000000000000000000000000000 j!136))))

(assert (=> b!644733 (arrayNoDuplicates!0 lt!298846 j!136 Nil!12372)))

(declare-fun lt!298839 () Unit!21837)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38433 (_ BitVec 64) (_ BitVec 32) List!12375) Unit!21837)

(assert (=> b!644733 (= lt!298839 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298846 (select (arr!18427 a!2986) j!136) j!136 Nil!12372))))

(assert (=> b!644733 false))

(declare-fun b!644734 () Bool)

(declare-fun res!417671 () Bool)

(assert (=> b!644734 (=> (not res!417671) (not e!369403))))

(assert (=> b!644734 (= res!417671 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58398 res!417669) b!644715))

(assert (= (and b!644715 res!417674) b!644712))

(assert (= (and b!644712 res!417664) b!644724))

(assert (= (and b!644724 res!417668) b!644734))

(assert (= (and b!644734 res!417671) b!644723))

(assert (= (and b!644723 res!417673) b!644721))

(assert (= (and b!644721 res!417679) b!644720))

(assert (= (and b!644720 res!417663) b!644732))

(assert (= (and b!644732 res!417662) b!644727))

(assert (= (and b!644727 res!417678) b!644719))

(assert (= (and b!644719 res!417676) b!644718))

(assert (= (and b!644718 res!417675) b!644716))

(assert (= (and b!644718 c!73894) b!644722))

(assert (= (and b!644718 (not c!73894)) b!644731))

(assert (= (and b!644718 (not res!417677)) b!644728))

(assert (= (and b!644728 res!417661) b!644717))

(assert (= (and b!644717 (not res!417666)) b!644729))

(assert (= (and b!644729 res!417670) b!644725))

(assert (= (and b!644728 (not res!417672)) b!644714))

(assert (= (and b!644714 c!73895) b!644733))

(assert (= (and b!644714 (not c!73895)) b!644726))

(assert (= (and b!644714 (not res!417665)) b!644730))

(assert (= (and b!644730 res!417667) b!644713))

(declare-fun m!618715 () Bool)

(assert (=> b!644721 m!618715))

(declare-fun m!618717 () Bool)

(assert (=> start!58398 m!618717))

(declare-fun m!618719 () Bool)

(assert (=> start!58398 m!618719))

(declare-fun m!618721 () Bool)

(assert (=> b!644720 m!618721))

(declare-fun m!618723 () Bool)

(assert (=> b!644730 m!618723))

(assert (=> b!644730 m!618723))

(declare-fun m!618725 () Bool)

(assert (=> b!644730 m!618725))

(assert (=> b!644713 m!618723))

(assert (=> b!644713 m!618723))

(declare-fun m!618727 () Bool)

(assert (=> b!644713 m!618727))

(assert (=> b!644725 m!618723))

(assert (=> b!644725 m!618723))

(assert (=> b!644725 m!618727))

(declare-fun m!618729 () Bool)

(assert (=> b!644723 m!618729))

(declare-fun m!618731 () Bool)

(assert (=> b!644734 m!618731))

(declare-fun m!618733 () Bool)

(assert (=> b!644724 m!618733))

(assert (=> b!644717 m!618723))

(assert (=> b!644729 m!618723))

(assert (=> b!644729 m!618723))

(assert (=> b!644729 m!618725))

(declare-fun m!618735 () Bool)

(assert (=> b!644719 m!618735))

(assert (=> b!644719 m!618723))

(assert (=> b!644719 m!618723))

(declare-fun m!618737 () Bool)

(assert (=> b!644719 m!618737))

(declare-fun m!618739 () Bool)

(assert (=> b!644727 m!618739))

(declare-fun m!618741 () Bool)

(assert (=> b!644727 m!618741))

(assert (=> b!644728 m!618723))

(assert (=> b!644728 m!618739))

(declare-fun m!618743 () Bool)

(assert (=> b!644728 m!618743))

(assert (=> b!644712 m!618723))

(assert (=> b!644712 m!618723))

(declare-fun m!618745 () Bool)

(assert (=> b!644712 m!618745))

(declare-fun m!618747 () Bool)

(assert (=> b!644732 m!618747))

(assert (=> b!644733 m!618723))

(declare-fun m!618749 () Bool)

(assert (=> b!644733 m!618749))

(assert (=> b!644733 m!618723))

(declare-fun m!618751 () Bool)

(assert (=> b!644733 m!618751))

(declare-fun m!618753 () Bool)

(assert (=> b!644733 m!618753))

(declare-fun m!618755 () Bool)

(assert (=> b!644733 m!618755))

(assert (=> b!644733 m!618723))

(declare-fun m!618757 () Bool)

(assert (=> b!644733 m!618757))

(assert (=> b!644733 m!618723))

(declare-fun m!618759 () Bool)

(assert (=> b!644733 m!618759))

(declare-fun m!618761 () Bool)

(assert (=> b!644733 m!618761))

(declare-fun m!618763 () Bool)

(assert (=> b!644718 m!618763))

(declare-fun m!618765 () Bool)

(assert (=> b!644718 m!618765))

(assert (=> b!644718 m!618723))

(declare-fun m!618767 () Bool)

(assert (=> b!644718 m!618767))

(assert (=> b!644718 m!618723))

(assert (=> b!644718 m!618739))

(declare-fun m!618769 () Bool)

(assert (=> b!644718 m!618769))

(declare-fun m!618771 () Bool)

(assert (=> b!644718 m!618771))

(declare-fun m!618773 () Bool)

(assert (=> b!644718 m!618773))

(check-sat (not b!644724) (not b!644719) (not b!644720) (not b!644712) (not b!644723) (not b!644734) (not b!644725) (not start!58398) (not b!644718) (not b!644713) (not b!644721) (not b!644730) (not b!644729) (not b!644733))
(check-sat)
(get-model)

(declare-fun b!644885 () Bool)

(declare-fun e!369508 () SeekEntryResult!6823)

(declare-fun e!369509 () SeekEntryResult!6823)

(assert (=> b!644885 (= e!369508 e!369509)))

(declare-fun lt!298946 () (_ BitVec 64))

(declare-fun lt!298948 () SeekEntryResult!6823)

(assert (=> b!644885 (= lt!298946 (select (arr!18427 a!2986) (index!29626 lt!298948)))))

(declare-fun c!73915 () Bool)

(assert (=> b!644885 (= c!73915 (= lt!298946 k0!1786))))

(declare-fun b!644886 () Bool)

(declare-fun c!73914 () Bool)

(assert (=> b!644886 (= c!73914 (= lt!298946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369510 () SeekEntryResult!6823)

(assert (=> b!644886 (= e!369509 e!369510)))

(declare-fun b!644887 () Bool)

(assert (=> b!644887 (= e!369509 (Found!6823 (index!29626 lt!298948)))))

(declare-fun b!644888 () Bool)

(assert (=> b!644888 (= e!369510 (seekKeyOrZeroReturnVacant!0 (x!58546 lt!298948) (index!29626 lt!298948) (index!29626 lt!298948) k0!1786 a!2986 mask!3053))))

(declare-fun d!91193 () Bool)

(declare-fun lt!298947 () SeekEntryResult!6823)

(get-info :version)

(assert (=> d!91193 (and (or ((_ is Undefined!6823) lt!298947) (not ((_ is Found!6823) lt!298947)) (and (bvsge (index!29625 lt!298947) #b00000000000000000000000000000000) (bvslt (index!29625 lt!298947) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!298947) ((_ is Found!6823) lt!298947) (not ((_ is MissingZero!6823) lt!298947)) (and (bvsge (index!29624 lt!298947) #b00000000000000000000000000000000) (bvslt (index!29624 lt!298947) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!298947) ((_ is Found!6823) lt!298947) ((_ is MissingZero!6823) lt!298947) (not ((_ is MissingVacant!6823) lt!298947)) (and (bvsge (index!29627 lt!298947) #b00000000000000000000000000000000) (bvslt (index!29627 lt!298947) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!298947) (ite ((_ is Found!6823) lt!298947) (= (select (arr!18427 a!2986) (index!29625 lt!298947)) k0!1786) (ite ((_ is MissingZero!6823) lt!298947) (= (select (arr!18427 a!2986) (index!29624 lt!298947)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6823) lt!298947) (= (select (arr!18427 a!2986) (index!29627 lt!298947)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91193 (= lt!298947 e!369508)))

(declare-fun c!73916 () Bool)

(assert (=> d!91193 (= c!73916 (and ((_ is Intermediate!6823) lt!298948) (undefined!7635 lt!298948)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38433 (_ BitVec 32)) SeekEntryResult!6823)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91193 (= lt!298948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91193 (validMask!0 mask!3053)))

(assert (=> d!91193 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!298947)))

(declare-fun b!644889 () Bool)

(assert (=> b!644889 (= e!369508 Undefined!6823)))

(declare-fun b!644890 () Bool)

(assert (=> b!644890 (= e!369510 (MissingZero!6823 (index!29626 lt!298948)))))

(assert (= (and d!91193 c!73916) b!644889))

(assert (= (and d!91193 (not c!73916)) b!644885))

(assert (= (and b!644885 c!73915) b!644887))

(assert (= (and b!644885 (not c!73915)) b!644886))

(assert (= (and b!644886 c!73914) b!644890))

(assert (= (and b!644886 (not c!73914)) b!644888))

(declare-fun m!618895 () Bool)

(assert (=> b!644885 m!618895))

(declare-fun m!618897 () Bool)

(assert (=> b!644888 m!618897))

(declare-fun m!618899 () Bool)

(assert (=> d!91193 m!618899))

(declare-fun m!618901 () Bool)

(assert (=> d!91193 m!618901))

(assert (=> d!91193 m!618717))

(declare-fun m!618903 () Bool)

(assert (=> d!91193 m!618903))

(assert (=> d!91193 m!618901))

(declare-fun m!618905 () Bool)

(assert (=> d!91193 m!618905))

(declare-fun m!618907 () Bool)

(assert (=> d!91193 m!618907))

(assert (=> b!644723 d!91193))

(declare-fun d!91195 () Bool)

(assert (=> d!91195 (= (validKeyInArray!0 (select (arr!18427 a!2986) j!136)) (and (not (= (select (arr!18427 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18427 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644712 d!91195))

(declare-fun d!91197 () Bool)

(declare-fun res!417798 () Bool)

(declare-fun e!369515 () Bool)

(assert (=> d!91197 (=> res!417798 e!369515)))

(assert (=> d!91197 (= res!417798 (= (select (arr!18427 lt!298846) index!984) (select (arr!18427 a!2986) j!136)))))

(assert (=> d!91197 (= (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) index!984) e!369515)))

(declare-fun b!644895 () Bool)

(declare-fun e!369516 () Bool)

(assert (=> b!644895 (= e!369515 e!369516)))

(declare-fun res!417799 () Bool)

(assert (=> b!644895 (=> (not res!417799) (not e!369516))))

(assert (=> b!644895 (= res!417799 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18791 lt!298846)))))

(declare-fun b!644896 () Bool)

(assert (=> b!644896 (= e!369516 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91197 (not res!417798)) b!644895))

(assert (= (and b!644895 res!417799) b!644896))

(declare-fun m!618909 () Bool)

(assert (=> d!91197 m!618909))

(assert (=> b!644896 m!618723))

(declare-fun m!618911 () Bool)

(assert (=> b!644896 m!618911))

(assert (=> b!644713 d!91197))

(declare-fun d!91199 () Bool)

(declare-fun res!417800 () Bool)

(declare-fun e!369517 () Bool)

(assert (=> d!91199 (=> res!417800 e!369517)))

(assert (=> d!91199 (= res!417800 (= (select (arr!18427 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91199 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!369517)))

(declare-fun b!644897 () Bool)

(declare-fun e!369518 () Bool)

(assert (=> b!644897 (= e!369517 e!369518)))

(declare-fun res!417801 () Bool)

(assert (=> b!644897 (=> (not res!417801) (not e!369518))))

(assert (=> b!644897 (= res!417801 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18791 a!2986)))))

(declare-fun b!644898 () Bool)

(assert (=> b!644898 (= e!369518 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91199 (not res!417800)) b!644897))

(assert (= (and b!644897 res!417801) b!644898))

(declare-fun m!618913 () Bool)

(assert (=> d!91199 m!618913))

(declare-fun m!618915 () Bool)

(assert (=> b!644898 m!618915))

(assert (=> b!644734 d!91199))

(declare-fun b!644909 () Bool)

(declare-fun e!369528 () Bool)

(declare-fun call!33618 () Bool)

(assert (=> b!644909 (= e!369528 call!33618)))

(declare-fun c!73919 () Bool)

(declare-fun bm!33615 () Bool)

(assert (=> bm!33615 (= call!33618 (arrayNoDuplicates!0 lt!298846 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73919 (Cons!12371 (select (arr!18427 lt!298846) j!136) Nil!12372) Nil!12372)))))

(declare-fun b!644910 () Bool)

(assert (=> b!644910 (= e!369528 call!33618)))

(declare-fun b!644911 () Bool)

(declare-fun e!369527 () Bool)

(assert (=> b!644911 (= e!369527 e!369528)))

(assert (=> b!644911 (= c!73919 (validKeyInArray!0 (select (arr!18427 lt!298846) j!136)))))

(declare-fun b!644912 () Bool)

(declare-fun e!369530 () Bool)

(assert (=> b!644912 (= e!369530 e!369527)))

(declare-fun res!417810 () Bool)

(assert (=> b!644912 (=> (not res!417810) (not e!369527))))

(declare-fun e!369529 () Bool)

(assert (=> b!644912 (= res!417810 (not e!369529))))

(declare-fun res!417808 () Bool)

(assert (=> b!644912 (=> (not res!417808) (not e!369529))))

(assert (=> b!644912 (= res!417808 (validKeyInArray!0 (select (arr!18427 lt!298846) j!136)))))

(declare-fun b!644913 () Bool)

(declare-fun contains!3123 (List!12375 (_ BitVec 64)) Bool)

(assert (=> b!644913 (= e!369529 (contains!3123 Nil!12372 (select (arr!18427 lt!298846) j!136)))))

(declare-fun d!91201 () Bool)

(declare-fun res!417809 () Bool)

(assert (=> d!91201 (=> res!417809 e!369530)))

(assert (=> d!91201 (= res!417809 (bvsge j!136 (size!18791 lt!298846)))))

(assert (=> d!91201 (= (arrayNoDuplicates!0 lt!298846 j!136 Nil!12372) e!369530)))

(assert (= (and d!91201 (not res!417809)) b!644912))

(assert (= (and b!644912 res!417808) b!644913))

(assert (= (and b!644912 res!417810) b!644911))

(assert (= (and b!644911 c!73919) b!644909))

(assert (= (and b!644911 (not c!73919)) b!644910))

(assert (= (or b!644909 b!644910) bm!33615))

(declare-fun m!618917 () Bool)

(assert (=> bm!33615 m!618917))

(declare-fun m!618919 () Bool)

(assert (=> bm!33615 m!618919))

(assert (=> b!644911 m!618917))

(assert (=> b!644911 m!618917))

(declare-fun m!618921 () Bool)

(assert (=> b!644911 m!618921))

(assert (=> b!644912 m!618917))

(assert (=> b!644912 m!618917))

(assert (=> b!644912 m!618921))

(assert (=> b!644913 m!618917))

(assert (=> b!644913 m!618917))

(declare-fun m!618923 () Bool)

(assert (=> b!644913 m!618923))

(assert (=> b!644733 d!91201))

(declare-fun d!91203 () Bool)

(assert (=> d!91203 (arrayNoDuplicates!0 lt!298846 j!136 Nil!12372)))

(declare-fun lt!298951 () Unit!21837)

(declare-fun choose!39 (array!38433 (_ BitVec 32) (_ BitVec 32)) Unit!21837)

(assert (=> d!91203 (= lt!298951 (choose!39 lt!298846 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91203 (bvslt (size!18791 lt!298846) #b01111111111111111111111111111111)))

(assert (=> d!91203 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!298846 #b00000000000000000000000000000000 j!136) lt!298951)))

(declare-fun bs!19289 () Bool)

(assert (= bs!19289 d!91203))

(assert (=> bs!19289 m!618753))

(declare-fun m!618925 () Bool)

(assert (=> bs!19289 m!618925))

(assert (=> b!644733 d!91203))

(declare-fun d!91205 () Bool)

(assert (=> d!91205 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18791 lt!298846)) (not (= (select (arr!18427 lt!298846) j!136) (select (arr!18427 a!2986) j!136))))))

(declare-fun lt!298954 () Unit!21837)

(declare-fun choose!21 (array!38433 (_ BitVec 64) (_ BitVec 32) List!12375) Unit!21837)

(assert (=> d!91205 (= lt!298954 (choose!21 lt!298846 (select (arr!18427 a!2986) j!136) j!136 Nil!12372))))

(assert (=> d!91205 (bvslt (size!18791 lt!298846) #b01111111111111111111111111111111)))

(assert (=> d!91205 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298846 (select (arr!18427 a!2986) j!136) j!136 Nil!12372) lt!298954)))

(declare-fun bs!19290 () Bool)

(assert (= bs!19290 d!91205))

(assert (=> bs!19290 m!618917))

(assert (=> bs!19290 m!618723))

(declare-fun m!618927 () Bool)

(assert (=> bs!19290 m!618927))

(assert (=> b!644733 d!91205))

(declare-fun d!91207 () Bool)

(declare-fun e!369533 () Bool)

(assert (=> d!91207 e!369533))

(declare-fun res!417813 () Bool)

(assert (=> d!91207 (=> (not res!417813) (not e!369533))))

(assert (=> d!91207 (= res!417813 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18791 a!2986))))))

(declare-fun lt!298957 () Unit!21837)

(declare-fun choose!41 (array!38433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12375) Unit!21837)

(assert (=> d!91207 (= lt!298957 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12372))))

(assert (=> d!91207 (bvslt (size!18791 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91207 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12372) lt!298957)))

(declare-fun b!644916 () Bool)

(assert (=> b!644916 (= e!369533 (arrayNoDuplicates!0 (array!38434 (store (arr!18427 a!2986) i!1108 k0!1786) (size!18791 a!2986)) #b00000000000000000000000000000000 Nil!12372))))

(assert (= (and d!91207 res!417813) b!644916))

(declare-fun m!618929 () Bool)

(assert (=> d!91207 m!618929))

(assert (=> b!644916 m!618739))

(declare-fun m!618931 () Bool)

(assert (=> b!644916 m!618931))

(assert (=> b!644733 d!91207))

(declare-fun d!91209 () Bool)

(assert (=> d!91209 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298960 () Unit!21837)

(declare-fun choose!114 (array!38433 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21837)

(assert (=> d!91209 (= lt!298960 (choose!114 lt!298846 (select (arr!18427 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91209 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91209 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298846 (select (arr!18427 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298960)))

(declare-fun bs!19291 () Bool)

(assert (= bs!19291 d!91209))

(assert (=> bs!19291 m!618723))

(assert (=> bs!19291 m!618757))

(assert (=> bs!19291 m!618723))

(declare-fun m!618933 () Bool)

(assert (=> bs!19291 m!618933))

(assert (=> b!644733 d!91209))

(declare-fun b!644917 () Bool)

(declare-fun e!369535 () Bool)

(declare-fun call!33619 () Bool)

(assert (=> b!644917 (= e!369535 call!33619)))

(declare-fun bm!33616 () Bool)

(declare-fun c!73920 () Bool)

(assert (=> bm!33616 (= call!33619 (arrayNoDuplicates!0 lt!298846 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73920 (Cons!12371 (select (arr!18427 lt!298846) #b00000000000000000000000000000000) Nil!12372) Nil!12372)))))

(declare-fun b!644918 () Bool)

(assert (=> b!644918 (= e!369535 call!33619)))

(declare-fun b!644919 () Bool)

(declare-fun e!369534 () Bool)

(assert (=> b!644919 (= e!369534 e!369535)))

(assert (=> b!644919 (= c!73920 (validKeyInArray!0 (select (arr!18427 lt!298846) #b00000000000000000000000000000000)))))

(declare-fun b!644920 () Bool)

(declare-fun e!369537 () Bool)

(assert (=> b!644920 (= e!369537 e!369534)))

(declare-fun res!417816 () Bool)

(assert (=> b!644920 (=> (not res!417816) (not e!369534))))

(declare-fun e!369536 () Bool)

(assert (=> b!644920 (= res!417816 (not e!369536))))

(declare-fun res!417814 () Bool)

(assert (=> b!644920 (=> (not res!417814) (not e!369536))))

(assert (=> b!644920 (= res!417814 (validKeyInArray!0 (select (arr!18427 lt!298846) #b00000000000000000000000000000000)))))

(declare-fun b!644921 () Bool)

(assert (=> b!644921 (= e!369536 (contains!3123 Nil!12372 (select (arr!18427 lt!298846) #b00000000000000000000000000000000)))))

(declare-fun d!91213 () Bool)

(declare-fun res!417815 () Bool)

(assert (=> d!91213 (=> res!417815 e!369537)))

(assert (=> d!91213 (= res!417815 (bvsge #b00000000000000000000000000000000 (size!18791 lt!298846)))))

(assert (=> d!91213 (= (arrayNoDuplicates!0 lt!298846 #b00000000000000000000000000000000 Nil!12372) e!369537)))

(assert (= (and d!91213 (not res!417815)) b!644920))

(assert (= (and b!644920 res!417814) b!644921))

(assert (= (and b!644920 res!417816) b!644919))

(assert (= (and b!644919 c!73920) b!644917))

(assert (= (and b!644919 (not c!73920)) b!644918))

(assert (= (or b!644917 b!644918) bm!33616))

(declare-fun m!618935 () Bool)

(assert (=> bm!33616 m!618935))

(declare-fun m!618937 () Bool)

(assert (=> bm!33616 m!618937))

(assert (=> b!644919 m!618935))

(assert (=> b!644919 m!618935))

(declare-fun m!618939 () Bool)

(assert (=> b!644919 m!618939))

(assert (=> b!644920 m!618935))

(assert (=> b!644920 m!618935))

(assert (=> b!644920 m!618939))

(assert (=> b!644921 m!618935))

(assert (=> b!644921 m!618935))

(declare-fun m!618941 () Bool)

(assert (=> b!644921 m!618941))

(assert (=> b!644733 d!91213))

(declare-fun d!91217 () Bool)

(declare-fun res!417821 () Bool)

(declare-fun e!369542 () Bool)

(assert (=> d!91217 (=> res!417821 e!369542)))

(assert (=> d!91217 (= res!417821 (= (select (arr!18427 lt!298846) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18427 a!2986) j!136)))))

(assert (=> d!91217 (= (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!369542)))

(declare-fun b!644926 () Bool)

(declare-fun e!369543 () Bool)

(assert (=> b!644926 (= e!369542 e!369543)))

(declare-fun res!417822 () Bool)

(assert (=> b!644926 (=> (not res!417822) (not e!369543))))

(assert (=> b!644926 (= res!417822 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18791 lt!298846)))))

(declare-fun b!644927 () Bool)

(assert (=> b!644927 (= e!369543 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91217 (not res!417821)) b!644926))

(assert (= (and b!644926 res!417822) b!644927))

(declare-fun m!618943 () Bool)

(assert (=> d!91217 m!618943))

(assert (=> b!644927 m!618723))

(declare-fun m!618945 () Bool)

(assert (=> b!644927 m!618945))

(assert (=> b!644733 d!91217))

(declare-fun d!91219 () Bool)

(assert (=> d!91219 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58398 d!91219))

(declare-fun d!91229 () Bool)

(assert (=> d!91229 (= (array_inv!14286 a!2986) (bvsge (size!18791 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58398 d!91229))

(declare-fun d!91231 () Bool)

(assert (=> d!91231 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!644724 d!91231))

(assert (=> b!644725 d!91197))

(declare-fun lt!298984 () SeekEntryResult!6823)

(declare-fun d!91233 () Bool)

(assert (=> d!91233 (and (or ((_ is Undefined!6823) lt!298984) (not ((_ is Found!6823) lt!298984)) (and (bvsge (index!29625 lt!298984) #b00000000000000000000000000000000) (bvslt (index!29625 lt!298984) (size!18791 lt!298846)))) (or ((_ is Undefined!6823) lt!298984) ((_ is Found!6823) lt!298984) (not ((_ is MissingVacant!6823) lt!298984)) (not (= (index!29627 lt!298984) vacantSpotIndex!68)) (and (bvsge (index!29627 lt!298984) #b00000000000000000000000000000000) (bvslt (index!29627 lt!298984) (size!18791 lt!298846)))) (or ((_ is Undefined!6823) lt!298984) (ite ((_ is Found!6823) lt!298984) (= (select (arr!18427 lt!298846) (index!29625 lt!298984)) lt!298844) (and ((_ is MissingVacant!6823) lt!298984) (= (index!29627 lt!298984) vacantSpotIndex!68) (= (select (arr!18427 lt!298846) (index!29627 lt!298984)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369573 () SeekEntryResult!6823)

(assert (=> d!91233 (= lt!298984 e!369573)))

(declare-fun c!73938 () Bool)

(assert (=> d!91233 (= c!73938 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!298985 () (_ BitVec 64))

(assert (=> d!91233 (= lt!298985 (select (arr!18427 lt!298846) lt!298845))))

(assert (=> d!91233 (validMask!0 mask!3053)))

(assert (=> d!91233 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 lt!298844 lt!298846 mask!3053) lt!298984)))

(declare-fun e!369572 () SeekEntryResult!6823)

(declare-fun b!644971 () Bool)

(assert (=> b!644971 (= e!369572 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298845 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!298844 lt!298846 mask!3053))))

(declare-fun b!644972 () Bool)

(declare-fun c!73936 () Bool)

(assert (=> b!644972 (= c!73936 (= lt!298985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369574 () SeekEntryResult!6823)

(assert (=> b!644972 (= e!369574 e!369572)))

(declare-fun b!644973 () Bool)

(assert (=> b!644973 (= e!369573 e!369574)))

(declare-fun c!73937 () Bool)

(assert (=> b!644973 (= c!73937 (= lt!298985 lt!298844))))

(declare-fun b!644974 () Bool)

(assert (=> b!644974 (= e!369574 (Found!6823 lt!298845))))

(declare-fun b!644975 () Bool)

(assert (=> b!644975 (= e!369573 Undefined!6823)))

(declare-fun b!644976 () Bool)

(assert (=> b!644976 (= e!369572 (MissingVacant!6823 vacantSpotIndex!68))))

(assert (= (and d!91233 c!73938) b!644975))

(assert (= (and d!91233 (not c!73938)) b!644973))

(assert (= (and b!644973 c!73937) b!644974))

(assert (= (and b!644973 (not c!73937)) b!644972))

(assert (= (and b!644972 c!73936) b!644976))

(assert (= (and b!644972 (not c!73936)) b!644971))

(declare-fun m!618973 () Bool)

(assert (=> d!91233 m!618973))

(declare-fun m!618975 () Bool)

(assert (=> d!91233 m!618975))

(declare-fun m!618977 () Bool)

(assert (=> d!91233 m!618977))

(assert (=> d!91233 m!618717))

(declare-fun m!618979 () Bool)

(assert (=> b!644971 m!618979))

(assert (=> b!644971 m!618979))

(declare-fun m!618981 () Bool)

(assert (=> b!644971 m!618981))

(assert (=> b!644718 d!91233))

(declare-fun d!91245 () Bool)

(declare-fun e!369612 () Bool)

(assert (=> d!91245 e!369612))

(declare-fun res!417858 () Bool)

(assert (=> d!91245 (=> (not res!417858) (not e!369612))))

(assert (=> d!91245 (= res!417858 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18791 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18791 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18791 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18791 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18791 a!2986))))))

(declare-fun lt!299003 () Unit!21837)

(declare-fun choose!9 (array!38433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21837)

(assert (=> d!91245 (= lt!299003 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91245 (validMask!0 mask!3053)))

(assert (=> d!91245 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 mask!3053) lt!299003)))

(declare-fun b!645029 () Bool)

(assert (=> b!645029 (= e!369612 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 (select (store (arr!18427 a!2986) i!1108 k0!1786) j!136) (array!38434 (store (arr!18427 a!2986) i!1108 k0!1786) (size!18791 a!2986)) mask!3053)))))

(assert (= (and d!91245 res!417858) b!645029))

(declare-fun m!619033 () Bool)

(assert (=> d!91245 m!619033))

(assert (=> d!91245 m!618717))

(assert (=> b!645029 m!618739))

(assert (=> b!645029 m!618765))

(declare-fun m!619037 () Bool)

(assert (=> b!645029 m!619037))

(assert (=> b!645029 m!618723))

(assert (=> b!645029 m!618767))

(assert (=> b!645029 m!618765))

(assert (=> b!645029 m!618723))

(assert (=> b!644718 d!91245))

(declare-fun d!91265 () Bool)

(declare-fun lt!299004 () SeekEntryResult!6823)

(assert (=> d!91265 (and (or ((_ is Undefined!6823) lt!299004) (not ((_ is Found!6823) lt!299004)) (and (bvsge (index!29625 lt!299004) #b00000000000000000000000000000000) (bvslt (index!29625 lt!299004) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!299004) ((_ is Found!6823) lt!299004) (not ((_ is MissingVacant!6823) lt!299004)) (not (= (index!29627 lt!299004) vacantSpotIndex!68)) (and (bvsge (index!29627 lt!299004) #b00000000000000000000000000000000) (bvslt (index!29627 lt!299004) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!299004) (ite ((_ is Found!6823) lt!299004) (= (select (arr!18427 a!2986) (index!29625 lt!299004)) (select (arr!18427 a!2986) j!136)) (and ((_ is MissingVacant!6823) lt!299004) (= (index!29627 lt!299004) vacantSpotIndex!68) (= (select (arr!18427 a!2986) (index!29627 lt!299004)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369614 () SeekEntryResult!6823)

(assert (=> d!91265 (= lt!299004 e!369614)))

(declare-fun c!73956 () Bool)

(assert (=> d!91265 (= c!73956 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!299005 () (_ BitVec 64))

(assert (=> d!91265 (= lt!299005 (select (arr!18427 a!2986) lt!298845))))

(assert (=> d!91265 (validMask!0 mask!3053)))

(assert (=> d!91265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298845 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053) lt!299004)))

(declare-fun e!369613 () SeekEntryResult!6823)

(declare-fun b!645030 () Bool)

(assert (=> b!645030 (= e!369613 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!298845 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645031 () Bool)

(declare-fun c!73954 () Bool)

(assert (=> b!645031 (= c!73954 (= lt!299005 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369615 () SeekEntryResult!6823)

(assert (=> b!645031 (= e!369615 e!369613)))

(declare-fun b!645032 () Bool)

(assert (=> b!645032 (= e!369614 e!369615)))

(declare-fun c!73955 () Bool)

(assert (=> b!645032 (= c!73955 (= lt!299005 (select (arr!18427 a!2986) j!136)))))

(declare-fun b!645033 () Bool)

(assert (=> b!645033 (= e!369615 (Found!6823 lt!298845))))

(declare-fun b!645034 () Bool)

(assert (=> b!645034 (= e!369614 Undefined!6823)))

(declare-fun b!645035 () Bool)

(assert (=> b!645035 (= e!369613 (MissingVacant!6823 vacantSpotIndex!68))))

(assert (= (and d!91265 c!73956) b!645034))

(assert (= (and d!91265 (not c!73956)) b!645032))

(assert (= (and b!645032 c!73955) b!645033))

(assert (= (and b!645032 (not c!73955)) b!645031))

(assert (= (and b!645031 c!73954) b!645035))

(assert (= (and b!645031 (not c!73954)) b!645030))

(declare-fun m!619039 () Bool)

(assert (=> d!91265 m!619039))

(declare-fun m!619041 () Bool)

(assert (=> d!91265 m!619041))

(declare-fun m!619043 () Bool)

(assert (=> d!91265 m!619043))

(assert (=> d!91265 m!618717))

(assert (=> b!645030 m!618979))

(assert (=> b!645030 m!618979))

(assert (=> b!645030 m!618723))

(declare-fun m!619049 () Bool)

(assert (=> b!645030 m!619049))

(assert (=> b!644718 d!91265))

(declare-fun lt!299006 () SeekEntryResult!6823)

(declare-fun d!91267 () Bool)

(assert (=> d!91267 (and (or ((_ is Undefined!6823) lt!299006) (not ((_ is Found!6823) lt!299006)) (and (bvsge (index!29625 lt!299006) #b00000000000000000000000000000000) (bvslt (index!29625 lt!299006) (size!18791 lt!298846)))) (or ((_ is Undefined!6823) lt!299006) ((_ is Found!6823) lt!299006) (not ((_ is MissingVacant!6823) lt!299006)) (not (= (index!29627 lt!299006) vacantSpotIndex!68)) (and (bvsge (index!29627 lt!299006) #b00000000000000000000000000000000) (bvslt (index!29627 lt!299006) (size!18791 lt!298846)))) (or ((_ is Undefined!6823) lt!299006) (ite ((_ is Found!6823) lt!299006) (= (select (arr!18427 lt!298846) (index!29625 lt!299006)) lt!298844) (and ((_ is MissingVacant!6823) lt!299006) (= (index!29627 lt!299006) vacantSpotIndex!68) (= (select (arr!18427 lt!298846) (index!29627 lt!299006)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369621 () SeekEntryResult!6823)

(assert (=> d!91267 (= lt!299006 e!369621)))

(declare-fun c!73960 () Bool)

(assert (=> d!91267 (= c!73960 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!299007 () (_ BitVec 64))

(assert (=> d!91267 (= lt!299007 (select (arr!18427 lt!298846) index!984))))

(assert (=> d!91267 (validMask!0 mask!3053)))

(assert (=> d!91267 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298844 lt!298846 mask!3053) lt!299006)))

(declare-fun b!645041 () Bool)

(declare-fun e!369620 () SeekEntryResult!6823)

(assert (=> b!645041 (= e!369620 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!298844 lt!298846 mask!3053))))

(declare-fun b!645042 () Bool)

(declare-fun c!73958 () Bool)

(assert (=> b!645042 (= c!73958 (= lt!299007 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369622 () SeekEntryResult!6823)

(assert (=> b!645042 (= e!369622 e!369620)))

(declare-fun b!645043 () Bool)

(assert (=> b!645043 (= e!369621 e!369622)))

(declare-fun c!73959 () Bool)

(assert (=> b!645043 (= c!73959 (= lt!299007 lt!298844))))

(declare-fun b!645044 () Bool)

(assert (=> b!645044 (= e!369622 (Found!6823 index!984))))

(declare-fun b!645045 () Bool)

(assert (=> b!645045 (= e!369621 Undefined!6823)))

(declare-fun b!645046 () Bool)

(assert (=> b!645046 (= e!369620 (MissingVacant!6823 vacantSpotIndex!68))))

(assert (= (and d!91267 c!73960) b!645045))

(assert (= (and d!91267 (not c!73960)) b!645043))

(assert (= (and b!645043 c!73959) b!645044))

(assert (= (and b!645043 (not c!73959)) b!645042))

(assert (= (and b!645042 c!73958) b!645046))

(assert (= (and b!645042 (not c!73958)) b!645041))

(declare-fun m!619055 () Bool)

(assert (=> d!91267 m!619055))

(declare-fun m!619057 () Bool)

(assert (=> d!91267 m!619057))

(assert (=> d!91267 m!618909))

(assert (=> d!91267 m!618717))

(declare-fun m!619059 () Bool)

(assert (=> b!645041 m!619059))

(assert (=> b!645041 m!619059))

(declare-fun m!619061 () Bool)

(assert (=> b!645041 m!619061))

(assert (=> b!644718 d!91267))

(declare-fun d!91271 () Bool)

(declare-fun lt!299012 () (_ BitVec 32))

(assert (=> d!91271 (and (bvsge lt!299012 #b00000000000000000000000000000000) (bvslt lt!299012 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91271 (= lt!299012 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!91271 (validMask!0 mask!3053)))

(assert (=> d!91271 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!299012)))

(declare-fun bs!19296 () Bool)

(assert (= bs!19296 d!91271))

(declare-fun m!619065 () Bool)

(assert (=> bs!19296 m!619065))

(assert (=> bs!19296 m!618717))

(assert (=> b!644718 d!91271))

(declare-fun d!91275 () Bool)

(declare-fun res!417871 () Bool)

(declare-fun e!369632 () Bool)

(assert (=> d!91275 (=> res!417871 e!369632)))

(assert (=> d!91275 (= res!417871 (= (select (arr!18427 lt!298846) j!136) (select (arr!18427 a!2986) j!136)))))

(assert (=> d!91275 (= (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) j!136) e!369632)))

(declare-fun b!645056 () Bool)

(declare-fun e!369633 () Bool)

(assert (=> b!645056 (= e!369632 e!369633)))

(declare-fun res!417872 () Bool)

(assert (=> b!645056 (=> (not res!417872) (not e!369633))))

(assert (=> b!645056 (= res!417872 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18791 lt!298846)))))

(declare-fun b!645057 () Bool)

(assert (=> b!645057 (= e!369633 (arrayContainsKey!0 lt!298846 (select (arr!18427 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91275 (not res!417871)) b!645056))

(assert (= (and b!645056 res!417872) b!645057))

(assert (=> d!91275 m!618917))

(assert (=> b!645057 m!618723))

(declare-fun m!619071 () Bool)

(assert (=> b!645057 m!619071))

(assert (=> b!644729 d!91275))

(declare-fun b!645058 () Bool)

(declare-fun e!369635 () Bool)

(declare-fun call!33630 () Bool)

(assert (=> b!645058 (= e!369635 call!33630)))

(declare-fun bm!33627 () Bool)

(declare-fun c!73961 () Bool)

(assert (=> bm!33627 (= call!33630 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73961 (Cons!12371 (select (arr!18427 a!2986) #b00000000000000000000000000000000) Nil!12372) Nil!12372)))))

(declare-fun b!645059 () Bool)

(assert (=> b!645059 (= e!369635 call!33630)))

(declare-fun b!645060 () Bool)

(declare-fun e!369634 () Bool)

(assert (=> b!645060 (= e!369634 e!369635)))

(assert (=> b!645060 (= c!73961 (validKeyInArray!0 (select (arr!18427 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645061 () Bool)

(declare-fun e!369637 () Bool)

(assert (=> b!645061 (= e!369637 e!369634)))

(declare-fun res!417875 () Bool)

(assert (=> b!645061 (=> (not res!417875) (not e!369634))))

(declare-fun e!369636 () Bool)

(assert (=> b!645061 (= res!417875 (not e!369636))))

(declare-fun res!417873 () Bool)

(assert (=> b!645061 (=> (not res!417873) (not e!369636))))

(assert (=> b!645061 (= res!417873 (validKeyInArray!0 (select (arr!18427 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645062 () Bool)

(assert (=> b!645062 (= e!369636 (contains!3123 Nil!12372 (select (arr!18427 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91279 () Bool)

(declare-fun res!417874 () Bool)

(assert (=> d!91279 (=> res!417874 e!369637)))

(assert (=> d!91279 (= res!417874 (bvsge #b00000000000000000000000000000000 (size!18791 a!2986)))))

(assert (=> d!91279 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12372) e!369637)))

(assert (= (and d!91279 (not res!417874)) b!645061))

(assert (= (and b!645061 res!417873) b!645062))

(assert (= (and b!645061 res!417875) b!645060))

(assert (= (and b!645060 c!73961) b!645058))

(assert (= (and b!645060 (not c!73961)) b!645059))

(assert (= (or b!645058 b!645059) bm!33627))

(assert (=> bm!33627 m!618913))

(declare-fun m!619073 () Bool)

(assert (=> bm!33627 m!619073))

(assert (=> b!645060 m!618913))

(assert (=> b!645060 m!618913))

(declare-fun m!619075 () Bool)

(assert (=> b!645060 m!619075))

(assert (=> b!645061 m!618913))

(assert (=> b!645061 m!618913))

(assert (=> b!645061 m!619075))

(assert (=> b!645062 m!618913))

(assert (=> b!645062 m!618913))

(declare-fun m!619077 () Bool)

(assert (=> b!645062 m!619077))

(assert (=> b!644720 d!91279))

(declare-fun b!645071 () Bool)

(declare-fun e!369644 () Bool)

(declare-fun call!33633 () Bool)

(assert (=> b!645071 (= e!369644 call!33633)))

(declare-fun b!645072 () Bool)

(declare-fun e!369645 () Bool)

(assert (=> b!645072 (= e!369645 call!33633)))

(declare-fun bm!33630 () Bool)

(assert (=> bm!33630 (= call!33633 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!645073 () Bool)

(declare-fun e!369646 () Bool)

(assert (=> b!645073 (= e!369646 e!369645)))

(declare-fun c!73964 () Bool)

(assert (=> b!645073 (= c!73964 (validKeyInArray!0 (select (arr!18427 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!645074 () Bool)

(assert (=> b!645074 (= e!369645 e!369644)))

(declare-fun lt!299021 () (_ BitVec 64))

(assert (=> b!645074 (= lt!299021 (select (arr!18427 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299020 () Unit!21837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38433 (_ BitVec 64) (_ BitVec 32)) Unit!21837)

(assert (=> b!645074 (= lt!299020 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299021 #b00000000000000000000000000000000))))

(assert (=> b!645074 (arrayContainsKey!0 a!2986 lt!299021 #b00000000000000000000000000000000)))

(declare-fun lt!299022 () Unit!21837)

(assert (=> b!645074 (= lt!299022 lt!299020)))

(declare-fun res!417881 () Bool)

(assert (=> b!645074 (= res!417881 (= (seekEntryOrOpen!0 (select (arr!18427 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6823 #b00000000000000000000000000000000)))))

(assert (=> b!645074 (=> (not res!417881) (not e!369644))))

(declare-fun d!91281 () Bool)

(declare-fun res!417880 () Bool)

(assert (=> d!91281 (=> res!417880 e!369646)))

(assert (=> d!91281 (= res!417880 (bvsge #b00000000000000000000000000000000 (size!18791 a!2986)))))

(assert (=> d!91281 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!369646)))

(assert (= (and d!91281 (not res!417880)) b!645073))

(assert (= (and b!645073 c!73964) b!645074))

(assert (= (and b!645073 (not c!73964)) b!645072))

(assert (= (and b!645074 res!417881) b!645071))

(assert (= (or b!645071 b!645072) bm!33630))

(declare-fun m!619079 () Bool)

(assert (=> bm!33630 m!619079))

(assert (=> b!645073 m!618913))

(assert (=> b!645073 m!618913))

(assert (=> b!645073 m!619075))

(assert (=> b!645074 m!618913))

(declare-fun m!619081 () Bool)

(assert (=> b!645074 m!619081))

(declare-fun m!619083 () Bool)

(assert (=> b!645074 m!619083))

(assert (=> b!645074 m!618913))

(declare-fun m!619085 () Bool)

(assert (=> b!645074 m!619085))

(assert (=> b!644721 d!91281))

(declare-fun d!91283 () Bool)

(declare-fun lt!299023 () SeekEntryResult!6823)

(assert (=> d!91283 (and (or ((_ is Undefined!6823) lt!299023) (not ((_ is Found!6823) lt!299023)) (and (bvsge (index!29625 lt!299023) #b00000000000000000000000000000000) (bvslt (index!29625 lt!299023) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!299023) ((_ is Found!6823) lt!299023) (not ((_ is MissingVacant!6823) lt!299023)) (not (= (index!29627 lt!299023) vacantSpotIndex!68)) (and (bvsge (index!29627 lt!299023) #b00000000000000000000000000000000) (bvslt (index!29627 lt!299023) (size!18791 a!2986)))) (or ((_ is Undefined!6823) lt!299023) (ite ((_ is Found!6823) lt!299023) (= (select (arr!18427 a!2986) (index!29625 lt!299023)) (select (arr!18427 a!2986) j!136)) (and ((_ is MissingVacant!6823) lt!299023) (= (index!29627 lt!299023) vacantSpotIndex!68) (= (select (arr!18427 a!2986) (index!29627 lt!299023)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!369648 () SeekEntryResult!6823)

(assert (=> d!91283 (= lt!299023 e!369648)))

(declare-fun c!73967 () Bool)

(assert (=> d!91283 (= c!73967 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!299024 () (_ BitVec 64))

(assert (=> d!91283 (= lt!299024 (select (arr!18427 a!2986) index!984))))

(assert (=> d!91283 (validMask!0 mask!3053)))

(assert (=> d!91283 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053) lt!299023)))

(declare-fun e!369647 () SeekEntryResult!6823)

(declare-fun b!645075 () Bool)

(assert (=> b!645075 (= e!369647 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18427 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645076 () Bool)

(declare-fun c!73965 () Bool)

(assert (=> b!645076 (= c!73965 (= lt!299024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!369649 () SeekEntryResult!6823)

(assert (=> b!645076 (= e!369649 e!369647)))

(declare-fun b!645077 () Bool)

(assert (=> b!645077 (= e!369648 e!369649)))

(declare-fun c!73966 () Bool)

(assert (=> b!645077 (= c!73966 (= lt!299024 (select (arr!18427 a!2986) j!136)))))

(declare-fun b!645078 () Bool)

(assert (=> b!645078 (= e!369649 (Found!6823 index!984))))

(declare-fun b!645079 () Bool)

(assert (=> b!645079 (= e!369648 Undefined!6823)))

(declare-fun b!645080 () Bool)

(assert (=> b!645080 (= e!369647 (MissingVacant!6823 vacantSpotIndex!68))))

(assert (= (and d!91283 c!73967) b!645079))

(assert (= (and d!91283 (not c!73967)) b!645077))

(assert (= (and b!645077 c!73966) b!645078))

(assert (= (and b!645077 (not c!73966)) b!645076))

(assert (= (and b!645076 c!73965) b!645080))

(assert (= (and b!645076 (not c!73965)) b!645075))

(declare-fun m!619087 () Bool)

(assert (=> d!91283 m!619087))

(declare-fun m!619089 () Bool)

(assert (=> d!91283 m!619089))

(assert (=> d!91283 m!618735))

(assert (=> d!91283 m!618717))

(assert (=> b!645075 m!619059))

(assert (=> b!645075 m!619059))

(assert (=> b!645075 m!618723))

(declare-fun m!619091 () Bool)

(assert (=> b!645075 m!619091))

(assert (=> b!644719 d!91283))

(assert (=> b!644730 d!91275))

(check-sat (not d!91209) (not d!91245) (not d!91271) (not b!644911) (not b!645062) (not d!91283) (not b!644912) (not bm!33630) (not b!644898) (not d!91233) (not b!644913) (not b!644919) (not b!645074) (not d!91265) (not bm!33616) (not b!644921) (not b!645075) (not d!91267) (not b!645029) (not b!644920) (not b!645073) (not b!645057) (not d!91207) (not d!91205) (not bm!33615) (not b!644916) (not d!91193) (not b!644927) (not b!645060) (not b!645030) (not b!645041) (not b!644888) (not b!645061) (not b!644971) (not bm!33627) (not d!91203) (not b!644896))
(check-sat)
