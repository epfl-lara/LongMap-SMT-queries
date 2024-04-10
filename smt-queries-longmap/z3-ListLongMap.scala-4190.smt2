; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57118 () Bool)

(assert start!57118)

(declare-fun b!632487 () Bool)

(declare-fun res!409086 () Bool)

(declare-fun e!361598 () Bool)

(assert (=> b!632487 (=> (not res!409086) (not e!361598))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38137 0))(
  ( (array!38138 (arr!18301 (Array (_ BitVec 32) (_ BitVec 64))) (size!18665 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38137)

(assert (=> b!632487 (= res!409086 (and (= (size!18665 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18665 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18665 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632488 () Bool)

(declare-fun res!409080 () Bool)

(assert (=> b!632488 (=> (not res!409080) (not e!361598))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632488 (= res!409080 (validKeyInArray!0 (select (arr!18301 a!2986) j!136)))))

(declare-fun b!632489 () Bool)

(declare-datatypes ((Unit!21298 0))(
  ( (Unit!21299) )
))
(declare-fun e!361601 () Unit!21298)

(declare-fun Unit!21300 () Unit!21298)

(assert (=> b!632489 (= e!361601 Unit!21300)))

(assert (=> b!632489 false))

(declare-fun b!632490 () Bool)

(declare-fun e!361599 () Bool)

(declare-fun e!361595 () Bool)

(assert (=> b!632490 (= e!361599 (not e!361595))))

(declare-fun res!409081 () Bool)

(assert (=> b!632490 (=> res!409081 e!361595)))

(declare-datatypes ((SeekEntryResult!6741 0))(
  ( (MissingZero!6741 (index!29257 (_ BitVec 32))) (Found!6741 (index!29258 (_ BitVec 32))) (Intermediate!6741 (undefined!7553 Bool) (index!29259 (_ BitVec 32)) (x!57992 (_ BitVec 32))) (Undefined!6741) (MissingVacant!6741 (index!29260 (_ BitVec 32))) )
))
(declare-fun lt!292320 () SeekEntryResult!6741)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632490 (= res!409081 (not (= lt!292320 (Found!6741 index!984))))))

(declare-fun lt!292324 () Unit!21298)

(assert (=> b!632490 (= lt!292324 e!361601)))

(declare-fun c!72071 () Bool)

(assert (=> b!632490 (= c!72071 (= lt!292320 Undefined!6741))))

(declare-fun lt!292321 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292322 () array!38137)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38137 (_ BitVec 32)) SeekEntryResult!6741)

(assert (=> b!632490 (= lt!292320 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292321 lt!292322 mask!3053))))

(declare-fun e!361600 () Bool)

(assert (=> b!632490 e!361600))

(declare-fun res!409088 () Bool)

(assert (=> b!632490 (=> (not res!409088) (not e!361600))))

(declare-fun lt!292325 () (_ BitVec 32))

(declare-fun lt!292327 () SeekEntryResult!6741)

(assert (=> b!632490 (= res!409088 (= lt!292327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292325 vacantSpotIndex!68 lt!292321 lt!292322 mask!3053)))))

(assert (=> b!632490 (= lt!292327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292325 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!632490 (= lt!292321 (select (store (arr!18301 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292319 () Unit!21298)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21298)

(assert (=> b!632490 (= lt!292319 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292325 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632490 (= lt!292325 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!409083 () Bool)

(assert (=> start!57118 (=> (not res!409083) (not e!361598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57118 (= res!409083 (validMask!0 mask!3053))))

(assert (=> start!57118 e!361598))

(assert (=> start!57118 true))

(declare-fun array_inv!14097 (array!38137) Bool)

(assert (=> start!57118 (array_inv!14097 a!2986)))

(declare-fun b!632491 () Bool)

(declare-fun res!409087 () Bool)

(declare-fun e!361602 () Bool)

(assert (=> b!632491 (=> (not res!409087) (not e!361602))))

(assert (=> b!632491 (= res!409087 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18301 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632492 () Bool)

(assert (=> b!632492 (= e!361598 e!361602)))

(declare-fun res!409084 () Bool)

(assert (=> b!632492 (=> (not res!409084) (not e!361602))))

(declare-fun lt!292323 () SeekEntryResult!6741)

(assert (=> b!632492 (= res!409084 (or (= lt!292323 (MissingZero!6741 i!1108)) (= lt!292323 (MissingVacant!6741 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38137 (_ BitVec 32)) SeekEntryResult!6741)

(assert (=> b!632492 (= lt!292323 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632493 () Bool)

(declare-fun e!361596 () Bool)

(assert (=> b!632493 (= e!361596 e!361599)))

(declare-fun res!409079 () Bool)

(assert (=> b!632493 (=> (not res!409079) (not e!361599))))

(declare-fun lt!292326 () SeekEntryResult!6741)

(assert (=> b!632493 (= res!409079 (and (= lt!292326 (Found!6741 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18301 a!2986) index!984) (select (arr!18301 a!2986) j!136))) (not (= (select (arr!18301 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!632493 (= lt!292326 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18301 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632494 () Bool)

(declare-fun res!409089 () Bool)

(assert (=> b!632494 (=> (not res!409089) (not e!361602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38137 (_ BitVec 32)) Bool)

(assert (=> b!632494 (= res!409089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632495 () Bool)

(assert (=> b!632495 (= e!361600 (= lt!292326 lt!292327))))

(declare-fun b!632496 () Bool)

(declare-fun Unit!21301 () Unit!21298)

(assert (=> b!632496 (= e!361601 Unit!21301)))

(declare-fun b!632497 () Bool)

(declare-fun res!409082 () Bool)

(assert (=> b!632497 (=> (not res!409082) (not e!361598))))

(declare-fun arrayContainsKey!0 (array!38137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632497 (= res!409082 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632498 () Bool)

(declare-fun res!409085 () Bool)

(assert (=> b!632498 (=> (not res!409085) (not e!361602))))

(declare-datatypes ((List!12342 0))(
  ( (Nil!12339) (Cons!12338 (h!13383 (_ BitVec 64)) (t!18570 List!12342)) )
))
(declare-fun arrayNoDuplicates!0 (array!38137 (_ BitVec 32) List!12342) Bool)

(assert (=> b!632498 (= res!409085 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12339))))

(declare-fun b!632499 () Bool)

(declare-fun res!409090 () Bool)

(assert (=> b!632499 (=> (not res!409090) (not e!361598))))

(assert (=> b!632499 (= res!409090 (validKeyInArray!0 k0!1786))))

(declare-fun b!632500 () Bool)

(assert (=> b!632500 (= e!361595 (or (not (= (select (arr!18301 a!2986) j!136) lt!292321)) (bvslt index!984 (size!18665 a!2986))))))

(assert (=> b!632500 (= (select (store (arr!18301 a!2986) i!1108 k0!1786) index!984) (select (arr!18301 a!2986) j!136))))

(declare-fun b!632501 () Bool)

(assert (=> b!632501 (= e!361602 e!361596)))

(declare-fun res!409091 () Bool)

(assert (=> b!632501 (=> (not res!409091) (not e!361596))))

(assert (=> b!632501 (= res!409091 (= (select (store (arr!18301 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632501 (= lt!292322 (array!38138 (store (arr!18301 a!2986) i!1108 k0!1786) (size!18665 a!2986)))))

(assert (= (and start!57118 res!409083) b!632487))

(assert (= (and b!632487 res!409086) b!632488))

(assert (= (and b!632488 res!409080) b!632499))

(assert (= (and b!632499 res!409090) b!632497))

(assert (= (and b!632497 res!409082) b!632492))

(assert (= (and b!632492 res!409084) b!632494))

(assert (= (and b!632494 res!409089) b!632498))

(assert (= (and b!632498 res!409085) b!632491))

(assert (= (and b!632491 res!409087) b!632501))

(assert (= (and b!632501 res!409091) b!632493))

(assert (= (and b!632493 res!409079) b!632490))

(assert (= (and b!632490 res!409088) b!632495))

(assert (= (and b!632490 c!72071) b!632489))

(assert (= (and b!632490 (not c!72071)) b!632496))

(assert (= (and b!632490 (not res!409081)) b!632500))

(declare-fun m!607311 () Bool)

(assert (=> b!632490 m!607311))

(declare-fun m!607313 () Bool)

(assert (=> b!632490 m!607313))

(declare-fun m!607315 () Bool)

(assert (=> b!632490 m!607315))

(declare-fun m!607317 () Bool)

(assert (=> b!632490 m!607317))

(assert (=> b!632490 m!607311))

(declare-fun m!607319 () Bool)

(assert (=> b!632490 m!607319))

(declare-fun m!607321 () Bool)

(assert (=> b!632490 m!607321))

(declare-fun m!607323 () Bool)

(assert (=> b!632490 m!607323))

(declare-fun m!607325 () Bool)

(assert (=> b!632490 m!607325))

(assert (=> b!632500 m!607311))

(assert (=> b!632500 m!607319))

(declare-fun m!607327 () Bool)

(assert (=> b!632500 m!607327))

(declare-fun m!607329 () Bool)

(assert (=> b!632494 m!607329))

(declare-fun m!607331 () Bool)

(assert (=> b!632499 m!607331))

(declare-fun m!607333 () Bool)

(assert (=> b!632492 m!607333))

(declare-fun m!607335 () Bool)

(assert (=> b!632491 m!607335))

(declare-fun m!607337 () Bool)

(assert (=> b!632498 m!607337))

(declare-fun m!607339 () Bool)

(assert (=> start!57118 m!607339))

(declare-fun m!607341 () Bool)

(assert (=> start!57118 m!607341))

(declare-fun m!607343 () Bool)

(assert (=> b!632493 m!607343))

(assert (=> b!632493 m!607311))

(assert (=> b!632493 m!607311))

(declare-fun m!607345 () Bool)

(assert (=> b!632493 m!607345))

(assert (=> b!632501 m!607319))

(declare-fun m!607347 () Bool)

(assert (=> b!632501 m!607347))

(assert (=> b!632488 m!607311))

(assert (=> b!632488 m!607311))

(declare-fun m!607349 () Bool)

(assert (=> b!632488 m!607349))

(declare-fun m!607351 () Bool)

(assert (=> b!632497 m!607351))

(check-sat (not b!632494) (not b!632498) (not b!632497) (not b!632499) (not start!57118) (not b!632493) (not b!632492) (not b!632490) (not b!632488))
(check-sat)
