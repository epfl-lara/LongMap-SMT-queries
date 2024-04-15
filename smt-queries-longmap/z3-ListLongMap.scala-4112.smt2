; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56154 () Bool)

(assert start!56154)

(declare-fun b!621362 () Bool)

(declare-fun res!400472 () Bool)

(declare-fun e!356382 () Bool)

(assert (=> b!621362 (=> (not res!400472) (not e!356382))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37638 0))(
  ( (array!37639 (arr!18065 (Array (_ BitVec 32) (_ BitVec 64))) (size!18430 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37638)

(assert (=> b!621362 (= res!400472 (and (= (size!18430 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18430 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18430 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621363 () Bool)

(declare-fun res!400479 () Bool)

(declare-fun e!356375 () Bool)

(assert (=> b!621363 (=> (not res!400479) (not e!356375))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!621363 (= res!400479 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18065 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621364 () Bool)

(declare-fun res!400478 () Bool)

(assert (=> b!621364 (=> (not res!400478) (not e!356375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37638 (_ BitVec 32)) Bool)

(assert (=> b!621364 (= res!400478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621365 () Bool)

(assert (=> b!621365 (= e!356382 e!356375)))

(declare-fun res!400471 () Bool)

(assert (=> b!621365 (=> (not res!400471) (not e!356375))))

(declare-datatypes ((SeekEntryResult!6502 0))(
  ( (MissingZero!6502 (index!28292 (_ BitVec 32))) (Found!6502 (index!28293 (_ BitVec 32))) (Intermediate!6502 (undefined!7314 Bool) (index!28294 (_ BitVec 32)) (x!57073 (_ BitVec 32))) (Undefined!6502) (MissingVacant!6502 (index!28295 (_ BitVec 32))) )
))
(declare-fun lt!287496 () SeekEntryResult!6502)

(assert (=> b!621365 (= res!400471 (or (= lt!287496 (MissingZero!6502 i!1108)) (= lt!287496 (MissingVacant!6502 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37638 (_ BitVec 32)) SeekEntryResult!6502)

(assert (=> b!621365 (= lt!287496 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!400470 () Bool)

(assert (=> start!56154 (=> (not res!400470) (not e!356382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56154 (= res!400470 (validMask!0 mask!3053))))

(assert (=> start!56154 e!356382))

(assert (=> start!56154 true))

(declare-fun array_inv!13948 (array!37638) Bool)

(assert (=> start!56154 (array_inv!13948 a!2986)))

(declare-fun b!621366 () Bool)

(declare-fun e!356369 () Bool)

(assert (=> b!621366 (= e!356375 e!356369)))

(declare-fun res!400466 () Bool)

(assert (=> b!621366 (=> (not res!400466) (not e!356369))))

(assert (=> b!621366 (= res!400466 (= (select (store (arr!18065 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!287488 () array!37638)

(assert (=> b!621366 (= lt!287488 (array!37639 (store (arr!18065 a!2986) i!1108 k0!1786) (size!18430 a!2986)))))

(declare-fun b!621367 () Bool)

(assert (=> b!621367 false))

(declare-datatypes ((Unit!20766 0))(
  ( (Unit!20767) )
))
(declare-fun lt!287489 () Unit!20766)

(declare-datatypes ((List!12145 0))(
  ( (Nil!12142) (Cons!12141 (h!13186 (_ BitVec 64)) (t!18364 List!12145)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37638 (_ BitVec 64) (_ BitVec 32) List!12145) Unit!20766)

(assert (=> b!621367 (= lt!287489 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287488 (select (arr!18065 a!2986) j!136) j!136 Nil!12142))))

(declare-fun arrayNoDuplicates!0 (array!37638 (_ BitVec 32) List!12145) Bool)

(assert (=> b!621367 (arrayNoDuplicates!0 lt!287488 j!136 Nil!12142)))

(declare-fun lt!287493 () Unit!20766)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37638 (_ BitVec 32) (_ BitVec 32)) Unit!20766)

(assert (=> b!621367 (= lt!287493 (lemmaNoDuplicateFromThenFromBigger!0 lt!287488 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621367 (arrayNoDuplicates!0 lt!287488 #b00000000000000000000000000000000 Nil!12142)))

(declare-fun lt!287487 () Unit!20766)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12145) Unit!20766)

(assert (=> b!621367 (= lt!287487 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12142))))

(declare-fun arrayContainsKey!0 (array!37638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621367 (arrayContainsKey!0 lt!287488 (select (arr!18065 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287492 () Unit!20766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37638 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20766)

(assert (=> b!621367 (= lt!287492 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287488 (select (arr!18065 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356371 () Unit!20766)

(declare-fun Unit!20768 () Unit!20766)

(assert (=> b!621367 (= e!356371 Unit!20768)))

(declare-fun res!400473 () Bool)

(declare-fun b!621368 () Bool)

(assert (=> b!621368 (= res!400473 (arrayContainsKey!0 lt!287488 (select (arr!18065 a!2986) j!136) j!136))))

(declare-fun e!356378 () Bool)

(assert (=> b!621368 (=> (not res!400473) (not e!356378))))

(declare-fun e!356379 () Bool)

(assert (=> b!621368 (= e!356379 e!356378)))

(declare-fun b!621369 () Bool)

(declare-fun e!356372 () Unit!20766)

(declare-fun Unit!20769 () Unit!20766)

(assert (=> b!621369 (= e!356372 Unit!20769)))

(declare-fun b!621370 () Bool)

(declare-fun res!400476 () Bool)

(assert (=> b!621370 (=> (not res!400476) (not e!356375))))

(assert (=> b!621370 (= res!400476 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12142))))

(declare-fun b!621371 () Bool)

(declare-fun res!400468 () Bool)

(assert (=> b!621371 (=> (not res!400468) (not e!356382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621371 (= res!400468 (validKeyInArray!0 (select (arr!18065 a!2986) j!136)))))

(declare-fun b!621372 () Bool)

(assert (=> b!621372 (= e!356378 (arrayContainsKey!0 lt!287488 (select (arr!18065 a!2986) j!136) index!984))))

(declare-fun b!621373 () Bool)

(declare-fun Unit!20770 () Unit!20766)

(assert (=> b!621373 (= e!356371 Unit!20770)))

(declare-fun b!621374 () Bool)

(declare-fun res!400477 () Bool)

(assert (=> b!621374 (= res!400477 (bvsge j!136 index!984))))

(assert (=> b!621374 (=> res!400477 e!356379)))

(declare-fun e!356380 () Bool)

(assert (=> b!621374 (= e!356380 e!356379)))

(declare-fun b!621375 () Bool)

(declare-fun res!400469 () Bool)

(assert (=> b!621375 (=> (not res!400469) (not e!356382))))

(assert (=> b!621375 (= res!400469 (validKeyInArray!0 k0!1786))))

(declare-fun b!621376 () Bool)

(declare-fun e!356376 () Bool)

(declare-fun lt!287490 () SeekEntryResult!6502)

(declare-fun lt!287484 () SeekEntryResult!6502)

(assert (=> b!621376 (= e!356376 (= lt!287490 lt!287484))))

(declare-fun b!621377 () Bool)

(declare-fun e!356373 () Unit!20766)

(declare-fun Unit!20771 () Unit!20766)

(assert (=> b!621377 (= e!356373 Unit!20771)))

(declare-fun b!621378 () Bool)

(declare-fun e!356374 () Unit!20766)

(declare-fun Unit!20772 () Unit!20766)

(assert (=> b!621378 (= e!356374 Unit!20772)))

(assert (=> b!621378 false))

(declare-fun b!621379 () Bool)

(declare-fun e!356377 () Bool)

(assert (=> b!621379 (= e!356369 e!356377)))

(declare-fun res!400475 () Bool)

(assert (=> b!621379 (=> (not res!400475) (not e!356377))))

(assert (=> b!621379 (= res!400475 (and (= lt!287490 (Found!6502 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18065 a!2986) index!984) (select (arr!18065 a!2986) j!136))) (not (= (select (arr!18065 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37638 (_ BitVec 32)) SeekEntryResult!6502)

(assert (=> b!621379 (= lt!287490 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18065 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621380 () Bool)

(assert (=> b!621380 (= e!356377 (not true))))

(declare-fun lt!287495 () Unit!20766)

(assert (=> b!621380 (= lt!287495 e!356372)))

(declare-fun c!70816 () Bool)

(declare-fun lt!287502 () SeekEntryResult!6502)

(assert (=> b!621380 (= c!70816 (= lt!287502 (Found!6502 index!984)))))

(declare-fun lt!287485 () Unit!20766)

(assert (=> b!621380 (= lt!287485 e!356374)))

(declare-fun c!70815 () Bool)

(assert (=> b!621380 (= c!70815 (= lt!287502 Undefined!6502))))

(declare-fun lt!287499 () (_ BitVec 64))

(assert (=> b!621380 (= lt!287502 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287499 lt!287488 mask!3053))))

(assert (=> b!621380 e!356376))

(declare-fun res!400474 () Bool)

(assert (=> b!621380 (=> (not res!400474) (not e!356376))))

(declare-fun lt!287501 () (_ BitVec 32))

(assert (=> b!621380 (= res!400474 (= lt!287484 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287501 vacantSpotIndex!68 lt!287499 lt!287488 mask!3053)))))

(assert (=> b!621380 (= lt!287484 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287501 vacantSpotIndex!68 (select (arr!18065 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621380 (= lt!287499 (select (store (arr!18065 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287500 () Unit!20766)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37638 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20766)

(assert (=> b!621380 (= lt!287500 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287501 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621380 (= lt!287501 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621381 () Bool)

(declare-fun res!400481 () Bool)

(assert (=> b!621381 (=> (not res!400481) (not e!356382))))

(assert (=> b!621381 (= res!400481 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621382 () Bool)

(declare-fun Unit!20773 () Unit!20766)

(assert (=> b!621382 (= e!356374 Unit!20773)))

(declare-fun e!356381 () Bool)

(declare-fun b!621383 () Bool)

(assert (=> b!621383 (= e!356381 (arrayContainsKey!0 lt!287488 (select (arr!18065 a!2986) j!136) index!984))))

(declare-fun b!621384 () Bool)

(assert (=> b!621384 false))

(declare-fun lt!287498 () Unit!20766)

(assert (=> b!621384 (= lt!287498 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287488 (select (arr!18065 a!2986) j!136) index!984 Nil!12142))))

(assert (=> b!621384 (arrayNoDuplicates!0 lt!287488 index!984 Nil!12142)))

(declare-fun lt!287486 () Unit!20766)

(assert (=> b!621384 (= lt!287486 (lemmaNoDuplicateFromThenFromBigger!0 lt!287488 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621384 (arrayNoDuplicates!0 lt!287488 #b00000000000000000000000000000000 Nil!12142)))

(declare-fun lt!287494 () Unit!20766)

(assert (=> b!621384 (= lt!287494 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12142))))

(assert (=> b!621384 (arrayContainsKey!0 lt!287488 (select (arr!18065 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287503 () Unit!20766)

(assert (=> b!621384 (= lt!287503 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287488 (select (arr!18065 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621384 e!356381))

(declare-fun res!400480 () Bool)

(assert (=> b!621384 (=> (not res!400480) (not e!356381))))

(assert (=> b!621384 (= res!400480 (arrayContainsKey!0 lt!287488 (select (arr!18065 a!2986) j!136) j!136))))

(declare-fun Unit!20774 () Unit!20766)

(assert (=> b!621384 (= e!356373 Unit!20774)))

(declare-fun b!621385 () Bool)

(declare-fun Unit!20775 () Unit!20766)

(assert (=> b!621385 (= e!356372 Unit!20775)))

(declare-fun res!400467 () Bool)

(assert (=> b!621385 (= res!400467 (= (select (store (arr!18065 a!2986) i!1108 k0!1786) index!984) (select (arr!18065 a!2986) j!136)))))

(assert (=> b!621385 (=> (not res!400467) (not e!356380))))

(assert (=> b!621385 e!356380))

(declare-fun c!70818 () Bool)

(assert (=> b!621385 (= c!70818 (bvslt j!136 index!984))))

(declare-fun lt!287491 () Unit!20766)

(assert (=> b!621385 (= lt!287491 e!356371)))

(declare-fun c!70817 () Bool)

(assert (=> b!621385 (= c!70817 (bvslt index!984 j!136))))

(declare-fun lt!287497 () Unit!20766)

(assert (=> b!621385 (= lt!287497 e!356373)))

(assert (=> b!621385 false))

(assert (= (and start!56154 res!400470) b!621362))

(assert (= (and b!621362 res!400472) b!621371))

(assert (= (and b!621371 res!400468) b!621375))

(assert (= (and b!621375 res!400469) b!621381))

(assert (= (and b!621381 res!400481) b!621365))

(assert (= (and b!621365 res!400471) b!621364))

(assert (= (and b!621364 res!400478) b!621370))

(assert (= (and b!621370 res!400476) b!621363))

(assert (= (and b!621363 res!400479) b!621366))

(assert (= (and b!621366 res!400466) b!621379))

(assert (= (and b!621379 res!400475) b!621380))

(assert (= (and b!621380 res!400474) b!621376))

(assert (= (and b!621380 c!70815) b!621378))

(assert (= (and b!621380 (not c!70815)) b!621382))

(assert (= (and b!621380 c!70816) b!621385))

(assert (= (and b!621380 (not c!70816)) b!621369))

(assert (= (and b!621385 res!400467) b!621374))

(assert (= (and b!621374 (not res!400477)) b!621368))

(assert (= (and b!621368 res!400473) b!621372))

(assert (= (and b!621385 c!70818) b!621367))

(assert (= (and b!621385 (not c!70818)) b!621373))

(assert (= (and b!621385 c!70817) b!621384))

(assert (= (and b!621385 (not c!70817)) b!621377))

(assert (= (and b!621384 res!400480) b!621383))

(declare-fun m!596749 () Bool)

(assert (=> start!56154 m!596749))

(declare-fun m!596751 () Bool)

(assert (=> start!56154 m!596751))

(declare-fun m!596753 () Bool)

(assert (=> b!621366 m!596753))

(declare-fun m!596755 () Bool)

(assert (=> b!621366 m!596755))

(declare-fun m!596757 () Bool)

(assert (=> b!621380 m!596757))

(declare-fun m!596759 () Bool)

(assert (=> b!621380 m!596759))

(declare-fun m!596761 () Bool)

(assert (=> b!621380 m!596761))

(assert (=> b!621380 m!596761))

(declare-fun m!596763 () Bool)

(assert (=> b!621380 m!596763))

(assert (=> b!621380 m!596753))

(declare-fun m!596765 () Bool)

(assert (=> b!621380 m!596765))

(declare-fun m!596767 () Bool)

(assert (=> b!621380 m!596767))

(declare-fun m!596769 () Bool)

(assert (=> b!621380 m!596769))

(declare-fun m!596771 () Bool)

(assert (=> b!621365 m!596771))

(declare-fun m!596773 () Bool)

(assert (=> b!621364 m!596773))

(assert (=> b!621368 m!596761))

(assert (=> b!621368 m!596761))

(declare-fun m!596775 () Bool)

(assert (=> b!621368 m!596775))

(declare-fun m!596777 () Bool)

(assert (=> b!621363 m!596777))

(declare-fun m!596779 () Bool)

(assert (=> b!621370 m!596779))

(declare-fun m!596781 () Bool)

(assert (=> b!621379 m!596781))

(assert (=> b!621379 m!596761))

(assert (=> b!621379 m!596761))

(declare-fun m!596783 () Bool)

(assert (=> b!621379 m!596783))

(declare-fun m!596785 () Bool)

(assert (=> b!621381 m!596785))

(assert (=> b!621367 m!596761))

(declare-fun m!596787 () Bool)

(assert (=> b!621367 m!596787))

(declare-fun m!596789 () Bool)

(assert (=> b!621367 m!596789))

(assert (=> b!621367 m!596761))

(declare-fun m!596791 () Bool)

(assert (=> b!621367 m!596791))

(declare-fun m!596793 () Bool)

(assert (=> b!621367 m!596793))

(assert (=> b!621367 m!596761))

(declare-fun m!596795 () Bool)

(assert (=> b!621367 m!596795))

(assert (=> b!621367 m!596761))

(declare-fun m!596797 () Bool)

(assert (=> b!621367 m!596797))

(declare-fun m!596799 () Bool)

(assert (=> b!621367 m!596799))

(assert (=> b!621371 m!596761))

(assert (=> b!621371 m!596761))

(declare-fun m!596801 () Bool)

(assert (=> b!621371 m!596801))

(assert (=> b!621384 m!596789))

(assert (=> b!621384 m!596761))

(declare-fun m!596803 () Bool)

(assert (=> b!621384 m!596803))

(assert (=> b!621384 m!596761))

(declare-fun m!596805 () Bool)

(assert (=> b!621384 m!596805))

(assert (=> b!621384 m!596799))

(assert (=> b!621384 m!596761))

(declare-fun m!596807 () Bool)

(assert (=> b!621384 m!596807))

(assert (=> b!621384 m!596761))

(assert (=> b!621384 m!596775))

(assert (=> b!621384 m!596761))

(declare-fun m!596809 () Bool)

(assert (=> b!621384 m!596809))

(declare-fun m!596811 () Bool)

(assert (=> b!621384 m!596811))

(declare-fun m!596813 () Bool)

(assert (=> b!621375 m!596813))

(assert (=> b!621383 m!596761))

(assert (=> b!621383 m!596761))

(declare-fun m!596815 () Bool)

(assert (=> b!621383 m!596815))

(assert (=> b!621385 m!596753))

(declare-fun m!596817 () Bool)

(assert (=> b!621385 m!596817))

(assert (=> b!621385 m!596761))

(assert (=> b!621372 m!596761))

(assert (=> b!621372 m!596761))

(assert (=> b!621372 m!596815))

(check-sat (not b!621381) (not b!621371) (not b!621367) (not start!56154) (not b!621379) (not b!621380) (not b!621365) (not b!621375) (not b!621383) (not b!621364) (not b!621370) (not b!621368) (not b!621372) (not b!621384))
(check-sat)
