; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53424 () Bool)

(assert start!53424)

(declare-fun b!580763 () Bool)

(declare-fun e!333503 () Bool)

(assert (=> b!580763 (= e!333503 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5803 0))(
  ( (MissingZero!5803 (index!25439 (_ BitVec 32))) (Found!5803 (index!25440 (_ BitVec 32))) (Intermediate!5803 (undefined!6615 Bool) (index!25441 (_ BitVec 32)) (x!54467 (_ BitVec 32))) (Undefined!5803) (MissingVacant!5803 (index!25442 (_ BitVec 32))) )
))
(declare-fun lt!264843 () SeekEntryResult!5803)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36270 0))(
  ( (array!36271 (arr!17407 (Array (_ BitVec 32) (_ BitVec 64))) (size!17771 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36270)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36270 (_ BitVec 32)) SeekEntryResult!5803)

(assert (=> b!580763 (= lt!264843 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17407 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580764 () Bool)

(declare-fun res!368477 () Bool)

(declare-fun e!333502 () Bool)

(assert (=> b!580764 (=> (not res!368477) (not e!333502))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580764 (= res!368477 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580765 () Bool)

(assert (=> b!580765 (= e!333502 e!333503)))

(declare-fun res!368476 () Bool)

(assert (=> b!580765 (=> (not res!368476) (not e!333503))))

(declare-fun lt!264844 () SeekEntryResult!5803)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580765 (= res!368476 (or (= lt!264844 (MissingZero!5803 i!1108)) (= lt!264844 (MissingVacant!5803 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36270 (_ BitVec 32)) SeekEntryResult!5803)

(assert (=> b!580765 (= lt!264844 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!368480 () Bool)

(assert (=> start!53424 (=> (not res!368480) (not e!333502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53424 (= res!368480 (validMask!0 mask!3053))))

(assert (=> start!53424 e!333502))

(assert (=> start!53424 true))

(declare-fun array_inv!13266 (array!36270) Bool)

(assert (=> start!53424 (array_inv!13266 a!2986)))

(declare-fun b!580766 () Bool)

(declare-fun res!368482 () Bool)

(assert (=> b!580766 (=> (not res!368482) (not e!333502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580766 (= res!368482 (validKeyInArray!0 k0!1786))))

(declare-fun b!580767 () Bool)

(declare-fun res!368475 () Bool)

(assert (=> b!580767 (=> (not res!368475) (not e!333503))))

(declare-datatypes ((List!11355 0))(
  ( (Nil!11352) (Cons!11351 (h!12399 (_ BitVec 64)) (t!17575 List!11355)) )
))
(declare-fun arrayNoDuplicates!0 (array!36270 (_ BitVec 32) List!11355) Bool)

(assert (=> b!580767 (= res!368475 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11352))))

(declare-fun b!580768 () Bool)

(declare-fun res!368478 () Bool)

(assert (=> b!580768 (=> (not res!368478) (not e!333502))))

(assert (=> b!580768 (= res!368478 (validKeyInArray!0 (select (arr!17407 a!2986) j!136)))))

(declare-fun b!580769 () Bool)

(declare-fun res!368481 () Bool)

(assert (=> b!580769 (=> (not res!368481) (not e!333502))))

(assert (=> b!580769 (= res!368481 (and (= (size!17771 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17771 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17771 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580770 () Bool)

(declare-fun res!368479 () Bool)

(assert (=> b!580770 (=> (not res!368479) (not e!333503))))

(assert (=> b!580770 (= res!368479 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17407 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17407 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580771 () Bool)

(declare-fun res!368474 () Bool)

(assert (=> b!580771 (=> (not res!368474) (not e!333503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36270 (_ BitVec 32)) Bool)

(assert (=> b!580771 (= res!368474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53424 res!368480) b!580769))

(assert (= (and b!580769 res!368481) b!580768))

(assert (= (and b!580768 res!368478) b!580766))

(assert (= (and b!580766 res!368482) b!580764))

(assert (= (and b!580764 res!368477) b!580765))

(assert (= (and b!580765 res!368476) b!580771))

(assert (= (and b!580771 res!368474) b!580767))

(assert (= (and b!580767 res!368475) b!580770))

(assert (= (and b!580770 res!368479) b!580763))

(declare-fun m!559493 () Bool)

(assert (=> b!580771 m!559493))

(declare-fun m!559495 () Bool)

(assert (=> start!53424 m!559495))

(declare-fun m!559497 () Bool)

(assert (=> start!53424 m!559497))

(declare-fun m!559499 () Bool)

(assert (=> b!580764 m!559499))

(declare-fun m!559501 () Bool)

(assert (=> b!580767 m!559501))

(declare-fun m!559503 () Bool)

(assert (=> b!580766 m!559503))

(declare-fun m!559505 () Bool)

(assert (=> b!580770 m!559505))

(declare-fun m!559507 () Bool)

(assert (=> b!580770 m!559507))

(declare-fun m!559509 () Bool)

(assert (=> b!580770 m!559509))

(declare-fun m!559511 () Bool)

(assert (=> b!580765 m!559511))

(declare-fun m!559513 () Bool)

(assert (=> b!580763 m!559513))

(assert (=> b!580763 m!559513))

(declare-fun m!559515 () Bool)

(assert (=> b!580763 m!559515))

(assert (=> b!580768 m!559513))

(assert (=> b!580768 m!559513))

(declare-fun m!559517 () Bool)

(assert (=> b!580768 m!559517))

(check-sat (not b!580763) (not b!580766) (not b!580764) (not b!580767) (not b!580771) (not b!580768) (not b!580765) (not start!53424))
(check-sat)
