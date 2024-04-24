; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46016 () Bool)

(assert start!46016)

(declare-fun b!509588 () Bool)

(declare-fun res!310488 () Bool)

(declare-fun e!297976 () Bool)

(assert (=> b!509588 (=> (not res!310488) (not e!297976))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509588 (= res!310488 (validKeyInArray!0 k0!2280))))

(declare-fun b!509589 () Bool)

(declare-fun res!310491 () Bool)

(assert (=> b!509589 (=> (not res!310491) (not e!297976))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32728 0))(
  ( (array!32729 (arr!15742 (Array (_ BitVec 32) (_ BitVec 64))) (size!16106 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32728)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509589 (= res!310491 (and (= (size!16106 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16106 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16106 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509590 () Bool)

(declare-fun e!297978 () Bool)

(assert (=> b!509590 (= e!297978 (not true))))

(declare-datatypes ((SeekEntryResult!4165 0))(
  ( (MissingZero!4165 (index!18848 (_ BitVec 32))) (Found!4165 (index!18849 (_ BitVec 32))) (Intermediate!4165 (undefined!4977 Bool) (index!18850 (_ BitVec 32)) (x!47963 (_ BitVec 32))) (Undefined!4165) (MissingVacant!4165 (index!18851 (_ BitVec 32))) )
))
(declare-fun lt!232868 () SeekEntryResult!4165)

(declare-fun lt!232871 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32728 (_ BitVec 32)) SeekEntryResult!4165)

(assert (=> b!509590 (= lt!232868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232871 (select (store (arr!15742 a!3235) i!1204 k0!2280) j!176) (array!32729 (store (arr!15742 a!3235) i!1204 k0!2280) (size!16106 a!3235)) mask!3524))))

(declare-fun lt!232872 () SeekEntryResult!4165)

(declare-fun lt!232873 () (_ BitVec 32))

(assert (=> b!509590 (= lt!232872 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232873 (select (arr!15742 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509590 (= lt!232871 (toIndex!0 (select (store (arr!15742 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509590 (= lt!232873 (toIndex!0 (select (arr!15742 a!3235) j!176) mask!3524))))

(declare-fun e!297975 () Bool)

(assert (=> b!509590 e!297975))

(declare-fun res!310490 () Bool)

(assert (=> b!509590 (=> (not res!310490) (not e!297975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32728 (_ BitVec 32)) Bool)

(assert (=> b!509590 (= res!310490 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15649 0))(
  ( (Unit!15650) )
))
(declare-fun lt!232869 () Unit!15649)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15649)

(assert (=> b!509590 (= lt!232869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509591 () Bool)

(declare-fun res!310495 () Bool)

(assert (=> b!509591 (=> (not res!310495) (not e!297978))))

(declare-datatypes ((List!9807 0))(
  ( (Nil!9804) (Cons!9803 (h!10680 (_ BitVec 64)) (t!16027 List!9807)) )
))
(declare-fun arrayNoDuplicates!0 (array!32728 (_ BitVec 32) List!9807) Bool)

(assert (=> b!509591 (= res!310495 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9804))))

(declare-fun res!310492 () Bool)

(assert (=> start!46016 (=> (not res!310492) (not e!297976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46016 (= res!310492 (validMask!0 mask!3524))))

(assert (=> start!46016 e!297976))

(assert (=> start!46016 true))

(declare-fun array_inv!11601 (array!32728) Bool)

(assert (=> start!46016 (array_inv!11601 a!3235)))

(declare-fun b!509592 () Bool)

(declare-fun res!310493 () Bool)

(assert (=> b!509592 (=> (not res!310493) (not e!297978))))

(assert (=> b!509592 (= res!310493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509593 () Bool)

(declare-fun res!310487 () Bool)

(assert (=> b!509593 (=> (not res!310487) (not e!297976))))

(assert (=> b!509593 (= res!310487 (validKeyInArray!0 (select (arr!15742 a!3235) j!176)))))

(declare-fun b!509594 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32728 (_ BitVec 32)) SeekEntryResult!4165)

(assert (=> b!509594 (= e!297975 (= (seekEntryOrOpen!0 (select (arr!15742 a!3235) j!176) a!3235 mask!3524) (Found!4165 j!176)))))

(declare-fun b!509595 () Bool)

(declare-fun res!310494 () Bool)

(assert (=> b!509595 (=> (not res!310494) (not e!297976))))

(declare-fun arrayContainsKey!0 (array!32728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509595 (= res!310494 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509596 () Bool)

(assert (=> b!509596 (= e!297976 e!297978)))

(declare-fun res!310489 () Bool)

(assert (=> b!509596 (=> (not res!310489) (not e!297978))))

(declare-fun lt!232870 () SeekEntryResult!4165)

(assert (=> b!509596 (= res!310489 (or (= lt!232870 (MissingZero!4165 i!1204)) (= lt!232870 (MissingVacant!4165 i!1204))))))

(assert (=> b!509596 (= lt!232870 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46016 res!310492) b!509589))

(assert (= (and b!509589 res!310491) b!509593))

(assert (= (and b!509593 res!310487) b!509588))

(assert (= (and b!509588 res!310488) b!509595))

(assert (= (and b!509595 res!310494) b!509596))

(assert (= (and b!509596 res!310489) b!509592))

(assert (= (and b!509592 res!310493) b!509591))

(assert (= (and b!509591 res!310495) b!509590))

(assert (= (and b!509590 res!310490) b!509594))

(declare-fun m!490789 () Bool)

(assert (=> start!46016 m!490789))

(declare-fun m!490791 () Bool)

(assert (=> start!46016 m!490791))

(declare-fun m!490793 () Bool)

(assert (=> b!509591 m!490793))

(declare-fun m!490795 () Bool)

(assert (=> b!509596 m!490795))

(declare-fun m!490797 () Bool)

(assert (=> b!509593 m!490797))

(assert (=> b!509593 m!490797))

(declare-fun m!490799 () Bool)

(assert (=> b!509593 m!490799))

(declare-fun m!490801 () Bool)

(assert (=> b!509590 m!490801))

(declare-fun m!490803 () Bool)

(assert (=> b!509590 m!490803))

(assert (=> b!509590 m!490797))

(declare-fun m!490805 () Bool)

(assert (=> b!509590 m!490805))

(assert (=> b!509590 m!490797))

(assert (=> b!509590 m!490803))

(declare-fun m!490807 () Bool)

(assert (=> b!509590 m!490807))

(assert (=> b!509590 m!490803))

(declare-fun m!490809 () Bool)

(assert (=> b!509590 m!490809))

(declare-fun m!490811 () Bool)

(assert (=> b!509590 m!490811))

(declare-fun m!490813 () Bool)

(assert (=> b!509590 m!490813))

(assert (=> b!509590 m!490797))

(declare-fun m!490815 () Bool)

(assert (=> b!509590 m!490815))

(declare-fun m!490817 () Bool)

(assert (=> b!509592 m!490817))

(assert (=> b!509594 m!490797))

(assert (=> b!509594 m!490797))

(declare-fun m!490819 () Bool)

(assert (=> b!509594 m!490819))

(declare-fun m!490821 () Bool)

(assert (=> b!509595 m!490821))

(declare-fun m!490823 () Bool)

(assert (=> b!509588 m!490823))

(check-sat (not b!509596) (not b!509590) (not b!509588) (not b!509591) (not start!46016) (not b!509592) (not b!509593) (not b!509595) (not b!509594))
(check-sat)
