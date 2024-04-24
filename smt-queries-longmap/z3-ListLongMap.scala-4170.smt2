; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56868 () Bool)

(assert start!56868)

(declare-fun b!629488 () Bool)

(declare-fun e!360066 () Bool)

(declare-fun e!360069 () Bool)

(assert (=> b!629488 (= e!360066 e!360069)))

(declare-fun res!406786 () Bool)

(assert (=> b!629488 (=> (not res!406786) (not e!360069))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290813 () (_ BitVec 32))

(assert (=> b!629488 (= res!406786 (and (bvsge lt!290813 #b00000000000000000000000000000000) (bvslt lt!290813 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629488 (= lt!290813 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!629489 () Bool)

(declare-fun res!406779 () Bool)

(assert (=> b!629489 (=> (not res!406779) (not e!360069))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6631 0))(
  ( (MissingZero!6631 (index!28808 (_ BitVec 32))) (Found!6631 (index!28809 (_ BitVec 32))) (Intermediate!6631 (undefined!7443 Bool) (index!28810 (_ BitVec 32)) (x!57698 (_ BitVec 32))) (Undefined!6631) (MissingVacant!6631 (index!28811 (_ BitVec 32))) )
))
(declare-fun lt!290814 () SeekEntryResult!6631)

(declare-datatypes ((array!38001 0))(
  ( (array!38002 (arr!18235 (Array (_ BitVec 32) (_ BitVec 64))) (size!18599 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38001)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38001 (_ BitVec 32)) SeekEntryResult!6631)

(assert (=> b!629489 (= res!406779 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290813 vacantSpotIndex!68 (select (arr!18235 a!2986) j!136) a!2986 mask!3053) lt!290814))))

(declare-fun b!629490 () Bool)

(declare-fun res!406778 () Bool)

(declare-fun e!360068 () Bool)

(assert (=> b!629490 (=> (not res!406778) (not e!360068))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!629490 (= res!406778 (and (= (size!18599 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18599 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18599 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629491 () Bool)

(declare-fun res!406784 () Bool)

(assert (=> b!629491 (=> (not res!406784) (not e!360068))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629491 (= res!406784 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!629492 () Bool)

(declare-fun res!406781 () Bool)

(declare-fun e!360065 () Bool)

(assert (=> b!629492 (=> (not res!406781) (not e!360065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38001 (_ BitVec 32)) Bool)

(assert (=> b!629492 (= res!406781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629494 () Bool)

(declare-fun res!406789 () Bool)

(assert (=> b!629494 (=> (not res!406789) (not e!360065))))

(assert (=> b!629494 (= res!406789 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18235 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18235 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629495 () Bool)

(declare-fun res!406780 () Bool)

(assert (=> b!629495 (=> (not res!406780) (not e!360066))))

(assert (=> b!629495 (= res!406780 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18235 a!2986) index!984) (select (arr!18235 a!2986) j!136))) (not (= (select (arr!18235 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629496 () Bool)

(declare-fun res!406787 () Bool)

(assert (=> b!629496 (=> (not res!406787) (not e!360068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629496 (= res!406787 (validKeyInArray!0 (select (arr!18235 a!2986) j!136)))))

(declare-fun b!629493 () Bool)

(declare-fun res!406788 () Bool)

(assert (=> b!629493 (=> (not res!406788) (not e!360068))))

(assert (=> b!629493 (= res!406788 (validKeyInArray!0 k0!1786))))

(declare-fun res!406782 () Bool)

(assert (=> start!56868 (=> (not res!406782) (not e!360068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56868 (= res!406782 (validMask!0 mask!3053))))

(assert (=> start!56868 e!360068))

(assert (=> start!56868 true))

(declare-fun array_inv!14094 (array!38001) Bool)

(assert (=> start!56868 (array_inv!14094 a!2986)))

(declare-fun b!629497 () Bool)

(declare-fun res!406777 () Bool)

(assert (=> b!629497 (=> (not res!406777) (not e!360065))))

(declare-datatypes ((List!12183 0))(
  ( (Nil!12180) (Cons!12179 (h!13227 (_ BitVec 64)) (t!18403 List!12183)) )
))
(declare-fun arrayNoDuplicates!0 (array!38001 (_ BitVec 32) List!12183) Bool)

(assert (=> b!629497 (= res!406777 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12180))))

(declare-fun b!629498 () Bool)

(assert (=> b!629498 (= e!360069 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!910)) (bvsub #b01111111111111111111111111111110 x!910)))))

(declare-fun b!629499 () Bool)

(assert (=> b!629499 (= e!360068 e!360065)))

(declare-fun res!406785 () Bool)

(assert (=> b!629499 (=> (not res!406785) (not e!360065))))

(declare-fun lt!290815 () SeekEntryResult!6631)

(assert (=> b!629499 (= res!406785 (or (= lt!290815 (MissingZero!6631 i!1108)) (= lt!290815 (MissingVacant!6631 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38001 (_ BitVec 32)) SeekEntryResult!6631)

(assert (=> b!629499 (= lt!290815 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629500 () Bool)

(assert (=> b!629500 (= e!360065 e!360066)))

(declare-fun res!406783 () Bool)

(assert (=> b!629500 (=> (not res!406783) (not e!360066))))

(assert (=> b!629500 (= res!406783 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18235 a!2986) j!136) a!2986 mask!3053) lt!290814))))

(assert (=> b!629500 (= lt!290814 (Found!6631 j!136))))

(assert (= (and start!56868 res!406782) b!629490))

(assert (= (and b!629490 res!406778) b!629496))

(assert (= (and b!629496 res!406787) b!629493))

(assert (= (and b!629493 res!406788) b!629491))

(assert (= (and b!629491 res!406784) b!629499))

(assert (= (and b!629499 res!406785) b!629492))

(assert (= (and b!629492 res!406781) b!629497))

(assert (= (and b!629497 res!406777) b!629494))

(assert (= (and b!629494 res!406789) b!629500))

(assert (= (and b!629500 res!406783) b!629495))

(assert (= (and b!629495 res!406780) b!629488))

(assert (= (and b!629488 res!406786) b!629489))

(assert (= (and b!629489 res!406779) b!629498))

(declare-fun m!604795 () Bool)

(assert (=> start!56868 m!604795))

(declare-fun m!604797 () Bool)

(assert (=> start!56868 m!604797))

(declare-fun m!604799 () Bool)

(assert (=> b!629496 m!604799))

(assert (=> b!629496 m!604799))

(declare-fun m!604801 () Bool)

(assert (=> b!629496 m!604801))

(declare-fun m!604803 () Bool)

(assert (=> b!629499 m!604803))

(declare-fun m!604805 () Bool)

(assert (=> b!629493 m!604805))

(declare-fun m!604807 () Bool)

(assert (=> b!629495 m!604807))

(assert (=> b!629495 m!604799))

(assert (=> b!629489 m!604799))

(assert (=> b!629489 m!604799))

(declare-fun m!604809 () Bool)

(assert (=> b!629489 m!604809))

(declare-fun m!604811 () Bool)

(assert (=> b!629497 m!604811))

(assert (=> b!629500 m!604799))

(assert (=> b!629500 m!604799))

(declare-fun m!604813 () Bool)

(assert (=> b!629500 m!604813))

(declare-fun m!604815 () Bool)

(assert (=> b!629494 m!604815))

(declare-fun m!604817 () Bool)

(assert (=> b!629494 m!604817))

(declare-fun m!604819 () Bool)

(assert (=> b!629494 m!604819))

(declare-fun m!604821 () Bool)

(assert (=> b!629488 m!604821))

(declare-fun m!604823 () Bool)

(assert (=> b!629491 m!604823))

(declare-fun m!604825 () Bool)

(assert (=> b!629492 m!604825))

(check-sat (not b!629492) (not b!629489) (not b!629493) (not b!629499) (not start!56868) (not b!629488) (not b!629500) (not b!629496) (not b!629497) (not b!629491))
(check-sat)
