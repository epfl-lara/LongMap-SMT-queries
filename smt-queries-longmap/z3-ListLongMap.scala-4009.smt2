; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54576 () Bool)

(assert start!54576)

(declare-fun b!595725 () Bool)

(declare-fun e!340383 () Bool)

(declare-datatypes ((SeekEntryResult!6148 0))(
  ( (MissingZero!6148 (index!26840 (_ BitVec 32))) (Found!6148 (index!26841 (_ BitVec 32))) (Intermediate!6148 (undefined!6960 Bool) (index!26842 (_ BitVec 32)) (x!55795 (_ BitVec 32))) (Undefined!6148) (MissingVacant!6148 (index!26843 (_ BitVec 32))) )
))
(declare-fun lt!270520 () SeekEntryResult!6148)

(declare-fun lt!270517 () SeekEntryResult!6148)

(assert (=> b!595725 (= e!340383 (= lt!270520 lt!270517))))

(declare-fun b!595726 () Bool)

(declare-fun res!381505 () Bool)

(declare-fun e!340382 () Bool)

(assert (=> b!595726 (=> (not res!381505) (not e!340382))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!595726 (= res!381505 (validKeyInArray!0 k0!1786))))

(declare-fun b!595727 () Bool)

(declare-fun res!381500 () Bool)

(declare-fun e!340380 () Bool)

(assert (=> b!595727 (=> res!381500 e!340380)))

(declare-datatypes ((List!11700 0))(
  ( (Nil!11697) (Cons!11696 (h!12744 (_ BitVec 64)) (t!17920 List!11700)) )
))
(declare-fun contains!2909 (List!11700 (_ BitVec 64)) Bool)

(assert (=> b!595727 (= res!381500 (contains!2909 Nil!11697 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595728 () Bool)

(declare-fun res!381492 () Bool)

(declare-fun e!340378 () Bool)

(assert (=> b!595728 (=> (not res!381492) (not e!340378))))

(declare-datatypes ((array!36981 0))(
  ( (array!36982 (arr!17752 (Array (_ BitVec 32) (_ BitVec 64))) (size!18116 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36981)

(declare-fun arrayNoDuplicates!0 (array!36981 (_ BitVec 32) List!11700) Bool)

(assert (=> b!595728 (= res!381492 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11697))))

(declare-fun b!595729 () Bool)

(declare-fun res!381489 () Bool)

(assert (=> b!595729 (=> (not res!381489) (not e!340378))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36981 (_ BitVec 32)) Bool)

(assert (=> b!595729 (= res!381489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!381502 () Bool)

(assert (=> start!54576 (=> (not res!381502) (not e!340382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54576 (= res!381502 (validMask!0 mask!3053))))

(assert (=> start!54576 e!340382))

(assert (=> start!54576 true))

(declare-fun array_inv!13611 (array!36981) Bool)

(assert (=> start!54576 (array_inv!13611 a!2986)))

(declare-fun b!595730 () Bool)

(declare-fun e!340376 () Bool)

(declare-fun e!340385 () Bool)

(assert (=> b!595730 (= e!340376 e!340385)))

(declare-fun res!381508 () Bool)

(assert (=> b!595730 (=> res!381508 e!340385)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270521 () (_ BitVec 64))

(declare-fun lt!270514 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!595730 (= res!381508 (or (not (= (select (arr!17752 a!2986) j!136) lt!270514)) (not (= (select (arr!17752 a!2986) j!136) lt!270521)) (bvsge j!136 index!984)))))

(declare-fun e!340379 () Bool)

(assert (=> b!595730 e!340379))

(declare-fun res!381494 () Bool)

(assert (=> b!595730 (=> (not res!381494) (not e!340379))))

(assert (=> b!595730 (= res!381494 (= lt!270521 (select (arr!17752 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!595730 (= lt!270521 (select (store (arr!17752 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!595731 () Bool)

(declare-fun e!340374 () Bool)

(assert (=> b!595731 (= e!340374 (not e!340376))))

(declare-fun res!381490 () Bool)

(assert (=> b!595731 (=> res!381490 e!340376)))

(declare-fun lt!270513 () SeekEntryResult!6148)

(assert (=> b!595731 (= res!381490 (not (= lt!270513 (Found!6148 index!984))))))

(declare-datatypes ((Unit!18685 0))(
  ( (Unit!18686) )
))
(declare-fun lt!270512 () Unit!18685)

(declare-fun e!340381 () Unit!18685)

(assert (=> b!595731 (= lt!270512 e!340381)))

(declare-fun c!67487 () Bool)

(assert (=> b!595731 (= c!67487 (= lt!270513 Undefined!6148))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!270523 () array!36981)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36981 (_ BitVec 32)) SeekEntryResult!6148)

(assert (=> b!595731 (= lt!270513 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270514 lt!270523 mask!3053))))

(assert (=> b!595731 e!340383))

(declare-fun res!381506 () Bool)

(assert (=> b!595731 (=> (not res!381506) (not e!340383))))

(declare-fun lt!270519 () (_ BitVec 32))

(assert (=> b!595731 (= res!381506 (= lt!270517 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270519 vacantSpotIndex!68 lt!270514 lt!270523 mask!3053)))))

(assert (=> b!595731 (= lt!270517 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270519 vacantSpotIndex!68 (select (arr!17752 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!595731 (= lt!270514 (select (store (arr!17752 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270522 () Unit!18685)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36981 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18685)

(assert (=> b!595731 (= lt!270522 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270519 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!595731 (= lt!270519 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!595732 () Bool)

(declare-fun res!381497 () Bool)

(assert (=> b!595732 (=> res!381497 e!340380)))

(assert (=> b!595732 (= res!381497 (contains!2909 Nil!11697 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!595733 () Bool)

(assert (=> b!595733 (= e!340382 e!340378)))

(declare-fun res!381504 () Bool)

(assert (=> b!595733 (=> (not res!381504) (not e!340378))))

(declare-fun lt!270518 () SeekEntryResult!6148)

(assert (=> b!595733 (= res!381504 (or (= lt!270518 (MissingZero!6148 i!1108)) (= lt!270518 (MissingVacant!6148 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36981 (_ BitVec 32)) SeekEntryResult!6148)

(assert (=> b!595733 (= lt!270518 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!595734 () Bool)

(declare-fun res!381488 () Bool)

(assert (=> b!595734 (=> (not res!381488) (not e!340378))))

(assert (=> b!595734 (= res!381488 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17752 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!595735 () Bool)

(assert (=> b!595735 (= e!340385 e!340380)))

(declare-fun res!381495 () Bool)

(assert (=> b!595735 (=> res!381495 e!340380)))

(assert (=> b!595735 (= res!381495 (or (bvsge (size!18116 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18116 a!2986))))))

(declare-fun arrayContainsKey!0 (array!36981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!595735 (arrayContainsKey!0 lt!270523 (select (arr!17752 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270516 () Unit!18685)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36981 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18685)

(assert (=> b!595735 (= lt!270516 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270523 (select (arr!17752 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!595736 () Bool)

(declare-fun res!381496 () Bool)

(assert (=> b!595736 (=> (not res!381496) (not e!340382))))

(assert (=> b!595736 (= res!381496 (and (= (size!18116 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18116 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18116 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!595737 () Bool)

(declare-fun res!381501 () Bool)

(assert (=> b!595737 (=> res!381501 e!340380)))

(declare-fun noDuplicate!256 (List!11700) Bool)

(assert (=> b!595737 (= res!381501 (not (noDuplicate!256 Nil!11697)))))

(declare-fun b!595738 () Bool)

(declare-fun e!340375 () Bool)

(assert (=> b!595738 (= e!340375 e!340374)))

(declare-fun res!381493 () Bool)

(assert (=> b!595738 (=> (not res!381493) (not e!340374))))

(assert (=> b!595738 (= res!381493 (and (= lt!270520 (Found!6148 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17752 a!2986) index!984) (select (arr!17752 a!2986) j!136))) (not (= (select (arr!17752 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!595738 (= lt!270520 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17752 a!2986) j!136) a!2986 mask!3053))))

(declare-fun e!340377 () Bool)

(declare-fun b!595739 () Bool)

(assert (=> b!595739 (= e!340377 (arrayContainsKey!0 lt!270523 (select (arr!17752 a!2986) j!136) index!984))))

(declare-fun b!595740 () Bool)

(declare-fun e!340386 () Bool)

(assert (=> b!595740 (= e!340386 e!340377)))

(declare-fun res!381507 () Bool)

(assert (=> b!595740 (=> (not res!381507) (not e!340377))))

(assert (=> b!595740 (= res!381507 (arrayContainsKey!0 lt!270523 (select (arr!17752 a!2986) j!136) j!136))))

(declare-fun b!595741 () Bool)

(assert (=> b!595741 (= e!340379 e!340386)))

(declare-fun res!381491 () Bool)

(assert (=> b!595741 (=> res!381491 e!340386)))

(assert (=> b!595741 (= res!381491 (or (not (= (select (arr!17752 a!2986) j!136) lt!270514)) (not (= (select (arr!17752 a!2986) j!136) lt!270521)) (bvsge j!136 index!984)))))

(declare-fun b!595742 () Bool)

(declare-fun Unit!18687 () Unit!18685)

(assert (=> b!595742 (= e!340381 Unit!18687)))

(declare-fun b!595743 () Bool)

(declare-fun Unit!18688 () Unit!18685)

(assert (=> b!595743 (= e!340381 Unit!18688)))

(assert (=> b!595743 false))

(declare-fun b!595744 () Bool)

(declare-fun res!381499 () Bool)

(assert (=> b!595744 (=> (not res!381499) (not e!340382))))

(assert (=> b!595744 (= res!381499 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!595745 () Bool)

(declare-fun res!381503 () Bool)

(assert (=> b!595745 (=> (not res!381503) (not e!340382))))

(assert (=> b!595745 (= res!381503 (validKeyInArray!0 (select (arr!17752 a!2986) j!136)))))

(declare-fun b!595746 () Bool)

(assert (=> b!595746 (= e!340380 true)))

(declare-fun lt!270515 () Bool)

(assert (=> b!595746 (= lt!270515 (contains!2909 Nil!11697 k0!1786))))

(declare-fun b!595747 () Bool)

(assert (=> b!595747 (= e!340378 e!340375)))

(declare-fun res!381498 () Bool)

(assert (=> b!595747 (=> (not res!381498) (not e!340375))))

(assert (=> b!595747 (= res!381498 (= (select (store (arr!17752 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!595747 (= lt!270523 (array!36982 (store (arr!17752 a!2986) i!1108 k0!1786) (size!18116 a!2986)))))

(assert (= (and start!54576 res!381502) b!595736))

(assert (= (and b!595736 res!381496) b!595745))

(assert (= (and b!595745 res!381503) b!595726))

(assert (= (and b!595726 res!381505) b!595744))

(assert (= (and b!595744 res!381499) b!595733))

(assert (= (and b!595733 res!381504) b!595729))

(assert (= (and b!595729 res!381489) b!595728))

(assert (= (and b!595728 res!381492) b!595734))

(assert (= (and b!595734 res!381488) b!595747))

(assert (= (and b!595747 res!381498) b!595738))

(assert (= (and b!595738 res!381493) b!595731))

(assert (= (and b!595731 res!381506) b!595725))

(assert (= (and b!595731 c!67487) b!595743))

(assert (= (and b!595731 (not c!67487)) b!595742))

(assert (= (and b!595731 (not res!381490)) b!595730))

(assert (= (and b!595730 res!381494) b!595741))

(assert (= (and b!595741 (not res!381491)) b!595740))

(assert (= (and b!595740 res!381507) b!595739))

(assert (= (and b!595730 (not res!381508)) b!595735))

(assert (= (and b!595735 (not res!381495)) b!595737))

(assert (= (and b!595737 (not res!381501)) b!595732))

(assert (= (and b!595732 (not res!381497)) b!595727))

(assert (= (and b!595727 (not res!381500)) b!595746))

(declare-fun m!573569 () Bool)

(assert (=> b!595740 m!573569))

(assert (=> b!595740 m!573569))

(declare-fun m!573571 () Bool)

(assert (=> b!595740 m!573571))

(declare-fun m!573573 () Bool)

(assert (=> b!595734 m!573573))

(declare-fun m!573575 () Bool)

(assert (=> b!595727 m!573575))

(declare-fun m!573577 () Bool)

(assert (=> b!595733 m!573577))

(assert (=> b!595730 m!573569))

(declare-fun m!573579 () Bool)

(assert (=> b!595730 m!573579))

(declare-fun m!573581 () Bool)

(assert (=> b!595730 m!573581))

(declare-fun m!573583 () Bool)

(assert (=> b!595738 m!573583))

(assert (=> b!595738 m!573569))

(assert (=> b!595738 m!573569))

(declare-fun m!573585 () Bool)

(assert (=> b!595738 m!573585))

(declare-fun m!573587 () Bool)

(assert (=> start!54576 m!573587))

(declare-fun m!573589 () Bool)

(assert (=> start!54576 m!573589))

(assert (=> b!595745 m!573569))

(assert (=> b!595745 m!573569))

(declare-fun m!573591 () Bool)

(assert (=> b!595745 m!573591))

(declare-fun m!573593 () Bool)

(assert (=> b!595728 m!573593))

(declare-fun m!573595 () Bool)

(assert (=> b!595731 m!573595))

(declare-fun m!573597 () Bool)

(assert (=> b!595731 m!573597))

(assert (=> b!595731 m!573579))

(assert (=> b!595731 m!573569))

(declare-fun m!573599 () Bool)

(assert (=> b!595731 m!573599))

(declare-fun m!573601 () Bool)

(assert (=> b!595731 m!573601))

(declare-fun m!573603 () Bool)

(assert (=> b!595731 m!573603))

(assert (=> b!595731 m!573569))

(declare-fun m!573605 () Bool)

(assert (=> b!595731 m!573605))

(assert (=> b!595747 m!573579))

(declare-fun m!573607 () Bool)

(assert (=> b!595747 m!573607))

(assert (=> b!595741 m!573569))

(declare-fun m!573609 () Bool)

(assert (=> b!595744 m!573609))

(assert (=> b!595739 m!573569))

(assert (=> b!595739 m!573569))

(declare-fun m!573611 () Bool)

(assert (=> b!595739 m!573611))

(assert (=> b!595735 m!573569))

(assert (=> b!595735 m!573569))

(declare-fun m!573613 () Bool)

(assert (=> b!595735 m!573613))

(assert (=> b!595735 m!573569))

(declare-fun m!573615 () Bool)

(assert (=> b!595735 m!573615))

(declare-fun m!573617 () Bool)

(assert (=> b!595746 m!573617))

(declare-fun m!573619 () Bool)

(assert (=> b!595726 m!573619))

(declare-fun m!573621 () Bool)

(assert (=> b!595732 m!573621))

(declare-fun m!573623 () Bool)

(assert (=> b!595737 m!573623))

(declare-fun m!573625 () Bool)

(assert (=> b!595729 m!573625))

(check-sat (not b!595737) (not b!595732) (not b!595740) (not b!595731) (not b!595738) (not b!595728) (not b!595745) (not b!595733) (not b!595729) (not b!595735) (not b!595744) (not start!54576) (not b!595746) (not b!595726) (not b!595727) (not b!595739))
(check-sat)
