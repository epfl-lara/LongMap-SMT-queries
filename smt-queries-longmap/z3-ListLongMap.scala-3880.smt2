; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53292 () Bool)

(assert start!53292)

(declare-fun b!579456 () Bool)

(declare-fun res!367278 () Bool)

(declare-fun e!333006 () Bool)

(assert (=> b!579456 (=> (not res!367278) (not e!333006))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!36193 0))(
  ( (array!36194 (arr!17371 (Array (_ BitVec 32) (_ BitVec 64))) (size!17735 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36193)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!579456 (= res!367278 (and (= (size!17735 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17735 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17735 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579457 () Bool)

(declare-fun res!367272 () Bool)

(assert (=> b!579457 (=> (not res!367272) (not e!333006))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579457 (= res!367272 (validKeyInArray!0 k0!1786))))

(declare-fun b!579458 () Bool)

(declare-fun e!333005 () Bool)

(assert (=> b!579458 (= e!333005 false)))

(declare-datatypes ((SeekEntryResult!5811 0))(
  ( (MissingZero!5811 (index!25471 (_ BitVec 32))) (Found!5811 (index!25472 (_ BitVec 32))) (Intermediate!5811 (undefined!6623 Bool) (index!25473 (_ BitVec 32)) (x!54360 (_ BitVec 32))) (Undefined!5811) (MissingVacant!5811 (index!25474 (_ BitVec 32))) )
))
(declare-fun lt!264486 () SeekEntryResult!5811)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36193 (_ BitVec 32)) SeekEntryResult!5811)

(assert (=> b!579458 (= lt!264486 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17371 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579459 () Bool)

(declare-fun res!367273 () Bool)

(assert (=> b!579459 (=> (not res!367273) (not e!333006))))

(assert (=> b!579459 (= res!367273 (validKeyInArray!0 (select (arr!17371 a!2986) j!136)))))

(declare-fun b!579460 () Bool)

(declare-fun res!367274 () Bool)

(assert (=> b!579460 (=> (not res!367274) (not e!333005))))

(assert (=> b!579460 (= res!367274 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17371 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17371 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579461 () Bool)

(declare-fun res!367275 () Bool)

(assert (=> b!579461 (=> (not res!367275) (not e!333005))))

(declare-datatypes ((List!11412 0))(
  ( (Nil!11409) (Cons!11408 (h!12453 (_ BitVec 64)) (t!17640 List!11412)) )
))
(declare-fun arrayNoDuplicates!0 (array!36193 (_ BitVec 32) List!11412) Bool)

(assert (=> b!579461 (= res!367275 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11409))))

(declare-fun res!367276 () Bool)

(assert (=> start!53292 (=> (not res!367276) (not e!333006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53292 (= res!367276 (validMask!0 mask!3053))))

(assert (=> start!53292 e!333006))

(assert (=> start!53292 true))

(declare-fun array_inv!13167 (array!36193) Bool)

(assert (=> start!53292 (array_inv!13167 a!2986)))

(declare-fun b!579462 () Bool)

(declare-fun res!367279 () Bool)

(assert (=> b!579462 (=> (not res!367279) (not e!333005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36193 (_ BitVec 32)) Bool)

(assert (=> b!579462 (= res!367279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!579463 () Bool)

(declare-fun res!367280 () Bool)

(assert (=> b!579463 (=> (not res!367280) (not e!333006))))

(declare-fun arrayContainsKey!0 (array!36193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579463 (= res!367280 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579464 () Bool)

(assert (=> b!579464 (= e!333006 e!333005)))

(declare-fun res!367277 () Bool)

(assert (=> b!579464 (=> (not res!367277) (not e!333005))))

(declare-fun lt!264487 () SeekEntryResult!5811)

(assert (=> b!579464 (= res!367277 (or (= lt!264487 (MissingZero!5811 i!1108)) (= lt!264487 (MissingVacant!5811 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36193 (_ BitVec 32)) SeekEntryResult!5811)

(assert (=> b!579464 (= lt!264487 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53292 res!367276) b!579456))

(assert (= (and b!579456 res!367278) b!579459))

(assert (= (and b!579459 res!367273) b!579457))

(assert (= (and b!579457 res!367272) b!579463))

(assert (= (and b!579463 res!367280) b!579464))

(assert (= (and b!579464 res!367277) b!579462))

(assert (= (and b!579462 res!367279) b!579461))

(assert (= (and b!579461 res!367275) b!579460))

(assert (= (and b!579460 res!367274) b!579458))

(declare-fun m!558075 () Bool)

(assert (=> b!579461 m!558075))

(declare-fun m!558077 () Bool)

(assert (=> b!579458 m!558077))

(assert (=> b!579458 m!558077))

(declare-fun m!558079 () Bool)

(assert (=> b!579458 m!558079))

(declare-fun m!558081 () Bool)

(assert (=> b!579462 m!558081))

(declare-fun m!558083 () Bool)

(assert (=> b!579463 m!558083))

(declare-fun m!558085 () Bool)

(assert (=> b!579457 m!558085))

(assert (=> b!579459 m!558077))

(assert (=> b!579459 m!558077))

(declare-fun m!558087 () Bool)

(assert (=> b!579459 m!558087))

(declare-fun m!558089 () Bool)

(assert (=> b!579460 m!558089))

(declare-fun m!558091 () Bool)

(assert (=> b!579460 m!558091))

(declare-fun m!558093 () Bool)

(assert (=> b!579460 m!558093))

(declare-fun m!558095 () Bool)

(assert (=> b!579464 m!558095))

(declare-fun m!558097 () Bool)

(assert (=> start!53292 m!558097))

(declare-fun m!558099 () Bool)

(assert (=> start!53292 m!558099))

(check-sat (not b!579464) (not b!579458) (not b!579459) (not b!579461) (not b!579463) (not b!579457) (not start!53292) (not b!579462))
(check-sat)
