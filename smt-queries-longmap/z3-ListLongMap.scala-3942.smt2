; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53664 () Bool)

(assert start!53664)

(declare-fun b!584862 () Bool)

(declare-fun res!372683 () Bool)

(declare-fun e!334792 () Bool)

(assert (=> b!584862 (=> (not res!372683) (not e!334792))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36565 0))(
  ( (array!36566 (arr!17557 (Array (_ BitVec 32) (_ BitVec 64))) (size!17921 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36565)

(assert (=> b!584862 (= res!372683 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17557 a!2986) index!984) (select (arr!17557 a!2986) j!136))) (not (= (select (arr!17557 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584863 () Bool)

(declare-fun e!334794 () Bool)

(assert (=> b!584863 (= e!334794 e!334792)))

(declare-fun res!372688 () Bool)

(assert (=> b!584863 (=> (not res!372688) (not e!334792))))

(declare-datatypes ((SeekEntryResult!5997 0))(
  ( (MissingZero!5997 (index!26215 (_ BitVec 32))) (Found!5997 (index!26216 (_ BitVec 32))) (Intermediate!5997 (undefined!6809 Bool) (index!26217 (_ BitVec 32)) (x!55042 (_ BitVec 32))) (Undefined!5997) (MissingVacant!5997 (index!26218 (_ BitVec 32))) )
))
(declare-fun lt!265680 () SeekEntryResult!5997)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584863 (= res!372688 (or (= lt!265680 (MissingZero!5997 i!1108)) (= lt!265680 (MissingVacant!5997 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36565 (_ BitVec 32)) SeekEntryResult!5997)

(assert (=> b!584863 (= lt!265680 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!584864 () Bool)

(declare-fun res!372679 () Bool)

(assert (=> b!584864 (=> (not res!372679) (not e!334792))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!584864 (= res!372679 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17557 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17557 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584865 () Bool)

(declare-fun e!334793 () Bool)

(assert (=> b!584865 (= e!334792 e!334793)))

(declare-fun res!372685 () Bool)

(assert (=> b!584865 (=> (not res!372685) (not e!334793))))

(declare-fun lt!265679 () (_ BitVec 32))

(assert (=> b!584865 (= res!372685 (and (bvsge lt!265679 #b00000000000000000000000000000000) (bvslt lt!265679 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584865 (= lt!265679 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584866 () Bool)

(declare-fun res!372680 () Bool)

(assert (=> b!584866 (=> (not res!372680) (not e!334794))))

(declare-fun arrayContainsKey!0 (array!36565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584866 (= res!372680 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584867 () Bool)

(declare-fun res!372678 () Bool)

(assert (=> b!584867 (=> (not res!372678) (not e!334794))))

(assert (=> b!584867 (= res!372678 (and (= (size!17921 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17921 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17921 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584868 () Bool)

(declare-fun res!372681 () Bool)

(assert (=> b!584868 (=> (not res!372681) (not e!334792))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36565 (_ BitVec 32)) SeekEntryResult!5997)

(assert (=> b!584868 (= res!372681 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17557 a!2986) j!136) a!2986 mask!3053) (Found!5997 j!136)))))

(declare-fun b!584869 () Bool)

(declare-fun res!372689 () Bool)

(assert (=> b!584869 (=> (not res!372689) (not e!334792))))

(declare-datatypes ((List!11598 0))(
  ( (Nil!11595) (Cons!11594 (h!12639 (_ BitVec 64)) (t!17826 List!11598)) )
))
(declare-fun arrayNoDuplicates!0 (array!36565 (_ BitVec 32) List!11598) Bool)

(assert (=> b!584869 (= res!372689 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11595))))

(declare-fun b!584870 () Bool)

(declare-fun res!372682 () Bool)

(assert (=> b!584870 (=> (not res!372682) (not e!334794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584870 (= res!372682 (validKeyInArray!0 (select (arr!17557 a!2986) j!136)))))

(declare-fun res!372684 () Bool)

(assert (=> start!53664 (=> (not res!372684) (not e!334794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53664 (= res!372684 (validMask!0 mask!3053))))

(assert (=> start!53664 e!334794))

(assert (=> start!53664 true))

(declare-fun array_inv!13353 (array!36565) Bool)

(assert (=> start!53664 (array_inv!13353 a!2986)))

(declare-fun b!584871 () Bool)

(assert (=> b!584871 (= e!334793 false)))

(declare-fun lt!265681 () SeekEntryResult!5997)

(assert (=> b!584871 (= lt!265681 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265679 vacantSpotIndex!68 (select (arr!17557 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584872 () Bool)

(declare-fun res!372687 () Bool)

(assert (=> b!584872 (=> (not res!372687) (not e!334792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36565 (_ BitVec 32)) Bool)

(assert (=> b!584872 (= res!372687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!584873 () Bool)

(declare-fun res!372686 () Bool)

(assert (=> b!584873 (=> (not res!372686) (not e!334794))))

(assert (=> b!584873 (= res!372686 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53664 res!372684) b!584867))

(assert (= (and b!584867 res!372678) b!584870))

(assert (= (and b!584870 res!372682) b!584873))

(assert (= (and b!584873 res!372686) b!584866))

(assert (= (and b!584866 res!372680) b!584863))

(assert (= (and b!584863 res!372688) b!584872))

(assert (= (and b!584872 res!372687) b!584869))

(assert (= (and b!584869 res!372689) b!584864))

(assert (= (and b!584864 res!372679) b!584868))

(assert (= (and b!584868 res!372681) b!584862))

(assert (= (and b!584862 res!372683) b!584865))

(assert (= (and b!584865 res!372685) b!584871))

(declare-fun m!563169 () Bool)

(assert (=> start!53664 m!563169))

(declare-fun m!563171 () Bool)

(assert (=> start!53664 m!563171))

(declare-fun m!563173 () Bool)

(assert (=> b!584868 m!563173))

(assert (=> b!584868 m!563173))

(declare-fun m!563175 () Bool)

(assert (=> b!584868 m!563175))

(declare-fun m!563177 () Bool)

(assert (=> b!584864 m!563177))

(declare-fun m!563179 () Bool)

(assert (=> b!584864 m!563179))

(declare-fun m!563181 () Bool)

(assert (=> b!584864 m!563181))

(declare-fun m!563183 () Bool)

(assert (=> b!584873 m!563183))

(declare-fun m!563185 () Bool)

(assert (=> b!584862 m!563185))

(assert (=> b!584862 m!563173))

(declare-fun m!563187 () Bool)

(assert (=> b!584863 m!563187))

(assert (=> b!584871 m!563173))

(assert (=> b!584871 m!563173))

(declare-fun m!563189 () Bool)

(assert (=> b!584871 m!563189))

(declare-fun m!563191 () Bool)

(assert (=> b!584872 m!563191))

(declare-fun m!563193 () Bool)

(assert (=> b!584869 m!563193))

(declare-fun m!563195 () Bool)

(assert (=> b!584866 m!563195))

(declare-fun m!563197 () Bool)

(assert (=> b!584865 m!563197))

(assert (=> b!584870 m!563173))

(assert (=> b!584870 m!563173))

(declare-fun m!563199 () Bool)

(assert (=> b!584870 m!563199))

(check-sat (not b!584866) (not b!584871) (not b!584865) (not b!584863) (not start!53664) (not b!584868) (not b!584869) (not b!584872) (not b!584870) (not b!584873))
(check-sat)
