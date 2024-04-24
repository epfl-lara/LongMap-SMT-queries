; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56880 () Bool)

(assert start!56880)

(declare-fun b!629700 () Bool)

(declare-fun e!360133 () Bool)

(assert (=> b!629700 (= e!360133 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38013 0))(
  ( (array!38014 (arr!18241 (Array (_ BitVec 32) (_ BitVec 64))) (size!18605 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38013)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!290869 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6637 0))(
  ( (MissingZero!6637 (index!28832 (_ BitVec 32))) (Found!6637 (index!28833 (_ BitVec 32))) (Intermediate!6637 (undefined!7449 Bool) (index!28834 (_ BitVec 32)) (x!57720 (_ BitVec 32))) (Undefined!6637) (MissingVacant!6637 (index!28835 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38013 (_ BitVec 32)) SeekEntryResult!6637)

(assert (=> b!629700 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290869 vacantSpotIndex!68 (select (arr!18241 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290869 vacantSpotIndex!68 (select (store (arr!18241 a!2986) i!1108 k0!1786) j!136) (array!38014 (store (arr!18241 a!2986) i!1108 k0!1786) (size!18605 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21093 0))(
  ( (Unit!21094) )
))
(declare-fun lt!290868 () Unit!21093)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38013 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21093)

(assert (=> b!629700 (= lt!290868 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290869 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629700 (= lt!290869 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!629701 () Bool)

(declare-fun res!406999 () Bool)

(declare-fun e!360135 () Bool)

(assert (=> b!629701 (=> (not res!406999) (not e!360135))))

(declare-fun arrayContainsKey!0 (array!38013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629701 (= res!406999 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629702 () Bool)

(assert (=> b!629702 (= e!360135 e!360133)))

(declare-fun res!406994 () Bool)

(assert (=> b!629702 (=> (not res!406994) (not e!360133))))

(declare-fun lt!290867 () SeekEntryResult!6637)

(assert (=> b!629702 (= res!406994 (or (= lt!290867 (MissingZero!6637 i!1108)) (= lt!290867 (MissingVacant!6637 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38013 (_ BitVec 32)) SeekEntryResult!6637)

(assert (=> b!629702 (= lt!290867 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629703 () Bool)

(declare-fun res!406989 () Bool)

(assert (=> b!629703 (=> (not res!406989) (not e!360133))))

(assert (=> b!629703 (= res!406989 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18241 a!2986) index!984) (select (arr!18241 a!2986) j!136))) (not (= (select (arr!18241 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629704 () Bool)

(declare-fun res!406995 () Bool)

(assert (=> b!629704 (=> (not res!406995) (not e!360133))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38013 (_ BitVec 32)) Bool)

(assert (=> b!629704 (= res!406995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629705 () Bool)

(declare-fun res!406996 () Bool)

(assert (=> b!629705 (=> (not res!406996) (not e!360135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629705 (= res!406996 (validKeyInArray!0 (select (arr!18241 a!2986) j!136)))))

(declare-fun b!629706 () Bool)

(declare-fun res!406992 () Bool)

(assert (=> b!629706 (=> (not res!406992) (not e!360135))))

(assert (=> b!629706 (= res!406992 (and (= (size!18605 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18605 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18605 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!406997 () Bool)

(assert (=> start!56880 (=> (not res!406997) (not e!360135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56880 (= res!406997 (validMask!0 mask!3053))))

(assert (=> start!56880 e!360135))

(assert (=> start!56880 true))

(declare-fun array_inv!14100 (array!38013) Bool)

(assert (=> start!56880 (array_inv!14100 a!2986)))

(declare-fun b!629707 () Bool)

(declare-fun res!406991 () Bool)

(assert (=> b!629707 (=> (not res!406991) (not e!360135))))

(assert (=> b!629707 (= res!406991 (validKeyInArray!0 k0!1786))))

(declare-fun b!629708 () Bool)

(declare-fun res!406993 () Bool)

(assert (=> b!629708 (=> (not res!406993) (not e!360133))))

(assert (=> b!629708 (= res!406993 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18241 a!2986) j!136) a!2986 mask!3053) (Found!6637 j!136)))))

(declare-fun b!629709 () Bool)

(declare-fun res!406990 () Bool)

(assert (=> b!629709 (=> (not res!406990) (not e!360133))))

(assert (=> b!629709 (= res!406990 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18241 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18241 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629710 () Bool)

(declare-fun res!406998 () Bool)

(assert (=> b!629710 (=> (not res!406998) (not e!360133))))

(declare-datatypes ((List!12189 0))(
  ( (Nil!12186) (Cons!12185 (h!13233 (_ BitVec 64)) (t!18409 List!12189)) )
))
(declare-fun arrayNoDuplicates!0 (array!38013 (_ BitVec 32) List!12189) Bool)

(assert (=> b!629710 (= res!406998 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12186))))

(assert (= (and start!56880 res!406997) b!629706))

(assert (= (and b!629706 res!406992) b!629705))

(assert (= (and b!629705 res!406996) b!629707))

(assert (= (and b!629707 res!406991) b!629701))

(assert (= (and b!629701 res!406999) b!629702))

(assert (= (and b!629702 res!406994) b!629704))

(assert (= (and b!629704 res!406995) b!629710))

(assert (= (and b!629710 res!406998) b!629709))

(assert (= (and b!629709 res!406990) b!629708))

(assert (= (and b!629708 res!406993) b!629703))

(assert (= (and b!629703 res!406989) b!629700))

(declare-fun m!605005 () Bool)

(assert (=> b!629709 m!605005))

(declare-fun m!605007 () Bool)

(assert (=> b!629709 m!605007))

(declare-fun m!605009 () Bool)

(assert (=> b!629709 m!605009))

(declare-fun m!605011 () Bool)

(assert (=> b!629707 m!605011))

(declare-fun m!605013 () Bool)

(assert (=> b!629701 m!605013))

(declare-fun m!605015 () Bool)

(assert (=> start!56880 m!605015))

(declare-fun m!605017 () Bool)

(assert (=> start!56880 m!605017))

(declare-fun m!605019 () Bool)

(assert (=> b!629704 m!605019))

(declare-fun m!605021 () Bool)

(assert (=> b!629708 m!605021))

(assert (=> b!629708 m!605021))

(declare-fun m!605023 () Bool)

(assert (=> b!629708 m!605023))

(declare-fun m!605025 () Bool)

(assert (=> b!629710 m!605025))

(declare-fun m!605027 () Bool)

(assert (=> b!629702 m!605027))

(declare-fun m!605029 () Bool)

(assert (=> b!629703 m!605029))

(assert (=> b!629703 m!605021))

(assert (=> b!629705 m!605021))

(assert (=> b!629705 m!605021))

(declare-fun m!605031 () Bool)

(assert (=> b!629705 m!605031))

(declare-fun m!605033 () Bool)

(assert (=> b!629700 m!605033))

(declare-fun m!605035 () Bool)

(assert (=> b!629700 m!605035))

(declare-fun m!605037 () Bool)

(assert (=> b!629700 m!605037))

(assert (=> b!629700 m!605021))

(assert (=> b!629700 m!605007))

(assert (=> b!629700 m!605035))

(declare-fun m!605039 () Bool)

(assert (=> b!629700 m!605039))

(assert (=> b!629700 m!605021))

(declare-fun m!605041 () Bool)

(assert (=> b!629700 m!605041))

(check-sat (not b!629710) (not b!629705) (not b!629702) (not b!629701) (not b!629700) (not b!629707) (not b!629708) (not b!629704) (not start!56880))
(check-sat)
