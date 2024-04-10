; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56664 () Bool)

(assert start!56664)

(declare-fun b!628108 () Bool)

(declare-fun res!405808 () Bool)

(declare-fun e!359437 () Bool)

(assert (=> b!628108 (=> (not res!405808) (not e!359437))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!628108 (= res!405808 (validKeyInArray!0 k!1786))))

(declare-fun b!628109 () Bool)

(declare-fun e!359438 () Bool)

(assert (=> b!628109 (= e!359438 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290400 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!628109 (= lt!290400 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!628110 () Bool)

(assert (=> b!628110 (= e!359437 e!359438)))

(declare-fun res!405812 () Bool)

(assert (=> b!628110 (=> (not res!405812) (not e!359438))))

(declare-datatypes ((SeekEntryResult!6658 0))(
  ( (MissingZero!6658 (index!28916 (_ BitVec 32))) (Found!6658 (index!28917 (_ BitVec 32))) (Intermediate!6658 (undefined!7470 Bool) (index!28918 (_ BitVec 32)) (x!57646 (_ BitVec 32))) (Undefined!6658) (MissingVacant!6658 (index!28919 (_ BitVec 32))) )
))
(declare-fun lt!290401 () SeekEntryResult!6658)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!628110 (= res!405812 (or (= lt!290401 (MissingZero!6658 i!1108)) (= lt!290401 (MissingVacant!6658 i!1108))))))

(declare-datatypes ((array!37956 0))(
  ( (array!37957 (arr!18218 (Array (_ BitVec 32) (_ BitVec 64))) (size!18582 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37956)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37956 (_ BitVec 32)) SeekEntryResult!6658)

(assert (=> b!628110 (= lt!290401 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!628111 () Bool)

(declare-fun res!405810 () Bool)

(assert (=> b!628111 (=> (not res!405810) (not e!359437))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!628111 (= res!405810 (and (= (size!18582 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18582 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18582 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!628112 () Bool)

(declare-fun res!405817 () Bool)

(assert (=> b!628112 (=> (not res!405817) (not e!359438))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!628112 (= res!405817 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18218 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18218 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!628113 () Bool)

(declare-fun res!405818 () Bool)

(assert (=> b!628113 (=> (not res!405818) (not e!359438))))

(declare-datatypes ((List!12259 0))(
  ( (Nil!12256) (Cons!12255 (h!13300 (_ BitVec 64)) (t!18487 List!12259)) )
))
(declare-fun arrayNoDuplicates!0 (array!37956 (_ BitVec 32) List!12259) Bool)

(assert (=> b!628113 (= res!405818 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12256))))

(declare-fun b!628115 () Bool)

(declare-fun res!405809 () Bool)

(assert (=> b!628115 (=> (not res!405809) (not e!359437))))

(assert (=> b!628115 (= res!405809 (validKeyInArray!0 (select (arr!18218 a!2986) j!136)))))

(declare-fun b!628116 () Bool)

(declare-fun res!405811 () Bool)

(assert (=> b!628116 (=> (not res!405811) (not e!359437))))

(declare-fun arrayContainsKey!0 (array!37956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!628116 (= res!405811 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!628117 () Bool)

(declare-fun res!405815 () Bool)

(assert (=> b!628117 (=> (not res!405815) (not e!359438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37956 (_ BitVec 32)) Bool)

(assert (=> b!628117 (= res!405815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!628118 () Bool)

(declare-fun res!405814 () Bool)

(assert (=> b!628118 (=> (not res!405814) (not e!359438))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37956 (_ BitVec 32)) SeekEntryResult!6658)

(assert (=> b!628118 (= res!405814 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18218 a!2986) j!136) a!2986 mask!3053) (Found!6658 j!136)))))

(declare-fun b!628114 () Bool)

(declare-fun res!405816 () Bool)

(assert (=> b!628114 (=> (not res!405816) (not e!359438))))

(assert (=> b!628114 (= res!405816 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18218 a!2986) index!984) (select (arr!18218 a!2986) j!136))) (not (= (select (arr!18218 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!405813 () Bool)

(assert (=> start!56664 (=> (not res!405813) (not e!359437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56664 (= res!405813 (validMask!0 mask!3053))))

(assert (=> start!56664 e!359437))

(assert (=> start!56664 true))

(declare-fun array_inv!14014 (array!37956) Bool)

(assert (=> start!56664 (array_inv!14014 a!2986)))

(assert (= (and start!56664 res!405813) b!628111))

(assert (= (and b!628111 res!405810) b!628115))

(assert (= (and b!628115 res!405809) b!628108))

(assert (= (and b!628108 res!405808) b!628116))

(assert (= (and b!628116 res!405811) b!628110))

(assert (= (and b!628110 res!405812) b!628117))

(assert (= (and b!628117 res!405815) b!628113))

(assert (= (and b!628113 res!405818) b!628112))

(assert (= (and b!628112 res!405817) b!628118))

(assert (= (and b!628118 res!405814) b!628114))

(assert (= (and b!628114 res!405816) b!628109))

(declare-fun m!603357 () Bool)

(assert (=> start!56664 m!603357))

(declare-fun m!603359 () Bool)

(assert (=> start!56664 m!603359))

(declare-fun m!603361 () Bool)

(assert (=> b!628109 m!603361))

(declare-fun m!603363 () Bool)

(assert (=> b!628117 m!603363))

(declare-fun m!603365 () Bool)

(assert (=> b!628114 m!603365))

(declare-fun m!603367 () Bool)

(assert (=> b!628114 m!603367))

(declare-fun m!603369 () Bool)

(assert (=> b!628112 m!603369))

(declare-fun m!603371 () Bool)

(assert (=> b!628112 m!603371))

(declare-fun m!603373 () Bool)

(assert (=> b!628112 m!603373))

(declare-fun m!603375 () Bool)

(assert (=> b!628113 m!603375))

(declare-fun m!603377 () Bool)

(assert (=> b!628110 m!603377))

(declare-fun m!603379 () Bool)

(assert (=> b!628116 m!603379))

(assert (=> b!628118 m!603367))

(assert (=> b!628118 m!603367))

(declare-fun m!603381 () Bool)

(assert (=> b!628118 m!603381))

(assert (=> b!628115 m!603367))

(assert (=> b!628115 m!603367))

(declare-fun m!603383 () Bool)

(assert (=> b!628115 m!603383))

(declare-fun m!603385 () Bool)

(assert (=> b!628108 m!603385))

(push 1)

(assert (not b!628115))

(assert (not b!628113))

(assert (not start!56664))

