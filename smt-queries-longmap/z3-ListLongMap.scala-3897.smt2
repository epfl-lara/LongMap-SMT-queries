; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53442 () Bool)

(assert start!53442)

(declare-fun b!581015 () Bool)

(declare-fun res!368732 () Bool)

(declare-fun e!333585 () Bool)

(assert (=> b!581015 (=> (not res!368732) (not e!333585))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36288 0))(
  ( (array!36289 (arr!17416 (Array (_ BitVec 32) (_ BitVec 64))) (size!17780 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36288)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581015 (= res!368732 (and (= (size!17780 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17780 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17780 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581016 () Bool)

(declare-fun res!368729 () Bool)

(declare-fun e!333584 () Bool)

(assert (=> b!581016 (=> (not res!368729) (not e!333584))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581016 (= res!368729 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17416 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17416 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368726 () Bool)

(assert (=> start!53442 (=> (not res!368726) (not e!333585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53442 (= res!368726 (validMask!0 mask!3053))))

(assert (=> start!53442 e!333585))

(assert (=> start!53442 true))

(declare-fun array_inv!13275 (array!36288) Bool)

(assert (=> start!53442 (array_inv!13275 a!2986)))

(declare-fun b!581017 () Bool)

(declare-fun res!368734 () Bool)

(assert (=> b!581017 (=> (not res!368734) (not e!333585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581017 (= res!368734 (validKeyInArray!0 (select (arr!17416 a!2986) j!136)))))

(declare-fun b!581018 () Bool)

(declare-fun res!368728 () Bool)

(assert (=> b!581018 (=> (not res!368728) (not e!333585))))

(declare-fun arrayContainsKey!0 (array!36288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581018 (= res!368728 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581019 () Bool)

(declare-fun res!368733 () Bool)

(assert (=> b!581019 (=> (not res!368733) (not e!333584))))

(declare-datatypes ((List!11364 0))(
  ( (Nil!11361) (Cons!11360 (h!12408 (_ BitVec 64)) (t!17584 List!11364)) )
))
(declare-fun arrayNoDuplicates!0 (array!36288 (_ BitVec 32) List!11364) Bool)

(assert (=> b!581019 (= res!368733 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11361))))

(declare-fun b!581020 () Bool)

(assert (=> b!581020 (= e!333585 e!333584)))

(declare-fun res!368730 () Bool)

(assert (=> b!581020 (=> (not res!368730) (not e!333584))))

(declare-datatypes ((SeekEntryResult!5812 0))(
  ( (MissingZero!5812 (index!25475 (_ BitVec 32))) (Found!5812 (index!25476 (_ BitVec 32))) (Intermediate!5812 (undefined!6624 Bool) (index!25477 (_ BitVec 32)) (x!54500 (_ BitVec 32))) (Undefined!5812) (MissingVacant!5812 (index!25478 (_ BitVec 32))) )
))
(declare-fun lt!264888 () SeekEntryResult!5812)

(assert (=> b!581020 (= res!368730 (or (= lt!264888 (MissingZero!5812 i!1108)) (= lt!264888 (MissingVacant!5812 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36288 (_ BitVec 32)) SeekEntryResult!5812)

(assert (=> b!581020 (= lt!264888 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581021 () Bool)

(declare-fun res!368731 () Bool)

(assert (=> b!581021 (=> (not res!368731) (not e!333584))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36288 (_ BitVec 32)) Bool)

(assert (=> b!581021 (= res!368731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581022 () Bool)

(declare-fun res!368727 () Bool)

(assert (=> b!581022 (=> (not res!368727) (not e!333585))))

(assert (=> b!581022 (= res!368727 (validKeyInArray!0 k0!1786))))

(declare-fun b!581023 () Bool)

(assert (=> b!581023 (= e!333584 false)))

(declare-fun lt!264889 () SeekEntryResult!5812)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36288 (_ BitVec 32)) SeekEntryResult!5812)

(assert (=> b!581023 (= lt!264889 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17416 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53442 res!368726) b!581015))

(assert (= (and b!581015 res!368732) b!581017))

(assert (= (and b!581017 res!368734) b!581022))

(assert (= (and b!581022 res!368727) b!581018))

(assert (= (and b!581018 res!368728) b!581020))

(assert (= (and b!581020 res!368730) b!581021))

(assert (= (and b!581021 res!368731) b!581019))

(assert (= (and b!581019 res!368733) b!581016))

(assert (= (and b!581016 res!368729) b!581023))

(declare-fun m!559733 () Bool)

(assert (=> b!581019 m!559733))

(declare-fun m!559735 () Bool)

(assert (=> b!581022 m!559735))

(declare-fun m!559737 () Bool)

(assert (=> b!581021 m!559737))

(declare-fun m!559739 () Bool)

(assert (=> b!581020 m!559739))

(declare-fun m!559741 () Bool)

(assert (=> b!581018 m!559741))

(declare-fun m!559743 () Bool)

(assert (=> b!581016 m!559743))

(declare-fun m!559745 () Bool)

(assert (=> b!581016 m!559745))

(declare-fun m!559747 () Bool)

(assert (=> b!581016 m!559747))

(declare-fun m!559749 () Bool)

(assert (=> b!581017 m!559749))

(assert (=> b!581017 m!559749))

(declare-fun m!559751 () Bool)

(assert (=> b!581017 m!559751))

(assert (=> b!581023 m!559749))

(assert (=> b!581023 m!559749))

(declare-fun m!559753 () Bool)

(assert (=> b!581023 m!559753))

(declare-fun m!559755 () Bool)

(assert (=> start!53442 m!559755))

(declare-fun m!559757 () Bool)

(assert (=> start!53442 m!559757))

(check-sat (not b!581020) (not b!581017) (not b!581021) (not b!581023) (not b!581018) (not b!581019) (not start!53442) (not b!581022))
(check-sat)
