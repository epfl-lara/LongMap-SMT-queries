; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53572 () Bool)

(assert start!53572)

(declare-fun b!583274 () Bool)

(declare-fun res!371099 () Bool)

(declare-fun e!334266 () Bool)

(assert (=> b!583274 (=> (not res!371099) (not e!334266))))

(declare-datatypes ((array!36473 0))(
  ( (array!36474 (arr!17511 (Array (_ BitVec 32) (_ BitVec 64))) (size!17875 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36473)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583274 (= res!371099 (validKeyInArray!0 (select (arr!17511 a!2986) j!136)))))

(declare-fun res!371097 () Bool)

(assert (=> start!53572 (=> (not res!371097) (not e!334266))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53572 (= res!371097 (validMask!0 mask!3053))))

(assert (=> start!53572 e!334266))

(assert (=> start!53572 true))

(declare-fun array_inv!13307 (array!36473) Bool)

(assert (=> start!53572 (array_inv!13307 a!2986)))

(declare-fun b!583275 () Bool)

(declare-fun res!371090 () Bool)

(declare-fun e!334265 () Bool)

(assert (=> b!583275 (=> (not res!371090) (not e!334265))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5951 0))(
  ( (MissingZero!5951 (index!26031 (_ BitVec 32))) (Found!5951 (index!26032 (_ BitVec 32))) (Intermediate!5951 (undefined!6763 Bool) (index!26033 (_ BitVec 32)) (x!54876 (_ BitVec 32))) (Undefined!5951) (MissingVacant!5951 (index!26034 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36473 (_ BitVec 32)) SeekEntryResult!5951)

(assert (=> b!583275 (= res!371090 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17511 a!2986) j!136) a!2986 mask!3053) (Found!5951 j!136)))))

(declare-fun b!583276 () Bool)

(declare-fun res!371094 () Bool)

(assert (=> b!583276 (=> (not res!371094) (not e!334266))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583276 (= res!371094 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583277 () Bool)

(declare-fun res!371091 () Bool)

(assert (=> b!583277 (=> (not res!371091) (not e!334266))))

(assert (=> b!583277 (= res!371091 (validKeyInArray!0 k!1786))))

(declare-fun b!583278 () Bool)

(declare-fun res!371092 () Bool)

(assert (=> b!583278 (=> (not res!371092) (not e!334266))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583278 (= res!371092 (and (= (size!17875 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17875 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17875 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583279 () Bool)

(assert (=> b!583279 (= e!334266 e!334265)))

(declare-fun res!371098 () Bool)

(assert (=> b!583279 (=> (not res!371098) (not e!334265))))

(declare-fun lt!265297 () SeekEntryResult!5951)

(assert (=> b!583279 (= res!371098 (or (= lt!265297 (MissingZero!5951 i!1108)) (= lt!265297 (MissingVacant!5951 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36473 (_ BitVec 32)) SeekEntryResult!5951)

(assert (=> b!583279 (= lt!265297 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583280 () Bool)

(declare-fun res!371095 () Bool)

(assert (=> b!583280 (=> (not res!371095) (not e!334265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36473 (_ BitVec 32)) Bool)

(assert (=> b!583280 (= res!371095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583281 () Bool)

(declare-fun res!371096 () Bool)

(assert (=> b!583281 (=> (not res!371096) (not e!334265))))

(assert (=> b!583281 (= res!371096 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17511 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17511 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583282 () Bool)

(assert (=> b!583282 (= e!334265 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17511 a!2986) index!984) (select (arr!17511 a!2986) j!136))) (not (= (select (arr!17511 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136)) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!583283 () Bool)

(declare-fun res!371093 () Bool)

(assert (=> b!583283 (=> (not res!371093) (not e!334265))))

(declare-datatypes ((List!11552 0))(
  ( (Nil!11549) (Cons!11548 (h!12593 (_ BitVec 64)) (t!17780 List!11552)) )
))
(declare-fun arrayNoDuplicates!0 (array!36473 (_ BitVec 32) List!11552) Bool)

(assert (=> b!583283 (= res!371093 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11549))))

(assert (= (and start!53572 res!371097) b!583278))

(assert (= (and b!583278 res!371092) b!583274))

(assert (= (and b!583274 res!371099) b!583277))

(assert (= (and b!583277 res!371091) b!583276))

(assert (= (and b!583276 res!371094) b!583279))

(assert (= (and b!583279 res!371098) b!583280))

(assert (= (and b!583280 res!371095) b!583283))

(assert (= (and b!583283 res!371093) b!583281))

(assert (= (and b!583281 res!371096) b!583275))

(assert (= (and b!583275 res!371090) b!583282))

(declare-fun m!561745 () Bool)

(assert (=> b!583282 m!561745))

(declare-fun m!561747 () Bool)

(assert (=> b!583282 m!561747))

(declare-fun m!561749 () Bool)

(assert (=> b!583279 m!561749))

(declare-fun m!561751 () Bool)

(assert (=> b!583280 m!561751))

(assert (=> b!583275 m!561747))

(assert (=> b!583275 m!561747))

(declare-fun m!561753 () Bool)

(assert (=> b!583275 m!561753))

(declare-fun m!561755 () Bool)

(assert (=> b!583283 m!561755))

(declare-fun m!561757 () Bool)

(assert (=> start!53572 m!561757))

(declare-fun m!561759 () Bool)

(assert (=> start!53572 m!561759))

(assert (=> b!583274 m!561747))

(assert (=> b!583274 m!561747))

(declare-fun m!561761 () Bool)

(assert (=> b!583274 m!561761))

(declare-fun m!561763 () Bool)

(assert (=> b!583277 m!561763))

(declare-fun m!561765 () Bool)

(assert (=> b!583276 m!561765))

(declare-fun m!561767 () Bool)

(assert (=> b!583281 m!561767))

(declare-fun m!561769 () Bool)

(assert (=> b!583281 m!561769))

(declare-fun m!561771 () Bool)

(assert (=> b!583281 m!561771))

(push 1)

