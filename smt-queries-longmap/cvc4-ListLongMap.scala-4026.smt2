; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54866 () Bool)

(assert start!54866)

(declare-fun b!599855 () Bool)

(declare-datatypes ((Unit!18918 0))(
  ( (Unit!18919) )
))
(declare-fun e!342952 () Unit!18918)

(declare-fun Unit!18920 () Unit!18918)

(assert (=> b!599855 (= e!342952 Unit!18920)))

(declare-fun b!599856 () Bool)

(declare-fun res!384804 () Bool)

(declare-fun e!342951 () Bool)

(assert (=> b!599856 (=> res!384804 e!342951)))

(declare-datatypes ((List!11851 0))(
  ( (Nil!11848) (Cons!11847 (h!12892 (_ BitVec 64)) (t!18079 List!11851)) )
))
(declare-fun noDuplicate!284 (List!11851) Bool)

(assert (=> b!599856 (= res!384804 (not (noDuplicate!284 Nil!11848)))))

(declare-fun b!599857 () Bool)

(declare-fun e!342953 () Bool)

(declare-fun e!342950 () Bool)

(assert (=> b!599857 (= e!342953 e!342950)))

(declare-fun res!384805 () Bool)

(assert (=> b!599857 (=> (not res!384805) (not e!342950))))

(declare-datatypes ((SeekEntryResult!6250 0))(
  ( (MissingZero!6250 (index!27257 (_ BitVec 32))) (Found!6250 (index!27258 (_ BitVec 32))) (Intermediate!6250 (undefined!7062 Bool) (index!27259 (_ BitVec 32)) (x!56057 (_ BitVec 32))) (Undefined!6250) (MissingVacant!6250 (index!27260 (_ BitVec 32))) )
))
(declare-fun lt!272761 () SeekEntryResult!6250)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599857 (= res!384805 (or (= lt!272761 (MissingZero!6250 i!1108)) (= lt!272761 (MissingVacant!6250 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37101 0))(
  ( (array!37102 (arr!17810 (Array (_ BitVec 32) (_ BitVec 64))) (size!18174 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37101)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37101 (_ BitVec 32)) SeekEntryResult!6250)

(assert (=> b!599857 (= lt!272761 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599858 () Bool)

(declare-fun res!384808 () Bool)

(assert (=> b!599858 (=> (not res!384808) (not e!342950))))

(declare-fun arrayNoDuplicates!0 (array!37101 (_ BitVec 32) List!11851) Bool)

(assert (=> b!599858 (= res!384808 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11848))))

(declare-fun b!599859 () Bool)

(declare-fun res!384809 () Bool)

(assert (=> b!599859 (=> (not res!384809) (not e!342953))))

(declare-fun arrayContainsKey!0 (array!37101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599859 (= res!384809 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599860 () Bool)

(declare-fun Unit!18921 () Unit!18918)

(assert (=> b!599860 (= e!342952 Unit!18921)))

(assert (=> b!599860 false))

(declare-fun b!599861 () Bool)

(declare-fun res!384797 () Bool)

(assert (=> b!599861 (=> (not res!384797) (not e!342953))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599861 (= res!384797 (validKeyInArray!0 (select (arr!17810 a!2986) j!136)))))

(declare-fun b!599862 () Bool)

(declare-fun res!384812 () Bool)

(assert (=> b!599862 (=> (not res!384812) (not e!342953))))

(assert (=> b!599862 (= res!384812 (validKeyInArray!0 k!1786))))

(declare-fun b!599863 () Bool)

(declare-fun e!342954 () Bool)

(declare-fun e!342949 () Bool)

(assert (=> b!599863 (= e!342954 e!342949)))

(declare-fun res!384807 () Bool)

(assert (=> b!599863 (=> (not res!384807) (not e!342949))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272772 () SeekEntryResult!6250)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599863 (= res!384807 (and (= lt!272772 (Found!6250 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17810 a!2986) index!984) (select (arr!17810 a!2986) j!136))) (not (= (select (arr!17810 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37101 (_ BitVec 32)) SeekEntryResult!6250)

(assert (=> b!599863 (= lt!272772 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17810 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599864 () Bool)

(declare-fun e!342956 () Bool)

(declare-fun e!342958 () Bool)

(assert (=> b!599864 (= e!342956 e!342958)))

(declare-fun res!384799 () Bool)

(assert (=> b!599864 (=> res!384799 e!342958)))

(declare-fun lt!272768 () (_ BitVec 64))

(declare-fun lt!272770 () (_ BitVec 64))

(assert (=> b!599864 (= res!384799 (or (not (= (select (arr!17810 a!2986) j!136) lt!272768)) (not (= (select (arr!17810 a!2986) j!136) lt!272770)) (bvsge j!136 index!984)))))

(declare-fun b!599865 () Bool)

(declare-fun e!342957 () Bool)

(assert (=> b!599865 (= e!342958 e!342957)))

(declare-fun res!384801 () Bool)

(assert (=> b!599865 (=> (not res!384801) (not e!342957))))

(declare-fun lt!272765 () array!37101)

(assert (=> b!599865 (= res!384801 (arrayContainsKey!0 lt!272765 (select (arr!17810 a!2986) j!136) j!136))))

(declare-fun res!384802 () Bool)

(assert (=> start!54866 (=> (not res!384802) (not e!342953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54866 (= res!384802 (validMask!0 mask!3053))))

(assert (=> start!54866 e!342953))

(assert (=> start!54866 true))

(declare-fun array_inv!13606 (array!37101) Bool)

(assert (=> start!54866 (array_inv!13606 a!2986)))

(declare-fun b!599866 () Bool)

(declare-fun res!384798 () Bool)

(assert (=> b!599866 (=> (not res!384798) (not e!342950))))

(assert (=> b!599866 (= res!384798 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17810 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599867 () Bool)

(declare-fun res!384811 () Bool)

(assert (=> b!599867 (=> (not res!384811) (not e!342953))))

(assert (=> b!599867 (= res!384811 (and (= (size!18174 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18174 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18174 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599868 () Bool)

(assert (=> b!599868 (= e!342951 true)))

(declare-fun lt!272767 () Bool)

(declare-fun contains!2967 (List!11851 (_ BitVec 64)) Bool)

(assert (=> b!599868 (= lt!272767 (contains!2967 Nil!11848 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599869 () Bool)

(declare-fun e!342959 () Bool)

(declare-fun e!342960 () Bool)

(assert (=> b!599869 (= e!342959 e!342960)))

(declare-fun res!384810 () Bool)

(assert (=> b!599869 (=> res!384810 e!342960)))

(assert (=> b!599869 (= res!384810 (or (not (= (select (arr!17810 a!2986) j!136) lt!272768)) (not (= (select (arr!17810 a!2986) j!136) lt!272770)) (bvsge j!136 index!984)))))

(assert (=> b!599869 e!342956))

(declare-fun res!384796 () Bool)

(assert (=> b!599869 (=> (not res!384796) (not e!342956))))

(assert (=> b!599869 (= res!384796 (= lt!272770 (select (arr!17810 a!2986) j!136)))))

(assert (=> b!599869 (= lt!272770 (select (store (arr!17810 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599870 () Bool)

(declare-fun res!384795 () Bool)

(assert (=> b!599870 (=> res!384795 e!342951)))

(assert (=> b!599870 (= res!384795 (contains!2967 Nil!11848 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599871 () Bool)

(assert (=> b!599871 (= e!342949 (not e!342959))))

(declare-fun res!384794 () Bool)

(assert (=> b!599871 (=> res!384794 e!342959)))

(declare-fun lt!272762 () SeekEntryResult!6250)

(assert (=> b!599871 (= res!384794 (not (= lt!272762 (Found!6250 index!984))))))

(declare-fun lt!272760 () Unit!18918)

(assert (=> b!599871 (= lt!272760 e!342952)))

(declare-fun c!67898 () Bool)

(assert (=> b!599871 (= c!67898 (= lt!272762 Undefined!6250))))

(assert (=> b!599871 (= lt!272762 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272768 lt!272765 mask!3053))))

(declare-fun e!342955 () Bool)

(assert (=> b!599871 e!342955))

(declare-fun res!384806 () Bool)

(assert (=> b!599871 (=> (not res!384806) (not e!342955))))

(declare-fun lt!272771 () (_ BitVec 32))

(declare-fun lt!272766 () SeekEntryResult!6250)

(assert (=> b!599871 (= res!384806 (= lt!272766 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272771 vacantSpotIndex!68 lt!272768 lt!272765 mask!3053)))))

(assert (=> b!599871 (= lt!272766 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272771 vacantSpotIndex!68 (select (arr!17810 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599871 (= lt!272768 (select (store (arr!17810 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272769 () Unit!18918)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37101 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18918)

(assert (=> b!599871 (= lt!272769 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272771 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599871 (= lt!272771 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599872 () Bool)

(assert (=> b!599872 (= e!342960 e!342951)))

(declare-fun res!384803 () Bool)

(assert (=> b!599872 (=> res!384803 e!342951)))

(assert (=> b!599872 (= res!384803 (or (bvsge (size!18174 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18174 a!2986))))))

(assert (=> b!599872 (arrayNoDuplicates!0 lt!272765 j!136 Nil!11848)))

(declare-fun lt!272763 () Unit!18918)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37101 (_ BitVec 32) (_ BitVec 32)) Unit!18918)

(assert (=> b!599872 (= lt!272763 (lemmaNoDuplicateFromThenFromBigger!0 lt!272765 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599872 (arrayNoDuplicates!0 lt!272765 #b00000000000000000000000000000000 Nil!11848)))

(declare-fun lt!272773 () Unit!18918)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37101 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11851) Unit!18918)

(assert (=> b!599872 (= lt!272773 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11848))))

(assert (=> b!599872 (arrayContainsKey!0 lt!272765 (select (arr!17810 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272764 () Unit!18918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37101 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18918)

(assert (=> b!599872 (= lt!272764 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272765 (select (arr!17810 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599873 () Bool)

(declare-fun res!384793 () Bool)

(assert (=> b!599873 (=> (not res!384793) (not e!342950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37101 (_ BitVec 32)) Bool)

(assert (=> b!599873 (= res!384793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599874 () Bool)

(assert (=> b!599874 (= e!342957 (arrayContainsKey!0 lt!272765 (select (arr!17810 a!2986) j!136) index!984))))

(declare-fun b!599875 () Bool)

(assert (=> b!599875 (= e!342950 e!342954)))

(declare-fun res!384800 () Bool)

(assert (=> b!599875 (=> (not res!384800) (not e!342954))))

(assert (=> b!599875 (= res!384800 (= (select (store (arr!17810 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599875 (= lt!272765 (array!37102 (store (arr!17810 a!2986) i!1108 k!1786) (size!18174 a!2986)))))

(declare-fun b!599876 () Bool)

(assert (=> b!599876 (= e!342955 (= lt!272772 lt!272766))))

(assert (= (and start!54866 res!384802) b!599867))

(assert (= (and b!599867 res!384811) b!599861))

(assert (= (and b!599861 res!384797) b!599862))

(assert (= (and b!599862 res!384812) b!599859))

(assert (= (and b!599859 res!384809) b!599857))

(assert (= (and b!599857 res!384805) b!599873))

(assert (= (and b!599873 res!384793) b!599858))

(assert (= (and b!599858 res!384808) b!599866))

(assert (= (and b!599866 res!384798) b!599875))

(assert (= (and b!599875 res!384800) b!599863))

(assert (= (and b!599863 res!384807) b!599871))

(assert (= (and b!599871 res!384806) b!599876))

(assert (= (and b!599871 c!67898) b!599860))

(assert (= (and b!599871 (not c!67898)) b!599855))

(assert (= (and b!599871 (not res!384794)) b!599869))

(assert (= (and b!599869 res!384796) b!599864))

(assert (= (and b!599864 (not res!384799)) b!599865))

(assert (= (and b!599865 res!384801) b!599874))

(assert (= (and b!599869 (not res!384810)) b!599872))

(assert (= (and b!599872 (not res!384803)) b!599856))

(assert (= (and b!599856 (not res!384804)) b!599870))

(assert (= (and b!599870 (not res!384795)) b!599868))

(declare-fun m!577093 () Bool)

(assert (=> b!599865 m!577093))

(assert (=> b!599865 m!577093))

(declare-fun m!577095 () Bool)

(assert (=> b!599865 m!577095))

(assert (=> b!599874 m!577093))

(assert (=> b!599874 m!577093))

(declare-fun m!577097 () Bool)

(assert (=> b!599874 m!577097))

(assert (=> b!599861 m!577093))

(assert (=> b!599861 m!577093))

(declare-fun m!577099 () Bool)

(assert (=> b!599861 m!577099))

(declare-fun m!577101 () Bool)

(assert (=> b!599857 m!577101))

(declare-fun m!577103 () Bool)

(assert (=> b!599870 m!577103))

(declare-fun m!577105 () Bool)

(assert (=> b!599863 m!577105))

(assert (=> b!599863 m!577093))

(assert (=> b!599863 m!577093))

(declare-fun m!577107 () Bool)

(assert (=> b!599863 m!577107))

(assert (=> b!599864 m!577093))

(declare-fun m!577109 () Bool)

(assert (=> b!599866 m!577109))

(declare-fun m!577111 () Bool)

(assert (=> b!599859 m!577111))

(assert (=> b!599869 m!577093))

(declare-fun m!577113 () Bool)

(assert (=> b!599869 m!577113))

(declare-fun m!577115 () Bool)

(assert (=> b!599869 m!577115))

(declare-fun m!577117 () Bool)

(assert (=> b!599856 m!577117))

(assert (=> b!599875 m!577113))

(declare-fun m!577119 () Bool)

(assert (=> b!599875 m!577119))

(declare-fun m!577121 () Bool)

(assert (=> b!599862 m!577121))

(declare-fun m!577123 () Bool)

(assert (=> b!599871 m!577123))

(declare-fun m!577125 () Bool)

(assert (=> b!599871 m!577125))

(assert (=> b!599871 m!577093))

(assert (=> b!599871 m!577113))

(declare-fun m!577127 () Bool)

(assert (=> b!599871 m!577127))

(declare-fun m!577129 () Bool)

(assert (=> b!599871 m!577129))

(assert (=> b!599871 m!577093))

(declare-fun m!577131 () Bool)

(assert (=> b!599871 m!577131))

(declare-fun m!577133 () Bool)

(assert (=> b!599871 m!577133))

(declare-fun m!577135 () Bool)

(assert (=> start!54866 m!577135))

(declare-fun m!577137 () Bool)

(assert (=> start!54866 m!577137))

(declare-fun m!577139 () Bool)

(assert (=> b!599873 m!577139))

(declare-fun m!577141 () Bool)

(assert (=> b!599858 m!577141))

(assert (=> b!599872 m!577093))

(declare-fun m!577143 () Bool)

(assert (=> b!599872 m!577143))

(assert (=> b!599872 m!577093))

(declare-fun m!577145 () Bool)

(assert (=> b!599872 m!577145))

(assert (=> b!599872 m!577093))

(declare-fun m!577147 () Bool)

(assert (=> b!599872 m!577147))

(declare-fun m!577149 () Bool)

(assert (=> b!599872 m!577149))

(declare-fun m!577151 () Bool)

(assert (=> b!599872 m!577151))

(declare-fun m!577153 () Bool)

(assert (=> b!599872 m!577153))

(declare-fun m!577155 () Bool)

(assert (=> b!599868 m!577155))

(push 1)

