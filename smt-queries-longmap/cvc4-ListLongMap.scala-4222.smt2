; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57930 () Bool)

(assert start!57930)

(declare-fun b!640886 () Bool)

(declare-fun res!415107 () Bool)

(declare-fun e!366900 () Bool)

(assert (=> b!640886 (=> (not res!415107) (not e!366900))))

(declare-datatypes ((array!38357 0))(
  ( (array!38358 (arr!18398 (Array (_ BitVec 32) (_ BitVec 64))) (size!18762 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38357)

(declare-datatypes ((List!12439 0))(
  ( (Nil!12436) (Cons!12435 (h!13480 (_ BitVec 64)) (t!18667 List!12439)) )
))
(declare-fun arrayNoDuplicates!0 (array!38357 (_ BitVec 32) List!12439) Bool)

(assert (=> b!640886 (= res!415107 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12436))))

(declare-fun b!640887 () Bool)

(declare-fun e!366896 () Bool)

(declare-fun e!366897 () Bool)

(assert (=> b!640887 (= e!366896 (not e!366897))))

(declare-fun res!415106 () Bool)

(assert (=> b!640887 (=> res!415106 e!366897)))

(declare-datatypes ((SeekEntryResult!6838 0))(
  ( (MissingZero!6838 (index!29672 (_ BitVec 32))) (Found!6838 (index!29673 (_ BitVec 32))) (Intermediate!6838 (undefined!7650 Bool) (index!29674 (_ BitVec 32)) (x!58426 (_ BitVec 32))) (Undefined!6838) (MissingVacant!6838 (index!29675 (_ BitVec 32))) )
))
(declare-fun lt!296707 () SeekEntryResult!6838)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640887 (= res!415106 (not (= lt!296707 (Found!6838 index!984))))))

(declare-datatypes ((Unit!21686 0))(
  ( (Unit!21687) )
))
(declare-fun lt!296698 () Unit!21686)

(declare-fun e!366889 () Unit!21686)

(assert (=> b!640887 (= lt!296698 e!366889)))

(declare-fun c!73259 () Bool)

(assert (=> b!640887 (= c!73259 (= lt!296707 Undefined!6838))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!296702 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!296708 () array!38357)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38357 (_ BitVec 32)) SeekEntryResult!6838)

(assert (=> b!640887 (= lt!296707 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296702 lt!296708 mask!3053))))

(declare-fun e!366898 () Bool)

(assert (=> b!640887 e!366898))

(declare-fun res!415103 () Bool)

(assert (=> b!640887 (=> (not res!415103) (not e!366898))))

(declare-fun lt!296703 () SeekEntryResult!6838)

(declare-fun lt!296701 () (_ BitVec 32))

(assert (=> b!640887 (= res!415103 (= lt!296703 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296701 vacantSpotIndex!68 lt!296702 lt!296708 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!640887 (= lt!296703 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296701 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640887 (= lt!296702 (select (store (arr!18398 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296709 () Unit!21686)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38357 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21686)

(assert (=> b!640887 (= lt!296709 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296701 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640887 (= lt!296701 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640888 () Bool)

(declare-fun res!415110 () Bool)

(declare-fun e!366894 () Bool)

(assert (=> b!640888 (=> (not res!415110) (not e!366894))))

(declare-fun arrayContainsKey!0 (array!38357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640888 (= res!415110 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640889 () Bool)

(declare-fun Unit!21688 () Unit!21686)

(assert (=> b!640889 (= e!366889 Unit!21688)))

(declare-fun b!640890 () Bool)

(declare-fun e!366893 () Bool)

(declare-fun e!366891 () Bool)

(assert (=> b!640890 (= e!366893 e!366891)))

(declare-fun res!415118 () Bool)

(assert (=> b!640890 (=> (not res!415118) (not e!366891))))

(assert (=> b!640890 (= res!415118 (arrayContainsKey!0 lt!296708 (select (arr!18398 a!2986) j!136) j!136))))

(declare-fun b!640891 () Bool)

(declare-fun e!366890 () Bool)

(assert (=> b!640891 (= e!366890 true)))

(assert (=> b!640891 (arrayNoDuplicates!0 lt!296708 j!136 Nil!12436)))

(declare-fun lt!296706 () Unit!21686)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38357 (_ BitVec 32) (_ BitVec 32)) Unit!21686)

(assert (=> b!640891 (= lt!296706 (lemmaNoDuplicateFromThenFromBigger!0 lt!296708 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640891 (arrayNoDuplicates!0 lt!296708 #b00000000000000000000000000000000 Nil!12436)))

(declare-fun lt!296700 () Unit!21686)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12439) Unit!21686)

(assert (=> b!640891 (= lt!296700 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12436))))

(assert (=> b!640891 (arrayContainsKey!0 lt!296708 (select (arr!18398 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296705 () Unit!21686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38357 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21686)

(assert (=> b!640891 (= lt!296705 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296708 (select (arr!18398 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640892 () Bool)

(assert (=> b!640892 (= e!366897 e!366890)))

(declare-fun res!415115 () Bool)

(assert (=> b!640892 (=> res!415115 e!366890)))

(declare-fun lt!296704 () (_ BitVec 64))

(assert (=> b!640892 (= res!415115 (or (not (= (select (arr!18398 a!2986) j!136) lt!296702)) (not (= (select (arr!18398 a!2986) j!136) lt!296704)) (bvsge j!136 index!984)))))

(declare-fun e!366892 () Bool)

(assert (=> b!640892 e!366892))

(declare-fun res!415112 () Bool)

(assert (=> b!640892 (=> (not res!415112) (not e!366892))))

(assert (=> b!640892 (= res!415112 (= lt!296704 (select (arr!18398 a!2986) j!136)))))

(assert (=> b!640892 (= lt!296704 (select (store (arr!18398 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640893 () Bool)

(declare-fun Unit!21689 () Unit!21686)

(assert (=> b!640893 (= e!366889 Unit!21689)))

(assert (=> b!640893 false))

(declare-fun b!640894 () Bool)

(declare-fun e!366899 () Bool)

(assert (=> b!640894 (= e!366899 e!366896)))

(declare-fun res!415109 () Bool)

(assert (=> b!640894 (=> (not res!415109) (not e!366896))))

(declare-fun lt!296710 () SeekEntryResult!6838)

(assert (=> b!640894 (= res!415109 (and (= lt!296710 (Found!6838 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18398 a!2986) index!984) (select (arr!18398 a!2986) j!136))) (not (= (select (arr!18398 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640894 (= lt!296710 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18398 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640895 () Bool)

(declare-fun res!415111 () Bool)

(assert (=> b!640895 (=> (not res!415111) (not e!366900))))

(assert (=> b!640895 (= res!415111 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18398 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640896 () Bool)

(assert (=> b!640896 (= e!366898 (= lt!296710 lt!296703))))

(declare-fun b!640897 () Bool)

(declare-fun res!415117 () Bool)

(assert (=> b!640897 (=> (not res!415117) (not e!366900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38357 (_ BitVec 32)) Bool)

(assert (=> b!640897 (= res!415117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640898 () Bool)

(assert (=> b!640898 (= e!366892 e!366893)))

(declare-fun res!415105 () Bool)

(assert (=> b!640898 (=> res!415105 e!366893)))

(assert (=> b!640898 (= res!415105 (or (not (= (select (arr!18398 a!2986) j!136) lt!296702)) (not (= (select (arr!18398 a!2986) j!136) lt!296704)) (bvsge j!136 index!984)))))

(declare-fun b!640899 () Bool)

(assert (=> b!640899 (= e!366900 e!366899)))

(declare-fun res!415113 () Bool)

(assert (=> b!640899 (=> (not res!415113) (not e!366899))))

(assert (=> b!640899 (= res!415113 (= (select (store (arr!18398 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640899 (= lt!296708 (array!38358 (store (arr!18398 a!2986) i!1108 k!1786) (size!18762 a!2986)))))

(declare-fun b!640900 () Bool)

(assert (=> b!640900 (= e!366891 (arrayContainsKey!0 lt!296708 (select (arr!18398 a!2986) j!136) index!984))))

(declare-fun b!640901 () Bool)

(declare-fun res!415102 () Bool)

(assert (=> b!640901 (=> (not res!415102) (not e!366894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640901 (= res!415102 (validKeyInArray!0 k!1786))))

(declare-fun b!640902 () Bool)

(declare-fun res!415104 () Bool)

(assert (=> b!640902 (=> (not res!415104) (not e!366894))))

(assert (=> b!640902 (= res!415104 (validKeyInArray!0 (select (arr!18398 a!2986) j!136)))))

(declare-fun res!415114 () Bool)

(assert (=> start!57930 (=> (not res!415114) (not e!366894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57930 (= res!415114 (validMask!0 mask!3053))))

(assert (=> start!57930 e!366894))

(assert (=> start!57930 true))

(declare-fun array_inv!14194 (array!38357) Bool)

(assert (=> start!57930 (array_inv!14194 a!2986)))

(declare-fun b!640903 () Bool)

(declare-fun res!415116 () Bool)

(assert (=> b!640903 (=> (not res!415116) (not e!366894))))

(assert (=> b!640903 (= res!415116 (and (= (size!18762 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18762 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18762 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640904 () Bool)

(assert (=> b!640904 (= e!366894 e!366900)))

(declare-fun res!415108 () Bool)

(assert (=> b!640904 (=> (not res!415108) (not e!366900))))

(declare-fun lt!296699 () SeekEntryResult!6838)

(assert (=> b!640904 (= res!415108 (or (= lt!296699 (MissingZero!6838 i!1108)) (= lt!296699 (MissingVacant!6838 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38357 (_ BitVec 32)) SeekEntryResult!6838)

(assert (=> b!640904 (= lt!296699 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!57930 res!415114) b!640903))

(assert (= (and b!640903 res!415116) b!640902))

(assert (= (and b!640902 res!415104) b!640901))

(assert (= (and b!640901 res!415102) b!640888))

(assert (= (and b!640888 res!415110) b!640904))

(assert (= (and b!640904 res!415108) b!640897))

(assert (= (and b!640897 res!415117) b!640886))

(assert (= (and b!640886 res!415107) b!640895))

(assert (= (and b!640895 res!415111) b!640899))

(assert (= (and b!640899 res!415113) b!640894))

(assert (= (and b!640894 res!415109) b!640887))

(assert (= (and b!640887 res!415103) b!640896))

(assert (= (and b!640887 c!73259) b!640893))

(assert (= (and b!640887 (not c!73259)) b!640889))

(assert (= (and b!640887 (not res!415106)) b!640892))

(assert (= (and b!640892 res!415112) b!640898))

(assert (= (and b!640898 (not res!415105)) b!640890))

(assert (= (and b!640890 res!415118) b!640900))

(assert (= (and b!640892 (not res!415115)) b!640891))

(declare-fun m!614725 () Bool)

(assert (=> b!640901 m!614725))

(declare-fun m!614727 () Bool)

(assert (=> b!640886 m!614727))

(declare-fun m!614729 () Bool)

(assert (=> b!640897 m!614729))

(declare-fun m!614731 () Bool)

(assert (=> b!640902 m!614731))

(assert (=> b!640902 m!614731))

(declare-fun m!614733 () Bool)

(assert (=> b!640902 m!614733))

(declare-fun m!614735 () Bool)

(assert (=> b!640887 m!614735))

(declare-fun m!614737 () Bool)

(assert (=> b!640887 m!614737))

(declare-fun m!614739 () Bool)

(assert (=> b!640887 m!614739))

(assert (=> b!640887 m!614731))

(declare-fun m!614741 () Bool)

(assert (=> b!640887 m!614741))

(declare-fun m!614743 () Bool)

(assert (=> b!640887 m!614743))

(declare-fun m!614745 () Bool)

(assert (=> b!640887 m!614745))

(assert (=> b!640887 m!614731))

(declare-fun m!614747 () Bool)

(assert (=> b!640887 m!614747))

(declare-fun m!614749 () Bool)

(assert (=> b!640888 m!614749))

(assert (=> b!640898 m!614731))

(declare-fun m!614751 () Bool)

(assert (=> b!640895 m!614751))

(declare-fun m!614753 () Bool)

(assert (=> b!640904 m!614753))

(assert (=> b!640900 m!614731))

(assert (=> b!640900 m!614731))

(declare-fun m!614755 () Bool)

(assert (=> b!640900 m!614755))

(declare-fun m!614757 () Bool)

(assert (=> b!640891 m!614757))

(assert (=> b!640891 m!614731))

(declare-fun m!614759 () Bool)

(assert (=> b!640891 m!614759))

(assert (=> b!640891 m!614731))

(declare-fun m!614761 () Bool)

(assert (=> b!640891 m!614761))

(assert (=> b!640891 m!614731))

(declare-fun m!614763 () Bool)

(assert (=> b!640891 m!614763))

(declare-fun m!614765 () Bool)

(assert (=> b!640891 m!614765))

(declare-fun m!614767 () Bool)

(assert (=> b!640891 m!614767))

(declare-fun m!614769 () Bool)

(assert (=> b!640894 m!614769))

(assert (=> b!640894 m!614731))

(assert (=> b!640894 m!614731))

(declare-fun m!614771 () Bool)

(assert (=> b!640894 m!614771))

(declare-fun m!614773 () Bool)

(assert (=> start!57930 m!614773))

(declare-fun m!614775 () Bool)

(assert (=> start!57930 m!614775))

(assert (=> b!640899 m!614741))

(declare-fun m!614777 () Bool)

(assert (=> b!640899 m!614777))

(assert (=> b!640892 m!614731))

(assert (=> b!640892 m!614741))

(declare-fun m!614779 () Bool)

(assert (=> b!640892 m!614779))

(assert (=> b!640890 m!614731))

(assert (=> b!640890 m!614731))

(declare-fun m!614781 () Bool)

(assert (=> b!640890 m!614781))

(push 1)

