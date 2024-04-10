; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54830 () Bool)

(assert start!54830)

(declare-fun b!598751 () Bool)

(declare-fun res!383808 () Bool)

(declare-fun e!342276 () Bool)

(assert (=> b!598751 (=> (not res!383808) (not e!342276))))

(declare-datatypes ((array!37065 0))(
  ( (array!37066 (arr!17792 (Array (_ BitVec 32) (_ BitVec 64))) (size!18156 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37065)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598751 (= res!383808 (validKeyInArray!0 (select (arr!17792 a!2986) j!136)))))

(declare-fun b!598752 () Bool)

(declare-fun res!383807 () Bool)

(assert (=> b!598752 (=> (not res!383807) (not e!342276))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598752 (= res!383807 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598753 () Bool)

(declare-fun e!342284 () Bool)

(declare-fun e!342283 () Bool)

(assert (=> b!598753 (= e!342284 (not e!342283))))

(declare-fun res!383800 () Bool)

(assert (=> b!598753 (=> res!383800 e!342283)))

(declare-datatypes ((SeekEntryResult!6232 0))(
  ( (MissingZero!6232 (index!27185 (_ BitVec 32))) (Found!6232 (index!27186 (_ BitVec 32))) (Intermediate!6232 (undefined!7044 Bool) (index!27187 (_ BitVec 32)) (x!55991 (_ BitVec 32))) (Undefined!6232) (MissingVacant!6232 (index!27188 (_ BitVec 32))) )
))
(declare-fun lt!272060 () SeekEntryResult!6232)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598753 (= res!383800 (not (= lt!272060 (Found!6232 index!984))))))

(declare-datatypes ((Unit!18846 0))(
  ( (Unit!18847) )
))
(declare-fun lt!272066 () Unit!18846)

(declare-fun e!342274 () Unit!18846)

(assert (=> b!598753 (= lt!272066 e!342274)))

(declare-fun c!67844 () Bool)

(assert (=> b!598753 (= c!67844 (= lt!272060 Undefined!6232))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!272062 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272061 () array!37065)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37065 (_ BitVec 32)) SeekEntryResult!6232)

(assert (=> b!598753 (= lt!272060 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272062 lt!272061 mask!3053))))

(declare-fun e!342279 () Bool)

(assert (=> b!598753 e!342279))

(declare-fun res!383803 () Bool)

(assert (=> b!598753 (=> (not res!383803) (not e!342279))))

(declare-fun lt!272068 () (_ BitVec 32))

(declare-fun lt!272064 () SeekEntryResult!6232)

(assert (=> b!598753 (= res!383803 (= lt!272064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272068 vacantSpotIndex!68 lt!272062 lt!272061 mask!3053)))))

(assert (=> b!598753 (= lt!272064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272068 vacantSpotIndex!68 (select (arr!17792 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598753 (= lt!272062 (select (store (arr!17792 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272069 () Unit!18846)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18846)

(assert (=> b!598753 (= lt!272069 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272068 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598753 (= lt!272068 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598754 () Bool)

(declare-fun e!342275 () Bool)

(declare-fun e!342282 () Bool)

(assert (=> b!598754 (= e!342275 e!342282)))

(declare-fun res!383805 () Bool)

(assert (=> b!598754 (=> res!383805 e!342282)))

(declare-fun lt!272067 () (_ BitVec 64))

(assert (=> b!598754 (= res!383805 (or (not (= (select (arr!17792 a!2986) j!136) lt!272062)) (not (= (select (arr!17792 a!2986) j!136) lt!272067)) (bvsge j!136 index!984)))))

(declare-fun b!598755 () Bool)

(declare-fun res!383802 () Bool)

(declare-fun e!342281 () Bool)

(assert (=> b!598755 (=> (not res!383802) (not e!342281))))

(declare-datatypes ((List!11833 0))(
  ( (Nil!11830) (Cons!11829 (h!12874 (_ BitVec 64)) (t!18061 List!11833)) )
))
(declare-fun arrayNoDuplicates!0 (array!37065 (_ BitVec 32) List!11833) Bool)

(assert (=> b!598755 (= res!383802 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11830))))

(declare-fun b!598756 () Bool)

(declare-fun e!342280 () Bool)

(assert (=> b!598756 (= e!342282 e!342280)))

(declare-fun res!383809 () Bool)

(assert (=> b!598756 (=> (not res!383809) (not e!342280))))

(assert (=> b!598756 (= res!383809 (arrayContainsKey!0 lt!272061 (select (arr!17792 a!2986) j!136) j!136))))

(declare-fun b!598757 () Bool)

(declare-fun Unit!18848 () Unit!18846)

(assert (=> b!598757 (= e!342274 Unit!18848)))

(assert (=> b!598757 false))

(declare-fun b!598758 () Bool)

(declare-fun res!383811 () Bool)

(assert (=> b!598758 (=> (not res!383811) (not e!342281))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37065 (_ BitVec 32)) Bool)

(assert (=> b!598758 (= res!383811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598759 () Bool)

(declare-fun res!383810 () Bool)

(assert (=> b!598759 (=> (not res!383810) (not e!342281))))

(assert (=> b!598759 (= res!383810 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17792 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598760 () Bool)

(declare-fun e!342277 () Bool)

(assert (=> b!598760 (= e!342281 e!342277)))

(declare-fun res!383812 () Bool)

(assert (=> b!598760 (=> (not res!383812) (not e!342277))))

(assert (=> b!598760 (= res!383812 (= (select (store (arr!17792 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598760 (= lt!272061 (array!37066 (store (arr!17792 a!2986) i!1108 k!1786) (size!18156 a!2986)))))

(declare-fun b!598761 () Bool)

(declare-fun res!383813 () Bool)

(assert (=> b!598761 (=> (not res!383813) (not e!342276))))

(assert (=> b!598761 (= res!383813 (and (= (size!18156 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18156 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18156 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598762 () Bool)

(assert (=> b!598762 (= e!342276 e!342281)))

(declare-fun res!383799 () Bool)

(assert (=> b!598762 (=> (not res!383799) (not e!342281))))

(declare-fun lt!272070 () SeekEntryResult!6232)

(assert (=> b!598762 (= res!383799 (or (= lt!272070 (MissingZero!6232 i!1108)) (= lt!272070 (MissingVacant!6232 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37065 (_ BitVec 32)) SeekEntryResult!6232)

(assert (=> b!598762 (= lt!272070 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598764 () Bool)

(declare-fun lt!272071 () SeekEntryResult!6232)

(assert (=> b!598764 (= e!342279 (= lt!272071 lt!272064))))

(declare-fun b!598765 () Bool)

(declare-fun res!383798 () Bool)

(assert (=> b!598765 (=> (not res!383798) (not e!342276))))

(assert (=> b!598765 (= res!383798 (validKeyInArray!0 k!1786))))

(declare-fun b!598766 () Bool)

(assert (=> b!598766 (= e!342280 (arrayContainsKey!0 lt!272061 (select (arr!17792 a!2986) j!136) index!984))))

(declare-fun b!598767 () Bool)

(assert (=> b!598767 (= e!342277 e!342284)))

(declare-fun res!383804 () Bool)

(assert (=> b!598767 (=> (not res!383804) (not e!342284))))

(assert (=> b!598767 (= res!383804 (and (= lt!272071 (Found!6232 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17792 a!2986) index!984) (select (arr!17792 a!2986) j!136))) (not (= (select (arr!17792 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598767 (= lt!272071 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17792 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598768 () Bool)

(declare-fun e!342285 () Bool)

(assert (=> b!598768 (= e!342283 e!342285)))

(declare-fun res!383801 () Bool)

(assert (=> b!598768 (=> res!383801 e!342285)))

(assert (=> b!598768 (= res!383801 (or (not (= (select (arr!17792 a!2986) j!136) lt!272062)) (not (= (select (arr!17792 a!2986) j!136) lt!272067)) (bvsge j!136 index!984)))))

(assert (=> b!598768 e!342275))

(declare-fun res!383797 () Bool)

(assert (=> b!598768 (=> (not res!383797) (not e!342275))))

(assert (=> b!598768 (= res!383797 (= lt!272067 (select (arr!17792 a!2986) j!136)))))

(assert (=> b!598768 (= lt!272067 (select (store (arr!17792 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598769 () Bool)

(declare-fun Unit!18849 () Unit!18846)

(assert (=> b!598769 (= e!342274 Unit!18849)))

(declare-fun res!383806 () Bool)

(assert (=> start!54830 (=> (not res!383806) (not e!342276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54830 (= res!383806 (validMask!0 mask!3053))))

(assert (=> start!54830 e!342276))

(assert (=> start!54830 true))

(declare-fun array_inv!13588 (array!37065) Bool)

(assert (=> start!54830 (array_inv!13588 a!2986)))

(declare-fun b!598763 () Bool)

(assert (=> b!598763 (= e!342285 true)))

(assert (=> b!598763 (arrayNoDuplicates!0 lt!272061 #b00000000000000000000000000000000 Nil!11830)))

(declare-fun lt!272063 () Unit!18846)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37065 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11833) Unit!18846)

(assert (=> b!598763 (= lt!272063 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11830))))

(assert (=> b!598763 (arrayContainsKey!0 lt!272061 (select (arr!17792 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272065 () Unit!18846)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37065 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18846)

(assert (=> b!598763 (= lt!272065 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272061 (select (arr!17792 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54830 res!383806) b!598761))

(assert (= (and b!598761 res!383813) b!598751))

(assert (= (and b!598751 res!383808) b!598765))

(assert (= (and b!598765 res!383798) b!598752))

(assert (= (and b!598752 res!383807) b!598762))

(assert (= (and b!598762 res!383799) b!598758))

(assert (= (and b!598758 res!383811) b!598755))

(assert (= (and b!598755 res!383802) b!598759))

(assert (= (and b!598759 res!383810) b!598760))

(assert (= (and b!598760 res!383812) b!598767))

(assert (= (and b!598767 res!383804) b!598753))

(assert (= (and b!598753 res!383803) b!598764))

(assert (= (and b!598753 c!67844) b!598757))

(assert (= (and b!598753 (not c!67844)) b!598769))

(assert (= (and b!598753 (not res!383800)) b!598768))

(assert (= (and b!598768 res!383797) b!598754))

(assert (= (and b!598754 (not res!383805)) b!598756))

(assert (= (and b!598756 res!383809) b!598766))

(assert (= (and b!598768 (not res!383801)) b!598763))

(declare-fun m!576041 () Bool)

(assert (=> b!598752 m!576041))

(declare-fun m!576043 () Bool)

(assert (=> b!598756 m!576043))

(assert (=> b!598756 m!576043))

(declare-fun m!576045 () Bool)

(assert (=> b!598756 m!576045))

(declare-fun m!576047 () Bool)

(assert (=> start!54830 m!576047))

(declare-fun m!576049 () Bool)

(assert (=> start!54830 m!576049))

(declare-fun m!576051 () Bool)

(assert (=> b!598767 m!576051))

(assert (=> b!598767 m!576043))

(assert (=> b!598767 m!576043))

(declare-fun m!576053 () Bool)

(assert (=> b!598767 m!576053))

(declare-fun m!576055 () Bool)

(assert (=> b!598755 m!576055))

(declare-fun m!576057 () Bool)

(assert (=> b!598759 m!576057))

(declare-fun m!576059 () Bool)

(assert (=> b!598758 m!576059))

(assert (=> b!598754 m!576043))

(assert (=> b!598766 m!576043))

(assert (=> b!598766 m!576043))

(declare-fun m!576061 () Bool)

(assert (=> b!598766 m!576061))

(declare-fun m!576063 () Bool)

(assert (=> b!598753 m!576063))

(declare-fun m!576065 () Bool)

(assert (=> b!598753 m!576065))

(declare-fun m!576067 () Bool)

(assert (=> b!598753 m!576067))

(assert (=> b!598753 m!576043))

(assert (=> b!598753 m!576043))

(declare-fun m!576069 () Bool)

(assert (=> b!598753 m!576069))

(declare-fun m!576071 () Bool)

(assert (=> b!598753 m!576071))

(declare-fun m!576073 () Bool)

(assert (=> b!598753 m!576073))

(declare-fun m!576075 () Bool)

(assert (=> b!598753 m!576075))

(assert (=> b!598763 m!576043))

(assert (=> b!598763 m!576043))

(declare-fun m!576077 () Bool)

(assert (=> b!598763 m!576077))

(assert (=> b!598763 m!576043))

(declare-fun m!576079 () Bool)

(assert (=> b!598763 m!576079))

(declare-fun m!576081 () Bool)

(assert (=> b!598763 m!576081))

(declare-fun m!576083 () Bool)

(assert (=> b!598763 m!576083))

(declare-fun m!576085 () Bool)

(assert (=> b!598762 m!576085))

(assert (=> b!598751 m!576043))

(assert (=> b!598751 m!576043))

(declare-fun m!576087 () Bool)

(assert (=> b!598751 m!576087))

(assert (=> b!598760 m!576071))

(declare-fun m!576089 () Bool)

(assert (=> b!598760 m!576089))

(assert (=> b!598768 m!576043))

(assert (=> b!598768 m!576071))

(declare-fun m!576091 () Bool)

(assert (=> b!598768 m!576091))

(declare-fun m!576093 () Bool)

(assert (=> b!598765 m!576093))

(push 1)

