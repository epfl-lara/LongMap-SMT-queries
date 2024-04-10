; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56576 () Bool)

(assert start!56576)

(declare-fun b!626706 () Bool)

(declare-fun e!359042 () Bool)

(declare-fun e!359043 () Bool)

(assert (=> b!626706 (= e!359042 e!359043)))

(declare-fun res!404407 () Bool)

(assert (=> b!626706 (=> (not res!404407) (not e!359043))))

(declare-datatypes ((SeekEntryResult!6614 0))(
  ( (MissingZero!6614 (index!28740 (_ BitVec 32))) (Found!6614 (index!28741 (_ BitVec 32))) (Intermediate!6614 (undefined!7426 Bool) (index!28742 (_ BitVec 32)) (x!57490 (_ BitVec 32))) (Undefined!6614) (MissingVacant!6614 (index!28743 (_ BitVec 32))) )
))
(declare-fun lt!290136 () SeekEntryResult!6614)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626706 (= res!404407 (or (= lt!290136 (MissingZero!6614 i!1108)) (= lt!290136 (MissingVacant!6614 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37868 0))(
  ( (array!37869 (arr!18174 (Array (_ BitVec 32) (_ BitVec 64))) (size!18538 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37868)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37868 (_ BitVec 32)) SeekEntryResult!6614)

(assert (=> b!626706 (= lt!290136 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626707 () Bool)

(assert (=> b!626707 (= e!359043 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290137 () SeekEntryResult!6614)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37868 (_ BitVec 32)) SeekEntryResult!6614)

(assert (=> b!626707 (= lt!290137 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18174 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626708 () Bool)

(declare-fun res!404411 () Bool)

(assert (=> b!626708 (=> (not res!404411) (not e!359042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626708 (= res!404411 (validKeyInArray!0 (select (arr!18174 a!2986) j!136)))))

(declare-fun b!626709 () Bool)

(declare-fun res!404413 () Bool)

(assert (=> b!626709 (=> (not res!404413) (not e!359043))))

(declare-datatypes ((List!12215 0))(
  ( (Nil!12212) (Cons!12211 (h!13256 (_ BitVec 64)) (t!18443 List!12215)) )
))
(declare-fun arrayNoDuplicates!0 (array!37868 (_ BitVec 32) List!12215) Bool)

(assert (=> b!626709 (= res!404413 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12212))))

(declare-fun b!626710 () Bool)

(declare-fun res!404412 () Bool)

(assert (=> b!626710 (=> (not res!404412) (not e!359043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37868 (_ BitVec 32)) Bool)

(assert (=> b!626710 (= res!404412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404414 () Bool)

(assert (=> start!56576 (=> (not res!404414) (not e!359042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56576 (= res!404414 (validMask!0 mask!3053))))

(assert (=> start!56576 e!359042))

(assert (=> start!56576 true))

(declare-fun array_inv!13970 (array!37868) Bool)

(assert (=> start!56576 (array_inv!13970 a!2986)))

(declare-fun b!626711 () Bool)

(declare-fun res!404410 () Bool)

(assert (=> b!626711 (=> (not res!404410) (not e!359042))))

(assert (=> b!626711 (= res!404410 (validKeyInArray!0 k!1786))))

(declare-fun b!626712 () Bool)

(declare-fun res!404408 () Bool)

(assert (=> b!626712 (=> (not res!404408) (not e!359042))))

(declare-fun arrayContainsKey!0 (array!37868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626712 (= res!404408 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626713 () Bool)

(declare-fun res!404409 () Bool)

(assert (=> b!626713 (=> (not res!404409) (not e!359042))))

(assert (=> b!626713 (= res!404409 (and (= (size!18538 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18538 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18538 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626714 () Bool)

(declare-fun res!404406 () Bool)

(assert (=> b!626714 (=> (not res!404406) (not e!359043))))

(assert (=> b!626714 (= res!404406 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18174 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18174 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56576 res!404414) b!626713))

(assert (= (and b!626713 res!404409) b!626708))

(assert (= (and b!626708 res!404411) b!626711))

(assert (= (and b!626711 res!404410) b!626712))

(assert (= (and b!626712 res!404408) b!626706))

(assert (= (and b!626706 res!404407) b!626710))

(assert (= (and b!626710 res!404412) b!626709))

(assert (= (and b!626709 res!404413) b!626714))

(assert (= (and b!626714 res!404406) b!626707))

(declare-fun m!602073 () Bool)

(assert (=> b!626710 m!602073))

(declare-fun m!602075 () Bool)

(assert (=> b!626709 m!602075))

(declare-fun m!602077 () Bool)

(assert (=> b!626708 m!602077))

(assert (=> b!626708 m!602077))

(declare-fun m!602079 () Bool)

(assert (=> b!626708 m!602079))

(declare-fun m!602081 () Bool)

(assert (=> b!626712 m!602081))

(declare-fun m!602083 () Bool)

(assert (=> b!626714 m!602083))

(declare-fun m!602085 () Bool)

(assert (=> b!626714 m!602085))

(declare-fun m!602087 () Bool)

(assert (=> b!626714 m!602087))

(declare-fun m!602089 () Bool)

(assert (=> start!56576 m!602089))

(declare-fun m!602091 () Bool)

(assert (=> start!56576 m!602091))

(declare-fun m!602093 () Bool)

(assert (=> b!626711 m!602093))

(assert (=> b!626707 m!602077))

(assert (=> b!626707 m!602077))

(declare-fun m!602095 () Bool)

(assert (=> b!626707 m!602095))

(declare-fun m!602097 () Bool)

(assert (=> b!626706 m!602097))

(push 1)

(assert (not b!626712))

(assert (not b!626710))

(assert (not b!626709))

(assert (not b!626711))

(assert (not b!626708))

(assert (not start!56576))

(assert (not b!626707))

(assert (not b!626706))

(check-sat)

(pop 1)

