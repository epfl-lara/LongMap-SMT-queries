; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54862 () Bool)

(assert start!54862)

(declare-fun b!599723 () Bool)

(declare-fun e!342878 () Bool)

(declare-fun e!342877 () Bool)

(assert (=> b!599723 (= e!342878 e!342877)))

(declare-fun res!384685 () Bool)

(assert (=> b!599723 (=> (not res!384685) (not e!342877))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37097 0))(
  ( (array!37098 (arr!17808 (Array (_ BitVec 32) (_ BitVec 64))) (size!18172 (_ BitVec 32))) )
))
(declare-fun lt!272676 () array!37097)

(declare-fun a!2986 () array!37097)

(declare-fun arrayContainsKey!0 (array!37097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599723 (= res!384685 (arrayContainsKey!0 lt!272676 (select (arr!17808 a!2986) j!136) j!136))))

(declare-fun b!599724 () Bool)

(declare-fun res!384691 () Bool)

(declare-fun e!342874 () Bool)

(assert (=> b!599724 (=> res!384691 e!342874)))

(declare-datatypes ((List!11849 0))(
  ( (Nil!11846) (Cons!11845 (h!12890 (_ BitVec 64)) (t!18077 List!11849)) )
))
(declare-fun noDuplicate!282 (List!11849) Bool)

(assert (=> b!599724 (= res!384691 (not (noDuplicate!282 Nil!11846)))))

(declare-fun b!599725 () Bool)

(declare-fun res!384688 () Bool)

(declare-fun e!342872 () Bool)

(assert (=> b!599725 (=> (not res!384688) (not e!342872))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599725 (= res!384688 (and (= (size!18172 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18172 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18172 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599726 () Bool)

(declare-datatypes ((Unit!18910 0))(
  ( (Unit!18911) )
))
(declare-fun e!342882 () Unit!18910)

(declare-fun Unit!18912 () Unit!18910)

(assert (=> b!599726 (= e!342882 Unit!18912)))

(assert (=> b!599726 false))

(declare-fun res!384679 () Bool)

(assert (=> start!54862 (=> (not res!384679) (not e!342872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54862 (= res!384679 (validMask!0 mask!3053))))

(assert (=> start!54862 e!342872))

(assert (=> start!54862 true))

(declare-fun array_inv!13604 (array!37097) Bool)

(assert (=> start!54862 (array_inv!13604 a!2986)))

(declare-fun b!599727 () Bool)

(declare-fun Unit!18913 () Unit!18910)

(assert (=> b!599727 (= e!342882 Unit!18913)))

(declare-fun b!599728 () Bool)

(declare-fun e!342876 () Bool)

(declare-datatypes ((SeekEntryResult!6248 0))(
  ( (MissingZero!6248 (index!27249 (_ BitVec 32))) (Found!6248 (index!27250 (_ BitVec 32))) (Intermediate!6248 (undefined!7060 Bool) (index!27251 (_ BitVec 32)) (x!56055 (_ BitVec 32))) (Undefined!6248) (MissingVacant!6248 (index!27252 (_ BitVec 32))) )
))
(declare-fun lt!272688 () SeekEntryResult!6248)

(declare-fun lt!272686 () SeekEntryResult!6248)

(assert (=> b!599728 (= e!342876 (= lt!272688 lt!272686))))

(declare-fun b!599729 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!599729 (= e!342877 (arrayContainsKey!0 lt!272676 (select (arr!17808 a!2986) j!136) index!984))))

(declare-fun b!599730 () Bool)

(declare-fun e!342870 () Bool)

(declare-fun e!342879 () Bool)

(assert (=> b!599730 (= e!342870 e!342879)))

(declare-fun res!384687 () Bool)

(assert (=> b!599730 (=> res!384687 e!342879)))

(declare-fun lt!272689 () (_ BitVec 64))

(declare-fun lt!272684 () (_ BitVec 64))

(assert (=> b!599730 (= res!384687 (or (not (= (select (arr!17808 a!2986) j!136) lt!272689)) (not (= (select (arr!17808 a!2986) j!136) lt!272684)) (bvsge j!136 index!984)))))

(declare-fun e!342875 () Bool)

(assert (=> b!599730 e!342875))

(declare-fun res!384677 () Bool)

(assert (=> b!599730 (=> (not res!384677) (not e!342875))))

(assert (=> b!599730 (= res!384677 (= lt!272684 (select (arr!17808 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!599730 (= lt!272684 (select (store (arr!17808 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!599731 () Bool)

(declare-fun res!384692 () Bool)

(declare-fun e!342881 () Bool)

(assert (=> b!599731 (=> (not res!384692) (not e!342881))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599731 (= res!384692 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17808 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599732 () Bool)

(declare-fun res!384673 () Bool)

(assert (=> b!599732 (=> (not res!384673) (not e!342881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37097 (_ BitVec 32)) Bool)

(assert (=> b!599732 (= res!384673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599733 () Bool)

(assert (=> b!599733 (= e!342874 true)))

(declare-fun lt!272677 () Bool)

(declare-fun contains!2965 (List!11849 (_ BitVec 64)) Bool)

(assert (=> b!599733 (= lt!272677 (contains!2965 Nil!11846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599734 () Bool)

(declare-fun e!342871 () Bool)

(assert (=> b!599734 (= e!342881 e!342871)))

(declare-fun res!384682 () Bool)

(assert (=> b!599734 (=> (not res!384682) (not e!342871))))

(assert (=> b!599734 (= res!384682 (= (select (store (arr!17808 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599734 (= lt!272676 (array!37098 (store (arr!17808 a!2986) i!1108 k!1786) (size!18172 a!2986)))))

(declare-fun b!599735 () Bool)

(assert (=> b!599735 (= e!342879 e!342874)))

(declare-fun res!384675 () Bool)

(assert (=> b!599735 (=> res!384675 e!342874)))

(assert (=> b!599735 (= res!384675 (or (bvsge (size!18172 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18172 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37097 (_ BitVec 32) List!11849) Bool)

(assert (=> b!599735 (arrayNoDuplicates!0 lt!272676 j!136 Nil!11846)))

(declare-fun lt!272687 () Unit!18910)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37097 (_ BitVec 32) (_ BitVec 32)) Unit!18910)

(assert (=> b!599735 (= lt!272687 (lemmaNoDuplicateFromThenFromBigger!0 lt!272676 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599735 (arrayNoDuplicates!0 lt!272676 #b00000000000000000000000000000000 Nil!11846)))

(declare-fun lt!272678 () Unit!18910)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37097 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11849) Unit!18910)

(assert (=> b!599735 (= lt!272678 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11846))))

(assert (=> b!599735 (arrayContainsKey!0 lt!272676 (select (arr!17808 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272682 () Unit!18910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37097 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18910)

(assert (=> b!599735 (= lt!272682 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272676 (select (arr!17808 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599736 () Bool)

(declare-fun res!384684 () Bool)

(assert (=> b!599736 (=> res!384684 e!342874)))

(assert (=> b!599736 (= res!384684 (contains!2965 Nil!11846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599737 () Bool)

(assert (=> b!599737 (= e!342875 e!342878)))

(declare-fun res!384680 () Bool)

(assert (=> b!599737 (=> res!384680 e!342878)))

(assert (=> b!599737 (= res!384680 (or (not (= (select (arr!17808 a!2986) j!136) lt!272689)) (not (= (select (arr!17808 a!2986) j!136) lt!272684)) (bvsge j!136 index!984)))))

(declare-fun b!599738 () Bool)

(assert (=> b!599738 (= e!342872 e!342881)))

(declare-fun res!384681 () Bool)

(assert (=> b!599738 (=> (not res!384681) (not e!342881))))

(declare-fun lt!272680 () SeekEntryResult!6248)

(assert (=> b!599738 (= res!384681 (or (= lt!272680 (MissingZero!6248 i!1108)) (= lt!272680 (MissingVacant!6248 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37097 (_ BitVec 32)) SeekEntryResult!6248)

(assert (=> b!599738 (= lt!272680 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!599739 () Bool)

(declare-fun e!342880 () Bool)

(assert (=> b!599739 (= e!342871 e!342880)))

(declare-fun res!384676 () Bool)

(assert (=> b!599739 (=> (not res!384676) (not e!342880))))

(assert (=> b!599739 (= res!384676 (and (= lt!272688 (Found!6248 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17808 a!2986) index!984) (select (arr!17808 a!2986) j!136))) (not (= (select (arr!17808 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37097 (_ BitVec 32)) SeekEntryResult!6248)

(assert (=> b!599739 (= lt!272688 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17808 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599740 () Bool)

(declare-fun res!384678 () Bool)

(assert (=> b!599740 (=> (not res!384678) (not e!342872))))

(assert (=> b!599740 (= res!384678 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599741 () Bool)

(declare-fun res!384686 () Bool)

(assert (=> b!599741 (=> (not res!384686) (not e!342881))))

(assert (=> b!599741 (= res!384686 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11846))))

(declare-fun b!599742 () Bool)

(assert (=> b!599742 (= e!342880 (not e!342870))))

(declare-fun res!384689 () Bool)

(assert (=> b!599742 (=> res!384689 e!342870)))

(declare-fun lt!272685 () SeekEntryResult!6248)

(assert (=> b!599742 (= res!384689 (not (= lt!272685 (Found!6248 index!984))))))

(declare-fun lt!272681 () Unit!18910)

(assert (=> b!599742 (= lt!272681 e!342882)))

(declare-fun c!67892 () Bool)

(assert (=> b!599742 (= c!67892 (= lt!272685 Undefined!6248))))

(assert (=> b!599742 (= lt!272685 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272689 lt!272676 mask!3053))))

(assert (=> b!599742 e!342876))

(declare-fun res!384690 () Bool)

(assert (=> b!599742 (=> (not res!384690) (not e!342876))))

(declare-fun lt!272679 () (_ BitVec 32))

(assert (=> b!599742 (= res!384690 (= lt!272686 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272679 vacantSpotIndex!68 lt!272689 lt!272676 mask!3053)))))

(assert (=> b!599742 (= lt!272686 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272679 vacantSpotIndex!68 (select (arr!17808 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599742 (= lt!272689 (select (store (arr!17808 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272683 () Unit!18910)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37097 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18910)

(assert (=> b!599742 (= lt!272683 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272679 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599742 (= lt!272679 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599743 () Bool)

(declare-fun res!384674 () Bool)

(assert (=> b!599743 (=> (not res!384674) (not e!342872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599743 (= res!384674 (validKeyInArray!0 (select (arr!17808 a!2986) j!136)))))

(declare-fun b!599744 () Bool)

(declare-fun res!384683 () Bool)

(assert (=> b!599744 (=> (not res!384683) (not e!342872))))

(assert (=> b!599744 (= res!384683 (validKeyInArray!0 k!1786))))

(assert (= (and start!54862 res!384679) b!599725))

(assert (= (and b!599725 res!384688) b!599743))

(assert (= (and b!599743 res!384674) b!599744))

(assert (= (and b!599744 res!384683) b!599740))

(assert (= (and b!599740 res!384678) b!599738))

(assert (= (and b!599738 res!384681) b!599732))

(assert (= (and b!599732 res!384673) b!599741))

(assert (= (and b!599741 res!384686) b!599731))

(assert (= (and b!599731 res!384692) b!599734))

(assert (= (and b!599734 res!384682) b!599739))

(assert (= (and b!599739 res!384676) b!599742))

(assert (= (and b!599742 res!384690) b!599728))

(assert (= (and b!599742 c!67892) b!599726))

(assert (= (and b!599742 (not c!67892)) b!599727))

(assert (= (and b!599742 (not res!384689)) b!599730))

(assert (= (and b!599730 res!384677) b!599737))

(assert (= (and b!599737 (not res!384680)) b!599723))

(assert (= (and b!599723 res!384685) b!599729))

(assert (= (and b!599730 (not res!384687)) b!599735))

(assert (= (and b!599735 (not res!384675)) b!599724))

(assert (= (and b!599724 (not res!384691)) b!599736))

(assert (= (and b!599736 (not res!384684)) b!599733))

(declare-fun m!576965 () Bool)

(assert (=> b!599732 m!576965))

(declare-fun m!576967 () Bool)

(assert (=> start!54862 m!576967))

(declare-fun m!576969 () Bool)

(assert (=> start!54862 m!576969))

(declare-fun m!576971 () Bool)

(assert (=> b!599737 m!576971))

(declare-fun m!576973 () Bool)

(assert (=> b!599736 m!576973))

(declare-fun m!576975 () Bool)

(assert (=> b!599738 m!576975))

(declare-fun m!576977 () Bool)

(assert (=> b!599739 m!576977))

(assert (=> b!599739 m!576971))

(assert (=> b!599739 m!576971))

(declare-fun m!576979 () Bool)

(assert (=> b!599739 m!576979))

(declare-fun m!576981 () Bool)

(assert (=> b!599741 m!576981))

(assert (=> b!599743 m!576971))

(assert (=> b!599743 m!576971))

(declare-fun m!576983 () Bool)

(assert (=> b!599743 m!576983))

(declare-fun m!576985 () Bool)

(assert (=> b!599740 m!576985))

(declare-fun m!576987 () Bool)

(assert (=> b!599731 m!576987))

(declare-fun m!576989 () Bool)

(assert (=> b!599734 m!576989))

(declare-fun m!576991 () Bool)

(assert (=> b!599734 m!576991))

(declare-fun m!576993 () Bool)

(assert (=> b!599724 m!576993))

(declare-fun m!576995 () Bool)

(assert (=> b!599733 m!576995))

(declare-fun m!576997 () Bool)

(assert (=> b!599735 m!576997))

(assert (=> b!599735 m!576971))

(assert (=> b!599735 m!576971))

(declare-fun m!576999 () Bool)

(assert (=> b!599735 m!576999))

(assert (=> b!599735 m!576971))

(declare-fun m!577001 () Bool)

(assert (=> b!599735 m!577001))

(declare-fun m!577003 () Bool)

(assert (=> b!599735 m!577003))

(declare-fun m!577005 () Bool)

(assert (=> b!599735 m!577005))

(declare-fun m!577007 () Bool)

(assert (=> b!599735 m!577007))

(assert (=> b!599730 m!576971))

(assert (=> b!599730 m!576989))

(declare-fun m!577009 () Bool)

(assert (=> b!599730 m!577009))

(declare-fun m!577011 () Bool)

(assert (=> b!599742 m!577011))

(declare-fun m!577013 () Bool)

(assert (=> b!599742 m!577013))

(assert (=> b!599742 m!576971))

(assert (=> b!599742 m!576971))

(declare-fun m!577015 () Bool)

(assert (=> b!599742 m!577015))

(assert (=> b!599742 m!576989))

(declare-fun m!577017 () Bool)

(assert (=> b!599742 m!577017))

(declare-fun m!577019 () Bool)

(assert (=> b!599742 m!577019))

(declare-fun m!577021 () Bool)

(assert (=> b!599742 m!577021))

(declare-fun m!577023 () Bool)

(assert (=> b!599744 m!577023))

(assert (=> b!599729 m!576971))

(assert (=> b!599729 m!576971))

(declare-fun m!577025 () Bool)

(assert (=> b!599729 m!577025))

(assert (=> b!599723 m!576971))

(assert (=> b!599723 m!576971))

(declare-fun m!577027 () Bool)

(assert (=> b!599723 m!577027))

(push 1)

