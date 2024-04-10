; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59210 () Bool)

(assert start!59210)

(declare-fun b!653158 () Bool)

(declare-fun e!374965 () Bool)

(declare-fun e!374967 () Bool)

(assert (=> b!653158 (= e!374965 (not e!374967))))

(declare-fun res!423559 () Bool)

(assert (=> b!653158 (=> res!423559 e!374967)))

(declare-datatypes ((SeekEntryResult!6953 0))(
  ( (MissingZero!6953 (index!30168 (_ BitVec 32))) (Found!6953 (index!30169 (_ BitVec 32))) (Intermediate!6953 (undefined!7765 Bool) (index!30170 (_ BitVec 32)) (x!58961 (_ BitVec 32))) (Undefined!6953) (MissingVacant!6953 (index!30171 (_ BitVec 32))) )
))
(declare-fun lt!304022 () SeekEntryResult!6953)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!653158 (= res!423559 (not (= lt!304022 (Found!6953 index!984))))))

(declare-datatypes ((Unit!22344 0))(
  ( (Unit!22345) )
))
(declare-fun lt!304032 () Unit!22344)

(declare-fun e!374968 () Unit!22344)

(assert (=> b!653158 (= lt!304032 e!374968)))

(declare-fun c!75170 () Bool)

(assert (=> b!653158 (= c!75170 (= lt!304022 Undefined!6953))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!304028 () (_ BitVec 64))

(declare-datatypes ((array!38623 0))(
  ( (array!38624 (arr!18513 (Array (_ BitVec 32) (_ BitVec 64))) (size!18877 (_ BitVec 32))) )
))
(declare-fun lt!304024 () array!38623)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38623 (_ BitVec 32)) SeekEntryResult!6953)

(assert (=> b!653158 (= lt!304022 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304028 lt!304024 mask!3053))))

(declare-fun e!374972 () Bool)

(assert (=> b!653158 e!374972))

(declare-fun res!423567 () Bool)

(assert (=> b!653158 (=> (not res!423567) (not e!374972))))

(declare-fun lt!304036 () SeekEntryResult!6953)

(declare-fun lt!304037 () (_ BitVec 32))

(assert (=> b!653158 (= res!423567 (= lt!304036 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304037 vacantSpotIndex!68 lt!304028 lt!304024 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38623)

(assert (=> b!653158 (= lt!304036 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304037 vacantSpotIndex!68 (select (arr!18513 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!653158 (= lt!304028 (select (store (arr!18513 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!304023 () Unit!22344)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38623 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22344)

(assert (=> b!653158 (= lt!304023 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304037 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!653158 (= lt!304037 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!653159 () Bool)

(declare-fun e!374963 () Unit!22344)

(declare-fun Unit!22346 () Unit!22344)

(assert (=> b!653159 (= e!374963 Unit!22346)))

(declare-fun lt!304038 () Unit!22344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22344)

(assert (=> b!653159 (= lt!304038 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304024 (select (arr!18513 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!653159 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304034 () Unit!22344)

(declare-datatypes ((List!12554 0))(
  ( (Nil!12551) (Cons!12550 (h!13595 (_ BitVec 64)) (t!18782 List!12554)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12554) Unit!22344)

(assert (=> b!653159 (= lt!304034 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12551))))

(declare-fun arrayNoDuplicates!0 (array!38623 (_ BitVec 32) List!12554) Bool)

(assert (=> b!653159 (arrayNoDuplicates!0 lt!304024 #b00000000000000000000000000000000 Nil!12551)))

(declare-fun lt!304031 () Unit!22344)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38623 (_ BitVec 32) (_ BitVec 32)) Unit!22344)

(assert (=> b!653159 (= lt!304031 (lemmaNoDuplicateFromThenFromBigger!0 lt!304024 #b00000000000000000000000000000000 j!136))))

(assert (=> b!653159 (arrayNoDuplicates!0 lt!304024 j!136 Nil!12551)))

(declare-fun lt!304035 () Unit!22344)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38623 (_ BitVec 64) (_ BitVec 32) List!12554) Unit!22344)

(assert (=> b!653159 (= lt!304035 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136 Nil!12551))))

(assert (=> b!653159 false))

(declare-fun res!423563 () Bool)

(declare-fun e!374978 () Bool)

(assert (=> start!59210 (=> (not res!423563) (not e!374978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59210 (= res!423563 (validMask!0 mask!3053))))

(assert (=> start!59210 e!374978))

(assert (=> start!59210 true))

(declare-fun array_inv!14309 (array!38623) Bool)

(assert (=> start!59210 (array_inv!14309 a!2986)))

(declare-fun b!653160 () Bool)

(declare-fun res!423569 () Bool)

(assert (=> b!653160 (=> (not res!423569) (not e!374978))))

(assert (=> b!653160 (= res!423569 (and (= (size!18877 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18877 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18877 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!653161 () Bool)

(declare-fun e!374970 () Bool)

(declare-fun e!374974 () Bool)

(assert (=> b!653161 (= e!374970 e!374974)))

(declare-fun res!423570 () Bool)

(assert (=> b!653161 (=> res!423570 e!374974)))

(assert (=> b!653161 (= res!423570 (or (bvsge (size!18877 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18877 a!2986)) (bvsge index!984 (size!18877 a!2986))))))

(assert (=> b!653161 (arrayNoDuplicates!0 lt!304024 index!984 Nil!12551)))

(declare-fun lt!304026 () Unit!22344)

(assert (=> b!653161 (= lt!304026 (lemmaNoDuplicateFromThenFromBigger!0 lt!304024 #b00000000000000000000000000000000 index!984))))

(assert (=> b!653161 (arrayNoDuplicates!0 lt!304024 #b00000000000000000000000000000000 Nil!12551)))

(declare-fun lt!304029 () Unit!22344)

(assert (=> b!653161 (= lt!304029 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12551))))

(assert (=> b!653161 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304033 () Unit!22344)

(assert (=> b!653161 (= lt!304033 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!374969 () Bool)

(assert (=> b!653161 e!374969))

(declare-fun res!423573 () Bool)

(assert (=> b!653161 (=> (not res!423573) (not e!374969))))

(assert (=> b!653161 (= res!423573 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136))))

(declare-fun b!653162 () Bool)

(declare-fun Unit!22347 () Unit!22344)

(assert (=> b!653162 (= e!374968 Unit!22347)))

(assert (=> b!653162 false))

(declare-fun e!374964 () Bool)

(declare-fun b!653163 () Bool)

(assert (=> b!653163 (= e!374964 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) index!984))))

(declare-fun b!653164 () Bool)

(declare-fun res!423562 () Bool)

(declare-fun e!374977 () Bool)

(assert (=> b!653164 (=> (not res!423562) (not e!374977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38623 (_ BitVec 32)) Bool)

(assert (=> b!653164 (= res!423562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!653165 () Bool)

(declare-fun res!423572 () Bool)

(assert (=> b!653165 (=> (not res!423572) (not e!374977))))

(assert (=> b!653165 (= res!423572 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12551))))

(declare-fun b!653166 () Bool)

(declare-fun e!374975 () Bool)

(assert (=> b!653166 (= e!374967 e!374975)))

(declare-fun res!423556 () Bool)

(assert (=> b!653166 (=> res!423556 e!374975)))

(declare-fun lt!304030 () (_ BitVec 64))

(assert (=> b!653166 (= res!423556 (or (not (= (select (arr!18513 a!2986) j!136) lt!304028)) (not (= (select (arr!18513 a!2986) j!136) lt!304030))))))

(declare-fun e!374971 () Bool)

(assert (=> b!653166 e!374971))

(declare-fun res!423574 () Bool)

(assert (=> b!653166 (=> (not res!423574) (not e!374971))))

(assert (=> b!653166 (= res!423574 (= lt!304030 (select (arr!18513 a!2986) j!136)))))

(assert (=> b!653166 (= lt!304030 (select (store (arr!18513 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!653167 () Bool)

(declare-fun Unit!22348 () Unit!22344)

(assert (=> b!653167 (= e!374963 Unit!22348)))

(declare-fun b!653168 () Bool)

(declare-fun res!423575 () Bool)

(assert (=> b!653168 (=> (not res!423575) (not e!374978))))

(assert (=> b!653168 (= res!423575 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!653169 () Bool)

(declare-fun e!374979 () Bool)

(assert (=> b!653169 (= e!374979 e!374965)))

(declare-fun res!423566 () Bool)

(assert (=> b!653169 (=> (not res!423566) (not e!374965))))

(declare-fun lt!304039 () SeekEntryResult!6953)

(assert (=> b!653169 (= res!423566 (and (= lt!304039 (Found!6953 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18513 a!2986) index!984) (select (arr!18513 a!2986) j!136))) (not (= (select (arr!18513 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!653169 (= lt!304039 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18513 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653170 () Bool)

(declare-fun res!423571 () Bool)

(assert (=> b!653170 (=> res!423571 e!374974)))

(declare-fun noDuplicate!438 (List!12554) Bool)

(assert (=> b!653170 (= res!423571 (not (noDuplicate!438 Nil!12551)))))

(declare-fun b!653171 () Bool)

(declare-fun Unit!22349 () Unit!22344)

(assert (=> b!653171 (= e!374968 Unit!22349)))

(declare-fun b!653172 () Bool)

(assert (=> b!653172 (= e!374977 e!374979)))

(declare-fun res!423555 () Bool)

(assert (=> b!653172 (=> (not res!423555) (not e!374979))))

(assert (=> b!653172 (= res!423555 (= (select (store (arr!18513 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653172 (= lt!304024 (array!38624 (store (arr!18513 a!2986) i!1108 k!1786) (size!18877 a!2986)))))

(declare-fun b!653173 () Bool)

(declare-fun res!423558 () Bool)

(assert (=> b!653173 (=> (not res!423558) (not e!374978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!653173 (= res!423558 (validKeyInArray!0 k!1786))))

(declare-fun b!653174 () Bool)

(assert (=> b!653174 (= e!374969 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) index!984))))

(declare-fun b!653175 () Bool)

(declare-fun res!423557 () Bool)

(assert (=> b!653175 (=> (not res!423557) (not e!374978))))

(assert (=> b!653175 (= res!423557 (validKeyInArray!0 (select (arr!18513 a!2986) j!136)))))

(declare-fun b!653176 () Bool)

(declare-fun e!374966 () Bool)

(assert (=> b!653176 (= e!374966 e!374964)))

(declare-fun res!423565 () Bool)

(assert (=> b!653176 (=> (not res!423565) (not e!374964))))

(assert (=> b!653176 (= res!423565 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136))))

(declare-fun b!653177 () Bool)

(declare-fun e!374976 () Bool)

(assert (=> b!653177 (= e!374974 e!374976)))

(declare-fun res!423564 () Bool)

(assert (=> b!653177 (=> (not res!423564) (not e!374976))))

(declare-fun contains!3182 (List!12554 (_ BitVec 64)) Bool)

(assert (=> b!653177 (= res!423564 (not (contains!3182 Nil!12551 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653178 () Bool)

(assert (=> b!653178 (= e!374976 (not (contains!3182 Nil!12551 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653179 () Bool)

(assert (=> b!653179 (= e!374978 e!374977)))

(declare-fun res!423560 () Bool)

(assert (=> b!653179 (=> (not res!423560) (not e!374977))))

(declare-fun lt!304025 () SeekEntryResult!6953)

(assert (=> b!653179 (= res!423560 (or (= lt!304025 (MissingZero!6953 i!1108)) (= lt!304025 (MissingVacant!6953 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38623 (_ BitVec 32)) SeekEntryResult!6953)

(assert (=> b!653179 (= lt!304025 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!653180 () Bool)

(assert (=> b!653180 (= e!374971 e!374966)))

(declare-fun res!423568 () Bool)

(assert (=> b!653180 (=> res!423568 e!374966)))

(assert (=> b!653180 (= res!423568 (or (not (= (select (arr!18513 a!2986) j!136) lt!304028)) (not (= (select (arr!18513 a!2986) j!136) lt!304030)) (bvsge j!136 index!984)))))

(declare-fun b!653181 () Bool)

(assert (=> b!653181 (= e!374975 e!374970)))

(declare-fun res!423561 () Bool)

(assert (=> b!653181 (=> res!423561 e!374970)))

(assert (=> b!653181 (= res!423561 (bvsge index!984 j!136))))

(declare-fun lt!304027 () Unit!22344)

(assert (=> b!653181 (= lt!304027 e!374963)))

(declare-fun c!75169 () Bool)

(assert (=> b!653181 (= c!75169 (bvslt j!136 index!984))))

(declare-fun b!653182 () Bool)

(declare-fun res!423554 () Bool)

(assert (=> b!653182 (=> (not res!423554) (not e!374977))))

(assert (=> b!653182 (= res!423554 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18513 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653183 () Bool)

(assert (=> b!653183 (= e!374972 (= lt!304039 lt!304036))))

(assert (= (and start!59210 res!423563) b!653160))

(assert (= (and b!653160 res!423569) b!653175))

(assert (= (and b!653175 res!423557) b!653173))

(assert (= (and b!653173 res!423558) b!653168))

(assert (= (and b!653168 res!423575) b!653179))

(assert (= (and b!653179 res!423560) b!653164))

(assert (= (and b!653164 res!423562) b!653165))

(assert (= (and b!653165 res!423572) b!653182))

(assert (= (and b!653182 res!423554) b!653172))

(assert (= (and b!653172 res!423555) b!653169))

(assert (= (and b!653169 res!423566) b!653158))

(assert (= (and b!653158 res!423567) b!653183))

(assert (= (and b!653158 c!75170) b!653162))

(assert (= (and b!653158 (not c!75170)) b!653171))

(assert (= (and b!653158 (not res!423559)) b!653166))

(assert (= (and b!653166 res!423574) b!653180))

(assert (= (and b!653180 (not res!423568)) b!653176))

(assert (= (and b!653176 res!423565) b!653163))

(assert (= (and b!653166 (not res!423556)) b!653181))

(assert (= (and b!653181 c!75169) b!653159))

(assert (= (and b!653181 (not c!75169)) b!653167))

(assert (= (and b!653181 (not res!423561)) b!653161))

(assert (= (and b!653161 res!423573) b!653174))

(assert (= (and b!653161 (not res!423570)) b!653170))

(assert (= (and b!653170 (not res!423571)) b!653177))

(assert (= (and b!653177 res!423564) b!653178))

(declare-fun m!626285 () Bool)

(assert (=> b!653179 m!626285))

(declare-fun m!626287 () Bool)

(assert (=> b!653177 m!626287))

(declare-fun m!626289 () Bool)

(assert (=> b!653178 m!626289))

(declare-fun m!626291 () Bool)

(assert (=> b!653165 m!626291))

(declare-fun m!626293 () Bool)

(assert (=> b!653158 m!626293))

(declare-fun m!626295 () Bool)

(assert (=> b!653158 m!626295))

(declare-fun m!626297 () Bool)

(assert (=> b!653158 m!626297))

(declare-fun m!626299 () Bool)

(assert (=> b!653158 m!626299))

(declare-fun m!626301 () Bool)

(assert (=> b!653158 m!626301))

(declare-fun m!626303 () Bool)

(assert (=> b!653158 m!626303))

(declare-fun m!626305 () Bool)

(assert (=> b!653158 m!626305))

(declare-fun m!626307 () Bool)

(assert (=> b!653158 m!626307))

(assert (=> b!653158 m!626301))

(declare-fun m!626309 () Bool)

(assert (=> b!653161 m!626309))

(assert (=> b!653161 m!626301))

(assert (=> b!653161 m!626301))

(declare-fun m!626311 () Bool)

(assert (=> b!653161 m!626311))

(declare-fun m!626313 () Bool)

(assert (=> b!653161 m!626313))

(assert (=> b!653161 m!626301))

(declare-fun m!626315 () Bool)

(assert (=> b!653161 m!626315))

(declare-fun m!626317 () Bool)

(assert (=> b!653161 m!626317))

(assert (=> b!653161 m!626301))

(declare-fun m!626319 () Bool)

(assert (=> b!653161 m!626319))

(declare-fun m!626321 () Bool)

(assert (=> b!653161 m!626321))

(assert (=> b!653166 m!626301))

(assert (=> b!653166 m!626299))

(declare-fun m!626323 () Bool)

(assert (=> b!653166 m!626323))

(declare-fun m!626325 () Bool)

(assert (=> b!653169 m!626325))

(assert (=> b!653169 m!626301))

(assert (=> b!653169 m!626301))

(declare-fun m!626327 () Bool)

(assert (=> b!653169 m!626327))

(assert (=> b!653180 m!626301))

(declare-fun m!626329 () Bool)

(assert (=> b!653182 m!626329))

(assert (=> b!653176 m!626301))

(assert (=> b!653176 m!626301))

(assert (=> b!653176 m!626319))

(assert (=> b!653159 m!626309))

(declare-fun m!626331 () Bool)

(assert (=> b!653159 m!626331))

(assert (=> b!653159 m!626301))

(declare-fun m!626333 () Bool)

(assert (=> b!653159 m!626333))

(assert (=> b!653159 m!626301))

(declare-fun m!626335 () Bool)

(assert (=> b!653159 m!626335))

(assert (=> b!653159 m!626321))

(assert (=> b!653159 m!626301))

(declare-fun m!626337 () Bool)

(assert (=> b!653159 m!626337))

(assert (=> b!653159 m!626301))

(declare-fun m!626339 () Bool)

(assert (=> b!653159 m!626339))

(assert (=> b!653175 m!626301))

(assert (=> b!653175 m!626301))

(declare-fun m!626341 () Bool)

(assert (=> b!653175 m!626341))

(declare-fun m!626343 () Bool)

(assert (=> b!653170 m!626343))

(assert (=> b!653172 m!626299))

(declare-fun m!626345 () Bool)

(assert (=> b!653172 m!626345))

(declare-fun m!626347 () Bool)

(assert (=> b!653168 m!626347))

(assert (=> b!653163 m!626301))

(assert (=> b!653163 m!626301))

(declare-fun m!626349 () Bool)

(assert (=> b!653163 m!626349))

(declare-fun m!626351 () Bool)

(assert (=> b!653173 m!626351))

(declare-fun m!626353 () Bool)

(assert (=> b!653164 m!626353))

(declare-fun m!626355 () Bool)

(assert (=> start!59210 m!626355))

(declare-fun m!626357 () Bool)

(assert (=> start!59210 m!626357))

(assert (=> b!653174 m!626301))

(assert (=> b!653174 m!626301))

(assert (=> b!653174 m!626349))

(push 1)

(assert (not start!59210))

(assert (not b!653165))

(assert (not b!653170))

(assert (not b!653174))

(assert (not b!653176))

(assert (not b!653178))

(assert (not b!653175))

(assert (not b!653177))

(assert (not b!653173))

(assert (not b!653163))

(assert (not b!653159))

(assert (not b!653164))

(assert (not b!653179))

(assert (not b!653158))

(assert (not b!653161))

(assert (not b!653169))

(assert (not b!653168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!653420 () Bool)

(declare-fun e!375148 () Bool)

(declare-fun e!375149 () Bool)

(assert (=> b!653420 (= e!375148 e!375149)))

(declare-fun res!423757 () Bool)

(assert (=> b!653420 (=> (not res!423757) (not e!375149))))

(declare-fun e!375146 () Bool)

(assert (=> b!653420 (= res!423757 (not e!375146))))

(declare-fun res!423756 () Bool)

(assert (=> b!653420 (=> (not res!423756) (not e!375146))))

(assert (=> b!653420 (= res!423756 (validKeyInArray!0 (select (arr!18513 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653421 () Bool)

(declare-fun e!375147 () Bool)

(declare-fun call!33814 () Bool)

(assert (=> b!653421 (= e!375147 call!33814)))

(declare-fun b!653422 () Bool)

(assert (=> b!653422 (= e!375146 (contains!3182 Nil!12551 (select (arr!18513 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92415 () Bool)

(declare-fun res!423758 () Bool)

(assert (=> d!92415 (=> res!423758 e!375148)))

(assert (=> d!92415 (= res!423758 (bvsge #b00000000000000000000000000000000 (size!18877 a!2986)))))

(assert (=> d!92415 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12551) e!375148)))

(declare-fun b!653423 () Bool)

(assert (=> b!653423 (= e!375149 e!375147)))

(declare-fun c!75199 () Bool)

(assert (=> b!653423 (= c!75199 (validKeyInArray!0 (select (arr!18513 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33811 () Bool)

(assert (=> bm!33811 (= call!33814 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75199 (Cons!12550 (select (arr!18513 a!2986) #b00000000000000000000000000000000) Nil!12551) Nil!12551)))))

(declare-fun b!653424 () Bool)

(assert (=> b!653424 (= e!375147 call!33814)))

(assert (= (and d!92415 (not res!423758)) b!653420))

(assert (= (and b!653420 res!423756) b!653422))

(assert (= (and b!653420 res!423757) b!653423))

(assert (= (and b!653423 c!75199) b!653421))

(assert (= (and b!653423 (not c!75199)) b!653424))

(assert (= (or b!653421 b!653424) bm!33811))

(declare-fun m!626579 () Bool)

(assert (=> b!653420 m!626579))

(assert (=> b!653420 m!626579))

(declare-fun m!626581 () Bool)

(assert (=> b!653420 m!626581))

(assert (=> b!653422 m!626579))

(assert (=> b!653422 m!626579))

(declare-fun m!626583 () Bool)

(assert (=> b!653422 m!626583))

(assert (=> b!653423 m!626579))

(assert (=> b!653423 m!626579))

(assert (=> b!653423 m!626581))

(assert (=> bm!33811 m!626579))

(declare-fun m!626585 () Bool)

(assert (=> bm!33811 m!626585))

(assert (=> b!653165 d!92415))

(declare-fun d!92423 () Bool)

(declare-fun res!423763 () Bool)

(declare-fun e!375154 () Bool)

(assert (=> d!92423 (=> res!423763 e!375154)))

(assert (=> d!92423 (= res!423763 (= (select (arr!18513 lt!304024) j!136) (select (arr!18513 a!2986) j!136)))))

(assert (=> d!92423 (= (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136) e!375154)))

(declare-fun b!653429 () Bool)

(declare-fun e!375155 () Bool)

(assert (=> b!653429 (= e!375154 e!375155)))

(declare-fun res!423764 () Bool)

(assert (=> b!653429 (=> (not res!423764) (not e!375155))))

(assert (=> b!653429 (= res!423764 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18877 lt!304024)))))

(declare-fun b!653430 () Bool)

(assert (=> b!653430 (= e!375155 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92423 (not res!423763)) b!653429))

(assert (= (and b!653429 res!423764) b!653430))

(declare-fun m!626587 () Bool)

(assert (=> d!92423 m!626587))

(assert (=> b!653430 m!626301))

(declare-fun m!626589 () Bool)

(assert (=> b!653430 m!626589))

(assert (=> b!653176 d!92423))

(declare-fun d!92429 () Bool)

(assert (=> d!92429 (= (validKeyInArray!0 (select (arr!18513 a!2986) j!136)) (and (not (= (select (arr!18513 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18513 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653175 d!92429))

(declare-fun d!92435 () Bool)

(declare-fun lt!304177 () Bool)

(declare-fun content!253 (List!12554) (Set (_ BitVec 64)))

(assert (=> d!92435 (= lt!304177 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!253 Nil!12551)))))

(declare-fun e!375171 () Bool)

(assert (=> d!92435 (= lt!304177 e!375171)))

(declare-fun res!423779 () Bool)

(assert (=> d!92435 (=> (not res!423779) (not e!375171))))

(assert (=> d!92435 (= res!423779 (is-Cons!12550 Nil!12551))))

(assert (=> d!92435 (= (contains!3182 Nil!12551 #b0000000000000000000000000000000000000000000000000000000000000000) lt!304177)))

(declare-fun b!653445 () Bool)

(declare-fun e!375170 () Bool)

(assert (=> b!653445 (= e!375171 e!375170)))

(declare-fun res!423780 () Bool)

(assert (=> b!653445 (=> res!423780 e!375170)))

(assert (=> b!653445 (= res!423780 (= (h!13595 Nil!12551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653446 () Bool)

(assert (=> b!653446 (= e!375170 (contains!3182 (t!18782 Nil!12551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92435 res!423779) b!653445))

(assert (= (and b!653445 (not res!423780)) b!653446))

(declare-fun m!626595 () Bool)

(assert (=> d!92435 m!626595))

(declare-fun m!626597 () Bool)

(assert (=> d!92435 m!626597))

(declare-fun m!626599 () Bool)

(assert (=> b!653446 m!626599))

(assert (=> b!653177 d!92435))

(declare-fun d!92439 () Bool)

(assert (=> d!92439 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653173 d!92439))

(declare-fun d!92441 () Bool)

(assert (=> d!92441 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59210 d!92441))

(declare-fun d!92453 () Bool)

(assert (=> d!92453 (= (array_inv!14309 a!2986) (bvsge (size!18877 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59210 d!92453))

(declare-fun b!653507 () Bool)

(declare-fun e!375218 () Bool)

(declare-fun e!375217 () Bool)

(assert (=> b!653507 (= e!375218 e!375217)))

(declare-fun lt!304210 () (_ BitVec 64))

(assert (=> b!653507 (= lt!304210 (select (arr!18513 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!304211 () Unit!22344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38623 (_ BitVec 64) (_ BitVec 32)) Unit!22344)

(assert (=> b!653507 (= lt!304211 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!304210 #b00000000000000000000000000000000))))

(assert (=> b!653507 (arrayContainsKey!0 a!2986 lt!304210 #b00000000000000000000000000000000)))

(declare-fun lt!304209 () Unit!22344)

(assert (=> b!653507 (= lt!304209 lt!304211)))

(declare-fun res!423812 () Bool)

(assert (=> b!653507 (= res!423812 (= (seekEntryOrOpen!0 (select (arr!18513 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6953 #b00000000000000000000000000000000)))))

(assert (=> b!653507 (=> (not res!423812) (not e!375217))))

(declare-fun b!653508 () Bool)

(declare-fun call!33824 () Bool)

(assert (=> b!653508 (= e!375218 call!33824)))

(declare-fun b!653509 () Bool)

(declare-fun e!375219 () Bool)

(assert (=> b!653509 (= e!375219 e!375218)))

(declare-fun c!75215 () Bool)

(assert (=> b!653509 (= c!75215 (validKeyInArray!0 (select (arr!18513 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653510 () Bool)

(assert (=> b!653510 (= e!375217 call!33824)))

(declare-fun bm!33821 () Bool)

(assert (=> bm!33821 (= call!33824 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!92457 () Bool)

(declare-fun res!423811 () Bool)

(assert (=> d!92457 (=> res!423811 e!375219)))

(assert (=> d!92457 (= res!423811 (bvsge #b00000000000000000000000000000000 (size!18877 a!2986)))))

(assert (=> d!92457 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!375219)))

(assert (= (and d!92457 (not res!423811)) b!653509))

(assert (= (and b!653509 c!75215) b!653507))

(assert (= (and b!653509 (not c!75215)) b!653508))

(assert (= (and b!653507 res!423812) b!653510))

(assert (= (or b!653510 b!653508) bm!33821))

(assert (=> b!653507 m!626579))

(declare-fun m!626641 () Bool)

(assert (=> b!653507 m!626641))

(declare-fun m!626643 () Bool)

(assert (=> b!653507 m!626643))

(assert (=> b!653507 m!626579))

(declare-fun m!626645 () Bool)

(assert (=> b!653507 m!626645))

(assert (=> b!653509 m!626579))

(assert (=> b!653509 m!626579))

(assert (=> b!653509 m!626581))

(declare-fun m!626647 () Bool)

(assert (=> bm!33821 m!626647))

(assert (=> b!653164 d!92457))

(declare-fun d!92467 () Bool)

(declare-fun res!423813 () Bool)

(declare-fun e!375220 () Bool)

(assert (=> d!92467 (=> res!423813 e!375220)))

(assert (=> d!92467 (= res!423813 (= (select (arr!18513 lt!304024) index!984) (select (arr!18513 a!2986) j!136)))))

(assert (=> d!92467 (= (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) index!984) e!375220)))

(declare-fun b!653511 () Bool)

(declare-fun e!375221 () Bool)

(assert (=> b!653511 (= e!375220 e!375221)))

(declare-fun res!423814 () Bool)

(assert (=> b!653511 (=> (not res!423814) (not e!375221))))

(assert (=> b!653511 (= res!423814 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18877 lt!304024)))))

(declare-fun b!653512 () Bool)

(assert (=> b!653512 (= e!375221 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92467 (not res!423813)) b!653511))

(assert (= (and b!653511 res!423814) b!653512))

(declare-fun m!626649 () Bool)

(assert (=> d!92467 m!626649))

(assert (=> b!653512 m!626301))

(declare-fun m!626651 () Bool)

(assert (=> b!653512 m!626651))

(assert (=> b!653163 d!92467))

(assert (=> b!653174 d!92467))

(declare-fun d!92469 () Bool)

(assert (=> d!92469 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18877 lt!304024)) (not (= (select (arr!18513 lt!304024) j!136) (select (arr!18513 a!2986) j!136))))))

(declare-fun lt!304217 () Unit!22344)

(declare-fun choose!21 (array!38623 (_ BitVec 64) (_ BitVec 32) List!12554) Unit!22344)

(assert (=> d!92469 (= lt!304217 (choose!21 lt!304024 (select (arr!18513 a!2986) j!136) j!136 Nil!12551))))

(assert (=> d!92469 (bvslt (size!18877 lt!304024) #b01111111111111111111111111111111)))

(assert (=> d!92469 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136 Nil!12551) lt!304217)))

(declare-fun bs!19480 () Bool)

(assert (= bs!19480 d!92469))

(assert (=> bs!19480 m!626587))

(assert (=> bs!19480 m!626301))

(declare-fun m!626671 () Bool)

(assert (=> bs!19480 m!626671))

(assert (=> b!653159 d!92469))

(declare-fun d!92479 () Bool)

(assert (=> d!92479 (arrayNoDuplicates!0 lt!304024 j!136 Nil!12551)))

(declare-fun lt!304220 () Unit!22344)

(declare-fun choose!39 (array!38623 (_ BitVec 32) (_ BitVec 32)) Unit!22344)

(assert (=> d!92479 (= lt!304220 (choose!39 lt!304024 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92479 (bvslt (size!18877 lt!304024) #b01111111111111111111111111111111)))

(assert (=> d!92479 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304024 #b00000000000000000000000000000000 j!136) lt!304220)))

(declare-fun bs!19481 () Bool)

(assert (= bs!19481 d!92479))

(assert (=> bs!19481 m!626335))

(declare-fun m!626673 () Bool)

(assert (=> bs!19481 m!626673))

(assert (=> b!653159 d!92479))

(declare-fun b!653522 () Bool)

(declare-fun e!375230 () Bool)

(declare-fun e!375231 () Bool)

(assert (=> b!653522 (= e!375230 e!375231)))

(declare-fun res!423819 () Bool)

(assert (=> b!653522 (=> (not res!423819) (not e!375231))))

(declare-fun e!375228 () Bool)

(assert (=> b!653522 (= res!423819 (not e!375228))))

(declare-fun res!423818 () Bool)

(assert (=> b!653522 (=> (not res!423818) (not e!375228))))

(assert (=> b!653522 (= res!423818 (validKeyInArray!0 (select (arr!18513 lt!304024) #b00000000000000000000000000000000)))))

(declare-fun b!653523 () Bool)

(declare-fun e!375229 () Bool)

(declare-fun call!33825 () Bool)

(assert (=> b!653523 (= e!375229 call!33825)))

(declare-fun b!653524 () Bool)

(assert (=> b!653524 (= e!375228 (contains!3182 Nil!12551 (select (arr!18513 lt!304024) #b00000000000000000000000000000000)))))

(declare-fun d!92481 () Bool)

(declare-fun res!423820 () Bool)

(assert (=> d!92481 (=> res!423820 e!375230)))

(assert (=> d!92481 (= res!423820 (bvsge #b00000000000000000000000000000000 (size!18877 lt!304024)))))

(assert (=> d!92481 (= (arrayNoDuplicates!0 lt!304024 #b00000000000000000000000000000000 Nil!12551) e!375230)))

(declare-fun b!653525 () Bool)

(assert (=> b!653525 (= e!375231 e!375229)))

(declare-fun c!75219 () Bool)

(assert (=> b!653525 (= c!75219 (validKeyInArray!0 (select (arr!18513 lt!304024) #b00000000000000000000000000000000)))))

(declare-fun bm!33822 () Bool)

(assert (=> bm!33822 (= call!33825 (arrayNoDuplicates!0 lt!304024 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75219 (Cons!12550 (select (arr!18513 lt!304024) #b00000000000000000000000000000000) Nil!12551) Nil!12551)))))

(declare-fun b!653526 () Bool)

(assert (=> b!653526 (= e!375229 call!33825)))

(assert (= (and d!92481 (not res!423820)) b!653522))

(assert (= (and b!653522 res!423818) b!653524))

(assert (= (and b!653522 res!423819) b!653525))

(assert (= (and b!653525 c!75219) b!653523))

(assert (= (and b!653525 (not c!75219)) b!653526))

(assert (= (or b!653523 b!653526) bm!33822))

(declare-fun m!626675 () Bool)

(assert (=> b!653522 m!626675))

(assert (=> b!653522 m!626675))

(declare-fun m!626677 () Bool)

(assert (=> b!653522 m!626677))

(assert (=> b!653524 m!626675))

(assert (=> b!653524 m!626675))

(declare-fun m!626679 () Bool)

(assert (=> b!653524 m!626679))

(assert (=> b!653525 m!626675))

(assert (=> b!653525 m!626675))

(assert (=> b!653525 m!626677))

(assert (=> bm!33822 m!626675))

(declare-fun m!626681 () Bool)

(assert (=> bm!33822 m!626681))

(assert (=> b!653159 d!92481))

(declare-fun d!92483 () Bool)

(assert (=> d!92483 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304223 () Unit!22344)

(declare-fun choose!114 (array!38623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22344)

(assert (=> d!92483 (= lt!304223 (choose!114 lt!304024 (select (arr!18513 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92483 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92483 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304024 (select (arr!18513 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!304223)))

(declare-fun bs!19482 () Bool)

(assert (= bs!19482 d!92483))

(assert (=> bs!19482 m!626301))

(assert (=> bs!19482 m!626337))

(assert (=> bs!19482 m!626301))

(declare-fun m!626683 () Bool)

(assert (=> bs!19482 m!626683))

(assert (=> b!653159 d!92483))

(declare-fun b!653527 () Bool)

(declare-fun e!375234 () Bool)

(declare-fun e!375235 () Bool)

(assert (=> b!653527 (= e!375234 e!375235)))

(declare-fun res!423822 () Bool)

(assert (=> b!653527 (=> (not res!423822) (not e!375235))))

(declare-fun e!375232 () Bool)

(assert (=> b!653527 (= res!423822 (not e!375232))))

(declare-fun res!423821 () Bool)

(assert (=> b!653527 (=> (not res!423821) (not e!375232))))

(assert (=> b!653527 (= res!423821 (validKeyInArray!0 (select (arr!18513 lt!304024) j!136)))))

(declare-fun b!653528 () Bool)

(declare-fun e!375233 () Bool)

(declare-fun call!33826 () Bool)

(assert (=> b!653528 (= e!375233 call!33826)))

(declare-fun b!653529 () Bool)

(assert (=> b!653529 (= e!375232 (contains!3182 Nil!12551 (select (arr!18513 lt!304024) j!136)))))

(declare-fun d!92485 () Bool)

(declare-fun res!423823 () Bool)

(assert (=> d!92485 (=> res!423823 e!375234)))

(assert (=> d!92485 (= res!423823 (bvsge j!136 (size!18877 lt!304024)))))

(assert (=> d!92485 (= (arrayNoDuplicates!0 lt!304024 j!136 Nil!12551) e!375234)))

(declare-fun b!653530 () Bool)

(assert (=> b!653530 (= e!375235 e!375233)))

(declare-fun c!75220 () Bool)

(assert (=> b!653530 (= c!75220 (validKeyInArray!0 (select (arr!18513 lt!304024) j!136)))))

(declare-fun bm!33823 () Bool)

(assert (=> bm!33823 (= call!33826 (arrayNoDuplicates!0 lt!304024 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75220 (Cons!12550 (select (arr!18513 lt!304024) j!136) Nil!12551) Nil!12551)))))

(declare-fun b!653531 () Bool)

(assert (=> b!653531 (= e!375233 call!33826)))

(assert (= (and d!92485 (not res!423823)) b!653527))

(assert (= (and b!653527 res!423821) b!653529))

(assert (= (and b!653527 res!423822) b!653530))

(assert (= (and b!653530 c!75220) b!653528))

(assert (= (and b!653530 (not c!75220)) b!653531))

(assert (= (or b!653528 b!653531) bm!33823))

(assert (=> b!653527 m!626587))

(assert (=> b!653527 m!626587))

(declare-fun m!626685 () Bool)

(assert (=> b!653527 m!626685))

(assert (=> b!653529 m!626587))

(assert (=> b!653529 m!626587))

(declare-fun m!626687 () Bool)

(assert (=> b!653529 m!626687))

(assert (=> b!653530 m!626587))

(assert (=> b!653530 m!626587))

(assert (=> b!653530 m!626685))

(assert (=> bm!33823 m!626587))

(declare-fun m!626689 () Bool)

(assert (=> bm!33823 m!626689))

(assert (=> b!653159 d!92485))

(declare-fun d!92487 () Bool)

(declare-fun e!375241 () Bool)

(assert (=> d!92487 e!375241))

(declare-fun res!423829 () Bool)

(assert (=> d!92487 (=> (not res!423829) (not e!375241))))

(assert (=> d!92487 (= res!423829 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18877 a!2986))))))

(declare-fun lt!304229 () Unit!22344)

(declare-fun choose!41 (array!38623 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12554) Unit!22344)

(assert (=> d!92487 (= lt!304229 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12551))))

(assert (=> d!92487 (bvslt (size!18877 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92487 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12551) lt!304229)))

(declare-fun b!653537 () Bool)

(assert (=> b!653537 (= e!375241 (arrayNoDuplicates!0 (array!38624 (store (arr!18513 a!2986) i!1108 k!1786) (size!18877 a!2986)) #b00000000000000000000000000000000 Nil!12551))))

(assert (= (and d!92487 res!423829) b!653537))

(declare-fun m!626695 () Bool)

(assert (=> d!92487 m!626695))

(assert (=> b!653537 m!626299))

(declare-fun m!626697 () Bool)

(assert (=> b!653537 m!626697))

(assert (=> b!653159 d!92487))

(declare-fun d!92491 () Bool)

(declare-fun res!423830 () Bool)

(declare-fun e!375242 () Bool)

(assert (=> d!92491 (=> res!423830 e!375242)))

(assert (=> d!92491 (= res!423830 (= (select (arr!18513 lt!304024) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18513 a!2986) j!136)))))

(assert (=> d!92491 (= (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!375242)))

(declare-fun b!653538 () Bool)

(declare-fun e!375243 () Bool)

(assert (=> b!653538 (= e!375242 e!375243)))

(declare-fun res!423831 () Bool)

(assert (=> b!653538 (=> (not res!423831) (not e!375243))))

(assert (=> b!653538 (= res!423831 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18877 lt!304024)))))

(declare-fun b!653539 () Bool)

(assert (=> b!653539 (= e!375243 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92491 (not res!423830)) b!653538))

(assert (= (and b!653538 res!423831) b!653539))

(declare-fun m!626699 () Bool)

(assert (=> d!92491 m!626699))

(assert (=> b!653539 m!626301))

(declare-fun m!626701 () Bool)

(assert (=> b!653539 m!626701))

(assert (=> b!653159 d!92491))

(declare-fun d!92493 () Bool)

(declare-fun res!423836 () Bool)

(declare-fun e!375257 () Bool)

(assert (=> d!92493 (=> res!423836 e!375257)))

(assert (=> d!92493 (= res!423836 (is-Nil!12551 Nil!12551))))

(assert (=> d!92493 (= (noDuplicate!438 Nil!12551) e!375257)))

(declare-fun b!653562 () Bool)

(declare-fun e!375258 () Bool)

(assert (=> b!653562 (= e!375257 e!375258)))

(declare-fun res!423837 () Bool)

(assert (=> b!653562 (=> (not res!423837) (not e!375258))))

(assert (=> b!653562 (= res!423837 (not (contains!3182 (t!18782 Nil!12551) (h!13595 Nil!12551))))))

(declare-fun b!653563 () Bool)

(assert (=> b!653563 (= e!375258 (noDuplicate!438 (t!18782 Nil!12551)))))

(assert (= (and d!92493 (not res!423836)) b!653562))

(assert (= (and b!653562 res!423837) b!653563))

(declare-fun m!626713 () Bool)

(assert (=> b!653562 m!626713))

(declare-fun m!626715 () Bool)

(assert (=> b!653563 m!626715))

(assert (=> b!653170 d!92493))

(declare-fun d!92499 () Bool)

(declare-fun res!423838 () Bool)

(declare-fun e!375262 () Bool)

(assert (=> d!92499 (=> res!423838 e!375262)))

(assert (=> d!92499 (= res!423838 (= (select (arr!18513 lt!304024) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18513 a!2986) j!136)))))

(assert (=> d!92499 (= (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!375262)))

(declare-fun b!653570 () Bool)

(declare-fun e!375263 () Bool)

(assert (=> b!653570 (= e!375262 e!375263)))

(declare-fun res!423839 () Bool)

(assert (=> b!653570 (=> (not res!423839) (not e!375263))))

(assert (=> b!653570 (= res!423839 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18877 lt!304024)))))

(declare-fun b!653571 () Bool)

(assert (=> b!653571 (= e!375263 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92499 (not res!423838)) b!653570))

(assert (= (and b!653570 res!423839) b!653571))

(declare-fun m!626717 () Bool)

(assert (=> d!92499 m!626717))

(assert (=> b!653571 m!626301))

(declare-fun m!626719 () Bool)

(assert (=> b!653571 m!626719))

(assert (=> b!653161 d!92499))

(declare-fun b!653572 () Bool)

(declare-fun e!375266 () Bool)

(declare-fun e!375267 () Bool)

(assert (=> b!653572 (= e!375266 e!375267)))

(declare-fun res!423841 () Bool)

(assert (=> b!653572 (=> (not res!423841) (not e!375267))))

(declare-fun e!375264 () Bool)

(assert (=> b!653572 (= res!423841 (not e!375264))))

(declare-fun res!423840 () Bool)

(assert (=> b!653572 (=> (not res!423840) (not e!375264))))

(assert (=> b!653572 (= res!423840 (validKeyInArray!0 (select (arr!18513 lt!304024) index!984)))))

(declare-fun b!653573 () Bool)

(declare-fun e!375265 () Bool)

(declare-fun call!33827 () Bool)

(assert (=> b!653573 (= e!375265 call!33827)))

(declare-fun b!653574 () Bool)

(assert (=> b!653574 (= e!375264 (contains!3182 Nil!12551 (select (arr!18513 lt!304024) index!984)))))

(declare-fun d!92501 () Bool)

(declare-fun res!423842 () Bool)

(assert (=> d!92501 (=> res!423842 e!375266)))

(assert (=> d!92501 (= res!423842 (bvsge index!984 (size!18877 lt!304024)))))

(assert (=> d!92501 (= (arrayNoDuplicates!0 lt!304024 index!984 Nil!12551) e!375266)))

(declare-fun b!653575 () Bool)

(assert (=> b!653575 (= e!375267 e!375265)))

(declare-fun c!75233 () Bool)

(assert (=> b!653575 (= c!75233 (validKeyInArray!0 (select (arr!18513 lt!304024) index!984)))))

(declare-fun bm!33824 () Bool)

(assert (=> bm!33824 (= call!33827 (arrayNoDuplicates!0 lt!304024 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75233 (Cons!12550 (select (arr!18513 lt!304024) index!984) Nil!12551) Nil!12551)))))

(declare-fun b!653576 () Bool)

(assert (=> b!653576 (= e!375265 call!33827)))

(assert (= (and d!92501 (not res!423842)) b!653572))

(assert (= (and b!653572 res!423840) b!653574))

(assert (= (and b!653572 res!423841) b!653575))

(assert (= (and b!653575 c!75233) b!653573))

(assert (= (and b!653575 (not c!75233)) b!653576))

(assert (= (or b!653573 b!653576) bm!33824))

(assert (=> b!653572 m!626649))

(assert (=> b!653572 m!626649))

(declare-fun m!626727 () Bool)

(assert (=> b!653572 m!626727))

(assert (=> b!653574 m!626649))

(assert (=> b!653574 m!626649))

(declare-fun m!626729 () Bool)

(assert (=> b!653574 m!626729))

(assert (=> b!653575 m!626649))

(assert (=> b!653575 m!626649))

(assert (=> b!653575 m!626727))

(assert (=> bm!33824 m!626649))

(declare-fun m!626731 () Bool)

(assert (=> bm!33824 m!626731))

(assert (=> b!653161 d!92501))

(declare-fun d!92507 () Bool)

(assert (=> d!92507 (arrayNoDuplicates!0 lt!304024 index!984 Nil!12551)))

(declare-fun lt!304245 () Unit!22344)

(assert (=> d!92507 (= lt!304245 (choose!39 lt!304024 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92507 (bvslt (size!18877 lt!304024) #b01111111111111111111111111111111)))

(assert (=> d!92507 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304024 #b00000000000000000000000000000000 index!984) lt!304245)))

(declare-fun bs!19484 () Bool)

(assert (= bs!19484 d!92507))

(assert (=> bs!19484 m!626313))

(declare-fun m!626739 () Bool)

(assert (=> bs!19484 m!626739))

(assert (=> b!653161 d!92507))

(declare-fun d!92511 () Bool)

(assert (=> d!92511 (arrayContainsKey!0 lt!304024 (select (arr!18513 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304247 () Unit!22344)

(assert (=> d!92511 (= lt!304247 (choose!114 lt!304024 (select (arr!18513 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92511 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92511 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304024 (select (arr!18513 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!304247)))

(declare-fun bs!19486 () Bool)

(assert (= bs!19486 d!92511))

(assert (=> bs!19486 m!626301))

(assert (=> bs!19486 m!626315))

(assert (=> bs!19486 m!626301))

(declare-fun m!626743 () Bool)

(assert (=> bs!19486 m!626743))

(assert (=> b!653161 d!92511))

(assert (=> b!653161 d!92423))

(assert (=> b!653161 d!92481))

(assert (=> b!653161 d!92487))

(declare-fun d!92515 () Bool)

(declare-fun res!423845 () Bool)

(declare-fun e!375273 () Bool)

(assert (=> d!92515 (=> res!423845 e!375273)))

(assert (=> d!92515 (= res!423845 (= (select (arr!18513 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!92515 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!375273)))

(declare-fun b!653585 () Bool)

(declare-fun e!375274 () Bool)

