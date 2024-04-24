; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120744 () Bool)

(assert start!120744)

(declare-fun res!942735 () Bool)

(declare-fun e!795526 () Bool)

(assert (=> start!120744 (=> (not res!942735) (not e!795526))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120744 (= res!942735 (validMask!0 mask!2840))))

(assert (=> start!120744 e!795526))

(assert (=> start!120744 true))

(declare-datatypes ((array!96075 0))(
  ( (array!96076 (arr!46386 (Array (_ BitVec 32) (_ BitVec 64))) (size!46937 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96075)

(declare-fun array_inv!35667 (array!96075) Bool)

(assert (=> start!120744 (array_inv!35667 a!2901)))

(declare-fun e!795525 () Bool)

(declare-fun b!1404903 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10606 0))(
  ( (MissingZero!10606 (index!44801 (_ BitVec 32))) (Found!10606 (index!44802 (_ BitVec 32))) (Intermediate!10606 (undefined!11418 Bool) (index!44803 (_ BitVec 32)) (x!126556 (_ BitVec 32))) (Undefined!10606) (MissingVacant!10606 (index!44804 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96075 (_ BitVec 32)) SeekEntryResult!10606)

(assert (=> b!1404903 (= e!795525 (= (seekEntryOrOpen!0 (select (arr!46386 a!2901) j!112) a!2901 mask!2840) (Found!10606 j!112)))))

(declare-fun b!1404904 () Bool)

(declare-fun res!942734 () Bool)

(assert (=> b!1404904 (=> (not res!942734) (not e!795526))))

(declare-datatypes ((List!32892 0))(
  ( (Nil!32889) (Cons!32888 (h!34144 (_ BitVec 64)) (t!47578 List!32892)) )
))
(declare-fun arrayNoDuplicates!0 (array!96075 (_ BitVec 32) List!32892) Bool)

(assert (=> b!1404904 (= res!942734 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32889))))

(declare-fun b!1404905 () Bool)

(declare-fun res!942733 () Bool)

(assert (=> b!1404905 (=> (not res!942733) (not e!795526))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404905 (= res!942733 (and (= (size!46937 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46937 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46937 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404906 () Bool)

(assert (=> b!1404906 (= e!795526 (not true))))

(assert (=> b!1404906 e!795525))

(declare-fun res!942731 () Bool)

(assert (=> b!1404906 (=> (not res!942731) (not e!795525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96075 (_ BitVec 32)) Bool)

(assert (=> b!1404906 (= res!942731 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47243 0))(
  ( (Unit!47244) )
))
(declare-fun lt!618898 () Unit!47243)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47243)

(assert (=> b!1404906 (= lt!618898 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618899 () SeekEntryResult!10606)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96075 (_ BitVec 32)) SeekEntryResult!10606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404906 (= lt!618899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46386 a!2901) j!112) mask!2840) (select (arr!46386 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404907 () Bool)

(declare-fun res!942736 () Bool)

(assert (=> b!1404907 (=> (not res!942736) (not e!795526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404907 (= res!942736 (validKeyInArray!0 (select (arr!46386 a!2901) i!1037)))))

(declare-fun b!1404908 () Bool)

(declare-fun res!942732 () Bool)

(assert (=> b!1404908 (=> (not res!942732) (not e!795526))))

(assert (=> b!1404908 (= res!942732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404909 () Bool)

(declare-fun res!942730 () Bool)

(assert (=> b!1404909 (=> (not res!942730) (not e!795526))))

(assert (=> b!1404909 (= res!942730 (validKeyInArray!0 (select (arr!46386 a!2901) j!112)))))

(assert (= (and start!120744 res!942735) b!1404905))

(assert (= (and b!1404905 res!942733) b!1404907))

(assert (= (and b!1404907 res!942736) b!1404909))

(assert (= (and b!1404909 res!942730) b!1404908))

(assert (= (and b!1404908 res!942732) b!1404904))

(assert (= (and b!1404904 res!942734) b!1404906))

(assert (= (and b!1404906 res!942731) b!1404903))

(declare-fun m!1293869 () Bool)

(assert (=> b!1404906 m!1293869))

(declare-fun m!1293871 () Bool)

(assert (=> b!1404906 m!1293871))

(assert (=> b!1404906 m!1293869))

(declare-fun m!1293873 () Bool)

(assert (=> b!1404906 m!1293873))

(assert (=> b!1404906 m!1293871))

(assert (=> b!1404906 m!1293869))

(declare-fun m!1293875 () Bool)

(assert (=> b!1404906 m!1293875))

(declare-fun m!1293877 () Bool)

(assert (=> b!1404906 m!1293877))

(declare-fun m!1293879 () Bool)

(assert (=> b!1404907 m!1293879))

(assert (=> b!1404907 m!1293879))

(declare-fun m!1293881 () Bool)

(assert (=> b!1404907 m!1293881))

(assert (=> b!1404903 m!1293869))

(assert (=> b!1404903 m!1293869))

(declare-fun m!1293883 () Bool)

(assert (=> b!1404903 m!1293883))

(declare-fun m!1293885 () Bool)

(assert (=> start!120744 m!1293885))

(declare-fun m!1293887 () Bool)

(assert (=> start!120744 m!1293887))

(declare-fun m!1293889 () Bool)

(assert (=> b!1404904 m!1293889))

(declare-fun m!1293891 () Bool)

(assert (=> b!1404908 m!1293891))

(assert (=> b!1404909 m!1293869))

(assert (=> b!1404909 m!1293869))

(declare-fun m!1293893 () Bool)

(assert (=> b!1404909 m!1293893))

(push 1)

(assert (not b!1404906))

(assert (not b!1404903))

(assert (not b!1404908))

(assert (not b!1404904))

(assert (not start!120744))

(assert (not b!1404909))

(assert (not b!1404907))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

