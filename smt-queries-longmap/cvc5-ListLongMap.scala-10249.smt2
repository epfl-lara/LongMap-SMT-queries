; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120738 () Bool)

(assert start!120738)

(declare-fun res!942667 () Bool)

(declare-fun e!795499 () Bool)

(assert (=> start!120738 (=> (not res!942667) (not e!795499))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120738 (= res!942667 (validMask!0 mask!2840))))

(assert (=> start!120738 e!795499))

(assert (=> start!120738 true))

(declare-datatypes ((array!96069 0))(
  ( (array!96070 (arr!46383 (Array (_ BitVec 32) (_ BitVec 64))) (size!46934 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96069)

(declare-fun array_inv!35664 (array!96069) Bool)

(assert (=> start!120738 (array_inv!35664 a!2901)))

(declare-fun b!1404840 () Bool)

(declare-fun res!942668 () Bool)

(assert (=> b!1404840 (=> (not res!942668) (not e!795499))))

(declare-datatypes ((List!32889 0))(
  ( (Nil!32886) (Cons!32885 (h!34141 (_ BitVec 64)) (t!47575 List!32889)) )
))
(declare-fun arrayNoDuplicates!0 (array!96069 (_ BitVec 32) List!32889) Bool)

(assert (=> b!1404840 (= res!942668 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32886))))

(declare-fun b!1404841 () Bool)

(declare-fun res!942670 () Bool)

(assert (=> b!1404841 (=> (not res!942670) (not e!795499))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404841 (= res!942670 (and (= (size!46934 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46934 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46934 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404842 () Bool)

(declare-fun res!942669 () Bool)

(assert (=> b!1404842 (=> (not res!942669) (not e!795499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404842 (= res!942669 (validKeyInArray!0 (select (arr!46383 a!2901) j!112)))))

(declare-fun b!1404843 () Bool)

(declare-fun res!942671 () Bool)

(assert (=> b!1404843 (=> (not res!942671) (not e!795499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96069 (_ BitVec 32)) Bool)

(assert (=> b!1404843 (= res!942671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404844 () Bool)

(declare-fun res!942673 () Bool)

(assert (=> b!1404844 (=> (not res!942673) (not e!795499))))

(assert (=> b!1404844 (= res!942673 (validKeyInArray!0 (select (arr!46383 a!2901) i!1037)))))

(declare-fun b!1404845 () Bool)

(assert (=> b!1404845 (= e!795499 (not true))))

(declare-fun e!795498 () Bool)

(assert (=> b!1404845 e!795498))

(declare-fun res!942672 () Bool)

(assert (=> b!1404845 (=> (not res!942672) (not e!795498))))

(assert (=> b!1404845 (= res!942672 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47237 0))(
  ( (Unit!47238) )
))
(declare-fun lt!618881 () Unit!47237)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47237)

(assert (=> b!1404845 (= lt!618881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10603 0))(
  ( (MissingZero!10603 (index!44789 (_ BitVec 32))) (Found!10603 (index!44790 (_ BitVec 32))) (Intermediate!10603 (undefined!11415 Bool) (index!44791 (_ BitVec 32)) (x!126545 (_ BitVec 32))) (Undefined!10603) (MissingVacant!10603 (index!44792 (_ BitVec 32))) )
))
(declare-fun lt!618880 () SeekEntryResult!10603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96069 (_ BitVec 32)) SeekEntryResult!10603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404845 (= lt!618880 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46383 a!2901) j!112) mask!2840) (select (arr!46383 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404846 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96069 (_ BitVec 32)) SeekEntryResult!10603)

(assert (=> b!1404846 (= e!795498 (= (seekEntryOrOpen!0 (select (arr!46383 a!2901) j!112) a!2901 mask!2840) (Found!10603 j!112)))))

(assert (= (and start!120738 res!942667) b!1404841))

(assert (= (and b!1404841 res!942670) b!1404844))

(assert (= (and b!1404844 res!942673) b!1404842))

(assert (= (and b!1404842 res!942669) b!1404843))

(assert (= (and b!1404843 res!942671) b!1404840))

(assert (= (and b!1404840 res!942668) b!1404845))

(assert (= (and b!1404845 res!942672) b!1404846))

(declare-fun m!1293791 () Bool)

(assert (=> b!1404846 m!1293791))

(assert (=> b!1404846 m!1293791))

(declare-fun m!1293793 () Bool)

(assert (=> b!1404846 m!1293793))

(assert (=> b!1404845 m!1293791))

(declare-fun m!1293795 () Bool)

(assert (=> b!1404845 m!1293795))

(assert (=> b!1404845 m!1293791))

(declare-fun m!1293797 () Bool)

(assert (=> b!1404845 m!1293797))

(assert (=> b!1404845 m!1293795))

(assert (=> b!1404845 m!1293791))

(declare-fun m!1293799 () Bool)

(assert (=> b!1404845 m!1293799))

(declare-fun m!1293801 () Bool)

(assert (=> b!1404845 m!1293801))

(declare-fun m!1293803 () Bool)

(assert (=> b!1404840 m!1293803))

(declare-fun m!1293805 () Bool)

(assert (=> start!120738 m!1293805))

(declare-fun m!1293807 () Bool)

(assert (=> start!120738 m!1293807))

(assert (=> b!1404842 m!1293791))

(assert (=> b!1404842 m!1293791))

(declare-fun m!1293809 () Bool)

(assert (=> b!1404842 m!1293809))

(declare-fun m!1293811 () Bool)

(assert (=> b!1404843 m!1293811))

(declare-fun m!1293813 () Bool)

(assert (=> b!1404844 m!1293813))

(assert (=> b!1404844 m!1293813))

(declare-fun m!1293815 () Bool)

(assert (=> b!1404844 m!1293815))

(push 1)

(assert (not b!1404843))

(assert (not b!1404846))

(assert (not b!1404844))

(assert (not b!1404840))

(assert (not start!120738))

(assert (not b!1404845))

(assert (not b!1404842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

