; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56430 () Bool)

(assert start!56430)

(declare-fun res!403558 () Bool)

(declare-fun e!358519 () Bool)

(assert (=> start!56430 (=> (not res!403558) (not e!358519))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56430 (= res!403558 (validMask!0 mask!3053))))

(assert (=> start!56430 e!358519))

(assert (=> start!56430 true))

(declare-datatypes ((array!37810 0))(
  ( (array!37811 (arr!18148 (Array (_ BitVec 32) (_ BitVec 64))) (size!18512 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37810)

(declare-fun array_inv!13944 (array!37810) Bool)

(assert (=> start!56430 (array_inv!13944 a!2986)))

(declare-fun b!625545 () Bool)

(declare-fun res!403555 () Bool)

(assert (=> b!625545 (=> (not res!403555) (not e!358519))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625545 (= res!403555 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625546 () Bool)

(declare-fun res!403559 () Bool)

(declare-fun e!358520 () Bool)

(assert (=> b!625546 (=> (not res!403559) (not e!358520))))

(declare-datatypes ((List!12189 0))(
  ( (Nil!12186) (Cons!12185 (h!13230 (_ BitVec 64)) (t!18417 List!12189)) )
))
(declare-fun arrayNoDuplicates!0 (array!37810 (_ BitVec 32) List!12189) Bool)

(assert (=> b!625546 (= res!403559 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12186))))

(declare-fun b!625547 () Bool)

(declare-fun res!403553 () Bool)

(assert (=> b!625547 (=> (not res!403553) (not e!358519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625547 (= res!403553 (validKeyInArray!0 k0!1786))))

(declare-fun b!625548 () Bool)

(assert (=> b!625548 (= e!358520 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6588 0))(
  ( (MissingZero!6588 (index!28636 (_ BitVec 32))) (Found!6588 (index!28637 (_ BitVec 32))) (Intermediate!6588 (undefined!7400 Bool) (index!28638 (_ BitVec 32)) (x!57386 (_ BitVec 32))) (Undefined!6588) (MissingVacant!6588 (index!28639 (_ BitVec 32))) )
))
(declare-fun lt!289848 () SeekEntryResult!6588)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37810 (_ BitVec 32)) SeekEntryResult!6588)

(assert (=> b!625548 (= lt!289848 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18148 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625549 () Bool)

(declare-fun res!403556 () Bool)

(assert (=> b!625549 (=> (not res!403556) (not e!358520))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625549 (= res!403556 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18148 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18148 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625550 () Bool)

(declare-fun res!403557 () Bool)

(assert (=> b!625550 (=> (not res!403557) (not e!358519))))

(assert (=> b!625550 (= res!403557 (validKeyInArray!0 (select (arr!18148 a!2986) j!136)))))

(declare-fun b!625551 () Bool)

(declare-fun res!403552 () Bool)

(assert (=> b!625551 (=> (not res!403552) (not e!358519))))

(assert (=> b!625551 (= res!403552 (and (= (size!18512 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18512 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18512 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625552 () Bool)

(assert (=> b!625552 (= e!358519 e!358520)))

(declare-fun res!403551 () Bool)

(assert (=> b!625552 (=> (not res!403551) (not e!358520))))

(declare-fun lt!289849 () SeekEntryResult!6588)

(assert (=> b!625552 (= res!403551 (or (= lt!289849 (MissingZero!6588 i!1108)) (= lt!289849 (MissingVacant!6588 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37810 (_ BitVec 32)) SeekEntryResult!6588)

(assert (=> b!625552 (= lt!289849 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625553 () Bool)

(declare-fun res!403554 () Bool)

(assert (=> b!625553 (=> (not res!403554) (not e!358520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37810 (_ BitVec 32)) Bool)

(assert (=> b!625553 (= res!403554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56430 res!403558) b!625551))

(assert (= (and b!625551 res!403552) b!625550))

(assert (= (and b!625550 res!403557) b!625547))

(assert (= (and b!625547 res!403553) b!625545))

(assert (= (and b!625545 res!403555) b!625552))

(assert (= (and b!625552 res!403551) b!625553))

(assert (= (and b!625553 res!403554) b!625546))

(assert (= (and b!625546 res!403559) b!625549))

(assert (= (and b!625549 res!403556) b!625548))

(declare-fun m!601111 () Bool)

(assert (=> b!625546 m!601111))

(declare-fun m!601113 () Bool)

(assert (=> start!56430 m!601113))

(declare-fun m!601115 () Bool)

(assert (=> start!56430 m!601115))

(declare-fun m!601117 () Bool)

(assert (=> b!625548 m!601117))

(assert (=> b!625548 m!601117))

(declare-fun m!601119 () Bool)

(assert (=> b!625548 m!601119))

(declare-fun m!601121 () Bool)

(assert (=> b!625553 m!601121))

(assert (=> b!625550 m!601117))

(assert (=> b!625550 m!601117))

(declare-fun m!601123 () Bool)

(assert (=> b!625550 m!601123))

(declare-fun m!601125 () Bool)

(assert (=> b!625552 m!601125))

(declare-fun m!601127 () Bool)

(assert (=> b!625545 m!601127))

(declare-fun m!601129 () Bool)

(assert (=> b!625549 m!601129))

(declare-fun m!601131 () Bool)

(assert (=> b!625549 m!601131))

(declare-fun m!601133 () Bool)

(assert (=> b!625549 m!601133))

(declare-fun m!601135 () Bool)

(assert (=> b!625547 m!601135))

(check-sat (not b!625547) (not b!625550) (not b!625548) (not start!56430) (not b!625546) (not b!625545) (not b!625552) (not b!625553))
(check-sat)
