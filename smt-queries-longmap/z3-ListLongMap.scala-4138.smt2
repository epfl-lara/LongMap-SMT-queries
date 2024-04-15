; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56406 () Bool)

(assert start!56406)

(declare-fun b!625166 () Bool)

(declare-fun res!403318 () Bool)

(declare-fun e!358311 () Bool)

(assert (=> b!625166 (=> (not res!403318) (not e!358311))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!37800 0))(
  ( (array!37801 (arr!18143 (Array (_ BitVec 32) (_ BitVec 64))) (size!18508 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37800)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625166 (= res!403318 (and (= (size!18508 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18508 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18508 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625168 () Bool)

(declare-fun res!403320 () Bool)

(assert (=> b!625168 (=> (not res!403320) (not e!358311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625168 (= res!403320 (validKeyInArray!0 (select (arr!18143 a!2986) j!136)))))

(declare-fun b!625169 () Bool)

(declare-fun res!403317 () Bool)

(declare-fun e!358310 () Bool)

(assert (=> b!625169 (=> (not res!403317) (not e!358310))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625169 (= res!403317 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18143 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18143 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625170 () Bool)

(assert (=> b!625170 (= e!358310 false)))

(declare-datatypes ((SeekEntryResult!6580 0))(
  ( (MissingZero!6580 (index!28604 (_ BitVec 32))) (Found!6580 (index!28605 (_ BitVec 32))) (Intermediate!6580 (undefined!7392 Bool) (index!28606 (_ BitVec 32)) (x!57365 (_ BitVec 32))) (Undefined!6580) (MissingVacant!6580 (index!28607 (_ BitVec 32))) )
))
(declare-fun lt!289591 () SeekEntryResult!6580)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37800 (_ BitVec 32)) SeekEntryResult!6580)

(assert (=> b!625170 (= lt!289591 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18143 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625171 () Bool)

(declare-fun res!403321 () Bool)

(assert (=> b!625171 (=> (not res!403321) (not e!358311))))

(declare-fun arrayContainsKey!0 (array!37800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625171 (= res!403321 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625172 () Bool)

(assert (=> b!625172 (= e!358311 e!358310)))

(declare-fun res!403319 () Bool)

(assert (=> b!625172 (=> (not res!403319) (not e!358310))))

(declare-fun lt!289590 () SeekEntryResult!6580)

(assert (=> b!625172 (= res!403319 (or (= lt!289590 (MissingZero!6580 i!1108)) (= lt!289590 (MissingVacant!6580 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37800 (_ BitVec 32)) SeekEntryResult!6580)

(assert (=> b!625172 (= lt!289590 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625167 () Bool)

(declare-fun res!403322 () Bool)

(assert (=> b!625167 (=> (not res!403322) (not e!358311))))

(assert (=> b!625167 (= res!403322 (validKeyInArray!0 k0!1786))))

(declare-fun res!403316 () Bool)

(assert (=> start!56406 (=> (not res!403316) (not e!358311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56406 (= res!403316 (validMask!0 mask!3053))))

(assert (=> start!56406 e!358311))

(assert (=> start!56406 true))

(declare-fun array_inv!14026 (array!37800) Bool)

(assert (=> start!56406 (array_inv!14026 a!2986)))

(declare-fun b!625173 () Bool)

(declare-fun res!403314 () Bool)

(assert (=> b!625173 (=> (not res!403314) (not e!358310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37800 (_ BitVec 32)) Bool)

(assert (=> b!625173 (= res!403314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625174 () Bool)

(declare-fun res!403315 () Bool)

(assert (=> b!625174 (=> (not res!403315) (not e!358310))))

(declare-datatypes ((List!12223 0))(
  ( (Nil!12220) (Cons!12219 (h!13264 (_ BitVec 64)) (t!18442 List!12223)) )
))
(declare-fun arrayNoDuplicates!0 (array!37800 (_ BitVec 32) List!12223) Bool)

(assert (=> b!625174 (= res!403315 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12220))))

(assert (= (and start!56406 res!403316) b!625166))

(assert (= (and b!625166 res!403318) b!625168))

(assert (= (and b!625168 res!403320) b!625167))

(assert (= (and b!625167 res!403322) b!625171))

(assert (= (and b!625171 res!403321) b!625172))

(assert (= (and b!625172 res!403319) b!625173))

(assert (= (and b!625173 res!403314) b!625174))

(assert (= (and b!625174 res!403315) b!625169))

(assert (= (and b!625169 res!403317) b!625170))

(declare-fun m!600235 () Bool)

(assert (=> b!625172 m!600235))

(declare-fun m!600237 () Bool)

(assert (=> b!625174 m!600237))

(declare-fun m!600239 () Bool)

(assert (=> b!625167 m!600239))

(declare-fun m!600241 () Bool)

(assert (=> b!625170 m!600241))

(assert (=> b!625170 m!600241))

(declare-fun m!600243 () Bool)

(assert (=> b!625170 m!600243))

(declare-fun m!600245 () Bool)

(assert (=> start!56406 m!600245))

(declare-fun m!600247 () Bool)

(assert (=> start!56406 m!600247))

(assert (=> b!625168 m!600241))

(assert (=> b!625168 m!600241))

(declare-fun m!600249 () Bool)

(assert (=> b!625168 m!600249))

(declare-fun m!600251 () Bool)

(assert (=> b!625171 m!600251))

(declare-fun m!600253 () Bool)

(assert (=> b!625173 m!600253))

(declare-fun m!600255 () Bool)

(assert (=> b!625169 m!600255))

(declare-fun m!600257 () Bool)

(assert (=> b!625169 m!600257))

(declare-fun m!600259 () Bool)

(assert (=> b!625169 m!600259))

(check-sat (not b!625167) (not b!625172) (not b!625173) (not b!625170) (not start!56406) (not b!625174) (not b!625168) (not b!625171))
(check-sat)
