; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56604 () Bool)

(assert start!56604)

(declare-fun b!627118 () Bool)

(declare-fun res!404826 () Bool)

(declare-fun e!359169 () Bool)

(assert (=> b!627118 (=> (not res!404826) (not e!359169))))

(declare-datatypes ((array!37896 0))(
  ( (array!37897 (arr!18188 (Array (_ BitVec 32) (_ BitVec 64))) (size!18552 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37896)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37896 (_ BitVec 32)) Bool)

(assert (=> b!627118 (= res!404826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627119 () Bool)

(declare-fun res!404820 () Bool)

(declare-fun e!359167 () Bool)

(assert (=> b!627119 (=> (not res!404820) (not e!359167))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627119 (= res!404820 (and (= (size!18552 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18552 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18552 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627120 () Bool)

(declare-fun res!404824 () Bool)

(assert (=> b!627120 (=> (not res!404824) (not e!359167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627120 (= res!404824 (validKeyInArray!0 (select (arr!18188 a!2986) j!136)))))

(declare-fun b!627121 () Bool)

(assert (=> b!627121 (= e!359167 e!359169)))

(declare-fun res!404818 () Bool)

(assert (=> b!627121 (=> (not res!404818) (not e!359169))))

(declare-datatypes ((SeekEntryResult!6628 0))(
  ( (MissingZero!6628 (index!28796 (_ BitVec 32))) (Found!6628 (index!28797 (_ BitVec 32))) (Intermediate!6628 (undefined!7440 Bool) (index!28798 (_ BitVec 32)) (x!57536 (_ BitVec 32))) (Undefined!6628) (MissingVacant!6628 (index!28799 (_ BitVec 32))) )
))
(declare-fun lt!290221 () SeekEntryResult!6628)

(assert (=> b!627121 (= res!404818 (or (= lt!290221 (MissingZero!6628 i!1108)) (= lt!290221 (MissingVacant!6628 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37896 (_ BitVec 32)) SeekEntryResult!6628)

(assert (=> b!627121 (= lt!290221 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627122 () Bool)

(declare-fun res!404822 () Bool)

(assert (=> b!627122 (=> (not res!404822) (not e!359169))))

(declare-datatypes ((List!12229 0))(
  ( (Nil!12226) (Cons!12225 (h!13270 (_ BitVec 64)) (t!18457 List!12229)) )
))
(declare-fun arrayNoDuplicates!0 (array!37896 (_ BitVec 32) List!12229) Bool)

(assert (=> b!627122 (= res!404822 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12226))))

(declare-fun b!627123 () Bool)

(declare-fun res!404828 () Bool)

(assert (=> b!627123 (=> (not res!404828) (not e!359169))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37896 (_ BitVec 32)) SeekEntryResult!6628)

(assert (=> b!627123 (= res!404828 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18188 a!2986) j!136) a!2986 mask!3053) (Found!6628 j!136)))))

(declare-fun b!627124 () Bool)

(declare-fun res!404827 () Bool)

(assert (=> b!627124 (=> (not res!404827) (not e!359167))))

(declare-fun arrayContainsKey!0 (array!37896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627124 (= res!404827 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404823 () Bool)

(assert (=> start!56604 (=> (not res!404823) (not e!359167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56604 (= res!404823 (validMask!0 mask!3053))))

(assert (=> start!56604 e!359167))

(assert (=> start!56604 true))

(declare-fun array_inv!13984 (array!37896) Bool)

(assert (=> start!56604 (array_inv!13984 a!2986)))

(declare-fun b!627125 () Bool)

(declare-fun res!404825 () Bool)

(assert (=> b!627125 (=> (not res!404825) (not e!359167))))

(assert (=> b!627125 (= res!404825 (validKeyInArray!0 k!1786))))

(declare-fun b!627126 () Bool)

(declare-fun res!404821 () Bool)

(assert (=> b!627126 (=> (not res!404821) (not e!359169))))

(assert (=> b!627126 (= res!404821 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18188 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18188 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627127 () Bool)

(assert (=> b!627127 (= e!359169 false)))

(declare-fun lt!290220 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627127 (= lt!290220 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627128 () Bool)

(declare-fun res!404819 () Bool)

(assert (=> b!627128 (=> (not res!404819) (not e!359169))))

(assert (=> b!627128 (= res!404819 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18188 a!2986) index!984) (select (arr!18188 a!2986) j!136))) (not (= (select (arr!18188 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56604 res!404823) b!627119))

(assert (= (and b!627119 res!404820) b!627120))

(assert (= (and b!627120 res!404824) b!627125))

(assert (= (and b!627125 res!404825) b!627124))

(assert (= (and b!627124 res!404827) b!627121))

(assert (= (and b!627121 res!404818) b!627118))

(assert (= (and b!627118 res!404826) b!627122))

(assert (= (and b!627122 res!404822) b!627126))

(assert (= (and b!627126 res!404821) b!627123))

(assert (= (and b!627123 res!404828) b!627128))

(assert (= (and b!627128 res!404819) b!627127))

(declare-fun m!602457 () Bool)

(assert (=> b!627128 m!602457))

(declare-fun m!602459 () Bool)

(assert (=> b!627128 m!602459))

(declare-fun m!602461 () Bool)

(assert (=> start!56604 m!602461))

(declare-fun m!602463 () Bool)

(assert (=> start!56604 m!602463))

(declare-fun m!602465 () Bool)

(assert (=> b!627126 m!602465))

(declare-fun m!602467 () Bool)

(assert (=> b!627126 m!602467))

(declare-fun m!602469 () Bool)

(assert (=> b!627126 m!602469))

(declare-fun m!602471 () Bool)

(assert (=> b!627118 m!602471))

(declare-fun m!602473 () Bool)

(assert (=> b!627122 m!602473))

(assert (=> b!627123 m!602459))

(assert (=> b!627123 m!602459))

(declare-fun m!602475 () Bool)

(assert (=> b!627123 m!602475))

(declare-fun m!602477 () Bool)

(assert (=> b!627127 m!602477))

(declare-fun m!602479 () Bool)

(assert (=> b!627121 m!602479))

(assert (=> b!627120 m!602459))

(assert (=> b!627120 m!602459))

(declare-fun m!602481 () Bool)

(assert (=> b!627120 m!602481))

(declare-fun m!602483 () Bool)

(assert (=> b!627125 m!602483))

(declare-fun m!602485 () Bool)

(assert (=> b!627124 m!602485))

(push 1)

(assert (not b!627127))

(assert (not b!627123))

