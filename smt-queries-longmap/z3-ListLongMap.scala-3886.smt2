; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53310 () Bool)

(assert start!53310)

(declare-fun b!579644 () Bool)

(declare-fun res!367605 () Bool)

(declare-fun e!332984 () Bool)

(assert (=> b!579644 (=> (not res!367605) (not e!332984))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36225 0))(
  ( (array!36226 (arr!17387 (Array (_ BitVec 32) (_ BitVec 64))) (size!17752 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36225)

(assert (=> b!579644 (= res!367605 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17387 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17387 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!367608 () Bool)

(declare-fun e!332985 () Bool)

(assert (=> start!53310 (=> (not res!367608) (not e!332985))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53310 (= res!367608 (validMask!0 mask!3053))))

(assert (=> start!53310 e!332985))

(assert (=> start!53310 true))

(declare-fun array_inv!13270 (array!36225) Bool)

(assert (=> start!53310 (array_inv!13270 a!2986)))

(declare-fun b!579645 () Bool)

(declare-fun res!367604 () Bool)

(assert (=> b!579645 (=> (not res!367604) (not e!332984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36225 (_ BitVec 32)) Bool)

(assert (=> b!579645 (= res!367604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579646 () Bool)

(assert (=> b!579646 (= e!332984 false)))

(declare-datatypes ((SeekEntryResult!5824 0))(
  ( (MissingZero!5824 (index!25523 (_ BitVec 32))) (Found!5824 (index!25524 (_ BitVec 32))) (Intermediate!5824 (undefined!6636 Bool) (index!25525 (_ BitVec 32)) (x!54416 (_ BitVec 32))) (Undefined!5824) (MissingVacant!5824 (index!25526 (_ BitVec 32))) )
))
(declare-fun lt!264354 () SeekEntryResult!5824)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36225 (_ BitVec 32)) SeekEntryResult!5824)

(assert (=> b!579646 (= lt!264354 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17387 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579647 () Bool)

(declare-fun res!367609 () Bool)

(assert (=> b!579647 (=> (not res!367609) (not e!332985))))

(declare-fun arrayContainsKey!0 (array!36225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579647 (= res!367609 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579648 () Bool)

(declare-fun res!367602 () Bool)

(assert (=> b!579648 (=> (not res!367602) (not e!332985))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579648 (= res!367602 (validKeyInArray!0 k0!1786))))

(declare-fun b!579649 () Bool)

(declare-fun res!367606 () Bool)

(assert (=> b!579649 (=> (not res!367606) (not e!332985))))

(assert (=> b!579649 (= res!367606 (and (= (size!17752 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17752 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17752 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579650 () Bool)

(declare-fun res!367610 () Bool)

(assert (=> b!579650 (=> (not res!367610) (not e!332985))))

(assert (=> b!579650 (= res!367610 (validKeyInArray!0 (select (arr!17387 a!2986) j!136)))))

(declare-fun b!579651 () Bool)

(assert (=> b!579651 (= e!332985 e!332984)))

(declare-fun res!367607 () Bool)

(assert (=> b!579651 (=> (not res!367607) (not e!332984))))

(declare-fun lt!264355 () SeekEntryResult!5824)

(assert (=> b!579651 (= res!367607 (or (= lt!264355 (MissingZero!5824 i!1108)) (= lt!264355 (MissingVacant!5824 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36225 (_ BitVec 32)) SeekEntryResult!5824)

(assert (=> b!579651 (= lt!264355 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579652 () Bool)

(declare-fun res!367603 () Bool)

(assert (=> b!579652 (=> (not res!367603) (not e!332984))))

(declare-datatypes ((List!11467 0))(
  ( (Nil!11464) (Cons!11463 (h!12508 (_ BitVec 64)) (t!17686 List!11467)) )
))
(declare-fun arrayNoDuplicates!0 (array!36225 (_ BitVec 32) List!11467) Bool)

(assert (=> b!579652 (= res!367603 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11464))))

(assert (= (and start!53310 res!367608) b!579649))

(assert (= (and b!579649 res!367606) b!579650))

(assert (= (and b!579650 res!367610) b!579648))

(assert (= (and b!579648 res!367602) b!579647))

(assert (= (and b!579647 res!367609) b!579651))

(assert (= (and b!579651 res!367607) b!579645))

(assert (= (and b!579645 res!367604) b!579652))

(assert (= (and b!579652 res!367603) b!579644))

(assert (= (and b!579644 res!367605) b!579646))

(declare-fun m!557731 () Bool)

(assert (=> b!579645 m!557731))

(declare-fun m!557733 () Bool)

(assert (=> b!579646 m!557733))

(assert (=> b!579646 m!557733))

(declare-fun m!557735 () Bool)

(assert (=> b!579646 m!557735))

(declare-fun m!557737 () Bool)

(assert (=> b!579647 m!557737))

(declare-fun m!557739 () Bool)

(assert (=> b!579652 m!557739))

(declare-fun m!557741 () Bool)

(assert (=> b!579644 m!557741))

(declare-fun m!557743 () Bool)

(assert (=> b!579644 m!557743))

(declare-fun m!557745 () Bool)

(assert (=> b!579644 m!557745))

(assert (=> b!579650 m!557733))

(assert (=> b!579650 m!557733))

(declare-fun m!557747 () Bool)

(assert (=> b!579650 m!557747))

(declare-fun m!557749 () Bool)

(assert (=> start!53310 m!557749))

(declare-fun m!557751 () Bool)

(assert (=> start!53310 m!557751))

(declare-fun m!557753 () Bool)

(assert (=> b!579651 m!557753))

(declare-fun m!557755 () Bool)

(assert (=> b!579648 m!557755))

(check-sat (not b!579652) (not b!579646) (not b!579647) (not start!53310) (not b!579650) (not b!579648) (not b!579651) (not b!579645))
(check-sat)
