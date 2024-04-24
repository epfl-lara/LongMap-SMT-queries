; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120530 () Bool)

(assert start!120530)

(declare-fun b!1401791 () Bool)

(declare-fun e!793772 () Bool)

(declare-fun e!793770 () Bool)

(assert (=> b!1401791 (= e!793772 e!793770)))

(declare-fun res!939618 () Bool)

(assert (=> b!1401791 (=> res!939618 e!793770)))

(declare-datatypes ((array!95861 0))(
  ( (array!95862 (arr!46279 (Array (_ BitVec 32) (_ BitVec 64))) (size!46830 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95861)

(declare-datatypes ((SeekEntryResult!10499 0))(
  ( (MissingZero!10499 (index!44373 (_ BitVec 32))) (Found!10499 (index!44374 (_ BitVec 32))) (Intermediate!10499 (undefined!11311 Bool) (index!44375 (_ BitVec 32)) (x!126169 (_ BitVec 32))) (Undefined!10499) (MissingVacant!10499 (index!44376 (_ BitVec 32))) )
))
(declare-fun lt!616757 () SeekEntryResult!10499)

(declare-fun lt!616760 () SeekEntryResult!10499)

(declare-fun lt!616762 () (_ BitVec 32))

(assert (=> b!1401791 (= res!939618 (or (bvslt (x!126169 lt!616757) #b00000000000000000000000000000000) (bvsgt (x!126169 lt!616757) #b01111111111111111111111111111110) (bvslt (x!126169 lt!616760) #b00000000000000000000000000000000) (bvsgt (x!126169 lt!616760) #b01111111111111111111111111111110) (bvslt lt!616762 #b00000000000000000000000000000000) (bvsge lt!616762 (size!46830 a!2901)) (bvslt (index!44375 lt!616757) #b00000000000000000000000000000000) (bvsge (index!44375 lt!616757) (size!46830 a!2901)) (bvslt (index!44375 lt!616760) #b00000000000000000000000000000000) (bvsge (index!44375 lt!616760) (size!46830 a!2901)) (not (= lt!616757 (Intermediate!10499 false (index!44375 lt!616757) (x!126169 lt!616757)))) (not (= lt!616760 (Intermediate!10499 false (index!44375 lt!616760) (x!126169 lt!616760))))))))

(declare-fun e!793773 () Bool)

(assert (=> b!1401791 e!793773))

(declare-fun res!939621 () Bool)

(assert (=> b!1401791 (=> (not res!939621) (not e!793773))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401791 (= res!939621 (and (not (undefined!11311 lt!616760)) (= (index!44375 lt!616760) i!1037) (bvslt (x!126169 lt!616760) (x!126169 lt!616757)) (= (select (store (arr!46279 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44375 lt!616760)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47029 0))(
  ( (Unit!47030) )
))
(declare-fun lt!616761 () Unit!47029)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47029)

(assert (=> b!1401791 (= lt!616761 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616762 (x!126169 lt!616757) (index!44375 lt!616757) (x!126169 lt!616760) (index!44375 lt!616760) (undefined!11311 lt!616760) mask!2840))))

(declare-fun b!1401792 () Bool)

(declare-fun e!793771 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95861 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1401792 (= e!793771 (= (seekEntryOrOpen!0 (select (arr!46279 a!2901) j!112) a!2901 mask!2840) (Found!10499 j!112)))))

(declare-fun b!1401793 () Bool)

(assert (=> b!1401793 (= e!793770 true)))

(declare-fun lt!616758 () (_ BitVec 64))

(declare-fun lt!616759 () array!95861)

(declare-fun lt!616756 () SeekEntryResult!10499)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95861 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1401793 (= lt!616756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616762 lt!616758 lt!616759 mask!2840))))

(declare-fun b!1401794 () Bool)

(declare-fun e!793774 () Bool)

(declare-fun e!793769 () Bool)

(assert (=> b!1401794 (= e!793774 (not e!793769))))

(declare-fun res!939625 () Bool)

(assert (=> b!1401794 (=> res!939625 e!793769)))

(get-info :version)

(assert (=> b!1401794 (= res!939625 (or (not ((_ is Intermediate!10499) lt!616757)) (undefined!11311 lt!616757)))))

(assert (=> b!1401794 e!793771))

(declare-fun res!939619 () Bool)

(assert (=> b!1401794 (=> (not res!939619) (not e!793771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95861 (_ BitVec 32)) Bool)

(assert (=> b!1401794 (= res!939619 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616763 () Unit!47029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47029)

(assert (=> b!1401794 (= lt!616763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401794 (= lt!616757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616762 (select (arr!46279 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401794 (= lt!616762 (toIndex!0 (select (arr!46279 a!2901) j!112) mask!2840))))

(declare-fun b!1401795 () Bool)

(declare-fun res!939623 () Bool)

(assert (=> b!1401795 (=> (not res!939623) (not e!793774))))

(declare-datatypes ((List!32785 0))(
  ( (Nil!32782) (Cons!32781 (h!34037 (_ BitVec 64)) (t!47471 List!32785)) )
))
(declare-fun arrayNoDuplicates!0 (array!95861 (_ BitVec 32) List!32785) Bool)

(assert (=> b!1401795 (= res!939623 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32782))))

(declare-fun res!939622 () Bool)

(assert (=> start!120530 (=> (not res!939622) (not e!793774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120530 (= res!939622 (validMask!0 mask!2840))))

(assert (=> start!120530 e!793774))

(assert (=> start!120530 true))

(declare-fun array_inv!35560 (array!95861) Bool)

(assert (=> start!120530 (array_inv!35560 a!2901)))

(declare-fun b!1401796 () Bool)

(declare-fun res!939624 () Bool)

(assert (=> b!1401796 (=> (not res!939624) (not e!793774))))

(assert (=> b!1401796 (= res!939624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401797 () Bool)

(assert (=> b!1401797 (= e!793769 e!793772)))

(declare-fun res!939626 () Bool)

(assert (=> b!1401797 (=> res!939626 e!793772)))

(assert (=> b!1401797 (= res!939626 (or (= lt!616757 lt!616760) (not ((_ is Intermediate!10499) lt!616760))))))

(assert (=> b!1401797 (= lt!616760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616758 mask!2840) lt!616758 lt!616759 mask!2840))))

(assert (=> b!1401797 (= lt!616758 (select (store (arr!46279 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401797 (= lt!616759 (array!95862 (store (arr!46279 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46830 a!2901)))))

(declare-fun b!1401798 () Bool)

(declare-fun res!939620 () Bool)

(assert (=> b!1401798 (=> (not res!939620) (not e!793774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401798 (= res!939620 (validKeyInArray!0 (select (arr!46279 a!2901) i!1037)))))

(declare-fun b!1401799 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95861 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1401799 (= e!793773 (= (seekEntryOrOpen!0 lt!616758 lt!616759 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126169 lt!616760) (index!44375 lt!616760) (index!44375 lt!616760) (select (arr!46279 a!2901) j!112) lt!616759 mask!2840)))))

(declare-fun b!1401800 () Bool)

(declare-fun res!939627 () Bool)

(assert (=> b!1401800 (=> (not res!939627) (not e!793774))))

(assert (=> b!1401800 (= res!939627 (and (= (size!46830 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46830 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46830 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401801 () Bool)

(declare-fun res!939628 () Bool)

(assert (=> b!1401801 (=> (not res!939628) (not e!793774))))

(assert (=> b!1401801 (= res!939628 (validKeyInArray!0 (select (arr!46279 a!2901) j!112)))))

(assert (= (and start!120530 res!939622) b!1401800))

(assert (= (and b!1401800 res!939627) b!1401798))

(assert (= (and b!1401798 res!939620) b!1401801))

(assert (= (and b!1401801 res!939628) b!1401796))

(assert (= (and b!1401796 res!939624) b!1401795))

(assert (= (and b!1401795 res!939623) b!1401794))

(assert (= (and b!1401794 res!939619) b!1401792))

(assert (= (and b!1401794 (not res!939625)) b!1401797))

(assert (= (and b!1401797 (not res!939626)) b!1401791))

(assert (= (and b!1401791 res!939621) b!1401799))

(assert (= (and b!1401791 (not res!939618)) b!1401793))

(declare-fun m!1289545 () Bool)

(assert (=> b!1401795 m!1289545))

(declare-fun m!1289547 () Bool)

(assert (=> b!1401798 m!1289547))

(assert (=> b!1401798 m!1289547))

(declare-fun m!1289549 () Bool)

(assert (=> b!1401798 m!1289549))

(declare-fun m!1289551 () Bool)

(assert (=> b!1401792 m!1289551))

(assert (=> b!1401792 m!1289551))

(declare-fun m!1289553 () Bool)

(assert (=> b!1401792 m!1289553))

(declare-fun m!1289555 () Bool)

(assert (=> b!1401797 m!1289555))

(assert (=> b!1401797 m!1289555))

(declare-fun m!1289557 () Bool)

(assert (=> b!1401797 m!1289557))

(declare-fun m!1289559 () Bool)

(assert (=> b!1401797 m!1289559))

(declare-fun m!1289561 () Bool)

(assert (=> b!1401797 m!1289561))

(assert (=> b!1401794 m!1289551))

(declare-fun m!1289563 () Bool)

(assert (=> b!1401794 m!1289563))

(assert (=> b!1401794 m!1289551))

(assert (=> b!1401794 m!1289551))

(declare-fun m!1289565 () Bool)

(assert (=> b!1401794 m!1289565))

(declare-fun m!1289567 () Bool)

(assert (=> b!1401794 m!1289567))

(declare-fun m!1289569 () Bool)

(assert (=> b!1401794 m!1289569))

(declare-fun m!1289571 () Bool)

(assert (=> start!120530 m!1289571))

(declare-fun m!1289573 () Bool)

(assert (=> start!120530 m!1289573))

(assert (=> b!1401791 m!1289559))

(declare-fun m!1289575 () Bool)

(assert (=> b!1401791 m!1289575))

(declare-fun m!1289577 () Bool)

(assert (=> b!1401791 m!1289577))

(declare-fun m!1289579 () Bool)

(assert (=> b!1401799 m!1289579))

(assert (=> b!1401799 m!1289551))

(assert (=> b!1401799 m!1289551))

(declare-fun m!1289581 () Bool)

(assert (=> b!1401799 m!1289581))

(assert (=> b!1401801 m!1289551))

(assert (=> b!1401801 m!1289551))

(declare-fun m!1289583 () Bool)

(assert (=> b!1401801 m!1289583))

(declare-fun m!1289585 () Bool)

(assert (=> b!1401793 m!1289585))

(declare-fun m!1289587 () Bool)

(assert (=> b!1401796 m!1289587))

(check-sat (not b!1401801) (not b!1401791) (not b!1401794) (not b!1401799) (not b!1401792) (not b!1401796) (not b!1401795) (not start!120530) (not b!1401798) (not b!1401793) (not b!1401797))
(check-sat)
