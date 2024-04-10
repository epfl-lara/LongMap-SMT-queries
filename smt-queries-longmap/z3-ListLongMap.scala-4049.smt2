; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55254 () Bool)

(assert start!55254)

(declare-fun b!605398 () Bool)

(declare-fun res!389015 () Bool)

(declare-fun e!346490 () Bool)

(assert (=> b!605398 (=> (not res!389015) (not e!346490))))

(declare-datatypes ((array!37246 0))(
  ( (array!37247 (arr!17878 (Array (_ BitVec 32) (_ BitVec 64))) (size!18242 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37246)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!605398 (= res!389015 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!605399 () Bool)

(declare-fun e!346503 () Bool)

(declare-fun e!346489 () Bool)

(assert (=> b!605399 (= e!346503 e!346489)))

(declare-fun res!389012 () Bool)

(assert (=> b!605399 (=> res!389012 e!346489)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!276244 () (_ BitVec 64))

(declare-fun lt!276247 () (_ BitVec 64))

(assert (=> b!605399 (= res!389012 (or (not (= (select (arr!17878 a!2986) j!136) lt!276244)) (not (= (select (arr!17878 a!2986) j!136) lt!276247))))))

(declare-fun e!346501 () Bool)

(assert (=> b!605399 e!346501))

(declare-fun res!389001 () Bool)

(assert (=> b!605399 (=> (not res!389001) (not e!346501))))

(assert (=> b!605399 (= res!389001 (= lt!276247 (select (arr!17878 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!605399 (= lt!276247 (select (store (arr!17878 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!605400 () Bool)

(declare-fun e!346502 () Bool)

(declare-fun e!346496 () Bool)

(assert (=> b!605400 (= e!346502 e!346496)))

(declare-fun res!389010 () Bool)

(assert (=> b!605400 (=> (not res!389010) (not e!346496))))

(declare-fun lt!276253 () array!37246)

(assert (=> b!605400 (= res!389010 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136))))

(declare-fun b!605401 () Bool)

(declare-datatypes ((Unit!19288 0))(
  ( (Unit!19289) )
))
(declare-fun e!346492 () Unit!19288)

(declare-fun Unit!19290 () Unit!19288)

(assert (=> b!605401 (= e!346492 Unit!19290)))

(declare-fun lt!276242 () Unit!19288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19288)

(assert (=> b!605401 (= lt!276242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276253 (select (arr!17878 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!605401 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276248 () Unit!19288)

(declare-datatypes ((List!11919 0))(
  ( (Nil!11916) (Cons!11915 (h!12960 (_ BitVec 64)) (t!18147 List!11919)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11919) Unit!19288)

(assert (=> b!605401 (= lt!276248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11916))))

(declare-fun arrayNoDuplicates!0 (array!37246 (_ BitVec 32) List!11919) Bool)

(assert (=> b!605401 (arrayNoDuplicates!0 lt!276253 #b00000000000000000000000000000000 Nil!11916)))

(declare-fun lt!276243 () Unit!19288)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37246 (_ BitVec 32) (_ BitVec 32)) Unit!19288)

(assert (=> b!605401 (= lt!276243 (lemmaNoDuplicateFromThenFromBigger!0 lt!276253 #b00000000000000000000000000000000 j!136))))

(assert (=> b!605401 (arrayNoDuplicates!0 lt!276253 j!136 Nil!11916)))

(declare-fun lt!276252 () Unit!19288)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37246 (_ BitVec 64) (_ BitVec 32) List!11919) Unit!19288)

(assert (=> b!605401 (= lt!276252 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136 Nil!11916))))

(assert (=> b!605401 false))

(declare-fun b!605402 () Bool)

(declare-fun e!346493 () Bool)

(assert (=> b!605402 (= e!346493 (not e!346503))))

(declare-fun res!389000 () Bool)

(assert (=> b!605402 (=> res!389000 e!346503)))

(declare-datatypes ((SeekEntryResult!6318 0))(
  ( (MissingZero!6318 (index!27538 (_ BitVec 32))) (Found!6318 (index!27539 (_ BitVec 32))) (Intermediate!6318 (undefined!7130 Bool) (index!27540 (_ BitVec 32)) (x!56336 (_ BitVec 32))) (Undefined!6318) (MissingVacant!6318 (index!27541 (_ BitVec 32))) )
))
(declare-fun lt!276254 () SeekEntryResult!6318)

(assert (=> b!605402 (= res!389000 (not (= lt!276254 (Found!6318 index!984))))))

(declare-fun lt!276255 () Unit!19288)

(declare-fun e!346495 () Unit!19288)

(assert (=> b!605402 (= lt!276255 e!346495)))

(declare-fun c!68566 () Bool)

(assert (=> b!605402 (= c!68566 (= lt!276254 Undefined!6318))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37246 (_ BitVec 32)) SeekEntryResult!6318)

(assert (=> b!605402 (= lt!276254 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276244 lt!276253 mask!3053))))

(declare-fun e!346499 () Bool)

(assert (=> b!605402 e!346499))

(declare-fun res!389002 () Bool)

(assert (=> b!605402 (=> (not res!389002) (not e!346499))))

(declare-fun lt!276256 () (_ BitVec 32))

(declare-fun lt!276251 () SeekEntryResult!6318)

(assert (=> b!605402 (= res!389002 (= lt!276251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 lt!276244 lt!276253 mask!3053)))))

(assert (=> b!605402 (= lt!276251 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!605402 (= lt!276244 (select (store (arr!17878 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!276246 () Unit!19288)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37246 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19288)

(assert (=> b!605402 (= lt!276246 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!605402 (= lt!276256 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!605403 () Bool)

(declare-fun res!389013 () Bool)

(assert (=> b!605403 (=> (not res!389013) (not e!346490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!605403 (= res!389013 (validKeyInArray!0 (select (arr!17878 a!2986) j!136)))))

(declare-fun b!605404 () Bool)

(declare-fun e!346491 () Bool)

(assert (=> b!605404 (= e!346491 e!346493)))

(declare-fun res!389003 () Bool)

(assert (=> b!605404 (=> (not res!389003) (not e!346493))))

(declare-fun lt!276245 () SeekEntryResult!6318)

(assert (=> b!605404 (= res!389003 (and (= lt!276245 (Found!6318 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17878 a!2986) index!984) (select (arr!17878 a!2986) j!136))) (not (= (select (arr!17878 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!605404 (= lt!276245 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!605405 () Bool)

(declare-fun e!346497 () Bool)

(assert (=> b!605405 (= e!346489 e!346497)))

(declare-fun res!389006 () Bool)

(assert (=> b!605405 (=> res!389006 e!346497)))

(assert (=> b!605405 (= res!389006 (bvsge index!984 j!136))))

(declare-fun lt!276249 () Unit!19288)

(assert (=> b!605405 (= lt!276249 e!346492)))

(declare-fun c!68567 () Bool)

(assert (=> b!605405 (= c!68567 (bvslt j!136 index!984))))

(declare-fun b!605406 () Bool)

(assert (=> b!605406 (= e!346499 (= lt!276245 lt!276251))))

(declare-fun b!605408 () Bool)

(declare-fun res!389014 () Bool)

(declare-fun e!346500 () Bool)

(assert (=> b!605408 (=> (not res!389014) (not e!346500))))

(assert (=> b!605408 (= res!389014 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17878 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!605409 () Bool)

(assert (=> b!605409 (= e!346501 e!346502)))

(declare-fun res!389017 () Bool)

(assert (=> b!605409 (=> res!389017 e!346502)))

(assert (=> b!605409 (= res!389017 (or (not (= (select (arr!17878 a!2986) j!136) lt!276244)) (not (= (select (arr!17878 a!2986) j!136) lt!276247)) (bvsge j!136 index!984)))))

(declare-fun b!605410 () Bool)

(assert (=> b!605410 (= e!346490 e!346500)))

(declare-fun res!389011 () Bool)

(assert (=> b!605410 (=> (not res!389011) (not e!346500))))

(declare-fun lt!276250 () SeekEntryResult!6318)

(assert (=> b!605410 (= res!389011 (or (= lt!276250 (MissingZero!6318 i!1108)) (= lt!276250 (MissingVacant!6318 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37246 (_ BitVec 32)) SeekEntryResult!6318)

(assert (=> b!605410 (= lt!276250 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!605411 () Bool)

(declare-fun res!389008 () Bool)

(assert (=> b!605411 (=> (not res!389008) (not e!346500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37246 (_ BitVec 32)) Bool)

(assert (=> b!605411 (= res!389008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!605412 () Bool)

(declare-fun e!346498 () Bool)

(assert (=> b!605412 (= e!346498 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) index!984))))

(declare-fun b!605413 () Bool)

(assert (=> b!605413 (= e!346500 e!346491)))

(declare-fun res!389018 () Bool)

(assert (=> b!605413 (=> (not res!389018) (not e!346491))))

(assert (=> b!605413 (= res!389018 (= (select (store (arr!17878 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605413 (= lt!276253 (array!37247 (store (arr!17878 a!2986) i!1108 k0!1786) (size!18242 a!2986)))))

(declare-fun b!605414 () Bool)

(declare-fun Unit!19291 () Unit!19288)

(assert (=> b!605414 (= e!346492 Unit!19291)))

(declare-fun b!605407 () Bool)

(declare-fun res!389007 () Bool)

(assert (=> b!605407 (=> (not res!389007) (not e!346490))))

(assert (=> b!605407 (= res!389007 (validKeyInArray!0 k0!1786))))

(declare-fun res!389005 () Bool)

(assert (=> start!55254 (=> (not res!389005) (not e!346490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55254 (= res!389005 (validMask!0 mask!3053))))

(assert (=> start!55254 e!346490))

(assert (=> start!55254 true))

(declare-fun array_inv!13674 (array!37246) Bool)

(assert (=> start!55254 (array_inv!13674 a!2986)))

(declare-fun b!605415 () Bool)

(declare-fun res!389009 () Bool)

(assert (=> b!605415 (=> (not res!389009) (not e!346500))))

(assert (=> b!605415 (= res!389009 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11916))))

(declare-fun b!605416 () Bool)

(declare-fun res!389004 () Bool)

(assert (=> b!605416 (=> (not res!389004) (not e!346490))))

(assert (=> b!605416 (= res!389004 (and (= (size!18242 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18242 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!605417 () Bool)

(declare-fun Unit!19292 () Unit!19288)

(assert (=> b!605417 (= e!346495 Unit!19292)))

(declare-fun b!605418 () Bool)

(declare-fun Unit!19293 () Unit!19288)

(assert (=> b!605418 (= e!346495 Unit!19293)))

(assert (=> b!605418 false))

(declare-fun b!605419 () Bool)

(assert (=> b!605419 (= e!346496 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) index!984))))

(declare-fun b!605420 () Bool)

(assert (=> b!605420 (= e!346497 (or (bvsgt #b00000000000000000000000000000000 (size!18242 a!2986)) (bvslt (size!18242 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!605420 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276241 () Unit!19288)

(assert (=> b!605420 (= lt!276241 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!605420 e!346498))

(declare-fun res!389016 () Bool)

(assert (=> b!605420 (=> (not res!389016) (not e!346498))))

(assert (=> b!605420 (= res!389016 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136))))

(assert (= (and start!55254 res!389005) b!605416))

(assert (= (and b!605416 res!389004) b!605403))

(assert (= (and b!605403 res!389013) b!605407))

(assert (= (and b!605407 res!389007) b!605398))

(assert (= (and b!605398 res!389015) b!605410))

(assert (= (and b!605410 res!389011) b!605411))

(assert (= (and b!605411 res!389008) b!605415))

(assert (= (and b!605415 res!389009) b!605408))

(assert (= (and b!605408 res!389014) b!605413))

(assert (= (and b!605413 res!389018) b!605404))

(assert (= (and b!605404 res!389003) b!605402))

(assert (= (and b!605402 res!389002) b!605406))

(assert (= (and b!605402 c!68566) b!605418))

(assert (= (and b!605402 (not c!68566)) b!605417))

(assert (= (and b!605402 (not res!389000)) b!605399))

(assert (= (and b!605399 res!389001) b!605409))

(assert (= (and b!605409 (not res!389017)) b!605400))

(assert (= (and b!605400 res!389010) b!605419))

(assert (= (and b!605399 (not res!389012)) b!605405))

(assert (= (and b!605405 c!68567) b!605401))

(assert (= (and b!605405 (not c!68567)) b!605414))

(assert (= (and b!605405 (not res!389006)) b!605420))

(assert (= (and b!605420 res!389016) b!605412))

(declare-fun m!582255 () Bool)

(assert (=> b!605402 m!582255))

(declare-fun m!582257 () Bool)

(assert (=> b!605402 m!582257))

(declare-fun m!582259 () Bool)

(assert (=> b!605402 m!582259))

(assert (=> b!605402 m!582255))

(declare-fun m!582261 () Bool)

(assert (=> b!605402 m!582261))

(declare-fun m!582263 () Bool)

(assert (=> b!605402 m!582263))

(declare-fun m!582265 () Bool)

(assert (=> b!605402 m!582265))

(declare-fun m!582267 () Bool)

(assert (=> b!605402 m!582267))

(declare-fun m!582269 () Bool)

(assert (=> b!605402 m!582269))

(declare-fun m!582271 () Bool)

(assert (=> b!605415 m!582271))

(assert (=> b!605409 m!582255))

(declare-fun m!582273 () Bool)

(assert (=> b!605411 m!582273))

(declare-fun m!582275 () Bool)

(assert (=> b!605404 m!582275))

(assert (=> b!605404 m!582255))

(assert (=> b!605404 m!582255))

(declare-fun m!582277 () Bool)

(assert (=> b!605404 m!582277))

(declare-fun m!582279 () Bool)

(assert (=> b!605398 m!582279))

(assert (=> b!605400 m!582255))

(assert (=> b!605400 m!582255))

(declare-fun m!582281 () Bool)

(assert (=> b!605400 m!582281))

(assert (=> b!605420 m!582255))

(assert (=> b!605420 m!582255))

(declare-fun m!582283 () Bool)

(assert (=> b!605420 m!582283))

(assert (=> b!605420 m!582255))

(declare-fun m!582285 () Bool)

(assert (=> b!605420 m!582285))

(assert (=> b!605420 m!582255))

(assert (=> b!605420 m!582281))

(assert (=> b!605412 m!582255))

(assert (=> b!605412 m!582255))

(declare-fun m!582287 () Bool)

(assert (=> b!605412 m!582287))

(declare-fun m!582289 () Bool)

(assert (=> b!605408 m!582289))

(declare-fun m!582291 () Bool)

(assert (=> b!605410 m!582291))

(assert (=> b!605401 m!582255))

(assert (=> b!605401 m!582255))

(declare-fun m!582293 () Bool)

(assert (=> b!605401 m!582293))

(declare-fun m!582295 () Bool)

(assert (=> b!605401 m!582295))

(assert (=> b!605401 m!582255))

(declare-fun m!582297 () Bool)

(assert (=> b!605401 m!582297))

(declare-fun m!582299 () Bool)

(assert (=> b!605401 m!582299))

(assert (=> b!605401 m!582255))

(declare-fun m!582301 () Bool)

(assert (=> b!605401 m!582301))

(declare-fun m!582303 () Bool)

(assert (=> b!605401 m!582303))

(declare-fun m!582305 () Bool)

(assert (=> b!605401 m!582305))

(assert (=> b!605403 m!582255))

(assert (=> b!605403 m!582255))

(declare-fun m!582307 () Bool)

(assert (=> b!605403 m!582307))

(declare-fun m!582309 () Bool)

(assert (=> b!605407 m!582309))

(assert (=> b!605419 m!582255))

(assert (=> b!605419 m!582255))

(assert (=> b!605419 m!582287))

(assert (=> b!605413 m!582259))

(declare-fun m!582311 () Bool)

(assert (=> b!605413 m!582311))

(assert (=> b!605399 m!582255))

(assert (=> b!605399 m!582259))

(declare-fun m!582313 () Bool)

(assert (=> b!605399 m!582313))

(declare-fun m!582315 () Bool)

(assert (=> start!55254 m!582315))

(declare-fun m!582317 () Bool)

(assert (=> start!55254 m!582317))

(check-sat (not b!605411) (not b!605415) (not b!605410) (not b!605404) (not b!605398) (not b!605407) (not b!605419) (not b!605402) (not start!55254) (not b!605412) (not b!605400) (not b!605401) (not b!605420) (not b!605403))
(check-sat)
(get-model)

(declare-fun d!87591 () Bool)

(declare-fun e!346551 () Bool)

(assert (=> d!87591 e!346551))

(declare-fun res!389078 () Bool)

(assert (=> d!87591 (=> (not res!389078) (not e!346551))))

(assert (=> d!87591 (= res!389078 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18242 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18242 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18242 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986))))))

(declare-fun lt!276307 () Unit!19288)

(declare-fun choose!9 (array!37246 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19288)

(assert (=> d!87591 (= lt!276307 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87591 (validMask!0 mask!3053)))

(assert (=> d!87591 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 mask!3053) lt!276307)))

(declare-fun b!605492 () Bool)

(assert (=> b!605492 (= e!346551 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 (select (store (arr!17878 a!2986) i!1108 k0!1786) j!136) (array!37247 (store (arr!17878 a!2986) i!1108 k0!1786) (size!18242 a!2986)) mask!3053)))))

(assert (= (and d!87591 res!389078) b!605492))

(declare-fun m!582383 () Bool)

(assert (=> d!87591 m!582383))

(assert (=> d!87591 m!582315))

(assert (=> b!605492 m!582267))

(declare-fun m!582385 () Bool)

(assert (=> b!605492 m!582385))

(assert (=> b!605492 m!582259))

(assert (=> b!605492 m!582255))

(assert (=> b!605492 m!582261))

(assert (=> b!605492 m!582267))

(assert (=> b!605492 m!582255))

(assert (=> b!605402 d!87591))

(declare-fun b!605505 () Bool)

(declare-fun c!68580 () Bool)

(declare-fun lt!276312 () (_ BitVec 64))

(assert (=> b!605505 (= c!68580 (= lt!276312 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346560 () SeekEntryResult!6318)

(declare-fun e!346558 () SeekEntryResult!6318)

(assert (=> b!605505 (= e!346560 e!346558)))

(declare-fun b!605506 () Bool)

(assert (=> b!605506 (= e!346558 (MissingVacant!6318 vacantSpotIndex!68))))

(declare-fun b!605507 () Bool)

(declare-fun e!346559 () SeekEntryResult!6318)

(assert (=> b!605507 (= e!346559 Undefined!6318)))

(declare-fun b!605508 () Bool)

(assert (=> b!605508 (= e!346559 e!346560)))

(declare-fun c!68582 () Bool)

(assert (=> b!605508 (= c!68582 (= lt!276312 lt!276244))))

(declare-fun b!605509 () Bool)

(assert (=> b!605509 (= e!346560 (Found!6318 lt!276256))))

(declare-fun d!87593 () Bool)

(declare-fun lt!276313 () SeekEntryResult!6318)

(get-info :version)

(assert (=> d!87593 (and (or ((_ is Undefined!6318) lt!276313) (not ((_ is Found!6318) lt!276313)) (and (bvsge (index!27539 lt!276313) #b00000000000000000000000000000000) (bvslt (index!27539 lt!276313) (size!18242 lt!276253)))) (or ((_ is Undefined!6318) lt!276313) ((_ is Found!6318) lt!276313) (not ((_ is MissingVacant!6318) lt!276313)) (not (= (index!27541 lt!276313) vacantSpotIndex!68)) (and (bvsge (index!27541 lt!276313) #b00000000000000000000000000000000) (bvslt (index!27541 lt!276313) (size!18242 lt!276253)))) (or ((_ is Undefined!6318) lt!276313) (ite ((_ is Found!6318) lt!276313) (= (select (arr!17878 lt!276253) (index!27539 lt!276313)) lt!276244) (and ((_ is MissingVacant!6318) lt!276313) (= (index!27541 lt!276313) vacantSpotIndex!68) (= (select (arr!17878 lt!276253) (index!27541 lt!276313)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87593 (= lt!276313 e!346559)))

(declare-fun c!68581 () Bool)

(assert (=> d!87593 (= c!68581 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87593 (= lt!276312 (select (arr!17878 lt!276253) lt!276256))))

(assert (=> d!87593 (validMask!0 mask!3053)))

(assert (=> d!87593 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 lt!276244 lt!276253 mask!3053) lt!276313)))

(declare-fun b!605510 () Bool)

(assert (=> b!605510 (= e!346558 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276256 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!276244 lt!276253 mask!3053))))

(assert (= (and d!87593 c!68581) b!605507))

(assert (= (and d!87593 (not c!68581)) b!605508))

(assert (= (and b!605508 c!68582) b!605509))

(assert (= (and b!605508 (not c!68582)) b!605505))

(assert (= (and b!605505 c!68580) b!605506))

(assert (= (and b!605505 (not c!68580)) b!605510))

(declare-fun m!582387 () Bool)

(assert (=> d!87593 m!582387))

(declare-fun m!582389 () Bool)

(assert (=> d!87593 m!582389))

(declare-fun m!582391 () Bool)

(assert (=> d!87593 m!582391))

(assert (=> d!87593 m!582315))

(declare-fun m!582393 () Bool)

(assert (=> b!605510 m!582393))

(assert (=> b!605510 m!582393))

(declare-fun m!582395 () Bool)

(assert (=> b!605510 m!582395))

(assert (=> b!605402 d!87593))

(declare-fun d!87595 () Bool)

(declare-fun lt!276316 () (_ BitVec 32))

(assert (=> d!87595 (and (bvsge lt!276316 #b00000000000000000000000000000000) (bvslt lt!276316 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87595 (= lt!276316 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87595 (validMask!0 mask!3053)))

(assert (=> d!87595 (= (nextIndex!0 index!984 x!910 mask!3053) lt!276316)))

(declare-fun bs!18520 () Bool)

(assert (= bs!18520 d!87595))

(declare-fun m!582397 () Bool)

(assert (=> bs!18520 m!582397))

(assert (=> bs!18520 m!582315))

(assert (=> b!605402 d!87595))

(declare-fun b!605511 () Bool)

(declare-fun c!68583 () Bool)

(declare-fun lt!276317 () (_ BitVec 64))

(assert (=> b!605511 (= c!68583 (= lt!276317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346563 () SeekEntryResult!6318)

(declare-fun e!346561 () SeekEntryResult!6318)

(assert (=> b!605511 (= e!346563 e!346561)))

(declare-fun b!605512 () Bool)

(assert (=> b!605512 (= e!346561 (MissingVacant!6318 vacantSpotIndex!68))))

(declare-fun b!605513 () Bool)

(declare-fun e!346562 () SeekEntryResult!6318)

(assert (=> b!605513 (= e!346562 Undefined!6318)))

(declare-fun b!605514 () Bool)

(assert (=> b!605514 (= e!346562 e!346563)))

(declare-fun c!68585 () Bool)

(assert (=> b!605514 (= c!68585 (= lt!276317 lt!276244))))

(declare-fun b!605515 () Bool)

(assert (=> b!605515 (= e!346563 (Found!6318 index!984))))

(declare-fun d!87599 () Bool)

(declare-fun lt!276318 () SeekEntryResult!6318)

(assert (=> d!87599 (and (or ((_ is Undefined!6318) lt!276318) (not ((_ is Found!6318) lt!276318)) (and (bvsge (index!27539 lt!276318) #b00000000000000000000000000000000) (bvslt (index!27539 lt!276318) (size!18242 lt!276253)))) (or ((_ is Undefined!6318) lt!276318) ((_ is Found!6318) lt!276318) (not ((_ is MissingVacant!6318) lt!276318)) (not (= (index!27541 lt!276318) vacantSpotIndex!68)) (and (bvsge (index!27541 lt!276318) #b00000000000000000000000000000000) (bvslt (index!27541 lt!276318) (size!18242 lt!276253)))) (or ((_ is Undefined!6318) lt!276318) (ite ((_ is Found!6318) lt!276318) (= (select (arr!17878 lt!276253) (index!27539 lt!276318)) lt!276244) (and ((_ is MissingVacant!6318) lt!276318) (= (index!27541 lt!276318) vacantSpotIndex!68) (= (select (arr!17878 lt!276253) (index!27541 lt!276318)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87599 (= lt!276318 e!346562)))

(declare-fun c!68584 () Bool)

(assert (=> d!87599 (= c!68584 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87599 (= lt!276317 (select (arr!17878 lt!276253) index!984))))

(assert (=> d!87599 (validMask!0 mask!3053)))

(assert (=> d!87599 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!276244 lt!276253 mask!3053) lt!276318)))

(declare-fun b!605516 () Bool)

(assert (=> b!605516 (= e!346561 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!276244 lt!276253 mask!3053))))

(assert (= (and d!87599 c!68584) b!605513))

(assert (= (and d!87599 (not c!68584)) b!605514))

(assert (= (and b!605514 c!68585) b!605515))

(assert (= (and b!605514 (not c!68585)) b!605511))

(assert (= (and b!605511 c!68583) b!605512))

(assert (= (and b!605511 (not c!68583)) b!605516))

(declare-fun m!582399 () Bool)

(assert (=> d!87599 m!582399))

(declare-fun m!582401 () Bool)

(assert (=> d!87599 m!582401))

(declare-fun m!582403 () Bool)

(assert (=> d!87599 m!582403))

(assert (=> d!87599 m!582315))

(assert (=> b!605516 m!582263))

(assert (=> b!605516 m!582263))

(declare-fun m!582405 () Bool)

(assert (=> b!605516 m!582405))

(assert (=> b!605402 d!87599))

(declare-fun b!605517 () Bool)

(declare-fun c!68586 () Bool)

(declare-fun lt!276319 () (_ BitVec 64))

(assert (=> b!605517 (= c!68586 (= lt!276319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346566 () SeekEntryResult!6318)

(declare-fun e!346564 () SeekEntryResult!6318)

(assert (=> b!605517 (= e!346566 e!346564)))

(declare-fun b!605518 () Bool)

(assert (=> b!605518 (= e!346564 (MissingVacant!6318 vacantSpotIndex!68))))

(declare-fun b!605519 () Bool)

(declare-fun e!346565 () SeekEntryResult!6318)

(assert (=> b!605519 (= e!346565 Undefined!6318)))

(declare-fun b!605520 () Bool)

(assert (=> b!605520 (= e!346565 e!346566)))

(declare-fun c!68588 () Bool)

(assert (=> b!605520 (= c!68588 (= lt!276319 (select (arr!17878 a!2986) j!136)))))

(declare-fun b!605521 () Bool)

(assert (=> b!605521 (= e!346566 (Found!6318 lt!276256))))

(declare-fun d!87601 () Bool)

(declare-fun lt!276320 () SeekEntryResult!6318)

(assert (=> d!87601 (and (or ((_ is Undefined!6318) lt!276320) (not ((_ is Found!6318) lt!276320)) (and (bvsge (index!27539 lt!276320) #b00000000000000000000000000000000) (bvslt (index!27539 lt!276320) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276320) ((_ is Found!6318) lt!276320) (not ((_ is MissingVacant!6318) lt!276320)) (not (= (index!27541 lt!276320) vacantSpotIndex!68)) (and (bvsge (index!27541 lt!276320) #b00000000000000000000000000000000) (bvslt (index!27541 lt!276320) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276320) (ite ((_ is Found!6318) lt!276320) (= (select (arr!17878 a!2986) (index!27539 lt!276320)) (select (arr!17878 a!2986) j!136)) (and ((_ is MissingVacant!6318) lt!276320) (= (index!27541 lt!276320) vacantSpotIndex!68) (= (select (arr!17878 a!2986) (index!27541 lt!276320)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87601 (= lt!276320 e!346565)))

(declare-fun c!68587 () Bool)

(assert (=> d!87601 (= c!68587 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87601 (= lt!276319 (select (arr!17878 a!2986) lt!276256))))

(assert (=> d!87601 (validMask!0 mask!3053)))

(assert (=> d!87601 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!276256 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053) lt!276320)))

(declare-fun b!605522 () Bool)

(assert (=> b!605522 (= e!346564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!276256 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87601 c!68587) b!605519))

(assert (= (and d!87601 (not c!68587)) b!605520))

(assert (= (and b!605520 c!68588) b!605521))

(assert (= (and b!605520 (not c!68588)) b!605517))

(assert (= (and b!605517 c!68586) b!605518))

(assert (= (and b!605517 (not c!68586)) b!605522))

(declare-fun m!582407 () Bool)

(assert (=> d!87601 m!582407))

(declare-fun m!582409 () Bool)

(assert (=> d!87601 m!582409))

(declare-fun m!582411 () Bool)

(assert (=> d!87601 m!582411))

(assert (=> d!87601 m!582315))

(assert (=> b!605522 m!582393))

(assert (=> b!605522 m!582393))

(assert (=> b!605522 m!582255))

(declare-fun m!582413 () Bool)

(assert (=> b!605522 m!582413))

(assert (=> b!605402 d!87601))

(declare-fun d!87603 () Bool)

(declare-fun res!389089 () Bool)

(declare-fun e!346579 () Bool)

(assert (=> d!87603 (=> res!389089 e!346579)))

(assert (=> d!87603 (= res!389089 (= (select (arr!17878 lt!276253) index!984) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!87603 (= (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) index!984) e!346579)))

(declare-fun b!605537 () Bool)

(declare-fun e!346580 () Bool)

(assert (=> b!605537 (= e!346579 e!346580)))

(declare-fun res!389090 () Bool)

(assert (=> b!605537 (=> (not res!389090) (not e!346580))))

(assert (=> b!605537 (= res!389090 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18242 lt!276253)))))

(declare-fun b!605538 () Bool)

(assert (=> b!605538 (= e!346580 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87603 (not res!389089)) b!605537))

(assert (= (and b!605537 res!389090) b!605538))

(assert (=> d!87603 m!582403))

(assert (=> b!605538 m!582255))

(declare-fun m!582415 () Bool)

(assert (=> b!605538 m!582415))

(assert (=> b!605412 d!87603))

(declare-fun d!87607 () Bool)

(assert (=> d!87607 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!276323 () Unit!19288)

(declare-fun choose!114 (array!37246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19288)

(assert (=> d!87607 (= lt!276323 (choose!114 lt!276253 (select (arr!17878 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87607 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87607 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276253 (select (arr!17878 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!276323)))

(declare-fun bs!18521 () Bool)

(assert (= bs!18521 d!87607))

(assert (=> bs!18521 m!582255))

(assert (=> bs!18521 m!582293))

(assert (=> bs!18521 m!582255))

(declare-fun m!582421 () Bool)

(assert (=> bs!18521 m!582421))

(assert (=> b!605401 d!87607))

(declare-fun d!87611 () Bool)

(assert (=> d!87611 (arrayNoDuplicates!0 lt!276253 j!136 Nil!11916)))

(declare-fun lt!276326 () Unit!19288)

(declare-fun choose!39 (array!37246 (_ BitVec 32) (_ BitVec 32)) Unit!19288)

(assert (=> d!87611 (= lt!276326 (choose!39 lt!276253 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87611 (bvslt (size!18242 lt!276253) #b01111111111111111111111111111111)))

(assert (=> d!87611 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!276253 #b00000000000000000000000000000000 j!136) lt!276326)))

(declare-fun bs!18522 () Bool)

(assert (= bs!18522 d!87611))

(assert (=> bs!18522 m!582303))

(declare-fun m!582431 () Bool)

(assert (=> bs!18522 m!582431))

(assert (=> b!605401 d!87611))

(declare-fun d!87615 () Bool)

(declare-fun res!389100 () Bool)

(declare-fun e!346591 () Bool)

(assert (=> d!87615 (=> res!389100 e!346591)))

(assert (=> d!87615 (= res!389100 (= (select (arr!17878 lt!276253) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!87615 (= (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!346591)))

(declare-fun b!605550 () Bool)

(declare-fun e!346592 () Bool)

(assert (=> b!605550 (= e!346591 e!346592)))

(declare-fun res!389101 () Bool)

(assert (=> b!605550 (=> (not res!389101) (not e!346592))))

(assert (=> b!605550 (= res!389101 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18242 lt!276253)))))

(declare-fun b!605551 () Bool)

(assert (=> b!605551 (= e!346592 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87615 (not res!389100)) b!605550))

(assert (= (and b!605550 res!389101) b!605551))

(declare-fun m!582433 () Bool)

(assert (=> d!87615 m!582433))

(assert (=> b!605551 m!582255))

(declare-fun m!582435 () Bool)

(assert (=> b!605551 m!582435))

(assert (=> b!605401 d!87615))

(declare-fun d!87617 () Bool)

(assert (=> d!87617 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18242 lt!276253)) (not (= (select (arr!17878 lt!276253) j!136) (select (arr!17878 a!2986) j!136))))))

(declare-fun lt!276329 () Unit!19288)

(declare-fun choose!21 (array!37246 (_ BitVec 64) (_ BitVec 32) List!11919) Unit!19288)

(assert (=> d!87617 (= lt!276329 (choose!21 lt!276253 (select (arr!17878 a!2986) j!136) j!136 Nil!11916))))

(assert (=> d!87617 (bvslt (size!18242 lt!276253) #b01111111111111111111111111111111)))

(assert (=> d!87617 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136 Nil!11916) lt!276329)))

(declare-fun bs!18523 () Bool)

(assert (= bs!18523 d!87617))

(declare-fun m!582437 () Bool)

(assert (=> bs!18523 m!582437))

(assert (=> bs!18523 m!582255))

(declare-fun m!582439 () Bool)

(assert (=> bs!18523 m!582439))

(assert (=> b!605401 d!87617))

(declare-fun d!87619 () Bool)

(declare-fun e!346595 () Bool)

(assert (=> d!87619 e!346595))

(declare-fun res!389104 () Bool)

(assert (=> d!87619 (=> (not res!389104) (not e!346595))))

(assert (=> d!87619 (= res!389104 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18242 a!2986))))))

(declare-fun lt!276332 () Unit!19288)

(declare-fun choose!41 (array!37246 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11919) Unit!19288)

(assert (=> d!87619 (= lt!276332 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11916))))

(assert (=> d!87619 (bvslt (size!18242 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87619 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11916) lt!276332)))

(declare-fun b!605554 () Bool)

(assert (=> b!605554 (= e!346595 (arrayNoDuplicates!0 (array!37247 (store (arr!17878 a!2986) i!1108 k0!1786) (size!18242 a!2986)) #b00000000000000000000000000000000 Nil!11916))))

(assert (= (and d!87619 res!389104) b!605554))

(declare-fun m!582441 () Bool)

(assert (=> d!87619 m!582441))

(assert (=> b!605554 m!582259))

(declare-fun m!582443 () Bool)

(assert (=> b!605554 m!582443))

(assert (=> b!605401 d!87619))

(declare-fun b!605585 () Bool)

(declare-fun e!346617 () Bool)

(declare-fun call!33044 () Bool)

(assert (=> b!605585 (= e!346617 call!33044)))

(declare-fun b!605586 () Bool)

(assert (=> b!605586 (= e!346617 call!33044)))

(declare-fun d!87621 () Bool)

(declare-fun res!389114 () Bool)

(declare-fun e!346616 () Bool)

(assert (=> d!87621 (=> res!389114 e!346616)))

(assert (=> d!87621 (= res!389114 (bvsge #b00000000000000000000000000000000 (size!18242 lt!276253)))))

(assert (=> d!87621 (= (arrayNoDuplicates!0 lt!276253 #b00000000000000000000000000000000 Nil!11916) e!346616)))

(declare-fun b!605587 () Bool)

(declare-fun e!346618 () Bool)

(declare-fun contains!2994 (List!11919 (_ BitVec 64)) Bool)

(assert (=> b!605587 (= e!346618 (contains!2994 Nil!11916 (select (arr!17878 lt!276253) #b00000000000000000000000000000000)))))

(declare-fun b!605588 () Bool)

(declare-fun e!346615 () Bool)

(assert (=> b!605588 (= e!346616 e!346615)))

(declare-fun res!389115 () Bool)

(assert (=> b!605588 (=> (not res!389115) (not e!346615))))

(assert (=> b!605588 (= res!389115 (not e!346618))))

(declare-fun res!389113 () Bool)

(assert (=> b!605588 (=> (not res!389113) (not e!346618))))

(assert (=> b!605588 (= res!389113 (validKeyInArray!0 (select (arr!17878 lt!276253) #b00000000000000000000000000000000)))))

(declare-fun b!605589 () Bool)

(assert (=> b!605589 (= e!346615 e!346617)))

(declare-fun c!68603 () Bool)

(assert (=> b!605589 (= c!68603 (validKeyInArray!0 (select (arr!17878 lt!276253) #b00000000000000000000000000000000)))))

(declare-fun bm!33041 () Bool)

(assert (=> bm!33041 (= call!33044 (arrayNoDuplicates!0 lt!276253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68603 (Cons!11915 (select (arr!17878 lt!276253) #b00000000000000000000000000000000) Nil!11916) Nil!11916)))))

(assert (= (and d!87621 (not res!389114)) b!605588))

(assert (= (and b!605588 res!389113) b!605587))

(assert (= (and b!605588 res!389115) b!605589))

(assert (= (and b!605589 c!68603) b!605585))

(assert (= (and b!605589 (not c!68603)) b!605586))

(assert (= (or b!605585 b!605586) bm!33041))

(declare-fun m!582455 () Bool)

(assert (=> b!605587 m!582455))

(assert (=> b!605587 m!582455))

(declare-fun m!582457 () Bool)

(assert (=> b!605587 m!582457))

(assert (=> b!605588 m!582455))

(assert (=> b!605588 m!582455))

(declare-fun m!582459 () Bool)

(assert (=> b!605588 m!582459))

(assert (=> b!605589 m!582455))

(assert (=> b!605589 m!582455))

(assert (=> b!605589 m!582459))

(assert (=> bm!33041 m!582455))

(declare-fun m!582461 () Bool)

(assert (=> bm!33041 m!582461))

(assert (=> b!605401 d!87621))

(declare-fun b!605600 () Bool)

(declare-fun e!346625 () Bool)

(declare-fun call!33045 () Bool)

(assert (=> b!605600 (= e!346625 call!33045)))

(declare-fun b!605602 () Bool)

(assert (=> b!605602 (= e!346625 call!33045)))

(declare-fun d!87629 () Bool)

(declare-fun res!389117 () Bool)

(declare-fun e!346624 () Bool)

(assert (=> d!87629 (=> res!389117 e!346624)))

(assert (=> d!87629 (= res!389117 (bvsge j!136 (size!18242 lt!276253)))))

(assert (=> d!87629 (= (arrayNoDuplicates!0 lt!276253 j!136 Nil!11916) e!346624)))

(declare-fun b!605604 () Bool)

(declare-fun e!346626 () Bool)

(assert (=> b!605604 (= e!346626 (contains!2994 Nil!11916 (select (arr!17878 lt!276253) j!136)))))

(declare-fun b!605605 () Bool)

(declare-fun e!346623 () Bool)

(assert (=> b!605605 (= e!346624 e!346623)))

(declare-fun res!389118 () Bool)

(assert (=> b!605605 (=> (not res!389118) (not e!346623))))

(assert (=> b!605605 (= res!389118 (not e!346626))))

(declare-fun res!389116 () Bool)

(assert (=> b!605605 (=> (not res!389116) (not e!346626))))

(assert (=> b!605605 (= res!389116 (validKeyInArray!0 (select (arr!17878 lt!276253) j!136)))))

(declare-fun b!605606 () Bool)

(assert (=> b!605606 (= e!346623 e!346625)))

(declare-fun c!68608 () Bool)

(assert (=> b!605606 (= c!68608 (validKeyInArray!0 (select (arr!17878 lt!276253) j!136)))))

(declare-fun bm!33042 () Bool)

(assert (=> bm!33042 (= call!33045 (arrayNoDuplicates!0 lt!276253 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68608 (Cons!11915 (select (arr!17878 lt!276253) j!136) Nil!11916) Nil!11916)))))

(assert (= (and d!87629 (not res!389117)) b!605605))

(assert (= (and b!605605 res!389116) b!605604))

(assert (= (and b!605605 res!389118) b!605606))

(assert (= (and b!605606 c!68608) b!605600))

(assert (= (and b!605606 (not c!68608)) b!605602))

(assert (= (or b!605600 b!605602) bm!33042))

(assert (=> b!605604 m!582437))

(assert (=> b!605604 m!582437))

(declare-fun m!582463 () Bool)

(assert (=> b!605604 m!582463))

(assert (=> b!605605 m!582437))

(assert (=> b!605605 m!582437))

(declare-fun m!582465 () Bool)

(assert (=> b!605605 m!582465))

(assert (=> b!605606 m!582437))

(assert (=> b!605606 m!582437))

(assert (=> b!605606 m!582465))

(assert (=> bm!33042 m!582437))

(declare-fun m!582467 () Bool)

(assert (=> bm!33042 m!582467))

(assert (=> b!605401 d!87629))

(declare-fun d!87631 () Bool)

(declare-fun res!389119 () Bool)

(declare-fun e!346629 () Bool)

(assert (=> d!87631 (=> res!389119 e!346629)))

(assert (=> d!87631 (= res!389119 (= (select (arr!17878 lt!276253) j!136) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!87631 (= (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136) e!346629)))

(declare-fun b!605607 () Bool)

(declare-fun e!346630 () Bool)

(assert (=> b!605607 (= e!346629 e!346630)))

(declare-fun res!389120 () Bool)

(assert (=> b!605607 (=> (not res!389120) (not e!346630))))

(assert (=> b!605607 (= res!389120 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18242 lt!276253)))))

(declare-fun b!605608 () Bool)

(assert (=> b!605608 (= e!346630 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87631 (not res!389119)) b!605607))

(assert (= (and b!605607 res!389120) b!605608))

(assert (=> d!87631 m!582437))

(assert (=> b!605608 m!582255))

(declare-fun m!582469 () Bool)

(assert (=> b!605608 m!582469))

(assert (=> b!605400 d!87631))

(declare-fun bm!33048 () Bool)

(declare-fun call!33051 () Bool)

(assert (=> bm!33048 (= call!33051 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!605658 () Bool)

(declare-fun e!346668 () Bool)

(assert (=> b!605658 (= e!346668 call!33051)))

(declare-fun b!605659 () Bool)

(declare-fun e!346666 () Bool)

(assert (=> b!605659 (= e!346666 e!346668)))

(declare-fun c!68625 () Bool)

(assert (=> b!605659 (= c!68625 (validKeyInArray!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87633 () Bool)

(declare-fun res!389142 () Bool)

(assert (=> d!87633 (=> res!389142 e!346666)))

(assert (=> d!87633 (= res!389142 (bvsge #b00000000000000000000000000000000 (size!18242 a!2986)))))

(assert (=> d!87633 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!346666)))

(declare-fun b!605660 () Bool)

(declare-fun e!346667 () Bool)

(assert (=> b!605660 (= e!346667 call!33051)))

(declare-fun b!605661 () Bool)

(assert (=> b!605661 (= e!346668 e!346667)))

(declare-fun lt!276360 () (_ BitVec 64))

(assert (=> b!605661 (= lt!276360 (select (arr!17878 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!276358 () Unit!19288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37246 (_ BitVec 64) (_ BitVec 32)) Unit!19288)

(assert (=> b!605661 (= lt!276358 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!276360 #b00000000000000000000000000000000))))

(assert (=> b!605661 (arrayContainsKey!0 a!2986 lt!276360 #b00000000000000000000000000000000)))

(declare-fun lt!276359 () Unit!19288)

(assert (=> b!605661 (= lt!276359 lt!276358)))

(declare-fun res!389143 () Bool)

(assert (=> b!605661 (= res!389143 (= (seekEntryOrOpen!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6318 #b00000000000000000000000000000000)))))

(assert (=> b!605661 (=> (not res!389143) (not e!346667))))

(assert (= (and d!87633 (not res!389142)) b!605659))

(assert (= (and b!605659 c!68625) b!605661))

(assert (= (and b!605659 (not c!68625)) b!605658))

(assert (= (and b!605661 res!389143) b!605660))

(assert (= (or b!605660 b!605658) bm!33048))

(declare-fun m!582517 () Bool)

(assert (=> bm!33048 m!582517))

(declare-fun m!582519 () Bool)

(assert (=> b!605659 m!582519))

(assert (=> b!605659 m!582519))

(declare-fun m!582521 () Bool)

(assert (=> b!605659 m!582521))

(assert (=> b!605661 m!582519))

(declare-fun m!582523 () Bool)

(assert (=> b!605661 m!582523))

(declare-fun m!582525 () Bool)

(assert (=> b!605661 m!582525))

(assert (=> b!605661 m!582519))

(declare-fun m!582527 () Bool)

(assert (=> b!605661 m!582527))

(assert (=> b!605411 d!87633))

(declare-fun b!605662 () Bool)

(declare-fun c!68626 () Bool)

(declare-fun lt!276361 () (_ BitVec 64))

(assert (=> b!605662 (= c!68626 (= lt!276361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!346671 () SeekEntryResult!6318)

(declare-fun e!346669 () SeekEntryResult!6318)

(assert (=> b!605662 (= e!346671 e!346669)))

(declare-fun b!605663 () Bool)

(assert (=> b!605663 (= e!346669 (MissingVacant!6318 vacantSpotIndex!68))))

(declare-fun b!605664 () Bool)

(declare-fun e!346670 () SeekEntryResult!6318)

(assert (=> b!605664 (= e!346670 Undefined!6318)))

(declare-fun b!605665 () Bool)

(assert (=> b!605665 (= e!346670 e!346671)))

(declare-fun c!68628 () Bool)

(assert (=> b!605665 (= c!68628 (= lt!276361 (select (arr!17878 a!2986) j!136)))))

(declare-fun b!605666 () Bool)

(assert (=> b!605666 (= e!346671 (Found!6318 index!984))))

(declare-fun lt!276362 () SeekEntryResult!6318)

(declare-fun d!87647 () Bool)

(assert (=> d!87647 (and (or ((_ is Undefined!6318) lt!276362) (not ((_ is Found!6318) lt!276362)) (and (bvsge (index!27539 lt!276362) #b00000000000000000000000000000000) (bvslt (index!27539 lt!276362) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276362) ((_ is Found!6318) lt!276362) (not ((_ is MissingVacant!6318) lt!276362)) (not (= (index!27541 lt!276362) vacantSpotIndex!68)) (and (bvsge (index!27541 lt!276362) #b00000000000000000000000000000000) (bvslt (index!27541 lt!276362) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276362) (ite ((_ is Found!6318) lt!276362) (= (select (arr!17878 a!2986) (index!27539 lt!276362)) (select (arr!17878 a!2986) j!136)) (and ((_ is MissingVacant!6318) lt!276362) (= (index!27541 lt!276362) vacantSpotIndex!68) (= (select (arr!17878 a!2986) (index!27541 lt!276362)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87647 (= lt!276362 e!346670)))

(declare-fun c!68627 () Bool)

(assert (=> d!87647 (= c!68627 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87647 (= lt!276361 (select (arr!17878 a!2986) index!984))))

(assert (=> d!87647 (validMask!0 mask!3053)))

(assert (=> d!87647 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053) lt!276362)))

(declare-fun b!605667 () Bool)

(assert (=> b!605667 (= e!346669 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17878 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!87647 c!68627) b!605664))

(assert (= (and d!87647 (not c!68627)) b!605665))

(assert (= (and b!605665 c!68628) b!605666))

(assert (= (and b!605665 (not c!68628)) b!605662))

(assert (= (and b!605662 c!68626) b!605663))

(assert (= (and b!605662 (not c!68626)) b!605667))

(declare-fun m!582529 () Bool)

(assert (=> d!87647 m!582529))

(declare-fun m!582531 () Bool)

(assert (=> d!87647 m!582531))

(assert (=> d!87647 m!582275))

(assert (=> d!87647 m!582315))

(assert (=> b!605667 m!582263))

(assert (=> b!605667 m!582263))

(assert (=> b!605667 m!582255))

(declare-fun m!582533 () Bool)

(assert (=> b!605667 m!582533))

(assert (=> b!605404 d!87647))

(declare-fun b!605668 () Bool)

(declare-fun e!346674 () Bool)

(declare-fun call!33052 () Bool)

(assert (=> b!605668 (= e!346674 call!33052)))

(declare-fun b!605669 () Bool)

(assert (=> b!605669 (= e!346674 call!33052)))

(declare-fun d!87649 () Bool)

(declare-fun res!389145 () Bool)

(declare-fun e!346673 () Bool)

(assert (=> d!87649 (=> res!389145 e!346673)))

(assert (=> d!87649 (= res!389145 (bvsge #b00000000000000000000000000000000 (size!18242 a!2986)))))

(assert (=> d!87649 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11916) e!346673)))

(declare-fun b!605670 () Bool)

(declare-fun e!346675 () Bool)

(assert (=> b!605670 (= e!346675 (contains!2994 Nil!11916 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605671 () Bool)

(declare-fun e!346672 () Bool)

(assert (=> b!605671 (= e!346673 e!346672)))

(declare-fun res!389146 () Bool)

(assert (=> b!605671 (=> (not res!389146) (not e!346672))))

(assert (=> b!605671 (= res!389146 (not e!346675))))

(declare-fun res!389144 () Bool)

(assert (=> b!605671 (=> (not res!389144) (not e!346675))))

(assert (=> b!605671 (= res!389144 (validKeyInArray!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!605672 () Bool)

(assert (=> b!605672 (= e!346672 e!346674)))

(declare-fun c!68629 () Bool)

(assert (=> b!605672 (= c!68629 (validKeyInArray!0 (select (arr!17878 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33049 () Bool)

(assert (=> bm!33049 (= call!33052 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68629 (Cons!11915 (select (arr!17878 a!2986) #b00000000000000000000000000000000) Nil!11916) Nil!11916)))))

(assert (= (and d!87649 (not res!389145)) b!605671))

(assert (= (and b!605671 res!389144) b!605670))

(assert (= (and b!605671 res!389146) b!605672))

(assert (= (and b!605672 c!68629) b!605668))

(assert (= (and b!605672 (not c!68629)) b!605669))

(assert (= (or b!605668 b!605669) bm!33049))

(assert (=> b!605670 m!582519))

(assert (=> b!605670 m!582519))

(declare-fun m!582535 () Bool)

(assert (=> b!605670 m!582535))

(assert (=> b!605671 m!582519))

(assert (=> b!605671 m!582519))

(assert (=> b!605671 m!582521))

(assert (=> b!605672 m!582519))

(assert (=> b!605672 m!582519))

(assert (=> b!605672 m!582521))

(assert (=> bm!33049 m!582519))

(declare-fun m!582537 () Bool)

(assert (=> bm!33049 m!582537))

(assert (=> b!605415 d!87649))

(declare-fun d!87651 () Bool)

(assert (=> d!87651 (= (validKeyInArray!0 (select (arr!17878 a!2986) j!136)) (and (not (= (select (arr!17878 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17878 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605403 d!87651))

(declare-fun d!87653 () Bool)

(assert (=> d!87653 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!605407 d!87653))

(declare-fun b!605712 () Bool)

(declare-fun e!346697 () SeekEntryResult!6318)

(declare-fun lt!276387 () SeekEntryResult!6318)

(assert (=> b!605712 (= e!346697 (Found!6318 (index!27540 lt!276387)))))

(declare-fun b!605713 () Bool)

(declare-fun e!346699 () SeekEntryResult!6318)

(assert (=> b!605713 (= e!346699 Undefined!6318)))

(declare-fun b!605714 () Bool)

(declare-fun e!346698 () SeekEntryResult!6318)

(assert (=> b!605714 (= e!346698 (MissingZero!6318 (index!27540 lt!276387)))))

(declare-fun d!87655 () Bool)

(declare-fun lt!276386 () SeekEntryResult!6318)

(assert (=> d!87655 (and (or ((_ is Undefined!6318) lt!276386) (not ((_ is Found!6318) lt!276386)) (and (bvsge (index!27539 lt!276386) #b00000000000000000000000000000000) (bvslt (index!27539 lt!276386) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276386) ((_ is Found!6318) lt!276386) (not ((_ is MissingZero!6318) lt!276386)) (and (bvsge (index!27538 lt!276386) #b00000000000000000000000000000000) (bvslt (index!27538 lt!276386) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276386) ((_ is Found!6318) lt!276386) ((_ is MissingZero!6318) lt!276386) (not ((_ is MissingVacant!6318) lt!276386)) (and (bvsge (index!27541 lt!276386) #b00000000000000000000000000000000) (bvslt (index!27541 lt!276386) (size!18242 a!2986)))) (or ((_ is Undefined!6318) lt!276386) (ite ((_ is Found!6318) lt!276386) (= (select (arr!17878 a!2986) (index!27539 lt!276386)) k0!1786) (ite ((_ is MissingZero!6318) lt!276386) (= (select (arr!17878 a!2986) (index!27538 lt!276386)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6318) lt!276386) (= (select (arr!17878 a!2986) (index!27541 lt!276386)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87655 (= lt!276386 e!346699)))

(declare-fun c!68648 () Bool)

(assert (=> d!87655 (= c!68648 (and ((_ is Intermediate!6318) lt!276387) (undefined!7130 lt!276387)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37246 (_ BitVec 32)) SeekEntryResult!6318)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87655 (= lt!276387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87655 (validMask!0 mask!3053)))

(assert (=> d!87655 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!276386)))

(declare-fun b!605715 () Bool)

(assert (=> b!605715 (= e!346698 (seekKeyOrZeroReturnVacant!0 (x!56336 lt!276387) (index!27540 lt!276387) (index!27540 lt!276387) k0!1786 a!2986 mask!3053))))

(declare-fun b!605716 () Bool)

(assert (=> b!605716 (= e!346699 e!346697)))

(declare-fun lt!276388 () (_ BitVec 64))

(assert (=> b!605716 (= lt!276388 (select (arr!17878 a!2986) (index!27540 lt!276387)))))

(declare-fun c!68649 () Bool)

(assert (=> b!605716 (= c!68649 (= lt!276388 k0!1786))))

(declare-fun b!605717 () Bool)

(declare-fun c!68650 () Bool)

(assert (=> b!605717 (= c!68650 (= lt!276388 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!605717 (= e!346697 e!346698)))

(assert (= (and d!87655 c!68648) b!605713))

(assert (= (and d!87655 (not c!68648)) b!605716))

(assert (= (and b!605716 c!68649) b!605712))

(assert (= (and b!605716 (not c!68649)) b!605717))

(assert (= (and b!605717 c!68650) b!605714))

(assert (= (and b!605717 (not c!68650)) b!605715))

(declare-fun m!582565 () Bool)

(assert (=> d!87655 m!582565))

(declare-fun m!582567 () Bool)

(assert (=> d!87655 m!582567))

(assert (=> d!87655 m!582315))

(declare-fun m!582569 () Bool)

(assert (=> d!87655 m!582569))

(declare-fun m!582571 () Bool)

(assert (=> d!87655 m!582571))

(declare-fun m!582573 () Bool)

(assert (=> d!87655 m!582573))

(assert (=> d!87655 m!582565))

(declare-fun m!582575 () Bool)

(assert (=> b!605715 m!582575))

(declare-fun m!582577 () Bool)

(assert (=> b!605716 m!582577))

(assert (=> b!605410 d!87655))

(declare-fun d!87667 () Bool)

(declare-fun res!389150 () Bool)

(declare-fun e!346700 () Bool)

(assert (=> d!87667 (=> res!389150 e!346700)))

(assert (=> d!87667 (= res!389150 (= (select (arr!17878 lt!276253) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17878 a!2986) j!136)))))

(assert (=> d!87667 (= (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!346700)))

(declare-fun b!605718 () Bool)

(declare-fun e!346701 () Bool)

(assert (=> b!605718 (= e!346700 e!346701)))

(declare-fun res!389151 () Bool)

(assert (=> b!605718 (=> (not res!389151) (not e!346701))))

(assert (=> b!605718 (= res!389151 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18242 lt!276253)))))

(declare-fun b!605719 () Bool)

(assert (=> b!605719 (= e!346701 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87667 (not res!389150)) b!605718))

(assert (= (and b!605718 res!389151) b!605719))

(declare-fun m!582579 () Bool)

(assert (=> d!87667 m!582579))

(assert (=> b!605719 m!582255))

(declare-fun m!582581 () Bool)

(assert (=> b!605719 m!582581))

(assert (=> b!605420 d!87667))

(declare-fun d!87669 () Bool)

(assert (=> d!87669 (arrayContainsKey!0 lt!276253 (select (arr!17878 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!276389 () Unit!19288)

(assert (=> d!87669 (= lt!276389 (choose!114 lt!276253 (select (arr!17878 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!87669 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!87669 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!276253 (select (arr!17878 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!276389)))

(declare-fun bs!18526 () Bool)

(assert (= bs!18526 d!87669))

(assert (=> bs!18526 m!582255))

(assert (=> bs!18526 m!582283))

(assert (=> bs!18526 m!582255))

(declare-fun m!582583 () Bool)

(assert (=> bs!18526 m!582583))

(assert (=> b!605420 d!87669))

(assert (=> b!605420 d!87631))

(declare-fun d!87671 () Bool)

(declare-fun res!389152 () Bool)

(declare-fun e!346702 () Bool)

(assert (=> d!87671 (=> res!389152 e!346702)))

(assert (=> d!87671 (= res!389152 (= (select (arr!17878 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87671 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!346702)))

(declare-fun b!605720 () Bool)

(declare-fun e!346703 () Bool)

(assert (=> b!605720 (= e!346702 e!346703)))

(declare-fun res!389153 () Bool)

(assert (=> b!605720 (=> (not res!389153) (not e!346703))))

(assert (=> b!605720 (= res!389153 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18242 a!2986)))))

(declare-fun b!605721 () Bool)

(assert (=> b!605721 (= e!346703 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87671 (not res!389152)) b!605720))

(assert (= (and b!605720 res!389153) b!605721))

(assert (=> d!87671 m!582519))

(declare-fun m!582585 () Bool)

(assert (=> b!605721 m!582585))

(assert (=> b!605398 d!87671))

(assert (=> b!605419 d!87603))

(declare-fun d!87673 () Bool)

(assert (=> d!87673 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55254 d!87673))

(declare-fun d!87681 () Bool)

(assert (=> d!87681 (= (array_inv!13674 a!2986) (bvsge (size!18242 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55254 d!87681))

(check-sat (not b!605604) (not b!605551) (not b!605589) (not b!605715) (not b!605661) (not b!605587) (not b!605670) (not bm!33048) (not b!605605) (not d!87607) (not b!605667) (not d!87669) (not b!605719) (not b!605516) (not b!605659) (not b!605554) (not d!87591) (not b!605672) (not d!87611) (not bm!33041) (not b!605671) (not bm!33049) (not d!87647) (not d!87601) (not b!605522) (not bm!33042) (not b!605588) (not b!605492) (not b!605608) (not d!87617) (not b!605606) (not d!87619) (not d!87655) (not b!605721) (not d!87593) (not d!87599) (not b!605538) (not b!605510) (not d!87595))
(check-sat)
