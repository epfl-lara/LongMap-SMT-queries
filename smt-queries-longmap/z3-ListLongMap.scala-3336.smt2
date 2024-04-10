; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46010 () Bool)

(assert start!46010)

(declare-fun e!297919 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32721 0))(
  ( (array!32722 (arr!15739 (Array (_ BitVec 32) (_ BitVec 64))) (size!16103 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32721)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!509433 () Bool)

(declare-datatypes ((SeekEntryResult!4206 0))(
  ( (MissingZero!4206 (index!19012 (_ BitVec 32))) (Found!4206 (index!19013 (_ BitVec 32))) (Intermediate!4206 (undefined!5018 Bool) (index!19014 (_ BitVec 32)) (x!47983 (_ BitVec 32))) (Undefined!4206) (MissingVacant!4206 (index!19015 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32721 (_ BitVec 32)) SeekEntryResult!4206)

(assert (=> b!509433 (= e!297919 (= (seekEntryOrOpen!0 (select (arr!15739 a!3235) j!176) a!3235 mask!3524) (Found!4206 j!176)))))

(declare-fun res!310286 () Bool)

(declare-fun e!297918 () Bool)

(assert (=> start!46010 (=> (not res!310286) (not e!297918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46010 (= res!310286 (validMask!0 mask!3524))))

(assert (=> start!46010 e!297918))

(assert (=> start!46010 true))

(declare-fun array_inv!11535 (array!32721) Bool)

(assert (=> start!46010 (array_inv!11535 a!3235)))

(declare-fun b!509434 () Bool)

(declare-fun res!310278 () Bool)

(assert (=> b!509434 (=> (not res!310278) (not e!297918))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509434 (= res!310278 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509435 () Bool)

(declare-fun e!297921 () Bool)

(assert (=> b!509435 (= e!297921 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232714 () SeekEntryResult!4206)

(declare-fun lt!232715 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32721 (_ BitVec 32)) SeekEntryResult!4206)

(assert (=> b!509435 (= lt!232714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232715 (select (store (arr!15739 a!3235) i!1204 k0!2280) j!176) (array!32722 (store (arr!15739 a!3235) i!1204 k0!2280) (size!16103 a!3235)) mask!3524))))

(declare-fun lt!232717 () (_ BitVec 32))

(declare-fun lt!232712 () SeekEntryResult!4206)

(assert (=> b!509435 (= lt!232712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232717 (select (arr!15739 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509435 (= lt!232715 (toIndex!0 (select (store (arr!15739 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509435 (= lt!232717 (toIndex!0 (select (arr!15739 a!3235) j!176) mask!3524))))

(assert (=> b!509435 e!297919))

(declare-fun res!310284 () Bool)

(assert (=> b!509435 (=> (not res!310284) (not e!297919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32721 (_ BitVec 32)) Bool)

(assert (=> b!509435 (= res!310284 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15670 0))(
  ( (Unit!15671) )
))
(declare-fun lt!232713 () Unit!15670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15670)

(assert (=> b!509435 (= lt!232713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509436 () Bool)

(declare-fun res!310282 () Bool)

(assert (=> b!509436 (=> (not res!310282) (not e!297921))))

(assert (=> b!509436 (= res!310282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509437 () Bool)

(declare-fun res!310279 () Bool)

(assert (=> b!509437 (=> (not res!310279) (not e!297921))))

(declare-datatypes ((List!9897 0))(
  ( (Nil!9894) (Cons!9893 (h!10770 (_ BitVec 64)) (t!16125 List!9897)) )
))
(declare-fun arrayNoDuplicates!0 (array!32721 (_ BitVec 32) List!9897) Bool)

(assert (=> b!509437 (= res!310279 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9894))))

(declare-fun b!509438 () Bool)

(declare-fun res!310280 () Bool)

(assert (=> b!509438 (=> (not res!310280) (not e!297918))))

(assert (=> b!509438 (= res!310280 (and (= (size!16103 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16103 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16103 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509439 () Bool)

(declare-fun res!310285 () Bool)

(assert (=> b!509439 (=> (not res!310285) (not e!297918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509439 (= res!310285 (validKeyInArray!0 k0!2280))))

(declare-fun b!509440 () Bool)

(declare-fun res!310283 () Bool)

(assert (=> b!509440 (=> (not res!310283) (not e!297918))))

(assert (=> b!509440 (= res!310283 (validKeyInArray!0 (select (arr!15739 a!3235) j!176)))))

(declare-fun b!509441 () Bool)

(assert (=> b!509441 (= e!297918 e!297921)))

(declare-fun res!310281 () Bool)

(assert (=> b!509441 (=> (not res!310281) (not e!297921))))

(declare-fun lt!232716 () SeekEntryResult!4206)

(assert (=> b!509441 (= res!310281 (or (= lt!232716 (MissingZero!4206 i!1204)) (= lt!232716 (MissingVacant!4206 i!1204))))))

(assert (=> b!509441 (= lt!232716 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46010 res!310286) b!509438))

(assert (= (and b!509438 res!310280) b!509440))

(assert (= (and b!509440 res!310283) b!509439))

(assert (= (and b!509439 res!310285) b!509434))

(assert (= (and b!509434 res!310278) b!509441))

(assert (= (and b!509441 res!310281) b!509436))

(assert (= (and b!509436 res!310282) b!509437))

(assert (= (and b!509437 res!310279) b!509435))

(assert (= (and b!509435 res!310284) b!509433))

(declare-fun m!490317 () Bool)

(assert (=> b!509439 m!490317))

(declare-fun m!490319 () Bool)

(assert (=> b!509437 m!490319))

(declare-fun m!490321 () Bool)

(assert (=> b!509436 m!490321))

(declare-fun m!490323 () Bool)

(assert (=> b!509434 m!490323))

(declare-fun m!490325 () Bool)

(assert (=> b!509440 m!490325))

(assert (=> b!509440 m!490325))

(declare-fun m!490327 () Bool)

(assert (=> b!509440 m!490327))

(assert (=> b!509433 m!490325))

(assert (=> b!509433 m!490325))

(declare-fun m!490329 () Bool)

(assert (=> b!509433 m!490329))

(declare-fun m!490331 () Bool)

(assert (=> start!46010 m!490331))

(declare-fun m!490333 () Bool)

(assert (=> start!46010 m!490333))

(assert (=> b!509435 m!490325))

(declare-fun m!490335 () Bool)

(assert (=> b!509435 m!490335))

(declare-fun m!490337 () Bool)

(assert (=> b!509435 m!490337))

(declare-fun m!490339 () Bool)

(assert (=> b!509435 m!490339))

(declare-fun m!490341 () Bool)

(assert (=> b!509435 m!490341))

(assert (=> b!509435 m!490341))

(declare-fun m!490343 () Bool)

(assert (=> b!509435 m!490343))

(assert (=> b!509435 m!490325))

(declare-fun m!490345 () Bool)

(assert (=> b!509435 m!490345))

(assert (=> b!509435 m!490325))

(declare-fun m!490347 () Bool)

(assert (=> b!509435 m!490347))

(assert (=> b!509435 m!490341))

(declare-fun m!490349 () Bool)

(assert (=> b!509435 m!490349))

(declare-fun m!490351 () Bool)

(assert (=> b!509441 m!490351))

(check-sat (not b!509441) (not b!509433) (not b!509437) (not start!46010) (not b!509440) (not b!509436) (not b!509439) (not b!509434) (not b!509435))
(check-sat)
