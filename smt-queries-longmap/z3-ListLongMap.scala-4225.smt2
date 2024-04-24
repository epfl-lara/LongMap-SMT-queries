; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58176 () Bool)

(assert start!58176)

(declare-fun b!642265 () Bool)

(declare-fun res!415915 () Bool)

(declare-fun e!367827 () Bool)

(assert (=> b!642265 (=> (not res!415915) (not e!367827))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38373 0))(
  ( (array!38374 (arr!18400 (Array (_ BitVec 32) (_ BitVec 64))) (size!18764 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38373)

(assert (=> b!642265 (= res!415915 (and (= (size!18764 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18764 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18764 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642266 () Bool)

(declare-datatypes ((Unit!21693 0))(
  ( (Unit!21694) )
))
(declare-fun e!367815 () Unit!21693)

(declare-fun Unit!21695 () Unit!21693)

(assert (=> b!642266 (= e!367815 Unit!21695)))

(declare-fun b!642267 () Bool)

(declare-fun res!415922 () Bool)

(declare-fun e!367817 () Bool)

(assert (=> b!642267 (=> res!415922 e!367817)))

(declare-datatypes ((List!12348 0))(
  ( (Nil!12345) (Cons!12344 (h!13392 (_ BitVec 64)) (t!18568 List!12348)) )
))
(declare-fun noDuplicate!409 (List!12348) Bool)

(assert (=> b!642267 (= res!415922 (not (noDuplicate!409 Nil!12345)))))

(declare-fun b!642268 () Bool)

(declare-fun res!415916 () Bool)

(assert (=> b!642268 (=> (not res!415916) (not e!367827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642268 (= res!415916 (validKeyInArray!0 (select (arr!18400 a!2986) j!136)))))

(declare-fun b!642269 () Bool)

(declare-fun res!415926 () Bool)

(assert (=> b!642269 (=> res!415926 e!367817)))

(declare-fun contains!3113 (List!12348 (_ BitVec 64)) Bool)

(assert (=> b!642269 (= res!415926 (contains!3113 Nil!12345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642270 () Bool)

(declare-fun e!367818 () Bool)

(declare-fun e!367821 () Bool)

(assert (=> b!642270 (= e!367818 e!367821)))

(declare-fun res!415923 () Bool)

(assert (=> b!642270 (=> (not res!415923) (not e!367821))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!642270 (= res!415923 (= (select (store (arr!18400 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!297369 () array!38373)

(assert (=> b!642270 (= lt!297369 (array!38374 (store (arr!18400 a!2986) i!1108 k0!1786) (size!18764 a!2986)))))

(declare-fun b!642271 () Bool)

(declare-fun res!415927 () Bool)

(assert (=> b!642271 (=> (not res!415927) (not e!367818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38373 (_ BitVec 32)) Bool)

(assert (=> b!642271 (= res!415927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642272 () Bool)

(assert (=> b!642272 (= e!367817 true)))

(declare-fun lt!297368 () Bool)

(assert (=> b!642272 (= lt!297368 (contains!3113 Nil!12345 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!642273 () Bool)

(declare-fun e!367823 () Bool)

(declare-fun e!367816 () Bool)

(assert (=> b!642273 (= e!367823 (not e!367816))))

(declare-fun res!415910 () Bool)

(assert (=> b!642273 (=> res!415910 e!367816)))

(declare-datatypes ((SeekEntryResult!6796 0))(
  ( (MissingZero!6796 (index!29510 (_ BitVec 32))) (Found!6796 (index!29511 (_ BitVec 32))) (Intermediate!6796 (undefined!7608 Bool) (index!29512 (_ BitVec 32)) (x!58429 (_ BitVec 32))) (Undefined!6796) (MissingVacant!6796 (index!29513 (_ BitVec 32))) )
))
(declare-fun lt!297364 () SeekEntryResult!6796)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642273 (= res!415910 (not (= lt!297364 (Found!6796 index!984))))))

(declare-fun lt!297359 () Unit!21693)

(assert (=> b!642273 (= lt!297359 e!367815)))

(declare-fun c!73547 () Bool)

(assert (=> b!642273 (= c!73547 (= lt!297364 Undefined!6796))))

(declare-fun lt!297361 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38373 (_ BitVec 32)) SeekEntryResult!6796)

(assert (=> b!642273 (= lt!297364 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297361 lt!297369 mask!3053))))

(declare-fun e!367825 () Bool)

(assert (=> b!642273 e!367825))

(declare-fun res!415917 () Bool)

(assert (=> b!642273 (=> (not res!415917) (not e!367825))))

(declare-fun lt!297366 () (_ BitVec 32))

(declare-fun lt!297357 () SeekEntryResult!6796)

(assert (=> b!642273 (= res!415917 (= lt!297357 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297366 vacantSpotIndex!68 lt!297361 lt!297369 mask!3053)))))

(assert (=> b!642273 (= lt!297357 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297366 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642273 (= lt!297361 (select (store (arr!18400 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297367 () Unit!21693)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38373 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21693)

(assert (=> b!642273 (= lt!297367 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297366 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642273 (= lt!297366 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!642274 () Bool)

(declare-fun e!367822 () Bool)

(declare-fun e!367826 () Bool)

(assert (=> b!642274 (= e!367822 e!367826)))

(declare-fun res!415911 () Bool)

(assert (=> b!642274 (=> (not res!415911) (not e!367826))))

(declare-fun arrayContainsKey!0 (array!38373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642274 (= res!415911 (arrayContainsKey!0 lt!297369 (select (arr!18400 a!2986) j!136) j!136))))

(declare-fun b!642275 () Bool)

(declare-fun res!415925 () Bool)

(assert (=> b!642275 (=> (not res!415925) (not e!367827))))

(assert (=> b!642275 (= res!415925 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642276 () Bool)

(declare-fun res!415909 () Bool)

(assert (=> b!642276 (=> (not res!415909) (not e!367818))))

(declare-fun arrayNoDuplicates!0 (array!38373 (_ BitVec 32) List!12348) Bool)

(assert (=> b!642276 (= res!415909 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12345))))

(declare-fun b!642277 () Bool)

(declare-fun Unit!21696 () Unit!21693)

(assert (=> b!642277 (= e!367815 Unit!21696)))

(assert (=> b!642277 false))

(declare-fun b!642278 () Bool)

(declare-fun res!415920 () Bool)

(assert (=> b!642278 (=> (not res!415920) (not e!367818))))

(assert (=> b!642278 (= res!415920 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18400 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642280 () Bool)

(declare-fun e!367824 () Bool)

(assert (=> b!642280 (= e!367824 e!367817)))

(declare-fun res!415924 () Bool)

(assert (=> b!642280 (=> res!415924 e!367817)))

(assert (=> b!642280 (= res!415924 (or (bvsge (size!18764 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18764 a!2986))))))

(assert (=> b!642280 (arrayNoDuplicates!0 lt!297369 j!136 Nil!12345)))

(declare-fun lt!297365 () Unit!21693)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38373 (_ BitVec 32) (_ BitVec 32)) Unit!21693)

(assert (=> b!642280 (= lt!297365 (lemmaNoDuplicateFromThenFromBigger!0 lt!297369 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642280 (arrayNoDuplicates!0 lt!297369 #b00000000000000000000000000000000 Nil!12345)))

(declare-fun lt!297363 () Unit!21693)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12348) Unit!21693)

(assert (=> b!642280 (= lt!297363 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12345))))

(assert (=> b!642280 (arrayContainsKey!0 lt!297369 (select (arr!18400 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297370 () Unit!21693)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38373 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21693)

(assert (=> b!642280 (= lt!297370 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297369 (select (arr!18400 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!642279 () Bool)

(assert (=> b!642279 (= e!367826 (arrayContainsKey!0 lt!297369 (select (arr!18400 a!2986) j!136) index!984))))

(declare-fun res!415908 () Bool)

(assert (=> start!58176 (=> (not res!415908) (not e!367827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58176 (= res!415908 (validMask!0 mask!3053))))

(assert (=> start!58176 e!367827))

(assert (=> start!58176 true))

(declare-fun array_inv!14259 (array!38373) Bool)

(assert (=> start!58176 (array_inv!14259 a!2986)))

(declare-fun b!642281 () Bool)

(declare-fun e!367819 () Bool)

(assert (=> b!642281 (= e!367819 e!367822)))

(declare-fun res!415912 () Bool)

(assert (=> b!642281 (=> res!415912 e!367822)))

(declare-fun lt!297362 () (_ BitVec 64))

(assert (=> b!642281 (= res!415912 (or (not (= (select (arr!18400 a!2986) j!136) lt!297361)) (not (= (select (arr!18400 a!2986) j!136) lt!297362)) (bvsge j!136 index!984)))))

(declare-fun b!642282 () Bool)

(declare-fun res!415913 () Bool)

(assert (=> b!642282 (=> (not res!415913) (not e!367827))))

(assert (=> b!642282 (= res!415913 (validKeyInArray!0 k0!1786))))

(declare-fun b!642283 () Bool)

(assert (=> b!642283 (= e!367816 e!367824)))

(declare-fun res!415914 () Bool)

(assert (=> b!642283 (=> res!415914 e!367824)))

(assert (=> b!642283 (= res!415914 (or (not (= (select (arr!18400 a!2986) j!136) lt!297361)) (not (= (select (arr!18400 a!2986) j!136) lt!297362)) (bvsge j!136 index!984)))))

(assert (=> b!642283 e!367819))

(declare-fun res!415921 () Bool)

(assert (=> b!642283 (=> (not res!415921) (not e!367819))))

(assert (=> b!642283 (= res!415921 (= lt!297362 (select (arr!18400 a!2986) j!136)))))

(assert (=> b!642283 (= lt!297362 (select (store (arr!18400 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642284 () Bool)

(assert (=> b!642284 (= e!367827 e!367818)))

(declare-fun res!415918 () Bool)

(assert (=> b!642284 (=> (not res!415918) (not e!367818))))

(declare-fun lt!297360 () SeekEntryResult!6796)

(assert (=> b!642284 (= res!415918 (or (= lt!297360 (MissingZero!6796 i!1108)) (= lt!297360 (MissingVacant!6796 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38373 (_ BitVec 32)) SeekEntryResult!6796)

(assert (=> b!642284 (= lt!297360 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642285 () Bool)

(assert (=> b!642285 (= e!367821 e!367823)))

(declare-fun res!415919 () Bool)

(assert (=> b!642285 (=> (not res!415919) (not e!367823))))

(declare-fun lt!297358 () SeekEntryResult!6796)

(assert (=> b!642285 (= res!415919 (and (= lt!297358 (Found!6796 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18400 a!2986) index!984) (select (arr!18400 a!2986) j!136))) (not (= (select (arr!18400 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642285 (= lt!297358 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18400 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642286 () Bool)

(assert (=> b!642286 (= e!367825 (= lt!297358 lt!297357))))

(assert (= (and start!58176 res!415908) b!642265))

(assert (= (and b!642265 res!415915) b!642268))

(assert (= (and b!642268 res!415916) b!642282))

(assert (= (and b!642282 res!415913) b!642275))

(assert (= (and b!642275 res!415925) b!642284))

(assert (= (and b!642284 res!415918) b!642271))

(assert (= (and b!642271 res!415927) b!642276))

(assert (= (and b!642276 res!415909) b!642278))

(assert (= (and b!642278 res!415920) b!642270))

(assert (= (and b!642270 res!415923) b!642285))

(assert (= (and b!642285 res!415919) b!642273))

(assert (= (and b!642273 res!415917) b!642286))

(assert (= (and b!642273 c!73547) b!642277))

(assert (= (and b!642273 (not c!73547)) b!642266))

(assert (= (and b!642273 (not res!415910)) b!642283))

(assert (= (and b!642283 res!415921) b!642281))

(assert (= (and b!642281 (not res!415912)) b!642274))

(assert (= (and b!642274 res!415911) b!642279))

(assert (= (and b!642283 (not res!415914)) b!642280))

(assert (= (and b!642280 (not res!415924)) b!642267))

(assert (= (and b!642267 (not res!415922)) b!642269))

(assert (= (and b!642269 (not res!415926)) b!642272))

(declare-fun m!616435 () Bool)

(assert (=> b!642270 m!616435))

(declare-fun m!616437 () Bool)

(assert (=> b!642270 m!616437))

(declare-fun m!616439 () Bool)

(assert (=> b!642268 m!616439))

(assert (=> b!642268 m!616439))

(declare-fun m!616441 () Bool)

(assert (=> b!642268 m!616441))

(declare-fun m!616443 () Bool)

(assert (=> b!642275 m!616443))

(assert (=> b!642274 m!616439))

(assert (=> b!642274 m!616439))

(declare-fun m!616445 () Bool)

(assert (=> b!642274 m!616445))

(declare-fun m!616447 () Bool)

(assert (=> b!642284 m!616447))

(declare-fun m!616449 () Bool)

(assert (=> b!642272 m!616449))

(declare-fun m!616451 () Bool)

(assert (=> b!642285 m!616451))

(assert (=> b!642285 m!616439))

(assert (=> b!642285 m!616439))

(declare-fun m!616453 () Bool)

(assert (=> b!642285 m!616453))

(declare-fun m!616455 () Bool)

(assert (=> b!642278 m!616455))

(declare-fun m!616457 () Bool)

(assert (=> b!642273 m!616457))

(declare-fun m!616459 () Bool)

(assert (=> b!642273 m!616459))

(declare-fun m!616461 () Bool)

(assert (=> b!642273 m!616461))

(declare-fun m!616463 () Bool)

(assert (=> b!642273 m!616463))

(assert (=> b!642273 m!616435))

(assert (=> b!642273 m!616439))

(declare-fun m!616465 () Bool)

(assert (=> b!642273 m!616465))

(assert (=> b!642273 m!616439))

(declare-fun m!616467 () Bool)

(assert (=> b!642273 m!616467))

(declare-fun m!616469 () Bool)

(assert (=> b!642276 m!616469))

(declare-fun m!616471 () Bool)

(assert (=> b!642267 m!616471))

(declare-fun m!616473 () Bool)

(assert (=> b!642280 m!616473))

(assert (=> b!642280 m!616439))

(assert (=> b!642280 m!616439))

(declare-fun m!616475 () Bool)

(assert (=> b!642280 m!616475))

(declare-fun m!616477 () Bool)

(assert (=> b!642280 m!616477))

(assert (=> b!642280 m!616439))

(declare-fun m!616479 () Bool)

(assert (=> b!642280 m!616479))

(declare-fun m!616481 () Bool)

(assert (=> b!642280 m!616481))

(declare-fun m!616483 () Bool)

(assert (=> b!642280 m!616483))

(assert (=> b!642279 m!616439))

(assert (=> b!642279 m!616439))

(declare-fun m!616485 () Bool)

(assert (=> b!642279 m!616485))

(declare-fun m!616487 () Bool)

(assert (=> b!642271 m!616487))

(declare-fun m!616489 () Bool)

(assert (=> b!642282 m!616489))

(assert (=> b!642281 m!616439))

(assert (=> b!642283 m!616439))

(assert (=> b!642283 m!616435))

(declare-fun m!616491 () Bool)

(assert (=> b!642283 m!616491))

(declare-fun m!616493 () Bool)

(assert (=> start!58176 m!616493))

(declare-fun m!616495 () Bool)

(assert (=> start!58176 m!616495))

(declare-fun m!616497 () Bool)

(assert (=> b!642269 m!616497))

(check-sat (not b!642271) (not b!642269) (not b!642268) (not b!642285) (not b!642276) (not b!642280) (not b!642275) (not b!642272) (not b!642284) (not b!642279) (not start!58176) (not b!642274) (not b!642273) (not b!642267) (not b!642282))
(check-sat)
