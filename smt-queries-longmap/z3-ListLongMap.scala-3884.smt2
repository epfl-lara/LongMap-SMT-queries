; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53316 () Bool)

(assert start!53316)

(declare-fun b!579780 () Bool)

(declare-fun e!333114 () Bool)

(declare-fun e!333112 () Bool)

(assert (=> b!579780 (= e!333114 e!333112)))

(declare-fun res!367603 () Bool)

(assert (=> b!579780 (=> (not res!367603) (not e!333112))))

(declare-datatypes ((SeekEntryResult!5823 0))(
  ( (MissingZero!5823 (index!25519 (_ BitVec 32))) (Found!5823 (index!25520 (_ BitVec 32))) (Intermediate!5823 (undefined!6635 Bool) (index!25521 (_ BitVec 32)) (x!54404 (_ BitVec 32))) (Undefined!5823) (MissingVacant!5823 (index!25522 (_ BitVec 32))) )
))
(declare-fun lt!264559 () SeekEntryResult!5823)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579780 (= res!367603 (or (= lt!264559 (MissingZero!5823 i!1108)) (= lt!264559 (MissingVacant!5823 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36217 0))(
  ( (array!36218 (arr!17383 (Array (_ BitVec 32) (_ BitVec 64))) (size!17747 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36217)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36217 (_ BitVec 32)) SeekEntryResult!5823)

(assert (=> b!579780 (= lt!264559 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579781 () Bool)

(declare-fun res!367599 () Bool)

(assert (=> b!579781 (=> (not res!367599) (not e!333112))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579781 (= res!367599 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17383 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17383 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579782 () Bool)

(declare-fun res!367600 () Bool)

(assert (=> b!579782 (=> (not res!367600) (not e!333112))))

(declare-datatypes ((List!11424 0))(
  ( (Nil!11421) (Cons!11420 (h!12465 (_ BitVec 64)) (t!17652 List!11424)) )
))
(declare-fun arrayNoDuplicates!0 (array!36217 (_ BitVec 32) List!11424) Bool)

(assert (=> b!579782 (= res!367600 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11421))))

(declare-fun b!579783 () Bool)

(assert (=> b!579783 (= e!333112 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!264558 () SeekEntryResult!5823)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36217 (_ BitVec 32)) SeekEntryResult!5823)

(assert (=> b!579783 (= lt!264558 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17383 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579784 () Bool)

(declare-fun res!367597 () Bool)

(assert (=> b!579784 (=> (not res!367597) (not e!333114))))

(declare-fun arrayContainsKey!0 (array!36217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579784 (= res!367597 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579785 () Bool)

(declare-fun res!367602 () Bool)

(assert (=> b!579785 (=> (not res!367602) (not e!333112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36217 (_ BitVec 32)) Bool)

(assert (=> b!579785 (= res!367602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579786 () Bool)

(declare-fun res!367601 () Bool)

(assert (=> b!579786 (=> (not res!367601) (not e!333114))))

(assert (=> b!579786 (= res!367601 (and (= (size!17747 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17747 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17747 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!367598 () Bool)

(assert (=> start!53316 (=> (not res!367598) (not e!333114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53316 (= res!367598 (validMask!0 mask!3053))))

(assert (=> start!53316 e!333114))

(assert (=> start!53316 true))

(declare-fun array_inv!13179 (array!36217) Bool)

(assert (=> start!53316 (array_inv!13179 a!2986)))

(declare-fun b!579787 () Bool)

(declare-fun res!367604 () Bool)

(assert (=> b!579787 (=> (not res!367604) (not e!333114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579787 (= res!367604 (validKeyInArray!0 (select (arr!17383 a!2986) j!136)))))

(declare-fun b!579788 () Bool)

(declare-fun res!367596 () Bool)

(assert (=> b!579788 (=> (not res!367596) (not e!333114))))

(assert (=> b!579788 (= res!367596 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53316 res!367598) b!579786))

(assert (= (and b!579786 res!367601) b!579787))

(assert (= (and b!579787 res!367604) b!579788))

(assert (= (and b!579788 res!367596) b!579784))

(assert (= (and b!579784 res!367597) b!579780))

(assert (= (and b!579780 res!367603) b!579785))

(assert (= (and b!579785 res!367602) b!579782))

(assert (= (and b!579782 res!367600) b!579781))

(assert (= (and b!579781 res!367599) b!579783))

(declare-fun m!558387 () Bool)

(assert (=> b!579780 m!558387))

(declare-fun m!558389 () Bool)

(assert (=> b!579787 m!558389))

(assert (=> b!579787 m!558389))

(declare-fun m!558391 () Bool)

(assert (=> b!579787 m!558391))

(declare-fun m!558393 () Bool)

(assert (=> b!579788 m!558393))

(declare-fun m!558395 () Bool)

(assert (=> start!53316 m!558395))

(declare-fun m!558397 () Bool)

(assert (=> start!53316 m!558397))

(declare-fun m!558399 () Bool)

(assert (=> b!579782 m!558399))

(declare-fun m!558401 () Bool)

(assert (=> b!579785 m!558401))

(declare-fun m!558403 () Bool)

(assert (=> b!579781 m!558403))

(declare-fun m!558405 () Bool)

(assert (=> b!579781 m!558405))

(declare-fun m!558407 () Bool)

(assert (=> b!579781 m!558407))

(declare-fun m!558409 () Bool)

(assert (=> b!579784 m!558409))

(assert (=> b!579783 m!558389))

(assert (=> b!579783 m!558389))

(declare-fun m!558411 () Bool)

(assert (=> b!579783 m!558411))

(check-sat (not b!579788) (not b!579784) (not b!579785) (not start!53316) (not b!579787) (not b!579783) (not b!579782) (not b!579780))
(check-sat)
