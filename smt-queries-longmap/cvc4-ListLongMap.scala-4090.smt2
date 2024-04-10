; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56042 () Bool)

(assert start!56042)

(declare-fun b!616898 () Bool)

(declare-fun e!353730 () Bool)

(declare-fun e!353739 () Bool)

(assert (=> b!616898 (= e!353730 (not e!353739))))

(declare-fun res!397405 () Bool)

(assert (=> b!616898 (=> res!397405 e!353739)))

(declare-datatypes ((SeekEntryResult!6442 0))(
  ( (MissingZero!6442 (index!28052 (_ BitVec 32))) (Found!6442 (index!28053 (_ BitVec 32))) (Intermediate!6442 (undefined!7254 Bool) (index!28054 (_ BitVec 32)) (x!56842 (_ BitVec 32))) (Undefined!6442) (MissingVacant!6442 (index!28055 (_ BitVec 32))) )
))
(declare-fun lt!283895 () SeekEntryResult!6442)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!616898 (= res!397405 (not (= lt!283895 (MissingVacant!6442 vacantSpotIndex!68))))))

(declare-datatypes ((Unit!20148 0))(
  ( (Unit!20149) )
))
(declare-fun lt!283887 () Unit!20148)

(declare-fun e!353733 () Unit!20148)

(assert (=> b!616898 (= lt!283887 e!353733)))

(declare-fun c!70119 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!616898 (= c!70119 (= lt!283895 (Found!6442 index!984)))))

(declare-fun lt!283892 () Unit!20148)

(declare-fun e!353740 () Unit!20148)

(assert (=> b!616898 (= lt!283892 e!353740)))

(declare-fun c!70118 () Bool)

(assert (=> b!616898 (= c!70118 (= lt!283895 Undefined!6442))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!283884 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37512 0))(
  ( (array!37513 (arr!18002 (Array (_ BitVec 32) (_ BitVec 64))) (size!18366 (_ BitVec 32))) )
))
(declare-fun lt!283888 () array!37512)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37512 (_ BitVec 32)) SeekEntryResult!6442)

(assert (=> b!616898 (= lt!283895 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283884 lt!283888 mask!3053))))

(declare-fun e!353738 () Bool)

(assert (=> b!616898 e!353738))

(declare-fun res!397412 () Bool)

(assert (=> b!616898 (=> (not res!397412) (not e!353738))))

(declare-fun lt!283885 () SeekEntryResult!6442)

(declare-fun lt!283894 () (_ BitVec 32))

(assert (=> b!616898 (= res!397412 (= lt!283885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283894 vacantSpotIndex!68 lt!283884 lt!283888 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37512)

(assert (=> b!616898 (= lt!283885 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283894 vacantSpotIndex!68 (select (arr!18002 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!616898 (= lt!283884 (select (store (arr!18002 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!283891 () Unit!20148)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20148)

(assert (=> b!616898 (= lt!283891 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283894 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616898 (= lt!283894 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616899 () Bool)

(assert (=> b!616899 false))

(declare-fun lt!283881 () Unit!20148)

(declare-datatypes ((List!12043 0))(
  ( (Nil!12040) (Cons!12039 (h!13084 (_ BitVec 64)) (t!18271 List!12043)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37512 (_ BitVec 64) (_ BitVec 32) List!12043) Unit!20148)

(assert (=> b!616899 (= lt!283881 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283888 (select (arr!18002 a!2986) j!136) index!984 Nil!12040))))

(declare-fun arrayNoDuplicates!0 (array!37512 (_ BitVec 32) List!12043) Bool)

(assert (=> b!616899 (arrayNoDuplicates!0 lt!283888 index!984 Nil!12040)))

(declare-fun lt!283897 () Unit!20148)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37512 (_ BitVec 32) (_ BitVec 32)) Unit!20148)

(assert (=> b!616899 (= lt!283897 (lemmaNoDuplicateFromThenFromBigger!0 lt!283888 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616899 (arrayNoDuplicates!0 lt!283888 #b00000000000000000000000000000000 Nil!12040)))

(declare-fun lt!283878 () Unit!20148)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12043) Unit!20148)

(assert (=> b!616899 (= lt!283878 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12040))))

(declare-fun arrayContainsKey!0 (array!37512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616899 (arrayContainsKey!0 lt!283888 (select (arr!18002 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283880 () Unit!20148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37512 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20148)

(assert (=> b!616899 (= lt!283880 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283888 (select (arr!18002 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!353736 () Bool)

(assert (=> b!616899 e!353736))

(declare-fun res!397411 () Bool)

(assert (=> b!616899 (=> (not res!397411) (not e!353736))))

(assert (=> b!616899 (= res!397411 (arrayContainsKey!0 lt!283888 (select (arr!18002 a!2986) j!136) j!136))))

(declare-fun e!353734 () Unit!20148)

(declare-fun Unit!20150 () Unit!20148)

(assert (=> b!616899 (= e!353734 Unit!20150)))

(declare-fun b!616900 () Bool)

(declare-fun e!353741 () Unit!20148)

(declare-fun Unit!20151 () Unit!20148)

(assert (=> b!616900 (= e!353741 Unit!20151)))

(declare-fun b!616902 () Bool)

(declare-fun res!397401 () Bool)

(assert (=> b!616902 (= res!397401 (bvsge j!136 index!984))))

(declare-fun e!353728 () Bool)

(assert (=> b!616902 (=> res!397401 e!353728)))

(declare-fun e!353737 () Bool)

(assert (=> b!616902 (= e!353737 e!353728)))

(declare-fun b!616903 () Bool)

(declare-fun res!397402 () Bool)

(declare-fun e!353732 () Bool)

(assert (=> b!616903 (=> (not res!397402) (not e!353732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37512 (_ BitVec 32)) Bool)

(assert (=> b!616903 (= res!397402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616904 () Bool)

(declare-fun e!353735 () Bool)

(assert (=> b!616904 (= e!353735 e!353730)))

(declare-fun res!397400 () Bool)

(assert (=> b!616904 (=> (not res!397400) (not e!353730))))

(declare-fun lt!283879 () SeekEntryResult!6442)

(assert (=> b!616904 (= res!397400 (and (= lt!283879 (Found!6442 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18002 a!2986) index!984) (select (arr!18002 a!2986) j!136))) (not (= (select (arr!18002 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616904 (= lt!283879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18002 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616905 () Bool)

(declare-fun res!397407 () Bool)

(declare-fun e!353731 () Bool)

(assert (=> b!616905 (=> (not res!397407) (not e!353731))))

(assert (=> b!616905 (= res!397407 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616906 () Bool)

(declare-fun res!397403 () Bool)

(assert (=> b!616906 (=> (not res!397403) (not e!353732))))

(assert (=> b!616906 (= res!397403 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18002 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616907 () Bool)

(declare-fun Unit!20152 () Unit!20148)

(assert (=> b!616907 (= e!353740 Unit!20152)))

(assert (=> b!616907 false))

(declare-fun b!616908 () Bool)

(declare-fun Unit!20153 () Unit!20148)

(assert (=> b!616908 (= e!353734 Unit!20153)))

(declare-fun b!616909 () Bool)

(declare-fun e!353742 () Bool)

(assert (=> b!616909 (= e!353742 (arrayContainsKey!0 lt!283888 (select (arr!18002 a!2986) j!136) index!984))))

(declare-fun b!616910 () Bool)

(declare-fun Unit!20154 () Unit!20148)

(assert (=> b!616910 (= e!353740 Unit!20154)))

(declare-fun b!616911 () Bool)

(declare-fun res!397406 () Bool)

(assert (=> b!616911 (=> (not res!397406) (not e!353731))))

(assert (=> b!616911 (= res!397406 (and (= (size!18366 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18366 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18366 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616912 () Bool)

(assert (=> b!616912 (= e!353731 e!353732)))

(declare-fun res!397409 () Bool)

(assert (=> b!616912 (=> (not res!397409) (not e!353732))))

(declare-fun lt!283890 () SeekEntryResult!6442)

(assert (=> b!616912 (= res!397409 (or (= lt!283890 (MissingZero!6442 i!1108)) (= lt!283890 (MissingVacant!6442 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37512 (_ BitVec 32)) SeekEntryResult!6442)

(assert (=> b!616912 (= lt!283890 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!616913 () Bool)

(declare-fun res!397397 () Bool)

(assert (=> b!616913 (=> (not res!397397) (not e!353732))))

(assert (=> b!616913 (= res!397397 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12040))))

(declare-fun res!397404 () Bool)

(assert (=> start!56042 (=> (not res!397404) (not e!353731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56042 (= res!397404 (validMask!0 mask!3053))))

(assert (=> start!56042 e!353731))

(assert (=> start!56042 true))

(declare-fun array_inv!13798 (array!37512) Bool)

(assert (=> start!56042 (array_inv!13798 a!2986)))

(declare-fun b!616901 () Bool)

(declare-fun res!397408 () Bool)

(assert (=> b!616901 (= res!397408 (arrayContainsKey!0 lt!283888 (select (arr!18002 a!2986) j!136) j!136))))

(assert (=> b!616901 (=> (not res!397408) (not e!353742))))

(assert (=> b!616901 (= e!353728 e!353742)))

(declare-fun b!616914 () Bool)

(declare-fun res!397398 () Bool)

(assert (=> b!616914 (=> (not res!397398) (not e!353731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616914 (= res!397398 (validKeyInArray!0 k!1786))))

(declare-fun b!616915 () Bool)

(declare-fun res!397396 () Bool)

(assert (=> b!616915 (=> (not res!397396) (not e!353731))))

(assert (=> b!616915 (= res!397396 (validKeyInArray!0 (select (arr!18002 a!2986) j!136)))))

(declare-fun b!616916 () Bool)

(assert (=> b!616916 (= e!353736 (arrayContainsKey!0 lt!283888 (select (arr!18002 a!2986) j!136) index!984))))

(declare-fun b!616917 () Bool)

(declare-fun Unit!20155 () Unit!20148)

(assert (=> b!616917 (= e!353733 Unit!20155)))

(declare-fun b!616918 () Bool)

(assert (=> b!616918 (= e!353739 true)))

(assert (=> b!616918 (= (select (store (arr!18002 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!616919 () Bool)

(assert (=> b!616919 (= e!353738 (= lt!283879 lt!283885))))

(declare-fun b!616920 () Bool)

(assert (=> b!616920 (= e!353732 e!353735)))

(declare-fun res!397410 () Bool)

(assert (=> b!616920 (=> (not res!397410) (not e!353735))))

(assert (=> b!616920 (= res!397410 (= (select (store (arr!18002 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616920 (= lt!283888 (array!37513 (store (arr!18002 a!2986) i!1108 k!1786) (size!18366 a!2986)))))

(declare-fun b!616921 () Bool)

(declare-fun Unit!20156 () Unit!20148)

(assert (=> b!616921 (= e!353733 Unit!20156)))

(declare-fun res!397399 () Bool)

(assert (=> b!616921 (= res!397399 (= (select (store (arr!18002 a!2986) i!1108 k!1786) index!984) (select (arr!18002 a!2986) j!136)))))

(assert (=> b!616921 (=> (not res!397399) (not e!353737))))

(assert (=> b!616921 e!353737))

(declare-fun c!70120 () Bool)

(assert (=> b!616921 (= c!70120 (bvslt j!136 index!984))))

(declare-fun lt!283882 () Unit!20148)

(assert (=> b!616921 (= lt!283882 e!353741)))

(declare-fun c!70121 () Bool)

(assert (=> b!616921 (= c!70121 (bvslt index!984 j!136))))

(declare-fun lt!283893 () Unit!20148)

(assert (=> b!616921 (= lt!283893 e!353734)))

(assert (=> b!616921 false))

(declare-fun b!616922 () Bool)

(assert (=> b!616922 false))

(declare-fun lt!283883 () Unit!20148)

(assert (=> b!616922 (= lt!283883 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283888 (select (arr!18002 a!2986) j!136) j!136 Nil!12040))))

(assert (=> b!616922 (arrayNoDuplicates!0 lt!283888 j!136 Nil!12040)))

(declare-fun lt!283886 () Unit!20148)

(assert (=> b!616922 (= lt!283886 (lemmaNoDuplicateFromThenFromBigger!0 lt!283888 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616922 (arrayNoDuplicates!0 lt!283888 #b00000000000000000000000000000000 Nil!12040)))

(declare-fun lt!283896 () Unit!20148)

(assert (=> b!616922 (= lt!283896 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12040))))

(assert (=> b!616922 (arrayContainsKey!0 lt!283888 (select (arr!18002 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283889 () Unit!20148)

(assert (=> b!616922 (= lt!283889 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283888 (select (arr!18002 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20157 () Unit!20148)

(assert (=> b!616922 (= e!353741 Unit!20157)))

(assert (= (and start!56042 res!397404) b!616911))

(assert (= (and b!616911 res!397406) b!616915))

(assert (= (and b!616915 res!397396) b!616914))

(assert (= (and b!616914 res!397398) b!616905))

(assert (= (and b!616905 res!397407) b!616912))

(assert (= (and b!616912 res!397409) b!616903))

(assert (= (and b!616903 res!397402) b!616913))

(assert (= (and b!616913 res!397397) b!616906))

(assert (= (and b!616906 res!397403) b!616920))

(assert (= (and b!616920 res!397410) b!616904))

(assert (= (and b!616904 res!397400) b!616898))

(assert (= (and b!616898 res!397412) b!616919))

(assert (= (and b!616898 c!70118) b!616907))

(assert (= (and b!616898 (not c!70118)) b!616910))

(assert (= (and b!616898 c!70119) b!616921))

(assert (= (and b!616898 (not c!70119)) b!616917))

(assert (= (and b!616921 res!397399) b!616902))

(assert (= (and b!616902 (not res!397401)) b!616901))

(assert (= (and b!616901 res!397408) b!616909))

(assert (= (and b!616921 c!70120) b!616922))

(assert (= (and b!616921 (not c!70120)) b!616900))

(assert (= (and b!616921 c!70121) b!616899))

(assert (= (and b!616921 (not c!70121)) b!616908))

(assert (= (and b!616899 res!397411) b!616916))

(assert (= (and b!616898 (not res!397405)) b!616918))

(declare-fun m!593041 () Bool)

(assert (=> b!616898 m!593041))

(declare-fun m!593043 () Bool)

(assert (=> b!616898 m!593043))

(declare-fun m!593045 () Bool)

(assert (=> b!616898 m!593045))

(declare-fun m!593047 () Bool)

(assert (=> b!616898 m!593047))

(declare-fun m!593049 () Bool)

(assert (=> b!616898 m!593049))

(declare-fun m!593051 () Bool)

(assert (=> b!616898 m!593051))

(declare-fun m!593053 () Bool)

(assert (=> b!616898 m!593053))

(assert (=> b!616898 m!593049))

(declare-fun m!593055 () Bool)

(assert (=> b!616898 m!593055))

(declare-fun m!593057 () Bool)

(assert (=> b!616905 m!593057))

(assert (=> b!616921 m!593045))

(declare-fun m!593059 () Bool)

(assert (=> b!616921 m!593059))

(assert (=> b!616921 m!593049))

(assert (=> b!616922 m!593049))

(declare-fun m!593061 () Bool)

(assert (=> b!616922 m!593061))

(declare-fun m!593063 () Bool)

(assert (=> b!616922 m!593063))

(assert (=> b!616922 m!593049))

(declare-fun m!593065 () Bool)

(assert (=> b!616922 m!593065))

(assert (=> b!616922 m!593049))

(declare-fun m!593067 () Bool)

(assert (=> b!616922 m!593067))

(declare-fun m!593069 () Bool)

(assert (=> b!616922 m!593069))

(assert (=> b!616922 m!593049))

(declare-fun m!593071 () Bool)

(assert (=> b!616922 m!593071))

(declare-fun m!593073 () Bool)

(assert (=> b!616922 m!593073))

(declare-fun m!593075 () Bool)

(assert (=> start!56042 m!593075))

(declare-fun m!593077 () Bool)

(assert (=> start!56042 m!593077))

(declare-fun m!593079 () Bool)

(assert (=> b!616913 m!593079))

(assert (=> b!616915 m!593049))

(assert (=> b!616915 m!593049))

(declare-fun m!593081 () Bool)

(assert (=> b!616915 m!593081))

(declare-fun m!593083 () Bool)

(assert (=> b!616903 m!593083))

(declare-fun m!593085 () Bool)

(assert (=> b!616906 m!593085))

(assert (=> b!616916 m!593049))

(assert (=> b!616916 m!593049))

(declare-fun m!593087 () Bool)

(assert (=> b!616916 m!593087))

(assert (=> b!616901 m!593049))

(assert (=> b!616901 m!593049))

(declare-fun m!593089 () Bool)

(assert (=> b!616901 m!593089))

(declare-fun m!593091 () Bool)

(assert (=> b!616904 m!593091))

(assert (=> b!616904 m!593049))

(assert (=> b!616904 m!593049))

(declare-fun m!593093 () Bool)

(assert (=> b!616904 m!593093))

(assert (=> b!616899 m!593049))

(assert (=> b!616899 m!593061))

(assert (=> b!616899 m!593049))

(declare-fun m!593095 () Bool)

(assert (=> b!616899 m!593095))

(assert (=> b!616899 m!593049))

(declare-fun m!593097 () Bool)

(assert (=> b!616899 m!593097))

(declare-fun m!593099 () Bool)

(assert (=> b!616899 m!593099))

(declare-fun m!593101 () Bool)

(assert (=> b!616899 m!593101))

(assert (=> b!616899 m!593049))

(assert (=> b!616899 m!593089))

(assert (=> b!616899 m!593049))

(declare-fun m!593103 () Bool)

(assert (=> b!616899 m!593103))

(assert (=> b!616899 m!593069))

(declare-fun m!593105 () Bool)

(assert (=> b!616912 m!593105))

(assert (=> b!616909 m!593049))

(assert (=> b!616909 m!593049))

(assert (=> b!616909 m!593087))

(assert (=> b!616920 m!593045))

(declare-fun m!593107 () Bool)

(assert (=> b!616920 m!593107))

(assert (=> b!616918 m!593045))

(assert (=> b!616918 m!593059))

(declare-fun m!593109 () Bool)

(assert (=> b!616914 m!593109))

(push 1)

