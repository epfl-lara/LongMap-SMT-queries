; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54714 () Bool)

(assert start!54714)

(declare-fun b!597649 () Bool)

(declare-fun e!341553 () Bool)

(declare-fun e!341547 () Bool)

(assert (=> b!597649 (= e!341553 e!341547)))

(declare-fun res!383098 () Bool)

(assert (=> b!597649 (=> res!383098 e!341547)))

(declare-fun lt!271404 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!271409 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37044 0))(
  ( (array!37045 (arr!17783 (Array (_ BitVec 32) (_ BitVec 64))) (size!18148 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37044)

(assert (=> b!597649 (= res!383098 (or (not (= (select (arr!17783 a!2986) j!136) lt!271409)) (not (= (select (arr!17783 a!2986) j!136) lt!271404)) (bvsge j!136 index!984)))))

(declare-fun b!597650 () Bool)

(declare-fun e!341549 () Bool)

(declare-fun e!341546 () Bool)

(assert (=> b!597650 (= e!341549 e!341546)))

(declare-fun res!383095 () Bool)

(assert (=> b!597650 (=> (not res!383095) (not e!341546))))

(declare-datatypes ((SeekEntryResult!6220 0))(
  ( (MissingZero!6220 (index!27134 (_ BitVec 32))) (Found!6220 (index!27135 (_ BitVec 32))) (Intermediate!6220 (undefined!7032 Bool) (index!27136 (_ BitVec 32)) (x!55949 (_ BitVec 32))) (Undefined!6220) (MissingVacant!6220 (index!27137 (_ BitVec 32))) )
))
(declare-fun lt!271405 () SeekEntryResult!6220)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!597650 (= res!383095 (and (= lt!271405 (Found!6220 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17783 a!2986) index!984) (select (arr!17783 a!2986) j!136))) (not (= (select (arr!17783 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37044 (_ BitVec 32)) SeekEntryResult!6220)

(assert (=> b!597650 (= lt!271405 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597652 () Bool)

(declare-fun res!383094 () Bool)

(declare-fun e!341551 () Bool)

(assert (=> b!597652 (=> (not res!383094) (not e!341551))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!597652 (= res!383094 (and (= (size!18148 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18148 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597653 () Bool)

(declare-datatypes ((Unit!18792 0))(
  ( (Unit!18793) )
))
(declare-fun e!341558 () Unit!18792)

(declare-fun Unit!18794 () Unit!18792)

(assert (=> b!597653 (= e!341558 Unit!18794)))

(assert (=> b!597653 false))

(declare-fun b!597654 () Bool)

(declare-fun e!341559 () Bool)

(declare-datatypes ((List!11863 0))(
  ( (Nil!11860) (Cons!11859 (h!12904 (_ BitVec 64)) (t!18082 List!11863)) )
))
(declare-fun contains!2943 (List!11863 (_ BitVec 64)) Bool)

(assert (=> b!597654 (= e!341559 (not (contains!2943 Nil!11860 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597655 () Bool)

(declare-fun e!341548 () Bool)

(assert (=> b!597655 (= e!341548 e!341549)))

(declare-fun res!383097 () Bool)

(assert (=> b!597655 (=> (not res!383097) (not e!341549))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!597655 (= res!383097 (= (select (store (arr!17783 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!271400 () array!37044)

(assert (=> b!597655 (= lt!271400 (array!37045 (store (arr!17783 a!2986) i!1108 k0!1786) (size!18148 a!2986)))))

(declare-fun b!597656 () Bool)

(declare-fun e!341555 () Bool)

(declare-fun arrayContainsKey!0 (array!37044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597656 (= e!341555 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) index!984))))

(declare-fun b!597657 () Bool)

(declare-fun res!383099 () Bool)

(assert (=> b!597657 (=> (not res!383099) (not e!341548))))

(declare-fun arrayNoDuplicates!0 (array!37044 (_ BitVec 32) List!11863) Bool)

(assert (=> b!597657 (= res!383099 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11860))))

(declare-fun b!597658 () Bool)

(declare-fun e!341554 () Bool)

(assert (=> b!597658 (= e!341554 e!341559)))

(declare-fun res!383091 () Bool)

(assert (=> b!597658 (=> (not res!383091) (not e!341559))))

(assert (=> b!597658 (= res!383091 (not (contains!2943 Nil!11860 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!383103 () Bool)

(assert (=> start!54714 (=> (not res!383103) (not e!341551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54714 (= res!383103 (validMask!0 mask!3053))))

(assert (=> start!54714 e!341551))

(assert (=> start!54714 true))

(declare-fun array_inv!13666 (array!37044) Bool)

(assert (=> start!54714 (array_inv!13666 a!2986)))

(declare-fun b!597651 () Bool)

(declare-fun res!383090 () Bool)

(assert (=> b!597651 (=> (not res!383090) (not e!341548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37044 (_ BitVec 32)) Bool)

(assert (=> b!597651 (= res!383090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597659 () Bool)

(declare-fun res!383093 () Bool)

(assert (=> b!597659 (=> (not res!383093) (not e!341548))))

(assert (=> b!597659 (= res!383093 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17783 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597660 () Bool)

(declare-fun res!383100 () Bool)

(assert (=> b!597660 (=> (not res!383100) (not e!341551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597660 (= res!383100 (validKeyInArray!0 k0!1786))))

(declare-fun b!597661 () Bool)

(declare-fun res!383107 () Bool)

(assert (=> b!597661 (=> res!383107 e!341554)))

(declare-fun noDuplicate!278 (List!11863) Bool)

(assert (=> b!597661 (= res!383107 (not (noDuplicate!278 Nil!11860)))))

(declare-fun b!597662 () Bool)

(declare-fun e!341556 () Bool)

(assert (=> b!597662 (= e!341556 e!341554)))

(declare-fun res!383106 () Bool)

(assert (=> b!597662 (=> res!383106 e!341554)))

(assert (=> b!597662 (= res!383106 (or (bvsgt #b00000000000000000000000000000000 (size!18148 a!2986)) (bvsge (size!18148 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!597662 (arrayNoDuplicates!0 lt!271400 #b00000000000000000000000000000000 Nil!11860)))

(declare-fun lt!271402 () Unit!18792)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37044 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11863) Unit!18792)

(assert (=> b!597662 (= lt!271402 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11860))))

(assert (=> b!597662 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271403 () Unit!18792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37044 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18792)

(assert (=> b!597662 (= lt!271403 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271400 (select (arr!17783 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597663 () Bool)

(declare-fun e!341557 () Bool)

(assert (=> b!597663 (= e!341557 e!341556)))

(declare-fun res!383092 () Bool)

(assert (=> b!597663 (=> res!383092 e!341556)))

(assert (=> b!597663 (= res!383092 (or (not (= (select (arr!17783 a!2986) j!136) lt!271409)) (not (= (select (arr!17783 a!2986) j!136) lt!271404)) (bvsge j!136 index!984)))))

(assert (=> b!597663 e!341553))

(declare-fun res!383102 () Bool)

(assert (=> b!597663 (=> (not res!383102) (not e!341553))))

(assert (=> b!597663 (= res!383102 (= lt!271404 (select (arr!17783 a!2986) j!136)))))

(assert (=> b!597663 (= lt!271404 (select (store (arr!17783 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!597664 () Bool)

(assert (=> b!597664 (= e!341547 e!341555)))

(declare-fun res!383089 () Bool)

(assert (=> b!597664 (=> (not res!383089) (not e!341555))))

(assert (=> b!597664 (= res!383089 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) j!136))))

(declare-fun b!597665 () Bool)

(declare-fun res!383101 () Bool)

(assert (=> b!597665 (=> (not res!383101) (not e!341551))))

(assert (=> b!597665 (= res!383101 (validKeyInArray!0 (select (arr!17783 a!2986) j!136)))))

(declare-fun b!597666 () Bool)

(declare-fun Unit!18795 () Unit!18792)

(assert (=> b!597666 (= e!341558 Unit!18795)))

(declare-fun b!597667 () Bool)

(assert (=> b!597667 (= e!341551 e!341548)))

(declare-fun res!383105 () Bool)

(assert (=> b!597667 (=> (not res!383105) (not e!341548))))

(declare-fun lt!271401 () SeekEntryResult!6220)

(assert (=> b!597667 (= res!383105 (or (= lt!271401 (MissingZero!6220 i!1108)) (= lt!271401 (MissingVacant!6220 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37044 (_ BitVec 32)) SeekEntryResult!6220)

(assert (=> b!597667 (= lt!271401 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!597668 () Bool)

(assert (=> b!597668 (= e!341546 (not e!341557))))

(declare-fun res!383104 () Bool)

(assert (=> b!597668 (=> res!383104 e!341557)))

(declare-fun lt!271407 () SeekEntryResult!6220)

(assert (=> b!597668 (= res!383104 (not (= lt!271407 (Found!6220 index!984))))))

(declare-fun lt!271411 () Unit!18792)

(assert (=> b!597668 (= lt!271411 e!341558)))

(declare-fun c!67647 () Bool)

(assert (=> b!597668 (= c!67647 (= lt!271407 Undefined!6220))))

(assert (=> b!597668 (= lt!271407 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271409 lt!271400 mask!3053))))

(declare-fun e!341550 () Bool)

(assert (=> b!597668 e!341550))

(declare-fun res!383108 () Bool)

(assert (=> b!597668 (=> (not res!383108) (not e!341550))))

(declare-fun lt!271406 () SeekEntryResult!6220)

(declare-fun lt!271408 () (_ BitVec 32))

(assert (=> b!597668 (= res!383108 (= lt!271406 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 lt!271409 lt!271400 mask!3053)))))

(assert (=> b!597668 (= lt!271406 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!597668 (= lt!271409 (select (store (arr!17783 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271410 () Unit!18792)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37044 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18792)

(assert (=> b!597668 (= lt!271410 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597668 (= lt!271408 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597669 () Bool)

(declare-fun res!383096 () Bool)

(assert (=> b!597669 (=> (not res!383096) (not e!341551))))

(assert (=> b!597669 (= res!383096 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!597670 () Bool)

(assert (=> b!597670 (= e!341550 (= lt!271405 lt!271406))))

(assert (= (and start!54714 res!383103) b!597652))

(assert (= (and b!597652 res!383094) b!597665))

(assert (= (and b!597665 res!383101) b!597660))

(assert (= (and b!597660 res!383100) b!597669))

(assert (= (and b!597669 res!383096) b!597667))

(assert (= (and b!597667 res!383105) b!597651))

(assert (= (and b!597651 res!383090) b!597657))

(assert (= (and b!597657 res!383099) b!597659))

(assert (= (and b!597659 res!383093) b!597655))

(assert (= (and b!597655 res!383097) b!597650))

(assert (= (and b!597650 res!383095) b!597668))

(assert (= (and b!597668 res!383108) b!597670))

(assert (= (and b!597668 c!67647) b!597653))

(assert (= (and b!597668 (not c!67647)) b!597666))

(assert (= (and b!597668 (not res!383104)) b!597663))

(assert (= (and b!597663 res!383102) b!597649))

(assert (= (and b!597649 (not res!383098)) b!597664))

(assert (= (and b!597664 res!383089) b!597656))

(assert (= (and b!597663 (not res!383092)) b!597662))

(assert (= (and b!597662 (not res!383106)) b!597661))

(assert (= (and b!597661 (not res!383107)) b!597658))

(assert (= (and b!597658 res!383091) b!597654))

(declare-fun m!574495 () Bool)

(assert (=> b!597665 m!574495))

(assert (=> b!597665 m!574495))

(declare-fun m!574497 () Bool)

(assert (=> b!597665 m!574497))

(assert (=> b!597663 m!574495))

(declare-fun m!574499 () Bool)

(assert (=> b!597663 m!574499))

(declare-fun m!574501 () Bool)

(assert (=> b!597663 m!574501))

(declare-fun m!574503 () Bool)

(assert (=> b!597667 m!574503))

(declare-fun m!574505 () Bool)

(assert (=> b!597658 m!574505))

(assert (=> b!597656 m!574495))

(assert (=> b!597656 m!574495))

(declare-fun m!574507 () Bool)

(assert (=> b!597656 m!574507))

(assert (=> b!597662 m!574495))

(declare-fun m!574509 () Bool)

(assert (=> b!597662 m!574509))

(declare-fun m!574511 () Bool)

(assert (=> b!597662 m!574511))

(assert (=> b!597662 m!574495))

(declare-fun m!574513 () Bool)

(assert (=> b!597662 m!574513))

(assert (=> b!597662 m!574495))

(declare-fun m!574515 () Bool)

(assert (=> b!597662 m!574515))

(assert (=> b!597649 m!574495))

(declare-fun m!574517 () Bool)

(assert (=> b!597657 m!574517))

(declare-fun m!574519 () Bool)

(assert (=> b!597669 m!574519))

(declare-fun m!574521 () Bool)

(assert (=> b!597659 m!574521))

(assert (=> b!597655 m!574499))

(declare-fun m!574523 () Bool)

(assert (=> b!597655 m!574523))

(declare-fun m!574525 () Bool)

(assert (=> b!597650 m!574525))

(assert (=> b!597650 m!574495))

(assert (=> b!597650 m!574495))

(declare-fun m!574527 () Bool)

(assert (=> b!597650 m!574527))

(declare-fun m!574529 () Bool)

(assert (=> b!597651 m!574529))

(declare-fun m!574531 () Bool)

(assert (=> b!597668 m!574531))

(declare-fun m!574533 () Bool)

(assert (=> b!597668 m!574533))

(declare-fun m!574535 () Bool)

(assert (=> b!597668 m!574535))

(assert (=> b!597668 m!574495))

(assert (=> b!597668 m!574495))

(declare-fun m!574537 () Bool)

(assert (=> b!597668 m!574537))

(assert (=> b!597668 m!574499))

(declare-fun m!574539 () Bool)

(assert (=> b!597668 m!574539))

(declare-fun m!574541 () Bool)

(assert (=> b!597668 m!574541))

(declare-fun m!574543 () Bool)

(assert (=> start!54714 m!574543))

(declare-fun m!574545 () Bool)

(assert (=> start!54714 m!574545))

(declare-fun m!574547 () Bool)

(assert (=> b!597661 m!574547))

(declare-fun m!574549 () Bool)

(assert (=> b!597660 m!574549))

(declare-fun m!574551 () Bool)

(assert (=> b!597654 m!574551))

(assert (=> b!597664 m!574495))

(assert (=> b!597664 m!574495))

(declare-fun m!574553 () Bool)

(assert (=> b!597664 m!574553))

(check-sat (not b!597667) (not b!597662) (not b!597657) (not b!597656) (not b!597660) (not b!597654) (not b!597651) (not b!597658) (not b!597668) (not b!597669) (not start!54714) (not b!597650) (not b!597664) (not b!597661) (not b!597665))
(check-sat)
(get-model)

(declare-fun d!86751 () Bool)

(assert (=> d!86751 (= (validKeyInArray!0 (select (arr!17783 a!2986) j!136)) (and (not (= (select (arr!17783 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17783 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597665 d!86751))

(declare-fun d!86753 () Bool)

(assert (=> d!86753 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54714 d!86753))

(declare-fun d!86755 () Bool)

(assert (=> d!86755 (= (array_inv!13666 a!2986) (bvsge (size!18148 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54714 d!86755))

(declare-fun d!86757 () Bool)

(declare-fun res!383233 () Bool)

(declare-fun e!341648 () Bool)

(assert (=> d!86757 (=> res!383233 e!341648)))

(assert (=> d!86757 (= res!383233 (= (select (arr!17783 lt!271400) j!136) (select (arr!17783 a!2986) j!136)))))

(assert (=> d!86757 (= (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) j!136) e!341648)))

(declare-fun b!597807 () Bool)

(declare-fun e!341649 () Bool)

(assert (=> b!597807 (= e!341648 e!341649)))

(declare-fun res!383234 () Bool)

(assert (=> b!597807 (=> (not res!383234) (not e!341649))))

(assert (=> b!597807 (= res!383234 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18148 lt!271400)))))

(declare-fun b!597808 () Bool)

(assert (=> b!597808 (= e!341649 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86757 (not res!383233)) b!597807))

(assert (= (and b!597807 res!383234) b!597808))

(declare-fun m!574675 () Bool)

(assert (=> d!86757 m!574675))

(assert (=> b!597808 m!574495))

(declare-fun m!574677 () Bool)

(assert (=> b!597808 m!574677))

(assert (=> b!597664 d!86757))

(declare-fun d!86759 () Bool)

(declare-fun lt!271486 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!233 (List!11863) (InoxSet (_ BitVec 64)))

(assert (=> d!86759 (= lt!271486 (select (content!233 Nil!11860) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341654 () Bool)

(assert (=> d!86759 (= lt!271486 e!341654)))

(declare-fun res!383240 () Bool)

(assert (=> d!86759 (=> (not res!383240) (not e!341654))))

(get-info :version)

(assert (=> d!86759 (= res!383240 ((_ is Cons!11859) Nil!11860))))

(assert (=> d!86759 (= (contains!2943 Nil!11860 #b1000000000000000000000000000000000000000000000000000000000000000) lt!271486)))

(declare-fun b!597813 () Bool)

(declare-fun e!341655 () Bool)

(assert (=> b!597813 (= e!341654 e!341655)))

(declare-fun res!383239 () Bool)

(assert (=> b!597813 (=> res!383239 e!341655)))

(assert (=> b!597813 (= res!383239 (= (h!12904 Nil!11860) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!597814 () Bool)

(assert (=> b!597814 (= e!341655 (contains!2943 (t!18082 Nil!11860) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86759 res!383240) b!597813))

(assert (= (and b!597813 (not res!383239)) b!597814))

(declare-fun m!574679 () Bool)

(assert (=> d!86759 m!574679))

(declare-fun m!574681 () Bool)

(assert (=> d!86759 m!574681))

(declare-fun m!574683 () Bool)

(assert (=> b!597814 m!574683))

(assert (=> b!597654 d!86759))

(declare-fun d!86761 () Bool)

(declare-fun res!383245 () Bool)

(declare-fun e!341660 () Bool)

(assert (=> d!86761 (=> res!383245 e!341660)))

(assert (=> d!86761 (= res!383245 ((_ is Nil!11860) Nil!11860))))

(assert (=> d!86761 (= (noDuplicate!278 Nil!11860) e!341660)))

(declare-fun b!597819 () Bool)

(declare-fun e!341661 () Bool)

(assert (=> b!597819 (= e!341660 e!341661)))

(declare-fun res!383246 () Bool)

(assert (=> b!597819 (=> (not res!383246) (not e!341661))))

(assert (=> b!597819 (= res!383246 (not (contains!2943 (t!18082 Nil!11860) (h!12904 Nil!11860))))))

(declare-fun b!597820 () Bool)

(assert (=> b!597820 (= e!341661 (noDuplicate!278 (t!18082 Nil!11860)))))

(assert (= (and d!86761 (not res!383245)) b!597819))

(assert (= (and b!597819 res!383246) b!597820))

(declare-fun m!574685 () Bool)

(assert (=> b!597819 m!574685))

(declare-fun m!574687 () Bool)

(assert (=> b!597820 m!574687))

(assert (=> b!597661 d!86761))

(declare-fun b!597831 () Bool)

(declare-fun e!341671 () Bool)

(assert (=> b!597831 (= e!341671 (contains!2943 Nil!11860 (select (arr!17783 lt!271400) #b00000000000000000000000000000000)))))

(declare-fun b!597832 () Bool)

(declare-fun e!341672 () Bool)

(declare-fun e!341670 () Bool)

(assert (=> b!597832 (= e!341672 e!341670)))

(declare-fun res!383253 () Bool)

(assert (=> b!597832 (=> (not res!383253) (not e!341670))))

(assert (=> b!597832 (= res!383253 (not e!341671))))

(declare-fun res!383255 () Bool)

(assert (=> b!597832 (=> (not res!383255) (not e!341671))))

(assert (=> b!597832 (= res!383255 (validKeyInArray!0 (select (arr!17783 lt!271400) #b00000000000000000000000000000000)))))

(declare-fun d!86763 () Bool)

(declare-fun res!383254 () Bool)

(assert (=> d!86763 (=> res!383254 e!341672)))

(assert (=> d!86763 (= res!383254 (bvsge #b00000000000000000000000000000000 (size!18148 lt!271400)))))

(assert (=> d!86763 (= (arrayNoDuplicates!0 lt!271400 #b00000000000000000000000000000000 Nil!11860) e!341672)))

(declare-fun b!597833 () Bool)

(declare-fun e!341673 () Bool)

(declare-fun call!32923 () Bool)

(assert (=> b!597833 (= e!341673 call!32923)))

(declare-fun bm!32920 () Bool)

(declare-fun c!67656 () Bool)

(assert (=> bm!32920 (= call!32923 (arrayNoDuplicates!0 lt!271400 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67656 (Cons!11859 (select (arr!17783 lt!271400) #b00000000000000000000000000000000) Nil!11860) Nil!11860)))))

(declare-fun b!597834 () Bool)

(assert (=> b!597834 (= e!341670 e!341673)))

(assert (=> b!597834 (= c!67656 (validKeyInArray!0 (select (arr!17783 lt!271400) #b00000000000000000000000000000000)))))

(declare-fun b!597835 () Bool)

(assert (=> b!597835 (= e!341673 call!32923)))

(assert (= (and d!86763 (not res!383254)) b!597832))

(assert (= (and b!597832 res!383255) b!597831))

(assert (= (and b!597832 res!383253) b!597834))

(assert (= (and b!597834 c!67656) b!597835))

(assert (= (and b!597834 (not c!67656)) b!597833))

(assert (= (or b!597835 b!597833) bm!32920))

(declare-fun m!574689 () Bool)

(assert (=> b!597831 m!574689))

(assert (=> b!597831 m!574689))

(declare-fun m!574691 () Bool)

(assert (=> b!597831 m!574691))

(assert (=> b!597832 m!574689))

(assert (=> b!597832 m!574689))

(declare-fun m!574693 () Bool)

(assert (=> b!597832 m!574693))

(assert (=> bm!32920 m!574689))

(declare-fun m!574695 () Bool)

(assert (=> bm!32920 m!574695))

(assert (=> b!597834 m!574689))

(assert (=> b!597834 m!574689))

(assert (=> b!597834 m!574693))

(assert (=> b!597662 d!86763))

(declare-fun d!86765 () Bool)

(declare-fun e!341676 () Bool)

(assert (=> d!86765 e!341676))

(declare-fun res!383258 () Bool)

(assert (=> d!86765 (=> (not res!383258) (not e!341676))))

(assert (=> d!86765 (= res!383258 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986))))))

(declare-fun lt!271489 () Unit!18792)

(declare-fun choose!41 (array!37044 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11863) Unit!18792)

(assert (=> d!86765 (= lt!271489 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11860))))

(assert (=> d!86765 (bvslt (size!18148 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86765 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11860) lt!271489)))

(declare-fun b!597838 () Bool)

(assert (=> b!597838 (= e!341676 (arrayNoDuplicates!0 (array!37045 (store (arr!17783 a!2986) i!1108 k0!1786) (size!18148 a!2986)) #b00000000000000000000000000000000 Nil!11860))))

(assert (= (and d!86765 res!383258) b!597838))

(declare-fun m!574697 () Bool)

(assert (=> d!86765 m!574697))

(assert (=> b!597838 m!574499))

(declare-fun m!574699 () Bool)

(assert (=> b!597838 m!574699))

(assert (=> b!597662 d!86765))

(declare-fun d!86767 () Bool)

(declare-fun res!383259 () Bool)

(declare-fun e!341677 () Bool)

(assert (=> d!86767 (=> res!383259 e!341677)))

(assert (=> d!86767 (= res!383259 (= (select (arr!17783 lt!271400) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17783 a!2986) j!136)))))

(assert (=> d!86767 (= (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341677)))

(declare-fun b!597839 () Bool)

(declare-fun e!341678 () Bool)

(assert (=> b!597839 (= e!341677 e!341678)))

(declare-fun res!383260 () Bool)

(assert (=> b!597839 (=> (not res!383260) (not e!341678))))

(assert (=> b!597839 (= res!383260 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18148 lt!271400)))))

(declare-fun b!597840 () Bool)

(assert (=> b!597840 (= e!341678 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86767 (not res!383259)) b!597839))

(assert (= (and b!597839 res!383260) b!597840))

(declare-fun m!574701 () Bool)

(assert (=> d!86767 m!574701))

(assert (=> b!597840 m!574495))

(declare-fun m!574703 () Bool)

(assert (=> b!597840 m!574703))

(assert (=> b!597662 d!86767))

(declare-fun d!86769 () Bool)

(assert (=> d!86769 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271492 () Unit!18792)

(declare-fun choose!114 (array!37044 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18792)

(assert (=> d!86769 (= lt!271492 (choose!114 lt!271400 (select (arr!17783 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86769 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86769 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271400 (select (arr!17783 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271492)))

(declare-fun bs!18352 () Bool)

(assert (= bs!18352 d!86769))

(assert (=> bs!18352 m!574495))

(assert (=> bs!18352 m!574515))

(assert (=> bs!18352 m!574495))

(declare-fun m!574705 () Bool)

(assert (=> bs!18352 m!574705))

(assert (=> b!597662 d!86769))

(declare-fun bm!32923 () Bool)

(declare-fun call!32926 () Bool)

(assert (=> bm!32923 (= call!32926 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!86773 () Bool)

(declare-fun res!383278 () Bool)

(declare-fun e!341698 () Bool)

(assert (=> d!86773 (=> res!383278 e!341698)))

(assert (=> d!86773 (= res!383278 (bvsge #b00000000000000000000000000000000 (size!18148 a!2986)))))

(assert (=> d!86773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341698)))

(declare-fun b!597861 () Bool)

(declare-fun e!341699 () Bool)

(assert (=> b!597861 (= e!341698 e!341699)))

(declare-fun c!67659 () Bool)

(assert (=> b!597861 (= c!67659 (validKeyInArray!0 (select (arr!17783 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597862 () Bool)

(declare-fun e!341697 () Bool)

(assert (=> b!597862 (= e!341697 call!32926)))

(declare-fun b!597863 () Bool)

(assert (=> b!597863 (= e!341699 call!32926)))

(declare-fun b!597864 () Bool)

(assert (=> b!597864 (= e!341699 e!341697)))

(declare-fun lt!271502 () (_ BitVec 64))

(assert (=> b!597864 (= lt!271502 (select (arr!17783 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271504 () Unit!18792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37044 (_ BitVec 64) (_ BitVec 32)) Unit!18792)

(assert (=> b!597864 (= lt!271504 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271502 #b00000000000000000000000000000000))))

(assert (=> b!597864 (arrayContainsKey!0 a!2986 lt!271502 #b00000000000000000000000000000000)))

(declare-fun lt!271503 () Unit!18792)

(assert (=> b!597864 (= lt!271503 lt!271504)))

(declare-fun res!383277 () Bool)

(assert (=> b!597864 (= res!383277 (= (seekEntryOrOpen!0 (select (arr!17783 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6220 #b00000000000000000000000000000000)))))

(assert (=> b!597864 (=> (not res!383277) (not e!341697))))

(assert (= (and d!86773 (not res!383278)) b!597861))

(assert (= (and b!597861 c!67659) b!597864))

(assert (= (and b!597861 (not c!67659)) b!597863))

(assert (= (and b!597864 res!383277) b!597862))

(assert (= (or b!597862 b!597863) bm!32923))

(declare-fun m!574717 () Bool)

(assert (=> bm!32923 m!574717))

(declare-fun m!574719 () Bool)

(assert (=> b!597861 m!574719))

(assert (=> b!597861 m!574719))

(declare-fun m!574721 () Bool)

(assert (=> b!597861 m!574721))

(assert (=> b!597864 m!574719))

(declare-fun m!574723 () Bool)

(assert (=> b!597864 m!574723))

(declare-fun m!574725 () Bool)

(assert (=> b!597864 m!574725))

(assert (=> b!597864 m!574719))

(declare-fun m!574727 () Bool)

(assert (=> b!597864 m!574727))

(assert (=> b!597651 d!86773))

(declare-fun d!86783 () Bool)

(assert (=> d!86783 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597660 d!86783))

(declare-fun b!597916 () Bool)

(declare-fun c!67674 () Bool)

(declare-fun lt!271524 () (_ BitVec 64))

(assert (=> b!597916 (= c!67674 (= lt!271524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341742 () SeekEntryResult!6220)

(declare-fun e!341743 () SeekEntryResult!6220)

(assert (=> b!597916 (= e!341742 e!341743)))

(declare-fun b!597917 () Bool)

(declare-fun e!341741 () SeekEntryResult!6220)

(assert (=> b!597917 (= e!341741 e!341742)))

(declare-fun c!67672 () Bool)

(assert (=> b!597917 (= c!67672 (= lt!271524 (select (arr!17783 a!2986) j!136)))))

(declare-fun b!597918 () Bool)

(assert (=> b!597918 (= e!341743 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun lt!271523 () SeekEntryResult!6220)

(declare-fun d!86785 () Bool)

(assert (=> d!86785 (and (or ((_ is Undefined!6220) lt!271523) (not ((_ is Found!6220) lt!271523)) (and (bvsge (index!27135 lt!271523) #b00000000000000000000000000000000) (bvslt (index!27135 lt!271523) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271523) ((_ is Found!6220) lt!271523) (not ((_ is MissingVacant!6220) lt!271523)) (not (= (index!27137 lt!271523) vacantSpotIndex!68)) (and (bvsge (index!27137 lt!271523) #b00000000000000000000000000000000) (bvslt (index!27137 lt!271523) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271523) (ite ((_ is Found!6220) lt!271523) (= (select (arr!17783 a!2986) (index!27135 lt!271523)) (select (arr!17783 a!2986) j!136)) (and ((_ is MissingVacant!6220) lt!271523) (= (index!27137 lt!271523) vacantSpotIndex!68) (= (select (arr!17783 a!2986) (index!27137 lt!271523)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86785 (= lt!271523 e!341741)))

(declare-fun c!67673 () Bool)

(assert (=> d!86785 (= c!67673 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86785 (= lt!271524 (select (arr!17783 a!2986) index!984))))

(assert (=> d!86785 (validMask!0 mask!3053)))

(assert (=> d!86785 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053) lt!271523)))

(declare-fun b!597919 () Bool)

(assert (=> b!597919 (= e!341742 (Found!6220 index!984))))

(declare-fun b!597920 () Bool)

(assert (=> b!597920 (= e!341743 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597921 () Bool)

(assert (=> b!597921 (= e!341741 Undefined!6220)))

(assert (= (and d!86785 c!67673) b!597921))

(assert (= (and d!86785 (not c!67673)) b!597917))

(assert (= (and b!597917 c!67672) b!597919))

(assert (= (and b!597917 (not c!67672)) b!597916))

(assert (= (and b!597916 c!67674) b!597918))

(assert (= (and b!597916 (not c!67674)) b!597920))

(declare-fun m!574759 () Bool)

(assert (=> d!86785 m!574759))

(declare-fun m!574761 () Bool)

(assert (=> d!86785 m!574761))

(assert (=> d!86785 m!574525))

(assert (=> d!86785 m!574543))

(assert (=> b!597920 m!574531))

(assert (=> b!597920 m!574531))

(assert (=> b!597920 m!574495))

(declare-fun m!574763 () Bool)

(assert (=> b!597920 m!574763))

(assert (=> b!597650 d!86785))

(declare-fun d!86799 () Bool)

(declare-fun res!383308 () Bool)

(declare-fun e!341744 () Bool)

(assert (=> d!86799 (=> res!383308 e!341744)))

(assert (=> d!86799 (= res!383308 (= (select (arr!17783 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86799 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341744)))

(declare-fun b!597924 () Bool)

(declare-fun e!341745 () Bool)

(assert (=> b!597924 (= e!341744 e!341745)))

(declare-fun res!383309 () Bool)

(assert (=> b!597924 (=> (not res!383309) (not e!341745))))

(assert (=> b!597924 (= res!383309 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18148 a!2986)))))

(declare-fun b!597925 () Bool)

(assert (=> b!597925 (= e!341745 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86799 (not res!383308)) b!597924))

(assert (= (and b!597924 res!383309) b!597925))

(assert (=> d!86799 m!574719))

(declare-fun m!574767 () Bool)

(assert (=> b!597925 m!574767))

(assert (=> b!597669 d!86799))

(declare-fun b!597927 () Bool)

(declare-fun c!67677 () Bool)

(declare-fun lt!271527 () (_ BitVec 64))

(assert (=> b!597927 (= c!67677 (= lt!271527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341748 () SeekEntryResult!6220)

(declare-fun e!341749 () SeekEntryResult!6220)

(assert (=> b!597927 (= e!341748 e!341749)))

(declare-fun b!597928 () Bool)

(declare-fun e!341747 () SeekEntryResult!6220)

(assert (=> b!597928 (= e!341747 e!341748)))

(declare-fun c!67675 () Bool)

(assert (=> b!597928 (= c!67675 (= lt!271527 lt!271409))))

(declare-fun b!597929 () Bool)

(assert (=> b!597929 (= e!341749 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun d!86801 () Bool)

(declare-fun lt!271526 () SeekEntryResult!6220)

(assert (=> d!86801 (and (or ((_ is Undefined!6220) lt!271526) (not ((_ is Found!6220) lt!271526)) (and (bvsge (index!27135 lt!271526) #b00000000000000000000000000000000) (bvslt (index!27135 lt!271526) (size!18148 lt!271400)))) (or ((_ is Undefined!6220) lt!271526) ((_ is Found!6220) lt!271526) (not ((_ is MissingVacant!6220) lt!271526)) (not (= (index!27137 lt!271526) vacantSpotIndex!68)) (and (bvsge (index!27137 lt!271526) #b00000000000000000000000000000000) (bvslt (index!27137 lt!271526) (size!18148 lt!271400)))) (or ((_ is Undefined!6220) lt!271526) (ite ((_ is Found!6220) lt!271526) (= (select (arr!17783 lt!271400) (index!27135 lt!271526)) lt!271409) (and ((_ is MissingVacant!6220) lt!271526) (= (index!27137 lt!271526) vacantSpotIndex!68) (= (select (arr!17783 lt!271400) (index!27137 lt!271526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86801 (= lt!271526 e!341747)))

(declare-fun c!67676 () Bool)

(assert (=> d!86801 (= c!67676 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86801 (= lt!271527 (select (arr!17783 lt!271400) lt!271408))))

(assert (=> d!86801 (validMask!0 mask!3053)))

(assert (=> d!86801 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 lt!271409 lt!271400 mask!3053) lt!271526)))

(declare-fun b!597930 () Bool)

(assert (=> b!597930 (= e!341748 (Found!6220 lt!271408))))

(declare-fun b!597931 () Bool)

(assert (=> b!597931 (= e!341749 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271408 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271409 lt!271400 mask!3053))))

(declare-fun b!597932 () Bool)

(assert (=> b!597932 (= e!341747 Undefined!6220)))

(assert (= (and d!86801 c!67676) b!597932))

(assert (= (and d!86801 (not c!67676)) b!597928))

(assert (= (and b!597928 c!67675) b!597930))

(assert (= (and b!597928 (not c!67675)) b!597927))

(assert (= (and b!597927 c!67677) b!597929))

(assert (= (and b!597927 (not c!67677)) b!597931))

(declare-fun m!574775 () Bool)

(assert (=> d!86801 m!574775))

(declare-fun m!574777 () Bool)

(assert (=> d!86801 m!574777))

(declare-fun m!574779 () Bool)

(assert (=> d!86801 m!574779))

(assert (=> d!86801 m!574543))

(declare-fun m!574781 () Bool)

(assert (=> b!597931 m!574781))

(assert (=> b!597931 m!574781))

(declare-fun m!574783 () Bool)

(assert (=> b!597931 m!574783))

(assert (=> b!597668 d!86801))

(declare-fun b!597935 () Bool)

(declare-fun c!67680 () Bool)

(declare-fun lt!271529 () (_ BitVec 64))

(assert (=> b!597935 (= c!67680 (= lt!271529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341753 () SeekEntryResult!6220)

(declare-fun e!341754 () SeekEntryResult!6220)

(assert (=> b!597935 (= e!341753 e!341754)))

(declare-fun b!597936 () Bool)

(declare-fun e!341752 () SeekEntryResult!6220)

(assert (=> b!597936 (= e!341752 e!341753)))

(declare-fun c!67678 () Bool)

(assert (=> b!597936 (= c!67678 (= lt!271529 (select (arr!17783 a!2986) j!136)))))

(declare-fun b!597937 () Bool)

(assert (=> b!597937 (= e!341754 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun lt!271528 () SeekEntryResult!6220)

(declare-fun d!86807 () Bool)

(assert (=> d!86807 (and (or ((_ is Undefined!6220) lt!271528) (not ((_ is Found!6220) lt!271528)) (and (bvsge (index!27135 lt!271528) #b00000000000000000000000000000000) (bvslt (index!27135 lt!271528) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271528) ((_ is Found!6220) lt!271528) (not ((_ is MissingVacant!6220) lt!271528)) (not (= (index!27137 lt!271528) vacantSpotIndex!68)) (and (bvsge (index!27137 lt!271528) #b00000000000000000000000000000000) (bvslt (index!27137 lt!271528) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271528) (ite ((_ is Found!6220) lt!271528) (= (select (arr!17783 a!2986) (index!27135 lt!271528)) (select (arr!17783 a!2986) j!136)) (and ((_ is MissingVacant!6220) lt!271528) (= (index!27137 lt!271528) vacantSpotIndex!68) (= (select (arr!17783 a!2986) (index!27137 lt!271528)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86807 (= lt!271528 e!341752)))

(declare-fun c!67679 () Bool)

(assert (=> d!86807 (= c!67679 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86807 (= lt!271529 (select (arr!17783 a!2986) lt!271408))))

(assert (=> d!86807 (validMask!0 mask!3053)))

(assert (=> d!86807 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053) lt!271528)))

(declare-fun b!597938 () Bool)

(assert (=> b!597938 (= e!341753 (Found!6220 lt!271408))))

(declare-fun b!597939 () Bool)

(assert (=> b!597939 (= e!341754 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271408 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597940 () Bool)

(assert (=> b!597940 (= e!341752 Undefined!6220)))

(assert (= (and d!86807 c!67679) b!597940))

(assert (= (and d!86807 (not c!67679)) b!597936))

(assert (= (and b!597936 c!67678) b!597938))

(assert (= (and b!597936 (not c!67678)) b!597935))

(assert (= (and b!597935 c!67680) b!597937))

(assert (= (and b!597935 (not c!67680)) b!597939))

(declare-fun m!574785 () Bool)

(assert (=> d!86807 m!574785))

(declare-fun m!574787 () Bool)

(assert (=> d!86807 m!574787))

(declare-fun m!574789 () Bool)

(assert (=> d!86807 m!574789))

(assert (=> d!86807 m!574543))

(assert (=> b!597939 m!574781))

(assert (=> b!597939 m!574781))

(assert (=> b!597939 m!574495))

(declare-fun m!574791 () Bool)

(assert (=> b!597939 m!574791))

(assert (=> b!597668 d!86807))

(declare-fun d!86809 () Bool)

(declare-fun lt!271535 () (_ BitVec 32))

(assert (=> d!86809 (and (bvsge lt!271535 #b00000000000000000000000000000000) (bvslt lt!271535 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86809 (= lt!271535 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86809 (validMask!0 mask!3053)))

(assert (=> d!86809 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271535)))

(declare-fun bs!18354 () Bool)

(assert (= bs!18354 d!86809))

(declare-fun m!574795 () Bool)

(assert (=> bs!18354 m!574795))

(assert (=> bs!18354 m!574543))

(assert (=> b!597668 d!86809))

(declare-fun b!597941 () Bool)

(declare-fun c!67683 () Bool)

(declare-fun lt!271537 () (_ BitVec 64))

(assert (=> b!597941 (= c!67683 (= lt!271537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341756 () SeekEntryResult!6220)

(declare-fun e!341757 () SeekEntryResult!6220)

(assert (=> b!597941 (= e!341756 e!341757)))

(declare-fun b!597942 () Bool)

(declare-fun e!341755 () SeekEntryResult!6220)

(assert (=> b!597942 (= e!341755 e!341756)))

(declare-fun c!67681 () Bool)

(assert (=> b!597942 (= c!67681 (= lt!271537 lt!271409))))

(declare-fun b!597943 () Bool)

(assert (=> b!597943 (= e!341757 (MissingVacant!6220 vacantSpotIndex!68))))

(declare-fun lt!271536 () SeekEntryResult!6220)

(declare-fun d!86813 () Bool)

(assert (=> d!86813 (and (or ((_ is Undefined!6220) lt!271536) (not ((_ is Found!6220) lt!271536)) (and (bvsge (index!27135 lt!271536) #b00000000000000000000000000000000) (bvslt (index!27135 lt!271536) (size!18148 lt!271400)))) (or ((_ is Undefined!6220) lt!271536) ((_ is Found!6220) lt!271536) (not ((_ is MissingVacant!6220) lt!271536)) (not (= (index!27137 lt!271536) vacantSpotIndex!68)) (and (bvsge (index!27137 lt!271536) #b00000000000000000000000000000000) (bvslt (index!27137 lt!271536) (size!18148 lt!271400)))) (or ((_ is Undefined!6220) lt!271536) (ite ((_ is Found!6220) lt!271536) (= (select (arr!17783 lt!271400) (index!27135 lt!271536)) lt!271409) (and ((_ is MissingVacant!6220) lt!271536) (= (index!27137 lt!271536) vacantSpotIndex!68) (= (select (arr!17783 lt!271400) (index!27137 lt!271536)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86813 (= lt!271536 e!341755)))

(declare-fun c!67682 () Bool)

(assert (=> d!86813 (= c!67682 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86813 (= lt!271537 (select (arr!17783 lt!271400) index!984))))

(assert (=> d!86813 (validMask!0 mask!3053)))

(assert (=> d!86813 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271409 lt!271400 mask!3053) lt!271536)))

(declare-fun b!597944 () Bool)

(assert (=> b!597944 (= e!341756 (Found!6220 index!984))))

(declare-fun b!597945 () Bool)

(assert (=> b!597945 (= e!341757 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271409 lt!271400 mask!3053))))

(declare-fun b!597946 () Bool)

(assert (=> b!597946 (= e!341755 Undefined!6220)))

(assert (= (and d!86813 c!67682) b!597946))

(assert (= (and d!86813 (not c!67682)) b!597942))

(assert (= (and b!597942 c!67681) b!597944))

(assert (= (and b!597942 (not c!67681)) b!597941))

(assert (= (and b!597941 c!67683) b!597943))

(assert (= (and b!597941 (not c!67683)) b!597945))

(declare-fun m!574797 () Bool)

(assert (=> d!86813 m!574797))

(declare-fun m!574799 () Bool)

(assert (=> d!86813 m!574799))

(declare-fun m!574801 () Bool)

(assert (=> d!86813 m!574801))

(assert (=> d!86813 m!574543))

(assert (=> b!597945 m!574531))

(assert (=> b!597945 m!574531))

(declare-fun m!574803 () Bool)

(assert (=> b!597945 m!574803))

(assert (=> b!597668 d!86813))

(declare-fun d!86815 () Bool)

(declare-fun e!341783 () Bool)

(assert (=> d!86815 e!341783))

(declare-fun res!383326 () Bool)

(assert (=> d!86815 (=> (not res!383326) (not e!341783))))

(assert (=> d!86815 (= res!383326 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18148 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18148 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18148 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986))))))

(declare-fun lt!271549 () Unit!18792)

(declare-fun choose!9 (array!37044 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18792)

(assert (=> d!86815 (= lt!271549 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86815 (validMask!0 mask!3053)))

(assert (=> d!86815 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 mask!3053) lt!271549)))

(declare-fun b!597984 () Bool)

(assert (=> b!597984 (= e!341783 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 (select (arr!17783 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271408 vacantSpotIndex!68 (select (store (arr!17783 a!2986) i!1108 k0!1786) j!136) (array!37045 (store (arr!17783 a!2986) i!1108 k0!1786) (size!18148 a!2986)) mask!3053)))))

(assert (= (and d!86815 res!383326) b!597984))

(declare-fun m!574829 () Bool)

(assert (=> d!86815 m!574829))

(assert (=> d!86815 m!574543))

(assert (=> b!597984 m!574499))

(assert (=> b!597984 m!574533))

(declare-fun m!574831 () Bool)

(assert (=> b!597984 m!574831))

(assert (=> b!597984 m!574495))

(assert (=> b!597984 m!574533))

(assert (=> b!597984 m!574495))

(assert (=> b!597984 m!574537))

(assert (=> b!597668 d!86815))

(declare-fun b!597985 () Bool)

(declare-fun e!341785 () Bool)

(assert (=> b!597985 (= e!341785 (contains!2943 Nil!11860 (select (arr!17783 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597986 () Bool)

(declare-fun e!341786 () Bool)

(declare-fun e!341784 () Bool)

(assert (=> b!597986 (= e!341786 e!341784)))

(declare-fun res!383327 () Bool)

(assert (=> b!597986 (=> (not res!383327) (not e!341784))))

(assert (=> b!597986 (= res!383327 (not e!341785))))

(declare-fun res!383329 () Bool)

(assert (=> b!597986 (=> (not res!383329) (not e!341785))))

(assert (=> b!597986 (= res!383329 (validKeyInArray!0 (select (arr!17783 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86827 () Bool)

(declare-fun res!383328 () Bool)

(assert (=> d!86827 (=> res!383328 e!341786)))

(assert (=> d!86827 (= res!383328 (bvsge #b00000000000000000000000000000000 (size!18148 a!2986)))))

(assert (=> d!86827 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11860) e!341786)))

(declare-fun b!597987 () Bool)

(declare-fun e!341787 () Bool)

(declare-fun call!32936 () Bool)

(assert (=> b!597987 (= e!341787 call!32936)))

(declare-fun bm!32933 () Bool)

(declare-fun c!67696 () Bool)

(assert (=> bm!32933 (= call!32936 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67696 (Cons!11859 (select (arr!17783 a!2986) #b00000000000000000000000000000000) Nil!11860) Nil!11860)))))

(declare-fun b!597988 () Bool)

(assert (=> b!597988 (= e!341784 e!341787)))

(assert (=> b!597988 (= c!67696 (validKeyInArray!0 (select (arr!17783 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!597989 () Bool)

(assert (=> b!597989 (= e!341787 call!32936)))

(assert (= (and d!86827 (not res!383328)) b!597986))

(assert (= (and b!597986 res!383329) b!597985))

(assert (= (and b!597986 res!383327) b!597988))

(assert (= (and b!597988 c!67696) b!597989))

(assert (= (and b!597988 (not c!67696)) b!597987))

(assert (= (or b!597989 b!597987) bm!32933))

(assert (=> b!597985 m!574719))

(assert (=> b!597985 m!574719))

(declare-fun m!574833 () Bool)

(assert (=> b!597985 m!574833))

(assert (=> b!597986 m!574719))

(assert (=> b!597986 m!574719))

(assert (=> b!597986 m!574721))

(assert (=> bm!32933 m!574719))

(declare-fun m!574835 () Bool)

(assert (=> bm!32933 m!574835))

(assert (=> b!597988 m!574719))

(assert (=> b!597988 m!574719))

(assert (=> b!597988 m!574721))

(assert (=> b!597657 d!86827))

(declare-fun d!86829 () Bool)

(declare-fun lt!271554 () Bool)

(assert (=> d!86829 (= lt!271554 (select (content!233 Nil!11860) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341794 () Bool)

(assert (=> d!86829 (= lt!271554 e!341794)))

(declare-fun res!383331 () Bool)

(assert (=> d!86829 (=> (not res!383331) (not e!341794))))

(assert (=> d!86829 (= res!383331 ((_ is Cons!11859) Nil!11860))))

(assert (=> d!86829 (= (contains!2943 Nil!11860 #b0000000000000000000000000000000000000000000000000000000000000000) lt!271554)))

(declare-fun b!598002 () Bool)

(declare-fun e!341795 () Bool)

(assert (=> b!598002 (= e!341794 e!341795)))

(declare-fun res!383330 () Bool)

(assert (=> b!598002 (=> res!383330 e!341795)))

(assert (=> b!598002 (= res!383330 (= (h!12904 Nil!11860) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!598003 () Bool)

(assert (=> b!598003 (= e!341795 (contains!2943 (t!18082 Nil!11860) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!86829 res!383331) b!598002))

(assert (= (and b!598002 (not res!383330)) b!598003))

(assert (=> d!86829 m!574679))

(declare-fun m!574837 () Bool)

(assert (=> d!86829 m!574837))

(declare-fun m!574839 () Bool)

(assert (=> b!598003 m!574839))

(assert (=> b!597658 d!86829))

(declare-fun d!86831 () Bool)

(declare-fun res!383332 () Bool)

(declare-fun e!341796 () Bool)

(assert (=> d!86831 (=> res!383332 e!341796)))

(assert (=> d!86831 (= res!383332 (= (select (arr!17783 lt!271400) index!984) (select (arr!17783 a!2986) j!136)))))

(assert (=> d!86831 (= (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) index!984) e!341796)))

(declare-fun b!598004 () Bool)

(declare-fun e!341797 () Bool)

(assert (=> b!598004 (= e!341796 e!341797)))

(declare-fun res!383333 () Bool)

(assert (=> b!598004 (=> (not res!383333) (not e!341797))))

(assert (=> b!598004 (= res!383333 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18148 lt!271400)))))

(declare-fun b!598005 () Bool)

(assert (=> b!598005 (= e!341797 (arrayContainsKey!0 lt!271400 (select (arr!17783 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!86831 (not res!383332)) b!598004))

(assert (= (and b!598004 res!383333) b!598005))

(assert (=> d!86831 m!574801))

(assert (=> b!598005 m!574495))

(declare-fun m!574841 () Bool)

(assert (=> b!598005 m!574841))

(assert (=> b!597656 d!86831))

(declare-fun b!598106 () Bool)

(declare-fun e!341865 () SeekEntryResult!6220)

(declare-fun lt!271594 () SeekEntryResult!6220)

(assert (=> b!598106 (= e!341865 (Found!6220 (index!27136 lt!271594)))))

(declare-fun e!341864 () SeekEntryResult!6220)

(declare-fun b!598107 () Bool)

(assert (=> b!598107 (= e!341864 (seekKeyOrZeroReturnVacant!0 (x!55949 lt!271594) (index!27136 lt!271594) (index!27136 lt!271594) k0!1786 a!2986 mask!3053))))

(declare-fun b!598108 () Bool)

(declare-fun e!341863 () SeekEntryResult!6220)

(assert (=> b!598108 (= e!341863 e!341865)))

(declare-fun lt!271595 () (_ BitVec 64))

(assert (=> b!598108 (= lt!271595 (select (arr!17783 a!2986) (index!27136 lt!271594)))))

(declare-fun c!67740 () Bool)

(assert (=> b!598108 (= c!67740 (= lt!271595 k0!1786))))

(declare-fun d!86833 () Bool)

(declare-fun lt!271593 () SeekEntryResult!6220)

(assert (=> d!86833 (and (or ((_ is Undefined!6220) lt!271593) (not ((_ is Found!6220) lt!271593)) (and (bvsge (index!27135 lt!271593) #b00000000000000000000000000000000) (bvslt (index!27135 lt!271593) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271593) ((_ is Found!6220) lt!271593) (not ((_ is MissingZero!6220) lt!271593)) (and (bvsge (index!27134 lt!271593) #b00000000000000000000000000000000) (bvslt (index!27134 lt!271593) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271593) ((_ is Found!6220) lt!271593) ((_ is MissingZero!6220) lt!271593) (not ((_ is MissingVacant!6220) lt!271593)) (and (bvsge (index!27137 lt!271593) #b00000000000000000000000000000000) (bvslt (index!27137 lt!271593) (size!18148 a!2986)))) (or ((_ is Undefined!6220) lt!271593) (ite ((_ is Found!6220) lt!271593) (= (select (arr!17783 a!2986) (index!27135 lt!271593)) k0!1786) (ite ((_ is MissingZero!6220) lt!271593) (= (select (arr!17783 a!2986) (index!27134 lt!271593)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6220) lt!271593) (= (select (arr!17783 a!2986) (index!27137 lt!271593)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86833 (= lt!271593 e!341863)))

(declare-fun c!67739 () Bool)

(assert (=> d!86833 (= c!67739 (and ((_ is Intermediate!6220) lt!271594) (undefined!7032 lt!271594)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37044 (_ BitVec 32)) SeekEntryResult!6220)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86833 (= lt!271594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86833 (validMask!0 mask!3053)))

(assert (=> d!86833 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271593)))

(declare-fun b!598109 () Bool)

(declare-fun c!67738 () Bool)

(assert (=> b!598109 (= c!67738 (= lt!271595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598109 (= e!341865 e!341864)))

(declare-fun b!598110 () Bool)

(assert (=> b!598110 (= e!341863 Undefined!6220)))

(declare-fun b!598111 () Bool)

(assert (=> b!598111 (= e!341864 (MissingZero!6220 (index!27136 lt!271594)))))

(assert (= (and d!86833 c!67739) b!598110))

(assert (= (and d!86833 (not c!67739)) b!598108))

(assert (= (and b!598108 c!67740) b!598106))

(assert (= (and b!598108 (not c!67740)) b!598109))

(assert (= (and b!598109 c!67738) b!598111))

(assert (= (and b!598109 (not c!67738)) b!598107))

(declare-fun m!574941 () Bool)

(assert (=> b!598107 m!574941))

(declare-fun m!574943 () Bool)

(assert (=> b!598108 m!574943))

(declare-fun m!574945 () Bool)

(assert (=> d!86833 m!574945))

(declare-fun m!574947 () Bool)

(assert (=> d!86833 m!574947))

(assert (=> d!86833 m!574543))

(declare-fun m!574949 () Bool)

(assert (=> d!86833 m!574949))

(declare-fun m!574951 () Bool)

(assert (=> d!86833 m!574951))

(assert (=> d!86833 m!574949))

(declare-fun m!574953 () Bool)

(assert (=> d!86833 m!574953))

(assert (=> b!597667 d!86833))

(check-sat (not b!597931) (not b!597831) (not b!597864) (not b!597925) (not b!597861) (not d!86807) (not d!86813) (not b!597814) (not bm!32920) (not b!597819) (not b!597984) (not b!597986) (not b!598003) (not b!598107) (not b!597808) (not d!86829) (not b!597939) (not b!598005) (not bm!32933) (not b!597920) (not b!597945) (not d!86769) (not d!86833) (not d!86809) (not b!597820) (not b!597988) (not d!86801) (not d!86815) (not d!86785) (not b!597985) (not d!86759) (not b!597832) (not b!597840) (not bm!32923) (not b!597838) (not b!597834) (not d!86765))
(check-sat)
