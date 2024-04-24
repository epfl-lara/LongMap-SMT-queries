; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57330 () Bool)

(assert start!57330)

(declare-fun b!634304 () Bool)

(declare-fun res!410289 () Bool)

(declare-fun e!362716 () Bool)

(assert (=> b!634304 (=> (not res!410289) (not e!362716))))

(declare-datatypes ((array!38178 0))(
  ( (array!38179 (arr!18316 (Array (_ BitVec 32) (_ BitVec 64))) (size!18680 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38178)

(declare-datatypes ((List!12264 0))(
  ( (Nil!12261) (Cons!12260 (h!13308 (_ BitVec 64)) (t!18484 List!12264)) )
))
(declare-fun arrayNoDuplicates!0 (array!38178 (_ BitVec 32) List!12264) Bool)

(assert (=> b!634304 (= res!410289 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12261))))

(declare-fun b!634305 () Bool)

(declare-datatypes ((Unit!21357 0))(
  ( (Unit!21358) )
))
(declare-fun e!362715 () Unit!21357)

(declare-fun Unit!21359 () Unit!21357)

(assert (=> b!634305 (= e!362715 Unit!21359)))

(declare-fun b!634306 () Bool)

(declare-fun e!362714 () Bool)

(declare-fun e!362724 () Bool)

(assert (=> b!634306 (= e!362714 e!362724)))

(declare-fun res!410284 () Bool)

(assert (=> b!634306 (=> (not res!410284) (not e!362724))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!293224 () array!38178)

(declare-fun arrayContainsKey!0 (array!38178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634306 (= res!410284 (arrayContainsKey!0 lt!293224 (select (arr!18316 a!2986) j!136) j!136))))

(declare-fun b!634307 () Bool)

(declare-fun e!362718 () Bool)

(assert (=> b!634307 (= e!362718 e!362714)))

(declare-fun res!410279 () Bool)

(assert (=> b!634307 (=> res!410279 e!362714)))

(declare-fun lt!293227 () (_ BitVec 64))

(declare-fun lt!293229 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!634307 (= res!410279 (or (not (= (select (arr!18316 a!2986) j!136) lt!293227)) (not (= (select (arr!18316 a!2986) j!136) lt!293229)) (bvsge j!136 index!984)))))

(declare-fun b!634308 () Bool)

(declare-fun e!362717 () Bool)

(declare-datatypes ((SeekEntryResult!6712 0))(
  ( (MissingZero!6712 (index!29147 (_ BitVec 32))) (Found!6712 (index!29148 (_ BitVec 32))) (Intermediate!6712 (undefined!7524 Bool) (index!29149 (_ BitVec 32)) (x!58040 (_ BitVec 32))) (Undefined!6712) (MissingVacant!6712 (index!29150 (_ BitVec 32))) )
))
(declare-fun lt!293231 () SeekEntryResult!6712)

(declare-fun lt!293228 () SeekEntryResult!6712)

(assert (=> b!634308 (= e!362717 (= lt!293231 lt!293228))))

(declare-fun b!634309 () Bool)

(declare-fun res!410276 () Bool)

(assert (=> b!634309 (=> (not res!410276) (not e!362716))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!634309 (= res!410276 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18316 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634310 () Bool)

(declare-fun res!410286 () Bool)

(assert (=> b!634310 (=> (not res!410286) (not e!362716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38178 (_ BitVec 32)) Bool)

(assert (=> b!634310 (= res!410286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634312 () Bool)

(declare-fun res!410275 () Bool)

(declare-fun e!362719 () Bool)

(assert (=> b!634312 (=> (not res!410275) (not e!362719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634312 (= res!410275 (validKeyInArray!0 (select (arr!18316 a!2986) j!136)))))

(declare-fun b!634313 () Bool)

(declare-fun res!410282 () Bool)

(assert (=> b!634313 (=> (not res!410282) (not e!362719))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!634313 (= res!410282 (validKeyInArray!0 k0!1786))))

(declare-fun b!634314 () Bool)

(declare-fun res!410290 () Bool)

(assert (=> b!634314 (=> (not res!410290) (not e!362719))))

(assert (=> b!634314 (= res!410290 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634315 () Bool)

(declare-fun e!362720 () Bool)

(declare-fun e!362722 () Bool)

(assert (=> b!634315 (= e!362720 (not e!362722))))

(declare-fun res!410278 () Bool)

(assert (=> b!634315 (=> res!410278 e!362722)))

(declare-fun lt!293226 () SeekEntryResult!6712)

(assert (=> b!634315 (= res!410278 (not (= lt!293226 (Found!6712 index!984))))))

(declare-fun lt!293230 () Unit!21357)

(assert (=> b!634315 (= lt!293230 e!362715)))

(declare-fun c!72383 () Bool)

(assert (=> b!634315 (= c!72383 (= lt!293226 Undefined!6712))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38178 (_ BitVec 32)) SeekEntryResult!6712)

(assert (=> b!634315 (= lt!293226 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293227 lt!293224 mask!3053))))

(assert (=> b!634315 e!362717))

(declare-fun res!410288 () Bool)

(assert (=> b!634315 (=> (not res!410288) (not e!362717))))

(declare-fun lt!293233 () (_ BitVec 32))

(assert (=> b!634315 (= res!410288 (= lt!293228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 lt!293227 lt!293224 mask!3053)))))

(assert (=> b!634315 (= lt!293228 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!634315 (= lt!293227 (select (store (arr!18316 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293225 () Unit!21357)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21357)

(assert (=> b!634315 (= lt!293225 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634315 (= lt!293233 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!634316 () Bool)

(assert (=> b!634316 (= e!362719 e!362716)))

(declare-fun res!410283 () Bool)

(assert (=> b!634316 (=> (not res!410283) (not e!362716))))

(declare-fun lt!293232 () SeekEntryResult!6712)

(assert (=> b!634316 (= res!410283 (or (= lt!293232 (MissingZero!6712 i!1108)) (= lt!293232 (MissingVacant!6712 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38178 (_ BitVec 32)) SeekEntryResult!6712)

(assert (=> b!634316 (= lt!293232 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634317 () Bool)

(assert (=> b!634317 (= e!362724 (arrayContainsKey!0 lt!293224 (select (arr!18316 a!2986) j!136) index!984))))

(declare-fun b!634318 () Bool)

(declare-fun res!410281 () Bool)

(assert (=> b!634318 (=> (not res!410281) (not e!362719))))

(assert (=> b!634318 (= res!410281 (and (= (size!18680 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18680 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18680 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634319 () Bool)

(declare-fun e!362721 () Bool)

(assert (=> b!634319 (= e!362716 e!362721)))

(declare-fun res!410277 () Bool)

(assert (=> b!634319 (=> (not res!410277) (not e!362721))))

(assert (=> b!634319 (= res!410277 (= (select (store (arr!18316 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634319 (= lt!293224 (array!38179 (store (arr!18316 a!2986) i!1108 k0!1786) (size!18680 a!2986)))))

(declare-fun b!634311 () Bool)

(declare-fun Unit!21360 () Unit!21357)

(assert (=> b!634311 (= e!362715 Unit!21360)))

(assert (=> b!634311 false))

(declare-fun res!410280 () Bool)

(assert (=> start!57330 (=> (not res!410280) (not e!362719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57330 (= res!410280 (validMask!0 mask!3053))))

(assert (=> start!57330 e!362719))

(assert (=> start!57330 true))

(declare-fun array_inv!14175 (array!38178) Bool)

(assert (=> start!57330 (array_inv!14175 a!2986)))

(declare-fun b!634320 () Bool)

(assert (=> b!634320 (= e!362722 (or (not (= (select (arr!18316 a!2986) j!136) lt!293227)) (not (= (select (arr!18316 a!2986) j!136) lt!293229)) (bvsge j!136 index!984) (bvsge index!984 (size!18680 a!2986)) (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (size!18680 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!634320 e!362718))

(declare-fun res!410287 () Bool)

(assert (=> b!634320 (=> (not res!410287) (not e!362718))))

(assert (=> b!634320 (= res!410287 (= lt!293229 (select (arr!18316 a!2986) j!136)))))

(assert (=> b!634320 (= lt!293229 (select (store (arr!18316 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634321 () Bool)

(assert (=> b!634321 (= e!362721 e!362720)))

(declare-fun res!410285 () Bool)

(assert (=> b!634321 (=> (not res!410285) (not e!362720))))

(assert (=> b!634321 (= res!410285 (and (= lt!293231 (Found!6712 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18316 a!2986) index!984) (select (arr!18316 a!2986) j!136))) (not (= (select (arr!18316 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!634321 (= lt!293231 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57330 res!410280) b!634318))

(assert (= (and b!634318 res!410281) b!634312))

(assert (= (and b!634312 res!410275) b!634313))

(assert (= (and b!634313 res!410282) b!634314))

(assert (= (and b!634314 res!410290) b!634316))

(assert (= (and b!634316 res!410283) b!634310))

(assert (= (and b!634310 res!410286) b!634304))

(assert (= (and b!634304 res!410289) b!634309))

(assert (= (and b!634309 res!410276) b!634319))

(assert (= (and b!634319 res!410277) b!634321))

(assert (= (and b!634321 res!410285) b!634315))

(assert (= (and b!634315 res!410288) b!634308))

(assert (= (and b!634315 c!72383) b!634311))

(assert (= (and b!634315 (not c!72383)) b!634305))

(assert (= (and b!634315 (not res!410278)) b!634320))

(assert (= (and b!634320 res!410287) b!634307))

(assert (= (and b!634307 (not res!410279)) b!634306))

(assert (= (and b!634306 res!410284) b!634317))

(declare-fun m!609199 () Bool)

(assert (=> b!634317 m!609199))

(assert (=> b!634317 m!609199))

(declare-fun m!609201 () Bool)

(assert (=> b!634317 m!609201))

(declare-fun m!609203 () Bool)

(assert (=> start!57330 m!609203))

(declare-fun m!609205 () Bool)

(assert (=> start!57330 m!609205))

(declare-fun m!609207 () Bool)

(assert (=> b!634310 m!609207))

(declare-fun m!609209 () Bool)

(assert (=> b!634319 m!609209))

(declare-fun m!609211 () Bool)

(assert (=> b!634319 m!609211))

(declare-fun m!609213 () Bool)

(assert (=> b!634309 m!609213))

(declare-fun m!609215 () Bool)

(assert (=> b!634321 m!609215))

(assert (=> b!634321 m!609199))

(assert (=> b!634321 m!609199))

(declare-fun m!609217 () Bool)

(assert (=> b!634321 m!609217))

(declare-fun m!609219 () Bool)

(assert (=> b!634314 m!609219))

(assert (=> b!634307 m!609199))

(assert (=> b!634312 m!609199))

(assert (=> b!634312 m!609199))

(declare-fun m!609221 () Bool)

(assert (=> b!634312 m!609221))

(assert (=> b!634306 m!609199))

(assert (=> b!634306 m!609199))

(declare-fun m!609223 () Bool)

(assert (=> b!634306 m!609223))

(declare-fun m!609225 () Bool)

(assert (=> b!634313 m!609225))

(declare-fun m!609227 () Bool)

(assert (=> b!634315 m!609227))

(assert (=> b!634315 m!609199))

(assert (=> b!634315 m!609209))

(assert (=> b!634315 m!609199))

(declare-fun m!609229 () Bool)

(assert (=> b!634315 m!609229))

(declare-fun m!609231 () Bool)

(assert (=> b!634315 m!609231))

(declare-fun m!609233 () Bool)

(assert (=> b!634315 m!609233))

(declare-fun m!609235 () Bool)

(assert (=> b!634315 m!609235))

(declare-fun m!609237 () Bool)

(assert (=> b!634315 m!609237))

(assert (=> b!634320 m!609199))

(assert (=> b!634320 m!609209))

(declare-fun m!609239 () Bool)

(assert (=> b!634320 m!609239))

(declare-fun m!609241 () Bool)

(assert (=> b!634304 m!609241))

(declare-fun m!609243 () Bool)

(assert (=> b!634316 m!609243))

(check-sat (not b!634316) (not b!634306) (not b!634312) (not b!634314) (not b!634304) (not b!634317) (not start!57330) (not b!634313) (not b!634315) (not b!634321) (not b!634310))
(check-sat)
(get-model)

(declare-fun b!634442 () Bool)

(declare-fun e!362798 () SeekEntryResult!6712)

(assert (=> b!634442 (= e!362798 Undefined!6712)))

(declare-fun b!634443 () Bool)

(declare-fun e!362799 () SeekEntryResult!6712)

(assert (=> b!634443 (= e!362798 e!362799)))

(declare-fun lt!293298 () (_ BitVec 64))

(declare-fun c!72396 () Bool)

(assert (=> b!634443 (= c!72396 (= lt!293298 (select (arr!18316 a!2986) j!136)))))

(declare-fun d!89727 () Bool)

(declare-fun lt!293299 () SeekEntryResult!6712)

(get-info :version)

(assert (=> d!89727 (and (or ((_ is Undefined!6712) lt!293299) (not ((_ is Found!6712) lt!293299)) (and (bvsge (index!29148 lt!293299) #b00000000000000000000000000000000) (bvslt (index!29148 lt!293299) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293299) ((_ is Found!6712) lt!293299) (not ((_ is MissingVacant!6712) lt!293299)) (not (= (index!29150 lt!293299) vacantSpotIndex!68)) (and (bvsge (index!29150 lt!293299) #b00000000000000000000000000000000) (bvslt (index!29150 lt!293299) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293299) (ite ((_ is Found!6712) lt!293299) (= (select (arr!18316 a!2986) (index!29148 lt!293299)) (select (arr!18316 a!2986) j!136)) (and ((_ is MissingVacant!6712) lt!293299) (= (index!29150 lt!293299) vacantSpotIndex!68) (= (select (arr!18316 a!2986) (index!29150 lt!293299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89727 (= lt!293299 e!362798)))

(declare-fun c!72398 () Bool)

(assert (=> d!89727 (= c!72398 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89727 (= lt!293298 (select (arr!18316 a!2986) index!984))))

(assert (=> d!89727 (validMask!0 mask!3053)))

(assert (=> d!89727 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053) lt!293299)))

(declare-fun b!634444 () Bool)

(assert (=> b!634444 (= e!362799 (Found!6712 index!984))))

(declare-fun b!634445 () Bool)

(declare-fun c!72397 () Bool)

(assert (=> b!634445 (= c!72397 (= lt!293298 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362797 () SeekEntryResult!6712)

(assert (=> b!634445 (= e!362799 e!362797)))

(declare-fun b!634446 () Bool)

(assert (=> b!634446 (= e!362797 (MissingVacant!6712 vacantSpotIndex!68))))

(declare-fun b!634447 () Bool)

(assert (=> b!634447 (= e!362797 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89727 c!72398) b!634442))

(assert (= (and d!89727 (not c!72398)) b!634443))

(assert (= (and b!634443 c!72396) b!634444))

(assert (= (and b!634443 (not c!72396)) b!634445))

(assert (= (and b!634445 c!72397) b!634446))

(assert (= (and b!634445 (not c!72397)) b!634447))

(declare-fun m!609337 () Bool)

(assert (=> d!89727 m!609337))

(declare-fun m!609339 () Bool)

(assert (=> d!89727 m!609339))

(assert (=> d!89727 m!609215))

(assert (=> d!89727 m!609203))

(declare-fun m!609341 () Bool)

(assert (=> b!634447 m!609341))

(assert (=> b!634447 m!609341))

(assert (=> b!634447 m!609199))

(declare-fun m!609343 () Bool)

(assert (=> b!634447 m!609343))

(assert (=> b!634321 d!89727))

(declare-fun b!634456 () Bool)

(declare-fun e!362808 () Bool)

(declare-fun call!33387 () Bool)

(assert (=> b!634456 (= e!362808 call!33387)))

(declare-fun d!89729 () Bool)

(declare-fun res!410392 () Bool)

(declare-fun e!362806 () Bool)

(assert (=> d!89729 (=> res!410392 e!362806)))

(assert (=> d!89729 (= res!410392 (bvsge #b00000000000000000000000000000000 (size!18680 a!2986)))))

(assert (=> d!89729 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!362806)))

(declare-fun b!634457 () Bool)

(declare-fun e!362807 () Bool)

(assert (=> b!634457 (= e!362806 e!362807)))

(declare-fun c!72401 () Bool)

(assert (=> b!634457 (= c!72401 (validKeyInArray!0 (select (arr!18316 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33384 () Bool)

(assert (=> bm!33384 (= call!33387 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!634458 () Bool)

(assert (=> b!634458 (= e!362807 e!362808)))

(declare-fun lt!293306 () (_ BitVec 64))

(assert (=> b!634458 (= lt!293306 (select (arr!18316 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!293308 () Unit!21357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38178 (_ BitVec 64) (_ BitVec 32)) Unit!21357)

(assert (=> b!634458 (= lt!293308 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!293306 #b00000000000000000000000000000000))))

(assert (=> b!634458 (arrayContainsKey!0 a!2986 lt!293306 #b00000000000000000000000000000000)))

(declare-fun lt!293307 () Unit!21357)

(assert (=> b!634458 (= lt!293307 lt!293308)))

(declare-fun res!410391 () Bool)

(assert (=> b!634458 (= res!410391 (= (seekEntryOrOpen!0 (select (arr!18316 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6712 #b00000000000000000000000000000000)))))

(assert (=> b!634458 (=> (not res!410391) (not e!362808))))

(declare-fun b!634459 () Bool)

(assert (=> b!634459 (= e!362807 call!33387)))

(assert (= (and d!89729 (not res!410392)) b!634457))

(assert (= (and b!634457 c!72401) b!634458))

(assert (= (and b!634457 (not c!72401)) b!634459))

(assert (= (and b!634458 res!410391) b!634456))

(assert (= (or b!634456 b!634459) bm!33384))

(declare-fun m!609345 () Bool)

(assert (=> b!634457 m!609345))

(assert (=> b!634457 m!609345))

(declare-fun m!609347 () Bool)

(assert (=> b!634457 m!609347))

(declare-fun m!609349 () Bool)

(assert (=> bm!33384 m!609349))

(assert (=> b!634458 m!609345))

(declare-fun m!609351 () Bool)

(assert (=> b!634458 m!609351))

(declare-fun m!609353 () Bool)

(assert (=> b!634458 m!609353))

(assert (=> b!634458 m!609345))

(declare-fun m!609355 () Bool)

(assert (=> b!634458 m!609355))

(assert (=> b!634310 d!89729))

(declare-fun d!89731 () Bool)

(declare-fun res!410397 () Bool)

(declare-fun e!362813 () Bool)

(assert (=> d!89731 (=> res!410397 e!362813)))

(assert (=> d!89731 (= res!410397 (= (select (arr!18316 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89731 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!362813)))

(declare-fun b!634464 () Bool)

(declare-fun e!362814 () Bool)

(assert (=> b!634464 (= e!362813 e!362814)))

(declare-fun res!410398 () Bool)

(assert (=> b!634464 (=> (not res!410398) (not e!362814))))

(assert (=> b!634464 (= res!410398 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18680 a!2986)))))

(declare-fun b!634465 () Bool)

(assert (=> b!634465 (= e!362814 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89731 (not res!410397)) b!634464))

(assert (= (and b!634464 res!410398) b!634465))

(assert (=> d!89731 m!609345))

(declare-fun m!609357 () Bool)

(assert (=> b!634465 m!609357))

(assert (=> b!634314 d!89731))

(declare-fun d!89735 () Bool)

(assert (=> d!89735 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634313 d!89735))

(declare-fun d!89737 () Bool)

(assert (=> d!89737 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57330 d!89737))

(declare-fun d!89751 () Bool)

(assert (=> d!89751 (= (array_inv!14175 a!2986) (bvsge (size!18680 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57330 d!89751))

(declare-fun d!89753 () Bool)

(assert (=> d!89753 (= (validKeyInArray!0 (select (arr!18316 a!2986) j!136)) (and (not (= (select (arr!18316 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18316 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!634312 d!89753))

(declare-fun d!89755 () Bool)

(declare-fun res!410418 () Bool)

(declare-fun e!362837 () Bool)

(assert (=> d!89755 (=> res!410418 e!362837)))

(assert (=> d!89755 (= res!410418 (= (select (arr!18316 lt!293224) index!984) (select (arr!18316 a!2986) j!136)))))

(assert (=> d!89755 (= (arrayContainsKey!0 lt!293224 (select (arr!18316 a!2986) j!136) index!984) e!362837)))

(declare-fun b!634491 () Bool)

(declare-fun e!362838 () Bool)

(assert (=> b!634491 (= e!362837 e!362838)))

(declare-fun res!410419 () Bool)

(assert (=> b!634491 (=> (not res!410419) (not e!362838))))

(assert (=> b!634491 (= res!410419 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18680 lt!293224)))))

(declare-fun b!634492 () Bool)

(assert (=> b!634492 (= e!362838 (arrayContainsKey!0 lt!293224 (select (arr!18316 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89755 (not res!410418)) b!634491))

(assert (= (and b!634491 res!410419) b!634492))

(declare-fun m!609377 () Bool)

(assert (=> d!89755 m!609377))

(assert (=> b!634492 m!609199))

(declare-fun m!609379 () Bool)

(assert (=> b!634492 m!609379))

(assert (=> b!634317 d!89755))

(declare-fun d!89757 () Bool)

(declare-fun res!410420 () Bool)

(declare-fun e!362839 () Bool)

(assert (=> d!89757 (=> res!410420 e!362839)))

(assert (=> d!89757 (= res!410420 (= (select (arr!18316 lt!293224) j!136) (select (arr!18316 a!2986) j!136)))))

(assert (=> d!89757 (= (arrayContainsKey!0 lt!293224 (select (arr!18316 a!2986) j!136) j!136) e!362839)))

(declare-fun b!634493 () Bool)

(declare-fun e!362840 () Bool)

(assert (=> b!634493 (= e!362839 e!362840)))

(declare-fun res!410421 () Bool)

(assert (=> b!634493 (=> (not res!410421) (not e!362840))))

(assert (=> b!634493 (= res!410421 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18680 lt!293224)))))

(declare-fun b!634494 () Bool)

(assert (=> b!634494 (= e!362840 (arrayContainsKey!0 lt!293224 (select (arr!18316 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89757 (not res!410420)) b!634493))

(assert (= (and b!634493 res!410421) b!634494))

(declare-fun m!609381 () Bool)

(assert (=> d!89757 m!609381))

(assert (=> b!634494 m!609199))

(declare-fun m!609383 () Bool)

(assert (=> b!634494 m!609383))

(assert (=> b!634306 d!89757))

(declare-fun d!89759 () Bool)

(declare-fun lt!293328 () SeekEntryResult!6712)

(assert (=> d!89759 (and (or ((_ is Undefined!6712) lt!293328) (not ((_ is Found!6712) lt!293328)) (and (bvsge (index!29148 lt!293328) #b00000000000000000000000000000000) (bvslt (index!29148 lt!293328) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293328) ((_ is Found!6712) lt!293328) (not ((_ is MissingZero!6712) lt!293328)) (and (bvsge (index!29147 lt!293328) #b00000000000000000000000000000000) (bvslt (index!29147 lt!293328) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293328) ((_ is Found!6712) lt!293328) ((_ is MissingZero!6712) lt!293328) (not ((_ is MissingVacant!6712) lt!293328)) (and (bvsge (index!29150 lt!293328) #b00000000000000000000000000000000) (bvslt (index!29150 lt!293328) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293328) (ite ((_ is Found!6712) lt!293328) (= (select (arr!18316 a!2986) (index!29148 lt!293328)) k0!1786) (ite ((_ is MissingZero!6712) lt!293328) (= (select (arr!18316 a!2986) (index!29147 lt!293328)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6712) lt!293328) (= (select (arr!18316 a!2986) (index!29150 lt!293328)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!362863 () SeekEntryResult!6712)

(assert (=> d!89759 (= lt!293328 e!362863)))

(declare-fun c!72424 () Bool)

(declare-fun lt!293326 () SeekEntryResult!6712)

(assert (=> d!89759 (= c!72424 (and ((_ is Intermediate!6712) lt!293326) (undefined!7524 lt!293326)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38178 (_ BitVec 32)) SeekEntryResult!6712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89759 (= lt!293326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89759 (validMask!0 mask!3053)))

(assert (=> d!89759 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!293328)))

(declare-fun b!634534 () Bool)

(declare-fun e!362864 () SeekEntryResult!6712)

(assert (=> b!634534 (= e!362864 (Found!6712 (index!29149 lt!293326)))))

(declare-fun b!634535 () Bool)

(assert (=> b!634535 (= e!362863 Undefined!6712)))

(declare-fun b!634536 () Bool)

(declare-fun e!362862 () SeekEntryResult!6712)

(assert (=> b!634536 (= e!362862 (MissingZero!6712 (index!29149 lt!293326)))))

(declare-fun b!634537 () Bool)

(assert (=> b!634537 (= e!362862 (seekKeyOrZeroReturnVacant!0 (x!58040 lt!293326) (index!29149 lt!293326) (index!29149 lt!293326) k0!1786 a!2986 mask!3053))))

(declare-fun b!634538 () Bool)

(declare-fun c!72425 () Bool)

(declare-fun lt!293327 () (_ BitVec 64))

(assert (=> b!634538 (= c!72425 (= lt!293327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634538 (= e!362864 e!362862)))

(declare-fun b!634539 () Bool)

(assert (=> b!634539 (= e!362863 e!362864)))

(assert (=> b!634539 (= lt!293327 (select (arr!18316 a!2986) (index!29149 lt!293326)))))

(declare-fun c!72423 () Bool)

(assert (=> b!634539 (= c!72423 (= lt!293327 k0!1786))))

(assert (= (and d!89759 c!72424) b!634535))

(assert (= (and d!89759 (not c!72424)) b!634539))

(assert (= (and b!634539 c!72423) b!634534))

(assert (= (and b!634539 (not c!72423)) b!634538))

(assert (= (and b!634538 c!72425) b!634536))

(assert (= (and b!634538 (not c!72425)) b!634537))

(declare-fun m!609407 () Bool)

(assert (=> d!89759 m!609407))

(assert (=> d!89759 m!609203))

(declare-fun m!609409 () Bool)

(assert (=> d!89759 m!609409))

(declare-fun m!609411 () Bool)

(assert (=> d!89759 m!609411))

(declare-fun m!609413 () Bool)

(assert (=> d!89759 m!609413))

(assert (=> d!89759 m!609407))

(declare-fun m!609417 () Bool)

(assert (=> d!89759 m!609417))

(declare-fun m!609421 () Bool)

(assert (=> b!634537 m!609421))

(declare-fun m!609427 () Bool)

(assert (=> b!634539 m!609427))

(assert (=> b!634316 d!89759))

(declare-fun d!89769 () Bool)

(declare-fun e!362890 () Bool)

(assert (=> d!89769 e!362890))

(declare-fun res!410433 () Bool)

(assert (=> d!89769 (=> (not res!410433) (not e!362890))))

(assert (=> d!89769 (= res!410433 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18680 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18680 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18680 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18680 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18680 a!2986))))))

(declare-fun lt!293344 () Unit!21357)

(declare-fun choose!9 (array!38178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21357)

(assert (=> d!89769 (= lt!293344 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89769 (validMask!0 mask!3053)))

(assert (=> d!89769 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 mask!3053) lt!293344)))

(declare-fun b!634582 () Bool)

(assert (=> b!634582 (= e!362890 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 (select (store (arr!18316 a!2986) i!1108 k0!1786) j!136) (array!38179 (store (arr!18316 a!2986) i!1108 k0!1786) (size!18680 a!2986)) mask!3053)))))

(assert (= (and d!89769 res!410433) b!634582))

(declare-fun m!609445 () Bool)

(assert (=> d!89769 m!609445))

(assert (=> d!89769 m!609203))

(assert (=> b!634582 m!609231))

(declare-fun m!609447 () Bool)

(assert (=> b!634582 m!609447))

(assert (=> b!634582 m!609209))

(assert (=> b!634582 m!609199))

(assert (=> b!634582 m!609231))

(assert (=> b!634582 m!609199))

(assert (=> b!634582 m!609229))

(assert (=> b!634315 d!89769))

(declare-fun b!634583 () Bool)

(declare-fun e!362892 () SeekEntryResult!6712)

(assert (=> b!634583 (= e!362892 Undefined!6712)))

(declare-fun b!634584 () Bool)

(declare-fun e!362893 () SeekEntryResult!6712)

(assert (=> b!634584 (= e!362892 e!362893)))

(declare-fun c!72443 () Bool)

(declare-fun lt!293345 () (_ BitVec 64))

(assert (=> b!634584 (= c!72443 (= lt!293345 lt!293227))))

(declare-fun d!89779 () Bool)

(declare-fun lt!293346 () SeekEntryResult!6712)

(assert (=> d!89779 (and (or ((_ is Undefined!6712) lt!293346) (not ((_ is Found!6712) lt!293346)) (and (bvsge (index!29148 lt!293346) #b00000000000000000000000000000000) (bvslt (index!29148 lt!293346) (size!18680 lt!293224)))) (or ((_ is Undefined!6712) lt!293346) ((_ is Found!6712) lt!293346) (not ((_ is MissingVacant!6712) lt!293346)) (not (= (index!29150 lt!293346) vacantSpotIndex!68)) (and (bvsge (index!29150 lt!293346) #b00000000000000000000000000000000) (bvslt (index!29150 lt!293346) (size!18680 lt!293224)))) (or ((_ is Undefined!6712) lt!293346) (ite ((_ is Found!6712) lt!293346) (= (select (arr!18316 lt!293224) (index!29148 lt!293346)) lt!293227) (and ((_ is MissingVacant!6712) lt!293346) (= (index!29150 lt!293346) vacantSpotIndex!68) (= (select (arr!18316 lt!293224) (index!29150 lt!293346)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89779 (= lt!293346 e!362892)))

(declare-fun c!72445 () Bool)

(assert (=> d!89779 (= c!72445 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89779 (= lt!293345 (select (arr!18316 lt!293224) lt!293233))))

(assert (=> d!89779 (validMask!0 mask!3053)))

(assert (=> d!89779 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 lt!293227 lt!293224 mask!3053) lt!293346)))

(declare-fun b!634585 () Bool)

(assert (=> b!634585 (= e!362893 (Found!6712 lt!293233))))

(declare-fun b!634586 () Bool)

(declare-fun c!72444 () Bool)

(assert (=> b!634586 (= c!72444 (= lt!293345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362891 () SeekEntryResult!6712)

(assert (=> b!634586 (= e!362893 e!362891)))

(declare-fun b!634587 () Bool)

(assert (=> b!634587 (= e!362891 (MissingVacant!6712 vacantSpotIndex!68))))

(declare-fun b!634588 () Bool)

(assert (=> b!634588 (= e!362891 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293233 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!293227 lt!293224 mask!3053))))

(assert (= (and d!89779 c!72445) b!634583))

(assert (= (and d!89779 (not c!72445)) b!634584))

(assert (= (and b!634584 c!72443) b!634585))

(assert (= (and b!634584 (not c!72443)) b!634586))

(assert (= (and b!634586 c!72444) b!634587))

(assert (= (and b!634586 (not c!72444)) b!634588))

(declare-fun m!609449 () Bool)

(assert (=> d!89779 m!609449))

(declare-fun m!609451 () Bool)

(assert (=> d!89779 m!609451))

(declare-fun m!609453 () Bool)

(assert (=> d!89779 m!609453))

(assert (=> d!89779 m!609203))

(declare-fun m!609455 () Bool)

(assert (=> b!634588 m!609455))

(assert (=> b!634588 m!609455))

(declare-fun m!609457 () Bool)

(assert (=> b!634588 m!609457))

(assert (=> b!634315 d!89779))

(declare-fun b!634594 () Bool)

(declare-fun e!362899 () SeekEntryResult!6712)

(assert (=> b!634594 (= e!362899 Undefined!6712)))

(declare-fun b!634595 () Bool)

(declare-fun e!362900 () SeekEntryResult!6712)

(assert (=> b!634595 (= e!362899 e!362900)))

(declare-fun c!72447 () Bool)

(declare-fun lt!293347 () (_ BitVec 64))

(assert (=> b!634595 (= c!72447 (= lt!293347 lt!293227))))

(declare-fun d!89781 () Bool)

(declare-fun lt!293348 () SeekEntryResult!6712)

(assert (=> d!89781 (and (or ((_ is Undefined!6712) lt!293348) (not ((_ is Found!6712) lt!293348)) (and (bvsge (index!29148 lt!293348) #b00000000000000000000000000000000) (bvslt (index!29148 lt!293348) (size!18680 lt!293224)))) (or ((_ is Undefined!6712) lt!293348) ((_ is Found!6712) lt!293348) (not ((_ is MissingVacant!6712) lt!293348)) (not (= (index!29150 lt!293348) vacantSpotIndex!68)) (and (bvsge (index!29150 lt!293348) #b00000000000000000000000000000000) (bvslt (index!29150 lt!293348) (size!18680 lt!293224)))) (or ((_ is Undefined!6712) lt!293348) (ite ((_ is Found!6712) lt!293348) (= (select (arr!18316 lt!293224) (index!29148 lt!293348)) lt!293227) (and ((_ is MissingVacant!6712) lt!293348) (= (index!29150 lt!293348) vacantSpotIndex!68) (= (select (arr!18316 lt!293224) (index!29150 lt!293348)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89781 (= lt!293348 e!362899)))

(declare-fun c!72449 () Bool)

(assert (=> d!89781 (= c!72449 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89781 (= lt!293347 (select (arr!18316 lt!293224) index!984))))

(assert (=> d!89781 (validMask!0 mask!3053)))

(assert (=> d!89781 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293227 lt!293224 mask!3053) lt!293348)))

(declare-fun b!634596 () Bool)

(assert (=> b!634596 (= e!362900 (Found!6712 index!984))))

(declare-fun b!634597 () Bool)

(declare-fun c!72448 () Bool)

(assert (=> b!634597 (= c!72448 (= lt!293347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362898 () SeekEntryResult!6712)

(assert (=> b!634597 (= e!362900 e!362898)))

(declare-fun b!634598 () Bool)

(assert (=> b!634598 (= e!362898 (MissingVacant!6712 vacantSpotIndex!68))))

(declare-fun b!634599 () Bool)

(assert (=> b!634599 (= e!362898 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!293227 lt!293224 mask!3053))))

(assert (= (and d!89781 c!72449) b!634594))

(assert (= (and d!89781 (not c!72449)) b!634595))

(assert (= (and b!634595 c!72447) b!634596))

(assert (= (and b!634595 (not c!72447)) b!634597))

(assert (= (and b!634597 c!72448) b!634598))

(assert (= (and b!634597 (not c!72448)) b!634599))

(declare-fun m!609463 () Bool)

(assert (=> d!89781 m!609463))

(declare-fun m!609465 () Bool)

(assert (=> d!89781 m!609465))

(assert (=> d!89781 m!609377))

(assert (=> d!89781 m!609203))

(assert (=> b!634599 m!609341))

(assert (=> b!634599 m!609341))

(declare-fun m!609469 () Bool)

(assert (=> b!634599 m!609469))

(assert (=> b!634315 d!89781))

(declare-fun d!89783 () Bool)

(declare-fun lt!293351 () (_ BitVec 32))

(assert (=> d!89783 (and (bvsge lt!293351 #b00000000000000000000000000000000) (bvslt lt!293351 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89783 (= lt!293351 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89783 (validMask!0 mask!3053)))

(assert (=> d!89783 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!293351)))

(declare-fun bs!19095 () Bool)

(assert (= bs!19095 d!89783))

(declare-fun m!609473 () Bool)

(assert (=> bs!19095 m!609473))

(assert (=> bs!19095 m!609203))

(assert (=> b!634315 d!89783))

(declare-fun b!634606 () Bool)

(declare-fun e!362908 () SeekEntryResult!6712)

(assert (=> b!634606 (= e!362908 Undefined!6712)))

(declare-fun b!634607 () Bool)

(declare-fun e!362909 () SeekEntryResult!6712)

(assert (=> b!634607 (= e!362908 e!362909)))

(declare-fun c!72450 () Bool)

(declare-fun lt!293352 () (_ BitVec 64))

(assert (=> b!634607 (= c!72450 (= lt!293352 (select (arr!18316 a!2986) j!136)))))

(declare-fun d!89787 () Bool)

(declare-fun lt!293353 () SeekEntryResult!6712)

(assert (=> d!89787 (and (or ((_ is Undefined!6712) lt!293353) (not ((_ is Found!6712) lt!293353)) (and (bvsge (index!29148 lt!293353) #b00000000000000000000000000000000) (bvslt (index!29148 lt!293353) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293353) ((_ is Found!6712) lt!293353) (not ((_ is MissingVacant!6712) lt!293353)) (not (= (index!29150 lt!293353) vacantSpotIndex!68)) (and (bvsge (index!29150 lt!293353) #b00000000000000000000000000000000) (bvslt (index!29150 lt!293353) (size!18680 a!2986)))) (or ((_ is Undefined!6712) lt!293353) (ite ((_ is Found!6712) lt!293353) (= (select (arr!18316 a!2986) (index!29148 lt!293353)) (select (arr!18316 a!2986) j!136)) (and ((_ is MissingVacant!6712) lt!293353) (= (index!29150 lt!293353) vacantSpotIndex!68) (= (select (arr!18316 a!2986) (index!29150 lt!293353)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89787 (= lt!293353 e!362908)))

(declare-fun c!72452 () Bool)

(assert (=> d!89787 (= c!72452 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89787 (= lt!293352 (select (arr!18316 a!2986) lt!293233))))

(assert (=> d!89787 (validMask!0 mask!3053)))

(assert (=> d!89787 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293233 vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053) lt!293353)))

(declare-fun b!634608 () Bool)

(assert (=> b!634608 (= e!362909 (Found!6712 lt!293233))))

(declare-fun b!634609 () Bool)

(declare-fun c!72451 () Bool)

(assert (=> b!634609 (= c!72451 (= lt!293352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362907 () SeekEntryResult!6712)

(assert (=> b!634609 (= e!362909 e!362907)))

(declare-fun b!634610 () Bool)

(assert (=> b!634610 (= e!362907 (MissingVacant!6712 vacantSpotIndex!68))))

(declare-fun b!634611 () Bool)

(assert (=> b!634611 (= e!362907 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!293233 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18316 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89787 c!72452) b!634606))

(assert (= (and d!89787 (not c!72452)) b!634607))

(assert (= (and b!634607 c!72450) b!634608))

(assert (= (and b!634607 (not c!72450)) b!634609))

(assert (= (and b!634609 c!72451) b!634610))

(assert (= (and b!634609 (not c!72451)) b!634611))

(declare-fun m!609481 () Bool)

(assert (=> d!89787 m!609481))

(declare-fun m!609483 () Bool)

(assert (=> d!89787 m!609483))

(declare-fun m!609485 () Bool)

(assert (=> d!89787 m!609485))

(assert (=> d!89787 m!609203))

(assert (=> b!634611 m!609455))

(assert (=> b!634611 m!609455))

(assert (=> b!634611 m!609199))

(declare-fun m!609487 () Bool)

(assert (=> b!634611 m!609487))

(assert (=> b!634315 d!89787))

(declare-fun b!634642 () Bool)

(declare-fun e!362931 () Bool)

(declare-fun call!33396 () Bool)

(assert (=> b!634642 (= e!362931 call!33396)))

(declare-fun b!634643 () Bool)

(assert (=> b!634643 (= e!362931 call!33396)))

(declare-fun d!89793 () Bool)

(declare-fun res!410452 () Bool)

(declare-fun e!362929 () Bool)

(assert (=> d!89793 (=> res!410452 e!362929)))

(assert (=> d!89793 (= res!410452 (bvsge #b00000000000000000000000000000000 (size!18680 a!2986)))))

(assert (=> d!89793 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12261) e!362929)))

(declare-fun b!634644 () Bool)

(declare-fun e!362932 () Bool)

(declare-fun contains!3073 (List!12264 (_ BitVec 64)) Bool)

(assert (=> b!634644 (= e!362932 (contains!3073 Nil!12261 (select (arr!18316 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33393 () Bool)

(declare-fun c!72464 () Bool)

(assert (=> bm!33393 (= call!33396 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72464 (Cons!12260 (select (arr!18316 a!2986) #b00000000000000000000000000000000) Nil!12261) Nil!12261)))))

(declare-fun b!634645 () Bool)

(declare-fun e!362930 () Bool)

(assert (=> b!634645 (= e!362929 e!362930)))

(declare-fun res!410451 () Bool)

(assert (=> b!634645 (=> (not res!410451) (not e!362930))))

(assert (=> b!634645 (= res!410451 (not e!362932))))

(declare-fun res!410453 () Bool)

(assert (=> b!634645 (=> (not res!410453) (not e!362932))))

(assert (=> b!634645 (= res!410453 (validKeyInArray!0 (select (arr!18316 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!634646 () Bool)

(assert (=> b!634646 (= e!362930 e!362931)))

(assert (=> b!634646 (= c!72464 (validKeyInArray!0 (select (arr!18316 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89793 (not res!410452)) b!634645))

(assert (= (and b!634645 res!410453) b!634644))

(assert (= (and b!634645 res!410451) b!634646))

(assert (= (and b!634646 c!72464) b!634643))

(assert (= (and b!634646 (not c!72464)) b!634642))

(assert (= (or b!634643 b!634642) bm!33393))

(assert (=> b!634644 m!609345))

(assert (=> b!634644 m!609345))

(declare-fun m!609503 () Bool)

(assert (=> b!634644 m!609503))

(assert (=> bm!33393 m!609345))

(declare-fun m!609505 () Bool)

(assert (=> bm!33393 m!609505))

(assert (=> b!634645 m!609345))

(assert (=> b!634645 m!609345))

(assert (=> b!634645 m!609347))

(assert (=> b!634646 m!609345))

(assert (=> b!634646 m!609345))

(assert (=> b!634646 m!609347))

(assert (=> b!634304 d!89793))

(check-sat (not d!89727) (not b!634494) (not d!89783) (not b!634599) (not b!634537) (not d!89759) (not d!89787) (not d!89779) (not b!634588) (not b!634447) (not d!89769) (not b!634458) (not b!634465) (not b!634457) (not b!634644) (not bm!33393) (not b!634582) (not d!89781) (not bm!33384) (not b!634611) (not b!634645) (not b!634646) (not b!634492))
(check-sat)
