; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53466 () Bool)

(assert start!53466)

(declare-fun b!581833 () Bool)

(declare-fun res!369654 () Bool)

(declare-fun e!333789 () Bool)

(assert (=> b!581833 (=> (not res!369654) (not e!333789))))

(declare-datatypes ((array!36367 0))(
  ( (array!36368 (arr!17458 (Array (_ BitVec 32) (_ BitVec 64))) (size!17822 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36367)

(declare-datatypes ((List!11499 0))(
  ( (Nil!11496) (Cons!11495 (h!12540 (_ BitVec 64)) (t!17727 List!11499)) )
))
(declare-fun arrayNoDuplicates!0 (array!36367 (_ BitVec 32) List!11499) Bool)

(assert (=> b!581833 (= res!369654 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11496))))

(declare-fun b!581834 () Bool)

(declare-fun e!333787 () Bool)

(assert (=> b!581834 (= e!333787 e!333789)))

(declare-fun res!369656 () Bool)

(assert (=> b!581834 (=> (not res!369656) (not e!333789))))

(declare-datatypes ((SeekEntryResult!5898 0))(
  ( (MissingZero!5898 (index!25819 (_ BitVec 32))) (Found!5898 (index!25820 (_ BitVec 32))) (Intermediate!5898 (undefined!6710 Bool) (index!25821 (_ BitVec 32)) (x!54679 (_ BitVec 32))) (Undefined!5898) (MissingVacant!5898 (index!25822 (_ BitVec 32))) )
))
(declare-fun lt!264985 () SeekEntryResult!5898)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581834 (= res!369656 (or (= lt!264985 (MissingZero!5898 i!1108)) (= lt!264985 (MissingVacant!5898 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36367 (_ BitVec 32)) SeekEntryResult!5898)

(assert (=> b!581834 (= lt!264985 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581835 () Bool)

(declare-fun res!369657 () Bool)

(assert (=> b!581835 (=> (not res!369657) (not e!333787))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581835 (= res!369657 (and (= (size!17822 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17822 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17822 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581836 () Bool)

(declare-fun res!369652 () Bool)

(assert (=> b!581836 (=> (not res!369652) (not e!333787))))

(declare-fun arrayContainsKey!0 (array!36367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581836 (= res!369652 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581837 () Bool)

(declare-fun res!369653 () Bool)

(assert (=> b!581837 (=> (not res!369653) (not e!333789))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36367 (_ BitVec 32)) SeekEntryResult!5898)

(assert (=> b!581837 (= res!369653 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17458 a!2986) j!136) a!2986 mask!3053) (Found!5898 j!136)))))

(declare-fun b!581838 () Bool)

(declare-fun res!369658 () Bool)

(assert (=> b!581838 (=> (not res!369658) (not e!333789))))

(assert (=> b!581838 (= res!369658 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17458 a!2986) index!984) (select (arr!17458 a!2986) j!136)) (= index!984 j!136) (bvsge mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!581839 () Bool)

(declare-fun res!369649 () Bool)

(assert (=> b!581839 (=> (not res!369649) (not e!333789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36367 (_ BitVec 32)) Bool)

(assert (=> b!581839 (= res!369649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369659 () Bool)

(assert (=> start!53466 (=> (not res!369659) (not e!333787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53466 (= res!369659 (validMask!0 mask!3053))))

(assert (=> start!53466 e!333787))

(assert (=> start!53466 true))

(declare-fun array_inv!13254 (array!36367) Bool)

(assert (=> start!53466 (array_inv!13254 a!2986)))

(declare-fun b!581840 () Bool)

(declare-fun res!369650 () Bool)

(assert (=> b!581840 (=> (not res!369650) (not e!333787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581840 (= res!369650 (validKeyInArray!0 k0!1786))))

(declare-fun b!581841 () Bool)

(declare-fun res!369651 () Bool)

(assert (=> b!581841 (=> (not res!369651) (not e!333789))))

(assert (=> b!581841 (= res!369651 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17458 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17458 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581842 () Bool)

(assert (=> b!581842 (= e!333789 (not (validKeyInArray!0 (select (store (arr!17458 a!2986) i!1108 k0!1786) j!136))))))

(declare-fun b!581843 () Bool)

(declare-fun res!369655 () Bool)

(assert (=> b!581843 (=> (not res!369655) (not e!333787))))

(assert (=> b!581843 (= res!369655 (validKeyInArray!0 (select (arr!17458 a!2986) j!136)))))

(assert (= (and start!53466 res!369659) b!581835))

(assert (= (and b!581835 res!369657) b!581843))

(assert (= (and b!581843 res!369655) b!581840))

(assert (= (and b!581840 res!369650) b!581836))

(assert (= (and b!581836 res!369652) b!581834))

(assert (= (and b!581834 res!369656) b!581839))

(assert (= (and b!581839 res!369649) b!581833))

(assert (= (and b!581833 res!369654) b!581841))

(assert (= (and b!581841 res!369651) b!581837))

(assert (= (and b!581837 res!369653) b!581838))

(assert (= (and b!581838 res!369658) b!581842))

(declare-fun m!560355 () Bool)

(assert (=> start!53466 m!560355))

(declare-fun m!560357 () Bool)

(assert (=> start!53466 m!560357))

(declare-fun m!560359 () Bool)

(assert (=> b!581839 m!560359))

(declare-fun m!560361 () Bool)

(assert (=> b!581837 m!560361))

(assert (=> b!581837 m!560361))

(declare-fun m!560363 () Bool)

(assert (=> b!581837 m!560363))

(declare-fun m!560365 () Bool)

(assert (=> b!581842 m!560365))

(declare-fun m!560367 () Bool)

(assert (=> b!581842 m!560367))

(assert (=> b!581842 m!560367))

(declare-fun m!560369 () Bool)

(assert (=> b!581842 m!560369))

(declare-fun m!560371 () Bool)

(assert (=> b!581836 m!560371))

(declare-fun m!560373 () Bool)

(assert (=> b!581833 m!560373))

(declare-fun m!560375 () Bool)

(assert (=> b!581838 m!560375))

(assert (=> b!581838 m!560361))

(declare-fun m!560377 () Bool)

(assert (=> b!581834 m!560377))

(assert (=> b!581843 m!560361))

(assert (=> b!581843 m!560361))

(declare-fun m!560379 () Bool)

(assert (=> b!581843 m!560379))

(declare-fun m!560381 () Bool)

(assert (=> b!581840 m!560381))

(declare-fun m!560383 () Bool)

(assert (=> b!581841 m!560383))

(assert (=> b!581841 m!560365))

(declare-fun m!560385 () Bool)

(assert (=> b!581841 m!560385))

(check-sat (not b!581834) (not b!581836) (not b!581839) (not start!53466) (not b!581843) (not b!581840) (not b!581833) (not b!581837) (not b!581842))
(check-sat)
