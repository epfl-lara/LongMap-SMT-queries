; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54496 () Bool)

(assert start!54496)

(declare-fun b!594481 () Bool)

(declare-fun e!339668 () Bool)

(declare-fun e!339660 () Bool)

(assert (=> b!594481 (= e!339668 e!339660)))

(declare-fun res!380456 () Bool)

(assert (=> b!594481 (=> (not res!380456) (not e!339660))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36956 0))(
  ( (array!36957 (arr!17742 (Array (_ BitVec 32) (_ BitVec 64))) (size!18106 (_ BitVec 32))) )
))
(declare-fun lt!269877 () array!36956)

(declare-fun a!2986 () array!36956)

(declare-fun arrayContainsKey!0 (array!36956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594481 (= res!380456 (arrayContainsKey!0 lt!269877 (select (arr!17742 a!2986) j!136) j!136))))

(declare-fun b!594482 () Bool)

(declare-fun res!380454 () Bool)

(declare-fun e!339661 () Bool)

(assert (=> b!594482 (=> (not res!380454) (not e!339661))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594482 (= res!380454 (validKeyInArray!0 k!1786))))

(declare-fun res!380449 () Bool)

(assert (=> start!54496 (=> (not res!380449) (not e!339661))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54496 (= res!380449 (validMask!0 mask!3053))))

(assert (=> start!54496 e!339661))

(assert (=> start!54496 true))

(declare-fun array_inv!13538 (array!36956) Bool)

(assert (=> start!54496 (array_inv!13538 a!2986)))

(declare-fun b!594483 () Bool)

(declare-fun res!380447 () Bool)

(declare-fun e!339662 () Bool)

(assert (=> b!594483 (=> res!380447 e!339662)))

(declare-datatypes ((List!11783 0))(
  ( (Nil!11780) (Cons!11779 (h!12824 (_ BitVec 64)) (t!18011 List!11783)) )
))
(declare-fun noDuplicate!237 (List!11783) Bool)

(assert (=> b!594483 (= res!380447 (not (noDuplicate!237 Nil!11780)))))

(declare-fun b!594484 () Bool)

(declare-fun res!380451 () Bool)

(assert (=> b!594484 (=> res!380451 e!339662)))

(declare-fun contains!2918 (List!11783 (_ BitVec 64)) Bool)

(assert (=> b!594484 (= res!380451 (contains!2918 Nil!11780 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594485 () Bool)

(declare-fun e!339665 () Bool)

(declare-fun e!339664 () Bool)

(assert (=> b!594485 (= e!339665 (not e!339664))))

(declare-fun res!380446 () Bool)

(assert (=> b!594485 (=> res!380446 e!339664)))

(declare-datatypes ((SeekEntryResult!6182 0))(
  ( (MissingZero!6182 (index!26976 (_ BitVec 32))) (Found!6182 (index!26977 (_ BitVec 32))) (Intermediate!6182 (undefined!6994 Bool) (index!26978 (_ BitVec 32)) (x!55786 (_ BitVec 32))) (Undefined!6182) (MissingVacant!6182 (index!26979 (_ BitVec 32))) )
))
(declare-fun lt!269881 () SeekEntryResult!6182)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594485 (= res!380446 (not (= lt!269881 (Found!6182 index!984))))))

(declare-datatypes ((Unit!18646 0))(
  ( (Unit!18647) )
))
(declare-fun lt!269872 () Unit!18646)

(declare-fun e!339669 () Unit!18646)

(assert (=> b!594485 (= lt!269872 e!339669)))

(declare-fun c!67388 () Bool)

(assert (=> b!594485 (= c!67388 (= lt!269881 Undefined!6182))))

(declare-fun lt!269880 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36956 (_ BitVec 32)) SeekEntryResult!6182)

(assert (=> b!594485 (= lt!269881 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269880 lt!269877 mask!3053))))

(declare-fun e!339667 () Bool)

(assert (=> b!594485 e!339667))

(declare-fun res!380450 () Bool)

(assert (=> b!594485 (=> (not res!380450) (not e!339667))))

(declare-fun lt!269870 () (_ BitVec 32))

(declare-fun lt!269874 () SeekEntryResult!6182)

(assert (=> b!594485 (= res!380450 (= lt!269874 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269870 vacantSpotIndex!68 lt!269880 lt!269877 mask!3053)))))

(assert (=> b!594485 (= lt!269874 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269870 vacantSpotIndex!68 (select (arr!17742 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594485 (= lt!269880 (select (store (arr!17742 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!269879 () Unit!18646)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36956 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18646)

(assert (=> b!594485 (= lt!269879 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269870 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594485 (= lt!269870 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594486 () Bool)

(declare-fun e!339666 () Bool)

(assert (=> b!594486 (= e!339661 e!339666)))

(declare-fun res!380445 () Bool)

(assert (=> b!594486 (=> (not res!380445) (not e!339666))))

(declare-fun lt!269876 () SeekEntryResult!6182)

(assert (=> b!594486 (= res!380445 (or (= lt!269876 (MissingZero!6182 i!1108)) (= lt!269876 (MissingVacant!6182 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36956 (_ BitVec 32)) SeekEntryResult!6182)

(assert (=> b!594486 (= lt!269876 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!594487 () Bool)

(declare-fun Unit!18648 () Unit!18646)

(assert (=> b!594487 (= e!339669 Unit!18648)))

(assert (=> b!594487 false))

(declare-fun b!594488 () Bool)

(declare-fun res!380459 () Bool)

(assert (=> b!594488 (=> (not res!380459) (not e!339661))))

(assert (=> b!594488 (= res!380459 (validKeyInArray!0 (select (arr!17742 a!2986) j!136)))))

(declare-fun b!594489 () Bool)

(declare-fun Unit!18649 () Unit!18646)

(assert (=> b!594489 (= e!339669 Unit!18649)))

(declare-fun b!594490 () Bool)

(declare-fun e!339672 () Bool)

(assert (=> b!594490 (= e!339672 e!339662)))

(declare-fun res!380455 () Bool)

(assert (=> b!594490 (=> res!380455 e!339662)))

(assert (=> b!594490 (= res!380455 (or (bvsge (size!18106 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18106 a!2986))))))

(assert (=> b!594490 (arrayContainsKey!0 lt!269877 (select (arr!17742 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269871 () Unit!18646)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36956 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18646)

(assert (=> b!594490 (= lt!269871 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269877 (select (arr!17742 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594491 () Bool)

(assert (=> b!594491 (= e!339660 (arrayContainsKey!0 lt!269877 (select (arr!17742 a!2986) j!136) index!984))))

(declare-fun b!594492 () Bool)

(declare-fun lt!269873 () SeekEntryResult!6182)

(assert (=> b!594492 (= e!339667 (= lt!269873 lt!269874))))

(declare-fun b!594493 () Bool)

(declare-fun res!380441 () Bool)

(assert (=> b!594493 (=> (not res!380441) (not e!339666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36956 (_ BitVec 32)) Bool)

(assert (=> b!594493 (= res!380441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594494 () Bool)

(declare-fun res!380444 () Bool)

(assert (=> b!594494 (=> (not res!380444) (not e!339666))))

(declare-fun arrayNoDuplicates!0 (array!36956 (_ BitVec 32) List!11783) Bool)

(assert (=> b!594494 (= res!380444 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11780))))

(declare-fun b!594495 () Bool)

(declare-fun e!339671 () Bool)

(assert (=> b!594495 (= e!339671 e!339665)))

(declare-fun res!380448 () Bool)

(assert (=> b!594495 (=> (not res!380448) (not e!339665))))

(assert (=> b!594495 (= res!380448 (and (= lt!269873 (Found!6182 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17742 a!2986) index!984) (select (arr!17742 a!2986) j!136))) (not (= (select (arr!17742 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594495 (= lt!269873 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17742 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594496 () Bool)

(assert (=> b!594496 (= e!339662 true)))

(declare-fun lt!269875 () Bool)

(assert (=> b!594496 (= lt!269875 (contains!2918 Nil!11780 k!1786))))

(declare-fun b!594497 () Bool)

(assert (=> b!594497 (= e!339664 e!339672)))

(declare-fun res!380453 () Bool)

(assert (=> b!594497 (=> res!380453 e!339672)))

(declare-fun lt!269878 () (_ BitVec 64))

(assert (=> b!594497 (= res!380453 (or (not (= (select (arr!17742 a!2986) j!136) lt!269880)) (not (= (select (arr!17742 a!2986) j!136) lt!269878)) (bvsge j!136 index!984)))))

(declare-fun e!339663 () Bool)

(assert (=> b!594497 e!339663))

(declare-fun res!380458 () Bool)

(assert (=> b!594497 (=> (not res!380458) (not e!339663))))

(assert (=> b!594497 (= res!380458 (= lt!269878 (select (arr!17742 a!2986) j!136)))))

(assert (=> b!594497 (= lt!269878 (select (store (arr!17742 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!594498 () Bool)

(declare-fun res!380442 () Bool)

(assert (=> b!594498 (=> (not res!380442) (not e!339661))))

(assert (=> b!594498 (= res!380442 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594499 () Bool)

(assert (=> b!594499 (= e!339666 e!339671)))

(declare-fun res!380452 () Bool)

(assert (=> b!594499 (=> (not res!380452) (not e!339671))))

(assert (=> b!594499 (= res!380452 (= (select (store (arr!17742 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594499 (= lt!269877 (array!36957 (store (arr!17742 a!2986) i!1108 k!1786) (size!18106 a!2986)))))

(declare-fun b!594500 () Bool)

(assert (=> b!594500 (= e!339663 e!339668)))

(declare-fun res!380440 () Bool)

(assert (=> b!594500 (=> res!380440 e!339668)))

(assert (=> b!594500 (= res!380440 (or (not (= (select (arr!17742 a!2986) j!136) lt!269880)) (not (= (select (arr!17742 a!2986) j!136) lt!269878)) (bvsge j!136 index!984)))))

(declare-fun b!594501 () Bool)

(declare-fun res!380457 () Bool)

(assert (=> b!594501 (=> (not res!380457) (not e!339661))))

(assert (=> b!594501 (= res!380457 (and (= (size!18106 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18106 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18106 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594502 () Bool)

(declare-fun res!380439 () Bool)

(assert (=> b!594502 (=> res!380439 e!339662)))

(assert (=> b!594502 (= res!380439 (contains!2918 Nil!11780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594503 () Bool)

(declare-fun res!380443 () Bool)

(assert (=> b!594503 (=> (not res!380443) (not e!339666))))

(assert (=> b!594503 (= res!380443 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17742 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54496 res!380449) b!594501))

(assert (= (and b!594501 res!380457) b!594488))

(assert (= (and b!594488 res!380459) b!594482))

(assert (= (and b!594482 res!380454) b!594498))

(assert (= (and b!594498 res!380442) b!594486))

(assert (= (and b!594486 res!380445) b!594493))

(assert (= (and b!594493 res!380441) b!594494))

(assert (= (and b!594494 res!380444) b!594503))

(assert (= (and b!594503 res!380443) b!594499))

(assert (= (and b!594499 res!380452) b!594495))

(assert (= (and b!594495 res!380448) b!594485))

(assert (= (and b!594485 res!380450) b!594492))

(assert (= (and b!594485 c!67388) b!594487))

(assert (= (and b!594485 (not c!67388)) b!594489))

(assert (= (and b!594485 (not res!380446)) b!594497))

(assert (= (and b!594497 res!380458) b!594500))

(assert (= (and b!594500 (not res!380440)) b!594481))

(assert (= (and b!594481 res!380456) b!594491))

(assert (= (and b!594497 (not res!380453)) b!594490))

(assert (= (and b!594490 (not res!380455)) b!594483))

(assert (= (and b!594483 (not res!380447)) b!594502))

(assert (= (and b!594502 (not res!380439)) b!594484))

(assert (= (and b!594484 (not res!380451)) b!594496))

(declare-fun m!572285 () Bool)

(assert (=> b!594484 m!572285))

(declare-fun m!572287 () Bool)

(assert (=> b!594502 m!572287))

(declare-fun m!572289 () Bool)

(assert (=> b!594485 m!572289))

(declare-fun m!572291 () Bool)

(assert (=> b!594485 m!572291))

(declare-fun m!572293 () Bool)

(assert (=> b!594485 m!572293))

(declare-fun m!572295 () Bool)

(assert (=> b!594485 m!572295))

(declare-fun m!572297 () Bool)

(assert (=> b!594485 m!572297))

(declare-fun m!572299 () Bool)

(assert (=> b!594485 m!572299))

(declare-fun m!572301 () Bool)

(assert (=> b!594485 m!572301))

(assert (=> b!594485 m!572293))

(declare-fun m!572303 () Bool)

(assert (=> b!594485 m!572303))

(assert (=> b!594499 m!572297))

(declare-fun m!572305 () Bool)

(assert (=> b!594499 m!572305))

(assert (=> b!594491 m!572293))

(assert (=> b!594491 m!572293))

(declare-fun m!572307 () Bool)

(assert (=> b!594491 m!572307))

(declare-fun m!572309 () Bool)

(assert (=> b!594496 m!572309))

(declare-fun m!572311 () Bool)

(assert (=> b!594498 m!572311))

(declare-fun m!572313 () Bool)

(assert (=> b!594482 m!572313))

(assert (=> b!594490 m!572293))

(assert (=> b!594490 m!572293))

(declare-fun m!572315 () Bool)

(assert (=> b!594490 m!572315))

(assert (=> b!594490 m!572293))

(declare-fun m!572317 () Bool)

(assert (=> b!594490 m!572317))

(assert (=> b!594500 m!572293))

(declare-fun m!572319 () Bool)

(assert (=> b!594503 m!572319))

(assert (=> b!594481 m!572293))

(assert (=> b!594481 m!572293))

(declare-fun m!572321 () Bool)

(assert (=> b!594481 m!572321))

(assert (=> b!594497 m!572293))

(assert (=> b!594497 m!572297))

(declare-fun m!572323 () Bool)

(assert (=> b!594497 m!572323))

(declare-fun m!572325 () Bool)

(assert (=> b!594483 m!572325))

(assert (=> b!594488 m!572293))

(assert (=> b!594488 m!572293))

(declare-fun m!572327 () Bool)

(assert (=> b!594488 m!572327))

(declare-fun m!572329 () Bool)

(assert (=> b!594495 m!572329))

(assert (=> b!594495 m!572293))

(assert (=> b!594495 m!572293))

(declare-fun m!572331 () Bool)

(assert (=> b!594495 m!572331))

(declare-fun m!572333 () Bool)

(assert (=> b!594486 m!572333))

(declare-fun m!572335 () Bool)

(assert (=> b!594494 m!572335))

(declare-fun m!572337 () Bool)

(assert (=> start!54496 m!572337))

(declare-fun m!572339 () Bool)

(assert (=> start!54496 m!572339))

(declare-fun m!572341 () Bool)

(assert (=> b!594493 m!572341))

(push 1)

