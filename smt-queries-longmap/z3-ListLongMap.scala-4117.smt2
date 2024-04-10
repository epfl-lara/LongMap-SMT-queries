; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56202 () Bool)

(assert start!56202)

(declare-fun b!622785 () Bool)

(declare-fun res!401369 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622785 (= res!401369 (bvsge j!136 index!984))))

(declare-fun e!357219 () Bool)

(assert (=> b!622785 (=> res!401369 e!357219)))

(declare-fun e!357224 () Bool)

(assert (=> b!622785 (= e!357224 e!357219)))

(declare-fun b!622786 () Bool)

(assert (=> b!622786 false))

(declare-datatypes ((Unit!20948 0))(
  ( (Unit!20949) )
))
(declare-fun lt!288691 () Unit!20948)

(declare-datatypes ((array!37672 0))(
  ( (array!37673 (arr!18082 (Array (_ BitVec 32) (_ BitVec 64))) (size!18446 (_ BitVec 32))) )
))
(declare-fun lt!288684 () array!37672)

(declare-fun a!2986 () array!37672)

(declare-datatypes ((List!12123 0))(
  ( (Nil!12120) (Cons!12119 (h!13164 (_ BitVec 64)) (t!18351 List!12123)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37672 (_ BitVec 64) (_ BitVec 32) List!12123) Unit!20948)

(assert (=> b!622786 (= lt!288691 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288684 (select (arr!18082 a!2986) j!136) index!984 Nil!12120))))

(declare-fun arrayNoDuplicates!0 (array!37672 (_ BitVec 32) List!12123) Bool)

(assert (=> b!622786 (arrayNoDuplicates!0 lt!288684 index!984 Nil!12120)))

(declare-fun lt!288678 () Unit!20948)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37672 (_ BitVec 32) (_ BitVec 32)) Unit!20948)

(assert (=> b!622786 (= lt!288678 (lemmaNoDuplicateFromThenFromBigger!0 lt!288684 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622786 (arrayNoDuplicates!0 lt!288684 #b00000000000000000000000000000000 Nil!12120)))

(declare-fun lt!288697 () Unit!20948)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12123) Unit!20948)

(assert (=> b!622786 (= lt!288697 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12120))))

(declare-fun arrayContainsKey!0 (array!37672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622786 (arrayContainsKey!0 lt!288684 (select (arr!18082 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288692 () Unit!20948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37672 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20948)

(assert (=> b!622786 (= lt!288692 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288684 (select (arr!18082 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!357228 () Bool)

(assert (=> b!622786 e!357228))

(declare-fun res!401373 () Bool)

(assert (=> b!622786 (=> (not res!401373) (not e!357228))))

(assert (=> b!622786 (= res!401373 (arrayContainsKey!0 lt!288684 (select (arr!18082 a!2986) j!136) j!136))))

(declare-fun e!357223 () Unit!20948)

(declare-fun Unit!20950 () Unit!20948)

(assert (=> b!622786 (= e!357223 Unit!20950)))

(declare-fun b!622787 () Bool)

(declare-fun res!401377 () Bool)

(assert (=> b!622787 (= res!401377 (arrayContainsKey!0 lt!288684 (select (arr!18082 a!2986) j!136) j!136))))

(declare-fun e!357222 () Bool)

(assert (=> b!622787 (=> (not res!401377) (not e!357222))))

(assert (=> b!622787 (= e!357219 e!357222)))

(declare-fun b!622788 () Bool)

(declare-fun e!357216 () Unit!20948)

(declare-fun Unit!20951 () Unit!20948)

(assert (=> b!622788 (= e!357216 Unit!20951)))

(declare-fun res!401376 () Bool)

(assert (=> b!622788 (= res!401376 (= (select (store (arr!18082 a!2986) i!1108 k0!1786) index!984) (select (arr!18082 a!2986) j!136)))))

(assert (=> b!622788 (=> (not res!401376) (not e!357224))))

(assert (=> b!622788 e!357224))

(declare-fun c!71079 () Bool)

(assert (=> b!622788 (= c!71079 (bvslt j!136 index!984))))

(declare-fun lt!288696 () Unit!20948)

(declare-fun e!357227 () Unit!20948)

(assert (=> b!622788 (= lt!288696 e!357227)))

(declare-fun c!71078 () Bool)

(assert (=> b!622788 (= c!71078 (bvslt index!984 j!136))))

(declare-fun lt!288685 () Unit!20948)

(assert (=> b!622788 (= lt!288685 e!357223)))

(assert (=> b!622788 false))

(declare-fun b!622789 () Bool)

(declare-fun res!401375 () Bool)

(declare-fun e!357220 () Bool)

(assert (=> b!622789 (=> (not res!401375) (not e!357220))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622789 (= res!401375 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18082 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!622790 () Bool)

(declare-fun Unit!20952 () Unit!20948)

(assert (=> b!622790 (= e!357216 Unit!20952)))

(declare-fun b!622791 () Bool)

(declare-fun e!357226 () Unit!20948)

(declare-fun Unit!20953 () Unit!20948)

(assert (=> b!622791 (= e!357226 Unit!20953)))

(assert (=> b!622791 false))

(declare-fun b!622792 () Bool)

(declare-fun res!401363 () Bool)

(declare-fun e!357217 () Bool)

(assert (=> b!622792 (=> (not res!401363) (not e!357217))))

(assert (=> b!622792 (= res!401363 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622793 () Bool)

(declare-fun e!357215 () Bool)

(declare-fun e!357225 () Bool)

(assert (=> b!622793 (= e!357215 e!357225)))

(declare-fun res!401378 () Bool)

(assert (=> b!622793 (=> (not res!401378) (not e!357225))))

(declare-datatypes ((SeekEntryResult!6522 0))(
  ( (MissingZero!6522 (index!28372 (_ BitVec 32))) (Found!6522 (index!28373 (_ BitVec 32))) (Intermediate!6522 (undefined!7334 Bool) (index!28374 (_ BitVec 32)) (x!57138 (_ BitVec 32))) (Undefined!6522) (MissingVacant!6522 (index!28375 (_ BitVec 32))) )
))
(declare-fun lt!288689 () SeekEntryResult!6522)

(assert (=> b!622793 (= res!401378 (and (= lt!288689 (Found!6522 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18082 a!2986) index!984) (select (arr!18082 a!2986) j!136))) (not (= (select (arr!18082 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37672 (_ BitVec 32)) SeekEntryResult!6522)

(assert (=> b!622793 (= lt!288689 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18082 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622794 () Bool)

(assert (=> b!622794 (= e!357217 e!357220)))

(declare-fun res!401367 () Bool)

(assert (=> b!622794 (=> (not res!401367) (not e!357220))))

(declare-fun lt!288686 () SeekEntryResult!6522)

(assert (=> b!622794 (= res!401367 (or (= lt!288686 (MissingZero!6522 i!1108)) (= lt!288686 (MissingVacant!6522 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37672 (_ BitVec 32)) SeekEntryResult!6522)

(assert (=> b!622794 (= lt!288686 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622795 () Bool)

(assert (=> b!622795 (= e!357225 (not true))))

(declare-fun lt!288682 () Unit!20948)

(assert (=> b!622795 (= lt!288682 e!357216)))

(declare-fun c!71080 () Bool)

(declare-fun lt!288681 () SeekEntryResult!6522)

(assert (=> b!622795 (= c!71080 (= lt!288681 (Found!6522 index!984)))))

(declare-fun lt!288690 () Unit!20948)

(assert (=> b!622795 (= lt!288690 e!357226)))

(declare-fun c!71081 () Bool)

(assert (=> b!622795 (= c!71081 (= lt!288681 Undefined!6522))))

(declare-fun lt!288693 () (_ BitVec 64))

(assert (=> b!622795 (= lt!288681 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288693 lt!288684 mask!3053))))

(declare-fun e!357218 () Bool)

(assert (=> b!622795 e!357218))

(declare-fun res!401370 () Bool)

(assert (=> b!622795 (=> (not res!401370) (not e!357218))))

(declare-fun lt!288687 () SeekEntryResult!6522)

(declare-fun lt!288683 () (_ BitVec 32))

(assert (=> b!622795 (= res!401370 (= lt!288687 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288683 vacantSpotIndex!68 lt!288693 lt!288684 mask!3053)))))

(assert (=> b!622795 (= lt!288687 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288683 vacantSpotIndex!68 (select (arr!18082 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622795 (= lt!288693 (select (store (arr!18082 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288688 () Unit!20948)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37672 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20948)

(assert (=> b!622795 (= lt!288688 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288683 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622795 (= lt!288683 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622796 () Bool)

(assert (=> b!622796 (= e!357218 (= lt!288689 lt!288687))))

(declare-fun b!622797 () Bool)

(declare-fun res!401372 () Bool)

(assert (=> b!622797 (=> (not res!401372) (not e!357220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37672 (_ BitVec 32)) Bool)

(assert (=> b!622797 (= res!401372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!401366 () Bool)

(assert (=> start!56202 (=> (not res!401366) (not e!357217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56202 (= res!401366 (validMask!0 mask!3053))))

(assert (=> start!56202 e!357217))

(assert (=> start!56202 true))

(declare-fun array_inv!13878 (array!37672) Bool)

(assert (=> start!56202 (array_inv!13878 a!2986)))

(declare-fun b!622798 () Bool)

(declare-fun res!401371 () Bool)

(assert (=> b!622798 (=> (not res!401371) (not e!357220))))

(assert (=> b!622798 (= res!401371 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12120))))

(declare-fun b!622799 () Bool)

(assert (=> b!622799 (= e!357220 e!357215)))

(declare-fun res!401364 () Bool)

(assert (=> b!622799 (=> (not res!401364) (not e!357215))))

(assert (=> b!622799 (= res!401364 (= (select (store (arr!18082 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622799 (= lt!288684 (array!37673 (store (arr!18082 a!2986) i!1108 k0!1786) (size!18446 a!2986)))))

(declare-fun b!622800 () Bool)

(declare-fun Unit!20954 () Unit!20948)

(assert (=> b!622800 (= e!357226 Unit!20954)))

(declare-fun b!622801 () Bool)

(declare-fun res!401365 () Bool)

(assert (=> b!622801 (=> (not res!401365) (not e!357217))))

(assert (=> b!622801 (= res!401365 (and (= (size!18446 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18446 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18446 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622802 () Bool)

(declare-fun res!401374 () Bool)

(assert (=> b!622802 (=> (not res!401374) (not e!357217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622802 (= res!401374 (validKeyInArray!0 k0!1786))))

(declare-fun b!622803 () Bool)

(declare-fun res!401368 () Bool)

(assert (=> b!622803 (=> (not res!401368) (not e!357217))))

(assert (=> b!622803 (= res!401368 (validKeyInArray!0 (select (arr!18082 a!2986) j!136)))))

(declare-fun b!622804 () Bool)

(assert (=> b!622804 (= e!357222 (arrayContainsKey!0 lt!288684 (select (arr!18082 a!2986) j!136) index!984))))

(declare-fun b!622805 () Bool)

(declare-fun Unit!20955 () Unit!20948)

(assert (=> b!622805 (= e!357223 Unit!20955)))

(declare-fun b!622806 () Bool)

(declare-fun Unit!20956 () Unit!20948)

(assert (=> b!622806 (= e!357227 Unit!20956)))

(declare-fun b!622807 () Bool)

(assert (=> b!622807 false))

(declare-fun lt!288679 () Unit!20948)

(assert (=> b!622807 (= lt!288679 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288684 (select (arr!18082 a!2986) j!136) j!136 Nil!12120))))

(assert (=> b!622807 (arrayNoDuplicates!0 lt!288684 j!136 Nil!12120)))

(declare-fun lt!288694 () Unit!20948)

(assert (=> b!622807 (= lt!288694 (lemmaNoDuplicateFromThenFromBigger!0 lt!288684 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622807 (arrayNoDuplicates!0 lt!288684 #b00000000000000000000000000000000 Nil!12120)))

(declare-fun lt!288695 () Unit!20948)

(assert (=> b!622807 (= lt!288695 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12120))))

(assert (=> b!622807 (arrayContainsKey!0 lt!288684 (select (arr!18082 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288680 () Unit!20948)

(assert (=> b!622807 (= lt!288680 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288684 (select (arr!18082 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20957 () Unit!20948)

(assert (=> b!622807 (= e!357227 Unit!20957)))

(declare-fun b!622808 () Bool)

(assert (=> b!622808 (= e!357228 (arrayContainsKey!0 lt!288684 (select (arr!18082 a!2986) j!136) index!984))))

(assert (= (and start!56202 res!401366) b!622801))

(assert (= (and b!622801 res!401365) b!622803))

(assert (= (and b!622803 res!401368) b!622802))

(assert (= (and b!622802 res!401374) b!622792))

(assert (= (and b!622792 res!401363) b!622794))

(assert (= (and b!622794 res!401367) b!622797))

(assert (= (and b!622797 res!401372) b!622798))

(assert (= (and b!622798 res!401371) b!622789))

(assert (= (and b!622789 res!401375) b!622799))

(assert (= (and b!622799 res!401364) b!622793))

(assert (= (and b!622793 res!401378) b!622795))

(assert (= (and b!622795 res!401370) b!622796))

(assert (= (and b!622795 c!71081) b!622791))

(assert (= (and b!622795 (not c!71081)) b!622800))

(assert (= (and b!622795 c!71080) b!622788))

(assert (= (and b!622795 (not c!71080)) b!622790))

(assert (= (and b!622788 res!401376) b!622785))

(assert (= (and b!622785 (not res!401369)) b!622787))

(assert (= (and b!622787 res!401377) b!622804))

(assert (= (and b!622788 c!71079) b!622807))

(assert (= (and b!622788 (not c!71079)) b!622806))

(assert (= (and b!622788 c!71078) b!622786))

(assert (= (and b!622788 (not c!71078)) b!622805))

(assert (= (and b!622786 res!401373) b!622808))

(declare-fun m!598641 () Bool)

(assert (=> b!622808 m!598641))

(assert (=> b!622808 m!598641))

(declare-fun m!598643 () Bool)

(assert (=> b!622808 m!598643))

(declare-fun m!598645 () Bool)

(assert (=> b!622802 m!598645))

(declare-fun m!598647 () Bool)

(assert (=> b!622789 m!598647))

(assert (=> b!622804 m!598641))

(assert (=> b!622804 m!598641))

(assert (=> b!622804 m!598643))

(declare-fun m!598649 () Bool)

(assert (=> b!622794 m!598649))

(declare-fun m!598651 () Bool)

(assert (=> b!622788 m!598651))

(declare-fun m!598653 () Bool)

(assert (=> b!622788 m!598653))

(assert (=> b!622788 m!598641))

(assert (=> b!622786 m!598641))

(assert (=> b!622786 m!598641))

(declare-fun m!598655 () Bool)

(assert (=> b!622786 m!598655))

(declare-fun m!598657 () Bool)

(assert (=> b!622786 m!598657))

(declare-fun m!598659 () Bool)

(assert (=> b!622786 m!598659))

(assert (=> b!622786 m!598641))

(declare-fun m!598661 () Bool)

(assert (=> b!622786 m!598661))

(declare-fun m!598663 () Bool)

(assert (=> b!622786 m!598663))

(assert (=> b!622786 m!598641))

(declare-fun m!598665 () Bool)

(assert (=> b!622786 m!598665))

(declare-fun m!598667 () Bool)

(assert (=> b!622786 m!598667))

(assert (=> b!622786 m!598641))

(declare-fun m!598669 () Bool)

(assert (=> b!622786 m!598669))

(declare-fun m!598671 () Bool)

(assert (=> start!56202 m!598671))

(declare-fun m!598673 () Bool)

(assert (=> start!56202 m!598673))

(declare-fun m!598675 () Bool)

(assert (=> b!622798 m!598675))

(assert (=> b!622803 m!598641))

(assert (=> b!622803 m!598641))

(declare-fun m!598677 () Bool)

(assert (=> b!622803 m!598677))

(declare-fun m!598679 () Bool)

(assert (=> b!622793 m!598679))

(assert (=> b!622793 m!598641))

(assert (=> b!622793 m!598641))

(declare-fun m!598681 () Bool)

(assert (=> b!622793 m!598681))

(declare-fun m!598683 () Bool)

(assert (=> b!622807 m!598683))

(assert (=> b!622807 m!598641))

(assert (=> b!622807 m!598641))

(declare-fun m!598685 () Bool)

(assert (=> b!622807 m!598685))

(assert (=> b!622807 m!598657))

(declare-fun m!598687 () Bool)

(assert (=> b!622807 m!598687))

(assert (=> b!622807 m!598659))

(assert (=> b!622807 m!598641))

(declare-fun m!598689 () Bool)

(assert (=> b!622807 m!598689))

(assert (=> b!622807 m!598641))

(declare-fun m!598691 () Bool)

(assert (=> b!622807 m!598691))

(assert (=> b!622799 m!598651))

(declare-fun m!598693 () Bool)

(assert (=> b!622799 m!598693))

(assert (=> b!622787 m!598641))

(assert (=> b!622787 m!598641))

(assert (=> b!622787 m!598665))

(declare-fun m!598695 () Bool)

(assert (=> b!622797 m!598695))

(declare-fun m!598697 () Bool)

(assert (=> b!622792 m!598697))

(declare-fun m!598699 () Bool)

(assert (=> b!622795 m!598699))

(assert (=> b!622795 m!598641))

(assert (=> b!622795 m!598651))

(declare-fun m!598701 () Bool)

(assert (=> b!622795 m!598701))

(declare-fun m!598703 () Bool)

(assert (=> b!622795 m!598703))

(declare-fun m!598705 () Bool)

(assert (=> b!622795 m!598705))

(assert (=> b!622795 m!598641))

(declare-fun m!598707 () Bool)

(assert (=> b!622795 m!598707))

(declare-fun m!598709 () Bool)

(assert (=> b!622795 m!598709))

(check-sat (not b!622802) (not b!622787) (not b!622803) (not b!622786) (not b!622798) (not b!622794) (not b!622807) (not b!622792) (not b!622808) (not start!56202) (not b!622793) (not b!622797) (not b!622804) (not b!622795))
(check-sat)
