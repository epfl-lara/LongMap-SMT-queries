; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53400 () Bool)

(assert start!53400)

(declare-fun b!580868 () Bool)

(declare-fun res!368829 () Bool)

(declare-fun e!333390 () Bool)

(assert (=> b!580868 (=> (not res!368829) (not e!333390))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36315 0))(
  ( (array!36316 (arr!17432 (Array (_ BitVec 32) (_ BitVec 64))) (size!17797 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36315)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580868 (= res!368829 (and (= (size!17797 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17797 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17797 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580869 () Bool)

(declare-fun res!368826 () Bool)

(declare-fun e!333388 () Bool)

(assert (=> b!580869 (=> (not res!368826) (not e!333388))))

(declare-datatypes ((List!11512 0))(
  ( (Nil!11509) (Cons!11508 (h!12553 (_ BitVec 64)) (t!17731 List!11512)) )
))
(declare-fun arrayNoDuplicates!0 (array!36315 (_ BitVec 32) List!11512) Bool)

(assert (=> b!580869 (= res!368826 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11509))))

(declare-fun b!580870 () Bool)

(declare-fun res!368828 () Bool)

(assert (=> b!580870 (=> (not res!368828) (not e!333390))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580870 (= res!368828 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!368831 () Bool)

(assert (=> start!53400 (=> (not res!368831) (not e!333390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53400 (= res!368831 (validMask!0 mask!3053))))

(assert (=> start!53400 e!333390))

(assert (=> start!53400 true))

(declare-fun array_inv!13315 (array!36315) Bool)

(assert (=> start!53400 (array_inv!13315 a!2986)))

(declare-fun b!580871 () Bool)

(declare-fun res!368832 () Bool)

(assert (=> b!580871 (=> (not res!368832) (not e!333390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580871 (= res!368832 (validKeyInArray!0 (select (arr!17432 a!2986) j!136)))))

(declare-fun b!580872 () Bool)

(declare-fun res!368830 () Bool)

(assert (=> b!580872 (=> (not res!368830) (not e!333390))))

(assert (=> b!580872 (= res!368830 (validKeyInArray!0 k0!1786))))

(declare-fun b!580873 () Bool)

(declare-fun res!368834 () Bool)

(assert (=> b!580873 (=> (not res!368834) (not e!333388))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580873 (= res!368834 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17432 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17432 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580874 () Bool)

(assert (=> b!580874 (= e!333388 false)))

(declare-datatypes ((SeekEntryResult!5869 0))(
  ( (MissingZero!5869 (index!25703 (_ BitVec 32))) (Found!5869 (index!25704 (_ BitVec 32))) (Intermediate!5869 (undefined!6681 Bool) (index!25705 (_ BitVec 32)) (x!54581 (_ BitVec 32))) (Undefined!5869) (MissingVacant!5869 (index!25706 (_ BitVec 32))) )
))
(declare-fun lt!264616 () SeekEntryResult!5869)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36315 (_ BitVec 32)) SeekEntryResult!5869)

(assert (=> b!580874 (= lt!264616 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17432 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580875 () Bool)

(declare-fun res!368827 () Bool)

(assert (=> b!580875 (=> (not res!368827) (not e!333388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36315 (_ BitVec 32)) Bool)

(assert (=> b!580875 (= res!368827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580876 () Bool)

(assert (=> b!580876 (= e!333390 e!333388)))

(declare-fun res!368833 () Bool)

(assert (=> b!580876 (=> (not res!368833) (not e!333388))))

(declare-fun lt!264615 () SeekEntryResult!5869)

(assert (=> b!580876 (= res!368833 (or (= lt!264615 (MissingZero!5869 i!1108)) (= lt!264615 (MissingVacant!5869 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36315 (_ BitVec 32)) SeekEntryResult!5869)

(assert (=> b!580876 (= lt!264615 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53400 res!368831) b!580868))

(assert (= (and b!580868 res!368829) b!580871))

(assert (= (and b!580871 res!368832) b!580872))

(assert (= (and b!580872 res!368830) b!580870))

(assert (= (and b!580870 res!368828) b!580876))

(assert (= (and b!580876 res!368833) b!580875))

(assert (= (and b!580875 res!368827) b!580869))

(assert (= (and b!580869 res!368826) b!580873))

(assert (= (and b!580873 res!368834) b!580874))

(declare-fun m!558907 () Bool)

(assert (=> b!580871 m!558907))

(assert (=> b!580871 m!558907))

(declare-fun m!558909 () Bool)

(assert (=> b!580871 m!558909))

(declare-fun m!558911 () Bool)

(assert (=> b!580869 m!558911))

(declare-fun m!558913 () Bool)

(assert (=> b!580870 m!558913))

(assert (=> b!580874 m!558907))

(assert (=> b!580874 m!558907))

(declare-fun m!558915 () Bool)

(assert (=> b!580874 m!558915))

(declare-fun m!558917 () Bool)

(assert (=> b!580873 m!558917))

(declare-fun m!558919 () Bool)

(assert (=> b!580873 m!558919))

(declare-fun m!558921 () Bool)

(assert (=> b!580873 m!558921))

(declare-fun m!558923 () Bool)

(assert (=> b!580875 m!558923))

(declare-fun m!558925 () Bool)

(assert (=> b!580876 m!558925))

(declare-fun m!558927 () Bool)

(assert (=> start!53400 m!558927))

(declare-fun m!558929 () Bool)

(assert (=> start!53400 m!558929))

(declare-fun m!558931 () Bool)

(assert (=> b!580872 m!558931))

(check-sat (not b!580869) (not b!580874) (not b!580870) (not b!580876) (not b!580875) (not b!580872) (not b!580871) (not start!53400))
(check-sat)
