; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54546 () Bool)

(assert start!54546)

(declare-fun b!596479 () Bool)

(declare-fun res!382397 () Bool)

(declare-fun e!340771 () Bool)

(assert (=> b!596479 (=> (not res!382397) (not e!340771))))

(declare-datatypes ((array!37020 0))(
  ( (array!37021 (arr!17774 (Array (_ BitVec 32) (_ BitVec 64))) (size!18139 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37020)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596479 (= res!382397 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596480 () Bool)

(declare-fun e!340774 () Bool)

(declare-fun e!340777 () Bool)

(assert (=> b!596480 (= e!340774 e!340777)))

(declare-fun res!382390 () Bool)

(assert (=> b!596480 (=> res!382390 e!340777)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270830 () (_ BitVec 64))

(declare-fun lt!270829 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596480 (= res!382390 (or (not (= (select (arr!17774 a!2986) j!136) lt!270830)) (not (= (select (arr!17774 a!2986) j!136) lt!270829)) (bvsge j!136 index!984)))))

(declare-fun e!340780 () Bool)

(assert (=> b!596480 e!340780))

(declare-fun res!382387 () Bool)

(assert (=> b!596480 (=> (not res!382387) (not e!340780))))

(assert (=> b!596480 (= res!382387 (= lt!270829 (select (arr!17774 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596480 (= lt!270829 (select (store (arr!17774 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!382388 () Bool)

(assert (=> start!54546 (=> (not res!382388) (not e!340771))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54546 (= res!382388 (validMask!0 mask!3053))))

(assert (=> start!54546 e!340771))

(assert (=> start!54546 true))

(declare-fun array_inv!13657 (array!37020) Bool)

(assert (=> start!54546 (array_inv!13657 a!2986)))

(declare-fun b!596481 () Bool)

(declare-fun e!340772 () Bool)

(assert (=> b!596481 (= e!340772 (not e!340774))))

(declare-fun res!382383 () Bool)

(assert (=> b!596481 (=> res!382383 e!340774)))

(declare-datatypes ((SeekEntryResult!6211 0))(
  ( (MissingZero!6211 (index!27092 (_ BitVec 32))) (Found!6211 (index!27093 (_ BitVec 32))) (Intermediate!6211 (undefined!7023 Bool) (index!27094 (_ BitVec 32)) (x!55898 (_ BitVec 32))) (Undefined!6211) (MissingVacant!6211 (index!27095 (_ BitVec 32))) )
))
(declare-fun lt!270824 () SeekEntryResult!6211)

(assert (=> b!596481 (= res!382383 (not (= lt!270824 (Found!6211 index!984))))))

(declare-datatypes ((Unit!18756 0))(
  ( (Unit!18757) )
))
(declare-fun lt!270828 () Unit!18756)

(declare-fun e!340778 () Unit!18756)

(assert (=> b!596481 (= lt!270828 e!340778)))

(declare-fun c!67416 () Bool)

(assert (=> b!596481 (= c!67416 (= lt!270824 Undefined!6211))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!270833 () array!37020)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37020 (_ BitVec 32)) SeekEntryResult!6211)

(assert (=> b!596481 (= lt!270824 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270830 lt!270833 mask!3053))))

(declare-fun e!340781 () Bool)

(assert (=> b!596481 e!340781))

(declare-fun res!382394 () Bool)

(assert (=> b!596481 (=> (not res!382394) (not e!340781))))

(declare-fun lt!270834 () SeekEntryResult!6211)

(declare-fun lt!270825 () (_ BitVec 32))

(assert (=> b!596481 (= res!382394 (= lt!270834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270825 vacantSpotIndex!68 lt!270830 lt!270833 mask!3053)))))

(assert (=> b!596481 (= lt!270834 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270825 vacantSpotIndex!68 (select (arr!17774 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596481 (= lt!270830 (select (store (arr!17774 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270826 () Unit!18756)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37020 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18756)

(assert (=> b!596481 (= lt!270826 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270825 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596481 (= lt!270825 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596482 () Bool)

(declare-fun e!340773 () Bool)

(assert (=> b!596482 (= e!340780 e!340773)))

(declare-fun res!382392 () Bool)

(assert (=> b!596482 (=> res!382392 e!340773)))

(assert (=> b!596482 (= res!382392 (or (not (= (select (arr!17774 a!2986) j!136) lt!270830)) (not (= (select (arr!17774 a!2986) j!136) lt!270829)) (bvsge j!136 index!984)))))

(declare-fun b!596483 () Bool)

(assert (=> b!596483 (= e!340777 (bvsle #b00000000000000000000000000000000 (size!18139 a!2986)))))

(declare-datatypes ((List!11854 0))(
  ( (Nil!11851) (Cons!11850 (h!12895 (_ BitVec 64)) (t!18073 List!11854)) )
))
(declare-fun arrayNoDuplicates!0 (array!37020 (_ BitVec 32) List!11854) Bool)

(assert (=> b!596483 (arrayNoDuplicates!0 lt!270833 #b00000000000000000000000000000000 Nil!11851)))

(declare-fun lt!270827 () Unit!18756)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11854) Unit!18756)

(assert (=> b!596483 (= lt!270827 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11851))))

(assert (=> b!596483 (arrayContainsKey!0 lt!270833 (select (arr!17774 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270832 () Unit!18756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18756)

(assert (=> b!596483 (= lt!270832 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270833 (select (arr!17774 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596484 () Bool)

(declare-fun e!340782 () Bool)

(declare-fun e!340775 () Bool)

(assert (=> b!596484 (= e!340782 e!340775)))

(declare-fun res!382389 () Bool)

(assert (=> b!596484 (=> (not res!382389) (not e!340775))))

(assert (=> b!596484 (= res!382389 (= (select (store (arr!17774 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596484 (= lt!270833 (array!37021 (store (arr!17774 a!2986) i!1108 k0!1786) (size!18139 a!2986)))))

(declare-fun b!596485 () Bool)

(declare-fun Unit!18758 () Unit!18756)

(assert (=> b!596485 (= e!340778 Unit!18758)))

(assert (=> b!596485 false))

(declare-fun b!596486 () Bool)

(assert (=> b!596486 (= e!340775 e!340772)))

(declare-fun res!382384 () Bool)

(assert (=> b!596486 (=> (not res!382384) (not e!340772))))

(declare-fun lt!270835 () SeekEntryResult!6211)

(assert (=> b!596486 (= res!382384 (and (= lt!270835 (Found!6211 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17774 a!2986) index!984) (select (arr!17774 a!2986) j!136))) (not (= (select (arr!17774 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596486 (= lt!270835 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17774 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596487 () Bool)

(declare-fun res!382396 () Bool)

(assert (=> b!596487 (=> (not res!382396) (not e!340771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596487 (= res!382396 (validKeyInArray!0 (select (arr!17774 a!2986) j!136)))))

(declare-fun b!596488 () Bool)

(declare-fun Unit!18759 () Unit!18756)

(assert (=> b!596488 (= e!340778 Unit!18759)))

(declare-fun b!596489 () Bool)

(declare-fun res!382393 () Bool)

(assert (=> b!596489 (=> (not res!382393) (not e!340771))))

(assert (=> b!596489 (= res!382393 (and (= (size!18139 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18139 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18139 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596490 () Bool)

(declare-fun res!382395 () Bool)

(assert (=> b!596490 (=> (not res!382395) (not e!340782))))

(assert (=> b!596490 (= res!382395 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11851))))

(declare-fun b!596491 () Bool)

(declare-fun res!382391 () Bool)

(assert (=> b!596491 (=> (not res!382391) (not e!340771))))

(assert (=> b!596491 (= res!382391 (validKeyInArray!0 k0!1786))))

(declare-fun b!596492 () Bool)

(declare-fun e!340779 () Bool)

(assert (=> b!596492 (= e!340773 e!340779)))

(declare-fun res!382385 () Bool)

(assert (=> b!596492 (=> (not res!382385) (not e!340779))))

(assert (=> b!596492 (= res!382385 (arrayContainsKey!0 lt!270833 (select (arr!17774 a!2986) j!136) j!136))))

(declare-fun b!596493 () Bool)

(assert (=> b!596493 (= e!340781 (= lt!270835 lt!270834))))

(declare-fun b!596494 () Bool)

(declare-fun res!382382 () Bool)

(assert (=> b!596494 (=> (not res!382382) (not e!340782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37020 (_ BitVec 32)) Bool)

(assert (=> b!596494 (= res!382382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596495 () Bool)

(declare-fun res!382386 () Bool)

(assert (=> b!596495 (=> (not res!382386) (not e!340782))))

(assert (=> b!596495 (= res!382386 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17774 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596496 () Bool)

(assert (=> b!596496 (= e!340779 (arrayContainsKey!0 lt!270833 (select (arr!17774 a!2986) j!136) index!984))))

(declare-fun b!596497 () Bool)

(assert (=> b!596497 (= e!340771 e!340782)))

(declare-fun res!382381 () Bool)

(assert (=> b!596497 (=> (not res!382381) (not e!340782))))

(declare-fun lt!270831 () SeekEntryResult!6211)

(assert (=> b!596497 (= res!382381 (or (= lt!270831 (MissingZero!6211 i!1108)) (= lt!270831 (MissingVacant!6211 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37020 (_ BitVec 32)) SeekEntryResult!6211)

(assert (=> b!596497 (= lt!270831 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!54546 res!382388) b!596489))

(assert (= (and b!596489 res!382393) b!596487))

(assert (= (and b!596487 res!382396) b!596491))

(assert (= (and b!596491 res!382391) b!596479))

(assert (= (and b!596479 res!382397) b!596497))

(assert (= (and b!596497 res!382381) b!596494))

(assert (= (and b!596494 res!382382) b!596490))

(assert (= (and b!596490 res!382395) b!596495))

(assert (= (and b!596495 res!382386) b!596484))

(assert (= (and b!596484 res!382389) b!596486))

(assert (= (and b!596486 res!382384) b!596481))

(assert (= (and b!596481 res!382394) b!596493))

(assert (= (and b!596481 c!67416) b!596485))

(assert (= (and b!596481 (not c!67416)) b!596488))

(assert (= (and b!596481 (not res!382383)) b!596480))

(assert (= (and b!596480 res!382387) b!596482))

(assert (= (and b!596482 (not res!382392)) b!596492))

(assert (= (and b!596492 res!382385) b!596496))

(assert (= (and b!596480 (not res!382390)) b!596483))

(declare-fun m!573427 () Bool)

(assert (=> b!596483 m!573427))

(declare-fun m!573429 () Bool)

(assert (=> b!596483 m!573429))

(assert (=> b!596483 m!573427))

(assert (=> b!596483 m!573427))

(declare-fun m!573431 () Bool)

(assert (=> b!596483 m!573431))

(declare-fun m!573433 () Bool)

(assert (=> b!596483 m!573433))

(declare-fun m!573435 () Bool)

(assert (=> b!596483 m!573435))

(assert (=> b!596480 m!573427))

(declare-fun m!573437 () Bool)

(assert (=> b!596480 m!573437))

(declare-fun m!573439 () Bool)

(assert (=> b!596480 m!573439))

(assert (=> b!596492 m!573427))

(assert (=> b!596492 m!573427))

(declare-fun m!573441 () Bool)

(assert (=> b!596492 m!573441))

(declare-fun m!573443 () Bool)

(assert (=> b!596479 m!573443))

(assert (=> b!596482 m!573427))

(declare-fun m!573445 () Bool)

(assert (=> b!596490 m!573445))

(declare-fun m!573447 () Bool)

(assert (=> start!54546 m!573447))

(declare-fun m!573449 () Bool)

(assert (=> start!54546 m!573449))

(declare-fun m!573451 () Bool)

(assert (=> b!596481 m!573451))

(assert (=> b!596481 m!573427))

(declare-fun m!573453 () Bool)

(assert (=> b!596481 m!573453))

(declare-fun m!573455 () Bool)

(assert (=> b!596481 m!573455))

(assert (=> b!596481 m!573437))

(declare-fun m!573457 () Bool)

(assert (=> b!596481 m!573457))

(declare-fun m!573459 () Bool)

(assert (=> b!596481 m!573459))

(assert (=> b!596481 m!573427))

(declare-fun m!573461 () Bool)

(assert (=> b!596481 m!573461))

(declare-fun m!573463 () Bool)

(assert (=> b!596497 m!573463))

(declare-fun m!573465 () Bool)

(assert (=> b!596491 m!573465))

(declare-fun m!573467 () Bool)

(assert (=> b!596495 m!573467))

(declare-fun m!573469 () Bool)

(assert (=> b!596494 m!573469))

(declare-fun m!573471 () Bool)

(assert (=> b!596486 m!573471))

(assert (=> b!596486 m!573427))

(assert (=> b!596486 m!573427))

(declare-fun m!573473 () Bool)

(assert (=> b!596486 m!573473))

(assert (=> b!596487 m!573427))

(assert (=> b!596487 m!573427))

(declare-fun m!573475 () Bool)

(assert (=> b!596487 m!573475))

(assert (=> b!596496 m!573427))

(assert (=> b!596496 m!573427))

(declare-fun m!573477 () Bool)

(assert (=> b!596496 m!573477))

(assert (=> b!596484 m!573437))

(declare-fun m!573479 () Bool)

(assert (=> b!596484 m!573479))

(check-sat (not b!596491) (not b!596494) (not b!596486) (not b!596496) (not b!596492) (not b!596497) (not b!596481) (not b!596490) (not start!54546) (not b!596483) (not b!596487) (not b!596479))
(check-sat)
