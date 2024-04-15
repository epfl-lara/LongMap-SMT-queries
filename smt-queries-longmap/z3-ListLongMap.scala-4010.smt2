; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54516 () Bool)

(assert start!54516)

(declare-fun b!595452 () Bool)

(declare-fun res!381464 () Bool)

(declare-fun e!340190 () Bool)

(assert (=> b!595452 (=> (not res!381464) (not e!340190))))

(declare-datatypes ((array!36990 0))(
  ( (array!36991 (arr!17759 (Array (_ BitVec 32) (_ BitVec 64))) (size!18124 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36990)

(declare-datatypes ((List!11839 0))(
  ( (Nil!11836) (Cons!11835 (h!12880 (_ BitVec 64)) (t!18058 List!11839)) )
))
(declare-fun arrayNoDuplicates!0 (array!36990 (_ BitVec 32) List!11839) Bool)

(assert (=> b!595452 (= res!381464 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11836))))

(declare-fun b!595453 () Bool)

(declare-fun e!340189 () Bool)

(assert (=> b!595453 (= e!340189 e!340190)))

(declare-fun res!381445 () Bool)

(assert (=> b!595453 (=> (not res!381445) (not e!340190))))

(declare-datatypes ((SeekEntryResult!6196 0))(
  ( (MissingZero!6196 (index!27032 (_ BitVec 32))) (Found!6196 (index!27033 (_ BitVec 32))) (Intermediate!6196 (undefined!7008 Bool) (index!27034 (_ BitVec 32)) (x!55843 (_ BitVec 32))) (Undefined!6196) (MissingVacant!6196 (index!27035 (_ BitVec 32))) )
))
(declare-fun lt!270294 () SeekEntryResult!6196)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595453 (= res!381445 (or (= lt!270294 (MissingZero!6196 i!1108)) (= lt!270294 (MissingVacant!6196 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36990 (_ BitVec 32)) SeekEntryResult!6196)

(assert (=> b!595453 (= lt!270294 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595454 () Bool)

(declare-fun res!381461 () Bool)

(declare-fun e!340196 () Bool)

(assert (=> b!595454 (=> res!381461 e!340196)))

(declare-fun contains!2923 (List!11839 (_ BitVec 64)) Bool)

(assert (=> b!595454 (= res!381461 (contains!2923 Nil!11836 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!340193 () Bool)

(declare-fun lt!270290 () array!36990)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun b!595455 () Bool)

(declare-fun arrayContainsKey!0 (array!36990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595455 (= e!340193 (arrayContainsKey!0 lt!270290 (select (arr!17759 a!2986) j!136) index!984))))

(declare-fun b!595456 () Bool)

(declare-fun e!340197 () Bool)

(declare-fun e!340192 () Bool)

(assert (=> b!595456 (= e!340197 e!340192)))

(declare-fun res!381452 () Bool)

(assert (=> b!595456 (=> res!381452 e!340192)))

(declare-fun lt!270284 () (_ BitVec 64))

(declare-fun lt!270292 () (_ BitVec 64))

(assert (=> b!595456 (= res!381452 (or (not (= (select (arr!17759 a!2986) j!136) lt!270292)) (not (= (select (arr!17759 a!2986) j!136) lt!270284)) (bvsge j!136 index!984)))))

(declare-fun b!595457 () Bool)

(declare-fun e!340188 () Bool)

(declare-fun e!340200 () Bool)

(assert (=> b!595457 (= e!340188 e!340200)))

(declare-fun res!381456 () Bool)

(assert (=> b!595457 (=> res!381456 e!340200)))

(assert (=> b!595457 (= res!381456 (or (not (= (select (arr!17759 a!2986) j!136) lt!270292)) (not (= (select (arr!17759 a!2986) j!136) lt!270284)) (bvsge j!136 index!984)))))

(assert (=> b!595457 e!340197))

(declare-fun res!381460 () Bool)

(assert (=> b!595457 (=> (not res!381460) (not e!340197))))

(assert (=> b!595457 (= res!381460 (= lt!270284 (select (arr!17759 a!2986) j!136)))))

(assert (=> b!595457 (= lt!270284 (select (store (arr!17759 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595458 () Bool)

(declare-fun res!381463 () Bool)

(assert (=> b!595458 (=> res!381463 e!340196)))

(declare-fun noDuplicate!260 (List!11839) Bool)

(assert (=> b!595458 (= res!381463 (not (noDuplicate!260 Nil!11836)))))

(declare-fun res!381453 () Bool)

(assert (=> start!54516 (=> (not res!381453) (not e!340189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54516 (= res!381453 (validMask!0 mask!3053))))

(assert (=> start!54516 e!340189))

(assert (=> start!54516 true))

(declare-fun array_inv!13642 (array!36990) Bool)

(assert (=> start!54516 (array_inv!13642 a!2986)))

(declare-fun b!595459 () Bool)

(declare-fun e!340194 () Bool)

(declare-fun lt!270291 () SeekEntryResult!6196)

(declare-fun lt!270293 () SeekEntryResult!6196)

(assert (=> b!595459 (= e!340194 (= lt!270291 lt!270293))))

(declare-fun b!595460 () Bool)

(assert (=> b!595460 (= e!340192 e!340193)))

(declare-fun res!381455 () Bool)

(assert (=> b!595460 (=> (not res!381455) (not e!340193))))

(assert (=> b!595460 (= res!381455 (arrayContainsKey!0 lt!270290 (select (arr!17759 a!2986) j!136) j!136))))

(declare-fun b!595461 () Bool)

(declare-fun e!340198 () Bool)

(declare-fun e!340191 () Bool)

(assert (=> b!595461 (= e!340198 e!340191)))

(declare-fun res!381450 () Bool)

(assert (=> b!595461 (=> (not res!381450) (not e!340191))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!595461 (= res!381450 (and (= lt!270291 (Found!6196 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17759 a!2986) index!984) (select (arr!17759 a!2986) j!136))) (not (= (select (arr!17759 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36990 (_ BitVec 32)) SeekEntryResult!6196)

(assert (=> b!595461 (= lt!270291 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17759 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595462 () Bool)

(declare-fun res!381446 () Bool)

(assert (=> b!595462 (=> (not res!381446) (not e!340189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595462 (= res!381446 (validKeyInArray!0 k0!1786))))

(declare-fun b!595463 () Bool)

(declare-fun res!381447 () Bool)

(assert (=> b!595463 (=> (not res!381447) (not e!340189))))

(assert (=> b!595463 (= res!381447 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595464 () Bool)

(assert (=> b!595464 (= e!340191 (not e!340188))))

(declare-fun res!381454 () Bool)

(assert (=> b!595464 (=> res!381454 e!340188)))

(declare-fun lt!270285 () SeekEntryResult!6196)

(assert (=> b!595464 (= res!381454 (not (= lt!270285 (Found!6196 index!984))))))

(declare-datatypes ((Unit!18696 0))(
  ( (Unit!18697) )
))
(declare-fun lt!270289 () Unit!18696)

(declare-fun e!340199 () Unit!18696)

(assert (=> b!595464 (= lt!270289 e!340199)))

(declare-fun c!67371 () Bool)

(assert (=> b!595464 (= c!67371 (= lt!270285 Undefined!6196))))

(assert (=> b!595464 (= lt!270285 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270292 lt!270290 mask!3053))))

(assert (=> b!595464 e!340194))

(declare-fun res!381459 () Bool)

(assert (=> b!595464 (=> (not res!381459) (not e!340194))))

(declare-fun lt!270287 () (_ BitVec 32))

(assert (=> b!595464 (= res!381459 (= lt!270293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270287 vacantSpotIndex!68 lt!270292 lt!270290 mask!3053)))))

(assert (=> b!595464 (= lt!270293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270287 vacantSpotIndex!68 (select (arr!17759 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595464 (= lt!270292 (select (store (arr!17759 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270295 () Unit!18696)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36990 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18696)

(assert (=> b!595464 (= lt!270295 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270287 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595464 (= lt!270287 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595465 () Bool)

(declare-fun Unit!18698 () Unit!18696)

(assert (=> b!595465 (= e!340199 Unit!18698)))

(declare-fun b!595466 () Bool)

(assert (=> b!595466 (= e!340190 e!340198)))

(declare-fun res!381462 () Bool)

(assert (=> b!595466 (=> (not res!381462) (not e!340198))))

(assert (=> b!595466 (= res!381462 (= (select (store (arr!17759 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595466 (= lt!270290 (array!36991 (store (arr!17759 a!2986) i!1108 k0!1786) (size!18124 a!2986)))))

(declare-fun b!595467 () Bool)

(declare-fun res!381451 () Bool)

(assert (=> b!595467 (=> res!381451 e!340196)))

(assert (=> b!595467 (= res!381451 (contains!2923 Nil!11836 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595468 () Bool)

(assert (=> b!595468 (= e!340196 true)))

(declare-fun lt!270288 () Bool)

(assert (=> b!595468 (= lt!270288 (contains!2923 Nil!11836 k0!1786))))

(declare-fun b!595469 () Bool)

(declare-fun res!381448 () Bool)

(assert (=> b!595469 (=> (not res!381448) (not e!340189))))

(assert (=> b!595469 (= res!381448 (and (= (size!18124 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18124 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18124 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595470 () Bool)

(declare-fun res!381457 () Bool)

(assert (=> b!595470 (=> (not res!381457) (not e!340190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36990 (_ BitVec 32)) Bool)

(assert (=> b!595470 (= res!381457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595471 () Bool)

(declare-fun Unit!18699 () Unit!18696)

(assert (=> b!595471 (= e!340199 Unit!18699)))

(assert (=> b!595471 false))

(declare-fun b!595472 () Bool)

(assert (=> b!595472 (= e!340200 e!340196)))

(declare-fun res!381444 () Bool)

(assert (=> b!595472 (=> res!381444 e!340196)))

(assert (=> b!595472 (= res!381444 (or (bvsge (size!18124 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18124 a!2986))))))

(assert (=> b!595472 (arrayContainsKey!0 lt!270290 (select (arr!17759 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270286 () Unit!18696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36990 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18696)

(assert (=> b!595472 (= lt!270286 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270290 (select (arr!17759 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595473 () Bool)

(declare-fun res!381449 () Bool)

(assert (=> b!595473 (=> (not res!381449) (not e!340190))))

(assert (=> b!595473 (= res!381449 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17759 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595474 () Bool)

(declare-fun res!381458 () Bool)

(assert (=> b!595474 (=> (not res!381458) (not e!340189))))

(assert (=> b!595474 (= res!381458 (validKeyInArray!0 (select (arr!17759 a!2986) j!136)))))

(assert (= (and start!54516 res!381453) b!595469))

(assert (= (and b!595469 res!381448) b!595474))

(assert (= (and b!595474 res!381458) b!595462))

(assert (= (and b!595462 res!381446) b!595463))

(assert (= (and b!595463 res!381447) b!595453))

(assert (= (and b!595453 res!381445) b!595470))

(assert (= (and b!595470 res!381457) b!595452))

(assert (= (and b!595452 res!381464) b!595473))

(assert (= (and b!595473 res!381449) b!595466))

(assert (= (and b!595466 res!381462) b!595461))

(assert (= (and b!595461 res!381450) b!595464))

(assert (= (and b!595464 res!381459) b!595459))

(assert (= (and b!595464 c!67371) b!595471))

(assert (= (and b!595464 (not c!67371)) b!595465))

(assert (= (and b!595464 (not res!381454)) b!595457))

(assert (= (and b!595457 res!381460) b!595456))

(assert (= (and b!595456 (not res!381452)) b!595460))

(assert (= (and b!595460 res!381455) b!595455))

(assert (= (and b!595457 (not res!381456)) b!595472))

(assert (= (and b!595472 (not res!381444)) b!595458))

(assert (= (and b!595458 (not res!381463)) b!595467))

(assert (= (and b!595467 (not res!381451)) b!595454))

(assert (= (and b!595454 (not res!381461)) b!595468))

(declare-fun m!572557 () Bool)

(assert (=> b!595467 m!572557))

(declare-fun m!572559 () Bool)

(assert (=> b!595470 m!572559))

(declare-fun m!572561 () Bool)

(assert (=> b!595472 m!572561))

(assert (=> b!595472 m!572561))

(declare-fun m!572563 () Bool)

(assert (=> b!595472 m!572563))

(assert (=> b!595472 m!572561))

(declare-fun m!572565 () Bool)

(assert (=> b!595472 m!572565))

(declare-fun m!572567 () Bool)

(assert (=> b!595461 m!572567))

(assert (=> b!595461 m!572561))

(assert (=> b!595461 m!572561))

(declare-fun m!572569 () Bool)

(assert (=> b!595461 m!572569))

(declare-fun m!572571 () Bool)

(assert (=> b!595468 m!572571))

(declare-fun m!572573 () Bool)

(assert (=> b!595473 m!572573))

(declare-fun m!572575 () Bool)

(assert (=> b!595458 m!572575))

(assert (=> b!595457 m!572561))

(declare-fun m!572577 () Bool)

(assert (=> b!595457 m!572577))

(declare-fun m!572579 () Bool)

(assert (=> b!595457 m!572579))

(declare-fun m!572581 () Bool)

(assert (=> b!595462 m!572581))

(declare-fun m!572583 () Bool)

(assert (=> start!54516 m!572583))

(declare-fun m!572585 () Bool)

(assert (=> start!54516 m!572585))

(declare-fun m!572587 () Bool)

(assert (=> b!595463 m!572587))

(assert (=> b!595460 m!572561))

(assert (=> b!595460 m!572561))

(declare-fun m!572589 () Bool)

(assert (=> b!595460 m!572589))

(declare-fun m!572591 () Bool)

(assert (=> b!595452 m!572591))

(declare-fun m!572593 () Bool)

(assert (=> b!595454 m!572593))

(assert (=> b!595474 m!572561))

(assert (=> b!595474 m!572561))

(declare-fun m!572595 () Bool)

(assert (=> b!595474 m!572595))

(assert (=> b!595456 m!572561))

(declare-fun m!572597 () Bool)

(assert (=> b!595453 m!572597))

(assert (=> b!595455 m!572561))

(assert (=> b!595455 m!572561))

(declare-fun m!572599 () Bool)

(assert (=> b!595455 m!572599))

(declare-fun m!572601 () Bool)

(assert (=> b!595464 m!572601))

(declare-fun m!572603 () Bool)

(assert (=> b!595464 m!572603))

(assert (=> b!595464 m!572561))

(assert (=> b!595464 m!572577))

(declare-fun m!572605 () Bool)

(assert (=> b!595464 m!572605))

(declare-fun m!572607 () Bool)

(assert (=> b!595464 m!572607))

(declare-fun m!572609 () Bool)

(assert (=> b!595464 m!572609))

(assert (=> b!595464 m!572561))

(declare-fun m!572611 () Bool)

(assert (=> b!595464 m!572611))

(assert (=> b!595466 m!572577))

(declare-fun m!572613 () Bool)

(assert (=> b!595466 m!572613))

(check-sat (not b!595453) (not b!595472) (not b!595464) (not b!595470) (not b!595463) (not b!595461) (not b!595468) (not b!595454) (not b!595460) (not start!54516) (not b!595452) (not b!595455) (not b!595458) (not b!595462) (not b!595467) (not b!595474))
(check-sat)
