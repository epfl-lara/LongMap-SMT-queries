; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59558 () Bool)

(assert start!59558)

(declare-fun b!657329 () Bool)

(declare-fun e!377607 () Bool)

(declare-fun e!377601 () Bool)

(assert (=> b!657329 (= e!377607 e!377601)))

(declare-fun res!426257 () Bool)

(assert (=> b!657329 (=> (not res!426257) (not e!377601))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38716 0))(
  ( (array!38717 (arr!18555 (Array (_ BitVec 32) (_ BitVec 64))) (size!18919 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38716)

(assert (=> b!657329 (= res!426257 (= (select (store (arr!18555 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!306972 () array!38716)

(assert (=> b!657329 (= lt!306972 (array!38717 (store (arr!18555 a!2986) i!1108 k!1786) (size!18919 a!2986)))))

(declare-fun b!657330 () Bool)

(declare-fun e!377605 () Bool)

(assert (=> b!657330 (= e!377605 e!377607)))

(declare-fun res!426245 () Bool)

(assert (=> b!657330 (=> (not res!426245) (not e!377607))))

(declare-datatypes ((SeekEntryResult!6995 0))(
  ( (MissingZero!6995 (index!30345 (_ BitVec 32))) (Found!6995 (index!30346 (_ BitVec 32))) (Intermediate!6995 (undefined!7807 Bool) (index!30347 (_ BitVec 32)) (x!59142 (_ BitVec 32))) (Undefined!6995) (MissingVacant!6995 (index!30348 (_ BitVec 32))) )
))
(declare-fun lt!306984 () SeekEntryResult!6995)

(assert (=> b!657330 (= res!426245 (or (= lt!306984 (MissingZero!6995 i!1108)) (= lt!306984 (MissingVacant!6995 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38716 (_ BitVec 32)) SeekEntryResult!6995)

(assert (=> b!657330 (= lt!306984 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!657331 () Bool)

(declare-fun res!426244 () Bool)

(assert (=> b!657331 (=> (not res!426244) (not e!377605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!657331 (= res!426244 (validKeyInArray!0 k!1786))))

(declare-fun b!657332 () Bool)

(declare-fun res!426250 () Bool)

(assert (=> b!657332 (=> (not res!426250) (not e!377605))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!657332 (= res!426250 (validKeyInArray!0 (select (arr!18555 a!2986) j!136)))))

(declare-fun b!657333 () Bool)

(declare-datatypes ((Unit!22704 0))(
  ( (Unit!22705) )
))
(declare-fun e!377596 () Unit!22704)

(declare-fun Unit!22706 () Unit!22704)

(assert (=> b!657333 (= e!377596 Unit!22706)))

(declare-fun res!426242 () Bool)

(assert (=> start!59558 (=> (not res!426242) (not e!377605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59558 (= res!426242 (validMask!0 mask!3053))))

(assert (=> start!59558 e!377605))

(assert (=> start!59558 true))

(declare-fun array_inv!14351 (array!38716) Bool)

(assert (=> start!59558 (array_inv!14351 a!2986)))

(declare-fun b!657334 () Bool)

(declare-fun res!426255 () Bool)

(assert (=> b!657334 (=> (not res!426255) (not e!377607))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!657334 (= res!426255 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18555 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!657335 () Bool)

(declare-fun e!377599 () Bool)

(declare-fun arrayContainsKey!0 (array!38716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!657335 (= e!377599 (arrayContainsKey!0 lt!306972 (select (arr!18555 a!2986) j!136) index!984))))

(declare-fun b!657336 () Bool)

(declare-fun Unit!22707 () Unit!22704)

(assert (=> b!657336 (= e!377596 Unit!22707)))

(assert (=> b!657336 false))

(declare-fun b!657337 () Bool)

(declare-fun res!426251 () Bool)

(assert (=> b!657337 (=> (not res!426251) (not e!377605))))

(assert (=> b!657337 (= res!426251 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!657338 () Bool)

(declare-fun res!426253 () Bool)

(assert (=> b!657338 (=> (not res!426253) (not e!377607))))

(declare-datatypes ((List!12596 0))(
  ( (Nil!12593) (Cons!12592 (h!13637 (_ BitVec 64)) (t!18824 List!12596)) )
))
(declare-fun arrayNoDuplicates!0 (array!38716 (_ BitVec 32) List!12596) Bool)

(assert (=> b!657338 (= res!426253 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12593))))

(declare-fun b!657339 () Bool)

(declare-fun e!377598 () Unit!22704)

(declare-fun Unit!22708 () Unit!22704)

(assert (=> b!657339 (= e!377598 Unit!22708)))

(declare-fun b!657340 () Bool)

(declare-fun res!426254 () Bool)

(assert (=> b!657340 (=> (not res!426254) (not e!377607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38716 (_ BitVec 32)) Bool)

(assert (=> b!657340 (= res!426254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!657341 () Bool)

(declare-fun res!426249 () Bool)

(assert (=> b!657341 (= res!426249 (bvsge j!136 index!984))))

(declare-fun e!377595 () Bool)

(assert (=> b!657341 (=> res!426249 e!377595)))

(declare-fun e!377603 () Bool)

(assert (=> b!657341 (= e!377603 e!377595)))

(declare-fun b!657342 () Bool)

(declare-fun e!377604 () Unit!22704)

(declare-fun Unit!22709 () Unit!22704)

(assert (=> b!657342 (= e!377604 Unit!22709)))

(declare-fun b!657343 () Bool)

(declare-fun Unit!22710 () Unit!22704)

(assert (=> b!657343 (= e!377598 Unit!22710)))

(declare-fun res!426246 () Bool)

(assert (=> b!657343 (= res!426246 (= (select (store (arr!18555 a!2986) i!1108 k!1786) index!984) (select (arr!18555 a!2986) j!136)))))

(assert (=> b!657343 (=> (not res!426246) (not e!377603))))

(assert (=> b!657343 e!377603))

(declare-fun c!75914 () Bool)

(assert (=> b!657343 (= c!75914 (bvslt j!136 index!984))))

(declare-fun lt!306988 () Unit!22704)

(declare-fun e!377602 () Unit!22704)

(assert (=> b!657343 (= lt!306988 e!377602)))

(declare-fun c!75911 () Bool)

(assert (=> b!657343 (= c!75911 (bvslt index!984 j!136))))

(declare-fun lt!306969 () Unit!22704)

(assert (=> b!657343 (= lt!306969 e!377604)))

(assert (=> b!657343 false))

(declare-fun b!657344 () Bool)

(assert (=> b!657344 false))

(declare-fun lt!306971 () Unit!22704)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38716 (_ BitVec 64) (_ BitVec 32) List!12596) Unit!22704)

(assert (=> b!657344 (= lt!306971 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306972 (select (arr!18555 a!2986) j!136) index!984 Nil!12593))))

(assert (=> b!657344 (arrayNoDuplicates!0 lt!306972 index!984 Nil!12593)))

(declare-fun lt!306987 () Unit!22704)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38716 (_ BitVec 32) (_ BitVec 32)) Unit!22704)

(assert (=> b!657344 (= lt!306987 (lemmaNoDuplicateFromThenFromBigger!0 lt!306972 #b00000000000000000000000000000000 index!984))))

(assert (=> b!657344 (arrayNoDuplicates!0 lt!306972 #b00000000000000000000000000000000 Nil!12593)))

(declare-fun lt!306980 () Unit!22704)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38716 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12596) Unit!22704)

(assert (=> b!657344 (= lt!306980 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12593))))

(assert (=> b!657344 (arrayContainsKey!0 lt!306972 (select (arr!18555 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306983 () Unit!22704)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38716 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22704)

(assert (=> b!657344 (= lt!306983 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306972 (select (arr!18555 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!657344 e!377599))

(declare-fun res!426248 () Bool)

(assert (=> b!657344 (=> (not res!426248) (not e!377599))))

(assert (=> b!657344 (= res!426248 (arrayContainsKey!0 lt!306972 (select (arr!18555 a!2986) j!136) j!136))))

(declare-fun Unit!22711 () Unit!22704)

(assert (=> b!657344 (= e!377604 Unit!22711)))

(declare-fun b!657345 () Bool)

(declare-fun res!426241 () Bool)

(assert (=> b!657345 (=> (not res!426241) (not e!377605))))

(assert (=> b!657345 (= res!426241 (and (= (size!18919 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18919 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18919 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!657346 () Bool)

(declare-fun e!377594 () Bool)

(assert (=> b!657346 (= e!377594 (arrayContainsKey!0 lt!306972 (select (arr!18555 a!2986) j!136) index!984))))

(declare-fun res!426247 () Bool)

(declare-fun b!657347 () Bool)

(assert (=> b!657347 (= res!426247 (arrayContainsKey!0 lt!306972 (select (arr!18555 a!2986) j!136) j!136))))

(assert (=> b!657347 (=> (not res!426247) (not e!377594))))

(assert (=> b!657347 (= e!377595 e!377594)))

(declare-fun b!657348 () Bool)

(declare-fun e!377593 () Bool)

(declare-fun e!377597 () Bool)

(assert (=> b!657348 (= e!377593 (not e!377597))))

(declare-fun res!426256 () Bool)

(assert (=> b!657348 (=> res!426256 e!377597)))

(declare-fun lt!306981 () SeekEntryResult!6995)

(assert (=> b!657348 (= res!426256 (not (= lt!306981 (MissingVacant!6995 vacantSpotIndex!68))))))

(declare-fun lt!306986 () Unit!22704)

(assert (=> b!657348 (= lt!306986 e!377598)))

(declare-fun c!75912 () Bool)

(assert (=> b!657348 (= c!75912 (= lt!306981 (Found!6995 index!984)))))

(declare-fun lt!306973 () Unit!22704)

(assert (=> b!657348 (= lt!306973 e!377596)))

(declare-fun c!75913 () Bool)

(assert (=> b!657348 (= c!75913 (= lt!306981 Undefined!6995))))

(declare-fun lt!306970 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38716 (_ BitVec 32)) SeekEntryResult!6995)

(assert (=> b!657348 (= lt!306981 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306970 lt!306972 mask!3053))))

(declare-fun e!377600 () Bool)

(assert (=> b!657348 e!377600))

(declare-fun res!426243 () Bool)

(assert (=> b!657348 (=> (not res!426243) (not e!377600))))

(declare-fun lt!306982 () (_ BitVec 32))

(declare-fun lt!306974 () SeekEntryResult!6995)

(assert (=> b!657348 (= res!426243 (= lt!306974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306982 vacantSpotIndex!68 lt!306970 lt!306972 mask!3053)))))

(assert (=> b!657348 (= lt!306974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306982 vacantSpotIndex!68 (select (arr!18555 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!657348 (= lt!306970 (select (store (arr!18555 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!306975 () Unit!22704)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38716 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22704)

(assert (=> b!657348 (= lt!306975 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306982 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!657348 (= lt!306982 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!657349 () Bool)

(assert (=> b!657349 (= e!377597 true)))

(assert (=> b!657349 (= (select (store (arr!18555 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!657350 () Bool)

(assert (=> b!657350 (= e!377601 e!377593)))

(declare-fun res!426252 () Bool)

(assert (=> b!657350 (=> (not res!426252) (not e!377593))))

(declare-fun lt!306976 () SeekEntryResult!6995)

(assert (=> b!657350 (= res!426252 (and (= lt!306976 (Found!6995 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18555 a!2986) index!984) (select (arr!18555 a!2986) j!136))) (not (= (select (arr!18555 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!657350 (= lt!306976 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18555 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!657351 () Bool)

(assert (=> b!657351 (= e!377600 (= lt!306976 lt!306974))))

(declare-fun b!657352 () Bool)

(declare-fun Unit!22712 () Unit!22704)

(assert (=> b!657352 (= e!377602 Unit!22712)))

(declare-fun b!657353 () Bool)

(assert (=> b!657353 false))

(declare-fun lt!306977 () Unit!22704)

(assert (=> b!657353 (= lt!306977 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306972 (select (arr!18555 a!2986) j!136) j!136 Nil!12593))))

(assert (=> b!657353 (arrayNoDuplicates!0 lt!306972 j!136 Nil!12593)))

(declare-fun lt!306979 () Unit!22704)

(assert (=> b!657353 (= lt!306979 (lemmaNoDuplicateFromThenFromBigger!0 lt!306972 #b00000000000000000000000000000000 j!136))))

(assert (=> b!657353 (arrayNoDuplicates!0 lt!306972 #b00000000000000000000000000000000 Nil!12593)))

(declare-fun lt!306978 () Unit!22704)

(assert (=> b!657353 (= lt!306978 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12593))))

(assert (=> b!657353 (arrayContainsKey!0 lt!306972 (select (arr!18555 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306985 () Unit!22704)

(assert (=> b!657353 (= lt!306985 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306972 (select (arr!18555 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22713 () Unit!22704)

(assert (=> b!657353 (= e!377602 Unit!22713)))

(assert (= (and start!59558 res!426242) b!657345))

(assert (= (and b!657345 res!426241) b!657332))

(assert (= (and b!657332 res!426250) b!657331))

(assert (= (and b!657331 res!426244) b!657337))

(assert (= (and b!657337 res!426251) b!657330))

(assert (= (and b!657330 res!426245) b!657340))

(assert (= (and b!657340 res!426254) b!657338))

(assert (= (and b!657338 res!426253) b!657334))

(assert (= (and b!657334 res!426255) b!657329))

(assert (= (and b!657329 res!426257) b!657350))

(assert (= (and b!657350 res!426252) b!657348))

(assert (= (and b!657348 res!426243) b!657351))

(assert (= (and b!657348 c!75913) b!657336))

(assert (= (and b!657348 (not c!75913)) b!657333))

(assert (= (and b!657348 c!75912) b!657343))

(assert (= (and b!657348 (not c!75912)) b!657339))

(assert (= (and b!657343 res!426246) b!657341))

(assert (= (and b!657341 (not res!426249)) b!657347))

(assert (= (and b!657347 res!426247) b!657346))

(assert (= (and b!657343 c!75914) b!657353))

(assert (= (and b!657343 (not c!75914)) b!657352))

(assert (= (and b!657343 c!75911) b!657344))

(assert (= (and b!657343 (not c!75911)) b!657342))

(assert (= (and b!657344 res!426248) b!657335))

(assert (= (and b!657348 (not res!426256)) b!657349))

(declare-fun m!630377 () Bool)

(assert (=> b!657330 m!630377))

(declare-fun m!630379 () Bool)

(assert (=> b!657337 m!630379))

(declare-fun m!630381 () Bool)

(assert (=> b!657329 m!630381))

(declare-fun m!630383 () Bool)

(assert (=> b!657329 m!630383))

(declare-fun m!630385 () Bool)

(assert (=> b!657335 m!630385))

(assert (=> b!657335 m!630385))

(declare-fun m!630387 () Bool)

(assert (=> b!657335 m!630387))

(declare-fun m!630389 () Bool)

(assert (=> b!657334 m!630389))

(declare-fun m!630391 () Bool)

(assert (=> b!657331 m!630391))

(assert (=> b!657344 m!630385))

(declare-fun m!630393 () Bool)

(assert (=> b!657344 m!630393))

(assert (=> b!657344 m!630385))

(assert (=> b!657344 m!630385))

(declare-fun m!630395 () Bool)

(assert (=> b!657344 m!630395))

(declare-fun m!630397 () Bool)

(assert (=> b!657344 m!630397))

(declare-fun m!630399 () Bool)

(assert (=> b!657344 m!630399))

(assert (=> b!657344 m!630385))

(declare-fun m!630401 () Bool)

(assert (=> b!657344 m!630401))

(declare-fun m!630403 () Bool)

(assert (=> b!657344 m!630403))

(assert (=> b!657344 m!630385))

(declare-fun m!630405 () Bool)

(assert (=> b!657344 m!630405))

(declare-fun m!630407 () Bool)

(assert (=> b!657344 m!630407))

(declare-fun m!630409 () Bool)

(assert (=> b!657350 m!630409))

(assert (=> b!657350 m!630385))

(assert (=> b!657350 m!630385))

(declare-fun m!630411 () Bool)

(assert (=> b!657350 m!630411))

(assert (=> b!657347 m!630385))

(assert (=> b!657347 m!630385))

(assert (=> b!657347 m!630395))

(declare-fun m!630413 () Bool)

(assert (=> start!59558 m!630413))

(declare-fun m!630415 () Bool)

(assert (=> start!59558 m!630415))

(assert (=> b!657343 m!630381))

(declare-fun m!630417 () Bool)

(assert (=> b!657343 m!630417))

(assert (=> b!657343 m!630385))

(assert (=> b!657353 m!630385))

(declare-fun m!630419 () Bool)

(assert (=> b!657353 m!630419))

(assert (=> b!657353 m!630385))

(declare-fun m!630421 () Bool)

(assert (=> b!657353 m!630421))

(assert (=> b!657353 m!630385))

(declare-fun m!630423 () Bool)

(assert (=> b!657353 m!630423))

(assert (=> b!657353 m!630397))

(assert (=> b!657353 m!630385))

(declare-fun m!630425 () Bool)

(assert (=> b!657353 m!630425))

(declare-fun m!630427 () Bool)

(assert (=> b!657353 m!630427))

(assert (=> b!657353 m!630403))

(assert (=> b!657346 m!630385))

(assert (=> b!657346 m!630385))

(assert (=> b!657346 m!630387))

(declare-fun m!630429 () Bool)

(assert (=> b!657340 m!630429))

(assert (=> b!657349 m!630381))

(assert (=> b!657349 m!630417))

(declare-fun m!630431 () Bool)

(assert (=> b!657348 m!630431))

(declare-fun m!630433 () Bool)

(assert (=> b!657348 m!630433))

(assert (=> b!657348 m!630381))

(assert (=> b!657348 m!630385))

(declare-fun m!630435 () Bool)

(assert (=> b!657348 m!630435))

(declare-fun m!630437 () Bool)

(assert (=> b!657348 m!630437))

(declare-fun m!630439 () Bool)

(assert (=> b!657348 m!630439))

(assert (=> b!657348 m!630385))

(declare-fun m!630441 () Bool)

(assert (=> b!657348 m!630441))

(assert (=> b!657332 m!630385))

(assert (=> b!657332 m!630385))

(declare-fun m!630443 () Bool)

(assert (=> b!657332 m!630443))

(declare-fun m!630445 () Bool)

(assert (=> b!657338 m!630445))

(push 1)

