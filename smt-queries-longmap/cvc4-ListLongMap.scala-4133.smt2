; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56396 () Bool)

(assert start!56396)

(declare-fun b!625077 () Bool)

(declare-fun res!403088 () Bool)

(declare-fun e!358368 () Bool)

(assert (=> b!625077 (=> (not res!403088) (not e!358368))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37776 0))(
  ( (array!37777 (arr!18131 (Array (_ BitVec 32) (_ BitVec 64))) (size!18495 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37776)

(assert (=> b!625077 (= res!403088 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18131 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18131 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625078 () Bool)

(declare-fun res!403083 () Bool)

(declare-fun e!358367 () Bool)

(assert (=> b!625078 (=> (not res!403083) (not e!358367))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!625078 (= res!403083 (and (= (size!18495 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18495 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18495 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625079 () Bool)

(assert (=> b!625079 (= e!358368 false)))

(declare-datatypes ((SeekEntryResult!6571 0))(
  ( (MissingZero!6571 (index!28568 (_ BitVec 32))) (Found!6571 (index!28569 (_ BitVec 32))) (Intermediate!6571 (undefined!7383 Bool) (index!28570 (_ BitVec 32)) (x!57321 (_ BitVec 32))) (Undefined!6571) (MissingVacant!6571 (index!28571 (_ BitVec 32))) )
))
(declare-fun lt!289755 () SeekEntryResult!6571)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37776 (_ BitVec 32)) SeekEntryResult!6571)

(assert (=> b!625079 (= lt!289755 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18131 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625080 () Bool)

(declare-fun res!403084 () Bool)

(assert (=> b!625080 (=> (not res!403084) (not e!358368))))

(declare-datatypes ((List!12172 0))(
  ( (Nil!12169) (Cons!12168 (h!13213 (_ BitVec 64)) (t!18400 List!12172)) )
))
(declare-fun arrayNoDuplicates!0 (array!37776 (_ BitVec 32) List!12172) Bool)

(assert (=> b!625080 (= res!403084 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12169))))

(declare-fun b!625081 () Bool)

(declare-fun res!403091 () Bool)

(assert (=> b!625081 (=> (not res!403091) (not e!358367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625081 (= res!403091 (validKeyInArray!0 k!1786))))

(declare-fun b!625082 () Bool)

(declare-fun res!403089 () Bool)

(assert (=> b!625082 (=> (not res!403089) (not e!358367))))

(declare-fun arrayContainsKey!0 (array!37776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625082 (= res!403089 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625083 () Bool)

(assert (=> b!625083 (= e!358367 e!358368)))

(declare-fun res!403086 () Bool)

(assert (=> b!625083 (=> (not res!403086) (not e!358368))))

(declare-fun lt!289756 () SeekEntryResult!6571)

(assert (=> b!625083 (= res!403086 (or (= lt!289756 (MissingZero!6571 i!1108)) (= lt!289756 (MissingVacant!6571 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37776 (_ BitVec 32)) SeekEntryResult!6571)

(assert (=> b!625083 (= lt!289756 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!403085 () Bool)

(assert (=> start!56396 (=> (not res!403085) (not e!358367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56396 (= res!403085 (validMask!0 mask!3053))))

(assert (=> start!56396 e!358367))

(assert (=> start!56396 true))

(declare-fun array_inv!13927 (array!37776) Bool)

(assert (=> start!56396 (array_inv!13927 a!2986)))

(declare-fun b!625084 () Bool)

(declare-fun res!403090 () Bool)

(assert (=> b!625084 (=> (not res!403090) (not e!358367))))

(assert (=> b!625084 (= res!403090 (validKeyInArray!0 (select (arr!18131 a!2986) j!136)))))

(declare-fun b!625085 () Bool)

(declare-fun res!403087 () Bool)

(assert (=> b!625085 (=> (not res!403087) (not e!358368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37776 (_ BitVec 32)) Bool)

(assert (=> b!625085 (= res!403087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56396 res!403085) b!625078))

(assert (= (and b!625078 res!403083) b!625084))

(assert (= (and b!625084 res!403090) b!625081))

(assert (= (and b!625081 res!403091) b!625082))

(assert (= (and b!625082 res!403089) b!625083))

(assert (= (and b!625083 res!403086) b!625085))

(assert (= (and b!625085 res!403087) b!625080))

(assert (= (and b!625080 res!403084) b!625077))

(assert (= (and b!625077 res!403088) b!625079))

(declare-fun m!600669 () Bool)

(assert (=> b!625079 m!600669))

(assert (=> b!625079 m!600669))

(declare-fun m!600671 () Bool)

(assert (=> b!625079 m!600671))

(assert (=> b!625084 m!600669))

(assert (=> b!625084 m!600669))

(declare-fun m!600673 () Bool)

(assert (=> b!625084 m!600673))

(declare-fun m!600675 () Bool)

(assert (=> start!56396 m!600675))

(declare-fun m!600677 () Bool)

(assert (=> start!56396 m!600677))

(declare-fun m!600679 () Bool)

(assert (=> b!625080 m!600679))

(declare-fun m!600681 () Bool)

(assert (=> b!625081 m!600681))

(declare-fun m!600683 () Bool)

(assert (=> b!625077 m!600683))

(declare-fun m!600685 () Bool)

(assert (=> b!625077 m!600685))

(declare-fun m!600687 () Bool)

(assert (=> b!625077 m!600687))

(declare-fun m!600689 () Bool)

(assert (=> b!625085 m!600689))

(declare-fun m!600691 () Bool)

(assert (=> b!625083 m!600691))

(declare-fun m!600693 () Bool)

(assert (=> b!625082 m!600693))

(push 1)

(assert (not start!56396))

(assert (not b!625082))

(assert (not b!625083))

(assert (not b!625080))

(assert (not b!625081))

(assert (not b!625079))

