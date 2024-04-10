; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46022 () Bool)

(assert start!46022)

(declare-fun b!509595 () Bool)

(declare-fun res!310440 () Bool)

(declare-fun e!297990 () Bool)

(assert (=> b!509595 (=> (not res!310440) (not e!297990))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509595 (= res!310440 (validKeyInArray!0 k0!2280))))

(declare-fun res!310443 () Bool)

(assert (=> start!46022 (=> (not res!310443) (not e!297990))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46022 (= res!310443 (validMask!0 mask!3524))))

(assert (=> start!46022 e!297990))

(assert (=> start!46022 true))

(declare-datatypes ((array!32733 0))(
  ( (array!32734 (arr!15745 (Array (_ BitVec 32) (_ BitVec 64))) (size!16109 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32733)

(declare-fun array_inv!11541 (array!32733) Bool)

(assert (=> start!46022 (array_inv!11541 a!3235)))

(declare-fun e!297993 () Bool)

(declare-fun b!509596 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4212 0))(
  ( (MissingZero!4212 (index!19036 (_ BitVec 32))) (Found!4212 (index!19037 (_ BitVec 32))) (Intermediate!4212 (undefined!5024 Bool) (index!19038 (_ BitVec 32)) (x!48005 (_ BitVec 32))) (Undefined!4212) (MissingVacant!4212 (index!19039 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32733 (_ BitVec 32)) SeekEntryResult!4212)

(assert (=> b!509596 (= e!297993 (= (seekEntryOrOpen!0 (select (arr!15745 a!3235) j!176) a!3235 mask!3524) (Found!4212 j!176)))))

(declare-fun b!509597 () Bool)

(declare-fun res!310446 () Bool)

(declare-fun e!297991 () Bool)

(assert (=> b!509597 (=> (not res!310446) (not e!297991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32733 (_ BitVec 32)) Bool)

(assert (=> b!509597 (= res!310446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509598 () Bool)

(assert (=> b!509598 (= e!297990 e!297991)))

(declare-fun res!310447 () Bool)

(assert (=> b!509598 (=> (not res!310447) (not e!297991))))

(declare-fun lt!232821 () SeekEntryResult!4212)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509598 (= res!310447 (or (= lt!232821 (MissingZero!4212 i!1204)) (= lt!232821 (MissingVacant!4212 i!1204))))))

(assert (=> b!509598 (= lt!232821 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509599 () Bool)

(declare-fun res!310445 () Bool)

(assert (=> b!509599 (=> (not res!310445) (not e!297990))))

(declare-fun arrayContainsKey!0 (array!32733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509599 (= res!310445 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509600 () Bool)

(assert (=> b!509600 (= e!297991 (not true))))

(declare-fun lt!232822 () SeekEntryResult!4212)

(declare-fun lt!232824 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32733 (_ BitVec 32)) SeekEntryResult!4212)

(assert (=> b!509600 (= lt!232822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232824 (select (store (arr!15745 a!3235) i!1204 k0!2280) j!176) (array!32734 (store (arr!15745 a!3235) i!1204 k0!2280) (size!16109 a!3235)) mask!3524))))

(declare-fun lt!232825 () SeekEntryResult!4212)

(declare-fun lt!232820 () (_ BitVec 32))

(assert (=> b!509600 (= lt!232825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232820 (select (arr!15745 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509600 (= lt!232824 (toIndex!0 (select (store (arr!15745 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509600 (= lt!232820 (toIndex!0 (select (arr!15745 a!3235) j!176) mask!3524))))

(assert (=> b!509600 e!297993))

(declare-fun res!310444 () Bool)

(assert (=> b!509600 (=> (not res!310444) (not e!297993))))

(assert (=> b!509600 (= res!310444 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15682 0))(
  ( (Unit!15683) )
))
(declare-fun lt!232823 () Unit!15682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32733 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15682)

(assert (=> b!509600 (= lt!232823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509601 () Bool)

(declare-fun res!310442 () Bool)

(assert (=> b!509601 (=> (not res!310442) (not e!297991))))

(declare-datatypes ((List!9903 0))(
  ( (Nil!9900) (Cons!9899 (h!10776 (_ BitVec 64)) (t!16131 List!9903)) )
))
(declare-fun arrayNoDuplicates!0 (array!32733 (_ BitVec 32) List!9903) Bool)

(assert (=> b!509601 (= res!310442 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9900))))

(declare-fun b!509602 () Bool)

(declare-fun res!310441 () Bool)

(assert (=> b!509602 (=> (not res!310441) (not e!297990))))

(assert (=> b!509602 (= res!310441 (validKeyInArray!0 (select (arr!15745 a!3235) j!176)))))

(declare-fun b!509603 () Bool)

(declare-fun res!310448 () Bool)

(assert (=> b!509603 (=> (not res!310448) (not e!297990))))

(assert (=> b!509603 (= res!310448 (and (= (size!16109 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16109 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16109 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46022 res!310443) b!509603))

(assert (= (and b!509603 res!310448) b!509602))

(assert (= (and b!509602 res!310441) b!509595))

(assert (= (and b!509595 res!310440) b!509599))

(assert (= (and b!509599 res!310445) b!509598))

(assert (= (and b!509598 res!310447) b!509597))

(assert (= (and b!509597 res!310446) b!509601))

(assert (= (and b!509601 res!310442) b!509600))

(assert (= (and b!509600 res!310444) b!509596))

(declare-fun m!490533 () Bool)

(assert (=> b!509595 m!490533))

(declare-fun m!490535 () Bool)

(assert (=> b!509599 m!490535))

(declare-fun m!490537 () Bool)

(assert (=> b!509602 m!490537))

(assert (=> b!509602 m!490537))

(declare-fun m!490539 () Bool)

(assert (=> b!509602 m!490539))

(declare-fun m!490541 () Bool)

(assert (=> b!509601 m!490541))

(declare-fun m!490543 () Bool)

(assert (=> start!46022 m!490543))

(declare-fun m!490545 () Bool)

(assert (=> start!46022 m!490545))

(declare-fun m!490547 () Bool)

(assert (=> b!509598 m!490547))

(declare-fun m!490549 () Bool)

(assert (=> b!509597 m!490549))

(declare-fun m!490551 () Bool)

(assert (=> b!509600 m!490551))

(declare-fun m!490553 () Bool)

(assert (=> b!509600 m!490553))

(declare-fun m!490555 () Bool)

(assert (=> b!509600 m!490555))

(declare-fun m!490557 () Bool)

(assert (=> b!509600 m!490557))

(assert (=> b!509600 m!490551))

(assert (=> b!509600 m!490537))

(declare-fun m!490559 () Bool)

(assert (=> b!509600 m!490559))

(assert (=> b!509600 m!490537))

(declare-fun m!490561 () Bool)

(assert (=> b!509600 m!490561))

(assert (=> b!509600 m!490551))

(declare-fun m!490563 () Bool)

(assert (=> b!509600 m!490563))

(assert (=> b!509600 m!490537))

(declare-fun m!490565 () Bool)

(assert (=> b!509600 m!490565))

(assert (=> b!509596 m!490537))

(assert (=> b!509596 m!490537))

(declare-fun m!490567 () Bool)

(assert (=> b!509596 m!490567))

(check-sat (not b!509601) (not start!46022) (not b!509597) (not b!509600) (not b!509595) (not b!509602) (not b!509598) (not b!509599) (not b!509596))
(check-sat)
