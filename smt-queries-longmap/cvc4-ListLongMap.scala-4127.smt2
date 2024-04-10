; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56312 () Bool)

(assert start!56312)

(declare-fun b!624394 () Bool)

(declare-fun res!402549 () Bool)

(declare-fun e!358071 () Bool)

(assert (=> b!624394 (=> (not res!402549) (not e!358071))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37737 0))(
  ( (array!37738 (arr!18113 (Array (_ BitVec 32) (_ BitVec 64))) (size!18477 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37737)

(assert (=> b!624394 (= res!402549 (and (= (size!18477 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18477 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18477 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624395 () Bool)

(declare-fun e!358070 () Bool)

(assert (=> b!624395 (= e!358071 e!358070)))

(declare-fun res!402548 () Bool)

(assert (=> b!624395 (=> (not res!402548) (not e!358070))))

(declare-datatypes ((SeekEntryResult!6553 0))(
  ( (MissingZero!6553 (index!28496 (_ BitVec 32))) (Found!6553 (index!28497 (_ BitVec 32))) (Intermediate!6553 (undefined!7365 Bool) (index!28498 (_ BitVec 32)) (x!57252 (_ BitVec 32))) (Undefined!6553) (MissingVacant!6553 (index!28499 (_ BitVec 32))) )
))
(declare-fun lt!289585 () SeekEntryResult!6553)

(assert (=> b!624395 (= res!402548 (or (= lt!289585 (MissingZero!6553 i!1108)) (= lt!289585 (MissingVacant!6553 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37737 (_ BitVec 32)) SeekEntryResult!6553)

(assert (=> b!624395 (= lt!289585 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!624396 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624396 (= e!358070 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18113 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantSpotIndex!68 (size!18477 a!2986))))))

(declare-fun b!624397 () Bool)

(declare-fun res!402547 () Bool)

(assert (=> b!624397 (=> (not res!402547) (not e!358071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624397 (= res!402547 (validKeyInArray!0 (select (arr!18113 a!2986) j!136)))))

(declare-fun res!402546 () Bool)

(assert (=> start!56312 (=> (not res!402546) (not e!358071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56312 (= res!402546 (validMask!0 mask!3053))))

(assert (=> start!56312 e!358071))

(assert (=> start!56312 true))

(declare-fun array_inv!13909 (array!37737) Bool)

(assert (=> start!56312 (array_inv!13909 a!2986)))

(declare-fun b!624398 () Bool)

(declare-fun res!402544 () Bool)

(assert (=> b!624398 (=> (not res!402544) (not e!358070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37737 (_ BitVec 32)) Bool)

(assert (=> b!624398 (= res!402544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624399 () Bool)

(declare-fun res!402550 () Bool)

(assert (=> b!624399 (=> (not res!402550) (not e!358071))))

(declare-fun arrayContainsKey!0 (array!37737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624399 (= res!402550 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624400 () Bool)

(declare-fun res!402545 () Bool)

(assert (=> b!624400 (=> (not res!402545) (not e!358070))))

(declare-datatypes ((List!12154 0))(
  ( (Nil!12151) (Cons!12150 (h!13195 (_ BitVec 64)) (t!18382 List!12154)) )
))
(declare-fun arrayNoDuplicates!0 (array!37737 (_ BitVec 32) List!12154) Bool)

(assert (=> b!624400 (= res!402545 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12151))))

(declare-fun b!624401 () Bool)

(declare-fun res!402551 () Bool)

(assert (=> b!624401 (=> (not res!402551) (not e!358071))))

(assert (=> b!624401 (= res!402551 (validKeyInArray!0 k!1786))))

(assert (= (and start!56312 res!402546) b!624394))

(assert (= (and b!624394 res!402549) b!624397))

(assert (= (and b!624397 res!402547) b!624401))

(assert (= (and b!624401 res!402551) b!624399))

(assert (= (and b!624399 res!402550) b!624395))

(assert (= (and b!624395 res!402548) b!624398))

(assert (= (and b!624398 res!402544) b!624400))

(assert (= (and b!624400 res!402545) b!624396))

(declare-fun m!600105 () Bool)

(assert (=> b!624398 m!600105))

(declare-fun m!600107 () Bool)

(assert (=> b!624396 m!600107))

(declare-fun m!600109 () Bool)

(assert (=> b!624397 m!600109))

(assert (=> b!624397 m!600109))

(declare-fun m!600111 () Bool)

(assert (=> b!624397 m!600111))

(declare-fun m!600113 () Bool)

(assert (=> b!624399 m!600113))

(declare-fun m!600115 () Bool)

(assert (=> start!56312 m!600115))

(declare-fun m!600117 () Bool)

(assert (=> start!56312 m!600117))

(declare-fun m!600119 () Bool)

(assert (=> b!624395 m!600119))

(declare-fun m!600121 () Bool)

(assert (=> b!624401 m!600121))

(declare-fun m!600123 () Bool)

(assert (=> b!624400 m!600123))

(push 1)

(assert (not start!56312))

(assert (not b!624395))

(assert (not b!624398))

(assert (not b!624400))

(assert (not b!624399))

(assert (not b!624397))

(assert (not b!624401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

