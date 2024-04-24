; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53568 () Bool)

(assert start!53568)

(declare-fun b!582744 () Bool)

(declare-fun res!370458 () Bool)

(declare-fun e!334152 () Bool)

(assert (=> b!582744 (=> (not res!370458) (not e!334152))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36414 0))(
  ( (array!36415 (arr!17479 (Array (_ BitVec 32) (_ BitVec 64))) (size!17843 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36414)

(assert (=> b!582744 (= res!370458 (and (= (size!17843 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17843 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17843 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582745 () Bool)

(declare-fun res!370460 () Bool)

(declare-fun e!334151 () Bool)

(assert (=> b!582745 (=> (not res!370460) (not e!334151))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582745 (= res!370460 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17479 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17479 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582746 () Bool)

(declare-fun res!370454 () Bool)

(assert (=> b!582746 (=> (not res!370454) (not e!334151))))

(declare-datatypes ((List!11427 0))(
  ( (Nil!11424) (Cons!11423 (h!12471 (_ BitVec 64)) (t!17647 List!11427)) )
))
(declare-fun arrayNoDuplicates!0 (array!36414 (_ BitVec 32) List!11427) Bool)

(assert (=> b!582746 (= res!370454 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11424))))

(declare-fun b!582747 () Bool)

(assert (=> b!582747 (= e!334152 e!334151)))

(declare-fun res!370462 () Bool)

(assert (=> b!582747 (=> (not res!370462) (not e!334151))))

(declare-datatypes ((SeekEntryResult!5875 0))(
  ( (MissingZero!5875 (index!25727 (_ BitVec 32))) (Found!5875 (index!25728 (_ BitVec 32))) (Intermediate!5875 (undefined!6687 Bool) (index!25729 (_ BitVec 32)) (x!54731 (_ BitVec 32))) (Undefined!5875) (MissingVacant!5875 (index!25730 (_ BitVec 32))) )
))
(declare-fun lt!265249 () SeekEntryResult!5875)

(assert (=> b!582747 (= res!370462 (or (= lt!265249 (MissingZero!5875 i!1108)) (= lt!265249 (MissingVacant!5875 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36414 (_ BitVec 32)) SeekEntryResult!5875)

(assert (=> b!582747 (= lt!265249 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582748 () Bool)

(declare-fun res!370459 () Bool)

(assert (=> b!582748 (=> (not res!370459) (not e!334152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582748 (= res!370459 (validKeyInArray!0 (select (arr!17479 a!2986) j!136)))))

(declare-fun b!582749 () Bool)

(declare-fun res!370455 () Bool)

(assert (=> b!582749 (=> (not res!370455) (not e!334152))))

(declare-fun arrayContainsKey!0 (array!36414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582749 (= res!370455 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582743 () Bool)

(declare-fun res!370457 () Bool)

(assert (=> b!582743 (=> (not res!370457) (not e!334152))))

(assert (=> b!582743 (= res!370457 (validKeyInArray!0 k0!1786))))

(declare-fun res!370461 () Bool)

(assert (=> start!53568 (=> (not res!370461) (not e!334152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53568 (= res!370461 (validMask!0 mask!3053))))

(assert (=> start!53568 e!334152))

(assert (=> start!53568 true))

(declare-fun array_inv!13338 (array!36414) Bool)

(assert (=> start!53568 (array_inv!13338 a!2986)))

(declare-fun b!582750 () Bool)

(assert (=> b!582750 (= e!334151 false)))

(declare-fun lt!265248 () SeekEntryResult!5875)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36414 (_ BitVec 32)) SeekEntryResult!5875)

(assert (=> b!582750 (= lt!265248 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17479 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582751 () Bool)

(declare-fun res!370456 () Bool)

(assert (=> b!582751 (=> (not res!370456) (not e!334151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36414 (_ BitVec 32)) Bool)

(assert (=> b!582751 (= res!370456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53568 res!370461) b!582744))

(assert (= (and b!582744 res!370458) b!582748))

(assert (= (and b!582748 res!370459) b!582743))

(assert (= (and b!582743 res!370457) b!582749))

(assert (= (and b!582749 res!370455) b!582747))

(assert (= (and b!582747 res!370462) b!582751))

(assert (= (and b!582751 res!370456) b!582746))

(assert (= (and b!582746 res!370454) b!582745))

(assert (= (and b!582745 res!370460) b!582750))

(declare-fun m!561395 () Bool)

(assert (=> b!582743 m!561395))

(declare-fun m!561397 () Bool)

(assert (=> b!582745 m!561397))

(declare-fun m!561399 () Bool)

(assert (=> b!582745 m!561399))

(declare-fun m!561401 () Bool)

(assert (=> b!582745 m!561401))

(declare-fun m!561403 () Bool)

(assert (=> b!582748 m!561403))

(assert (=> b!582748 m!561403))

(declare-fun m!561405 () Bool)

(assert (=> b!582748 m!561405))

(declare-fun m!561407 () Bool)

(assert (=> b!582747 m!561407))

(declare-fun m!561409 () Bool)

(assert (=> b!582751 m!561409))

(declare-fun m!561411 () Bool)

(assert (=> start!53568 m!561411))

(declare-fun m!561413 () Bool)

(assert (=> start!53568 m!561413))

(declare-fun m!561415 () Bool)

(assert (=> b!582746 m!561415))

(declare-fun m!561417 () Bool)

(assert (=> b!582749 m!561417))

(assert (=> b!582750 m!561403))

(assert (=> b!582750 m!561403))

(declare-fun m!561419 () Bool)

(assert (=> b!582750 m!561419))

(check-sat (not b!582743) (not start!53568) (not b!582746) (not b!582751) (not b!582750) (not b!582747) (not b!582748) (not b!582749))
(check-sat)
