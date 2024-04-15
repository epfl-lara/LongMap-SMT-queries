; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56814 () Bool)

(assert start!56814)

(declare-fun b!629220 () Bool)

(declare-fun res!406762 () Bool)

(declare-fun e!359831 () Bool)

(assert (=> b!629220 (=> (not res!406762) (not e!359831))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38016 0))(
  ( (array!38017 (arr!18245 (Array (_ BitVec 32) (_ BitVec 64))) (size!18610 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38016)

(assert (=> b!629220 (= res!406762 (and (= (size!18610 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18610 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18610 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629221 () Bool)

(declare-fun res!406757 () Bool)

(declare-fun e!359832 () Bool)

(assert (=> b!629221 (=> (not res!406757) (not e!359832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38016 (_ BitVec 32)) Bool)

(assert (=> b!629221 (= res!406757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629222 () Bool)

(assert (=> b!629222 (= e!359832 (not true))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!290531 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!6682 0))(
  ( (MissingZero!6682 (index!29012 (_ BitVec 32))) (Found!6682 (index!29013 (_ BitVec 32))) (Intermediate!6682 (undefined!7494 Bool) (index!29014 (_ BitVec 32)) (x!57757 (_ BitVec 32))) (Undefined!6682) (MissingVacant!6682 (index!29015 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38016 (_ BitVec 32)) SeekEntryResult!6682)

(assert (=> b!629222 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290531 vacantSpotIndex!68 (select (arr!18245 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290531 vacantSpotIndex!68 (select (store (arr!18245 a!2986) i!1108 k0!1786) j!136) (array!38017 (store (arr!18245 a!2986) i!1108 k0!1786) (size!18610 a!2986)) mask!3053))))

(declare-datatypes ((Unit!21092 0))(
  ( (Unit!21093) )
))
(declare-fun lt!290533 () Unit!21092)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38016 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21092)

(assert (=> b!629222 (= lt!290533 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!290531 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629222 (= lt!290531 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629223 () Bool)

(declare-fun res!406763 () Bool)

(assert (=> b!629223 (=> (not res!406763) (not e!359832))))

(assert (=> b!629223 (= res!406763 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18245 a!2986) j!136) a!2986 mask!3053) (Found!6682 j!136)))))

(declare-fun b!629224 () Bool)

(declare-fun res!406761 () Bool)

(assert (=> b!629224 (=> (not res!406761) (not e!359831))))

(declare-fun arrayContainsKey!0 (array!38016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629224 (= res!406761 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!406766 () Bool)

(assert (=> start!56814 (=> (not res!406766) (not e!359831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56814 (= res!406766 (validMask!0 mask!3053))))

(assert (=> start!56814 e!359831))

(assert (=> start!56814 true))

(declare-fun array_inv!14128 (array!38016) Bool)

(assert (=> start!56814 (array_inv!14128 a!2986)))

(declare-fun b!629225 () Bool)

(declare-fun res!406760 () Bool)

(assert (=> b!629225 (=> (not res!406760) (not e!359832))))

(assert (=> b!629225 (= res!406760 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18245 a!2986) index!984) (select (arr!18245 a!2986) j!136))) (not (= (select (arr!18245 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629226 () Bool)

(assert (=> b!629226 (= e!359831 e!359832)))

(declare-fun res!406759 () Bool)

(assert (=> b!629226 (=> (not res!406759) (not e!359832))))

(declare-fun lt!290532 () SeekEntryResult!6682)

(assert (=> b!629226 (= res!406759 (or (= lt!290532 (MissingZero!6682 i!1108)) (= lt!290532 (MissingVacant!6682 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38016 (_ BitVec 32)) SeekEntryResult!6682)

(assert (=> b!629226 (= lt!290532 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!629227 () Bool)

(declare-fun res!406765 () Bool)

(assert (=> b!629227 (=> (not res!406765) (not e!359832))))

(declare-datatypes ((List!12325 0))(
  ( (Nil!12322) (Cons!12321 (h!13366 (_ BitVec 64)) (t!18544 List!12325)) )
))
(declare-fun arrayNoDuplicates!0 (array!38016 (_ BitVec 32) List!12325) Bool)

(assert (=> b!629227 (= res!406765 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12322))))

(declare-fun b!629228 () Bool)

(declare-fun res!406764 () Bool)

(assert (=> b!629228 (=> (not res!406764) (not e!359831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629228 (= res!406764 (validKeyInArray!0 (select (arr!18245 a!2986) j!136)))))

(declare-fun b!629229 () Bool)

(declare-fun res!406756 () Bool)

(assert (=> b!629229 (=> (not res!406756) (not e!359831))))

(assert (=> b!629229 (= res!406756 (validKeyInArray!0 k0!1786))))

(declare-fun b!629230 () Bool)

(declare-fun res!406758 () Bool)

(assert (=> b!629230 (=> (not res!406758) (not e!359832))))

(assert (=> b!629230 (= res!406758 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18245 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18245 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56814 res!406766) b!629220))

(assert (= (and b!629220 res!406762) b!629228))

(assert (= (and b!629228 res!406764) b!629229))

(assert (= (and b!629229 res!406756) b!629224))

(assert (= (and b!629224 res!406761) b!629226))

(assert (= (and b!629226 res!406759) b!629221))

(assert (= (and b!629221 res!406757) b!629227))

(assert (= (and b!629227 res!406765) b!629230))

(assert (= (and b!629230 res!406758) b!629223))

(assert (= (and b!629223 res!406763) b!629225))

(assert (= (and b!629225 res!406760) b!629222))

(declare-fun m!603739 () Bool)

(assert (=> b!629225 m!603739))

(declare-fun m!603741 () Bool)

(assert (=> b!629225 m!603741))

(declare-fun m!603743 () Bool)

(assert (=> b!629226 m!603743))

(declare-fun m!603745 () Bool)

(assert (=> start!56814 m!603745))

(declare-fun m!603747 () Bool)

(assert (=> start!56814 m!603747))

(assert (=> b!629228 m!603741))

(assert (=> b!629228 m!603741))

(declare-fun m!603749 () Bool)

(assert (=> b!629228 m!603749))

(declare-fun m!603751 () Bool)

(assert (=> b!629229 m!603751))

(declare-fun m!603753 () Bool)

(assert (=> b!629222 m!603753))

(declare-fun m!603755 () Bool)

(assert (=> b!629222 m!603755))

(assert (=> b!629222 m!603755))

(declare-fun m!603757 () Bool)

(assert (=> b!629222 m!603757))

(assert (=> b!629222 m!603741))

(declare-fun m!603759 () Bool)

(assert (=> b!629222 m!603759))

(declare-fun m!603761 () Bool)

(assert (=> b!629222 m!603761))

(assert (=> b!629222 m!603741))

(declare-fun m!603763 () Bool)

(assert (=> b!629222 m!603763))

(assert (=> b!629223 m!603741))

(assert (=> b!629223 m!603741))

(declare-fun m!603765 () Bool)

(assert (=> b!629223 m!603765))

(declare-fun m!603767 () Bool)

(assert (=> b!629227 m!603767))

(declare-fun m!603769 () Bool)

(assert (=> b!629230 m!603769))

(assert (=> b!629230 m!603759))

(declare-fun m!603771 () Bool)

(assert (=> b!629230 m!603771))

(declare-fun m!603773 () Bool)

(assert (=> b!629221 m!603773))

(declare-fun m!603775 () Bool)

(assert (=> b!629224 m!603775))

(check-sat (not b!629229) (not b!629223) (not b!629227) (not b!629226) (not b!629221) (not b!629222) (not start!56814) (not b!629228) (not b!629224))
(check-sat)
