; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57870 () Bool)

(assert start!57870)

(declare-fun b!639643 () Bool)

(declare-fun res!414086 () Bool)

(declare-fun e!366094 () Bool)

(assert (=> b!639643 (=> (not res!414086) (not e!366094))))

(declare-datatypes ((array!38310 0))(
  ( (array!38311 (arr!18373 (Array (_ BitVec 32) (_ BitVec 64))) (size!18737 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38310)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639643 (= res!414086 (validKeyInArray!0 (select (arr!18373 a!2986) j!136)))))

(declare-fun b!639644 () Bool)

(declare-fun res!414094 () Bool)

(declare-fun e!366088 () Bool)

(assert (=> b!639644 (=> (not res!414094) (not e!366088))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38310 (_ BitVec 32)) Bool)

(assert (=> b!639644 (= res!414094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639645 () Bool)

(assert (=> b!639645 (= e!366094 e!366088)))

(declare-fun res!414087 () Bool)

(assert (=> b!639645 (=> (not res!414087) (not e!366088))))

(declare-datatypes ((SeekEntryResult!6769 0))(
  ( (MissingZero!6769 (index!29393 (_ BitVec 32))) (Found!6769 (index!29394 (_ BitVec 32))) (Intermediate!6769 (undefined!7581 Bool) (index!29395 (_ BitVec 32)) (x!58303 (_ BitVec 32))) (Undefined!6769) (MissingVacant!6769 (index!29396 (_ BitVec 32))) )
))
(declare-fun lt!295904 () SeekEntryResult!6769)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639645 (= res!414087 (or (= lt!295904 (MissingZero!6769 i!1108)) (= lt!295904 (MissingVacant!6769 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38310 (_ BitVec 32)) SeekEntryResult!6769)

(assert (=> b!639645 (= lt!295904 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639646 () Bool)

(declare-datatypes ((Unit!21585 0))(
  ( (Unit!21586) )
))
(declare-fun e!366099 () Unit!21585)

(declare-fun Unit!21587 () Unit!21585)

(assert (=> b!639646 (= e!366099 Unit!21587)))

(declare-fun b!639647 () Bool)

(declare-fun e!366096 () Bool)

(declare-fun lt!295910 () SeekEntryResult!6769)

(declare-fun lt!295901 () SeekEntryResult!6769)

(assert (=> b!639647 (= e!366096 (= lt!295910 lt!295901))))

(declare-fun b!639648 () Bool)

(declare-fun e!366091 () Bool)

(assert (=> b!639648 (= e!366088 e!366091)))

(declare-fun res!414090 () Bool)

(assert (=> b!639648 (=> (not res!414090) (not e!366091))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!639648 (= res!414090 (= (select (store (arr!18373 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!295906 () array!38310)

(assert (=> b!639648 (= lt!295906 (array!38311 (store (arr!18373 a!2986) i!1108 k0!1786) (size!18737 a!2986)))))

(declare-fun res!414080 () Bool)

(assert (=> start!57870 (=> (not res!414080) (not e!366094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57870 (= res!414080 (validMask!0 mask!3053))))

(assert (=> start!57870 e!366094))

(assert (=> start!57870 true))

(declare-fun array_inv!14232 (array!38310) Bool)

(assert (=> start!57870 (array_inv!14232 a!2986)))

(declare-fun b!639649 () Bool)

(declare-fun Unit!21588 () Unit!21585)

(assert (=> b!639649 (= e!366099 Unit!21588)))

(assert (=> b!639649 false))

(declare-fun b!639650 () Bool)

(declare-fun e!366092 () Bool)

(declare-fun e!366095 () Bool)

(assert (=> b!639650 (= e!366092 e!366095)))

(declare-fun res!414083 () Bool)

(assert (=> b!639650 (=> res!414083 e!366095)))

(declare-fun lt!295909 () (_ BitVec 64))

(declare-fun lt!295911 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639650 (= res!414083 (or (not (= (select (arr!18373 a!2986) j!136) lt!295911)) (not (= (select (arr!18373 a!2986) j!136) lt!295909)) (bvsge j!136 index!984)))))

(declare-fun e!366098 () Bool)

(assert (=> b!639650 e!366098))

(declare-fun res!414093 () Bool)

(assert (=> b!639650 (=> (not res!414093) (not e!366098))))

(assert (=> b!639650 (= res!414093 (= lt!295909 (select (arr!18373 a!2986) j!136)))))

(assert (=> b!639650 (= lt!295909 (select (store (arr!18373 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!639651 () Bool)

(assert (=> b!639651 (= e!366095 (or (bvsge (size!18737 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18737 a!2986)) (bvsle j!136 (size!18737 a!2986))))))

(declare-datatypes ((List!12321 0))(
  ( (Nil!12318) (Cons!12317 (h!13365 (_ BitVec 64)) (t!18541 List!12321)) )
))
(declare-fun arrayNoDuplicates!0 (array!38310 (_ BitVec 32) List!12321) Bool)

(assert (=> b!639651 (arrayNoDuplicates!0 lt!295906 #b00000000000000000000000000000000 Nil!12318)))

(declare-fun lt!295912 () Unit!21585)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12321) Unit!21585)

(assert (=> b!639651 (= lt!295912 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12318))))

(declare-fun arrayContainsKey!0 (array!38310 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639651 (arrayContainsKey!0 lt!295906 (select (arr!18373 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295905 () Unit!21585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38310 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21585)

(assert (=> b!639651 (= lt!295905 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295906 (select (arr!18373 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639652 () Bool)

(declare-fun e!366093 () Bool)

(assert (=> b!639652 (= e!366091 e!366093)))

(declare-fun res!414082 () Bool)

(assert (=> b!639652 (=> (not res!414082) (not e!366093))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!639652 (= res!414082 (and (= lt!295910 (Found!6769 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18373 a!2986) index!984) (select (arr!18373 a!2986) j!136))) (not (= (select (arr!18373 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38310 (_ BitVec 32)) SeekEntryResult!6769)

(assert (=> b!639652 (= lt!295910 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18373 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639653 () Bool)

(declare-fun res!414089 () Bool)

(assert (=> b!639653 (=> (not res!414089) (not e!366094))))

(assert (=> b!639653 (= res!414089 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639654 () Bool)

(declare-fun res!414084 () Bool)

(assert (=> b!639654 (=> (not res!414084) (not e!366088))))

(assert (=> b!639654 (= res!414084 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18373 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639655 () Bool)

(declare-fun e!366097 () Bool)

(assert (=> b!639655 (= e!366097 (arrayContainsKey!0 lt!295906 (select (arr!18373 a!2986) j!136) index!984))))

(declare-fun b!639656 () Bool)

(declare-fun res!414091 () Bool)

(assert (=> b!639656 (=> (not res!414091) (not e!366088))))

(assert (=> b!639656 (= res!414091 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12318))))

(declare-fun b!639657 () Bool)

(declare-fun e!366090 () Bool)

(assert (=> b!639657 (= e!366098 e!366090)))

(declare-fun res!414088 () Bool)

(assert (=> b!639657 (=> res!414088 e!366090)))

(assert (=> b!639657 (= res!414088 (or (not (= (select (arr!18373 a!2986) j!136) lt!295911)) (not (= (select (arr!18373 a!2986) j!136) lt!295909)) (bvsge j!136 index!984)))))

(declare-fun b!639658 () Bool)

(assert (=> b!639658 (= e!366090 e!366097)))

(declare-fun res!414079 () Bool)

(assert (=> b!639658 (=> (not res!414079) (not e!366097))))

(assert (=> b!639658 (= res!414079 (arrayContainsKey!0 lt!295906 (select (arr!18373 a!2986) j!136) j!136))))

(declare-fun b!639659 () Bool)

(assert (=> b!639659 (= e!366093 (not e!366092))))

(declare-fun res!414085 () Bool)

(assert (=> b!639659 (=> res!414085 e!366092)))

(declare-fun lt!295908 () SeekEntryResult!6769)

(assert (=> b!639659 (= res!414085 (not (= lt!295908 (Found!6769 index!984))))))

(declare-fun lt!295902 () Unit!21585)

(assert (=> b!639659 (= lt!295902 e!366099)))

(declare-fun c!73151 () Bool)

(assert (=> b!639659 (= c!73151 (= lt!295908 Undefined!6769))))

(assert (=> b!639659 (= lt!295908 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295911 lt!295906 mask!3053))))

(assert (=> b!639659 e!366096))

(declare-fun res!414081 () Bool)

(assert (=> b!639659 (=> (not res!414081) (not e!366096))))

(declare-fun lt!295903 () (_ BitVec 32))

(assert (=> b!639659 (= res!414081 (= lt!295901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295903 vacantSpotIndex!68 lt!295911 lt!295906 mask!3053)))))

(assert (=> b!639659 (= lt!295901 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295903 vacantSpotIndex!68 (select (arr!18373 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639659 (= lt!295911 (select (store (arr!18373 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295907 () Unit!21585)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38310 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21585)

(assert (=> b!639659 (= lt!295907 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295903 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639659 (= lt!295903 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!639660 () Bool)

(declare-fun res!414078 () Bool)

(assert (=> b!639660 (=> (not res!414078) (not e!366094))))

(assert (=> b!639660 (= res!414078 (and (= (size!18737 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18737 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18737 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639661 () Bool)

(declare-fun res!414092 () Bool)

(assert (=> b!639661 (=> (not res!414092) (not e!366094))))

(assert (=> b!639661 (= res!414092 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57870 res!414080) b!639660))

(assert (= (and b!639660 res!414078) b!639643))

(assert (= (and b!639643 res!414086) b!639661))

(assert (= (and b!639661 res!414092) b!639653))

(assert (= (and b!639653 res!414089) b!639645))

(assert (= (and b!639645 res!414087) b!639644))

(assert (= (and b!639644 res!414094) b!639656))

(assert (= (and b!639656 res!414091) b!639654))

(assert (= (and b!639654 res!414084) b!639648))

(assert (= (and b!639648 res!414090) b!639652))

(assert (= (and b!639652 res!414082) b!639659))

(assert (= (and b!639659 res!414081) b!639647))

(assert (= (and b!639659 c!73151) b!639649))

(assert (= (and b!639659 (not c!73151)) b!639646))

(assert (= (and b!639659 (not res!414085)) b!639650))

(assert (= (and b!639650 res!414093) b!639657))

(assert (= (and b!639657 (not res!414088)) b!639658))

(assert (= (and b!639658 res!414079) b!639655))

(assert (= (and b!639650 (not res!414083)) b!639651))

(declare-fun m!613879 () Bool)

(assert (=> b!639661 m!613879))

(declare-fun m!613881 () Bool)

(assert (=> b!639645 m!613881))

(declare-fun m!613883 () Bool)

(assert (=> b!639656 m!613883))

(declare-fun m!613885 () Bool)

(assert (=> b!639658 m!613885))

(assert (=> b!639658 m!613885))

(declare-fun m!613887 () Bool)

(assert (=> b!639658 m!613887))

(declare-fun m!613889 () Bool)

(assert (=> b!639644 m!613889))

(assert (=> b!639657 m!613885))

(declare-fun m!613891 () Bool)

(assert (=> b!639653 m!613891))

(declare-fun m!613893 () Bool)

(assert (=> b!639654 m!613893))

(assert (=> b!639655 m!613885))

(assert (=> b!639655 m!613885))

(declare-fun m!613895 () Bool)

(assert (=> b!639655 m!613895))

(declare-fun m!613897 () Bool)

(assert (=> b!639651 m!613897))

(assert (=> b!639651 m!613885))

(assert (=> b!639651 m!613885))

(declare-fun m!613899 () Bool)

(assert (=> b!639651 m!613899))

(assert (=> b!639651 m!613885))

(declare-fun m!613901 () Bool)

(assert (=> b!639651 m!613901))

(declare-fun m!613903 () Bool)

(assert (=> b!639651 m!613903))

(declare-fun m!613905 () Bool)

(assert (=> b!639652 m!613905))

(assert (=> b!639652 m!613885))

(assert (=> b!639652 m!613885))

(declare-fun m!613907 () Bool)

(assert (=> b!639652 m!613907))

(declare-fun m!613909 () Bool)

(assert (=> b!639659 m!613909))

(assert (=> b!639659 m!613885))

(assert (=> b!639659 m!613885))

(declare-fun m!613911 () Bool)

(assert (=> b!639659 m!613911))

(declare-fun m!613913 () Bool)

(assert (=> b!639659 m!613913))

(declare-fun m!613915 () Bool)

(assert (=> b!639659 m!613915))

(declare-fun m!613917 () Bool)

(assert (=> b!639659 m!613917))

(declare-fun m!613919 () Bool)

(assert (=> b!639659 m!613919))

(declare-fun m!613921 () Bool)

(assert (=> b!639659 m!613921))

(assert (=> b!639648 m!613913))

(declare-fun m!613923 () Bool)

(assert (=> b!639648 m!613923))

(assert (=> b!639643 m!613885))

(assert (=> b!639643 m!613885))

(declare-fun m!613925 () Bool)

(assert (=> b!639643 m!613925))

(declare-fun m!613927 () Bool)

(assert (=> start!57870 m!613927))

(declare-fun m!613929 () Bool)

(assert (=> start!57870 m!613929))

(assert (=> b!639650 m!613885))

(assert (=> b!639650 m!613913))

(declare-fun m!613931 () Bool)

(assert (=> b!639650 m!613931))

(check-sat (not b!639656) (not b!639655) (not b!639651) (not b!639644) (not b!639652) (not b!639659) (not b!639658) (not b!639643) (not start!57870) (not b!639661) (not b!639653) (not b!639645))
(check-sat)
