; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56808 () Bool)

(assert start!56808)

(declare-fun b!629121 () Bool)

(declare-fun res!406664 () Bool)

(declare-fun e!359803 () Bool)

(assert (=> b!629121 (=> (not res!406664) (not e!359803))))

(declare-datatypes ((array!38010 0))(
  ( (array!38011 (arr!18242 (Array (_ BitVec 32) (_ BitVec 64))) (size!18607 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38010)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38010 (_ BitVec 32)) Bool)

(assert (=> b!629121 (= res!406664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629123 () Bool)

(declare-fun res!406657 () Bool)

(assert (=> b!629123 (=> (not res!406657) (not e!359803))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!629123 (= res!406657 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18242 a!2986) index!984) (select (arr!18242 a!2986) j!136))) (not (= (select (arr!18242 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629124 () Bool)

(declare-fun res!406666 () Bool)

(declare-fun e!359804 () Bool)

(assert (=> b!629124 (=> (not res!406666) (not e!359804))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629124 (= res!406666 (validKeyInArray!0 k0!1786))))

(declare-fun b!629125 () Bool)

(declare-fun res!406662 () Bool)

(assert (=> b!629125 (=> (not res!406662) (not e!359803))))

(declare-datatypes ((List!12322 0))(
  ( (Nil!12319) (Cons!12318 (h!13363 (_ BitVec 64)) (t!18541 List!12322)) )
))
(declare-fun arrayNoDuplicates!0 (array!38010 (_ BitVec 32) List!12322) Bool)

(assert (=> b!629125 (= res!406662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12319))))

(declare-fun b!629126 () Bool)

(declare-fun res!406661 () Bool)

(assert (=> b!629126 (=> (not res!406661) (not e!359804))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629126 (= res!406661 (and (= (size!18607 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18607 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18607 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629127 () Bool)

(declare-fun res!406659 () Bool)

(assert (=> b!629127 (=> (not res!406659) (not e!359804))))

(declare-fun arrayContainsKey!0 (array!38010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629127 (= res!406659 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!406658 () Bool)

(assert (=> start!56808 (=> (not res!406658) (not e!359804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56808 (= res!406658 (validMask!0 mask!3053))))

(assert (=> start!56808 e!359804))

(assert (=> start!56808 true))

(declare-fun array_inv!14125 (array!38010) Bool)

(assert (=> start!56808 (array_inv!14125 a!2986)))

(declare-fun b!629122 () Bool)

(declare-fun res!406665 () Bool)

(assert (=> b!629122 (=> (not res!406665) (not e!359803))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!629122 (= res!406665 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18242 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18242 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629128 () Bool)

(assert (=> b!629128 (= e!359803 (not true))))

(declare-fun lt!290506 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6679 0))(
  ( (MissingZero!6679 (index!29000 (_ BitVec 32))) (Found!6679 (index!29001 (_ BitVec 32))) (Intermediate!6679 (undefined!7491 Bool) (index!29002 (_ BitVec 32)) (x!57746 (_ BitVec 32))) (Undefined!6679) (MissingVacant!6679 (index!29003 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38010 (_ BitVec 32)) SeekEntryResult!6679)

(assert (=> b!629128 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290506 vacantSpotIndex!68 (select (arr!18242 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290506 vacantSpotIndex!68 (select (store (arr!18242 a!2986) i!1108 k0!1786) j!136) (array!38011 (store (arr!18242 a!2986) i!1108 k0!1786) (size!18607 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21086 0))(
  ( (Unit!21087) )
))
(declare-fun lt!290504 () Unit!21086)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38010 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21086)

(assert (=> b!629128 (= lt!290504 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290506 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629128 (= lt!290506 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629129 () Bool)

(assert (=> b!629129 (= e!359804 e!359803)))

(declare-fun res!406660 () Bool)

(assert (=> b!629129 (=> (not res!406660) (not e!359803))))

(declare-fun lt!290505 () SeekEntryResult!6679)

(assert (=> b!629129 (= res!406660 (or (= lt!290505 (MissingZero!6679 i!1108)) (= lt!290505 (MissingVacant!6679 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38010 (_ BitVec 32)) SeekEntryResult!6679)

(assert (=> b!629129 (= lt!290505 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629130 () Bool)

(declare-fun res!406667 () Bool)

(assert (=> b!629130 (=> (not res!406667) (not e!359804))))

(assert (=> b!629130 (= res!406667 (validKeyInArray!0 (select (arr!18242 a!2986) j!136)))))

(declare-fun b!629131 () Bool)

(declare-fun res!406663 () Bool)

(assert (=> b!629131 (=> (not res!406663) (not e!359803))))

(assert (=> b!629131 (= res!406663 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18242 a!2986) j!136) a!2986 mask!3053) (Found!6679 j!136)))))

(assert (= (and start!56808 res!406658) b!629126))

(assert (= (and b!629126 res!406661) b!629130))

(assert (= (and b!629130 res!406667) b!629124))

(assert (= (and b!629124 res!406666) b!629127))

(assert (= (and b!629127 res!406659) b!629129))

(assert (= (and b!629129 res!406660) b!629121))

(assert (= (and b!629121 res!406664) b!629125))

(assert (= (and b!629125 res!406662) b!629122))

(assert (= (and b!629122 res!406665) b!629131))

(assert (= (and b!629131 res!406663) b!629123))

(assert (= (and b!629123 res!406657) b!629128))

(declare-fun m!603625 () Bool)

(assert (=> start!56808 m!603625))

(declare-fun m!603627 () Bool)

(assert (=> start!56808 m!603627))

(declare-fun m!603629 () Bool)

(assert (=> b!629125 m!603629))

(declare-fun m!603631 () Bool)

(assert (=> b!629127 m!603631))

(declare-fun m!603633 () Bool)

(assert (=> b!629128 m!603633))

(declare-fun m!603635 () Bool)

(assert (=> b!629128 m!603635))

(declare-fun m!603637 () Bool)

(assert (=> b!629128 m!603637))

(declare-fun m!603639 () Bool)

(assert (=> b!629128 m!603639))

(declare-fun m!603641 () Bool)

(assert (=> b!629128 m!603641))

(assert (=> b!629128 m!603635))

(declare-fun m!603643 () Bool)

(assert (=> b!629128 m!603643))

(assert (=> b!629128 m!603639))

(declare-fun m!603645 () Bool)

(assert (=> b!629128 m!603645))

(declare-fun m!603647 () Bool)

(assert (=> b!629122 m!603647))

(assert (=> b!629122 m!603641))

(declare-fun m!603649 () Bool)

(assert (=> b!629122 m!603649))

(declare-fun m!603651 () Bool)

(assert (=> b!629124 m!603651))

(declare-fun m!603653 () Bool)

(assert (=> b!629123 m!603653))

(assert (=> b!629123 m!603639))

(assert (=> b!629130 m!603639))

(assert (=> b!629130 m!603639))

(declare-fun m!603655 () Bool)

(assert (=> b!629130 m!603655))

(declare-fun m!603657 () Bool)

(assert (=> b!629129 m!603657))

(assert (=> b!629131 m!603639))

(assert (=> b!629131 m!603639))

(declare-fun m!603659 () Bool)

(assert (=> b!629131 m!603659))

(declare-fun m!603661 () Bool)

(assert (=> b!629121 m!603661))

(check-sat (not b!629125) (not b!629131) (not b!629121) (not b!629128) (not b!629129) (not b!629124) (not b!629130) (not b!629127) (not start!56808))
(check-sat)
