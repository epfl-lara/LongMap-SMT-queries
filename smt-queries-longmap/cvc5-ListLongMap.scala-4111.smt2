; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56164 () Bool)

(assert start!56164)

(declare-fun b!621417 () Bool)

(assert (=> b!621417 false))

(declare-datatypes ((array!37634 0))(
  ( (array!37635 (arr!18063 (Array (_ BitVec 32) (_ BitVec 64))) (size!18427 (_ BitVec 32))) )
))
(declare-fun lt!287542 () array!37634)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!20758 0))(
  ( (Unit!20759) )
))
(declare-fun lt!287545 () Unit!20758)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37634)

(declare-datatypes ((List!12104 0))(
  ( (Nil!12101) (Cons!12100 (h!13145 (_ BitVec 64)) (t!18332 List!12104)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37634 (_ BitVec 64) (_ BitVec 32) List!12104) Unit!20758)

(assert (=> b!621417 (= lt!287545 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287542 (select (arr!18063 a!2986) j!136) index!984 Nil!12101))))

(declare-fun arrayNoDuplicates!0 (array!37634 (_ BitVec 32) List!12104) Bool)

(assert (=> b!621417 (arrayNoDuplicates!0 lt!287542 index!984 Nil!12101)))

(declare-fun lt!287549 () Unit!20758)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37634 (_ BitVec 32) (_ BitVec 32)) Unit!20758)

(assert (=> b!621417 (= lt!287549 (lemmaNoDuplicateFromThenFromBigger!0 lt!287542 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621417 (arrayNoDuplicates!0 lt!287542 #b00000000000000000000000000000000 Nil!12101)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!287555 () Unit!20758)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37634 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12104) Unit!20758)

(assert (=> b!621417 (= lt!287555 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12101))))

(declare-fun arrayContainsKey!0 (array!37634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621417 (arrayContainsKey!0 lt!287542 (select (arr!18063 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287551 () Unit!20758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37634 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20758)

(assert (=> b!621417 (= lt!287551 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287542 (select (arr!18063 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!356428 () Bool)

(assert (=> b!621417 e!356428))

(declare-fun res!400452 () Bool)

(assert (=> b!621417 (=> (not res!400452) (not e!356428))))

(assert (=> b!621417 (= res!400452 (arrayContainsKey!0 lt!287542 (select (arr!18063 a!2986) j!136) j!136))))

(declare-fun e!356420 () Unit!20758)

(declare-fun Unit!20760 () Unit!20758)

(assert (=> b!621417 (= e!356420 Unit!20760)))

(declare-fun b!621418 () Bool)

(declare-fun res!400451 () Bool)

(declare-fun e!356418 () Bool)

(assert (=> b!621418 (=> (not res!400451) (not e!356418))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!621418 (= res!400451 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18063 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621419 () Bool)

(declare-fun e!356425 () Unit!20758)

(declare-fun Unit!20761 () Unit!20758)

(assert (=> b!621419 (= e!356425 Unit!20761)))

(declare-fun res!400453 () Bool)

(assert (=> b!621419 (= res!400453 (= (select (store (arr!18063 a!2986) i!1108 k!1786) index!984) (select (arr!18063 a!2986) j!136)))))

(declare-fun e!356417 () Bool)

(assert (=> b!621419 (=> (not res!400453) (not e!356417))))

(assert (=> b!621419 e!356417))

(declare-fun c!70852 () Bool)

(assert (=> b!621419 (= c!70852 (bvslt j!136 index!984))))

(declare-fun lt!287547 () Unit!20758)

(declare-fun e!356421 () Unit!20758)

(assert (=> b!621419 (= lt!287547 e!356421)))

(declare-fun c!70850 () Bool)

(assert (=> b!621419 (= c!70850 (bvslt index!984 j!136))))

(declare-fun lt!287539 () Unit!20758)

(assert (=> b!621419 (= lt!287539 e!356420)))

(assert (=> b!621419 false))

(declare-fun b!621420 () Bool)

(declare-fun e!356424 () Unit!20758)

(declare-fun Unit!20762 () Unit!20758)

(assert (=> b!621420 (= e!356424 Unit!20762)))

(declare-fun b!621421 () Bool)

(declare-fun res!400463 () Bool)

(declare-fun e!356427 () Bool)

(assert (=> b!621421 (=> (not res!400463) (not e!356427))))

(assert (=> b!621421 (= res!400463 (and (= (size!18427 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18427 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18427 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621422 () Bool)

(declare-fun e!356419 () Bool)

(declare-fun e!356423 () Bool)

(assert (=> b!621422 (= e!356419 e!356423)))

(declare-fun res!400464 () Bool)

(assert (=> b!621422 (=> (not res!400464) (not e!356423))))

(declare-datatypes ((SeekEntryResult!6503 0))(
  ( (MissingZero!6503 (index!28296 (_ BitVec 32))) (Found!6503 (index!28297 (_ BitVec 32))) (Intermediate!6503 (undefined!7315 Bool) (index!28298 (_ BitVec 32)) (x!57071 (_ BitVec 32))) (Undefined!6503) (MissingVacant!6503 (index!28299 (_ BitVec 32))) )
))
(declare-fun lt!287557 () SeekEntryResult!6503)

(assert (=> b!621422 (= res!400464 (and (= lt!287557 (Found!6503 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18063 a!2986) index!984) (select (arr!18063 a!2986) j!136))) (not (= (select (arr!18063 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37634 (_ BitVec 32)) SeekEntryResult!6503)

(assert (=> b!621422 (= lt!287557 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18063 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621423 () Bool)

(declare-fun res!400460 () Bool)

(assert (=> b!621423 (=> (not res!400460) (not e!356418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37634 (_ BitVec 32)) Bool)

(assert (=> b!621423 (= res!400460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621424 () Bool)

(assert (=> b!621424 (= e!356418 e!356419)))

(declare-fun res!400461 () Bool)

(assert (=> b!621424 (=> (not res!400461) (not e!356419))))

(assert (=> b!621424 (= res!400461 (= (select (store (arr!18063 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621424 (= lt!287542 (array!37635 (store (arr!18063 a!2986) i!1108 k!1786) (size!18427 a!2986)))))

(declare-fun b!621425 () Bool)

(declare-fun res!400465 () Bool)

(assert (=> b!621425 (= res!400465 (arrayContainsKey!0 lt!287542 (select (arr!18063 a!2986) j!136) j!136))))

(declare-fun e!356429 () Bool)

(assert (=> b!621425 (=> (not res!400465) (not e!356429))))

(declare-fun e!356426 () Bool)

(assert (=> b!621425 (= e!356426 e!356429)))

(declare-fun b!621426 () Bool)

(declare-fun res!400456 () Bool)

(assert (=> b!621426 (=> (not res!400456) (not e!356418))))

(assert (=> b!621426 (= res!400456 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12101))))

(declare-fun b!621427 () Bool)

(declare-fun Unit!20763 () Unit!20758)

(assert (=> b!621427 (= e!356421 Unit!20763)))

(declare-fun b!621428 () Bool)

(assert (=> b!621428 (= e!356428 (arrayContainsKey!0 lt!287542 (select (arr!18063 a!2986) j!136) index!984))))

(declare-fun b!621429 () Bool)

(assert (=> b!621429 false))

(declare-fun lt!287544 () Unit!20758)

(assert (=> b!621429 (= lt!287544 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287542 (select (arr!18063 a!2986) j!136) j!136 Nil!12101))))

(assert (=> b!621429 (arrayNoDuplicates!0 lt!287542 j!136 Nil!12101)))

(declare-fun lt!287548 () Unit!20758)

(assert (=> b!621429 (= lt!287548 (lemmaNoDuplicateFromThenFromBigger!0 lt!287542 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621429 (arrayNoDuplicates!0 lt!287542 #b00000000000000000000000000000000 Nil!12101)))

(declare-fun lt!287550 () Unit!20758)

(assert (=> b!621429 (= lt!287550 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12101))))

(assert (=> b!621429 (arrayContainsKey!0 lt!287542 (select (arr!18063 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287538 () Unit!20758)

(assert (=> b!621429 (= lt!287538 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287542 (select (arr!18063 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20764 () Unit!20758)

(assert (=> b!621429 (= e!356421 Unit!20764)))

(declare-fun b!621430 () Bool)

(declare-fun res!400462 () Bool)

(assert (=> b!621430 (=> (not res!400462) (not e!356427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621430 (= res!400462 (validKeyInArray!0 k!1786))))

(declare-fun b!621431 () Bool)

(declare-fun Unit!20765 () Unit!20758)

(assert (=> b!621431 (= e!356425 Unit!20765)))

(declare-fun res!400457 () Bool)

(assert (=> start!56164 (=> (not res!400457) (not e!356427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56164 (= res!400457 (validMask!0 mask!3053))))

(assert (=> start!56164 e!356427))

(assert (=> start!56164 true))

(declare-fun array_inv!13859 (array!37634) Bool)

(assert (=> start!56164 (array_inv!13859 a!2986)))

(declare-fun b!621432 () Bool)

(assert (=> b!621432 (= e!356427 e!356418)))

(declare-fun res!400455 () Bool)

(assert (=> b!621432 (=> (not res!400455) (not e!356418))))

(declare-fun lt!287553 () SeekEntryResult!6503)

(assert (=> b!621432 (= res!400455 (or (= lt!287553 (MissingZero!6503 i!1108)) (= lt!287553 (MissingVacant!6503 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37634 (_ BitVec 32)) SeekEntryResult!6503)

(assert (=> b!621432 (= lt!287553 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!621433 () Bool)

(declare-fun res!400458 () Bool)

(assert (=> b!621433 (=> (not res!400458) (not e!356427))))

(assert (=> b!621433 (= res!400458 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621434 () Bool)

(declare-fun Unit!20766 () Unit!20758)

(assert (=> b!621434 (= e!356424 Unit!20766)))

(assert (=> b!621434 false))

(declare-fun b!621435 () Bool)

(declare-fun res!400459 () Bool)

(assert (=> b!621435 (=> (not res!400459) (not e!356427))))

(assert (=> b!621435 (= res!400459 (validKeyInArray!0 (select (arr!18063 a!2986) j!136)))))

(declare-fun b!621436 () Bool)

(assert (=> b!621436 (= e!356429 (arrayContainsKey!0 lt!287542 (select (arr!18063 a!2986) j!136) index!984))))

(declare-fun b!621437 () Bool)

(declare-fun Unit!20767 () Unit!20758)

(assert (=> b!621437 (= e!356420 Unit!20767)))

(declare-fun b!621438 () Bool)

(declare-fun e!356430 () Bool)

(declare-fun lt!287554 () SeekEntryResult!6503)

(assert (=> b!621438 (= e!356430 (= lt!287557 lt!287554))))

(declare-fun b!621439 () Bool)

(assert (=> b!621439 (= e!356423 (not true))))

(declare-fun lt!287543 () Unit!20758)

(assert (=> b!621439 (= lt!287543 e!356425)))

(declare-fun c!70851 () Bool)

(declare-fun lt!287546 () SeekEntryResult!6503)

(assert (=> b!621439 (= c!70851 (= lt!287546 (Found!6503 index!984)))))

(declare-fun lt!287541 () Unit!20758)

(assert (=> b!621439 (= lt!287541 e!356424)))

(declare-fun c!70853 () Bool)

(assert (=> b!621439 (= c!70853 (= lt!287546 Undefined!6503))))

(declare-fun lt!287540 () (_ BitVec 64))

(assert (=> b!621439 (= lt!287546 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287540 lt!287542 mask!3053))))

(assert (=> b!621439 e!356430))

(declare-fun res!400454 () Bool)

(assert (=> b!621439 (=> (not res!400454) (not e!356430))))

(declare-fun lt!287556 () (_ BitVec 32))

(assert (=> b!621439 (= res!400454 (= lt!287554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287556 vacantSpotIndex!68 lt!287540 lt!287542 mask!3053)))))

(assert (=> b!621439 (= lt!287554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287556 vacantSpotIndex!68 (select (arr!18063 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!621439 (= lt!287540 (select (store (arr!18063 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!287552 () Unit!20758)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37634 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20758)

(assert (=> b!621439 (= lt!287552 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287556 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621439 (= lt!287556 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621440 () Bool)

(declare-fun res!400466 () Bool)

(assert (=> b!621440 (= res!400466 (bvsge j!136 index!984))))

(assert (=> b!621440 (=> res!400466 e!356426)))

(assert (=> b!621440 (= e!356417 e!356426)))

(assert (= (and start!56164 res!400457) b!621421))

(assert (= (and b!621421 res!400463) b!621435))

(assert (= (and b!621435 res!400459) b!621430))

(assert (= (and b!621430 res!400462) b!621433))

(assert (= (and b!621433 res!400458) b!621432))

(assert (= (and b!621432 res!400455) b!621423))

(assert (= (and b!621423 res!400460) b!621426))

(assert (= (and b!621426 res!400456) b!621418))

(assert (= (and b!621418 res!400451) b!621424))

(assert (= (and b!621424 res!400461) b!621422))

(assert (= (and b!621422 res!400464) b!621439))

(assert (= (and b!621439 res!400454) b!621438))

(assert (= (and b!621439 c!70853) b!621434))

(assert (= (and b!621439 (not c!70853)) b!621420))

(assert (= (and b!621439 c!70851) b!621419))

(assert (= (and b!621439 (not c!70851)) b!621431))

(assert (= (and b!621419 res!400453) b!621440))

(assert (= (and b!621440 (not res!400466)) b!621425))

(assert (= (and b!621425 res!400465) b!621436))

(assert (= (and b!621419 c!70852) b!621429))

(assert (= (and b!621419 (not c!70852)) b!621427))

(assert (= (and b!621419 c!70850) b!621417))

(assert (= (and b!621419 (not c!70850)) b!621437))

(assert (= (and b!621417 res!400452) b!621428))

(declare-fun m!597311 () Bool)

(assert (=> b!621436 m!597311))

(assert (=> b!621436 m!597311))

(declare-fun m!597313 () Bool)

(assert (=> b!621436 m!597313))

(declare-fun m!597315 () Bool)

(assert (=> b!621426 m!597315))

(assert (=> b!621417 m!597311))

(declare-fun m!597317 () Bool)

(assert (=> b!621417 m!597317))

(declare-fun m!597319 () Bool)

(assert (=> b!621417 m!597319))

(assert (=> b!621417 m!597311))

(declare-fun m!597321 () Bool)

(assert (=> b!621417 m!597321))

(assert (=> b!621417 m!597311))

(declare-fun m!597323 () Bool)

(assert (=> b!621417 m!597323))

(assert (=> b!621417 m!597311))

(declare-fun m!597325 () Bool)

(assert (=> b!621417 m!597325))

(assert (=> b!621417 m!597311))

(declare-fun m!597327 () Bool)

(assert (=> b!621417 m!597327))

(declare-fun m!597329 () Bool)

(assert (=> b!621417 m!597329))

(declare-fun m!597331 () Bool)

(assert (=> b!621417 m!597331))

(declare-fun m!597333 () Bool)

(assert (=> b!621439 m!597333))

(declare-fun m!597335 () Bool)

(assert (=> b!621439 m!597335))

(assert (=> b!621439 m!597311))

(declare-fun m!597337 () Bool)

(assert (=> b!621439 m!597337))

(assert (=> b!621439 m!597311))

(declare-fun m!597339 () Bool)

(assert (=> b!621439 m!597339))

(declare-fun m!597341 () Bool)

(assert (=> b!621439 m!597341))

(declare-fun m!597343 () Bool)

(assert (=> b!621439 m!597343))

(declare-fun m!597345 () Bool)

(assert (=> b!621439 m!597345))

(declare-fun m!597347 () Bool)

(assert (=> b!621423 m!597347))

(assert (=> b!621428 m!597311))

(assert (=> b!621428 m!597311))

(assert (=> b!621428 m!597313))

(declare-fun m!597349 () Bool)

(assert (=> b!621430 m!597349))

(declare-fun m!597351 () Bool)

(assert (=> b!621418 m!597351))

(declare-fun m!597353 () Bool)

(assert (=> start!56164 m!597353))

(declare-fun m!597355 () Bool)

(assert (=> start!56164 m!597355))

(declare-fun m!597357 () Bool)

(assert (=> b!621433 m!597357))

(assert (=> b!621435 m!597311))

(assert (=> b!621435 m!597311))

(declare-fun m!597359 () Bool)

(assert (=> b!621435 m!597359))

(assert (=> b!621419 m!597337))

(declare-fun m!597361 () Bool)

(assert (=> b!621419 m!597361))

(assert (=> b!621419 m!597311))

(declare-fun m!597363 () Bool)

(assert (=> b!621432 m!597363))

(assert (=> b!621425 m!597311))

(assert (=> b!621425 m!597311))

(assert (=> b!621425 m!597321))

(declare-fun m!597365 () Bool)

(assert (=> b!621422 m!597365))

(assert (=> b!621422 m!597311))

(assert (=> b!621422 m!597311))

(declare-fun m!597367 () Bool)

(assert (=> b!621422 m!597367))

(declare-fun m!597369 () Bool)

(assert (=> b!621429 m!597369))

(assert (=> b!621429 m!597311))

(assert (=> b!621429 m!597317))

(assert (=> b!621429 m!597311))

(declare-fun m!597371 () Bool)

(assert (=> b!621429 m!597371))

(assert (=> b!621429 m!597311))

(declare-fun m!597373 () Bool)

(assert (=> b!621429 m!597373))

(declare-fun m!597375 () Bool)

(assert (=> b!621429 m!597375))

(assert (=> b!621429 m!597311))

(declare-fun m!597377 () Bool)

(assert (=> b!621429 m!597377))

(assert (=> b!621429 m!597331))

(assert (=> b!621424 m!597337))

(declare-fun m!597379 () Bool)

(assert (=> b!621424 m!597379))

(push 1)

