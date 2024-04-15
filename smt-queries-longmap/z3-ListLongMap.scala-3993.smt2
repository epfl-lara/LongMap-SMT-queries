; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54132 () Bool)

(assert start!54132)

(declare-fun b!591107 () Bool)

(declare-fun res!378206 () Bool)

(declare-fun e!337493 () Bool)

(assert (=> b!591107 (=> (not res!378206) (not e!337493))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36876 0))(
  ( (array!36877 (arr!17708 (Array (_ BitVec 32) (_ BitVec 64))) (size!18073 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36876)

(assert (=> b!591107 (= res!378206 (and (= (size!18073 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18073 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18073 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591108 () Bool)

(declare-fun e!337489 () Bool)

(assert (=> b!591108 (= e!337489 true)))

(declare-fun e!337492 () Bool)

(assert (=> b!591108 e!337492))

(declare-fun res!378203 () Bool)

(assert (=> b!591108 (=> (not res!378203) (not e!337492))))

(declare-fun lt!268102 () (_ BitVec 64))

(assert (=> b!591108 (= res!378203 (= lt!268102 (select (arr!17708 a!2986) j!136)))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!591108 (= lt!268102 (select (store (arr!17708 a!2986) i!1108 k0!1786) index!984))))

(declare-fun lt!268105 () array!36876)

(declare-fun b!591109 () Bool)

(declare-fun e!337491 () Bool)

(declare-fun arrayContainsKey!0 (array!36876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591109 (= e!337491 (arrayContainsKey!0 lt!268105 (select (arr!17708 a!2986) j!136) index!984))))

(declare-fun b!591110 () Bool)

(declare-fun res!378208 () Bool)

(assert (=> b!591110 (=> (not res!378208) (not e!337493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591110 (= res!378208 (validKeyInArray!0 k0!1786))))

(declare-fun b!591111 () Bool)

(declare-fun e!337488 () Bool)

(assert (=> b!591111 (= e!337492 e!337488)))

(declare-fun res!378210 () Bool)

(assert (=> b!591111 (=> res!378210 e!337488)))

(declare-fun lt!268104 () (_ BitVec 64))

(assert (=> b!591111 (= res!378210 (or (not (= (select (arr!17708 a!2986) j!136) lt!268104)) (not (= (select (arr!17708 a!2986) j!136) lt!268102)) (bvsge j!136 index!984)))))

(declare-fun b!591113 () Bool)

(declare-fun res!378204 () Bool)

(declare-fun e!337497 () Bool)

(assert (=> b!591113 (=> (not res!378204) (not e!337497))))

(declare-datatypes ((List!11788 0))(
  ( (Nil!11785) (Cons!11784 (h!12829 (_ BitVec 64)) (t!18007 List!11788)) )
))
(declare-fun arrayNoDuplicates!0 (array!36876 (_ BitVec 32) List!11788) Bool)

(assert (=> b!591113 (= res!378204 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11785))))

(declare-fun b!591114 () Bool)

(declare-datatypes ((Unit!18492 0))(
  ( (Unit!18493) )
))
(declare-fun e!337490 () Unit!18492)

(declare-fun Unit!18494 () Unit!18492)

(assert (=> b!591114 (= e!337490 Unit!18494)))

(declare-fun b!591115 () Bool)

(declare-fun e!337495 () Bool)

(assert (=> b!591115 (= e!337497 e!337495)))

(declare-fun res!378209 () Bool)

(assert (=> b!591115 (=> (not res!378209) (not e!337495))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!591115 (= res!378209 (= (select (store (arr!17708 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591115 (= lt!268105 (array!36877 (store (arr!17708 a!2986) i!1108 k0!1786) (size!18073 a!2986)))))

(declare-fun b!591116 () Bool)

(declare-fun res!378200 () Bool)

(assert (=> b!591116 (=> (not res!378200) (not e!337493))))

(assert (=> b!591116 (= res!378200 (validKeyInArray!0 (select (arr!17708 a!2986) j!136)))))

(declare-fun b!591117 () Bool)

(assert (=> b!591117 (= e!337488 e!337491)))

(declare-fun res!378201 () Bool)

(assert (=> b!591117 (=> (not res!378201) (not e!337491))))

(assert (=> b!591117 (= res!378201 (arrayContainsKey!0 lt!268105 (select (arr!17708 a!2986) j!136) j!136))))

(declare-fun b!591118 () Bool)

(declare-fun e!337496 () Bool)

(assert (=> b!591118 (= e!337496 (not e!337489))))

(declare-fun res!378211 () Bool)

(assert (=> b!591118 (=> res!378211 e!337489)))

(declare-datatypes ((SeekEntryResult!6145 0))(
  ( (MissingZero!6145 (index!26816 (_ BitVec 32))) (Found!6145 (index!26817 (_ BitVec 32))) (Intermediate!6145 (undefined!6957 Bool) (index!26818 (_ BitVec 32)) (x!55620 (_ BitVec 32))) (Undefined!6145) (MissingVacant!6145 (index!26819 (_ BitVec 32))) )
))
(declare-fun lt!268106 () SeekEntryResult!6145)

(assert (=> b!591118 (= res!378211 (not (= lt!268106 (Found!6145 index!984))))))

(declare-fun lt!268103 () Unit!18492)

(assert (=> b!591118 (= lt!268103 e!337490)))

(declare-fun c!66822 () Bool)

(assert (=> b!591118 (= c!66822 (= lt!268106 Undefined!6145))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36876 (_ BitVec 32)) SeekEntryResult!6145)

(assert (=> b!591118 (= lt!268106 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268104 lt!268105 mask!3053))))

(declare-fun e!337487 () Bool)

(assert (=> b!591118 e!337487))

(declare-fun res!378212 () Bool)

(assert (=> b!591118 (=> (not res!378212) (not e!337487))))

(declare-fun lt!268099 () (_ BitVec 32))

(declare-fun lt!268107 () SeekEntryResult!6145)

(assert (=> b!591118 (= res!378212 (= lt!268107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268099 vacantSpotIndex!68 lt!268104 lt!268105 mask!3053)))))

(assert (=> b!591118 (= lt!268107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268099 vacantSpotIndex!68 (select (arr!17708 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591118 (= lt!268104 (select (store (arr!17708 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268100 () Unit!18492)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36876 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18492)

(assert (=> b!591118 (= lt!268100 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268099 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591118 (= lt!268099 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591119 () Bool)

(declare-fun Unit!18495 () Unit!18492)

(assert (=> b!591119 (= e!337490 Unit!18495)))

(assert (=> b!591119 false))

(declare-fun b!591120 () Bool)

(assert (=> b!591120 (= e!337495 e!337496)))

(declare-fun res!378197 () Bool)

(assert (=> b!591120 (=> (not res!378197) (not e!337496))))

(declare-fun lt!268108 () SeekEntryResult!6145)

(assert (=> b!591120 (= res!378197 (and (= lt!268108 (Found!6145 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17708 a!2986) index!984) (select (arr!17708 a!2986) j!136))) (not (= (select (arr!17708 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591120 (= lt!268108 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17708 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!378205 () Bool)

(assert (=> start!54132 (=> (not res!378205) (not e!337493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54132 (= res!378205 (validMask!0 mask!3053))))

(assert (=> start!54132 e!337493))

(assert (=> start!54132 true))

(declare-fun array_inv!13591 (array!36876) Bool)

(assert (=> start!54132 (array_inv!13591 a!2986)))

(declare-fun b!591112 () Bool)

(declare-fun res!378199 () Bool)

(assert (=> b!591112 (=> (not res!378199) (not e!337497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36876 (_ BitVec 32)) Bool)

(assert (=> b!591112 (= res!378199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!591121 () Bool)

(assert (=> b!591121 (= e!337487 (= lt!268108 lt!268107))))

(declare-fun b!591122 () Bool)

(assert (=> b!591122 (= e!337493 e!337497)))

(declare-fun res!378207 () Bool)

(assert (=> b!591122 (=> (not res!378207) (not e!337497))))

(declare-fun lt!268101 () SeekEntryResult!6145)

(assert (=> b!591122 (= res!378207 (or (= lt!268101 (MissingZero!6145 i!1108)) (= lt!268101 (MissingVacant!6145 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36876 (_ BitVec 32)) SeekEntryResult!6145)

(assert (=> b!591122 (= lt!268101 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!591123 () Bool)

(declare-fun res!378202 () Bool)

(assert (=> b!591123 (=> (not res!378202) (not e!337493))))

(assert (=> b!591123 (= res!378202 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591124 () Bool)

(declare-fun res!378198 () Bool)

(assert (=> b!591124 (=> (not res!378198) (not e!337497))))

(assert (=> b!591124 (= res!378198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17708 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54132 res!378205) b!591107))

(assert (= (and b!591107 res!378206) b!591116))

(assert (= (and b!591116 res!378200) b!591110))

(assert (= (and b!591110 res!378208) b!591123))

(assert (= (and b!591123 res!378202) b!591122))

(assert (= (and b!591122 res!378207) b!591112))

(assert (= (and b!591112 res!378199) b!591113))

(assert (= (and b!591113 res!378204) b!591124))

(assert (= (and b!591124 res!378198) b!591115))

(assert (= (and b!591115 res!378209) b!591120))

(assert (= (and b!591120 res!378197) b!591118))

(assert (= (and b!591118 res!378212) b!591121))

(assert (= (and b!591118 c!66822) b!591119))

(assert (= (and b!591118 (not c!66822)) b!591114))

(assert (= (and b!591118 (not res!378211)) b!591108))

(assert (= (and b!591108 res!378203) b!591111))

(assert (= (and b!591111 (not res!378210)) b!591117))

(assert (= (and b!591117 res!378201) b!591109))

(declare-fun m!568849 () Bool)

(assert (=> b!591122 m!568849))

(declare-fun m!568851 () Bool)

(assert (=> start!54132 m!568851))

(declare-fun m!568853 () Bool)

(assert (=> start!54132 m!568853))

(declare-fun m!568855 () Bool)

(assert (=> b!591117 m!568855))

(assert (=> b!591117 m!568855))

(declare-fun m!568857 () Bool)

(assert (=> b!591117 m!568857))

(declare-fun m!568859 () Bool)

(assert (=> b!591124 m!568859))

(declare-fun m!568861 () Bool)

(assert (=> b!591120 m!568861))

(assert (=> b!591120 m!568855))

(assert (=> b!591120 m!568855))

(declare-fun m!568863 () Bool)

(assert (=> b!591120 m!568863))

(declare-fun m!568865 () Bool)

(assert (=> b!591115 m!568865))

(declare-fun m!568867 () Bool)

(assert (=> b!591115 m!568867))

(declare-fun m!568869 () Bool)

(assert (=> b!591110 m!568869))

(assert (=> b!591108 m!568855))

(assert (=> b!591108 m!568865))

(declare-fun m!568871 () Bool)

(assert (=> b!591108 m!568871))

(assert (=> b!591111 m!568855))

(declare-fun m!568873 () Bool)

(assert (=> b!591123 m!568873))

(declare-fun m!568875 () Bool)

(assert (=> b!591118 m!568875))

(assert (=> b!591118 m!568855))

(assert (=> b!591118 m!568865))

(declare-fun m!568877 () Bool)

(assert (=> b!591118 m!568877))

(declare-fun m!568879 () Bool)

(assert (=> b!591118 m!568879))

(assert (=> b!591118 m!568855))

(declare-fun m!568881 () Bool)

(assert (=> b!591118 m!568881))

(declare-fun m!568883 () Bool)

(assert (=> b!591118 m!568883))

(declare-fun m!568885 () Bool)

(assert (=> b!591118 m!568885))

(assert (=> b!591116 m!568855))

(assert (=> b!591116 m!568855))

(declare-fun m!568887 () Bool)

(assert (=> b!591116 m!568887))

(declare-fun m!568889 () Bool)

(assert (=> b!591112 m!568889))

(declare-fun m!568891 () Bool)

(assert (=> b!591113 m!568891))

(assert (=> b!591109 m!568855))

(assert (=> b!591109 m!568855))

(declare-fun m!568893 () Bool)

(assert (=> b!591109 m!568893))

(check-sat (not b!591113) (not b!591112) (not b!591120) (not b!591123) (not start!54132) (not b!591110) (not b!591117) (not b!591122) (not b!591109) (not b!591116) (not b!591118))
(check-sat)
