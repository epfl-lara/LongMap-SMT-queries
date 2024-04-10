; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54160 () Bool)

(assert start!54160)

(declare-fun res!378626 () Bool)

(declare-fun e!337869 () Bool)

(assert (=> start!54160 (=> (not res!378626) (not e!337869))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54160 (= res!378626 (validMask!0 mask!3053))))

(assert (=> start!54160 e!337869))

(assert (=> start!54160 true))

(declare-datatypes ((array!36890 0))(
  ( (array!36891 (arr!17715 (Array (_ BitVec 32) (_ BitVec 64))) (size!18079 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36890)

(declare-fun array_inv!13511 (array!36890) Bool)

(assert (=> start!54160 (array_inv!13511 a!2986)))

(declare-fun b!591702 () Bool)

(declare-fun e!337864 () Bool)

(declare-fun e!337859 () Bool)

(assert (=> b!591702 (= e!337864 e!337859)))

(declare-fun res!378618 () Bool)

(assert (=> b!591702 (=> (not res!378618) (not e!337859))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591702 (= res!378618 (= (select (store (arr!17715 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268520 () array!36890)

(assert (=> b!591702 (= lt!268520 (array!36891 (store (arr!17715 a!2986) i!1108 k!1786) (size!18079 a!2986)))))

(declare-fun b!591703 () Bool)

(declare-fun res!378625 () Bool)

(assert (=> b!591703 (=> (not res!378625) (not e!337864))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591703 (= res!378625 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17715 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!337862 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!591704 () Bool)

(declare-fun arrayContainsKey!0 (array!36890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591704 (= e!337862 (arrayContainsKey!0 lt!268520 (select (arr!17715 a!2986) j!136) index!984))))

(declare-fun b!591705 () Bool)

(assert (=> b!591705 (= e!337869 e!337864)))

(declare-fun res!378629 () Bool)

(assert (=> b!591705 (=> (not res!378629) (not e!337864))))

(declare-datatypes ((SeekEntryResult!6155 0))(
  ( (MissingZero!6155 (index!26856 (_ BitVec 32))) (Found!6155 (index!26857 (_ BitVec 32))) (Intermediate!6155 (undefined!6967 Bool) (index!26858 (_ BitVec 32)) (x!55651 (_ BitVec 32))) (Undefined!6155) (MissingVacant!6155 (index!26859 (_ BitVec 32))) )
))
(declare-fun lt!268517 () SeekEntryResult!6155)

(assert (=> b!591705 (= res!378629 (or (= lt!268517 (MissingZero!6155 i!1108)) (= lt!268517 (MissingVacant!6155 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36890 (_ BitVec 32)) SeekEntryResult!6155)

(assert (=> b!591705 (= lt!268517 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!591706 () Bool)

(declare-fun e!337863 () Bool)

(declare-fun lt!268514 () SeekEntryResult!6155)

(declare-fun lt!268516 () SeekEntryResult!6155)

(assert (=> b!591706 (= e!337863 (= lt!268514 lt!268516))))

(declare-fun b!591707 () Bool)

(declare-fun e!337865 () Bool)

(assert (=> b!591707 (= e!337865 e!337862)))

(declare-fun res!378624 () Bool)

(assert (=> b!591707 (=> (not res!378624) (not e!337862))))

(assert (=> b!591707 (= res!378624 (arrayContainsKey!0 lt!268520 (select (arr!17715 a!2986) j!136) j!136))))

(declare-fun b!591708 () Bool)

(declare-fun e!337868 () Bool)

(assert (=> b!591708 (= e!337868 true)))

(declare-fun e!337866 () Bool)

(assert (=> b!591708 e!337866))

(declare-fun res!378614 () Bool)

(assert (=> b!591708 (=> (not res!378614) (not e!337866))))

(declare-fun lt!268519 () (_ BitVec 64))

(assert (=> b!591708 (= res!378614 (= lt!268519 (select (arr!17715 a!2986) j!136)))))

(assert (=> b!591708 (= lt!268519 (select (store (arr!17715 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591709 () Bool)

(declare-fun res!378623 () Bool)

(assert (=> b!591709 (=> (not res!378623) (not e!337869))))

(assert (=> b!591709 (= res!378623 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591710 () Bool)

(declare-fun res!378619 () Bool)

(assert (=> b!591710 (=> (not res!378619) (not e!337869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591710 (= res!378619 (validKeyInArray!0 (select (arr!17715 a!2986) j!136)))))

(declare-fun b!591711 () Bool)

(declare-datatypes ((Unit!18538 0))(
  ( (Unit!18539) )
))
(declare-fun e!337861 () Unit!18538)

(declare-fun Unit!18540 () Unit!18538)

(assert (=> b!591711 (= e!337861 Unit!18540)))

(assert (=> b!591711 false))

(declare-fun b!591712 () Bool)

(declare-fun res!378628 () Bool)

(assert (=> b!591712 (=> (not res!378628) (not e!337869))))

(assert (=> b!591712 (= res!378628 (validKeyInArray!0 k!1786))))

(declare-fun b!591713 () Bool)

(declare-fun res!378616 () Bool)

(assert (=> b!591713 (=> (not res!378616) (not e!337864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36890 (_ BitVec 32)) Bool)

(assert (=> b!591713 (= res!378616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591714 () Bool)

(declare-fun res!378620 () Bool)

(assert (=> b!591714 (=> (not res!378620) (not e!337864))))

(declare-datatypes ((List!11756 0))(
  ( (Nil!11753) (Cons!11752 (h!12797 (_ BitVec 64)) (t!17984 List!11756)) )
))
(declare-fun arrayNoDuplicates!0 (array!36890 (_ BitVec 32) List!11756) Bool)

(assert (=> b!591714 (= res!378620 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11753))))

(declare-fun b!591715 () Bool)

(assert (=> b!591715 (= e!337866 e!337865)))

(declare-fun res!378627 () Bool)

(assert (=> b!591715 (=> res!378627 e!337865)))

(declare-fun lt!268521 () (_ BitVec 64))

(assert (=> b!591715 (= res!378627 (or (not (= (select (arr!17715 a!2986) j!136) lt!268521)) (not (= (select (arr!17715 a!2986) j!136) lt!268519)) (bvsge j!136 index!984)))))

(declare-fun b!591716 () Bool)

(declare-fun e!337860 () Bool)

(assert (=> b!591716 (= e!337859 e!337860)))

(declare-fun res!378615 () Bool)

(assert (=> b!591716 (=> (not res!378615) (not e!337860))))

(assert (=> b!591716 (= res!378615 (and (= lt!268514 (Found!6155 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17715 a!2986) index!984) (select (arr!17715 a!2986) j!136))) (not (= (select (arr!17715 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36890 (_ BitVec 32)) SeekEntryResult!6155)

(assert (=> b!591716 (= lt!268514 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17715 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591717 () Bool)

(declare-fun Unit!18541 () Unit!18538)

(assert (=> b!591717 (= e!337861 Unit!18541)))

(declare-fun b!591718 () Bool)

(declare-fun res!378621 () Bool)

(assert (=> b!591718 (=> (not res!378621) (not e!337869))))

(assert (=> b!591718 (= res!378621 (and (= (size!18079 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18079 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18079 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591719 () Bool)

(assert (=> b!591719 (= e!337860 (not e!337868))))

(declare-fun res!378622 () Bool)

(assert (=> b!591719 (=> res!378622 e!337868)))

(declare-fun lt!268515 () SeekEntryResult!6155)

(assert (=> b!591719 (= res!378622 (not (= lt!268515 (Found!6155 index!984))))))

(declare-fun lt!268522 () Unit!18538)

(assert (=> b!591719 (= lt!268522 e!337861)))

(declare-fun c!66911 () Bool)

(assert (=> b!591719 (= c!66911 (= lt!268515 Undefined!6155))))

(assert (=> b!591719 (= lt!268515 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268521 lt!268520 mask!3053))))

(assert (=> b!591719 e!337863))

(declare-fun res!378617 () Bool)

(assert (=> b!591719 (=> (not res!378617) (not e!337863))))

(declare-fun lt!268513 () (_ BitVec 32))

(assert (=> b!591719 (= res!378617 (= lt!268516 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268513 vacantSpotIndex!68 lt!268521 lt!268520 mask!3053)))))

(assert (=> b!591719 (= lt!268516 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268513 vacantSpotIndex!68 (select (arr!17715 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591719 (= lt!268521 (select (store (arr!17715 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268518 () Unit!18538)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36890 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18538)

(assert (=> b!591719 (= lt!268518 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268513 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591719 (= lt!268513 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54160 res!378626) b!591718))

(assert (= (and b!591718 res!378621) b!591710))

(assert (= (and b!591710 res!378619) b!591712))

(assert (= (and b!591712 res!378628) b!591709))

(assert (= (and b!591709 res!378623) b!591705))

(assert (= (and b!591705 res!378629) b!591713))

(assert (= (and b!591713 res!378616) b!591714))

(assert (= (and b!591714 res!378620) b!591703))

(assert (= (and b!591703 res!378625) b!591702))

(assert (= (and b!591702 res!378618) b!591716))

(assert (= (and b!591716 res!378615) b!591719))

(assert (= (and b!591719 res!378617) b!591706))

(assert (= (and b!591719 c!66911) b!591711))

(assert (= (and b!591719 (not c!66911)) b!591717))

(assert (= (and b!591719 (not res!378622)) b!591708))

(assert (= (and b!591708 res!378614) b!591715))

(assert (= (and b!591715 (not res!378627)) b!591707))

(assert (= (and b!591707 res!378624) b!591704))

(declare-fun m!569911 () Bool)

(assert (=> b!591719 m!569911))

(declare-fun m!569913 () Bool)

(assert (=> b!591719 m!569913))

(declare-fun m!569915 () Bool)

(assert (=> b!591719 m!569915))

(declare-fun m!569917 () Bool)

(assert (=> b!591719 m!569917))

(declare-fun m!569919 () Bool)

(assert (=> b!591719 m!569919))

(declare-fun m!569921 () Bool)

(assert (=> b!591719 m!569921))

(declare-fun m!569923 () Bool)

(assert (=> b!591719 m!569923))

(declare-fun m!569925 () Bool)

(assert (=> b!591719 m!569925))

(assert (=> b!591719 m!569923))

(assert (=> b!591702 m!569917))

(declare-fun m!569927 () Bool)

(assert (=> b!591702 m!569927))

(declare-fun m!569929 () Bool)

(assert (=> b!591709 m!569929))

(declare-fun m!569931 () Bool)

(assert (=> start!54160 m!569931))

(declare-fun m!569933 () Bool)

(assert (=> start!54160 m!569933))

(declare-fun m!569935 () Bool)

(assert (=> b!591705 m!569935))

(declare-fun m!569937 () Bool)

(assert (=> b!591714 m!569937))

(assert (=> b!591708 m!569923))

(assert (=> b!591708 m!569917))

(declare-fun m!569939 () Bool)

(assert (=> b!591708 m!569939))

(assert (=> b!591707 m!569923))

(assert (=> b!591707 m!569923))

(declare-fun m!569941 () Bool)

(assert (=> b!591707 m!569941))

(declare-fun m!569943 () Bool)

(assert (=> b!591712 m!569943))

(declare-fun m!569945 () Bool)

(assert (=> b!591716 m!569945))

(assert (=> b!591716 m!569923))

(assert (=> b!591716 m!569923))

(declare-fun m!569947 () Bool)

(assert (=> b!591716 m!569947))

(assert (=> b!591704 m!569923))

(assert (=> b!591704 m!569923))

(declare-fun m!569949 () Bool)

(assert (=> b!591704 m!569949))

(declare-fun m!569951 () Bool)

(assert (=> b!591713 m!569951))

(assert (=> b!591715 m!569923))

(declare-fun m!569953 () Bool)

(assert (=> b!591703 m!569953))

(assert (=> b!591710 m!569923))

(assert (=> b!591710 m!569923))

(declare-fun m!569955 () Bool)

(assert (=> b!591710 m!569955))

(push 1)

