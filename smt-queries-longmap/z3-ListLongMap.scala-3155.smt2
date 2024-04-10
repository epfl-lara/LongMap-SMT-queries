; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44456 () Bool)

(assert start!44456)

(declare-fun b!488250 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31611 0))(
  ( (array!31612 (arr!15196 (Array (_ BitVec 32) (_ BitVec 64))) (size!15560 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31611)

(declare-fun e!287240 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3663 0))(
  ( (MissingZero!3663 (index!16831 (_ BitVec 32))) (Found!3663 (index!16832 (_ BitVec 32))) (Intermediate!3663 (undefined!4475 Bool) (index!16833 (_ BitVec 32)) (x!45950 (_ BitVec 32))) (Undefined!3663) (MissingVacant!3663 (index!16834 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31611 (_ BitVec 32)) SeekEntryResult!3663)

(assert (=> b!488250 (= e!287240 (= (seekEntryOrOpen!0 (select (arr!15196 a!3235) j!176) a!3235 mask!3524) (Found!3663 j!176)))))

(declare-fun res!291419 () Bool)

(declare-fun e!287238 () Bool)

(assert (=> start!44456 (=> (not res!291419) (not e!287238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44456 (= res!291419 (validMask!0 mask!3524))))

(assert (=> start!44456 e!287238))

(assert (=> start!44456 true))

(declare-fun array_inv!10992 (array!31611) Bool)

(assert (=> start!44456 (array_inv!10992 a!3235)))

(declare-fun b!488251 () Bool)

(declare-fun res!291411 () Bool)

(declare-fun e!287239 () Bool)

(assert (=> b!488251 (=> (not res!291411) (not e!287239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31611 (_ BitVec 32)) Bool)

(assert (=> b!488251 (= res!291411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488252 () Bool)

(declare-fun res!291414 () Bool)

(assert (=> b!488252 (=> (not res!291414) (not e!287238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488252 (= res!291414 (validKeyInArray!0 (select (arr!15196 a!3235) j!176)))))

(declare-fun b!488253 () Bool)

(declare-fun res!291412 () Bool)

(assert (=> b!488253 (=> (not res!291412) (not e!287238))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488253 (= res!291412 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488254 () Bool)

(assert (=> b!488254 (= e!287239 (not true))))

(declare-fun lt!220349 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488254 (= lt!220349 (toIndex!0 (select (arr!15196 a!3235) j!176) mask!3524))))

(assert (=> b!488254 e!287240))

(declare-fun res!291415 () Bool)

(assert (=> b!488254 (=> (not res!291415) (not e!287240))))

(assert (=> b!488254 (= res!291415 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14272 0))(
  ( (Unit!14273) )
))
(declare-fun lt!220351 () Unit!14272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14272)

(assert (=> b!488254 (= lt!220351 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488255 () Bool)

(declare-fun res!291413 () Bool)

(assert (=> b!488255 (=> (not res!291413) (not e!287238))))

(assert (=> b!488255 (= res!291413 (validKeyInArray!0 k0!2280))))

(declare-fun b!488256 () Bool)

(assert (=> b!488256 (= e!287238 e!287239)))

(declare-fun res!291416 () Bool)

(assert (=> b!488256 (=> (not res!291416) (not e!287239))))

(declare-fun lt!220350 () SeekEntryResult!3663)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488256 (= res!291416 (or (= lt!220350 (MissingZero!3663 i!1204)) (= lt!220350 (MissingVacant!3663 i!1204))))))

(assert (=> b!488256 (= lt!220350 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488257 () Bool)

(declare-fun res!291417 () Bool)

(assert (=> b!488257 (=> (not res!291417) (not e!287238))))

(assert (=> b!488257 (= res!291417 (and (= (size!15560 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15560 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15560 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488258 () Bool)

(declare-fun res!291418 () Bool)

(assert (=> b!488258 (=> (not res!291418) (not e!287239))))

(declare-datatypes ((List!9354 0))(
  ( (Nil!9351) (Cons!9350 (h!10209 (_ BitVec 64)) (t!15582 List!9354)) )
))
(declare-fun arrayNoDuplicates!0 (array!31611 (_ BitVec 32) List!9354) Bool)

(assert (=> b!488258 (= res!291418 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9351))))

(assert (= (and start!44456 res!291419) b!488257))

(assert (= (and b!488257 res!291417) b!488252))

(assert (= (and b!488252 res!291414) b!488255))

(assert (= (and b!488255 res!291413) b!488253))

(assert (= (and b!488253 res!291412) b!488256))

(assert (= (and b!488256 res!291416) b!488251))

(assert (= (and b!488251 res!291411) b!488258))

(assert (= (and b!488258 res!291418) b!488254))

(assert (= (and b!488254 res!291415) b!488250))

(declare-fun m!467999 () Bool)

(assert (=> b!488258 m!467999))

(declare-fun m!468001 () Bool)

(assert (=> b!488253 m!468001))

(declare-fun m!468003 () Bool)

(assert (=> b!488255 m!468003))

(declare-fun m!468005 () Bool)

(assert (=> b!488252 m!468005))

(assert (=> b!488252 m!468005))

(declare-fun m!468007 () Bool)

(assert (=> b!488252 m!468007))

(assert (=> b!488254 m!468005))

(assert (=> b!488254 m!468005))

(declare-fun m!468009 () Bool)

(assert (=> b!488254 m!468009))

(declare-fun m!468011 () Bool)

(assert (=> b!488254 m!468011))

(declare-fun m!468013 () Bool)

(assert (=> b!488254 m!468013))

(assert (=> b!488250 m!468005))

(assert (=> b!488250 m!468005))

(declare-fun m!468015 () Bool)

(assert (=> b!488250 m!468015))

(declare-fun m!468017 () Bool)

(assert (=> b!488251 m!468017))

(declare-fun m!468019 () Bool)

(assert (=> b!488256 m!468019))

(declare-fun m!468021 () Bool)

(assert (=> start!44456 m!468021))

(declare-fun m!468023 () Bool)

(assert (=> start!44456 m!468023))

(check-sat (not start!44456) (not b!488253) (not b!488258) (not b!488256) (not b!488252) (not b!488251) (not b!488250) (not b!488255) (not b!488254))
(check-sat)
