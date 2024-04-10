; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46034 () Bool)

(assert start!46034)

(declare-fun b!509757 () Bool)

(declare-fun e!298063 () Bool)

(declare-fun e!298062 () Bool)

(assert (=> b!509757 (= e!298063 e!298062)))

(declare-fun res!310602 () Bool)

(assert (=> b!509757 (=> (not res!310602) (not e!298062))))

(declare-datatypes ((SeekEntryResult!4218 0))(
  ( (MissingZero!4218 (index!19060 (_ BitVec 32))) (Found!4218 (index!19061 (_ BitVec 32))) (Intermediate!4218 (undefined!5030 Bool) (index!19062 (_ BitVec 32)) (x!48027 (_ BitVec 32))) (Undefined!4218) (MissingVacant!4218 (index!19063 (_ BitVec 32))) )
))
(declare-fun lt!232930 () SeekEntryResult!4218)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509757 (= res!310602 (or (= lt!232930 (MissingZero!4218 i!1204)) (= lt!232930 (MissingVacant!4218 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32745 0))(
  ( (array!32746 (arr!15751 (Array (_ BitVec 32) (_ BitVec 64))) (size!16115 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32745 (_ BitVec 32)) SeekEntryResult!4218)

(assert (=> b!509757 (= lt!232930 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509758 () Bool)

(declare-fun res!310603 () Bool)

(assert (=> b!509758 (=> (not res!310603) (not e!298062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32745 (_ BitVec 32)) Bool)

(assert (=> b!509758 (= res!310603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310608 () Bool)

(assert (=> start!46034 (=> (not res!310608) (not e!298063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46034 (= res!310608 (validMask!0 mask!3524))))

(assert (=> start!46034 e!298063))

(assert (=> start!46034 true))

(declare-fun array_inv!11547 (array!32745) Bool)

(assert (=> start!46034 (array_inv!11547 a!3235)))

(declare-fun b!509759 () Bool)

(declare-fun res!310606 () Bool)

(assert (=> b!509759 (=> (not res!310606) (not e!298062))))

(declare-datatypes ((List!9909 0))(
  ( (Nil!9906) (Cons!9905 (h!10782 (_ BitVec 64)) (t!16137 List!9909)) )
))
(declare-fun arrayNoDuplicates!0 (array!32745 (_ BitVec 32) List!9909) Bool)

(assert (=> b!509759 (= res!310606 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9906))))

(declare-fun b!509760 () Bool)

(declare-fun res!310609 () Bool)

(assert (=> b!509760 (=> (not res!310609) (not e!298063))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509760 (= res!310609 (and (= (size!16115 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16115 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16115 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509761 () Bool)

(declare-fun res!310610 () Bool)

(assert (=> b!509761 (=> (not res!310610) (not e!298063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509761 (= res!310610 (validKeyInArray!0 (select (arr!15751 a!3235) j!176)))))

(declare-fun b!509762 () Bool)

(assert (=> b!509762 (= e!298062 (not true))))

(declare-fun lt!232933 () (_ BitVec 32))

(declare-fun lt!232928 () SeekEntryResult!4218)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32745 (_ BitVec 32)) SeekEntryResult!4218)

(assert (=> b!509762 (= lt!232928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232933 (select (store (arr!15751 a!3235) i!1204 k0!2280) j!176) (array!32746 (store (arr!15751 a!3235) i!1204 k0!2280) (size!16115 a!3235)) mask!3524))))

(declare-fun lt!232929 () (_ BitVec 32))

(declare-fun lt!232932 () SeekEntryResult!4218)

(assert (=> b!509762 (= lt!232932 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232929 (select (arr!15751 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509762 (= lt!232933 (toIndex!0 (select (store (arr!15751 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509762 (= lt!232929 (toIndex!0 (select (arr!15751 a!3235) j!176) mask!3524))))

(declare-fun e!298064 () Bool)

(assert (=> b!509762 e!298064))

(declare-fun res!310605 () Bool)

(assert (=> b!509762 (=> (not res!310605) (not e!298064))))

(assert (=> b!509762 (= res!310605 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15694 0))(
  ( (Unit!15695) )
))
(declare-fun lt!232931 () Unit!15694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15694)

(assert (=> b!509762 (= lt!232931 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509763 () Bool)

(declare-fun res!310607 () Bool)

(assert (=> b!509763 (=> (not res!310607) (not e!298063))))

(declare-fun arrayContainsKey!0 (array!32745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509763 (= res!310607 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509764 () Bool)

(declare-fun res!310604 () Bool)

(assert (=> b!509764 (=> (not res!310604) (not e!298063))))

(assert (=> b!509764 (= res!310604 (validKeyInArray!0 k0!2280))))

(declare-fun b!509765 () Bool)

(assert (=> b!509765 (= e!298064 (= (seekEntryOrOpen!0 (select (arr!15751 a!3235) j!176) a!3235 mask!3524) (Found!4218 j!176)))))

(assert (= (and start!46034 res!310608) b!509760))

(assert (= (and b!509760 res!310609) b!509761))

(assert (= (and b!509761 res!310610) b!509764))

(assert (= (and b!509764 res!310604) b!509763))

(assert (= (and b!509763 res!310607) b!509757))

(assert (= (and b!509757 res!310602) b!509758))

(assert (= (and b!509758 res!310603) b!509759))

(assert (= (and b!509759 res!310606) b!509762))

(assert (= (and b!509762 res!310605) b!509765))

(declare-fun m!490749 () Bool)

(assert (=> b!509757 m!490749))

(declare-fun m!490751 () Bool)

(assert (=> b!509763 m!490751))

(declare-fun m!490753 () Bool)

(assert (=> b!509765 m!490753))

(assert (=> b!509765 m!490753))

(declare-fun m!490755 () Bool)

(assert (=> b!509765 m!490755))

(assert (=> b!509761 m!490753))

(assert (=> b!509761 m!490753))

(declare-fun m!490757 () Bool)

(assert (=> b!509761 m!490757))

(declare-fun m!490759 () Bool)

(assert (=> b!509764 m!490759))

(declare-fun m!490761 () Bool)

(assert (=> b!509762 m!490761))

(declare-fun m!490763 () Bool)

(assert (=> b!509762 m!490763))

(declare-fun m!490765 () Bool)

(assert (=> b!509762 m!490765))

(assert (=> b!509762 m!490765))

(declare-fun m!490767 () Bool)

(assert (=> b!509762 m!490767))

(assert (=> b!509762 m!490753))

(declare-fun m!490769 () Bool)

(assert (=> b!509762 m!490769))

(assert (=> b!509762 m!490753))

(declare-fun m!490771 () Bool)

(assert (=> b!509762 m!490771))

(assert (=> b!509762 m!490753))

(declare-fun m!490773 () Bool)

(assert (=> b!509762 m!490773))

(assert (=> b!509762 m!490765))

(declare-fun m!490775 () Bool)

(assert (=> b!509762 m!490775))

(declare-fun m!490777 () Bool)

(assert (=> b!509758 m!490777))

(declare-fun m!490779 () Bool)

(assert (=> start!46034 m!490779))

(declare-fun m!490781 () Bool)

(assert (=> start!46034 m!490781))

(declare-fun m!490783 () Bool)

(assert (=> b!509759 m!490783))

(check-sat (not b!509758) (not b!509762) (not b!509764) (not b!509763) (not b!509759) (not b!509765) (not start!46034) (not b!509757) (not b!509761))
(check-sat)
