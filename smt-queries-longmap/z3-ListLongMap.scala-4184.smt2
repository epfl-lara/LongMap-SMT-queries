; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57022 () Bool)

(assert start!57022)

(declare-fun b!631411 () Bool)

(declare-fun res!408316 () Bool)

(declare-fun e!360996 () Bool)

(assert (=> b!631411 (=> (not res!408316) (not e!360996))))

(declare-datatypes ((array!38098 0))(
  ( (array!38099 (arr!18283 (Array (_ BitVec 32) (_ BitVec 64))) (size!18647 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38098)

(declare-datatypes ((List!12324 0))(
  ( (Nil!12321) (Cons!12320 (h!13365 (_ BitVec 64)) (t!18552 List!12324)) )
))
(declare-fun arrayNoDuplicates!0 (array!38098 (_ BitVec 32) List!12324) Bool)

(assert (=> b!631411 (= res!408316 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12321))))

(declare-fun b!631412 () Bool)

(declare-fun e!361002 () Bool)

(assert (=> b!631412 (= e!360996 e!361002)))

(declare-fun res!408319 () Bool)

(assert (=> b!631412 (=> (not res!408319) (not e!361002))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!631412 (= res!408319 (= (select (store (arr!18283 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291727 () array!38098)

(assert (=> b!631412 (= lt!291727 (array!38099 (store (arr!18283 a!2986) i!1108 k0!1786) (size!18647 a!2986)))))

(declare-fun b!631413 () Bool)

(declare-fun res!408314 () Bool)

(declare-fun e!361000 () Bool)

(assert (=> b!631413 (=> (not res!408314) (not e!361000))))

(declare-fun arrayContainsKey!0 (array!38098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631413 (= res!408314 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631414 () Bool)

(declare-fun res!408315 () Bool)

(assert (=> b!631414 (=> (not res!408315) (not e!361000))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631414 (= res!408315 (validKeyInArray!0 (select (arr!18283 a!2986) j!136)))))

(declare-fun b!631415 () Bool)

(declare-fun res!408309 () Bool)

(assert (=> b!631415 (=> (not res!408309) (not e!361000))))

(assert (=> b!631415 (= res!408309 (validKeyInArray!0 k0!1786))))

(declare-fun b!631416 () Bool)

(assert (=> b!631416 (= e!361000 e!360996)))

(declare-fun res!408318 () Bool)

(assert (=> b!631416 (=> (not res!408318) (not e!360996))))

(declare-datatypes ((SeekEntryResult!6723 0))(
  ( (MissingZero!6723 (index!29182 (_ BitVec 32))) (Found!6723 (index!29183 (_ BitVec 32))) (Intermediate!6723 (undefined!7535 Bool) (index!29184 (_ BitVec 32)) (x!57917 (_ BitVec 32))) (Undefined!6723) (MissingVacant!6723 (index!29185 (_ BitVec 32))) )
))
(declare-fun lt!291731 () SeekEntryResult!6723)

(assert (=> b!631416 (= res!408318 (or (= lt!291731 (MissingZero!6723 i!1108)) (= lt!291731 (MissingVacant!6723 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38098 (_ BitVec 32)) SeekEntryResult!6723)

(assert (=> b!631416 (= lt!291731 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631417 () Bool)

(declare-datatypes ((Unit!21226 0))(
  ( (Unit!21227) )
))
(declare-fun e!360999 () Unit!21226)

(declare-fun Unit!21228 () Unit!21226)

(assert (=> b!631417 (= e!360999 Unit!21228)))

(assert (=> b!631417 false))

(declare-fun b!631418 () Bool)

(declare-fun e!360998 () Bool)

(declare-fun lt!291726 () SeekEntryResult!6723)

(declare-fun lt!291725 () SeekEntryResult!6723)

(assert (=> b!631418 (= e!360998 (= lt!291726 lt!291725))))

(declare-fun b!631419 () Bool)

(declare-fun res!408311 () Bool)

(assert (=> b!631419 (=> (not res!408311) (not e!360996))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631419 (= res!408311 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18283 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631420 () Bool)

(declare-fun Unit!21229 () Unit!21226)

(assert (=> b!631420 (= e!360999 Unit!21229)))

(declare-fun res!408312 () Bool)

(assert (=> start!57022 (=> (not res!408312) (not e!361000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57022 (= res!408312 (validMask!0 mask!3053))))

(assert (=> start!57022 e!361000))

(assert (=> start!57022 true))

(declare-fun array_inv!14079 (array!38098) Bool)

(assert (=> start!57022 (array_inv!14079 a!2986)))

(declare-fun b!631421 () Bool)

(declare-fun e!360997 () Bool)

(declare-fun lt!291729 () SeekEntryResult!6723)

(assert (=> b!631421 (= e!360997 (not (or (not (= lt!291729 (Found!6723 index!984))) (= (select (store (arr!18283 a!2986) i!1108 k0!1786) index!984) (select (arr!18283 a!2986) j!136)))))))

(declare-fun lt!291733 () Unit!21226)

(assert (=> b!631421 (= lt!291733 e!360999)))

(declare-fun c!71918 () Bool)

(assert (=> b!631421 (= c!71918 (= lt!291729 Undefined!6723))))

(declare-fun lt!291732 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38098 (_ BitVec 32)) SeekEntryResult!6723)

(assert (=> b!631421 (= lt!291729 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291732 lt!291727 mask!3053))))

(assert (=> b!631421 e!360998))

(declare-fun res!408317 () Bool)

(assert (=> b!631421 (=> (not res!408317) (not e!360998))))

(declare-fun lt!291728 () (_ BitVec 32))

(assert (=> b!631421 (= res!408317 (= lt!291725 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 lt!291732 lt!291727 mask!3053)))))

(assert (=> b!631421 (= lt!291725 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631421 (= lt!291732 (select (store (arr!18283 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291730 () Unit!21226)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21226)

(assert (=> b!631421 (= lt!291730 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631421 (= lt!291728 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631422 () Bool)

(declare-fun res!408320 () Bool)

(assert (=> b!631422 (=> (not res!408320) (not e!361000))))

(assert (=> b!631422 (= res!408320 (and (= (size!18647 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18647 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18647 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631423 () Bool)

(declare-fun res!408313 () Bool)

(assert (=> b!631423 (=> (not res!408313) (not e!360996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38098 (_ BitVec 32)) Bool)

(assert (=> b!631423 (= res!408313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631424 () Bool)

(assert (=> b!631424 (= e!361002 e!360997)))

(declare-fun res!408310 () Bool)

(assert (=> b!631424 (=> (not res!408310) (not e!360997))))

(assert (=> b!631424 (= res!408310 (and (= lt!291726 (Found!6723 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18283 a!2986) index!984) (select (arr!18283 a!2986) j!136))) (not (= (select (arr!18283 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631424 (= lt!291726 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57022 res!408312) b!631422))

(assert (= (and b!631422 res!408320) b!631414))

(assert (= (and b!631414 res!408315) b!631415))

(assert (= (and b!631415 res!408309) b!631413))

(assert (= (and b!631413 res!408314) b!631416))

(assert (= (and b!631416 res!408318) b!631423))

(assert (= (and b!631423 res!408313) b!631411))

(assert (= (and b!631411 res!408316) b!631419))

(assert (= (and b!631419 res!408311) b!631412))

(assert (= (and b!631412 res!408319) b!631424))

(assert (= (and b!631424 res!408310) b!631421))

(assert (= (and b!631421 res!408317) b!631418))

(assert (= (and b!631421 c!71918) b!631417))

(assert (= (and b!631421 (not c!71918)) b!631420))

(declare-fun m!606345 () Bool)

(assert (=> b!631424 m!606345))

(declare-fun m!606347 () Bool)

(assert (=> b!631424 m!606347))

(assert (=> b!631424 m!606347))

(declare-fun m!606349 () Bool)

(assert (=> b!631424 m!606349))

(assert (=> b!631414 m!606347))

(assert (=> b!631414 m!606347))

(declare-fun m!606351 () Bool)

(assert (=> b!631414 m!606351))

(declare-fun m!606353 () Bool)

(assert (=> start!57022 m!606353))

(declare-fun m!606355 () Bool)

(assert (=> start!57022 m!606355))

(declare-fun m!606357 () Bool)

(assert (=> b!631415 m!606357))

(declare-fun m!606359 () Bool)

(assert (=> b!631416 m!606359))

(declare-fun m!606361 () Bool)

(assert (=> b!631421 m!606361))

(assert (=> b!631421 m!606347))

(declare-fun m!606363 () Bool)

(assert (=> b!631421 m!606363))

(declare-fun m!606365 () Bool)

(assert (=> b!631421 m!606365))

(declare-fun m!606367 () Bool)

(assert (=> b!631421 m!606367))

(declare-fun m!606369 () Bool)

(assert (=> b!631421 m!606369))

(declare-fun m!606371 () Bool)

(assert (=> b!631421 m!606371))

(declare-fun m!606373 () Bool)

(assert (=> b!631421 m!606373))

(assert (=> b!631421 m!606347))

(declare-fun m!606375 () Bool)

(assert (=> b!631421 m!606375))

(declare-fun m!606377 () Bool)

(assert (=> b!631423 m!606377))

(declare-fun m!606379 () Bool)

(assert (=> b!631419 m!606379))

(assert (=> b!631412 m!606363))

(declare-fun m!606381 () Bool)

(assert (=> b!631412 m!606381))

(declare-fun m!606383 () Bool)

(assert (=> b!631413 m!606383))

(declare-fun m!606385 () Bool)

(assert (=> b!631411 m!606385))

(check-sat (not start!57022) (not b!631416) (not b!631424) (not b!631423) (not b!631415) (not b!631413) (not b!631414) (not b!631411) (not b!631421))
(check-sat)
(get-model)

(declare-fun d!89315 () Bool)

(assert (=> d!89315 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631415 d!89315))

(declare-fun d!89317 () Bool)

(declare-fun res!408361 () Bool)

(declare-fun e!361028 () Bool)

(assert (=> d!89317 (=> res!408361 e!361028)))

(assert (=> d!89317 (= res!408361 (= (select (arr!18283 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89317 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!361028)))

(declare-fun b!631471 () Bool)

(declare-fun e!361029 () Bool)

(assert (=> b!631471 (= e!361028 e!361029)))

(declare-fun res!408362 () Bool)

(assert (=> b!631471 (=> (not res!408362) (not e!361029))))

(assert (=> b!631471 (= res!408362 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18647 a!2986)))))

(declare-fun b!631472 () Bool)

(assert (=> b!631472 (= e!361029 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89317 (not res!408361)) b!631471))

(assert (= (and b!631471 res!408362) b!631472))

(declare-fun m!606429 () Bool)

(assert (=> d!89317 m!606429))

(declare-fun m!606431 () Bool)

(assert (=> b!631472 m!606431))

(assert (=> b!631413 d!89317))

(declare-fun b!631485 () Bool)

(declare-fun e!361036 () SeekEntryResult!6723)

(assert (=> b!631485 (= e!361036 Undefined!6723)))

(declare-fun b!631486 () Bool)

(declare-fun c!71930 () Bool)

(declare-fun lt!291766 () (_ BitVec 64))

(assert (=> b!631486 (= c!71930 (= lt!291766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361038 () SeekEntryResult!6723)

(declare-fun e!361037 () SeekEntryResult!6723)

(assert (=> b!631486 (= e!361038 e!361037)))

(declare-fun b!631487 () Bool)

(assert (=> b!631487 (= e!361037 (MissingVacant!6723 vacantSpotIndex!68))))

(declare-fun b!631488 () Bool)

(assert (=> b!631488 (= e!361036 e!361038)))

(declare-fun c!71929 () Bool)

(assert (=> b!631488 (= c!71929 (= lt!291766 (select (arr!18283 a!2986) j!136)))))

(declare-fun b!631489 () Bool)

(assert (=> b!631489 (= e!361037 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!89319 () Bool)

(declare-fun lt!291765 () SeekEntryResult!6723)

(get-info :version)

(assert (=> d!89319 (and (or ((_ is Undefined!6723) lt!291765) (not ((_ is Found!6723) lt!291765)) (and (bvsge (index!29183 lt!291765) #b00000000000000000000000000000000) (bvslt (index!29183 lt!291765) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291765) ((_ is Found!6723) lt!291765) (not ((_ is MissingVacant!6723) lt!291765)) (not (= (index!29185 lt!291765) vacantSpotIndex!68)) (and (bvsge (index!29185 lt!291765) #b00000000000000000000000000000000) (bvslt (index!29185 lt!291765) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291765) (ite ((_ is Found!6723) lt!291765) (= (select (arr!18283 a!2986) (index!29183 lt!291765)) (select (arr!18283 a!2986) j!136)) (and ((_ is MissingVacant!6723) lt!291765) (= (index!29185 lt!291765) vacantSpotIndex!68) (= (select (arr!18283 a!2986) (index!29185 lt!291765)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89319 (= lt!291765 e!361036)))

(declare-fun c!71928 () Bool)

(assert (=> d!89319 (= c!71928 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89319 (= lt!291766 (select (arr!18283 a!2986) index!984))))

(assert (=> d!89319 (validMask!0 mask!3053)))

(assert (=> d!89319 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053) lt!291765)))

(declare-fun b!631490 () Bool)

(assert (=> b!631490 (= e!361038 (Found!6723 index!984))))

(assert (= (and d!89319 c!71928) b!631485))

(assert (= (and d!89319 (not c!71928)) b!631488))

(assert (= (and b!631488 c!71929) b!631490))

(assert (= (and b!631488 (not c!71929)) b!631486))

(assert (= (and b!631486 c!71930) b!631487))

(assert (= (and b!631486 (not c!71930)) b!631489))

(assert (=> b!631489 m!606373))

(assert (=> b!631489 m!606373))

(assert (=> b!631489 m!606347))

(declare-fun m!606433 () Bool)

(assert (=> b!631489 m!606433))

(declare-fun m!606435 () Bool)

(assert (=> d!89319 m!606435))

(declare-fun m!606437 () Bool)

(assert (=> d!89319 m!606437))

(assert (=> d!89319 m!606345))

(assert (=> d!89319 m!606353))

(assert (=> b!631424 d!89319))

(declare-fun d!89321 () Bool)

(assert (=> d!89321 (= (validKeyInArray!0 (select (arr!18283 a!2986) j!136)) (and (not (= (select (arr!18283 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18283 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631414 d!89321))

(declare-fun b!631499 () Bool)

(declare-fun e!361045 () Bool)

(declare-fun call!33329 () Bool)

(assert (=> b!631499 (= e!361045 call!33329)))

(declare-fun b!631500 () Bool)

(declare-fun e!361046 () Bool)

(assert (=> b!631500 (= e!361046 e!361045)))

(declare-fun lt!291774 () (_ BitVec 64))

(assert (=> b!631500 (= lt!291774 (select (arr!18283 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291773 () Unit!21226)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38098 (_ BitVec 64) (_ BitVec 32)) Unit!21226)

(assert (=> b!631500 (= lt!291773 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291774 #b00000000000000000000000000000000))))

(assert (=> b!631500 (arrayContainsKey!0 a!2986 lt!291774 #b00000000000000000000000000000000)))

(declare-fun lt!291775 () Unit!21226)

(assert (=> b!631500 (= lt!291775 lt!291773)))

(declare-fun res!408368 () Bool)

(assert (=> b!631500 (= res!408368 (= (seekEntryOrOpen!0 (select (arr!18283 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6723 #b00000000000000000000000000000000)))))

(assert (=> b!631500 (=> (not res!408368) (not e!361045))))

(declare-fun d!89323 () Bool)

(declare-fun res!408367 () Bool)

(declare-fun e!361047 () Bool)

(assert (=> d!89323 (=> res!408367 e!361047)))

(assert (=> d!89323 (= res!408367 (bvsge #b00000000000000000000000000000000 (size!18647 a!2986)))))

(assert (=> d!89323 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361047)))

(declare-fun b!631501 () Bool)

(assert (=> b!631501 (= e!361046 call!33329)))

(declare-fun bm!33326 () Bool)

(assert (=> bm!33326 (= call!33329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!631502 () Bool)

(assert (=> b!631502 (= e!361047 e!361046)))

(declare-fun c!71933 () Bool)

(assert (=> b!631502 (= c!71933 (validKeyInArray!0 (select (arr!18283 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89323 (not res!408367)) b!631502))

(assert (= (and b!631502 c!71933) b!631500))

(assert (= (and b!631502 (not c!71933)) b!631501))

(assert (= (and b!631500 res!408368) b!631499))

(assert (= (or b!631499 b!631501) bm!33326))

(assert (=> b!631500 m!606429))

(declare-fun m!606439 () Bool)

(assert (=> b!631500 m!606439))

(declare-fun m!606441 () Bool)

(assert (=> b!631500 m!606441))

(assert (=> b!631500 m!606429))

(declare-fun m!606443 () Bool)

(assert (=> b!631500 m!606443))

(declare-fun m!606445 () Bool)

(assert (=> bm!33326 m!606445))

(assert (=> b!631502 m!606429))

(assert (=> b!631502 m!606429))

(declare-fun m!606447 () Bool)

(assert (=> b!631502 m!606447))

(assert (=> b!631423 d!89323))

(declare-fun d!89327 () Bool)

(assert (=> d!89327 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57022 d!89327))

(declare-fun d!89333 () Bool)

(assert (=> d!89333 (= (array_inv!14079 a!2986) (bvsge (size!18647 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57022 d!89333))

(declare-fun b!631518 () Bool)

(declare-fun e!361060 () SeekEntryResult!6723)

(assert (=> b!631518 (= e!361060 Undefined!6723)))

(declare-fun b!631519 () Bool)

(declare-fun c!71939 () Bool)

(declare-fun lt!291777 () (_ BitVec 64))

(assert (=> b!631519 (= c!71939 (= lt!291777 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361062 () SeekEntryResult!6723)

(declare-fun e!361061 () SeekEntryResult!6723)

(assert (=> b!631519 (= e!361062 e!361061)))

(declare-fun b!631520 () Bool)

(assert (=> b!631520 (= e!361061 (MissingVacant!6723 vacantSpotIndex!68))))

(declare-fun b!631521 () Bool)

(assert (=> b!631521 (= e!361060 e!361062)))

(declare-fun c!71938 () Bool)

(assert (=> b!631521 (= c!71938 (= lt!291777 lt!291732))))

(declare-fun b!631522 () Bool)

(assert (=> b!631522 (= e!361061 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291732 lt!291727 mask!3053))))

(declare-fun d!89335 () Bool)

(declare-fun lt!291776 () SeekEntryResult!6723)

(assert (=> d!89335 (and (or ((_ is Undefined!6723) lt!291776) (not ((_ is Found!6723) lt!291776)) (and (bvsge (index!29183 lt!291776) #b00000000000000000000000000000000) (bvslt (index!29183 lt!291776) (size!18647 lt!291727)))) (or ((_ is Undefined!6723) lt!291776) ((_ is Found!6723) lt!291776) (not ((_ is MissingVacant!6723) lt!291776)) (not (= (index!29185 lt!291776) vacantSpotIndex!68)) (and (bvsge (index!29185 lt!291776) #b00000000000000000000000000000000) (bvslt (index!29185 lt!291776) (size!18647 lt!291727)))) (or ((_ is Undefined!6723) lt!291776) (ite ((_ is Found!6723) lt!291776) (= (select (arr!18283 lt!291727) (index!29183 lt!291776)) lt!291732) (and ((_ is MissingVacant!6723) lt!291776) (= (index!29185 lt!291776) vacantSpotIndex!68) (= (select (arr!18283 lt!291727) (index!29185 lt!291776)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89335 (= lt!291776 e!361060)))

(declare-fun c!71937 () Bool)

(assert (=> d!89335 (= c!71937 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89335 (= lt!291777 (select (arr!18283 lt!291727) index!984))))

(assert (=> d!89335 (validMask!0 mask!3053)))

(assert (=> d!89335 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291732 lt!291727 mask!3053) lt!291776)))

(declare-fun b!631523 () Bool)

(assert (=> b!631523 (= e!361062 (Found!6723 index!984))))

(assert (= (and d!89335 c!71937) b!631518))

(assert (= (and d!89335 (not c!71937)) b!631521))

(assert (= (and b!631521 c!71938) b!631523))

(assert (= (and b!631521 (not c!71938)) b!631519))

(assert (= (and b!631519 c!71939) b!631520))

(assert (= (and b!631519 (not c!71939)) b!631522))

(assert (=> b!631522 m!606373))

(assert (=> b!631522 m!606373))

(declare-fun m!606457 () Bool)

(assert (=> b!631522 m!606457))

(declare-fun m!606459 () Bool)

(assert (=> d!89335 m!606459))

(declare-fun m!606461 () Bool)

(assert (=> d!89335 m!606461))

(declare-fun m!606463 () Bool)

(assert (=> d!89335 m!606463))

(assert (=> d!89335 m!606353))

(assert (=> b!631421 d!89335))

(declare-fun b!631524 () Bool)

(declare-fun e!361063 () SeekEntryResult!6723)

(assert (=> b!631524 (= e!361063 Undefined!6723)))

(declare-fun b!631525 () Bool)

(declare-fun c!71942 () Bool)

(declare-fun lt!291779 () (_ BitVec 64))

(assert (=> b!631525 (= c!71942 (= lt!291779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361065 () SeekEntryResult!6723)

(declare-fun e!361064 () SeekEntryResult!6723)

(assert (=> b!631525 (= e!361065 e!361064)))

(declare-fun b!631526 () Bool)

(assert (=> b!631526 (= e!361064 (MissingVacant!6723 vacantSpotIndex!68))))

(declare-fun b!631527 () Bool)

(assert (=> b!631527 (= e!361063 e!361065)))

(declare-fun c!71941 () Bool)

(assert (=> b!631527 (= c!71941 (= lt!291779 (select (arr!18283 a!2986) j!136)))))

(declare-fun b!631528 () Bool)

(assert (=> b!631528 (= e!361064 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291728 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!89337 () Bool)

(declare-fun lt!291778 () SeekEntryResult!6723)

(assert (=> d!89337 (and (or ((_ is Undefined!6723) lt!291778) (not ((_ is Found!6723) lt!291778)) (and (bvsge (index!29183 lt!291778) #b00000000000000000000000000000000) (bvslt (index!29183 lt!291778) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291778) ((_ is Found!6723) lt!291778) (not ((_ is MissingVacant!6723) lt!291778)) (not (= (index!29185 lt!291778) vacantSpotIndex!68)) (and (bvsge (index!29185 lt!291778) #b00000000000000000000000000000000) (bvslt (index!29185 lt!291778) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291778) (ite ((_ is Found!6723) lt!291778) (= (select (arr!18283 a!2986) (index!29183 lt!291778)) (select (arr!18283 a!2986) j!136)) (and ((_ is MissingVacant!6723) lt!291778) (= (index!29185 lt!291778) vacantSpotIndex!68) (= (select (arr!18283 a!2986) (index!29185 lt!291778)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89337 (= lt!291778 e!361063)))

(declare-fun c!71940 () Bool)

(assert (=> d!89337 (= c!71940 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89337 (= lt!291779 (select (arr!18283 a!2986) lt!291728))))

(assert (=> d!89337 (validMask!0 mask!3053)))

(assert (=> d!89337 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053) lt!291778)))

(declare-fun b!631529 () Bool)

(assert (=> b!631529 (= e!361065 (Found!6723 lt!291728))))

(assert (= (and d!89337 c!71940) b!631524))

(assert (= (and d!89337 (not c!71940)) b!631527))

(assert (= (and b!631527 c!71941) b!631529))

(assert (= (and b!631527 (not c!71941)) b!631525))

(assert (= (and b!631525 c!71942) b!631526))

(assert (= (and b!631525 (not c!71942)) b!631528))

(declare-fun m!606465 () Bool)

(assert (=> b!631528 m!606465))

(assert (=> b!631528 m!606465))

(assert (=> b!631528 m!606347))

(declare-fun m!606467 () Bool)

(assert (=> b!631528 m!606467))

(declare-fun m!606469 () Bool)

(assert (=> d!89337 m!606469))

(declare-fun m!606471 () Bool)

(assert (=> d!89337 m!606471))

(declare-fun m!606473 () Bool)

(assert (=> d!89337 m!606473))

(assert (=> d!89337 m!606353))

(assert (=> b!631421 d!89337))

(declare-fun d!89339 () Bool)

(declare-fun lt!291782 () (_ BitVec 32))

(assert (=> d!89339 (and (bvsge lt!291782 #b00000000000000000000000000000000) (bvslt lt!291782 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89339 (= lt!291782 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89339 (validMask!0 mask!3053)))

(assert (=> d!89339 (= (nextIndex!0 index!984 x!910 mask!3053) lt!291782)))

(declare-fun bs!19027 () Bool)

(assert (= bs!19027 d!89339))

(declare-fun m!606475 () Bool)

(assert (=> bs!19027 m!606475))

(assert (=> bs!19027 m!606353))

(assert (=> b!631421 d!89339))

(declare-fun d!89343 () Bool)

(declare-fun e!361098 () Bool)

(assert (=> d!89343 e!361098))

(declare-fun res!408389 () Bool)

(assert (=> d!89343 (=> (not res!408389) (not e!361098))))

(assert (=> d!89343 (= res!408389 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18647 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18647 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18647 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18647 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18647 a!2986))))))

(declare-fun lt!291800 () Unit!21226)

(declare-fun choose!9 (array!38098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21226)

(assert (=> d!89343 (= lt!291800 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89343 (validMask!0 mask!3053)))

(assert (=> d!89343 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 mask!3053) lt!291800)))

(declare-fun b!631583 () Bool)

(assert (=> b!631583 (= e!361098 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 (select (arr!18283 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 (select (store (arr!18283 a!2986) i!1108 k0!1786) j!136) (array!38099 (store (arr!18283 a!2986) i!1108 k0!1786) (size!18647 a!2986)) mask!3053)))))

(assert (= (and d!89343 res!408389) b!631583))

(declare-fun m!606505 () Bool)

(assert (=> d!89343 m!606505))

(assert (=> d!89343 m!606353))

(assert (=> b!631583 m!606361))

(declare-fun m!606507 () Bool)

(assert (=> b!631583 m!606507))

(assert (=> b!631583 m!606361))

(assert (=> b!631583 m!606347))

(assert (=> b!631583 m!606375))

(assert (=> b!631583 m!606347))

(assert (=> b!631583 m!606363))

(assert (=> b!631421 d!89343))

(declare-fun b!631584 () Bool)

(declare-fun e!361099 () SeekEntryResult!6723)

(assert (=> b!631584 (= e!361099 Undefined!6723)))

(declare-fun b!631585 () Bool)

(declare-fun c!71966 () Bool)

(declare-fun lt!291802 () (_ BitVec 64))

(assert (=> b!631585 (= c!71966 (= lt!291802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361101 () SeekEntryResult!6723)

(declare-fun e!361100 () SeekEntryResult!6723)

(assert (=> b!631585 (= e!361101 e!361100)))

(declare-fun b!631586 () Bool)

(assert (=> b!631586 (= e!361100 (MissingVacant!6723 vacantSpotIndex!68))))

(declare-fun b!631587 () Bool)

(assert (=> b!631587 (= e!361099 e!361101)))

(declare-fun c!71965 () Bool)

(assert (=> b!631587 (= c!71965 (= lt!291802 lt!291732))))

(declare-fun b!631588 () Bool)

(assert (=> b!631588 (= e!361100 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291728 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!291732 lt!291727 mask!3053))))

(declare-fun d!89351 () Bool)

(declare-fun lt!291801 () SeekEntryResult!6723)

(assert (=> d!89351 (and (or ((_ is Undefined!6723) lt!291801) (not ((_ is Found!6723) lt!291801)) (and (bvsge (index!29183 lt!291801) #b00000000000000000000000000000000) (bvslt (index!29183 lt!291801) (size!18647 lt!291727)))) (or ((_ is Undefined!6723) lt!291801) ((_ is Found!6723) lt!291801) (not ((_ is MissingVacant!6723) lt!291801)) (not (= (index!29185 lt!291801) vacantSpotIndex!68)) (and (bvsge (index!29185 lt!291801) #b00000000000000000000000000000000) (bvslt (index!29185 lt!291801) (size!18647 lt!291727)))) (or ((_ is Undefined!6723) lt!291801) (ite ((_ is Found!6723) lt!291801) (= (select (arr!18283 lt!291727) (index!29183 lt!291801)) lt!291732) (and ((_ is MissingVacant!6723) lt!291801) (= (index!29185 lt!291801) vacantSpotIndex!68) (= (select (arr!18283 lt!291727) (index!29185 lt!291801)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89351 (= lt!291801 e!361099)))

(declare-fun c!71964 () Bool)

(assert (=> d!89351 (= c!71964 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89351 (= lt!291802 (select (arr!18283 lt!291727) lt!291728))))

(assert (=> d!89351 (validMask!0 mask!3053)))

(assert (=> d!89351 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291728 vacantSpotIndex!68 lt!291732 lt!291727 mask!3053) lt!291801)))

(declare-fun b!631589 () Bool)

(assert (=> b!631589 (= e!361101 (Found!6723 lt!291728))))

(assert (= (and d!89351 c!71964) b!631584))

(assert (= (and d!89351 (not c!71964)) b!631587))

(assert (= (and b!631587 c!71965) b!631589))

(assert (= (and b!631587 (not c!71965)) b!631585))

(assert (= (and b!631585 c!71966) b!631586))

(assert (= (and b!631585 (not c!71966)) b!631588))

(assert (=> b!631588 m!606465))

(assert (=> b!631588 m!606465))

(declare-fun m!606509 () Bool)

(assert (=> b!631588 m!606509))

(declare-fun m!606511 () Bool)

(assert (=> d!89351 m!606511))

(declare-fun m!606513 () Bool)

(assert (=> d!89351 m!606513))

(declare-fun m!606515 () Bool)

(assert (=> d!89351 m!606515))

(assert (=> d!89351 m!606353))

(assert (=> b!631421 d!89351))

(declare-fun b!631662 () Bool)

(declare-fun c!71996 () Bool)

(declare-fun lt!291841 () (_ BitVec 64))

(assert (=> b!631662 (= c!71996 (= lt!291841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361147 () SeekEntryResult!6723)

(declare-fun e!361148 () SeekEntryResult!6723)

(assert (=> b!631662 (= e!361147 e!361148)))

(declare-fun b!631663 () Bool)

(declare-fun e!361149 () SeekEntryResult!6723)

(assert (=> b!631663 (= e!361149 Undefined!6723)))

(declare-fun b!631664 () Bool)

(declare-fun lt!291840 () SeekEntryResult!6723)

(assert (=> b!631664 (= e!361148 (MissingZero!6723 (index!29184 lt!291840)))))

(declare-fun b!631665 () Bool)

(assert (=> b!631665 (= e!361149 e!361147)))

(assert (=> b!631665 (= lt!291841 (select (arr!18283 a!2986) (index!29184 lt!291840)))))

(declare-fun c!71995 () Bool)

(assert (=> b!631665 (= c!71995 (= lt!291841 k0!1786))))

(declare-fun b!631666 () Bool)

(assert (=> b!631666 (= e!361147 (Found!6723 (index!29184 lt!291840)))))

(declare-fun d!89355 () Bool)

(declare-fun lt!291842 () SeekEntryResult!6723)

(assert (=> d!89355 (and (or ((_ is Undefined!6723) lt!291842) (not ((_ is Found!6723) lt!291842)) (and (bvsge (index!29183 lt!291842) #b00000000000000000000000000000000) (bvslt (index!29183 lt!291842) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291842) ((_ is Found!6723) lt!291842) (not ((_ is MissingZero!6723) lt!291842)) (and (bvsge (index!29182 lt!291842) #b00000000000000000000000000000000) (bvslt (index!29182 lt!291842) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291842) ((_ is Found!6723) lt!291842) ((_ is MissingZero!6723) lt!291842) (not ((_ is MissingVacant!6723) lt!291842)) (and (bvsge (index!29185 lt!291842) #b00000000000000000000000000000000) (bvslt (index!29185 lt!291842) (size!18647 a!2986)))) (or ((_ is Undefined!6723) lt!291842) (ite ((_ is Found!6723) lt!291842) (= (select (arr!18283 a!2986) (index!29183 lt!291842)) k0!1786) (ite ((_ is MissingZero!6723) lt!291842) (= (select (arr!18283 a!2986) (index!29182 lt!291842)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6723) lt!291842) (= (select (arr!18283 a!2986) (index!29185 lt!291842)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89355 (= lt!291842 e!361149)))

(declare-fun c!71994 () Bool)

(assert (=> d!89355 (= c!71994 (and ((_ is Intermediate!6723) lt!291840) (undefined!7535 lt!291840)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38098 (_ BitVec 32)) SeekEntryResult!6723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89355 (= lt!291840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89355 (validMask!0 mask!3053)))

(assert (=> d!89355 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!291842)))

(declare-fun b!631667 () Bool)

(assert (=> b!631667 (= e!361148 (seekKeyOrZeroReturnVacant!0 (x!57917 lt!291840) (index!29184 lt!291840) (index!29184 lt!291840) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89355 c!71994) b!631663))

(assert (= (and d!89355 (not c!71994)) b!631665))

(assert (= (and b!631665 c!71995) b!631666))

(assert (= (and b!631665 (not c!71995)) b!631662))

(assert (= (and b!631662 c!71996) b!631664))

(assert (= (and b!631662 (not c!71996)) b!631667))

(declare-fun m!606549 () Bool)

(assert (=> b!631665 m!606549))

(declare-fun m!606551 () Bool)

(assert (=> d!89355 m!606551))

(declare-fun m!606553 () Bool)

(assert (=> d!89355 m!606553))

(declare-fun m!606555 () Bool)

(assert (=> d!89355 m!606555))

(assert (=> d!89355 m!606353))

(declare-fun m!606557 () Bool)

(assert (=> d!89355 m!606557))

(assert (=> d!89355 m!606551))

(declare-fun m!606559 () Bool)

(assert (=> d!89355 m!606559))

(declare-fun m!606561 () Bool)

(assert (=> b!631667 m!606561))

(assert (=> b!631416 d!89355))

(declare-fun b!631690 () Bool)

(declare-fun e!361166 () Bool)

(declare-fun e!361167 () Bool)

(assert (=> b!631690 (= e!361166 e!361167)))

(declare-fun res!408414 () Bool)

(assert (=> b!631690 (=> (not res!408414) (not e!361167))))

(declare-fun e!361164 () Bool)

(assert (=> b!631690 (= res!408414 (not e!361164))))

(declare-fun res!408416 () Bool)

(assert (=> b!631690 (=> (not res!408416) (not e!361164))))

(assert (=> b!631690 (= res!408416 (validKeyInArray!0 (select (arr!18283 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631691 () Bool)

(declare-fun e!361165 () Bool)

(assert (=> b!631691 (= e!361167 e!361165)))

(declare-fun c!72005 () Bool)

(assert (=> b!631691 (= c!72005 (validKeyInArray!0 (select (arr!18283 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33341 () Bool)

(declare-fun call!33344 () Bool)

(assert (=> bm!33341 (= call!33344 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72005 (Cons!12320 (select (arr!18283 a!2986) #b00000000000000000000000000000000) Nil!12321) Nil!12321)))))

(declare-fun d!89365 () Bool)

(declare-fun res!408415 () Bool)

(assert (=> d!89365 (=> res!408415 e!361166)))

(assert (=> d!89365 (= res!408415 (bvsge #b00000000000000000000000000000000 (size!18647 a!2986)))))

(assert (=> d!89365 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12321) e!361166)))

(declare-fun b!631692 () Bool)

(assert (=> b!631692 (= e!361165 call!33344)))

(declare-fun b!631693 () Bool)

(assert (=> b!631693 (= e!361165 call!33344)))

(declare-fun b!631694 () Bool)

(declare-fun contains!3090 (List!12324 (_ BitVec 64)) Bool)

(assert (=> b!631694 (= e!361164 (contains!3090 Nil!12321 (select (arr!18283 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89365 (not res!408415)) b!631690))

(assert (= (and b!631690 res!408416) b!631694))

(assert (= (and b!631690 res!408414) b!631691))

(assert (= (and b!631691 c!72005) b!631692))

(assert (= (and b!631691 (not c!72005)) b!631693))

(assert (= (or b!631692 b!631693) bm!33341))

(assert (=> b!631690 m!606429))

(assert (=> b!631690 m!606429))

(assert (=> b!631690 m!606447))

(assert (=> b!631691 m!606429))

(assert (=> b!631691 m!606429))

(assert (=> b!631691 m!606447))

(assert (=> bm!33341 m!606429))

(declare-fun m!606583 () Bool)

(assert (=> bm!33341 m!606583))

(assert (=> b!631694 m!606429))

(assert (=> b!631694 m!606429))

(declare-fun m!606585 () Bool)

(assert (=> b!631694 m!606585))

(assert (=> b!631411 d!89365))

(check-sat (not d!89319) (not d!89337) (not b!631500) (not b!631489) (not b!631691) (not b!631694) (not b!631528) (not b!631588) (not d!89355) (not d!89339) (not b!631667) (not d!89335) (not bm!33326) (not b!631690) (not b!631583) (not b!631502) (not b!631522) (not d!89351) (not d!89343) (not b!631472) (not bm!33341))
(check-sat)
