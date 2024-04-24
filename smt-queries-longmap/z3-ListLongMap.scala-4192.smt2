; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57240 () Bool)

(assert start!57240)

(declare-fun b!633212 () Bool)

(declare-fun res!409479 () Bool)

(declare-fun e!362042 () Bool)

(assert (=> b!633212 (=> (not res!409479) (not e!362042))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633212 (= res!409479 (validKeyInArray!0 k0!1786))))

(declare-fun b!633213 () Bool)

(declare-fun e!362040 () Bool)

(declare-datatypes ((SeekEntryResult!6697 0))(
  ( (MissingZero!6697 (index!29084 (_ BitVec 32))) (Found!6697 (index!29085 (_ BitVec 32))) (Intermediate!6697 (undefined!7509 Bool) (index!29086 (_ BitVec 32)) (x!57976 (_ BitVec 32))) (Undefined!6697) (MissingVacant!6697 (index!29087 (_ BitVec 32))) )
))
(declare-fun lt!292667 () SeekEntryResult!6697)

(declare-fun lt!292668 () SeekEntryResult!6697)

(assert (=> b!633213 (= e!362040 (= lt!292667 lt!292668))))

(declare-fun b!633214 () Bool)

(declare-fun e!362045 () Bool)

(assert (=> b!633214 (= e!362042 e!362045)))

(declare-fun res!409483 () Bool)

(assert (=> b!633214 (=> (not res!409483) (not e!362045))))

(declare-fun lt!292670 () SeekEntryResult!6697)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633214 (= res!409483 (or (= lt!292670 (MissingZero!6697 i!1108)) (= lt!292670 (MissingVacant!6697 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38145 0))(
  ( (array!38146 (arr!18301 (Array (_ BitVec 32) (_ BitVec 64))) (size!18665 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38145)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38145 (_ BitVec 32)) SeekEntryResult!6697)

(assert (=> b!633214 (= lt!292670 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!409478 () Bool)

(assert (=> start!57240 (=> (not res!409478) (not e!362042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57240 (= res!409478 (validMask!0 mask!3053))))

(assert (=> start!57240 e!362042))

(assert (=> start!57240 true))

(declare-fun array_inv!14160 (array!38145) Bool)

(assert (=> start!57240 (array_inv!14160 a!2986)))

(declare-fun b!633215 () Bool)

(declare-fun res!409476 () Bool)

(assert (=> b!633215 (=> (not res!409476) (not e!362045))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!633215 (= res!409476 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18301 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633216 () Bool)

(declare-fun res!409473 () Bool)

(assert (=> b!633216 (=> (not res!409473) (not e!362042))))

(declare-fun arrayContainsKey!0 (array!38145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633216 (= res!409473 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633217 () Bool)

(declare-fun e!362044 () Bool)

(declare-fun e!362038 () Bool)

(assert (=> b!633217 (= e!362044 e!362038)))

(declare-fun res!409486 () Bool)

(assert (=> b!633217 (=> (not res!409486) (not e!362038))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!633217 (= res!409486 (and (= lt!292667 (Found!6697 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18301 a!2986) index!984) (select (arr!18301 a!2986) j!136))) (not (= (select (arr!18301 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38145 (_ BitVec 32)) SeekEntryResult!6697)

(assert (=> b!633217 (= lt!292667 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!362036 () Bool)

(declare-fun b!633218 () Bool)

(declare-fun lt!292666 () array!38145)

(assert (=> b!633218 (= e!362036 (arrayContainsKey!0 lt!292666 (select (arr!18301 a!2986) j!136) j!136))))

(declare-fun b!633219 () Bool)

(declare-fun res!409472 () Bool)

(assert (=> b!633219 (=> (not res!409472) (not e!362042))))

(assert (=> b!633219 (= res!409472 (and (= (size!18665 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18665 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18665 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633220 () Bool)

(declare-datatypes ((Unit!21297 0))(
  ( (Unit!21298) )
))
(declare-fun e!362046 () Unit!21297)

(declare-fun Unit!21299 () Unit!21297)

(assert (=> b!633220 (= e!362046 Unit!21299)))

(assert (=> b!633220 false))

(declare-fun b!633221 () Bool)

(declare-fun Unit!21300 () Unit!21297)

(assert (=> b!633221 (= e!362046 Unit!21300)))

(declare-fun b!633222 () Bool)

(declare-fun res!409477 () Bool)

(assert (=> b!633222 (=> (not res!409477) (not e!362045))))

(declare-datatypes ((List!12249 0))(
  ( (Nil!12246) (Cons!12245 (h!13293 (_ BitVec 64)) (t!18469 List!12249)) )
))
(declare-fun arrayNoDuplicates!0 (array!38145 (_ BitVec 32) List!12249) Bool)

(assert (=> b!633222 (= res!409477 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12246))))

(declare-fun b!633223 () Bool)

(declare-fun e!362041 () Bool)

(assert (=> b!633223 (= e!362041 (arrayContainsKey!0 lt!292666 (select (arr!18301 a!2986) j!136) index!984))))

(declare-fun b!633224 () Bool)

(declare-fun res!409485 () Bool)

(assert (=> b!633224 (=> (not res!409485) (not e!362045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38145 (_ BitVec 32)) Bool)

(assert (=> b!633224 (= res!409485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633225 () Bool)

(declare-fun e!362043 () Bool)

(assert (=> b!633225 (= e!362038 (not e!362043))))

(declare-fun res!409475 () Bool)

(assert (=> b!633225 (=> res!409475 e!362043)))

(declare-fun lt!292674 () SeekEntryResult!6697)

(assert (=> b!633225 (= res!409475 (not (= lt!292674 (Found!6697 index!984))))))

(declare-fun lt!292675 () Unit!21297)

(assert (=> b!633225 (= lt!292675 e!362046)))

(declare-fun c!72239 () Bool)

(assert (=> b!633225 (= c!72239 (= lt!292674 Undefined!6697))))

(declare-fun lt!292673 () (_ BitVec 64))

(assert (=> b!633225 (= lt!292674 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292673 lt!292666 mask!3053))))

(assert (=> b!633225 e!362040))

(declare-fun res!409474 () Bool)

(assert (=> b!633225 (=> (not res!409474) (not e!362040))))

(declare-fun lt!292669 () (_ BitVec 32))

(assert (=> b!633225 (= res!409474 (= lt!292668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 lt!292673 lt!292666 mask!3053)))))

(assert (=> b!633225 (= lt!292668 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633225 (= lt!292673 (select (store (arr!18301 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292672 () Unit!21297)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21297)

(assert (=> b!633225 (= lt!292672 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633225 (= lt!292669 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!633226 () Bool)

(declare-fun e!362039 () Bool)

(assert (=> b!633226 (= e!362039 e!362036)))

(declare-fun res!409484 () Bool)

(assert (=> b!633226 (=> res!409484 e!362036)))

(declare-fun lt!292671 () (_ BitVec 64))

(assert (=> b!633226 (= res!409484 (or (not (= (select (arr!18301 a!2986) j!136) lt!292673)) (not (= (select (arr!18301 a!2986) j!136) lt!292671)) (bvsge j!136 index!984)))))

(declare-fun b!633227 () Bool)

(assert (=> b!633227 (= e!362043 e!362041)))

(declare-fun res!409482 () Bool)

(assert (=> b!633227 (=> res!409482 e!362041)))

(assert (=> b!633227 (= res!409482 (or (not (= (select (arr!18301 a!2986) j!136) lt!292673)) (not (= (select (arr!18301 a!2986) j!136) lt!292671)) (bvsge j!136 index!984)))))

(assert (=> b!633227 e!362039))

(declare-fun res!409471 () Bool)

(assert (=> b!633227 (=> (not res!409471) (not e!362039))))

(assert (=> b!633227 (= res!409471 (= lt!292671 (select (arr!18301 a!2986) j!136)))))

(assert (=> b!633227 (= lt!292671 (select (store (arr!18301 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!633228 () Bool)

(declare-fun res!409480 () Bool)

(assert (=> b!633228 (=> (not res!409480) (not e!362042))))

(assert (=> b!633228 (= res!409480 (validKeyInArray!0 (select (arr!18301 a!2986) j!136)))))

(declare-fun b!633229 () Bool)

(assert (=> b!633229 (= e!362045 e!362044)))

(declare-fun res!409481 () Bool)

(assert (=> b!633229 (=> (not res!409481) (not e!362044))))

(assert (=> b!633229 (= res!409481 (= (select (store (arr!18301 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633229 (= lt!292666 (array!38146 (store (arr!18301 a!2986) i!1108 k0!1786) (size!18665 a!2986)))))

(assert (= (and start!57240 res!409478) b!633219))

(assert (= (and b!633219 res!409472) b!633228))

(assert (= (and b!633228 res!409480) b!633212))

(assert (= (and b!633212 res!409479) b!633216))

(assert (= (and b!633216 res!409473) b!633214))

(assert (= (and b!633214 res!409483) b!633224))

(assert (= (and b!633224 res!409485) b!633222))

(assert (= (and b!633222 res!409477) b!633215))

(assert (= (and b!633215 res!409476) b!633229))

(assert (= (and b!633229 res!409481) b!633217))

(assert (= (and b!633217 res!409486) b!633225))

(assert (= (and b!633225 res!409474) b!633213))

(assert (= (and b!633225 c!72239) b!633220))

(assert (= (and b!633225 (not c!72239)) b!633221))

(assert (= (and b!633225 (not res!409475)) b!633227))

(assert (= (and b!633227 res!409471) b!633226))

(assert (= (and b!633226 (not res!409484)) b!633218))

(assert (= (and b!633227 (not res!409482)) b!633223))

(declare-fun m!608275 () Bool)

(assert (=> b!633228 m!608275))

(assert (=> b!633228 m!608275))

(declare-fun m!608277 () Bool)

(assert (=> b!633228 m!608277))

(assert (=> b!633226 m!608275))

(assert (=> b!633223 m!608275))

(assert (=> b!633223 m!608275))

(declare-fun m!608279 () Bool)

(assert (=> b!633223 m!608279))

(declare-fun m!608281 () Bool)

(assert (=> b!633229 m!608281))

(declare-fun m!608283 () Bool)

(assert (=> b!633229 m!608283))

(declare-fun m!608285 () Bool)

(assert (=> b!633222 m!608285))

(assert (=> b!633227 m!608275))

(assert (=> b!633227 m!608281))

(declare-fun m!608287 () Bool)

(assert (=> b!633227 m!608287))

(assert (=> b!633218 m!608275))

(assert (=> b!633218 m!608275))

(declare-fun m!608289 () Bool)

(assert (=> b!633218 m!608289))

(declare-fun m!608291 () Bool)

(assert (=> b!633214 m!608291))

(declare-fun m!608293 () Bool)

(assert (=> start!57240 m!608293))

(declare-fun m!608295 () Bool)

(assert (=> start!57240 m!608295))

(declare-fun m!608297 () Bool)

(assert (=> b!633216 m!608297))

(declare-fun m!608299 () Bool)

(assert (=> b!633224 m!608299))

(declare-fun m!608301 () Bool)

(assert (=> b!633215 m!608301))

(declare-fun m!608303 () Bool)

(assert (=> b!633212 m!608303))

(declare-fun m!608305 () Bool)

(assert (=> b!633225 m!608305))

(declare-fun m!608307 () Bool)

(assert (=> b!633225 m!608307))

(declare-fun m!608309 () Bool)

(assert (=> b!633225 m!608309))

(assert (=> b!633225 m!608275))

(assert (=> b!633225 m!608281))

(assert (=> b!633225 m!608275))

(declare-fun m!608311 () Bool)

(assert (=> b!633225 m!608311))

(declare-fun m!608313 () Bool)

(assert (=> b!633225 m!608313))

(declare-fun m!608315 () Bool)

(assert (=> b!633225 m!608315))

(declare-fun m!608317 () Bool)

(assert (=> b!633217 m!608317))

(assert (=> b!633217 m!608275))

(assert (=> b!633217 m!608275))

(declare-fun m!608319 () Bool)

(assert (=> b!633217 m!608319))

(check-sat (not b!633228) (not b!633224) (not b!633222) (not b!633214) (not b!633218) (not b!633223) (not b!633216) (not start!57240) (not b!633225) (not b!633212) (not b!633217))
(check-sat)
(get-model)

(declare-fun d!89621 () Bool)

(assert (=> d!89621 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57240 d!89621))

(declare-fun d!89623 () Bool)

(assert (=> d!89623 (= (array_inv!14160 a!2986) (bvsge (size!18665 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57240 d!89623))

(declare-fun d!89625 () Bool)

(declare-fun res!409587 () Bool)

(declare-fun e!362117 () Bool)

(assert (=> d!89625 (=> res!409587 e!362117)))

(assert (=> d!89625 (= res!409587 (= (select (arr!18301 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89625 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!362117)))

(declare-fun b!633342 () Bool)

(declare-fun e!362118 () Bool)

(assert (=> b!633342 (= e!362117 e!362118)))

(declare-fun res!409588 () Bool)

(assert (=> b!633342 (=> (not res!409588) (not e!362118))))

(assert (=> b!633342 (= res!409588 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18665 a!2986)))))

(declare-fun b!633343 () Bool)

(assert (=> b!633343 (= e!362118 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89625 (not res!409587)) b!633342))

(assert (= (and b!633342 res!409588) b!633343))

(declare-fun m!608413 () Bool)

(assert (=> d!89625 m!608413))

(declare-fun m!608415 () Bool)

(assert (=> b!633343 m!608415))

(assert (=> b!633216 d!89625))

(declare-fun b!633354 () Bool)

(declare-fun e!362128 () Bool)

(declare-fun call!33369 () Bool)

(assert (=> b!633354 (= e!362128 call!33369)))

(declare-fun b!633355 () Bool)

(declare-fun e!362130 () Bool)

(declare-fun contains!3070 (List!12249 (_ BitVec 64)) Bool)

(assert (=> b!633355 (= e!362130 (contains!3070 Nil!12246 (select (arr!18301 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633356 () Bool)

(assert (=> b!633356 (= e!362128 call!33369)))

(declare-fun d!89627 () Bool)

(declare-fun res!409595 () Bool)

(declare-fun e!362129 () Bool)

(assert (=> d!89627 (=> res!409595 e!362129)))

(assert (=> d!89627 (= res!409595 (bvsge #b00000000000000000000000000000000 (size!18665 a!2986)))))

(assert (=> d!89627 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12246) e!362129)))

(declare-fun bm!33366 () Bool)

(declare-fun c!72248 () Bool)

(assert (=> bm!33366 (= call!33369 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72248 (Cons!12245 (select (arr!18301 a!2986) #b00000000000000000000000000000000) Nil!12246) Nil!12246)))))

(declare-fun b!633357 () Bool)

(declare-fun e!362127 () Bool)

(assert (=> b!633357 (= e!362127 e!362128)))

(assert (=> b!633357 (= c!72248 (validKeyInArray!0 (select (arr!18301 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633358 () Bool)

(assert (=> b!633358 (= e!362129 e!362127)))

(declare-fun res!409597 () Bool)

(assert (=> b!633358 (=> (not res!409597) (not e!362127))))

(assert (=> b!633358 (= res!409597 (not e!362130))))

(declare-fun res!409596 () Bool)

(assert (=> b!633358 (=> (not res!409596) (not e!362130))))

(assert (=> b!633358 (= res!409596 (validKeyInArray!0 (select (arr!18301 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89627 (not res!409595)) b!633358))

(assert (= (and b!633358 res!409596) b!633355))

(assert (= (and b!633358 res!409597) b!633357))

(assert (= (and b!633357 c!72248) b!633354))

(assert (= (and b!633357 (not c!72248)) b!633356))

(assert (= (or b!633354 b!633356) bm!33366))

(assert (=> b!633355 m!608413))

(assert (=> b!633355 m!608413))

(declare-fun m!608417 () Bool)

(assert (=> b!633355 m!608417))

(assert (=> bm!33366 m!608413))

(declare-fun m!608419 () Bool)

(assert (=> bm!33366 m!608419))

(assert (=> b!633357 m!608413))

(assert (=> b!633357 m!608413))

(declare-fun m!608421 () Bool)

(assert (=> b!633357 m!608421))

(assert (=> b!633358 m!608413))

(assert (=> b!633358 m!608413))

(assert (=> b!633358 m!608421))

(assert (=> b!633222 d!89627))

(declare-fun e!362139 () SeekEntryResult!6697)

(declare-fun b!633371 () Bool)

(assert (=> b!633371 (= e!362139 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!292673 lt!292666 mask!3053))))

(declare-fun b!633372 () Bool)

(declare-fun e!362137 () SeekEntryResult!6697)

(assert (=> b!633372 (= e!362137 (Found!6697 index!984))))

(declare-fun b!633373 () Bool)

(declare-fun c!72256 () Bool)

(declare-fun lt!292740 () (_ BitVec 64))

(assert (=> b!633373 (= c!72256 (= lt!292740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633373 (= e!362137 e!362139)))

(declare-fun b!633374 () Bool)

(assert (=> b!633374 (= e!362139 (MissingVacant!6697 vacantSpotIndex!68))))

(declare-fun d!89629 () Bool)

(declare-fun lt!292741 () SeekEntryResult!6697)

(get-info :version)

(assert (=> d!89629 (and (or ((_ is Undefined!6697) lt!292741) (not ((_ is Found!6697) lt!292741)) (and (bvsge (index!29085 lt!292741) #b00000000000000000000000000000000) (bvslt (index!29085 lt!292741) (size!18665 lt!292666)))) (or ((_ is Undefined!6697) lt!292741) ((_ is Found!6697) lt!292741) (not ((_ is MissingVacant!6697) lt!292741)) (not (= (index!29087 lt!292741) vacantSpotIndex!68)) (and (bvsge (index!29087 lt!292741) #b00000000000000000000000000000000) (bvslt (index!29087 lt!292741) (size!18665 lt!292666)))) (or ((_ is Undefined!6697) lt!292741) (ite ((_ is Found!6697) lt!292741) (= (select (arr!18301 lt!292666) (index!29085 lt!292741)) lt!292673) (and ((_ is MissingVacant!6697) lt!292741) (= (index!29087 lt!292741) vacantSpotIndex!68) (= (select (arr!18301 lt!292666) (index!29087 lt!292741)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362138 () SeekEntryResult!6697)

(assert (=> d!89629 (= lt!292741 e!362138)))

(declare-fun c!72257 () Bool)

(assert (=> d!89629 (= c!72257 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89629 (= lt!292740 (select (arr!18301 lt!292666) index!984))))

(assert (=> d!89629 (validMask!0 mask!3053)))

(assert (=> d!89629 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292673 lt!292666 mask!3053) lt!292741)))

(declare-fun b!633375 () Bool)

(assert (=> b!633375 (= e!362138 Undefined!6697)))

(declare-fun b!633376 () Bool)

(assert (=> b!633376 (= e!362138 e!362137)))

(declare-fun c!72255 () Bool)

(assert (=> b!633376 (= c!72255 (= lt!292740 lt!292673))))

(assert (= (and d!89629 c!72257) b!633375))

(assert (= (and d!89629 (not c!72257)) b!633376))

(assert (= (and b!633376 c!72255) b!633372))

(assert (= (and b!633376 (not c!72255)) b!633373))

(assert (= (and b!633373 c!72256) b!633374))

(assert (= (and b!633373 (not c!72256)) b!633371))

(declare-fun m!608423 () Bool)

(assert (=> b!633371 m!608423))

(assert (=> b!633371 m!608423))

(declare-fun m!608425 () Bool)

(assert (=> b!633371 m!608425))

(declare-fun m!608427 () Bool)

(assert (=> d!89629 m!608427))

(declare-fun m!608429 () Bool)

(assert (=> d!89629 m!608429))

(declare-fun m!608431 () Bool)

(assert (=> d!89629 m!608431))

(assert (=> d!89629 m!608293))

(assert (=> b!633225 d!89629))

(declare-fun e!362142 () SeekEntryResult!6697)

(declare-fun b!633377 () Bool)

(assert (=> b!633377 (= e!362142 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292669 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633378 () Bool)

(declare-fun e!362140 () SeekEntryResult!6697)

(assert (=> b!633378 (= e!362140 (Found!6697 lt!292669))))

(declare-fun b!633379 () Bool)

(declare-fun c!72259 () Bool)

(declare-fun lt!292742 () (_ BitVec 64))

(assert (=> b!633379 (= c!72259 (= lt!292742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633379 (= e!362140 e!362142)))

(declare-fun b!633380 () Bool)

(assert (=> b!633380 (= e!362142 (MissingVacant!6697 vacantSpotIndex!68))))

(declare-fun d!89631 () Bool)

(declare-fun lt!292743 () SeekEntryResult!6697)

(assert (=> d!89631 (and (or ((_ is Undefined!6697) lt!292743) (not ((_ is Found!6697) lt!292743)) (and (bvsge (index!29085 lt!292743) #b00000000000000000000000000000000) (bvslt (index!29085 lt!292743) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292743) ((_ is Found!6697) lt!292743) (not ((_ is MissingVacant!6697) lt!292743)) (not (= (index!29087 lt!292743) vacantSpotIndex!68)) (and (bvsge (index!29087 lt!292743) #b00000000000000000000000000000000) (bvslt (index!29087 lt!292743) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292743) (ite ((_ is Found!6697) lt!292743) (= (select (arr!18301 a!2986) (index!29085 lt!292743)) (select (arr!18301 a!2986) j!136)) (and ((_ is MissingVacant!6697) lt!292743) (= (index!29087 lt!292743) vacantSpotIndex!68) (= (select (arr!18301 a!2986) (index!29087 lt!292743)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362141 () SeekEntryResult!6697)

(assert (=> d!89631 (= lt!292743 e!362141)))

(declare-fun c!72260 () Bool)

(assert (=> d!89631 (= c!72260 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89631 (= lt!292742 (select (arr!18301 a!2986) lt!292669))))

(assert (=> d!89631 (validMask!0 mask!3053)))

(assert (=> d!89631 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053) lt!292743)))

(declare-fun b!633381 () Bool)

(assert (=> b!633381 (= e!362141 Undefined!6697)))

(declare-fun b!633382 () Bool)

(assert (=> b!633382 (= e!362141 e!362140)))

(declare-fun c!72258 () Bool)

(assert (=> b!633382 (= c!72258 (= lt!292742 (select (arr!18301 a!2986) j!136)))))

(assert (= (and d!89631 c!72260) b!633381))

(assert (= (and d!89631 (not c!72260)) b!633382))

(assert (= (and b!633382 c!72258) b!633378))

(assert (= (and b!633382 (not c!72258)) b!633379))

(assert (= (and b!633379 c!72259) b!633380))

(assert (= (and b!633379 (not c!72259)) b!633377))

(declare-fun m!608433 () Bool)

(assert (=> b!633377 m!608433))

(assert (=> b!633377 m!608433))

(assert (=> b!633377 m!608275))

(declare-fun m!608435 () Bool)

(assert (=> b!633377 m!608435))

(declare-fun m!608437 () Bool)

(assert (=> d!89631 m!608437))

(declare-fun m!608439 () Bool)

(assert (=> d!89631 m!608439))

(declare-fun m!608441 () Bool)

(assert (=> d!89631 m!608441))

(assert (=> d!89631 m!608293))

(assert (=> b!633225 d!89631))

(declare-fun d!89633 () Bool)

(declare-fun e!362153 () Bool)

(assert (=> d!89633 e!362153))

(declare-fun res!409606 () Bool)

(assert (=> d!89633 (=> (not res!409606) (not e!362153))))

(assert (=> d!89633 (= res!409606 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18665 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18665 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18665 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18665 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18665 a!2986))))))

(declare-fun lt!292746 () Unit!21297)

(declare-fun choose!9 (array!38145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21297)

(assert (=> d!89633 (= lt!292746 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89633 (validMask!0 mask!3053)))

(assert (=> d!89633 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 mask!3053) lt!292746)))

(declare-fun b!633395 () Bool)

(assert (=> b!633395 (= e!362153 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 (select (store (arr!18301 a!2986) i!1108 k0!1786) j!136) (array!38146 (store (arr!18301 a!2986) i!1108 k0!1786) (size!18665 a!2986)) mask!3053)))))

(assert (= (and d!89633 res!409606) b!633395))

(declare-fun m!608443 () Bool)

(assert (=> d!89633 m!608443))

(assert (=> d!89633 m!608293))

(assert (=> b!633395 m!608309))

(assert (=> b!633395 m!608275))

(assert (=> b!633395 m!608311))

(assert (=> b!633395 m!608275))

(assert (=> b!633395 m!608281))

(assert (=> b!633395 m!608309))

(declare-fun m!608445 () Bool)

(assert (=> b!633395 m!608445))

(assert (=> b!633225 d!89633))

(declare-fun d!89639 () Bool)

(declare-fun lt!292755 () (_ BitVec 32))

(assert (=> d!89639 (and (bvsge lt!292755 #b00000000000000000000000000000000) (bvslt lt!292755 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89639 (= lt!292755 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89639 (validMask!0 mask!3053)))

(assert (=> d!89639 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!292755)))

(declare-fun bs!19076 () Bool)

(assert (= bs!19076 d!89639))

(declare-fun m!608455 () Bool)

(assert (=> bs!19076 m!608455))

(assert (=> bs!19076 m!608293))

(assert (=> b!633225 d!89639))

(declare-fun b!633413 () Bool)

(declare-fun e!362166 () SeekEntryResult!6697)

(assert (=> b!633413 (= e!362166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292669 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!292673 lt!292666 mask!3053))))

(declare-fun b!633414 () Bool)

(declare-fun e!362164 () SeekEntryResult!6697)

(assert (=> b!633414 (= e!362164 (Found!6697 lt!292669))))

(declare-fun b!633415 () Bool)

(declare-fun c!72271 () Bool)

(declare-fun lt!292756 () (_ BitVec 64))

(assert (=> b!633415 (= c!72271 (= lt!292756 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633415 (= e!362164 e!362166)))

(declare-fun b!633416 () Bool)

(assert (=> b!633416 (= e!362166 (MissingVacant!6697 vacantSpotIndex!68))))

(declare-fun d!89645 () Bool)

(declare-fun lt!292757 () SeekEntryResult!6697)

(assert (=> d!89645 (and (or ((_ is Undefined!6697) lt!292757) (not ((_ is Found!6697) lt!292757)) (and (bvsge (index!29085 lt!292757) #b00000000000000000000000000000000) (bvslt (index!29085 lt!292757) (size!18665 lt!292666)))) (or ((_ is Undefined!6697) lt!292757) ((_ is Found!6697) lt!292757) (not ((_ is MissingVacant!6697) lt!292757)) (not (= (index!29087 lt!292757) vacantSpotIndex!68)) (and (bvsge (index!29087 lt!292757) #b00000000000000000000000000000000) (bvslt (index!29087 lt!292757) (size!18665 lt!292666)))) (or ((_ is Undefined!6697) lt!292757) (ite ((_ is Found!6697) lt!292757) (= (select (arr!18301 lt!292666) (index!29085 lt!292757)) lt!292673) (and ((_ is MissingVacant!6697) lt!292757) (= (index!29087 lt!292757) vacantSpotIndex!68) (= (select (arr!18301 lt!292666) (index!29087 lt!292757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362165 () SeekEntryResult!6697)

(assert (=> d!89645 (= lt!292757 e!362165)))

(declare-fun c!72272 () Bool)

(assert (=> d!89645 (= c!72272 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89645 (= lt!292756 (select (arr!18301 lt!292666) lt!292669))))

(assert (=> d!89645 (validMask!0 mask!3053)))

(assert (=> d!89645 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292669 vacantSpotIndex!68 lt!292673 lt!292666 mask!3053) lt!292757)))

(declare-fun b!633417 () Bool)

(assert (=> b!633417 (= e!362165 Undefined!6697)))

(declare-fun b!633418 () Bool)

(assert (=> b!633418 (= e!362165 e!362164)))

(declare-fun c!72270 () Bool)

(assert (=> b!633418 (= c!72270 (= lt!292756 lt!292673))))

(assert (= (and d!89645 c!72272) b!633417))

(assert (= (and d!89645 (not c!72272)) b!633418))

(assert (= (and b!633418 c!72270) b!633414))

(assert (= (and b!633418 (not c!72270)) b!633415))

(assert (= (and b!633415 c!72271) b!633416))

(assert (= (and b!633415 (not c!72271)) b!633413))

(assert (=> b!633413 m!608433))

(assert (=> b!633413 m!608433))

(declare-fun m!608457 () Bool)

(assert (=> b!633413 m!608457))

(declare-fun m!608459 () Bool)

(assert (=> d!89645 m!608459))

(declare-fun m!608461 () Bool)

(assert (=> d!89645 m!608461))

(declare-fun m!608463 () Bool)

(assert (=> d!89645 m!608463))

(assert (=> d!89645 m!608293))

(assert (=> b!633225 d!89645))

(declare-fun b!633441 () Bool)

(declare-fun e!362183 () Bool)

(declare-fun e!362184 () Bool)

(assert (=> b!633441 (= e!362183 e!362184)))

(declare-fun c!72278 () Bool)

(assert (=> b!633441 (= c!72278 (validKeyInArray!0 (select (arr!18301 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89647 () Bool)

(declare-fun res!409620 () Bool)

(assert (=> d!89647 (=> res!409620 e!362183)))

(assert (=> d!89647 (= res!409620 (bvsge #b00000000000000000000000000000000 (size!18665 a!2986)))))

(assert (=> d!89647 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!362183)))

(declare-fun b!633442 () Bool)

(declare-fun e!362182 () Bool)

(declare-fun call!33375 () Bool)

(assert (=> b!633442 (= e!362182 call!33375)))

(declare-fun bm!33372 () Bool)

(assert (=> bm!33372 (= call!33375 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!633443 () Bool)

(assert (=> b!633443 (= e!362184 call!33375)))

(declare-fun b!633444 () Bool)

(assert (=> b!633444 (= e!362184 e!362182)))

(declare-fun lt!292771 () (_ BitVec 64))

(assert (=> b!633444 (= lt!292771 (select (arr!18301 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292773 () Unit!21297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38145 (_ BitVec 64) (_ BitVec 32)) Unit!21297)

(assert (=> b!633444 (= lt!292773 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292771 #b00000000000000000000000000000000))))

(assert (=> b!633444 (arrayContainsKey!0 a!2986 lt!292771 #b00000000000000000000000000000000)))

(declare-fun lt!292772 () Unit!21297)

(assert (=> b!633444 (= lt!292772 lt!292773)))

(declare-fun res!409621 () Bool)

(assert (=> b!633444 (= res!409621 (= (seekEntryOrOpen!0 (select (arr!18301 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6697 #b00000000000000000000000000000000)))))

(assert (=> b!633444 (=> (not res!409621) (not e!362182))))

(assert (= (and d!89647 (not res!409620)) b!633441))

(assert (= (and b!633441 c!72278) b!633444))

(assert (= (and b!633441 (not c!72278)) b!633443))

(assert (= (and b!633444 res!409621) b!633442))

(assert (= (or b!633442 b!633443) bm!33372))

(assert (=> b!633441 m!608413))

(assert (=> b!633441 m!608413))

(assert (=> b!633441 m!608421))

(declare-fun m!608483 () Bool)

(assert (=> bm!33372 m!608483))

(assert (=> b!633444 m!608413))

(declare-fun m!608485 () Bool)

(assert (=> b!633444 m!608485))

(declare-fun m!608487 () Bool)

(assert (=> b!633444 m!608487))

(assert (=> b!633444 m!608413))

(declare-fun m!608489 () Bool)

(assert (=> b!633444 m!608489))

(assert (=> b!633224 d!89647))

(declare-fun b!633506 () Bool)

(declare-fun c!72310 () Bool)

(declare-fun lt!292795 () (_ BitVec 64))

(assert (=> b!633506 (= c!72310 (= lt!292795 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!362220 () SeekEntryResult!6697)

(declare-fun e!362218 () SeekEntryResult!6697)

(assert (=> b!633506 (= e!362220 e!362218)))

(declare-fun b!633507 () Bool)

(declare-fun lt!292797 () SeekEntryResult!6697)

(assert (=> b!633507 (= e!362220 (Found!6697 (index!29086 lt!292797)))))

(declare-fun b!633508 () Bool)

(declare-fun e!362219 () SeekEntryResult!6697)

(assert (=> b!633508 (= e!362219 e!362220)))

(assert (=> b!633508 (= lt!292795 (select (arr!18301 a!2986) (index!29086 lt!292797)))))

(declare-fun c!72311 () Bool)

(assert (=> b!633508 (= c!72311 (= lt!292795 k0!1786))))

(declare-fun b!633509 () Bool)

(assert (=> b!633509 (= e!362219 Undefined!6697)))

(declare-fun b!633510 () Bool)

(assert (=> b!633510 (= e!362218 (MissingZero!6697 (index!29086 lt!292797)))))

(declare-fun d!89653 () Bool)

(declare-fun lt!292796 () SeekEntryResult!6697)

(assert (=> d!89653 (and (or ((_ is Undefined!6697) lt!292796) (not ((_ is Found!6697) lt!292796)) (and (bvsge (index!29085 lt!292796) #b00000000000000000000000000000000) (bvslt (index!29085 lt!292796) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292796) ((_ is Found!6697) lt!292796) (not ((_ is MissingZero!6697) lt!292796)) (and (bvsge (index!29084 lt!292796) #b00000000000000000000000000000000) (bvslt (index!29084 lt!292796) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292796) ((_ is Found!6697) lt!292796) ((_ is MissingZero!6697) lt!292796) (not ((_ is MissingVacant!6697) lt!292796)) (and (bvsge (index!29087 lt!292796) #b00000000000000000000000000000000) (bvslt (index!29087 lt!292796) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292796) (ite ((_ is Found!6697) lt!292796) (= (select (arr!18301 a!2986) (index!29085 lt!292796)) k0!1786) (ite ((_ is MissingZero!6697) lt!292796) (= (select (arr!18301 a!2986) (index!29084 lt!292796)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6697) lt!292796) (= (select (arr!18301 a!2986) (index!29087 lt!292796)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89653 (= lt!292796 e!362219)))

(declare-fun c!72309 () Bool)

(assert (=> d!89653 (= c!72309 (and ((_ is Intermediate!6697) lt!292797) (undefined!7509 lt!292797)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38145 (_ BitVec 32)) SeekEntryResult!6697)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89653 (= lt!292797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89653 (validMask!0 mask!3053)))

(assert (=> d!89653 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292796)))

(declare-fun b!633511 () Bool)

(assert (=> b!633511 (= e!362218 (seekKeyOrZeroReturnVacant!0 (x!57976 lt!292797) (index!29086 lt!292797) (index!29086 lt!292797) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89653 c!72309) b!633509))

(assert (= (and d!89653 (not c!72309)) b!633508))

(assert (= (and b!633508 c!72311) b!633507))

(assert (= (and b!633508 (not c!72311)) b!633506))

(assert (= (and b!633506 c!72310) b!633510))

(assert (= (and b!633506 (not c!72310)) b!633511))

(declare-fun m!608531 () Bool)

(assert (=> b!633508 m!608531))

(declare-fun m!608533 () Bool)

(assert (=> d!89653 m!608533))

(declare-fun m!608535 () Bool)

(assert (=> d!89653 m!608535))

(assert (=> d!89653 m!608293))

(assert (=> d!89653 m!608535))

(declare-fun m!608537 () Bool)

(assert (=> d!89653 m!608537))

(declare-fun m!608539 () Bool)

(assert (=> d!89653 m!608539))

(declare-fun m!608541 () Bool)

(assert (=> d!89653 m!608541))

(declare-fun m!608545 () Bool)

(assert (=> b!633511 m!608545))

(assert (=> b!633214 d!89653))

(declare-fun b!633512 () Bool)

(declare-fun e!362223 () SeekEntryResult!6697)

(assert (=> b!633512 (= e!362223 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633513 () Bool)

(declare-fun e!362221 () SeekEntryResult!6697)

(assert (=> b!633513 (= e!362221 (Found!6697 index!984))))

(declare-fun b!633514 () Bool)

(declare-fun c!72313 () Bool)

(declare-fun lt!292801 () (_ BitVec 64))

(assert (=> b!633514 (= c!72313 (= lt!292801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633514 (= e!362221 e!362223)))

(declare-fun b!633515 () Bool)

(assert (=> b!633515 (= e!362223 (MissingVacant!6697 vacantSpotIndex!68))))

(declare-fun lt!292802 () SeekEntryResult!6697)

(declare-fun d!89667 () Bool)

(assert (=> d!89667 (and (or ((_ is Undefined!6697) lt!292802) (not ((_ is Found!6697) lt!292802)) (and (bvsge (index!29085 lt!292802) #b00000000000000000000000000000000) (bvslt (index!29085 lt!292802) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292802) ((_ is Found!6697) lt!292802) (not ((_ is MissingVacant!6697) lt!292802)) (not (= (index!29087 lt!292802) vacantSpotIndex!68)) (and (bvsge (index!29087 lt!292802) #b00000000000000000000000000000000) (bvslt (index!29087 lt!292802) (size!18665 a!2986)))) (or ((_ is Undefined!6697) lt!292802) (ite ((_ is Found!6697) lt!292802) (= (select (arr!18301 a!2986) (index!29085 lt!292802)) (select (arr!18301 a!2986) j!136)) (and ((_ is MissingVacant!6697) lt!292802) (= (index!29087 lt!292802) vacantSpotIndex!68) (= (select (arr!18301 a!2986) (index!29087 lt!292802)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362222 () SeekEntryResult!6697)

(assert (=> d!89667 (= lt!292802 e!362222)))

(declare-fun c!72314 () Bool)

(assert (=> d!89667 (= c!72314 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89667 (= lt!292801 (select (arr!18301 a!2986) index!984))))

(assert (=> d!89667 (validMask!0 mask!3053)))

(assert (=> d!89667 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053) lt!292802)))

(declare-fun b!633516 () Bool)

(assert (=> b!633516 (= e!362222 Undefined!6697)))

(declare-fun b!633517 () Bool)

(assert (=> b!633517 (= e!362222 e!362221)))

(declare-fun c!72312 () Bool)

(assert (=> b!633517 (= c!72312 (= lt!292801 (select (arr!18301 a!2986) j!136)))))

(assert (= (and d!89667 c!72314) b!633516))

(assert (= (and d!89667 (not c!72314)) b!633517))

(assert (= (and b!633517 c!72312) b!633513))

(assert (= (and b!633517 (not c!72312)) b!633514))

(assert (= (and b!633514 c!72313) b!633515))

(assert (= (and b!633514 (not c!72313)) b!633512))

(assert (=> b!633512 m!608423))

(assert (=> b!633512 m!608423))

(assert (=> b!633512 m!608275))

(declare-fun m!608547 () Bool)

(assert (=> b!633512 m!608547))

(declare-fun m!608549 () Bool)

(assert (=> d!89667 m!608549))

(declare-fun m!608551 () Bool)

(assert (=> d!89667 m!608551))

(assert (=> d!89667 m!608317))

(assert (=> d!89667 m!608293))

(assert (=> b!633217 d!89667))

(declare-fun d!89675 () Bool)

(assert (=> d!89675 (= (validKeyInArray!0 (select (arr!18301 a!2986) j!136)) (and (not (= (select (arr!18301 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18301 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!633228 d!89675))

(declare-fun d!89683 () Bool)

(assert (=> d!89683 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!633212 d!89683))

(declare-fun d!89685 () Bool)

(declare-fun res!409629 () Bool)

(declare-fun e!362231 () Bool)

(assert (=> d!89685 (=> res!409629 e!362231)))

(assert (=> d!89685 (= res!409629 (= (select (arr!18301 lt!292666) index!984) (select (arr!18301 a!2986) j!136)))))

(assert (=> d!89685 (= (arrayContainsKey!0 lt!292666 (select (arr!18301 a!2986) j!136) index!984) e!362231)))

(declare-fun b!633528 () Bool)

(declare-fun e!362232 () Bool)

(assert (=> b!633528 (= e!362231 e!362232)))

(declare-fun res!409630 () Bool)

(assert (=> b!633528 (=> (not res!409630) (not e!362232))))

(assert (=> b!633528 (= res!409630 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18665 lt!292666)))))

(declare-fun b!633529 () Bool)

(assert (=> b!633529 (= e!362232 (arrayContainsKey!0 lt!292666 (select (arr!18301 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89685 (not res!409629)) b!633528))

(assert (= (and b!633528 res!409630) b!633529))

(assert (=> d!89685 m!608431))

(assert (=> b!633529 m!608275))

(declare-fun m!608561 () Bool)

(assert (=> b!633529 m!608561))

(assert (=> b!633223 d!89685))

(declare-fun d!89687 () Bool)

(declare-fun res!409631 () Bool)

(declare-fun e!362233 () Bool)

(assert (=> d!89687 (=> res!409631 e!362233)))

(assert (=> d!89687 (= res!409631 (= (select (arr!18301 lt!292666) j!136) (select (arr!18301 a!2986) j!136)))))

(assert (=> d!89687 (= (arrayContainsKey!0 lt!292666 (select (arr!18301 a!2986) j!136) j!136) e!362233)))

(declare-fun b!633530 () Bool)

(declare-fun e!362234 () Bool)

(assert (=> b!633530 (= e!362233 e!362234)))

(declare-fun res!409632 () Bool)

(assert (=> b!633530 (=> (not res!409632) (not e!362234))))

(assert (=> b!633530 (= res!409632 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18665 lt!292666)))))

(declare-fun b!633531 () Bool)

(assert (=> b!633531 (= e!362234 (arrayContainsKey!0 lt!292666 (select (arr!18301 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89687 (not res!409631)) b!633530))

(assert (= (and b!633530 res!409632) b!633531))

(declare-fun m!608573 () Bool)

(assert (=> d!89687 m!608573))

(assert (=> b!633531 m!608275))

(declare-fun m!608575 () Bool)

(assert (=> b!633531 m!608575))

(assert (=> b!633218 d!89687))

(check-sat (not b!633413) (not bm!33372) (not b!633371) (not d!89633) (not b!633357) (not d!89639) (not b!633358) (not b!633377) (not d!89667) (not bm!33366) (not b!633529) (not b!633395) (not b!633444) (not d!89631) (not d!89653) (not b!633355) (not d!89629) (not b!633511) (not b!633441) (not b!633531) (not b!633512) (not d!89645) (not b!633343))
(check-sat)
