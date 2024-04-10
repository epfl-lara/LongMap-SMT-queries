; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56612 () Bool)

(assert start!56612)

(declare-fun b!627250 () Bool)

(declare-fun res!404955 () Bool)

(declare-fun e!359203 () Bool)

(assert (=> b!627250 (=> (not res!404955) (not e!359203))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37904 0))(
  ( (array!37905 (arr!18192 (Array (_ BitVec 32) (_ BitVec 64))) (size!18556 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37904)

(assert (=> b!627250 (= res!404955 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18192 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18192 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627251 () Bool)

(declare-fun res!404956 () Bool)

(declare-fun e!359205 () Bool)

(assert (=> b!627251 (=> (not res!404956) (not e!359205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627251 (= res!404956 (validKeyInArray!0 k!1786))))

(declare-fun b!627252 () Bool)

(declare-fun res!404957 () Bool)

(assert (=> b!627252 (=> (not res!404957) (not e!359205))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627252 (= res!404957 (validKeyInArray!0 (select (arr!18192 a!2986) j!136)))))

(declare-fun b!627253 () Bool)

(declare-fun res!404951 () Bool)

(assert (=> b!627253 (=> (not res!404951) (not e!359203))))

(assert (=> b!627253 (= res!404951 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18192 a!2986) index!984) (select (arr!18192 a!2986) j!136))) (not (= (select (arr!18192 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627254 () Bool)

(declare-fun res!404954 () Bool)

(assert (=> b!627254 (=> (not res!404954) (not e!359203))))

(declare-datatypes ((List!12233 0))(
  ( (Nil!12230) (Cons!12229 (h!13274 (_ BitVec 64)) (t!18461 List!12233)) )
))
(declare-fun arrayNoDuplicates!0 (array!37904 (_ BitVec 32) List!12233) Bool)

(assert (=> b!627254 (= res!404954 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12230))))

(declare-fun b!627255 () Bool)

(assert (=> b!627255 (= e!359203 false)))

(declare-fun lt!290245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627255 (= lt!290245 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627256 () Bool)

(declare-fun res!404953 () Bool)

(assert (=> b!627256 (=> (not res!404953) (not e!359205))))

(assert (=> b!627256 (= res!404953 (and (= (size!18556 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18556 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18556 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627257 () Bool)

(declare-fun res!404952 () Bool)

(assert (=> b!627257 (=> (not res!404952) (not e!359205))))

(declare-fun arrayContainsKey!0 (array!37904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627257 (= res!404952 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627259 () Bool)

(assert (=> b!627259 (= e!359205 e!359203)))

(declare-fun res!404950 () Bool)

(assert (=> b!627259 (=> (not res!404950) (not e!359203))))

(declare-datatypes ((SeekEntryResult!6632 0))(
  ( (MissingZero!6632 (index!28812 (_ BitVec 32))) (Found!6632 (index!28813 (_ BitVec 32))) (Intermediate!6632 (undefined!7444 Bool) (index!28814 (_ BitVec 32)) (x!57556 (_ BitVec 32))) (Undefined!6632) (MissingVacant!6632 (index!28815 (_ BitVec 32))) )
))
(declare-fun lt!290244 () SeekEntryResult!6632)

(assert (=> b!627259 (= res!404950 (or (= lt!290244 (MissingZero!6632 i!1108)) (= lt!290244 (MissingVacant!6632 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37904 (_ BitVec 32)) SeekEntryResult!6632)

(assert (=> b!627259 (= lt!290244 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!627260 () Bool)

(declare-fun res!404958 () Bool)

(assert (=> b!627260 (=> (not res!404958) (not e!359203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37904 (_ BitVec 32)) Bool)

(assert (=> b!627260 (= res!404958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!404959 () Bool)

(assert (=> start!56612 (=> (not res!404959) (not e!359205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56612 (= res!404959 (validMask!0 mask!3053))))

(assert (=> start!56612 e!359205))

(assert (=> start!56612 true))

(declare-fun array_inv!13988 (array!37904) Bool)

(assert (=> start!56612 (array_inv!13988 a!2986)))

(declare-fun b!627258 () Bool)

(declare-fun res!404960 () Bool)

(assert (=> b!627258 (=> (not res!404960) (not e!359203))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37904 (_ BitVec 32)) SeekEntryResult!6632)

(assert (=> b!627258 (= res!404960 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18192 a!2986) j!136) a!2986 mask!3053) (Found!6632 j!136)))))

(assert (= (and start!56612 res!404959) b!627256))

(assert (= (and b!627256 res!404953) b!627252))

(assert (= (and b!627252 res!404957) b!627251))

(assert (= (and b!627251 res!404956) b!627257))

(assert (= (and b!627257 res!404952) b!627259))

(assert (= (and b!627259 res!404950) b!627260))

(assert (= (and b!627260 res!404958) b!627254))

(assert (= (and b!627254 res!404954) b!627250))

(assert (= (and b!627250 res!404955) b!627258))

(assert (= (and b!627258 res!404960) b!627253))

(assert (= (and b!627253 res!404951) b!627255))

(declare-fun m!602577 () Bool)

(assert (=> b!627255 m!602577))

(declare-fun m!602579 () Bool)

(assert (=> b!627252 m!602579))

(assert (=> b!627252 m!602579))

(declare-fun m!602581 () Bool)

(assert (=> b!627252 m!602581))

(declare-fun m!602583 () Bool)

(assert (=> b!627253 m!602583))

(assert (=> b!627253 m!602579))

(declare-fun m!602585 () Bool)

(assert (=> start!56612 m!602585))

(declare-fun m!602587 () Bool)

(assert (=> start!56612 m!602587))

(assert (=> b!627258 m!602579))

(assert (=> b!627258 m!602579))

(declare-fun m!602589 () Bool)

(assert (=> b!627258 m!602589))

(declare-fun m!602591 () Bool)

(assert (=> b!627259 m!602591))

(declare-fun m!602593 () Bool)

(assert (=> b!627254 m!602593))

(declare-fun m!602595 () Bool)

(assert (=> b!627251 m!602595))

(declare-fun m!602597 () Bool)

(assert (=> b!627260 m!602597))

(declare-fun m!602599 () Bool)

(assert (=> b!627250 m!602599))

(declare-fun m!602601 () Bool)

(assert (=> b!627250 m!602601))

(declare-fun m!602603 () Bool)

(assert (=> b!627250 m!602603))

(declare-fun m!602605 () Bool)

(assert (=> b!627257 m!602605))

(push 1)

