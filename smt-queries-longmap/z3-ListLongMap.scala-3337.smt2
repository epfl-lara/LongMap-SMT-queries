; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46016 () Bool)

(assert start!46016)

(declare-fun b!509514 () Bool)

(declare-fun res!310362 () Bool)

(declare-fun e!297955 () Bool)

(assert (=> b!509514 (=> (not res!310362) (not e!297955))))

(declare-datatypes ((array!32727 0))(
  ( (array!32728 (arr!15742 (Array (_ BitVec 32) (_ BitVec 64))) (size!16106 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32727)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509514 (= res!310362 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310361 () Bool)

(assert (=> start!46016 (=> (not res!310361) (not e!297955))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46016 (= res!310361 (validMask!0 mask!3524))))

(assert (=> start!46016 e!297955))

(assert (=> start!46016 true))

(declare-fun array_inv!11538 (array!32727) Bool)

(assert (=> start!46016 (array_inv!11538 a!3235)))

(declare-fun b!509515 () Bool)

(declare-fun res!310364 () Bool)

(assert (=> b!509515 (=> (not res!310364) (not e!297955))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509515 (= res!310364 (and (= (size!16106 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16106 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16106 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509516 () Bool)

(declare-fun res!310360 () Bool)

(assert (=> b!509516 (=> (not res!310360) (not e!297955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509516 (= res!310360 (validKeyInArray!0 k0!2280))))

(declare-fun b!509517 () Bool)

(declare-fun res!310366 () Bool)

(declare-fun e!297956 () Bool)

(assert (=> b!509517 (=> (not res!310366) (not e!297956))))

(declare-datatypes ((List!9900 0))(
  ( (Nil!9897) (Cons!9896 (h!10773 (_ BitVec 64)) (t!16128 List!9900)) )
))
(declare-fun arrayNoDuplicates!0 (array!32727 (_ BitVec 32) List!9900) Bool)

(assert (=> b!509517 (= res!310366 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9897))))

(declare-fun e!297957 () Bool)

(declare-fun b!509518 () Bool)

(declare-datatypes ((SeekEntryResult!4209 0))(
  ( (MissingZero!4209 (index!19024 (_ BitVec 32))) (Found!4209 (index!19025 (_ BitVec 32))) (Intermediate!4209 (undefined!5021 Bool) (index!19026 (_ BitVec 32)) (x!47994 (_ BitVec 32))) (Undefined!4209) (MissingVacant!4209 (index!19027 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32727 (_ BitVec 32)) SeekEntryResult!4209)

(assert (=> b!509518 (= e!297957 (= (seekEntryOrOpen!0 (select (arr!15742 a!3235) j!176) a!3235 mask!3524) (Found!4209 j!176)))))

(declare-fun b!509519 () Bool)

(assert (=> b!509519 (= e!297955 e!297956)))

(declare-fun res!310363 () Bool)

(assert (=> b!509519 (=> (not res!310363) (not e!297956))))

(declare-fun lt!232769 () SeekEntryResult!4209)

(assert (=> b!509519 (= res!310363 (or (= lt!232769 (MissingZero!4209 i!1204)) (= lt!232769 (MissingVacant!4209 i!1204))))))

(assert (=> b!509519 (= lt!232769 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509520 () Bool)

(declare-fun res!310367 () Bool)

(assert (=> b!509520 (=> (not res!310367) (not e!297955))))

(assert (=> b!509520 (= res!310367 (validKeyInArray!0 (select (arr!15742 a!3235) j!176)))))

(declare-fun b!509521 () Bool)

(declare-fun res!310359 () Bool)

(assert (=> b!509521 (=> (not res!310359) (not e!297956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32727 (_ BitVec 32)) Bool)

(assert (=> b!509521 (= res!310359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509522 () Bool)

(assert (=> b!509522 (= e!297956 (not true))))

(declare-fun lt!232768 () (_ BitVec 32))

(declare-fun lt!232766 () SeekEntryResult!4209)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32727 (_ BitVec 32)) SeekEntryResult!4209)

(assert (=> b!509522 (= lt!232766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232768 (select (store (arr!15742 a!3235) i!1204 k0!2280) j!176) (array!32728 (store (arr!15742 a!3235) i!1204 k0!2280) (size!16106 a!3235)) mask!3524))))

(declare-fun lt!232770 () SeekEntryResult!4209)

(declare-fun lt!232767 () (_ BitVec 32))

(assert (=> b!509522 (= lt!232770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232767 (select (arr!15742 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509522 (= lt!232768 (toIndex!0 (select (store (arr!15742 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509522 (= lt!232767 (toIndex!0 (select (arr!15742 a!3235) j!176) mask!3524))))

(assert (=> b!509522 e!297957))

(declare-fun res!310365 () Bool)

(assert (=> b!509522 (=> (not res!310365) (not e!297957))))

(assert (=> b!509522 (= res!310365 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15676 0))(
  ( (Unit!15677) )
))
(declare-fun lt!232771 () Unit!15676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15676)

(assert (=> b!509522 (= lt!232771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46016 res!310361) b!509515))

(assert (= (and b!509515 res!310364) b!509520))

(assert (= (and b!509520 res!310367) b!509516))

(assert (= (and b!509516 res!310360) b!509514))

(assert (= (and b!509514 res!310362) b!509519))

(assert (= (and b!509519 res!310363) b!509521))

(assert (= (and b!509521 res!310359) b!509517))

(assert (= (and b!509517 res!310366) b!509522))

(assert (= (and b!509522 res!310365) b!509518))

(declare-fun m!490425 () Bool)

(assert (=> b!509517 m!490425))

(declare-fun m!490427 () Bool)

(assert (=> b!509520 m!490427))

(assert (=> b!509520 m!490427))

(declare-fun m!490429 () Bool)

(assert (=> b!509520 m!490429))

(declare-fun m!490431 () Bool)

(assert (=> b!509521 m!490431))

(declare-fun m!490433 () Bool)

(assert (=> b!509522 m!490433))

(declare-fun m!490435 () Bool)

(assert (=> b!509522 m!490435))

(assert (=> b!509522 m!490427))

(declare-fun m!490437 () Bool)

(assert (=> b!509522 m!490437))

(assert (=> b!509522 m!490427))

(declare-fun m!490439 () Bool)

(assert (=> b!509522 m!490439))

(declare-fun m!490441 () Bool)

(assert (=> b!509522 m!490441))

(declare-fun m!490443 () Bool)

(assert (=> b!509522 m!490443))

(assert (=> b!509522 m!490427))

(declare-fun m!490445 () Bool)

(assert (=> b!509522 m!490445))

(assert (=> b!509522 m!490441))

(declare-fun m!490447 () Bool)

(assert (=> b!509522 m!490447))

(assert (=> b!509522 m!490441))

(declare-fun m!490449 () Bool)

(assert (=> b!509519 m!490449))

(declare-fun m!490451 () Bool)

(assert (=> b!509516 m!490451))

(assert (=> b!509518 m!490427))

(assert (=> b!509518 m!490427))

(declare-fun m!490453 () Bool)

(assert (=> b!509518 m!490453))

(declare-fun m!490455 () Bool)

(assert (=> start!46016 m!490455))

(declare-fun m!490457 () Bool)

(assert (=> start!46016 m!490457))

(declare-fun m!490459 () Bool)

(assert (=> b!509514 m!490459))

(check-sat (not b!509519) (not b!509521) (not start!46016) (not b!509522) (not b!509517) (not b!509518) (not b!509514) (not b!509516) (not b!509520))
(check-sat)
