; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54166 () Bool)

(assert start!54166)

(declare-fun b!591864 () Bool)

(declare-fun res!378763 () Bool)

(declare-fun e!337962 () Bool)

(assert (=> b!591864 (=> (not res!378763) (not e!337962))))

(declare-datatypes ((array!36896 0))(
  ( (array!36897 (arr!17718 (Array (_ BitVec 32) (_ BitVec 64))) (size!18082 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36896)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591864 (= res!378763 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591865 () Bool)

(declare-fun res!378758 () Bool)

(assert (=> b!591865 (=> (not res!378758) (not e!337962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591865 (= res!378758 (validKeyInArray!0 k!1786))))

(declare-fun b!591866 () Bool)

(declare-fun res!378770 () Bool)

(declare-fun e!337964 () Bool)

(assert (=> b!591866 (=> (not res!378770) (not e!337964))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591866 (= res!378770 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17718 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591867 () Bool)

(declare-datatypes ((Unit!18550 0))(
  ( (Unit!18551) )
))
(declare-fun e!337968 () Unit!18550)

(declare-fun Unit!18552 () Unit!18550)

(assert (=> b!591867 (= e!337968 Unit!18552)))

(assert (=> b!591867 false))

(declare-fun res!378761 () Bool)

(assert (=> start!54166 (=> (not res!378761) (not e!337962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54166 (= res!378761 (validMask!0 mask!3053))))

(assert (=> start!54166 e!337962))

(assert (=> start!54166 true))

(declare-fun array_inv!13514 (array!36896) Bool)

(assert (=> start!54166 (array_inv!13514 a!2986)))

(declare-fun b!591868 () Bool)

(declare-fun e!337960 () Bool)

(declare-fun e!337965 () Bool)

(assert (=> b!591868 (= e!337960 e!337965)))

(declare-fun res!378772 () Bool)

(assert (=> b!591868 (=> (not res!378772) (not e!337965))))

(declare-datatypes ((SeekEntryResult!6158 0))(
  ( (MissingZero!6158 (index!26868 (_ BitVec 32))) (Found!6158 (index!26869 (_ BitVec 32))) (Intermediate!6158 (undefined!6970 Bool) (index!26870 (_ BitVec 32)) (x!55662 (_ BitVec 32))) (Undefined!6158) (MissingVacant!6158 (index!26871 (_ BitVec 32))) )
))
(declare-fun lt!268612 () SeekEntryResult!6158)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!591868 (= res!378772 (and (= lt!268612 (Found!6158 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17718 a!2986) index!984) (select (arr!17718 a!2986) j!136))) (not (= (select (arr!17718 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36896 (_ BitVec 32)) SeekEntryResult!6158)

(assert (=> b!591868 (= lt!268612 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17718 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591869 () Bool)

(declare-fun e!337967 () Bool)

(declare-fun lt!268603 () SeekEntryResult!6158)

(assert (=> b!591869 (= e!337967 (= lt!268612 lt!268603))))

(declare-fun e!337961 () Bool)

(declare-fun lt!268609 () array!36896)

(declare-fun b!591870 () Bool)

(assert (=> b!591870 (= e!337961 (arrayContainsKey!0 lt!268609 (select (arr!17718 a!2986) j!136) index!984))))

(declare-fun b!591871 () Bool)

(declare-fun res!378764 () Bool)

(assert (=> b!591871 (=> (not res!378764) (not e!337964))))

(declare-datatypes ((List!11759 0))(
  ( (Nil!11756) (Cons!11755 (h!12800 (_ BitVec 64)) (t!17987 List!11759)) )
))
(declare-fun arrayNoDuplicates!0 (array!36896 (_ BitVec 32) List!11759) Bool)

(assert (=> b!591871 (= res!378764 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11756))))

(declare-fun b!591872 () Bool)

(declare-fun res!378759 () Bool)

(assert (=> b!591872 (=> (not res!378759) (not e!337962))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591872 (= res!378759 (and (= (size!18082 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18082 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18082 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591873 () Bool)

(assert (=> b!591873 (= e!337964 e!337960)))

(declare-fun res!378769 () Bool)

(assert (=> b!591873 (=> (not res!378769) (not e!337960))))

(assert (=> b!591873 (= res!378769 (= (select (store (arr!17718 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591873 (= lt!268609 (array!36897 (store (arr!17718 a!2986) i!1108 k!1786) (size!18082 a!2986)))))

(declare-fun b!591874 () Bool)

(declare-fun res!378760 () Bool)

(assert (=> b!591874 (=> (not res!378760) (not e!337964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36896 (_ BitVec 32)) Bool)

(assert (=> b!591874 (= res!378760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591875 () Bool)

(declare-fun e!337963 () Bool)

(assert (=> b!591875 (= e!337963 true)))

(declare-fun e!337958 () Bool)

(assert (=> b!591875 e!337958))

(declare-fun res!378762 () Bool)

(assert (=> b!591875 (=> (not res!378762) (not e!337958))))

(declare-fun lt!268604 () (_ BitVec 64))

(assert (=> b!591875 (= res!378762 (= lt!268604 (select (arr!17718 a!2986) j!136)))))

(assert (=> b!591875 (= lt!268604 (select (store (arr!17718 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591876 () Bool)

(assert (=> b!591876 (= e!337965 (not e!337963))))

(declare-fun res!378767 () Bool)

(assert (=> b!591876 (=> res!378767 e!337963)))

(declare-fun lt!268610 () SeekEntryResult!6158)

(assert (=> b!591876 (= res!378767 (not (= lt!268610 (Found!6158 index!984))))))

(declare-fun lt!268607 () Unit!18550)

(assert (=> b!591876 (= lt!268607 e!337968)))

(declare-fun c!66920 () Bool)

(assert (=> b!591876 (= c!66920 (= lt!268610 Undefined!6158))))

(declare-fun lt!268608 () (_ BitVec 64))

(assert (=> b!591876 (= lt!268610 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268608 lt!268609 mask!3053))))

(assert (=> b!591876 e!337967))

(declare-fun res!378766 () Bool)

(assert (=> b!591876 (=> (not res!378766) (not e!337967))))

(declare-fun lt!268611 () (_ BitVec 32))

(assert (=> b!591876 (= res!378766 (= lt!268603 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268611 vacantSpotIndex!68 lt!268608 lt!268609 mask!3053)))))

(assert (=> b!591876 (= lt!268603 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268611 vacantSpotIndex!68 (select (arr!17718 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591876 (= lt!268608 (select (store (arr!17718 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268606 () Unit!18550)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36896 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18550)

(assert (=> b!591876 (= lt!268606 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268611 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591876 (= lt!268611 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591877 () Bool)

(assert (=> b!591877 (= e!337962 e!337964)))

(declare-fun res!378768 () Bool)

(assert (=> b!591877 (=> (not res!378768) (not e!337964))))

(declare-fun lt!268605 () SeekEntryResult!6158)

(assert (=> b!591877 (= res!378768 (or (= lt!268605 (MissingZero!6158 i!1108)) (= lt!268605 (MissingVacant!6158 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36896 (_ BitVec 32)) SeekEntryResult!6158)

(assert (=> b!591877 (= lt!268605 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591878 () Bool)

(declare-fun e!337959 () Bool)

(assert (=> b!591878 (= e!337958 e!337959)))

(declare-fun res!378765 () Bool)

(assert (=> b!591878 (=> res!378765 e!337959)))

(assert (=> b!591878 (= res!378765 (or (not (= (select (arr!17718 a!2986) j!136) lt!268608)) (not (= (select (arr!17718 a!2986) j!136) lt!268604)) (bvsge j!136 index!984)))))

(declare-fun b!591879 () Bool)

(declare-fun Unit!18553 () Unit!18550)

(assert (=> b!591879 (= e!337968 Unit!18553)))

(declare-fun b!591880 () Bool)

(declare-fun res!378773 () Bool)

(assert (=> b!591880 (=> (not res!378773) (not e!337962))))

(assert (=> b!591880 (= res!378773 (validKeyInArray!0 (select (arr!17718 a!2986) j!136)))))

(declare-fun b!591881 () Bool)

(assert (=> b!591881 (= e!337959 e!337961)))

(declare-fun res!378771 () Bool)

(assert (=> b!591881 (=> (not res!378771) (not e!337961))))

(assert (=> b!591881 (= res!378771 (arrayContainsKey!0 lt!268609 (select (arr!17718 a!2986) j!136) j!136))))

(assert (= (and start!54166 res!378761) b!591872))

(assert (= (and b!591872 res!378759) b!591880))

(assert (= (and b!591880 res!378773) b!591865))

(assert (= (and b!591865 res!378758) b!591864))

(assert (= (and b!591864 res!378763) b!591877))

(assert (= (and b!591877 res!378768) b!591874))

(assert (= (and b!591874 res!378760) b!591871))

(assert (= (and b!591871 res!378764) b!591866))

(assert (= (and b!591866 res!378770) b!591873))

(assert (= (and b!591873 res!378769) b!591868))

(assert (= (and b!591868 res!378772) b!591876))

(assert (= (and b!591876 res!378766) b!591869))

(assert (= (and b!591876 c!66920) b!591867))

(assert (= (and b!591876 (not c!66920)) b!591879))

(assert (= (and b!591876 (not res!378767)) b!591875))

(assert (= (and b!591875 res!378762) b!591878))

(assert (= (and b!591878 (not res!378765)) b!591881))

(assert (= (and b!591881 res!378771) b!591870))

(declare-fun m!570049 () Bool)

(assert (=> b!591874 m!570049))

(declare-fun m!570051 () Bool)

(assert (=> b!591864 m!570051))

(declare-fun m!570053 () Bool)

(assert (=> b!591871 m!570053))

(declare-fun m!570055 () Bool)

(assert (=> b!591881 m!570055))

(assert (=> b!591881 m!570055))

(declare-fun m!570057 () Bool)

(assert (=> b!591881 m!570057))

(declare-fun m!570059 () Bool)

(assert (=> start!54166 m!570059))

(declare-fun m!570061 () Bool)

(assert (=> start!54166 m!570061))

(declare-fun m!570063 () Bool)

(assert (=> b!591866 m!570063))

(assert (=> b!591870 m!570055))

(assert (=> b!591870 m!570055))

(declare-fun m!570065 () Bool)

(assert (=> b!591870 m!570065))

(assert (=> b!591880 m!570055))

(assert (=> b!591880 m!570055))

(declare-fun m!570067 () Bool)

(assert (=> b!591880 m!570067))

(declare-fun m!570069 () Bool)

(assert (=> b!591877 m!570069))

(declare-fun m!570071 () Bool)

(assert (=> b!591873 m!570071))

(declare-fun m!570073 () Bool)

(assert (=> b!591873 m!570073))

(declare-fun m!570075 () Bool)

(assert (=> b!591868 m!570075))

(assert (=> b!591868 m!570055))

(assert (=> b!591868 m!570055))

(declare-fun m!570077 () Bool)

(assert (=> b!591868 m!570077))

(assert (=> b!591878 m!570055))

(assert (=> b!591875 m!570055))

(assert (=> b!591875 m!570071))

(declare-fun m!570079 () Bool)

(assert (=> b!591875 m!570079))

(declare-fun m!570081 () Bool)

(assert (=> b!591865 m!570081))

(declare-fun m!570083 () Bool)

(assert (=> b!591876 m!570083))

(declare-fun m!570085 () Bool)

(assert (=> b!591876 m!570085))

(assert (=> b!591876 m!570055))

(assert (=> b!591876 m!570071))

(declare-fun m!570087 () Bool)

(assert (=> b!591876 m!570087))

(declare-fun m!570089 () Bool)

(assert (=> b!591876 m!570089))

(assert (=> b!591876 m!570055))

(declare-fun m!570091 () Bool)

(assert (=> b!591876 m!570091))

(declare-fun m!570093 () Bool)

(assert (=> b!591876 m!570093))

(push 1)

