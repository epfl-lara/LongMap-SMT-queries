; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120888 () Bool)

(assert start!120888)

(declare-fun b!1406600 () Bool)

(declare-fun res!944820 () Bool)

(declare-fun e!796121 () Bool)

(assert (=> b!1406600 (=> (not res!944820) (not e!796121))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96195 0))(
  ( (array!96196 (arr!46445 (Array (_ BitVec 32) (_ BitVec 64))) (size!46995 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96195)

(assert (=> b!1406600 (= res!944820 (and (= (size!46995 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46995 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46995 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1406601 () Bool)

(declare-fun res!944817 () Bool)

(assert (=> b!1406601 (=> (not res!944817) (not e!796121))))

(declare-datatypes ((List!32964 0))(
  ( (Nil!32961) (Cons!32960 (h!34214 (_ BitVec 64)) (t!47658 List!32964)) )
))
(declare-fun arrayNoDuplicates!0 (array!96195 (_ BitVec 32) List!32964) Bool)

(assert (=> b!1406601 (= res!944817 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32961))))

(declare-fun b!1406603 () Bool)

(declare-fun res!944819 () Bool)

(assert (=> b!1406603 (=> (not res!944819) (not e!796121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96195 (_ BitVec 32)) Bool)

(assert (=> b!1406603 (= res!944819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406604 () Bool)

(declare-fun e!796124 () Bool)

(assert (=> b!1406604 (= e!796124 true)))

(declare-datatypes ((SeekEntryResult!10756 0))(
  ( (MissingZero!10756 (index!45401 (_ BitVec 32))) (Found!10756 (index!45402 (_ BitVec 32))) (Intermediate!10756 (undefined!11568 Bool) (index!45403 (_ BitVec 32)) (x!127003 (_ BitVec 32))) (Undefined!10756) (MissingVacant!10756 (index!45404 (_ BitVec 32))) )
))
(declare-fun lt!619446 () SeekEntryResult!10756)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96195 (_ BitVec 32)) SeekEntryResult!10756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406604 (= lt!619446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46445 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46445 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96196 (store (arr!46445 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46995 a!2901)) mask!2840))))

(declare-fun b!1406605 () Bool)

(declare-fun res!944822 () Bool)

(assert (=> b!1406605 (=> (not res!944822) (not e!796121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406605 (= res!944822 (validKeyInArray!0 (select (arr!46445 a!2901) i!1037)))))

(declare-fun b!1406606 () Bool)

(assert (=> b!1406606 (= e!796121 (not e!796124))))

(declare-fun res!944818 () Bool)

(assert (=> b!1406606 (=> res!944818 e!796124)))

(declare-fun lt!619445 () SeekEntryResult!10756)

(assert (=> b!1406606 (= res!944818 (or (not (is-Intermediate!10756 lt!619445)) (undefined!11568 lt!619445)))))

(declare-fun e!796122 () Bool)

(assert (=> b!1406606 e!796122))

(declare-fun res!944823 () Bool)

(assert (=> b!1406606 (=> (not res!944823) (not e!796122))))

(assert (=> b!1406606 (= res!944823 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47486 0))(
  ( (Unit!47487) )
))
(declare-fun lt!619444 () Unit!47486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47486)

(assert (=> b!1406606 (= lt!619444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406606 (= lt!619445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46445 a!2901) j!112) mask!2840) (select (arr!46445 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406607 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96195 (_ BitVec 32)) SeekEntryResult!10756)

(assert (=> b!1406607 (= e!796122 (= (seekEntryOrOpen!0 (select (arr!46445 a!2901) j!112) a!2901 mask!2840) (Found!10756 j!112)))))

(declare-fun b!1406602 () Bool)

(declare-fun res!944824 () Bool)

(assert (=> b!1406602 (=> (not res!944824) (not e!796121))))

(assert (=> b!1406602 (= res!944824 (validKeyInArray!0 (select (arr!46445 a!2901) j!112)))))

(declare-fun res!944821 () Bool)

(assert (=> start!120888 (=> (not res!944821) (not e!796121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120888 (= res!944821 (validMask!0 mask!2840))))

(assert (=> start!120888 e!796121))

(assert (=> start!120888 true))

(declare-fun array_inv!35473 (array!96195) Bool)

(assert (=> start!120888 (array_inv!35473 a!2901)))

(assert (= (and start!120888 res!944821) b!1406600))

(assert (= (and b!1406600 res!944820) b!1406605))

(assert (= (and b!1406605 res!944822) b!1406602))

(assert (= (and b!1406602 res!944824) b!1406603))

(assert (= (and b!1406603 res!944819) b!1406601))

(assert (= (and b!1406601 res!944817) b!1406606))

(assert (= (and b!1406606 res!944823) b!1406607))

(assert (= (and b!1406606 (not res!944818)) b!1406604))

(declare-fun m!1295811 () Bool)

(assert (=> b!1406606 m!1295811))

(declare-fun m!1295813 () Bool)

(assert (=> b!1406606 m!1295813))

(assert (=> b!1406606 m!1295811))

(declare-fun m!1295815 () Bool)

(assert (=> b!1406606 m!1295815))

(assert (=> b!1406606 m!1295813))

(assert (=> b!1406606 m!1295811))

(declare-fun m!1295817 () Bool)

(assert (=> b!1406606 m!1295817))

(declare-fun m!1295819 () Bool)

(assert (=> b!1406606 m!1295819))

(declare-fun m!1295821 () Bool)

(assert (=> b!1406605 m!1295821))

(assert (=> b!1406605 m!1295821))

(declare-fun m!1295823 () Bool)

(assert (=> b!1406605 m!1295823))

(assert (=> b!1406602 m!1295811))

(assert (=> b!1406602 m!1295811))

(declare-fun m!1295825 () Bool)

(assert (=> b!1406602 m!1295825))

(declare-fun m!1295827 () Bool)

(assert (=> b!1406601 m!1295827))

(declare-fun m!1295829 () Bool)

(assert (=> start!120888 m!1295829))

(declare-fun m!1295831 () Bool)

(assert (=> start!120888 m!1295831))

(declare-fun m!1295833 () Bool)

(assert (=> b!1406604 m!1295833))

(declare-fun m!1295835 () Bool)

(assert (=> b!1406604 m!1295835))

(assert (=> b!1406604 m!1295835))

(declare-fun m!1295837 () Bool)

(assert (=> b!1406604 m!1295837))

(assert (=> b!1406604 m!1295837))

(assert (=> b!1406604 m!1295835))

(declare-fun m!1295839 () Bool)

(assert (=> b!1406604 m!1295839))

(assert (=> b!1406607 m!1295811))

(assert (=> b!1406607 m!1295811))

(declare-fun m!1295841 () Bool)

(assert (=> b!1406607 m!1295841))

(declare-fun m!1295843 () Bool)

(assert (=> b!1406603 m!1295843))

(push 1)

(assert (not b!1406606))

(assert (not b!1406607))

(assert (not b!1406605))

(assert (not b!1406604))

(assert (not start!120888))

(assert (not b!1406601))

(assert (not b!1406603))

(assert (not b!1406602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

