; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53604 () Bool)

(assert start!53604)

(declare-fun b!583782 () Bool)

(declare-fun res!371607 () Bool)

(declare-fun e!334434 () Bool)

(assert (=> b!583782 (=> (not res!371607) (not e!334434))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583782 (= res!371607 (validKeyInArray!0 k0!1786))))

(declare-fun b!583783 () Bool)

(declare-fun res!371604 () Bool)

(declare-fun e!334432 () Bool)

(assert (=> b!583783 (=> (not res!371604) (not e!334432))))

(declare-datatypes ((array!36505 0))(
  ( (array!36506 (arr!17527 (Array (_ BitVec 32) (_ BitVec 64))) (size!17891 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36505)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36505 (_ BitVec 32)) Bool)

(assert (=> b!583783 (= res!371604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583784 () Bool)

(declare-fun res!371608 () Bool)

(assert (=> b!583784 (=> (not res!371608) (not e!334432))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5967 0))(
  ( (MissingZero!5967 (index!26095 (_ BitVec 32))) (Found!5967 (index!26096 (_ BitVec 32))) (Intermediate!5967 (undefined!6779 Bool) (index!26097 (_ BitVec 32)) (x!54932 (_ BitVec 32))) (Undefined!5967) (MissingVacant!5967 (index!26098 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36505 (_ BitVec 32)) SeekEntryResult!5967)

(assert (=> b!583784 (= res!371608 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17527 a!2986) j!136) a!2986 mask!3053) (Found!5967 j!136)))))

(declare-fun b!583786 () Bool)

(declare-fun res!371601 () Bool)

(assert (=> b!583786 (=> (not res!371601) (not e!334432))))

(assert (=> b!583786 (= res!371601 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17527 a!2986) index!984) (select (arr!17527 a!2986) j!136))) (not (= (select (arr!17527 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!583787 () Bool)

(assert (=> b!583787 (= e!334434 e!334432)))

(declare-fun res!371598 () Bool)

(assert (=> b!583787 (=> (not res!371598) (not e!334432))))

(declare-fun lt!265410 () SeekEntryResult!5967)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583787 (= res!371598 (or (= lt!265410 (MissingZero!5967 i!1108)) (= lt!265410 (MissingVacant!5967 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36505 (_ BitVec 32)) SeekEntryResult!5967)

(assert (=> b!583787 (= lt!265410 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583788 () Bool)

(declare-fun res!371599 () Bool)

(assert (=> b!583788 (=> (not res!371599) (not e!334432))))

(assert (=> b!583788 (= res!371599 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17527 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17527 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583789 () Bool)

(declare-fun res!371609 () Bool)

(assert (=> b!583789 (=> (not res!371609) (not e!334434))))

(declare-fun arrayContainsKey!0 (array!36505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583789 (= res!371609 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583790 () Bool)

(declare-fun e!334433 () Bool)

(assert (=> b!583790 (= e!334432 e!334433)))

(declare-fun res!371600 () Bool)

(assert (=> b!583790 (=> (not res!371600) (not e!334433))))

(declare-fun lt!265409 () (_ BitVec 32))

(assert (=> b!583790 (= res!371600 (and (bvsge lt!265409 #b00000000000000000000000000000000) (bvslt lt!265409 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583790 (= lt!265409 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583791 () Bool)

(assert (=> b!583791 (= e!334433 false)))

(declare-fun lt!265411 () SeekEntryResult!5967)

(assert (=> b!583791 (= lt!265411 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265409 vacantSpotIndex!68 (select (arr!17527 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583792 () Bool)

(declare-fun res!371605 () Bool)

(assert (=> b!583792 (=> (not res!371605) (not e!334432))))

(declare-datatypes ((List!11568 0))(
  ( (Nil!11565) (Cons!11564 (h!12609 (_ BitVec 64)) (t!17796 List!11568)) )
))
(declare-fun arrayNoDuplicates!0 (array!36505 (_ BitVec 32) List!11568) Bool)

(assert (=> b!583792 (= res!371605 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11565))))

(declare-fun b!583793 () Bool)

(declare-fun res!371606 () Bool)

(assert (=> b!583793 (=> (not res!371606) (not e!334434))))

(assert (=> b!583793 (= res!371606 (validKeyInArray!0 (select (arr!17527 a!2986) j!136)))))

(declare-fun b!583785 () Bool)

(declare-fun res!371603 () Bool)

(assert (=> b!583785 (=> (not res!371603) (not e!334434))))

(assert (=> b!583785 (= res!371603 (and (= (size!17891 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17891 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17891 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!371602 () Bool)

(assert (=> start!53604 (=> (not res!371602) (not e!334434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53604 (= res!371602 (validMask!0 mask!3053))))

(assert (=> start!53604 e!334434))

(assert (=> start!53604 true))

(declare-fun array_inv!13323 (array!36505) Bool)

(assert (=> start!53604 (array_inv!13323 a!2986)))

(assert (= (and start!53604 res!371602) b!583785))

(assert (= (and b!583785 res!371603) b!583793))

(assert (= (and b!583793 res!371606) b!583782))

(assert (= (and b!583782 res!371607) b!583789))

(assert (= (and b!583789 res!371609) b!583787))

(assert (= (and b!583787 res!371598) b!583783))

(assert (= (and b!583783 res!371604) b!583792))

(assert (= (and b!583792 res!371605) b!583788))

(assert (= (and b!583788 res!371599) b!583784))

(assert (= (and b!583784 res!371608) b!583786))

(assert (= (and b!583786 res!371601) b!583790))

(assert (= (and b!583790 res!371600) b!583791))

(declare-fun m!562209 () Bool)

(assert (=> b!583788 m!562209))

(declare-fun m!562211 () Bool)

(assert (=> b!583788 m!562211))

(declare-fun m!562213 () Bool)

(assert (=> b!583788 m!562213))

(declare-fun m!562215 () Bool)

(assert (=> start!53604 m!562215))

(declare-fun m!562217 () Bool)

(assert (=> start!53604 m!562217))

(declare-fun m!562219 () Bool)

(assert (=> b!583790 m!562219))

(declare-fun m!562221 () Bool)

(assert (=> b!583783 m!562221))

(declare-fun m!562223 () Bool)

(assert (=> b!583784 m!562223))

(assert (=> b!583784 m!562223))

(declare-fun m!562225 () Bool)

(assert (=> b!583784 m!562225))

(declare-fun m!562227 () Bool)

(assert (=> b!583782 m!562227))

(assert (=> b!583793 m!562223))

(assert (=> b!583793 m!562223))

(declare-fun m!562229 () Bool)

(assert (=> b!583793 m!562229))

(declare-fun m!562231 () Bool)

(assert (=> b!583789 m!562231))

(assert (=> b!583791 m!562223))

(assert (=> b!583791 m!562223))

(declare-fun m!562233 () Bool)

(assert (=> b!583791 m!562233))

(declare-fun m!562235 () Bool)

(assert (=> b!583792 m!562235))

(declare-fun m!562237 () Bool)

(assert (=> b!583786 m!562237))

(assert (=> b!583786 m!562223))

(declare-fun m!562239 () Bool)

(assert (=> b!583787 m!562239))

(check-sat (not b!583791) (not start!53604) (not b!583793) (not b!583783) (not b!583790) (not b!583792) (not b!583789) (not b!583787) (not b!583784) (not b!583782))
(check-sat)
