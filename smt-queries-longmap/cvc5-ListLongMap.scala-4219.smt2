; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57908 () Bool)

(assert start!57908)

(declare-fun b!640259 () Bool)

(declare-fun e!366498 () Bool)

(declare-fun e!366501 () Bool)

(assert (=> b!640259 (= e!366498 e!366501)))

(declare-fun res!414556 () Bool)

(assert (=> b!640259 (=> (not res!414556) (not e!366501))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38335 0))(
  ( (array!38336 (arr!18387 (Array (_ BitVec 32) (_ BitVec 64))) (size!18751 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38335)

(declare-fun lt!296275 () array!38335)

(declare-fun arrayContainsKey!0 (array!38335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640259 (= res!414556 (arrayContainsKey!0 lt!296275 (select (arr!18387 a!2986) j!136) j!136))))

(declare-fun b!640260 () Bool)

(declare-fun e!366504 () Bool)

(declare-fun e!366493 () Bool)

(assert (=> b!640260 (= e!366504 e!366493)))

(declare-fun res!414555 () Bool)

(assert (=> b!640260 (=> res!414555 e!366493)))

(declare-fun lt!296273 () (_ BitVec 64))

(declare-fun lt!296276 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640260 (= res!414555 (or (not (= (select (arr!18387 a!2986) j!136) lt!296276)) (not (= (select (arr!18387 a!2986) j!136) lt!296273)) (bvsge j!136 index!984)))))

(declare-fun e!366495 () Bool)

(assert (=> b!640260 e!366495))

(declare-fun res!414547 () Bool)

(assert (=> b!640260 (=> (not res!414547) (not e!366495))))

(assert (=> b!640260 (= res!414547 (= lt!296273 (select (arr!18387 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640260 (= lt!296273 (select (store (arr!18387 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640261 () Bool)

(declare-fun e!366503 () Bool)

(assert (=> b!640261 (= e!366503 (not e!366504))))

(declare-fun res!414549 () Bool)

(assert (=> b!640261 (=> res!414549 e!366504)))

(declare-datatypes ((SeekEntryResult!6827 0))(
  ( (MissingZero!6827 (index!29628 (_ BitVec 32))) (Found!6827 (index!29629 (_ BitVec 32))) (Intermediate!6827 (undefined!7639 Bool) (index!29630 (_ BitVec 32)) (x!58391 (_ BitVec 32))) (Undefined!6827) (MissingVacant!6827 (index!29631 (_ BitVec 32))) )
))
(declare-fun lt!296281 () SeekEntryResult!6827)

(assert (=> b!640261 (= res!414549 (not (= lt!296281 (Found!6827 index!984))))))

(declare-datatypes ((Unit!21642 0))(
  ( (Unit!21643) )
))
(declare-fun lt!296271 () Unit!21642)

(declare-fun e!366502 () Unit!21642)

(assert (=> b!640261 (= lt!296271 e!366502)))

(declare-fun c!73226 () Bool)

(assert (=> b!640261 (= c!73226 (= lt!296281 Undefined!6827))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38335 (_ BitVec 32)) SeekEntryResult!6827)

(assert (=> b!640261 (= lt!296281 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296276 lt!296275 mask!3053))))

(declare-fun e!366500 () Bool)

(assert (=> b!640261 e!366500))

(declare-fun res!414553 () Bool)

(assert (=> b!640261 (=> (not res!414553) (not e!366500))))

(declare-fun lt!296270 () (_ BitVec 32))

(declare-fun lt!296280 () SeekEntryResult!6827)

(assert (=> b!640261 (= res!414553 (= lt!296280 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296270 vacantSpotIndex!68 lt!296276 lt!296275 mask!3053)))))

(assert (=> b!640261 (= lt!296280 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296270 vacantSpotIndex!68 (select (arr!18387 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640261 (= lt!296276 (select (store (arr!18387 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296277 () Unit!21642)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21642)

(assert (=> b!640261 (= lt!296277 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296270 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640261 (= lt!296270 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640262 () Bool)

(assert (=> b!640262 (= e!366501 (arrayContainsKey!0 lt!296275 (select (arr!18387 a!2986) j!136) index!984))))

(declare-fun b!640263 () Bool)

(declare-fun e!366499 () Bool)

(assert (=> b!640263 (= e!366499 e!366503)))

(declare-fun res!414541 () Bool)

(assert (=> b!640263 (=> (not res!414541) (not e!366503))))

(declare-fun lt!296274 () SeekEntryResult!6827)

(assert (=> b!640263 (= res!414541 (and (= lt!296274 (Found!6827 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18387 a!2986) index!984) (select (arr!18387 a!2986) j!136))) (not (= (select (arr!18387 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640263 (= lt!296274 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18387 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640264 () Bool)

(declare-fun Unit!21644 () Unit!21642)

(assert (=> b!640264 (= e!366502 Unit!21644)))

(assert (=> b!640264 false))

(declare-fun b!640265 () Bool)

(assert (=> b!640265 (= e!366500 (= lt!296274 lt!296280))))

(declare-fun b!640266 () Bool)

(declare-fun res!414551 () Bool)

(declare-fun e!366494 () Bool)

(assert (=> b!640266 (=> (not res!414551) (not e!366494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640266 (= res!414551 (validKeyInArray!0 k!1786))))

(declare-fun b!640268 () Bool)

(declare-fun e!366497 () Bool)

(assert (=> b!640268 (= e!366494 e!366497)))

(declare-fun res!414544 () Bool)

(assert (=> b!640268 (=> (not res!414544) (not e!366497))))

(declare-fun lt!296272 () SeekEntryResult!6827)

(assert (=> b!640268 (= res!414544 (or (= lt!296272 (MissingZero!6827 i!1108)) (= lt!296272 (MissingVacant!6827 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38335 (_ BitVec 32)) SeekEntryResult!6827)

(assert (=> b!640268 (= lt!296272 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640269 () Bool)

(assert (=> b!640269 (= e!366495 e!366498)))

(declare-fun res!414543 () Bool)

(assert (=> b!640269 (=> res!414543 e!366498)))

(assert (=> b!640269 (= res!414543 (or (not (= (select (arr!18387 a!2986) j!136) lt!296276)) (not (= (select (arr!18387 a!2986) j!136) lt!296273)) (bvsge j!136 index!984)))))

(declare-fun b!640270 () Bool)

(declare-fun Unit!21645 () Unit!21642)

(assert (=> b!640270 (= e!366502 Unit!21645)))

(declare-fun b!640271 () Bool)

(assert (=> b!640271 (= e!366497 e!366499)))

(declare-fun res!414552 () Bool)

(assert (=> b!640271 (=> (not res!414552) (not e!366499))))

(assert (=> b!640271 (= res!414552 (= (select (store (arr!18387 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640271 (= lt!296275 (array!38336 (store (arr!18387 a!2986) i!1108 k!1786) (size!18751 a!2986)))))

(declare-fun b!640272 () Bool)

(declare-fun res!414546 () Bool)

(assert (=> b!640272 (=> (not res!414546) (not e!366494))))

(assert (=> b!640272 (= res!414546 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640273 () Bool)

(declare-fun res!414548 () Bool)

(assert (=> b!640273 (=> (not res!414548) (not e!366494))))

(assert (=> b!640273 (= res!414548 (and (= (size!18751 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18751 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18751 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640274 () Bool)

(declare-fun res!414545 () Bool)

(assert (=> b!640274 (=> (not res!414545) (not e!366497))))

(declare-datatypes ((List!12428 0))(
  ( (Nil!12425) (Cons!12424 (h!13469 (_ BitVec 64)) (t!18656 List!12428)) )
))
(declare-fun arrayNoDuplicates!0 (array!38335 (_ BitVec 32) List!12428) Bool)

(assert (=> b!640274 (= res!414545 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12425))))

(declare-fun b!640275 () Bool)

(declare-fun res!414542 () Bool)

(assert (=> b!640275 (=> (not res!414542) (not e!366494))))

(assert (=> b!640275 (= res!414542 (validKeyInArray!0 (select (arr!18387 a!2986) j!136)))))

(declare-fun b!640267 () Bool)

(assert (=> b!640267 (= e!366493 true)))

(assert (=> b!640267 (arrayNoDuplicates!0 lt!296275 j!136 Nil!12425)))

(declare-fun lt!296269 () Unit!21642)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38335 (_ BitVec 32) (_ BitVec 32)) Unit!21642)

(assert (=> b!640267 (= lt!296269 (lemmaNoDuplicateFromThenFromBigger!0 lt!296275 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640267 (arrayNoDuplicates!0 lt!296275 #b00000000000000000000000000000000 Nil!12425)))

(declare-fun lt!296279 () Unit!21642)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12428) Unit!21642)

(assert (=> b!640267 (= lt!296279 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12425))))

(assert (=> b!640267 (arrayContainsKey!0 lt!296275 (select (arr!18387 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296278 () Unit!21642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38335 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21642)

(assert (=> b!640267 (= lt!296278 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296275 (select (arr!18387 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun res!414557 () Bool)

(assert (=> start!57908 (=> (not res!414557) (not e!366494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57908 (= res!414557 (validMask!0 mask!3053))))

(assert (=> start!57908 e!366494))

(assert (=> start!57908 true))

(declare-fun array_inv!14183 (array!38335) Bool)

(assert (=> start!57908 (array_inv!14183 a!2986)))

(declare-fun b!640276 () Bool)

(declare-fun res!414554 () Bool)

(assert (=> b!640276 (=> (not res!414554) (not e!366497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38335 (_ BitVec 32)) Bool)

(assert (=> b!640276 (= res!414554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640277 () Bool)

(declare-fun res!414550 () Bool)

(assert (=> b!640277 (=> (not res!414550) (not e!366497))))

(assert (=> b!640277 (= res!414550 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18387 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57908 res!414557) b!640273))

(assert (= (and b!640273 res!414548) b!640275))

(assert (= (and b!640275 res!414542) b!640266))

(assert (= (and b!640266 res!414551) b!640272))

(assert (= (and b!640272 res!414546) b!640268))

(assert (= (and b!640268 res!414544) b!640276))

(assert (= (and b!640276 res!414554) b!640274))

(assert (= (and b!640274 res!414545) b!640277))

(assert (= (and b!640277 res!414550) b!640271))

(assert (= (and b!640271 res!414552) b!640263))

(assert (= (and b!640263 res!414541) b!640261))

(assert (= (and b!640261 res!414553) b!640265))

(assert (= (and b!640261 c!73226) b!640264))

(assert (= (and b!640261 (not c!73226)) b!640270))

(assert (= (and b!640261 (not res!414549)) b!640260))

(assert (= (and b!640260 res!414547) b!640269))

(assert (= (and b!640269 (not res!414543)) b!640259))

(assert (= (and b!640259 res!414556) b!640262))

(assert (= (and b!640260 (not res!414555)) b!640267))

(declare-fun m!614087 () Bool)

(assert (=> start!57908 m!614087))

(declare-fun m!614089 () Bool)

(assert (=> start!57908 m!614089))

(declare-fun m!614091 () Bool)

(assert (=> b!640269 m!614091))

(declare-fun m!614093 () Bool)

(assert (=> b!640267 m!614093))

(assert (=> b!640267 m!614091))

(declare-fun m!614095 () Bool)

(assert (=> b!640267 m!614095))

(assert (=> b!640267 m!614091))

(declare-fun m!614097 () Bool)

(assert (=> b!640267 m!614097))

(assert (=> b!640267 m!614091))

(declare-fun m!614099 () Bool)

(assert (=> b!640267 m!614099))

(declare-fun m!614101 () Bool)

(assert (=> b!640267 m!614101))

(declare-fun m!614103 () Bool)

(assert (=> b!640267 m!614103))

(declare-fun m!614105 () Bool)

(assert (=> b!640266 m!614105))

(assert (=> b!640262 m!614091))

(assert (=> b!640262 m!614091))

(declare-fun m!614107 () Bool)

(assert (=> b!640262 m!614107))

(declare-fun m!614109 () Bool)

(assert (=> b!640274 m!614109))

(assert (=> b!640259 m!614091))

(assert (=> b!640259 m!614091))

(declare-fun m!614111 () Bool)

(assert (=> b!640259 m!614111))

(declare-fun m!614113 () Bool)

(assert (=> b!640276 m!614113))

(assert (=> b!640260 m!614091))

(declare-fun m!614115 () Bool)

(assert (=> b!640260 m!614115))

(declare-fun m!614117 () Bool)

(assert (=> b!640260 m!614117))

(assert (=> b!640275 m!614091))

(assert (=> b!640275 m!614091))

(declare-fun m!614119 () Bool)

(assert (=> b!640275 m!614119))

(declare-fun m!614121 () Bool)

(assert (=> b!640268 m!614121))

(assert (=> b!640271 m!614115))

(declare-fun m!614123 () Bool)

(assert (=> b!640271 m!614123))

(declare-fun m!614125 () Bool)

(assert (=> b!640272 m!614125))

(declare-fun m!614127 () Bool)

(assert (=> b!640277 m!614127))

(declare-fun m!614129 () Bool)

(assert (=> b!640261 m!614129))

(declare-fun m!614131 () Bool)

(assert (=> b!640261 m!614131))

(assert (=> b!640261 m!614091))

(assert (=> b!640261 m!614115))

(declare-fun m!614133 () Bool)

(assert (=> b!640261 m!614133))

(assert (=> b!640261 m!614091))

(declare-fun m!614135 () Bool)

(assert (=> b!640261 m!614135))

(declare-fun m!614137 () Bool)

(assert (=> b!640261 m!614137))

(declare-fun m!614139 () Bool)

(assert (=> b!640261 m!614139))

(declare-fun m!614141 () Bool)

(assert (=> b!640263 m!614141))

(assert (=> b!640263 m!614091))

(assert (=> b!640263 m!614091))

(declare-fun m!614143 () Bool)

(assert (=> b!640263 m!614143))

(push 1)

