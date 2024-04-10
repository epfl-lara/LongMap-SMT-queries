; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46020 () Bool)

(assert start!46020)

(declare-fun b!509568 () Bool)

(declare-fun res!310414 () Bool)

(declare-fun e!297981 () Bool)

(assert (=> b!509568 (=> (not res!310414) (not e!297981))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32731 0))(
  ( (array!32732 (arr!15744 (Array (_ BitVec 32) (_ BitVec 64))) (size!16108 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32731)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509568 (= res!310414 (and (= (size!16108 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16108 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16108 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509569 () Bool)

(declare-fun e!297979 () Bool)

(assert (=> b!509569 (= e!297979 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!232802 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4211 0))(
  ( (MissingZero!4211 (index!19032 (_ BitVec 32))) (Found!4211 (index!19033 (_ BitVec 32))) (Intermediate!4211 (undefined!5023 Bool) (index!19034 (_ BitVec 32)) (x!48004 (_ BitVec 32))) (Undefined!4211) (MissingVacant!4211 (index!19035 (_ BitVec 32))) )
))
(declare-fun lt!232807 () SeekEntryResult!4211)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32731 (_ BitVec 32)) SeekEntryResult!4211)

(assert (=> b!509569 (= lt!232807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232802 (select (store (arr!15744 a!3235) i!1204 k!2280) j!176) (array!32732 (store (arr!15744 a!3235) i!1204 k!2280) (size!16108 a!3235)) mask!3524))))

(declare-fun lt!232805 () SeekEntryResult!4211)

(declare-fun lt!232806 () (_ BitVec 32))

(assert (=> b!509569 (= lt!232805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232806 (select (arr!15744 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509569 (= lt!232802 (toIndex!0 (select (store (arr!15744 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509569 (= lt!232806 (toIndex!0 (select (arr!15744 a!3235) j!176) mask!3524))))

(declare-fun e!297978 () Bool)

(assert (=> b!509569 e!297978))

(declare-fun res!310416 () Bool)

(assert (=> b!509569 (=> (not res!310416) (not e!297978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32731 (_ BitVec 32)) Bool)

(assert (=> b!509569 (= res!310416 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15680 0))(
  ( (Unit!15681) )
))
(declare-fun lt!232804 () Unit!15680)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15680)

(assert (=> b!509569 (= lt!232804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509570 () Bool)

(declare-fun res!310418 () Bool)

(assert (=> b!509570 (=> (not res!310418) (not e!297981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509570 (= res!310418 (validKeyInArray!0 k!2280))))

(declare-fun b!509571 () Bool)

(declare-fun res!310417 () Bool)

(assert (=> b!509571 (=> (not res!310417) (not e!297979))))

(declare-datatypes ((List!9902 0))(
  ( (Nil!9899) (Cons!9898 (h!10775 (_ BitVec 64)) (t!16130 List!9902)) )
))
(declare-fun arrayNoDuplicates!0 (array!32731 (_ BitVec 32) List!9902) Bool)

(assert (=> b!509571 (= res!310417 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9899))))

(declare-fun res!310419 () Bool)

(assert (=> start!46020 (=> (not res!310419) (not e!297981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46020 (= res!310419 (validMask!0 mask!3524))))

(assert (=> start!46020 e!297981))

(assert (=> start!46020 true))

(declare-fun array_inv!11540 (array!32731) Bool)

(assert (=> start!46020 (array_inv!11540 a!3235)))

(declare-fun b!509572 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32731 (_ BitVec 32)) SeekEntryResult!4211)

(assert (=> b!509572 (= e!297978 (= (seekEntryOrOpen!0 (select (arr!15744 a!3235) j!176) a!3235 mask!3524) (Found!4211 j!176)))))

(declare-fun b!509573 () Bool)

(declare-fun res!310421 () Bool)

(assert (=> b!509573 (=> (not res!310421) (not e!297979))))

(assert (=> b!509573 (= res!310421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509574 () Bool)

(assert (=> b!509574 (= e!297981 e!297979)))

(declare-fun res!310413 () Bool)

(assert (=> b!509574 (=> (not res!310413) (not e!297979))))

(declare-fun lt!232803 () SeekEntryResult!4211)

(assert (=> b!509574 (= res!310413 (or (= lt!232803 (MissingZero!4211 i!1204)) (= lt!232803 (MissingVacant!4211 i!1204))))))

(assert (=> b!509574 (= lt!232803 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509575 () Bool)

(declare-fun res!310415 () Bool)

(assert (=> b!509575 (=> (not res!310415) (not e!297981))))

(declare-fun arrayContainsKey!0 (array!32731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509575 (= res!310415 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509576 () Bool)

(declare-fun res!310420 () Bool)

(assert (=> b!509576 (=> (not res!310420) (not e!297981))))

(assert (=> b!509576 (= res!310420 (validKeyInArray!0 (select (arr!15744 a!3235) j!176)))))

(assert (= (and start!46020 res!310419) b!509568))

(assert (= (and b!509568 res!310414) b!509576))

(assert (= (and b!509576 res!310420) b!509570))

(assert (= (and b!509570 res!310418) b!509575))

(assert (= (and b!509575 res!310415) b!509574))

(assert (= (and b!509574 res!310413) b!509573))

(assert (= (and b!509573 res!310421) b!509571))

(assert (= (and b!509571 res!310417) b!509569))

(assert (= (and b!509569 res!310416) b!509572))

(declare-fun m!490497 () Bool)

(assert (=> b!509570 m!490497))

(declare-fun m!490499 () Bool)

(assert (=> start!46020 m!490499))

(declare-fun m!490501 () Bool)

(assert (=> start!46020 m!490501))

(declare-fun m!490503 () Bool)

(assert (=> b!509569 m!490503))

(declare-fun m!490505 () Bool)

(assert (=> b!509569 m!490505))

(declare-fun m!490507 () Bool)

(assert (=> b!509569 m!490507))

(declare-fun m!490509 () Bool)

(assert (=> b!509569 m!490509))

(assert (=> b!509569 m!490503))

(declare-fun m!490511 () Bool)

(assert (=> b!509569 m!490511))

(declare-fun m!490513 () Bool)

(assert (=> b!509569 m!490513))

(assert (=> b!509569 m!490511))

(declare-fun m!490515 () Bool)

(assert (=> b!509569 m!490515))

(assert (=> b!509569 m!490511))

(declare-fun m!490517 () Bool)

(assert (=> b!509569 m!490517))

(assert (=> b!509569 m!490503))

(declare-fun m!490519 () Bool)

(assert (=> b!509569 m!490519))

(declare-fun m!490521 () Bool)

(assert (=> b!509575 m!490521))

(assert (=> b!509572 m!490511))

(assert (=> b!509572 m!490511))

(declare-fun m!490523 () Bool)

(assert (=> b!509572 m!490523))

(declare-fun m!490525 () Bool)

(assert (=> b!509573 m!490525))

(assert (=> b!509576 m!490511))

(assert (=> b!509576 m!490511))

(declare-fun m!490527 () Bool)

(assert (=> b!509576 m!490527))

(declare-fun m!490529 () Bool)

(assert (=> b!509574 m!490529))

(declare-fun m!490531 () Bool)

(assert (=> b!509571 m!490531))

(push 1)

