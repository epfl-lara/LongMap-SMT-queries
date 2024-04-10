; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44522 () Bool)

(assert start!44522)

(declare-fun b!488676 () Bool)

(declare-fun res!291730 () Bool)

(declare-fun e!287473 () Bool)

(assert (=> b!488676 (=> (not res!291730) (not e!287473))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488676 (= res!291730 (validKeyInArray!0 k0!2280))))

(declare-fun b!488677 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31632 0))(
  ( (array!31633 (arr!15205 (Array (_ BitVec 32) (_ BitVec 64))) (size!15569 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31632)

(declare-fun e!287474 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3672 0))(
  ( (MissingZero!3672 (index!16867 (_ BitVec 32))) (Found!3672 (index!16868 (_ BitVec 32))) (Intermediate!3672 (undefined!4484 Bool) (index!16869 (_ BitVec 32)) (x!45983 (_ BitVec 32))) (Undefined!3672) (MissingVacant!3672 (index!16870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31632 (_ BitVec 32)) SeekEntryResult!3672)

(assert (=> b!488677 (= e!287474 (= (seekEntryOrOpen!0 (select (arr!15205 a!3235) j!176) a!3235 mask!3524) (Found!3672 j!176)))))

(declare-fun res!291725 () Bool)

(assert (=> start!44522 (=> (not res!291725) (not e!287473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44522 (= res!291725 (validMask!0 mask!3524))))

(assert (=> start!44522 e!287473))

(assert (=> start!44522 true))

(declare-fun array_inv!11001 (array!31632) Bool)

(assert (=> start!44522 (array_inv!11001 a!3235)))

(declare-fun b!488678 () Bool)

(declare-fun e!287472 () Bool)

(assert (=> b!488678 (= e!287472 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!220493 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488678 (= lt!220493 (toIndex!0 (select (store (arr!15205 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!488678 e!287474))

(declare-fun res!291723 () Bool)

(assert (=> b!488678 (=> (not res!291723) (not e!287474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31632 (_ BitVec 32)) Bool)

(assert (=> b!488678 (= res!291723 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14290 0))(
  ( (Unit!14291) )
))
(declare-fun lt!220495 () Unit!14290)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14290)

(assert (=> b!488678 (= lt!220495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488679 () Bool)

(declare-fun res!291728 () Bool)

(assert (=> b!488679 (=> (not res!291728) (not e!287473))))

(assert (=> b!488679 (= res!291728 (and (= (size!15569 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15569 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15569 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488680 () Bool)

(declare-fun res!291726 () Bool)

(assert (=> b!488680 (=> (not res!291726) (not e!287472))))

(declare-datatypes ((List!9363 0))(
  ( (Nil!9360) (Cons!9359 (h!10218 (_ BitVec 64)) (t!15591 List!9363)) )
))
(declare-fun arrayNoDuplicates!0 (array!31632 (_ BitVec 32) List!9363) Bool)

(assert (=> b!488680 (= res!291726 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9360))))

(declare-fun b!488681 () Bool)

(declare-fun res!291731 () Bool)

(assert (=> b!488681 (=> (not res!291731) (not e!287473))))

(declare-fun arrayContainsKey!0 (array!31632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488681 (= res!291731 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488682 () Bool)

(declare-fun res!291724 () Bool)

(assert (=> b!488682 (=> (not res!291724) (not e!287472))))

(assert (=> b!488682 (= res!291724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488683 () Bool)

(assert (=> b!488683 (= e!287473 e!287472)))

(declare-fun res!291729 () Bool)

(assert (=> b!488683 (=> (not res!291729) (not e!287472))))

(declare-fun lt!220494 () SeekEntryResult!3672)

(assert (=> b!488683 (= res!291729 (or (= lt!220494 (MissingZero!3672 i!1204)) (= lt!220494 (MissingVacant!3672 i!1204))))))

(assert (=> b!488683 (= lt!220494 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488684 () Bool)

(declare-fun res!291727 () Bool)

(assert (=> b!488684 (=> (not res!291727) (not e!287473))))

(assert (=> b!488684 (= res!291727 (validKeyInArray!0 (select (arr!15205 a!3235) j!176)))))

(assert (= (and start!44522 res!291725) b!488679))

(assert (= (and b!488679 res!291728) b!488684))

(assert (= (and b!488684 res!291727) b!488676))

(assert (= (and b!488676 res!291730) b!488681))

(assert (= (and b!488681 res!291731) b!488683))

(assert (= (and b!488683 res!291729) b!488682))

(assert (= (and b!488682 res!291724) b!488680))

(assert (= (and b!488680 res!291726) b!488678))

(assert (= (and b!488678 res!291723) b!488677))

(declare-fun m!468387 () Bool)

(assert (=> b!488680 m!468387))

(declare-fun m!468389 () Bool)

(assert (=> b!488677 m!468389))

(assert (=> b!488677 m!468389))

(declare-fun m!468391 () Bool)

(assert (=> b!488677 m!468391))

(declare-fun m!468393 () Bool)

(assert (=> b!488681 m!468393))

(assert (=> b!488684 m!468389))

(assert (=> b!488684 m!468389))

(declare-fun m!468395 () Bool)

(assert (=> b!488684 m!468395))

(declare-fun m!468397 () Bool)

(assert (=> start!44522 m!468397))

(declare-fun m!468399 () Bool)

(assert (=> start!44522 m!468399))

(declare-fun m!468401 () Bool)

(assert (=> b!488683 m!468401))

(declare-fun m!468403 () Bool)

(assert (=> b!488678 m!468403))

(declare-fun m!468405 () Bool)

(assert (=> b!488678 m!468405))

(declare-fun m!468407 () Bool)

(assert (=> b!488678 m!468407))

(declare-fun m!468409 () Bool)

(assert (=> b!488678 m!468409))

(assert (=> b!488678 m!468407))

(declare-fun m!468411 () Bool)

(assert (=> b!488678 m!468411))

(declare-fun m!468413 () Bool)

(assert (=> b!488676 m!468413))

(declare-fun m!468415 () Bool)

(assert (=> b!488682 m!468415))

(check-sat (not b!488681) (not b!488684) (not b!488676) (not b!488678) (not start!44522) (not b!488683) (not b!488677) (not b!488682) (not b!488680))
(check-sat)
