; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46032 () Bool)

(assert start!46032)

(declare-fun b!509730 () Bool)

(declare-fun e!298051 () Bool)

(declare-fun e!298052 () Bool)

(assert (=> b!509730 (= e!298051 e!298052)))

(declare-fun res!310575 () Bool)

(assert (=> b!509730 (=> (not res!310575) (not e!298052))))

(declare-datatypes ((SeekEntryResult!4217 0))(
  ( (MissingZero!4217 (index!19056 (_ BitVec 32))) (Found!4217 (index!19057 (_ BitVec 32))) (Intermediate!4217 (undefined!5029 Bool) (index!19058 (_ BitVec 32)) (x!48026 (_ BitVec 32))) (Undefined!4217) (MissingVacant!4217 (index!19059 (_ BitVec 32))) )
))
(declare-fun lt!232911 () SeekEntryResult!4217)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509730 (= res!310575 (or (= lt!232911 (MissingZero!4217 i!1204)) (= lt!232911 (MissingVacant!4217 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32743 0))(
  ( (array!32744 (arr!15750 (Array (_ BitVec 32) (_ BitVec 64))) (size!16114 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32743)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32743 (_ BitVec 32)) SeekEntryResult!4217)

(assert (=> b!509730 (= lt!232911 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509731 () Bool)

(assert (=> b!509731 (= e!298052 (not true))))

(declare-fun lt!232914 () (_ BitVec 32))

(declare-fun lt!232910 () SeekEntryResult!4217)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32743 (_ BitVec 32)) SeekEntryResult!4217)

(assert (=> b!509731 (= lt!232910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232914 (select (store (arr!15750 a!3235) i!1204 k!2280) j!176) (array!32744 (store (arr!15750 a!3235) i!1204 k!2280) (size!16114 a!3235)) mask!3524))))

(declare-fun lt!232915 () SeekEntryResult!4217)

(declare-fun lt!232912 () (_ BitVec 32))

(assert (=> b!509731 (= lt!232915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232912 (select (arr!15750 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509731 (= lt!232914 (toIndex!0 (select (store (arr!15750 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509731 (= lt!232912 (toIndex!0 (select (arr!15750 a!3235) j!176) mask!3524))))

(declare-fun e!298053 () Bool)

(assert (=> b!509731 e!298053))

(declare-fun res!310580 () Bool)

(assert (=> b!509731 (=> (not res!310580) (not e!298053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32743 (_ BitVec 32)) Bool)

(assert (=> b!509731 (= res!310580 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15692 0))(
  ( (Unit!15693) )
))
(declare-fun lt!232913 () Unit!15692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15692)

(assert (=> b!509731 (= lt!232913 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509732 () Bool)

(declare-fun res!310582 () Bool)

(assert (=> b!509732 (=> (not res!310582) (not e!298051))))

(declare-fun arrayContainsKey!0 (array!32743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509732 (= res!310582 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509733 () Bool)

(declare-fun res!310577 () Bool)

(assert (=> b!509733 (=> (not res!310577) (not e!298051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509733 (= res!310577 (validKeyInArray!0 k!2280))))

(declare-fun res!310579 () Bool)

(assert (=> start!46032 (=> (not res!310579) (not e!298051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46032 (= res!310579 (validMask!0 mask!3524))))

(assert (=> start!46032 e!298051))

(assert (=> start!46032 true))

(declare-fun array_inv!11546 (array!32743) Bool)

(assert (=> start!46032 (array_inv!11546 a!3235)))

(declare-fun b!509734 () Bool)

(declare-fun res!310583 () Bool)

(assert (=> b!509734 (=> (not res!310583) (not e!298051))))

(assert (=> b!509734 (= res!310583 (and (= (size!16114 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16114 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16114 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509735 () Bool)

(declare-fun res!310576 () Bool)

(assert (=> b!509735 (=> (not res!310576) (not e!298051))))

(assert (=> b!509735 (= res!310576 (validKeyInArray!0 (select (arr!15750 a!3235) j!176)))))

(declare-fun b!509736 () Bool)

(assert (=> b!509736 (= e!298053 (= (seekEntryOrOpen!0 (select (arr!15750 a!3235) j!176) a!3235 mask!3524) (Found!4217 j!176)))))

(declare-fun b!509737 () Bool)

(declare-fun res!310578 () Bool)

(assert (=> b!509737 (=> (not res!310578) (not e!298052))))

(assert (=> b!509737 (= res!310578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509738 () Bool)

(declare-fun res!310581 () Bool)

(assert (=> b!509738 (=> (not res!310581) (not e!298052))))

(declare-datatypes ((List!9908 0))(
  ( (Nil!9905) (Cons!9904 (h!10781 (_ BitVec 64)) (t!16136 List!9908)) )
))
(declare-fun arrayNoDuplicates!0 (array!32743 (_ BitVec 32) List!9908) Bool)

(assert (=> b!509738 (= res!310581 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9905))))

(assert (= (and start!46032 res!310579) b!509734))

(assert (= (and b!509734 res!310583) b!509735))

(assert (= (and b!509735 res!310576) b!509733))

(assert (= (and b!509733 res!310577) b!509732))

(assert (= (and b!509732 res!310582) b!509730))

(assert (= (and b!509730 res!310575) b!509737))

(assert (= (and b!509737 res!310578) b!509738))

(assert (= (and b!509738 res!310581) b!509731))

(assert (= (and b!509731 res!310580) b!509736))

(declare-fun m!490713 () Bool)

(assert (=> b!509735 m!490713))

(assert (=> b!509735 m!490713))

(declare-fun m!490715 () Bool)

(assert (=> b!509735 m!490715))

(declare-fun m!490717 () Bool)

(assert (=> start!46032 m!490717))

(declare-fun m!490719 () Bool)

(assert (=> start!46032 m!490719))

(assert (=> b!509736 m!490713))

(assert (=> b!509736 m!490713))

(declare-fun m!490721 () Bool)

(assert (=> b!509736 m!490721))

(declare-fun m!490723 () Bool)

(assert (=> b!509738 m!490723))

(declare-fun m!490725 () Bool)

(assert (=> b!509731 m!490725))

(declare-fun m!490727 () Bool)

(assert (=> b!509731 m!490727))

(declare-fun m!490729 () Bool)

(assert (=> b!509731 m!490729))

(assert (=> b!509731 m!490713))

(declare-fun m!490731 () Bool)

(assert (=> b!509731 m!490731))

(assert (=> b!509731 m!490713))

(declare-fun m!490733 () Bool)

(assert (=> b!509731 m!490733))

(assert (=> b!509731 m!490713))

(declare-fun m!490735 () Bool)

(assert (=> b!509731 m!490735))

(assert (=> b!509731 m!490729))

(declare-fun m!490737 () Bool)

(assert (=> b!509731 m!490737))

(assert (=> b!509731 m!490729))

(declare-fun m!490739 () Bool)

(assert (=> b!509731 m!490739))

(declare-fun m!490741 () Bool)

(assert (=> b!509733 m!490741))

(declare-fun m!490743 () Bool)

(assert (=> b!509737 m!490743))

(declare-fun m!490745 () Bool)

(assert (=> b!509732 m!490745))

(declare-fun m!490747 () Bool)

(assert (=> b!509730 m!490747))

(push 1)

