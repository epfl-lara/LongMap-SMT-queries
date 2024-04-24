; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56214 () Bool)

(assert start!56214)

(declare-fun b!621626 () Bool)

(declare-fun res!400569 () Bool)

(declare-fun e!356550 () Bool)

(assert (=> b!621626 (=> (not res!400569) (not e!356550))))

(declare-datatypes ((array!37629 0))(
  ( (array!37630 (arr!18058 (Array (_ BitVec 32) (_ BitVec 64))) (size!18422 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37629)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37629 (_ BitVec 32)) Bool)

(assert (=> b!621626 (= res!400569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621627 () Bool)

(declare-fun res!400563 () Bool)

(declare-fun e!356546 () Bool)

(assert (=> b!621627 (=> (not res!400563) (not e!356546))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621627 (= res!400563 (validKeyInArray!0 k0!1786))))

(declare-fun b!621628 () Bool)

(declare-fun res!400557 () Bool)

(assert (=> b!621628 (=> (not res!400557) (not e!356550))))

(declare-datatypes ((List!12006 0))(
  ( (Nil!12003) (Cons!12002 (h!13050 (_ BitVec 64)) (t!18226 List!12006)) )
))
(declare-fun arrayNoDuplicates!0 (array!37629 (_ BitVec 32) List!12006) Bool)

(assert (=> b!621628 (= res!400557 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12003))))

(declare-fun b!621629 () Bool)

(declare-fun res!400562 () Bool)

(assert (=> b!621629 (=> (not res!400562) (not e!356546))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!621629 (= res!400562 (validKeyInArray!0 (select (arr!18058 a!2986) j!136)))))

(declare-fun b!621630 () Bool)

(declare-fun e!356559 () Bool)

(assert (=> b!621630 (= e!356559 (not true))))

(declare-datatypes ((Unit!20737 0))(
  ( (Unit!20738) )
))
(declare-fun lt!287645 () Unit!20737)

(declare-fun e!356555 () Unit!20737)

(assert (=> b!621630 (= lt!287645 e!356555)))

(declare-fun c!70906 () Bool)

(declare-datatypes ((SeekEntryResult!6454 0))(
  ( (MissingZero!6454 (index!28100 (_ BitVec 32))) (Found!6454 (index!28101 (_ BitVec 32))) (Intermediate!6454 (undefined!7266 Bool) (index!28102 (_ BitVec 32)) (x!57025 (_ BitVec 32))) (Undefined!6454) (MissingVacant!6454 (index!28103 (_ BitVec 32))) )
))
(declare-fun lt!287655 () SeekEntryResult!6454)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621630 (= c!70906 (= lt!287655 (Found!6454 index!984)))))

(declare-fun lt!287650 () Unit!20737)

(declare-fun e!356547 () Unit!20737)

(assert (=> b!621630 (= lt!287650 e!356547)))

(declare-fun c!70907 () Bool)

(assert (=> b!621630 (= c!70907 (= lt!287655 Undefined!6454))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287656 () (_ BitVec 64))

(declare-fun lt!287653 () array!37629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37629 (_ BitVec 32)) SeekEntryResult!6454)

(assert (=> b!621630 (= lt!287655 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287656 lt!287653 mask!3053))))

(declare-fun e!356556 () Bool)

(assert (=> b!621630 e!356556))

(declare-fun res!400556 () Bool)

(assert (=> b!621630 (=> (not res!400556) (not e!356556))))

(declare-fun lt!287651 () (_ BitVec 32))

(declare-fun lt!287642 () SeekEntryResult!6454)

(assert (=> b!621630 (= res!400556 (= lt!287642 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287651 vacantSpotIndex!68 lt!287656 lt!287653 mask!3053)))))

(assert (=> b!621630 (= lt!287642 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287651 vacantSpotIndex!68 (select (arr!18058 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!621630 (= lt!287656 (select (store (arr!18058 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287649 () Unit!20737)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37629 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20737)

(assert (=> b!621630 (= lt!287649 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287651 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621630 (= lt!287651 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!621631 () Bool)

(declare-fun e!356553 () Bool)

(assert (=> b!621631 (= e!356553 e!356559)))

(declare-fun res!400564 () Bool)

(assert (=> b!621631 (=> (not res!400564) (not e!356559))))

(declare-fun lt!287641 () SeekEntryResult!6454)

(assert (=> b!621631 (= res!400564 (and (= lt!287641 (Found!6454 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18058 a!2986) index!984) (select (arr!18058 a!2986) j!136))) (not (= (select (arr!18058 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621631 (= lt!287641 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18058 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621632 () Bool)

(declare-fun Unit!20739 () Unit!20737)

(assert (=> b!621632 (= e!356555 Unit!20739)))

(declare-fun res!400570 () Bool)

(assert (=> b!621632 (= res!400570 (= (select (store (arr!18058 a!2986) i!1108 k0!1786) index!984) (select (arr!18058 a!2986) j!136)))))

(declare-fun e!356551 () Bool)

(assert (=> b!621632 (=> (not res!400570) (not e!356551))))

(assert (=> b!621632 e!356551))

(declare-fun c!70904 () Bool)

(assert (=> b!621632 (= c!70904 (bvslt j!136 index!984))))

(declare-fun lt!287654 () Unit!20737)

(declare-fun e!356558 () Unit!20737)

(assert (=> b!621632 (= lt!287654 e!356558)))

(declare-fun c!70905 () Bool)

(assert (=> b!621632 (= c!70905 (bvslt index!984 j!136))))

(declare-fun lt!287657 () Unit!20737)

(declare-fun e!356548 () Unit!20737)

(assert (=> b!621632 (= lt!287657 e!356548)))

(assert (=> b!621632 false))

(declare-fun b!621633 () Bool)

(assert (=> b!621633 (= e!356546 e!356550)))

(declare-fun res!400567 () Bool)

(assert (=> b!621633 (=> (not res!400567) (not e!356550))))

(declare-fun lt!287652 () SeekEntryResult!6454)

(assert (=> b!621633 (= res!400567 (or (= lt!287652 (MissingZero!6454 i!1108)) (= lt!287652 (MissingVacant!6454 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37629 (_ BitVec 32)) SeekEntryResult!6454)

(assert (=> b!621633 (= lt!287652 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!400568 () Bool)

(declare-fun b!621634 () Bool)

(declare-fun arrayContainsKey!0 (array!37629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621634 (= res!400568 (arrayContainsKey!0 lt!287653 (select (arr!18058 a!2986) j!136) j!136))))

(declare-fun e!356552 () Bool)

(assert (=> b!621634 (=> (not res!400568) (not e!356552))))

(declare-fun e!356554 () Bool)

(assert (=> b!621634 (= e!356554 e!356552)))

(declare-fun b!621635 () Bool)

(assert (=> b!621635 false))

(declare-fun lt!287648 () Unit!20737)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37629 (_ BitVec 64) (_ BitVec 32) List!12006) Unit!20737)

(assert (=> b!621635 (= lt!287648 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287653 (select (arr!18058 a!2986) j!136) j!136 Nil!12003))))

(assert (=> b!621635 (arrayNoDuplicates!0 lt!287653 j!136 Nil!12003)))

(declare-fun lt!287658 () Unit!20737)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37629 (_ BitVec 32) (_ BitVec 32)) Unit!20737)

(assert (=> b!621635 (= lt!287658 (lemmaNoDuplicateFromThenFromBigger!0 lt!287653 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621635 (arrayNoDuplicates!0 lt!287653 #b00000000000000000000000000000000 Nil!12003)))

(declare-fun lt!287644 () Unit!20737)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12006) Unit!20737)

(assert (=> b!621635 (= lt!287644 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12003))))

(assert (=> b!621635 (arrayContainsKey!0 lt!287653 (select (arr!18058 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287646 () Unit!20737)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20737)

(assert (=> b!621635 (= lt!287646 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287653 (select (arr!18058 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20740 () Unit!20737)

(assert (=> b!621635 (= e!356558 Unit!20740)))

(declare-fun b!621636 () Bool)

(declare-fun Unit!20741 () Unit!20737)

(assert (=> b!621636 (= e!356548 Unit!20741)))

(declare-fun b!621637 () Bool)

(declare-fun Unit!20742 () Unit!20737)

(assert (=> b!621637 (= e!356547 Unit!20742)))

(declare-fun b!621638 () Bool)

(assert (=> b!621638 (= e!356552 (arrayContainsKey!0 lt!287653 (select (arr!18058 a!2986) j!136) index!984))))

(declare-fun b!621639 () Bool)

(declare-fun res!400566 () Bool)

(assert (=> b!621639 (=> (not res!400566) (not e!356546))))

(assert (=> b!621639 (= res!400566 (and (= (size!18422 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18422 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18422 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621640 () Bool)

(declare-fun res!400559 () Bool)

(assert (=> b!621640 (=> (not res!400559) (not e!356546))))

(assert (=> b!621640 (= res!400559 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621642 () Bool)

(declare-fun e!356549 () Bool)

(assert (=> b!621642 (= e!356549 (arrayContainsKey!0 lt!287653 (select (arr!18058 a!2986) j!136) index!984))))

(declare-fun b!621643 () Bool)

(assert (=> b!621643 false))

(declare-fun lt!287643 () Unit!20737)

(assert (=> b!621643 (= lt!287643 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287653 (select (arr!18058 a!2986) j!136) index!984 Nil!12003))))

(assert (=> b!621643 (arrayNoDuplicates!0 lt!287653 index!984 Nil!12003)))

(declare-fun lt!287659 () Unit!20737)

(assert (=> b!621643 (= lt!287659 (lemmaNoDuplicateFromThenFromBigger!0 lt!287653 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621643 (arrayNoDuplicates!0 lt!287653 #b00000000000000000000000000000000 Nil!12003)))

(declare-fun lt!287640 () Unit!20737)

(assert (=> b!621643 (= lt!287640 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12003))))

(assert (=> b!621643 (arrayContainsKey!0 lt!287653 (select (arr!18058 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287647 () Unit!20737)

(assert (=> b!621643 (= lt!287647 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287653 (select (arr!18058 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621643 e!356549))

(declare-fun res!400565 () Bool)

(assert (=> b!621643 (=> (not res!400565) (not e!356549))))

(assert (=> b!621643 (= res!400565 (arrayContainsKey!0 lt!287653 (select (arr!18058 a!2986) j!136) j!136))))

(declare-fun Unit!20743 () Unit!20737)

(assert (=> b!621643 (= e!356548 Unit!20743)))

(declare-fun b!621644 () Bool)

(declare-fun Unit!20744 () Unit!20737)

(assert (=> b!621644 (= e!356555 Unit!20744)))

(declare-fun b!621645 () Bool)

(declare-fun Unit!20745 () Unit!20737)

(assert (=> b!621645 (= e!356558 Unit!20745)))

(declare-fun b!621646 () Bool)

(assert (=> b!621646 (= e!356550 e!356553)))

(declare-fun res!400555 () Bool)

(assert (=> b!621646 (=> (not res!400555) (not e!356553))))

(assert (=> b!621646 (= res!400555 (= (select (store (arr!18058 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621646 (= lt!287653 (array!37630 (store (arr!18058 a!2986) i!1108 k0!1786) (size!18422 a!2986)))))

(declare-fun b!621647 () Bool)

(assert (=> b!621647 (= e!356556 (= lt!287641 lt!287642))))

(declare-fun b!621648 () Bool)

(declare-fun res!400561 () Bool)

(assert (=> b!621648 (=> (not res!400561) (not e!356550))))

(assert (=> b!621648 (= res!400561 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18058 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621649 () Bool)

(declare-fun res!400560 () Bool)

(assert (=> b!621649 (= res!400560 (bvsge j!136 index!984))))

(assert (=> b!621649 (=> res!400560 e!356554)))

(assert (=> b!621649 (= e!356551 e!356554)))

(declare-fun b!621641 () Bool)

(declare-fun Unit!20746 () Unit!20737)

(assert (=> b!621641 (= e!356547 Unit!20746)))

(assert (=> b!621641 false))

(declare-fun res!400558 () Bool)

(assert (=> start!56214 (=> (not res!400558) (not e!356546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56214 (= res!400558 (validMask!0 mask!3053))))

(assert (=> start!56214 e!356546))

(assert (=> start!56214 true))

(declare-fun array_inv!13917 (array!37629) Bool)

(assert (=> start!56214 (array_inv!13917 a!2986)))

(assert (= (and start!56214 res!400558) b!621639))

(assert (= (and b!621639 res!400566) b!621629))

(assert (= (and b!621629 res!400562) b!621627))

(assert (= (and b!621627 res!400563) b!621640))

(assert (= (and b!621640 res!400559) b!621633))

(assert (= (and b!621633 res!400567) b!621626))

(assert (= (and b!621626 res!400569) b!621628))

(assert (= (and b!621628 res!400557) b!621648))

(assert (= (and b!621648 res!400561) b!621646))

(assert (= (and b!621646 res!400555) b!621631))

(assert (= (and b!621631 res!400564) b!621630))

(assert (= (and b!621630 res!400556) b!621647))

(assert (= (and b!621630 c!70907) b!621641))

(assert (= (and b!621630 (not c!70907)) b!621637))

(assert (= (and b!621630 c!70906) b!621632))

(assert (= (and b!621630 (not c!70906)) b!621644))

(assert (= (and b!621632 res!400570) b!621649))

(assert (= (and b!621649 (not res!400560)) b!621634))

(assert (= (and b!621634 res!400568) b!621638))

(assert (= (and b!621632 c!70904) b!621635))

(assert (= (and b!621632 (not c!70904)) b!621645))

(assert (= (and b!621632 c!70905) b!621643))

(assert (= (and b!621632 (not c!70905)) b!621636))

(assert (= (and b!621643 res!400565) b!621642))

(declare-fun m!597797 () Bool)

(assert (=> b!621632 m!597797))

(declare-fun m!597799 () Bool)

(assert (=> b!621632 m!597799))

(declare-fun m!597801 () Bool)

(assert (=> b!621632 m!597801))

(declare-fun m!597803 () Bool)

(assert (=> b!621640 m!597803))

(declare-fun m!597805 () Bool)

(assert (=> b!621648 m!597805))

(assert (=> b!621643 m!597801))

(declare-fun m!597807 () Bool)

(assert (=> b!621643 m!597807))

(assert (=> b!621643 m!597801))

(assert (=> b!621643 m!597801))

(declare-fun m!597809 () Bool)

(assert (=> b!621643 m!597809))

(assert (=> b!621643 m!597801))

(declare-fun m!597811 () Bool)

(assert (=> b!621643 m!597811))

(assert (=> b!621643 m!597801))

(declare-fun m!597813 () Bool)

(assert (=> b!621643 m!597813))

(declare-fun m!597815 () Bool)

(assert (=> b!621643 m!597815))

(declare-fun m!597817 () Bool)

(assert (=> b!621643 m!597817))

(declare-fun m!597819 () Bool)

(assert (=> b!621643 m!597819))

(declare-fun m!597821 () Bool)

(assert (=> b!621643 m!597821))

(assert (=> b!621638 m!597801))

(assert (=> b!621638 m!597801))

(declare-fun m!597823 () Bool)

(assert (=> b!621638 m!597823))

(declare-fun m!597825 () Bool)

(assert (=> start!56214 m!597825))

(declare-fun m!597827 () Bool)

(assert (=> start!56214 m!597827))

(declare-fun m!597829 () Bool)

(assert (=> b!621626 m!597829))

(assert (=> b!621646 m!597797))

(declare-fun m!597831 () Bool)

(assert (=> b!621646 m!597831))

(declare-fun m!597833 () Bool)

(assert (=> b!621633 m!597833))

(assert (=> b!621642 m!597801))

(assert (=> b!621642 m!597801))

(assert (=> b!621642 m!597823))

(declare-fun m!597835 () Bool)

(assert (=> b!621627 m!597835))

(assert (=> b!621629 m!597801))

(assert (=> b!621629 m!597801))

(declare-fun m!597837 () Bool)

(assert (=> b!621629 m!597837))

(declare-fun m!597839 () Bool)

(assert (=> b!621628 m!597839))

(declare-fun m!597841 () Bool)

(assert (=> b!621631 m!597841))

(assert (=> b!621631 m!597801))

(assert (=> b!621631 m!597801))

(declare-fun m!597843 () Bool)

(assert (=> b!621631 m!597843))

(assert (=> b!621635 m!597819))

(declare-fun m!597845 () Bool)

(assert (=> b!621635 m!597845))

(assert (=> b!621635 m!597801))

(declare-fun m!597847 () Bool)

(assert (=> b!621635 m!597847))

(assert (=> b!621635 m!597817))

(declare-fun m!597849 () Bool)

(assert (=> b!621635 m!597849))

(assert (=> b!621635 m!597801))

(assert (=> b!621635 m!597801))

(declare-fun m!597851 () Bool)

(assert (=> b!621635 m!597851))

(assert (=> b!621635 m!597801))

(declare-fun m!597853 () Bool)

(assert (=> b!621635 m!597853))

(assert (=> b!621634 m!597801))

(assert (=> b!621634 m!597801))

(assert (=> b!621634 m!597809))

(declare-fun m!597855 () Bool)

(assert (=> b!621630 m!597855))

(declare-fun m!597857 () Bool)

(assert (=> b!621630 m!597857))

(declare-fun m!597859 () Bool)

(assert (=> b!621630 m!597859))

(assert (=> b!621630 m!597801))

(assert (=> b!621630 m!597797))

(declare-fun m!597861 () Bool)

(assert (=> b!621630 m!597861))

(declare-fun m!597863 () Bool)

(assert (=> b!621630 m!597863))

(assert (=> b!621630 m!597801))

(declare-fun m!597865 () Bool)

(assert (=> b!621630 m!597865))

(check-sat (not start!56214) (not b!621629) (not b!621630) (not b!621627) (not b!621626) (not b!621633) (not b!621642) (not b!621638) (not b!621631) (not b!621640) (not b!621643) (not b!621634) (not b!621628) (not b!621635))
(check-sat)
