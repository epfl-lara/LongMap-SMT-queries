; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53316 () Bool)

(assert start!53316)

(declare-fun b!579725 () Bool)

(declare-fun e!333010 () Bool)

(assert (=> b!579725 (= e!333010 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5827 0))(
  ( (MissingZero!5827 (index!25535 (_ BitVec 32))) (Found!5827 (index!25536 (_ BitVec 32))) (Intermediate!5827 (undefined!6639 Bool) (index!25537 (_ BitVec 32)) (x!54427 (_ BitVec 32))) (Undefined!5827) (MissingVacant!5827 (index!25538 (_ BitVec 32))) )
))
(declare-fun lt!264372 () SeekEntryResult!5827)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36231 0))(
  ( (array!36232 (arr!17390 (Array (_ BitVec 32) (_ BitVec 64))) (size!17755 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36231)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36231 (_ BitVec 32)) SeekEntryResult!5827)

(assert (=> b!579725 (= lt!264372 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17390 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579726 () Bool)

(declare-fun res!367685 () Bool)

(assert (=> b!579726 (=> (not res!367685) (not e!333010))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!579726 (= res!367685 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17390 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17390 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579727 () Bool)

(declare-fun res!367689 () Bool)

(assert (=> b!579727 (=> (not res!367689) (not e!333010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36231 (_ BitVec 32)) Bool)

(assert (=> b!579727 (= res!367689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579728 () Bool)

(declare-fun res!367691 () Bool)

(declare-fun e!333012 () Bool)

(assert (=> b!579728 (=> (not res!367691) (not e!333012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579728 (= res!367691 (validKeyInArray!0 k0!1786))))

(declare-fun res!367687 () Bool)

(assert (=> start!53316 (=> (not res!367687) (not e!333012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53316 (= res!367687 (validMask!0 mask!3053))))

(assert (=> start!53316 e!333012))

(assert (=> start!53316 true))

(declare-fun array_inv!13273 (array!36231) Bool)

(assert (=> start!53316 (array_inv!13273 a!2986)))

(declare-fun b!579729 () Bool)

(declare-fun res!367684 () Bool)

(assert (=> b!579729 (=> (not res!367684) (not e!333010))))

(declare-datatypes ((List!11470 0))(
  ( (Nil!11467) (Cons!11466 (h!12511 (_ BitVec 64)) (t!17689 List!11470)) )
))
(declare-fun arrayNoDuplicates!0 (array!36231 (_ BitVec 32) List!11470) Bool)

(assert (=> b!579729 (= res!367684 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11467))))

(declare-fun b!579730 () Bool)

(declare-fun res!367690 () Bool)

(assert (=> b!579730 (=> (not res!367690) (not e!333012))))

(assert (=> b!579730 (= res!367690 (validKeyInArray!0 (select (arr!17390 a!2986) j!136)))))

(declare-fun b!579731 () Bool)

(declare-fun res!367688 () Bool)

(assert (=> b!579731 (=> (not res!367688) (not e!333012))))

(declare-fun arrayContainsKey!0 (array!36231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579731 (= res!367688 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579732 () Bool)

(declare-fun res!367686 () Bool)

(assert (=> b!579732 (=> (not res!367686) (not e!333012))))

(assert (=> b!579732 (= res!367686 (and (= (size!17755 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17755 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17755 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579733 () Bool)

(assert (=> b!579733 (= e!333012 e!333010)))

(declare-fun res!367683 () Bool)

(assert (=> b!579733 (=> (not res!367683) (not e!333010))))

(declare-fun lt!264373 () SeekEntryResult!5827)

(assert (=> b!579733 (= res!367683 (or (= lt!264373 (MissingZero!5827 i!1108)) (= lt!264373 (MissingVacant!5827 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36231 (_ BitVec 32)) SeekEntryResult!5827)

(assert (=> b!579733 (= lt!264373 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53316 res!367687) b!579732))

(assert (= (and b!579732 res!367686) b!579730))

(assert (= (and b!579730 res!367690) b!579728))

(assert (= (and b!579728 res!367691) b!579731))

(assert (= (and b!579731 res!367688) b!579733))

(assert (= (and b!579733 res!367683) b!579727))

(assert (= (and b!579727 res!367689) b!579729))

(assert (= (and b!579729 res!367684) b!579726))

(assert (= (and b!579726 res!367685) b!579725))

(declare-fun m!557809 () Bool)

(assert (=> b!579733 m!557809))

(declare-fun m!557811 () Bool)

(assert (=> b!579729 m!557811))

(declare-fun m!557813 () Bool)

(assert (=> b!579725 m!557813))

(assert (=> b!579725 m!557813))

(declare-fun m!557815 () Bool)

(assert (=> b!579725 m!557815))

(assert (=> b!579730 m!557813))

(assert (=> b!579730 m!557813))

(declare-fun m!557817 () Bool)

(assert (=> b!579730 m!557817))

(declare-fun m!557819 () Bool)

(assert (=> b!579731 m!557819))

(declare-fun m!557821 () Bool)

(assert (=> start!53316 m!557821))

(declare-fun m!557823 () Bool)

(assert (=> start!53316 m!557823))

(declare-fun m!557825 () Bool)

(assert (=> b!579726 m!557825))

(declare-fun m!557827 () Bool)

(assert (=> b!579726 m!557827))

(declare-fun m!557829 () Bool)

(assert (=> b!579726 m!557829))

(declare-fun m!557831 () Bool)

(assert (=> b!579727 m!557831))

(declare-fun m!557833 () Bool)

(assert (=> b!579728 m!557833))

(check-sat (not b!579731) (not b!579727) (not b!579730) (not b!579728) (not b!579725) (not b!579729) (not start!53316) (not b!579733))
(check-sat)
