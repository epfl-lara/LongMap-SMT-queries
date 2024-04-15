; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53964 () Bool)

(assert start!53964)

(declare-fun b!589367 () Bool)

(declare-fun res!376997 () Bool)

(declare-fun e!336450 () Bool)

(assert (=> b!589367 (=> (not res!376997) (not e!336450))))

(declare-datatypes ((array!36822 0))(
  ( (array!36823 (arr!17684 (Array (_ BitVec 32) (_ BitVec 64))) (size!18049 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36822)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36822 (_ BitVec 32)) Bool)

(assert (=> b!589367 (= res!376997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!377000 () Bool)

(declare-fun e!336449 () Bool)

(assert (=> start!53964 (=> (not res!377000) (not e!336449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53964 (= res!377000 (validMask!0 mask!3053))))

(assert (=> start!53964 e!336449))

(assert (=> start!53964 true))

(declare-fun array_inv!13567 (array!36822) Bool)

(assert (=> start!53964 (array_inv!13567 a!2986)))

(declare-fun b!589368 () Bool)

(declare-fun e!336452 () Bool)

(declare-datatypes ((SeekEntryResult!6121 0))(
  ( (MissingZero!6121 (index!26714 (_ BitVec 32))) (Found!6121 (index!26715 (_ BitVec 32))) (Intermediate!6121 (undefined!6933 Bool) (index!26716 (_ BitVec 32)) (x!55514 (_ BitVec 32))) (Undefined!6121) (MissingVacant!6121 (index!26717 (_ BitVec 32))) )
))
(declare-fun lt!267222 () SeekEntryResult!6121)

(declare-fun lt!267216 () SeekEntryResult!6121)

(assert (=> b!589368 (= e!336452 (= lt!267222 lt!267216))))

(declare-fun b!589369 () Bool)

(declare-fun e!336455 () Bool)

(declare-fun e!336451 () Bool)

(assert (=> b!589369 (= e!336455 e!336451)))

(declare-fun res!377003 () Bool)

(assert (=> b!589369 (=> (not res!377003) (not e!336451))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!589369 (= res!377003 (and (= lt!267222 (Found!6121 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17684 a!2986) index!984) (select (arr!17684 a!2986) j!136))) (not (= (select (arr!17684 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36822 (_ BitVec 32)) SeekEntryResult!6121)

(assert (=> b!589369 (= lt!267222 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17684 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!589370 () Bool)

(declare-fun res!376999 () Bool)

(assert (=> b!589370 (=> (not res!376999) (not e!336449))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589370 (= res!376999 (validKeyInArray!0 k0!1786))))

(declare-fun b!589371 () Bool)

(declare-fun res!377004 () Bool)

(assert (=> b!589371 (=> (not res!377004) (not e!336449))))

(declare-fun arrayContainsKey!0 (array!36822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589371 (= res!377004 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589372 () Bool)

(declare-fun e!336454 () Bool)

(assert (=> b!589372 (= e!336454 true)))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!589372 (= (select (store (arr!17684 a!2986) i!1108 k0!1786) index!984) (select (arr!17684 a!2986) j!136))))

(declare-fun b!589373 () Bool)

(assert (=> b!589373 (= e!336450 e!336455)))

(declare-fun res!377006 () Bool)

(assert (=> b!589373 (=> (not res!377006) (not e!336455))))

(assert (=> b!589373 (= res!377006 (= (select (store (arr!17684 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!267218 () array!36822)

(assert (=> b!589373 (= lt!267218 (array!36823 (store (arr!17684 a!2986) i!1108 k0!1786) (size!18049 a!2986)))))

(declare-fun b!589374 () Bool)

(assert (=> b!589374 (= e!336451 (not e!336454))))

(declare-fun res!377002 () Bool)

(assert (=> b!589374 (=> res!377002 e!336454)))

(declare-fun lt!267223 () SeekEntryResult!6121)

(assert (=> b!589374 (= res!377002 (not (= lt!267223 (Found!6121 index!984))))))

(declare-datatypes ((Unit!18396 0))(
  ( (Unit!18397) )
))
(declare-fun lt!267215 () Unit!18396)

(declare-fun e!336453 () Unit!18396)

(assert (=> b!589374 (= lt!267215 e!336453)))

(declare-fun c!66552 () Bool)

(assert (=> b!589374 (= c!66552 (= lt!267223 Undefined!6121))))

(declare-fun lt!267219 () (_ BitVec 64))

(assert (=> b!589374 (= lt!267223 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267219 lt!267218 mask!3053))))

(assert (=> b!589374 e!336452))

(declare-fun res!376998 () Bool)

(assert (=> b!589374 (=> (not res!376998) (not e!336452))))

(declare-fun lt!267217 () (_ BitVec 32))

(assert (=> b!589374 (= res!376998 (= lt!267216 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267217 vacantSpotIndex!68 lt!267219 lt!267218 mask!3053)))))

(assert (=> b!589374 (= lt!267216 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267217 vacantSpotIndex!68 (select (arr!17684 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!589374 (= lt!267219 (select (store (arr!17684 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267221 () Unit!18396)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36822 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18396)

(assert (=> b!589374 (= lt!267221 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267217 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589374 (= lt!267217 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589375 () Bool)

(declare-fun Unit!18398 () Unit!18396)

(assert (=> b!589375 (= e!336453 Unit!18398)))

(assert (=> b!589375 false))

(declare-fun b!589376 () Bool)

(declare-fun res!377005 () Bool)

(assert (=> b!589376 (=> (not res!377005) (not e!336449))))

(assert (=> b!589376 (= res!377005 (and (= (size!18049 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18049 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18049 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589377 () Bool)

(declare-fun res!377009 () Bool)

(assert (=> b!589377 (=> (not res!377009) (not e!336450))))

(assert (=> b!589377 (= res!377009 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17684 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589378 () Bool)

(assert (=> b!589378 (= e!336449 e!336450)))

(declare-fun res!377008 () Bool)

(assert (=> b!589378 (=> (not res!377008) (not e!336450))))

(declare-fun lt!267220 () SeekEntryResult!6121)

(assert (=> b!589378 (= res!377008 (or (= lt!267220 (MissingZero!6121 i!1108)) (= lt!267220 (MissingVacant!6121 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36822 (_ BitVec 32)) SeekEntryResult!6121)

(assert (=> b!589378 (= lt!267220 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!589379 () Bool)

(declare-fun Unit!18399 () Unit!18396)

(assert (=> b!589379 (= e!336453 Unit!18399)))

(declare-fun b!589380 () Bool)

(declare-fun res!377001 () Bool)

(assert (=> b!589380 (=> (not res!377001) (not e!336450))))

(declare-datatypes ((List!11764 0))(
  ( (Nil!11761) (Cons!11760 (h!12805 (_ BitVec 64)) (t!17983 List!11764)) )
))
(declare-fun arrayNoDuplicates!0 (array!36822 (_ BitVec 32) List!11764) Bool)

(assert (=> b!589380 (= res!377001 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11761))))

(declare-fun b!589381 () Bool)

(declare-fun res!377007 () Bool)

(assert (=> b!589381 (=> (not res!377007) (not e!336449))))

(assert (=> b!589381 (= res!377007 (validKeyInArray!0 (select (arr!17684 a!2986) j!136)))))

(assert (= (and start!53964 res!377000) b!589376))

(assert (= (and b!589376 res!377005) b!589381))

(assert (= (and b!589381 res!377007) b!589370))

(assert (= (and b!589370 res!376999) b!589371))

(assert (= (and b!589371 res!377004) b!589378))

(assert (= (and b!589378 res!377008) b!589367))

(assert (= (and b!589367 res!376997) b!589380))

(assert (= (and b!589380 res!377001) b!589377))

(assert (= (and b!589377 res!377009) b!589373))

(assert (= (and b!589373 res!377006) b!589369))

(assert (= (and b!589369 res!377003) b!589374))

(assert (= (and b!589374 res!376998) b!589368))

(assert (= (and b!589374 c!66552) b!589375))

(assert (= (and b!589374 (not c!66552)) b!589379))

(assert (= (and b!589374 (not res!377002)) b!589372))

(declare-fun m!567367 () Bool)

(assert (=> b!589369 m!567367))

(declare-fun m!567369 () Bool)

(assert (=> b!589369 m!567369))

(assert (=> b!589369 m!567369))

(declare-fun m!567371 () Bool)

(assert (=> b!589369 m!567371))

(declare-fun m!567373 () Bool)

(assert (=> b!589367 m!567373))

(declare-fun m!567375 () Bool)

(assert (=> b!589378 m!567375))

(declare-fun m!567377 () Bool)

(assert (=> b!589377 m!567377))

(declare-fun m!567379 () Bool)

(assert (=> b!589374 m!567379))

(assert (=> b!589374 m!567369))

(declare-fun m!567381 () Bool)

(assert (=> b!589374 m!567381))

(declare-fun m!567383 () Bool)

(assert (=> b!589374 m!567383))

(assert (=> b!589374 m!567369))

(declare-fun m!567385 () Bool)

(assert (=> b!589374 m!567385))

(declare-fun m!567387 () Bool)

(assert (=> b!589374 m!567387))

(declare-fun m!567389 () Bool)

(assert (=> b!589374 m!567389))

(declare-fun m!567391 () Bool)

(assert (=> b!589374 m!567391))

(assert (=> b!589372 m!567381))

(declare-fun m!567393 () Bool)

(assert (=> b!589372 m!567393))

(assert (=> b!589372 m!567369))

(assert (=> b!589381 m!567369))

(assert (=> b!589381 m!567369))

(declare-fun m!567395 () Bool)

(assert (=> b!589381 m!567395))

(declare-fun m!567397 () Bool)

(assert (=> b!589380 m!567397))

(declare-fun m!567399 () Bool)

(assert (=> b!589371 m!567399))

(assert (=> b!589373 m!567381))

(declare-fun m!567401 () Bool)

(assert (=> b!589373 m!567401))

(declare-fun m!567403 () Bool)

(assert (=> b!589370 m!567403))

(declare-fun m!567405 () Bool)

(assert (=> start!53964 m!567405))

(declare-fun m!567407 () Bool)

(assert (=> start!53964 m!567407))

(check-sat (not b!589378) (not b!589367) (not b!589369) (not b!589380) (not b!589371) (not b!589381) (not start!53964) (not b!589370) (not b!589374))
(check-sat)
