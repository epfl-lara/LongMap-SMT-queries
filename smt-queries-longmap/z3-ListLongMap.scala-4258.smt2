; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59104 () Bool)

(assert start!59104)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38604 0))(
  ( (array!38605 (arr!18505 (Array (_ BitVec 32) (_ BitVec 64))) (size!18869 (_ BitVec 32))) )
))
(declare-fun lt!303449 () array!38604)

(declare-fun e!374335 () Bool)

(declare-fun b!652225 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38604)

(declare-fun arrayContainsKey!0 (array!38604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652225 (= e!374335 (arrayContainsKey!0 lt!303449 (select (arr!18505 a!2986) j!136) index!984))))

(declare-fun b!652226 () Bool)

(declare-fun res!422937 () Bool)

(declare-fun e!374346 () Bool)

(assert (=> b!652226 (=> (not res!422937) (not e!374346))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!652226 (= res!422937 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652227 () Bool)

(declare-fun res!422946 () Bool)

(declare-fun e!374343 () Bool)

(assert (=> b!652227 (=> (not res!422946) (not e!374343))))

(declare-datatypes ((List!12546 0))(
  ( (Nil!12543) (Cons!12542 (h!13587 (_ BitVec 64)) (t!18774 List!12546)) )
))
(declare-fun arrayNoDuplicates!0 (array!38604 (_ BitVec 32) List!12546) Bool)

(assert (=> b!652227 (= res!422946 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12543))))

(declare-fun b!652228 () Bool)

(declare-datatypes ((Unit!22296 0))(
  ( (Unit!22297) )
))
(declare-fun e!374332 () Unit!22296)

(declare-fun Unit!22298 () Unit!22296)

(assert (=> b!652228 (= e!374332 Unit!22298)))

(declare-fun lt!303443 () Unit!22296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22296)

(assert (=> b!652228 (= lt!303443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303449 (select (arr!18505 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652228 (arrayContainsKey!0 lt!303449 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!303452 () Unit!22296)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12546) Unit!22296)

(assert (=> b!652228 (= lt!303452 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12543))))

(assert (=> b!652228 (arrayNoDuplicates!0 lt!303449 #b00000000000000000000000000000000 Nil!12543)))

(declare-fun lt!303442 () Unit!22296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38604 (_ BitVec 32) (_ BitVec 32)) Unit!22296)

(assert (=> b!652228 (= lt!303442 (lemmaNoDuplicateFromThenFromBigger!0 lt!303449 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652228 (arrayNoDuplicates!0 lt!303449 j!136 Nil!12543)))

(declare-fun lt!303456 () Unit!22296)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38604 (_ BitVec 64) (_ BitVec 32) List!12546) Unit!22296)

(assert (=> b!652228 (= lt!303456 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303449 (select (arr!18505 a!2986) j!136) j!136 Nil!12543))))

(assert (=> b!652228 false))

(declare-fun b!652229 () Bool)

(declare-fun e!374338 () Bool)

(declare-datatypes ((SeekEntryResult!6945 0))(
  ( (MissingZero!6945 (index!30133 (_ BitVec 32))) (Found!6945 (index!30134 (_ BitVec 32))) (Intermediate!6945 (undefined!7757 Bool) (index!30135 (_ BitVec 32)) (x!58920 (_ BitVec 32))) (Undefined!6945) (MissingVacant!6945 (index!30136 (_ BitVec 32))) )
))
(declare-fun lt!303446 () SeekEntryResult!6945)

(declare-fun lt!303455 () SeekEntryResult!6945)

(assert (=> b!652229 (= e!374338 (= lt!303446 lt!303455))))

(declare-fun b!652230 () Bool)

(declare-fun e!374342 () Bool)

(declare-fun e!374344 () Bool)

(assert (=> b!652230 (= e!374342 (not e!374344))))

(declare-fun res!422939 () Bool)

(assert (=> b!652230 (=> res!422939 e!374344)))

(declare-fun lt!303447 () SeekEntryResult!6945)

(assert (=> b!652230 (= res!422939 (not (= lt!303447 (Found!6945 index!984))))))

(declare-fun lt!303445 () Unit!22296)

(declare-fun e!374337 () Unit!22296)

(assert (=> b!652230 (= lt!303445 e!374337)))

(declare-fun c!75013 () Bool)

(assert (=> b!652230 (= c!75013 (= lt!303447 Undefined!6945))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!303451 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38604 (_ BitVec 32)) SeekEntryResult!6945)

(assert (=> b!652230 (= lt!303447 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303451 lt!303449 mask!3053))))

(assert (=> b!652230 e!374338))

(declare-fun res!422945 () Bool)

(assert (=> b!652230 (=> (not res!422945) (not e!374338))))

(declare-fun lt!303454 () (_ BitVec 32))

(assert (=> b!652230 (= res!422945 (= lt!303455 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303454 vacantSpotIndex!68 lt!303451 lt!303449 mask!3053)))))

(assert (=> b!652230 (= lt!303455 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303454 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652230 (= lt!303451 (select (store (arr!18505 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303440 () Unit!22296)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38604 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22296)

(assert (=> b!652230 (= lt!303440 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303454 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652230 (= lt!303454 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!422940 () Bool)

(assert (=> start!59104 (=> (not res!422940) (not e!374346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59104 (= res!422940 (validMask!0 mask!3053))))

(assert (=> start!59104 e!374346))

(assert (=> start!59104 true))

(declare-fun array_inv!14301 (array!38604) Bool)

(assert (=> start!59104 (array_inv!14301 a!2986)))

(declare-fun b!652231 () Bool)

(declare-fun res!422936 () Bool)

(assert (=> b!652231 (=> (not res!422936) (not e!374346))))

(assert (=> b!652231 (= res!422936 (and (= (size!18869 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18869 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18869 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652232 () Bool)

(declare-fun e!374340 () Bool)

(assert (=> b!652232 (= e!374340 e!374342)))

(declare-fun res!422934 () Bool)

(assert (=> b!652232 (=> (not res!422934) (not e!374342))))

(assert (=> b!652232 (= res!422934 (and (= lt!303446 (Found!6945 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18505 a!2986) index!984) (select (arr!18505 a!2986) j!136))) (not (= (select (arr!18505 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652232 (= lt!303446 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18505 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652233 () Bool)

(declare-fun e!374345 () Bool)

(assert (=> b!652233 (= e!374345 (or (bvsge (size!18869 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 index!984) (size!18869 a!2986))))))

(assert (=> b!652233 (arrayNoDuplicates!0 lt!303449 index!984 Nil!12543)))

(declare-fun lt!303457 () Unit!22296)

(assert (=> b!652233 (= lt!303457 (lemmaNoDuplicateFromThenFromBigger!0 lt!303449 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652233 (arrayNoDuplicates!0 lt!303449 #b00000000000000000000000000000000 Nil!12543)))

(declare-fun lt!303450 () Unit!22296)

(assert (=> b!652233 (= lt!303450 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12543))))

(assert (=> b!652233 (arrayContainsKey!0 lt!303449 (select (arr!18505 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303448 () Unit!22296)

(assert (=> b!652233 (= lt!303448 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303449 (select (arr!18505 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652233 e!374335))

(declare-fun res!422950 () Bool)

(assert (=> b!652233 (=> (not res!422950) (not e!374335))))

(assert (=> b!652233 (= res!422950 (arrayContainsKey!0 lt!303449 (select (arr!18505 a!2986) j!136) j!136))))

(declare-fun b!652234 () Bool)

(declare-fun e!374333 () Bool)

(declare-fun e!374334 () Bool)

(assert (=> b!652234 (= e!374333 e!374334)))

(declare-fun res!422935 () Bool)

(assert (=> b!652234 (=> (not res!422935) (not e!374334))))

(assert (=> b!652234 (= res!422935 (arrayContainsKey!0 lt!303449 (select (arr!18505 a!2986) j!136) j!136))))

(declare-fun b!652235 () Bool)

(declare-fun e!374339 () Bool)

(assert (=> b!652235 (= e!374339 e!374333)))

(declare-fun res!422947 () Bool)

(assert (=> b!652235 (=> res!422947 e!374333)))

(declare-fun lt!303441 () (_ BitVec 64))

(assert (=> b!652235 (= res!422947 (or (not (= (select (arr!18505 a!2986) j!136) lt!303451)) (not (= (select (arr!18505 a!2986) j!136) lt!303441)) (bvsge j!136 index!984)))))

(declare-fun b!652236 () Bool)

(declare-fun e!374341 () Bool)

(assert (=> b!652236 (= e!374344 e!374341)))

(declare-fun res!422942 () Bool)

(assert (=> b!652236 (=> res!422942 e!374341)))

(assert (=> b!652236 (= res!422942 (or (not (= (select (arr!18505 a!2986) j!136) lt!303451)) (not (= (select (arr!18505 a!2986) j!136) lt!303441))))))

(assert (=> b!652236 e!374339))

(declare-fun res!422948 () Bool)

(assert (=> b!652236 (=> (not res!422948) (not e!374339))))

(assert (=> b!652236 (= res!422948 (= lt!303441 (select (arr!18505 a!2986) j!136)))))

(assert (=> b!652236 (= lt!303441 (select (store (arr!18505 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652237 () Bool)

(declare-fun res!422938 () Bool)

(assert (=> b!652237 (=> (not res!422938) (not e!374346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652237 (= res!422938 (validKeyInArray!0 k0!1786))))

(declare-fun b!652238 () Bool)

(assert (=> b!652238 (= e!374341 e!374345)))

(declare-fun res!422944 () Bool)

(assert (=> b!652238 (=> res!422944 e!374345)))

(assert (=> b!652238 (= res!422944 (bvsge index!984 j!136))))

(declare-fun lt!303444 () Unit!22296)

(assert (=> b!652238 (= lt!303444 e!374332)))

(declare-fun c!75014 () Bool)

(assert (=> b!652238 (= c!75014 (bvslt j!136 index!984))))

(declare-fun b!652239 () Bool)

(declare-fun res!422941 () Bool)

(assert (=> b!652239 (=> (not res!422941) (not e!374346))))

(assert (=> b!652239 (= res!422941 (validKeyInArray!0 (select (arr!18505 a!2986) j!136)))))

(declare-fun b!652240 () Bool)

(declare-fun res!422949 () Bool)

(assert (=> b!652240 (=> (not res!422949) (not e!374343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38604 (_ BitVec 32)) Bool)

(assert (=> b!652240 (= res!422949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652241 () Bool)

(declare-fun Unit!22299 () Unit!22296)

(assert (=> b!652241 (= e!374332 Unit!22299)))

(declare-fun b!652242 () Bool)

(declare-fun Unit!22300 () Unit!22296)

(assert (=> b!652242 (= e!374337 Unit!22300)))

(assert (=> b!652242 false))

(declare-fun b!652243 () Bool)

(declare-fun res!422933 () Bool)

(assert (=> b!652243 (=> (not res!422933) (not e!374343))))

(assert (=> b!652243 (= res!422933 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18505 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652244 () Bool)

(assert (=> b!652244 (= e!374346 e!374343)))

(declare-fun res!422943 () Bool)

(assert (=> b!652244 (=> (not res!422943) (not e!374343))))

(declare-fun lt!303453 () SeekEntryResult!6945)

(assert (=> b!652244 (= res!422943 (or (= lt!303453 (MissingZero!6945 i!1108)) (= lt!303453 (MissingVacant!6945 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38604 (_ BitVec 32)) SeekEntryResult!6945)

(assert (=> b!652244 (= lt!303453 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652245 () Bool)

(declare-fun Unit!22301 () Unit!22296)

(assert (=> b!652245 (= e!374337 Unit!22301)))

(declare-fun b!652246 () Bool)

(assert (=> b!652246 (= e!374343 e!374340)))

(declare-fun res!422951 () Bool)

(assert (=> b!652246 (=> (not res!422951) (not e!374340))))

(assert (=> b!652246 (= res!422951 (= (select (store (arr!18505 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652246 (= lt!303449 (array!38605 (store (arr!18505 a!2986) i!1108 k0!1786) (size!18869 a!2986)))))

(declare-fun b!652247 () Bool)

(assert (=> b!652247 (= e!374334 (arrayContainsKey!0 lt!303449 (select (arr!18505 a!2986) j!136) index!984))))

(assert (= (and start!59104 res!422940) b!652231))

(assert (= (and b!652231 res!422936) b!652239))

(assert (= (and b!652239 res!422941) b!652237))

(assert (= (and b!652237 res!422938) b!652226))

(assert (= (and b!652226 res!422937) b!652244))

(assert (= (and b!652244 res!422943) b!652240))

(assert (= (and b!652240 res!422949) b!652227))

(assert (= (and b!652227 res!422946) b!652243))

(assert (= (and b!652243 res!422933) b!652246))

(assert (= (and b!652246 res!422951) b!652232))

(assert (= (and b!652232 res!422934) b!652230))

(assert (= (and b!652230 res!422945) b!652229))

(assert (= (and b!652230 c!75013) b!652242))

(assert (= (and b!652230 (not c!75013)) b!652245))

(assert (= (and b!652230 (not res!422939)) b!652236))

(assert (= (and b!652236 res!422948) b!652235))

(assert (= (and b!652235 (not res!422947)) b!652234))

(assert (= (and b!652234 res!422935) b!652247))

(assert (= (and b!652236 (not res!422942)) b!652238))

(assert (= (and b!652238 c!75014) b!652228))

(assert (= (and b!652238 (not c!75014)) b!652241))

(assert (= (and b!652238 (not res!422944)) b!652233))

(assert (= (and b!652233 res!422950) b!652225))

(declare-fun m!625369 () Bool)

(assert (=> start!59104 m!625369))

(declare-fun m!625371 () Bool)

(assert (=> start!59104 m!625371))

(declare-fun m!625373 () Bool)

(assert (=> b!652235 m!625373))

(assert (=> b!652225 m!625373))

(assert (=> b!652225 m!625373))

(declare-fun m!625375 () Bool)

(assert (=> b!652225 m!625375))

(declare-fun m!625377 () Bool)

(assert (=> b!652237 m!625377))

(assert (=> b!652247 m!625373))

(assert (=> b!652247 m!625373))

(assert (=> b!652247 m!625375))

(declare-fun m!625379 () Bool)

(assert (=> b!652246 m!625379))

(declare-fun m!625381 () Bool)

(assert (=> b!652246 m!625381))

(declare-fun m!625383 () Bool)

(assert (=> b!652230 m!625383))

(declare-fun m!625385 () Bool)

(assert (=> b!652230 m!625385))

(declare-fun m!625387 () Bool)

(assert (=> b!652230 m!625387))

(assert (=> b!652230 m!625373))

(assert (=> b!652230 m!625379))

(declare-fun m!625389 () Bool)

(assert (=> b!652230 m!625389))

(assert (=> b!652230 m!625373))

(declare-fun m!625391 () Bool)

(assert (=> b!652230 m!625391))

(declare-fun m!625393 () Bool)

(assert (=> b!652230 m!625393))

(declare-fun m!625395 () Bool)

(assert (=> b!652243 m!625395))

(assert (=> b!652239 m!625373))

(assert (=> b!652239 m!625373))

(declare-fun m!625397 () Bool)

(assert (=> b!652239 m!625397))

(declare-fun m!625399 () Bool)

(assert (=> b!652232 m!625399))

(assert (=> b!652232 m!625373))

(assert (=> b!652232 m!625373))

(declare-fun m!625401 () Bool)

(assert (=> b!652232 m!625401))

(assert (=> b!652234 m!625373))

(assert (=> b!652234 m!625373))

(declare-fun m!625403 () Bool)

(assert (=> b!652234 m!625403))

(declare-fun m!625405 () Bool)

(assert (=> b!652228 m!625405))

(declare-fun m!625407 () Bool)

(assert (=> b!652228 m!625407))

(assert (=> b!652228 m!625373))

(declare-fun m!625409 () Bool)

(assert (=> b!652228 m!625409))

(assert (=> b!652228 m!625373))

(declare-fun m!625411 () Bool)

(assert (=> b!652228 m!625411))

(declare-fun m!625413 () Bool)

(assert (=> b!652228 m!625413))

(declare-fun m!625415 () Bool)

(assert (=> b!652228 m!625415))

(assert (=> b!652228 m!625373))

(declare-fun m!625417 () Bool)

(assert (=> b!652228 m!625417))

(assert (=> b!652228 m!625373))

(declare-fun m!625419 () Bool)

(assert (=> b!652240 m!625419))

(declare-fun m!625421 () Bool)

(assert (=> b!652227 m!625421))

(assert (=> b!652233 m!625373))

(assert (=> b!652233 m!625373))

(declare-fun m!625423 () Bool)

(assert (=> b!652233 m!625423))

(declare-fun m!625425 () Bool)

(assert (=> b!652233 m!625425))

(declare-fun m!625427 () Bool)

(assert (=> b!652233 m!625427))

(assert (=> b!652233 m!625373))

(declare-fun m!625429 () Bool)

(assert (=> b!652233 m!625429))

(assert (=> b!652233 m!625415))

(assert (=> b!652233 m!625405))

(assert (=> b!652233 m!625373))

(assert (=> b!652233 m!625403))

(declare-fun m!625431 () Bool)

(assert (=> b!652244 m!625431))

(assert (=> b!652236 m!625373))

(assert (=> b!652236 m!625379))

(declare-fun m!625433 () Bool)

(assert (=> b!652236 m!625433))

(declare-fun m!625435 () Bool)

(assert (=> b!652226 m!625435))

(check-sat (not b!652228) (not b!652239) (not b!652230) (not b!652234) (not b!652226) (not start!59104) (not b!652232) (not b!652247) (not b!652240) (not b!652237) (not b!652233) (not b!652227) (not b!652225) (not b!652244))
(check-sat)
