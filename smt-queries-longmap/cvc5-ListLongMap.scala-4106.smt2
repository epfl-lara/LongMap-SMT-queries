; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56134 () Bool)

(assert start!56134)

(declare-fun b!620337 () Bool)

(declare-fun res!399740 () Bool)

(declare-fun e!355793 () Bool)

(assert (=> b!620337 (=> (not res!399740) (not e!355793))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37604 0))(
  ( (array!37605 (arr!18048 (Array (_ BitVec 32) (_ BitVec 64))) (size!18412 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37604)

(assert (=> b!620337 (= res!399740 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18048 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620338 () Bool)

(declare-datatypes ((Unit!20608 0))(
  ( (Unit!20609) )
))
(declare-fun e!355792 () Unit!20608)

(declare-fun Unit!20610 () Unit!20608)

(assert (=> b!620338 (= e!355792 Unit!20610)))

(declare-fun b!620339 () Bool)

(declare-fun e!355789 () Bool)

(declare-fun e!355796 () Bool)

(assert (=> b!620339 (= e!355789 e!355796)))

(declare-fun res!399743 () Bool)

(assert (=> b!620339 (=> (not res!399743) (not e!355796))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6488 0))(
  ( (MissingZero!6488 (index!28236 (_ BitVec 32))) (Found!6488 (index!28237 (_ BitVec 32))) (Intermediate!6488 (undefined!7300 Bool) (index!28238 (_ BitVec 32)) (x!57016 (_ BitVec 32))) (Undefined!6488) (MissingVacant!6488 (index!28239 (_ BitVec 32))) )
))
(declare-fun lt!286644 () SeekEntryResult!6488)

(assert (=> b!620339 (= res!399743 (and (= lt!286644 (Found!6488 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18048 a!2986) index!984) (select (arr!18048 a!2986) j!136))) (not (= (select (arr!18048 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37604 (_ BitVec 32)) SeekEntryResult!6488)

(assert (=> b!620339 (= lt!286644 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18048 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620340 () Bool)

(declare-fun e!355791 () Unit!20608)

(declare-fun Unit!20611 () Unit!20608)

(assert (=> b!620340 (= e!355791 Unit!20611)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!399736 () Bool)

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!620340 (= res!399736 (= (select (store (arr!18048 a!2986) i!1108 k!1786) index!984) (select (arr!18048 a!2986) j!136)))))

(declare-fun e!355790 () Bool)

(assert (=> b!620340 (=> (not res!399736) (not e!355790))))

(assert (=> b!620340 e!355790))

(declare-fun c!70670 () Bool)

(assert (=> b!620340 (= c!70670 (bvslt j!136 index!984))))

(declare-fun lt!286640 () Unit!20608)

(declare-fun e!355799 () Unit!20608)

(assert (=> b!620340 (= lt!286640 e!355799)))

(declare-fun c!70673 () Bool)

(assert (=> b!620340 (= c!70673 (bvslt index!984 j!136))))

(declare-fun lt!286651 () Unit!20608)

(assert (=> b!620340 (= lt!286651 e!355792)))

(assert (=> b!620340 false))

(declare-fun b!620341 () Bool)

(declare-fun lt!286653 () array!37604)

(declare-fun res!399744 () Bool)

(declare-fun arrayContainsKey!0 (array!37604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620341 (= res!399744 (arrayContainsKey!0 lt!286653 (select (arr!18048 a!2986) j!136) j!136))))

(declare-fun e!355800 () Bool)

(assert (=> b!620341 (=> (not res!399744) (not e!355800))))

(declare-fun e!355797 () Bool)

(assert (=> b!620341 (= e!355797 e!355800)))

(declare-fun b!620342 () Bool)

(assert (=> b!620342 false))

(declare-fun lt!286645 () Unit!20608)

(declare-datatypes ((List!12089 0))(
  ( (Nil!12086) (Cons!12085 (h!13130 (_ BitVec 64)) (t!18317 List!12089)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37604 (_ BitVec 64) (_ BitVec 32) List!12089) Unit!20608)

(assert (=> b!620342 (= lt!286645 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286653 (select (arr!18048 a!2986) j!136) index!984 Nil!12086))))

(declare-fun arrayNoDuplicates!0 (array!37604 (_ BitVec 32) List!12089) Bool)

(assert (=> b!620342 (arrayNoDuplicates!0 lt!286653 index!984 Nil!12086)))

(declare-fun lt!286650 () Unit!20608)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37604 (_ BitVec 32) (_ BitVec 32)) Unit!20608)

(assert (=> b!620342 (= lt!286650 (lemmaNoDuplicateFromThenFromBigger!0 lt!286653 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620342 (arrayNoDuplicates!0 lt!286653 #b00000000000000000000000000000000 Nil!12086)))

(declare-fun lt!286638 () Unit!20608)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12089) Unit!20608)

(assert (=> b!620342 (= lt!286638 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12086))))

(assert (=> b!620342 (arrayContainsKey!0 lt!286653 (select (arr!18048 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286643 () Unit!20608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20608)

(assert (=> b!620342 (= lt!286643 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286653 (select (arr!18048 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355795 () Bool)

(assert (=> b!620342 e!355795))

(declare-fun res!399734 () Bool)

(assert (=> b!620342 (=> (not res!399734) (not e!355795))))

(assert (=> b!620342 (= res!399734 (arrayContainsKey!0 lt!286653 (select (arr!18048 a!2986) j!136) j!136))))

(declare-fun Unit!20612 () Unit!20608)

(assert (=> b!620342 (= e!355792 Unit!20612)))

(declare-fun b!620343 () Bool)

(declare-fun e!355787 () Unit!20608)

(declare-fun Unit!20613 () Unit!20608)

(assert (=> b!620343 (= e!355787 Unit!20613)))

(declare-fun b!620344 () Bool)

(declare-fun Unit!20614 () Unit!20608)

(assert (=> b!620344 (= e!355791 Unit!20614)))

(declare-fun b!620345 () Bool)

(declare-fun res!399731 () Bool)

(declare-fun e!355794 () Bool)

(assert (=> b!620345 (=> (not res!399731) (not e!355794))))

(assert (=> b!620345 (= res!399731 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620346 () Bool)

(assert (=> b!620346 (= e!355794 e!355793)))

(declare-fun res!399738 () Bool)

(assert (=> b!620346 (=> (not res!399738) (not e!355793))))

(declare-fun lt!286648 () SeekEntryResult!6488)

(assert (=> b!620346 (= res!399738 (or (= lt!286648 (MissingZero!6488 i!1108)) (= lt!286648 (MissingVacant!6488 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37604 (_ BitVec 32)) SeekEntryResult!6488)

(assert (=> b!620346 (= lt!286648 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620347 () Bool)

(assert (=> b!620347 (= e!355795 (arrayContainsKey!0 lt!286653 (select (arr!18048 a!2986) j!136) index!984))))

(declare-fun b!620348 () Bool)

(declare-fun Unit!20615 () Unit!20608)

(assert (=> b!620348 (= e!355787 Unit!20615)))

(assert (=> b!620348 false))

(declare-fun b!620349 () Bool)

(declare-fun res!399733 () Bool)

(assert (=> b!620349 (=> (not res!399733) (not e!355793))))

(assert (=> b!620349 (= res!399733 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12086))))

(declare-fun b!620350 () Bool)

(declare-fun res!399745 () Bool)

(assert (=> b!620350 (=> (not res!399745) (not e!355794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620350 (= res!399745 (validKeyInArray!0 (select (arr!18048 a!2986) j!136)))))

(declare-fun b!620351 () Bool)

(declare-fun res!399741 () Bool)

(assert (=> b!620351 (=> (not res!399741) (not e!355793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37604 (_ BitVec 32)) Bool)

(assert (=> b!620351 (= res!399741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620352 () Bool)

(assert (=> b!620352 (= e!355793 e!355789)))

(declare-fun res!399742 () Bool)

(assert (=> b!620352 (=> (not res!399742) (not e!355789))))

(assert (=> b!620352 (= res!399742 (= (select (store (arr!18048 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620352 (= lt!286653 (array!37605 (store (arr!18048 a!2986) i!1108 k!1786) (size!18412 a!2986)))))

(declare-fun b!620353 () Bool)

(declare-fun lt!286656 () SeekEntryResult!6488)

(assert (=> b!620353 (= e!355796 (not (or (= lt!286656 (MissingVacant!6488 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!286652 () Unit!20608)

(assert (=> b!620353 (= lt!286652 e!355791)))

(declare-fun c!70671 () Bool)

(assert (=> b!620353 (= c!70671 (= lt!286656 (Found!6488 index!984)))))

(declare-fun lt!286657 () Unit!20608)

(assert (=> b!620353 (= lt!286657 e!355787)))

(declare-fun c!70672 () Bool)

(assert (=> b!620353 (= c!70672 (= lt!286656 Undefined!6488))))

(declare-fun lt!286642 () (_ BitVec 64))

(assert (=> b!620353 (= lt!286656 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286642 lt!286653 mask!3053))))

(declare-fun e!355788 () Bool)

(assert (=> b!620353 e!355788))

(declare-fun res!399746 () Bool)

(assert (=> b!620353 (=> (not res!399746) (not e!355788))))

(declare-fun lt!286647 () SeekEntryResult!6488)

(declare-fun lt!286655 () (_ BitVec 32))

(assert (=> b!620353 (= res!399746 (= lt!286647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286655 vacantSpotIndex!68 lt!286642 lt!286653 mask!3053)))))

(assert (=> b!620353 (= lt!286647 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286655 vacantSpotIndex!68 (select (arr!18048 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620353 (= lt!286642 (select (store (arr!18048 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286646 () Unit!20608)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37604 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20608)

(assert (=> b!620353 (= lt!286646 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286655 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620353 (= lt!286655 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620354 () Bool)

(declare-fun res!399737 () Bool)

(assert (=> b!620354 (=> (not res!399737) (not e!355794))))

(assert (=> b!620354 (= res!399737 (and (= (size!18412 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18412 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18412 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!399735 () Bool)

(assert (=> start!56134 (=> (not res!399735) (not e!355794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56134 (= res!399735 (validMask!0 mask!3053))))

(assert (=> start!56134 e!355794))

(assert (=> start!56134 true))

(declare-fun array_inv!13844 (array!37604) Bool)

(assert (=> start!56134 (array_inv!13844 a!2986)))

(declare-fun b!620355 () Bool)

(assert (=> b!620355 (= e!355788 (= lt!286644 lt!286647))))

(declare-fun b!620356 () Bool)

(assert (=> b!620356 (= e!355800 (arrayContainsKey!0 lt!286653 (select (arr!18048 a!2986) j!136) index!984))))

(declare-fun b!620357 () Bool)

(declare-fun res!399739 () Bool)

(assert (=> b!620357 (= res!399739 (bvsge j!136 index!984))))

(assert (=> b!620357 (=> res!399739 e!355797)))

(assert (=> b!620357 (= e!355790 e!355797)))

(declare-fun b!620358 () Bool)

(declare-fun Unit!20616 () Unit!20608)

(assert (=> b!620358 (= e!355799 Unit!20616)))

(declare-fun b!620359 () Bool)

(declare-fun res!399732 () Bool)

(assert (=> b!620359 (=> (not res!399732) (not e!355794))))

(assert (=> b!620359 (= res!399732 (validKeyInArray!0 k!1786))))

(declare-fun b!620360 () Bool)

(assert (=> b!620360 false))

(declare-fun lt!286641 () Unit!20608)

(assert (=> b!620360 (= lt!286641 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286653 (select (arr!18048 a!2986) j!136) j!136 Nil!12086))))

(assert (=> b!620360 (arrayNoDuplicates!0 lt!286653 j!136 Nil!12086)))

(declare-fun lt!286649 () Unit!20608)

(assert (=> b!620360 (= lt!286649 (lemmaNoDuplicateFromThenFromBigger!0 lt!286653 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620360 (arrayNoDuplicates!0 lt!286653 #b00000000000000000000000000000000 Nil!12086)))

(declare-fun lt!286639 () Unit!20608)

(assert (=> b!620360 (= lt!286639 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12086))))

(assert (=> b!620360 (arrayContainsKey!0 lt!286653 (select (arr!18048 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286654 () Unit!20608)

(assert (=> b!620360 (= lt!286654 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286653 (select (arr!18048 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20617 () Unit!20608)

(assert (=> b!620360 (= e!355799 Unit!20617)))

(assert (= (and start!56134 res!399735) b!620354))

(assert (= (and b!620354 res!399737) b!620350))

(assert (= (and b!620350 res!399745) b!620359))

(assert (= (and b!620359 res!399732) b!620345))

(assert (= (and b!620345 res!399731) b!620346))

(assert (= (and b!620346 res!399738) b!620351))

(assert (= (and b!620351 res!399741) b!620349))

(assert (= (and b!620349 res!399733) b!620337))

(assert (= (and b!620337 res!399740) b!620352))

(assert (= (and b!620352 res!399742) b!620339))

(assert (= (and b!620339 res!399743) b!620353))

(assert (= (and b!620353 res!399746) b!620355))

(assert (= (and b!620353 c!70672) b!620348))

(assert (= (and b!620353 (not c!70672)) b!620343))

(assert (= (and b!620353 c!70671) b!620340))

(assert (= (and b!620353 (not c!70671)) b!620344))

(assert (= (and b!620340 res!399736) b!620357))

(assert (= (and b!620357 (not res!399739)) b!620341))

(assert (= (and b!620341 res!399744) b!620356))

(assert (= (and b!620340 c!70670) b!620360))

(assert (= (and b!620340 (not c!70670)) b!620358))

(assert (= (and b!620340 c!70673) b!620342))

(assert (= (and b!620340 (not c!70673)) b!620338))

(assert (= (and b!620342 res!399734) b!620347))

(declare-fun m!596261 () Bool)

(assert (=> b!620353 m!596261))

(declare-fun m!596263 () Bool)

(assert (=> b!620353 m!596263))

(declare-fun m!596265 () Bool)

(assert (=> b!620353 m!596265))

(declare-fun m!596267 () Bool)

(assert (=> b!620353 m!596267))

(assert (=> b!620353 m!596265))

(declare-fun m!596269 () Bool)

(assert (=> b!620353 m!596269))

(declare-fun m!596271 () Bool)

(assert (=> b!620353 m!596271))

(declare-fun m!596273 () Bool)

(assert (=> b!620353 m!596273))

(declare-fun m!596275 () Bool)

(assert (=> b!620353 m!596275))

(assert (=> b!620342 m!596265))

(declare-fun m!596277 () Bool)

(assert (=> b!620342 m!596277))

(assert (=> b!620342 m!596265))

(declare-fun m!596279 () Bool)

(assert (=> b!620342 m!596279))

(assert (=> b!620342 m!596265))

(declare-fun m!596281 () Bool)

(assert (=> b!620342 m!596281))

(declare-fun m!596283 () Bool)

(assert (=> b!620342 m!596283))

(assert (=> b!620342 m!596265))

(declare-fun m!596285 () Bool)

(assert (=> b!620342 m!596285))

(assert (=> b!620342 m!596265))

(declare-fun m!596287 () Bool)

(assert (=> b!620342 m!596287))

(declare-fun m!596289 () Bool)

(assert (=> b!620342 m!596289))

(declare-fun m!596291 () Bool)

(assert (=> b!620342 m!596291))

(declare-fun m!596293 () Bool)

(assert (=> b!620345 m!596293))

(assert (=> b!620340 m!596275))

(declare-fun m!596295 () Bool)

(assert (=> b!620340 m!596295))

(assert (=> b!620340 m!596265))

(assert (=> b!620347 m!596265))

(assert (=> b!620347 m!596265))

(declare-fun m!596297 () Bool)

(assert (=> b!620347 m!596297))

(declare-fun m!596299 () Bool)

(assert (=> b!620339 m!596299))

(assert (=> b!620339 m!596265))

(assert (=> b!620339 m!596265))

(declare-fun m!596301 () Bool)

(assert (=> b!620339 m!596301))

(declare-fun m!596303 () Bool)

(assert (=> b!620337 m!596303))

(declare-fun m!596305 () Bool)

(assert (=> b!620351 m!596305))

(assert (=> b!620360 m!596265))

(assert (=> b!620360 m!596291))

(declare-fun m!596307 () Bool)

(assert (=> b!620360 m!596307))

(assert (=> b!620360 m!596265))

(declare-fun m!596309 () Bool)

(assert (=> b!620360 m!596309))

(assert (=> b!620360 m!596265))

(declare-fun m!596311 () Bool)

(assert (=> b!620360 m!596311))

(assert (=> b!620360 m!596283))

(assert (=> b!620360 m!596265))

(declare-fun m!596313 () Bool)

(assert (=> b!620360 m!596313))

(declare-fun m!596315 () Bool)

(assert (=> b!620360 m!596315))

(assert (=> b!620350 m!596265))

(assert (=> b!620350 m!596265))

(declare-fun m!596317 () Bool)

(assert (=> b!620350 m!596317))

(declare-fun m!596319 () Bool)

(assert (=> b!620346 m!596319))

(assert (=> b!620341 m!596265))

(assert (=> b!620341 m!596265))

(assert (=> b!620341 m!596285))

(declare-fun m!596321 () Bool)

(assert (=> b!620359 m!596321))

(assert (=> b!620352 m!596275))

(declare-fun m!596323 () Bool)

(assert (=> b!620352 m!596323))

(declare-fun m!596325 () Bool)

(assert (=> start!56134 m!596325))

(declare-fun m!596327 () Bool)

(assert (=> start!56134 m!596327))

(assert (=> b!620356 m!596265))

(assert (=> b!620356 m!596265))

(assert (=> b!620356 m!596297))

(declare-fun m!596329 () Bool)

(assert (=> b!620349 m!596329))

(push 1)

