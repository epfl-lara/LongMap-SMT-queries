; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54536 () Bool)

(assert start!54536)

(declare-fun b!595862 () Bool)

(declare-fun e!340449 () Bool)

(declare-fun e!340442 () Bool)

(assert (=> b!595862 (= e!340449 e!340442)))

(declare-fun res!381711 () Bool)

(assert (=> b!595862 (=> (not res!381711) (not e!340442))))

(declare-datatypes ((SeekEntryResult!6202 0))(
  ( (MissingZero!6202 (index!27056 (_ BitVec 32))) (Found!6202 (index!27057 (_ BitVec 32))) (Intermediate!6202 (undefined!7014 Bool) (index!27058 (_ BitVec 32)) (x!55854 (_ BitVec 32))) (Undefined!6202) (MissingVacant!6202 (index!27059 (_ BitVec 32))) )
))
(declare-fun lt!270598 () SeekEntryResult!6202)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595862 (= res!381711 (or (= lt!270598 (MissingZero!6202 i!1108)) (= lt!270598 (MissingVacant!6202 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36996 0))(
  ( (array!36997 (arr!17762 (Array (_ BitVec 32) (_ BitVec 64))) (size!18126 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36996)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36996 (_ BitVec 32)) SeekEntryResult!6202)

(assert (=> b!595862 (= lt!270598 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!595863 () Bool)

(declare-fun e!340452 () Bool)

(assert (=> b!595863 (= e!340442 e!340452)))

(declare-fun res!381705 () Bool)

(assert (=> b!595863 (=> (not res!381705) (not e!340452))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!595863 (= res!381705 (= (select (store (arr!17762 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270593 () array!36996)

(assert (=> b!595863 (= lt!270593 (array!36997 (store (arr!17762 a!2986) i!1108 k!1786) (size!18126 a!2986)))))

(declare-fun b!595864 () Bool)

(declare-fun res!381704 () Bool)

(assert (=> b!595864 (=> (not res!381704) (not e!340442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36996 (_ BitVec 32)) Bool)

(assert (=> b!595864 (= res!381704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!595865 () Bool)

(declare-fun e!340446 () Bool)

(assert (=> b!595865 (= e!340452 e!340446)))

(declare-fun res!381706 () Bool)

(assert (=> b!595865 (=> (not res!381706) (not e!340446))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270596 () SeekEntryResult!6202)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595865 (= res!381706 (and (= lt!270596 (Found!6202 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17762 a!2986) index!984) (select (arr!17762 a!2986) j!136))) (not (= (select (arr!17762 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36996 (_ BitVec 32)) SeekEntryResult!6202)

(assert (=> b!595865 (= lt!270596 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17762 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!595866 () Bool)

(declare-fun e!340451 () Bool)

(assert (=> b!595866 (= e!340451 true)))

(declare-fun lt!270597 () Bool)

(declare-datatypes ((List!11803 0))(
  ( (Nil!11800) (Cons!11799 (h!12844 (_ BitVec 64)) (t!18031 List!11803)) )
))
(declare-fun contains!2938 (List!11803 (_ BitVec 64)) Bool)

(assert (=> b!595866 (= lt!270597 (contains!2938 Nil!11800 k!1786))))

(declare-fun b!595867 () Bool)

(declare-fun e!340450 () Bool)

(assert (=> b!595867 (= e!340446 (not e!340450))))

(declare-fun res!381699 () Bool)

(assert (=> b!595867 (=> res!381699 e!340450)))

(declare-fun lt!270599 () SeekEntryResult!6202)

(assert (=> b!595867 (= res!381699 (not (= lt!270599 (Found!6202 index!984))))))

(declare-datatypes ((Unit!18726 0))(
  ( (Unit!18727) )
))
(declare-fun lt!270601 () Unit!18726)

(declare-fun e!340445 () Unit!18726)

(assert (=> b!595867 (= lt!270601 e!340445)))

(declare-fun c!67448 () Bool)

(assert (=> b!595867 (= c!67448 (= lt!270599 Undefined!6202))))

(declare-fun lt!270590 () (_ BitVec 64))

(assert (=> b!595867 (= lt!270599 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270590 lt!270593 mask!3053))))

(declare-fun e!340447 () Bool)

(assert (=> b!595867 e!340447))

(declare-fun res!381702 () Bool)

(assert (=> b!595867 (=> (not res!381702) (not e!340447))))

(declare-fun lt!270591 () SeekEntryResult!6202)

(declare-fun lt!270600 () (_ BitVec 32))

(assert (=> b!595867 (= res!381702 (= lt!270591 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270600 vacantSpotIndex!68 lt!270590 lt!270593 mask!3053)))))

(assert (=> b!595867 (= lt!270591 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270600 vacantSpotIndex!68 (select (arr!17762 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595867 (= lt!270590 (select (store (arr!17762 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270595 () Unit!18726)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36996 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18726)

(assert (=> b!595867 (= lt!270595 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270600 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595867 (= lt!270600 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!595868 () Bool)

(declare-fun res!381715 () Bool)

(assert (=> b!595868 (=> (not res!381715) (not e!340442))))

(assert (=> b!595868 (= res!381715 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17762 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595869 () Bool)

(declare-fun e!340448 () Bool)

(declare-fun e!340444 () Bool)

(assert (=> b!595869 (= e!340448 e!340444)))

(declare-fun res!381718 () Bool)

(assert (=> b!595869 (=> res!381718 e!340444)))

(declare-fun lt!270594 () (_ BitVec 64))

(assert (=> b!595869 (= res!381718 (or (not (= (select (arr!17762 a!2986) j!136) lt!270590)) (not (= (select (arr!17762 a!2986) j!136) lt!270594)) (bvsge j!136 index!984)))))

(declare-fun b!595870 () Bool)

(declare-fun res!381717 () Bool)

(assert (=> b!595870 (=> res!381717 e!340451)))

(declare-fun noDuplicate!257 (List!11803) Bool)

(assert (=> b!595870 (= res!381717 (not (noDuplicate!257 Nil!11800)))))

(declare-fun b!595871 () Bool)

(declare-fun res!381710 () Bool)

(assert (=> b!595871 (=> (not res!381710) (not e!340449))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595871 (= res!381710 (validKeyInArray!0 (select (arr!17762 a!2986) j!136)))))

(declare-fun b!595872 () Bool)

(declare-fun res!381708 () Bool)

(assert (=> b!595872 (=> (not res!381708) (not e!340442))))

(declare-fun arrayNoDuplicates!0 (array!36996 (_ BitVec 32) List!11803) Bool)

(assert (=> b!595872 (= res!381708 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11800))))

(declare-fun b!595873 () Bool)

(declare-fun e!340440 () Bool)

(assert (=> b!595873 (= e!340450 e!340440)))

(declare-fun res!381713 () Bool)

(assert (=> b!595873 (=> res!381713 e!340440)))

(assert (=> b!595873 (= res!381713 (or (not (= (select (arr!17762 a!2986) j!136) lt!270590)) (not (= (select (arr!17762 a!2986) j!136) lt!270594)) (bvsge j!136 index!984)))))

(assert (=> b!595873 e!340448))

(declare-fun res!381716 () Bool)

(assert (=> b!595873 (=> (not res!381716) (not e!340448))))

(assert (=> b!595873 (= res!381716 (= lt!270594 (select (arr!17762 a!2986) j!136)))))

(assert (=> b!595873 (= lt!270594 (select (store (arr!17762 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!595874 () Bool)

(declare-fun e!340443 () Bool)

(declare-fun arrayContainsKey!0 (array!36996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595874 (= e!340443 (arrayContainsKey!0 lt!270593 (select (arr!17762 a!2986) j!136) index!984))))

(declare-fun b!595875 () Bool)

(declare-fun res!381714 () Bool)

(assert (=> b!595875 (=> res!381714 e!340451)))

(assert (=> b!595875 (= res!381714 (contains!2938 Nil!11800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595861 () Bool)

(declare-fun res!381703 () Bool)

(assert (=> b!595861 (=> res!381703 e!340451)))

(assert (=> b!595861 (= res!381703 (contains!2938 Nil!11800 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!381709 () Bool)

(assert (=> start!54536 (=> (not res!381709) (not e!340449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54536 (= res!381709 (validMask!0 mask!3053))))

(assert (=> start!54536 e!340449))

(assert (=> start!54536 true))

(declare-fun array_inv!13558 (array!36996) Bool)

(assert (=> start!54536 (array_inv!13558 a!2986)))

(declare-fun b!595876 () Bool)

(declare-fun Unit!18728 () Unit!18726)

(assert (=> b!595876 (= e!340445 Unit!18728)))

(assert (=> b!595876 false))

(declare-fun b!595877 () Bool)

(declare-fun Unit!18729 () Unit!18726)

(assert (=> b!595877 (= e!340445 Unit!18729)))

(declare-fun b!595878 () Bool)

(declare-fun res!381701 () Bool)

(assert (=> b!595878 (=> (not res!381701) (not e!340449))))

(assert (=> b!595878 (= res!381701 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595879 () Bool)

(assert (=> b!595879 (= e!340444 e!340443)))

(declare-fun res!381707 () Bool)

(assert (=> b!595879 (=> (not res!381707) (not e!340443))))

(assert (=> b!595879 (= res!381707 (arrayContainsKey!0 lt!270593 (select (arr!17762 a!2986) j!136) j!136))))

(declare-fun b!595880 () Bool)

(assert (=> b!595880 (= e!340447 (= lt!270596 lt!270591))))

(declare-fun b!595881 () Bool)

(declare-fun res!381719 () Bool)

(assert (=> b!595881 (=> (not res!381719) (not e!340449))))

(assert (=> b!595881 (= res!381719 (validKeyInArray!0 k!1786))))

(declare-fun b!595882 () Bool)

(declare-fun res!381712 () Bool)

(assert (=> b!595882 (=> (not res!381712) (not e!340449))))

(assert (=> b!595882 (= res!381712 (and (= (size!18126 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18126 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18126 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595883 () Bool)

(assert (=> b!595883 (= e!340440 e!340451)))

(declare-fun res!381700 () Bool)

(assert (=> b!595883 (=> res!381700 e!340451)))

(assert (=> b!595883 (= res!381700 (or (bvsge (size!18126 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18126 a!2986))))))

(assert (=> b!595883 (arrayContainsKey!0 lt!270593 (select (arr!17762 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270592 () Unit!18726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36996 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18726)

(assert (=> b!595883 (= lt!270592 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270593 (select (arr!17762 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!54536 res!381709) b!595882))

(assert (= (and b!595882 res!381712) b!595871))

(assert (= (and b!595871 res!381710) b!595881))

(assert (= (and b!595881 res!381719) b!595878))

(assert (= (and b!595878 res!381701) b!595862))

(assert (= (and b!595862 res!381711) b!595864))

(assert (= (and b!595864 res!381704) b!595872))

(assert (= (and b!595872 res!381708) b!595868))

(assert (= (and b!595868 res!381715) b!595863))

(assert (= (and b!595863 res!381705) b!595865))

(assert (= (and b!595865 res!381706) b!595867))

(assert (= (and b!595867 res!381702) b!595880))

(assert (= (and b!595867 c!67448) b!595876))

(assert (= (and b!595867 (not c!67448)) b!595877))

(assert (= (and b!595867 (not res!381699)) b!595873))

(assert (= (and b!595873 res!381716) b!595869))

(assert (= (and b!595869 (not res!381718)) b!595879))

(assert (= (and b!595879 res!381707) b!595874))

(assert (= (and b!595873 (not res!381713)) b!595883))

(assert (= (and b!595883 (not res!381700)) b!595870))

(assert (= (and b!595870 (not res!381717)) b!595875))

(assert (= (and b!595875 (not res!381714)) b!595861))

(assert (= (and b!595861 (not res!381703)) b!595866))

(declare-fun m!573445 () Bool)

(assert (=> b!595868 m!573445))

(declare-fun m!573447 () Bool)

(assert (=> b!595875 m!573447))

(declare-fun m!573449 () Bool)

(assert (=> b!595883 m!573449))

(assert (=> b!595883 m!573449))

(declare-fun m!573451 () Bool)

(assert (=> b!595883 m!573451))

(assert (=> b!595883 m!573449))

(declare-fun m!573453 () Bool)

(assert (=> b!595883 m!573453))

(declare-fun m!573455 () Bool)

(assert (=> b!595867 m!573455))

(declare-fun m!573457 () Bool)

(assert (=> b!595867 m!573457))

(declare-fun m!573459 () Bool)

(assert (=> b!595867 m!573459))

(assert (=> b!595867 m!573449))

(declare-fun m!573461 () Bool)

(assert (=> b!595867 m!573461))

(assert (=> b!595867 m!573449))

(declare-fun m!573463 () Bool)

(assert (=> b!595867 m!573463))

(declare-fun m!573465 () Bool)

(assert (=> b!595867 m!573465))

(declare-fun m!573467 () Bool)

(assert (=> b!595867 m!573467))

(declare-fun m!573469 () Bool)

(assert (=> b!595864 m!573469))

(declare-fun m!573471 () Bool)

(assert (=> b!595865 m!573471))

(assert (=> b!595865 m!573449))

(assert (=> b!595865 m!573449))

(declare-fun m!573473 () Bool)

(assert (=> b!595865 m!573473))

(assert (=> b!595871 m!573449))

(assert (=> b!595871 m!573449))

(declare-fun m!573475 () Bool)

(assert (=> b!595871 m!573475))

(declare-fun m!573477 () Bool)

(assert (=> b!595861 m!573477))

(declare-fun m!573479 () Bool)

(assert (=> b!595878 m!573479))

(assert (=> b!595869 m!573449))

(declare-fun m!573481 () Bool)

(assert (=> b!595866 m!573481))

(declare-fun m!573483 () Bool)

(assert (=> b!595872 m!573483))

(declare-fun m!573485 () Bool)

(assert (=> b!595862 m!573485))

(declare-fun m!573487 () Bool)

(assert (=> b!595881 m!573487))

(assert (=> b!595879 m!573449))

(assert (=> b!595879 m!573449))

(declare-fun m!573489 () Bool)

(assert (=> b!595879 m!573489))

(assert (=> b!595873 m!573449))

(assert (=> b!595873 m!573461))

(declare-fun m!573491 () Bool)

(assert (=> b!595873 m!573491))

(declare-fun m!573493 () Bool)

(assert (=> b!595870 m!573493))

(declare-fun m!573495 () Bool)

(assert (=> start!54536 m!573495))

(declare-fun m!573497 () Bool)

(assert (=> start!54536 m!573497))

(assert (=> b!595863 m!573461))

(declare-fun m!573499 () Bool)

(assert (=> b!595863 m!573499))

(assert (=> b!595874 m!573449))

(assert (=> b!595874 m!573449))

(declare-fun m!573501 () Bool)

(assert (=> b!595874 m!573501))

(push 1)

