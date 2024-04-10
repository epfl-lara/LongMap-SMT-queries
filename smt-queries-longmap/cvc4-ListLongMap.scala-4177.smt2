; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56922 () Bool)

(assert start!56922)

(declare-fun res!407519 () Bool)

(declare-fun e!360409 () Bool)

(assert (=> start!56922 (=> (not res!407519) (not e!360409))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56922 (= res!407519 (validMask!0 mask!3053))))

(assert (=> start!56922 e!360409))

(assert (=> start!56922 true))

(declare-datatypes ((array!38055 0))(
  ( (array!38056 (arr!18263 (Array (_ BitVec 32) (_ BitVec 64))) (size!18627 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38055)

(declare-fun array_inv!14059 (array!38055) Bool)

(assert (=> start!56922 (array_inv!14059 a!2986)))

(declare-fun b!630303 () Bool)

(declare-fun res!407518 () Bool)

(assert (=> b!630303 (=> (not res!407518) (not e!360409))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630303 (= res!407518 (validKeyInArray!0 (select (arr!18263 a!2986) j!136)))))

(declare-fun b!630304 () Bool)

(declare-fun e!360407 () Bool)

(declare-fun e!360410 () Bool)

(assert (=> b!630304 (= e!360407 e!360410)))

(declare-fun res!407525 () Bool)

(assert (=> b!630304 (=> (not res!407525) (not e!360410))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!630304 (= res!407525 (= (select (store (arr!18263 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291128 () array!38055)

(assert (=> b!630304 (= lt!291128 (array!38056 (store (arr!18263 a!2986) i!1108 k!1786) (size!18627 a!2986)))))

(declare-fun b!630305 () Bool)

(declare-fun e!360406 () Bool)

(assert (=> b!630305 (= e!360410 e!360406)))

(declare-fun res!407521 () Bool)

(assert (=> b!630305 (=> (not res!407521) (not e!360406))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6703 0))(
  ( (MissingZero!6703 (index!29099 (_ BitVec 32))) (Found!6703 (index!29100 (_ BitVec 32))) (Intermediate!6703 (undefined!7515 Bool) (index!29101 (_ BitVec 32)) (x!57832 (_ BitVec 32))) (Undefined!6703) (MissingVacant!6703 (index!29102 (_ BitVec 32))) )
))
(declare-fun lt!291127 () SeekEntryResult!6703)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630305 (= res!407521 (and (= lt!291127 (Found!6703 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18263 a!2986) index!984) (select (arr!18263 a!2986) j!136))) (not (= (select (arr!18263 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38055 (_ BitVec 32)) SeekEntryResult!6703)

(assert (=> b!630305 (= lt!291127 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630306 () Bool)

(declare-fun res!407522 () Bool)

(assert (=> b!630306 (=> (not res!407522) (not e!360407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38055 (_ BitVec 32)) Bool)

(assert (=> b!630306 (= res!407522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630307 () Bool)

(assert (=> b!630307 (= e!360409 e!360407)))

(declare-fun res!407517 () Bool)

(assert (=> b!630307 (=> (not res!407517) (not e!360407))))

(declare-fun lt!291125 () SeekEntryResult!6703)

(assert (=> b!630307 (= res!407517 (or (= lt!291125 (MissingZero!6703 i!1108)) (= lt!291125 (MissingVacant!6703 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38055 (_ BitVec 32)) SeekEntryResult!6703)

(assert (=> b!630307 (= lt!291125 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630308 () Bool)

(declare-fun res!407523 () Bool)

(assert (=> b!630308 (=> (not res!407523) (not e!360407))))

(assert (=> b!630308 (= res!407523 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18263 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630309 () Bool)

(declare-fun res!407528 () Bool)

(assert (=> b!630309 (=> (not res!407528) (not e!360407))))

(declare-datatypes ((List!12304 0))(
  ( (Nil!12301) (Cons!12300 (h!13345 (_ BitVec 64)) (t!18532 List!12304)) )
))
(declare-fun arrayNoDuplicates!0 (array!38055 (_ BitVec 32) List!12304) Bool)

(assert (=> b!630309 (= res!407528 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12301))))

(declare-fun b!630310 () Bool)

(declare-fun res!407524 () Bool)

(assert (=> b!630310 (=> (not res!407524) (not e!360409))))

(assert (=> b!630310 (= res!407524 (and (= (size!18627 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18627 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18627 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630311 () Bool)

(declare-fun e!360411 () Bool)

(declare-fun lt!291124 () SeekEntryResult!6703)

(assert (=> b!630311 (= e!360411 (= lt!291127 lt!291124))))

(declare-fun b!630312 () Bool)

(declare-fun res!407526 () Bool)

(assert (=> b!630312 (=> (not res!407526) (not e!360409))))

(assert (=> b!630312 (= res!407526 (validKeyInArray!0 k!1786))))

(declare-fun b!630313 () Bool)

(declare-fun lt!291126 () (_ BitVec 64))

(assert (=> b!630313 (= e!360406 (not (not (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291126 lt!291128 mask!3053) Undefined!6703))))))

(assert (=> b!630313 e!360411))

(declare-fun res!407527 () Bool)

(assert (=> b!630313 (=> (not res!407527) (not e!360411))))

(declare-fun lt!291129 () (_ BitVec 32))

(assert (=> b!630313 (= res!407527 (= lt!291124 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 lt!291126 lt!291128 mask!3053)))))

(assert (=> b!630313 (= lt!291124 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630313 (= lt!291126 (select (store (arr!18263 a!2986) i!1108 k!1786) j!136))))

(declare-datatypes ((Unit!21148 0))(
  ( (Unit!21149) )
))
(declare-fun lt!291130 () Unit!21148)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21148)

(assert (=> b!630313 (= lt!291130 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630313 (= lt!291129 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630314 () Bool)

(declare-fun res!407520 () Bool)

(assert (=> b!630314 (=> (not res!407520) (not e!360409))))

(declare-fun arrayContainsKey!0 (array!38055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630314 (= res!407520 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56922 res!407519) b!630310))

(assert (= (and b!630310 res!407524) b!630303))

(assert (= (and b!630303 res!407518) b!630312))

(assert (= (and b!630312 res!407526) b!630314))

(assert (= (and b!630314 res!407520) b!630307))

(assert (= (and b!630307 res!407517) b!630306))

(assert (= (and b!630306 res!407522) b!630309))

(assert (= (and b!630309 res!407528) b!630308))

(assert (= (and b!630308 res!407523) b!630304))

(assert (= (and b!630304 res!407525) b!630305))

(assert (= (and b!630305 res!407521) b!630313))

(assert (= (and b!630313 res!407527) b!630311))

(declare-fun m!605333 () Bool)

(assert (=> b!630314 m!605333))

(declare-fun m!605335 () Bool)

(assert (=> start!56922 m!605335))

(declare-fun m!605337 () Bool)

(assert (=> start!56922 m!605337))

(declare-fun m!605339 () Bool)

(assert (=> b!630309 m!605339))

(declare-fun m!605341 () Bool)

(assert (=> b!630307 m!605341))

(declare-fun m!605343 () Bool)

(assert (=> b!630312 m!605343))

(declare-fun m!605345 () Bool)

(assert (=> b!630306 m!605345))

(declare-fun m!605347 () Bool)

(assert (=> b!630305 m!605347))

(declare-fun m!605349 () Bool)

(assert (=> b!630305 m!605349))

(assert (=> b!630305 m!605349))

(declare-fun m!605351 () Bool)

(assert (=> b!630305 m!605351))

(declare-fun m!605353 () Bool)

(assert (=> b!630308 m!605353))

(declare-fun m!605355 () Bool)

(assert (=> b!630304 m!605355))

(declare-fun m!605357 () Bool)

(assert (=> b!630304 m!605357))

(assert (=> b!630303 m!605349))

(assert (=> b!630303 m!605349))

(declare-fun m!605359 () Bool)

(assert (=> b!630303 m!605359))

(declare-fun m!605361 () Bool)

(assert (=> b!630313 m!605361))

(assert (=> b!630313 m!605349))

(assert (=> b!630313 m!605355))

(declare-fun m!605363 () Bool)

(assert (=> b!630313 m!605363))

(declare-fun m!605365 () Bool)

(assert (=> b!630313 m!605365))

(declare-fun m!605367 () Bool)

(assert (=> b!630313 m!605367))

(declare-fun m!605369 () Bool)

(assert (=> b!630313 m!605369))

(assert (=> b!630313 m!605349))

(declare-fun m!605371 () Bool)

(assert (=> b!630313 m!605371))

(push 1)

(assert (not b!630314))

(assert (not b!630305))

(assert (not b!630306))

(assert (not b!630313))

(assert (not b!630312))

(assert (not start!56922))

(assert (not b!630303))

(assert (not b!630307))

(assert (not b!630309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89229 () Bool)

(assert (=> d!89229 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630312 d!89229))

(declare-fun b!630408 () Bool)

(declare-fun e!360469 () SeekEntryResult!6703)

(declare-fun lt!291174 () SeekEntryResult!6703)

(assert (=> b!630408 (= e!360469 (MissingZero!6703 (index!29101 lt!291174)))))

(declare-fun d!89231 () Bool)

(declare-fun lt!291175 () SeekEntryResult!6703)

(assert (=> d!89231 (and (or (is-Undefined!6703 lt!291175) (not (is-Found!6703 lt!291175)) (and (bvsge (index!29100 lt!291175) #b00000000000000000000000000000000) (bvslt (index!29100 lt!291175) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291175) (is-Found!6703 lt!291175) (not (is-MissingZero!6703 lt!291175)) (and (bvsge (index!29099 lt!291175) #b00000000000000000000000000000000) (bvslt (index!29099 lt!291175) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291175) (is-Found!6703 lt!291175) (is-MissingZero!6703 lt!291175) (not (is-MissingVacant!6703 lt!291175)) (and (bvsge (index!29102 lt!291175) #b00000000000000000000000000000000) (bvslt (index!29102 lt!291175) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291175) (ite (is-Found!6703 lt!291175) (= (select (arr!18263 a!2986) (index!29100 lt!291175)) k!1786) (ite (is-MissingZero!6703 lt!291175) (= (select (arr!18263 a!2986) (index!29099 lt!291175)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6703 lt!291175) (= (select (arr!18263 a!2986) (index!29102 lt!291175)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!360470 () SeekEntryResult!6703)

(assert (=> d!89231 (= lt!291175 e!360470)))

(declare-fun c!71797 () Bool)

(assert (=> d!89231 (= c!71797 (and (is-Intermediate!6703 lt!291174) (undefined!7515 lt!291174)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38055 (_ BitVec 32)) SeekEntryResult!6703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89231 (= lt!291174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89231 (validMask!0 mask!3053)))

(assert (=> d!89231 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!291175)))

(declare-fun b!630409 () Bool)

(assert (=> b!630409 (= e!360469 (seekKeyOrZeroReturnVacant!0 (x!57832 lt!291174) (index!29101 lt!291174) (index!29101 lt!291174) k!1786 a!2986 mask!3053))))

(declare-fun b!630410 () Bool)

(declare-fun e!360471 () SeekEntryResult!6703)

(assert (=> b!630410 (= e!360471 (Found!6703 (index!29101 lt!291174)))))

(declare-fun b!630411 () Bool)

(declare-fun c!71798 () Bool)

(declare-fun lt!291173 () (_ BitVec 64))

(assert (=> b!630411 (= c!71798 (= lt!291173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630411 (= e!360471 e!360469)))

(declare-fun b!630412 () Bool)

(assert (=> b!630412 (= e!360470 e!360471)))

(assert (=> b!630412 (= lt!291173 (select (arr!18263 a!2986) (index!29101 lt!291174)))))

(declare-fun c!71796 () Bool)

(assert (=> b!630412 (= c!71796 (= lt!291173 k!1786))))

(declare-fun b!630413 () Bool)

(assert (=> b!630413 (= e!360470 Undefined!6703)))

(assert (= (and d!89231 c!71797) b!630413))

(assert (= (and d!89231 (not c!71797)) b!630412))

(assert (= (and b!630412 c!71796) b!630410))

(assert (= (and b!630412 (not c!71796)) b!630411))

(assert (= (and b!630411 c!71798) b!630408))

(assert (= (and b!630411 (not c!71798)) b!630409))

(declare-fun m!605443 () Bool)

(assert (=> d!89231 m!605443))

(declare-fun m!605445 () Bool)

(assert (=> d!89231 m!605445))

(declare-fun m!605447 () Bool)

(assert (=> d!89231 m!605447))

(declare-fun m!605449 () Bool)

(assert (=> d!89231 m!605449))

(assert (=> d!89231 m!605445))

(declare-fun m!605451 () Bool)

(assert (=> d!89231 m!605451))

(assert (=> d!89231 m!605335))

(declare-fun m!605453 () Bool)

(assert (=> b!630409 m!605453))

(declare-fun m!605455 () Bool)

(assert (=> b!630412 m!605455))

(assert (=> b!630307 d!89231))

(declare-fun b!630437 () Bool)

(declare-fun e!360492 () Bool)

(declare-fun call!33317 () Bool)

(assert (=> b!630437 (= e!360492 call!33317)))

(declare-fun d!89249 () Bool)

(declare-fun res!407564 () Bool)

(declare-fun e!360491 () Bool)

(assert (=> d!89249 (=> res!407564 e!360491)))

(assert (=> d!89249 (= res!407564 (bvsge #b00000000000000000000000000000000 (size!18627 a!2986)))))

(assert (=> d!89249 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360491)))

(declare-fun b!630438 () Bool)

(declare-fun e!360490 () Bool)

(assert (=> b!630438 (= e!360491 e!360490)))

(declare-fun c!71804 () Bool)

(assert (=> b!630438 (= c!71804 (validKeyInArray!0 (select (arr!18263 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630439 () Bool)

(assert (=> b!630439 (= e!360490 e!360492)))

(declare-fun lt!291184 () (_ BitVec 64))

(assert (=> b!630439 (= lt!291184 (select (arr!18263 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291182 () Unit!21148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38055 (_ BitVec 64) (_ BitVec 32)) Unit!21148)

(assert (=> b!630439 (= lt!291182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291184 #b00000000000000000000000000000000))))

(assert (=> b!630439 (arrayContainsKey!0 a!2986 lt!291184 #b00000000000000000000000000000000)))

(declare-fun lt!291183 () Unit!21148)

(assert (=> b!630439 (= lt!291183 lt!291182)))

(declare-fun res!407563 () Bool)

(assert (=> b!630439 (= res!407563 (= (seekEntryOrOpen!0 (select (arr!18263 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6703 #b00000000000000000000000000000000)))))

(assert (=> b!630439 (=> (not res!407563) (not e!360492))))

(declare-fun bm!33314 () Bool)

(assert (=> bm!33314 (= call!33317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!630440 () Bool)

(assert (=> b!630440 (= e!360490 call!33317)))

(assert (= (and d!89249 (not res!407564)) b!630438))

(assert (= (and b!630438 c!71804) b!630439))

(assert (= (and b!630438 (not c!71804)) b!630440))

(assert (= (and b!630439 res!407563) b!630437))

(assert (= (or b!630437 b!630440) bm!33314))

(declare-fun m!605463 () Bool)

(assert (=> b!630438 m!605463))

(assert (=> b!630438 m!605463))

(declare-fun m!605465 () Bool)

(assert (=> b!630438 m!605465))

(assert (=> b!630439 m!605463))

(declare-fun m!605467 () Bool)

(assert (=> b!630439 m!605467))

(declare-fun m!605469 () Bool)

(assert (=> b!630439 m!605469))

(assert (=> b!630439 m!605463))

(declare-fun m!605471 () Bool)

(assert (=> b!630439 m!605471))

(declare-fun m!605473 () Bool)

(assert (=> bm!33314 m!605473))

(assert (=> b!630306 d!89249))

(declare-fun d!89253 () Bool)

(assert (=> d!89253 (= (validKeyInArray!0 (select (arr!18263 a!2986) j!136)) (and (not (= (select (arr!18263 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18263 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630303 d!89253))

(declare-fun e!360520 () SeekEntryResult!6703)

(declare-fun b!630489 () Bool)

(assert (=> b!630489 (= e!360520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291129 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630490 () Bool)

(declare-fun e!360522 () SeekEntryResult!6703)

(declare-fun e!360521 () SeekEntryResult!6703)

(assert (=> b!630490 (= e!360522 e!360521)))

(declare-fun c!71828 () Bool)

(declare-fun lt!291207 () (_ BitVec 64))

(assert (=> b!630490 (= c!71828 (= lt!291207 (select (arr!18263 a!2986) j!136)))))

(declare-fun b!630491 () Bool)

(declare-fun c!71827 () Bool)

(assert (=> b!630491 (= c!71827 (= lt!291207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630491 (= e!360521 e!360520)))

(declare-fun lt!291206 () SeekEntryResult!6703)

(declare-fun d!89255 () Bool)

(assert (=> d!89255 (and (or (is-Undefined!6703 lt!291206) (not (is-Found!6703 lt!291206)) (and (bvsge (index!29100 lt!291206) #b00000000000000000000000000000000) (bvslt (index!29100 lt!291206) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291206) (is-Found!6703 lt!291206) (not (is-MissingVacant!6703 lt!291206)) (not (= (index!29102 lt!291206) vacantSpotIndex!68)) (and (bvsge (index!29102 lt!291206) #b00000000000000000000000000000000) (bvslt (index!29102 lt!291206) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291206) (ite (is-Found!6703 lt!291206) (= (select (arr!18263 a!2986) (index!29100 lt!291206)) (select (arr!18263 a!2986) j!136)) (and (is-MissingVacant!6703 lt!291206) (= (index!29102 lt!291206) vacantSpotIndex!68) (= (select (arr!18263 a!2986) (index!29102 lt!291206)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89255 (= lt!291206 e!360522)))

(declare-fun c!71826 () Bool)

(assert (=> d!89255 (= c!71826 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89255 (= lt!291207 (select (arr!18263 a!2986) lt!291129))))

(assert (=> d!89255 (validMask!0 mask!3053)))

(assert (=> d!89255 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053) lt!291206)))

(declare-fun b!630492 () Bool)

(assert (=> b!630492 (= e!360520 (MissingVacant!6703 vacantSpotIndex!68))))

(declare-fun b!630493 () Bool)

(assert (=> b!630493 (= e!360522 Undefined!6703)))

(declare-fun b!630494 () Bool)

(assert (=> b!630494 (= e!360521 (Found!6703 lt!291129))))

(assert (= (and d!89255 c!71826) b!630493))

(assert (= (and d!89255 (not c!71826)) b!630490))

(assert (= (and b!630490 c!71828) b!630494))

(assert (= (and b!630490 (not c!71828)) b!630491))

(assert (= (and b!630491 c!71827) b!630492))

(assert (= (and b!630491 (not c!71827)) b!630489))

(declare-fun m!605501 () Bool)

(assert (=> b!630489 m!605501))

(assert (=> b!630489 m!605501))

(assert (=> b!630489 m!605349))

(declare-fun m!605503 () Bool)

(assert (=> b!630489 m!605503))

(declare-fun m!605505 () Bool)

(assert (=> d!89255 m!605505))

(declare-fun m!605507 () Bool)

(assert (=> d!89255 m!605507))

(declare-fun m!605509 () Bool)

(assert (=> d!89255 m!605509))

(assert (=> d!89255 m!605335))

(assert (=> b!630313 d!89255))

(declare-fun d!89267 () Bool)

(declare-fun lt!291210 () (_ BitVec 32))

(assert (=> d!89267 (and (bvsge lt!291210 #b00000000000000000000000000000000) (bvslt lt!291210 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89267 (= lt!291210 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89267 (validMask!0 mask!3053)))

(assert (=> d!89267 (= (nextIndex!0 index!984 x!910 mask!3053) lt!291210)))

(declare-fun bs!19004 () Bool)

(assert (= bs!19004 d!89267))

(declare-fun m!605511 () Bool)

(assert (=> bs!19004 m!605511))

(assert (=> bs!19004 m!605335))

(assert (=> b!630313 d!89267))

(declare-fun e!360523 () SeekEntryResult!6703)

(declare-fun b!630495 () Bool)

(assert (=> b!630495 (= e!360523 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291129 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!291126 lt!291128 mask!3053))))

(declare-fun b!630496 () Bool)

(declare-fun e!360525 () SeekEntryResult!6703)

(declare-fun e!360524 () SeekEntryResult!6703)

(assert (=> b!630496 (= e!360525 e!360524)))

(declare-fun c!71831 () Bool)

(declare-fun lt!291212 () (_ BitVec 64))

(assert (=> b!630496 (= c!71831 (= lt!291212 lt!291126))))

(declare-fun b!630497 () Bool)

(declare-fun c!71830 () Bool)

(assert (=> b!630497 (= c!71830 (= lt!291212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630497 (= e!360524 e!360523)))

(declare-fun lt!291211 () SeekEntryResult!6703)

(declare-fun d!89269 () Bool)

(assert (=> d!89269 (and (or (is-Undefined!6703 lt!291211) (not (is-Found!6703 lt!291211)) (and (bvsge (index!29100 lt!291211) #b00000000000000000000000000000000) (bvslt (index!29100 lt!291211) (size!18627 lt!291128)))) (or (is-Undefined!6703 lt!291211) (is-Found!6703 lt!291211) (not (is-MissingVacant!6703 lt!291211)) (not (= (index!29102 lt!291211) vacantSpotIndex!68)) (and (bvsge (index!29102 lt!291211) #b00000000000000000000000000000000) (bvslt (index!29102 lt!291211) (size!18627 lt!291128)))) (or (is-Undefined!6703 lt!291211) (ite (is-Found!6703 lt!291211) (= (select (arr!18263 lt!291128) (index!29100 lt!291211)) lt!291126) (and (is-MissingVacant!6703 lt!291211) (= (index!29102 lt!291211) vacantSpotIndex!68) (= (select (arr!18263 lt!291128) (index!29102 lt!291211)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89269 (= lt!291211 e!360525)))

(declare-fun c!71829 () Bool)

(assert (=> d!89269 (= c!71829 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89269 (= lt!291212 (select (arr!18263 lt!291128) lt!291129))))

(assert (=> d!89269 (validMask!0 mask!3053)))

(assert (=> d!89269 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 lt!291126 lt!291128 mask!3053) lt!291211)))

(declare-fun b!630498 () Bool)

(assert (=> b!630498 (= e!360523 (MissingVacant!6703 vacantSpotIndex!68))))

(declare-fun b!630499 () Bool)

(assert (=> b!630499 (= e!360525 Undefined!6703)))

(declare-fun b!630500 () Bool)

(assert (=> b!630500 (= e!360524 (Found!6703 lt!291129))))

(assert (= (and d!89269 c!71829) b!630499))

(assert (= (and d!89269 (not c!71829)) b!630496))

(assert (= (and b!630496 c!71831) b!630500))

(assert (= (and b!630496 (not c!71831)) b!630497))

(assert (= (and b!630497 c!71830) b!630498))

(assert (= (and b!630497 (not c!71830)) b!630495))

(assert (=> b!630495 m!605501))

(assert (=> b!630495 m!605501))

(declare-fun m!605513 () Bool)

(assert (=> b!630495 m!605513))

(declare-fun m!605515 () Bool)

(assert (=> d!89269 m!605515))

(declare-fun m!605517 () Bool)

(assert (=> d!89269 m!605517))

(declare-fun m!605519 () Bool)

(assert (=> d!89269 m!605519))

(assert (=> d!89269 m!605335))

(assert (=> b!630313 d!89269))

(declare-fun d!89271 () Bool)

(declare-fun e!360542 () Bool)

(assert (=> d!89271 e!360542))

(declare-fun res!407582 () Bool)

(assert (=> d!89271 (=> (not res!407582) (not e!360542))))

(assert (=> d!89271 (= res!407582 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18627 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18627 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18627 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18627 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18627 a!2986))))))

(declare-fun lt!291223 () Unit!21148)

(declare-fun choose!9 (array!38055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21148)

(assert (=> d!89271 (= lt!291223 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89271 (validMask!0 mask!3053)))

(assert (=> d!89271 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 mask!3053) lt!291223)))

(declare-fun b!630522 () Bool)

(assert (=> b!630522 (= e!360542 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291129 vacantSpotIndex!68 (select (store (arr!18263 a!2986) i!1108 k!1786) j!136) (array!38056 (store (arr!18263 a!2986) i!1108 k!1786) (size!18627 a!2986)) mask!3053)))))

(assert (= (and d!89271 res!407582) b!630522))

(declare-fun m!605535 () Bool)

(assert (=> d!89271 m!605535))

(assert (=> d!89271 m!605335))

(assert (=> b!630522 m!605361))

(assert (=> b!630522 m!605355))

(assert (=> b!630522 m!605349))

(assert (=> b!630522 m!605371))

(assert (=> b!630522 m!605349))

(assert (=> b!630522 m!605361))

(declare-fun m!605537 () Bool)

(assert (=> b!630522 m!605537))

(assert (=> b!630313 d!89271))

(declare-fun e!360543 () SeekEntryResult!6703)

(declare-fun b!630523 () Bool)

(assert (=> b!630523 (= e!360543 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291126 lt!291128 mask!3053))))

(declare-fun b!630524 () Bool)

(declare-fun e!360545 () SeekEntryResult!6703)

(declare-fun e!360544 () SeekEntryResult!6703)

(assert (=> b!630524 (= e!360545 e!360544)))

(declare-fun c!71839 () Bool)

(declare-fun lt!291225 () (_ BitVec 64))

(assert (=> b!630524 (= c!71839 (= lt!291225 lt!291126))))

(declare-fun b!630525 () Bool)

(declare-fun c!71838 () Bool)

(assert (=> b!630525 (= c!71838 (= lt!291225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630525 (= e!360544 e!360543)))

(declare-fun d!89281 () Bool)

(declare-fun lt!291224 () SeekEntryResult!6703)

(assert (=> d!89281 (and (or (is-Undefined!6703 lt!291224) (not (is-Found!6703 lt!291224)) (and (bvsge (index!29100 lt!291224) #b00000000000000000000000000000000) (bvslt (index!29100 lt!291224) (size!18627 lt!291128)))) (or (is-Undefined!6703 lt!291224) (is-Found!6703 lt!291224) (not (is-MissingVacant!6703 lt!291224)) (not (= (index!29102 lt!291224) vacantSpotIndex!68)) (and (bvsge (index!29102 lt!291224) #b00000000000000000000000000000000) (bvslt (index!29102 lt!291224) (size!18627 lt!291128)))) (or (is-Undefined!6703 lt!291224) (ite (is-Found!6703 lt!291224) (= (select (arr!18263 lt!291128) (index!29100 lt!291224)) lt!291126) (and (is-MissingVacant!6703 lt!291224) (= (index!29102 lt!291224) vacantSpotIndex!68) (= (select (arr!18263 lt!291128) (index!29102 lt!291224)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89281 (= lt!291224 e!360545)))

(declare-fun c!71837 () Bool)

(assert (=> d!89281 (= c!71837 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89281 (= lt!291225 (select (arr!18263 lt!291128) index!984))))

(assert (=> d!89281 (validMask!0 mask!3053)))

(assert (=> d!89281 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291126 lt!291128 mask!3053) lt!291224)))

(declare-fun b!630526 () Bool)

(assert (=> b!630526 (= e!360543 (MissingVacant!6703 vacantSpotIndex!68))))

(declare-fun b!630527 () Bool)

(assert (=> b!630527 (= e!360545 Undefined!6703)))

(declare-fun b!630528 () Bool)

(assert (=> b!630528 (= e!360544 (Found!6703 index!984))))

(assert (= (and d!89281 c!71837) b!630527))

(assert (= (and d!89281 (not c!71837)) b!630524))

(assert (= (and b!630524 c!71839) b!630528))

(assert (= (and b!630524 (not c!71839)) b!630525))

(assert (= (and b!630525 c!71838) b!630526))

(assert (= (and b!630525 (not c!71838)) b!630523))

(assert (=> b!630523 m!605369))

(assert (=> b!630523 m!605369))

(declare-fun m!605539 () Bool)

(assert (=> b!630523 m!605539))

(declare-fun m!605541 () Bool)

(assert (=> d!89281 m!605541))

(declare-fun m!605543 () Bool)

(assert (=> d!89281 m!605543))

(declare-fun m!605545 () Bool)

(assert (=> d!89281 m!605545))

(assert (=> d!89281 m!605335))

(assert (=> b!630313 d!89281))

(declare-fun d!89283 () Bool)

(assert (=> d!89283 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56922 d!89283))

(declare-fun d!89287 () Bool)

(assert (=> d!89287 (= (array_inv!14059 a!2986) (bvsge (size!18627 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56922 d!89287))

(declare-fun d!89289 () Bool)

(declare-fun res!407590 () Bool)

(declare-fun e!360554 () Bool)

(assert (=> d!89289 (=> res!407590 e!360554)))

(assert (=> d!89289 (= res!407590 (= (select (arr!18263 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89289 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!360554)))

(declare-fun b!630538 () Bool)

(declare-fun e!360555 () Bool)

(assert (=> b!630538 (= e!360554 e!360555)))

(declare-fun res!407591 () Bool)

(assert (=> b!630538 (=> (not res!407591) (not e!360555))))

(assert (=> b!630538 (= res!407591 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18627 a!2986)))))

(declare-fun b!630539 () Bool)

(assert (=> b!630539 (= e!360555 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89289 (not res!407590)) b!630538))

(assert (= (and b!630538 res!407591) b!630539))

(assert (=> d!89289 m!605463))

(declare-fun m!605551 () Bool)

(assert (=> b!630539 m!605551))

(assert (=> b!630314 d!89289))

(declare-fun d!89295 () Bool)

(declare-fun res!407599 () Bool)

(declare-fun e!360564 () Bool)

(assert (=> d!89295 (=> res!407599 e!360564)))

(assert (=> d!89295 (= res!407599 (bvsge #b00000000000000000000000000000000 (size!18627 a!2986)))))

(assert (=> d!89295 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12301) e!360564)))

(declare-fun b!630550 () Bool)

(declare-fun e!360567 () Bool)

(declare-fun e!360566 () Bool)

(assert (=> b!630550 (= e!360567 e!360566)))

(declare-fun c!71843 () Bool)

(assert (=> b!630550 (= c!71843 (validKeyInArray!0 (select (arr!18263 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630551 () Bool)

(declare-fun call!33326 () Bool)

(assert (=> b!630551 (= e!360566 call!33326)))

(declare-fun bm!33323 () Bool)

(assert (=> bm!33323 (= call!33326 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71843 (Cons!12300 (select (arr!18263 a!2986) #b00000000000000000000000000000000) Nil!12301) Nil!12301)))))

(declare-fun b!630552 () Bool)

(assert (=> b!630552 (= e!360564 e!360567)))

(declare-fun res!407600 () Bool)

(assert (=> b!630552 (=> (not res!407600) (not e!360567))))

(declare-fun e!360565 () Bool)

(assert (=> b!630552 (= res!407600 (not e!360565))))

(declare-fun res!407598 () Bool)

(assert (=> b!630552 (=> (not res!407598) (not e!360565))))

(assert (=> b!630552 (= res!407598 (validKeyInArray!0 (select (arr!18263 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630553 () Bool)

(declare-fun contains!3087 (List!12304 (_ BitVec 64)) Bool)

(assert (=> b!630553 (= e!360565 (contains!3087 Nil!12301 (select (arr!18263 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630554 () Bool)

(assert (=> b!630554 (= e!360566 call!33326)))

(assert (= (and d!89295 (not res!407599)) b!630552))

(assert (= (and b!630552 res!407598) b!630553))

(assert (= (and b!630552 res!407600) b!630550))

(assert (= (and b!630550 c!71843) b!630554))

(assert (= (and b!630550 (not c!71843)) b!630551))

(assert (= (or b!630554 b!630551) bm!33323))

(assert (=> b!630550 m!605463))

(assert (=> b!630550 m!605463))

(assert (=> b!630550 m!605465))

(assert (=> bm!33323 m!605463))

(declare-fun m!605553 () Bool)

(assert (=> bm!33323 m!605553))

(assert (=> b!630552 m!605463))

(assert (=> b!630552 m!605463))

(assert (=> b!630552 m!605465))

(assert (=> b!630553 m!605463))

(assert (=> b!630553 m!605463))

(declare-fun m!605555 () Bool)

(assert (=> b!630553 m!605555))

(assert (=> b!630309 d!89295))

(declare-fun b!630555 () Bool)

(declare-fun e!360568 () SeekEntryResult!6703)

(assert (=> b!630555 (= e!360568 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630556 () Bool)

(declare-fun e!360570 () SeekEntryResult!6703)

(declare-fun e!360569 () SeekEntryResult!6703)

(assert (=> b!630556 (= e!360570 e!360569)))

(declare-fun c!71846 () Bool)

(declare-fun lt!291227 () (_ BitVec 64))

(assert (=> b!630556 (= c!71846 (= lt!291227 (select (arr!18263 a!2986) j!136)))))

(declare-fun b!630557 () Bool)

(declare-fun c!71845 () Bool)

(assert (=> b!630557 (= c!71845 (= lt!291227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630557 (= e!360569 e!360568)))

(declare-fun d!89297 () Bool)

(declare-fun lt!291226 () SeekEntryResult!6703)

(assert (=> d!89297 (and (or (is-Undefined!6703 lt!291226) (not (is-Found!6703 lt!291226)) (and (bvsge (index!29100 lt!291226) #b00000000000000000000000000000000) (bvslt (index!29100 lt!291226) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291226) (is-Found!6703 lt!291226) (not (is-MissingVacant!6703 lt!291226)) (not (= (index!29102 lt!291226) vacantSpotIndex!68)) (and (bvsge (index!29102 lt!291226) #b00000000000000000000000000000000) (bvslt (index!29102 lt!291226) (size!18627 a!2986)))) (or (is-Undefined!6703 lt!291226) (ite (is-Found!6703 lt!291226) (= (select (arr!18263 a!2986) (index!29100 lt!291226)) (select (arr!18263 a!2986) j!136)) (and (is-MissingVacant!6703 lt!291226) (= (index!29102 lt!291226) vacantSpotIndex!68) (= (select (arr!18263 a!2986) (index!29102 lt!291226)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89297 (= lt!291226 e!360570)))

(declare-fun c!71844 () Bool)

(assert (=> d!89297 (= c!71844 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89297 (= lt!291227 (select (arr!18263 a!2986) index!984))))

(assert (=> d!89297 (validMask!0 mask!3053)))

(assert (=> d!89297 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18263 a!2986) j!136) a!2986 mask!3053) lt!291226)))

(declare-fun b!630558 () Bool)

(assert (=> b!630558 (= e!360568 (MissingVacant!6703 vacantSpotIndex!68))))

(declare-fun b!630559 () Bool)

(assert (=> b!630559 (= e!360570 Undefined!6703)))

(declare-fun b!630560 () Bool)

(assert (=> b!630560 (= e!360569 (Found!6703 index!984))))

(assert (= (and d!89297 c!71844) b!630559))

(assert (= (and d!89297 (not c!71844)) b!630556))

(assert (= (and b!630556 c!71846) b!630560))

(assert (= (and b!630556 (not c!71846)) b!630557))

(assert (= (and b!630557 c!71845) b!630558))

(assert (= (and b!630557 (not c!71845)) b!630555))

(assert (=> b!630555 m!605369))

(assert (=> b!630555 m!605369))

(assert (=> b!630555 m!605349))

(declare-fun m!605557 () Bool)

(assert (=> b!630555 m!605557))

(declare-fun m!605559 () Bool)

(assert (=> d!89297 m!605559))

(declare-fun m!605561 () Bool)

(assert (=> d!89297 m!605561))

(assert (=> d!89297 m!605347))

(assert (=> d!89297 m!605335))

(assert (=> b!630305 d!89297))

(push 1)

(assert (not b!630523))

(assert (not b!630439))

(assert (not d!89267))

(assert (not d!89269))

(assert (not b!630553))

(assert (not d!89281))

(assert (not bm!33314))

(assert (not b!630552))

(assert (not b!630409))

(assert (not bm!33323))

(assert (not d!89297))

(assert (not b!630489))

(assert (not b!630438))

(assert (not d!89255))

(assert (not b!630522))

(assert (not b!630495))

(assert (not d!89231))

(assert (not b!630555))

(assert (not d!89271))

(assert (not b!630539))

(assert (not b!630550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

