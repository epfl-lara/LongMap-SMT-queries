; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56202 () Bool)

(assert start!56202)

(declare-fun b!621194 () Bool)

(declare-datatypes ((Unit!20677 0))(
  ( (Unit!20678) )
))
(declare-fun e!356300 () Unit!20677)

(declare-fun Unit!20679 () Unit!20677)

(assert (=> b!621194 (= e!356300 Unit!20679)))

(declare-fun b!621195 () Bool)

(declare-fun res!400276 () Bool)

(declare-fun e!356295 () Bool)

(assert (=> b!621195 (=> (not res!400276) (not e!356295))))

(declare-datatypes ((array!37617 0))(
  ( (array!37618 (arr!18052 (Array (_ BitVec 32) (_ BitVec 64))) (size!18416 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37617)

(declare-datatypes ((List!12000 0))(
  ( (Nil!11997) (Cons!11996 (h!13044 (_ BitVec 64)) (t!18220 List!12000)) )
))
(declare-fun arrayNoDuplicates!0 (array!37617 (_ BitVec 32) List!12000) Bool)

(assert (=> b!621195 (= res!400276 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11997))))

(declare-fun b!621196 () Bool)

(declare-fun res!400272 () Bool)

(declare-fun e!356299 () Bool)

(assert (=> b!621196 (=> (not res!400272) (not e!356299))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621196 (= res!400272 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621197 () Bool)

(assert (=> b!621197 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!287297 () array!37617)

(declare-fun lt!287298 () Unit!20677)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37617 (_ BitVec 64) (_ BitVec 32) List!12000) Unit!20677)

(assert (=> b!621197 (= lt!287298 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287297 (select (arr!18052 a!2986) j!136) j!136 Nil!11997))))

(assert (=> b!621197 (arrayNoDuplicates!0 lt!287297 j!136 Nil!11997)))

(declare-fun lt!287287 () Unit!20677)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37617 (_ BitVec 32) (_ BitVec 32)) Unit!20677)

(assert (=> b!621197 (= lt!287287 (lemmaNoDuplicateFromThenFromBigger!0 lt!287297 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621197 (arrayNoDuplicates!0 lt!287297 #b00000000000000000000000000000000 Nil!11997)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!287291 () Unit!20677)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37617 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12000) Unit!20677)

(assert (=> b!621197 (= lt!287291 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11997))))

(assert (=> b!621197 (arrayContainsKey!0 lt!287297 (select (arr!18052 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287295 () Unit!20677)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37617 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20677)

(assert (=> b!621197 (= lt!287295 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287297 (select (arr!18052 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356305 () Unit!20677)

(declare-fun Unit!20680 () Unit!20677)

(assert (=> b!621197 (= e!356305 Unit!20680)))

(declare-fun e!356296 () Bool)

(declare-fun b!621198 () Bool)

(assert (=> b!621198 (= e!356296 (arrayContainsKey!0 lt!287297 (select (arr!18052 a!2986) j!136) index!984))))

(declare-fun res!400267 () Bool)

(declare-fun b!621199 () Bool)

(assert (=> b!621199 (= res!400267 (arrayContainsKey!0 lt!287297 (select (arr!18052 a!2986) j!136) j!136))))

(declare-fun e!356307 () Bool)

(assert (=> b!621199 (=> (not res!400267) (not e!356307))))

(declare-fun e!356306 () Bool)

(assert (=> b!621199 (= e!356306 e!356307)))

(declare-fun b!621200 () Bool)

(declare-fun e!356301 () Bool)

(assert (=> b!621200 (= e!356301 (not true))))

(declare-fun lt!287296 () Unit!20677)

(declare-fun e!356297 () Unit!20677)

(assert (=> b!621200 (= lt!287296 e!356297)))

(declare-fun c!70834 () Bool)

(declare-datatypes ((SeekEntryResult!6448 0))(
  ( (MissingZero!6448 (index!28076 (_ BitVec 32))) (Found!6448 (index!28077 (_ BitVec 32))) (Intermediate!6448 (undefined!7260 Bool) (index!28078 (_ BitVec 32)) (x!57003 (_ BitVec 32))) (Undefined!6448) (MissingVacant!6448 (index!28079 (_ BitVec 32))) )
))
(declare-fun lt!287299 () SeekEntryResult!6448)

(assert (=> b!621200 (= c!70834 (= lt!287299 (Found!6448 index!984)))))

(declare-fun lt!287280 () Unit!20677)

(assert (=> b!621200 (= lt!287280 e!356300)))

(declare-fun c!70833 () Bool)

(assert (=> b!621200 (= c!70833 (= lt!287299 Undefined!6448))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!287286 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37617 (_ BitVec 32)) SeekEntryResult!6448)

(assert (=> b!621200 (= lt!287299 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287286 lt!287297 mask!3053))))

(declare-fun e!356303 () Bool)

(assert (=> b!621200 e!356303))

(declare-fun res!400282 () Bool)

(assert (=> b!621200 (=> (not res!400282) (not e!356303))))

(declare-fun lt!287292 () SeekEntryResult!6448)

(declare-fun lt!287293 () (_ BitVec 32))

(assert (=> b!621200 (= res!400282 (= lt!287292 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287293 vacantSpotIndex!68 lt!287286 lt!287297 mask!3053)))))

(assert (=> b!621200 (= lt!287292 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287293 vacantSpotIndex!68 (select (arr!18052 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621200 (= lt!287286 (select (store (arr!18052 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287289 () Unit!20677)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20677)

(assert (=> b!621200 (= lt!287289 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287293 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621200 (= lt!287293 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!621201 () Bool)

(declare-fun res!400281 () Bool)

(assert (=> b!621201 (= res!400281 (bvsge j!136 index!984))))

(assert (=> b!621201 (=> res!400281 e!356306)))

(declare-fun e!356298 () Bool)

(assert (=> b!621201 (= e!356298 e!356306)))

(declare-fun res!400273 () Bool)

(assert (=> start!56202 (=> (not res!400273) (not e!356299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56202 (= res!400273 (validMask!0 mask!3053))))

(assert (=> start!56202 e!356299))

(assert (=> start!56202 true))

(declare-fun array_inv!13911 (array!37617) Bool)

(assert (=> start!56202 (array_inv!13911 a!2986)))

(declare-fun b!621202 () Bool)

(declare-fun e!356294 () Bool)

(assert (=> b!621202 (= e!356294 e!356301)))

(declare-fun res!400270 () Bool)

(assert (=> b!621202 (=> (not res!400270) (not e!356301))))

(declare-fun lt!287284 () SeekEntryResult!6448)

(assert (=> b!621202 (= res!400270 (and (= lt!287284 (Found!6448 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18052 a!2986) index!984) (select (arr!18052 a!2986) j!136))) (not (= (select (arr!18052 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621202 (= lt!287284 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18052 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621203 () Bool)

(declare-fun res!400275 () Bool)

(assert (=> b!621203 (=> (not res!400275) (not e!356299))))

(assert (=> b!621203 (= res!400275 (and (= (size!18416 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18416 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18416 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621204 () Bool)

(declare-fun Unit!20681 () Unit!20677)

(assert (=> b!621204 (= e!356297 Unit!20681)))

(declare-fun b!621205 () Bool)

(declare-fun res!400279 () Bool)

(assert (=> b!621205 (=> (not res!400279) (not e!356299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621205 (= res!400279 (validKeyInArray!0 k0!1786))))

(declare-fun b!621206 () Bool)

(declare-fun Unit!20682 () Unit!20677)

(assert (=> b!621206 (= e!356300 Unit!20682)))

(assert (=> b!621206 false))

(declare-fun b!621207 () Bool)

(declare-fun res!400269 () Bool)

(assert (=> b!621207 (=> (not res!400269) (not e!356295))))

(assert (=> b!621207 (= res!400269 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18052 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621208 () Bool)

(declare-fun Unit!20683 () Unit!20677)

(assert (=> b!621208 (= e!356305 Unit!20683)))

(declare-fun b!621209 () Bool)

(assert (=> b!621209 (= e!356295 e!356294)))

(declare-fun res!400268 () Bool)

(assert (=> b!621209 (=> (not res!400268) (not e!356294))))

(assert (=> b!621209 (= res!400268 (= (select (store (arr!18052 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621209 (= lt!287297 (array!37618 (store (arr!18052 a!2986) i!1108 k0!1786) (size!18416 a!2986)))))

(declare-fun b!621210 () Bool)

(declare-fun Unit!20684 () Unit!20677)

(assert (=> b!621210 (= e!356297 Unit!20684)))

(declare-fun res!400271 () Bool)

(assert (=> b!621210 (= res!400271 (= (select (store (arr!18052 a!2986) i!1108 k0!1786) index!984) (select (arr!18052 a!2986) j!136)))))

(assert (=> b!621210 (=> (not res!400271) (not e!356298))))

(assert (=> b!621210 e!356298))

(declare-fun c!70832 () Bool)

(assert (=> b!621210 (= c!70832 (bvslt j!136 index!984))))

(declare-fun lt!287290 () Unit!20677)

(assert (=> b!621210 (= lt!287290 e!356305)))

(declare-fun c!70835 () Bool)

(assert (=> b!621210 (= c!70835 (bvslt index!984 j!136))))

(declare-fun lt!287294 () Unit!20677)

(declare-fun e!356302 () Unit!20677)

(assert (=> b!621210 (= lt!287294 e!356302)))

(assert (=> b!621210 false))

(declare-fun b!621211 () Bool)

(declare-fun res!400277 () Bool)

(assert (=> b!621211 (=> (not res!400277) (not e!356299))))

(assert (=> b!621211 (= res!400277 (validKeyInArray!0 (select (arr!18052 a!2986) j!136)))))

(declare-fun b!621212 () Bool)

(assert (=> b!621212 false))

(declare-fun lt!287281 () Unit!20677)

(assert (=> b!621212 (= lt!287281 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287297 (select (arr!18052 a!2986) j!136) index!984 Nil!11997))))

(assert (=> b!621212 (arrayNoDuplicates!0 lt!287297 index!984 Nil!11997)))

(declare-fun lt!287288 () Unit!20677)

(assert (=> b!621212 (= lt!287288 (lemmaNoDuplicateFromThenFromBigger!0 lt!287297 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621212 (arrayNoDuplicates!0 lt!287297 #b00000000000000000000000000000000 Nil!11997)))

(declare-fun lt!287282 () Unit!20677)

(assert (=> b!621212 (= lt!287282 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11997))))

(assert (=> b!621212 (arrayContainsKey!0 lt!287297 (select (arr!18052 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287283 () Unit!20677)

(assert (=> b!621212 (= lt!287283 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287297 (select (arr!18052 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621212 e!356296))

(declare-fun res!400274 () Bool)

(assert (=> b!621212 (=> (not res!400274) (not e!356296))))

(assert (=> b!621212 (= res!400274 (arrayContainsKey!0 lt!287297 (select (arr!18052 a!2986) j!136) j!136))))

(declare-fun Unit!20685 () Unit!20677)

(assert (=> b!621212 (= e!356302 Unit!20685)))

(declare-fun b!621213 () Bool)

(assert (=> b!621213 (= e!356303 (= lt!287284 lt!287292))))

(declare-fun b!621214 () Bool)

(declare-fun res!400278 () Bool)

(assert (=> b!621214 (=> (not res!400278) (not e!356295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37617 (_ BitVec 32)) Bool)

(assert (=> b!621214 (= res!400278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621215 () Bool)

(declare-fun Unit!20686 () Unit!20677)

(assert (=> b!621215 (= e!356302 Unit!20686)))

(declare-fun b!621216 () Bool)

(assert (=> b!621216 (= e!356299 e!356295)))

(declare-fun res!400280 () Bool)

(assert (=> b!621216 (=> (not res!400280) (not e!356295))))

(declare-fun lt!287285 () SeekEntryResult!6448)

(assert (=> b!621216 (= res!400280 (or (= lt!287285 (MissingZero!6448 i!1108)) (= lt!287285 (MissingVacant!6448 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37617 (_ BitVec 32)) SeekEntryResult!6448)

(assert (=> b!621216 (= lt!287285 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621217 () Bool)

(assert (=> b!621217 (= e!356307 (arrayContainsKey!0 lt!287297 (select (arr!18052 a!2986) j!136) index!984))))

(assert (= (and start!56202 res!400273) b!621203))

(assert (= (and b!621203 res!400275) b!621211))

(assert (= (and b!621211 res!400277) b!621205))

(assert (= (and b!621205 res!400279) b!621196))

(assert (= (and b!621196 res!400272) b!621216))

(assert (= (and b!621216 res!400280) b!621214))

(assert (= (and b!621214 res!400278) b!621195))

(assert (= (and b!621195 res!400276) b!621207))

(assert (= (and b!621207 res!400269) b!621209))

(assert (= (and b!621209 res!400268) b!621202))

(assert (= (and b!621202 res!400270) b!621200))

(assert (= (and b!621200 res!400282) b!621213))

(assert (= (and b!621200 c!70833) b!621206))

(assert (= (and b!621200 (not c!70833)) b!621194))

(assert (= (and b!621200 c!70834) b!621210))

(assert (= (and b!621200 (not c!70834)) b!621204))

(assert (= (and b!621210 res!400271) b!621201))

(assert (= (and b!621201 (not res!400281)) b!621199))

(assert (= (and b!621199 res!400267) b!621217))

(assert (= (and b!621210 c!70832) b!621197))

(assert (= (and b!621210 (not c!70832)) b!621208))

(assert (= (and b!621210 c!70835) b!621212))

(assert (= (and b!621210 (not c!70835)) b!621215))

(assert (= (and b!621212 res!400274) b!621198))

(declare-fun m!597377 () Bool)

(assert (=> b!621200 m!597377))

(declare-fun m!597379 () Bool)

(assert (=> b!621200 m!597379))

(declare-fun m!597381 () Bool)

(assert (=> b!621200 m!597381))

(assert (=> b!621200 m!597379))

(declare-fun m!597383 () Bool)

(assert (=> b!621200 m!597383))

(declare-fun m!597385 () Bool)

(assert (=> b!621200 m!597385))

(declare-fun m!597387 () Bool)

(assert (=> b!621200 m!597387))

(declare-fun m!597389 () Bool)

(assert (=> b!621200 m!597389))

(declare-fun m!597391 () Bool)

(assert (=> b!621200 m!597391))

(assert (=> b!621198 m!597379))

(assert (=> b!621198 m!597379))

(declare-fun m!597393 () Bool)

(assert (=> b!621198 m!597393))

(assert (=> b!621210 m!597381))

(declare-fun m!597395 () Bool)

(assert (=> b!621210 m!597395))

(assert (=> b!621210 m!597379))

(assert (=> b!621197 m!597379))

(declare-fun m!597397 () Bool)

(assert (=> b!621197 m!597397))

(declare-fun m!597399 () Bool)

(assert (=> b!621197 m!597399))

(assert (=> b!621197 m!597379))

(declare-fun m!597401 () Bool)

(assert (=> b!621197 m!597401))

(assert (=> b!621197 m!597379))

(declare-fun m!597403 () Bool)

(assert (=> b!621197 m!597403))

(declare-fun m!597405 () Bool)

(assert (=> b!621197 m!597405))

(assert (=> b!621197 m!597379))

(declare-fun m!597407 () Bool)

(assert (=> b!621197 m!597407))

(declare-fun m!597409 () Bool)

(assert (=> b!621197 m!597409))

(declare-fun m!597411 () Bool)

(assert (=> b!621195 m!597411))

(declare-fun m!597413 () Bool)

(assert (=> b!621202 m!597413))

(assert (=> b!621202 m!597379))

(assert (=> b!621202 m!597379))

(declare-fun m!597415 () Bool)

(assert (=> b!621202 m!597415))

(assert (=> b!621211 m!597379))

(assert (=> b!621211 m!597379))

(declare-fun m!597417 () Bool)

(assert (=> b!621211 m!597417))

(declare-fun m!597419 () Bool)

(assert (=> b!621216 m!597419))

(declare-fun m!597421 () Bool)

(assert (=> b!621205 m!597421))

(assert (=> b!621209 m!597381))

(declare-fun m!597423 () Bool)

(assert (=> b!621209 m!597423))

(assert (=> b!621217 m!597379))

(assert (=> b!621217 m!597379))

(assert (=> b!621217 m!597393))

(declare-fun m!597425 () Bool)

(assert (=> b!621214 m!597425))

(assert (=> b!621212 m!597379))

(declare-fun m!597427 () Bool)

(assert (=> b!621212 m!597427))

(assert (=> b!621212 m!597379))

(assert (=> b!621212 m!597379))

(declare-fun m!597429 () Bool)

(assert (=> b!621212 m!597429))

(assert (=> b!621212 m!597379))

(declare-fun m!597431 () Bool)

(assert (=> b!621212 m!597431))

(assert (=> b!621212 m!597379))

(declare-fun m!597433 () Bool)

(assert (=> b!621212 m!597433))

(assert (=> b!621212 m!597405))

(declare-fun m!597435 () Bool)

(assert (=> b!621212 m!597435))

(declare-fun m!597437 () Bool)

(assert (=> b!621212 m!597437))

(assert (=> b!621212 m!597409))

(declare-fun m!597439 () Bool)

(assert (=> b!621196 m!597439))

(assert (=> b!621199 m!597379))

(assert (=> b!621199 m!597379))

(assert (=> b!621199 m!597429))

(declare-fun m!597441 () Bool)

(assert (=> start!56202 m!597441))

(declare-fun m!597443 () Bool)

(assert (=> start!56202 m!597443))

(declare-fun m!597445 () Bool)

(assert (=> b!621207 m!597445))

(check-sat (not b!621217) (not start!56202) (not b!621202) (not b!621212) (not b!621197) (not b!621195) (not b!621196) (not b!621198) (not b!621211) (not b!621214) (not b!621205) (not b!621199) (not b!621216) (not b!621200))
(check-sat)
