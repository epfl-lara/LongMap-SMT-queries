; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58856 () Bool)

(assert start!58856)

(declare-fun b!648838 () Bool)

(declare-fun e!372130 () Bool)

(declare-fun e!372134 () Bool)

(assert (=> b!648838 (= e!372130 e!372134)))

(declare-fun res!420551 () Bool)

(assert (=> b!648838 (=> res!420551 e!372134)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!648838 (= res!420551 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22070 0))(
  ( (Unit!22071) )
))
(declare-fun lt!301136 () Unit!22070)

(declare-fun e!372137 () Unit!22070)

(assert (=> b!648838 (= lt!301136 e!372137)))

(declare-fun c!74516 () Bool)

(assert (=> b!648838 (= c!74516 (bvslt j!136 index!984))))

(declare-fun b!648839 () Bool)

(declare-fun e!372141 () Bool)

(declare-fun e!372133 () Bool)

(assert (=> b!648839 (= e!372141 e!372133)))

(declare-fun res!420543 () Bool)

(assert (=> b!648839 (=> (not res!420543) (not e!372133))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6907 0))(
  ( (MissingZero!6907 (index!29975 (_ BitVec 32))) (Found!6907 (index!29976 (_ BitVec 32))) (Intermediate!6907 (undefined!7719 Bool) (index!29977 (_ BitVec 32)) (x!58771 (_ BitVec 32))) (Undefined!6907) (MissingVacant!6907 (index!29978 (_ BitVec 32))) )
))
(declare-fun lt!301129 () SeekEntryResult!6907)

(declare-datatypes ((array!38529 0))(
  ( (array!38530 (arr!18470 (Array (_ BitVec 32) (_ BitVec 64))) (size!18835 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38529)

(assert (=> b!648839 (= res!420543 (and (= lt!301129 (Found!6907 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18470 a!2986) index!984) (select (arr!18470 a!2986) j!136))) (not (= (select (arr!18470 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38529 (_ BitVec 32)) SeekEntryResult!6907)

(assert (=> b!648839 (= lt!301129 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18470 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!301132 () array!38529)

(declare-fun e!372132 () Bool)

(declare-fun b!648840 () Bool)

(declare-fun arrayContainsKey!0 (array!38529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648840 (= e!372132 (arrayContainsKey!0 lt!301132 (select (arr!18470 a!2986) j!136) index!984))))

(declare-fun b!648841 () Bool)

(declare-fun res!420547 () Bool)

(declare-fun e!372131 () Bool)

(assert (=> b!648841 (=> res!420547 e!372131)))

(declare-datatypes ((List!12550 0))(
  ( (Nil!12547) (Cons!12546 (h!13591 (_ BitVec 64)) (t!18769 List!12550)) )
))
(declare-fun contains!3151 (List!12550 (_ BitVec 64)) Bool)

(assert (=> b!648841 (= res!420547 (contains!3151 Nil!12547 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648842 () Bool)

(declare-fun res!420552 () Bool)

(declare-fun e!372135 () Bool)

(assert (=> b!648842 (=> (not res!420552) (not e!372135))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!648842 (= res!420552 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648843 () Bool)

(declare-fun e!372142 () Bool)

(declare-fun lt!301135 () SeekEntryResult!6907)

(assert (=> b!648843 (= e!372142 (= lt!301129 lt!301135))))

(declare-fun b!648844 () Bool)

(declare-fun e!372129 () Unit!22070)

(declare-fun Unit!22072 () Unit!22070)

(assert (=> b!648844 (= e!372129 Unit!22072)))

(declare-fun b!648845 () Bool)

(declare-fun e!372138 () Bool)

(assert (=> b!648845 (= e!372138 e!372141)))

(declare-fun res!420540 () Bool)

(assert (=> b!648845 (=> (not res!420540) (not e!372141))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!648845 (= res!420540 (= (select (store (arr!18470 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648845 (= lt!301132 (array!38530 (store (arr!18470 a!2986) i!1108 k0!1786) (size!18835 a!2986)))))

(declare-fun b!648847 () Bool)

(declare-fun Unit!22073 () Unit!22070)

(assert (=> b!648847 (= e!372129 Unit!22073)))

(assert (=> b!648847 false))

(declare-fun b!648848 () Bool)

(declare-fun res!420541 () Bool)

(assert (=> b!648848 (=> (not res!420541) (not e!372135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648848 (= res!420541 (validKeyInArray!0 (select (arr!18470 a!2986) j!136)))))

(declare-fun b!648849 () Bool)

(declare-fun res!420546 () Bool)

(assert (=> b!648849 (=> (not res!420546) (not e!372135))))

(assert (=> b!648849 (= res!420546 (and (= (size!18835 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18835 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18835 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648850 () Bool)

(declare-fun e!372143 () Bool)

(assert (=> b!648850 (= e!372133 (not e!372143))))

(declare-fun res!420550 () Bool)

(assert (=> b!648850 (=> res!420550 e!372143)))

(declare-fun lt!301128 () SeekEntryResult!6907)

(assert (=> b!648850 (= res!420550 (not (= lt!301128 (Found!6907 index!984))))))

(declare-fun lt!301133 () Unit!22070)

(assert (=> b!648850 (= lt!301133 e!372129)))

(declare-fun c!74517 () Bool)

(assert (=> b!648850 (= c!74517 (= lt!301128 Undefined!6907))))

(declare-fun lt!301122 () (_ BitVec 64))

(assert (=> b!648850 (= lt!301128 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301122 lt!301132 mask!3053))))

(assert (=> b!648850 e!372142))

(declare-fun res!420559 () Bool)

(assert (=> b!648850 (=> (not res!420559) (not e!372142))))

(declare-fun lt!301126 () (_ BitVec 32))

(assert (=> b!648850 (= res!420559 (= lt!301135 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301126 vacantSpotIndex!68 lt!301122 lt!301132 mask!3053)))))

(assert (=> b!648850 (= lt!301135 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301126 vacantSpotIndex!68 (select (arr!18470 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648850 (= lt!301122 (select (store (arr!18470 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301131 () Unit!22070)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22070)

(assert (=> b!648850 (= lt!301131 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301126 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648850 (= lt!301126 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648851 () Bool)

(assert (=> b!648851 (= e!372135 e!372138)))

(declare-fun res!420555 () Bool)

(assert (=> b!648851 (=> (not res!420555) (not e!372138))))

(declare-fun lt!301124 () SeekEntryResult!6907)

(assert (=> b!648851 (= res!420555 (or (= lt!301124 (MissingZero!6907 i!1108)) (= lt!301124 (MissingVacant!6907 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38529 (_ BitVec 32)) SeekEntryResult!6907)

(assert (=> b!648851 (= lt!301124 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648852 () Bool)

(declare-fun Unit!22074 () Unit!22070)

(assert (=> b!648852 (= e!372137 Unit!22074)))

(declare-fun lt!301134 () Unit!22070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22070)

(assert (=> b!648852 (= lt!301134 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301132 (select (arr!18470 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648852 (arrayContainsKey!0 lt!301132 (select (arr!18470 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301125 () Unit!22070)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12550) Unit!22070)

(assert (=> b!648852 (= lt!301125 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12547))))

(declare-fun arrayNoDuplicates!0 (array!38529 (_ BitVec 32) List!12550) Bool)

(assert (=> b!648852 (arrayNoDuplicates!0 lt!301132 #b00000000000000000000000000000000 Nil!12547)))

(declare-fun lt!301127 () Unit!22070)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38529 (_ BitVec 32) (_ BitVec 32)) Unit!22070)

(assert (=> b!648852 (= lt!301127 (lemmaNoDuplicateFromThenFromBigger!0 lt!301132 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648852 (arrayNoDuplicates!0 lt!301132 j!136 Nil!12547)))

(declare-fun lt!301121 () Unit!22070)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38529 (_ BitVec 64) (_ BitVec 32) List!12550) Unit!22070)

(assert (=> b!648852 (= lt!301121 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301132 (select (arr!18470 a!2986) j!136) j!136 Nil!12547))))

(assert (=> b!648852 false))

(declare-fun b!648853 () Bool)

(declare-fun res!420542 () Bool)

(assert (=> b!648853 (=> (not res!420542) (not e!372138))))

(assert (=> b!648853 (= res!420542 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18470 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648854 () Bool)

(declare-fun res!420548 () Bool)

(assert (=> b!648854 (=> res!420548 e!372131)))

(assert (=> b!648854 (= res!420548 (contains!3151 Nil!12547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648855 () Bool)

(declare-fun res!420549 () Bool)

(assert (=> b!648855 (=> (not res!420549) (not e!372135))))

(assert (=> b!648855 (= res!420549 (validKeyInArray!0 k0!1786))))

(declare-fun b!648856 () Bool)

(declare-fun e!372128 () Bool)

(declare-fun e!372136 () Bool)

(assert (=> b!648856 (= e!372128 e!372136)))

(declare-fun res!420545 () Bool)

(assert (=> b!648856 (=> res!420545 e!372136)))

(declare-fun lt!301123 () (_ BitVec 64))

(assert (=> b!648856 (= res!420545 (or (not (= (select (arr!18470 a!2986) j!136) lt!301122)) (not (= (select (arr!18470 a!2986) j!136) lt!301123)) (bvsge j!136 index!984)))))

(declare-fun b!648857 () Bool)

(declare-fun res!420561 () Bool)

(assert (=> b!648857 (=> (not res!420561) (not e!372138))))

(assert (=> b!648857 (= res!420561 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12547))))

(declare-fun b!648858 () Bool)

(declare-fun res!420557 () Bool)

(assert (=> b!648858 (=> res!420557 e!372131)))

(declare-fun noDuplicate!434 (List!12550) Bool)

(assert (=> b!648858 (= res!420557 (not (noDuplicate!434 Nil!12547)))))

(declare-fun b!648859 () Bool)

(declare-fun res!420553 () Bool)

(assert (=> b!648859 (=> (not res!420553) (not e!372138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38529 (_ BitVec 32)) Bool)

(assert (=> b!648859 (= res!420553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648860 () Bool)

(assert (=> b!648860 (= e!372131 true)))

(declare-fun lt!301130 () Bool)

(assert (=> b!648860 (= lt!301130 (contains!3151 Nil!12547 k0!1786))))

(declare-fun b!648861 () Bool)

(assert (=> b!648861 (= e!372143 e!372130)))

(declare-fun res!420562 () Bool)

(assert (=> b!648861 (=> res!420562 e!372130)))

(assert (=> b!648861 (= res!420562 (or (not (= (select (arr!18470 a!2986) j!136) lt!301122)) (not (= (select (arr!18470 a!2986) j!136) lt!301123))))))

(assert (=> b!648861 e!372128))

(declare-fun res!420558 () Bool)

(assert (=> b!648861 (=> (not res!420558) (not e!372128))))

(assert (=> b!648861 (= res!420558 (= lt!301123 (select (arr!18470 a!2986) j!136)))))

(assert (=> b!648861 (= lt!301123 (select (store (arr!18470 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648862 () Bool)

(declare-fun e!372139 () Bool)

(assert (=> b!648862 (= e!372136 e!372139)))

(declare-fun res!420556 () Bool)

(assert (=> b!648862 (=> (not res!420556) (not e!372139))))

(assert (=> b!648862 (= res!420556 (arrayContainsKey!0 lt!301132 (select (arr!18470 a!2986) j!136) j!136))))

(declare-fun res!420560 () Bool)

(assert (=> start!58856 (=> (not res!420560) (not e!372135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58856 (= res!420560 (validMask!0 mask!3053))))

(assert (=> start!58856 e!372135))

(assert (=> start!58856 true))

(declare-fun array_inv!14353 (array!38529) Bool)

(assert (=> start!58856 (array_inv!14353 a!2986)))

(declare-fun b!648846 () Bool)

(assert (=> b!648846 (= e!372134 e!372131)))

(declare-fun res!420554 () Bool)

(assert (=> b!648846 (=> res!420554 e!372131)))

(assert (=> b!648846 (= res!420554 (or (bvsge (size!18835 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18835 a!2986))))))

(assert (=> b!648846 (arrayContainsKey!0 lt!301132 (select (arr!18470 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301137 () Unit!22070)

(assert (=> b!648846 (= lt!301137 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301132 (select (arr!18470 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!648846 e!372132))

(declare-fun res!420544 () Bool)

(assert (=> b!648846 (=> (not res!420544) (not e!372132))))

(assert (=> b!648846 (= res!420544 (arrayContainsKey!0 lt!301132 (select (arr!18470 a!2986) j!136) j!136))))

(declare-fun b!648863 () Bool)

(assert (=> b!648863 (= e!372139 (arrayContainsKey!0 lt!301132 (select (arr!18470 a!2986) j!136) index!984))))

(declare-fun b!648864 () Bool)

(declare-fun Unit!22075 () Unit!22070)

(assert (=> b!648864 (= e!372137 Unit!22075)))

(assert (= (and start!58856 res!420560) b!648849))

(assert (= (and b!648849 res!420546) b!648848))

(assert (= (and b!648848 res!420541) b!648855))

(assert (= (and b!648855 res!420549) b!648842))

(assert (= (and b!648842 res!420552) b!648851))

(assert (= (and b!648851 res!420555) b!648859))

(assert (= (and b!648859 res!420553) b!648857))

(assert (= (and b!648857 res!420561) b!648853))

(assert (= (and b!648853 res!420542) b!648845))

(assert (= (and b!648845 res!420540) b!648839))

(assert (= (and b!648839 res!420543) b!648850))

(assert (= (and b!648850 res!420559) b!648843))

(assert (= (and b!648850 c!74517) b!648847))

(assert (= (and b!648850 (not c!74517)) b!648844))

(assert (= (and b!648850 (not res!420550)) b!648861))

(assert (= (and b!648861 res!420558) b!648856))

(assert (= (and b!648856 (not res!420545)) b!648862))

(assert (= (and b!648862 res!420556) b!648863))

(assert (= (and b!648861 (not res!420562)) b!648838))

(assert (= (and b!648838 c!74516) b!648852))

(assert (= (and b!648838 (not c!74516)) b!648864))

(assert (= (and b!648838 (not res!420551)) b!648846))

(assert (= (and b!648846 res!420544) b!648840))

(assert (= (and b!648846 (not res!420554)) b!648858))

(assert (= (and b!648858 (not res!420557)) b!648854))

(assert (= (and b!648854 (not res!420548)) b!648841))

(assert (= (and b!648841 (not res!420547)) b!648860))

(declare-fun m!621639 () Bool)

(assert (=> b!648851 m!621639))

(declare-fun m!621641 () Bool)

(assert (=> b!648852 m!621641))

(declare-fun m!621643 () Bool)

(assert (=> b!648852 m!621643))

(declare-fun m!621645 () Bool)

(assert (=> b!648852 m!621645))

(assert (=> b!648852 m!621643))

(declare-fun m!621647 () Bool)

(assert (=> b!648852 m!621647))

(assert (=> b!648852 m!621643))

(declare-fun m!621649 () Bool)

(assert (=> b!648852 m!621649))

(assert (=> b!648852 m!621643))

(declare-fun m!621651 () Bool)

(assert (=> b!648852 m!621651))

(declare-fun m!621653 () Bool)

(assert (=> b!648852 m!621653))

(declare-fun m!621655 () Bool)

(assert (=> b!648852 m!621655))

(declare-fun m!621657 () Bool)

(assert (=> b!648845 m!621657))

(declare-fun m!621659 () Bool)

(assert (=> b!648845 m!621659))

(declare-fun m!621661 () Bool)

(assert (=> b!648853 m!621661))

(assert (=> b!648863 m!621643))

(assert (=> b!648863 m!621643))

(declare-fun m!621663 () Bool)

(assert (=> b!648863 m!621663))

(assert (=> b!648856 m!621643))

(declare-fun m!621665 () Bool)

(assert (=> b!648839 m!621665))

(assert (=> b!648839 m!621643))

(assert (=> b!648839 m!621643))

(declare-fun m!621667 () Bool)

(assert (=> b!648839 m!621667))

(declare-fun m!621669 () Bool)

(assert (=> start!58856 m!621669))

(declare-fun m!621671 () Bool)

(assert (=> start!58856 m!621671))

(declare-fun m!621673 () Bool)

(assert (=> b!648850 m!621673))

(assert (=> b!648850 m!621643))

(declare-fun m!621675 () Bool)

(assert (=> b!648850 m!621675))

(declare-fun m!621677 () Bool)

(assert (=> b!648850 m!621677))

(declare-fun m!621679 () Bool)

(assert (=> b!648850 m!621679))

(declare-fun m!621681 () Bool)

(assert (=> b!648850 m!621681))

(assert (=> b!648850 m!621643))

(declare-fun m!621683 () Bool)

(assert (=> b!648850 m!621683))

(assert (=> b!648850 m!621657))

(declare-fun m!621685 () Bool)

(assert (=> b!648859 m!621685))

(declare-fun m!621687 () Bool)

(assert (=> b!648855 m!621687))

(assert (=> b!648848 m!621643))

(assert (=> b!648848 m!621643))

(declare-fun m!621689 () Bool)

(assert (=> b!648848 m!621689))

(declare-fun m!621691 () Bool)

(assert (=> b!648854 m!621691))

(declare-fun m!621693 () Bool)

(assert (=> b!648857 m!621693))

(assert (=> b!648862 m!621643))

(assert (=> b!648862 m!621643))

(declare-fun m!621695 () Bool)

(assert (=> b!648862 m!621695))

(declare-fun m!621697 () Bool)

(assert (=> b!648842 m!621697))

(declare-fun m!621699 () Bool)

(assert (=> b!648841 m!621699))

(assert (=> b!648861 m!621643))

(assert (=> b!648861 m!621657))

(declare-fun m!621701 () Bool)

(assert (=> b!648861 m!621701))

(assert (=> b!648840 m!621643))

(assert (=> b!648840 m!621643))

(assert (=> b!648840 m!621663))

(declare-fun m!621703 () Bool)

(assert (=> b!648858 m!621703))

(declare-fun m!621705 () Bool)

(assert (=> b!648860 m!621705))

(assert (=> b!648846 m!621643))

(assert (=> b!648846 m!621643))

(declare-fun m!621707 () Bool)

(assert (=> b!648846 m!621707))

(assert (=> b!648846 m!621643))

(declare-fun m!621709 () Bool)

(assert (=> b!648846 m!621709))

(assert (=> b!648846 m!621643))

(assert (=> b!648846 m!621695))

(check-sat (not b!648854) (not b!648860) (not b!648851) (not b!648863) (not b!648857) (not b!648858) (not b!648862) (not b!648859) (not b!648850) (not b!648842) (not b!648840) (not start!58856) (not b!648852) (not b!648846) (not b!648848) (not b!648839) (not b!648841) (not b!648855))
(check-sat)
