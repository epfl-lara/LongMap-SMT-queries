; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54832 () Bool)

(assert start!54832)

(declare-fun b!598808 () Bool)

(declare-fun e!342310 () Bool)

(declare-datatypes ((SeekEntryResult!6233 0))(
  ( (MissingZero!6233 (index!27189 (_ BitVec 32))) (Found!6233 (index!27190 (_ BitVec 32))) (Intermediate!6233 (undefined!7045 Bool) (index!27191 (_ BitVec 32)) (x!56000 (_ BitVec 32))) (Undefined!6233) (MissingVacant!6233 (index!27192 (_ BitVec 32))) )
))
(declare-fun lt!272103 () SeekEntryResult!6233)

(declare-fun lt!272097 () SeekEntryResult!6233)

(assert (=> b!598808 (= e!342310 (= lt!272103 lt!272097))))

(declare-fun b!598809 () Bool)

(declare-fun e!342318 () Bool)

(declare-fun e!342315 () Bool)

(assert (=> b!598809 (= e!342318 e!342315)))

(declare-fun res!383862 () Bool)

(assert (=> b!598809 (=> (not res!383862) (not e!342315))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37067 0))(
  ( (array!37068 (arr!17793 (Array (_ BitVec 32) (_ BitVec 64))) (size!18157 (_ BitVec 32))) )
))
(declare-fun lt!272107 () array!37067)

(declare-fun a!2986 () array!37067)

(declare-fun arrayContainsKey!0 (array!37067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!598809 (= res!383862 (arrayContainsKey!0 lt!272107 (select (arr!17793 a!2986) j!136) j!136))))

(declare-fun b!598810 () Bool)

(declare-fun res!383860 () Bool)

(declare-fun e!342320 () Bool)

(assert (=> b!598810 (=> (not res!383860) (not e!342320))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!598810 (= res!383860 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17793 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598811 () Bool)

(declare-fun res!383857 () Bool)

(declare-fun e!342312 () Bool)

(assert (=> b!598811 (=> (not res!383857) (not e!342312))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!598811 (= res!383857 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598812 () Bool)

(declare-fun e!342314 () Bool)

(assert (=> b!598812 (= e!342314 e!342318)))

(declare-fun res!383852 () Bool)

(assert (=> b!598812 (=> res!383852 e!342318)))

(declare-fun lt!272100 () (_ BitVec 64))

(declare-fun lt!272104 () (_ BitVec 64))

(assert (=> b!598812 (= res!383852 (or (not (= (select (arr!17793 a!2986) j!136) lt!272100)) (not (= (select (arr!17793 a!2986) j!136) lt!272104)) (bvsge j!136 index!984)))))

(declare-fun b!598813 () Bool)

(assert (=> b!598813 (= e!342312 e!342320)))

(declare-fun res!383851 () Bool)

(assert (=> b!598813 (=> (not res!383851) (not e!342320))))

(declare-fun lt!272106 () SeekEntryResult!6233)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!598813 (= res!383851 (or (= lt!272106 (MissingZero!6233 i!1108)) (= lt!272106 (MissingVacant!6233 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37067 (_ BitVec 32)) SeekEntryResult!6233)

(assert (=> b!598813 (= lt!272106 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!598814 () Bool)

(assert (=> b!598814 (= e!342315 (arrayContainsKey!0 lt!272107 (select (arr!17793 a!2986) j!136) index!984))))

(declare-fun b!598816 () Bool)

(declare-fun res!383849 () Bool)

(assert (=> b!598816 (=> (not res!383849) (not e!342312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!598816 (= res!383849 (validKeyInArray!0 k!1786))))

(declare-fun b!598817 () Bool)

(declare-datatypes ((Unit!18850 0))(
  ( (Unit!18851) )
))
(declare-fun e!342317 () Unit!18850)

(declare-fun Unit!18852 () Unit!18850)

(assert (=> b!598817 (= e!342317 Unit!18852)))

(assert (=> b!598817 false))

(declare-fun b!598818 () Bool)

(declare-fun res!383853 () Bool)

(assert (=> b!598818 (=> (not res!383853) (not e!342320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37067 (_ BitVec 32)) Bool)

(assert (=> b!598818 (= res!383853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!598819 () Bool)

(declare-fun res!383861 () Bool)

(assert (=> b!598819 (=> (not res!383861) (not e!342312))))

(assert (=> b!598819 (= res!383861 (and (= (size!18157 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18157 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18157 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!598820 () Bool)

(declare-fun e!342313 () Bool)

(declare-fun e!342311 () Bool)

(assert (=> b!598820 (= e!342313 (not e!342311))))

(declare-fun res!383859 () Bool)

(assert (=> b!598820 (=> res!383859 e!342311)))

(declare-fun lt!272099 () SeekEntryResult!6233)

(assert (=> b!598820 (= res!383859 (not (= lt!272099 (Found!6233 index!984))))))

(declare-fun lt!272096 () Unit!18850)

(assert (=> b!598820 (= lt!272096 e!342317)))

(declare-fun c!67847 () Bool)

(assert (=> b!598820 (= c!67847 (= lt!272099 Undefined!6233))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37067 (_ BitVec 32)) SeekEntryResult!6233)

(assert (=> b!598820 (= lt!272099 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272100 lt!272107 mask!3053))))

(assert (=> b!598820 e!342310))

(declare-fun res!383856 () Bool)

(assert (=> b!598820 (=> (not res!383856) (not e!342310))))

(declare-fun lt!272105 () (_ BitVec 32))

(assert (=> b!598820 (= res!383856 (= lt!272097 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272105 vacantSpotIndex!68 lt!272100 lt!272107 mask!3053)))))

(assert (=> b!598820 (= lt!272097 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272105 vacantSpotIndex!68 (select (arr!17793 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!598820 (= lt!272100 (select (store (arr!17793 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!272102 () Unit!18850)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37067 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18850)

(assert (=> b!598820 (= lt!272102 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272105 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!598820 (= lt!272105 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!598821 () Bool)

(declare-fun e!342319 () Bool)

(assert (=> b!598821 (= e!342319 true)))

(declare-datatypes ((List!11834 0))(
  ( (Nil!11831) (Cons!11830 (h!12875 (_ BitVec 64)) (t!18062 List!11834)) )
))
(declare-fun arrayNoDuplicates!0 (array!37067 (_ BitVec 32) List!11834) Bool)

(assert (=> b!598821 (arrayNoDuplicates!0 lt!272107 #b00000000000000000000000000000000 Nil!11831)))

(declare-fun lt!272101 () Unit!18850)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37067 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11834) Unit!18850)

(assert (=> b!598821 (= lt!272101 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11831))))

(assert (=> b!598821 (arrayContainsKey!0 lt!272107 (select (arr!17793 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272098 () Unit!18850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37067 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18850)

(assert (=> b!598821 (= lt!272098 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272107 (select (arr!17793 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598822 () Bool)

(declare-fun res!383848 () Bool)

(assert (=> b!598822 (=> (not res!383848) (not e!342320))))

(assert (=> b!598822 (= res!383848 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11831))))

(declare-fun b!598823 () Bool)

(assert (=> b!598823 (= e!342311 e!342319)))

(declare-fun res!383858 () Bool)

(assert (=> b!598823 (=> res!383858 e!342319)))

(assert (=> b!598823 (= res!383858 (or (not (= (select (arr!17793 a!2986) j!136) lt!272100)) (not (= (select (arr!17793 a!2986) j!136) lt!272104)) (bvsge j!136 index!984)))))

(assert (=> b!598823 e!342314))

(declare-fun res!383854 () Bool)

(assert (=> b!598823 (=> (not res!383854) (not e!342314))))

(assert (=> b!598823 (= res!383854 (= lt!272104 (select (arr!17793 a!2986) j!136)))))

(assert (=> b!598823 (= lt!272104 (select (store (arr!17793 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!598824 () Bool)

(declare-fun Unit!18853 () Unit!18850)

(assert (=> b!598824 (= e!342317 Unit!18853)))

(declare-fun b!598815 () Bool)

(declare-fun e!342321 () Bool)

(assert (=> b!598815 (= e!342321 e!342313)))

(declare-fun res!383864 () Bool)

(assert (=> b!598815 (=> (not res!383864) (not e!342313))))

(assert (=> b!598815 (= res!383864 (and (= lt!272103 (Found!6233 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17793 a!2986) index!984) (select (arr!17793 a!2986) j!136))) (not (= (select (arr!17793 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!598815 (= lt!272103 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17793 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!383863 () Bool)

(assert (=> start!54832 (=> (not res!383863) (not e!342312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54832 (= res!383863 (validMask!0 mask!3053))))

(assert (=> start!54832 e!342312))

(assert (=> start!54832 true))

(declare-fun array_inv!13589 (array!37067) Bool)

(assert (=> start!54832 (array_inv!13589 a!2986)))

(declare-fun b!598825 () Bool)

(declare-fun res!383855 () Bool)

(assert (=> b!598825 (=> (not res!383855) (not e!342312))))

(assert (=> b!598825 (= res!383855 (validKeyInArray!0 (select (arr!17793 a!2986) j!136)))))

(declare-fun b!598826 () Bool)

(assert (=> b!598826 (= e!342320 e!342321)))

(declare-fun res!383850 () Bool)

(assert (=> b!598826 (=> (not res!383850) (not e!342321))))

(assert (=> b!598826 (= res!383850 (= (select (store (arr!17793 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598826 (= lt!272107 (array!37068 (store (arr!17793 a!2986) i!1108 k!1786) (size!18157 a!2986)))))

(assert (= (and start!54832 res!383863) b!598819))

(assert (= (and b!598819 res!383861) b!598825))

(assert (= (and b!598825 res!383855) b!598816))

(assert (= (and b!598816 res!383849) b!598811))

(assert (= (and b!598811 res!383857) b!598813))

(assert (= (and b!598813 res!383851) b!598818))

(assert (= (and b!598818 res!383853) b!598822))

(assert (= (and b!598822 res!383848) b!598810))

(assert (= (and b!598810 res!383860) b!598826))

(assert (= (and b!598826 res!383850) b!598815))

(assert (= (and b!598815 res!383864) b!598820))

(assert (= (and b!598820 res!383856) b!598808))

(assert (= (and b!598820 c!67847) b!598817))

(assert (= (and b!598820 (not c!67847)) b!598824))

(assert (= (and b!598820 (not res!383859)) b!598823))

(assert (= (and b!598823 res!383854) b!598812))

(assert (= (and b!598812 (not res!383852)) b!598809))

(assert (= (and b!598809 res!383862) b!598814))

(assert (= (and b!598823 (not res!383858)) b!598821))

(declare-fun m!576095 () Bool)

(assert (=> b!598812 m!576095))

(assert (=> b!598823 m!576095))

(declare-fun m!576097 () Bool)

(assert (=> b!598823 m!576097))

(declare-fun m!576099 () Bool)

(assert (=> b!598823 m!576099))

(declare-fun m!576101 () Bool)

(assert (=> b!598822 m!576101))

(declare-fun m!576103 () Bool)

(assert (=> b!598816 m!576103))

(assert (=> b!598825 m!576095))

(assert (=> b!598825 m!576095))

(declare-fun m!576105 () Bool)

(assert (=> b!598825 m!576105))

(declare-fun m!576107 () Bool)

(assert (=> b!598810 m!576107))

(declare-fun m!576109 () Bool)

(assert (=> b!598813 m!576109))

(declare-fun m!576111 () Bool)

(assert (=> b!598818 m!576111))

(assert (=> b!598814 m!576095))

(assert (=> b!598814 m!576095))

(declare-fun m!576113 () Bool)

(assert (=> b!598814 m!576113))

(declare-fun m!576115 () Bool)

(assert (=> b!598815 m!576115))

(assert (=> b!598815 m!576095))

(assert (=> b!598815 m!576095))

(declare-fun m!576117 () Bool)

(assert (=> b!598815 m!576117))

(declare-fun m!576119 () Bool)

(assert (=> b!598820 m!576119))

(assert (=> b!598820 m!576095))

(declare-fun m!576121 () Bool)

(assert (=> b!598820 m!576121))

(assert (=> b!598820 m!576097))

(declare-fun m!576123 () Bool)

(assert (=> b!598820 m!576123))

(declare-fun m!576125 () Bool)

(assert (=> b!598820 m!576125))

(declare-fun m!576127 () Bool)

(assert (=> b!598820 m!576127))

(assert (=> b!598820 m!576095))

(declare-fun m!576129 () Bool)

(assert (=> b!598820 m!576129))

(declare-fun m!576131 () Bool)

(assert (=> start!54832 m!576131))

(declare-fun m!576133 () Bool)

(assert (=> start!54832 m!576133))

(declare-fun m!576135 () Bool)

(assert (=> b!598811 m!576135))

(assert (=> b!598809 m!576095))

(assert (=> b!598809 m!576095))

(declare-fun m!576137 () Bool)

(assert (=> b!598809 m!576137))

(assert (=> b!598821 m!576095))

(assert (=> b!598821 m!576095))

(declare-fun m!576139 () Bool)

(assert (=> b!598821 m!576139))

(declare-fun m!576141 () Bool)

(assert (=> b!598821 m!576141))

(assert (=> b!598821 m!576095))

(declare-fun m!576143 () Bool)

(assert (=> b!598821 m!576143))

(declare-fun m!576145 () Bool)

(assert (=> b!598821 m!576145))

(assert (=> b!598826 m!576097))

(declare-fun m!576147 () Bool)

(assert (=> b!598826 m!576147))

(push 1)

