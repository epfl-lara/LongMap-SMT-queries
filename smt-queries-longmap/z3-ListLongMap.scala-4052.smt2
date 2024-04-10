; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55542 () Bool)

(assert start!55542)

(declare-fun b!607134 () Bool)

(declare-datatypes ((Unit!19342 0))(
  ( (Unit!19343) )
))
(declare-fun e!347679 () Unit!19342)

(declare-fun Unit!19344 () Unit!19342)

(assert (=> b!607134 (= e!347679 Unit!19344)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37273 0))(
  ( (array!37274 (arr!17887 (Array (_ BitVec 32) (_ BitVec 64))) (size!18251 (_ BitVec 32))) )
))
(declare-fun lt!277134 () array!37273)

(declare-fun e!347672 () Bool)

(declare-fun b!607135 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37273)

(declare-fun arrayContainsKey!0 (array!37273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607135 (= e!347672 (arrayContainsKey!0 lt!277134 (select (arr!17887 a!2986) j!136) index!984))))

(declare-fun b!607136 () Bool)

(declare-fun e!347677 () Bool)

(declare-fun e!347685 () Bool)

(assert (=> b!607136 (= e!347677 e!347685)))

(declare-fun res!390015 () Bool)

(assert (=> b!607136 (=> (not res!390015) (not e!347685))))

(assert (=> b!607136 (= res!390015 (arrayContainsKey!0 lt!277134 (select (arr!17887 a!2986) j!136) j!136))))

(declare-fun b!607137 () Bool)

(declare-fun res!390009 () Bool)

(declare-fun e!347675 () Bool)

(assert (=> b!607137 (=> (not res!390009) (not e!347675))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607137 (= res!390009 (validKeyInArray!0 k0!1786))))

(declare-fun b!607138 () Bool)

(declare-fun res!390008 () Bool)

(declare-fun e!347681 () Bool)

(assert (=> b!607138 (=> (not res!390008) (not e!347681))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607138 (= res!390008 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17887 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607139 () Bool)

(declare-fun res!390014 () Bool)

(assert (=> b!607139 (=> (not res!390014) (not e!347675))))

(assert (=> b!607139 (= res!390014 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!390019 () Bool)

(assert (=> start!55542 (=> (not res!390019) (not e!347675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55542 (= res!390019 (validMask!0 mask!3053))))

(assert (=> start!55542 e!347675))

(assert (=> start!55542 true))

(declare-fun array_inv!13683 (array!37273) Bool)

(assert (=> start!55542 (array_inv!13683 a!2986)))

(declare-fun b!607140 () Bool)

(declare-fun e!347683 () Bool)

(declare-fun e!347684 () Bool)

(assert (=> b!607140 (= e!347683 e!347684)))

(declare-fun res!390000 () Bool)

(assert (=> b!607140 (=> res!390000 e!347684)))

(assert (=> b!607140 (= res!390000 (bvsge index!984 j!136))))

(declare-fun lt!277141 () Unit!19342)

(declare-fun e!347676 () Unit!19342)

(assert (=> b!607140 (= lt!277141 e!347676)))

(declare-fun c!68936 () Bool)

(assert (=> b!607140 (= c!68936 (bvslt j!136 index!984))))

(declare-fun b!607141 () Bool)

(declare-fun e!347674 () Bool)

(assert (=> b!607141 (= e!347684 e!347674)))

(declare-fun res!389998 () Bool)

(assert (=> b!607141 (=> res!389998 e!347674)))

(assert (=> b!607141 (= res!389998 (or (bvsge (size!18251 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18251 a!2986))))))

(assert (=> b!607141 (arrayContainsKey!0 lt!277134 (select (arr!17887 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277137 () Unit!19342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19342)

(assert (=> b!607141 (= lt!277137 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277134 (select (arr!17887 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607141 e!347672))

(declare-fun res!390010 () Bool)

(assert (=> b!607141 (=> (not res!390010) (not e!347672))))

(assert (=> b!607141 (= res!390010 (arrayContainsKey!0 lt!277134 (select (arr!17887 a!2986) j!136) j!136))))

(declare-fun b!607142 () Bool)

(declare-fun e!347680 () Bool)

(declare-fun e!347678 () Bool)

(assert (=> b!607142 (= e!347680 e!347678)))

(declare-fun res!390007 () Bool)

(assert (=> b!607142 (=> (not res!390007) (not e!347678))))

(declare-datatypes ((SeekEntryResult!6327 0))(
  ( (MissingZero!6327 (index!27583 (_ BitVec 32))) (Found!6327 (index!27584 (_ BitVec 32))) (Intermediate!6327 (undefined!7139 Bool) (index!27585 (_ BitVec 32)) (x!56396 (_ BitVec 32))) (Undefined!6327) (MissingVacant!6327 (index!27586 (_ BitVec 32))) )
))
(declare-fun lt!277138 () SeekEntryResult!6327)

(assert (=> b!607142 (= res!390007 (and (= lt!277138 (Found!6327 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17887 a!2986) index!984) (select (arr!17887 a!2986) j!136))) (not (= (select (arr!17887 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37273 (_ BitVec 32)) SeekEntryResult!6327)

(assert (=> b!607142 (= lt!277138 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17887 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607143 () Bool)

(declare-fun e!347671 () Bool)

(assert (=> b!607143 (= e!347678 (not e!347671))))

(declare-fun res!390005 () Bool)

(assert (=> b!607143 (=> res!390005 e!347671)))

(declare-fun lt!277139 () SeekEntryResult!6327)

(assert (=> b!607143 (= res!390005 (not (= lt!277139 (Found!6327 index!984))))))

(declare-fun lt!277147 () Unit!19342)

(assert (=> b!607143 (= lt!277147 e!347679)))

(declare-fun c!68935 () Bool)

(assert (=> b!607143 (= c!68935 (= lt!277139 Undefined!6327))))

(declare-fun lt!277135 () (_ BitVec 64))

(assert (=> b!607143 (= lt!277139 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277135 lt!277134 mask!3053))))

(declare-fun e!347670 () Bool)

(assert (=> b!607143 e!347670))

(declare-fun res!390003 () Bool)

(assert (=> b!607143 (=> (not res!390003) (not e!347670))))

(declare-fun lt!277131 () (_ BitVec 32))

(declare-fun lt!277133 () SeekEntryResult!6327)

(assert (=> b!607143 (= res!390003 (= lt!277133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277131 vacantSpotIndex!68 lt!277135 lt!277134 mask!3053)))))

(assert (=> b!607143 (= lt!277133 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277131 vacantSpotIndex!68 (select (arr!17887 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!607143 (= lt!277135 (select (store (arr!17887 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277143 () Unit!19342)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19342)

(assert (=> b!607143 (= lt!277143 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277131 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607143 (= lt!277131 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607144 () Bool)

(declare-fun e!347682 () Bool)

(assert (=> b!607144 (= e!347682 e!347677)))

(declare-fun res!390020 () Bool)

(assert (=> b!607144 (=> res!390020 e!347677)))

(declare-fun lt!277142 () (_ BitVec 64))

(assert (=> b!607144 (= res!390020 (or (not (= (select (arr!17887 a!2986) j!136) lt!277135)) (not (= (select (arr!17887 a!2986) j!136) lt!277142)) (bvsge j!136 index!984)))))

(declare-fun b!607145 () Bool)

(declare-fun res!390006 () Bool)

(assert (=> b!607145 (=> res!390006 e!347674)))

(declare-datatypes ((List!11928 0))(
  ( (Nil!11925) (Cons!11924 (h!12969 (_ BitVec 64)) (t!18156 List!11928)) )
))
(declare-fun contains!3004 (List!11928 (_ BitVec 64)) Bool)

(assert (=> b!607145 (= res!390006 (contains!3004 Nil!11925 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607146 () Bool)

(declare-fun res!390018 () Bool)

(assert (=> b!607146 (=> (not res!390018) (not e!347681))))

(declare-fun arrayNoDuplicates!0 (array!37273 (_ BitVec 32) List!11928) Bool)

(assert (=> b!607146 (= res!390018 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11925))))

(declare-fun b!607147 () Bool)

(declare-fun Unit!19345 () Unit!19342)

(assert (=> b!607147 (= e!347676 Unit!19345)))

(declare-fun lt!277140 () Unit!19342)

(assert (=> b!607147 (= lt!277140 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277134 (select (arr!17887 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607147 (arrayContainsKey!0 lt!277134 (select (arr!17887 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277144 () Unit!19342)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37273 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11928) Unit!19342)

(assert (=> b!607147 (= lt!277144 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11925))))

(assert (=> b!607147 (arrayNoDuplicates!0 lt!277134 #b00000000000000000000000000000000 Nil!11925)))

(declare-fun lt!277132 () Unit!19342)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37273 (_ BitVec 32) (_ BitVec 32)) Unit!19342)

(assert (=> b!607147 (= lt!277132 (lemmaNoDuplicateFromThenFromBigger!0 lt!277134 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607147 (arrayNoDuplicates!0 lt!277134 j!136 Nil!11925)))

(declare-fun lt!277145 () Unit!19342)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37273 (_ BitVec 64) (_ BitVec 32) List!11928) Unit!19342)

(assert (=> b!607147 (= lt!277145 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277134 (select (arr!17887 a!2986) j!136) j!136 Nil!11925))))

(assert (=> b!607147 false))

(declare-fun b!607148 () Bool)

(declare-fun Unit!19346 () Unit!19342)

(assert (=> b!607148 (= e!347676 Unit!19346)))

(declare-fun b!607149 () Bool)

(assert (=> b!607149 (= e!347685 (arrayContainsKey!0 lt!277134 (select (arr!17887 a!2986) j!136) index!984))))

(declare-fun b!607150 () Bool)

(assert (=> b!607150 (= e!347675 e!347681)))

(declare-fun res!390013 () Bool)

(assert (=> b!607150 (=> (not res!390013) (not e!347681))))

(declare-fun lt!277136 () SeekEntryResult!6327)

(assert (=> b!607150 (= res!390013 (or (= lt!277136 (MissingZero!6327 i!1108)) (= lt!277136 (MissingVacant!6327 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37273 (_ BitVec 32)) SeekEntryResult!6327)

(assert (=> b!607150 (= lt!277136 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607151 () Bool)

(declare-fun res!390004 () Bool)

(assert (=> b!607151 (=> res!390004 e!347674)))

(assert (=> b!607151 (= res!390004 (contains!3004 Nil!11925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607152 () Bool)

(assert (=> b!607152 (= e!347670 (= lt!277138 lt!277133))))

(declare-fun b!607153 () Bool)

(assert (=> b!607153 (= e!347674 true)))

(declare-fun lt!277146 () Bool)

(assert (=> b!607153 (= lt!277146 (contains!3004 Nil!11925 k0!1786))))

(declare-fun b!607154 () Bool)

(declare-fun res!390001 () Bool)

(assert (=> b!607154 (=> (not res!390001) (not e!347681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37273 (_ BitVec 32)) Bool)

(assert (=> b!607154 (= res!390001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607155 () Bool)

(assert (=> b!607155 (= e!347681 e!347680)))

(declare-fun res!390016 () Bool)

(assert (=> b!607155 (=> (not res!390016) (not e!347680))))

(assert (=> b!607155 (= res!390016 (= (select (store (arr!17887 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607155 (= lt!277134 (array!37274 (store (arr!17887 a!2986) i!1108 k0!1786) (size!18251 a!2986)))))

(declare-fun b!607156 () Bool)

(declare-fun res!390011 () Bool)

(assert (=> b!607156 (=> res!390011 e!347674)))

(declare-fun noDuplicate!310 (List!11928) Bool)

(assert (=> b!607156 (= res!390011 (not (noDuplicate!310 Nil!11925)))))

(declare-fun b!607157 () Bool)

(declare-fun res!390002 () Bool)

(assert (=> b!607157 (=> (not res!390002) (not e!347675))))

(assert (=> b!607157 (= res!390002 (validKeyInArray!0 (select (arr!17887 a!2986) j!136)))))

(declare-fun b!607158 () Bool)

(assert (=> b!607158 (= e!347671 e!347683)))

(declare-fun res!390017 () Bool)

(assert (=> b!607158 (=> res!390017 e!347683)))

(assert (=> b!607158 (= res!390017 (or (not (= (select (arr!17887 a!2986) j!136) lt!277135)) (not (= (select (arr!17887 a!2986) j!136) lt!277142))))))

(assert (=> b!607158 e!347682))

(declare-fun res!390012 () Bool)

(assert (=> b!607158 (=> (not res!390012) (not e!347682))))

(assert (=> b!607158 (= res!390012 (= lt!277142 (select (arr!17887 a!2986) j!136)))))

(assert (=> b!607158 (= lt!277142 (select (store (arr!17887 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607159 () Bool)

(declare-fun Unit!19347 () Unit!19342)

(assert (=> b!607159 (= e!347679 Unit!19347)))

(assert (=> b!607159 false))

(declare-fun b!607160 () Bool)

(declare-fun res!389999 () Bool)

(assert (=> b!607160 (=> (not res!389999) (not e!347675))))

(assert (=> b!607160 (= res!389999 (and (= (size!18251 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18251 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18251 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55542 res!390019) b!607160))

(assert (= (and b!607160 res!389999) b!607157))

(assert (= (and b!607157 res!390002) b!607137))

(assert (= (and b!607137 res!390009) b!607139))

(assert (= (and b!607139 res!390014) b!607150))

(assert (= (and b!607150 res!390013) b!607154))

(assert (= (and b!607154 res!390001) b!607146))

(assert (= (and b!607146 res!390018) b!607138))

(assert (= (and b!607138 res!390008) b!607155))

(assert (= (and b!607155 res!390016) b!607142))

(assert (= (and b!607142 res!390007) b!607143))

(assert (= (and b!607143 res!390003) b!607152))

(assert (= (and b!607143 c!68935) b!607159))

(assert (= (and b!607143 (not c!68935)) b!607134))

(assert (= (and b!607143 (not res!390005)) b!607158))

(assert (= (and b!607158 res!390012) b!607144))

(assert (= (and b!607144 (not res!390020)) b!607136))

(assert (= (and b!607136 res!390015) b!607149))

(assert (= (and b!607158 (not res!390017)) b!607140))

(assert (= (and b!607140 c!68936) b!607147))

(assert (= (and b!607140 (not c!68936)) b!607148))

(assert (= (and b!607140 (not res!390000)) b!607141))

(assert (= (and b!607141 res!390010) b!607135))

(assert (= (and b!607141 (not res!389998)) b!607156))

(assert (= (and b!607156 (not res!390011)) b!607145))

(assert (= (and b!607145 (not res!390006)) b!607151))

(assert (= (and b!607151 (not res!390004)) b!607153))

(declare-fun m!583907 () Bool)

(assert (=> b!607138 m!583907))

(declare-fun m!583909 () Bool)

(assert (=> b!607139 m!583909))

(declare-fun m!583911 () Bool)

(assert (=> b!607151 m!583911))

(declare-fun m!583913 () Bool)

(assert (=> b!607145 m!583913))

(declare-fun m!583915 () Bool)

(assert (=> b!607157 m!583915))

(assert (=> b!607157 m!583915))

(declare-fun m!583917 () Bool)

(assert (=> b!607157 m!583917))

(declare-fun m!583919 () Bool)

(assert (=> start!55542 m!583919))

(declare-fun m!583921 () Bool)

(assert (=> start!55542 m!583921))

(assert (=> b!607144 m!583915))

(declare-fun m!583923 () Bool)

(assert (=> b!607147 m!583923))

(assert (=> b!607147 m!583915))

(declare-fun m!583925 () Bool)

(assert (=> b!607147 m!583925))

(declare-fun m!583927 () Bool)

(assert (=> b!607147 m!583927))

(assert (=> b!607147 m!583915))

(declare-fun m!583929 () Bool)

(assert (=> b!607147 m!583929))

(assert (=> b!607147 m!583915))

(declare-fun m!583931 () Bool)

(assert (=> b!607147 m!583931))

(declare-fun m!583933 () Bool)

(assert (=> b!607147 m!583933))

(declare-fun m!583935 () Bool)

(assert (=> b!607147 m!583935))

(assert (=> b!607147 m!583915))

(assert (=> b!607149 m!583915))

(assert (=> b!607149 m!583915))

(declare-fun m!583937 () Bool)

(assert (=> b!607149 m!583937))

(assert (=> b!607136 m!583915))

(assert (=> b!607136 m!583915))

(declare-fun m!583939 () Bool)

(assert (=> b!607136 m!583939))

(declare-fun m!583941 () Bool)

(assert (=> b!607137 m!583941))

(declare-fun m!583943 () Bool)

(assert (=> b!607154 m!583943))

(declare-fun m!583945 () Bool)

(assert (=> b!607150 m!583945))

(declare-fun m!583947 () Bool)

(assert (=> b!607146 m!583947))

(declare-fun m!583949 () Bool)

(assert (=> b!607156 m!583949))

(assert (=> b!607158 m!583915))

(declare-fun m!583951 () Bool)

(assert (=> b!607158 m!583951))

(declare-fun m!583953 () Bool)

(assert (=> b!607158 m!583953))

(declare-fun m!583955 () Bool)

(assert (=> b!607143 m!583955))

(declare-fun m!583957 () Bool)

(assert (=> b!607143 m!583957))

(assert (=> b!607143 m!583915))

(declare-fun m!583959 () Bool)

(assert (=> b!607143 m!583959))

(declare-fun m!583961 () Bool)

(assert (=> b!607143 m!583961))

(assert (=> b!607143 m!583915))

(declare-fun m!583963 () Bool)

(assert (=> b!607143 m!583963))

(declare-fun m!583965 () Bool)

(assert (=> b!607143 m!583965))

(assert (=> b!607143 m!583951))

(assert (=> b!607135 m!583915))

(assert (=> b!607135 m!583915))

(assert (=> b!607135 m!583937))

(assert (=> b!607141 m!583915))

(assert (=> b!607141 m!583915))

(declare-fun m!583967 () Bool)

(assert (=> b!607141 m!583967))

(assert (=> b!607141 m!583915))

(declare-fun m!583969 () Bool)

(assert (=> b!607141 m!583969))

(assert (=> b!607141 m!583915))

(assert (=> b!607141 m!583939))

(declare-fun m!583971 () Bool)

(assert (=> b!607153 m!583971))

(declare-fun m!583973 () Bool)

(assert (=> b!607142 m!583973))

(assert (=> b!607142 m!583915))

(assert (=> b!607142 m!583915))

(declare-fun m!583975 () Bool)

(assert (=> b!607142 m!583975))

(assert (=> b!607155 m!583951))

(declare-fun m!583977 () Bool)

(assert (=> b!607155 m!583977))

(check-sat (not b!607149) (not b!607156) (not b!607145) (not b!607135) (not b!607150) (not b!607142) (not b!607143) (not b!607153) (not b!607139) (not b!607151) (not b!607141) (not b!607136) (not b!607157) (not b!607137) (not b!607146) (not b!607147) (not b!607154) (not start!55542))
(check-sat)
