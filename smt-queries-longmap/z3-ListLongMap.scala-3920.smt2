; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53580 () Bool)

(assert start!53580)

(declare-fun b!582905 () Bool)

(declare-fun res!370618 () Bool)

(declare-fun e!334205 () Bool)

(assert (=> b!582905 (=> (not res!370618) (not e!334205))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582905 (= res!370618 (validKeyInArray!0 k0!1786))))

(declare-fun b!582906 () Bool)

(declare-fun res!370620 () Bool)

(assert (=> b!582906 (=> (not res!370620) (not e!334205))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36426 0))(
  ( (array!36427 (arr!17485 (Array (_ BitVec 32) (_ BitVec 64))) (size!17849 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36426)

(assert (=> b!582906 (= res!370620 (and (= (size!17849 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17849 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17849 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582907 () Bool)

(declare-fun e!334206 () Bool)

(assert (=> b!582907 (= e!334206 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5881 0))(
  ( (MissingZero!5881 (index!25751 (_ BitVec 32))) (Found!5881 (index!25752 (_ BitVec 32))) (Intermediate!5881 (undefined!6693 Bool) (index!25753 (_ BitVec 32)) (x!54753 (_ BitVec 32))) (Undefined!5881) (MissingVacant!5881 (index!25754 (_ BitVec 32))) )
))
(declare-fun lt!265285 () SeekEntryResult!5881)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36426 (_ BitVec 32)) SeekEntryResult!5881)

(assert (=> b!582907 (= lt!265285 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17485 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582908 () Bool)

(assert (=> b!582908 (= e!334205 e!334206)))

(declare-fun res!370617 () Bool)

(assert (=> b!582908 (=> (not res!370617) (not e!334206))))

(declare-fun lt!265284 () SeekEntryResult!5881)

(assert (=> b!582908 (= res!370617 (or (= lt!265284 (MissingZero!5881 i!1108)) (= lt!265284 (MissingVacant!5881 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36426 (_ BitVec 32)) SeekEntryResult!5881)

(assert (=> b!582908 (= lt!265284 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582909 () Bool)

(declare-fun res!370623 () Bool)

(assert (=> b!582909 (=> (not res!370623) (not e!334206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36426 (_ BitVec 32)) Bool)

(assert (=> b!582909 (= res!370623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582910 () Bool)

(declare-fun res!370616 () Bool)

(assert (=> b!582910 (=> (not res!370616) (not e!334206))))

(assert (=> b!582910 (= res!370616 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17485 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17485 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582911 () Bool)

(declare-fun res!370624 () Bool)

(assert (=> b!582911 (=> (not res!370624) (not e!334206))))

(declare-datatypes ((List!11433 0))(
  ( (Nil!11430) (Cons!11429 (h!12477 (_ BitVec 64)) (t!17653 List!11433)) )
))
(declare-fun arrayNoDuplicates!0 (array!36426 (_ BitVec 32) List!11433) Bool)

(assert (=> b!582911 (= res!370624 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11430))))

(declare-fun res!370621 () Bool)

(assert (=> start!53580 (=> (not res!370621) (not e!334205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53580 (= res!370621 (validMask!0 mask!3053))))

(assert (=> start!53580 e!334205))

(assert (=> start!53580 true))

(declare-fun array_inv!13344 (array!36426) Bool)

(assert (=> start!53580 (array_inv!13344 a!2986)))

(declare-fun b!582912 () Bool)

(declare-fun res!370619 () Bool)

(assert (=> b!582912 (=> (not res!370619) (not e!334205))))

(assert (=> b!582912 (= res!370619 (validKeyInArray!0 (select (arr!17485 a!2986) j!136)))))

(declare-fun b!582913 () Bool)

(declare-fun res!370622 () Bool)

(assert (=> b!582913 (=> (not res!370622) (not e!334205))))

(declare-fun arrayContainsKey!0 (array!36426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582913 (= res!370622 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53580 res!370621) b!582906))

(assert (= (and b!582906 res!370620) b!582912))

(assert (= (and b!582912 res!370619) b!582905))

(assert (= (and b!582905 res!370618) b!582913))

(assert (= (and b!582913 res!370622) b!582908))

(assert (= (and b!582908 res!370617) b!582909))

(assert (= (and b!582909 res!370623) b!582911))

(assert (= (and b!582911 res!370624) b!582910))

(assert (= (and b!582910 res!370616) b!582907))

(declare-fun m!561551 () Bool)

(assert (=> b!582911 m!561551))

(declare-fun m!561553 () Bool)

(assert (=> b!582912 m!561553))

(assert (=> b!582912 m!561553))

(declare-fun m!561555 () Bool)

(assert (=> b!582912 m!561555))

(declare-fun m!561557 () Bool)

(assert (=> start!53580 m!561557))

(declare-fun m!561559 () Bool)

(assert (=> start!53580 m!561559))

(declare-fun m!561561 () Bool)

(assert (=> b!582909 m!561561))

(assert (=> b!582907 m!561553))

(assert (=> b!582907 m!561553))

(declare-fun m!561563 () Bool)

(assert (=> b!582907 m!561563))

(declare-fun m!561565 () Bool)

(assert (=> b!582913 m!561565))

(declare-fun m!561567 () Bool)

(assert (=> b!582910 m!561567))

(declare-fun m!561569 () Bool)

(assert (=> b!582910 m!561569))

(declare-fun m!561571 () Bool)

(assert (=> b!582910 m!561571))

(declare-fun m!561573 () Bool)

(assert (=> b!582905 m!561573))

(declare-fun m!561575 () Bool)

(assert (=> b!582908 m!561575))

(check-sat (not start!53580) (not b!582905) (not b!582908) (not b!582911) (not b!582912) (not b!582913) (not b!582909) (not b!582907))
(check-sat)
