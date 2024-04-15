; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53358 () Bool)

(assert start!53358)

(declare-fun b!580292 () Bool)

(declare-fun res!368252 () Bool)

(declare-fun e!333201 () Bool)

(assert (=> b!580292 (=> (not res!368252) (not e!333201))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36273 0))(
  ( (array!36274 (arr!17411 (Array (_ BitVec 32) (_ BitVec 64))) (size!17776 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36273)

(assert (=> b!580292 (= res!368252 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17411 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17411 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580293 () Bool)

(declare-fun res!368251 () Bool)

(declare-fun e!333200 () Bool)

(assert (=> b!580293 (=> (not res!368251) (not e!333200))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580293 (= res!368251 (validKeyInArray!0 (select (arr!17411 a!2986) j!136)))))

(declare-fun res!368256 () Bool)

(assert (=> start!53358 (=> (not res!368256) (not e!333200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53358 (= res!368256 (validMask!0 mask!3053))))

(assert (=> start!53358 e!333200))

(assert (=> start!53358 true))

(declare-fun array_inv!13294 (array!36273) Bool)

(assert (=> start!53358 (array_inv!13294 a!2986)))

(declare-fun b!580294 () Bool)

(assert (=> b!580294 (= e!333200 e!333201)))

(declare-fun res!368250 () Bool)

(assert (=> b!580294 (=> (not res!368250) (not e!333201))))

(declare-datatypes ((SeekEntryResult!5848 0))(
  ( (MissingZero!5848 (index!25619 (_ BitVec 32))) (Found!5848 (index!25620 (_ BitVec 32))) (Intermediate!5848 (undefined!6660 Bool) (index!25621 (_ BitVec 32)) (x!54504 (_ BitVec 32))) (Undefined!5848) (MissingVacant!5848 (index!25622 (_ BitVec 32))) )
))
(declare-fun lt!264499 () SeekEntryResult!5848)

(assert (=> b!580294 (= res!368250 (or (= lt!264499 (MissingZero!5848 i!1108)) (= lt!264499 (MissingVacant!5848 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36273 (_ BitVec 32)) SeekEntryResult!5848)

(assert (=> b!580294 (= lt!264499 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580295 () Bool)

(assert (=> b!580295 (= e!333201 false)))

(declare-fun lt!264498 () SeekEntryResult!5848)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36273 (_ BitVec 32)) SeekEntryResult!5848)

(assert (=> b!580295 (= lt!264498 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17411 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580296 () Bool)

(declare-fun res!368255 () Bool)

(assert (=> b!580296 (=> (not res!368255) (not e!333200))))

(assert (=> b!580296 (= res!368255 (validKeyInArray!0 k0!1786))))

(declare-fun b!580297 () Bool)

(declare-fun res!368258 () Bool)

(assert (=> b!580297 (=> (not res!368258) (not e!333201))))

(declare-datatypes ((List!11491 0))(
  ( (Nil!11488) (Cons!11487 (h!12532 (_ BitVec 64)) (t!17710 List!11491)) )
))
(declare-fun arrayNoDuplicates!0 (array!36273 (_ BitVec 32) List!11491) Bool)

(assert (=> b!580297 (= res!368258 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11488))))

(declare-fun b!580298 () Bool)

(declare-fun res!368257 () Bool)

(assert (=> b!580298 (=> (not res!368257) (not e!333200))))

(declare-fun arrayContainsKey!0 (array!36273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580298 (= res!368257 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580299 () Bool)

(declare-fun res!368254 () Bool)

(assert (=> b!580299 (=> (not res!368254) (not e!333201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36273 (_ BitVec 32)) Bool)

(assert (=> b!580299 (= res!368254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580300 () Bool)

(declare-fun res!368253 () Bool)

(assert (=> b!580300 (=> (not res!368253) (not e!333200))))

(assert (=> b!580300 (= res!368253 (and (= (size!17776 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17776 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17776 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53358 res!368256) b!580300))

(assert (= (and b!580300 res!368253) b!580293))

(assert (= (and b!580293 res!368251) b!580296))

(assert (= (and b!580296 res!368255) b!580298))

(assert (= (and b!580298 res!368257) b!580294))

(assert (= (and b!580294 res!368250) b!580299))

(assert (= (and b!580299 res!368254) b!580297))

(assert (= (and b!580297 res!368258) b!580292))

(assert (= (and b!580292 res!368252) b!580295))

(declare-fun m!558355 () Bool)

(assert (=> start!53358 m!558355))

(declare-fun m!558357 () Bool)

(assert (=> start!53358 m!558357))

(declare-fun m!558359 () Bool)

(assert (=> b!580292 m!558359))

(declare-fun m!558361 () Bool)

(assert (=> b!580292 m!558361))

(declare-fun m!558363 () Bool)

(assert (=> b!580292 m!558363))

(declare-fun m!558365 () Bool)

(assert (=> b!580299 m!558365))

(declare-fun m!558367 () Bool)

(assert (=> b!580298 m!558367))

(declare-fun m!558369 () Bool)

(assert (=> b!580293 m!558369))

(assert (=> b!580293 m!558369))

(declare-fun m!558371 () Bool)

(assert (=> b!580293 m!558371))

(declare-fun m!558373 () Bool)

(assert (=> b!580296 m!558373))

(declare-fun m!558375 () Bool)

(assert (=> b!580294 m!558375))

(assert (=> b!580295 m!558369))

(assert (=> b!580295 m!558369))

(declare-fun m!558377 () Bool)

(assert (=> b!580295 m!558377))

(declare-fun m!558379 () Bool)

(assert (=> b!580297 m!558379))

(check-sat (not b!580294) (not b!580296) (not b!580298) (not b!580297) (not start!53358) (not b!580299) (not b!580295) (not b!580293))
(check-sat)
