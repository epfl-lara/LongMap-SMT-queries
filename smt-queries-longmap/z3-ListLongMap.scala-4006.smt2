; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54492 () Bool)

(assert start!54492)

(declare-fun b!594624 () Bool)

(declare-fun res!380701 () Bool)

(declare-fun e!339720 () Bool)

(assert (=> b!594624 (=> (not res!380701) (not e!339720))))

(declare-datatypes ((array!36966 0))(
  ( (array!36967 (arr!17747 (Array (_ BitVec 32) (_ BitVec 64))) (size!18112 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36966)

(declare-datatypes ((List!11827 0))(
  ( (Nil!11824) (Cons!11823 (h!12868 (_ BitVec 64)) (t!18046 List!11827)) )
))
(declare-fun arrayNoDuplicates!0 (array!36966 (_ BitVec 32) List!11827) Bool)

(assert (=> b!594624 (= res!380701 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11824))))

(declare-fun b!594625 () Bool)

(declare-fun res!380702 () Bool)

(declare-fun e!339725 () Bool)

(assert (=> b!594625 (=> (not res!380702) (not e!339725))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594625 (= res!380702 (validKeyInArray!0 k0!1786))))

(declare-fun b!594626 () Bool)

(declare-fun res!380690 () Bool)

(declare-fun e!339727 () Bool)

(assert (=> b!594626 (=> res!380690 e!339727)))

(declare-fun contains!2911 (List!11827 (_ BitVec 64)) Bool)

(assert (=> b!594626 (= res!380690 (contains!2911 Nil!11824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594627 () Bool)

(declare-fun res!380703 () Bool)

(assert (=> b!594627 (=> (not res!380703) (not e!339720))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594627 (= res!380703 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17747 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!380708 () Bool)

(assert (=> start!54492 (=> (not res!380708) (not e!339725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54492 (= res!380708 (validMask!0 mask!3053))))

(assert (=> start!54492 e!339725))

(assert (=> start!54492 true))

(declare-fun array_inv!13630 (array!36966) Bool)

(assert (=> start!54492 (array_inv!13630 a!2986)))

(declare-fun b!594628 () Bool)

(declare-fun e!339721 () Bool)

(declare-datatypes ((SeekEntryResult!6184 0))(
  ( (MissingZero!6184 (index!26984 (_ BitVec 32))) (Found!6184 (index!26985 (_ BitVec 32))) (Intermediate!6184 (undefined!6996 Bool) (index!26986 (_ BitVec 32)) (x!55799 (_ BitVec 32))) (Undefined!6184) (MissingVacant!6184 (index!26987 (_ BitVec 32))) )
))
(declare-fun lt!269855 () SeekEntryResult!6184)

(declare-fun lt!269861 () SeekEntryResult!6184)

(assert (=> b!594628 (= e!339721 (= lt!269855 lt!269861))))

(declare-fun b!594629 () Bool)

(declare-datatypes ((Unit!18648 0))(
  ( (Unit!18649) )
))
(declare-fun e!339723 () Unit!18648)

(declare-fun Unit!18650 () Unit!18648)

(assert (=> b!594629 (= e!339723 Unit!18650)))

(assert (=> b!594629 false))

(declare-fun b!594630 () Bool)

(declare-fun e!339732 () Bool)

(declare-fun e!339726 () Bool)

(assert (=> b!594630 (= e!339732 e!339726)))

(declare-fun res!380688 () Bool)

(assert (=> b!594630 (=> (not res!380688) (not e!339726))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!594630 (= res!380688 (and (= lt!269855 (Found!6184 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17747 a!2986) index!984) (select (arr!17747 a!2986) j!136))) (not (= (select (arr!17747 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36966 (_ BitVec 32)) SeekEntryResult!6184)

(assert (=> b!594630 (= lt!269855 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17747 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594631 () Bool)

(declare-fun res!380691 () Bool)

(assert (=> b!594631 (=> res!380691 e!339727)))

(declare-fun noDuplicate!248 (List!11827) Bool)

(assert (=> b!594631 (= res!380691 (not (noDuplicate!248 Nil!11824)))))

(declare-fun b!594632 () Bool)

(declare-fun res!380706 () Bool)

(assert (=> b!594632 (=> (not res!380706) (not e!339725))))

(assert (=> b!594632 (= res!380706 (validKeyInArray!0 (select (arr!17747 a!2986) j!136)))))

(declare-fun b!594633 () Bool)

(declare-fun e!339731 () Bool)

(declare-fun e!339729 () Bool)

(assert (=> b!594633 (= e!339731 e!339729)))

(declare-fun res!380694 () Bool)

(assert (=> b!594633 (=> (not res!380694) (not e!339729))))

(declare-fun lt!269853 () array!36966)

(declare-fun arrayContainsKey!0 (array!36966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594633 (= res!380694 (arrayContainsKey!0 lt!269853 (select (arr!17747 a!2986) j!136) j!136))))

(declare-fun b!594634 () Bool)

(declare-fun e!339724 () Bool)

(assert (=> b!594634 (= e!339724 e!339731)))

(declare-fun res!380698 () Bool)

(assert (=> b!594634 (=> res!380698 e!339731)))

(declare-fun lt!269852 () (_ BitVec 64))

(declare-fun lt!269863 () (_ BitVec 64))

(assert (=> b!594634 (= res!380698 (or (not (= (select (arr!17747 a!2986) j!136) lt!269852)) (not (= (select (arr!17747 a!2986) j!136) lt!269863)) (bvsge j!136 index!984)))))

(declare-fun b!594635 () Bool)

(declare-fun e!339722 () Bool)

(declare-fun e!339730 () Bool)

(assert (=> b!594635 (= e!339722 e!339730)))

(declare-fun res!380705 () Bool)

(assert (=> b!594635 (=> res!380705 e!339730)))

(assert (=> b!594635 (= res!380705 (or (not (= (select (arr!17747 a!2986) j!136) lt!269852)) (not (= (select (arr!17747 a!2986) j!136) lt!269863)) (bvsge j!136 index!984)))))

(assert (=> b!594635 e!339724))

(declare-fun res!380697 () Bool)

(assert (=> b!594635 (=> (not res!380697) (not e!339724))))

(assert (=> b!594635 (= res!380697 (= lt!269863 (select (arr!17747 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594635 (= lt!269863 (select (store (arr!17747 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594636 () Bool)

(assert (=> b!594636 (= e!339726 (not e!339722))))

(declare-fun res!380704 () Bool)

(assert (=> b!594636 (=> res!380704 e!339722)))

(declare-fun lt!269860 () SeekEntryResult!6184)

(assert (=> b!594636 (= res!380704 (not (= lt!269860 (Found!6184 index!984))))))

(declare-fun lt!269857 () Unit!18648)

(assert (=> b!594636 (= lt!269857 e!339723)))

(declare-fun c!67335 () Bool)

(assert (=> b!594636 (= c!67335 (= lt!269860 Undefined!6184))))

(assert (=> b!594636 (= lt!269860 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269852 lt!269853 mask!3053))))

(assert (=> b!594636 e!339721))

(declare-fun res!380692 () Bool)

(assert (=> b!594636 (=> (not res!380692) (not e!339721))))

(declare-fun lt!269856 () (_ BitVec 32))

(assert (=> b!594636 (= res!380692 (= lt!269861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269856 vacantSpotIndex!68 lt!269852 lt!269853 mask!3053)))))

(assert (=> b!594636 (= lt!269861 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269856 vacantSpotIndex!68 (select (arr!17747 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594636 (= lt!269852 (select (store (arr!17747 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269854 () Unit!18648)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36966 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18648)

(assert (=> b!594636 (= lt!269854 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269856 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594636 (= lt!269856 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594637 () Bool)

(declare-fun res!380707 () Bool)

(assert (=> b!594637 (=> (not res!380707) (not e!339720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36966 (_ BitVec 32)) Bool)

(assert (=> b!594637 (= res!380707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594638 () Bool)

(declare-fun res!380695 () Bool)

(assert (=> b!594638 (=> res!380695 e!339727)))

(assert (=> b!594638 (= res!380695 (contains!2911 Nil!11824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594639 () Bool)

(assert (=> b!594639 (= e!339725 e!339720)))

(declare-fun res!380696 () Bool)

(assert (=> b!594639 (=> (not res!380696) (not e!339720))))

(declare-fun lt!269858 () SeekEntryResult!6184)

(assert (=> b!594639 (= res!380696 (or (= lt!269858 (MissingZero!6184 i!1108)) (= lt!269858 (MissingVacant!6184 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36966 (_ BitVec 32)) SeekEntryResult!6184)

(assert (=> b!594639 (= lt!269858 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594640 () Bool)

(assert (=> b!594640 (= e!339720 e!339732)))

(declare-fun res!380699 () Bool)

(assert (=> b!594640 (=> (not res!380699) (not e!339732))))

(assert (=> b!594640 (= res!380699 (= (select (store (arr!17747 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594640 (= lt!269853 (array!36967 (store (arr!17747 a!2986) i!1108 k0!1786) (size!18112 a!2986)))))

(declare-fun b!594641 () Bool)

(assert (=> b!594641 (= e!339729 (arrayContainsKey!0 lt!269853 (select (arr!17747 a!2986) j!136) index!984))))

(declare-fun b!594642 () Bool)

(declare-fun res!380700 () Bool)

(assert (=> b!594642 (=> (not res!380700) (not e!339725))))

(assert (=> b!594642 (= res!380700 (and (= (size!18112 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18112 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18112 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594643 () Bool)

(assert (=> b!594643 (= e!339730 e!339727)))

(declare-fun res!380689 () Bool)

(assert (=> b!594643 (=> res!380689 e!339727)))

(assert (=> b!594643 (= res!380689 (or (bvsge (size!18112 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18112 a!2986))))))

(assert (=> b!594643 (arrayContainsKey!0 lt!269853 (select (arr!17747 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269862 () Unit!18648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36966 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18648)

(assert (=> b!594643 (= lt!269862 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269853 (select (arr!17747 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594644 () Bool)

(declare-fun Unit!18651 () Unit!18648)

(assert (=> b!594644 (= e!339723 Unit!18651)))

(declare-fun b!594645 () Bool)

(assert (=> b!594645 (= e!339727 true)))

(declare-fun lt!269859 () Bool)

(assert (=> b!594645 (= lt!269859 (contains!2911 Nil!11824 k0!1786))))

(declare-fun b!594646 () Bool)

(declare-fun res!380693 () Bool)

(assert (=> b!594646 (=> (not res!380693) (not e!339725))))

(assert (=> b!594646 (= res!380693 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!54492 res!380708) b!594642))

(assert (= (and b!594642 res!380700) b!594632))

(assert (= (and b!594632 res!380706) b!594625))

(assert (= (and b!594625 res!380702) b!594646))

(assert (= (and b!594646 res!380693) b!594639))

(assert (= (and b!594639 res!380696) b!594637))

(assert (= (and b!594637 res!380707) b!594624))

(assert (= (and b!594624 res!380701) b!594627))

(assert (= (and b!594627 res!380703) b!594640))

(assert (= (and b!594640 res!380699) b!594630))

(assert (= (and b!594630 res!380688) b!594636))

(assert (= (and b!594636 res!380692) b!594628))

(assert (= (and b!594636 c!67335) b!594629))

(assert (= (and b!594636 (not c!67335)) b!594644))

(assert (= (and b!594636 (not res!380704)) b!594635))

(assert (= (and b!594635 res!380697) b!594634))

(assert (= (and b!594634 (not res!380698)) b!594633))

(assert (= (and b!594633 res!380694) b!594641))

(assert (= (and b!594635 (not res!380705)) b!594643))

(assert (= (and b!594643 (not res!380689)) b!594631))

(assert (= (and b!594631 (not res!380691)) b!594638))

(assert (= (and b!594638 (not res!380695)) b!594626))

(assert (= (and b!594626 (not res!380690)) b!594645))

(declare-fun m!571861 () Bool)

(assert (=> b!594626 m!571861))

(declare-fun m!571863 () Bool)

(assert (=> b!594645 m!571863))

(declare-fun m!571865 () Bool)

(assert (=> b!594636 m!571865))

(declare-fun m!571867 () Bool)

(assert (=> b!594636 m!571867))

(declare-fun m!571869 () Bool)

(assert (=> b!594636 m!571869))

(declare-fun m!571871 () Bool)

(assert (=> b!594636 m!571871))

(declare-fun m!571873 () Bool)

(assert (=> b!594636 m!571873))

(declare-fun m!571875 () Bool)

(assert (=> b!594636 m!571875))

(assert (=> b!594636 m!571869))

(declare-fun m!571877 () Bool)

(assert (=> b!594636 m!571877))

(declare-fun m!571879 () Bool)

(assert (=> b!594636 m!571879))

(assert (=> b!594632 m!571869))

(assert (=> b!594632 m!571869))

(declare-fun m!571881 () Bool)

(assert (=> b!594632 m!571881))

(assert (=> b!594640 m!571873))

(declare-fun m!571883 () Bool)

(assert (=> b!594640 m!571883))

(declare-fun m!571885 () Bool)

(assert (=> b!594625 m!571885))

(declare-fun m!571887 () Bool)

(assert (=> b!594638 m!571887))

(assert (=> b!594641 m!571869))

(assert (=> b!594641 m!571869))

(declare-fun m!571889 () Bool)

(assert (=> b!594641 m!571889))

(declare-fun m!571891 () Bool)

(assert (=> b!594624 m!571891))

(assert (=> b!594633 m!571869))

(assert (=> b!594633 m!571869))

(declare-fun m!571893 () Bool)

(assert (=> b!594633 m!571893))

(declare-fun m!571895 () Bool)

(assert (=> b!594637 m!571895))

(assert (=> b!594643 m!571869))

(assert (=> b!594643 m!571869))

(declare-fun m!571897 () Bool)

(assert (=> b!594643 m!571897))

(assert (=> b!594643 m!571869))

(declare-fun m!571899 () Bool)

(assert (=> b!594643 m!571899))

(declare-fun m!571901 () Bool)

(assert (=> b!594630 m!571901))

(assert (=> b!594630 m!571869))

(assert (=> b!594630 m!571869))

(declare-fun m!571903 () Bool)

(assert (=> b!594630 m!571903))

(declare-fun m!571905 () Bool)

(assert (=> b!594627 m!571905))

(declare-fun m!571907 () Bool)

(assert (=> b!594631 m!571907))

(declare-fun m!571909 () Bool)

(assert (=> b!594639 m!571909))

(assert (=> b!594635 m!571869))

(assert (=> b!594635 m!571873))

(declare-fun m!571911 () Bool)

(assert (=> b!594635 m!571911))

(declare-fun m!571913 () Bool)

(assert (=> b!594646 m!571913))

(assert (=> b!594634 m!571869))

(declare-fun m!571915 () Bool)

(assert (=> start!54492 m!571915))

(declare-fun m!571917 () Bool)

(assert (=> start!54492 m!571917))

(check-sat (not b!594646) (not b!594645) (not b!594638) (not b!594637) (not b!594641) (not b!594633) (not b!594624) (not b!594639) (not b!594643) (not b!594631) (not b!594630) (not b!594625) (not b!594636) (not start!54492) (not b!594626) (not b!594632))
(check-sat)
