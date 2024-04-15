; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54852 () Bool)

(assert start!54852)

(declare-fun b!599650 () Bool)

(declare-fun res!384738 () Bool)

(declare-fun e!342825 () Bool)

(assert (=> b!599650 (=> (not res!384738) (not e!342825))))

(declare-datatypes ((array!37101 0))(
  ( (array!37102 (arr!17810 (Array (_ BitVec 32) (_ BitVec 64))) (size!18175 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37101)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37101 (_ BitVec 32)) Bool)

(assert (=> b!599650 (= res!384738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599651 () Bool)

(declare-fun res!384743 () Bool)

(declare-fun e!342818 () Bool)

(assert (=> b!599651 (=> (not res!384743) (not e!342818))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!599651 (= res!384743 (and (= (size!18175 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18175 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18175 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!599652 () Bool)

(declare-fun res!384735 () Bool)

(assert (=> b!599652 (=> (not res!384735) (not e!342818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599652 (= res!384735 (validKeyInArray!0 (select (arr!17810 a!2986) j!136)))))

(declare-fun b!599653 () Bool)

(declare-fun e!342823 () Bool)

(assert (=> b!599653 (= e!342823 true)))

(declare-fun lt!272575 () Bool)

(declare-datatypes ((List!11890 0))(
  ( (Nil!11887) (Cons!11886 (h!12931 (_ BitVec 64)) (t!18109 List!11890)) )
))
(declare-fun contains!2955 (List!11890 (_ BitVec 64)) Bool)

(assert (=> b!599653 (= lt!272575 (contains!2955 Nil!11887 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599654 () Bool)

(declare-fun e!342814 () Bool)

(declare-fun lt!272570 () array!37101)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599654 (= e!342814 (arrayContainsKey!0 lt!272570 (select (arr!17810 a!2986) j!136) index!984))))

(declare-fun b!599655 () Bool)

(declare-datatypes ((Unit!18900 0))(
  ( (Unit!18901) )
))
(declare-fun e!342815 () Unit!18900)

(declare-fun Unit!18902 () Unit!18900)

(assert (=> b!599655 (= e!342815 Unit!18902)))

(assert (=> b!599655 false))

(declare-fun b!599656 () Bool)

(declare-fun res!384741 () Bool)

(assert (=> b!599656 (=> (not res!384741) (not e!342825))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599656 (= res!384741 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17810 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599657 () Bool)

(declare-fun Unit!18903 () Unit!18900)

(assert (=> b!599657 (= e!342815 Unit!18903)))

(declare-fun b!599658 () Bool)

(declare-fun res!384728 () Bool)

(assert (=> b!599658 (=> (not res!384728) (not e!342818))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599658 (= res!384728 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599659 () Bool)

(declare-fun e!342820 () Bool)

(assert (=> b!599659 (= e!342825 e!342820)))

(declare-fun res!384731 () Bool)

(assert (=> b!599659 (=> (not res!384731) (not e!342820))))

(assert (=> b!599659 (= res!384731 (= (select (store (arr!17810 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!599659 (= lt!272570 (array!37102 (store (arr!17810 a!2986) i!1108 k0!1786) (size!18175 a!2986)))))

(declare-fun b!599660 () Bool)

(declare-fun e!342824 () Bool)

(assert (=> b!599660 (= e!342820 e!342824)))

(declare-fun res!384737 () Bool)

(assert (=> b!599660 (=> (not res!384737) (not e!342824))))

(declare-datatypes ((SeekEntryResult!6247 0))(
  ( (MissingZero!6247 (index!27245 (_ BitVec 32))) (Found!6247 (index!27246 (_ BitVec 32))) (Intermediate!6247 (undefined!7059 Bool) (index!27247 (_ BitVec 32)) (x!56057 (_ BitVec 32))) (Undefined!6247) (MissingVacant!6247 (index!27248 (_ BitVec 32))) )
))
(declare-fun lt!272577 () SeekEntryResult!6247)

(assert (=> b!599660 (= res!384737 (and (= lt!272577 (Found!6247 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17810 a!2986) index!984) (select (arr!17810 a!2986) j!136))) (not (= (select (arr!17810 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37101 (_ BitVec 32)) SeekEntryResult!6247)

(assert (=> b!599660 (= lt!272577 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17810 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599661 () Bool)

(declare-fun e!342822 () Bool)

(declare-fun e!342819 () Bool)

(assert (=> b!599661 (= e!342822 e!342819)))

(declare-fun res!384725 () Bool)

(assert (=> b!599661 (=> res!384725 e!342819)))

(declare-fun lt!272574 () (_ BitVec 64))

(declare-fun lt!272571 () (_ BitVec 64))

(assert (=> b!599661 (= res!384725 (or (not (= (select (arr!17810 a!2986) j!136) lt!272574)) (not (= (select (arr!17810 a!2986) j!136) lt!272571)) (bvsge j!136 index!984)))))

(declare-fun b!599662 () Bool)

(declare-fun res!384726 () Bool)

(assert (=> b!599662 (=> (not res!384726) (not e!342825))))

(declare-fun arrayNoDuplicates!0 (array!37101 (_ BitVec 32) List!11890) Bool)

(assert (=> b!599662 (= res!384726 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11887))))

(declare-fun b!599663 () Bool)

(declare-fun e!342813 () Bool)

(declare-fun e!342817 () Bool)

(assert (=> b!599663 (= e!342813 e!342817)))

(declare-fun res!384727 () Bool)

(assert (=> b!599663 (=> res!384727 e!342817)))

(assert (=> b!599663 (= res!384727 (or (not (= (select (arr!17810 a!2986) j!136) lt!272574)) (not (= (select (arr!17810 a!2986) j!136) lt!272571)) (bvsge j!136 index!984)))))

(assert (=> b!599663 e!342822))

(declare-fun res!384724 () Bool)

(assert (=> b!599663 (=> (not res!384724) (not e!342822))))

(assert (=> b!599663 (= res!384724 (= lt!272571 (select (arr!17810 a!2986) j!136)))))

(assert (=> b!599663 (= lt!272571 (select (store (arr!17810 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!384729 () Bool)

(assert (=> start!54852 (=> (not res!384729) (not e!342818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54852 (= res!384729 (validMask!0 mask!3053))))

(assert (=> start!54852 e!342818))

(assert (=> start!54852 true))

(declare-fun array_inv!13693 (array!37101) Bool)

(assert (=> start!54852 (array_inv!13693 a!2986)))

(declare-fun b!599664 () Bool)

(assert (=> b!599664 (= e!342818 e!342825)))

(declare-fun res!384734 () Bool)

(assert (=> b!599664 (=> (not res!384734) (not e!342825))))

(declare-fun lt!272568 () SeekEntryResult!6247)

(assert (=> b!599664 (= res!384734 (or (= lt!272568 (MissingZero!6247 i!1108)) (= lt!272568 (MissingVacant!6247 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37101 (_ BitVec 32)) SeekEntryResult!6247)

(assert (=> b!599664 (= lt!272568 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599665 () Bool)

(declare-fun res!384732 () Bool)

(assert (=> b!599665 (=> res!384732 e!342823)))

(declare-fun noDuplicate!290 (List!11890) Bool)

(assert (=> b!599665 (= res!384732 (not (noDuplicate!290 Nil!11887)))))

(declare-fun b!599666 () Bool)

(assert (=> b!599666 (= e!342824 (not e!342813))))

(declare-fun res!384739 () Bool)

(assert (=> b!599666 (=> res!384739 e!342813)))

(declare-fun lt!272581 () SeekEntryResult!6247)

(assert (=> b!599666 (= res!384739 (not (= lt!272581 (Found!6247 index!984))))))

(declare-fun lt!272572 () Unit!18900)

(assert (=> b!599666 (= lt!272572 e!342815)))

(declare-fun c!67830 () Bool)

(assert (=> b!599666 (= c!67830 (= lt!272581 Undefined!6247))))

(assert (=> b!599666 (= lt!272581 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272574 lt!272570 mask!3053))))

(declare-fun e!342816 () Bool)

(assert (=> b!599666 e!342816))

(declare-fun res!384740 () Bool)

(assert (=> b!599666 (=> (not res!384740) (not e!342816))))

(declare-fun lt!272573 () (_ BitVec 32))

(declare-fun lt!272576 () SeekEntryResult!6247)

(assert (=> b!599666 (= res!384740 (= lt!272576 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272573 vacantSpotIndex!68 lt!272574 lt!272570 mask!3053)))))

(assert (=> b!599666 (= lt!272576 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272573 vacantSpotIndex!68 (select (arr!17810 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599666 (= lt!272574 (select (store (arr!17810 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272578 () Unit!18900)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37101 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18900)

(assert (=> b!599666 (= lt!272578 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272573 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599666 (= lt!272573 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!599667 () Bool)

(assert (=> b!599667 (= e!342817 e!342823)))

(declare-fun res!384742 () Bool)

(assert (=> b!599667 (=> res!384742 e!342823)))

(assert (=> b!599667 (= res!384742 (or (bvsge (size!18175 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18175 a!2986))))))

(assert (=> b!599667 (arrayNoDuplicates!0 lt!272570 j!136 Nil!11887)))

(declare-fun lt!272569 () Unit!18900)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37101 (_ BitVec 32) (_ BitVec 32)) Unit!18900)

(assert (=> b!599667 (= lt!272569 (lemmaNoDuplicateFromThenFromBigger!0 lt!272570 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599667 (arrayNoDuplicates!0 lt!272570 #b00000000000000000000000000000000 Nil!11887)))

(declare-fun lt!272580 () Unit!18900)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37101 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11890) Unit!18900)

(assert (=> b!599667 (= lt!272580 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11887))))

(assert (=> b!599667 (arrayContainsKey!0 lt!272570 (select (arr!17810 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272579 () Unit!18900)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37101 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18900)

(assert (=> b!599667 (= lt!272579 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272570 (select (arr!17810 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599668 () Bool)

(assert (=> b!599668 (= e!342819 e!342814)))

(declare-fun res!384736 () Bool)

(assert (=> b!599668 (=> (not res!384736) (not e!342814))))

(assert (=> b!599668 (= res!384736 (arrayContainsKey!0 lt!272570 (select (arr!17810 a!2986) j!136) j!136))))

(declare-fun b!599669 () Bool)

(declare-fun res!384730 () Bool)

(assert (=> b!599669 (=> (not res!384730) (not e!342818))))

(assert (=> b!599669 (= res!384730 (validKeyInArray!0 k0!1786))))

(declare-fun b!599670 () Bool)

(declare-fun res!384733 () Bool)

(assert (=> b!599670 (=> res!384733 e!342823)))

(assert (=> b!599670 (= res!384733 (contains!2955 Nil!11887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599671 () Bool)

(assert (=> b!599671 (= e!342816 (= lt!272577 lt!272576))))

(assert (= (and start!54852 res!384729) b!599651))

(assert (= (and b!599651 res!384743) b!599652))

(assert (= (and b!599652 res!384735) b!599669))

(assert (= (and b!599669 res!384730) b!599658))

(assert (= (and b!599658 res!384728) b!599664))

(assert (= (and b!599664 res!384734) b!599650))

(assert (= (and b!599650 res!384738) b!599662))

(assert (= (and b!599662 res!384726) b!599656))

(assert (= (and b!599656 res!384741) b!599659))

(assert (= (and b!599659 res!384731) b!599660))

(assert (= (and b!599660 res!384737) b!599666))

(assert (= (and b!599666 res!384740) b!599671))

(assert (= (and b!599666 c!67830) b!599655))

(assert (= (and b!599666 (not c!67830)) b!599657))

(assert (= (and b!599666 (not res!384739)) b!599663))

(assert (= (and b!599663 res!384724) b!599661))

(assert (= (and b!599661 (not res!384725)) b!599668))

(assert (= (and b!599668 res!384736) b!599654))

(assert (= (and b!599663 (not res!384727)) b!599667))

(assert (= (and b!599667 (not res!384742)) b!599665))

(assert (= (and b!599665 (not res!384732)) b!599670))

(assert (= (and b!599670 (not res!384733)) b!599653))

(declare-fun m!576385 () Bool)

(assert (=> b!599665 m!576385))

(declare-fun m!576387 () Bool)

(assert (=> b!599659 m!576387))

(declare-fun m!576389 () Bool)

(assert (=> b!599659 m!576389))

(declare-fun m!576391 () Bool)

(assert (=> b!599658 m!576391))

(declare-fun m!576393 () Bool)

(assert (=> b!599662 m!576393))

(declare-fun m!576395 () Bool)

(assert (=> b!599652 m!576395))

(assert (=> b!599652 m!576395))

(declare-fun m!576397 () Bool)

(assert (=> b!599652 m!576397))

(declare-fun m!576399 () Bool)

(assert (=> b!599653 m!576399))

(assert (=> b!599663 m!576395))

(assert (=> b!599663 m!576387))

(declare-fun m!576401 () Bool)

(assert (=> b!599663 m!576401))

(assert (=> b!599667 m!576395))

(declare-fun m!576403 () Bool)

(assert (=> b!599667 m!576403))

(declare-fun m!576405 () Bool)

(assert (=> b!599667 m!576405))

(declare-fun m!576407 () Bool)

(assert (=> b!599667 m!576407))

(declare-fun m!576409 () Bool)

(assert (=> b!599667 m!576409))

(declare-fun m!576411 () Bool)

(assert (=> b!599667 m!576411))

(assert (=> b!599667 m!576395))

(assert (=> b!599667 m!576395))

(declare-fun m!576413 () Bool)

(assert (=> b!599667 m!576413))

(declare-fun m!576415 () Bool)

(assert (=> b!599650 m!576415))

(declare-fun m!576417 () Bool)

(assert (=> b!599670 m!576417))

(declare-fun m!576419 () Bool)

(assert (=> b!599664 m!576419))

(declare-fun m!576421 () Bool)

(assert (=> start!54852 m!576421))

(declare-fun m!576423 () Bool)

(assert (=> start!54852 m!576423))

(declare-fun m!576425 () Bool)

(assert (=> b!599669 m!576425))

(assert (=> b!599668 m!576395))

(assert (=> b!599668 m!576395))

(declare-fun m!576427 () Bool)

(assert (=> b!599668 m!576427))

(assert (=> b!599654 m!576395))

(assert (=> b!599654 m!576395))

(declare-fun m!576429 () Bool)

(assert (=> b!599654 m!576429))

(assert (=> b!599661 m!576395))

(declare-fun m!576431 () Bool)

(assert (=> b!599660 m!576431))

(assert (=> b!599660 m!576395))

(assert (=> b!599660 m!576395))

(declare-fun m!576433 () Bool)

(assert (=> b!599660 m!576433))

(declare-fun m!576435 () Bool)

(assert (=> b!599666 m!576435))

(declare-fun m!576437 () Bool)

(assert (=> b!599666 m!576437))

(declare-fun m!576439 () Bool)

(assert (=> b!599666 m!576439))

(assert (=> b!599666 m!576395))

(assert (=> b!599666 m!576395))

(declare-fun m!576441 () Bool)

(assert (=> b!599666 m!576441))

(assert (=> b!599666 m!576387))

(declare-fun m!576443 () Bool)

(assert (=> b!599666 m!576443))

(declare-fun m!576445 () Bool)

(assert (=> b!599666 m!576445))

(declare-fun m!576447 () Bool)

(assert (=> b!599656 m!576447))

(check-sat (not start!54852) (not b!599664) (not b!599670) (not b!599658) (not b!599667) (not b!599665) (not b!599653) (not b!599660) (not b!599652) (not b!599666) (not b!599654) (not b!599668) (not b!599662) (not b!599669) (not b!599650))
(check-sat)
