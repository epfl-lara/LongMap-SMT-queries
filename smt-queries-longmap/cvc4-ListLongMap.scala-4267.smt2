; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59346 () Bool)

(assert start!59346)

(declare-fun b!655029 () Bool)

(declare-fun res!424909 () Bool)

(declare-fun e!376174 () Bool)

(assert (=> b!655029 (=> (not res!424909) (not e!376174))))

(declare-datatypes ((array!38666 0))(
  ( (array!38667 (arr!18533 (Array (_ BitVec 32) (_ BitVec 64))) (size!18897 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38666)

(declare-datatypes ((List!12574 0))(
  ( (Nil!12571) (Cons!12570 (h!13615 (_ BitVec 64)) (t!18802 List!12574)) )
))
(declare-fun arrayNoDuplicates!0 (array!38666 (_ BitVec 32) List!12574) Bool)

(assert (=> b!655029 (= res!424909 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12571))))

(declare-fun b!655030 () Bool)

(declare-datatypes ((Unit!22484 0))(
  ( (Unit!22485) )
))
(declare-fun e!376182 () Unit!22484)

(declare-fun Unit!22486 () Unit!22484)

(assert (=> b!655030 (= e!376182 Unit!22486)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!376176 () Bool)

(declare-fun b!655031 () Bool)

(declare-fun lt!305351 () array!38666)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655031 (= e!376176 (arrayContainsKey!0 lt!305351 (select (arr!18533 a!2986) j!136) index!984))))

(declare-fun b!655032 () Bool)

(declare-fun res!424905 () Bool)

(assert (=> b!655032 (=> (not res!424905) (not e!376174))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655032 (= res!424905 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18533 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655033 () Bool)

(declare-fun e!376172 () Bool)

(declare-fun e!376175 () Bool)

(assert (=> b!655033 (= e!376172 e!376175)))

(declare-fun res!424910 () Bool)

(assert (=> b!655033 (=> (not res!424910) (not e!376175))))

(declare-datatypes ((SeekEntryResult!6973 0))(
  ( (MissingZero!6973 (index!30251 (_ BitVec 32))) (Found!6973 (index!30252 (_ BitVec 32))) (Intermediate!6973 (undefined!7785 Bool) (index!30253 (_ BitVec 32)) (x!59038 (_ BitVec 32))) (Undefined!6973) (MissingVacant!6973 (index!30254 (_ BitVec 32))) )
))
(declare-fun lt!305358 () SeekEntryResult!6973)

(assert (=> b!655033 (= res!424910 (and (= lt!305358 (Found!6973 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18533 a!2986) index!984) (select (arr!18533 a!2986) j!136))) (not (= (select (arr!18533 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38666 (_ BitVec 32)) SeekEntryResult!6973)

(assert (=> b!655033 (= lt!305358 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18533 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655034 () Bool)

(declare-fun res!424913 () Bool)

(assert (=> b!655034 (= res!424913 (bvsge j!136 index!984))))

(declare-fun e!376179 () Bool)

(assert (=> b!655034 (=> res!424913 e!376179)))

(declare-fun e!376180 () Bool)

(assert (=> b!655034 (= e!376180 e!376179)))

(declare-fun b!655035 () Bool)

(declare-fun e!376173 () Unit!22484)

(declare-fun Unit!22487 () Unit!22484)

(assert (=> b!655035 (= e!376173 Unit!22487)))

(declare-fun res!424911 () Bool)

(declare-fun e!376178 () Bool)

(assert (=> start!59346 (=> (not res!424911) (not e!376178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59346 (= res!424911 (validMask!0 mask!3053))))

(assert (=> start!59346 e!376178))

(assert (=> start!59346 true))

(declare-fun array_inv!14329 (array!38666) Bool)

(assert (=> start!59346 (array_inv!14329 a!2986)))

(declare-fun e!376171 () Bool)

(declare-fun b!655036 () Bool)

(assert (=> b!655036 (= e!376171 (arrayContainsKey!0 lt!305351 (select (arr!18533 a!2986) j!136) index!984))))

(declare-fun b!655037 () Bool)

(declare-fun res!424903 () Bool)

(assert (=> b!655037 (=> (not res!424903) (not e!376178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655037 (= res!424903 (validKeyInArray!0 (select (arr!18533 a!2986) j!136)))))

(declare-fun b!655038 () Bool)

(declare-fun e!376181 () Unit!22484)

(declare-fun Unit!22488 () Unit!22484)

(assert (=> b!655038 (= e!376181 Unit!22488)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun res!424902 () Bool)

(assert (=> b!655038 (= res!424902 (= (select (store (arr!18533 a!2986) i!1108 k!1786) index!984) (select (arr!18533 a!2986) j!136)))))

(assert (=> b!655038 (=> (not res!424902) (not e!376180))))

(assert (=> b!655038 e!376180))

(declare-fun c!75433 () Bool)

(assert (=> b!655038 (= c!75433 (bvslt j!136 index!984))))

(declare-fun lt!305347 () Unit!22484)

(declare-fun e!376169 () Unit!22484)

(assert (=> b!655038 (= lt!305347 e!376169)))

(declare-fun c!75434 () Bool)

(assert (=> b!655038 (= c!75434 (bvslt index!984 j!136))))

(declare-fun lt!305350 () Unit!22484)

(assert (=> b!655038 (= lt!305350 e!376182)))

(assert (=> b!655038 false))

(declare-fun b!655039 () Bool)

(declare-fun res!424915 () Bool)

(assert (=> b!655039 (=> (not res!424915) (not e!376174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38666 (_ BitVec 32)) Bool)

(assert (=> b!655039 (= res!424915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655040 () Bool)

(declare-fun res!424906 () Bool)

(assert (=> b!655040 (=> (not res!424906) (not e!376178))))

(assert (=> b!655040 (= res!424906 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655041 () Bool)

(declare-fun e!376170 () Bool)

(declare-fun lt!305356 () SeekEntryResult!6973)

(assert (=> b!655041 (= e!376170 (= lt!305358 lt!305356))))

(declare-fun b!655042 () Bool)

(declare-fun res!424907 () Bool)

(assert (=> b!655042 (= res!424907 (arrayContainsKey!0 lt!305351 (select (arr!18533 a!2986) j!136) j!136))))

(assert (=> b!655042 (=> (not res!424907) (not e!376171))))

(assert (=> b!655042 (= e!376179 e!376171)))

(declare-fun b!655043 () Bool)

(assert (=> b!655043 (= e!376174 e!376172)))

(declare-fun res!424904 () Bool)

(assert (=> b!655043 (=> (not res!424904) (not e!376172))))

(assert (=> b!655043 (= res!424904 (= (select (store (arr!18533 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655043 (= lt!305351 (array!38667 (store (arr!18533 a!2986) i!1108 k!1786) (size!18897 a!2986)))))

(declare-fun b!655044 () Bool)

(declare-fun Unit!22489 () Unit!22484)

(assert (=> b!655044 (= e!376169 Unit!22489)))

(declare-fun b!655045 () Bool)

(declare-fun res!424901 () Bool)

(assert (=> b!655045 (=> (not res!424901) (not e!376178))))

(assert (=> b!655045 (= res!424901 (and (= (size!18897 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18897 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18897 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655046 () Bool)

(assert (=> b!655046 false))

(declare-fun lt!305357 () Unit!22484)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38666 (_ BitVec 64) (_ BitVec 32) List!12574) Unit!22484)

(assert (=> b!655046 (= lt!305357 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305351 (select (arr!18533 a!2986) j!136) j!136 Nil!12571))))

(assert (=> b!655046 (arrayNoDuplicates!0 lt!305351 j!136 Nil!12571)))

(declare-fun lt!305361 () Unit!22484)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38666 (_ BitVec 32) (_ BitVec 32)) Unit!22484)

(assert (=> b!655046 (= lt!305361 (lemmaNoDuplicateFromThenFromBigger!0 lt!305351 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655046 (arrayNoDuplicates!0 lt!305351 #b00000000000000000000000000000000 Nil!12571)))

(declare-fun lt!305362 () Unit!22484)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12574) Unit!22484)

(assert (=> b!655046 (= lt!305362 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12571))))

(assert (=> b!655046 (arrayContainsKey!0 lt!305351 (select (arr!18533 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305348 () Unit!22484)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38666 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22484)

(assert (=> b!655046 (= lt!305348 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305351 (select (arr!18533 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22490 () Unit!22484)

(assert (=> b!655046 (= e!376169 Unit!22490)))

(declare-fun b!655047 () Bool)

(declare-fun Unit!22491 () Unit!22484)

(assert (=> b!655047 (= e!376173 Unit!22491)))

(assert (=> b!655047 false))

(declare-fun b!655048 () Bool)

(assert (=> b!655048 (= e!376178 e!376174)))

(declare-fun res!424914 () Bool)

(assert (=> b!655048 (=> (not res!424914) (not e!376174))))

(declare-fun lt!305343 () SeekEntryResult!6973)

(assert (=> b!655048 (= res!424914 (or (= lt!305343 (MissingZero!6973 i!1108)) (= lt!305343 (MissingVacant!6973 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38666 (_ BitVec 32)) SeekEntryResult!6973)

(assert (=> b!655048 (= lt!305343 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655049 () Bool)

(declare-fun Unit!22492 () Unit!22484)

(assert (=> b!655049 (= e!376181 Unit!22492)))

(declare-fun b!655050 () Bool)

(assert (=> b!655050 (= e!376175 (not true))))

(declare-fun lt!305345 () Unit!22484)

(assert (=> b!655050 (= lt!305345 e!376181)))

(declare-fun c!75432 () Bool)

(declare-fun lt!305349 () SeekEntryResult!6973)

(assert (=> b!655050 (= c!75432 (= lt!305349 (Found!6973 index!984)))))

(declare-fun lt!305355 () Unit!22484)

(assert (=> b!655050 (= lt!305355 e!376173)))

(declare-fun c!75431 () Bool)

(assert (=> b!655050 (= c!75431 (= lt!305349 Undefined!6973))))

(declare-fun lt!305354 () (_ BitVec 64))

(assert (=> b!655050 (= lt!305349 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305354 lt!305351 mask!3053))))

(assert (=> b!655050 e!376170))

(declare-fun res!424916 () Bool)

(assert (=> b!655050 (=> (not res!424916) (not e!376170))))

(declare-fun lt!305360 () (_ BitVec 32))

(assert (=> b!655050 (= res!424916 (= lt!305356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305360 vacantSpotIndex!68 lt!305354 lt!305351 mask!3053)))))

(assert (=> b!655050 (= lt!305356 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305360 vacantSpotIndex!68 (select (arr!18533 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655050 (= lt!305354 (select (store (arr!18533 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305344 () Unit!22484)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38666 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22484)

(assert (=> b!655050 (= lt!305344 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305360 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655050 (= lt!305360 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655051 () Bool)

(declare-fun res!424908 () Bool)

(assert (=> b!655051 (=> (not res!424908) (not e!376178))))

(assert (=> b!655051 (= res!424908 (validKeyInArray!0 k!1786))))

(declare-fun b!655052 () Bool)

(assert (=> b!655052 false))

(declare-fun lt!305352 () Unit!22484)

(assert (=> b!655052 (= lt!305352 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305351 (select (arr!18533 a!2986) j!136) index!984 Nil!12571))))

(assert (=> b!655052 (arrayNoDuplicates!0 lt!305351 index!984 Nil!12571)))

(declare-fun lt!305359 () Unit!22484)

(assert (=> b!655052 (= lt!305359 (lemmaNoDuplicateFromThenFromBigger!0 lt!305351 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655052 (arrayNoDuplicates!0 lt!305351 #b00000000000000000000000000000000 Nil!12571)))

(declare-fun lt!305353 () Unit!22484)

(assert (=> b!655052 (= lt!305353 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12571))))

(assert (=> b!655052 (arrayContainsKey!0 lt!305351 (select (arr!18533 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305346 () Unit!22484)

(assert (=> b!655052 (= lt!305346 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305351 (select (arr!18533 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!655052 e!376176))

(declare-fun res!424912 () Bool)

(assert (=> b!655052 (=> (not res!424912) (not e!376176))))

(assert (=> b!655052 (= res!424912 (arrayContainsKey!0 lt!305351 (select (arr!18533 a!2986) j!136) j!136))))

(declare-fun Unit!22493 () Unit!22484)

(assert (=> b!655052 (= e!376182 Unit!22493)))

(assert (= (and start!59346 res!424911) b!655045))

(assert (= (and b!655045 res!424901) b!655037))

(assert (= (and b!655037 res!424903) b!655051))

(assert (= (and b!655051 res!424908) b!655040))

(assert (= (and b!655040 res!424906) b!655048))

(assert (= (and b!655048 res!424914) b!655039))

(assert (= (and b!655039 res!424915) b!655029))

(assert (= (and b!655029 res!424909) b!655032))

(assert (= (and b!655032 res!424905) b!655043))

(assert (= (and b!655043 res!424904) b!655033))

(assert (= (and b!655033 res!424910) b!655050))

(assert (= (and b!655050 res!424916) b!655041))

(assert (= (and b!655050 c!75431) b!655047))

(assert (= (and b!655050 (not c!75431)) b!655035))

(assert (= (and b!655050 c!75432) b!655038))

(assert (= (and b!655050 (not c!75432)) b!655049))

(assert (= (and b!655038 res!424902) b!655034))

(assert (= (and b!655034 (not res!424913)) b!655042))

(assert (= (and b!655042 res!424907) b!655036))

(assert (= (and b!655038 c!75433) b!655046))

(assert (= (and b!655038 (not c!75433)) b!655044))

(assert (= (and b!655038 c!75434) b!655052))

(assert (= (and b!655038 (not c!75434)) b!655030))

(assert (= (and b!655052 res!424912) b!655031))

(declare-fun m!628117 () Bool)

(assert (=> b!655039 m!628117))

(declare-fun m!628119 () Bool)

(assert (=> b!655051 m!628119))

(declare-fun m!628121 () Bool)

(assert (=> b!655031 m!628121))

(assert (=> b!655031 m!628121))

(declare-fun m!628123 () Bool)

(assert (=> b!655031 m!628123))

(assert (=> b!655036 m!628121))

(assert (=> b!655036 m!628121))

(assert (=> b!655036 m!628123))

(assert (=> b!655052 m!628121))

(declare-fun m!628125 () Bool)

(assert (=> b!655052 m!628125))

(assert (=> b!655052 m!628121))

(declare-fun m!628127 () Bool)

(assert (=> b!655052 m!628127))

(declare-fun m!628129 () Bool)

(assert (=> b!655052 m!628129))

(assert (=> b!655052 m!628121))

(assert (=> b!655052 m!628121))

(declare-fun m!628131 () Bool)

(assert (=> b!655052 m!628131))

(declare-fun m!628133 () Bool)

(assert (=> b!655052 m!628133))

(assert (=> b!655052 m!628121))

(declare-fun m!628135 () Bool)

(assert (=> b!655052 m!628135))

(declare-fun m!628137 () Bool)

(assert (=> b!655052 m!628137))

(declare-fun m!628139 () Bool)

(assert (=> b!655052 m!628139))

(declare-fun m!628141 () Bool)

(assert (=> b!655038 m!628141))

(declare-fun m!628143 () Bool)

(assert (=> b!655038 m!628143))

(assert (=> b!655038 m!628121))

(assert (=> b!655037 m!628121))

(assert (=> b!655037 m!628121))

(declare-fun m!628145 () Bool)

(assert (=> b!655037 m!628145))

(declare-fun m!628147 () Bool)

(assert (=> b!655029 m!628147))

(assert (=> b!655043 m!628141))

(declare-fun m!628149 () Bool)

(assert (=> b!655043 m!628149))

(declare-fun m!628151 () Bool)

(assert (=> b!655050 m!628151))

(assert (=> b!655050 m!628121))

(declare-fun m!628153 () Bool)

(assert (=> b!655050 m!628153))

(assert (=> b!655050 m!628121))

(declare-fun m!628155 () Bool)

(assert (=> b!655050 m!628155))

(declare-fun m!628157 () Bool)

(assert (=> b!655050 m!628157))

(declare-fun m!628159 () Bool)

(assert (=> b!655050 m!628159))

(declare-fun m!628161 () Bool)

(assert (=> b!655050 m!628161))

(assert (=> b!655050 m!628141))

(declare-fun m!628163 () Bool)

(assert (=> start!59346 m!628163))

(declare-fun m!628165 () Bool)

(assert (=> start!59346 m!628165))

(declare-fun m!628167 () Bool)

(assert (=> b!655040 m!628167))

(assert (=> b!655042 m!628121))

(assert (=> b!655042 m!628121))

(assert (=> b!655042 m!628125))

(declare-fun m!628169 () Bool)

(assert (=> b!655048 m!628169))

(declare-fun m!628171 () Bool)

(assert (=> b!655033 m!628171))

(assert (=> b!655033 m!628121))

(assert (=> b!655033 m!628121))

(declare-fun m!628173 () Bool)

(assert (=> b!655033 m!628173))

(declare-fun m!628175 () Bool)

(assert (=> b!655032 m!628175))

(assert (=> b!655046 m!628121))

(declare-fun m!628177 () Bool)

(assert (=> b!655046 m!628177))

(declare-fun m!628179 () Bool)

(assert (=> b!655046 m!628179))

(assert (=> b!655046 m!628121))

(declare-fun m!628181 () Bool)

(assert (=> b!655046 m!628181))

(assert (=> b!655046 m!628121))

(declare-fun m!628183 () Bool)

(assert (=> b!655046 m!628183))

(assert (=> b!655046 m!628137))

(assert (=> b!655046 m!628139))

(declare-fun m!628185 () Bool)

(assert (=> b!655046 m!628185))

(assert (=> b!655046 m!628121))

(push 1)

