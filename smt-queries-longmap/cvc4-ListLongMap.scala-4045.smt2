; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55148 () Bool)

(assert start!55148)

(declare-fun b!604306 () Bool)

(declare-fun e!345772 () Bool)

(declare-fun e!345773 () Bool)

(assert (=> b!604306 (= e!345772 e!345773)))

(declare-fun res!388253 () Bool)

(assert (=> b!604306 (=> (not res!388253) (not e!345773))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37221 0))(
  ( (array!37222 (arr!17867 (Array (_ BitVec 32) (_ BitVec 64))) (size!18231 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37221)

(assert (=> b!604306 (= res!388253 (= (select (store (arr!17867 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!275571 () array!37221)

(assert (=> b!604306 (= lt!275571 (array!37222 (store (arr!17867 a!2986) i!1108 k!1786) (size!18231 a!2986)))))

(declare-fun b!604307 () Bool)

(declare-fun e!345771 () Bool)

(assert (=> b!604307 (= e!345771 e!345772)))

(declare-fun res!388264 () Bool)

(assert (=> b!604307 (=> (not res!388264) (not e!345772))))

(declare-datatypes ((SeekEntryResult!6307 0))(
  ( (MissingZero!6307 (index!27491 (_ BitVec 32))) (Found!6307 (index!27492 (_ BitVec 32))) (Intermediate!6307 (undefined!7119 Bool) (index!27493 (_ BitVec 32)) (x!56284 (_ BitVec 32))) (Undefined!6307) (MissingVacant!6307 (index!27494 (_ BitVec 32))) )
))
(declare-fun lt!275570 () SeekEntryResult!6307)

(assert (=> b!604307 (= res!388264 (or (= lt!275570 (MissingZero!6307 i!1108)) (= lt!275570 (MissingVacant!6307 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37221 (_ BitVec 32)) SeekEntryResult!6307)

(assert (=> b!604307 (= lt!275570 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!604308 () Bool)

(declare-fun res!388265 () Bool)

(assert (=> b!604308 (=> (not res!388265) (not e!345772))))

(declare-datatypes ((List!11908 0))(
  ( (Nil!11905) (Cons!11904 (h!12949 (_ BitVec 64)) (t!18136 List!11908)) )
))
(declare-fun arrayNoDuplicates!0 (array!37221 (_ BitVec 32) List!11908) Bool)

(assert (=> b!604308 (= res!388265 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11905))))

(declare-fun b!604309 () Bool)

(declare-fun e!345778 () Bool)

(declare-fun e!345774 () Bool)

(assert (=> b!604309 (= e!345778 e!345774)))

(declare-fun res!388267 () Bool)

(assert (=> b!604309 (=> res!388267 e!345774)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!275577 () (_ BitVec 64))

(declare-fun lt!275578 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!604309 (= res!388267 (or (not (= (select (arr!17867 a!2986) j!136) lt!275577)) (not (= (select (arr!17867 a!2986) j!136) lt!275578)) (bvsge j!136 index!984)))))

(declare-fun b!604310 () Bool)

(declare-fun e!345775 () Bool)

(assert (=> b!604310 (= e!345775 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!37221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!604310 (arrayContainsKey!0 lt!275571 (select (arr!17867 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!19222 0))(
  ( (Unit!19223) )
))
(declare-fun lt!275568 () Unit!19222)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19222)

(assert (=> b!604310 (= lt!275568 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275571 (select (arr!17867 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!345768 () Bool)

(assert (=> b!604310 e!345768))

(declare-fun res!388261 () Bool)

(assert (=> b!604310 (=> (not res!388261) (not e!345768))))

(assert (=> b!604310 (= res!388261 (arrayContainsKey!0 lt!275571 (select (arr!17867 a!2986) j!136) j!136))))

(declare-fun b!604311 () Bool)

(declare-fun e!345770 () Bool)

(declare-fun e!345776 () Bool)

(assert (=> b!604311 (= e!345770 (not e!345776))))

(declare-fun res!388258 () Bool)

(assert (=> b!604311 (=> res!388258 e!345776)))

(declare-fun lt!275567 () SeekEntryResult!6307)

(assert (=> b!604311 (= res!388258 (not (= lt!275567 (Found!6307 index!984))))))

(declare-fun lt!275573 () Unit!19222)

(declare-fun e!345766 () Unit!19222)

(assert (=> b!604311 (= lt!275573 e!345766)))

(declare-fun c!68395 () Bool)

(assert (=> b!604311 (= c!68395 (= lt!275567 Undefined!6307))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37221 (_ BitVec 32)) SeekEntryResult!6307)

(assert (=> b!604311 (= lt!275567 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275577 lt!275571 mask!3053))))

(declare-fun e!345777 () Bool)

(assert (=> b!604311 e!345777))

(declare-fun res!388266 () Bool)

(assert (=> b!604311 (=> (not res!388266) (not e!345777))))

(declare-fun lt!275581 () (_ BitVec 32))

(declare-fun lt!275574 () SeekEntryResult!6307)

(assert (=> b!604311 (= res!388266 (= lt!275574 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275581 vacantSpotIndex!68 lt!275577 lt!275571 mask!3053)))))

(assert (=> b!604311 (= lt!275574 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275581 vacantSpotIndex!68 (select (arr!17867 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!604311 (= lt!275577 (select (store (arr!17867 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275580 () Unit!19222)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37221 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19222)

(assert (=> b!604311 (= lt!275580 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275581 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!604311 (= lt!275581 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!604312 () Bool)

(declare-fun res!388260 () Bool)

(assert (=> b!604312 (=> (not res!388260) (not e!345771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!604312 (= res!388260 (validKeyInArray!0 k!1786))))

(declare-fun b!604313 () Bool)

(declare-fun res!388259 () Bool)

(assert (=> b!604313 (=> (not res!388259) (not e!345771))))

(assert (=> b!604313 (= res!388259 (and (= (size!18231 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18231 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18231 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!604314 () Bool)

(declare-fun e!345769 () Bool)

(assert (=> b!604314 (= e!345776 e!345769)))

(declare-fun res!388250 () Bool)

(assert (=> b!604314 (=> res!388250 e!345769)))

(assert (=> b!604314 (= res!388250 (or (not (= (select (arr!17867 a!2986) j!136) lt!275577)) (not (= (select (arr!17867 a!2986) j!136) lt!275578))))))

(assert (=> b!604314 e!345778))

(declare-fun res!388254 () Bool)

(assert (=> b!604314 (=> (not res!388254) (not e!345778))))

(assert (=> b!604314 (= res!388254 (= lt!275578 (select (arr!17867 a!2986) j!136)))))

(assert (=> b!604314 (= lt!275578 (select (store (arr!17867 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!604315 () Bool)

(declare-fun Unit!19224 () Unit!19222)

(assert (=> b!604315 (= e!345766 Unit!19224)))

(assert (=> b!604315 false))

(declare-fun b!604316 () Bool)

(declare-fun e!345780 () Bool)

(assert (=> b!604316 (= e!345780 (arrayContainsKey!0 lt!275571 (select (arr!17867 a!2986) j!136) index!984))))

(declare-fun b!604317 () Bool)

(declare-fun res!388257 () Bool)

(assert (=> b!604317 (=> (not res!388257) (not e!345771))))

(assert (=> b!604317 (= res!388257 (validKeyInArray!0 (select (arr!17867 a!2986) j!136)))))

(declare-fun b!604318 () Bool)

(declare-fun e!345779 () Unit!19222)

(declare-fun Unit!19225 () Unit!19222)

(assert (=> b!604318 (= e!345779 Unit!19225)))

(declare-fun lt!275566 () Unit!19222)

(assert (=> b!604318 (= lt!275566 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275571 (select (arr!17867 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!604318 (arrayContainsKey!0 lt!275571 (select (arr!17867 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275569 () Unit!19222)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37221 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11908) Unit!19222)

(assert (=> b!604318 (= lt!275569 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11905))))

(assert (=> b!604318 (arrayNoDuplicates!0 lt!275571 #b00000000000000000000000000000000 Nil!11905)))

(declare-fun lt!275572 () Unit!19222)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37221 (_ BitVec 32) (_ BitVec 32)) Unit!19222)

(assert (=> b!604318 (= lt!275572 (lemmaNoDuplicateFromThenFromBigger!0 lt!275571 #b00000000000000000000000000000000 j!136))))

(assert (=> b!604318 (arrayNoDuplicates!0 lt!275571 j!136 Nil!11905)))

(declare-fun lt!275575 () Unit!19222)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37221 (_ BitVec 64) (_ BitVec 32) List!11908) Unit!19222)

(assert (=> b!604318 (= lt!275575 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275571 (select (arr!17867 a!2986) j!136) j!136 Nil!11905))))

(assert (=> b!604318 false))

(declare-fun b!604319 () Bool)

(declare-fun res!388268 () Bool)

(assert (=> b!604319 (=> (not res!388268) (not e!345771))))

(assert (=> b!604319 (= res!388268 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!604320 () Bool)

(assert (=> b!604320 (= e!345773 e!345770)))

(declare-fun res!388256 () Bool)

(assert (=> b!604320 (=> (not res!388256) (not e!345770))))

(declare-fun lt!275579 () SeekEntryResult!6307)

(assert (=> b!604320 (= res!388256 (and (= lt!275579 (Found!6307 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17867 a!2986) index!984) (select (arr!17867 a!2986) j!136))) (not (= (select (arr!17867 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!604320 (= lt!275579 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17867 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!604321 () Bool)

(declare-fun Unit!19226 () Unit!19222)

(assert (=> b!604321 (= e!345766 Unit!19226)))

(declare-fun b!604322 () Bool)

(assert (=> b!604322 (= e!345768 (arrayContainsKey!0 lt!275571 (select (arr!17867 a!2986) j!136) index!984))))

(declare-fun b!604323 () Bool)

(declare-fun res!388263 () Bool)

(assert (=> b!604323 (=> (not res!388263) (not e!345772))))

(assert (=> b!604323 (= res!388263 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17867 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!604324 () Bool)

(assert (=> b!604324 (= e!345769 e!345775)))

(declare-fun res!388251 () Bool)

(assert (=> b!604324 (=> res!388251 e!345775)))

(assert (=> b!604324 (= res!388251 (bvsge index!984 j!136))))

(declare-fun lt!275576 () Unit!19222)

(assert (=> b!604324 (= lt!275576 e!345779)))

(declare-fun c!68396 () Bool)

(assert (=> b!604324 (= c!68396 (bvslt j!136 index!984))))

(declare-fun b!604325 () Bool)

(declare-fun Unit!19227 () Unit!19222)

(assert (=> b!604325 (= e!345779 Unit!19227)))

(declare-fun res!388255 () Bool)

(assert (=> start!55148 (=> (not res!388255) (not e!345771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55148 (= res!388255 (validMask!0 mask!3053))))

(assert (=> start!55148 e!345771))

(assert (=> start!55148 true))

(declare-fun array_inv!13663 (array!37221) Bool)

(assert (=> start!55148 (array_inv!13663 a!2986)))

(declare-fun b!604326 () Bool)

(declare-fun res!388252 () Bool)

(assert (=> b!604326 (=> (not res!388252) (not e!345772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37221 (_ BitVec 32)) Bool)

(assert (=> b!604326 (= res!388252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!604327 () Bool)

(assert (=> b!604327 (= e!345774 e!345780)))

(declare-fun res!388262 () Bool)

(assert (=> b!604327 (=> (not res!388262) (not e!345780))))

(assert (=> b!604327 (= res!388262 (arrayContainsKey!0 lt!275571 (select (arr!17867 a!2986) j!136) j!136))))

(declare-fun b!604328 () Bool)

(assert (=> b!604328 (= e!345777 (= lt!275579 lt!275574))))

(assert (= (and start!55148 res!388255) b!604313))

(assert (= (and b!604313 res!388259) b!604317))

(assert (= (and b!604317 res!388257) b!604312))

(assert (= (and b!604312 res!388260) b!604319))

(assert (= (and b!604319 res!388268) b!604307))

(assert (= (and b!604307 res!388264) b!604326))

(assert (= (and b!604326 res!388252) b!604308))

(assert (= (and b!604308 res!388265) b!604323))

(assert (= (and b!604323 res!388263) b!604306))

(assert (= (and b!604306 res!388253) b!604320))

(assert (= (and b!604320 res!388256) b!604311))

(assert (= (and b!604311 res!388266) b!604328))

(assert (= (and b!604311 c!68395) b!604315))

(assert (= (and b!604311 (not c!68395)) b!604321))

(assert (= (and b!604311 (not res!388258)) b!604314))

(assert (= (and b!604314 res!388254) b!604309))

(assert (= (and b!604309 (not res!388267)) b!604327))

(assert (= (and b!604327 res!388262) b!604316))

(assert (= (and b!604314 (not res!388250)) b!604324))

(assert (= (and b!604324 c!68396) b!604318))

(assert (= (and b!604324 (not c!68396)) b!604325))

(assert (= (and b!604324 (not res!388251)) b!604310))

(assert (= (and b!604310 res!388261) b!604322))

(declare-fun m!581221 () Bool)

(assert (=> b!604314 m!581221))

(declare-fun m!581223 () Bool)

(assert (=> b!604314 m!581223))

(declare-fun m!581225 () Bool)

(assert (=> b!604314 m!581225))

(declare-fun m!581227 () Bool)

(assert (=> b!604312 m!581227))

(declare-fun m!581229 () Bool)

(assert (=> b!604318 m!581229))

(assert (=> b!604318 m!581221))

(declare-fun m!581231 () Bool)

(assert (=> b!604318 m!581231))

(assert (=> b!604318 m!581221))

(declare-fun m!581233 () Bool)

(assert (=> b!604318 m!581233))

(declare-fun m!581235 () Bool)

(assert (=> b!604318 m!581235))

(assert (=> b!604318 m!581221))

(declare-fun m!581237 () Bool)

(assert (=> b!604318 m!581237))

(assert (=> b!604318 m!581221))

(declare-fun m!581239 () Bool)

(assert (=> b!604318 m!581239))

(declare-fun m!581241 () Bool)

(assert (=> b!604318 m!581241))

(declare-fun m!581243 () Bool)

(assert (=> b!604323 m!581243))

(declare-fun m!581245 () Bool)

(assert (=> b!604319 m!581245))

(declare-fun m!581247 () Bool)

(assert (=> b!604307 m!581247))

(assert (=> b!604309 m!581221))

(declare-fun m!581249 () Bool)

(assert (=> start!55148 m!581249))

(declare-fun m!581251 () Bool)

(assert (=> start!55148 m!581251))

(assert (=> b!604327 m!581221))

(assert (=> b!604327 m!581221))

(declare-fun m!581253 () Bool)

(assert (=> b!604327 m!581253))

(assert (=> b!604322 m!581221))

(assert (=> b!604322 m!581221))

(declare-fun m!581255 () Bool)

(assert (=> b!604322 m!581255))

(assert (=> b!604317 m!581221))

(assert (=> b!604317 m!581221))

(declare-fun m!581257 () Bool)

(assert (=> b!604317 m!581257))

(assert (=> b!604310 m!581221))

(assert (=> b!604310 m!581221))

(declare-fun m!581259 () Bool)

(assert (=> b!604310 m!581259))

(assert (=> b!604310 m!581221))

(declare-fun m!581261 () Bool)

(assert (=> b!604310 m!581261))

(assert (=> b!604310 m!581221))

(assert (=> b!604310 m!581253))

(declare-fun m!581263 () Bool)

(assert (=> b!604326 m!581263))

(declare-fun m!581265 () Bool)

(assert (=> b!604308 m!581265))

(assert (=> b!604306 m!581223))

(declare-fun m!581267 () Bool)

(assert (=> b!604306 m!581267))

(declare-fun m!581269 () Bool)

(assert (=> b!604320 m!581269))

(assert (=> b!604320 m!581221))

(assert (=> b!604320 m!581221))

(declare-fun m!581271 () Bool)

(assert (=> b!604320 m!581271))

(declare-fun m!581273 () Bool)

(assert (=> b!604311 m!581273))

(declare-fun m!581275 () Bool)

(assert (=> b!604311 m!581275))

(assert (=> b!604311 m!581221))

(declare-fun m!581277 () Bool)

(assert (=> b!604311 m!581277))

(assert (=> b!604311 m!581221))

(assert (=> b!604311 m!581223))

(declare-fun m!581279 () Bool)

(assert (=> b!604311 m!581279))

(declare-fun m!581281 () Bool)

(assert (=> b!604311 m!581281))

(declare-fun m!581283 () Bool)

(assert (=> b!604311 m!581283))

(assert (=> b!604316 m!581221))

(assert (=> b!604316 m!581221))

(assert (=> b!604316 m!581255))

(push 1)

(assert (not b!604320))

(assert (not b!604318))

(assert (not b!604310))

(assert (not b!604308))

(assert (not b!604316))

(assert (not b!604307))

(assert (not b!604312))

(assert (not start!55148))

(assert (not b!604322))

(assert (not b!604319))

(assert (not b!604311))

(assert (not b!604327))

(assert (not b!604317))

(assert (not b!604326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

