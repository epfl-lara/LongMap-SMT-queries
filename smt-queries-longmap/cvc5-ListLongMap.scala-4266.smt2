; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59336 () Bool)

(assert start!59336)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!654669 () Bool)

(declare-fun e!375954 () Bool)

(declare-datatypes ((array!38656 0))(
  ( (array!38657 (arr!18528 (Array (_ BitVec 32) (_ BitVec 64))) (size!18892 (_ BitVec 32))) )
))
(declare-fun lt!305046 () array!38656)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38656)

(declare-fun arrayContainsKey!0 (array!38656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654669 (= e!375954 (arrayContainsKey!0 lt!305046 (select (arr!18528 a!2986) j!136) index!984))))

(declare-fun b!654670 () Bool)

(declare-fun e!375953 () Bool)

(assert (=> b!654670 (= e!375953 true)))

(assert (=> b!654670 false))

(declare-datatypes ((Unit!22440 0))(
  ( (Unit!22441) )
))
(declare-fun lt!305055 () Unit!22440)

(declare-fun e!375957 () Unit!22440)

(assert (=> b!654670 (= lt!305055 e!375957)))

(declare-fun c!75379 () Bool)

(assert (=> b!654670 (= c!75379 (bvslt index!984 j!136))))

(declare-fun lt!305059 () Unit!22440)

(declare-fun e!375952 () Unit!22440)

(assert (=> b!654670 (= lt!305059 e!375952)))

(declare-fun c!75380 () Bool)

(assert (=> b!654670 (= c!75380 (bvslt j!136 index!984))))

(declare-fun b!654671 () Bool)

(declare-fun e!375959 () Unit!22440)

(declare-fun Unit!22442 () Unit!22440)

(assert (=> b!654671 (= e!375959 Unit!22442)))

(assert (=> b!654671 false))

(declare-fun e!375963 () Bool)

(declare-fun b!654672 () Bool)

(assert (=> b!654672 (= e!375963 (arrayContainsKey!0 lt!305046 (select (arr!18528 a!2986) j!136) index!984))))

(declare-fun b!654673 () Bool)

(declare-fun e!375956 () Bool)

(declare-fun e!375966 () Bool)

(assert (=> b!654673 (= e!375956 e!375966)))

(declare-fun res!424652 () Bool)

(assert (=> b!654673 (=> (not res!424652) (not e!375966))))

(declare-datatypes ((SeekEntryResult!6968 0))(
  ( (MissingZero!6968 (index!30231 (_ BitVec 32))) (Found!6968 (index!30232 (_ BitVec 32))) (Intermediate!6968 (undefined!7780 Bool) (index!30233 (_ BitVec 32)) (x!59025 (_ BitVec 32))) (Undefined!6968) (MissingVacant!6968 (index!30234 (_ BitVec 32))) )
))
(declare-fun lt!305050 () SeekEntryResult!6968)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654673 (= res!424652 (and (= lt!305050 (Found!6968 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18528 a!2986) index!984) (select (arr!18528 a!2986) j!136))) (not (= (select (arr!18528 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38656 (_ BitVec 32)) SeekEntryResult!6968)

(assert (=> b!654673 (= lt!305050 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18528 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654674 () Bool)

(declare-fun res!424656 () Bool)

(declare-fun e!375965 () Bool)

(assert (=> b!654674 (=> (not res!424656) (not e!375965))))

(assert (=> b!654674 (= res!424656 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18528 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654675 () Bool)

(declare-fun res!424659 () Bool)

(assert (=> b!654675 (=> (not res!424659) (not e!375965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38656 (_ BitVec 32)) Bool)

(assert (=> b!654675 (= res!424659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654677 () Bool)

(declare-fun Unit!22443 () Unit!22440)

(assert (=> b!654677 (= e!375959 Unit!22443)))

(declare-fun b!654678 () Bool)

(declare-fun res!424658 () Bool)

(declare-fun e!375960 () Bool)

(assert (=> b!654678 (=> (not res!424658) (not e!375960))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!654678 (= res!424658 (and (= (size!18892 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18892 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18892 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654679 () Bool)

(declare-fun res!424647 () Bool)

(assert (=> b!654679 (=> (not res!424647) (not e!375960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654679 (= res!424647 (validKeyInArray!0 (select (arr!18528 a!2986) j!136)))))

(declare-fun b!654680 () Bool)

(declare-fun e!375958 () Bool)

(declare-fun lt!305052 () SeekEntryResult!6968)

(assert (=> b!654680 (= e!375958 (= lt!305050 lt!305052))))

(declare-fun b!654681 () Bool)

(declare-fun res!424649 () Bool)

(assert (=> b!654681 (=> (not res!424649) (not e!375965))))

(declare-datatypes ((List!12569 0))(
  ( (Nil!12566) (Cons!12565 (h!13610 (_ BitVec 64)) (t!18797 List!12569)) )
))
(declare-fun arrayNoDuplicates!0 (array!38656 (_ BitVec 32) List!12569) Bool)

(assert (=> b!654681 (= res!424649 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12566))))

(declare-fun b!654682 () Bool)

(assert (=> b!654682 (= e!375960 e!375965)))

(declare-fun res!424664 () Bool)

(assert (=> b!654682 (=> (not res!424664) (not e!375965))))

(declare-fun lt!305051 () SeekEntryResult!6968)

(assert (=> b!654682 (= res!424664 (or (= lt!305051 (MissingZero!6968 i!1108)) (= lt!305051 (MissingVacant!6968 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38656 (_ BitVec 32)) SeekEntryResult!6968)

(assert (=> b!654682 (= lt!305051 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654683 () Bool)

(declare-fun Unit!22444 () Unit!22440)

(assert (=> b!654683 (= e!375952 Unit!22444)))

(declare-fun lt!305061 () Unit!22440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22440)

(assert (=> b!654683 (= lt!305061 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305046 (select (arr!18528 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654683 (arrayContainsKey!0 lt!305046 (select (arr!18528 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305048 () Unit!22440)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12569) Unit!22440)

(assert (=> b!654683 (= lt!305048 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12566))))

(assert (=> b!654683 (arrayNoDuplicates!0 lt!305046 #b00000000000000000000000000000000 Nil!12566)))

(declare-fun lt!305056 () Unit!22440)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38656 (_ BitVec 32) (_ BitVec 32)) Unit!22440)

(assert (=> b!654683 (= lt!305056 (lemmaNoDuplicateFromThenFromBigger!0 lt!305046 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654683 (arrayNoDuplicates!0 lt!305046 j!136 Nil!12566)))

(declare-fun lt!305044 () Unit!22440)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38656 (_ BitVec 64) (_ BitVec 32) List!12569) Unit!22440)

(assert (=> b!654683 (= lt!305044 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305046 (select (arr!18528 a!2986) j!136) j!136 Nil!12566))))

(assert (=> b!654683 false))

(declare-fun b!654684 () Bool)

(declare-fun Unit!22445 () Unit!22440)

(assert (=> b!654684 (= e!375957 Unit!22445)))

(declare-fun b!654685 () Bool)

(declare-fun res!424662 () Bool)

(assert (=> b!654685 (=> (not res!424662) (not e!375960))))

(assert (=> b!654685 (= res!424662 (validKeyInArray!0 k!1786))))

(declare-fun b!654686 () Bool)

(declare-fun e!375961 () Bool)

(declare-fun e!375964 () Bool)

(assert (=> b!654686 (= e!375961 e!375964)))

(declare-fun res!424654 () Bool)

(assert (=> b!654686 (=> res!424654 e!375964)))

(declare-fun lt!305057 () (_ BitVec 64))

(declare-fun lt!305049 () (_ BitVec 64))

(assert (=> b!654686 (= res!424654 (or (not (= (select (arr!18528 a!2986) j!136) lt!305049)) (not (= (select (arr!18528 a!2986) j!136) lt!305057)) (bvsge j!136 index!984)))))

(declare-fun b!654687 () Bool)

(declare-fun e!375962 () Bool)

(assert (=> b!654687 (= e!375966 (not e!375962))))

(declare-fun res!424663 () Bool)

(assert (=> b!654687 (=> res!424663 e!375962)))

(declare-fun lt!305053 () SeekEntryResult!6968)

(assert (=> b!654687 (= res!424663 (not (= lt!305053 (Found!6968 index!984))))))

(declare-fun lt!305054 () Unit!22440)

(assert (=> b!654687 (= lt!305054 e!375959)))

(declare-fun c!75378 () Bool)

(assert (=> b!654687 (= c!75378 (= lt!305053 Undefined!6968))))

(assert (=> b!654687 (= lt!305053 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305049 lt!305046 mask!3053))))

(assert (=> b!654687 e!375958))

(declare-fun res!424657 () Bool)

(assert (=> b!654687 (=> (not res!424657) (not e!375958))))

(declare-fun lt!305045 () (_ BitVec 32))

(assert (=> b!654687 (= res!424657 (= lt!305052 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305045 vacantSpotIndex!68 lt!305049 lt!305046 mask!3053)))))

(assert (=> b!654687 (= lt!305052 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305045 vacantSpotIndex!68 (select (arr!18528 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654687 (= lt!305049 (select (store (arr!18528 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305047 () Unit!22440)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38656 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22440)

(assert (=> b!654687 (= lt!305047 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305045 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654687 (= lt!305045 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654688 () Bool)

(assert (=> b!654688 (= e!375962 e!375953)))

(declare-fun res!424648 () Bool)

(assert (=> b!654688 (=> res!424648 e!375953)))

(assert (=> b!654688 (= res!424648 (or (not (= (select (arr!18528 a!2986) j!136) lt!305049)) (not (= (select (arr!18528 a!2986) j!136) lt!305057))))))

(assert (=> b!654688 e!375961))

(declare-fun res!424661 () Bool)

(assert (=> b!654688 (=> (not res!424661) (not e!375961))))

(assert (=> b!654688 (= res!424661 (= lt!305057 (select (arr!18528 a!2986) j!136)))))

(assert (=> b!654688 (= lt!305057 (select (store (arr!18528 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!654689 () Bool)

(assert (=> b!654689 (= e!375965 e!375956)))

(declare-fun res!424655 () Bool)

(assert (=> b!654689 (=> (not res!424655) (not e!375956))))

(assert (=> b!654689 (= res!424655 (= (select (store (arr!18528 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654689 (= lt!305046 (array!38657 (store (arr!18528 a!2986) i!1108 k!1786) (size!18892 a!2986)))))

(declare-fun b!654690 () Bool)

(assert (=> b!654690 (= e!375964 e!375963)))

(declare-fun res!424650 () Bool)

(assert (=> b!654690 (=> (not res!424650) (not e!375963))))

(assert (=> b!654690 (= res!424650 (arrayContainsKey!0 lt!305046 (select (arr!18528 a!2986) j!136) j!136))))

(declare-fun b!654676 () Bool)

(declare-fun Unit!22446 () Unit!22440)

(assert (=> b!654676 (= e!375957 Unit!22446)))

(declare-fun res!424651 () Bool)

(assert (=> b!654676 (= res!424651 (arrayContainsKey!0 lt!305046 (select (arr!18528 a!2986) j!136) j!136))))

(assert (=> b!654676 (=> (not res!424651) (not e!375954))))

(assert (=> b!654676 e!375954))

(declare-fun lt!305058 () Unit!22440)

(assert (=> b!654676 (= lt!305058 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305046 (select (arr!18528 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654676 (arrayContainsKey!0 lt!305046 (select (arr!18528 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305060 () Unit!22440)

(assert (=> b!654676 (= lt!305060 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12566))))

(assert (=> b!654676 (arrayNoDuplicates!0 lt!305046 #b00000000000000000000000000000000 Nil!12566)))

(declare-fun lt!305043 () Unit!22440)

(assert (=> b!654676 (= lt!305043 (lemmaNoDuplicateFromThenFromBigger!0 lt!305046 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654676 (arrayNoDuplicates!0 lt!305046 index!984 Nil!12566)))

(declare-fun lt!305062 () Unit!22440)

(assert (=> b!654676 (= lt!305062 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305046 (select (arr!18528 a!2986) j!136) index!984 Nil!12566))))

(assert (=> b!654676 false))

(declare-fun res!424660 () Bool)

(assert (=> start!59336 (=> (not res!424660) (not e!375960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59336 (= res!424660 (validMask!0 mask!3053))))

(assert (=> start!59336 e!375960))

(assert (=> start!59336 true))

(declare-fun array_inv!14324 (array!38656) Bool)

(assert (=> start!59336 (array_inv!14324 a!2986)))

(declare-fun b!654691 () Bool)

(declare-fun Unit!22447 () Unit!22440)

(assert (=> b!654691 (= e!375952 Unit!22447)))

(declare-fun b!654692 () Bool)

(declare-fun res!424653 () Bool)

(assert (=> b!654692 (=> (not res!424653) (not e!375960))))

(assert (=> b!654692 (= res!424653 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!59336 res!424660) b!654678))

(assert (= (and b!654678 res!424658) b!654679))

(assert (= (and b!654679 res!424647) b!654685))

(assert (= (and b!654685 res!424662) b!654692))

(assert (= (and b!654692 res!424653) b!654682))

(assert (= (and b!654682 res!424664) b!654675))

(assert (= (and b!654675 res!424659) b!654681))

(assert (= (and b!654681 res!424649) b!654674))

(assert (= (and b!654674 res!424656) b!654689))

(assert (= (and b!654689 res!424655) b!654673))

(assert (= (and b!654673 res!424652) b!654687))

(assert (= (and b!654687 res!424657) b!654680))

(assert (= (and b!654687 c!75378) b!654671))

(assert (= (and b!654687 (not c!75378)) b!654677))

(assert (= (and b!654687 (not res!424663)) b!654688))

(assert (= (and b!654688 res!424661) b!654686))

(assert (= (and b!654686 (not res!424654)) b!654690))

(assert (= (and b!654690 res!424650) b!654672))

(assert (= (and b!654688 (not res!424648)) b!654670))

(assert (= (and b!654670 c!75380) b!654683))

(assert (= (and b!654670 (not c!75380)) b!654691))

(assert (= (and b!654670 c!75379) b!654676))

(assert (= (and b!654670 (not c!75379)) b!654684))

(assert (= (and b!654676 res!424651) b!654669))

(declare-fun m!627767 () Bool)

(assert (=> b!654676 m!627767))

(declare-fun m!627769 () Bool)

(assert (=> b!654676 m!627769))

(declare-fun m!627771 () Bool)

(assert (=> b!654676 m!627771))

(assert (=> b!654676 m!627769))

(declare-fun m!627773 () Bool)

(assert (=> b!654676 m!627773))

(assert (=> b!654676 m!627769))

(declare-fun m!627775 () Bool)

(assert (=> b!654676 m!627775))

(assert (=> b!654676 m!627769))

(declare-fun m!627777 () Bool)

(assert (=> b!654676 m!627777))

(declare-fun m!627779 () Bool)

(assert (=> b!654676 m!627779))

(declare-fun m!627781 () Bool)

(assert (=> b!654676 m!627781))

(assert (=> b!654676 m!627769))

(declare-fun m!627783 () Bool)

(assert (=> b!654676 m!627783))

(declare-fun m!627785 () Bool)

(assert (=> b!654673 m!627785))

(assert (=> b!654673 m!627769))

(assert (=> b!654673 m!627769))

(declare-fun m!627787 () Bool)

(assert (=> b!654673 m!627787))

(declare-fun m!627789 () Bool)

(assert (=> b!654689 m!627789))

(declare-fun m!627791 () Bool)

(assert (=> b!654689 m!627791))

(declare-fun m!627793 () Bool)

(assert (=> b!654685 m!627793))

(declare-fun m!627795 () Bool)

(assert (=> b!654674 m!627795))

(declare-fun m!627797 () Bool)

(assert (=> b!654683 m!627797))

(assert (=> b!654683 m!627769))

(assert (=> b!654683 m!627769))

(declare-fun m!627799 () Bool)

(assert (=> b!654683 m!627799))

(assert (=> b!654683 m!627769))

(declare-fun m!627801 () Bool)

(assert (=> b!654683 m!627801))

(assert (=> b!654683 m!627769))

(declare-fun m!627803 () Bool)

(assert (=> b!654683 m!627803))

(assert (=> b!654683 m!627781))

(declare-fun m!627805 () Bool)

(assert (=> b!654683 m!627805))

(assert (=> b!654683 m!627779))

(assert (=> b!654686 m!627769))

(assert (=> b!654690 m!627769))

(assert (=> b!654690 m!627769))

(assert (=> b!654690 m!627773))

(declare-fun m!627807 () Bool)

(assert (=> b!654687 m!627807))

(declare-fun m!627809 () Bool)

(assert (=> b!654687 m!627809))

(declare-fun m!627811 () Bool)

(assert (=> b!654687 m!627811))

(assert (=> b!654687 m!627769))

(declare-fun m!627813 () Bool)

(assert (=> b!654687 m!627813))

(assert (=> b!654687 m!627769))

(declare-fun m!627815 () Bool)

(assert (=> b!654687 m!627815))

(assert (=> b!654687 m!627789))

(declare-fun m!627817 () Bool)

(assert (=> b!654687 m!627817))

(assert (=> b!654672 m!627769))

(assert (=> b!654672 m!627769))

(declare-fun m!627819 () Bool)

(assert (=> b!654672 m!627819))

(assert (=> b!654688 m!627769))

(assert (=> b!654688 m!627789))

(declare-fun m!627821 () Bool)

(assert (=> b!654688 m!627821))

(declare-fun m!627823 () Bool)

(assert (=> b!654682 m!627823))

(assert (=> b!654669 m!627769))

(assert (=> b!654669 m!627769))

(assert (=> b!654669 m!627819))

(declare-fun m!627825 () Bool)

(assert (=> b!654692 m!627825))

(declare-fun m!627827 () Bool)

(assert (=> b!654681 m!627827))

(assert (=> b!654679 m!627769))

(assert (=> b!654679 m!627769))

(declare-fun m!627829 () Bool)

(assert (=> b!654679 m!627829))

(declare-fun m!627831 () Bool)

(assert (=> b!654675 m!627831))

(declare-fun m!627833 () Bool)

(assert (=> start!59336 m!627833))

(declare-fun m!627835 () Bool)

(assert (=> start!59336 m!627835))

(push 1)

