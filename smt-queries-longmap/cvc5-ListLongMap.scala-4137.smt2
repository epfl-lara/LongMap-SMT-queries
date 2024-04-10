; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56416 () Bool)

(assert start!56416)

(declare-fun b!625349 () Bool)

(declare-fun res!403364 () Bool)

(declare-fun e!358458 () Bool)

(assert (=> b!625349 (=> (not res!403364) (not e!358458))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37796 0))(
  ( (array!37797 (arr!18141 (Array (_ BitVec 32) (_ BitVec 64))) (size!18505 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37796)

(assert (=> b!625349 (= res!403364 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18141 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18141 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625350 () Bool)

(declare-fun res!403361 () Bool)

(declare-fun e!358456 () Bool)

(assert (=> b!625350 (=> (not res!403361) (not e!358456))))

(declare-fun arrayContainsKey!0 (array!37796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625350 (= res!403361 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625351 () Bool)

(declare-fun res!403357 () Bool)

(assert (=> b!625351 (=> (not res!403357) (not e!358458))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6581 0))(
  ( (MissingZero!6581 (index!28608 (_ BitVec 32))) (Found!6581 (index!28609 (_ BitVec 32))) (Intermediate!6581 (undefined!7393 Bool) (index!28610 (_ BitVec 32)) (x!57363 (_ BitVec 32))) (Undefined!6581) (MissingVacant!6581 (index!28611 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37796 (_ BitVec 32)) SeekEntryResult!6581)

(assert (=> b!625351 (= res!403357 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18141 a!2986) j!136) a!2986 mask!3053) (Found!6581 j!136)))))

(declare-fun b!625352 () Bool)

(assert (=> b!625352 (= e!358456 e!358458)))

(declare-fun res!403359 () Bool)

(assert (=> b!625352 (=> (not res!403359) (not e!358458))))

(declare-fun lt!289813 () SeekEntryResult!6581)

(assert (=> b!625352 (= res!403359 (or (= lt!289813 (MissingZero!6581 i!1108)) (= lt!289813 (MissingVacant!6581 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37796 (_ BitVec 32)) SeekEntryResult!6581)

(assert (=> b!625352 (= lt!289813 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun res!403355 () Bool)

(assert (=> start!56416 (=> (not res!403355) (not e!358456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56416 (= res!403355 (validMask!0 mask!3053))))

(assert (=> start!56416 e!358456))

(assert (=> start!56416 true))

(declare-fun array_inv!13937 (array!37796) Bool)

(assert (=> start!56416 (array_inv!13937 a!2986)))

(declare-fun b!625353 () Bool)

(declare-fun res!403360 () Bool)

(assert (=> b!625353 (=> (not res!403360) (not e!358458))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37796 (_ BitVec 32)) Bool)

(assert (=> b!625353 (= res!403360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625354 () Bool)

(assert (=> b!625354 (= e!358458 (and (bvslt x!910 #b01111111111111111111111111111110) (bvsge index!984 (size!18505 a!2986))))))

(declare-fun b!625355 () Bool)

(declare-fun res!403356 () Bool)

(assert (=> b!625355 (=> (not res!403356) (not e!358456))))

(assert (=> b!625355 (= res!403356 (and (= (size!18505 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18505 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18505 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625356 () Bool)

(declare-fun res!403362 () Bool)

(assert (=> b!625356 (=> (not res!403362) (not e!358456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625356 (= res!403362 (validKeyInArray!0 k!1786))))

(declare-fun b!625357 () Bool)

(declare-fun res!403358 () Bool)

(assert (=> b!625357 (=> (not res!403358) (not e!358458))))

(declare-datatypes ((List!12182 0))(
  ( (Nil!12179) (Cons!12178 (h!13223 (_ BitVec 64)) (t!18410 List!12182)) )
))
(declare-fun arrayNoDuplicates!0 (array!37796 (_ BitVec 32) List!12182) Bool)

(assert (=> b!625357 (= res!403358 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12179))))

(declare-fun b!625358 () Bool)

(declare-fun res!403363 () Bool)

(assert (=> b!625358 (=> (not res!403363) (not e!358456))))

(assert (=> b!625358 (= res!403363 (validKeyInArray!0 (select (arr!18141 a!2986) j!136)))))

(assert (= (and start!56416 res!403355) b!625355))

(assert (= (and b!625355 res!403356) b!625358))

(assert (= (and b!625358 res!403363) b!625356))

(assert (= (and b!625356 res!403362) b!625350))

(assert (= (and b!625350 res!403361) b!625352))

(assert (= (and b!625352 res!403359) b!625353))

(assert (= (and b!625353 res!403360) b!625357))

(assert (= (and b!625357 res!403358) b!625349))

(assert (= (and b!625349 res!403364) b!625351))

(assert (= (and b!625351 res!403357) b!625354))

(declare-fun m!600929 () Bool)

(assert (=> b!625356 m!600929))

(declare-fun m!600931 () Bool)

(assert (=> b!625358 m!600931))

(assert (=> b!625358 m!600931))

(declare-fun m!600933 () Bool)

(assert (=> b!625358 m!600933))

(assert (=> b!625351 m!600931))

(assert (=> b!625351 m!600931))

(declare-fun m!600935 () Bool)

(assert (=> b!625351 m!600935))

(declare-fun m!600937 () Bool)

(assert (=> b!625357 m!600937))

(declare-fun m!600939 () Bool)

(assert (=> b!625353 m!600939))

(declare-fun m!600941 () Bool)

(assert (=> start!56416 m!600941))

(declare-fun m!600943 () Bool)

(assert (=> start!56416 m!600943))

(declare-fun m!600945 () Bool)

(assert (=> b!625350 m!600945))

(declare-fun m!600947 () Bool)

(assert (=> b!625352 m!600947))

(declare-fun m!600949 () Bool)

(assert (=> b!625349 m!600949))

(declare-fun m!600951 () Bool)

(assert (=> b!625349 m!600951))

(declare-fun m!600953 () Bool)

(assert (=> b!625349 m!600953))

(push 1)

(assert (not b!625353))

(assert (not b!625358))

(assert (not b!625356))

(assert (not b!625351))

(assert (not start!56416))

(assert (not b!625352))

(assert (not b!625350))

(assert (not b!625357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

