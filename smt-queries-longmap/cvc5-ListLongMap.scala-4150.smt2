; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56588 () Bool)

(assert start!56588)

(declare-fun res!404572 () Bool)

(declare-fun e!359095 () Bool)

(assert (=> start!56588 (=> (not res!404572) (not e!359095))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56588 (= res!404572 (validMask!0 mask!3053))))

(assert (=> start!56588 e!359095))

(assert (=> start!56588 true))

(declare-datatypes ((array!37880 0))(
  ( (array!37881 (arr!18180 (Array (_ BitVec 32) (_ BitVec 64))) (size!18544 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37880)

(declare-fun array_inv!13976 (array!37880) Bool)

(assert (=> start!56588 (array_inv!13976 a!2986)))

(declare-fun b!626868 () Bool)

(declare-fun res!404571 () Bool)

(declare-fun e!359096 () Bool)

(assert (=> b!626868 (=> (not res!404571) (not e!359096))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626868 (= res!404571 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18180 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18180 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626869 () Bool)

(assert (=> b!626869 (= e!359096 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6620 0))(
  ( (MissingZero!6620 (index!28764 (_ BitVec 32))) (Found!6620 (index!28765 (_ BitVec 32))) (Intermediate!6620 (undefined!7432 Bool) (index!28766 (_ BitVec 32)) (x!57512 (_ BitVec 32))) (Undefined!6620) (MissingVacant!6620 (index!28767 (_ BitVec 32))) )
))
(declare-fun lt!290172 () SeekEntryResult!6620)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37880 (_ BitVec 32)) SeekEntryResult!6620)

(assert (=> b!626869 (= lt!290172 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18180 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626870 () Bool)

(declare-fun res!404575 () Bool)

(assert (=> b!626870 (=> (not res!404575) (not e!359095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626870 (= res!404575 (validKeyInArray!0 (select (arr!18180 a!2986) j!136)))))

(declare-fun b!626871 () Bool)

(declare-fun res!404568 () Bool)

(assert (=> b!626871 (=> (not res!404568) (not e!359096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37880 (_ BitVec 32)) Bool)

(assert (=> b!626871 (= res!404568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626872 () Bool)

(assert (=> b!626872 (= e!359095 e!359096)))

(declare-fun res!404569 () Bool)

(assert (=> b!626872 (=> (not res!404569) (not e!359096))))

(declare-fun lt!290173 () SeekEntryResult!6620)

(assert (=> b!626872 (= res!404569 (or (= lt!290173 (MissingZero!6620 i!1108)) (= lt!290173 (MissingVacant!6620 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37880 (_ BitVec 32)) SeekEntryResult!6620)

(assert (=> b!626872 (= lt!290173 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626873 () Bool)

(declare-fun res!404570 () Bool)

(assert (=> b!626873 (=> (not res!404570) (not e!359095))))

(assert (=> b!626873 (= res!404570 (and (= (size!18544 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18544 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18544 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626874 () Bool)

(declare-fun res!404573 () Bool)

(assert (=> b!626874 (=> (not res!404573) (not e!359095))))

(declare-fun arrayContainsKey!0 (array!37880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626874 (= res!404573 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626875 () Bool)

(declare-fun res!404574 () Bool)

(assert (=> b!626875 (=> (not res!404574) (not e!359095))))

(assert (=> b!626875 (= res!404574 (validKeyInArray!0 k!1786))))

(declare-fun b!626876 () Bool)

(declare-fun res!404576 () Bool)

(assert (=> b!626876 (=> (not res!404576) (not e!359096))))

(declare-datatypes ((List!12221 0))(
  ( (Nil!12218) (Cons!12217 (h!13262 (_ BitVec 64)) (t!18449 List!12221)) )
))
(declare-fun arrayNoDuplicates!0 (array!37880 (_ BitVec 32) List!12221) Bool)

(assert (=> b!626876 (= res!404576 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12218))))

(assert (= (and start!56588 res!404572) b!626873))

(assert (= (and b!626873 res!404570) b!626870))

(assert (= (and b!626870 res!404575) b!626875))

(assert (= (and b!626875 res!404574) b!626874))

(assert (= (and b!626874 res!404573) b!626872))

(assert (= (and b!626872 res!404569) b!626871))

(assert (= (and b!626871 res!404568) b!626876))

(assert (= (and b!626876 res!404576) b!626868))

(assert (= (and b!626868 res!404571) b!626869))

(declare-fun m!602229 () Bool)

(assert (=> b!626874 m!602229))

(declare-fun m!602231 () Bool)

(assert (=> b!626876 m!602231))

(declare-fun m!602233 () Bool)

(assert (=> start!56588 m!602233))

(declare-fun m!602235 () Bool)

(assert (=> start!56588 m!602235))

(declare-fun m!602237 () Bool)

(assert (=> b!626875 m!602237))

(declare-fun m!602239 () Bool)

(assert (=> b!626872 m!602239))

(declare-fun m!602241 () Bool)

(assert (=> b!626868 m!602241))

(declare-fun m!602243 () Bool)

(assert (=> b!626868 m!602243))

(declare-fun m!602245 () Bool)

(assert (=> b!626868 m!602245))

(declare-fun m!602247 () Bool)

(assert (=> b!626869 m!602247))

(assert (=> b!626869 m!602247))

(declare-fun m!602249 () Bool)

(assert (=> b!626869 m!602249))

(assert (=> b!626870 m!602247))

(assert (=> b!626870 m!602247))

(declare-fun m!602251 () Bool)

(assert (=> b!626870 m!602251))

(declare-fun m!602253 () Bool)

(assert (=> b!626871 m!602253))

(push 1)

