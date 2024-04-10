; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56586 () Bool)

(assert start!56586)

(declare-fun b!626841 () Bool)

(declare-fun res!404545 () Bool)

(declare-fun e!359087 () Bool)

(assert (=> b!626841 (=> (not res!404545) (not e!359087))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37878 0))(
  ( (array!37879 (arr!18179 (Array (_ BitVec 32) (_ BitVec 64))) (size!18543 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37878)

(assert (=> b!626841 (= res!404545 (and (= (size!18543 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18543 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18543 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626842 () Bool)

(declare-fun res!404542 () Bool)

(declare-fun e!359086 () Bool)

(assert (=> b!626842 (=> (not res!404542) (not e!359086))))

(declare-datatypes ((List!12220 0))(
  ( (Nil!12217) (Cons!12216 (h!13261 (_ BitVec 64)) (t!18448 List!12220)) )
))
(declare-fun arrayNoDuplicates!0 (array!37878 (_ BitVec 32) List!12220) Bool)

(assert (=> b!626842 (= res!404542 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12217))))

(declare-fun b!626843 () Bool)

(assert (=> b!626843 (= e!359086 false)))

(declare-datatypes ((SeekEntryResult!6619 0))(
  ( (MissingZero!6619 (index!28760 (_ BitVec 32))) (Found!6619 (index!28761 (_ BitVec 32))) (Intermediate!6619 (undefined!7431 Bool) (index!28762 (_ BitVec 32)) (x!57503 (_ BitVec 32))) (Undefined!6619) (MissingVacant!6619 (index!28763 (_ BitVec 32))) )
))
(declare-fun lt!290167 () SeekEntryResult!6619)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37878 (_ BitVec 32)) SeekEntryResult!6619)

(assert (=> b!626843 (= lt!290167 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18179 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626844 () Bool)

(declare-fun res!404547 () Bool)

(assert (=> b!626844 (=> (not res!404547) (not e!359087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626844 (= res!404547 (validKeyInArray!0 (select (arr!18179 a!2986) j!136)))))

(declare-fun b!626845 () Bool)

(declare-fun res!404546 () Bool)

(assert (=> b!626845 (=> (not res!404546) (not e!359086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37878 (_ BitVec 32)) Bool)

(assert (=> b!626845 (= res!404546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404543 () Bool)

(assert (=> start!56586 (=> (not res!404543) (not e!359087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56586 (= res!404543 (validMask!0 mask!3053))))

(assert (=> start!56586 e!359087))

(assert (=> start!56586 true))

(declare-fun array_inv!13975 (array!37878) Bool)

(assert (=> start!56586 (array_inv!13975 a!2986)))

(declare-fun b!626846 () Bool)

(declare-fun res!404549 () Bool)

(assert (=> b!626846 (=> (not res!404549) (not e!359087))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626846 (= res!404549 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626847 () Bool)

(assert (=> b!626847 (= e!359087 e!359086)))

(declare-fun res!404541 () Bool)

(assert (=> b!626847 (=> (not res!404541) (not e!359086))))

(declare-fun lt!290166 () SeekEntryResult!6619)

(assert (=> b!626847 (= res!404541 (or (= lt!290166 (MissingZero!6619 i!1108)) (= lt!290166 (MissingVacant!6619 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37878 (_ BitVec 32)) SeekEntryResult!6619)

(assert (=> b!626847 (= lt!290166 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626848 () Bool)

(declare-fun res!404544 () Bool)

(assert (=> b!626848 (=> (not res!404544) (not e!359086))))

(assert (=> b!626848 (= res!404544 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18179 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18179 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626849 () Bool)

(declare-fun res!404548 () Bool)

(assert (=> b!626849 (=> (not res!404548) (not e!359087))))

(assert (=> b!626849 (= res!404548 (validKeyInArray!0 k!1786))))

(assert (= (and start!56586 res!404543) b!626841))

(assert (= (and b!626841 res!404545) b!626844))

(assert (= (and b!626844 res!404547) b!626849))

(assert (= (and b!626849 res!404548) b!626846))

(assert (= (and b!626846 res!404549) b!626847))

(assert (= (and b!626847 res!404541) b!626845))

(assert (= (and b!626845 res!404546) b!626842))

(assert (= (and b!626842 res!404542) b!626848))

(assert (= (and b!626848 res!404544) b!626843))

(declare-fun m!602203 () Bool)

(assert (=> b!626842 m!602203))

(declare-fun m!602205 () Bool)

(assert (=> b!626849 m!602205))

(declare-fun m!602207 () Bool)

(assert (=> start!56586 m!602207))

(declare-fun m!602209 () Bool)

(assert (=> start!56586 m!602209))

(declare-fun m!602211 () Bool)

(assert (=> b!626843 m!602211))

(assert (=> b!626843 m!602211))

(declare-fun m!602213 () Bool)

(assert (=> b!626843 m!602213))

(assert (=> b!626844 m!602211))

(assert (=> b!626844 m!602211))

(declare-fun m!602215 () Bool)

(assert (=> b!626844 m!602215))

(declare-fun m!602217 () Bool)

(assert (=> b!626847 m!602217))

(declare-fun m!602219 () Bool)

(assert (=> b!626848 m!602219))

(declare-fun m!602221 () Bool)

(assert (=> b!626848 m!602221))

(declare-fun m!602223 () Bool)

(assert (=> b!626848 m!602223))

(declare-fun m!602225 () Bool)

(assert (=> b!626845 m!602225))

(declare-fun m!602227 () Bool)

(assert (=> b!626846 m!602227))

(push 1)

(assert (not start!56586))

(assert (not b!626846))

(assert (not b!626847))

(assert (not b!626845))

