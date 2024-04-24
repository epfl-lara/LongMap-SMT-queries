; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53358 () Bool)

(assert start!53358)

(declare-fun b!579872 () Bool)

(declare-fun res!367587 () Bool)

(declare-fun e!333206 () Bool)

(assert (=> b!579872 (=> (not res!367587) (not e!333206))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36204 0))(
  ( (array!36205 (arr!17374 (Array (_ BitVec 32) (_ BitVec 64))) (size!17738 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36204)

(assert (=> b!579872 (= res!367587 (and (= (size!17738 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17738 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17738 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579873 () Bool)

(declare-fun res!367591 () Bool)

(declare-fun e!333205 () Bool)

(assert (=> b!579873 (=> (not res!367591) (not e!333205))))

(declare-datatypes ((List!11322 0))(
  ( (Nil!11319) (Cons!11318 (h!12366 (_ BitVec 64)) (t!17542 List!11322)) )
))
(declare-fun arrayNoDuplicates!0 (array!36204 (_ BitVec 32) List!11322) Bool)

(assert (=> b!579873 (= res!367591 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11319))))

(declare-fun b!579874 () Bool)

(declare-fun res!367589 () Bool)

(assert (=> b!579874 (=> (not res!367589) (not e!333206))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579874 (= res!367589 (validKeyInArray!0 k0!1786))))

(declare-fun b!579875 () Bool)

(assert (=> b!579875 (= e!333205 false)))

(declare-datatypes ((SeekEntryResult!5770 0))(
  ( (MissingZero!5770 (index!25307 (_ BitVec 32))) (Found!5770 (index!25308 (_ BitVec 32))) (Intermediate!5770 (undefined!6582 Bool) (index!25309 (_ BitVec 32)) (x!54346 (_ BitVec 32))) (Undefined!5770) (MissingVacant!5770 (index!25310 (_ BitVec 32))) )
))
(declare-fun lt!264646 () SeekEntryResult!5770)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36204 (_ BitVec 32)) SeekEntryResult!5770)

(assert (=> b!579875 (= lt!264646 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17374 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579876 () Bool)

(assert (=> b!579876 (= e!333206 e!333205)))

(declare-fun res!367588 () Bool)

(assert (=> b!579876 (=> (not res!367588) (not e!333205))))

(declare-fun lt!264645 () SeekEntryResult!5770)

(assert (=> b!579876 (= res!367588 (or (= lt!264645 (MissingZero!5770 i!1108)) (= lt!264645 (MissingVacant!5770 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36204 (_ BitVec 32)) SeekEntryResult!5770)

(assert (=> b!579876 (= lt!264645 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579877 () Bool)

(declare-fun res!367590 () Bool)

(assert (=> b!579877 (=> (not res!367590) (not e!333205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36204 (_ BitVec 32)) Bool)

(assert (=> b!579877 (= res!367590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!367585 () Bool)

(assert (=> start!53358 (=> (not res!367585) (not e!333206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53358 (= res!367585 (validMask!0 mask!3053))))

(assert (=> start!53358 e!333206))

(assert (=> start!53358 true))

(declare-fun array_inv!13233 (array!36204) Bool)

(assert (=> start!53358 (array_inv!13233 a!2986)))

(declare-fun b!579878 () Bool)

(declare-fun res!367583 () Bool)

(assert (=> b!579878 (=> (not res!367583) (not e!333205))))

(assert (=> b!579878 (= res!367583 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17374 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17374 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579879 () Bool)

(declare-fun res!367586 () Bool)

(assert (=> b!579879 (=> (not res!367586) (not e!333206))))

(declare-fun arrayContainsKey!0 (array!36204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579879 (= res!367586 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579880 () Bool)

(declare-fun res!367584 () Bool)

(assert (=> b!579880 (=> (not res!367584) (not e!333206))))

(assert (=> b!579880 (= res!367584 (validKeyInArray!0 (select (arr!17374 a!2986) j!136)))))

(assert (= (and start!53358 res!367585) b!579872))

(assert (= (and b!579872 res!367587) b!579880))

(assert (= (and b!579880 res!367584) b!579874))

(assert (= (and b!579874 res!367589) b!579879))

(assert (= (and b!579879 res!367586) b!579876))

(assert (= (and b!579876 res!367588) b!579877))

(assert (= (and b!579877 res!367590) b!579873))

(assert (= (and b!579873 res!367591) b!579878))

(assert (= (and b!579878 res!367583) b!579875))

(declare-fun m!558635 () Bool)

(assert (=> b!579876 m!558635))

(declare-fun m!558637 () Bool)

(assert (=> b!579878 m!558637))

(declare-fun m!558639 () Bool)

(assert (=> b!579878 m!558639))

(declare-fun m!558641 () Bool)

(assert (=> b!579878 m!558641))

(declare-fun m!558643 () Bool)

(assert (=> b!579880 m!558643))

(assert (=> b!579880 m!558643))

(declare-fun m!558645 () Bool)

(assert (=> b!579880 m!558645))

(declare-fun m!558647 () Bool)

(assert (=> b!579877 m!558647))

(declare-fun m!558649 () Bool)

(assert (=> start!53358 m!558649))

(declare-fun m!558651 () Bool)

(assert (=> start!53358 m!558651))

(declare-fun m!558653 () Bool)

(assert (=> b!579873 m!558653))

(declare-fun m!558655 () Bool)

(assert (=> b!579879 m!558655))

(assert (=> b!579875 m!558643))

(assert (=> b!579875 m!558643))

(declare-fun m!558657 () Bool)

(assert (=> b!579875 m!558657))

(declare-fun m!558659 () Bool)

(assert (=> b!579874 m!558659))

(check-sat (not b!579873) (not b!579874) (not b!579880) (not b!579877) (not b!579875) (not start!53358) (not b!579876) (not b!579879))
(check-sat)
