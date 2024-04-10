; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46036 () Bool)

(assert start!46036)

(declare-fun b!509784 () Bool)

(declare-fun e!298074 () Bool)

(assert (=> b!509784 (= e!298074 (not true))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32747 0))(
  ( (array!32748 (arr!15752 (Array (_ BitVec 32) (_ BitVec 64))) (size!16116 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32747)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4219 0))(
  ( (MissingZero!4219 (index!19064 (_ BitVec 32))) (Found!4219 (index!19065 (_ BitVec 32))) (Intermediate!4219 (undefined!5031 Bool) (index!19066 (_ BitVec 32)) (x!48028 (_ BitVec 32))) (Undefined!4219) (MissingVacant!4219 (index!19067 (_ BitVec 32))) )
))
(declare-fun lt!232951 () SeekEntryResult!4219)

(declare-fun lt!232948 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32747 (_ BitVec 32)) SeekEntryResult!4219)

(assert (=> b!509784 (= lt!232951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232948 (select (store (arr!15752 a!3235) i!1204 k!2280) j!176) (array!32748 (store (arr!15752 a!3235) i!1204 k!2280) (size!16116 a!3235)) mask!3524))))

(declare-fun lt!232946 () (_ BitVec 32))

(declare-fun lt!232947 () SeekEntryResult!4219)

(assert (=> b!509784 (= lt!232947 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232946 (select (arr!15752 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509784 (= lt!232948 (toIndex!0 (select (store (arr!15752 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509784 (= lt!232946 (toIndex!0 (select (arr!15752 a!3235) j!176) mask!3524))))

(declare-fun e!298075 () Bool)

(assert (=> b!509784 e!298075))

(declare-fun res!310629 () Bool)

(assert (=> b!509784 (=> (not res!310629) (not e!298075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32747 (_ BitVec 32)) Bool)

(assert (=> b!509784 (= res!310629 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15696 0))(
  ( (Unit!15697) )
))
(declare-fun lt!232949 () Unit!15696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15696)

(assert (=> b!509784 (= lt!232949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509785 () Bool)

(declare-fun res!310635 () Bool)

(declare-fun e!298076 () Bool)

(assert (=> b!509785 (=> (not res!310635) (not e!298076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509785 (= res!310635 (validKeyInArray!0 k!2280))))

(declare-fun b!509787 () Bool)

(assert (=> b!509787 (= e!298076 e!298074)))

(declare-fun res!310630 () Bool)

(assert (=> b!509787 (=> (not res!310630) (not e!298074))))

(declare-fun lt!232950 () SeekEntryResult!4219)

(assert (=> b!509787 (= res!310630 (or (= lt!232950 (MissingZero!4219 i!1204)) (= lt!232950 (MissingVacant!4219 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32747 (_ BitVec 32)) SeekEntryResult!4219)

(assert (=> b!509787 (= lt!232950 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509788 () Bool)

(declare-fun res!310632 () Bool)

(assert (=> b!509788 (=> (not res!310632) (not e!298076))))

(declare-fun arrayContainsKey!0 (array!32747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509788 (= res!310632 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509789 () Bool)

(declare-fun res!310637 () Bool)

(assert (=> b!509789 (=> (not res!310637) (not e!298076))))

(assert (=> b!509789 (= res!310637 (validKeyInArray!0 (select (arr!15752 a!3235) j!176)))))

(declare-fun b!509790 () Bool)

(declare-fun res!310633 () Bool)

(assert (=> b!509790 (=> (not res!310633) (not e!298074))))

(declare-datatypes ((List!9910 0))(
  ( (Nil!9907) (Cons!9906 (h!10783 (_ BitVec 64)) (t!16138 List!9910)) )
))
(declare-fun arrayNoDuplicates!0 (array!32747 (_ BitVec 32) List!9910) Bool)

(assert (=> b!509790 (= res!310633 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9907))))

(declare-fun b!509786 () Bool)

(assert (=> b!509786 (= e!298075 (= (seekEntryOrOpen!0 (select (arr!15752 a!3235) j!176) a!3235 mask!3524) (Found!4219 j!176)))))

(declare-fun res!310634 () Bool)

(assert (=> start!46036 (=> (not res!310634) (not e!298076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46036 (= res!310634 (validMask!0 mask!3524))))

(assert (=> start!46036 e!298076))

(assert (=> start!46036 true))

(declare-fun array_inv!11548 (array!32747) Bool)

(assert (=> start!46036 (array_inv!11548 a!3235)))

(declare-fun b!509791 () Bool)

(declare-fun res!310631 () Bool)

(assert (=> b!509791 (=> (not res!310631) (not e!298076))))

(assert (=> b!509791 (= res!310631 (and (= (size!16116 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16116 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16116 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509792 () Bool)

(declare-fun res!310636 () Bool)

(assert (=> b!509792 (=> (not res!310636) (not e!298074))))

(assert (=> b!509792 (= res!310636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46036 res!310634) b!509791))

(assert (= (and b!509791 res!310631) b!509789))

(assert (= (and b!509789 res!310637) b!509785))

(assert (= (and b!509785 res!310635) b!509788))

(assert (= (and b!509788 res!310632) b!509787))

(assert (= (and b!509787 res!310630) b!509792))

(assert (= (and b!509792 res!310636) b!509790))

(assert (= (and b!509790 res!310633) b!509784))

(assert (= (and b!509784 res!310629) b!509786))

(declare-fun m!490785 () Bool)

(assert (=> start!46036 m!490785))

(declare-fun m!490787 () Bool)

(assert (=> start!46036 m!490787))

(declare-fun m!490789 () Bool)

(assert (=> b!509790 m!490789))

(declare-fun m!490791 () Bool)

(assert (=> b!509784 m!490791))

(declare-fun m!490793 () Bool)

(assert (=> b!509784 m!490793))

(declare-fun m!490795 () Bool)

(assert (=> b!509784 m!490795))

(declare-fun m!490797 () Bool)

(assert (=> b!509784 m!490797))

(declare-fun m!490799 () Bool)

(assert (=> b!509784 m!490799))

(declare-fun m!490801 () Bool)

(assert (=> b!509784 m!490801))

(assert (=> b!509784 m!490791))

(assert (=> b!509784 m!490797))

(declare-fun m!490803 () Bool)

(assert (=> b!509784 m!490803))

(assert (=> b!509784 m!490797))

(declare-fun m!490805 () Bool)

(assert (=> b!509784 m!490805))

(assert (=> b!509784 m!490791))

(declare-fun m!490807 () Bool)

(assert (=> b!509784 m!490807))

(declare-fun m!490809 () Bool)

(assert (=> b!509788 m!490809))

(assert (=> b!509786 m!490797))

(assert (=> b!509786 m!490797))

(declare-fun m!490811 () Bool)

(assert (=> b!509786 m!490811))

(declare-fun m!490813 () Bool)

(assert (=> b!509785 m!490813))

(assert (=> b!509789 m!490797))

(assert (=> b!509789 m!490797))

(declare-fun m!490815 () Bool)

(assert (=> b!509789 m!490815))

(declare-fun m!490817 () Bool)

(assert (=> b!509787 m!490817))

(declare-fun m!490819 () Bool)

(assert (=> b!509792 m!490819))

(push 1)

