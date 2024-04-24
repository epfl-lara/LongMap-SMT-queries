; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46208 () Bool)

(assert start!46208)

(declare-fun b!511699 () Bool)

(declare-fun res!312420 () Bool)

(declare-fun e!298955 () Bool)

(assert (=> b!511699 (=> (not res!312420) (not e!298955))))

(declare-datatypes ((array!32863 0))(
  ( (array!32864 (arr!15808 (Array (_ BitVec 32) (_ BitVec 64))) (size!16172 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32863)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511699 (= res!312420 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511700 () Bool)

(declare-fun res!312418 () Bool)

(assert (=> b!511700 (=> (not res!312418) (not e!298955))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511700 (= res!312418 (validKeyInArray!0 (select (arr!15808 a!3235) j!176)))))

(declare-fun b!511701 () Bool)

(declare-fun res!312424 () Bool)

(declare-fun e!298956 () Bool)

(assert (=> b!511701 (=> (not res!312424) (not e!298956))))

(declare-datatypes ((List!9873 0))(
  ( (Nil!9870) (Cons!9869 (h!10749 (_ BitVec 64)) (t!16093 List!9873)) )
))
(declare-fun arrayNoDuplicates!0 (array!32863 (_ BitVec 32) List!9873) Bool)

(assert (=> b!511701 (= res!312424 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9870))))

(declare-fun b!511703 () Bool)

(declare-fun res!312422 () Bool)

(assert (=> b!511703 (=> (not res!312422) (not e!298955))))

(assert (=> b!511703 (= res!312422 (validKeyInArray!0 k0!2280))))

(declare-fun b!511704 () Bool)

(declare-fun res!312421 () Bool)

(assert (=> b!511704 (=> (not res!312421) (not e!298955))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511704 (= res!312421 (and (= (size!16172 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16172 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16172 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511705 () Bool)

(assert (=> b!511705 (= e!298955 e!298956)))

(declare-fun res!312415 () Bool)

(assert (=> b!511705 (=> (not res!312415) (not e!298956))))

(declare-datatypes ((SeekEntryResult!4231 0))(
  ( (MissingZero!4231 (index!19112 (_ BitVec 32))) (Found!4231 (index!19113 (_ BitVec 32))) (Intermediate!4231 (undefined!5043 Bool) (index!19114 (_ BitVec 32)) (x!48211 (_ BitVec 32))) (Undefined!4231) (MissingVacant!4231 (index!19115 (_ BitVec 32))) )
))
(declare-fun lt!234185 () SeekEntryResult!4231)

(assert (=> b!511705 (= res!312415 (or (= lt!234185 (MissingZero!4231 i!1204)) (= lt!234185 (MissingVacant!4231 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32863 (_ BitVec 32)) SeekEntryResult!4231)

(assert (=> b!511705 (= lt!234185 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511702 () Bool)

(declare-fun res!312419 () Bool)

(assert (=> b!511702 (=> (not res!312419) (not e!298956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32863 (_ BitVec 32)) Bool)

(assert (=> b!511702 (= res!312419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!312423 () Bool)

(assert (=> start!46208 (=> (not res!312423) (not e!298955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46208 (= res!312423 (validMask!0 mask!3524))))

(assert (=> start!46208 e!298955))

(assert (=> start!46208 true))

(declare-fun array_inv!11667 (array!32863) Bool)

(assert (=> start!46208 (array_inv!11667 a!3235)))

(declare-fun b!511706 () Bool)

(declare-fun e!298954 () Bool)

(assert (=> b!511706 (= e!298954 true)))

(declare-fun lt!234190 () SeekEntryResult!4231)

(assert (=> b!511706 (= lt!234190 Undefined!4231)))

(declare-fun b!511707 () Bool)

(assert (=> b!511707 (= e!298956 (not e!298954))))

(declare-fun res!312416 () Bool)

(assert (=> b!511707 (=> res!312416 e!298954)))

(declare-fun lt!234188 () SeekEntryResult!4231)

(declare-fun lt!234186 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32863 (_ BitVec 32)) SeekEntryResult!4231)

(assert (=> b!511707 (= res!312416 (= lt!234188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234186 (select (store (arr!15808 a!3235) i!1204 k0!2280) j!176) (array!32864 (store (arr!15808 a!3235) i!1204 k0!2280) (size!16172 a!3235)) mask!3524)))))

(declare-fun lt!234187 () (_ BitVec 32))

(assert (=> b!511707 (= lt!234188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234187 (select (arr!15808 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511707 (= lt!234186 (toIndex!0 (select (store (arr!15808 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511707 (= lt!234187 (toIndex!0 (select (arr!15808 a!3235) j!176) mask!3524))))

(assert (=> b!511707 (= lt!234190 (Found!4231 j!176))))

(assert (=> b!511707 (= lt!234190 (seekEntryOrOpen!0 (select (arr!15808 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511707 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15781 0))(
  ( (Unit!15782) )
))
(declare-fun lt!234189 () Unit!15781)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15781)

(assert (=> b!511707 (= lt!234189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511708 () Bool)

(declare-fun res!312417 () Bool)

(assert (=> b!511708 (=> res!312417 e!298954)))

(get-info :version)

(assert (=> b!511708 (= res!312417 (or (not ((_ is Intermediate!4231) lt!234188)) (not (undefined!5043 lt!234188))))))

(assert (= (and start!46208 res!312423) b!511704))

(assert (= (and b!511704 res!312421) b!511700))

(assert (= (and b!511700 res!312418) b!511703))

(assert (= (and b!511703 res!312422) b!511699))

(assert (= (and b!511699 res!312420) b!511705))

(assert (= (and b!511705 res!312415) b!511702))

(assert (= (and b!511702 res!312419) b!511701))

(assert (= (and b!511701 res!312424) b!511707))

(assert (= (and b!511707 (not res!312416)) b!511708))

(assert (= (and b!511708 (not res!312417)) b!511706))

(declare-fun m!493465 () Bool)

(assert (=> start!46208 m!493465))

(declare-fun m!493467 () Bool)

(assert (=> start!46208 m!493467))

(declare-fun m!493469 () Bool)

(assert (=> b!511707 m!493469))

(declare-fun m!493471 () Bool)

(assert (=> b!511707 m!493471))

(declare-fun m!493473 () Bool)

(assert (=> b!511707 m!493473))

(declare-fun m!493475 () Bool)

(assert (=> b!511707 m!493475))

(declare-fun m!493477 () Bool)

(assert (=> b!511707 m!493477))

(assert (=> b!511707 m!493469))

(declare-fun m!493479 () Bool)

(assert (=> b!511707 m!493479))

(assert (=> b!511707 m!493469))

(assert (=> b!511707 m!493477))

(declare-fun m!493481 () Bool)

(assert (=> b!511707 m!493481))

(declare-fun m!493483 () Bool)

(assert (=> b!511707 m!493483))

(assert (=> b!511707 m!493469))

(declare-fun m!493485 () Bool)

(assert (=> b!511707 m!493485))

(assert (=> b!511707 m!493477))

(declare-fun m!493487 () Bool)

(assert (=> b!511707 m!493487))

(assert (=> b!511700 m!493469))

(assert (=> b!511700 m!493469))

(declare-fun m!493489 () Bool)

(assert (=> b!511700 m!493489))

(declare-fun m!493491 () Bool)

(assert (=> b!511703 m!493491))

(declare-fun m!493493 () Bool)

(assert (=> b!511699 m!493493))

(declare-fun m!493495 () Bool)

(assert (=> b!511702 m!493495))

(declare-fun m!493497 () Bool)

(assert (=> b!511705 m!493497))

(declare-fun m!493499 () Bool)

(assert (=> b!511701 m!493499))

(check-sat (not b!511701) (not b!511703) (not b!511702) (not start!46208) (not b!511707) (not b!511699) (not b!511700) (not b!511705))
(check-sat)
