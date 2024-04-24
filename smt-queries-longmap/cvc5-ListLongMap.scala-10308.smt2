; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121362 () Bool)

(assert start!121362)

(declare-fun b!1410074 () Bool)

(declare-fun res!947115 () Bool)

(declare-fun e!798082 () Bool)

(assert (=> b!1410074 (=> (not res!947115) (not e!798082))))

(declare-datatypes ((array!96438 0))(
  ( (array!96439 (arr!46560 (Array (_ BitVec 32) (_ BitVec 64))) (size!47111 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96438)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410074 (= res!947115 (validKeyInArray!0 (select (arr!46560 a!2901) j!112)))))

(declare-fun b!1410075 () Bool)

(declare-fun res!947117 () Bool)

(assert (=> b!1410075 (=> (not res!947117) (not e!798082))))

(declare-datatypes ((List!33066 0))(
  ( (Nil!33063) (Cons!33062 (h!34333 (_ BitVec 64)) (t!47752 List!33066)) )
))
(declare-fun arrayNoDuplicates!0 (array!96438 (_ BitVec 32) List!33066) Bool)

(assert (=> b!1410075 (= res!947117 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33063))))

(declare-fun b!1410076 () Bool)

(declare-fun e!798083 () Bool)

(assert (=> b!1410076 (= e!798083 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10774 0))(
  ( (MissingZero!10774 (index!45473 (_ BitVec 32))) (Found!10774 (index!45474 (_ BitVec 32))) (Intermediate!10774 (undefined!11586 Bool) (index!45475 (_ BitVec 32)) (x!127218 (_ BitVec 32))) (Undefined!10774) (MissingVacant!10774 (index!45476 (_ BitVec 32))) )
))
(declare-fun lt!620931 () SeekEntryResult!10774)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96438 (_ BitVec 32)) SeekEntryResult!10774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410076 (= lt!620931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46560 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46560 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96439 (store (arr!46560 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47111 a!2901)) mask!2840))))

(declare-fun b!1410077 () Bool)

(declare-fun res!947113 () Bool)

(assert (=> b!1410077 (=> (not res!947113) (not e!798082))))

(assert (=> b!1410077 (= res!947113 (and (= (size!47111 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47111 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47111 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!947119 () Bool)

(assert (=> start!121362 (=> (not res!947119) (not e!798082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121362 (= res!947119 (validMask!0 mask!2840))))

(assert (=> start!121362 e!798082))

(assert (=> start!121362 true))

(declare-fun array_inv!35841 (array!96438) Bool)

(assert (=> start!121362 (array_inv!35841 a!2901)))

(declare-fun b!1410078 () Bool)

(declare-fun res!947116 () Bool)

(assert (=> b!1410078 (=> (not res!947116) (not e!798082))))

(assert (=> b!1410078 (= res!947116 (validKeyInArray!0 (select (arr!46560 a!2901) i!1037)))))

(declare-fun b!1410079 () Bool)

(assert (=> b!1410079 (= e!798082 (not e!798083))))

(declare-fun res!947114 () Bool)

(assert (=> b!1410079 (=> res!947114 e!798083)))

(declare-fun lt!620933 () SeekEntryResult!10774)

(assert (=> b!1410079 (= res!947114 (or (not (is-Intermediate!10774 lt!620933)) (undefined!11586 lt!620933)))))

(declare-fun e!798081 () Bool)

(assert (=> b!1410079 e!798081))

(declare-fun res!947112 () Bool)

(assert (=> b!1410079 (=> (not res!947112) (not e!798081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96438 (_ BitVec 32)) Bool)

(assert (=> b!1410079 (= res!947112 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47549 0))(
  ( (Unit!47550) )
))
(declare-fun lt!620932 () Unit!47549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96438 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47549)

(assert (=> b!1410079 (= lt!620932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410079 (= lt!620933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46560 a!2901) j!112) mask!2840) (select (arr!46560 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410080 () Bool)

(declare-fun res!947118 () Bool)

(assert (=> b!1410080 (=> (not res!947118) (not e!798082))))

(assert (=> b!1410080 (= res!947118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410081 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96438 (_ BitVec 32)) SeekEntryResult!10774)

(assert (=> b!1410081 (= e!798081 (= (seekEntryOrOpen!0 (select (arr!46560 a!2901) j!112) a!2901 mask!2840) (Found!10774 j!112)))))

(assert (= (and start!121362 res!947119) b!1410077))

(assert (= (and b!1410077 res!947113) b!1410078))

(assert (= (and b!1410078 res!947116) b!1410074))

(assert (= (and b!1410074 res!947115) b!1410080))

(assert (= (and b!1410080 res!947118) b!1410075))

(assert (= (and b!1410075 res!947117) b!1410079))

(assert (= (and b!1410079 res!947112) b!1410081))

(assert (= (and b!1410079 (not res!947114)) b!1410076))

(declare-fun m!1299813 () Bool)

(assert (=> b!1410076 m!1299813))

(declare-fun m!1299815 () Bool)

(assert (=> b!1410076 m!1299815))

(assert (=> b!1410076 m!1299815))

(declare-fun m!1299817 () Bool)

(assert (=> b!1410076 m!1299817))

(assert (=> b!1410076 m!1299817))

(assert (=> b!1410076 m!1299815))

(declare-fun m!1299819 () Bool)

(assert (=> b!1410076 m!1299819))

(declare-fun m!1299821 () Bool)

(assert (=> b!1410079 m!1299821))

(declare-fun m!1299823 () Bool)

(assert (=> b!1410079 m!1299823))

(assert (=> b!1410079 m!1299821))

(declare-fun m!1299825 () Bool)

(assert (=> b!1410079 m!1299825))

(assert (=> b!1410079 m!1299823))

(assert (=> b!1410079 m!1299821))

(declare-fun m!1299827 () Bool)

(assert (=> b!1410079 m!1299827))

(declare-fun m!1299829 () Bool)

(assert (=> b!1410079 m!1299829))

(declare-fun m!1299831 () Bool)

(assert (=> b!1410078 m!1299831))

(assert (=> b!1410078 m!1299831))

(declare-fun m!1299833 () Bool)

(assert (=> b!1410078 m!1299833))

(declare-fun m!1299835 () Bool)

(assert (=> b!1410075 m!1299835))

(declare-fun m!1299837 () Bool)

(assert (=> b!1410080 m!1299837))

(declare-fun m!1299839 () Bool)

(assert (=> start!121362 m!1299839))

(declare-fun m!1299841 () Bool)

(assert (=> start!121362 m!1299841))

(assert (=> b!1410074 m!1299821))

(assert (=> b!1410074 m!1299821))

(declare-fun m!1299843 () Bool)

(assert (=> b!1410074 m!1299843))

(assert (=> b!1410081 m!1299821))

(assert (=> b!1410081 m!1299821))

(declare-fun m!1299845 () Bool)

(assert (=> b!1410081 m!1299845))

(push 1)

(assert (not b!1410076))

(assert (not start!121362))

(assert (not b!1410075))

(assert (not b!1410079))

(assert (not b!1410080))

(assert (not b!1410074))

(assert (not b!1410081))

(assert (not b!1410078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

