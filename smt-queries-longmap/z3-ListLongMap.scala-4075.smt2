; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55950 () Bool)

(assert start!55950)

(declare-fun b!613462 () Bool)

(declare-fun e!351684 () Bool)

(declare-fun e!351675 () Bool)

(assert (=> b!613462 (= e!351684 e!351675)))

(declare-fun res!394884 () Bool)

(assert (=> b!613462 (=> (not res!394884) (not e!351675))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37420 0))(
  ( (array!37421 (arr!17956 (Array (_ BitVec 32) (_ BitVec 64))) (size!18320 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37420)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!613462 (= res!394884 (= (select (store (arr!17956 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!281172 () array!37420)

(assert (=> b!613462 (= lt!281172 (array!37421 (store (arr!17956 a!2986) i!1108 k0!1786) (size!18320 a!2986)))))

(declare-fun b!613463 () Bool)

(declare-fun e!351682 () Bool)

(declare-fun e!351674 () Bool)

(assert (=> b!613463 (= e!351682 e!351674)))

(declare-fun res!394872 () Bool)

(assert (=> b!613463 (=> res!394872 e!351674)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!613463 (= res!394872 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19756 0))(
  ( (Unit!19757) )
))
(declare-fun lt!281168 () Unit!19756)

(declare-fun e!351681 () Unit!19756)

(assert (=> b!613463 (= lt!281168 e!351681)))

(declare-fun c!69665 () Bool)

(assert (=> b!613463 (= c!69665 (bvslt j!136 index!984))))

(declare-fun b!613464 () Bool)

(declare-fun e!351687 () Bool)

(declare-fun e!351686 () Bool)

(assert (=> b!613464 (= e!351687 (not e!351686))))

(declare-fun res!394880 () Bool)

(assert (=> b!613464 (=> res!394880 e!351686)))

(declare-datatypes ((SeekEntryResult!6396 0))(
  ( (MissingZero!6396 (index!27868 (_ BitVec 32))) (Found!6396 (index!27869 (_ BitVec 32))) (Intermediate!6396 (undefined!7208 Bool) (index!27870 (_ BitVec 32)) (x!56676 (_ BitVec 32))) (Undefined!6396) (MissingVacant!6396 (index!27871 (_ BitVec 32))) )
))
(declare-fun lt!281171 () SeekEntryResult!6396)

(assert (=> b!613464 (= res!394880 (not (= lt!281171 (Found!6396 index!984))))))

(declare-fun lt!281179 () Unit!19756)

(declare-fun e!351677 () Unit!19756)

(assert (=> b!613464 (= lt!281179 e!351677)))

(declare-fun c!69664 () Bool)

(assert (=> b!613464 (= c!69664 (= lt!281171 Undefined!6396))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!281182 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37420 (_ BitVec 32)) SeekEntryResult!6396)

(assert (=> b!613464 (= lt!281171 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!281182 lt!281172 mask!3053))))

(declare-fun e!351685 () Bool)

(assert (=> b!613464 e!351685))

(declare-fun res!394881 () Bool)

(assert (=> b!613464 (=> (not res!394881) (not e!351685))))

(declare-fun lt!281169 () SeekEntryResult!6396)

(declare-fun lt!281167 () (_ BitVec 32))

(assert (=> b!613464 (= res!394881 (= lt!281169 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281167 vacantSpotIndex!68 lt!281182 lt!281172 mask!3053)))))

(assert (=> b!613464 (= lt!281169 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!281167 vacantSpotIndex!68 (select (arr!17956 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!613464 (= lt!281182 (select (store (arr!17956 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!281178 () Unit!19756)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37420 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19756)

(assert (=> b!613464 (= lt!281178 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!281167 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!613464 (= lt!281167 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!394871 () Bool)

(declare-fun e!351673 () Bool)

(assert (=> start!55950 (=> (not res!394871) (not e!351673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55950 (= res!394871 (validMask!0 mask!3053))))

(assert (=> start!55950 e!351673))

(assert (=> start!55950 true))

(declare-fun array_inv!13752 (array!37420) Bool)

(assert (=> start!55950 (array_inv!13752 a!2986)))

(declare-fun b!613465 () Bool)

(declare-fun res!394870 () Bool)

(assert (=> b!613465 (=> (not res!394870) (not e!351684))))

(declare-datatypes ((List!11997 0))(
  ( (Nil!11994) (Cons!11993 (h!13038 (_ BitVec 64)) (t!18225 List!11997)) )
))
(declare-fun arrayNoDuplicates!0 (array!37420 (_ BitVec 32) List!11997) Bool)

(assert (=> b!613465 (= res!394870 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11994))))

(declare-fun b!613466 () Bool)

(declare-fun Unit!19758 () Unit!19756)

(assert (=> b!613466 (= e!351677 Unit!19758)))

(assert (=> b!613466 false))

(declare-fun b!613467 () Bool)

(declare-fun res!394876 () Bool)

(declare-fun e!351676 () Bool)

(assert (=> b!613467 (=> res!394876 e!351676)))

(declare-fun noDuplicate!358 (List!11997) Bool)

(assert (=> b!613467 (= res!394876 (not (noDuplicate!358 Nil!11994)))))

(declare-fun b!613468 () Bool)

(assert (=> b!613468 (= e!351676 true)))

(declare-fun lt!281176 () Bool)

(declare-fun contains!3055 (List!11997 (_ BitVec 64)) Bool)

(assert (=> b!613468 (= lt!281176 (contains!3055 Nil!11994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613469 () Bool)

(declare-fun lt!281185 () SeekEntryResult!6396)

(assert (=> b!613469 (= e!351685 (= lt!281185 lt!281169))))

(declare-fun b!613470 () Bool)

(assert (=> b!613470 (= e!351674 e!351676)))

(declare-fun res!394874 () Bool)

(assert (=> b!613470 (=> res!394874 e!351676)))

(assert (=> b!613470 (= res!394874 (or (bvsge (size!18320 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18320 a!2986)) (bvsge index!984 (size!18320 a!2986))))))

(assert (=> b!613470 (arrayNoDuplicates!0 lt!281172 index!984 Nil!11994)))

(declare-fun lt!281170 () Unit!19756)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37420 (_ BitVec 32) (_ BitVec 32)) Unit!19756)

(assert (=> b!613470 (= lt!281170 (lemmaNoDuplicateFromThenFromBigger!0 lt!281172 #b00000000000000000000000000000000 index!984))))

(assert (=> b!613470 (arrayNoDuplicates!0 lt!281172 #b00000000000000000000000000000000 Nil!11994)))

(declare-fun lt!281181 () Unit!19756)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37420 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11997) Unit!19756)

(assert (=> b!613470 (= lt!281181 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11994))))

(declare-fun arrayContainsKey!0 (array!37420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!613470 (arrayContainsKey!0 lt!281172 (select (arr!17956 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!281184 () Unit!19756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37420 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19756)

(assert (=> b!613470 (= lt!281184 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281172 (select (arr!17956 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!351678 () Bool)

(assert (=> b!613470 e!351678))

(declare-fun res!394883 () Bool)

(assert (=> b!613470 (=> (not res!394883) (not e!351678))))

(assert (=> b!613470 (= res!394883 (arrayContainsKey!0 lt!281172 (select (arr!17956 a!2986) j!136) j!136))))

(declare-fun b!613471 () Bool)

(declare-fun res!394879 () Bool)

(assert (=> b!613471 (=> (not res!394879) (not e!351684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37420 (_ BitVec 32)) Bool)

(assert (=> b!613471 (= res!394879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!613472 () Bool)

(declare-fun res!394877 () Bool)

(assert (=> b!613472 (=> res!394877 e!351676)))

(assert (=> b!613472 (= res!394877 (contains!3055 Nil!11994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!613473 () Bool)

(declare-fun e!351680 () Bool)

(declare-fun e!351679 () Bool)

(assert (=> b!613473 (= e!351680 e!351679)))

(declare-fun res!394878 () Bool)

(assert (=> b!613473 (=> res!394878 e!351679)))

(declare-fun lt!281183 () (_ BitVec 64))

(assert (=> b!613473 (= res!394878 (or (not (= (select (arr!17956 a!2986) j!136) lt!281182)) (not (= (select (arr!17956 a!2986) j!136) lt!281183)) (bvsge j!136 index!984)))))

(declare-fun b!613474 () Bool)

(assert (=> b!613474 (= e!351686 e!351682)))

(declare-fun res!394889 () Bool)

(assert (=> b!613474 (=> res!394889 e!351682)))

(assert (=> b!613474 (= res!394889 (or (not (= (select (arr!17956 a!2986) j!136) lt!281182)) (not (= (select (arr!17956 a!2986) j!136) lt!281183))))))

(assert (=> b!613474 e!351680))

(declare-fun res!394882 () Bool)

(assert (=> b!613474 (=> (not res!394882) (not e!351680))))

(assert (=> b!613474 (= res!394882 (= lt!281183 (select (arr!17956 a!2986) j!136)))))

(assert (=> b!613474 (= lt!281183 (select (store (arr!17956 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!613475 () Bool)

(declare-fun Unit!19759 () Unit!19756)

(assert (=> b!613475 (= e!351677 Unit!19759)))

(declare-fun b!613476 () Bool)

(declare-fun res!394888 () Bool)

(assert (=> b!613476 (=> (not res!394888) (not e!351684))))

(assert (=> b!613476 (= res!394888 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17956 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!613477 () Bool)

(assert (=> b!613477 (= e!351673 e!351684)))

(declare-fun res!394875 () Bool)

(assert (=> b!613477 (=> (not res!394875) (not e!351684))))

(declare-fun lt!281175 () SeekEntryResult!6396)

(assert (=> b!613477 (= res!394875 (or (= lt!281175 (MissingZero!6396 i!1108)) (= lt!281175 (MissingVacant!6396 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37420 (_ BitVec 32)) SeekEntryResult!6396)

(assert (=> b!613477 (= lt!281175 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!613478 () Bool)

(declare-fun e!351672 () Bool)

(assert (=> b!613478 (= e!351672 (arrayContainsKey!0 lt!281172 (select (arr!17956 a!2986) j!136) index!984))))

(declare-fun b!613479 () Bool)

(declare-fun res!394886 () Bool)

(assert (=> b!613479 (=> (not res!394886) (not e!351673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!613479 (= res!394886 (validKeyInArray!0 (select (arr!17956 a!2986) j!136)))))

(declare-fun b!613480 () Bool)

(assert (=> b!613480 (= e!351679 e!351672)))

(declare-fun res!394887 () Bool)

(assert (=> b!613480 (=> (not res!394887) (not e!351672))))

(assert (=> b!613480 (= res!394887 (arrayContainsKey!0 lt!281172 (select (arr!17956 a!2986) j!136) j!136))))

(declare-fun b!613481 () Bool)

(declare-fun res!394868 () Bool)

(assert (=> b!613481 (=> (not res!394868) (not e!351673))))

(assert (=> b!613481 (= res!394868 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!613482 () Bool)

(assert (=> b!613482 (= e!351675 e!351687)))

(declare-fun res!394885 () Bool)

(assert (=> b!613482 (=> (not res!394885) (not e!351687))))

(assert (=> b!613482 (= res!394885 (and (= lt!281185 (Found!6396 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17956 a!2986) index!984) (select (arr!17956 a!2986) j!136))) (not (= (select (arr!17956 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!613482 (= lt!281185 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17956 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!613483 () Bool)

(declare-fun res!394869 () Bool)

(assert (=> b!613483 (=> (not res!394869) (not e!351673))))

(assert (=> b!613483 (= res!394869 (and (= (size!18320 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18320 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18320 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!613484 () Bool)

(assert (=> b!613484 (= e!351678 (arrayContainsKey!0 lt!281172 (select (arr!17956 a!2986) j!136) index!984))))

(declare-fun b!613485 () Bool)

(declare-fun Unit!19760 () Unit!19756)

(assert (=> b!613485 (= e!351681 Unit!19760)))

(declare-fun b!613486 () Bool)

(declare-fun Unit!19761 () Unit!19756)

(assert (=> b!613486 (= e!351681 Unit!19761)))

(declare-fun lt!281173 () Unit!19756)

(assert (=> b!613486 (= lt!281173 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!281172 (select (arr!17956 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!613486 (arrayContainsKey!0 lt!281172 (select (arr!17956 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!281180 () Unit!19756)

(assert (=> b!613486 (= lt!281180 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11994))))

(assert (=> b!613486 (arrayNoDuplicates!0 lt!281172 #b00000000000000000000000000000000 Nil!11994)))

(declare-fun lt!281174 () Unit!19756)

(assert (=> b!613486 (= lt!281174 (lemmaNoDuplicateFromThenFromBigger!0 lt!281172 #b00000000000000000000000000000000 j!136))))

(assert (=> b!613486 (arrayNoDuplicates!0 lt!281172 j!136 Nil!11994)))

(declare-fun lt!281177 () Unit!19756)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37420 (_ BitVec 64) (_ BitVec 32) List!11997) Unit!19756)

(assert (=> b!613486 (= lt!281177 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!281172 (select (arr!17956 a!2986) j!136) j!136 Nil!11994))))

(assert (=> b!613486 false))

(declare-fun b!613487 () Bool)

(declare-fun res!394873 () Bool)

(assert (=> b!613487 (=> (not res!394873) (not e!351673))))

(assert (=> b!613487 (= res!394873 (validKeyInArray!0 k0!1786))))

(assert (= (and start!55950 res!394871) b!613483))

(assert (= (and b!613483 res!394869) b!613479))

(assert (= (and b!613479 res!394886) b!613487))

(assert (= (and b!613487 res!394873) b!613481))

(assert (= (and b!613481 res!394868) b!613477))

(assert (= (and b!613477 res!394875) b!613471))

(assert (= (and b!613471 res!394879) b!613465))

(assert (= (and b!613465 res!394870) b!613476))

(assert (= (and b!613476 res!394888) b!613462))

(assert (= (and b!613462 res!394884) b!613482))

(assert (= (and b!613482 res!394885) b!613464))

(assert (= (and b!613464 res!394881) b!613469))

(assert (= (and b!613464 c!69664) b!613466))

(assert (= (and b!613464 (not c!69664)) b!613475))

(assert (= (and b!613464 (not res!394880)) b!613474))

(assert (= (and b!613474 res!394882) b!613473))

(assert (= (and b!613473 (not res!394878)) b!613480))

(assert (= (and b!613480 res!394887) b!613478))

(assert (= (and b!613474 (not res!394889)) b!613463))

(assert (= (and b!613463 c!69665) b!613486))

(assert (= (and b!613463 (not c!69665)) b!613485))

(assert (= (and b!613463 (not res!394872)) b!613470))

(assert (= (and b!613470 res!394883) b!613484))

(assert (= (and b!613470 (not res!394874)) b!613467))

(assert (= (and b!613467 (not res!394876)) b!613472))

(assert (= (and b!613472 (not res!394877)) b!613468))

(declare-fun m!589747 () Bool)

(assert (=> b!613465 m!589747))

(declare-fun m!589749 () Bool)

(assert (=> b!613470 m!589749))

(declare-fun m!589751 () Bool)

(assert (=> b!613470 m!589751))

(assert (=> b!613470 m!589749))

(declare-fun m!589753 () Bool)

(assert (=> b!613470 m!589753))

(assert (=> b!613470 m!589749))

(declare-fun m!589755 () Bool)

(assert (=> b!613470 m!589755))

(assert (=> b!613470 m!589749))

(declare-fun m!589757 () Bool)

(assert (=> b!613470 m!589757))

(declare-fun m!589759 () Bool)

(assert (=> b!613470 m!589759))

(declare-fun m!589761 () Bool)

(assert (=> b!613470 m!589761))

(declare-fun m!589763 () Bool)

(assert (=> b!613470 m!589763))

(assert (=> b!613484 m!589749))

(assert (=> b!613484 m!589749))

(declare-fun m!589765 () Bool)

(assert (=> b!613484 m!589765))

(declare-fun m!589767 () Bool)

(assert (=> b!613468 m!589767))

(declare-fun m!589769 () Bool)

(assert (=> b!613476 m!589769))

(declare-fun m!589771 () Bool)

(assert (=> b!613467 m!589771))

(declare-fun m!589773 () Bool)

(assert (=> b!613462 m!589773))

(declare-fun m!589775 () Bool)

(assert (=> b!613462 m!589775))

(assert (=> b!613479 m!589749))

(assert (=> b!613479 m!589749))

(declare-fun m!589777 () Bool)

(assert (=> b!613479 m!589777))

(declare-fun m!589779 () Bool)

(assert (=> b!613482 m!589779))

(assert (=> b!613482 m!589749))

(assert (=> b!613482 m!589749))

(declare-fun m!589781 () Bool)

(assert (=> b!613482 m!589781))

(assert (=> b!613480 m!589749))

(assert (=> b!613480 m!589749))

(assert (=> b!613480 m!589757))

(declare-fun m!589783 () Bool)

(assert (=> b!613464 m!589783))

(declare-fun m!589785 () Bool)

(assert (=> b!613464 m!589785))

(assert (=> b!613464 m!589749))

(declare-fun m!589787 () Bool)

(assert (=> b!613464 m!589787))

(assert (=> b!613464 m!589749))

(assert (=> b!613464 m!589773))

(declare-fun m!589789 () Bool)

(assert (=> b!613464 m!589789))

(declare-fun m!589791 () Bool)

(assert (=> b!613464 m!589791))

(declare-fun m!589793 () Bool)

(assert (=> b!613464 m!589793))

(declare-fun m!589795 () Bool)

(assert (=> start!55950 m!589795))

(declare-fun m!589797 () Bool)

(assert (=> start!55950 m!589797))

(assert (=> b!613474 m!589749))

(assert (=> b!613474 m!589773))

(declare-fun m!589799 () Bool)

(assert (=> b!613474 m!589799))

(assert (=> b!613473 m!589749))

(assert (=> b!613486 m!589749))

(declare-fun m!589801 () Bool)

(assert (=> b!613486 m!589801))

(assert (=> b!613486 m!589749))

(assert (=> b!613486 m!589749))

(declare-fun m!589803 () Bool)

(assert (=> b!613486 m!589803))

(declare-fun m!589805 () Bool)

(assert (=> b!613486 m!589805))

(assert (=> b!613486 m!589761))

(declare-fun m!589807 () Bool)

(assert (=> b!613486 m!589807))

(assert (=> b!613486 m!589749))

(declare-fun m!589809 () Bool)

(assert (=> b!613486 m!589809))

(assert (=> b!613486 m!589763))

(declare-fun m!589811 () Bool)

(assert (=> b!613487 m!589811))

(declare-fun m!589813 () Bool)

(assert (=> b!613477 m!589813))

(declare-fun m!589815 () Bool)

(assert (=> b!613481 m!589815))

(declare-fun m!589817 () Bool)

(assert (=> b!613471 m!589817))

(declare-fun m!589819 () Bool)

(assert (=> b!613472 m!589819))

(assert (=> b!613478 m!589749))

(assert (=> b!613478 m!589749))

(assert (=> b!613478 m!589765))

(check-sat (not b!613486) (not b!613478) (not b!613484) (not b!613472) (not b!613482) (not b!613464) (not b!613471) (not b!613480) (not b!613487) (not b!613467) (not b!613481) (not b!613477) (not b!613468) (not start!55950) (not b!613465) (not b!613479) (not b!613470))
(check-sat)
