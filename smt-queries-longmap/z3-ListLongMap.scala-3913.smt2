; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53472 () Bool)

(assert start!53472)

(declare-fun b!581867 () Bool)

(declare-fun res!369825 () Bool)

(declare-fun e!333713 () Bool)

(assert (=> b!581867 (=> (not res!369825) (not e!333713))))

(declare-datatypes ((array!36387 0))(
  ( (array!36388 (arr!17468 (Array (_ BitVec 32) (_ BitVec 64))) (size!17833 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36387)

(declare-datatypes ((List!11548 0))(
  ( (Nil!11545) (Cons!11544 (h!12589 (_ BitVec 64)) (t!17767 List!11548)) )
))
(declare-fun arrayNoDuplicates!0 (array!36387 (_ BitVec 32) List!11548) Bool)

(assert (=> b!581867 (= res!369825 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11545))))

(declare-fun b!581868 () Bool)

(declare-fun res!369827 () Bool)

(declare-fun e!333714 () Bool)

(assert (=> b!581868 (=> (not res!369827) (not e!333714))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581868 (= res!369827 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581869 () Bool)

(declare-fun res!369833 () Bool)

(assert (=> b!581869 (=> (not res!369833) (not e!333714))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581869 (= res!369833 (and (= (size!17833 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17833 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17833 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581870 () Bool)

(declare-fun res!369832 () Bool)

(assert (=> b!581870 (=> (not res!369832) (not e!333713))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581870 (= res!369832 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17468 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17468 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581871 () Bool)

(assert (=> b!581871 (= e!333713 false)))

(declare-datatypes ((SeekEntryResult!5905 0))(
  ( (MissingZero!5905 (index!25847 (_ BitVec 32))) (Found!5905 (index!25848 (_ BitVec 32))) (Intermediate!5905 (undefined!6717 Bool) (index!25849 (_ BitVec 32)) (x!54713 (_ BitVec 32))) (Undefined!5905) (MissingVacant!5905 (index!25850 (_ BitVec 32))) )
))
(declare-fun lt!264813 () SeekEntryResult!5905)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36387 (_ BitVec 32)) SeekEntryResult!5905)

(assert (=> b!581871 (= lt!264813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17468 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581872 () Bool)

(declare-fun res!369826 () Bool)

(assert (=> b!581872 (=> (not res!369826) (not e!333714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581872 (= res!369826 (validKeyInArray!0 (select (arr!17468 a!2986) j!136)))))

(declare-fun b!581873 () Bool)

(assert (=> b!581873 (= e!333714 e!333713)))

(declare-fun res!369830 () Bool)

(assert (=> b!581873 (=> (not res!369830) (not e!333713))))

(declare-fun lt!264814 () SeekEntryResult!5905)

(assert (=> b!581873 (= res!369830 (or (= lt!264814 (MissingZero!5905 i!1108)) (= lt!264814 (MissingVacant!5905 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36387 (_ BitVec 32)) SeekEntryResult!5905)

(assert (=> b!581873 (= lt!264814 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581874 () Bool)

(declare-fun res!369831 () Bool)

(assert (=> b!581874 (=> (not res!369831) (not e!333714))))

(assert (=> b!581874 (= res!369831 (validKeyInArray!0 k0!1786))))

(declare-fun res!369828 () Bool)

(assert (=> start!53472 (=> (not res!369828) (not e!333714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53472 (= res!369828 (validMask!0 mask!3053))))

(assert (=> start!53472 e!333714))

(assert (=> start!53472 true))

(declare-fun array_inv!13351 (array!36387) Bool)

(assert (=> start!53472 (array_inv!13351 a!2986)))

(declare-fun b!581875 () Bool)

(declare-fun res!369829 () Bool)

(assert (=> b!581875 (=> (not res!369829) (not e!333713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36387 (_ BitVec 32)) Bool)

(assert (=> b!581875 (= res!369829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53472 res!369828) b!581869))

(assert (= (and b!581869 res!369833) b!581872))

(assert (= (and b!581872 res!369826) b!581874))

(assert (= (and b!581874 res!369831) b!581868))

(assert (= (and b!581868 res!369827) b!581873))

(assert (= (and b!581873 res!369830) b!581875))

(assert (= (and b!581875 res!369829) b!581867))

(assert (= (and b!581867 res!369825) b!581870))

(assert (= (and b!581870 res!369832) b!581871))

(declare-fun m!559867 () Bool)

(assert (=> b!581874 m!559867))

(declare-fun m!559869 () Bool)

(assert (=> b!581867 m!559869))

(declare-fun m!559871 () Bool)

(assert (=> b!581873 m!559871))

(declare-fun m!559873 () Bool)

(assert (=> start!53472 m!559873))

(declare-fun m!559875 () Bool)

(assert (=> start!53472 m!559875))

(declare-fun m!559877 () Bool)

(assert (=> b!581868 m!559877))

(declare-fun m!559879 () Bool)

(assert (=> b!581872 m!559879))

(assert (=> b!581872 m!559879))

(declare-fun m!559881 () Bool)

(assert (=> b!581872 m!559881))

(declare-fun m!559883 () Bool)

(assert (=> b!581870 m!559883))

(declare-fun m!559885 () Bool)

(assert (=> b!581870 m!559885))

(declare-fun m!559887 () Bool)

(assert (=> b!581870 m!559887))

(assert (=> b!581871 m!559879))

(assert (=> b!581871 m!559879))

(declare-fun m!559889 () Bool)

(assert (=> b!581871 m!559889))

(declare-fun m!559891 () Bool)

(assert (=> b!581875 m!559891))

(check-sat (not b!581868) (not b!581874) (not b!581867) (not b!581875) (not b!581871) (not b!581873) (not b!581872) (not start!53472))
(check-sat)
