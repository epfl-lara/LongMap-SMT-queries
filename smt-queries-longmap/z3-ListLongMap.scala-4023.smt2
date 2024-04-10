; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54846 () Bool)

(assert start!54846)

(declare-fun b!599207 () Bool)

(declare-datatypes ((Unit!18878 0))(
  ( (Unit!18879) )
))
(declare-fun e!342569 () Unit!18878)

(declare-fun Unit!18880 () Unit!18878)

(assert (=> b!599207 (= e!342569 Unit!18880)))

(declare-fun b!599208 () Bool)

(declare-fun e!342565 () Bool)

(declare-fun e!342564 () Bool)

(assert (=> b!599208 (= e!342565 e!342564)))

(declare-fun res!384213 () Bool)

(assert (=> b!599208 (=> res!384213 e!342564)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272350 () (_ BitVec 64))

(declare-fun lt!272358 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37081 0))(
  ( (array!37082 (arr!17800 (Array (_ BitVec 32) (_ BitVec 64))) (size!18164 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37081)

(assert (=> b!599208 (= res!384213 (or (not (= (select (arr!17800 a!2986) j!136) lt!272358)) (not (= (select (arr!17800 a!2986) j!136) lt!272350)) (bvsge j!136 index!984)))))

(declare-fun b!599209 () Bool)

(declare-fun e!342568 () Bool)

(declare-datatypes ((SeekEntryResult!6240 0))(
  ( (MissingZero!6240 (index!27217 (_ BitVec 32))) (Found!6240 (index!27218 (_ BitVec 32))) (Intermediate!6240 (undefined!7052 Bool) (index!27219 (_ BitVec 32)) (x!56023 (_ BitVec 32))) (Undefined!6240) (MissingVacant!6240 (index!27220 (_ BitVec 32))) )
))
(declare-fun lt!272354 () SeekEntryResult!6240)

(declare-fun lt!272348 () SeekEntryResult!6240)

(assert (=> b!599209 (= e!342568 (= lt!272354 lt!272348))))

(declare-fun b!599210 () Bool)

(declare-fun res!384218 () Bool)

(declare-fun e!342566 () Bool)

(assert (=> b!599210 (=> (not res!384218) (not e!342566))))

(declare-datatypes ((List!11841 0))(
  ( (Nil!11838) (Cons!11837 (h!12882 (_ BitVec 64)) (t!18069 List!11841)) )
))
(declare-fun arrayNoDuplicates!0 (array!37081 (_ BitVec 32) List!11841) Bool)

(assert (=> b!599210 (= res!384218 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11838))))

(declare-fun b!599211 () Bool)

(declare-fun e!342563 () Bool)

(declare-fun e!342562 () Bool)

(assert (=> b!599211 (= e!342563 (not e!342562))))

(declare-fun res!384211 () Bool)

(assert (=> b!599211 (=> res!384211 e!342562)))

(declare-fun lt!272352 () SeekEntryResult!6240)

(assert (=> b!599211 (= res!384211 (not (= lt!272352 (Found!6240 index!984))))))

(declare-fun lt!272349 () Unit!18878)

(assert (=> b!599211 (= lt!272349 e!342569)))

(declare-fun c!67868 () Bool)

(assert (=> b!599211 (= c!67868 (= lt!272352 Undefined!6240))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!272355 () array!37081)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37081 (_ BitVec 32)) SeekEntryResult!6240)

(assert (=> b!599211 (= lt!272352 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272358 lt!272355 mask!3053))))

(assert (=> b!599211 e!342568))

(declare-fun res!384212 () Bool)

(assert (=> b!599211 (=> (not res!384212) (not e!342568))))

(declare-fun lt!272357 () (_ BitVec 32))

(assert (=> b!599211 (= res!384212 (= lt!272348 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272357 vacantSpotIndex!68 lt!272358 lt!272355 mask!3053)))))

(assert (=> b!599211 (= lt!272348 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272357 vacantSpotIndex!68 (select (arr!17800 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599211 (= lt!272358 (select (store (arr!17800 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272359 () Unit!18878)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37081 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18878)

(assert (=> b!599211 (= lt!272359 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272357 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599211 (= lt!272357 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599212 () Bool)

(declare-fun e!342571 () Bool)

(assert (=> b!599212 (= e!342571 e!342563)))

(declare-fun res!384208 () Bool)

(assert (=> b!599212 (=> (not res!384208) (not e!342563))))

(assert (=> b!599212 (= res!384208 (and (= lt!272354 (Found!6240 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17800 a!2986) index!984) (select (arr!17800 a!2986) j!136))) (not (= (select (arr!17800 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599212 (= lt!272354 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17800 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599213 () Bool)

(declare-fun res!384214 () Bool)

(declare-fun e!342567 () Bool)

(assert (=> b!599213 (=> (not res!384214) (not e!342567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599213 (= res!384214 (validKeyInArray!0 (select (arr!17800 a!2986) j!136)))))

(declare-fun b!599214 () Bool)

(declare-fun res!384221 () Bool)

(assert (=> b!599214 (=> (not res!384221) (not e!342567))))

(assert (=> b!599214 (= res!384221 (and (= (size!18164 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18164 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18164 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599215 () Bool)

(declare-fun e!342572 () Bool)

(assert (=> b!599215 (= e!342562 e!342572)))

(declare-fun res!384216 () Bool)

(assert (=> b!599215 (=> res!384216 e!342572)))

(assert (=> b!599215 (= res!384216 (or (not (= (select (arr!17800 a!2986) j!136) lt!272358)) (not (= (select (arr!17800 a!2986) j!136) lt!272350)) (bvsge j!136 index!984)))))

(assert (=> b!599215 e!342565))

(declare-fun res!384220 () Bool)

(assert (=> b!599215 (=> (not res!384220) (not e!342565))))

(assert (=> b!599215 (= res!384220 (= lt!272350 (select (arr!17800 a!2986) j!136)))))

(assert (=> b!599215 (= lt!272350 (select (store (arr!17800 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599216 () Bool)

(declare-fun res!384215 () Bool)

(assert (=> b!599216 (=> (not res!384215) (not e!342567))))

(declare-fun arrayContainsKey!0 (array!37081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599216 (= res!384215 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599218 () Bool)

(declare-fun res!384219 () Bool)

(assert (=> b!599218 (=> (not res!384219) (not e!342567))))

(assert (=> b!599218 (= res!384219 (validKeyInArray!0 k0!1786))))

(declare-fun b!599219 () Bool)

(assert (=> b!599219 (= e!342566 e!342571)))

(declare-fun res!384205 () Bool)

(assert (=> b!599219 (=> (not res!384205) (not e!342571))))

(assert (=> b!599219 (= res!384205 (= (select (store (arr!17800 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599219 (= lt!272355 (array!37082 (store (arr!17800 a!2986) i!1108 k0!1786) (size!18164 a!2986)))))

(declare-fun b!599220 () Bool)

(declare-fun res!384209 () Bool)

(assert (=> b!599220 (=> (not res!384209) (not e!342566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37081 (_ BitVec 32)) Bool)

(assert (=> b!599220 (= res!384209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599221 () Bool)

(declare-fun res!384206 () Bool)

(assert (=> b!599221 (=> (not res!384206) (not e!342566))))

(assert (=> b!599221 (= res!384206 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17800 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599222 () Bool)

(assert (=> b!599222 (= e!342572 true)))

(assert (=> b!599222 (arrayNoDuplicates!0 lt!272355 #b00000000000000000000000000000000 Nil!11838)))

(declare-fun lt!272353 () Unit!18878)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37081 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11841) Unit!18878)

(assert (=> b!599222 (= lt!272353 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11838))))

(assert (=> b!599222 (arrayContainsKey!0 lt!272355 (select (arr!17800 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272351 () Unit!18878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37081 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18878)

(assert (=> b!599222 (= lt!272351 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272355 (select (arr!17800 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599223 () Bool)

(declare-fun e!342573 () Bool)

(assert (=> b!599223 (= e!342564 e!342573)))

(declare-fun res!384207 () Bool)

(assert (=> b!599223 (=> (not res!384207) (not e!342573))))

(assert (=> b!599223 (= res!384207 (arrayContainsKey!0 lt!272355 (select (arr!17800 a!2986) j!136) j!136))))

(declare-fun b!599224 () Bool)

(assert (=> b!599224 (= e!342573 (arrayContainsKey!0 lt!272355 (select (arr!17800 a!2986) j!136) index!984))))

(declare-fun b!599225 () Bool)

(assert (=> b!599225 (= e!342567 e!342566)))

(declare-fun res!384217 () Bool)

(assert (=> b!599225 (=> (not res!384217) (not e!342566))))

(declare-fun lt!272356 () SeekEntryResult!6240)

(assert (=> b!599225 (= res!384217 (or (= lt!272356 (MissingZero!6240 i!1108)) (= lt!272356 (MissingVacant!6240 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37081 (_ BitVec 32)) SeekEntryResult!6240)

(assert (=> b!599225 (= lt!272356 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599217 () Bool)

(declare-fun Unit!18881 () Unit!18878)

(assert (=> b!599217 (= e!342569 Unit!18881)))

(assert (=> b!599217 false))

(declare-fun res!384210 () Bool)

(assert (=> start!54846 (=> (not res!384210) (not e!342567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54846 (= res!384210 (validMask!0 mask!3053))))

(assert (=> start!54846 e!342567))

(assert (=> start!54846 true))

(declare-fun array_inv!13596 (array!37081) Bool)

(assert (=> start!54846 (array_inv!13596 a!2986)))

(assert (= (and start!54846 res!384210) b!599214))

(assert (= (and b!599214 res!384221) b!599213))

(assert (= (and b!599213 res!384214) b!599218))

(assert (= (and b!599218 res!384219) b!599216))

(assert (= (and b!599216 res!384215) b!599225))

(assert (= (and b!599225 res!384217) b!599220))

(assert (= (and b!599220 res!384209) b!599210))

(assert (= (and b!599210 res!384218) b!599221))

(assert (= (and b!599221 res!384206) b!599219))

(assert (= (and b!599219 res!384205) b!599212))

(assert (= (and b!599212 res!384208) b!599211))

(assert (= (and b!599211 res!384212) b!599209))

(assert (= (and b!599211 c!67868) b!599217))

(assert (= (and b!599211 (not c!67868)) b!599207))

(assert (= (and b!599211 (not res!384211)) b!599215))

(assert (= (and b!599215 res!384220) b!599208))

(assert (= (and b!599208 (not res!384213)) b!599223))

(assert (= (and b!599223 res!384207) b!599224))

(assert (= (and b!599215 (not res!384216)) b!599222))

(declare-fun m!576473 () Bool)

(assert (=> b!599225 m!576473))

(declare-fun m!576475 () Bool)

(assert (=> b!599219 m!576475))

(declare-fun m!576477 () Bool)

(assert (=> b!599219 m!576477))

(declare-fun m!576479 () Bool)

(assert (=> b!599212 m!576479))

(declare-fun m!576481 () Bool)

(assert (=> b!599212 m!576481))

(assert (=> b!599212 m!576481))

(declare-fun m!576483 () Bool)

(assert (=> b!599212 m!576483))

(assert (=> b!599208 m!576481))

(declare-fun m!576485 () Bool)

(assert (=> b!599216 m!576485))

(declare-fun m!576487 () Bool)

(assert (=> b!599210 m!576487))

(assert (=> b!599223 m!576481))

(assert (=> b!599223 m!576481))

(declare-fun m!576489 () Bool)

(assert (=> b!599223 m!576489))

(assert (=> b!599224 m!576481))

(assert (=> b!599224 m!576481))

(declare-fun m!576491 () Bool)

(assert (=> b!599224 m!576491))

(declare-fun m!576493 () Bool)

(assert (=> start!54846 m!576493))

(declare-fun m!576495 () Bool)

(assert (=> start!54846 m!576495))

(declare-fun m!576497 () Bool)

(assert (=> b!599220 m!576497))

(declare-fun m!576499 () Bool)

(assert (=> b!599211 m!576499))

(declare-fun m!576501 () Bool)

(assert (=> b!599211 m!576501))

(declare-fun m!576503 () Bool)

(assert (=> b!599211 m!576503))

(assert (=> b!599211 m!576475))

(declare-fun m!576505 () Bool)

(assert (=> b!599211 m!576505))

(assert (=> b!599211 m!576481))

(declare-fun m!576507 () Bool)

(assert (=> b!599211 m!576507))

(declare-fun m!576509 () Bool)

(assert (=> b!599211 m!576509))

(assert (=> b!599211 m!576481))

(declare-fun m!576511 () Bool)

(assert (=> b!599221 m!576511))

(assert (=> b!599222 m!576481))

(declare-fun m!576513 () Bool)

(assert (=> b!599222 m!576513))

(assert (=> b!599222 m!576481))

(assert (=> b!599222 m!576481))

(declare-fun m!576515 () Bool)

(assert (=> b!599222 m!576515))

(declare-fun m!576517 () Bool)

(assert (=> b!599222 m!576517))

(declare-fun m!576519 () Bool)

(assert (=> b!599222 m!576519))

(declare-fun m!576521 () Bool)

(assert (=> b!599218 m!576521))

(assert (=> b!599213 m!576481))

(assert (=> b!599213 m!576481))

(declare-fun m!576523 () Bool)

(assert (=> b!599213 m!576523))

(assert (=> b!599215 m!576481))

(assert (=> b!599215 m!576475))

(declare-fun m!576525 () Bool)

(assert (=> b!599215 m!576525))

(check-sat (not b!599225) (not b!599218) (not b!599223) (not b!599216) (not b!599213) (not b!599210) (not b!599220) (not b!599224) (not b!599211) (not b!599222) (not start!54846) (not b!599212))
(check-sat)
