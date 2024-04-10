; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58452 () Bool)

(assert start!58452)

(declare-fun b!645781 () Bool)

(declare-datatypes ((Unit!21942 0))(
  ( (Unit!21943) )
))
(declare-fun e!370115 () Unit!21942)

(declare-fun Unit!21944 () Unit!21942)

(assert (=> b!645781 (= e!370115 Unit!21944)))

(declare-fun b!645782 () Bool)

(declare-fun e!370110 () Bool)

(declare-fun e!370117 () Bool)

(assert (=> b!645782 (= e!370110 e!370117)))

(declare-fun res!418465 () Bool)

(assert (=> b!645782 (=> res!418465 e!370117)))

(declare-fun lt!299535 () (_ BitVec 64))

(declare-datatypes ((array!38468 0))(
  ( (array!38469 (arr!18446 (Array (_ BitVec 32) (_ BitVec 64))) (size!18810 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38468)

(declare-fun lt!299541 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!645782 (= res!418465 (or (not (= (select (arr!18446 a!2986) j!136) lt!299541)) (not (= (select (arr!18446 a!2986) j!136) lt!299535))))))

(declare-fun e!370120 () Bool)

(assert (=> b!645782 e!370120))

(declare-fun res!418481 () Bool)

(assert (=> b!645782 (=> (not res!418481) (not e!370120))))

(assert (=> b!645782 (= res!418481 (= lt!299535 (select (arr!18446 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!645782 (= lt!299535 (select (store (arr!18446 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!418466 () Bool)

(declare-fun e!370116 () Bool)

(assert (=> start!58452 (=> (not res!418466) (not e!370116))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58452 (= res!418466 (validMask!0 mask!3053))))

(assert (=> start!58452 e!370116))

(assert (=> start!58452 true))

(declare-fun array_inv!14242 (array!38468) Bool)

(assert (=> start!58452 (array_inv!14242 a!2986)))

(declare-fun b!645783 () Bool)

(declare-fun e!370112 () Bool)

(assert (=> b!645783 (= e!370112 (not e!370110))))

(declare-fun res!418467 () Bool)

(assert (=> b!645783 (=> res!418467 e!370110)))

(declare-datatypes ((SeekEntryResult!6886 0))(
  ( (MissingZero!6886 (index!29879 (_ BitVec 32))) (Found!6886 (index!29880 (_ BitVec 32))) (Intermediate!6886 (undefined!7698 Bool) (index!29881 (_ BitVec 32)) (x!58647 (_ BitVec 32))) (Undefined!6886) (MissingVacant!6886 (index!29882 (_ BitVec 32))) )
))
(declare-fun lt!299548 () SeekEntryResult!6886)

(assert (=> b!645783 (= res!418467 (not (= lt!299548 (Found!6886 index!984))))))

(declare-fun lt!299546 () Unit!21942)

(assert (=> b!645783 (= lt!299546 e!370115)))

(declare-fun c!74026 () Bool)

(assert (=> b!645783 (= c!74026 (= lt!299548 Undefined!6886))))

(declare-fun lt!299540 () array!38468)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38468 (_ BitVec 32)) SeekEntryResult!6886)

(assert (=> b!645783 (= lt!299548 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299541 lt!299540 mask!3053))))

(declare-fun e!370119 () Bool)

(assert (=> b!645783 e!370119))

(declare-fun res!418463 () Bool)

(assert (=> b!645783 (=> (not res!418463) (not e!370119))))

(declare-fun lt!299533 () (_ BitVec 32))

(declare-fun lt!299544 () SeekEntryResult!6886)

(assert (=> b!645783 (= res!418463 (= lt!299544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 lt!299541 lt!299540 mask!3053)))))

(assert (=> b!645783 (= lt!299544 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!645783 (= lt!299541 (select (store (arr!18446 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!299547 () Unit!21942)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21942)

(assert (=> b!645783 (= lt!299547 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!645783 (= lt!299533 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!645784 () Bool)

(declare-fun e!370122 () Bool)

(declare-fun arrayContainsKey!0 (array!38468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!645784 (= e!370122 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) index!984))))

(declare-fun b!645785 () Bool)

(declare-fun e!370121 () Unit!21942)

(declare-fun Unit!21945 () Unit!21942)

(assert (=> b!645785 (= e!370121 Unit!21945)))

(declare-fun b!645786 () Bool)

(declare-fun e!370111 () Bool)

(declare-fun e!370113 () Bool)

(assert (=> b!645786 (= e!370111 e!370113)))

(declare-fun res!418480 () Bool)

(assert (=> b!645786 (=> (not res!418480) (not e!370113))))

(assert (=> b!645786 (= res!418480 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136))))

(declare-fun b!645787 () Bool)

(declare-fun res!418474 () Bool)

(assert (=> b!645787 (=> (not res!418474) (not e!370116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!645787 (= res!418474 (validKeyInArray!0 k!1786))))

(declare-fun b!645788 () Bool)

(declare-fun e!370114 () Bool)

(assert (=> b!645788 (= e!370117 e!370114)))

(declare-fun res!418469 () Bool)

(assert (=> b!645788 (=> res!418469 e!370114)))

(assert (=> b!645788 (= res!418469 (bvsge index!984 j!136))))

(declare-fun lt!299536 () Unit!21942)

(assert (=> b!645788 (= lt!299536 e!370121)))

(declare-fun c!74027 () Bool)

(assert (=> b!645788 (= c!74027 (bvslt j!136 index!984))))

(declare-fun b!645789 () Bool)

(declare-fun res!418479 () Bool)

(assert (=> b!645789 (=> (not res!418479) (not e!370116))))

(assert (=> b!645789 (= res!418479 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!645790 () Bool)

(declare-fun res!418468 () Bool)

(declare-fun e!370108 () Bool)

(assert (=> b!645790 (=> (not res!418468) (not e!370108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38468 (_ BitVec 32)) Bool)

(assert (=> b!645790 (= res!418468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!645791 () Bool)

(declare-fun e!370118 () Bool)

(assert (=> b!645791 (= e!370118 e!370112)))

(declare-fun res!418475 () Bool)

(assert (=> b!645791 (=> (not res!418475) (not e!370112))))

(declare-fun lt!299542 () SeekEntryResult!6886)

(assert (=> b!645791 (= res!418475 (and (= lt!299542 (Found!6886 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18446 a!2986) index!984) (select (arr!18446 a!2986) j!136))) (not (= (select (arr!18446 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!645791 (= lt!299542 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645792 () Bool)

(declare-fun Unit!21946 () Unit!21942)

(assert (=> b!645792 (= e!370121 Unit!21946)))

(declare-fun lt!299545 () Unit!21942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21942)

(assert (=> b!645792 (= lt!299545 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299540 (select (arr!18446 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!645792 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299543 () Unit!21942)

(declare-datatypes ((List!12487 0))(
  ( (Nil!12484) (Cons!12483 (h!13528 (_ BitVec 64)) (t!18715 List!12487)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12487) Unit!21942)

(assert (=> b!645792 (= lt!299543 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12484))))

(declare-fun arrayNoDuplicates!0 (array!38468 (_ BitVec 32) List!12487) Bool)

(assert (=> b!645792 (arrayNoDuplicates!0 lt!299540 #b00000000000000000000000000000000 Nil!12484)))

(declare-fun lt!299534 () Unit!21942)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38468 (_ BitVec 32) (_ BitVec 32)) Unit!21942)

(assert (=> b!645792 (= lt!299534 (lemmaNoDuplicateFromThenFromBigger!0 lt!299540 #b00000000000000000000000000000000 j!136))))

(assert (=> b!645792 (arrayNoDuplicates!0 lt!299540 j!136 Nil!12484)))

(declare-fun lt!299538 () Unit!21942)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38468 (_ BitVec 64) (_ BitVec 32) List!12487) Unit!21942)

(assert (=> b!645792 (= lt!299538 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136 Nil!12484))))

(assert (=> b!645792 false))

(declare-fun b!645793 () Bool)

(assert (=> b!645793 (= e!370120 e!370111)))

(declare-fun res!418473 () Bool)

(assert (=> b!645793 (=> res!418473 e!370111)))

(assert (=> b!645793 (= res!418473 (or (not (= (select (arr!18446 a!2986) j!136) lt!299541)) (not (= (select (arr!18446 a!2986) j!136) lt!299535)) (bvsge j!136 index!984)))))

(declare-fun b!645794 () Bool)

(declare-fun res!418471 () Bool)

(assert (=> b!645794 (=> (not res!418471) (not e!370116))))

(assert (=> b!645794 (= res!418471 (validKeyInArray!0 (select (arr!18446 a!2986) j!136)))))

(declare-fun b!645795 () Bool)

(assert (=> b!645795 (= e!370119 (= lt!299542 lt!299544))))

(declare-fun b!645796 () Bool)

(assert (=> b!645796 (= e!370113 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) index!984))))

(declare-fun b!645797 () Bool)

(assert (=> b!645797 (= e!370108 e!370118)))

(declare-fun res!418476 () Bool)

(assert (=> b!645797 (=> (not res!418476) (not e!370118))))

(assert (=> b!645797 (= res!418476 (= (select (store (arr!18446 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!645797 (= lt!299540 (array!38469 (store (arr!18446 a!2986) i!1108 k!1786) (size!18810 a!2986)))))

(declare-fun b!645798 () Bool)

(declare-fun res!418472 () Bool)

(assert (=> b!645798 (=> (not res!418472) (not e!370108))))

(assert (=> b!645798 (= res!418472 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18446 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!645799 () Bool)

(declare-fun res!418478 () Bool)

(assert (=> b!645799 (=> (not res!418478) (not e!370108))))

(assert (=> b!645799 (= res!418478 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12484))))

(declare-fun b!645800 () Bool)

(declare-fun res!418470 () Bool)

(assert (=> b!645800 (=> (not res!418470) (not e!370116))))

(assert (=> b!645800 (= res!418470 (and (= (size!18810 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18810 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18810 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!645801 () Bool)

(assert (=> b!645801 (= e!370116 e!370108)))

(declare-fun res!418477 () Bool)

(assert (=> b!645801 (=> (not res!418477) (not e!370108))))

(declare-fun lt!299537 () SeekEntryResult!6886)

(assert (=> b!645801 (= res!418477 (or (= lt!299537 (MissingZero!6886 i!1108)) (= lt!299537 (MissingVacant!6886 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38468 (_ BitVec 32)) SeekEntryResult!6886)

(assert (=> b!645801 (= lt!299537 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!645802 () Bool)

(assert (=> b!645802 (= e!370114 (bvslt (size!18810 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!645802 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299539 () Unit!21942)

(assert (=> b!645802 (= lt!299539 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!645802 e!370122))

(declare-fun res!418464 () Bool)

(assert (=> b!645802 (=> (not res!418464) (not e!370122))))

(assert (=> b!645802 (= res!418464 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136))))

(declare-fun b!645803 () Bool)

(declare-fun Unit!21947 () Unit!21942)

(assert (=> b!645803 (= e!370115 Unit!21947)))

(assert (=> b!645803 false))

(assert (= (and start!58452 res!418466) b!645800))

(assert (= (and b!645800 res!418470) b!645794))

(assert (= (and b!645794 res!418471) b!645787))

(assert (= (and b!645787 res!418474) b!645789))

(assert (= (and b!645789 res!418479) b!645801))

(assert (= (and b!645801 res!418477) b!645790))

(assert (= (and b!645790 res!418468) b!645799))

(assert (= (and b!645799 res!418478) b!645798))

(assert (= (and b!645798 res!418472) b!645797))

(assert (= (and b!645797 res!418476) b!645791))

(assert (= (and b!645791 res!418475) b!645783))

(assert (= (and b!645783 res!418463) b!645795))

(assert (= (and b!645783 c!74026) b!645803))

(assert (= (and b!645783 (not c!74026)) b!645781))

(assert (= (and b!645783 (not res!418467)) b!645782))

(assert (= (and b!645782 res!418481) b!645793))

(assert (= (and b!645793 (not res!418473)) b!645786))

(assert (= (and b!645786 res!418480) b!645796))

(assert (= (and b!645782 (not res!418465)) b!645788))

(assert (= (and b!645788 c!74027) b!645792))

(assert (= (and b!645788 (not c!74027)) b!645785))

(assert (= (and b!645788 (not res!418469)) b!645802))

(assert (= (and b!645802 res!418464) b!645784))

(declare-fun m!619273 () Bool)

(assert (=> b!645789 m!619273))

(declare-fun m!619275 () Bool)

(assert (=> start!58452 m!619275))

(declare-fun m!619277 () Bool)

(assert (=> start!58452 m!619277))

(declare-fun m!619279 () Bool)

(assert (=> b!645793 m!619279))

(assert (=> b!645794 m!619279))

(assert (=> b!645794 m!619279))

(declare-fun m!619281 () Bool)

(assert (=> b!645794 m!619281))

(declare-fun m!619283 () Bool)

(assert (=> b!645792 m!619283))

(assert (=> b!645792 m!619279))

(assert (=> b!645792 m!619279))

(declare-fun m!619285 () Bool)

(assert (=> b!645792 m!619285))

(assert (=> b!645792 m!619279))

(declare-fun m!619287 () Bool)

(assert (=> b!645792 m!619287))

(declare-fun m!619289 () Bool)

(assert (=> b!645792 m!619289))

(declare-fun m!619291 () Bool)

(assert (=> b!645792 m!619291))

(assert (=> b!645792 m!619279))

(declare-fun m!619293 () Bool)

(assert (=> b!645792 m!619293))

(declare-fun m!619295 () Bool)

(assert (=> b!645792 m!619295))

(declare-fun m!619297 () Bool)

(assert (=> b!645791 m!619297))

(assert (=> b!645791 m!619279))

(assert (=> b!645791 m!619279))

(declare-fun m!619299 () Bool)

(assert (=> b!645791 m!619299))

(declare-fun m!619301 () Bool)

(assert (=> b!645787 m!619301))

(declare-fun m!619303 () Bool)

(assert (=> b!645783 m!619303))

(declare-fun m!619305 () Bool)

(assert (=> b!645783 m!619305))

(assert (=> b!645783 m!619279))

(declare-fun m!619307 () Bool)

(assert (=> b!645783 m!619307))

(declare-fun m!619309 () Bool)

(assert (=> b!645783 m!619309))

(declare-fun m!619311 () Bool)

(assert (=> b!645783 m!619311))

(declare-fun m!619313 () Bool)

(assert (=> b!645783 m!619313))

(assert (=> b!645783 m!619279))

(declare-fun m!619315 () Bool)

(assert (=> b!645783 m!619315))

(assert (=> b!645802 m!619279))

(assert (=> b!645802 m!619279))

(declare-fun m!619317 () Bool)

(assert (=> b!645802 m!619317))

(assert (=> b!645802 m!619279))

(declare-fun m!619319 () Bool)

(assert (=> b!645802 m!619319))

(assert (=> b!645802 m!619279))

(declare-fun m!619321 () Bool)

(assert (=> b!645802 m!619321))

(assert (=> b!645797 m!619307))

(declare-fun m!619323 () Bool)

(assert (=> b!645797 m!619323))

(declare-fun m!619325 () Bool)

(assert (=> b!645801 m!619325))

(assert (=> b!645796 m!619279))

(assert (=> b!645796 m!619279))

(declare-fun m!619327 () Bool)

(assert (=> b!645796 m!619327))

(declare-fun m!619329 () Bool)

(assert (=> b!645799 m!619329))

(assert (=> b!645784 m!619279))

(assert (=> b!645784 m!619279))

(assert (=> b!645784 m!619327))

(declare-fun m!619331 () Bool)

(assert (=> b!645790 m!619331))

(assert (=> b!645782 m!619279))

(assert (=> b!645782 m!619307))

(declare-fun m!619333 () Bool)

(assert (=> b!645782 m!619333))

(declare-fun m!619335 () Bool)

(assert (=> b!645798 m!619335))

(assert (=> b!645786 m!619279))

(assert (=> b!645786 m!619279))

(assert (=> b!645786 m!619321))

(push 1)

(assert (not b!645802))

(assert (not b!645783))

(assert (not b!645789))

(assert (not b!645790))

(assert (not b!645787))

(assert (not b!645796))

(assert (not b!645784))

(assert (not b!645791))

(assert (not b!645792))

(assert (not b!645801))

(assert (not start!58452))

(assert (not b!645799))

(assert (not b!645794))

(assert (not b!645786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!645829 () Bool)

(declare-fun e!370144 () Bool)

(declare-fun call!33638 () Bool)

(assert (=> b!645829 (= e!370144 call!33638)))

(declare-fun b!645830 () Bool)

(declare-fun e!370145 () Bool)

(declare-fun contains!3147 (List!12487 (_ BitVec 64)) Bool)

(assert (=> b!645830 (= e!370145 (contains!3147 Nil!12484 (select (arr!18446 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!91223 () Bool)

(declare-fun res!418497 () Bool)

(declare-fun e!370146 () Bool)

(assert (=> d!91223 (=> res!418497 e!370146)))

(assert (=> d!91223 (= res!418497 (bvsge #b00000000000000000000000000000000 (size!18810 a!2986)))))

(assert (=> d!91223 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12484) e!370146)))

(declare-fun b!645831 () Bool)

(assert (=> b!645831 (= e!370144 call!33638)))

(declare-fun b!645832 () Bool)

(declare-fun e!370143 () Bool)

(assert (=> b!645832 (= e!370143 e!370144)))

(declare-fun c!74033 () Bool)

(assert (=> b!645832 (= c!74033 (validKeyInArray!0 (select (arr!18446 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33635 () Bool)

(assert (=> bm!33635 (= call!33638 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74033 (Cons!12483 (select (arr!18446 a!2986) #b00000000000000000000000000000000) Nil!12484) Nil!12484)))))

(declare-fun b!645833 () Bool)

(assert (=> b!645833 (= e!370146 e!370143)))

(declare-fun res!418499 () Bool)

(assert (=> b!645833 (=> (not res!418499) (not e!370143))))

(assert (=> b!645833 (= res!418499 (not e!370145))))

(declare-fun res!418498 () Bool)

(assert (=> b!645833 (=> (not res!418498) (not e!370145))))

(assert (=> b!645833 (= res!418498 (validKeyInArray!0 (select (arr!18446 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91223 (not res!418497)) b!645833))

(assert (= (and b!645833 res!418498) b!645830))

(assert (= (and b!645833 res!418499) b!645832))

(assert (= (and b!645832 c!74033) b!645829))

(assert (= (and b!645832 (not c!74033)) b!645831))

(assert (= (or b!645829 b!645831) bm!33635))

(declare-fun m!619345 () Bool)

(assert (=> b!645830 m!619345))

(assert (=> b!645830 m!619345))

(declare-fun m!619347 () Bool)

(assert (=> b!645830 m!619347))

(assert (=> b!645832 m!619345))

(assert (=> b!645832 m!619345))

(declare-fun m!619349 () Bool)

(assert (=> b!645832 m!619349))

(assert (=> bm!33635 m!619345))

(declare-fun m!619351 () Bool)

(assert (=> bm!33635 m!619351))

(assert (=> b!645833 m!619345))

(assert (=> b!645833 m!619345))

(assert (=> b!645833 m!619349))

(assert (=> b!645799 d!91223))

(declare-fun d!91225 () Bool)

(assert (=> d!91225 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645787 d!91225))

(declare-fun d!91227 () Bool)

(declare-fun res!418504 () Bool)

(declare-fun e!370157 () Bool)

(assert (=> d!91227 (=> res!418504 e!370157)))

(assert (=> d!91227 (= res!418504 (= (select (arr!18446 lt!299540) j!136) (select (arr!18446 a!2986) j!136)))))

(assert (=> d!91227 (= (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136) e!370157)))

(declare-fun b!645850 () Bool)

(declare-fun e!370158 () Bool)

(assert (=> b!645850 (= e!370157 e!370158)))

(declare-fun res!418505 () Bool)

(assert (=> b!645850 (=> (not res!418505) (not e!370158))))

(assert (=> b!645850 (= res!418505 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18810 lt!299540)))))

(declare-fun b!645851 () Bool)

(assert (=> b!645851 (= e!370158 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91227 (not res!418504)) b!645850))

(assert (= (and b!645850 res!418505) b!645851))

(declare-fun m!619353 () Bool)

(assert (=> d!91227 m!619353))

(assert (=> b!645851 m!619279))

(declare-fun m!619355 () Bool)

(assert (=> b!645851 m!619355))

(assert (=> b!645786 d!91227))

(declare-fun d!91229 () Bool)

(declare-fun res!418506 () Bool)

(declare-fun e!370159 () Bool)

(assert (=> d!91229 (=> res!418506 e!370159)))

(assert (=> d!91229 (= res!418506 (= (select (arr!18446 lt!299540) index!984) (select (arr!18446 a!2986) j!136)))))

(assert (=> d!91229 (= (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) index!984) e!370159)))

(declare-fun b!645852 () Bool)

(declare-fun e!370160 () Bool)

(assert (=> b!645852 (= e!370159 e!370160)))

(declare-fun res!418507 () Bool)

(assert (=> b!645852 (=> (not res!418507) (not e!370160))))

(assert (=> b!645852 (= res!418507 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18810 lt!299540)))))

(declare-fun b!645853 () Bool)

(assert (=> b!645853 (= e!370160 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91229 (not res!418506)) b!645852))

(assert (= (and b!645852 res!418507) b!645853))

(declare-fun m!619357 () Bool)

(assert (=> d!91229 m!619357))

(assert (=> b!645853 m!619279))

(declare-fun m!619359 () Bool)

(assert (=> b!645853 m!619359))

(assert (=> b!645796 d!91229))

(assert (=> b!645784 d!91229))

(declare-fun d!91231 () Bool)

(assert (=> d!91231 (= (validKeyInArray!0 (select (arr!18446 a!2986) j!136)) (and (not (= (select (arr!18446 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18446 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!645794 d!91231))

(declare-fun d!91233 () Bool)

(declare-fun e!370190 () Bool)

(assert (=> d!91233 e!370190))

(declare-fun res!418531 () Bool)

(assert (=> d!91233 (=> (not res!418531) (not e!370190))))

(assert (=> d!91233 (= res!418531 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18810 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18810 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18810 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18810 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18810 a!2986))))))

(declare-fun lt!299563 () Unit!21942)

(declare-fun choose!9 (array!38468 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21942)

(assert (=> d!91233 (= lt!299563 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91233 (validMask!0 mask!3053)))

(assert (=> d!91233 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 mask!3053) lt!299563)))

(declare-fun b!645889 () Bool)

(assert (=> b!645889 (= e!370190 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 (select (store (arr!18446 a!2986) i!1108 k!1786) j!136) (array!38469 (store (arr!18446 a!2986) i!1108 k!1786) (size!18810 a!2986)) mask!3053)))))

(assert (= (and d!91233 res!418531) b!645889))

(declare-fun m!619387 () Bool)

(assert (=> d!91233 m!619387))

(assert (=> d!91233 m!619275))

(assert (=> b!645889 m!619279))

(assert (=> b!645889 m!619279))

(assert (=> b!645889 m!619315))

(assert (=> b!645889 m!619311))

(declare-fun m!619389 () Bool)

(assert (=> b!645889 m!619389))

(assert (=> b!645889 m!619311))

(assert (=> b!645889 m!619307))

(assert (=> b!645783 d!91233))

(declare-fun d!91249 () Bool)

(declare-fun lt!299577 () SeekEntryResult!6886)

(assert (=> d!91249 (and (or (is-Undefined!6886 lt!299577) (not (is-Found!6886 lt!299577)) (and (bvsge (index!29880 lt!299577) #b00000000000000000000000000000000) (bvslt (index!29880 lt!299577) (size!18810 lt!299540)))) (or (is-Undefined!6886 lt!299577) (is-Found!6886 lt!299577) (not (is-MissingVacant!6886 lt!299577)) (not (= (index!29882 lt!299577) vacantSpotIndex!68)) (and (bvsge (index!29882 lt!299577) #b00000000000000000000000000000000) (bvslt (index!29882 lt!299577) (size!18810 lt!299540)))) (or (is-Undefined!6886 lt!299577) (ite (is-Found!6886 lt!299577) (= (select (arr!18446 lt!299540) (index!29880 lt!299577)) lt!299541) (and (is-MissingVacant!6886 lt!299577) (= (index!29882 lt!299577) vacantSpotIndex!68) (= (select (arr!18446 lt!299540) (index!29882 lt!299577)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370208 () SeekEntryResult!6886)

(assert (=> d!91249 (= lt!299577 e!370208)))

(declare-fun c!74054 () Bool)

(assert (=> d!91249 (= c!74054 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!299578 () (_ BitVec 64))

(assert (=> d!91249 (= lt!299578 (select (arr!18446 lt!299540) lt!299533))))

(assert (=> d!91249 (validMask!0 mask!3053)))

(assert (=> d!91249 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 lt!299541 lt!299540 mask!3053) lt!299577)))

(declare-fun b!645915 () Bool)

(assert (=> b!645915 (= e!370208 Undefined!6886)))

(declare-fun b!645916 () Bool)

(declare-fun c!74055 () Bool)

(assert (=> b!645916 (= c!74055 (= lt!299578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370209 () SeekEntryResult!6886)

(declare-fun e!370210 () SeekEntryResult!6886)

(assert (=> b!645916 (= e!370209 e!370210)))

(declare-fun b!645917 () Bool)

(assert (=> b!645917 (= e!370210 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!645918 () Bool)

(assert (=> b!645918 (= e!370210 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299533 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!299541 lt!299540 mask!3053))))

(declare-fun b!645919 () Bool)

(assert (=> b!645919 (= e!370208 e!370209)))

(declare-fun c!74056 () Bool)

(assert (=> b!645919 (= c!74056 (= lt!299578 lt!299541))))

(declare-fun b!645920 () Bool)

(assert (=> b!645920 (= e!370209 (Found!6886 lt!299533))))

(assert (= (and d!91249 c!74054) b!645915))

(assert (= (and d!91249 (not c!74054)) b!645919))

(assert (= (and b!645919 c!74056) b!645920))

(assert (= (and b!645919 (not c!74056)) b!645916))

(assert (= (and b!645916 c!74055) b!645917))

(assert (= (and b!645916 (not c!74055)) b!645918))

(declare-fun m!619415 () Bool)

(assert (=> d!91249 m!619415))

(declare-fun m!619417 () Bool)

(assert (=> d!91249 m!619417))

(declare-fun m!619419 () Bool)

(assert (=> d!91249 m!619419))

(assert (=> d!91249 m!619275))

(declare-fun m!619421 () Bool)

(assert (=> b!645918 m!619421))

(assert (=> b!645918 m!619421))

(declare-fun m!619423 () Bool)

(assert (=> b!645918 m!619423))

(assert (=> b!645783 d!91249))

(declare-fun lt!299579 () SeekEntryResult!6886)

(declare-fun d!91265 () Bool)

(assert (=> d!91265 (and (or (is-Undefined!6886 lt!299579) (not (is-Found!6886 lt!299579)) (and (bvsge (index!29880 lt!299579) #b00000000000000000000000000000000) (bvslt (index!29880 lt!299579) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299579) (is-Found!6886 lt!299579) (not (is-MissingVacant!6886 lt!299579)) (not (= (index!29882 lt!299579) vacantSpotIndex!68)) (and (bvsge (index!29882 lt!299579) #b00000000000000000000000000000000) (bvslt (index!29882 lt!299579) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299579) (ite (is-Found!6886 lt!299579) (= (select (arr!18446 a!2986) (index!29880 lt!299579)) (select (arr!18446 a!2986) j!136)) (and (is-MissingVacant!6886 lt!299579) (= (index!29882 lt!299579) vacantSpotIndex!68) (= (select (arr!18446 a!2986) (index!29882 lt!299579)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370211 () SeekEntryResult!6886)

(assert (=> d!91265 (= lt!299579 e!370211)))

(declare-fun c!74057 () Bool)

(assert (=> d!91265 (= c!74057 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!299580 () (_ BitVec 64))

(assert (=> d!91265 (= lt!299580 (select (arr!18446 a!2986) lt!299533))))

(assert (=> d!91265 (validMask!0 mask!3053)))

(assert (=> d!91265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299533 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053) lt!299579)))

(declare-fun b!645921 () Bool)

(assert (=> b!645921 (= e!370211 Undefined!6886)))

(declare-fun b!645922 () Bool)

(declare-fun c!74058 () Bool)

(assert (=> b!645922 (= c!74058 (= lt!299580 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370212 () SeekEntryResult!6886)

(declare-fun e!370213 () SeekEntryResult!6886)

(assert (=> b!645922 (= e!370212 e!370213)))

(declare-fun b!645923 () Bool)

(assert (=> b!645923 (= e!370213 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!645924 () Bool)

(assert (=> b!645924 (= e!370213 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!299533 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!645925 () Bool)

(assert (=> b!645925 (= e!370211 e!370212)))

(declare-fun c!74059 () Bool)

(assert (=> b!645925 (= c!74059 (= lt!299580 (select (arr!18446 a!2986) j!136)))))

(declare-fun b!645926 () Bool)

(assert (=> b!645926 (= e!370212 (Found!6886 lt!299533))))

(assert (= (and d!91265 c!74057) b!645921))

(assert (= (and d!91265 (not c!74057)) b!645925))

(assert (= (and b!645925 c!74059) b!645926))

(assert (= (and b!645925 (not c!74059)) b!645922))

(assert (= (and b!645922 c!74058) b!645923))

(assert (= (and b!645922 (not c!74058)) b!645924))

(declare-fun m!619425 () Bool)

(assert (=> d!91265 m!619425))

(declare-fun m!619427 () Bool)

(assert (=> d!91265 m!619427))

(declare-fun m!619429 () Bool)

(assert (=> d!91265 m!619429))

(assert (=> d!91265 m!619275))

(assert (=> b!645924 m!619421))

(assert (=> b!645924 m!619421))

(assert (=> b!645924 m!619279))

(declare-fun m!619431 () Bool)

(assert (=> b!645924 m!619431))

(assert (=> b!645783 d!91265))

(declare-fun d!91267 () Bool)

(declare-fun lt!299587 () (_ BitVec 32))

(assert (=> d!91267 (and (bvsge lt!299587 #b00000000000000000000000000000000) (bvslt lt!299587 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91267 (= lt!299587 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91267 (validMask!0 mask!3053)))

(assert (=> d!91267 (= (nextIndex!0 index!984 x!910 mask!3053) lt!299587)))

(declare-fun bs!19298 () Bool)

(assert (= bs!19298 d!91267))

(declare-fun m!619433 () Bool)

(assert (=> bs!19298 m!619433))

(assert (=> bs!19298 m!619275))

(assert (=> b!645783 d!91267))

(declare-fun d!91269 () Bool)

(declare-fun lt!299588 () SeekEntryResult!6886)

(assert (=> d!91269 (and (or (is-Undefined!6886 lt!299588) (not (is-Found!6886 lt!299588)) (and (bvsge (index!29880 lt!299588) #b00000000000000000000000000000000) (bvslt (index!29880 lt!299588) (size!18810 lt!299540)))) (or (is-Undefined!6886 lt!299588) (is-Found!6886 lt!299588) (not (is-MissingVacant!6886 lt!299588)) (not (= (index!29882 lt!299588) vacantSpotIndex!68)) (and (bvsge (index!29882 lt!299588) #b00000000000000000000000000000000) (bvslt (index!29882 lt!299588) (size!18810 lt!299540)))) (or (is-Undefined!6886 lt!299588) (ite (is-Found!6886 lt!299588) (= (select (arr!18446 lt!299540) (index!29880 lt!299588)) lt!299541) (and (is-MissingVacant!6886 lt!299588) (= (index!29882 lt!299588) vacantSpotIndex!68) (= (select (arr!18446 lt!299540) (index!29882 lt!299588)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370220 () SeekEntryResult!6886)

(assert (=> d!91269 (= lt!299588 e!370220)))

(declare-fun c!74066 () Bool)

(assert (=> d!91269 (= c!74066 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!299589 () (_ BitVec 64))

(assert (=> d!91269 (= lt!299589 (select (arr!18446 lt!299540) index!984))))

(assert (=> d!91269 (validMask!0 mask!3053)))

(assert (=> d!91269 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299541 lt!299540 mask!3053) lt!299588)))

(declare-fun b!645939 () Bool)

(assert (=> b!645939 (= e!370220 Undefined!6886)))

(declare-fun b!645940 () Bool)

(declare-fun c!74067 () Bool)

(assert (=> b!645940 (= c!74067 (= lt!299589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370221 () SeekEntryResult!6886)

(declare-fun e!370222 () SeekEntryResult!6886)

(assert (=> b!645940 (= e!370221 e!370222)))

(declare-fun b!645941 () Bool)

(assert (=> b!645941 (= e!370222 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!645942 () Bool)

(assert (=> b!645942 (= e!370222 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!299541 lt!299540 mask!3053))))

(declare-fun b!645943 () Bool)

(assert (=> b!645943 (= e!370220 e!370221)))

(declare-fun c!74068 () Bool)

(assert (=> b!645943 (= c!74068 (= lt!299589 lt!299541))))

(declare-fun b!645944 () Bool)

(assert (=> b!645944 (= e!370221 (Found!6886 index!984))))

(assert (= (and d!91269 c!74066) b!645939))

(assert (= (and d!91269 (not c!74066)) b!645943))

(assert (= (and b!645943 c!74068) b!645944))

(assert (= (and b!645943 (not c!74068)) b!645940))

(assert (= (and b!645940 c!74067) b!645941))

(assert (= (and b!645940 (not c!74067)) b!645942))

(declare-fun m!619435 () Bool)

(assert (=> d!91269 m!619435))

(declare-fun m!619437 () Bool)

(assert (=> d!91269 m!619437))

(assert (=> d!91269 m!619357))

(assert (=> d!91269 m!619275))

(assert (=> b!645942 m!619303))

(assert (=> b!645942 m!619303))

(declare-fun m!619439 () Bool)

(assert (=> b!645942 m!619439))

(assert (=> b!645783 d!91269))

(declare-fun d!91271 () Bool)

(assert (=> d!91271 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299594 () Unit!21942)

(declare-fun choose!114 (array!38468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21942)

(assert (=> d!91271 (= lt!299594 (choose!114 lt!299540 (select (arr!18446 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91271 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91271 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299540 (select (arr!18446 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!299594)))

(declare-fun bs!19299 () Bool)

(assert (= bs!19299 d!91271))

(assert (=> bs!19299 m!619279))

(assert (=> bs!19299 m!619285))

(assert (=> bs!19299 m!619279))

(declare-fun m!619447 () Bool)

(assert (=> bs!19299 m!619447))

(assert (=> b!645792 d!91271))

(declare-fun d!91275 () Bool)

(declare-fun res!418541 () Bool)

(declare-fun e!370226 () Bool)

(assert (=> d!91275 (=> res!418541 e!370226)))

(assert (=> d!91275 (= res!418541 (= (select (arr!18446 lt!299540) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18446 a!2986) j!136)))))

(assert (=> d!91275 (= (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!370226)))

(declare-fun b!645951 () Bool)

(declare-fun e!370227 () Bool)

(assert (=> b!645951 (= e!370226 e!370227)))

(declare-fun res!418542 () Bool)

(assert (=> b!645951 (=> (not res!418542) (not e!370227))))

(assert (=> b!645951 (= res!418542 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18810 lt!299540)))))

(declare-fun b!645952 () Bool)

(assert (=> b!645952 (= e!370227 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91275 (not res!418541)) b!645951))

(assert (= (and b!645951 res!418542) b!645952))

(declare-fun m!619449 () Bool)

(assert (=> d!91275 m!619449))

(assert (=> b!645952 m!619279))

(declare-fun m!619451 () Bool)

(assert (=> b!645952 m!619451))

(assert (=> b!645792 d!91275))

(declare-fun d!91277 () Bool)

(assert (=> d!91277 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18810 lt!299540)) (not (= (select (arr!18446 lt!299540) j!136) (select (arr!18446 a!2986) j!136))))))

(declare-fun lt!299600 () Unit!21942)

(declare-fun choose!21 (array!38468 (_ BitVec 64) (_ BitVec 32) List!12487) Unit!21942)

(assert (=> d!91277 (= lt!299600 (choose!21 lt!299540 (select (arr!18446 a!2986) j!136) j!136 Nil!12484))))

(assert (=> d!91277 (bvslt (size!18810 lt!299540) #b01111111111111111111111111111111)))

(assert (=> d!91277 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136 Nil!12484) lt!299600)))

(declare-fun bs!19300 () Bool)

(assert (= bs!19300 d!91277))

(assert (=> bs!19300 m!619353))

(assert (=> bs!19300 m!619279))

(declare-fun m!619457 () Bool)

(assert (=> bs!19300 m!619457))

(assert (=> b!645792 d!91277))

(declare-fun b!645956 () Bool)

(declare-fun e!370232 () Bool)

(declare-fun call!33644 () Bool)

(assert (=> b!645956 (= e!370232 call!33644)))

(declare-fun b!645957 () Bool)

(declare-fun e!370233 () Bool)

(assert (=> b!645957 (= e!370233 (contains!3147 Nil!12484 (select (arr!18446 lt!299540) j!136)))))

(declare-fun d!91281 () Bool)

(declare-fun res!418546 () Bool)

(declare-fun e!370234 () Bool)

(assert (=> d!91281 (=> res!418546 e!370234)))

(assert (=> d!91281 (= res!418546 (bvsge j!136 (size!18810 lt!299540)))))

(assert (=> d!91281 (= (arrayNoDuplicates!0 lt!299540 j!136 Nil!12484) e!370234)))

(declare-fun b!645958 () Bool)

(assert (=> b!645958 (= e!370232 call!33644)))

(declare-fun b!645959 () Bool)

(declare-fun e!370231 () Bool)

(assert (=> b!645959 (= e!370231 e!370232)))

(declare-fun c!74072 () Bool)

(assert (=> b!645959 (= c!74072 (validKeyInArray!0 (select (arr!18446 lt!299540) j!136)))))

(declare-fun bm!33641 () Bool)

(assert (=> bm!33641 (= call!33644 (arrayNoDuplicates!0 lt!299540 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74072 (Cons!12483 (select (arr!18446 lt!299540) j!136) Nil!12484) Nil!12484)))))

(declare-fun b!645960 () Bool)

(assert (=> b!645960 (= e!370234 e!370231)))

(declare-fun res!418548 () Bool)

(assert (=> b!645960 (=> (not res!418548) (not e!370231))))

(assert (=> b!645960 (= res!418548 (not e!370233))))

(declare-fun res!418547 () Bool)

(assert (=> b!645960 (=> (not res!418547) (not e!370233))))

(assert (=> b!645960 (= res!418547 (validKeyInArray!0 (select (arr!18446 lt!299540) j!136)))))

(assert (= (and d!91281 (not res!418546)) b!645960))

(assert (= (and b!645960 res!418547) b!645957))

(assert (= (and b!645960 res!418548) b!645959))

(assert (= (and b!645959 c!74072) b!645956))

(assert (= (and b!645959 (not c!74072)) b!645958))

(assert (= (or b!645956 b!645958) bm!33641))

(assert (=> b!645957 m!619353))

(assert (=> b!645957 m!619353))

(declare-fun m!619459 () Bool)

(assert (=> b!645957 m!619459))

(assert (=> b!645959 m!619353))

(assert (=> b!645959 m!619353))

(declare-fun m!619461 () Bool)

(assert (=> b!645959 m!619461))

(assert (=> bm!33641 m!619353))

(declare-fun m!619463 () Bool)

(assert (=> bm!33641 m!619463))

(assert (=> b!645960 m!619353))

(assert (=> b!645960 m!619353))

(assert (=> b!645960 m!619461))

(assert (=> b!645792 d!91281))

(declare-fun d!91283 () Bool)

(declare-fun e!370246 () Bool)

(assert (=> d!91283 e!370246))

(declare-fun res!418551 () Bool)

(assert (=> d!91283 (=> (not res!418551) (not e!370246))))

(assert (=> d!91283 (= res!418551 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18810 a!2986))))))

(declare-fun lt!299612 () Unit!21942)

(declare-fun choose!41 (array!38468 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12487) Unit!21942)

(assert (=> d!91283 (= lt!299612 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12484))))

(assert (=> d!91283 (bvslt (size!18810 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91283 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12484) lt!299612)))

(declare-fun b!645981 () Bool)

(assert (=> b!645981 (= e!370246 (arrayNoDuplicates!0 (array!38469 (store (arr!18446 a!2986) i!1108 k!1786) (size!18810 a!2986)) #b00000000000000000000000000000000 Nil!12484))))

(assert (= (and d!91283 res!418551) b!645981))

(declare-fun m!619485 () Bool)

(assert (=> d!91283 m!619485))

(assert (=> b!645981 m!619307))

(declare-fun m!619487 () Bool)

(assert (=> b!645981 m!619487))

(assert (=> b!645792 d!91283))

(declare-fun d!91291 () Bool)

(assert (=> d!91291 (arrayNoDuplicates!0 lt!299540 j!136 Nil!12484)))

(declare-fun lt!299617 () Unit!21942)

(declare-fun choose!39 (array!38468 (_ BitVec 32) (_ BitVec 32)) Unit!21942)

(assert (=> d!91291 (= lt!299617 (choose!39 lt!299540 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91291 (bvslt (size!18810 lt!299540) #b01111111111111111111111111111111)))

(assert (=> d!91291 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!299540 #b00000000000000000000000000000000 j!136) lt!299617)))

(declare-fun bs!19302 () Bool)

(assert (= bs!19302 d!91291))

(assert (=> bs!19302 m!619291))

(declare-fun m!619499 () Bool)

(assert (=> bs!19302 m!619499))

(assert (=> b!645792 d!91291))

(declare-fun b!645987 () Bool)

(declare-fun e!370253 () Bool)

(declare-fun call!33645 () Bool)

(assert (=> b!645987 (= e!370253 call!33645)))

(declare-fun b!645988 () Bool)

(declare-fun e!370254 () Bool)

(assert (=> b!645988 (= e!370254 (contains!3147 Nil!12484 (select (arr!18446 lt!299540) #b00000000000000000000000000000000)))))

(declare-fun d!91299 () Bool)

(declare-fun res!418557 () Bool)

(declare-fun e!370255 () Bool)

(assert (=> d!91299 (=> res!418557 e!370255)))

(assert (=> d!91299 (= res!418557 (bvsge #b00000000000000000000000000000000 (size!18810 lt!299540)))))

(assert (=> d!91299 (= (arrayNoDuplicates!0 lt!299540 #b00000000000000000000000000000000 Nil!12484) e!370255)))

(declare-fun b!645989 () Bool)

(assert (=> b!645989 (= e!370253 call!33645)))

(declare-fun b!645990 () Bool)

(declare-fun e!370252 () Bool)

(assert (=> b!645990 (= e!370252 e!370253)))

(declare-fun c!74082 () Bool)

(assert (=> b!645990 (= c!74082 (validKeyInArray!0 (select (arr!18446 lt!299540) #b00000000000000000000000000000000)))))

(declare-fun bm!33642 () Bool)

(assert (=> bm!33642 (= call!33645 (arrayNoDuplicates!0 lt!299540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74082 (Cons!12483 (select (arr!18446 lt!299540) #b00000000000000000000000000000000) Nil!12484) Nil!12484)))))

(declare-fun b!645991 () Bool)

(assert (=> b!645991 (= e!370255 e!370252)))

(declare-fun res!418559 () Bool)

(assert (=> b!645991 (=> (not res!418559) (not e!370252))))

(assert (=> b!645991 (= res!418559 (not e!370254))))

(declare-fun res!418558 () Bool)

(assert (=> b!645991 (=> (not res!418558) (not e!370254))))

(assert (=> b!645991 (= res!418558 (validKeyInArray!0 (select (arr!18446 lt!299540) #b00000000000000000000000000000000)))))

(assert (= (and d!91299 (not res!418557)) b!645991))

(assert (= (and b!645991 res!418558) b!645988))

(assert (= (and b!645991 res!418559) b!645990))

(assert (= (and b!645990 c!74082) b!645987))

(assert (= (and b!645990 (not c!74082)) b!645989))

(assert (= (or b!645987 b!645989) bm!33642))

(declare-fun m!619505 () Bool)

(assert (=> b!645988 m!619505))

(assert (=> b!645988 m!619505))

(declare-fun m!619507 () Bool)

(assert (=> b!645988 m!619507))

(assert (=> b!645990 m!619505))

(assert (=> b!645990 m!619505))

(declare-fun m!619509 () Bool)

(assert (=> b!645990 m!619509))

(assert (=> bm!33642 m!619505))

(declare-fun m!619511 () Bool)

(assert (=> bm!33642 m!619511))

(assert (=> b!645991 m!619505))

(assert (=> b!645991 m!619505))

(assert (=> b!645991 m!619509))

(assert (=> b!645792 d!91299))

(declare-fun d!91303 () Bool)

(declare-fun res!418560 () Bool)

(declare-fun e!370259 () Bool)

(assert (=> d!91303 (=> res!418560 e!370259)))

(assert (=> d!91303 (= res!418560 (= (select (arr!18446 lt!299540) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18446 a!2986) j!136)))))

(assert (=> d!91303 (= (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!370259)))

(declare-fun b!645998 () Bool)

(declare-fun e!370260 () Bool)

(assert (=> b!645998 (= e!370259 e!370260)))

(declare-fun res!418561 () Bool)

(assert (=> b!645998 (=> (not res!418561) (not e!370260))))

(assert (=> b!645998 (= res!418561 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18810 lt!299540)))))

(declare-fun b!645999 () Bool)

(assert (=> b!645999 (= e!370260 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91303 (not res!418560)) b!645998))

(assert (= (and b!645998 res!418561) b!645999))

(declare-fun m!619513 () Bool)

(assert (=> d!91303 m!619513))

(assert (=> b!645999 m!619279))

(declare-fun m!619517 () Bool)

(assert (=> b!645999 m!619517))

(assert (=> b!645802 d!91303))

(declare-fun d!91305 () Bool)

(assert (=> d!91305 (arrayContainsKey!0 lt!299540 (select (arr!18446 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299621 () Unit!21942)

(assert (=> d!91305 (= lt!299621 (choose!114 lt!299540 (select (arr!18446 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91305 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91305 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299540 (select (arr!18446 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!299621)))

(declare-fun bs!19303 () Bool)

(assert (= bs!19303 d!91305))

(assert (=> bs!19303 m!619279))

(assert (=> bs!19303 m!619317))

(assert (=> bs!19303 m!619279))

(declare-fun m!619527 () Bool)

(assert (=> bs!19303 m!619527))

(assert (=> b!645802 d!91305))

(assert (=> b!645802 d!91227))

(declare-fun d!91309 () Bool)

(assert (=> d!91309 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58452 d!91309))

(declare-fun d!91323 () Bool)

(assert (=> d!91323 (= (array_inv!14242 a!2986) (bvsge (size!18810 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58452 d!91323))

(declare-fun lt!299632 () SeekEntryResult!6886)

(declare-fun d!91325 () Bool)

(assert (=> d!91325 (and (or (is-Undefined!6886 lt!299632) (not (is-Found!6886 lt!299632)) (and (bvsge (index!29880 lt!299632) #b00000000000000000000000000000000) (bvslt (index!29880 lt!299632) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299632) (is-Found!6886 lt!299632) (not (is-MissingVacant!6886 lt!299632)) (not (= (index!29882 lt!299632) vacantSpotIndex!68)) (and (bvsge (index!29882 lt!299632) #b00000000000000000000000000000000) (bvslt (index!29882 lt!299632) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299632) (ite (is-Found!6886 lt!299632) (= (select (arr!18446 a!2986) (index!29880 lt!299632)) (select (arr!18446 a!2986) j!136)) (and (is-MissingVacant!6886 lt!299632) (= (index!29882 lt!299632) vacantSpotIndex!68) (= (select (arr!18446 a!2986) (index!29882 lt!299632)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!370274 () SeekEntryResult!6886)

(assert (=> d!91325 (= lt!299632 e!370274)))

(declare-fun c!74091 () Bool)

(assert (=> d!91325 (= c!74091 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!299633 () (_ BitVec 64))

(assert (=> d!91325 (= lt!299633 (select (arr!18446 a!2986) index!984))))

(assert (=> d!91325 (validMask!0 mask!3053)))

(assert (=> d!91325 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053) lt!299632)))

(declare-fun b!646018 () Bool)

(assert (=> b!646018 (= e!370274 Undefined!6886)))

(declare-fun b!646019 () Bool)

(declare-fun c!74092 () Bool)

(assert (=> b!646019 (= c!74092 (= lt!299633 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370275 () SeekEntryResult!6886)

(declare-fun e!370276 () SeekEntryResult!6886)

(assert (=> b!646019 (= e!370275 e!370276)))

(declare-fun b!646020 () Bool)

(assert (=> b!646020 (= e!370276 (MissingVacant!6886 vacantSpotIndex!68))))

(declare-fun b!646021 () Bool)

(assert (=> b!646021 (= e!370276 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646022 () Bool)

(assert (=> b!646022 (= e!370274 e!370275)))

(declare-fun c!74093 () Bool)

(assert (=> b!646022 (= c!74093 (= lt!299633 (select (arr!18446 a!2986) j!136)))))

(declare-fun b!646023 () Bool)

(assert (=> b!646023 (= e!370275 (Found!6886 index!984))))

(assert (= (and d!91325 c!74091) b!646018))

(assert (= (and d!91325 (not c!74091)) b!646022))

(assert (= (and b!646022 c!74093) b!646023))

(assert (= (and b!646022 (not c!74093)) b!646019))

(assert (= (and b!646019 c!74092) b!646020))

(assert (= (and b!646019 (not c!74092)) b!646021))

(declare-fun m!619561 () Bool)

(assert (=> d!91325 m!619561))

(declare-fun m!619565 () Bool)

(assert (=> d!91325 m!619565))

(assert (=> d!91325 m!619297))

(assert (=> d!91325 m!619275))

(assert (=> b!646021 m!619303))

(assert (=> b!646021 m!619303))

(assert (=> b!646021 m!619279))

(declare-fun m!619567 () Bool)

(assert (=> b!646021 m!619567))

(assert (=> b!645791 d!91325))

(declare-fun b!646059 () Bool)

(declare-fun e!370301 () Bool)

(declare-fun call!33650 () Bool)

(assert (=> b!646059 (= e!370301 call!33650)))

(declare-fun d!91329 () Bool)

(declare-fun res!418584 () Bool)

(declare-fun e!370303 () Bool)

(assert (=> d!91329 (=> res!418584 e!370303)))

(assert (=> d!91329 (= res!418584 (bvsge #b00000000000000000000000000000000 (size!18810 a!2986)))))

(assert (=> d!91329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!370303)))

(declare-fun b!646060 () Bool)

(assert (=> b!646060 (= e!370303 e!370301)))

(declare-fun c!74105 () Bool)

(assert (=> b!646060 (= c!74105 (validKeyInArray!0 (select (arr!18446 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!646061 () Bool)

(declare-fun e!370302 () Bool)

(assert (=> b!646061 (= e!370301 e!370302)))

(declare-fun lt!299653 () (_ BitVec 64))

(assert (=> b!646061 (= lt!299653 (select (arr!18446 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!299655 () Unit!21942)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38468 (_ BitVec 64) (_ BitVec 32)) Unit!21942)

(assert (=> b!646061 (= lt!299655 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!299653 #b00000000000000000000000000000000))))

(assert (=> b!646061 (arrayContainsKey!0 a!2986 lt!299653 #b00000000000000000000000000000000)))

(declare-fun lt!299654 () Unit!21942)

(assert (=> b!646061 (= lt!299654 lt!299655)))

(declare-fun res!418583 () Bool)

(assert (=> b!646061 (= res!418583 (= (seekEntryOrOpen!0 (select (arr!18446 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6886 #b00000000000000000000000000000000)))))

(assert (=> b!646061 (=> (not res!418583) (not e!370302))))

(declare-fun b!646062 () Bool)

(assert (=> b!646062 (= e!370302 call!33650)))

(declare-fun bm!33647 () Bool)

(assert (=> bm!33647 (= call!33650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!91329 (not res!418584)) b!646060))

(assert (= (and b!646060 c!74105) b!646061))

(assert (= (and b!646060 (not c!74105)) b!646059))

(assert (= (and b!646061 res!418583) b!646062))

(assert (= (or b!646062 b!646059) bm!33647))

(assert (=> b!646060 m!619345))

(assert (=> b!646060 m!619345))

(assert (=> b!646060 m!619349))

(assert (=> b!646061 m!619345))

(declare-fun m!619589 () Bool)

(assert (=> b!646061 m!619589))

(declare-fun m!619591 () Bool)

(assert (=> b!646061 m!619591))

(assert (=> b!646061 m!619345))

(declare-fun m!619593 () Bool)

(assert (=> b!646061 m!619593))

(declare-fun m!619595 () Bool)

(assert (=> bm!33647 m!619595))

(assert (=> b!645790 d!91329))

(declare-fun b!646083 () Bool)

(declare-fun c!74116 () Bool)

(declare-fun lt!299665 () (_ BitVec 64))

(assert (=> b!646083 (= c!74116 (= lt!299665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!370315 () SeekEntryResult!6886)

(declare-fun e!370317 () SeekEntryResult!6886)

(assert (=> b!646083 (= e!370315 e!370317)))

(declare-fun d!91343 () Bool)

(declare-fun lt!299666 () SeekEntryResult!6886)

(assert (=> d!91343 (and (or (is-Undefined!6886 lt!299666) (not (is-Found!6886 lt!299666)) (and (bvsge (index!29880 lt!299666) #b00000000000000000000000000000000) (bvslt (index!29880 lt!299666) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299666) (is-Found!6886 lt!299666) (not (is-MissingZero!6886 lt!299666)) (and (bvsge (index!29879 lt!299666) #b00000000000000000000000000000000) (bvslt (index!29879 lt!299666) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299666) (is-Found!6886 lt!299666) (is-MissingZero!6886 lt!299666) (not (is-MissingVacant!6886 lt!299666)) (and (bvsge (index!29882 lt!299666) #b00000000000000000000000000000000) (bvslt (index!29882 lt!299666) (size!18810 a!2986)))) (or (is-Undefined!6886 lt!299666) (ite (is-Found!6886 lt!299666) (= (select (arr!18446 a!2986) (index!29880 lt!299666)) k!1786) (ite (is-MissingZero!6886 lt!299666) (= (select (arr!18446 a!2986) (index!29879 lt!299666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6886 lt!299666) (= (select (arr!18446 a!2986) (index!29882 lt!299666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!370316 () SeekEntryResult!6886)

(assert (=> d!91343 (= lt!299666 e!370316)))

(declare-fun c!74115 () Bool)

(declare-fun lt!299667 () SeekEntryResult!6886)

(assert (=> d!91343 (= c!74115 (and (is-Intermediate!6886 lt!299667) (undefined!7698 lt!299667)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38468 (_ BitVec 32)) SeekEntryResult!6886)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91343 (= lt!299667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!91343 (validMask!0 mask!3053)))

(assert (=> d!91343 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!299666)))

(declare-fun b!646084 () Bool)

(assert (=> b!646084 (= e!370317 (seekKeyOrZeroReturnVacant!0 (x!58647 lt!299667) (index!29881 lt!299667) (index!29881 lt!299667) k!1786 a!2986 mask!3053))))

(declare-fun b!646085 () Bool)

(assert (=> b!646085 (= e!370316 e!370315)))

(assert (=> b!646085 (= lt!299665 (select (arr!18446 a!2986) (index!29881 lt!299667)))))

(declare-fun c!74117 () Bool)

(assert (=> b!646085 (= c!74117 (= lt!299665 k!1786))))

(declare-fun b!646086 () Bool)

(assert (=> b!646086 (= e!370316 Undefined!6886)))

(declare-fun b!646087 () Bool)

(assert (=> b!646087 (= e!370315 (Found!6886 (index!29881 lt!299667)))))

(declare-fun b!646088 () Bool)

(assert (=> b!646088 (= e!370317 (MissingZero!6886 (index!29881 lt!299667)))))

(assert (= (and d!91343 c!74115) b!646086))

(assert (= (and d!91343 (not c!74115)) b!646085))

(assert (= (and b!646085 c!74117) b!646087))

(assert (= (and b!646085 (not c!74117)) b!646083))

(assert (= (and b!646083 c!74116) b!646088))

(assert (= (and b!646083 (not c!74116)) b!646084))

(declare-fun m!619613 () Bool)

(assert (=> d!91343 m!619613))

(assert (=> d!91343 m!619275))

(assert (=> d!91343 m!619613))

(declare-fun m!619615 () Bool)

(assert (=> d!91343 m!619615))

(declare-fun m!619617 () Bool)

(assert (=> d!91343 m!619617))

(declare-fun m!619619 () Bool)

(assert (=> d!91343 m!619619))

(declare-fun m!619621 () Bool)

(assert (=> d!91343 m!619621))

(declare-fun m!619623 () Bool)

(assert (=> b!646084 m!619623))

(declare-fun m!619625 () Bool)

(assert (=> b!646085 m!619625))

(assert (=> b!645801 d!91343))

(declare-fun d!91357 () Bool)

(declare-fun res!418587 () Bool)

(declare-fun e!370318 () Bool)

(assert (=> d!91357 (=> res!418587 e!370318)))

(assert (=> d!91357 (= res!418587 (= (select (arr!18446 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!91357 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!370318)))

(declare-fun b!646089 () Bool)

(declare-fun e!370319 () Bool)

(assert (=> b!646089 (= e!370318 e!370319)))

(declare-fun res!418588 () Bool)

(assert (=> b!646089 (=> (not res!418588) (not e!370319))))

(assert (=> b!646089 (= res!418588 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18810 a!2986)))))

(declare-fun b!646090 () Bool)

(assert (=> b!646090 (= e!370319 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91357 (not res!418587)) b!646089))

(assert (= (and b!646089 res!418588) b!646090))

(assert (=> d!91357 m!619345))

(declare-fun m!619627 () Bool)

(assert (=> b!646090 m!619627))

(assert (=> b!645789 d!91357))

(push 1)

