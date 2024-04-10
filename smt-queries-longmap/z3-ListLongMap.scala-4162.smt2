; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56662 () Bool)

(assert start!56662)

(declare-fun b!628075 () Bool)

(declare-fun res!405784 () Bool)

(declare-fun e!359428 () Bool)

(assert (=> b!628075 (=> (not res!405784) (not e!359428))))

(declare-datatypes ((array!37954 0))(
  ( (array!37955 (arr!18217 (Array (_ BitVec 32) (_ BitVec 64))) (size!18581 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37954)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628075 (= res!405784 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628076 () Bool)

(declare-fun res!405780 () Bool)

(declare-fun e!359430 () Bool)

(assert (=> b!628076 (=> (not res!405780) (not e!359430))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37954 (_ BitVec 32)) Bool)

(assert (=> b!628076 (= res!405780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628077 () Bool)

(declare-fun res!405779 () Bool)

(assert (=> b!628077 (=> (not res!405779) (not e!359430))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6657 0))(
  ( (MissingZero!6657 (index!28912 (_ BitVec 32))) (Found!6657 (index!28913 (_ BitVec 32))) (Intermediate!6657 (undefined!7469 Bool) (index!28914 (_ BitVec 32)) (x!57645 (_ BitVec 32))) (Undefined!6657) (MissingVacant!6657 (index!28915 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37954 (_ BitVec 32)) SeekEntryResult!6657)

(assert (=> b!628077 (= res!405779 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18217 a!2986) j!136) a!2986 mask!3053) (Found!6657 j!136)))))

(declare-fun res!405775 () Bool)

(assert (=> start!56662 (=> (not res!405775) (not e!359428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56662 (= res!405775 (validMask!0 mask!3053))))

(assert (=> start!56662 e!359428))

(assert (=> start!56662 true))

(declare-fun array_inv!14013 (array!37954) Bool)

(assert (=> start!56662 (array_inv!14013 a!2986)))

(declare-fun b!628078 () Bool)

(declare-fun res!405776 () Bool)

(assert (=> b!628078 (=> (not res!405776) (not e!359428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628078 (= res!405776 (validKeyInArray!0 (select (arr!18217 a!2986) j!136)))))

(declare-fun b!628079 () Bool)

(declare-fun res!405782 () Bool)

(assert (=> b!628079 (=> (not res!405782) (not e!359430))))

(declare-datatypes ((List!12258 0))(
  ( (Nil!12255) (Cons!12254 (h!13299 (_ BitVec 64)) (t!18486 List!12258)) )
))
(declare-fun arrayNoDuplicates!0 (array!37954 (_ BitVec 32) List!12258) Bool)

(assert (=> b!628079 (= res!405782 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12255))))

(declare-fun b!628080 () Bool)

(declare-fun res!405785 () Bool)

(assert (=> b!628080 (=> (not res!405785) (not e!359430))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628080 (= res!405785 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18217 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18217 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628081 () Bool)

(declare-fun res!405777 () Bool)

(assert (=> b!628081 (=> (not res!405777) (not e!359428))))

(assert (=> b!628081 (= res!405777 (and (= (size!18581 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18581 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18581 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628082 () Bool)

(declare-fun res!405781 () Bool)

(assert (=> b!628082 (=> (not res!405781) (not e!359430))))

(assert (=> b!628082 (= res!405781 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18217 a!2986) index!984) (select (arr!18217 a!2986) j!136))) (not (= (select (arr!18217 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!628083 () Bool)

(declare-fun res!405783 () Bool)

(assert (=> b!628083 (=> (not res!405783) (not e!359428))))

(assert (=> b!628083 (= res!405783 (validKeyInArray!0 k0!1786))))

(declare-fun b!628084 () Bool)

(assert (=> b!628084 (= e!359430 false)))

(declare-fun lt!290395 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628084 (= lt!290395 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628085 () Bool)

(assert (=> b!628085 (= e!359428 e!359430)))

(declare-fun res!405778 () Bool)

(assert (=> b!628085 (=> (not res!405778) (not e!359430))))

(declare-fun lt!290394 () SeekEntryResult!6657)

(assert (=> b!628085 (= res!405778 (or (= lt!290394 (MissingZero!6657 i!1108)) (= lt!290394 (MissingVacant!6657 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37954 (_ BitVec 32)) SeekEntryResult!6657)

(assert (=> b!628085 (= lt!290394 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!56662 res!405775) b!628081))

(assert (= (and b!628081 res!405777) b!628078))

(assert (= (and b!628078 res!405776) b!628083))

(assert (= (and b!628083 res!405783) b!628075))

(assert (= (and b!628075 res!405784) b!628085))

(assert (= (and b!628085 res!405778) b!628076))

(assert (= (and b!628076 res!405780) b!628079))

(assert (= (and b!628079 res!405782) b!628080))

(assert (= (and b!628080 res!405785) b!628077))

(assert (= (and b!628077 res!405779) b!628082))

(assert (= (and b!628082 res!405781) b!628084))

(declare-fun m!603327 () Bool)

(assert (=> b!628083 m!603327))

(declare-fun m!603329 () Bool)

(assert (=> b!628080 m!603329))

(declare-fun m!603331 () Bool)

(assert (=> b!628080 m!603331))

(declare-fun m!603333 () Bool)

(assert (=> b!628080 m!603333))

(declare-fun m!603335 () Bool)

(assert (=> b!628082 m!603335))

(declare-fun m!603337 () Bool)

(assert (=> b!628082 m!603337))

(declare-fun m!603339 () Bool)

(assert (=> b!628076 m!603339))

(assert (=> b!628077 m!603337))

(assert (=> b!628077 m!603337))

(declare-fun m!603341 () Bool)

(assert (=> b!628077 m!603341))

(assert (=> b!628078 m!603337))

(assert (=> b!628078 m!603337))

(declare-fun m!603343 () Bool)

(assert (=> b!628078 m!603343))

(declare-fun m!603345 () Bool)

(assert (=> start!56662 m!603345))

(declare-fun m!603347 () Bool)

(assert (=> start!56662 m!603347))

(declare-fun m!603349 () Bool)

(assert (=> b!628085 m!603349))

(declare-fun m!603351 () Bool)

(assert (=> b!628075 m!603351))

(declare-fun m!603353 () Bool)

(assert (=> b!628079 m!603353))

(declare-fun m!603355 () Bool)

(assert (=> b!628084 m!603355))

(check-sat (not b!628085) (not b!628078) (not b!628084) (not start!56662) (not b!628077) (not b!628075) (not b!628076) (not b!628083) (not b!628079))
(check-sat)
