; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119880 () Bool)

(assert start!119880)

(declare-fun b!1395797 () Bool)

(declare-fun res!934928 () Bool)

(declare-fun e!790221 () Bool)

(assert (=> b!1395797 (=> (not res!934928) (not e!790221))))

(declare-datatypes ((array!95413 0))(
  ( (array!95414 (arr!46062 (Array (_ BitVec 32) (_ BitVec 64))) (size!46614 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95413)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395797 (= res!934928 (validKeyInArray!0 (select (arr!46062 a!2901) j!112)))))

(declare-fun b!1395798 () Bool)

(declare-fun res!934931 () Bool)

(assert (=> b!1395798 (=> (not res!934931) (not e!790221))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395798 (= res!934931 (validKeyInArray!0 (select (arr!46062 a!2901) i!1037)))))

(declare-fun b!1395799 () Bool)

(declare-fun e!790222 () Bool)

(assert (=> b!1395799 (= e!790222 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10405 0))(
  ( (MissingZero!10405 (index!43991 (_ BitVec 32))) (Found!10405 (index!43992 (_ BitVec 32))) (Intermediate!10405 (undefined!11217 Bool) (index!43993 (_ BitVec 32)) (x!125650 (_ BitVec 32))) (Undefined!10405) (MissingVacant!10405 (index!43994 (_ BitVec 32))) )
))
(declare-fun lt!612982 () SeekEntryResult!10405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95413 (_ BitVec 32)) SeekEntryResult!10405)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395799 (= lt!612982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95414 (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46614 a!2901)) mask!2840))))

(declare-fun b!1395800 () Bool)

(declare-fun res!934927 () Bool)

(assert (=> b!1395800 (=> (not res!934927) (not e!790221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95413 (_ BitVec 32)) Bool)

(assert (=> b!1395800 (= res!934927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395801 () Bool)

(declare-fun res!934932 () Bool)

(assert (=> b!1395801 (=> (not res!934932) (not e!790221))))

(assert (=> b!1395801 (= res!934932 (and (= (size!46614 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46614 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46614 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395802 () Bool)

(assert (=> b!1395802 (= e!790221 (not e!790222))))

(declare-fun res!934933 () Bool)

(assert (=> b!1395802 (=> res!934933 e!790222)))

(declare-fun lt!612983 () SeekEntryResult!10405)

(assert (=> b!1395802 (= res!934933 (or (not (is-Intermediate!10405 lt!612983)) (undefined!11217 lt!612983)))))

(declare-fun e!790223 () Bool)

(assert (=> b!1395802 e!790223))

(declare-fun res!934926 () Bool)

(assert (=> b!1395802 (=> (not res!934926) (not e!790223))))

(assert (=> b!1395802 (= res!934926 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46657 0))(
  ( (Unit!46658) )
))
(declare-fun lt!612981 () Unit!46657)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46657)

(assert (=> b!1395802 (= lt!612981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395802 (= lt!612983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46062 a!2901) j!112) mask!2840) (select (arr!46062 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395803 () Bool)

(declare-fun res!934929 () Bool)

(assert (=> b!1395803 (=> (not res!934929) (not e!790221))))

(declare-datatypes ((List!32659 0))(
  ( (Nil!32656) (Cons!32655 (h!33894 (_ BitVec 64)) (t!47345 List!32659)) )
))
(declare-fun arrayNoDuplicates!0 (array!95413 (_ BitVec 32) List!32659) Bool)

(assert (=> b!1395803 (= res!934929 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32656))))

(declare-fun b!1395804 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95413 (_ BitVec 32)) SeekEntryResult!10405)

(assert (=> b!1395804 (= e!790223 (= (seekEntryOrOpen!0 (select (arr!46062 a!2901) j!112) a!2901 mask!2840) (Found!10405 j!112)))))

(declare-fun res!934930 () Bool)

(assert (=> start!119880 (=> (not res!934930) (not e!790221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119880 (= res!934930 (validMask!0 mask!2840))))

(assert (=> start!119880 e!790221))

(assert (=> start!119880 true))

(declare-fun array_inv!35295 (array!95413) Bool)

(assert (=> start!119880 (array_inv!35295 a!2901)))

(assert (= (and start!119880 res!934930) b!1395801))

(assert (= (and b!1395801 res!934932) b!1395798))

(assert (= (and b!1395798 res!934931) b!1395797))

(assert (= (and b!1395797 res!934928) b!1395800))

(assert (= (and b!1395800 res!934927) b!1395803))

(assert (= (and b!1395803 res!934929) b!1395802))

(assert (= (and b!1395802 res!934926) b!1395804))

(assert (= (and b!1395802 (not res!934933)) b!1395799))

(declare-fun m!1281783 () Bool)

(assert (=> b!1395804 m!1281783))

(assert (=> b!1395804 m!1281783))

(declare-fun m!1281785 () Bool)

(assert (=> b!1395804 m!1281785))

(declare-fun m!1281787 () Bool)

(assert (=> b!1395799 m!1281787))

(declare-fun m!1281789 () Bool)

(assert (=> b!1395799 m!1281789))

(assert (=> b!1395799 m!1281789))

(declare-fun m!1281791 () Bool)

(assert (=> b!1395799 m!1281791))

(assert (=> b!1395799 m!1281791))

(assert (=> b!1395799 m!1281789))

(declare-fun m!1281793 () Bool)

(assert (=> b!1395799 m!1281793))

(declare-fun m!1281795 () Bool)

(assert (=> b!1395798 m!1281795))

(assert (=> b!1395798 m!1281795))

(declare-fun m!1281797 () Bool)

(assert (=> b!1395798 m!1281797))

(declare-fun m!1281799 () Bool)

(assert (=> start!119880 m!1281799))

(declare-fun m!1281801 () Bool)

(assert (=> start!119880 m!1281801))

(declare-fun m!1281803 () Bool)

(assert (=> b!1395803 m!1281803))

(assert (=> b!1395802 m!1281783))

(declare-fun m!1281805 () Bool)

(assert (=> b!1395802 m!1281805))

(assert (=> b!1395802 m!1281783))

(declare-fun m!1281807 () Bool)

(assert (=> b!1395802 m!1281807))

(assert (=> b!1395802 m!1281805))

(assert (=> b!1395802 m!1281783))

(declare-fun m!1281809 () Bool)

(assert (=> b!1395802 m!1281809))

(declare-fun m!1281811 () Bool)

(assert (=> b!1395802 m!1281811))

(declare-fun m!1281813 () Bool)

(assert (=> b!1395800 m!1281813))

(assert (=> b!1395797 m!1281783))

(assert (=> b!1395797 m!1281783))

(declare-fun m!1281815 () Bool)

(assert (=> b!1395797 m!1281815))

(push 1)

(assert (not b!1395800))

(assert (not start!119880))

(assert (not b!1395797))

(assert (not b!1395798))

(assert (not b!1395799))

(assert (not b!1395804))

(assert (not b!1395802))

(assert (not b!1395803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

