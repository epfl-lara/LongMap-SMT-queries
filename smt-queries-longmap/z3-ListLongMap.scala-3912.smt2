; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53466 () Bool)

(assert start!53466)

(declare-fun b!581786 () Bool)

(declare-fun e!333687 () Bool)

(assert (=> b!581786 (= e!333687 false)))

(declare-datatypes ((SeekEntryResult!5902 0))(
  ( (MissingZero!5902 (index!25835 (_ BitVec 32))) (Found!5902 (index!25836 (_ BitVec 32))) (Intermediate!5902 (undefined!6714 Bool) (index!25837 (_ BitVec 32)) (x!54702 (_ BitVec 32))) (Undefined!5902) (MissingVacant!5902 (index!25838 (_ BitVec 32))) )
))
(declare-fun lt!264795 () SeekEntryResult!5902)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36381 0))(
  ( (array!36382 (arr!17465 (Array (_ BitVec 32) (_ BitVec 64))) (size!17830 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36381)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36381 (_ BitVec 32)) SeekEntryResult!5902)

(assert (=> b!581786 (= lt!264795 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17465 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581787 () Bool)

(declare-fun res!369744 () Bool)

(declare-fun e!333685 () Bool)

(assert (=> b!581787 (=> (not res!369744) (not e!333685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581787 (= res!369744 (validKeyInArray!0 (select (arr!17465 a!2986) j!136)))))

(declare-fun res!369748 () Bool)

(assert (=> start!53466 (=> (not res!369748) (not e!333685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53466 (= res!369748 (validMask!0 mask!3053))))

(assert (=> start!53466 e!333685))

(assert (=> start!53466 true))

(declare-fun array_inv!13348 (array!36381) Bool)

(assert (=> start!53466 (array_inv!13348 a!2986)))

(declare-fun b!581788 () Bool)

(assert (=> b!581788 (= e!333685 e!333687)))

(declare-fun res!369750 () Bool)

(assert (=> b!581788 (=> (not res!369750) (not e!333687))))

(declare-fun lt!264796 () SeekEntryResult!5902)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581788 (= res!369750 (or (= lt!264796 (MissingZero!5902 i!1108)) (= lt!264796 (MissingVacant!5902 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36381 (_ BitVec 32)) SeekEntryResult!5902)

(assert (=> b!581788 (= lt!264796 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581789 () Bool)

(declare-fun res!369752 () Bool)

(assert (=> b!581789 (=> (not res!369752) (not e!333687))))

(declare-datatypes ((List!11545 0))(
  ( (Nil!11542) (Cons!11541 (h!12586 (_ BitVec 64)) (t!17764 List!11545)) )
))
(declare-fun arrayNoDuplicates!0 (array!36381 (_ BitVec 32) List!11545) Bool)

(assert (=> b!581789 (= res!369752 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11542))))

(declare-fun b!581790 () Bool)

(declare-fun res!369746 () Bool)

(assert (=> b!581790 (=> (not res!369746) (not e!333685))))

(assert (=> b!581790 (= res!369746 (validKeyInArray!0 k0!1786))))

(declare-fun b!581791 () Bool)

(declare-fun res!369747 () Bool)

(assert (=> b!581791 (=> (not res!369747) (not e!333685))))

(assert (=> b!581791 (= res!369747 (and (= (size!17830 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17830 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17830 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581792 () Bool)

(declare-fun res!369749 () Bool)

(assert (=> b!581792 (=> (not res!369749) (not e!333687))))

(assert (=> b!581792 (= res!369749 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17465 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17465 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581793 () Bool)

(declare-fun res!369751 () Bool)

(assert (=> b!581793 (=> (not res!369751) (not e!333687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36381 (_ BitVec 32)) Bool)

(assert (=> b!581793 (= res!369751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581794 () Bool)

(declare-fun res!369745 () Bool)

(assert (=> b!581794 (=> (not res!369745) (not e!333685))))

(declare-fun arrayContainsKey!0 (array!36381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581794 (= res!369745 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53466 res!369748) b!581791))

(assert (= (and b!581791 res!369747) b!581787))

(assert (= (and b!581787 res!369744) b!581790))

(assert (= (and b!581790 res!369746) b!581794))

(assert (= (and b!581794 res!369745) b!581788))

(assert (= (and b!581788 res!369750) b!581793))

(assert (= (and b!581793 res!369751) b!581789))

(assert (= (and b!581789 res!369752) b!581792))

(assert (= (and b!581792 res!369749) b!581786))

(declare-fun m!559789 () Bool)

(assert (=> b!581787 m!559789))

(assert (=> b!581787 m!559789))

(declare-fun m!559791 () Bool)

(assert (=> b!581787 m!559791))

(declare-fun m!559793 () Bool)

(assert (=> b!581793 m!559793))

(declare-fun m!559795 () Bool)

(assert (=> b!581790 m!559795))

(declare-fun m!559797 () Bool)

(assert (=> b!581788 m!559797))

(declare-fun m!559799 () Bool)

(assert (=> b!581794 m!559799))

(declare-fun m!559801 () Bool)

(assert (=> start!53466 m!559801))

(declare-fun m!559803 () Bool)

(assert (=> start!53466 m!559803))

(assert (=> b!581786 m!559789))

(assert (=> b!581786 m!559789))

(declare-fun m!559805 () Bool)

(assert (=> b!581786 m!559805))

(declare-fun m!559807 () Bool)

(assert (=> b!581789 m!559807))

(declare-fun m!559809 () Bool)

(assert (=> b!581792 m!559809))

(declare-fun m!559811 () Bool)

(assert (=> b!581792 m!559811))

(declare-fun m!559813 () Bool)

(assert (=> b!581792 m!559813))

(check-sat (not start!53466) (not b!581793) (not b!581787) (not b!581788) (not b!581786) (not b!581794) (not b!581789) (not b!581790))
(check-sat)
