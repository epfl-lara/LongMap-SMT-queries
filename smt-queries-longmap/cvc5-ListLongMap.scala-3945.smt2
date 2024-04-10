; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53680 () Bool)

(assert start!53680)

(declare-fun b!585150 () Bool)

(declare-fun res!372974 () Bool)

(declare-fun e!334888 () Bool)

(assert (=> b!585150 (=> (not res!372974) (not e!334888))))

(declare-datatypes ((array!36581 0))(
  ( (array!36582 (arr!17565 (Array (_ BitVec 32) (_ BitVec 64))) (size!17929 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36581)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585150 (= res!372974 (validKeyInArray!0 (select (arr!17565 a!2986) j!136)))))

(declare-fun b!585151 () Bool)

(declare-fun res!372975 () Bool)

(declare-fun e!334887 () Bool)

(assert (=> b!585151 (=> (not res!372975) (not e!334887))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6005 0))(
  ( (MissingZero!6005 (index!26247 (_ BitVec 32))) (Found!6005 (index!26248 (_ BitVec 32))) (Intermediate!6005 (undefined!6817 Bool) (index!26249 (_ BitVec 32)) (x!55074 (_ BitVec 32))) (Undefined!6005) (MissingVacant!6005 (index!26250 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36581 (_ BitVec 32)) SeekEntryResult!6005)

(assert (=> b!585151 (= res!372975 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17565 a!2986) j!136) a!2986 mask!3053) (Found!6005 j!136)))))

(declare-fun b!585152 () Bool)

(assert (=> b!585152 (= e!334888 e!334887)))

(declare-fun res!372971 () Bool)

(assert (=> b!585152 (=> (not res!372971) (not e!334887))))

(declare-fun lt!265752 () SeekEntryResult!6005)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585152 (= res!372971 (or (= lt!265752 (MissingZero!6005 i!1108)) (= lt!265752 (MissingVacant!6005 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36581 (_ BitVec 32)) SeekEntryResult!6005)

(assert (=> b!585152 (= lt!265752 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585153 () Bool)

(declare-fun res!372973 () Bool)

(assert (=> b!585153 (=> (not res!372973) (not e!334888))))

(assert (=> b!585153 (= res!372973 (validKeyInArray!0 k!1786))))

(declare-fun b!585154 () Bool)

(declare-fun e!334890 () Bool)

(assert (=> b!585154 (= e!334887 e!334890)))

(declare-fun res!372969 () Bool)

(assert (=> b!585154 (=> (not res!372969) (not e!334890))))

(declare-fun lt!265753 () (_ BitVec 32))

(assert (=> b!585154 (= res!372969 (and (bvsge lt!265753 #b00000000000000000000000000000000) (bvslt lt!265753 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585154 (= lt!265753 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!372977 () Bool)

(assert (=> start!53680 (=> (not res!372977) (not e!334888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53680 (= res!372977 (validMask!0 mask!3053))))

(assert (=> start!53680 e!334888))

(assert (=> start!53680 true))

(declare-fun array_inv!13361 (array!36581) Bool)

(assert (=> start!53680 (array_inv!13361 a!2986)))

(declare-fun b!585155 () Bool)

(declare-fun res!372966 () Bool)

(assert (=> b!585155 (=> (not res!372966) (not e!334887))))

(declare-datatypes ((List!11606 0))(
  ( (Nil!11603) (Cons!11602 (h!12647 (_ BitVec 64)) (t!17834 List!11606)) )
))
(declare-fun arrayNoDuplicates!0 (array!36581 (_ BitVec 32) List!11606) Bool)

(assert (=> b!585155 (= res!372966 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11603))))

(declare-fun b!585156 () Bool)

(declare-fun res!372968 () Bool)

(assert (=> b!585156 (=> (not res!372968) (not e!334888))))

(assert (=> b!585156 (= res!372968 (and (= (size!17929 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17929 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17929 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585157 () Bool)

(assert (=> b!585157 (= e!334890 false)))

(declare-fun lt!265751 () SeekEntryResult!6005)

(assert (=> b!585157 (= lt!265751 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265753 vacantSpotIndex!68 (select (arr!17565 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585158 () Bool)

(declare-fun res!372976 () Bool)

(assert (=> b!585158 (=> (not res!372976) (not e!334888))))

(declare-fun arrayContainsKey!0 (array!36581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585158 (= res!372976 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585159 () Bool)

(declare-fun res!372970 () Bool)

(assert (=> b!585159 (=> (not res!372970) (not e!334887))))

(assert (=> b!585159 (= res!372970 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17565 a!2986) index!984) (select (arr!17565 a!2986) j!136))) (not (= (select (arr!17565 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585160 () Bool)

(declare-fun res!372967 () Bool)

(assert (=> b!585160 (=> (not res!372967) (not e!334887))))

(assert (=> b!585160 (= res!372967 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17565 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17565 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585161 () Bool)

(declare-fun res!372972 () Bool)

(assert (=> b!585161 (=> (not res!372972) (not e!334887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36581 (_ BitVec 32)) Bool)

(assert (=> b!585161 (= res!372972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53680 res!372977) b!585156))

(assert (= (and b!585156 res!372968) b!585150))

(assert (= (and b!585150 res!372974) b!585153))

(assert (= (and b!585153 res!372973) b!585158))

(assert (= (and b!585158 res!372976) b!585152))

(assert (= (and b!585152 res!372971) b!585161))

(assert (= (and b!585161 res!372972) b!585155))

(assert (= (and b!585155 res!372966) b!585160))

(assert (= (and b!585160 res!372967) b!585151))

(assert (= (and b!585151 res!372975) b!585159))

(assert (= (and b!585159 res!372970) b!585154))

(assert (= (and b!585154 res!372969) b!585157))

(declare-fun m!563425 () Bool)

(assert (=> start!53680 m!563425))

(declare-fun m!563427 () Bool)

(assert (=> start!53680 m!563427))

(declare-fun m!563429 () Bool)

(assert (=> b!585157 m!563429))

(assert (=> b!585157 m!563429))

(declare-fun m!563431 () Bool)

(assert (=> b!585157 m!563431))

(declare-fun m!563433 () Bool)

(assert (=> b!585155 m!563433))

(declare-fun m!563435 () Bool)

(assert (=> b!585153 m!563435))

(declare-fun m!563437 () Bool)

(assert (=> b!585160 m!563437))

(declare-fun m!563439 () Bool)

(assert (=> b!585160 m!563439))

(declare-fun m!563441 () Bool)

(assert (=> b!585160 m!563441))

(declare-fun m!563443 () Bool)

(assert (=> b!585152 m!563443))

(declare-fun m!563445 () Bool)

(assert (=> b!585159 m!563445))

(assert (=> b!585159 m!563429))

(declare-fun m!563447 () Bool)

(assert (=> b!585158 m!563447))

(assert (=> b!585151 m!563429))

(assert (=> b!585151 m!563429))

(declare-fun m!563449 () Bool)

(assert (=> b!585151 m!563449))

(declare-fun m!563451 () Bool)

(assert (=> b!585154 m!563451))

(declare-fun m!563453 () Bool)

(assert (=> b!585161 m!563453))

(assert (=> b!585150 m!563429))

(assert (=> b!585150 m!563429))

(declare-fun m!563455 () Bool)

(assert (=> b!585150 m!563455))

(push 1)

(assert (not b!585151))

(assert (not start!53680))

(assert (not b!585154))

(assert (not b!585161))

(assert (not b!585155))

(assert (not b!585152))

(assert (not b!585158))

(assert (not b!585153))

(assert (not b!585150))

(assert (not b!585157))

(check-sat)

(pop 1)

