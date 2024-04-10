; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59002 () Bool)

(assert start!59002)

(declare-fun b!651256 () Bool)

(declare-datatypes ((Unit!22242 0))(
  ( (Unit!22243) )
))
(declare-fun e!373690 () Unit!22242)

(declare-fun Unit!22244 () Unit!22242)

(assert (=> b!651256 (= e!373690 Unit!22244)))

(assert (=> b!651256 false))

(declare-fun b!651257 () Bool)

(declare-fun e!373700 () Bool)

(declare-fun e!373695 () Bool)

(assert (=> b!651257 (= e!373700 e!373695)))

(declare-fun res!422306 () Bool)

(assert (=> b!651257 (=> res!422306 e!373695)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!302804 () (_ BitVec 64))

(declare-datatypes ((array!38583 0))(
  ( (array!38584 (arr!18496 (Array (_ BitVec 32) (_ BitVec 64))) (size!18860 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38583)

(declare-fun lt!302812 () (_ BitVec 64))

(assert (=> b!651257 (= res!422306 (or (not (= (select (arr!18496 a!2986) j!136) lt!302812)) (not (= (select (arr!18496 a!2986) j!136) lt!302804))))))

(declare-fun e!373689 () Bool)

(assert (=> b!651257 e!373689))

(declare-fun res!422304 () Bool)

(assert (=> b!651257 (=> (not res!422304) (not e!373689))))

(assert (=> b!651257 (= res!422304 (= lt!302804 (select (arr!18496 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!651257 (= lt!302804 (select (store (arr!18496 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!651259 () Bool)

(declare-fun e!373693 () Bool)

(declare-fun e!373697 () Bool)

(assert (=> b!651259 (= e!373693 e!373697)))

(declare-fun res!422305 () Bool)

(assert (=> b!651259 (=> (not res!422305) (not e!373697))))

(declare-datatypes ((SeekEntryResult!6936 0))(
  ( (MissingZero!6936 (index!30094 (_ BitVec 32))) (Found!6936 (index!30095 (_ BitVec 32))) (Intermediate!6936 (undefined!7748 Bool) (index!30096 (_ BitVec 32)) (x!58878 (_ BitVec 32))) (Undefined!6936) (MissingVacant!6936 (index!30097 (_ BitVec 32))) )
))
(declare-fun lt!302819 () SeekEntryResult!6936)

(assert (=> b!651259 (= res!422305 (or (= lt!302819 (MissingZero!6936 i!1108)) (= lt!302819 (MissingVacant!6936 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38583 (_ BitVec 32)) SeekEntryResult!6936)

(assert (=> b!651259 (= lt!302819 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!651260 () Bool)

(declare-fun res!422291 () Bool)

(assert (=> b!651260 (=> (not res!422291) (not e!373697))))

(declare-datatypes ((List!12537 0))(
  ( (Nil!12534) (Cons!12533 (h!13578 (_ BitVec 64)) (t!18765 List!12537)) )
))
(declare-fun arrayNoDuplicates!0 (array!38583 (_ BitVec 32) List!12537) Bool)

(assert (=> b!651260 (= res!422291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12534))))

(declare-fun b!651261 () Bool)

(declare-fun e!373691 () Bool)

(declare-fun e!373699 () Bool)

(assert (=> b!651261 (= e!373691 e!373699)))

(declare-fun res!422289 () Bool)

(assert (=> b!651261 (=> (not res!422289) (not e!373699))))

(declare-fun lt!302807 () SeekEntryResult!6936)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!651261 (= res!422289 (and (= lt!302807 (Found!6936 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18496 a!2986) index!984) (select (arr!18496 a!2986) j!136))) (not (= (select (arr!18496 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38583 (_ BitVec 32)) SeekEntryResult!6936)

(assert (=> b!651261 (= lt!302807 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651262 () Bool)

(declare-fun res!422295 () Bool)

(assert (=> b!651262 (=> (not res!422295) (not e!373693))))

(assert (=> b!651262 (= res!422295 (and (= (size!18860 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18860 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18860 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!651263 () Bool)

(declare-fun e!373687 () Bool)

(declare-fun lt!302817 () SeekEntryResult!6936)

(assert (=> b!651263 (= e!373687 (= lt!302807 lt!302817))))

(declare-fun lt!302808 () array!38583)

(declare-fun b!651264 () Bool)

(declare-fun e!373696 () Bool)

(declare-fun arrayContainsKey!0 (array!38583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!651264 (= e!373696 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) index!984))))

(declare-fun b!651265 () Bool)

(declare-fun e!373694 () Unit!22242)

(declare-fun Unit!22245 () Unit!22242)

(assert (=> b!651265 (= e!373694 Unit!22245)))

(declare-fun lt!302820 () Unit!22242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22242)

(assert (=> b!651265 (= lt!302820 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302808 (select (arr!18496 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!651265 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302809 () Unit!22242)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12537) Unit!22242)

(assert (=> b!651265 (= lt!302809 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12534))))

(assert (=> b!651265 (arrayNoDuplicates!0 lt!302808 #b00000000000000000000000000000000 Nil!12534)))

(declare-fun lt!302813 () Unit!22242)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38583 (_ BitVec 32) (_ BitVec 32)) Unit!22242)

(assert (=> b!651265 (= lt!302813 (lemmaNoDuplicateFromThenFromBigger!0 lt!302808 #b00000000000000000000000000000000 j!136))))

(assert (=> b!651265 (arrayNoDuplicates!0 lt!302808 j!136 Nil!12534)))

(declare-fun lt!302816 () Unit!22242)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38583 (_ BitVec 64) (_ BitVec 32) List!12537) Unit!22242)

(assert (=> b!651265 (= lt!302816 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136 Nil!12534))))

(assert (=> b!651265 false))

(declare-fun e!373698 () Bool)

(declare-fun b!651266 () Bool)

(assert (=> b!651266 (= e!373698 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) index!984))))

(declare-fun b!651267 () Bool)

(declare-fun e!373701 () Bool)

(assert (=> b!651267 (= e!373695 e!373701)))

(declare-fun res!422303 () Bool)

(assert (=> b!651267 (=> res!422303 e!373701)))

(assert (=> b!651267 (= res!422303 (bvsge index!984 j!136))))

(declare-fun lt!302815 () Unit!22242)

(assert (=> b!651267 (= lt!302815 e!373694)))

(declare-fun c!74851 () Bool)

(assert (=> b!651267 (= c!74851 (bvslt j!136 index!984))))

(declare-fun b!651258 () Bool)

(declare-fun res!422298 () Bool)

(assert (=> b!651258 (=> (not res!422298) (not e!373697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38583 (_ BitVec 32)) Bool)

(assert (=> b!651258 (= res!422298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!422300 () Bool)

(assert (=> start!59002 (=> (not res!422300) (not e!373693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59002 (= res!422300 (validMask!0 mask!3053))))

(assert (=> start!59002 e!373693))

(assert (=> start!59002 true))

(declare-fun array_inv!14292 (array!38583) Bool)

(assert (=> start!59002 (array_inv!14292 a!2986)))

(declare-fun b!651268 () Bool)

(declare-fun Unit!22246 () Unit!22242)

(assert (=> b!651268 (= e!373694 Unit!22246)))

(declare-fun b!651269 () Bool)

(declare-fun e!373688 () Bool)

(assert (=> b!651269 (= e!373689 e!373688)))

(declare-fun res!422288 () Bool)

(assert (=> b!651269 (=> res!422288 e!373688)))

(assert (=> b!651269 (= res!422288 (or (not (= (select (arr!18496 a!2986) j!136) lt!302812)) (not (= (select (arr!18496 a!2986) j!136) lt!302804)) (bvsge j!136 index!984)))))

(declare-fun b!651270 () Bool)

(assert (=> b!651270 (= e!373699 (not e!373700))))

(declare-fun res!422297 () Bool)

(assert (=> b!651270 (=> res!422297 e!373700)))

(declare-fun lt!302811 () SeekEntryResult!6936)

(assert (=> b!651270 (= res!422297 (not (= lt!302811 (Found!6936 index!984))))))

(declare-fun lt!302821 () Unit!22242)

(assert (=> b!651270 (= lt!302821 e!373690)))

(declare-fun c!74852 () Bool)

(assert (=> b!651270 (= c!74852 (= lt!302811 Undefined!6936))))

(assert (=> b!651270 (= lt!302811 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302812 lt!302808 mask!3053))))

(assert (=> b!651270 e!373687))

(declare-fun res!422290 () Bool)

(assert (=> b!651270 (=> (not res!422290) (not e!373687))))

(declare-fun lt!302810 () (_ BitVec 32))

(assert (=> b!651270 (= res!422290 (= lt!302817 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 lt!302812 lt!302808 mask!3053)))))

(assert (=> b!651270 (= lt!302817 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!651270 (= lt!302812 (select (store (arr!18496 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!302818 () Unit!22242)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38583 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22242)

(assert (=> b!651270 (= lt!302818 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!651270 (= lt!302810 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!651271 () Bool)

(declare-fun res!422299 () Bool)

(assert (=> b!651271 (=> (not res!422299) (not e!373693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!651271 (= res!422299 (validKeyInArray!0 (select (arr!18496 a!2986) j!136)))))

(declare-fun b!651272 () Bool)

(declare-fun Unit!22247 () Unit!22242)

(assert (=> b!651272 (= e!373690 Unit!22247)))

(declare-fun b!651273 () Bool)

(assert (=> b!651273 (= e!373697 e!373691)))

(declare-fun res!422296 () Bool)

(assert (=> b!651273 (=> (not res!422296) (not e!373691))))

(assert (=> b!651273 (= res!422296 (= (select (store (arr!18496 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!651273 (= lt!302808 (array!38584 (store (arr!18496 a!2986) i!1108 k0!1786) (size!18860 a!2986)))))

(declare-fun b!651274 () Bool)

(assert (=> b!651274 (= e!373701 (bvslt (size!18860 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!651274 (arrayNoDuplicates!0 lt!302808 index!984 Nil!12534)))

(declare-fun lt!302806 () Unit!22242)

(assert (=> b!651274 (= lt!302806 (lemmaNoDuplicateFromThenFromBigger!0 lt!302808 #b00000000000000000000000000000000 index!984))))

(assert (=> b!651274 (arrayNoDuplicates!0 lt!302808 #b00000000000000000000000000000000 Nil!12534)))

(declare-fun lt!302814 () Unit!22242)

(assert (=> b!651274 (= lt!302814 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12534))))

(assert (=> b!651274 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302805 () Unit!22242)

(assert (=> b!651274 (= lt!302805 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!651274 e!373696))

(declare-fun res!422301 () Bool)

(assert (=> b!651274 (=> (not res!422301) (not e!373696))))

(assert (=> b!651274 (= res!422301 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136))))

(declare-fun b!651275 () Bool)

(declare-fun res!422292 () Bool)

(assert (=> b!651275 (=> (not res!422292) (not e!373697))))

(assert (=> b!651275 (= res!422292 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18496 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!651276 () Bool)

(declare-fun res!422293 () Bool)

(assert (=> b!651276 (=> (not res!422293) (not e!373693))))

(assert (=> b!651276 (= res!422293 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!651277 () Bool)

(assert (=> b!651277 (= e!373688 e!373698)))

(declare-fun res!422294 () Bool)

(assert (=> b!651277 (=> (not res!422294) (not e!373698))))

(assert (=> b!651277 (= res!422294 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136))))

(declare-fun b!651278 () Bool)

(declare-fun res!422302 () Bool)

(assert (=> b!651278 (=> (not res!422302) (not e!373693))))

(assert (=> b!651278 (= res!422302 (validKeyInArray!0 k0!1786))))

(assert (= (and start!59002 res!422300) b!651262))

(assert (= (and b!651262 res!422295) b!651271))

(assert (= (and b!651271 res!422299) b!651278))

(assert (= (and b!651278 res!422302) b!651276))

(assert (= (and b!651276 res!422293) b!651259))

(assert (= (and b!651259 res!422305) b!651258))

(assert (= (and b!651258 res!422298) b!651260))

(assert (= (and b!651260 res!422291) b!651275))

(assert (= (and b!651275 res!422292) b!651273))

(assert (= (and b!651273 res!422296) b!651261))

(assert (= (and b!651261 res!422289) b!651270))

(assert (= (and b!651270 res!422290) b!651263))

(assert (= (and b!651270 c!74852) b!651256))

(assert (= (and b!651270 (not c!74852)) b!651272))

(assert (= (and b!651270 (not res!422297)) b!651257))

(assert (= (and b!651257 res!422304) b!651269))

(assert (= (and b!651269 (not res!422288)) b!651277))

(assert (= (and b!651277 res!422294) b!651266))

(assert (= (and b!651257 (not res!422306)) b!651267))

(assert (= (and b!651267 c!74851) b!651265))

(assert (= (and b!651267 (not c!74851)) b!651268))

(assert (= (and b!651267 (not res!422303)) b!651274))

(assert (= (and b!651274 res!422301) b!651264))

(declare-fun m!624403 () Bool)

(assert (=> b!651261 m!624403))

(declare-fun m!624405 () Bool)

(assert (=> b!651261 m!624405))

(assert (=> b!651261 m!624405))

(declare-fun m!624407 () Bool)

(assert (=> b!651261 m!624407))

(declare-fun m!624409 () Bool)

(assert (=> b!651259 m!624409))

(assert (=> b!651264 m!624405))

(assert (=> b!651264 m!624405))

(declare-fun m!624411 () Bool)

(assert (=> b!651264 m!624411))

(declare-fun m!624413 () Bool)

(assert (=> b!651278 m!624413))

(assert (=> b!651271 m!624405))

(assert (=> b!651271 m!624405))

(declare-fun m!624415 () Bool)

(assert (=> b!651271 m!624415))

(declare-fun m!624417 () Bool)

(assert (=> b!651258 m!624417))

(assert (=> b!651266 m!624405))

(assert (=> b!651266 m!624405))

(assert (=> b!651266 m!624411))

(assert (=> b!651269 m!624405))

(declare-fun m!624419 () Bool)

(assert (=> start!59002 m!624419))

(declare-fun m!624421 () Bool)

(assert (=> start!59002 m!624421))

(assert (=> b!651265 m!624405))

(declare-fun m!624423 () Bool)

(assert (=> b!651265 m!624423))

(declare-fun m!624425 () Bool)

(assert (=> b!651265 m!624425))

(assert (=> b!651265 m!624405))

(assert (=> b!651265 m!624405))

(declare-fun m!624427 () Bool)

(assert (=> b!651265 m!624427))

(declare-fun m!624429 () Bool)

(assert (=> b!651265 m!624429))

(assert (=> b!651265 m!624405))

(declare-fun m!624431 () Bool)

(assert (=> b!651265 m!624431))

(declare-fun m!624433 () Bool)

(assert (=> b!651265 m!624433))

(declare-fun m!624435 () Bool)

(assert (=> b!651265 m!624435))

(declare-fun m!624437 () Bool)

(assert (=> b!651275 m!624437))

(declare-fun m!624439 () Bool)

(assert (=> b!651260 m!624439))

(assert (=> b!651257 m!624405))

(declare-fun m!624441 () Bool)

(assert (=> b!651257 m!624441))

(declare-fun m!624443 () Bool)

(assert (=> b!651257 m!624443))

(assert (=> b!651273 m!624441))

(declare-fun m!624445 () Bool)

(assert (=> b!651273 m!624445))

(declare-fun m!624447 () Bool)

(assert (=> b!651276 m!624447))

(declare-fun m!624449 () Bool)

(assert (=> b!651270 m!624449))

(assert (=> b!651270 m!624405))

(assert (=> b!651270 m!624441))

(assert (=> b!651270 m!624405))

(declare-fun m!624451 () Bool)

(assert (=> b!651270 m!624451))

(declare-fun m!624453 () Bool)

(assert (=> b!651270 m!624453))

(declare-fun m!624455 () Bool)

(assert (=> b!651270 m!624455))

(declare-fun m!624457 () Bool)

(assert (=> b!651270 m!624457))

(declare-fun m!624459 () Bool)

(assert (=> b!651270 m!624459))

(assert (=> b!651274 m!624405))

(assert (=> b!651274 m!624405))

(declare-fun m!624461 () Bool)

(assert (=> b!651274 m!624461))

(declare-fun m!624463 () Bool)

(assert (=> b!651274 m!624463))

(assert (=> b!651274 m!624405))

(declare-fun m!624465 () Bool)

(assert (=> b!651274 m!624465))

(assert (=> b!651274 m!624405))

(declare-fun m!624467 () Bool)

(assert (=> b!651274 m!624467))

(declare-fun m!624469 () Bool)

(assert (=> b!651274 m!624469))

(assert (=> b!651274 m!624433))

(assert (=> b!651274 m!624435))

(assert (=> b!651277 m!624405))

(assert (=> b!651277 m!624405))

(assert (=> b!651277 m!624461))

(check-sat (not start!59002) (not b!651258) (not b!651271) (not b!651278) (not b!651265) (not b!651266) (not b!651264) (not b!651274) (not b!651276) (not b!651261) (not b!651259) (not b!651260) (not b!651270) (not b!651277))
(check-sat)
(get-model)

(declare-fun b!651360 () Bool)

(declare-fun e!373754 () SeekEntryResult!6936)

(assert (=> b!651360 (= e!373754 (MissingVacant!6936 vacantSpotIndex!68))))

(declare-fun b!651361 () Bool)

(assert (=> b!651361 (= e!373754 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651362 () Bool)

(declare-fun c!74867 () Bool)

(declare-fun lt!302881 () (_ BitVec 64))

(assert (=> b!651362 (= c!74867 (= lt!302881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373753 () SeekEntryResult!6936)

(assert (=> b!651362 (= e!373753 e!373754)))

(declare-fun lt!302880 () SeekEntryResult!6936)

(declare-fun d!92049 () Bool)

(get-info :version)

(assert (=> d!92049 (and (or ((_ is Undefined!6936) lt!302880) (not ((_ is Found!6936) lt!302880)) (and (bvsge (index!30095 lt!302880) #b00000000000000000000000000000000) (bvslt (index!30095 lt!302880) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302880) ((_ is Found!6936) lt!302880) (not ((_ is MissingVacant!6936) lt!302880)) (not (= (index!30097 lt!302880) vacantSpotIndex!68)) (and (bvsge (index!30097 lt!302880) #b00000000000000000000000000000000) (bvslt (index!30097 lt!302880) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302880) (ite ((_ is Found!6936) lt!302880) (= (select (arr!18496 a!2986) (index!30095 lt!302880)) (select (arr!18496 a!2986) j!136)) (and ((_ is MissingVacant!6936) lt!302880) (= (index!30097 lt!302880) vacantSpotIndex!68) (= (select (arr!18496 a!2986) (index!30097 lt!302880)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373755 () SeekEntryResult!6936)

(assert (=> d!92049 (= lt!302880 e!373755)))

(declare-fun c!74865 () Bool)

(assert (=> d!92049 (= c!74865 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92049 (= lt!302881 (select (arr!18496 a!2986) index!984))))

(assert (=> d!92049 (validMask!0 mask!3053)))

(assert (=> d!92049 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053) lt!302880)))

(declare-fun b!651363 () Bool)

(assert (=> b!651363 (= e!373755 e!373753)))

(declare-fun c!74866 () Bool)

(assert (=> b!651363 (= c!74866 (= lt!302881 (select (arr!18496 a!2986) j!136)))))

(declare-fun b!651364 () Bool)

(assert (=> b!651364 (= e!373755 Undefined!6936)))

(declare-fun b!651365 () Bool)

(assert (=> b!651365 (= e!373753 (Found!6936 index!984))))

(assert (= (and d!92049 c!74865) b!651364))

(assert (= (and d!92049 (not c!74865)) b!651363))

(assert (= (and b!651363 c!74866) b!651365))

(assert (= (and b!651363 (not c!74866)) b!651362))

(assert (= (and b!651362 c!74867) b!651360))

(assert (= (and b!651362 (not c!74867)) b!651361))

(assert (=> b!651361 m!624457))

(assert (=> b!651361 m!624457))

(assert (=> b!651361 m!624405))

(declare-fun m!624539 () Bool)

(assert (=> b!651361 m!624539))

(declare-fun m!624541 () Bool)

(assert (=> d!92049 m!624541))

(declare-fun m!624543 () Bool)

(assert (=> d!92049 m!624543))

(assert (=> d!92049 m!624403))

(assert (=> d!92049 m!624419))

(assert (=> b!651261 d!92049))

(declare-fun b!651366 () Bool)

(declare-fun e!373757 () SeekEntryResult!6936)

(assert (=> b!651366 (= e!373757 (MissingVacant!6936 vacantSpotIndex!68))))

(declare-fun b!651367 () Bool)

(assert (=> b!651367 (= e!373757 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302810 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!651368 () Bool)

(declare-fun c!74870 () Bool)

(declare-fun lt!302883 () (_ BitVec 64))

(assert (=> b!651368 (= c!74870 (= lt!302883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373756 () SeekEntryResult!6936)

(assert (=> b!651368 (= e!373756 e!373757)))

(declare-fun d!92051 () Bool)

(declare-fun lt!302882 () SeekEntryResult!6936)

(assert (=> d!92051 (and (or ((_ is Undefined!6936) lt!302882) (not ((_ is Found!6936) lt!302882)) (and (bvsge (index!30095 lt!302882) #b00000000000000000000000000000000) (bvslt (index!30095 lt!302882) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302882) ((_ is Found!6936) lt!302882) (not ((_ is MissingVacant!6936) lt!302882)) (not (= (index!30097 lt!302882) vacantSpotIndex!68)) (and (bvsge (index!30097 lt!302882) #b00000000000000000000000000000000) (bvslt (index!30097 lt!302882) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302882) (ite ((_ is Found!6936) lt!302882) (= (select (arr!18496 a!2986) (index!30095 lt!302882)) (select (arr!18496 a!2986) j!136)) (and ((_ is MissingVacant!6936) lt!302882) (= (index!30097 lt!302882) vacantSpotIndex!68) (= (select (arr!18496 a!2986) (index!30097 lt!302882)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373758 () SeekEntryResult!6936)

(assert (=> d!92051 (= lt!302882 e!373758)))

(declare-fun c!74868 () Bool)

(assert (=> d!92051 (= c!74868 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92051 (= lt!302883 (select (arr!18496 a!2986) lt!302810))))

(assert (=> d!92051 (validMask!0 mask!3053)))

(assert (=> d!92051 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053) lt!302882)))

(declare-fun b!651369 () Bool)

(assert (=> b!651369 (= e!373758 e!373756)))

(declare-fun c!74869 () Bool)

(assert (=> b!651369 (= c!74869 (= lt!302883 (select (arr!18496 a!2986) j!136)))))

(declare-fun b!651370 () Bool)

(assert (=> b!651370 (= e!373758 Undefined!6936)))

(declare-fun b!651371 () Bool)

(assert (=> b!651371 (= e!373756 (Found!6936 lt!302810))))

(assert (= (and d!92051 c!74868) b!651370))

(assert (= (and d!92051 (not c!74868)) b!651369))

(assert (= (and b!651369 c!74869) b!651371))

(assert (= (and b!651369 (not c!74869)) b!651368))

(assert (= (and b!651368 c!74870) b!651366))

(assert (= (and b!651368 (not c!74870)) b!651367))

(declare-fun m!624545 () Bool)

(assert (=> b!651367 m!624545))

(assert (=> b!651367 m!624545))

(assert (=> b!651367 m!624405))

(declare-fun m!624547 () Bool)

(assert (=> b!651367 m!624547))

(declare-fun m!624549 () Bool)

(assert (=> d!92051 m!624549))

(declare-fun m!624551 () Bool)

(assert (=> d!92051 m!624551))

(declare-fun m!624553 () Bool)

(assert (=> d!92051 m!624553))

(assert (=> d!92051 m!624419))

(assert (=> b!651270 d!92051))

(declare-fun d!92053 () Bool)

(declare-fun lt!302886 () (_ BitVec 32))

(assert (=> d!92053 (and (bvsge lt!302886 #b00000000000000000000000000000000) (bvslt lt!302886 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92053 (= lt!302886 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92053 (validMask!0 mask!3053)))

(assert (=> d!92053 (= (nextIndex!0 index!984 x!910 mask!3053) lt!302886)))

(declare-fun bs!19420 () Bool)

(assert (= bs!19420 d!92053))

(declare-fun m!624555 () Bool)

(assert (=> bs!19420 m!624555))

(assert (=> bs!19420 m!624419))

(assert (=> b!651270 d!92053))

(declare-fun b!651372 () Bool)

(declare-fun e!373760 () SeekEntryResult!6936)

(assert (=> b!651372 (= e!373760 (MissingVacant!6936 vacantSpotIndex!68))))

(declare-fun b!651373 () Bool)

(assert (=> b!651373 (= e!373760 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!302810 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!302812 lt!302808 mask!3053))))

(declare-fun b!651374 () Bool)

(declare-fun c!74873 () Bool)

(declare-fun lt!302888 () (_ BitVec 64))

(assert (=> b!651374 (= c!74873 (= lt!302888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373759 () SeekEntryResult!6936)

(assert (=> b!651374 (= e!373759 e!373760)))

(declare-fun d!92055 () Bool)

(declare-fun lt!302887 () SeekEntryResult!6936)

(assert (=> d!92055 (and (or ((_ is Undefined!6936) lt!302887) (not ((_ is Found!6936) lt!302887)) (and (bvsge (index!30095 lt!302887) #b00000000000000000000000000000000) (bvslt (index!30095 lt!302887) (size!18860 lt!302808)))) (or ((_ is Undefined!6936) lt!302887) ((_ is Found!6936) lt!302887) (not ((_ is MissingVacant!6936) lt!302887)) (not (= (index!30097 lt!302887) vacantSpotIndex!68)) (and (bvsge (index!30097 lt!302887) #b00000000000000000000000000000000) (bvslt (index!30097 lt!302887) (size!18860 lt!302808)))) (or ((_ is Undefined!6936) lt!302887) (ite ((_ is Found!6936) lt!302887) (= (select (arr!18496 lt!302808) (index!30095 lt!302887)) lt!302812) (and ((_ is MissingVacant!6936) lt!302887) (= (index!30097 lt!302887) vacantSpotIndex!68) (= (select (arr!18496 lt!302808) (index!30097 lt!302887)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373761 () SeekEntryResult!6936)

(assert (=> d!92055 (= lt!302887 e!373761)))

(declare-fun c!74871 () Bool)

(assert (=> d!92055 (= c!74871 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92055 (= lt!302888 (select (arr!18496 lt!302808) lt!302810))))

(assert (=> d!92055 (validMask!0 mask!3053)))

(assert (=> d!92055 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 lt!302812 lt!302808 mask!3053) lt!302887)))

(declare-fun b!651375 () Bool)

(assert (=> b!651375 (= e!373761 e!373759)))

(declare-fun c!74872 () Bool)

(assert (=> b!651375 (= c!74872 (= lt!302888 lt!302812))))

(declare-fun b!651376 () Bool)

(assert (=> b!651376 (= e!373761 Undefined!6936)))

(declare-fun b!651377 () Bool)

(assert (=> b!651377 (= e!373759 (Found!6936 lt!302810))))

(assert (= (and d!92055 c!74871) b!651376))

(assert (= (and d!92055 (not c!74871)) b!651375))

(assert (= (and b!651375 c!74872) b!651377))

(assert (= (and b!651375 (not c!74872)) b!651374))

(assert (= (and b!651374 c!74873) b!651372))

(assert (= (and b!651374 (not c!74873)) b!651373))

(assert (=> b!651373 m!624545))

(assert (=> b!651373 m!624545))

(declare-fun m!624557 () Bool)

(assert (=> b!651373 m!624557))

(declare-fun m!624559 () Bool)

(assert (=> d!92055 m!624559))

(declare-fun m!624561 () Bool)

(assert (=> d!92055 m!624561))

(declare-fun m!624563 () Bool)

(assert (=> d!92055 m!624563))

(assert (=> d!92055 m!624419))

(assert (=> b!651270 d!92055))

(declare-fun d!92057 () Bool)

(declare-fun e!373764 () Bool)

(assert (=> d!92057 e!373764))

(declare-fun res!422366 () Bool)

(assert (=> d!92057 (=> (not res!422366) (not e!373764))))

(assert (=> d!92057 (= res!422366 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18860 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18860 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18860 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18860 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18860 a!2986))))))

(declare-fun lt!302891 () Unit!22242)

(declare-fun choose!9 (array!38583 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22242)

(assert (=> d!92057 (= lt!302891 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92057 (validMask!0 mask!3053)))

(assert (=> d!92057 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 mask!3053) lt!302891)))

(declare-fun b!651380 () Bool)

(assert (=> b!651380 (= e!373764 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!302810 vacantSpotIndex!68 (select (store (arr!18496 a!2986) i!1108 k0!1786) j!136) (array!38584 (store (arr!18496 a!2986) i!1108 k0!1786) (size!18860 a!2986)) mask!3053)))))

(assert (= (and d!92057 res!422366) b!651380))

(declare-fun m!624565 () Bool)

(assert (=> d!92057 m!624565))

(assert (=> d!92057 m!624419))

(assert (=> b!651380 m!624441))

(assert (=> b!651380 m!624449))

(assert (=> b!651380 m!624449))

(declare-fun m!624567 () Bool)

(assert (=> b!651380 m!624567))

(assert (=> b!651380 m!624405))

(assert (=> b!651380 m!624405))

(assert (=> b!651380 m!624451))

(assert (=> b!651270 d!92057))

(declare-fun b!651381 () Bool)

(declare-fun e!373766 () SeekEntryResult!6936)

(assert (=> b!651381 (= e!373766 (MissingVacant!6936 vacantSpotIndex!68))))

(declare-fun b!651382 () Bool)

(assert (=> b!651382 (= e!373766 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!302812 lt!302808 mask!3053))))

(declare-fun b!651383 () Bool)

(declare-fun c!74876 () Bool)

(declare-fun lt!302893 () (_ BitVec 64))

(assert (=> b!651383 (= c!74876 (= lt!302893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373765 () SeekEntryResult!6936)

(assert (=> b!651383 (= e!373765 e!373766)))

(declare-fun lt!302892 () SeekEntryResult!6936)

(declare-fun d!92061 () Bool)

(assert (=> d!92061 (and (or ((_ is Undefined!6936) lt!302892) (not ((_ is Found!6936) lt!302892)) (and (bvsge (index!30095 lt!302892) #b00000000000000000000000000000000) (bvslt (index!30095 lt!302892) (size!18860 lt!302808)))) (or ((_ is Undefined!6936) lt!302892) ((_ is Found!6936) lt!302892) (not ((_ is MissingVacant!6936) lt!302892)) (not (= (index!30097 lt!302892) vacantSpotIndex!68)) (and (bvsge (index!30097 lt!302892) #b00000000000000000000000000000000) (bvslt (index!30097 lt!302892) (size!18860 lt!302808)))) (or ((_ is Undefined!6936) lt!302892) (ite ((_ is Found!6936) lt!302892) (= (select (arr!18496 lt!302808) (index!30095 lt!302892)) lt!302812) (and ((_ is MissingVacant!6936) lt!302892) (= (index!30097 lt!302892) vacantSpotIndex!68) (= (select (arr!18496 lt!302808) (index!30097 lt!302892)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!373767 () SeekEntryResult!6936)

(assert (=> d!92061 (= lt!302892 e!373767)))

(declare-fun c!74874 () Bool)

(assert (=> d!92061 (= c!74874 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92061 (= lt!302893 (select (arr!18496 lt!302808) index!984))))

(assert (=> d!92061 (validMask!0 mask!3053)))

(assert (=> d!92061 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!302812 lt!302808 mask!3053) lt!302892)))

(declare-fun b!651384 () Bool)

(assert (=> b!651384 (= e!373767 e!373765)))

(declare-fun c!74875 () Bool)

(assert (=> b!651384 (= c!74875 (= lt!302893 lt!302812))))

(declare-fun b!651385 () Bool)

(assert (=> b!651385 (= e!373767 Undefined!6936)))

(declare-fun b!651386 () Bool)

(assert (=> b!651386 (= e!373765 (Found!6936 index!984))))

(assert (= (and d!92061 c!74874) b!651385))

(assert (= (and d!92061 (not c!74874)) b!651384))

(assert (= (and b!651384 c!74875) b!651386))

(assert (= (and b!651384 (not c!74875)) b!651383))

(assert (= (and b!651383 c!74876) b!651381))

(assert (= (and b!651383 (not c!74876)) b!651382))

(assert (=> b!651382 m!624457))

(assert (=> b!651382 m!624457))

(declare-fun m!624569 () Bool)

(assert (=> b!651382 m!624569))

(declare-fun m!624571 () Bool)

(assert (=> d!92061 m!624571))

(declare-fun m!624573 () Bool)

(assert (=> d!92061 m!624573))

(declare-fun m!624575 () Bool)

(assert (=> d!92061 m!624575))

(assert (=> d!92061 m!624419))

(assert (=> b!651270 d!92061))

(declare-fun b!651407 () Bool)

(declare-fun e!373786 () Bool)

(declare-fun e!373785 () Bool)

(assert (=> b!651407 (= e!373786 e!373785)))

(declare-fun res!422379 () Bool)

(assert (=> b!651407 (=> (not res!422379) (not e!373785))))

(declare-fun e!373787 () Bool)

(assert (=> b!651407 (= res!422379 (not e!373787))))

(declare-fun res!422380 () Bool)

(assert (=> b!651407 (=> (not res!422380) (not e!373787))))

(assert (=> b!651407 (= res!422380 (validKeyInArray!0 (select (arr!18496 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651408 () Bool)

(declare-fun e!373784 () Bool)

(declare-fun call!33757 () Bool)

(assert (=> b!651408 (= e!373784 call!33757)))

(declare-fun b!651409 () Bool)

(assert (=> b!651409 (= e!373784 call!33757)))

(declare-fun b!651410 () Bool)

(assert (=> b!651410 (= e!373785 e!373784)))

(declare-fun c!74881 () Bool)

(assert (=> b!651410 (= c!74881 (validKeyInArray!0 (select (arr!18496 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33754 () Bool)

(assert (=> bm!33754 (= call!33757 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74881 (Cons!12533 (select (arr!18496 a!2986) #b00000000000000000000000000000000) Nil!12534) Nil!12534)))))

(declare-fun d!92065 () Bool)

(declare-fun res!422381 () Bool)

(assert (=> d!92065 (=> res!422381 e!373786)))

(assert (=> d!92065 (= res!422381 (bvsge #b00000000000000000000000000000000 (size!18860 a!2986)))))

(assert (=> d!92065 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12534) e!373786)))

(declare-fun b!651411 () Bool)

(declare-fun contains!3177 (List!12537 (_ BitVec 64)) Bool)

(assert (=> b!651411 (= e!373787 (contains!3177 Nil!12534 (select (arr!18496 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92065 (not res!422381)) b!651407))

(assert (= (and b!651407 res!422380) b!651411))

(assert (= (and b!651407 res!422379) b!651410))

(assert (= (and b!651410 c!74881) b!651409))

(assert (= (and b!651410 (not c!74881)) b!651408))

(assert (= (or b!651409 b!651408) bm!33754))

(declare-fun m!624577 () Bool)

(assert (=> b!651407 m!624577))

(assert (=> b!651407 m!624577))

(declare-fun m!624579 () Bool)

(assert (=> b!651407 m!624579))

(assert (=> b!651410 m!624577))

(assert (=> b!651410 m!624577))

(assert (=> b!651410 m!624579))

(assert (=> bm!33754 m!624577))

(declare-fun m!624581 () Bool)

(assert (=> bm!33754 m!624581))

(assert (=> b!651411 m!624577))

(assert (=> b!651411 m!624577))

(declare-fun m!624583 () Bool)

(assert (=> b!651411 m!624583))

(assert (=> b!651260 d!92065))

(declare-fun d!92067 () Bool)

(assert (=> d!92067 (= (validKeyInArray!0 (select (arr!18496 a!2986) j!136)) (and (not (= (select (arr!18496 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18496 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!651271 d!92067))

(declare-fun d!92069 () Bool)

(assert (=> d!92069 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59002 d!92069))

(declare-fun d!92083 () Bool)

(assert (=> d!92083 (= (array_inv!14292 a!2986) (bvsge (size!18860 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59002 d!92083))

(declare-fun d!92087 () Bool)

(assert (=> d!92087 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!302913 () Unit!22242)

(declare-fun choose!114 (array!38583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22242)

(assert (=> d!92087 (= lt!302913 (choose!114 lt!302808 (select (arr!18496 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92087 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92087 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!302913)))

(declare-fun bs!19423 () Bool)

(assert (= bs!19423 d!92087))

(assert (=> bs!19423 m!624405))

(assert (=> bs!19423 m!624465))

(assert (=> bs!19423 m!624405))

(declare-fun m!624627 () Bool)

(assert (=> bs!19423 m!624627))

(assert (=> b!651274 d!92087))

(declare-fun b!651451 () Bool)

(declare-fun e!373818 () Bool)

(declare-fun e!373817 () Bool)

(assert (=> b!651451 (= e!373818 e!373817)))

(declare-fun res!422399 () Bool)

(assert (=> b!651451 (=> (not res!422399) (not e!373817))))

(declare-fun e!373819 () Bool)

(assert (=> b!651451 (= res!422399 (not e!373819))))

(declare-fun res!422400 () Bool)

(assert (=> b!651451 (=> (not res!422400) (not e!373819))))

(assert (=> b!651451 (= res!422400 (validKeyInArray!0 (select (arr!18496 lt!302808) index!984)))))

(declare-fun b!651452 () Bool)

(declare-fun e!373816 () Bool)

(declare-fun call!33760 () Bool)

(assert (=> b!651452 (= e!373816 call!33760)))

(declare-fun b!651453 () Bool)

(assert (=> b!651453 (= e!373816 call!33760)))

(declare-fun b!651454 () Bool)

(assert (=> b!651454 (= e!373817 e!373816)))

(declare-fun c!74893 () Bool)

(assert (=> b!651454 (= c!74893 (validKeyInArray!0 (select (arr!18496 lt!302808) index!984)))))

(declare-fun bm!33757 () Bool)

(assert (=> bm!33757 (= call!33760 (arrayNoDuplicates!0 lt!302808 (bvadd index!984 #b00000000000000000000000000000001) (ite c!74893 (Cons!12533 (select (arr!18496 lt!302808) index!984) Nil!12534) Nil!12534)))))

(declare-fun d!92091 () Bool)

(declare-fun res!422401 () Bool)

(assert (=> d!92091 (=> res!422401 e!373818)))

(assert (=> d!92091 (= res!422401 (bvsge index!984 (size!18860 lt!302808)))))

(assert (=> d!92091 (= (arrayNoDuplicates!0 lt!302808 index!984 Nil!12534) e!373818)))

(declare-fun b!651455 () Bool)

(assert (=> b!651455 (= e!373819 (contains!3177 Nil!12534 (select (arr!18496 lt!302808) index!984)))))

(assert (= (and d!92091 (not res!422401)) b!651451))

(assert (= (and b!651451 res!422400) b!651455))

(assert (= (and b!651451 res!422399) b!651454))

(assert (= (and b!651454 c!74893) b!651453))

(assert (= (and b!651454 (not c!74893)) b!651452))

(assert (= (or b!651453 b!651452) bm!33757))

(assert (=> b!651451 m!624575))

(assert (=> b!651451 m!624575))

(declare-fun m!624631 () Bool)

(assert (=> b!651451 m!624631))

(assert (=> b!651454 m!624575))

(assert (=> b!651454 m!624575))

(assert (=> b!651454 m!624631))

(assert (=> bm!33757 m!624575))

(declare-fun m!624633 () Bool)

(assert (=> bm!33757 m!624633))

(assert (=> b!651455 m!624575))

(assert (=> b!651455 m!624575))

(declare-fun m!624635 () Bool)

(assert (=> b!651455 m!624635))

(assert (=> b!651274 d!92091))

(declare-fun d!92095 () Bool)

(declare-fun res!422406 () Bool)

(declare-fun e!373824 () Bool)

(assert (=> d!92095 (=> res!422406 e!373824)))

(assert (=> d!92095 (= res!422406 (= (select (arr!18496 lt!302808) j!136) (select (arr!18496 a!2986) j!136)))))

(assert (=> d!92095 (= (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136) e!373824)))

(declare-fun b!651460 () Bool)

(declare-fun e!373825 () Bool)

(assert (=> b!651460 (= e!373824 e!373825)))

(declare-fun res!422407 () Bool)

(assert (=> b!651460 (=> (not res!422407) (not e!373825))))

(assert (=> b!651460 (= res!422407 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18860 lt!302808)))))

(declare-fun b!651461 () Bool)

(assert (=> b!651461 (= e!373825 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92095 (not res!422406)) b!651460))

(assert (= (and b!651460 res!422407) b!651461))

(declare-fun m!624637 () Bool)

(assert (=> d!92095 m!624637))

(assert (=> b!651461 m!624405))

(declare-fun m!624639 () Bool)

(assert (=> b!651461 m!624639))

(assert (=> b!651274 d!92095))

(declare-fun d!92097 () Bool)

(declare-fun res!422408 () Bool)

(declare-fun e!373826 () Bool)

(assert (=> d!92097 (=> res!422408 e!373826)))

(assert (=> d!92097 (= res!422408 (= (select (arr!18496 lt!302808) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18496 a!2986) j!136)))))

(assert (=> d!92097 (= (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!373826)))

(declare-fun b!651462 () Bool)

(declare-fun e!373827 () Bool)

(assert (=> b!651462 (= e!373826 e!373827)))

(declare-fun res!422409 () Bool)

(assert (=> b!651462 (=> (not res!422409) (not e!373827))))

(assert (=> b!651462 (= res!422409 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18860 lt!302808)))))

(declare-fun b!651463 () Bool)

(assert (=> b!651463 (= e!373827 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92097 (not res!422408)) b!651462))

(assert (= (and b!651462 res!422409) b!651463))

(declare-fun m!624641 () Bool)

(assert (=> d!92097 m!624641))

(assert (=> b!651463 m!624405))

(declare-fun m!624643 () Bool)

(assert (=> b!651463 m!624643))

(assert (=> b!651274 d!92097))

(declare-fun b!651464 () Bool)

(declare-fun e!373830 () Bool)

(declare-fun e!373829 () Bool)

(assert (=> b!651464 (= e!373830 e!373829)))

(declare-fun res!422410 () Bool)

(assert (=> b!651464 (=> (not res!422410) (not e!373829))))

(declare-fun e!373831 () Bool)

(assert (=> b!651464 (= res!422410 (not e!373831))))

(declare-fun res!422411 () Bool)

(assert (=> b!651464 (=> (not res!422411) (not e!373831))))

(assert (=> b!651464 (= res!422411 (validKeyInArray!0 (select (arr!18496 lt!302808) #b00000000000000000000000000000000)))))

(declare-fun b!651465 () Bool)

(declare-fun e!373828 () Bool)

(declare-fun call!33761 () Bool)

(assert (=> b!651465 (= e!373828 call!33761)))

(declare-fun b!651466 () Bool)

(assert (=> b!651466 (= e!373828 call!33761)))

(declare-fun b!651467 () Bool)

(assert (=> b!651467 (= e!373829 e!373828)))

(declare-fun c!74894 () Bool)

(assert (=> b!651467 (= c!74894 (validKeyInArray!0 (select (arr!18496 lt!302808) #b00000000000000000000000000000000)))))

(declare-fun bm!33758 () Bool)

(assert (=> bm!33758 (= call!33761 (arrayNoDuplicates!0 lt!302808 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74894 (Cons!12533 (select (arr!18496 lt!302808) #b00000000000000000000000000000000) Nil!12534) Nil!12534)))))

(declare-fun d!92099 () Bool)

(declare-fun res!422412 () Bool)

(assert (=> d!92099 (=> res!422412 e!373830)))

(assert (=> d!92099 (= res!422412 (bvsge #b00000000000000000000000000000000 (size!18860 lt!302808)))))

(assert (=> d!92099 (= (arrayNoDuplicates!0 lt!302808 #b00000000000000000000000000000000 Nil!12534) e!373830)))

(declare-fun b!651468 () Bool)

(assert (=> b!651468 (= e!373831 (contains!3177 Nil!12534 (select (arr!18496 lt!302808) #b00000000000000000000000000000000)))))

(assert (= (and d!92099 (not res!422412)) b!651464))

(assert (= (and b!651464 res!422411) b!651468))

(assert (= (and b!651464 res!422410) b!651467))

(assert (= (and b!651467 c!74894) b!651466))

(assert (= (and b!651467 (not c!74894)) b!651465))

(assert (= (or b!651466 b!651465) bm!33758))

(declare-fun m!624645 () Bool)

(assert (=> b!651464 m!624645))

(assert (=> b!651464 m!624645))

(declare-fun m!624647 () Bool)

(assert (=> b!651464 m!624647))

(assert (=> b!651467 m!624645))

(assert (=> b!651467 m!624645))

(assert (=> b!651467 m!624647))

(assert (=> bm!33758 m!624645))

(declare-fun m!624649 () Bool)

(assert (=> bm!33758 m!624649))

(assert (=> b!651468 m!624645))

(assert (=> b!651468 m!624645))

(declare-fun m!624651 () Bool)

(assert (=> b!651468 m!624651))

(assert (=> b!651274 d!92099))

(declare-fun d!92101 () Bool)

(assert (=> d!92101 (arrayNoDuplicates!0 lt!302808 index!984 Nil!12534)))

(declare-fun lt!302919 () Unit!22242)

(declare-fun choose!39 (array!38583 (_ BitVec 32) (_ BitVec 32)) Unit!22242)

(assert (=> d!92101 (= lt!302919 (choose!39 lt!302808 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92101 (bvslt (size!18860 lt!302808) #b01111111111111111111111111111111)))

(assert (=> d!92101 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302808 #b00000000000000000000000000000000 index!984) lt!302919)))

(declare-fun bs!19425 () Bool)

(assert (= bs!19425 d!92101))

(assert (=> bs!19425 m!624463))

(declare-fun m!624653 () Bool)

(assert (=> bs!19425 m!624653))

(assert (=> b!651274 d!92101))

(declare-fun d!92103 () Bool)

(declare-fun e!373849 () Bool)

(assert (=> d!92103 e!373849))

(declare-fun res!422424 () Bool)

(assert (=> d!92103 (=> (not res!422424) (not e!373849))))

(assert (=> d!92103 (= res!422424 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18860 a!2986))))))

(declare-fun lt!302927 () Unit!22242)

(declare-fun choose!41 (array!38583 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12537) Unit!22242)

(assert (=> d!92103 (= lt!302927 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12534))))

(assert (=> d!92103 (bvslt (size!18860 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92103 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12534) lt!302927)))

(declare-fun b!651492 () Bool)

(assert (=> b!651492 (= e!373849 (arrayNoDuplicates!0 (array!38584 (store (arr!18496 a!2986) i!1108 k0!1786) (size!18860 a!2986)) #b00000000000000000000000000000000 Nil!12534))))

(assert (= (and d!92103 res!422424) b!651492))

(declare-fun m!624679 () Bool)

(assert (=> d!92103 m!624679))

(assert (=> b!651492 m!624441))

(declare-fun m!624681 () Bool)

(assert (=> b!651492 m!624681))

(assert (=> b!651274 d!92103))

(declare-fun d!92113 () Bool)

(declare-fun res!422425 () Bool)

(declare-fun e!373852 () Bool)

(assert (=> d!92113 (=> res!422425 e!373852)))

(assert (=> d!92113 (= res!422425 (= (select (arr!18496 lt!302808) index!984) (select (arr!18496 a!2986) j!136)))))

(assert (=> d!92113 (= (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) index!984) e!373852)))

(declare-fun b!651497 () Bool)

(declare-fun e!373853 () Bool)

(assert (=> b!651497 (= e!373852 e!373853)))

(declare-fun res!422426 () Bool)

(assert (=> b!651497 (=> (not res!422426) (not e!373853))))

(assert (=> b!651497 (= res!422426 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18860 lt!302808)))))

(declare-fun b!651498 () Bool)

(assert (=> b!651498 (= e!373853 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92113 (not res!422425)) b!651497))

(assert (= (and b!651497 res!422426) b!651498))

(assert (=> d!92113 m!624575))

(assert (=> b!651498 m!624405))

(declare-fun m!624683 () Bool)

(assert (=> b!651498 m!624683))

(assert (=> b!651264 d!92113))

(assert (=> b!651266 d!92113))

(assert (=> b!651277 d!92095))

(declare-fun d!92115 () Bool)

(declare-fun res!422427 () Bool)

(declare-fun e!373858 () Bool)

(assert (=> d!92115 (=> res!422427 e!373858)))

(assert (=> d!92115 (= res!422427 (= (select (arr!18496 lt!302808) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18496 a!2986) j!136)))))

(assert (=> d!92115 (= (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!373858)))

(declare-fun b!651507 () Bool)

(declare-fun e!373859 () Bool)

(assert (=> b!651507 (= e!373858 e!373859)))

(declare-fun res!422428 () Bool)

(assert (=> b!651507 (=> (not res!422428) (not e!373859))))

(assert (=> b!651507 (= res!422428 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18860 lt!302808)))))

(declare-fun b!651508 () Bool)

(assert (=> b!651508 (= e!373859 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92115 (not res!422427)) b!651507))

(assert (= (and b!651507 res!422428) b!651508))

(declare-fun m!624685 () Bool)

(assert (=> d!92115 m!624685))

(assert (=> b!651508 m!624405))

(declare-fun m!624687 () Bool)

(assert (=> b!651508 m!624687))

(assert (=> b!651265 d!92115))

(declare-fun d!92117 () Bool)

(assert (=> d!92117 (arrayContainsKey!0 lt!302808 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302934 () Unit!22242)

(assert (=> d!92117 (= lt!302934 (choose!114 lt!302808 (select (arr!18496 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92117 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92117 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!302808 (select (arr!18496 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!302934)))

(declare-fun bs!19426 () Bool)

(assert (= bs!19426 d!92117))

(assert (=> bs!19426 m!624405))

(assert (=> bs!19426 m!624423))

(assert (=> bs!19426 m!624405))

(declare-fun m!624689 () Bool)

(assert (=> bs!19426 m!624689))

(assert (=> b!651265 d!92117))

(declare-fun d!92119 () Bool)

(assert (=> d!92119 (arrayNoDuplicates!0 lt!302808 j!136 Nil!12534)))

(declare-fun lt!302935 () Unit!22242)

(assert (=> d!92119 (= lt!302935 (choose!39 lt!302808 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92119 (bvslt (size!18860 lt!302808) #b01111111111111111111111111111111)))

(assert (=> d!92119 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!302808 #b00000000000000000000000000000000 j!136) lt!302935)))

(declare-fun bs!19427 () Bool)

(assert (= bs!19427 d!92119))

(assert (=> bs!19427 m!624429))

(declare-fun m!624691 () Bool)

(assert (=> bs!19427 m!624691))

(assert (=> b!651265 d!92119))

(declare-fun d!92121 () Bool)

(assert (=> d!92121 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18860 lt!302808)) (not (= (select (arr!18496 lt!302808) j!136) (select (arr!18496 a!2986) j!136))))))

(declare-fun lt!302941 () Unit!22242)

(declare-fun choose!21 (array!38583 (_ BitVec 64) (_ BitVec 32) List!12537) Unit!22242)

(assert (=> d!92121 (= lt!302941 (choose!21 lt!302808 (select (arr!18496 a!2986) j!136) j!136 Nil!12534))))

(assert (=> d!92121 (bvslt (size!18860 lt!302808) #b01111111111111111111111111111111)))

(assert (=> d!92121 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!302808 (select (arr!18496 a!2986) j!136) j!136 Nil!12534) lt!302941)))

(declare-fun bs!19428 () Bool)

(assert (= bs!19428 d!92121))

(assert (=> bs!19428 m!624637))

(assert (=> bs!19428 m!624405))

(declare-fun m!624717 () Bool)

(assert (=> bs!19428 m!624717))

(assert (=> b!651265 d!92121))

(assert (=> b!651265 d!92099))

(assert (=> b!651265 d!92103))

(declare-fun b!651534 () Bool)

(declare-fun e!373881 () Bool)

(declare-fun e!373880 () Bool)

(assert (=> b!651534 (= e!373881 e!373880)))

(declare-fun res!422442 () Bool)

(assert (=> b!651534 (=> (not res!422442) (not e!373880))))

(declare-fun e!373882 () Bool)

(assert (=> b!651534 (= res!422442 (not e!373882))))

(declare-fun res!422443 () Bool)

(assert (=> b!651534 (=> (not res!422443) (not e!373882))))

(assert (=> b!651534 (= res!422443 (validKeyInArray!0 (select (arr!18496 lt!302808) j!136)))))

(declare-fun b!651535 () Bool)

(declare-fun e!373879 () Bool)

(declare-fun call!33765 () Bool)

(assert (=> b!651535 (= e!373879 call!33765)))

(declare-fun b!651536 () Bool)

(assert (=> b!651536 (= e!373879 call!33765)))

(declare-fun b!651537 () Bool)

(assert (=> b!651537 (= e!373880 e!373879)))

(declare-fun c!74913 () Bool)

(assert (=> b!651537 (= c!74913 (validKeyInArray!0 (select (arr!18496 lt!302808) j!136)))))

(declare-fun bm!33762 () Bool)

(assert (=> bm!33762 (= call!33765 (arrayNoDuplicates!0 lt!302808 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74913 (Cons!12533 (select (arr!18496 lt!302808) j!136) Nil!12534) Nil!12534)))))

(declare-fun d!92129 () Bool)

(declare-fun res!422444 () Bool)

(assert (=> d!92129 (=> res!422444 e!373881)))

(assert (=> d!92129 (= res!422444 (bvsge j!136 (size!18860 lt!302808)))))

(assert (=> d!92129 (= (arrayNoDuplicates!0 lt!302808 j!136 Nil!12534) e!373881)))

(declare-fun b!651538 () Bool)

(assert (=> b!651538 (= e!373882 (contains!3177 Nil!12534 (select (arr!18496 lt!302808) j!136)))))

(assert (= (and d!92129 (not res!422444)) b!651534))

(assert (= (and b!651534 res!422443) b!651538))

(assert (= (and b!651534 res!422442) b!651537))

(assert (= (and b!651537 c!74913) b!651536))

(assert (= (and b!651537 (not c!74913)) b!651535))

(assert (= (or b!651536 b!651535) bm!33762))

(assert (=> b!651534 m!624637))

(assert (=> b!651534 m!624637))

(declare-fun m!624723 () Bool)

(assert (=> b!651534 m!624723))

(assert (=> b!651537 m!624637))

(assert (=> b!651537 m!624637))

(assert (=> b!651537 m!624723))

(assert (=> bm!33762 m!624637))

(declare-fun m!624725 () Bool)

(assert (=> bm!33762 m!624725))

(assert (=> b!651538 m!624637))

(assert (=> b!651538 m!624637))

(declare-fun m!624727 () Bool)

(assert (=> b!651538 m!624727))

(assert (=> b!651265 d!92129))

(declare-fun d!92133 () Bool)

(declare-fun res!422445 () Bool)

(declare-fun e!373883 () Bool)

(assert (=> d!92133 (=> res!422445 e!373883)))

(assert (=> d!92133 (= res!422445 (= (select (arr!18496 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92133 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!373883)))

(declare-fun b!651539 () Bool)

(declare-fun e!373884 () Bool)

(assert (=> b!651539 (= e!373883 e!373884)))

(declare-fun res!422446 () Bool)

(assert (=> b!651539 (=> (not res!422446) (not e!373884))))

(assert (=> b!651539 (= res!422446 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18860 a!2986)))))

(declare-fun b!651540 () Bool)

(assert (=> b!651540 (= e!373884 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92133 (not res!422445)) b!651539))

(assert (= (and b!651539 res!422446) b!651540))

(assert (=> d!92133 m!624577))

(declare-fun m!624729 () Bool)

(assert (=> b!651540 m!624729))

(assert (=> b!651276 d!92133))

(declare-fun d!92135 () Bool)

(declare-fun res!422460 () Bool)

(declare-fun e!373902 () Bool)

(assert (=> d!92135 (=> res!422460 e!373902)))

(assert (=> d!92135 (= res!422460 (bvsge #b00000000000000000000000000000000 (size!18860 a!2986)))))

(assert (=> d!92135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!373902)))

(declare-fun bm!33767 () Bool)

(declare-fun call!33770 () Bool)

(assert (=> bm!33767 (= call!33770 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!651562 () Bool)

(declare-fun e!373903 () Bool)

(declare-fun e!373904 () Bool)

(assert (=> b!651562 (= e!373903 e!373904)))

(declare-fun lt!302959 () (_ BitVec 64))

(assert (=> b!651562 (= lt!302959 (select (arr!18496 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!302958 () Unit!22242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38583 (_ BitVec 64) (_ BitVec 32)) Unit!22242)

(assert (=> b!651562 (= lt!302958 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!302959 #b00000000000000000000000000000000))))

(assert (=> b!651562 (arrayContainsKey!0 a!2986 lt!302959 #b00000000000000000000000000000000)))

(declare-fun lt!302957 () Unit!22242)

(assert (=> b!651562 (= lt!302957 lt!302958)))

(declare-fun res!422461 () Bool)

(assert (=> b!651562 (= res!422461 (= (seekEntryOrOpen!0 (select (arr!18496 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6936 #b00000000000000000000000000000000)))))

(assert (=> b!651562 (=> (not res!422461) (not e!373904))))

(declare-fun b!651563 () Bool)

(assert (=> b!651563 (= e!373904 call!33770)))

(declare-fun b!651564 () Bool)

(assert (=> b!651564 (= e!373902 e!373903)))

(declare-fun c!74918 () Bool)

(assert (=> b!651564 (= c!74918 (validKeyInArray!0 (select (arr!18496 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!651565 () Bool)

(assert (=> b!651565 (= e!373903 call!33770)))

(assert (= (and d!92135 (not res!422460)) b!651564))

(assert (= (and b!651564 c!74918) b!651562))

(assert (= (and b!651564 (not c!74918)) b!651565))

(assert (= (and b!651562 res!422461) b!651563))

(assert (= (or b!651563 b!651565) bm!33767))

(declare-fun m!624753 () Bool)

(assert (=> bm!33767 m!624753))

(assert (=> b!651562 m!624577))

(declare-fun m!624757 () Bool)

(assert (=> b!651562 m!624757))

(declare-fun m!624759 () Bool)

(assert (=> b!651562 m!624759))

(assert (=> b!651562 m!624577))

(declare-fun m!624761 () Bool)

(assert (=> b!651562 m!624761))

(assert (=> b!651564 m!624577))

(assert (=> b!651564 m!624577))

(assert (=> b!651564 m!624579))

(assert (=> b!651258 d!92135))

(declare-fun d!92155 () Bool)

(declare-fun lt!302989 () SeekEntryResult!6936)

(assert (=> d!92155 (and (or ((_ is Undefined!6936) lt!302989) (not ((_ is Found!6936) lt!302989)) (and (bvsge (index!30095 lt!302989) #b00000000000000000000000000000000) (bvslt (index!30095 lt!302989) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302989) ((_ is Found!6936) lt!302989) (not ((_ is MissingZero!6936) lt!302989)) (and (bvsge (index!30094 lt!302989) #b00000000000000000000000000000000) (bvslt (index!30094 lt!302989) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302989) ((_ is Found!6936) lt!302989) ((_ is MissingZero!6936) lt!302989) (not ((_ is MissingVacant!6936) lt!302989)) (and (bvsge (index!30097 lt!302989) #b00000000000000000000000000000000) (bvslt (index!30097 lt!302989) (size!18860 a!2986)))) (or ((_ is Undefined!6936) lt!302989) (ite ((_ is Found!6936) lt!302989) (= (select (arr!18496 a!2986) (index!30095 lt!302989)) k0!1786) (ite ((_ is MissingZero!6936) lt!302989) (= (select (arr!18496 a!2986) (index!30094 lt!302989)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6936) lt!302989) (= (select (arr!18496 a!2986) (index!30097 lt!302989)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!373935 () SeekEntryResult!6936)

(assert (=> d!92155 (= lt!302989 e!373935)))

(declare-fun c!74946 () Bool)

(declare-fun lt!302987 () SeekEntryResult!6936)

(assert (=> d!92155 (= c!74946 (and ((_ is Intermediate!6936) lt!302987) (undefined!7748 lt!302987)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38583 (_ BitVec 32)) SeekEntryResult!6936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92155 (= lt!302987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92155 (validMask!0 mask!3053)))

(assert (=> d!92155 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!302989)))

(declare-fun b!651621 () Bool)

(assert (=> b!651621 (= e!373935 Undefined!6936)))

(declare-fun b!651622 () Bool)

(declare-fun c!74945 () Bool)

(declare-fun lt!302988 () (_ BitVec 64))

(assert (=> b!651622 (= c!74945 (= lt!302988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373936 () SeekEntryResult!6936)

(declare-fun e!373937 () SeekEntryResult!6936)

(assert (=> b!651622 (= e!373936 e!373937)))

(declare-fun b!651623 () Bool)

(assert (=> b!651623 (= e!373937 (MissingZero!6936 (index!30096 lt!302987)))))

(declare-fun b!651624 () Bool)

(assert (=> b!651624 (= e!373935 e!373936)))

(assert (=> b!651624 (= lt!302988 (select (arr!18496 a!2986) (index!30096 lt!302987)))))

(declare-fun c!74944 () Bool)

(assert (=> b!651624 (= c!74944 (= lt!302988 k0!1786))))

(declare-fun b!651625 () Bool)

(assert (=> b!651625 (= e!373936 (Found!6936 (index!30096 lt!302987)))))

(declare-fun b!651626 () Bool)

(assert (=> b!651626 (= e!373937 (seekKeyOrZeroReturnVacant!0 (x!58878 lt!302987) (index!30096 lt!302987) (index!30096 lt!302987) k0!1786 a!2986 mask!3053))))

(assert (= (and d!92155 c!74946) b!651621))

(assert (= (and d!92155 (not c!74946)) b!651624))

(assert (= (and b!651624 c!74944) b!651625))

(assert (= (and b!651624 (not c!74944)) b!651622))

(assert (= (and b!651622 c!74945) b!651623))

(assert (= (and b!651622 (not c!74945)) b!651626))

(declare-fun m!624799 () Bool)

(assert (=> d!92155 m!624799))

(declare-fun m!624801 () Bool)

(assert (=> d!92155 m!624801))

(declare-fun m!624803 () Bool)

(assert (=> d!92155 m!624803))

(assert (=> d!92155 m!624419))

(assert (=> d!92155 m!624799))

(declare-fun m!624805 () Bool)

(assert (=> d!92155 m!624805))

(declare-fun m!624807 () Bool)

(assert (=> d!92155 m!624807))

(declare-fun m!624809 () Bool)

(assert (=> b!651624 m!624809))

(declare-fun m!624813 () Bool)

(assert (=> b!651626 m!624813))

(assert (=> b!651259 d!92155))

(declare-fun d!92173 () Bool)

(assert (=> d!92173 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!651278 d!92173))

(check-sat (not b!651508) (not b!651498) (not bm!33762) (not b!651562) (not d!92061) (not b!651454) (not b!651455) (not bm!33754) (not b!651540) (not b!651451) (not d!92121) (not d!92049) (not b!651468) (not b!651538) (not b!651367) (not d!92119) (not d!92155) (not b!651464) (not bm!33757) (not b!651492) (not b!651564) (not b!651537) (not d!92051) (not b!651534) (not d!92053) (not b!651373) (not d!92057) (not b!651626) (not b!651407) (not b!651410) (not d!92103) (not b!651380) (not d!92087) (not b!651382) (not b!651463) (not bm!33758) (not d!92117) (not d!92055) (not d!92101) (not b!651361) (not b!651467) (not bm!33767) (not b!651461) (not b!651411))
(check-sat)
