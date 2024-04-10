; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58650 () Bool)

(assert start!58650)

(declare-fun b!647326 () Bool)

(declare-datatypes ((Unit!22014 0))(
  ( (Unit!22015) )
))
(declare-fun e!371147 () Unit!22014)

(declare-fun Unit!22016 () Unit!22014)

(assert (=> b!647326 (= e!371147 Unit!22016)))

(assert (=> b!647326 false))

(declare-fun b!647327 () Bool)

(declare-fun res!419453 () Bool)

(declare-fun e!371158 () Bool)

(assert (=> b!647327 (=> (not res!419453) (not e!371158))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38498 0))(
  ( (array!38499 (arr!18458 (Array (_ BitVec 32) (_ BitVec 64))) (size!18822 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38498)

(assert (=> b!647327 (= res!419453 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18458 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647328 () Bool)

(declare-fun e!371163 () Bool)

(declare-fun e!371159 () Bool)

(assert (=> b!647328 (= e!371163 e!371159)))

(declare-fun res!419447 () Bool)

(assert (=> b!647328 (=> res!419447 e!371159)))

(assert (=> b!647328 (= res!419447 (or (bvsge (size!18822 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18822 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!300414 () array!38498)

(declare-fun arrayContainsKey!0 (array!38498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!647328 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300406 () Unit!22014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38498 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22014)

(assert (=> b!647328 (= lt!300406 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300414 (select (arr!18458 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371149 () Bool)

(assert (=> b!647328 e!371149))

(declare-fun res!419456 () Bool)

(assert (=> b!647328 (=> (not res!419456) (not e!371149))))

(assert (=> b!647328 (= res!419456 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) j!136))))

(declare-fun b!647329 () Bool)

(declare-fun e!371151 () Bool)

(assert (=> b!647329 (= e!371159 e!371151)))

(declare-fun res!419451 () Bool)

(assert (=> b!647329 (=> (not res!419451) (not e!371151))))

(declare-datatypes ((List!12499 0))(
  ( (Nil!12496) (Cons!12495 (h!13540 (_ BitVec 64)) (t!18727 List!12499)) )
))
(declare-fun contains!3154 (List!12499 (_ BitVec 64)) Bool)

(assert (=> b!647329 (= res!419451 (not (contains!3154 Nil!12496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647330 () Bool)

(assert (=> b!647330 (= e!371151 (not (contains!3154 Nil!12496 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!647331 () Bool)

(declare-fun e!371150 () Bool)

(declare-datatypes ((SeekEntryResult!6898 0))(
  ( (MissingZero!6898 (index!29933 (_ BitVec 32))) (Found!6898 (index!29934 (_ BitVec 32))) (Intermediate!6898 (undefined!7710 Bool) (index!29935 (_ BitVec 32)) (x!58709 (_ BitVec 32))) (Undefined!6898) (MissingVacant!6898 (index!29936 (_ BitVec 32))) )
))
(declare-fun lt!300405 () SeekEntryResult!6898)

(declare-fun lt!300409 () SeekEntryResult!6898)

(assert (=> b!647331 (= e!371150 (= lt!300405 lt!300409))))

(declare-fun b!647332 () Bool)

(declare-fun res!419446 () Bool)

(declare-fun e!371153 () Bool)

(assert (=> b!647332 (=> (not res!419446) (not e!371153))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!647332 (= res!419446 (and (= (size!18822 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18822 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18822 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!647333 () Bool)

(declare-fun res!419450 () Bool)

(assert (=> b!647333 (=> (not res!419450) (not e!371153))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!647333 (= res!419450 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!647334 () Bool)

(declare-fun res!419452 () Bool)

(assert (=> b!647334 (=> (not res!419452) (not e!371153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!647334 (= res!419452 (validKeyInArray!0 (select (arr!18458 a!2986) j!136)))))

(declare-fun b!647335 () Bool)

(declare-fun e!371155 () Bool)

(declare-fun e!371156 () Bool)

(assert (=> b!647335 (= e!371155 e!371156)))

(declare-fun res!419448 () Bool)

(assert (=> b!647335 (=> (not res!419448) (not e!371156))))

(assert (=> b!647335 (= res!419448 (and (= lt!300405 (Found!6898 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18458 a!2986) index!984) (select (arr!18458 a!2986) j!136))) (not (= (select (arr!18458 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38498 (_ BitVec 32)) SeekEntryResult!6898)

(assert (=> b!647335 (= lt!300405 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647336 () Bool)

(declare-fun res!419462 () Bool)

(assert (=> b!647336 (=> (not res!419462) (not e!371158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38498 (_ BitVec 32)) Bool)

(assert (=> b!647336 (= res!419462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!647338 () Bool)

(declare-fun res!419455 () Bool)

(assert (=> b!647338 (=> (not res!419455) (not e!371158))))

(declare-fun arrayNoDuplicates!0 (array!38498 (_ BitVec 32) List!12499) Bool)

(assert (=> b!647338 (= res!419455 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12496))))

(declare-fun b!647339 () Bool)

(declare-fun res!419457 () Bool)

(assert (=> b!647339 (=> res!419457 e!371159)))

(declare-fun noDuplicate!416 (List!12499) Bool)

(assert (=> b!647339 (= res!419457 (not (noDuplicate!416 Nil!12496)))))

(declare-fun b!647340 () Bool)

(declare-fun e!371160 () Unit!22014)

(declare-fun Unit!22017 () Unit!22014)

(assert (=> b!647340 (= e!371160 Unit!22017)))

(declare-fun lt!300415 () Unit!22014)

(assert (=> b!647340 (= lt!300415 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300414 (select (arr!18458 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!647340 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!300417 () Unit!22014)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38498 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12499) Unit!22014)

(assert (=> b!647340 (= lt!300417 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12496))))

(assert (=> b!647340 (arrayNoDuplicates!0 lt!300414 #b00000000000000000000000000000000 Nil!12496)))

(declare-fun lt!300413 () Unit!22014)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38498 (_ BitVec 32) (_ BitVec 32)) Unit!22014)

(assert (=> b!647340 (= lt!300413 (lemmaNoDuplicateFromThenFromBigger!0 lt!300414 #b00000000000000000000000000000000 j!136))))

(assert (=> b!647340 (arrayNoDuplicates!0 lt!300414 j!136 Nil!12496)))

(declare-fun lt!300410 () Unit!22014)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38498 (_ BitVec 64) (_ BitVec 32) List!12499) Unit!22014)

(assert (=> b!647340 (= lt!300410 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300414 (select (arr!18458 a!2986) j!136) j!136 Nil!12496))))

(assert (=> b!647340 false))

(declare-fun b!647341 () Bool)

(declare-fun Unit!22018 () Unit!22014)

(assert (=> b!647341 (= e!371147 Unit!22018)))

(declare-fun b!647342 () Bool)

(declare-fun res!419458 () Bool)

(assert (=> b!647342 (=> (not res!419458) (not e!371153))))

(assert (=> b!647342 (= res!419458 (validKeyInArray!0 k!1786))))

(declare-fun b!647343 () Bool)

(declare-fun e!371154 () Bool)

(assert (=> b!647343 (= e!371154 e!371163)))

(declare-fun res!419444 () Bool)

(assert (=> b!647343 (=> res!419444 e!371163)))

(assert (=> b!647343 (= res!419444 (bvsge index!984 j!136))))

(declare-fun lt!300407 () Unit!22014)

(assert (=> b!647343 (= lt!300407 e!371160)))

(declare-fun c!74309 () Bool)

(assert (=> b!647343 (= c!74309 (bvslt j!136 index!984))))

(declare-fun b!647344 () Bool)

(declare-fun e!371152 () Bool)

(declare-fun e!371162 () Bool)

(assert (=> b!647344 (= e!371152 e!371162)))

(declare-fun res!419461 () Bool)

(assert (=> b!647344 (=> (not res!419461) (not e!371162))))

(assert (=> b!647344 (= res!419461 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) j!136))))

(declare-fun b!647345 () Bool)

(assert (=> b!647345 (= e!371153 e!371158)))

(declare-fun res!419445 () Bool)

(assert (=> b!647345 (=> (not res!419445) (not e!371158))))

(declare-fun lt!300411 () SeekEntryResult!6898)

(assert (=> b!647345 (= res!419445 (or (= lt!300411 (MissingZero!6898 i!1108)) (= lt!300411 (MissingVacant!6898 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38498 (_ BitVec 32)) SeekEntryResult!6898)

(assert (=> b!647345 (= lt!300411 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!647346 () Bool)

(declare-fun e!371161 () Bool)

(assert (=> b!647346 (= e!371156 (not e!371161))))

(declare-fun res!419449 () Bool)

(assert (=> b!647346 (=> res!419449 e!371161)))

(declare-fun lt!300418 () SeekEntryResult!6898)

(assert (=> b!647346 (= res!419449 (not (= lt!300418 (Found!6898 index!984))))))

(declare-fun lt!300404 () Unit!22014)

(assert (=> b!647346 (= lt!300404 e!371147)))

(declare-fun c!74308 () Bool)

(assert (=> b!647346 (= c!74308 (= lt!300418 Undefined!6898))))

(declare-fun lt!300416 () (_ BitVec 64))

(assert (=> b!647346 (= lt!300418 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300416 lt!300414 mask!3053))))

(assert (=> b!647346 e!371150))

(declare-fun res!419454 () Bool)

(assert (=> b!647346 (=> (not res!419454) (not e!371150))))

(declare-fun lt!300412 () (_ BitVec 32))

(assert (=> b!647346 (= res!419454 (= lt!300409 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 lt!300416 lt!300414 mask!3053)))))

(assert (=> b!647346 (= lt!300409 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!647346 (= lt!300416 (select (store (arr!18458 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!300403 () Unit!22014)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22014)

(assert (=> b!647346 (= lt!300403 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!647346 (= lt!300412 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!647347 () Bool)

(assert (=> b!647347 (= e!371162 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) index!984))))

(declare-fun b!647348 () Bool)

(assert (=> b!647348 (= e!371158 e!371155)))

(declare-fun res!419463 () Bool)

(assert (=> b!647348 (=> (not res!419463) (not e!371155))))

(assert (=> b!647348 (= res!419463 (= (select (store (arr!18458 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!647348 (= lt!300414 (array!38499 (store (arr!18458 a!2986) i!1108 k!1786) (size!18822 a!2986)))))

(declare-fun b!647349 () Bool)

(declare-fun e!371157 () Bool)

(assert (=> b!647349 (= e!371157 e!371152)))

(declare-fun res!419464 () Bool)

(assert (=> b!647349 (=> res!419464 e!371152)))

(declare-fun lt!300408 () (_ BitVec 64))

(assert (=> b!647349 (= res!419464 (or (not (= (select (arr!18458 a!2986) j!136) lt!300416)) (not (= (select (arr!18458 a!2986) j!136) lt!300408)) (bvsge j!136 index!984)))))

(declare-fun b!647337 () Bool)

(assert (=> b!647337 (= e!371149 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) index!984))))

(declare-fun res!419460 () Bool)

(assert (=> start!58650 (=> (not res!419460) (not e!371153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58650 (= res!419460 (validMask!0 mask!3053))))

(assert (=> start!58650 e!371153))

(assert (=> start!58650 true))

(declare-fun array_inv!14254 (array!38498) Bool)

(assert (=> start!58650 (array_inv!14254 a!2986)))

(declare-fun b!647350 () Bool)

(declare-fun Unit!22019 () Unit!22014)

(assert (=> b!647350 (= e!371160 Unit!22019)))

(declare-fun b!647351 () Bool)

(assert (=> b!647351 (= e!371161 e!371154)))

(declare-fun res!419465 () Bool)

(assert (=> b!647351 (=> res!419465 e!371154)))

(assert (=> b!647351 (= res!419465 (or (not (= (select (arr!18458 a!2986) j!136) lt!300416)) (not (= (select (arr!18458 a!2986) j!136) lt!300408))))))

(assert (=> b!647351 e!371157))

(declare-fun res!419459 () Bool)

(assert (=> b!647351 (=> (not res!419459) (not e!371157))))

(assert (=> b!647351 (= res!419459 (= lt!300408 (select (arr!18458 a!2986) j!136)))))

(assert (=> b!647351 (= lt!300408 (select (store (arr!18458 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!58650 res!419460) b!647332))

(assert (= (and b!647332 res!419446) b!647334))

(assert (= (and b!647334 res!419452) b!647342))

(assert (= (and b!647342 res!419458) b!647333))

(assert (= (and b!647333 res!419450) b!647345))

(assert (= (and b!647345 res!419445) b!647336))

(assert (= (and b!647336 res!419462) b!647338))

(assert (= (and b!647338 res!419455) b!647327))

(assert (= (and b!647327 res!419453) b!647348))

(assert (= (and b!647348 res!419463) b!647335))

(assert (= (and b!647335 res!419448) b!647346))

(assert (= (and b!647346 res!419454) b!647331))

(assert (= (and b!647346 c!74308) b!647326))

(assert (= (and b!647346 (not c!74308)) b!647341))

(assert (= (and b!647346 (not res!419449)) b!647351))

(assert (= (and b!647351 res!419459) b!647349))

(assert (= (and b!647349 (not res!419464)) b!647344))

(assert (= (and b!647344 res!419461) b!647347))

(assert (= (and b!647351 (not res!419465)) b!647343))

(assert (= (and b!647343 c!74309) b!647340))

(assert (= (and b!647343 (not c!74309)) b!647350))

(assert (= (and b!647343 (not res!419444)) b!647328))

(assert (= (and b!647328 res!419456) b!647337))

(assert (= (and b!647328 (not res!419447)) b!647339))

(assert (= (and b!647339 (not res!419457)) b!647329))

(assert (= (and b!647329 res!419451) b!647330))

(declare-fun m!620731 () Bool)

(assert (=> start!58650 m!620731))

(declare-fun m!620733 () Bool)

(assert (=> start!58650 m!620733))

(declare-fun m!620735 () Bool)

(assert (=> b!647333 m!620735))

(declare-fun m!620737 () Bool)

(assert (=> b!647339 m!620737))

(declare-fun m!620739 () Bool)

(assert (=> b!647349 m!620739))

(assert (=> b!647337 m!620739))

(assert (=> b!647337 m!620739))

(declare-fun m!620741 () Bool)

(assert (=> b!647337 m!620741))

(assert (=> b!647344 m!620739))

(assert (=> b!647344 m!620739))

(declare-fun m!620743 () Bool)

(assert (=> b!647344 m!620743))

(assert (=> b!647351 m!620739))

(declare-fun m!620745 () Bool)

(assert (=> b!647351 m!620745))

(declare-fun m!620747 () Bool)

(assert (=> b!647351 m!620747))

(assert (=> b!647334 m!620739))

(assert (=> b!647334 m!620739))

(declare-fun m!620749 () Bool)

(assert (=> b!647334 m!620749))

(declare-fun m!620751 () Bool)

(assert (=> b!647342 m!620751))

(assert (=> b!647347 m!620739))

(assert (=> b!647347 m!620739))

(assert (=> b!647347 m!620741))

(assert (=> b!647340 m!620739))

(declare-fun m!620753 () Bool)

(assert (=> b!647340 m!620753))

(assert (=> b!647340 m!620739))

(declare-fun m!620755 () Bool)

(assert (=> b!647340 m!620755))

(assert (=> b!647340 m!620739))

(declare-fun m!620757 () Bool)

(assert (=> b!647340 m!620757))

(declare-fun m!620759 () Bool)

(assert (=> b!647340 m!620759))

(declare-fun m!620761 () Bool)

(assert (=> b!647340 m!620761))

(declare-fun m!620763 () Bool)

(assert (=> b!647340 m!620763))

(declare-fun m!620765 () Bool)

(assert (=> b!647340 m!620765))

(assert (=> b!647340 m!620739))

(declare-fun m!620767 () Bool)

(assert (=> b!647336 m!620767))

(declare-fun m!620769 () Bool)

(assert (=> b!647327 m!620769))

(declare-fun m!620771 () Bool)

(assert (=> b!647330 m!620771))

(assert (=> b!647328 m!620739))

(assert (=> b!647328 m!620739))

(declare-fun m!620773 () Bool)

(assert (=> b!647328 m!620773))

(assert (=> b!647328 m!620739))

(declare-fun m!620775 () Bool)

(assert (=> b!647328 m!620775))

(assert (=> b!647328 m!620739))

(assert (=> b!647328 m!620743))

(declare-fun m!620777 () Bool)

(assert (=> b!647335 m!620777))

(assert (=> b!647335 m!620739))

(assert (=> b!647335 m!620739))

(declare-fun m!620779 () Bool)

(assert (=> b!647335 m!620779))

(declare-fun m!620781 () Bool)

(assert (=> b!647345 m!620781))

(declare-fun m!620783 () Bool)

(assert (=> b!647329 m!620783))

(declare-fun m!620785 () Bool)

(assert (=> b!647338 m!620785))

(assert (=> b!647348 m!620745))

(declare-fun m!620787 () Bool)

(assert (=> b!647348 m!620787))

(declare-fun m!620789 () Bool)

(assert (=> b!647346 m!620789))

(declare-fun m!620791 () Bool)

(assert (=> b!647346 m!620791))

(assert (=> b!647346 m!620739))

(assert (=> b!647346 m!620745))

(assert (=> b!647346 m!620739))

(declare-fun m!620793 () Bool)

(assert (=> b!647346 m!620793))

(declare-fun m!620795 () Bool)

(assert (=> b!647346 m!620795))

(declare-fun m!620797 () Bool)

(assert (=> b!647346 m!620797))

(declare-fun m!620799 () Bool)

(assert (=> b!647346 m!620799))

(push 1)

(assert (not b!647339))

(assert (not b!647338))

(assert (not b!647330))

(assert (not b!647344))

(assert (not b!647328))

(assert (not b!647335))

(assert (not b!647340))

(assert (not b!647334))

(assert (not b!647347))

(assert (not b!647333))

(assert (not b!647337))

(assert (not start!58650))

(assert (not b!647345))

(assert (not b!647346))

(assert (not b!647329))

(assert (not b!647342))

(assert (not b!647336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!647434 () Bool)

(declare-fun e!371234 () SeekEntryResult!6898)

(assert (=> b!647434 (= e!371234 (Found!6898 index!984))))

(declare-fun b!647436 () Bool)

(declare-fun e!371233 () SeekEntryResult!6898)

(assert (=> b!647436 (= e!371233 e!371234)))

(declare-fun c!74325 () Bool)

(declare-fun lt!300448 () (_ BitVec 64))

(assert (=> b!647436 (= c!74325 (= lt!300448 (select (arr!18458 a!2986) j!136)))))

(declare-fun b!647437 () Bool)

(declare-fun c!74326 () Bool)

(assert (=> b!647437 (= c!74326 (= lt!300448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371232 () SeekEntryResult!6898)

(assert (=> b!647437 (= e!371234 e!371232)))

(declare-fun b!647438 () Bool)

(assert (=> b!647438 (= e!371232 (MissingVacant!6898 vacantSpotIndex!68))))

(declare-fun b!647439 () Bool)

(assert (=> b!647439 (= e!371232 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!647435 () Bool)

(assert (=> b!647435 (= e!371233 Undefined!6898)))

(declare-fun d!91567 () Bool)

(declare-fun lt!300449 () SeekEntryResult!6898)

(assert (=> d!91567 (and (or (is-Undefined!6898 lt!300449) (not (is-Found!6898 lt!300449)) (and (bvsge (index!29934 lt!300449) #b00000000000000000000000000000000) (bvslt (index!29934 lt!300449) (size!18822 a!2986)))) (or (is-Undefined!6898 lt!300449) (is-Found!6898 lt!300449) (not (is-MissingVacant!6898 lt!300449)) (not (= (index!29936 lt!300449) vacantSpotIndex!68)) (and (bvsge (index!29936 lt!300449) #b00000000000000000000000000000000) (bvslt (index!29936 lt!300449) (size!18822 a!2986)))) (or (is-Undefined!6898 lt!300449) (ite (is-Found!6898 lt!300449) (= (select (arr!18458 a!2986) (index!29934 lt!300449)) (select (arr!18458 a!2986) j!136)) (and (is-MissingVacant!6898 lt!300449) (= (index!29936 lt!300449) vacantSpotIndex!68) (= (select (arr!18458 a!2986) (index!29936 lt!300449)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91567 (= lt!300449 e!371233)))

(declare-fun c!74324 () Bool)

(assert (=> d!91567 (= c!74324 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91567 (= lt!300448 (select (arr!18458 a!2986) index!984))))

(assert (=> d!91567 (validMask!0 mask!3053)))

(assert (=> d!91567 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053) lt!300449)))

(assert (= (and d!91567 c!74324) b!647435))

(assert (= (and d!91567 (not c!74324)) b!647436))

(assert (= (and b!647436 c!74325) b!647434))

(assert (= (and b!647436 (not c!74325)) b!647437))

(assert (= (and b!647437 c!74326) b!647438))

(assert (= (and b!647437 (not c!74326)) b!647439))

(assert (=> b!647439 m!620789))

(assert (=> b!647439 m!620789))

(assert (=> b!647439 m!620739))

(declare-fun m!620871 () Bool)

(assert (=> b!647439 m!620871))

(declare-fun m!620873 () Bool)

(assert (=> d!91567 m!620873))

(declare-fun m!620875 () Bool)

(assert (=> d!91567 m!620875))

(assert (=> d!91567 m!620777))

(assert (=> d!91567 m!620731))

(assert (=> b!647335 d!91567))

(declare-fun d!91577 () Bool)

(declare-fun lt!300467 () SeekEntryResult!6898)

(assert (=> d!91577 (and (or (is-Undefined!6898 lt!300467) (not (is-Found!6898 lt!300467)) (and (bvsge (index!29934 lt!300467) #b00000000000000000000000000000000) (bvslt (index!29934 lt!300467) (size!18822 a!2986)))) (or (is-Undefined!6898 lt!300467) (is-Found!6898 lt!300467) (not (is-MissingZero!6898 lt!300467)) (and (bvsge (index!29933 lt!300467) #b00000000000000000000000000000000) (bvslt (index!29933 lt!300467) (size!18822 a!2986)))) (or (is-Undefined!6898 lt!300467) (is-Found!6898 lt!300467) (is-MissingZero!6898 lt!300467) (not (is-MissingVacant!6898 lt!300467)) (and (bvsge (index!29936 lt!300467) #b00000000000000000000000000000000) (bvslt (index!29936 lt!300467) (size!18822 a!2986)))) (or (is-Undefined!6898 lt!300467) (ite (is-Found!6898 lt!300467) (= (select (arr!18458 a!2986) (index!29934 lt!300467)) k!1786) (ite (is-MissingZero!6898 lt!300467) (= (select (arr!18458 a!2986) (index!29933 lt!300467)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6898 lt!300467) (= (select (arr!18458 a!2986) (index!29936 lt!300467)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!371273 () SeekEntryResult!6898)

(assert (=> d!91577 (= lt!300467 e!371273)))

(declare-fun c!74346 () Bool)

(declare-fun lt!300466 () SeekEntryResult!6898)

(assert (=> d!91577 (= c!74346 (and (is-Intermediate!6898 lt!300466) (undefined!7710 lt!300466)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38498 (_ BitVec 32)) SeekEntryResult!6898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91577 (= lt!300466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!91577 (validMask!0 mask!3053)))

(assert (=> d!91577 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!300467)))

(declare-fun b!647495 () Bool)

(assert (=> b!647495 (= e!371273 Undefined!6898)))

(declare-fun e!371274 () SeekEntryResult!6898)

(declare-fun b!647496 () Bool)

(assert (=> b!647496 (= e!371274 (seekKeyOrZeroReturnVacant!0 (x!58709 lt!300466) (index!29935 lt!300466) (index!29935 lt!300466) k!1786 a!2986 mask!3053))))

(declare-fun b!647497 () Bool)

(assert (=> b!647497 (= e!371274 (MissingZero!6898 (index!29935 lt!300466)))))

(declare-fun b!647498 () Bool)

(declare-fun c!74345 () Bool)

(declare-fun lt!300468 () (_ BitVec 64))

(assert (=> b!647498 (= c!74345 (= lt!300468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371272 () SeekEntryResult!6898)

(assert (=> b!647498 (= e!371272 e!371274)))

(declare-fun b!647499 () Bool)

(assert (=> b!647499 (= e!371272 (Found!6898 (index!29935 lt!300466)))))

(declare-fun b!647500 () Bool)

(assert (=> b!647500 (= e!371273 e!371272)))

(assert (=> b!647500 (= lt!300468 (select (arr!18458 a!2986) (index!29935 lt!300466)))))

(declare-fun c!74347 () Bool)

(assert (=> b!647500 (= c!74347 (= lt!300468 k!1786))))

(assert (= (and d!91577 c!74346) b!647495))

(assert (= (and d!91577 (not c!74346)) b!647500))

(assert (= (and b!647500 c!74347) b!647499))

(assert (= (and b!647500 (not c!74347)) b!647498))

(assert (= (and b!647498 c!74345) b!647497))

(assert (= (and b!647498 (not c!74345)) b!647496))

(declare-fun m!620911 () Bool)

(assert (=> d!91577 m!620911))

(declare-fun m!620913 () Bool)

(assert (=> d!91577 m!620913))

(assert (=> d!91577 m!620731))

(declare-fun m!620915 () Bool)

(assert (=> d!91577 m!620915))

(declare-fun m!620917 () Bool)

(assert (=> d!91577 m!620917))

(assert (=> d!91577 m!620911))

(declare-fun m!620919 () Bool)

(assert (=> d!91577 m!620919))

(declare-fun m!620921 () Bool)

(assert (=> b!647496 m!620921))

(declare-fun m!620923 () Bool)

(assert (=> b!647500 m!620923))

(assert (=> b!647345 d!91577))

(declare-fun d!91589 () Bool)

(assert (=> d!91589 (= (validKeyInArray!0 (select (arr!18458 a!2986) j!136)) (and (not (= (select (arr!18458 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18458 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!647334 d!91589))

(declare-fun d!91591 () Bool)

(declare-fun res!419543 () Bool)

(declare-fun e!371285 () Bool)

(assert (=> d!91591 (=> res!419543 e!371285)))

(assert (=> d!91591 (= res!419543 (= (select (arr!18458 lt!300414) j!136) (select (arr!18458 a!2986) j!136)))))

(assert (=> d!91591 (= (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) j!136) e!371285)))

(declare-fun b!647517 () Bool)

(declare-fun e!371286 () Bool)

(assert (=> b!647517 (= e!371285 e!371286)))

(declare-fun res!419544 () Bool)

(assert (=> b!647517 (=> (not res!419544) (not e!371286))))

(assert (=> b!647517 (= res!419544 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18822 lt!300414)))))

(declare-fun b!647518 () Bool)

(assert (=> b!647518 (= e!371286 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91591 (not res!419543)) b!647517))

(assert (= (and b!647517 res!419544) b!647518))

(declare-fun m!620925 () Bool)

(assert (=> d!91591 m!620925))

(assert (=> b!647518 m!620739))

(declare-fun m!620927 () Bool)

(assert (=> b!647518 m!620927))

(assert (=> b!647344 d!91591))

(declare-fun d!91593 () Bool)

(declare-fun res!419545 () Bool)

(declare-fun e!371287 () Bool)

(assert (=> d!91593 (=> res!419545 e!371287)))

(assert (=> d!91593 (= res!419545 (= (select (arr!18458 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91593 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!371287)))

(declare-fun b!647519 () Bool)

(declare-fun e!371288 () Bool)

(assert (=> b!647519 (= e!371287 e!371288)))

(declare-fun res!419546 () Bool)

(assert (=> b!647519 (=> (not res!419546) (not e!371288))))

(assert (=> b!647519 (= res!419546 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18822 a!2986)))))

(declare-fun b!647520 () Bool)

(assert (=> b!647520 (= e!371288 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91593 (not res!419545)) b!647519))

(assert (= (and b!647519 res!419546) b!647520))

(declare-fun m!620929 () Bool)

(assert (=> d!91593 m!620929))

(declare-fun m!620931 () Bool)

(assert (=> b!647520 m!620931))

(assert (=> b!647333 d!91593))

(declare-fun d!91595 () Bool)

(declare-fun res!419547 () Bool)

(declare-fun e!371289 () Bool)

(assert (=> d!91595 (=> res!419547 e!371289)))

(assert (=> d!91595 (= res!419547 (= (select (arr!18458 lt!300414) index!984) (select (arr!18458 a!2986) j!136)))))

(assert (=> d!91595 (= (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) index!984) e!371289)))

(declare-fun b!647521 () Bool)

(declare-fun e!371290 () Bool)

(assert (=> b!647521 (= e!371289 e!371290)))

(declare-fun res!419548 () Bool)

(assert (=> b!647521 (=> (not res!419548) (not e!371290))))

(assert (=> b!647521 (= res!419548 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18822 lt!300414)))))

(declare-fun b!647522 () Bool)

(assert (=> b!647522 (= e!371290 (arrayContainsKey!0 lt!300414 (select (arr!18458 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91595 (not res!419547)) b!647521))

(assert (= (and b!647521 res!419548) b!647522))

(declare-fun m!620933 () Bool)

(assert (=> d!91595 m!620933))

(assert (=> b!647522 m!620739))

(declare-fun m!620935 () Bool)

(assert (=> b!647522 m!620935))

(assert (=> b!647337 d!91595))

(declare-fun d!91597 () Bool)

(assert (=> d!91597 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58650 d!91597))

(declare-fun d!91607 () Bool)

(assert (=> d!91607 (= (array_inv!14254 a!2986) (bvsge (size!18822 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58650 d!91607))

(assert (=> b!647347 d!91595))

(declare-fun b!647576 () Bool)

(declare-fun e!371323 () Bool)

(declare-fun call!33694 () Bool)

(assert (=> b!647576 (= e!371323 call!33694)))

(declare-fun d!91609 () Bool)

(declare-fun res!419557 () Bool)

(declare-fun e!371321 () Bool)

(assert (=> d!91609 (=> res!419557 e!371321)))

(assert (=> d!91609 (= res!419557 (bvsge #b00000000000000000000000000000000 (size!18822 a!2986)))))

(assert (=> d!91609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!371321)))

(declare-fun bm!33691 () Bool)

(assert (=> bm!33691 (= call!33694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!647577 () Bool)

(declare-fun e!371322 () Bool)

(assert (=> b!647577 (= e!371322 e!371323)))

(declare-fun lt!300499 () (_ BitVec 64))

(assert (=> b!647577 (= lt!300499 (select (arr!18458 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!300500 () Unit!22014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38498 (_ BitVec 64) (_ BitVec 32)) Unit!22014)

(assert (=> b!647577 (= lt!300500 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!300499 #b00000000000000000000000000000000))))

(assert (=> b!647577 (arrayContainsKey!0 a!2986 lt!300499 #b00000000000000000000000000000000)))

(declare-fun lt!300501 () Unit!22014)

(assert (=> b!647577 (= lt!300501 lt!300500)))

(declare-fun res!419556 () Bool)

(assert (=> b!647577 (= res!419556 (= (seekEntryOrOpen!0 (select (arr!18458 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6898 #b00000000000000000000000000000000)))))

(assert (=> b!647577 (=> (not res!419556) (not e!371323))))

(declare-fun b!647578 () Bool)

(assert (=> b!647578 (= e!371322 call!33694)))

(declare-fun b!647579 () Bool)

(assert (=> b!647579 (= e!371321 e!371322)))

(declare-fun c!74377 () Bool)

(assert (=> b!647579 (= c!74377 (validKeyInArray!0 (select (arr!18458 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91609 (not res!419557)) b!647579))

(assert (= (and b!647579 c!74377) b!647577))

(assert (= (and b!647579 (not c!74377)) b!647578))

(assert (= (and b!647577 res!419556) b!647576))

(assert (= (or b!647576 b!647578) bm!33691))

(declare-fun m!620985 () Bool)

(assert (=> bm!33691 m!620985))

(assert (=> b!647577 m!620929))

(declare-fun m!620987 () Bool)

(assert (=> b!647577 m!620987))

(declare-fun m!620989 () Bool)

(assert (=> b!647577 m!620989))

(assert (=> b!647577 m!620929))

(declare-fun m!620991 () Bool)

(assert (=> b!647577 m!620991))

(assert (=> b!647579 m!620929))

(assert (=> b!647579 m!620929))

(declare-fun m!620993 () Bool)

(assert (=> b!647579 m!620993))

(assert (=> b!647336 d!91609))

(declare-fun d!91615 () Bool)

(declare-fun e!371332 () Bool)

(assert (=> d!91615 e!371332))

(declare-fun res!419560 () Bool)

(assert (=> d!91615 (=> (not res!419560) (not e!371332))))

(assert (=> d!91615 (= res!419560 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18822 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18822 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18822 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18822 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18822 a!2986))))))

(declare-fun lt!300511 () Unit!22014)

(declare-fun choose!9 (array!38498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22014)

(assert (=> d!91615 (= lt!300511 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91615 (validMask!0 mask!3053)))

(assert (=> d!91615 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 mask!3053) lt!300511)))

(declare-fun b!647594 () Bool)

(assert (=> b!647594 (= e!371332 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 (select (arr!18458 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 (select (store (arr!18458 a!2986) i!1108 k!1786) j!136) (array!38499 (store (arr!18458 a!2986) i!1108 k!1786) (size!18822 a!2986)) mask!3053)))))

(assert (= (and d!91615 res!419560) b!647594))

(declare-fun m!620997 () Bool)

(assert (=> d!91615 m!620997))

(assert (=> d!91615 m!620731))

(assert (=> b!647594 m!620791))

(assert (=> b!647594 m!620739))

(assert (=> b!647594 m!620739))

(assert (=> b!647594 m!620793))

(assert (=> b!647594 m!620745))

(assert (=> b!647594 m!620791))

(declare-fun m!620999 () Bool)

(assert (=> b!647594 m!620999))

(assert (=> b!647346 d!91615))

(declare-fun b!647601 () Bool)

(declare-fun e!371338 () SeekEntryResult!6898)

(assert (=> b!647601 (= e!371338 (Found!6898 lt!300412))))

(declare-fun b!647603 () Bool)

(declare-fun e!371337 () SeekEntryResult!6898)

(assert (=> b!647603 (= e!371337 e!371338)))

(declare-fun c!74388 () Bool)

(declare-fun lt!300514 () (_ BitVec 64))

(assert (=> b!647603 (= c!74388 (= lt!300514 lt!300416))))

(declare-fun b!647604 () Bool)

(declare-fun c!74389 () Bool)

(assert (=> b!647604 (= c!74389 (= lt!300514 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!371336 () SeekEntryResult!6898)

(assert (=> b!647604 (= e!371338 e!371336)))

(declare-fun b!647605 () Bool)

(assert (=> b!647605 (= e!371336 (MissingVacant!6898 vacantSpotIndex!68))))

(declare-fun b!647606 () Bool)

(assert (=> b!647606 (= e!371336 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!300412 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!300416 lt!300414 mask!3053))))

(declare-fun b!647602 () Bool)

(assert (=> b!647602 (= e!371337 Undefined!6898)))

(declare-fun lt!300515 () SeekEntryResult!6898)

(declare-fun d!91617 () Bool)

(assert (=> d!91617 (and (or (is-Undefined!6898 lt!300515) (not (is-Found!6898 lt!300515)) (and (bvsge (index!29934 lt!300515) #b00000000000000000000000000000000) (bvslt (index!29934 lt!300515) (size!18822 lt!300414)))) (or (is-Undefined!6898 lt!300515) (is-Found!6898 lt!300515) (not (is-MissingVacant!6898 lt!300515)) (not (= (index!29936 lt!300515) vacantSpotIndex!68)) (and (bvsge (index!29936 lt!300515) #b00000000000000000000000000000000) (bvslt (index!29936 lt!300515) (size!18822 lt!300414)))) (or (is-Undefined!6898 lt!300515) (ite (is-Found!6898 lt!300515) (= (select (arr!18458 lt!300414) (index!29934 lt!300515)) lt!300416) (and (is-MissingVacant!6898 lt!300515) (= (index!29936 lt!300515) vacantSpotIndex!68) (= (select (arr!18458 lt!300414) (index!29936 lt!300515)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91617 (= lt!300515 e!371337)))

(declare-fun c!74387 () Bool)

(assert (=> d!91617 (= c!74387 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91617 (= lt!300514 (select (arr!18458 lt!300414) lt!300412))))

(assert (=> d!91617 (validMask!0 mask!3053)))

(assert (=> d!91617 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300412 vacantSpotIndex!68 lt!300416 lt!300414 mask!3053) lt!300515)))

(assert (= (and d!91617 c!74387) b!647602))

(assert (= (and d!91617 (not c!74387)) b!647603))

(assert (= (and b!647603 c!74388) b!647601))

(assert (= (and b!647603 (not c!74388)) b!647604))

(assert (= (and b!647604 c!74389) b!647605))

(assert (= (and b!647604 (not c!74389)) b!647606))

(declare-fun m!621007 () Bool)

(assert (=> b!647606 m!621007))

(assert (=> b!647606 m!621007))

(declare-fun m!621009 () Bool)

(assert (=> b!647606 m!621009))

(declare-fun m!621011 () Bool)

(assert (=> d!91617 m!621011))

(declare-fun m!621013 () Bool)

(assert (=> d!91617 m!621013))

(declare-fun m!621015 () Bool)

(assert (=> d!91617 m!621015))

(assert (=> d!91617 m!620731))

(assert (=> b!647346 d!91617))

(declare-fun d!91621 () Bool)

(declare-fun lt!300518 () (_ BitVec 32))

(assert (=> d!91621 (and (bvsge lt!300518 #b00000000000000000000000000000000) (bvslt lt!300518 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91621 (= lt!300518 (choose!52 index!984 x!910 mask!3053))))

