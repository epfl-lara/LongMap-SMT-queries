; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46022 () Bool)

(assert start!46022)

(declare-fun b!509669 () Bool)

(declare-fun res!310568 () Bool)

(declare-fun e!298011 () Bool)

(assert (=> b!509669 (=> (not res!310568) (not e!298011))))

(declare-datatypes ((array!32734 0))(
  ( (array!32735 (arr!15745 (Array (_ BitVec 32) (_ BitVec 64))) (size!16109 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32734)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509669 (= res!310568 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509670 () Bool)

(declare-fun res!310576 () Bool)

(assert (=> b!509670 (=> (not res!310576) (not e!298011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509670 (= res!310576 (validKeyInArray!0 k0!2280))))

(declare-fun b!509671 () Bool)

(declare-fun res!310569 () Bool)

(assert (=> b!509671 (=> (not res!310569) (not e!298011))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509671 (= res!310569 (validKeyInArray!0 (select (arr!15745 a!3235) j!176)))))

(declare-fun b!509672 () Bool)

(declare-fun res!310575 () Bool)

(declare-fun e!298012 () Bool)

(assert (=> b!509672 (=> (not res!310575) (not e!298012))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32734 (_ BitVec 32)) Bool)

(assert (=> b!509672 (= res!310575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310573 () Bool)

(assert (=> start!46022 (=> (not res!310573) (not e!298011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46022 (= res!310573 (validMask!0 mask!3524))))

(assert (=> start!46022 e!298011))

(assert (=> start!46022 true))

(declare-fun array_inv!11604 (array!32734) Bool)

(assert (=> start!46022 (array_inv!11604 a!3235)))

(declare-fun b!509673 () Bool)

(declare-fun res!310571 () Bool)

(assert (=> b!509673 (=> (not res!310571) (not e!298012))))

(declare-datatypes ((List!9810 0))(
  ( (Nil!9807) (Cons!9806 (h!10683 (_ BitVec 64)) (t!16030 List!9810)) )
))
(declare-fun arrayNoDuplicates!0 (array!32734 (_ BitVec 32) List!9810) Bool)

(assert (=> b!509673 (= res!310571 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9807))))

(declare-fun b!509674 () Bool)

(assert (=> b!509674 (= e!298011 e!298012)))

(declare-fun res!310572 () Bool)

(assert (=> b!509674 (=> (not res!310572) (not e!298012))))

(declare-datatypes ((SeekEntryResult!4168 0))(
  ( (MissingZero!4168 (index!18860 (_ BitVec 32))) (Found!4168 (index!18861 (_ BitVec 32))) (Intermediate!4168 (undefined!4980 Bool) (index!18862 (_ BitVec 32)) (x!47974 (_ BitVec 32))) (Undefined!4168) (MissingVacant!4168 (index!18863 (_ BitVec 32))) )
))
(declare-fun lt!232926 () SeekEntryResult!4168)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509674 (= res!310572 (or (= lt!232926 (MissingZero!4168 i!1204)) (= lt!232926 (MissingVacant!4168 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32734 (_ BitVec 32)) SeekEntryResult!4168)

(assert (=> b!509674 (= lt!232926 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509675 () Bool)

(declare-fun res!310570 () Bool)

(assert (=> b!509675 (=> (not res!310570) (not e!298011))))

(assert (=> b!509675 (= res!310570 (and (= (size!16109 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16109 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16109 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509676 () Bool)

(assert (=> b!509676 (= e!298012 (not true))))

(declare-fun lt!232923 () (_ BitVec 32))

(declare-fun lt!232924 () SeekEntryResult!4168)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32734 (_ BitVec 32)) SeekEntryResult!4168)

(assert (=> b!509676 (= lt!232924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232923 (select (store (arr!15745 a!3235) i!1204 k0!2280) j!176) (array!32735 (store (arr!15745 a!3235) i!1204 k0!2280) (size!16109 a!3235)) mask!3524))))

(declare-fun lt!232922 () (_ BitVec 32))

(declare-fun lt!232927 () SeekEntryResult!4168)

(assert (=> b!509676 (= lt!232927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232922 (select (arr!15745 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509676 (= lt!232923 (toIndex!0 (select (store (arr!15745 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509676 (= lt!232922 (toIndex!0 (select (arr!15745 a!3235) j!176) mask!3524))))

(declare-fun e!298013 () Bool)

(assert (=> b!509676 e!298013))

(declare-fun res!310574 () Bool)

(assert (=> b!509676 (=> (not res!310574) (not e!298013))))

(assert (=> b!509676 (= res!310574 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15655 0))(
  ( (Unit!15656) )
))
(declare-fun lt!232925 () Unit!15655)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15655)

(assert (=> b!509676 (= lt!232925 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509677 () Bool)

(assert (=> b!509677 (= e!298013 (= (seekEntryOrOpen!0 (select (arr!15745 a!3235) j!176) a!3235 mask!3524) (Found!4168 j!176)))))

(assert (= (and start!46022 res!310573) b!509675))

(assert (= (and b!509675 res!310570) b!509671))

(assert (= (and b!509671 res!310569) b!509670))

(assert (= (and b!509670 res!310576) b!509669))

(assert (= (and b!509669 res!310568) b!509674))

(assert (= (and b!509674 res!310572) b!509672))

(assert (= (and b!509672 res!310575) b!509673))

(assert (= (and b!509673 res!310571) b!509676))

(assert (= (and b!509676 res!310574) b!509677))

(declare-fun m!490897 () Bool)

(assert (=> b!509670 m!490897))

(declare-fun m!490899 () Bool)

(assert (=> start!46022 m!490899))

(declare-fun m!490901 () Bool)

(assert (=> start!46022 m!490901))

(declare-fun m!490903 () Bool)

(assert (=> b!509674 m!490903))

(declare-fun m!490905 () Bool)

(assert (=> b!509676 m!490905))

(declare-fun m!490907 () Bool)

(assert (=> b!509676 m!490907))

(declare-fun m!490909 () Bool)

(assert (=> b!509676 m!490909))

(assert (=> b!509676 m!490909))

(declare-fun m!490911 () Bool)

(assert (=> b!509676 m!490911))

(declare-fun m!490913 () Bool)

(assert (=> b!509676 m!490913))

(declare-fun m!490915 () Bool)

(assert (=> b!509676 m!490915))

(assert (=> b!509676 m!490913))

(declare-fun m!490917 () Bool)

(assert (=> b!509676 m!490917))

(assert (=> b!509676 m!490909))

(declare-fun m!490919 () Bool)

(assert (=> b!509676 m!490919))

(assert (=> b!509676 m!490913))

(declare-fun m!490921 () Bool)

(assert (=> b!509676 m!490921))

(declare-fun m!490923 () Bool)

(assert (=> b!509673 m!490923))

(declare-fun m!490925 () Bool)

(assert (=> b!509672 m!490925))

(declare-fun m!490927 () Bool)

(assert (=> b!509669 m!490927))

(assert (=> b!509671 m!490913))

(assert (=> b!509671 m!490913))

(declare-fun m!490929 () Bool)

(assert (=> b!509671 m!490929))

(assert (=> b!509677 m!490913))

(assert (=> b!509677 m!490913))

(declare-fun m!490931 () Bool)

(assert (=> b!509677 m!490931))

(check-sat (not start!46022) (not b!509672) (not b!509670) (not b!509673) (not b!509671) (not b!509669) (not b!509676) (not b!509677) (not b!509674))
(check-sat)
