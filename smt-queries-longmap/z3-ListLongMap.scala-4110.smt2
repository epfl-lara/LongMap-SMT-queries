; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56160 () Bool)

(assert start!56160)

(declare-fun b!621273 () Bool)

(declare-fun e!356343 () Bool)

(declare-datatypes ((SeekEntryResult!6501 0))(
  ( (MissingZero!6501 (index!28288 (_ BitVec 32))) (Found!6501 (index!28289 (_ BitVec 32))) (Intermediate!6501 (undefined!7313 Bool) (index!28290 (_ BitVec 32)) (x!57061 (_ BitVec 32))) (Undefined!6501) (MissingVacant!6501 (index!28291 (_ BitVec 32))) )
))
(declare-fun lt!287422 () SeekEntryResult!6501)

(declare-fun lt!287428 () SeekEntryResult!6501)

(assert (=> b!621273 (= e!356343 (= lt!287422 lt!287428))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37630 0))(
  ( (array!37631 (arr!18061 (Array (_ BitVec 32) (_ BitVec 64))) (size!18425 (_ BitVec 32))) )
))
(declare-fun lt!287425 () array!37630)

(declare-fun b!621274 () Bool)

(declare-fun e!356335 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37630)

(declare-fun arrayContainsKey!0 (array!37630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621274 (= e!356335 (arrayContainsKey!0 lt!287425 (select (arr!18061 a!2986) j!136) index!984))))

(declare-fun b!621275 () Bool)

(declare-datatypes ((Unit!20738 0))(
  ( (Unit!20739) )
))
(declare-fun e!356346 () Unit!20738)

(declare-fun Unit!20740 () Unit!20738)

(assert (=> b!621275 (= e!356346 Unit!20740)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun res!400357 () Bool)

(assert (=> b!621275 (= res!400357 (= (select (store (arr!18061 a!2986) i!1108 k0!1786) index!984) (select (arr!18061 a!2986) j!136)))))

(declare-fun e!356333 () Bool)

(assert (=> b!621275 (=> (not res!400357) (not e!356333))))

(assert (=> b!621275 e!356333))

(declare-fun c!70827 () Bool)

(assert (=> b!621275 (= c!70827 (bvslt j!136 index!984))))

(declare-fun lt!287433 () Unit!20738)

(declare-fun e!356342 () Unit!20738)

(assert (=> b!621275 (= lt!287433 e!356342)))

(declare-fun c!70826 () Bool)

(assert (=> b!621275 (= c!70826 (bvslt index!984 j!136))))

(declare-fun lt!287426 () Unit!20738)

(declare-fun e!356337 () Unit!20738)

(assert (=> b!621275 (= lt!287426 e!356337)))

(assert (=> b!621275 false))

(declare-fun b!621276 () Bool)

(declare-fun e!356339 () Bool)

(assert (=> b!621276 (= e!356339 (not true))))

(declare-fun lt!287436 () Unit!20738)

(assert (=> b!621276 (= lt!287436 e!356346)))

(declare-fun c!70828 () Bool)

(declare-fun lt!287434 () SeekEntryResult!6501)

(assert (=> b!621276 (= c!70828 (= lt!287434 (Found!6501 index!984)))))

(declare-fun lt!287421 () Unit!20738)

(declare-fun e!356340 () Unit!20738)

(assert (=> b!621276 (= lt!287421 e!356340)))

(declare-fun c!70829 () Bool)

(assert (=> b!621276 (= c!70829 (= lt!287434 Undefined!6501))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287432 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37630 (_ BitVec 32)) SeekEntryResult!6501)

(assert (=> b!621276 (= lt!287434 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287432 lt!287425 mask!3053))))

(assert (=> b!621276 e!356343))

(declare-fun res!400364 () Bool)

(assert (=> b!621276 (=> (not res!400364) (not e!356343))))

(declare-fun lt!287418 () (_ BitVec 32))

(assert (=> b!621276 (= res!400364 (= lt!287428 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287418 vacantSpotIndex!68 lt!287432 lt!287425 mask!3053)))))

(assert (=> b!621276 (= lt!287428 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287418 vacantSpotIndex!68 (select (arr!18061 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621276 (= lt!287432 (select (store (arr!18061 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287420 () Unit!20738)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37630 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20738)

(assert (=> b!621276 (= lt!287420 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287418 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621276 (= lt!287418 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621277 () Bool)

(declare-fun res!400369 () Bool)

(declare-fun e!356344 () Bool)

(assert (=> b!621277 (=> (not res!400369) (not e!356344))))

(assert (=> b!621277 (= res!400369 (and (= (size!18425 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18425 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18425 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621278 () Bool)

(declare-fun res!400355 () Bool)

(assert (=> b!621278 (=> (not res!400355) (not e!356344))))

(assert (=> b!621278 (= res!400355 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621279 () Bool)

(declare-fun res!400365 () Bool)

(declare-fun e!356341 () Bool)

(assert (=> b!621279 (=> (not res!400365) (not e!356341))))

(declare-datatypes ((List!12102 0))(
  ( (Nil!12099) (Cons!12098 (h!13143 (_ BitVec 64)) (t!18330 List!12102)) )
))
(declare-fun arrayNoDuplicates!0 (array!37630 (_ BitVec 32) List!12102) Bool)

(assert (=> b!621279 (= res!400365 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12099))))

(declare-fun b!621280 () Bool)

(declare-fun Unit!20741 () Unit!20738)

(assert (=> b!621280 (= e!356340 Unit!20741)))

(assert (=> b!621280 false))

(declare-fun b!621281 () Bool)

(declare-fun res!400358 () Bool)

(assert (=> b!621281 (= res!400358 (bvsge j!136 index!984))))

(declare-fun e!356336 () Bool)

(assert (=> b!621281 (=> res!400358 e!356336)))

(assert (=> b!621281 (= e!356333 e!356336)))

(declare-fun b!621283 () Bool)

(declare-fun Unit!20742 () Unit!20738)

(assert (=> b!621283 (= e!356342 Unit!20742)))

(declare-fun b!621284 () Bool)

(assert (=> b!621284 false))

(declare-fun lt!287427 () Unit!20738)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37630 (_ BitVec 64) (_ BitVec 32) List!12102) Unit!20738)

(assert (=> b!621284 (= lt!287427 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287425 (select (arr!18061 a!2986) j!136) index!984 Nil!12099))))

(assert (=> b!621284 (arrayNoDuplicates!0 lt!287425 index!984 Nil!12099)))

(declare-fun lt!287435 () Unit!20738)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37630 (_ BitVec 32) (_ BitVec 32)) Unit!20738)

(assert (=> b!621284 (= lt!287435 (lemmaNoDuplicateFromThenFromBigger!0 lt!287425 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621284 (arrayNoDuplicates!0 lt!287425 #b00000000000000000000000000000000 Nil!12099)))

(declare-fun lt!287424 () Unit!20738)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37630 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12102) Unit!20738)

(assert (=> b!621284 (= lt!287424 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12099))))

(assert (=> b!621284 (arrayContainsKey!0 lt!287425 (select (arr!18061 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287429 () Unit!20738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37630 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20738)

(assert (=> b!621284 (= lt!287429 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287425 (select (arr!18061 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356334 () Bool)

(assert (=> b!621284 e!356334))

(declare-fun res!400360 () Bool)

(assert (=> b!621284 (=> (not res!400360) (not e!356334))))

(assert (=> b!621284 (= res!400360 (arrayContainsKey!0 lt!287425 (select (arr!18061 a!2986) j!136) j!136))))

(declare-fun Unit!20743 () Unit!20738)

(assert (=> b!621284 (= e!356337 Unit!20743)))

(declare-fun b!621285 () Bool)

(declare-fun e!356345 () Bool)

(assert (=> b!621285 (= e!356345 e!356339)))

(declare-fun res!400362 () Bool)

(assert (=> b!621285 (=> (not res!400362) (not e!356339))))

(assert (=> b!621285 (= res!400362 (and (= lt!287422 (Found!6501 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18061 a!2986) index!984) (select (arr!18061 a!2986) j!136))) (not (= (select (arr!18061 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621285 (= lt!287422 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18061 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621286 () Bool)

(declare-fun res!400356 () Bool)

(assert (=> b!621286 (= res!400356 (arrayContainsKey!0 lt!287425 (select (arr!18061 a!2986) j!136) j!136))))

(assert (=> b!621286 (=> (not res!400356) (not e!356335))))

(assert (=> b!621286 (= e!356336 e!356335)))

(declare-fun b!621287 () Bool)

(declare-fun Unit!20744 () Unit!20738)

(assert (=> b!621287 (= e!356346 Unit!20744)))

(declare-fun b!621288 () Bool)

(assert (=> b!621288 (= e!356334 (arrayContainsKey!0 lt!287425 (select (arr!18061 a!2986) j!136) index!984))))

(declare-fun b!621289 () Bool)

(declare-fun res!400367 () Bool)

(assert (=> b!621289 (=> (not res!400367) (not e!356341))))

(assert (=> b!621289 (= res!400367 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18061 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621290 () Bool)

(declare-fun Unit!20745 () Unit!20738)

(assert (=> b!621290 (= e!356340 Unit!20745)))

(declare-fun b!621291 () Bool)

(assert (=> b!621291 (= e!356341 e!356345)))

(declare-fun res!400370 () Bool)

(assert (=> b!621291 (=> (not res!400370) (not e!356345))))

(assert (=> b!621291 (= res!400370 (= (select (store (arr!18061 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621291 (= lt!287425 (array!37631 (store (arr!18061 a!2986) i!1108 k0!1786) (size!18425 a!2986)))))

(declare-fun b!621292 () Bool)

(declare-fun res!400361 () Bool)

(assert (=> b!621292 (=> (not res!400361) (not e!356344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621292 (= res!400361 (validKeyInArray!0 (select (arr!18061 a!2986) j!136)))))

(declare-fun b!621293 () Bool)

(assert (=> b!621293 (= e!356344 e!356341)))

(declare-fun res!400368 () Bool)

(assert (=> b!621293 (=> (not res!400368) (not e!356341))))

(declare-fun lt!287431 () SeekEntryResult!6501)

(assert (=> b!621293 (= res!400368 (or (= lt!287431 (MissingZero!6501 i!1108)) (= lt!287431 (MissingVacant!6501 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37630 (_ BitVec 32)) SeekEntryResult!6501)

(assert (=> b!621293 (= lt!287431 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!400366 () Bool)

(assert (=> start!56160 (=> (not res!400366) (not e!356344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56160 (= res!400366 (validMask!0 mask!3053))))

(assert (=> start!56160 e!356344))

(assert (=> start!56160 true))

(declare-fun array_inv!13857 (array!37630) Bool)

(assert (=> start!56160 (array_inv!13857 a!2986)))

(declare-fun b!621282 () Bool)

(assert (=> b!621282 false))

(declare-fun lt!287419 () Unit!20738)

(assert (=> b!621282 (= lt!287419 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287425 (select (arr!18061 a!2986) j!136) j!136 Nil!12099))))

(assert (=> b!621282 (arrayNoDuplicates!0 lt!287425 j!136 Nil!12099)))

(declare-fun lt!287423 () Unit!20738)

(assert (=> b!621282 (= lt!287423 (lemmaNoDuplicateFromThenFromBigger!0 lt!287425 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621282 (arrayNoDuplicates!0 lt!287425 #b00000000000000000000000000000000 Nil!12099)))

(declare-fun lt!287437 () Unit!20738)

(assert (=> b!621282 (= lt!287437 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12099))))

(assert (=> b!621282 (arrayContainsKey!0 lt!287425 (select (arr!18061 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287430 () Unit!20738)

(assert (=> b!621282 (= lt!287430 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287425 (select (arr!18061 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20746 () Unit!20738)

(assert (=> b!621282 (= e!356342 Unit!20746)))

(declare-fun b!621294 () Bool)

(declare-fun Unit!20747 () Unit!20738)

(assert (=> b!621294 (= e!356337 Unit!20747)))

(declare-fun b!621295 () Bool)

(declare-fun res!400363 () Bool)

(assert (=> b!621295 (=> (not res!400363) (not e!356341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37630 (_ BitVec 32)) Bool)

(assert (=> b!621295 (= res!400363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621296 () Bool)

(declare-fun res!400359 () Bool)

(assert (=> b!621296 (=> (not res!400359) (not e!356344))))

(assert (=> b!621296 (= res!400359 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56160 res!400366) b!621277))

(assert (= (and b!621277 res!400369) b!621292))

(assert (= (and b!621292 res!400361) b!621296))

(assert (= (and b!621296 res!400359) b!621278))

(assert (= (and b!621278 res!400355) b!621293))

(assert (= (and b!621293 res!400368) b!621295))

(assert (= (and b!621295 res!400363) b!621279))

(assert (= (and b!621279 res!400365) b!621289))

(assert (= (and b!621289 res!400367) b!621291))

(assert (= (and b!621291 res!400370) b!621285))

(assert (= (and b!621285 res!400362) b!621276))

(assert (= (and b!621276 res!400364) b!621273))

(assert (= (and b!621276 c!70829) b!621280))

(assert (= (and b!621276 (not c!70829)) b!621290))

(assert (= (and b!621276 c!70828) b!621275))

(assert (= (and b!621276 (not c!70828)) b!621287))

(assert (= (and b!621275 res!400357) b!621281))

(assert (= (and b!621281 (not res!400358)) b!621286))

(assert (= (and b!621286 res!400356) b!621274))

(assert (= (and b!621275 c!70827) b!621282))

(assert (= (and b!621275 (not c!70827)) b!621283))

(assert (= (and b!621275 c!70826) b!621284))

(assert (= (and b!621275 (not c!70826)) b!621294))

(assert (= (and b!621284 res!400360) b!621288))

(declare-fun m!597171 () Bool)

(assert (=> b!621295 m!597171))

(declare-fun m!597173 () Bool)

(assert (=> b!621296 m!597173))

(declare-fun m!597175 () Bool)

(assert (=> b!621274 m!597175))

(assert (=> b!621274 m!597175))

(declare-fun m!597177 () Bool)

(assert (=> b!621274 m!597177))

(assert (=> b!621292 m!597175))

(assert (=> b!621292 m!597175))

(declare-fun m!597179 () Bool)

(assert (=> b!621292 m!597179))

(assert (=> b!621286 m!597175))

(assert (=> b!621286 m!597175))

(declare-fun m!597181 () Bool)

(assert (=> b!621286 m!597181))

(declare-fun m!597183 () Bool)

(assert (=> start!56160 m!597183))

(declare-fun m!597185 () Bool)

(assert (=> start!56160 m!597185))

(declare-fun m!597187 () Bool)

(assert (=> b!621275 m!597187))

(declare-fun m!597189 () Bool)

(assert (=> b!621275 m!597189))

(assert (=> b!621275 m!597175))

(declare-fun m!597191 () Bool)

(assert (=> b!621284 m!597191))

(assert (=> b!621284 m!597175))

(assert (=> b!621284 m!597175))

(declare-fun m!597193 () Bool)

(assert (=> b!621284 m!597193))

(declare-fun m!597195 () Bool)

(assert (=> b!621284 m!597195))

(declare-fun m!597197 () Bool)

(assert (=> b!621284 m!597197))

(assert (=> b!621284 m!597175))

(declare-fun m!597199 () Bool)

(assert (=> b!621284 m!597199))

(assert (=> b!621284 m!597175))

(declare-fun m!597201 () Bool)

(assert (=> b!621284 m!597201))

(assert (=> b!621284 m!597175))

(assert (=> b!621284 m!597181))

(declare-fun m!597203 () Bool)

(assert (=> b!621284 m!597203))

(declare-fun m!597205 () Bool)

(assert (=> b!621285 m!597205))

(assert (=> b!621285 m!597175))

(assert (=> b!621285 m!597175))

(declare-fun m!597207 () Bool)

(assert (=> b!621285 m!597207))

(declare-fun m!597209 () Bool)

(assert (=> b!621293 m!597209))

(assert (=> b!621282 m!597191))

(assert (=> b!621282 m!597175))

(assert (=> b!621282 m!597175))

(declare-fun m!597211 () Bool)

(assert (=> b!621282 m!597211))

(assert (=> b!621282 m!597175))

(declare-fun m!597213 () Bool)

(assert (=> b!621282 m!597213))

(declare-fun m!597215 () Bool)

(assert (=> b!621282 m!597215))

(assert (=> b!621282 m!597203))

(assert (=> b!621282 m!597175))

(declare-fun m!597217 () Bool)

(assert (=> b!621282 m!597217))

(declare-fun m!597219 () Bool)

(assert (=> b!621282 m!597219))

(declare-fun m!597221 () Bool)

(assert (=> b!621278 m!597221))

(declare-fun m!597223 () Bool)

(assert (=> b!621279 m!597223))

(assert (=> b!621288 m!597175))

(assert (=> b!621288 m!597175))

(assert (=> b!621288 m!597177))

(assert (=> b!621291 m!597187))

(declare-fun m!597225 () Bool)

(assert (=> b!621291 m!597225))

(declare-fun m!597227 () Bool)

(assert (=> b!621289 m!597227))

(declare-fun m!597229 () Bool)

(assert (=> b!621276 m!597229))

(declare-fun m!597231 () Bool)

(assert (=> b!621276 m!597231))

(assert (=> b!621276 m!597175))

(assert (=> b!621276 m!597175))

(declare-fun m!597233 () Bool)

(assert (=> b!621276 m!597233))

(assert (=> b!621276 m!597187))

(declare-fun m!597235 () Bool)

(assert (=> b!621276 m!597235))

(declare-fun m!597237 () Bool)

(assert (=> b!621276 m!597237))

(declare-fun m!597239 () Bool)

(assert (=> b!621276 m!597239))

(check-sat (not b!621284) (not b!621296) (not b!621276) (not b!621279) (not b!621274) (not b!621293) (not b!621285) (not start!56160) (not b!621286) (not b!621288) (not b!621295) (not b!621282) (not b!621278) (not b!621292))
(check-sat)
