; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56598 () Bool)

(assert start!56598)

(declare-fun b!627019 () Bool)

(declare-fun e!359141 () Bool)

(assert (=> b!627019 (= e!359141 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290203 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627019 (= lt!290203 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627020 () Bool)

(declare-fun res!404723 () Bool)

(declare-fun e!359140 () Bool)

(assert (=> b!627020 (=> (not res!404723) (not e!359140))))

(declare-datatypes ((array!37890 0))(
  ( (array!37891 (arr!18185 (Array (_ BitVec 32) (_ BitVec 64))) (size!18549 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37890)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627020 (= res!404723 (validKeyInArray!0 (select (arr!18185 a!2986) j!136)))))

(declare-fun b!627021 () Bool)

(declare-fun res!404728 () Bool)

(assert (=> b!627021 (=> (not res!404728) (not e!359141))))

(assert (=> b!627021 (= res!404728 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18185 a!2986) index!984) (select (arr!18185 a!2986) j!136))) (not (= (select (arr!18185 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627022 () Bool)

(declare-fun res!404722 () Bool)

(assert (=> b!627022 (=> (not res!404722) (not e!359141))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627022 (= res!404722 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18185 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18185 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627023 () Bool)

(declare-fun res!404726 () Bool)

(assert (=> b!627023 (=> (not res!404726) (not e!359141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37890 (_ BitVec 32)) Bool)

(assert (=> b!627023 (= res!404726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404727 () Bool)

(assert (=> start!56598 (=> (not res!404727) (not e!359140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56598 (= res!404727 (validMask!0 mask!3053))))

(assert (=> start!56598 e!359140))

(assert (=> start!56598 true))

(declare-fun array_inv!13981 (array!37890) Bool)

(assert (=> start!56598 (array_inv!13981 a!2986)))

(declare-fun b!627024 () Bool)

(declare-fun res!404721 () Bool)

(assert (=> b!627024 (=> (not res!404721) (not e!359140))))

(assert (=> b!627024 (= res!404721 (validKeyInArray!0 k!1786))))

(declare-fun b!627025 () Bool)

(declare-fun res!404720 () Bool)

(assert (=> b!627025 (=> (not res!404720) (not e!359141))))

(declare-datatypes ((List!12226 0))(
  ( (Nil!12223) (Cons!12222 (h!13267 (_ BitVec 64)) (t!18454 List!12226)) )
))
(declare-fun arrayNoDuplicates!0 (array!37890 (_ BitVec 32) List!12226) Bool)

(assert (=> b!627025 (= res!404720 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12223))))

(declare-fun b!627026 () Bool)

(assert (=> b!627026 (= e!359140 e!359141)))

(declare-fun res!404719 () Bool)

(assert (=> b!627026 (=> (not res!404719) (not e!359141))))

(declare-datatypes ((SeekEntryResult!6625 0))(
  ( (MissingZero!6625 (index!28784 (_ BitVec 32))) (Found!6625 (index!28785 (_ BitVec 32))) (Intermediate!6625 (undefined!7437 Bool) (index!28786 (_ BitVec 32)) (x!57525 (_ BitVec 32))) (Undefined!6625) (MissingVacant!6625 (index!28787 (_ BitVec 32))) )
))
(declare-fun lt!290202 () SeekEntryResult!6625)

(assert (=> b!627026 (= res!404719 (or (= lt!290202 (MissingZero!6625 i!1108)) (= lt!290202 (MissingVacant!6625 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37890 (_ BitVec 32)) SeekEntryResult!6625)

(assert (=> b!627026 (= lt!290202 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627027 () Bool)

(declare-fun res!404725 () Bool)

(assert (=> b!627027 (=> (not res!404725) (not e!359140))))

(declare-fun arrayContainsKey!0 (array!37890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627027 (= res!404725 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627028 () Bool)

(declare-fun res!404729 () Bool)

(assert (=> b!627028 (=> (not res!404729) (not e!359141))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37890 (_ BitVec 32)) SeekEntryResult!6625)

(assert (=> b!627028 (= res!404729 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18185 a!2986) j!136) a!2986 mask!3053) (Found!6625 j!136)))))

(declare-fun b!627029 () Bool)

(declare-fun res!404724 () Bool)

(assert (=> b!627029 (=> (not res!404724) (not e!359140))))

(assert (=> b!627029 (= res!404724 (and (= (size!18549 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18549 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18549 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56598 res!404727) b!627029))

(assert (= (and b!627029 res!404724) b!627020))

(assert (= (and b!627020 res!404723) b!627024))

(assert (= (and b!627024 res!404721) b!627027))

(assert (= (and b!627027 res!404725) b!627026))

(assert (= (and b!627026 res!404719) b!627023))

(assert (= (and b!627023 res!404726) b!627025))

(assert (= (and b!627025 res!404720) b!627022))

(assert (= (and b!627022 res!404722) b!627028))

(assert (= (and b!627028 res!404729) b!627021))

(assert (= (and b!627021 res!404728) b!627019))

(declare-fun m!602367 () Bool)

(assert (=> start!56598 m!602367))

(declare-fun m!602369 () Bool)

(assert (=> start!56598 m!602369))

(declare-fun m!602371 () Bool)

(assert (=> b!627020 m!602371))

(assert (=> b!627020 m!602371))

(declare-fun m!602373 () Bool)

(assert (=> b!627020 m!602373))

(declare-fun m!602375 () Bool)

(assert (=> b!627022 m!602375))

(declare-fun m!602377 () Bool)

(assert (=> b!627022 m!602377))

(declare-fun m!602379 () Bool)

(assert (=> b!627022 m!602379))

(declare-fun m!602381 () Bool)

(assert (=> b!627019 m!602381))

(declare-fun m!602383 () Bool)

(assert (=> b!627026 m!602383))

(assert (=> b!627028 m!602371))

(assert (=> b!627028 m!602371))

(declare-fun m!602385 () Bool)

(assert (=> b!627028 m!602385))

(declare-fun m!602387 () Bool)

(assert (=> b!627024 m!602387))

(declare-fun m!602389 () Bool)

(assert (=> b!627025 m!602389))

(declare-fun m!602391 () Bool)

(assert (=> b!627021 m!602391))

(assert (=> b!627021 m!602371))

(declare-fun m!602393 () Bool)

(assert (=> b!627023 m!602393))

(declare-fun m!602395 () Bool)

(assert (=> b!627027 m!602395))

(push 1)

(assert (not b!627023))

(assert (not b!627025))

(assert (not b!627026))

(assert (not start!56598))

(assert (not b!627028))

(assert (not b!627027))

(assert (not b!627024))

(assert (not b!627020))

(assert (not b!627019))

