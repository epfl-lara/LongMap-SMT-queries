; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55544 () Bool)

(assert start!55544)

(declare-fun b!607215 () Bool)

(declare-fun e!347720 () Bool)

(declare-fun e!347731 () Bool)

(assert (=> b!607215 (= e!347720 e!347731)))

(declare-fun res!390086 () Bool)

(assert (=> b!607215 (=> res!390086 e!347731)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!277192 () (_ BitVec 64))

(declare-datatypes ((array!37275 0))(
  ( (array!37276 (arr!17888 (Array (_ BitVec 32) (_ BitVec 64))) (size!18252 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37275)

(declare-fun lt!277183 () (_ BitVec 64))

(assert (=> b!607215 (= res!390086 (or (not (= (select (arr!17888 a!2986) j!136) lt!277192)) (not (= (select (arr!17888 a!2986) j!136) lt!277183))))))

(declare-fun e!347733 () Bool)

(assert (=> b!607215 e!347733))

(declare-fun res!390072 () Bool)

(assert (=> b!607215 (=> (not res!390072) (not e!347733))))

(assert (=> b!607215 (= res!390072 (= lt!277183 (select (arr!17888 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607215 (= lt!277183 (select (store (arr!17888 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607216 () Bool)

(declare-fun e!347727 () Bool)

(declare-fun e!347723 () Bool)

(assert (=> b!607216 (= e!347727 e!347723)))

(declare-fun res!390073 () Bool)

(assert (=> b!607216 (=> (not res!390073) (not e!347723))))

(declare-datatypes ((SeekEntryResult!6328 0))(
  ( (MissingZero!6328 (index!27587 (_ BitVec 32))) (Found!6328 (index!27588 (_ BitVec 32))) (Intermediate!6328 (undefined!7140 Bool) (index!27589 (_ BitVec 32)) (x!56397 (_ BitVec 32))) (Undefined!6328) (MissingVacant!6328 (index!27590 (_ BitVec 32))) )
))
(declare-fun lt!277194 () SeekEntryResult!6328)

(assert (=> b!607216 (= res!390073 (or (= lt!277194 (MissingZero!6328 i!1108)) (= lt!277194 (MissingVacant!6328 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37275 (_ BitVec 32)) SeekEntryResult!6328)

(assert (=> b!607216 (= lt!277194 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607218 () Bool)

(declare-datatypes ((Unit!19348 0))(
  ( (Unit!19349) )
))
(declare-fun e!347719 () Unit!19348)

(declare-fun Unit!19350 () Unit!19348)

(assert (=> b!607218 (= e!347719 Unit!19350)))

(declare-fun lt!277190 () Unit!19348)

(declare-fun lt!277185 () array!37275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19348)

(assert (=> b!607218 (= lt!277190 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277185 (select (arr!17888 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607218 (arrayContainsKey!0 lt!277185 (select (arr!17888 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277193 () Unit!19348)

(declare-datatypes ((List!11929 0))(
  ( (Nil!11926) (Cons!11925 (h!12970 (_ BitVec 64)) (t!18157 List!11929)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37275 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11929) Unit!19348)

(assert (=> b!607218 (= lt!277193 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11926))))

(declare-fun arrayNoDuplicates!0 (array!37275 (_ BitVec 32) List!11929) Bool)

(assert (=> b!607218 (arrayNoDuplicates!0 lt!277185 #b00000000000000000000000000000000 Nil!11926)))

(declare-fun lt!277198 () Unit!19348)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37275 (_ BitVec 32) (_ BitVec 32)) Unit!19348)

(assert (=> b!607218 (= lt!277198 (lemmaNoDuplicateFromThenFromBigger!0 lt!277185 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607218 (arrayNoDuplicates!0 lt!277185 j!136 Nil!11926)))

(declare-fun lt!277196 () Unit!19348)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37275 (_ BitVec 64) (_ BitVec 32) List!11929) Unit!19348)

(assert (=> b!607218 (= lt!277196 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277185 (select (arr!17888 a!2986) j!136) j!136 Nil!11926))))

(assert (=> b!607218 false))

(declare-fun b!607219 () Bool)

(declare-fun res!390081 () Bool)

(assert (=> b!607219 (=> (not res!390081) (not e!347727))))

(assert (=> b!607219 (= res!390081 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607220 () Bool)

(declare-fun Unit!19351 () Unit!19348)

(assert (=> b!607220 (= e!347719 Unit!19351)))

(declare-fun b!607221 () Bool)

(declare-fun e!347724 () Bool)

(assert (=> b!607221 (= e!347723 e!347724)))

(declare-fun res!390088 () Bool)

(assert (=> b!607221 (=> (not res!390088) (not e!347724))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!607221 (= res!390088 (= (select (store (arr!17888 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607221 (= lt!277185 (array!37276 (store (arr!17888 a!2986) i!1108 k!1786) (size!18252 a!2986)))))

(declare-fun b!607222 () Bool)

(declare-fun res!390067 () Bool)

(assert (=> b!607222 (=> (not res!390067) (not e!347723))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607222 (= res!390067 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17888 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607223 () Bool)

(declare-fun e!347728 () Bool)

(assert (=> b!607223 (= e!347733 e!347728)))

(declare-fun res!390076 () Bool)

(assert (=> b!607223 (=> res!390076 e!347728)))

(assert (=> b!607223 (= res!390076 (or (not (= (select (arr!17888 a!2986) j!136) lt!277192)) (not (= (select (arr!17888 a!2986) j!136) lt!277183)) (bvsge j!136 index!984)))))

(declare-fun b!607224 () Bool)

(declare-fun res!390069 () Bool)

(assert (=> b!607224 (=> (not res!390069) (not e!347723))))

(assert (=> b!607224 (= res!390069 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11926))))

(declare-fun b!607225 () Bool)

(declare-fun res!390070 () Bool)

(declare-fun e!347725 () Bool)

(assert (=> b!607225 (=> res!390070 e!347725)))

(declare-fun noDuplicate!311 (List!11929) Bool)

(assert (=> b!607225 (= res!390070 (not (noDuplicate!311 Nil!11926)))))

(declare-fun b!607226 () Bool)

(declare-fun e!347722 () Bool)

(assert (=> b!607226 (= e!347724 e!347722)))

(declare-fun res!390079 () Bool)

(assert (=> b!607226 (=> (not res!390079) (not e!347722))))

(declare-fun lt!277189 () SeekEntryResult!6328)

(assert (=> b!607226 (= res!390079 (and (= lt!277189 (Found!6328 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17888 a!2986) index!984) (select (arr!17888 a!2986) j!136))) (not (= (select (arr!17888 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37275 (_ BitVec 32)) SeekEntryResult!6328)

(assert (=> b!607226 (= lt!277189 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17888 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607227 () Bool)

(assert (=> b!607227 (= e!347722 (not e!347720))))

(declare-fun res!390085 () Bool)

(assert (=> b!607227 (=> res!390085 e!347720)))

(declare-fun lt!277182 () SeekEntryResult!6328)

(assert (=> b!607227 (= res!390085 (not (= lt!277182 (Found!6328 index!984))))))

(declare-fun lt!277197 () Unit!19348)

(declare-fun e!347718 () Unit!19348)

(assert (=> b!607227 (= lt!277197 e!347718)))

(declare-fun c!68941 () Bool)

(assert (=> b!607227 (= c!68941 (= lt!277182 Undefined!6328))))

(assert (=> b!607227 (= lt!277182 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277192 lt!277185 mask!3053))))

(declare-fun e!347721 () Bool)

(assert (=> b!607227 e!347721))

(declare-fun res!390075 () Bool)

(assert (=> b!607227 (=> (not res!390075) (not e!347721))))

(declare-fun lt!277188 () SeekEntryResult!6328)

(declare-fun lt!277186 () (_ BitVec 32))

(assert (=> b!607227 (= res!390075 (= lt!277188 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277186 vacantSpotIndex!68 lt!277192 lt!277185 mask!3053)))))

(assert (=> b!607227 (= lt!277188 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277186 vacantSpotIndex!68 (select (arr!17888 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607227 (= lt!277192 (select (store (arr!17888 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277187 () Unit!19348)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37275 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19348)

(assert (=> b!607227 (= lt!277187 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277186 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607227 (= lt!277186 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607228 () Bool)

(declare-fun res!390082 () Bool)

(assert (=> b!607228 (=> res!390082 e!347725)))

(declare-fun contains!3005 (List!11929 (_ BitVec 64)) Bool)

(assert (=> b!607228 (= res!390082 (contains!3005 Nil!11926 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607229 () Bool)

(declare-fun res!390080 () Bool)

(assert (=> b!607229 (=> (not res!390080) (not e!347727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607229 (= res!390080 (validKeyInArray!0 (select (arr!17888 a!2986) j!136)))))

(declare-fun b!607230 () Bool)

(declare-fun res!390083 () Bool)

(assert (=> b!607230 (=> (not res!390083) (not e!347727))))

(assert (=> b!607230 (= res!390083 (validKeyInArray!0 k!1786))))

(declare-fun b!607231 () Bool)

(declare-fun Unit!19352 () Unit!19348)

(assert (=> b!607231 (= e!347718 Unit!19352)))

(declare-fun b!607232 () Bool)

(declare-fun e!347726 () Bool)

(assert (=> b!607232 (= e!347731 e!347726)))

(declare-fun res!390068 () Bool)

(assert (=> b!607232 (=> res!390068 e!347726)))

(assert (=> b!607232 (= res!390068 (bvsge index!984 j!136))))

(declare-fun lt!277195 () Unit!19348)

(assert (=> b!607232 (= lt!277195 e!347719)))

(declare-fun c!68942 () Bool)

(assert (=> b!607232 (= c!68942 (bvslt j!136 index!984))))

(declare-fun b!607233 () Bool)

(declare-fun e!347732 () Bool)

(assert (=> b!607233 (= e!347728 e!347732)))

(declare-fun res!390084 () Bool)

(assert (=> b!607233 (=> (not res!390084) (not e!347732))))

(assert (=> b!607233 (= res!390084 (arrayContainsKey!0 lt!277185 (select (arr!17888 a!2986) j!136) j!136))))

(declare-fun b!607234 () Bool)

(assert (=> b!607234 (= e!347721 (= lt!277189 lt!277188))))

(declare-fun b!607235 () Bool)

(declare-fun res!390077 () Bool)

(assert (=> b!607235 (=> res!390077 e!347725)))

(assert (=> b!607235 (= res!390077 (contains!3005 Nil!11926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607217 () Bool)

(assert (=> b!607217 (= e!347725 true)))

(declare-fun lt!277184 () Bool)

(assert (=> b!607217 (= lt!277184 (contains!3005 Nil!11926 k!1786))))

(declare-fun res!390089 () Bool)

(assert (=> start!55544 (=> (not res!390089) (not e!347727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55544 (= res!390089 (validMask!0 mask!3053))))

(assert (=> start!55544 e!347727))

(assert (=> start!55544 true))

(declare-fun array_inv!13684 (array!37275) Bool)

(assert (=> start!55544 (array_inv!13684 a!2986)))

(declare-fun b!607236 () Bool)

(declare-fun res!390078 () Bool)

(assert (=> b!607236 (=> (not res!390078) (not e!347723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37275 (_ BitVec 32)) Bool)

(assert (=> b!607236 (= res!390078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607237 () Bool)

(assert (=> b!607237 (= e!347726 e!347725)))

(declare-fun res!390087 () Bool)

(assert (=> b!607237 (=> res!390087 e!347725)))

(assert (=> b!607237 (= res!390087 (or (bvsge (size!18252 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18252 a!2986))))))

(assert (=> b!607237 (arrayContainsKey!0 lt!277185 (select (arr!17888 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277191 () Unit!19348)

(assert (=> b!607237 (= lt!277191 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277185 (select (arr!17888 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347729 () Bool)

(assert (=> b!607237 e!347729))

(declare-fun res!390074 () Bool)

(assert (=> b!607237 (=> (not res!390074) (not e!347729))))

(assert (=> b!607237 (= res!390074 (arrayContainsKey!0 lt!277185 (select (arr!17888 a!2986) j!136) j!136))))

(declare-fun b!607238 () Bool)

(assert (=> b!607238 (= e!347729 (arrayContainsKey!0 lt!277185 (select (arr!17888 a!2986) j!136) index!984))))

(declare-fun b!607239 () Bool)

(declare-fun Unit!19353 () Unit!19348)

(assert (=> b!607239 (= e!347718 Unit!19353)))

(assert (=> b!607239 false))

(declare-fun b!607240 () Bool)

(declare-fun res!390071 () Bool)

(assert (=> b!607240 (=> (not res!390071) (not e!347727))))

(assert (=> b!607240 (= res!390071 (and (= (size!18252 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18252 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18252 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607241 () Bool)

(assert (=> b!607241 (= e!347732 (arrayContainsKey!0 lt!277185 (select (arr!17888 a!2986) j!136) index!984))))

(assert (= (and start!55544 res!390089) b!607240))

(assert (= (and b!607240 res!390071) b!607229))

(assert (= (and b!607229 res!390080) b!607230))

(assert (= (and b!607230 res!390083) b!607219))

(assert (= (and b!607219 res!390081) b!607216))

(assert (= (and b!607216 res!390073) b!607236))

(assert (= (and b!607236 res!390078) b!607224))

(assert (= (and b!607224 res!390069) b!607222))

(assert (= (and b!607222 res!390067) b!607221))

(assert (= (and b!607221 res!390088) b!607226))

(assert (= (and b!607226 res!390079) b!607227))

(assert (= (and b!607227 res!390075) b!607234))

(assert (= (and b!607227 c!68941) b!607239))

(assert (= (and b!607227 (not c!68941)) b!607231))

(assert (= (and b!607227 (not res!390085)) b!607215))

(assert (= (and b!607215 res!390072) b!607223))

(assert (= (and b!607223 (not res!390076)) b!607233))

(assert (= (and b!607233 res!390084) b!607241))

(assert (= (and b!607215 (not res!390086)) b!607232))

(assert (= (and b!607232 c!68942) b!607218))

(assert (= (and b!607232 (not c!68942)) b!607220))

(assert (= (and b!607232 (not res!390068)) b!607237))

(assert (= (and b!607237 res!390074) b!607238))

(assert (= (and b!607237 (not res!390087)) b!607225))

(assert (= (and b!607225 (not res!390070)) b!607235))

(assert (= (and b!607235 (not res!390077)) b!607228))

(assert (= (and b!607228 (not res!390082)) b!607217))

(declare-fun m!583979 () Bool)

(assert (=> b!607236 m!583979))

(declare-fun m!583981 () Bool)

(assert (=> b!607237 m!583981))

(assert (=> b!607237 m!583981))

(declare-fun m!583983 () Bool)

(assert (=> b!607237 m!583983))

(assert (=> b!607237 m!583981))

(declare-fun m!583985 () Bool)

(assert (=> b!607237 m!583985))

(assert (=> b!607237 m!583981))

(declare-fun m!583987 () Bool)

(assert (=> b!607237 m!583987))

(assert (=> b!607241 m!583981))

(assert (=> b!607241 m!583981))

(declare-fun m!583989 () Bool)

(assert (=> b!607241 m!583989))

(declare-fun m!583991 () Bool)

(assert (=> b!607219 m!583991))

(assert (=> b!607215 m!583981))

(declare-fun m!583993 () Bool)

(assert (=> b!607215 m!583993))

(declare-fun m!583995 () Bool)

(assert (=> b!607215 m!583995))

(declare-fun m!583997 () Bool)

(assert (=> b!607225 m!583997))

(declare-fun m!583999 () Bool)

(assert (=> b!607222 m!583999))

(declare-fun m!584001 () Bool)

(assert (=> b!607226 m!584001))

(assert (=> b!607226 m!583981))

(assert (=> b!607226 m!583981))

(declare-fun m!584003 () Bool)

(assert (=> b!607226 m!584003))

(assert (=> b!607229 m!583981))

(assert (=> b!607229 m!583981))

(declare-fun m!584005 () Bool)

(assert (=> b!607229 m!584005))

(declare-fun m!584007 () Bool)

(assert (=> b!607216 m!584007))

(assert (=> b!607233 m!583981))

(assert (=> b!607233 m!583981))

(assert (=> b!607233 m!583987))

(assert (=> b!607221 m!583993))

(declare-fun m!584009 () Bool)

(assert (=> b!607221 m!584009))

(declare-fun m!584011 () Bool)

(assert (=> start!55544 m!584011))

(declare-fun m!584013 () Bool)

(assert (=> start!55544 m!584013))

(declare-fun m!584015 () Bool)

(assert (=> b!607235 m!584015))

(assert (=> b!607218 m!583981))

(declare-fun m!584017 () Bool)

(assert (=> b!607218 m!584017))

(assert (=> b!607218 m!583981))

(declare-fun m!584019 () Bool)

(assert (=> b!607218 m!584019))

(assert (=> b!607218 m!583981))

(declare-fun m!584021 () Bool)

(assert (=> b!607218 m!584021))

(declare-fun m!584023 () Bool)

(assert (=> b!607218 m!584023))

(declare-fun m!584025 () Bool)

(assert (=> b!607218 m!584025))

(assert (=> b!607218 m!583981))

(declare-fun m!584027 () Bool)

(assert (=> b!607218 m!584027))

(declare-fun m!584029 () Bool)

(assert (=> b!607218 m!584029))

(declare-fun m!584031 () Bool)

(assert (=> b!607224 m!584031))

(declare-fun m!584033 () Bool)

(assert (=> b!607217 m!584033))

(assert (=> b!607223 m!583981))

(declare-fun m!584035 () Bool)

(assert (=> b!607227 m!584035))

(assert (=> b!607227 m!583981))

(assert (=> b!607227 m!583993))

(declare-fun m!584037 () Bool)

(assert (=> b!607227 m!584037))

(declare-fun m!584039 () Bool)

(assert (=> b!607227 m!584039))

(assert (=> b!607227 m!583981))

(declare-fun m!584041 () Bool)

(assert (=> b!607227 m!584041))

(declare-fun m!584043 () Bool)

(assert (=> b!607227 m!584043))

(declare-fun m!584045 () Bool)

(assert (=> b!607227 m!584045))

(declare-fun m!584047 () Bool)

(assert (=> b!607230 m!584047))

(assert (=> b!607238 m!583981))

(assert (=> b!607238 m!583981))

(assert (=> b!607238 m!583989))

(declare-fun m!584049 () Bool)

(assert (=> b!607228 m!584049))

(push 1)

