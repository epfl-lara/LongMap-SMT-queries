; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53238 () Bool)

(assert start!53238)

(declare-fun b!578358 () Bool)

(declare-fun res!366073 () Bool)

(declare-fun e!332665 () Bool)

(assert (=> b!578358 (=> (not res!366073) (not e!332665))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36084 0))(
  ( (array!36085 (arr!17314 (Array (_ BitVec 32) (_ BitVec 64))) (size!17678 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36084)

(assert (=> b!578358 (= res!366073 (and (= (size!17678 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17678 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17678 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578359 () Bool)

(declare-fun res!366074 () Bool)

(assert (=> b!578359 (=> (not res!366074) (not e!332665))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578359 (= res!366074 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!366076 () Bool)

(assert (=> start!53238 (=> (not res!366076) (not e!332665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53238 (= res!366076 (validMask!0 mask!3053))))

(assert (=> start!53238 e!332665))

(assert (=> start!53238 true))

(declare-fun array_inv!13173 (array!36084) Bool)

(assert (=> start!53238 (array_inv!13173 a!2986)))

(declare-fun b!578360 () Bool)

(declare-fun res!366071 () Bool)

(assert (=> b!578360 (=> (not res!366071) (not e!332665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578360 (= res!366071 (validKeyInArray!0 (select (arr!17314 a!2986) j!136)))))

(declare-fun b!578361 () Bool)

(declare-fun res!366075 () Bool)

(declare-fun e!332666 () Bool)

(assert (=> b!578361 (=> (not res!366075) (not e!332666))))

(declare-datatypes ((List!11262 0))(
  ( (Nil!11259) (Cons!11258 (h!12306 (_ BitVec 64)) (t!17482 List!11262)) )
))
(declare-fun arrayNoDuplicates!0 (array!36084 (_ BitVec 32) List!11262) Bool)

(assert (=> b!578361 (= res!366075 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11259))))

(declare-fun b!578362 () Bool)

(declare-fun res!366069 () Bool)

(assert (=> b!578362 (=> (not res!366069) (not e!332666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36084 (_ BitVec 32)) Bool)

(assert (=> b!578362 (= res!366069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578363 () Bool)

(assert (=> b!578363 (= e!332665 e!332666)))

(declare-fun res!366072 () Bool)

(assert (=> b!578363 (=> (not res!366072) (not e!332666))))

(declare-datatypes ((SeekEntryResult!5710 0))(
  ( (MissingZero!5710 (index!25067 (_ BitVec 32))) (Found!5710 (index!25068 (_ BitVec 32))) (Intermediate!5710 (undefined!6522 Bool) (index!25069 (_ BitVec 32)) (x!54126 (_ BitVec 32))) (Undefined!5710) (MissingVacant!5710 (index!25070 (_ BitVec 32))) )
))
(declare-fun lt!264301 () SeekEntryResult!5710)

(assert (=> b!578363 (= res!366072 (or (= lt!264301 (MissingZero!5710 i!1108)) (= lt!264301 (MissingVacant!5710 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36084 (_ BitVec 32)) SeekEntryResult!5710)

(assert (=> b!578363 (= lt!264301 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun b!578364 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578364 (= e!332666 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17314 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17314 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(declare-fun b!578365 () Bool)

(declare-fun res!366070 () Bool)

(assert (=> b!578365 (=> (not res!366070) (not e!332665))))

(assert (=> b!578365 (= res!366070 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53238 res!366076) b!578358))

(assert (= (and b!578358 res!366073) b!578360))

(assert (= (and b!578360 res!366071) b!578365))

(assert (= (and b!578365 res!366070) b!578359))

(assert (= (and b!578359 res!366074) b!578363))

(assert (= (and b!578363 res!366072) b!578362))

(assert (= (and b!578362 res!366069) b!578361))

(assert (= (and b!578361 res!366075) b!578364))

(declare-fun m!557225 () Bool)

(assert (=> start!53238 m!557225))

(declare-fun m!557227 () Bool)

(assert (=> start!53238 m!557227))

(declare-fun m!557229 () Bool)

(assert (=> b!578361 m!557229))

(declare-fun m!557231 () Bool)

(assert (=> b!578359 m!557231))

(declare-fun m!557233 () Bool)

(assert (=> b!578360 m!557233))

(assert (=> b!578360 m!557233))

(declare-fun m!557235 () Bool)

(assert (=> b!578360 m!557235))

(declare-fun m!557237 () Bool)

(assert (=> b!578365 m!557237))

(declare-fun m!557239 () Bool)

(assert (=> b!578363 m!557239))

(declare-fun m!557241 () Bool)

(assert (=> b!578364 m!557241))

(declare-fun m!557243 () Bool)

(assert (=> b!578364 m!557243))

(declare-fun m!557245 () Bool)

(assert (=> b!578364 m!557245))

(declare-fun m!557247 () Bool)

(assert (=> b!578362 m!557247))

(check-sat (not start!53238) (not b!578362) (not b!578361) (not b!578360) (not b!578363) (not b!578365) (not b!578359))
(check-sat)
