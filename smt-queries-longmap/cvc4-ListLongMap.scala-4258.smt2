; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59106 () Bool)

(assert start!59106)

(declare-fun b!652294 () Bool)

(declare-datatypes ((Unit!22302 0))(
  ( (Unit!22303) )
))
(declare-fun e!374385 () Unit!22302)

(declare-fun Unit!22304 () Unit!22302)

(assert (=> b!652294 (= e!374385 Unit!22304)))

(declare-fun b!652295 () Bool)

(declare-fun res!422991 () Bool)

(declare-fun e!374378 () Bool)

(assert (=> b!652295 (=> (not res!422991) (not e!374378))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652295 (= res!422991 (validKeyInArray!0 k!1786))))

(declare-fun b!652296 () Bool)

(declare-fun e!374383 () Unit!22302)

(declare-fun Unit!22305 () Unit!22302)

(assert (=> b!652296 (= e!374383 Unit!22305)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38606 0))(
  ( (array!38607 (arr!18506 (Array (_ BitVec 32) (_ BitVec 64))) (size!18870 (_ BitVec 32))) )
))
(declare-fun lt!303502 () array!38606)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38606)

(declare-fun lt!303511 () Unit!22302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38606 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22302)

(assert (=> b!652296 (= lt!303511 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303502 (select (arr!18506 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652296 (arrayContainsKey!0 lt!303502 (select (arr!18506 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303499 () Unit!22302)

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((List!12547 0))(
  ( (Nil!12544) (Cons!12543 (h!13588 (_ BitVec 64)) (t!18775 List!12547)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38606 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12547) Unit!22302)

(assert (=> b!652296 (= lt!303499 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12544))))

(declare-fun arrayNoDuplicates!0 (array!38606 (_ BitVec 32) List!12547) Bool)

(assert (=> b!652296 (arrayNoDuplicates!0 lt!303502 #b00000000000000000000000000000000 Nil!12544)))

(declare-fun lt!303494 () Unit!22302)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38606 (_ BitVec 32) (_ BitVec 32)) Unit!22302)

(assert (=> b!652296 (= lt!303494 (lemmaNoDuplicateFromThenFromBigger!0 lt!303502 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652296 (arrayNoDuplicates!0 lt!303502 j!136 Nil!12544)))

(declare-fun lt!303500 () Unit!22302)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38606 (_ BitVec 64) (_ BitVec 32) List!12547) Unit!22302)

(assert (=> b!652296 (= lt!303500 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303502 (select (arr!18506 a!2986) j!136) j!136 Nil!12544))))

(assert (=> b!652296 false))

(declare-fun b!652297 () Bool)

(declare-fun e!374382 () Bool)

(declare-fun e!374377 () Bool)

(assert (=> b!652297 (= e!374382 e!374377)))

(declare-fun res!422992 () Bool)

(assert (=> b!652297 (=> res!422992 e!374377)))

(declare-fun lt!303508 () (_ BitVec 64))

(declare-fun lt!303504 () (_ BitVec 64))

(assert (=> b!652297 (= res!422992 (or (not (= (select (arr!18506 a!2986) j!136) lt!303508)) (not (= (select (arr!18506 a!2986) j!136) lt!303504)) (bvsge j!136 index!984)))))

(declare-fun b!652298 () Bool)

(declare-fun e!374391 () Bool)

(declare-datatypes ((SeekEntryResult!6946 0))(
  ( (MissingZero!6946 (index!30137 (_ BitVec 32))) (Found!6946 (index!30138 (_ BitVec 32))) (Intermediate!6946 (undefined!7758 Bool) (index!30139 (_ BitVec 32)) (x!58921 (_ BitVec 32))) (Undefined!6946) (MissingVacant!6946 (index!30140 (_ BitVec 32))) )
))
(declare-fun lt!303497 () SeekEntryResult!6946)

(declare-fun lt!303495 () SeekEntryResult!6946)

(assert (=> b!652298 (= e!374391 (= lt!303497 lt!303495))))

(declare-fun b!652299 () Bool)

(declare-fun res!423008 () Bool)

(declare-fun e!374386 () Bool)

(assert (=> b!652299 (=> (not res!423008) (not e!374386))))

(assert (=> b!652299 (= res!423008 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12544))))

(declare-fun b!652300 () Bool)

(declare-fun res!423006 () Bool)

(assert (=> b!652300 (=> (not res!423006) (not e!374378))))

(assert (=> b!652300 (= res!423006 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652301 () Bool)

(declare-fun res!423000 () Bool)

(assert (=> b!652301 (=> (not res!423000) (not e!374386))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38606 (_ BitVec 32)) Bool)

(assert (=> b!652301 (= res!423000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652302 () Bool)

(declare-fun Unit!22306 () Unit!22302)

(assert (=> b!652302 (= e!374385 Unit!22306)))

(assert (=> b!652302 false))

(declare-fun b!652303 () Bool)

(assert (=> b!652303 (= e!374378 e!374386)))

(declare-fun res!423001 () Bool)

(assert (=> b!652303 (=> (not res!423001) (not e!374386))))

(declare-fun lt!303501 () SeekEntryResult!6946)

(assert (=> b!652303 (= res!423001 (or (= lt!303501 (MissingZero!6946 i!1108)) (= lt!303501 (MissingVacant!6946 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38606 (_ BitVec 32)) SeekEntryResult!6946)

(assert (=> b!652303 (= lt!303501 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652304 () Bool)

(declare-fun e!374388 () Bool)

(declare-fun e!374387 () Bool)

(assert (=> b!652304 (= e!374388 (not e!374387))))

(declare-fun res!422990 () Bool)

(assert (=> b!652304 (=> res!422990 e!374387)))

(declare-fun lt!303496 () SeekEntryResult!6946)

(assert (=> b!652304 (= res!422990 (not (= lt!303496 (Found!6946 index!984))))))

(declare-fun lt!303503 () Unit!22302)

(assert (=> b!652304 (= lt!303503 e!374385)))

(declare-fun c!75020 () Bool)

(assert (=> b!652304 (= c!75020 (= lt!303496 Undefined!6946))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38606 (_ BitVec 32)) SeekEntryResult!6946)

(assert (=> b!652304 (= lt!303496 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303508 lt!303502 mask!3053))))

(assert (=> b!652304 e!374391))

(declare-fun res!422993 () Bool)

(assert (=> b!652304 (=> (not res!422993) (not e!374391))))

(declare-fun lt!303505 () (_ BitVec 32))

(assert (=> b!652304 (= res!422993 (= lt!303495 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303505 vacantSpotIndex!68 lt!303508 lt!303502 mask!3053)))))

(assert (=> b!652304 (= lt!303495 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303505 vacantSpotIndex!68 (select (arr!18506 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652304 (= lt!303508 (select (store (arr!18506 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303498 () Unit!22302)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38606 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22302)

(assert (=> b!652304 (= lt!303498 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303505 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652304 (= lt!303505 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!374381 () Bool)

(declare-fun b!652305 () Bool)

(assert (=> b!652305 (= e!374381 (arrayContainsKey!0 lt!303502 (select (arr!18506 a!2986) j!136) index!984))))

(declare-fun b!652306 () Bool)

(declare-fun e!374390 () Bool)

(assert (=> b!652306 (= e!374386 e!374390)))

(declare-fun res!423003 () Bool)

(assert (=> b!652306 (=> (not res!423003) (not e!374390))))

(assert (=> b!652306 (= res!423003 (= (select (store (arr!18506 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652306 (= lt!303502 (array!38607 (store (arr!18506 a!2986) i!1108 k!1786) (size!18870 a!2986)))))

(declare-fun b!652307 () Bool)

(declare-fun e!374384 () Bool)

(declare-fun e!374380 () Bool)

(assert (=> b!652307 (= e!374384 e!374380)))

(declare-fun res!422998 () Bool)

(assert (=> b!652307 (=> res!422998 e!374380)))

(assert (=> b!652307 (= res!422998 (bvsge index!984 j!136))))

(declare-fun lt!303506 () Unit!22302)

(assert (=> b!652307 (= lt!303506 e!374383)))

(declare-fun c!75019 () Bool)

(assert (=> b!652307 (= c!75019 (bvslt j!136 index!984))))

(declare-fun b!652308 () Bool)

(declare-fun res!423007 () Bool)

(assert (=> b!652308 (=> (not res!423007) (not e!374378))))

(assert (=> b!652308 (= res!423007 (validKeyInArray!0 (select (arr!18506 a!2986) j!136)))))

(declare-fun b!652309 () Bool)

(declare-fun e!374389 () Bool)

(assert (=> b!652309 (= e!374389 (arrayContainsKey!0 lt!303502 (select (arr!18506 a!2986) j!136) index!984))))

(declare-fun b!652310 () Bool)

(declare-fun Unit!22307 () Unit!22302)

(assert (=> b!652310 (= e!374383 Unit!22307)))

(declare-fun b!652311 () Bool)

(assert (=> b!652311 (= e!374377 e!374381)))

(declare-fun res!422996 () Bool)

(assert (=> b!652311 (=> (not res!422996) (not e!374381))))

(assert (=> b!652311 (= res!422996 (arrayContainsKey!0 lt!303502 (select (arr!18506 a!2986) j!136) j!136))))

(declare-fun b!652312 () Bool)

(assert (=> b!652312 (= e!374387 e!374384)))

(declare-fun res!422994 () Bool)

(assert (=> b!652312 (=> res!422994 e!374384)))

(assert (=> b!652312 (= res!422994 (or (not (= (select (arr!18506 a!2986) j!136) lt!303508)) (not (= (select (arr!18506 a!2986) j!136) lt!303504))))))

(assert (=> b!652312 e!374382))

(declare-fun res!423002 () Bool)

(assert (=> b!652312 (=> (not res!423002) (not e!374382))))

(assert (=> b!652312 (= res!423002 (= lt!303504 (select (arr!18506 a!2986) j!136)))))

(assert (=> b!652312 (= lt!303504 (select (store (arr!18506 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!652313 () Bool)

(assert (=> b!652313 (= e!374390 e!374388)))

(declare-fun res!423004 () Bool)

(assert (=> b!652313 (=> (not res!423004) (not e!374388))))

(assert (=> b!652313 (= res!423004 (and (= lt!303497 (Found!6946 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18506 a!2986) index!984) (select (arr!18506 a!2986) j!136))) (not (= (select (arr!18506 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652313 (= lt!303497 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18506 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652314 () Bool)

(declare-fun res!422995 () Bool)

(assert (=> b!652314 (=> (not res!422995) (not e!374378))))

(assert (=> b!652314 (= res!422995 (and (= (size!18870 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18870 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18870 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652315 () Bool)

(assert (=> b!652315 (= e!374380 (or (bvsge (size!18870 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18870 a!2986))))))

(assert (=> b!652315 (arrayNoDuplicates!0 lt!303502 index!984 Nil!12544)))

(declare-fun lt!303510 () Unit!22302)

(assert (=> b!652315 (= lt!303510 (lemmaNoDuplicateFromThenFromBigger!0 lt!303502 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652315 (arrayNoDuplicates!0 lt!303502 #b00000000000000000000000000000000 Nil!12544)))

(declare-fun lt!303507 () Unit!22302)

(assert (=> b!652315 (= lt!303507 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12544))))

(assert (=> b!652315 (arrayContainsKey!0 lt!303502 (select (arr!18506 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303509 () Unit!22302)

(assert (=> b!652315 (= lt!303509 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303502 (select (arr!18506 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652315 e!374389))

(declare-fun res!422997 () Bool)

(assert (=> b!652315 (=> (not res!422997) (not e!374389))))

(assert (=> b!652315 (= res!422997 (arrayContainsKey!0 lt!303502 (select (arr!18506 a!2986) j!136) j!136))))

(declare-fun b!652316 () Bool)

(declare-fun res!422999 () Bool)

(assert (=> b!652316 (=> (not res!422999) (not e!374386))))

(assert (=> b!652316 (= res!422999 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18506 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!423005 () Bool)

(assert (=> start!59106 (=> (not res!423005) (not e!374378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59106 (= res!423005 (validMask!0 mask!3053))))

(assert (=> start!59106 e!374378))

(assert (=> start!59106 true))

(declare-fun array_inv!14302 (array!38606) Bool)

(assert (=> start!59106 (array_inv!14302 a!2986)))

(assert (= (and start!59106 res!423005) b!652314))

(assert (= (and b!652314 res!422995) b!652308))

(assert (= (and b!652308 res!423007) b!652295))

(assert (= (and b!652295 res!422991) b!652300))

(assert (= (and b!652300 res!423006) b!652303))

(assert (= (and b!652303 res!423001) b!652301))

(assert (= (and b!652301 res!423000) b!652299))

(assert (= (and b!652299 res!423008) b!652316))

(assert (= (and b!652316 res!422999) b!652306))

(assert (= (and b!652306 res!423003) b!652313))

(assert (= (and b!652313 res!423004) b!652304))

(assert (= (and b!652304 res!422993) b!652298))

(assert (= (and b!652304 c!75020) b!652302))

(assert (= (and b!652304 (not c!75020)) b!652294))

(assert (= (and b!652304 (not res!422990)) b!652312))

(assert (= (and b!652312 res!423002) b!652297))

(assert (= (and b!652297 (not res!422992)) b!652311))

(assert (= (and b!652311 res!422996) b!652305))

(assert (= (and b!652312 (not res!422994)) b!652307))

(assert (= (and b!652307 c!75019) b!652296))

(assert (= (and b!652307 (not c!75019)) b!652310))

(assert (= (and b!652307 (not res!422998)) b!652315))

(assert (= (and b!652315 res!422997) b!652309))

(declare-fun m!625437 () Bool)

(assert (=> b!652312 m!625437))

(declare-fun m!625439 () Bool)

(assert (=> b!652312 m!625439))

(declare-fun m!625441 () Bool)

(assert (=> b!652312 m!625441))

(declare-fun m!625443 () Bool)

(assert (=> b!652315 m!625443))

(assert (=> b!652315 m!625437))

(assert (=> b!652315 m!625437))

(declare-fun m!625445 () Bool)

(assert (=> b!652315 m!625445))

(assert (=> b!652315 m!625437))

(declare-fun m!625447 () Bool)

(assert (=> b!652315 m!625447))

(declare-fun m!625449 () Bool)

(assert (=> b!652315 m!625449))

(declare-fun m!625451 () Bool)

(assert (=> b!652315 m!625451))

(assert (=> b!652315 m!625437))

(declare-fun m!625453 () Bool)

(assert (=> b!652315 m!625453))

(declare-fun m!625455 () Bool)

(assert (=> b!652315 m!625455))

(assert (=> b!652311 m!625437))

(assert (=> b!652311 m!625437))

(assert (=> b!652311 m!625447))

(declare-fun m!625457 () Bool)

(assert (=> b!652300 m!625457))

(declare-fun m!625459 () Bool)

(assert (=> start!59106 m!625459))

(declare-fun m!625461 () Bool)

(assert (=> start!59106 m!625461))

(declare-fun m!625463 () Bool)

(assert (=> b!652295 m!625463))

(declare-fun m!625465 () Bool)

(assert (=> b!652303 m!625465))

(assert (=> b!652305 m!625437))

(assert (=> b!652305 m!625437))

(declare-fun m!625467 () Bool)

(assert (=> b!652305 m!625467))

(assert (=> b!652296 m!625437))

(declare-fun m!625469 () Bool)

(assert (=> b!652296 m!625469))

(declare-fun m!625471 () Bool)

(assert (=> b!652296 m!625471))

(assert (=> b!652296 m!625437))

(declare-fun m!625473 () Bool)

(assert (=> b!652296 m!625473))

(assert (=> b!652296 m!625449))

(assert (=> b!652296 m!625437))

(declare-fun m!625475 () Bool)

(assert (=> b!652296 m!625475))

(assert (=> b!652296 m!625437))

(declare-fun m!625477 () Bool)

(assert (=> b!652296 m!625477))

(assert (=> b!652296 m!625455))

(assert (=> b!652309 m!625437))

(assert (=> b!652309 m!625437))

(assert (=> b!652309 m!625467))

(assert (=> b!652308 m!625437))

(assert (=> b!652308 m!625437))

(declare-fun m!625479 () Bool)

(assert (=> b!652308 m!625479))

(assert (=> b!652306 m!625439))

(declare-fun m!625481 () Bool)

(assert (=> b!652306 m!625481))

(declare-fun m!625483 () Bool)

(assert (=> b!652313 m!625483))

(assert (=> b!652313 m!625437))

(assert (=> b!652313 m!625437))

(declare-fun m!625485 () Bool)

(assert (=> b!652313 m!625485))

(declare-fun m!625487 () Bool)

(assert (=> b!652316 m!625487))

(assert (=> b!652297 m!625437))

(declare-fun m!625489 () Bool)

(assert (=> b!652299 m!625489))

(declare-fun m!625491 () Bool)

(assert (=> b!652301 m!625491))

(declare-fun m!625493 () Bool)

(assert (=> b!652304 m!625493))

(declare-fun m!625495 () Bool)

(assert (=> b!652304 m!625495))

(assert (=> b!652304 m!625437))

(assert (=> b!652304 m!625439))

(declare-fun m!625497 () Bool)

(assert (=> b!652304 m!625497))

(assert (=> b!652304 m!625437))

(declare-fun m!625499 () Bool)

(assert (=> b!652304 m!625499))

(declare-fun m!625501 () Bool)

(assert (=> b!652304 m!625501))

(declare-fun m!625503 () Bool)

(assert (=> b!652304 m!625503))

(push 1)

(assert (not b!652300))

(assert (not b!652301))

(assert (not b!652313))

(assert (not b!652296))

(assert (not b!652309))

(assert (not b!652308))

(assert (not b!652305))

(assert (not b!652311))

(assert (not b!652315))

(assert (not b!652303))

(assert (not b!652299))

(assert (not b!652304))

(assert (not start!59106))

(assert (not b!652295))

(check-sat)

(pop 1)

(push 1)

(check-sat)

