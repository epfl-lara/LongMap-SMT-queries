; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53394 () Bool)

(assert start!53394)

(declare-fun b!580787 () Bool)

(declare-fun res!368747 () Bool)

(declare-fun e!333363 () Bool)

(assert (=> b!580787 (=> (not res!368747) (not e!333363))))

(declare-datatypes ((array!36309 0))(
  ( (array!36310 (arr!17429 (Array (_ BitVec 32) (_ BitVec 64))) (size!17794 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36309)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580787 (= res!368747 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580788 () Bool)

(declare-fun res!368751 () Bool)

(declare-fun e!333361 () Bool)

(assert (=> b!580788 (=> (not res!368751) (not e!333361))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580788 (= res!368751 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17429 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17429 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580789 () Bool)

(declare-fun res!368746 () Bool)

(assert (=> b!580789 (=> (not res!368746) (not e!333363))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580789 (= res!368746 (validKeyInArray!0 (select (arr!17429 a!2986) j!136)))))

(declare-fun b!580790 () Bool)

(assert (=> b!580790 (= e!333363 e!333361)))

(declare-fun res!368753 () Bool)

(assert (=> b!580790 (=> (not res!368753) (not e!333361))))

(declare-datatypes ((SeekEntryResult!5866 0))(
  ( (MissingZero!5866 (index!25691 (_ BitVec 32))) (Found!5866 (index!25692 (_ BitVec 32))) (Intermediate!5866 (undefined!6678 Bool) (index!25693 (_ BitVec 32)) (x!54570 (_ BitVec 32))) (Undefined!5866) (MissingVacant!5866 (index!25694 (_ BitVec 32))) )
))
(declare-fun lt!264598 () SeekEntryResult!5866)

(assert (=> b!580790 (= res!368753 (or (= lt!264598 (MissingZero!5866 i!1108)) (= lt!264598 (MissingVacant!5866 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36309 (_ BitVec 32)) SeekEntryResult!5866)

(assert (=> b!580790 (= lt!264598 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580791 () Bool)

(declare-fun res!368750 () Bool)

(assert (=> b!580791 (=> (not res!368750) (not e!333363))))

(assert (=> b!580791 (= res!368750 (and (= (size!17794 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17794 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17794 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580792 () Bool)

(assert (=> b!580792 (= e!333361 false)))

(declare-fun lt!264597 () SeekEntryResult!5866)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36309 (_ BitVec 32)) SeekEntryResult!5866)

(assert (=> b!580792 (= lt!264597 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17429 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580793 () Bool)

(declare-fun res!368749 () Bool)

(assert (=> b!580793 (=> (not res!368749) (not e!333361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36309 (_ BitVec 32)) Bool)

(assert (=> b!580793 (= res!368749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!368745 () Bool)

(assert (=> start!53394 (=> (not res!368745) (not e!333363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53394 (= res!368745 (validMask!0 mask!3053))))

(assert (=> start!53394 e!333363))

(assert (=> start!53394 true))

(declare-fun array_inv!13312 (array!36309) Bool)

(assert (=> start!53394 (array_inv!13312 a!2986)))

(declare-fun b!580794 () Bool)

(declare-fun res!368752 () Bool)

(assert (=> b!580794 (=> (not res!368752) (not e!333361))))

(declare-datatypes ((List!11509 0))(
  ( (Nil!11506) (Cons!11505 (h!12550 (_ BitVec 64)) (t!17728 List!11509)) )
))
(declare-fun arrayNoDuplicates!0 (array!36309 (_ BitVec 32) List!11509) Bool)

(assert (=> b!580794 (= res!368752 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11506))))

(declare-fun b!580795 () Bool)

(declare-fun res!368748 () Bool)

(assert (=> b!580795 (=> (not res!368748) (not e!333363))))

(assert (=> b!580795 (= res!368748 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53394 res!368745) b!580791))

(assert (= (and b!580791 res!368750) b!580789))

(assert (= (and b!580789 res!368746) b!580795))

(assert (= (and b!580795 res!368748) b!580787))

(assert (= (and b!580787 res!368747) b!580790))

(assert (= (and b!580790 res!368753) b!580793))

(assert (= (and b!580793 res!368749) b!580794))

(assert (= (and b!580794 res!368752) b!580788))

(assert (= (and b!580788 res!368751) b!580792))

(declare-fun m!558829 () Bool)

(assert (=> b!580792 m!558829))

(assert (=> b!580792 m!558829))

(declare-fun m!558831 () Bool)

(assert (=> b!580792 m!558831))

(declare-fun m!558833 () Bool)

(assert (=> start!53394 m!558833))

(declare-fun m!558835 () Bool)

(assert (=> start!53394 m!558835))

(assert (=> b!580789 m!558829))

(assert (=> b!580789 m!558829))

(declare-fun m!558837 () Bool)

(assert (=> b!580789 m!558837))

(declare-fun m!558839 () Bool)

(assert (=> b!580794 m!558839))

(declare-fun m!558841 () Bool)

(assert (=> b!580790 m!558841))

(declare-fun m!558843 () Bool)

(assert (=> b!580795 m!558843))

(declare-fun m!558845 () Bool)

(assert (=> b!580793 m!558845))

(declare-fun m!558847 () Bool)

(assert (=> b!580788 m!558847))

(declare-fun m!558849 () Bool)

(assert (=> b!580788 m!558849))

(declare-fun m!558851 () Bool)

(assert (=> b!580788 m!558851))

(declare-fun m!558853 () Bool)

(assert (=> b!580787 m!558853))

(check-sat (not b!580792) (not start!53394) (not b!580787) (not b!580793) (not b!580794) (not b!580795) (not b!580789) (not b!580790))
(check-sat)
