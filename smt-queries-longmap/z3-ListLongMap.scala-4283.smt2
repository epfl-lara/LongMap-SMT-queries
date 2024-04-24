; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59664 () Bool)

(assert start!59664)

(declare-fun b!659315 () Bool)

(declare-fun res!427545 () Bool)

(declare-fun e!378777 () Bool)

(assert (=> b!659315 (=> (not res!427545) (not e!378777))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38760 0))(
  ( (array!38761 (arr!18574 (Array (_ BitVec 32) (_ BitVec 64))) (size!18938 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38760)

(assert (=> b!659315 (= res!427545 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18574 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!378788 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!308529 () array!38760)

(declare-fun b!659316 () Bool)

(declare-fun arrayContainsKey!0 (array!38760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!659316 (= e!378788 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984))))

(declare-fun b!659317 () Bool)

(declare-fun res!427546 () Bool)

(declare-fun e!378782 () Bool)

(assert (=> b!659317 (=> (not res!427546) (not e!378782))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!659317 (= res!427546 (validKeyInArray!0 k0!1786))))

(declare-fun b!659318 () Bool)

(declare-fun e!378789 () Bool)

(assert (=> b!659318 (= e!378777 e!378789)))

(declare-fun res!427540 () Bool)

(assert (=> b!659318 (=> (not res!427540) (not e!378789))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!659318 (= res!427540 (= (select (store (arr!18574 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!659318 (= lt!308529 (array!38761 (store (arr!18574 a!2986) i!1108 k0!1786) (size!18938 a!2986)))))

(declare-fun b!659319 () Bool)

(declare-fun res!427549 () Bool)

(assert (=> b!659319 (=> (not res!427549) (not e!378782))))

(assert (=> b!659319 (= res!427549 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!659320 () Bool)

(declare-fun e!378787 () Bool)

(assert (=> b!659320 (= e!378787 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984))))

(declare-fun b!659321 () Bool)

(assert (=> b!659321 false))

(declare-datatypes ((Unit!22923 0))(
  ( (Unit!22924) )
))
(declare-fun lt!308528 () Unit!22923)

(declare-datatypes ((List!12522 0))(
  ( (Nil!12519) (Cons!12518 (h!13566 (_ BitVec 64)) (t!18742 List!12522)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38760 (_ BitVec 64) (_ BitVec 32) List!12522) Unit!22923)

(assert (=> b!659321 (= lt!308528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136 Nil!12519))))

(declare-fun arrayNoDuplicates!0 (array!38760 (_ BitVec 32) List!12522) Bool)

(assert (=> b!659321 (arrayNoDuplicates!0 lt!308529 j!136 Nil!12519)))

(declare-fun lt!308513 () Unit!22923)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38760 (_ BitVec 32) (_ BitVec 32)) Unit!22923)

(assert (=> b!659321 (= lt!308513 (lemmaNoDuplicateFromThenFromBigger!0 lt!308529 #b00000000000000000000000000000000 j!136))))

(assert (=> b!659321 (arrayNoDuplicates!0 lt!308529 #b00000000000000000000000000000000 Nil!12519)))

(declare-fun lt!308517 () Unit!22923)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12522) Unit!22923)

(assert (=> b!659321 (= lt!308517 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519))))

(assert (=> b!659321 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308524 () Unit!22923)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22923)

(assert (=> b!659321 (= lt!308524 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!378784 () Unit!22923)

(declare-fun Unit!22925 () Unit!22923)

(assert (=> b!659321 (= e!378784 Unit!22925)))

(declare-fun b!659322 () Bool)

(declare-fun e!378781 () Unit!22923)

(declare-fun Unit!22926 () Unit!22923)

(assert (=> b!659322 (= e!378781 Unit!22926)))

(assert (=> b!659322 false))

(declare-fun b!659323 () Bool)

(declare-fun e!378776 () Unit!22923)

(declare-fun Unit!22927 () Unit!22923)

(assert (=> b!659323 (= e!378776 Unit!22927)))

(declare-fun b!659324 () Bool)

(assert (=> b!659324 false))

(declare-fun lt!308515 () Unit!22923)

(assert (=> b!659324 (= lt!308515 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984 Nil!12519))))

(assert (=> b!659324 (arrayNoDuplicates!0 lt!308529 index!984 Nil!12519)))

(declare-fun lt!308512 () Unit!22923)

(assert (=> b!659324 (= lt!308512 (lemmaNoDuplicateFromThenFromBigger!0 lt!308529 #b00000000000000000000000000000000 index!984))))

(assert (=> b!659324 (arrayNoDuplicates!0 lt!308529 #b00000000000000000000000000000000 Nil!12519)))

(declare-fun lt!308514 () Unit!22923)

(assert (=> b!659324 (= lt!308514 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519))))

(assert (=> b!659324 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308518 () Unit!22923)

(assert (=> b!659324 (= lt!308518 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!659324 e!378788))

(declare-fun res!427547 () Bool)

(assert (=> b!659324 (=> (not res!427547) (not e!378788))))

(assert (=> b!659324 (= res!427547 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136))))

(declare-fun e!378785 () Unit!22923)

(declare-fun Unit!22928 () Unit!22923)

(assert (=> b!659324 (= e!378785 Unit!22928)))

(declare-fun b!659326 () Bool)

(declare-fun Unit!22929 () Unit!22923)

(assert (=> b!659326 (= e!378776 Unit!22929)))

(declare-fun res!427542 () Bool)

(assert (=> b!659326 (= res!427542 (= (select (store (arr!18574 a!2986) i!1108 k0!1786) index!984) (select (arr!18574 a!2986) j!136)))))

(declare-fun e!378779 () Bool)

(assert (=> b!659326 (=> (not res!427542) (not e!378779))))

(assert (=> b!659326 e!378779))

(declare-fun c!76256 () Bool)

(assert (=> b!659326 (= c!76256 (bvslt j!136 index!984))))

(declare-fun lt!308516 () Unit!22923)

(assert (=> b!659326 (= lt!308516 e!378784)))

(declare-fun c!76259 () Bool)

(assert (=> b!659326 (= c!76259 (bvslt index!984 j!136))))

(declare-fun lt!308519 () Unit!22923)

(assert (=> b!659326 (= lt!308519 e!378785)))

(assert (=> b!659326 false))

(declare-fun b!659327 () Bool)

(declare-fun Unit!22930 () Unit!22923)

(assert (=> b!659327 (= e!378785 Unit!22930)))

(declare-fun b!659328 () Bool)

(declare-fun Unit!22931 () Unit!22923)

(assert (=> b!659328 (= e!378781 Unit!22931)))

(declare-fun b!659329 () Bool)

(declare-fun res!427552 () Bool)

(assert (=> b!659329 (= res!427552 (bvsge j!136 index!984))))

(declare-fun e!378780 () Bool)

(assert (=> b!659329 (=> res!427552 e!378780)))

(assert (=> b!659329 (= e!378779 e!378780)))

(declare-fun b!659330 () Bool)

(declare-fun e!378786 () Bool)

(declare-datatypes ((SeekEntryResult!6970 0))(
  ( (MissingZero!6970 (index!30245 (_ BitVec 32))) (Found!6970 (index!30246 (_ BitVec 32))) (Intermediate!6970 (undefined!7782 Bool) (index!30247 (_ BitVec 32)) (x!59184 (_ BitVec 32))) (Undefined!6970) (MissingVacant!6970 (index!30248 (_ BitVec 32))) )
))
(declare-fun lt!308522 () SeekEntryResult!6970)

(declare-fun lt!308530 () SeekEntryResult!6970)

(assert (=> b!659330 (= e!378786 (= lt!308522 lt!308530))))

(declare-fun b!659331 () Bool)

(declare-fun res!427551 () Bool)

(assert (=> b!659331 (=> (not res!427551) (not e!378782))))

(assert (=> b!659331 (= res!427551 (and (= (size!18938 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18938 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18938 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!659332 () Bool)

(declare-fun res!427555 () Bool)

(assert (=> b!659332 (=> (not res!427555) (not e!378782))))

(assert (=> b!659332 (= res!427555 (validKeyInArray!0 (select (arr!18574 a!2986) j!136)))))

(declare-fun lt!308527 () SeekEntryResult!6970)

(declare-fun e!378783 () Bool)

(declare-fun b!659333 () Bool)

(assert (=> b!659333 (= e!378783 (not (or (= lt!308527 (MissingVacant!6970 vacantSpotIndex!68)) (= lt!308522 lt!308527))))))

(declare-fun lt!308520 () Unit!22923)

(assert (=> b!659333 (= lt!308520 e!378776)))

(declare-fun c!76257 () Bool)

(assert (=> b!659333 (= c!76257 (= lt!308527 (Found!6970 index!984)))))

(declare-fun lt!308511 () Unit!22923)

(assert (=> b!659333 (= lt!308511 e!378781)))

(declare-fun c!76258 () Bool)

(assert (=> b!659333 (= c!76258 (= lt!308527 Undefined!6970))))

(declare-fun lt!308526 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38760 (_ BitVec 32)) SeekEntryResult!6970)

(assert (=> b!659333 (= lt!308527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308526 lt!308529 mask!3053))))

(assert (=> b!659333 e!378786))

(declare-fun res!427548 () Bool)

(assert (=> b!659333 (=> (not res!427548) (not e!378786))))

(declare-fun lt!308521 () (_ BitVec 32))

(assert (=> b!659333 (= res!427548 (= lt!308530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 lt!308526 lt!308529 mask!3053)))))

(assert (=> b!659333 (= lt!308530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!659333 (= lt!308526 (select (store (arr!18574 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308525 () Unit!22923)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38760 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22923)

(assert (=> b!659333 (= lt!308525 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!659333 (= lt!308521 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!659334 () Bool)

(assert (=> b!659334 (= e!378782 e!378777)))

(declare-fun res!427543 () Bool)

(assert (=> b!659334 (=> (not res!427543) (not e!378777))))

(declare-fun lt!308523 () SeekEntryResult!6970)

(assert (=> b!659334 (= res!427543 (or (= lt!308523 (MissingZero!6970 i!1108)) (= lt!308523 (MissingVacant!6970 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38760 (_ BitVec 32)) SeekEntryResult!6970)

(assert (=> b!659334 (= lt!308523 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!659335 () Bool)

(declare-fun res!427544 () Bool)

(assert (=> b!659335 (=> (not res!427544) (not e!378777))))

(assert (=> b!659335 (= res!427544 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12519))))

(declare-fun b!659336 () Bool)

(assert (=> b!659336 (= e!378789 e!378783)))

(declare-fun res!427541 () Bool)

(assert (=> b!659336 (=> (not res!427541) (not e!378783))))

(assert (=> b!659336 (= res!427541 (and (= lt!308522 (Found!6970 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18574 a!2986) index!984) (select (arr!18574 a!2986) j!136))) (not (= (select (arr!18574 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!659336 (= lt!308522 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!427553 () Bool)

(assert (=> start!59664 (=> (not res!427553) (not e!378782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59664 (= res!427553 (validMask!0 mask!3053))))

(assert (=> start!59664 e!378782))

(assert (=> start!59664 true))

(declare-fun array_inv!14433 (array!38760) Bool)

(assert (=> start!59664 (array_inv!14433 a!2986)))

(declare-fun b!659325 () Bool)

(declare-fun res!427550 () Bool)

(assert (=> b!659325 (= res!427550 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136))))

(assert (=> b!659325 (=> (not res!427550) (not e!378787))))

(assert (=> b!659325 (= e!378780 e!378787)))

(declare-fun b!659337 () Bool)

(declare-fun res!427554 () Bool)

(assert (=> b!659337 (=> (not res!427554) (not e!378777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38760 (_ BitVec 32)) Bool)

(assert (=> b!659337 (= res!427554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!659338 () Bool)

(declare-fun Unit!22932 () Unit!22923)

(assert (=> b!659338 (= e!378784 Unit!22932)))

(assert (= (and start!59664 res!427553) b!659331))

(assert (= (and b!659331 res!427551) b!659332))

(assert (= (and b!659332 res!427555) b!659317))

(assert (= (and b!659317 res!427546) b!659319))

(assert (= (and b!659319 res!427549) b!659334))

(assert (= (and b!659334 res!427543) b!659337))

(assert (= (and b!659337 res!427554) b!659335))

(assert (= (and b!659335 res!427544) b!659315))

(assert (= (and b!659315 res!427545) b!659318))

(assert (= (and b!659318 res!427540) b!659336))

(assert (= (and b!659336 res!427541) b!659333))

(assert (= (and b!659333 res!427548) b!659330))

(assert (= (and b!659333 c!76258) b!659322))

(assert (= (and b!659333 (not c!76258)) b!659328))

(assert (= (and b!659333 c!76257) b!659326))

(assert (= (and b!659333 (not c!76257)) b!659323))

(assert (= (and b!659326 res!427542) b!659329))

(assert (= (and b!659329 (not res!427552)) b!659325))

(assert (= (and b!659325 res!427550) b!659320))

(assert (= (and b!659326 c!76256) b!659321))

(assert (= (and b!659326 (not c!76256)) b!659338))

(assert (= (and b!659326 c!76259) b!659324))

(assert (= (and b!659326 (not c!76259)) b!659327))

(assert (= (and b!659324 res!427547) b!659316))

(declare-fun m!632749 () Bool)

(assert (=> b!659324 m!632749))

(declare-fun m!632751 () Bool)

(assert (=> b!659324 m!632751))

(assert (=> b!659324 m!632749))

(declare-fun m!632753 () Bool)

(assert (=> b!659324 m!632753))

(assert (=> b!659324 m!632749))

(declare-fun m!632755 () Bool)

(assert (=> b!659324 m!632755))

(assert (=> b!659324 m!632749))

(declare-fun m!632757 () Bool)

(assert (=> b!659324 m!632757))

(declare-fun m!632759 () Bool)

(assert (=> b!659324 m!632759))

(assert (=> b!659324 m!632749))

(declare-fun m!632761 () Bool)

(assert (=> b!659324 m!632761))

(declare-fun m!632763 () Bool)

(assert (=> b!659324 m!632763))

(declare-fun m!632765 () Bool)

(assert (=> b!659324 m!632765))

(assert (=> b!659325 m!632749))

(assert (=> b!659325 m!632749))

(assert (=> b!659325 m!632751))

(declare-fun m!632767 () Bool)

(assert (=> b!659335 m!632767))

(declare-fun m!632769 () Bool)

(assert (=> b!659315 m!632769))

(declare-fun m!632771 () Bool)

(assert (=> b!659321 m!632771))

(assert (=> b!659321 m!632749))

(declare-fun m!632773 () Bool)

(assert (=> b!659321 m!632773))

(assert (=> b!659321 m!632749))

(assert (=> b!659321 m!632749))

(declare-fun m!632775 () Bool)

(assert (=> b!659321 m!632775))

(assert (=> b!659321 m!632755))

(declare-fun m!632777 () Bool)

(assert (=> b!659321 m!632777))

(assert (=> b!659321 m!632749))

(declare-fun m!632779 () Bool)

(assert (=> b!659321 m!632779))

(assert (=> b!659321 m!632765))

(declare-fun m!632781 () Bool)

(assert (=> b!659333 m!632781))

(declare-fun m!632783 () Bool)

(assert (=> b!659333 m!632783))

(assert (=> b!659333 m!632749))

(declare-fun m!632785 () Bool)

(assert (=> b!659333 m!632785))

(declare-fun m!632787 () Bool)

(assert (=> b!659333 m!632787))

(declare-fun m!632789 () Bool)

(assert (=> b!659333 m!632789))

(assert (=> b!659333 m!632749))

(declare-fun m!632791 () Bool)

(assert (=> b!659333 m!632791))

(declare-fun m!632793 () Bool)

(assert (=> b!659333 m!632793))

(declare-fun m!632795 () Bool)

(assert (=> b!659336 m!632795))

(assert (=> b!659336 m!632749))

(assert (=> b!659336 m!632749))

(declare-fun m!632797 () Bool)

(assert (=> b!659336 m!632797))

(assert (=> b!659318 m!632787))

(declare-fun m!632799 () Bool)

(assert (=> b!659318 m!632799))

(declare-fun m!632801 () Bool)

(assert (=> start!59664 m!632801))

(declare-fun m!632803 () Bool)

(assert (=> start!59664 m!632803))

(declare-fun m!632805 () Bool)

(assert (=> b!659337 m!632805))

(declare-fun m!632807 () Bool)

(assert (=> b!659317 m!632807))

(assert (=> b!659316 m!632749))

(assert (=> b!659316 m!632749))

(declare-fun m!632809 () Bool)

(assert (=> b!659316 m!632809))

(declare-fun m!632811 () Bool)

(assert (=> b!659319 m!632811))

(assert (=> b!659332 m!632749))

(assert (=> b!659332 m!632749))

(declare-fun m!632813 () Bool)

(assert (=> b!659332 m!632813))

(assert (=> b!659326 m!632787))

(declare-fun m!632815 () Bool)

(assert (=> b!659326 m!632815))

(assert (=> b!659326 m!632749))

(declare-fun m!632817 () Bool)

(assert (=> b!659334 m!632817))

(assert (=> b!659320 m!632749))

(assert (=> b!659320 m!632749))

(assert (=> b!659320 m!632809))

(check-sat (not b!659333) (not b!659319) (not b!659332) (not b!659317) (not b!659321) (not b!659320) (not b!659334) (not b!659335) (not start!59664) (not b!659325) (not b!659336) (not b!659316) (not b!659324) (not b!659337))
(check-sat)
(get-model)

(declare-fun b!659495 () Bool)

(declare-fun e!378882 () SeekEntryResult!6970)

(declare-fun lt!308659 () SeekEntryResult!6970)

(assert (=> b!659495 (= e!378882 (MissingZero!6970 (index!30247 lt!308659)))))

(declare-fun d!93073 () Bool)

(declare-fun lt!308658 () SeekEntryResult!6970)

(get-info :version)

(assert (=> d!93073 (and (or ((_ is Undefined!6970) lt!308658) (not ((_ is Found!6970) lt!308658)) (and (bvsge (index!30246 lt!308658) #b00000000000000000000000000000000) (bvslt (index!30246 lt!308658) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308658) ((_ is Found!6970) lt!308658) (not ((_ is MissingZero!6970) lt!308658)) (and (bvsge (index!30245 lt!308658) #b00000000000000000000000000000000) (bvslt (index!30245 lt!308658) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308658) ((_ is Found!6970) lt!308658) ((_ is MissingZero!6970) lt!308658) (not ((_ is MissingVacant!6970) lt!308658)) (and (bvsge (index!30248 lt!308658) #b00000000000000000000000000000000) (bvslt (index!30248 lt!308658) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308658) (ite ((_ is Found!6970) lt!308658) (= (select (arr!18574 a!2986) (index!30246 lt!308658)) k0!1786) (ite ((_ is MissingZero!6970) lt!308658) (= (select (arr!18574 a!2986) (index!30245 lt!308658)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6970) lt!308658) (= (select (arr!18574 a!2986) (index!30248 lt!308658)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!378880 () SeekEntryResult!6970)

(assert (=> d!93073 (= lt!308658 e!378880)))

(declare-fun c!76291 () Bool)

(assert (=> d!93073 (= c!76291 (and ((_ is Intermediate!6970) lt!308659) (undefined!7782 lt!308659)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38760 (_ BitVec 32)) SeekEntryResult!6970)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!93073 (= lt!308659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!93073 (validMask!0 mask!3053)))

(assert (=> d!93073 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!308658)))

(declare-fun b!659496 () Bool)

(declare-fun c!76290 () Bool)

(declare-fun lt!308657 () (_ BitVec 64))

(assert (=> b!659496 (= c!76290 (= lt!308657 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378881 () SeekEntryResult!6970)

(assert (=> b!659496 (= e!378881 e!378882)))

(declare-fun b!659497 () Bool)

(assert (=> b!659497 (= e!378880 Undefined!6970)))

(declare-fun b!659498 () Bool)

(assert (=> b!659498 (= e!378882 (seekKeyOrZeroReturnVacant!0 (x!59184 lt!308659) (index!30247 lt!308659) (index!30247 lt!308659) k0!1786 a!2986 mask!3053))))

(declare-fun b!659499 () Bool)

(assert (=> b!659499 (= e!378880 e!378881)))

(assert (=> b!659499 (= lt!308657 (select (arr!18574 a!2986) (index!30247 lt!308659)))))

(declare-fun c!76292 () Bool)

(assert (=> b!659499 (= c!76292 (= lt!308657 k0!1786))))

(declare-fun b!659500 () Bool)

(assert (=> b!659500 (= e!378881 (Found!6970 (index!30247 lt!308659)))))

(assert (= (and d!93073 c!76291) b!659497))

(assert (= (and d!93073 (not c!76291)) b!659499))

(assert (= (and b!659499 c!76292) b!659500))

(assert (= (and b!659499 (not c!76292)) b!659496))

(assert (= (and b!659496 c!76290) b!659495))

(assert (= (and b!659496 (not c!76290)) b!659498))

(declare-fun m!632959 () Bool)

(assert (=> d!93073 m!632959))

(declare-fun m!632961 () Bool)

(assert (=> d!93073 m!632961))

(assert (=> d!93073 m!632801))

(declare-fun m!632963 () Bool)

(assert (=> d!93073 m!632963))

(assert (=> d!93073 m!632959))

(declare-fun m!632965 () Bool)

(assert (=> d!93073 m!632965))

(declare-fun m!632967 () Bool)

(assert (=> d!93073 m!632967))

(declare-fun m!632969 () Bool)

(assert (=> b!659498 m!632969))

(declare-fun m!632971 () Bool)

(assert (=> b!659499 m!632971))

(assert (=> b!659334 d!93073))

(declare-fun d!93075 () Bool)

(assert (=> d!93075 (= (validKeyInArray!0 (select (arr!18574 a!2986) j!136)) (and (not (= (select (arr!18574 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18574 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!659332 d!93075))

(declare-fun lt!308664 () SeekEntryResult!6970)

(declare-fun d!93077 () Bool)

(assert (=> d!93077 (and (or ((_ is Undefined!6970) lt!308664) (not ((_ is Found!6970) lt!308664)) (and (bvsge (index!30246 lt!308664) #b00000000000000000000000000000000) (bvslt (index!30246 lt!308664) (size!18938 lt!308529)))) (or ((_ is Undefined!6970) lt!308664) ((_ is Found!6970) lt!308664) (not ((_ is MissingVacant!6970) lt!308664)) (not (= (index!30248 lt!308664) vacantSpotIndex!68)) (and (bvsge (index!30248 lt!308664) #b00000000000000000000000000000000) (bvslt (index!30248 lt!308664) (size!18938 lt!308529)))) (or ((_ is Undefined!6970) lt!308664) (ite ((_ is Found!6970) lt!308664) (= (select (arr!18574 lt!308529) (index!30246 lt!308664)) lt!308526) (and ((_ is MissingVacant!6970) lt!308664) (= (index!30248 lt!308664) vacantSpotIndex!68) (= (select (arr!18574 lt!308529) (index!30248 lt!308664)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!378891 () SeekEntryResult!6970)

(assert (=> d!93077 (= lt!308664 e!378891)))

(declare-fun c!76301 () Bool)

(assert (=> d!93077 (= c!76301 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!308665 () (_ BitVec 64))

(assert (=> d!93077 (= lt!308665 (select (arr!18574 lt!308529) lt!308521))))

(assert (=> d!93077 (validMask!0 mask!3053)))

(assert (=> d!93077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 lt!308526 lt!308529 mask!3053) lt!308664)))

(declare-fun b!659513 () Bool)

(assert (=> b!659513 (= e!378891 Undefined!6970)))

(declare-fun b!659514 () Bool)

(declare-fun c!76300 () Bool)

(assert (=> b!659514 (= c!76300 (= lt!308665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378889 () SeekEntryResult!6970)

(declare-fun e!378890 () SeekEntryResult!6970)

(assert (=> b!659514 (= e!378889 e!378890)))

(declare-fun b!659515 () Bool)

(assert (=> b!659515 (= e!378890 (MissingVacant!6970 vacantSpotIndex!68))))

(declare-fun b!659516 () Bool)

(assert (=> b!659516 (= e!378889 (Found!6970 lt!308521))))

(declare-fun b!659517 () Bool)

(assert (=> b!659517 (= e!378890 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308521 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!308526 lt!308529 mask!3053))))

(declare-fun b!659518 () Bool)

(assert (=> b!659518 (= e!378891 e!378889)))

(declare-fun c!76299 () Bool)

(assert (=> b!659518 (= c!76299 (= lt!308665 lt!308526))))

(assert (= (and d!93077 c!76301) b!659513))

(assert (= (and d!93077 (not c!76301)) b!659518))

(assert (= (and b!659518 c!76299) b!659516))

(assert (= (and b!659518 (not c!76299)) b!659514))

(assert (= (and b!659514 c!76300) b!659515))

(assert (= (and b!659514 (not c!76300)) b!659517))

(declare-fun m!632973 () Bool)

(assert (=> d!93077 m!632973))

(declare-fun m!632975 () Bool)

(assert (=> d!93077 m!632975))

(declare-fun m!632977 () Bool)

(assert (=> d!93077 m!632977))

(assert (=> d!93077 m!632801))

(declare-fun m!632979 () Bool)

(assert (=> b!659517 m!632979))

(assert (=> b!659517 m!632979))

(declare-fun m!632981 () Bool)

(assert (=> b!659517 m!632981))

(assert (=> b!659333 d!93077))

(declare-fun d!93079 () Bool)

(declare-fun lt!308666 () SeekEntryResult!6970)

(assert (=> d!93079 (and (or ((_ is Undefined!6970) lt!308666) (not ((_ is Found!6970) lt!308666)) (and (bvsge (index!30246 lt!308666) #b00000000000000000000000000000000) (bvslt (index!30246 lt!308666) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308666) ((_ is Found!6970) lt!308666) (not ((_ is MissingVacant!6970) lt!308666)) (not (= (index!30248 lt!308666) vacantSpotIndex!68)) (and (bvsge (index!30248 lt!308666) #b00000000000000000000000000000000) (bvslt (index!30248 lt!308666) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308666) (ite ((_ is Found!6970) lt!308666) (= (select (arr!18574 a!2986) (index!30246 lt!308666)) (select (arr!18574 a!2986) j!136)) (and ((_ is MissingVacant!6970) lt!308666) (= (index!30248 lt!308666) vacantSpotIndex!68) (= (select (arr!18574 a!2986) (index!30248 lt!308666)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!378894 () SeekEntryResult!6970)

(assert (=> d!93079 (= lt!308666 e!378894)))

(declare-fun c!76304 () Bool)

(assert (=> d!93079 (= c!76304 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!308667 () (_ BitVec 64))

(assert (=> d!93079 (= lt!308667 (select (arr!18574 a!2986) lt!308521))))

(assert (=> d!93079 (validMask!0 mask!3053)))

(assert (=> d!93079 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053) lt!308666)))

(declare-fun b!659519 () Bool)

(assert (=> b!659519 (= e!378894 Undefined!6970)))

(declare-fun b!659520 () Bool)

(declare-fun c!76303 () Bool)

(assert (=> b!659520 (= c!76303 (= lt!308667 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378892 () SeekEntryResult!6970)

(declare-fun e!378893 () SeekEntryResult!6970)

(assert (=> b!659520 (= e!378892 e!378893)))

(declare-fun b!659521 () Bool)

(assert (=> b!659521 (= e!378893 (MissingVacant!6970 vacantSpotIndex!68))))

(declare-fun b!659522 () Bool)

(assert (=> b!659522 (= e!378892 (Found!6970 lt!308521))))

(declare-fun b!659523 () Bool)

(assert (=> b!659523 (= e!378893 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!308521 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659524 () Bool)

(assert (=> b!659524 (= e!378894 e!378892)))

(declare-fun c!76302 () Bool)

(assert (=> b!659524 (= c!76302 (= lt!308667 (select (arr!18574 a!2986) j!136)))))

(assert (= (and d!93079 c!76304) b!659519))

(assert (= (and d!93079 (not c!76304)) b!659524))

(assert (= (and b!659524 c!76302) b!659522))

(assert (= (and b!659524 (not c!76302)) b!659520))

(assert (= (and b!659520 c!76303) b!659521))

(assert (= (and b!659520 (not c!76303)) b!659523))

(declare-fun m!632983 () Bool)

(assert (=> d!93079 m!632983))

(declare-fun m!632985 () Bool)

(assert (=> d!93079 m!632985))

(declare-fun m!632987 () Bool)

(assert (=> d!93079 m!632987))

(assert (=> d!93079 m!632801))

(assert (=> b!659523 m!632979))

(assert (=> b!659523 m!632979))

(assert (=> b!659523 m!632749))

(declare-fun m!632989 () Bool)

(assert (=> b!659523 m!632989))

(assert (=> b!659333 d!93079))

(declare-fun d!93081 () Bool)

(declare-fun lt!308668 () SeekEntryResult!6970)

(assert (=> d!93081 (and (or ((_ is Undefined!6970) lt!308668) (not ((_ is Found!6970) lt!308668)) (and (bvsge (index!30246 lt!308668) #b00000000000000000000000000000000) (bvslt (index!30246 lt!308668) (size!18938 lt!308529)))) (or ((_ is Undefined!6970) lt!308668) ((_ is Found!6970) lt!308668) (not ((_ is MissingVacant!6970) lt!308668)) (not (= (index!30248 lt!308668) vacantSpotIndex!68)) (and (bvsge (index!30248 lt!308668) #b00000000000000000000000000000000) (bvslt (index!30248 lt!308668) (size!18938 lt!308529)))) (or ((_ is Undefined!6970) lt!308668) (ite ((_ is Found!6970) lt!308668) (= (select (arr!18574 lt!308529) (index!30246 lt!308668)) lt!308526) (and ((_ is MissingVacant!6970) lt!308668) (= (index!30248 lt!308668) vacantSpotIndex!68) (= (select (arr!18574 lt!308529) (index!30248 lt!308668)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!378897 () SeekEntryResult!6970)

(assert (=> d!93081 (= lt!308668 e!378897)))

(declare-fun c!76307 () Bool)

(assert (=> d!93081 (= c!76307 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!308669 () (_ BitVec 64))

(assert (=> d!93081 (= lt!308669 (select (arr!18574 lt!308529) index!984))))

(assert (=> d!93081 (validMask!0 mask!3053)))

(assert (=> d!93081 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308526 lt!308529 mask!3053) lt!308668)))

(declare-fun b!659525 () Bool)

(assert (=> b!659525 (= e!378897 Undefined!6970)))

(declare-fun b!659526 () Bool)

(declare-fun c!76306 () Bool)

(assert (=> b!659526 (= c!76306 (= lt!308669 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378895 () SeekEntryResult!6970)

(declare-fun e!378896 () SeekEntryResult!6970)

(assert (=> b!659526 (= e!378895 e!378896)))

(declare-fun b!659527 () Bool)

(assert (=> b!659527 (= e!378896 (MissingVacant!6970 vacantSpotIndex!68))))

(declare-fun b!659528 () Bool)

(assert (=> b!659528 (= e!378895 (Found!6970 index!984))))

(declare-fun b!659529 () Bool)

(assert (=> b!659529 (= e!378896 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!308526 lt!308529 mask!3053))))

(declare-fun b!659530 () Bool)

(assert (=> b!659530 (= e!378897 e!378895)))

(declare-fun c!76305 () Bool)

(assert (=> b!659530 (= c!76305 (= lt!308669 lt!308526))))

(assert (= (and d!93081 c!76307) b!659525))

(assert (= (and d!93081 (not c!76307)) b!659530))

(assert (= (and b!659530 c!76305) b!659528))

(assert (= (and b!659530 (not c!76305)) b!659526))

(assert (= (and b!659526 c!76306) b!659527))

(assert (= (and b!659526 (not c!76306)) b!659529))

(declare-fun m!632991 () Bool)

(assert (=> d!93081 m!632991))

(declare-fun m!632993 () Bool)

(assert (=> d!93081 m!632993))

(declare-fun m!632995 () Bool)

(assert (=> d!93081 m!632995))

(assert (=> d!93081 m!632801))

(declare-fun m!632997 () Bool)

(assert (=> b!659529 m!632997))

(assert (=> b!659529 m!632997))

(declare-fun m!632999 () Bool)

(assert (=> b!659529 m!632999))

(assert (=> b!659333 d!93081))

(declare-fun d!93083 () Bool)

(declare-fun e!378908 () Bool)

(assert (=> d!93083 e!378908))

(declare-fun res!427660 () Bool)

(assert (=> d!93083 (=> (not res!427660) (not e!378908))))

(assert (=> d!93083 (= res!427660 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18938 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18938 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18938 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18938 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18938 a!2986))))))

(declare-fun lt!308678 () Unit!22923)

(declare-fun choose!9 (array!38760 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22923)

(assert (=> d!93083 (= lt!308678 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 mask!3053))))

(assert (=> d!93083 (validMask!0 mask!3053)))

(assert (=> d!93083 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 mask!3053) lt!308678)))

(declare-fun b!659543 () Bool)

(assert (=> b!659543 (= e!378908 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308521 vacantSpotIndex!68 (select (store (arr!18574 a!2986) i!1108 k0!1786) j!136) (array!38761 (store (arr!18574 a!2986) i!1108 k0!1786) (size!18938 a!2986)) mask!3053)))))

(assert (= (and d!93083 res!427660) b!659543))

(declare-fun m!633005 () Bool)

(assert (=> d!93083 m!633005))

(assert (=> d!93083 m!632801))

(assert (=> b!659543 m!632783))

(assert (=> b!659543 m!632787))

(assert (=> b!659543 m!632749))

(assert (=> b!659543 m!632783))

(declare-fun m!633007 () Bool)

(assert (=> b!659543 m!633007))

(assert (=> b!659543 m!632749))

(assert (=> b!659543 m!632791))

(assert (=> b!659333 d!93083))

(declare-fun d!93093 () Bool)

(declare-fun lt!308681 () (_ BitVec 32))

(assert (=> d!93093 (and (bvsge lt!308681 #b00000000000000000000000000000000) (bvslt lt!308681 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!93093 (= lt!308681 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!93093 (validMask!0 mask!3053)))

(assert (=> d!93093 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!308681)))

(declare-fun bs!19621 () Bool)

(assert (= bs!19621 d!93093))

(declare-fun m!633017 () Bool)

(assert (=> bs!19621 m!633017))

(assert (=> bs!19621 m!632801))

(assert (=> b!659333 d!93093))

(declare-fun d!93097 () Bool)

(declare-fun res!427674 () Bool)

(declare-fun e!378923 () Bool)

(assert (=> d!93097 (=> res!427674 e!378923)))

(assert (=> d!93097 (= res!427674 (= (select (arr!18574 lt!308529) index!984) (select (arr!18574 a!2986) j!136)))))

(assert (=> d!93097 (= (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984) e!378923)))

(declare-fun b!659559 () Bool)

(declare-fun e!378924 () Bool)

(assert (=> b!659559 (= e!378923 e!378924)))

(declare-fun res!427675 () Bool)

(assert (=> b!659559 (=> (not res!427675) (not e!378924))))

(assert (=> b!659559 (= res!427675 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18938 lt!308529)))))

(declare-fun b!659560 () Bool)

(assert (=> b!659560 (= e!378924 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!93097 (not res!427674)) b!659559))

(assert (= (and b!659559 res!427675) b!659560))

(assert (=> d!93097 m!632995))

(assert (=> b!659560 m!632749))

(declare-fun m!633023 () Bool)

(assert (=> b!659560 m!633023))

(assert (=> b!659320 d!93097))

(declare-fun d!93101 () Bool)

(assert (=> d!93101 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308687 () Unit!22923)

(declare-fun choose!114 (array!38760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22923)

(assert (=> d!93101 (= lt!308687 (choose!114 lt!308529 (select (arr!18574 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!93101 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!93101 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!308687)))

(declare-fun bs!19623 () Bool)

(assert (= bs!19623 d!93101))

(assert (=> bs!19623 m!632749))

(assert (=> bs!19623 m!632773))

(assert (=> bs!19623 m!632749))

(declare-fun m!633029 () Bool)

(assert (=> bs!19623 m!633029))

(assert (=> b!659321 d!93101))

(declare-fun d!93105 () Bool)

(assert (=> d!93105 (arrayNoDuplicates!0 lt!308529 j!136 Nil!12519)))

(declare-fun lt!308692 () Unit!22923)

(declare-fun choose!39 (array!38760 (_ BitVec 32) (_ BitVec 32)) Unit!22923)

(assert (=> d!93105 (= lt!308692 (choose!39 lt!308529 #b00000000000000000000000000000000 j!136))))

(assert (=> d!93105 (bvslt (size!18938 lt!308529) #b01111111111111111111111111111111)))

(assert (=> d!93105 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308529 #b00000000000000000000000000000000 j!136) lt!308692)))

(declare-fun bs!19624 () Bool)

(assert (= bs!19624 d!93105))

(assert (=> bs!19624 m!632771))

(declare-fun m!633031 () Bool)

(assert (=> bs!19624 m!633031))

(assert (=> b!659321 d!93105))

(declare-fun b!659585 () Bool)

(declare-fun e!378948 () Bool)

(declare-fun contains!3174 (List!12522 (_ BitVec 64)) Bool)

(assert (=> b!659585 (= e!378948 (contains!3174 Nil!12519 (select (arr!18574 lt!308529) #b00000000000000000000000000000000)))))

(declare-fun b!659586 () Bool)

(declare-fun e!378949 () Bool)

(declare-fun call!33901 () Bool)

(assert (=> b!659586 (= e!378949 call!33901)))

(declare-fun bm!33898 () Bool)

(declare-fun c!76314 () Bool)

(assert (=> bm!33898 (= call!33901 (arrayNoDuplicates!0 lt!308529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76314 (Cons!12518 (select (arr!18574 lt!308529) #b00000000000000000000000000000000) Nil!12519) Nil!12519)))))

(declare-fun b!659587 () Bool)

(assert (=> b!659587 (= e!378949 call!33901)))

(declare-fun b!659588 () Bool)

(declare-fun e!378946 () Bool)

(declare-fun e!378947 () Bool)

(assert (=> b!659588 (= e!378946 e!378947)))

(declare-fun res!427694 () Bool)

(assert (=> b!659588 (=> (not res!427694) (not e!378947))))

(assert (=> b!659588 (= res!427694 (not e!378948))))

(declare-fun res!427696 () Bool)

(assert (=> b!659588 (=> (not res!427696) (not e!378948))))

(assert (=> b!659588 (= res!427696 (validKeyInArray!0 (select (arr!18574 lt!308529) #b00000000000000000000000000000000)))))

(declare-fun d!93107 () Bool)

(declare-fun res!427695 () Bool)

(assert (=> d!93107 (=> res!427695 e!378946)))

(assert (=> d!93107 (= res!427695 (bvsge #b00000000000000000000000000000000 (size!18938 lt!308529)))))

(assert (=> d!93107 (= (arrayNoDuplicates!0 lt!308529 #b00000000000000000000000000000000 Nil!12519) e!378946)))

(declare-fun b!659589 () Bool)

(assert (=> b!659589 (= e!378947 e!378949)))

(assert (=> b!659589 (= c!76314 (validKeyInArray!0 (select (arr!18574 lt!308529) #b00000000000000000000000000000000)))))

(assert (= (and d!93107 (not res!427695)) b!659588))

(assert (= (and b!659588 res!427696) b!659585))

(assert (= (and b!659588 res!427694) b!659589))

(assert (= (and b!659589 c!76314) b!659586))

(assert (= (and b!659589 (not c!76314)) b!659587))

(assert (= (or b!659586 b!659587) bm!33898))

(declare-fun m!633047 () Bool)

(assert (=> b!659585 m!633047))

(assert (=> b!659585 m!633047))

(declare-fun m!633049 () Bool)

(assert (=> b!659585 m!633049))

(assert (=> bm!33898 m!633047))

(declare-fun m!633051 () Bool)

(assert (=> bm!33898 m!633051))

(assert (=> b!659588 m!633047))

(assert (=> b!659588 m!633047))

(declare-fun m!633053 () Bool)

(assert (=> b!659588 m!633053))

(assert (=> b!659589 m!633047))

(assert (=> b!659589 m!633047))

(assert (=> b!659589 m!633053))

(assert (=> b!659321 d!93107))

(declare-fun d!93119 () Bool)

(declare-fun res!427697 () Bool)

(declare-fun e!378950 () Bool)

(assert (=> d!93119 (=> res!427697 e!378950)))

(assert (=> d!93119 (= res!427697 (= (select (arr!18574 lt!308529) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18574 a!2986) j!136)))))

(assert (=> d!93119 (= (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!378950)))

(declare-fun b!659590 () Bool)

(declare-fun e!378951 () Bool)

(assert (=> b!659590 (= e!378950 e!378951)))

(declare-fun res!427698 () Bool)

(assert (=> b!659590 (=> (not res!427698) (not e!378951))))

(assert (=> b!659590 (= res!427698 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18938 lt!308529)))))

(declare-fun b!659591 () Bool)

(assert (=> b!659591 (= e!378951 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!93119 (not res!427697)) b!659590))

(assert (= (and b!659590 res!427698) b!659591))

(declare-fun m!633055 () Bool)

(assert (=> d!93119 m!633055))

(assert (=> b!659591 m!632749))

(declare-fun m!633057 () Bool)

(assert (=> b!659591 m!633057))

(assert (=> b!659321 d!93119))

(declare-fun d!93121 () Bool)

(assert (=> d!93121 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18938 lt!308529)) (not (= (select (arr!18574 lt!308529) j!136) (select (arr!18574 a!2986) j!136))))))

(declare-fun lt!308702 () Unit!22923)

(declare-fun choose!21 (array!38760 (_ BitVec 64) (_ BitVec 32) List!12522) Unit!22923)

(assert (=> d!93121 (= lt!308702 (choose!21 lt!308529 (select (arr!18574 a!2986) j!136) j!136 Nil!12519))))

(assert (=> d!93121 (bvslt (size!18938 lt!308529) #b01111111111111111111111111111111)))

(assert (=> d!93121 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136 Nil!12519) lt!308702)))

(declare-fun bs!19625 () Bool)

(assert (= bs!19625 d!93121))

(declare-fun m!633059 () Bool)

(assert (=> bs!19625 m!633059))

(assert (=> bs!19625 m!632749))

(declare-fun m!633061 () Bool)

(assert (=> bs!19625 m!633061))

(assert (=> b!659321 d!93121))

(declare-fun b!659600 () Bool)

(declare-fun e!378960 () Bool)

(assert (=> b!659600 (= e!378960 (contains!3174 Nil!12519 (select (arr!18574 lt!308529) j!136)))))

(declare-fun b!659601 () Bool)

(declare-fun e!378961 () Bool)

(declare-fun call!33904 () Bool)

(assert (=> b!659601 (= e!378961 call!33904)))

(declare-fun bm!33901 () Bool)

(declare-fun c!76317 () Bool)

(assert (=> bm!33901 (= call!33904 (arrayNoDuplicates!0 lt!308529 (bvadd j!136 #b00000000000000000000000000000001) (ite c!76317 (Cons!12518 (select (arr!18574 lt!308529) j!136) Nil!12519) Nil!12519)))))

(declare-fun b!659602 () Bool)

(assert (=> b!659602 (= e!378961 call!33904)))

(declare-fun b!659603 () Bool)

(declare-fun e!378958 () Bool)

(declare-fun e!378959 () Bool)

(assert (=> b!659603 (= e!378958 e!378959)))

(declare-fun res!427703 () Bool)

(assert (=> b!659603 (=> (not res!427703) (not e!378959))))

(assert (=> b!659603 (= res!427703 (not e!378960))))

(declare-fun res!427705 () Bool)

(assert (=> b!659603 (=> (not res!427705) (not e!378960))))

(assert (=> b!659603 (= res!427705 (validKeyInArray!0 (select (arr!18574 lt!308529) j!136)))))

(declare-fun d!93123 () Bool)

(declare-fun res!427704 () Bool)

(assert (=> d!93123 (=> res!427704 e!378958)))

(assert (=> d!93123 (= res!427704 (bvsge j!136 (size!18938 lt!308529)))))

(assert (=> d!93123 (= (arrayNoDuplicates!0 lt!308529 j!136 Nil!12519) e!378958)))

(declare-fun b!659604 () Bool)

(assert (=> b!659604 (= e!378959 e!378961)))

(assert (=> b!659604 (= c!76317 (validKeyInArray!0 (select (arr!18574 lt!308529) j!136)))))

(assert (= (and d!93123 (not res!427704)) b!659603))

(assert (= (and b!659603 res!427705) b!659600))

(assert (= (and b!659603 res!427703) b!659604))

(assert (= (and b!659604 c!76317) b!659601))

(assert (= (and b!659604 (not c!76317)) b!659602))

(assert (= (or b!659601 b!659602) bm!33901))

(assert (=> b!659600 m!633059))

(assert (=> b!659600 m!633059))

(declare-fun m!633063 () Bool)

(assert (=> b!659600 m!633063))

(assert (=> bm!33901 m!633059))

(declare-fun m!633065 () Bool)

(assert (=> bm!33901 m!633065))

(assert (=> b!659603 m!633059))

(assert (=> b!659603 m!633059))

(declare-fun m!633067 () Bool)

(assert (=> b!659603 m!633067))

(assert (=> b!659604 m!633059))

(assert (=> b!659604 m!633059))

(assert (=> b!659604 m!633067))

(assert (=> b!659321 d!93123))

(declare-fun d!93125 () Bool)

(declare-fun e!378979 () Bool)

(assert (=> d!93125 e!378979))

(declare-fun res!427716 () Bool)

(assert (=> d!93125 (=> (not res!427716) (not e!378979))))

(assert (=> d!93125 (= res!427716 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18938 a!2986))))))

(declare-fun lt!308712 () Unit!22923)

(declare-fun choose!41 (array!38760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12522) Unit!22923)

(assert (=> d!93125 (= lt!308712 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519))))

(assert (=> d!93125 (bvslt (size!18938 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!93125 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519) lt!308712)))

(declare-fun b!659629 () Bool)

(assert (=> b!659629 (= e!378979 (arrayNoDuplicates!0 (array!38761 (store (arr!18574 a!2986) i!1108 k0!1786) (size!18938 a!2986)) #b00000000000000000000000000000000 Nil!12519))))

(assert (= (and d!93125 res!427716) b!659629))

(declare-fun m!633081 () Bool)

(assert (=> d!93125 m!633081))

(assert (=> b!659629 m!632787))

(declare-fun m!633083 () Bool)

(assert (=> b!659629 m!633083))

(assert (=> b!659321 d!93125))

(declare-fun d!93129 () Bool)

(declare-fun res!427717 () Bool)

(declare-fun e!378982 () Bool)

(assert (=> d!93129 (=> res!427717 e!378982)))

(assert (=> d!93129 (= res!427717 (= (select (arr!18574 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!93129 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!378982)))

(declare-fun b!659634 () Bool)

(declare-fun e!378983 () Bool)

(assert (=> b!659634 (= e!378982 e!378983)))

(declare-fun res!427718 () Bool)

(assert (=> b!659634 (=> (not res!427718) (not e!378983))))

(assert (=> b!659634 (= res!427718 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18938 a!2986)))))

(declare-fun b!659635 () Bool)

(assert (=> b!659635 (= e!378983 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93129 (not res!427717)) b!659634))

(assert (= (and b!659634 res!427718) b!659635))

(declare-fun m!633085 () Bool)

(assert (=> d!93129 m!633085))

(declare-fun m!633087 () Bool)

(assert (=> b!659635 m!633087))

(assert (=> b!659319 d!93129))

(declare-fun d!93131 () Bool)

(assert (=> d!93131 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59664 d!93131))

(declare-fun d!93143 () Bool)

(assert (=> d!93143 (= (array_inv!14433 a!2986) (bvsge (size!18938 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59664 d!93143))

(assert (=> b!659316 d!93097))

(declare-fun d!93145 () Bool)

(assert (=> d!93145 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!659317 d!93145))

(declare-fun lt!308722 () SeekEntryResult!6970)

(declare-fun d!93147 () Bool)

(assert (=> d!93147 (and (or ((_ is Undefined!6970) lt!308722) (not ((_ is Found!6970) lt!308722)) (and (bvsge (index!30246 lt!308722) #b00000000000000000000000000000000) (bvslt (index!30246 lt!308722) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308722) ((_ is Found!6970) lt!308722) (not ((_ is MissingVacant!6970) lt!308722)) (not (= (index!30248 lt!308722) vacantSpotIndex!68)) (and (bvsge (index!30248 lt!308722) #b00000000000000000000000000000000) (bvslt (index!30248 lt!308722) (size!18938 a!2986)))) (or ((_ is Undefined!6970) lt!308722) (ite ((_ is Found!6970) lt!308722) (= (select (arr!18574 a!2986) (index!30246 lt!308722)) (select (arr!18574 a!2986) j!136)) (and ((_ is MissingVacant!6970) lt!308722) (= (index!30248 lt!308722) vacantSpotIndex!68) (= (select (arr!18574 a!2986) (index!30248 lt!308722)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!378999 () SeekEntryResult!6970)

(assert (=> d!93147 (= lt!308722 e!378999)))

(declare-fun c!76339 () Bool)

(assert (=> d!93147 (= c!76339 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!308723 () (_ BitVec 64))

(assert (=> d!93147 (= lt!308723 (select (arr!18574 a!2986) index!984))))

(assert (=> d!93147 (validMask!0 mask!3053)))

(assert (=> d!93147 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053) lt!308722)))

(declare-fun b!659659 () Bool)

(assert (=> b!659659 (= e!378999 Undefined!6970)))

(declare-fun b!659660 () Bool)

(declare-fun c!76338 () Bool)

(assert (=> b!659660 (= c!76338 (= lt!308723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!378997 () SeekEntryResult!6970)

(declare-fun e!378998 () SeekEntryResult!6970)

(assert (=> b!659660 (= e!378997 e!378998)))

(declare-fun b!659661 () Bool)

(assert (=> b!659661 (= e!378998 (MissingVacant!6970 vacantSpotIndex!68))))

(declare-fun b!659662 () Bool)

(assert (=> b!659662 (= e!378997 (Found!6970 index!984))))

(declare-fun b!659663 () Bool)

(assert (=> b!659663 (= e!378998 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!659664 () Bool)

(assert (=> b!659664 (= e!378999 e!378997)))

(declare-fun c!76337 () Bool)

(assert (=> b!659664 (= c!76337 (= lt!308723 (select (arr!18574 a!2986) j!136)))))

(assert (= (and d!93147 c!76339) b!659659))

(assert (= (and d!93147 (not c!76339)) b!659664))

(assert (= (and b!659664 c!76337) b!659662))

(assert (= (and b!659664 (not c!76337)) b!659660))

(assert (= (and b!659660 c!76338) b!659661))

(assert (= (and b!659660 (not c!76338)) b!659663))

(declare-fun m!633123 () Bool)

(assert (=> d!93147 m!633123))

(declare-fun m!633125 () Bool)

(assert (=> d!93147 m!633125))

(assert (=> d!93147 m!632795))

(assert (=> d!93147 m!632801))

(assert (=> b!659663 m!632997))

(assert (=> b!659663 m!632997))

(assert (=> b!659663 m!632749))

(declare-fun m!633127 () Bool)

(assert (=> b!659663 m!633127))

(assert (=> b!659336 d!93147))

(declare-fun b!659688 () Bool)

(declare-fun e!379016 () Bool)

(declare-fun call!33911 () Bool)

(assert (=> b!659688 (= e!379016 call!33911)))

(declare-fun bm!33908 () Bool)

(assert (=> bm!33908 (= call!33911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!659689 () Bool)

(declare-fun e!379015 () Bool)

(assert (=> b!659689 (= e!379016 e!379015)))

(declare-fun lt!308739 () (_ BitVec 64))

(assert (=> b!659689 (= lt!308739 (select (arr!18574 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!308740 () Unit!22923)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38760 (_ BitVec 64) (_ BitVec 32)) Unit!22923)

(assert (=> b!659689 (= lt!308740 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!308739 #b00000000000000000000000000000000))))

(assert (=> b!659689 (arrayContainsKey!0 a!2986 lt!308739 #b00000000000000000000000000000000)))

(declare-fun lt!308738 () Unit!22923)

(assert (=> b!659689 (= lt!308738 lt!308740)))

(declare-fun res!427729 () Bool)

(assert (=> b!659689 (= res!427729 (= (seekEntryOrOpen!0 (select (arr!18574 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6970 #b00000000000000000000000000000000)))))

(assert (=> b!659689 (=> (not res!427729) (not e!379015))))

(declare-fun b!659690 () Bool)

(declare-fun e!379014 () Bool)

(assert (=> b!659690 (= e!379014 e!379016)))

(declare-fun c!76348 () Bool)

(assert (=> b!659690 (= c!76348 (validKeyInArray!0 (select (arr!18574 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659687 () Bool)

(assert (=> b!659687 (= e!379015 call!33911)))

(declare-fun d!93149 () Bool)

(declare-fun res!427728 () Bool)

(assert (=> d!93149 (=> res!427728 e!379014)))

(assert (=> d!93149 (= res!427728 (bvsge #b00000000000000000000000000000000 (size!18938 a!2986)))))

(assert (=> d!93149 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!379014)))

(assert (= (and d!93149 (not res!427728)) b!659690))

(assert (= (and b!659690 c!76348) b!659689))

(assert (= (and b!659690 (not c!76348)) b!659688))

(assert (= (and b!659689 res!427729) b!659687))

(assert (= (or b!659687 b!659688) bm!33908))

(declare-fun m!633129 () Bool)

(assert (=> bm!33908 m!633129))

(assert (=> b!659689 m!633085))

(declare-fun m!633131 () Bool)

(assert (=> b!659689 m!633131))

(declare-fun m!633133 () Bool)

(assert (=> b!659689 m!633133))

(assert (=> b!659689 m!633085))

(declare-fun m!633135 () Bool)

(assert (=> b!659689 m!633135))

(assert (=> b!659690 m!633085))

(assert (=> b!659690 m!633085))

(declare-fun m!633137 () Bool)

(assert (=> b!659690 m!633137))

(assert (=> b!659337 d!93149))

(declare-fun d!93151 () Bool)

(assert (=> d!93151 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308742 () Unit!22923)

(assert (=> d!93151 (= lt!308742 (choose!114 lt!308529 (select (arr!18574 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!93151 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!93151 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!308742)))

(declare-fun bs!19627 () Bool)

(assert (= bs!19627 d!93151))

(assert (=> bs!19627 m!632749))

(assert (=> bs!19627 m!632753))

(assert (=> bs!19627 m!632749))

(declare-fun m!633141 () Bool)

(assert (=> bs!19627 m!633141))

(assert (=> b!659324 d!93151))

(declare-fun d!93153 () Bool)

(declare-fun res!427731 () Bool)

(declare-fun e!379018 () Bool)

(assert (=> d!93153 (=> res!427731 e!379018)))

(assert (=> d!93153 (= res!427731 (= (select (arr!18574 lt!308529) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18574 a!2986) j!136)))))

(assert (=> d!93153 (= (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!379018)))

(declare-fun b!659692 () Bool)

(declare-fun e!379019 () Bool)

(assert (=> b!659692 (= e!379018 e!379019)))

(declare-fun res!427732 () Bool)

(assert (=> b!659692 (=> (not res!427732) (not e!379019))))

(assert (=> b!659692 (= res!427732 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18938 lt!308529)))))

(declare-fun b!659693 () Bool)

(assert (=> b!659693 (= e!379019 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!93153 (not res!427731)) b!659692))

(assert (= (and b!659692 res!427732) b!659693))

(declare-fun m!633145 () Bool)

(assert (=> d!93153 m!633145))

(assert (=> b!659693 m!632749))

(declare-fun m!633147 () Bool)

(assert (=> b!659693 m!633147))

(assert (=> b!659324 d!93153))

(assert (=> b!659324 d!93107))

(declare-fun d!93157 () Bool)

(assert (=> d!93157 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18938 lt!308529)) (not (= (select (arr!18574 lt!308529) index!984) (select (arr!18574 a!2986) j!136))))))

(declare-fun lt!308743 () Unit!22923)

(assert (=> d!93157 (= lt!308743 (choose!21 lt!308529 (select (arr!18574 a!2986) j!136) index!984 Nil!12519))))

(assert (=> d!93157 (bvslt (size!18938 lt!308529) #b01111111111111111111111111111111)))

(assert (=> d!93157 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308529 (select (arr!18574 a!2986) j!136) index!984 Nil!12519) lt!308743)))

(declare-fun bs!19628 () Bool)

(assert (= bs!19628 d!93157))

(assert (=> bs!19628 m!632995))

(assert (=> bs!19628 m!632749))

(declare-fun m!633149 () Bool)

(assert (=> bs!19628 m!633149))

(assert (=> b!659324 d!93157))

(declare-fun d!93159 () Bool)

(declare-fun res!427733 () Bool)

(declare-fun e!379020 () Bool)

(assert (=> d!93159 (=> res!427733 e!379020)))

(assert (=> d!93159 (= res!427733 (= (select (arr!18574 lt!308529) j!136) (select (arr!18574 a!2986) j!136)))))

(assert (=> d!93159 (= (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) j!136) e!379020)))

(declare-fun b!659694 () Bool)

(declare-fun e!379021 () Bool)

(assert (=> b!659694 (= e!379020 e!379021)))

(declare-fun res!427734 () Bool)

(assert (=> b!659694 (=> (not res!427734) (not e!379021))))

(assert (=> b!659694 (= res!427734 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18938 lt!308529)))))

(declare-fun b!659695 () Bool)

(assert (=> b!659695 (= e!379021 (arrayContainsKey!0 lt!308529 (select (arr!18574 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!93159 (not res!427733)) b!659694))

(assert (= (and b!659694 res!427734) b!659695))

(assert (=> d!93159 m!633059))

(assert (=> b!659695 m!632749))

(declare-fun m!633151 () Bool)

(assert (=> b!659695 m!633151))

(assert (=> b!659324 d!93159))

(declare-fun b!659698 () Bool)

(declare-fun e!379026 () Bool)

(assert (=> b!659698 (= e!379026 (contains!3174 Nil!12519 (select (arr!18574 lt!308529) index!984)))))

(declare-fun b!659699 () Bool)

(declare-fun e!379027 () Bool)

(declare-fun call!33912 () Bool)

(assert (=> b!659699 (= e!379027 call!33912)))

(declare-fun bm!33909 () Bool)

(declare-fun c!76349 () Bool)

(assert (=> bm!33909 (= call!33912 (arrayNoDuplicates!0 lt!308529 (bvadd index!984 #b00000000000000000000000000000001) (ite c!76349 (Cons!12518 (select (arr!18574 lt!308529) index!984) Nil!12519) Nil!12519)))))

(declare-fun b!659700 () Bool)

(assert (=> b!659700 (= e!379027 call!33912)))

(declare-fun b!659701 () Bool)

(declare-fun e!379024 () Bool)

(declare-fun e!379025 () Bool)

(assert (=> b!659701 (= e!379024 e!379025)))

(declare-fun res!427737 () Bool)

(assert (=> b!659701 (=> (not res!427737) (not e!379025))))

(assert (=> b!659701 (= res!427737 (not e!379026))))

(declare-fun res!427739 () Bool)

(assert (=> b!659701 (=> (not res!427739) (not e!379026))))

(assert (=> b!659701 (= res!427739 (validKeyInArray!0 (select (arr!18574 lt!308529) index!984)))))

(declare-fun d!93163 () Bool)

(declare-fun res!427738 () Bool)

(assert (=> d!93163 (=> res!427738 e!379024)))

(assert (=> d!93163 (= res!427738 (bvsge index!984 (size!18938 lt!308529)))))

(assert (=> d!93163 (= (arrayNoDuplicates!0 lt!308529 index!984 Nil!12519) e!379024)))

(declare-fun b!659702 () Bool)

(assert (=> b!659702 (= e!379025 e!379027)))

(assert (=> b!659702 (= c!76349 (validKeyInArray!0 (select (arr!18574 lt!308529) index!984)))))

(assert (= (and d!93163 (not res!427738)) b!659701))

(assert (= (and b!659701 res!427739) b!659698))

(assert (= (and b!659701 res!427737) b!659702))

(assert (= (and b!659702 c!76349) b!659699))

(assert (= (and b!659702 (not c!76349)) b!659700))

(assert (= (or b!659699 b!659700) bm!33909))

(assert (=> b!659698 m!632995))

(assert (=> b!659698 m!632995))

(declare-fun m!633157 () Bool)

(assert (=> b!659698 m!633157))

(assert (=> bm!33909 m!632995))

(declare-fun m!633159 () Bool)

(assert (=> bm!33909 m!633159))

(assert (=> b!659701 m!632995))

(assert (=> b!659701 m!632995))

(declare-fun m!633161 () Bool)

(assert (=> b!659701 m!633161))

(assert (=> b!659702 m!632995))

(assert (=> b!659702 m!632995))

(assert (=> b!659702 m!633161))

(assert (=> b!659324 d!93163))

(declare-fun d!93169 () Bool)

(assert (=> d!93169 (arrayNoDuplicates!0 lt!308529 index!984 Nil!12519)))

(declare-fun lt!308748 () Unit!22923)

(assert (=> d!93169 (= lt!308748 (choose!39 lt!308529 #b00000000000000000000000000000000 index!984))))

(assert (=> d!93169 (bvslt (size!18938 lt!308529) #b01111111111111111111111111111111)))

(assert (=> d!93169 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!308529 #b00000000000000000000000000000000 index!984) lt!308748)))

(declare-fun bs!19630 () Bool)

(assert (= bs!19630 d!93169))

(assert (=> bs!19630 m!632763))

(declare-fun m!633163 () Bool)

(assert (=> bs!19630 m!633163))

(assert (=> b!659324 d!93169))

(assert (=> b!659324 d!93125))

(declare-fun b!659714 () Bool)

(declare-fun e!379037 () Bool)

(assert (=> b!659714 (= e!379037 (contains!3174 Nil!12519 (select (arr!18574 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!659715 () Bool)

(declare-fun e!379038 () Bool)

(declare-fun call!33914 () Bool)

(assert (=> b!659715 (= e!379038 call!33914)))

(declare-fun bm!33911 () Bool)

(declare-fun c!76354 () Bool)

(assert (=> bm!33911 (= call!33914 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!76354 (Cons!12518 (select (arr!18574 a!2986) #b00000000000000000000000000000000) Nil!12519) Nil!12519)))))

(declare-fun b!659716 () Bool)

(assert (=> b!659716 (= e!379038 call!33914)))

(declare-fun b!659717 () Bool)

(declare-fun e!379035 () Bool)

(declare-fun e!379036 () Bool)

(assert (=> b!659717 (= e!379035 e!379036)))

(declare-fun res!427743 () Bool)

(assert (=> b!659717 (=> (not res!427743) (not e!379036))))

(assert (=> b!659717 (= res!427743 (not e!379037))))

(declare-fun res!427745 () Bool)

(assert (=> b!659717 (=> (not res!427745) (not e!379037))))

(assert (=> b!659717 (= res!427745 (validKeyInArray!0 (select (arr!18574 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!93171 () Bool)

(declare-fun res!427744 () Bool)

(assert (=> d!93171 (=> res!427744 e!379035)))

(assert (=> d!93171 (= res!427744 (bvsge #b00000000000000000000000000000000 (size!18938 a!2986)))))

(assert (=> d!93171 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12519) e!379035)))

(declare-fun b!659718 () Bool)

(assert (=> b!659718 (= e!379036 e!379038)))

(assert (=> b!659718 (= c!76354 (validKeyInArray!0 (select (arr!18574 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!93171 (not res!427744)) b!659717))

(assert (= (and b!659717 res!427745) b!659714))

(assert (= (and b!659717 res!427743) b!659718))

(assert (= (and b!659718 c!76354) b!659715))

(assert (= (and b!659718 (not c!76354)) b!659716))

(assert (= (or b!659715 b!659716) bm!33911))

(assert (=> b!659714 m!633085))

(assert (=> b!659714 m!633085))

(declare-fun m!633185 () Bool)

(assert (=> b!659714 m!633185))

(assert (=> bm!33911 m!633085))

(declare-fun m!633189 () Bool)

(assert (=> bm!33911 m!633189))

(assert (=> b!659717 m!633085))

(assert (=> b!659717 m!633085))

(assert (=> b!659717 m!633137))

(assert (=> b!659718 m!633085))

(assert (=> b!659718 m!633085))

(assert (=> b!659718 m!633137))

(assert (=> b!659335 d!93171))

(assert (=> b!659325 d!93159))

(check-sat (not b!659517) (not d!93151) (not bm!33901) (not b!659698) (not b!659529) (not d!93125) (not b!659689) (not bm!33909) (not d!93073) (not b!659718) (not b!659695) (not b!659543) (not d!93101) (not d!93147) (not d!93079) (not d!93121) (not b!659663) (not b!659585) (not b!659591) (not b!659498) (not d!93083) (not bm!33898) (not b!659523) (not d!93105) (not bm!33911) (not b!659702) (not b!659560) (not b!659693) (not b!659629) (not b!659635) (not d!93093) (not d!93169) (not bm!33908) (not b!659714) (not b!659717) (not b!659604) (not d!93077) (not b!659603) (not d!93157) (not b!659690) (not b!659589) (not b!659588) (not b!659701) (not b!659600) (not d!93081))
(check-sat)
