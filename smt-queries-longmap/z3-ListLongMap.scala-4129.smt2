; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56304 () Bool)

(assert start!56304)

(declare-fun b!624212 () Bool)

(declare-fun res!402508 () Bool)

(declare-fun e!357933 () Bool)

(assert (=> b!624212 (=> (not res!402508) (not e!357933))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624212 (= res!402508 (validKeyInArray!0 k0!1786))))

(declare-fun b!624213 () Bool)

(declare-fun res!402512 () Bool)

(declare-fun e!357931 () Bool)

(assert (=> b!624213 (=> (not res!402512) (not e!357931))))

(declare-datatypes ((array!37743 0))(
  ( (array!37744 (arr!18116 (Array (_ BitVec 32) (_ BitVec 64))) (size!18481 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37743)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37743 (_ BitVec 32)) Bool)

(assert (=> b!624213 (= res!402512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624214 () Bool)

(assert (=> b!624214 (= e!357933 e!357931)))

(declare-fun res!402509 () Bool)

(assert (=> b!624214 (=> (not res!402509) (not e!357931))))

(declare-datatypes ((SeekEntryResult!6553 0))(
  ( (MissingZero!6553 (index!28496 (_ BitVec 32))) (Found!6553 (index!28497 (_ BitVec 32))) (Intermediate!6553 (undefined!7365 Bool) (index!28498 (_ BitVec 32)) (x!57263 (_ BitVec 32))) (Undefined!6553) (MissingVacant!6553 (index!28499 (_ BitVec 32))) )
))
(declare-fun lt!289374 () SeekEntryResult!6553)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624214 (= res!402509 (or (= lt!289374 (MissingZero!6553 i!1108)) (= lt!289374 (MissingVacant!6553 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37743 (_ BitVec 32)) SeekEntryResult!6553)

(assert (=> b!624214 (= lt!289374 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624215 () Bool)

(declare-fun res!402506 () Bool)

(assert (=> b!624215 (=> (not res!402506) (not e!357933))))

(declare-fun arrayContainsKey!0 (array!37743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624215 (= res!402506 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624216 () Bool)

(declare-fun res!402511 () Bool)

(assert (=> b!624216 (=> (not res!402511) (not e!357931))))

(declare-datatypes ((List!12196 0))(
  ( (Nil!12193) (Cons!12192 (h!13237 (_ BitVec 64)) (t!18415 List!12196)) )
))
(declare-fun arrayNoDuplicates!0 (array!37743 (_ BitVec 32) List!12196) Bool)

(assert (=> b!624216 (= res!402511 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12193))))

(declare-fun b!624217 () Bool)

(declare-fun res!402507 () Bool)

(assert (=> b!624217 (=> (not res!402507) (not e!357931))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624217 (= res!402507 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18116 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18116 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624218 () Bool)

(declare-fun res!402505 () Bool)

(assert (=> b!624218 (=> (not res!402505) (not e!357933))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624218 (= res!402505 (and (= (size!18481 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18481 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18481 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624219 () Bool)

(assert (=> b!624219 (= e!357931 false)))

(declare-fun lt!289375 () SeekEntryResult!6553)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37743 (_ BitVec 32)) SeekEntryResult!6553)

(assert (=> b!624219 (= lt!289375 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18116 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!624220 () Bool)

(declare-fun res!402504 () Bool)

(assert (=> b!624220 (=> (not res!402504) (not e!357933))))

(assert (=> b!624220 (= res!402504 (validKeyInArray!0 (select (arr!18116 a!2986) j!136)))))

(declare-fun res!402510 () Bool)

(assert (=> start!56304 (=> (not res!402510) (not e!357933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56304 (= res!402510 (validMask!0 mask!3053))))

(assert (=> start!56304 e!357933))

(assert (=> start!56304 true))

(declare-fun array_inv!13999 (array!37743) Bool)

(assert (=> start!56304 (array_inv!13999 a!2986)))

(assert (= (and start!56304 res!402510) b!624218))

(assert (= (and b!624218 res!402505) b!624220))

(assert (= (and b!624220 res!402504) b!624212))

(assert (= (and b!624212 res!402508) b!624215))

(assert (= (and b!624215 res!402506) b!624214))

(assert (= (and b!624214 res!402509) b!624213))

(assert (= (and b!624213 res!402512) b!624216))

(assert (= (and b!624216 res!402511) b!624217))

(assert (= (and b!624217 res!402507) b!624219))

(declare-fun m!599407 () Bool)

(assert (=> b!624215 m!599407))

(declare-fun m!599409 () Bool)

(assert (=> b!624213 m!599409))

(declare-fun m!599411 () Bool)

(assert (=> b!624220 m!599411))

(assert (=> b!624220 m!599411))

(declare-fun m!599413 () Bool)

(assert (=> b!624220 m!599413))

(declare-fun m!599415 () Bool)

(assert (=> start!56304 m!599415))

(declare-fun m!599417 () Bool)

(assert (=> start!56304 m!599417))

(declare-fun m!599419 () Bool)

(assert (=> b!624217 m!599419))

(declare-fun m!599421 () Bool)

(assert (=> b!624217 m!599421))

(declare-fun m!599423 () Bool)

(assert (=> b!624217 m!599423))

(declare-fun m!599425 () Bool)

(assert (=> b!624216 m!599425))

(assert (=> b!624219 m!599411))

(assert (=> b!624219 m!599411))

(declare-fun m!599427 () Bool)

(assert (=> b!624219 m!599427))

(declare-fun m!599429 () Bool)

(assert (=> b!624212 m!599429))

(declare-fun m!599431 () Bool)

(assert (=> b!624214 m!599431))

(check-sat (not b!624220) (not b!624219) (not b!624212) (not b!624215) (not start!56304) (not b!624213) (not b!624214) (not b!624216))
(check-sat)
