; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55988 () Bool)

(assert start!55988)

(declare-fun b!614928 () Bool)

(declare-fun e!352581 () Bool)

(declare-fun e!352571 () Bool)

(assert (=> b!614928 (= e!352581 e!352571)))

(declare-fun res!396077 () Bool)

(assert (=> b!614928 (=> (not res!396077) (not e!352571))))

(declare-datatypes ((SeekEntryResult!6415 0))(
  ( (MissingZero!6415 (index!27944 (_ BitVec 32))) (Found!6415 (index!27945 (_ BitVec 32))) (Intermediate!6415 (undefined!7227 Bool) (index!27946 (_ BitVec 32)) (x!56743 (_ BitVec 32))) (Undefined!6415) (MissingVacant!6415 (index!27947 (_ BitVec 32))) )
))
(declare-fun lt!282277 () SeekEntryResult!6415)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!614928 (= res!396077 (or (= lt!282277 (MissingZero!6415 i!1108)) (= lt!282277 (MissingVacant!6415 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37458 0))(
  ( (array!37459 (arr!17975 (Array (_ BitVec 32) (_ BitVec 64))) (size!18339 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37458)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37458 (_ BitVec 32)) SeekEntryResult!6415)

(assert (=> b!614928 (= lt!282277 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun e!352577 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!614929 () Bool)

(declare-fun lt!282269 () array!37458)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614929 (= e!352577 (arrayContainsKey!0 lt!282269 (select (arr!17975 a!2986) j!136) index!984))))

(declare-fun b!614930 () Bool)

(declare-fun res!396082 () Bool)

(assert (=> b!614930 (=> (not res!396082) (not e!352581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614930 (= res!396082 (validKeyInArray!0 k!1786))))

(declare-fun e!352574 () Bool)

(declare-fun b!614931 () Bool)

(assert (=> b!614931 (= e!352574 (arrayContainsKey!0 lt!282269 (select (arr!17975 a!2986) j!136) index!984))))

(declare-fun b!614932 () Bool)

(declare-datatypes ((Unit!19878 0))(
  ( (Unit!19879) )
))
(declare-fun e!352575 () Unit!19878)

(declare-fun Unit!19880 () Unit!19878)

(assert (=> b!614932 (= e!352575 Unit!19880)))

(assert (=> b!614932 false))

(declare-fun b!614934 () Bool)

(declare-fun res!396089 () Bool)

(assert (=> b!614934 (=> (not res!396089) (not e!352571))))

(declare-datatypes ((List!12016 0))(
  ( (Nil!12013) (Cons!12012 (h!13057 (_ BitVec 64)) (t!18244 List!12016)) )
))
(declare-fun arrayNoDuplicates!0 (array!37458 (_ BitVec 32) List!12016) Bool)

(assert (=> b!614934 (= res!396089 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12013))))

(declare-fun b!614935 () Bool)

(declare-fun res!396085 () Bool)

(assert (=> b!614935 (=> (not res!396085) (not e!352581))))

(assert (=> b!614935 (= res!396085 (and (= (size!18339 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18339 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18339 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!614936 () Bool)

(declare-fun e!352573 () Unit!19878)

(declare-fun Unit!19881 () Unit!19878)

(assert (=> b!614936 (= e!352573 Unit!19881)))

(declare-fun b!614937 () Bool)

(declare-fun res!396083 () Bool)

(assert (=> b!614937 (= res!396083 (bvsge j!136 index!984))))

(declare-fun e!352576 () Bool)

(assert (=> b!614937 (=> res!396083 e!352576)))

(declare-fun e!352572 () Bool)

(assert (=> b!614937 (= e!352572 e!352576)))

(declare-fun b!614938 () Bool)

(declare-fun e!352580 () Bool)

(assert (=> b!614938 (= e!352580 (not true))))

(declare-fun lt!282267 () Unit!19878)

(assert (=> b!614938 (= lt!282267 e!352573)))

(declare-fun c!69797 () Bool)

(declare-fun lt!282262 () SeekEntryResult!6415)

(assert (=> b!614938 (= c!69797 (= lt!282262 (Found!6415 index!984)))))

(declare-fun lt!282260 () Unit!19878)

(assert (=> b!614938 (= lt!282260 e!352575)))

(declare-fun c!69796 () Bool)

(assert (=> b!614938 (= c!69796 (= lt!282262 Undefined!6415))))

(declare-fun lt!282272 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37458 (_ BitVec 32)) SeekEntryResult!6415)

(assert (=> b!614938 (= lt!282262 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282272 lt!282269 mask!3053))))

(declare-fun e!352579 () Bool)

(assert (=> b!614938 e!352579))

(declare-fun res!396076 () Bool)

(assert (=> b!614938 (=> (not res!396076) (not e!352579))))

(declare-fun lt!282274 () SeekEntryResult!6415)

(declare-fun lt!282258 () (_ BitVec 32))

(assert (=> b!614938 (= res!396076 (= lt!282274 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282258 vacantSpotIndex!68 lt!282272 lt!282269 mask!3053)))))

(assert (=> b!614938 (= lt!282274 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282258 vacantSpotIndex!68 (select (arr!17975 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614938 (= lt!282272 (select (store (arr!17975 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282259 () Unit!19878)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37458 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19878)

(assert (=> b!614938 (= lt!282259 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282258 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614938 (= lt!282258 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!614939 () Bool)

(declare-fun lt!282276 () SeekEntryResult!6415)

(assert (=> b!614939 (= e!352579 (= lt!282276 lt!282274))))

(declare-fun b!614940 () Bool)

(declare-fun res!396087 () Bool)

(assert (=> b!614940 (=> (not res!396087) (not e!352581))))

(assert (=> b!614940 (= res!396087 (validKeyInArray!0 (select (arr!17975 a!2986) j!136)))))

(declare-fun b!614941 () Bool)

(declare-fun Unit!19882 () Unit!19878)

(assert (=> b!614941 (= e!352573 Unit!19882)))

(declare-fun res!396088 () Bool)

(assert (=> b!614941 (= res!396088 (= (select (store (arr!17975 a!2986) i!1108 k!1786) index!984) (select (arr!17975 a!2986) j!136)))))

(assert (=> b!614941 (=> (not res!396088) (not e!352572))))

(assert (=> b!614941 e!352572))

(declare-fun c!69795 () Bool)

(assert (=> b!614941 (= c!69795 (bvslt j!136 index!984))))

(declare-fun lt!282266 () Unit!19878)

(declare-fun e!352568 () Unit!19878)

(assert (=> b!614941 (= lt!282266 e!352568)))

(declare-fun c!69794 () Bool)

(assert (=> b!614941 (= c!69794 (bvslt index!984 j!136))))

(declare-fun lt!282263 () Unit!19878)

(declare-fun e!352570 () Unit!19878)

(assert (=> b!614941 (= lt!282263 e!352570)))

(assert (=> b!614941 false))

(declare-fun b!614942 () Bool)

(declare-fun e!352569 () Bool)

(assert (=> b!614942 (= e!352571 e!352569)))

(declare-fun res!396080 () Bool)

(assert (=> b!614942 (=> (not res!396080) (not e!352569))))

(assert (=> b!614942 (= res!396080 (= (select (store (arr!17975 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!614942 (= lt!282269 (array!37459 (store (arr!17975 a!2986) i!1108 k!1786) (size!18339 a!2986)))))

(declare-fun b!614943 () Bool)

(declare-fun Unit!19883 () Unit!19878)

(assert (=> b!614943 (= e!352575 Unit!19883)))

(declare-fun res!396079 () Bool)

(assert (=> start!55988 (=> (not res!396079) (not e!352581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55988 (= res!396079 (validMask!0 mask!3053))))

(assert (=> start!55988 e!352581))

(assert (=> start!55988 true))

(declare-fun array_inv!13771 (array!37458) Bool)

(assert (=> start!55988 (array_inv!13771 a!2986)))

(declare-fun b!614933 () Bool)

(declare-fun res!396074 () Bool)

(assert (=> b!614933 (=> (not res!396074) (not e!352571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37458 (_ BitVec 32)) Bool)

(assert (=> b!614933 (= res!396074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614944 () Bool)

(declare-fun Unit!19884 () Unit!19878)

(assert (=> b!614944 (= e!352568 Unit!19884)))

(declare-fun b!614945 () Bool)

(assert (=> b!614945 false))

(declare-fun lt!282275 () Unit!19878)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37458 (_ BitVec 64) (_ BitVec 32) List!12016) Unit!19878)

(assert (=> b!614945 (= lt!282275 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282269 (select (arr!17975 a!2986) j!136) j!136 Nil!12013))))

(assert (=> b!614945 (arrayNoDuplicates!0 lt!282269 j!136 Nil!12013)))

(declare-fun lt!282268 () Unit!19878)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37458 (_ BitVec 32) (_ BitVec 32)) Unit!19878)

(assert (=> b!614945 (= lt!282268 (lemmaNoDuplicateFromThenFromBigger!0 lt!282269 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614945 (arrayNoDuplicates!0 lt!282269 #b00000000000000000000000000000000 Nil!12013)))

(declare-fun lt!282270 () Unit!19878)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12016) Unit!19878)

(assert (=> b!614945 (= lt!282270 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12013))))

(assert (=> b!614945 (arrayContainsKey!0 lt!282269 (select (arr!17975 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282271 () Unit!19878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37458 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19878)

(assert (=> b!614945 (= lt!282271 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282269 (select (arr!17975 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19885 () Unit!19878)

(assert (=> b!614945 (= e!352568 Unit!19885)))

(declare-fun b!614946 () Bool)

(declare-fun res!396078 () Bool)

(assert (=> b!614946 (=> (not res!396078) (not e!352581))))

(assert (=> b!614946 (= res!396078 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614947 () Bool)

(declare-fun res!396081 () Bool)

(assert (=> b!614947 (= res!396081 (arrayContainsKey!0 lt!282269 (select (arr!17975 a!2986) j!136) j!136))))

(assert (=> b!614947 (=> (not res!396081) (not e!352577))))

(assert (=> b!614947 (= e!352576 e!352577)))

(declare-fun b!614948 () Bool)

(assert (=> b!614948 (= e!352569 e!352580)))

(declare-fun res!396086 () Bool)

(assert (=> b!614948 (=> (not res!396086) (not e!352580))))

(assert (=> b!614948 (= res!396086 (and (= lt!282276 (Found!6415 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17975 a!2986) index!984) (select (arr!17975 a!2986) j!136))) (not (= (select (arr!17975 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!614948 (= lt!282276 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17975 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614949 () Bool)

(assert (=> b!614949 false))

(declare-fun lt!282265 () Unit!19878)

(assert (=> b!614949 (= lt!282265 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282269 (select (arr!17975 a!2986) j!136) index!984 Nil!12013))))

(assert (=> b!614949 (arrayNoDuplicates!0 lt!282269 index!984 Nil!12013)))

(declare-fun lt!282261 () Unit!19878)

(assert (=> b!614949 (= lt!282261 (lemmaNoDuplicateFromThenFromBigger!0 lt!282269 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614949 (arrayNoDuplicates!0 lt!282269 #b00000000000000000000000000000000 Nil!12013)))

(declare-fun lt!282273 () Unit!19878)

(assert (=> b!614949 (= lt!282273 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12013))))

(assert (=> b!614949 (arrayContainsKey!0 lt!282269 (select (arr!17975 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282264 () Unit!19878)

(assert (=> b!614949 (= lt!282264 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282269 (select (arr!17975 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!614949 e!352574))

(declare-fun res!396075 () Bool)

(assert (=> b!614949 (=> (not res!396075) (not e!352574))))

(assert (=> b!614949 (= res!396075 (arrayContainsKey!0 lt!282269 (select (arr!17975 a!2986) j!136) j!136))))

(declare-fun Unit!19886 () Unit!19878)

(assert (=> b!614949 (= e!352570 Unit!19886)))

(declare-fun b!614950 () Bool)

(declare-fun Unit!19887 () Unit!19878)

(assert (=> b!614950 (= e!352570 Unit!19887)))

(declare-fun b!614951 () Bool)

(declare-fun res!396084 () Bool)

(assert (=> b!614951 (=> (not res!396084) (not e!352571))))

(assert (=> b!614951 (= res!396084 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17975 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!55988 res!396079) b!614935))

(assert (= (and b!614935 res!396085) b!614940))

(assert (= (and b!614940 res!396087) b!614930))

(assert (= (and b!614930 res!396082) b!614946))

(assert (= (and b!614946 res!396078) b!614928))

(assert (= (and b!614928 res!396077) b!614933))

(assert (= (and b!614933 res!396074) b!614934))

(assert (= (and b!614934 res!396089) b!614951))

(assert (= (and b!614951 res!396084) b!614942))

(assert (= (and b!614942 res!396080) b!614948))

(assert (= (and b!614948 res!396086) b!614938))

(assert (= (and b!614938 res!396076) b!614939))

(assert (= (and b!614938 c!69796) b!614932))

(assert (= (and b!614938 (not c!69796)) b!614943))

(assert (= (and b!614938 c!69797) b!614941))

(assert (= (and b!614938 (not c!69797)) b!614936))

(assert (= (and b!614941 res!396088) b!614937))

(assert (= (and b!614937 (not res!396083)) b!614947))

(assert (= (and b!614947 res!396081) b!614929))

(assert (= (and b!614941 c!69795) b!614945))

(assert (= (and b!614941 (not c!69795)) b!614944))

(assert (= (and b!614941 c!69794) b!614949))

(assert (= (and b!614941 (not c!69794)) b!614950))

(assert (= (and b!614949 res!396075) b!614931))

(declare-fun m!591145 () Bool)

(assert (=> b!614945 m!591145))

(declare-fun m!591147 () Bool)

(assert (=> b!614945 m!591147))

(assert (=> b!614945 m!591145))

(declare-fun m!591149 () Bool)

(assert (=> b!614945 m!591149))

(declare-fun m!591151 () Bool)

(assert (=> b!614945 m!591151))

(declare-fun m!591153 () Bool)

(assert (=> b!614945 m!591153))

(assert (=> b!614945 m!591145))

(declare-fun m!591155 () Bool)

(assert (=> b!614945 m!591155))

(assert (=> b!614945 m!591145))

(declare-fun m!591157 () Bool)

(assert (=> b!614945 m!591157))

(declare-fun m!591159 () Bool)

(assert (=> b!614945 m!591159))

(declare-fun m!591161 () Bool)

(assert (=> b!614951 m!591161))

(declare-fun m!591163 () Bool)

(assert (=> b!614946 m!591163))

(assert (=> b!614940 m!591145))

(assert (=> b!614940 m!591145))

(declare-fun m!591165 () Bool)

(assert (=> b!614940 m!591165))

(assert (=> b!614947 m!591145))

(assert (=> b!614947 m!591145))

(declare-fun m!591167 () Bool)

(assert (=> b!614947 m!591167))

(assert (=> b!614931 m!591145))

(assert (=> b!614931 m!591145))

(declare-fun m!591169 () Bool)

(assert (=> b!614931 m!591169))

(declare-fun m!591171 () Bool)

(assert (=> b!614930 m!591171))

(assert (=> b!614929 m!591145))

(assert (=> b!614929 m!591145))

(assert (=> b!614929 m!591169))

(declare-fun m!591173 () Bool)

(assert (=> b!614934 m!591173))

(assert (=> b!614949 m!591145))

(assert (=> b!614949 m!591149))

(assert (=> b!614949 m!591145))

(declare-fun m!591175 () Bool)

(assert (=> b!614949 m!591175))

(declare-fun m!591177 () Bool)

(assert (=> b!614949 m!591177))

(assert (=> b!614949 m!591145))

(declare-fun m!591179 () Bool)

(assert (=> b!614949 m!591179))

(assert (=> b!614949 m!591145))

(assert (=> b!614949 m!591167))

(assert (=> b!614949 m!591159))

(declare-fun m!591181 () Bool)

(assert (=> b!614949 m!591181))

(assert (=> b!614949 m!591145))

(declare-fun m!591183 () Bool)

(assert (=> b!614949 m!591183))

(declare-fun m!591185 () Bool)

(assert (=> b!614941 m!591185))

(declare-fun m!591187 () Bool)

(assert (=> b!614941 m!591187))

(assert (=> b!614941 m!591145))

(declare-fun m!591189 () Bool)

(assert (=> b!614933 m!591189))

(declare-fun m!591191 () Bool)

(assert (=> b!614938 m!591191))

(declare-fun m!591193 () Bool)

(assert (=> b!614938 m!591193))

(declare-fun m!591195 () Bool)

(assert (=> b!614938 m!591195))

(assert (=> b!614938 m!591185))

(assert (=> b!614938 m!591145))

(declare-fun m!591197 () Bool)

(assert (=> b!614938 m!591197))

(assert (=> b!614938 m!591145))

(declare-fun m!591199 () Bool)

(assert (=> b!614938 m!591199))

(declare-fun m!591201 () Bool)

(assert (=> b!614938 m!591201))

(declare-fun m!591203 () Bool)

(assert (=> b!614928 m!591203))

(declare-fun m!591205 () Bool)

(assert (=> b!614948 m!591205))

(assert (=> b!614948 m!591145))

(assert (=> b!614948 m!591145))

(declare-fun m!591207 () Bool)

(assert (=> b!614948 m!591207))

(assert (=> b!614942 m!591185))

(declare-fun m!591209 () Bool)

(assert (=> b!614942 m!591209))

(declare-fun m!591211 () Bool)

(assert (=> start!55988 m!591211))

(declare-fun m!591213 () Bool)

(assert (=> start!55988 m!591213))

(push 1)

