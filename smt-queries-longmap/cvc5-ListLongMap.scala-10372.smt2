; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122100 () Bool)

(assert start!122100)

(declare-datatypes ((array!96688 0))(
  ( (array!96689 (arr!46674 (Array (_ BitVec 32) (_ BitVec 64))) (size!47226 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96688)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!801893 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1416846 () Bool)

(declare-datatypes ((SeekEntryResult!11011 0))(
  ( (MissingZero!11011 (index!46436 (_ BitVec 32))) (Found!11011 (index!46437 (_ BitVec 32))) (Intermediate!11011 (undefined!11823 Bool) (index!46438 (_ BitVec 32)) (x!128029 (_ BitVec 32))) (Undefined!11011) (MissingVacant!11011 (index!46439 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96688 (_ BitVec 32)) SeekEntryResult!11011)

(assert (=> b!1416846 (= e!801893 (= (seekEntryOrOpen!0 (select (arr!46674 a!2901) j!112) a!2901 mask!2840) (Found!11011 j!112)))))

(declare-fun b!1416847 () Bool)

(declare-fun res!952773 () Bool)

(declare-fun e!801894 () Bool)

(assert (=> b!1416847 (=> (not res!952773) (not e!801894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416847 (= res!952773 (validKeyInArray!0 (select (arr!46674 a!2901) j!112)))))

(declare-fun b!1416848 () Bool)

(declare-fun res!952777 () Bool)

(assert (=> b!1416848 (=> (not res!952777) (not e!801894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96688 (_ BitVec 32)) Bool)

(assert (=> b!1416848 (= res!952777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416849 () Bool)

(declare-fun res!952774 () Bool)

(assert (=> b!1416849 (=> (not res!952774) (not e!801894))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416849 (= res!952774 (and (= (size!47226 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47226 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47226 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416850 () Bool)

(declare-fun e!801895 () Bool)

(assert (=> b!1416850 (= e!801895 true)))

(declare-fun lt!624979 () SeekEntryResult!11011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96688 (_ BitVec 32)) SeekEntryResult!11011)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416850 (= lt!624979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46674 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46674 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96689 (store (arr!46674 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47226 a!2901)) mask!2840))))

(declare-fun b!1416851 () Bool)

(declare-fun res!952778 () Bool)

(assert (=> b!1416851 (=> (not res!952778) (not e!801894))))

(declare-datatypes ((List!33271 0))(
  ( (Nil!33268) (Cons!33267 (h!34557 (_ BitVec 64)) (t!47957 List!33271)) )
))
(declare-fun arrayNoDuplicates!0 (array!96688 (_ BitVec 32) List!33271) Bool)

(assert (=> b!1416851 (= res!952778 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33268))))

(declare-fun b!1416852 () Bool)

(declare-fun res!952779 () Bool)

(assert (=> b!1416852 (=> (not res!952779) (not e!801894))))

(assert (=> b!1416852 (= res!952779 (validKeyInArray!0 (select (arr!46674 a!2901) i!1037)))))

(declare-fun b!1416845 () Bool)

(assert (=> b!1416845 (= e!801894 (not e!801895))))

(declare-fun res!952776 () Bool)

(assert (=> b!1416845 (=> res!952776 e!801895)))

(declare-fun lt!624978 () SeekEntryResult!11011)

(assert (=> b!1416845 (= res!952776 (or (not (is-Intermediate!11011 lt!624978)) (undefined!11823 lt!624978)))))

(assert (=> b!1416845 e!801893))

(declare-fun res!952775 () Bool)

(assert (=> b!1416845 (=> (not res!952775) (not e!801893))))

(assert (=> b!1416845 (= res!952775 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47839 0))(
  ( (Unit!47840) )
))
(declare-fun lt!624980 () Unit!47839)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47839)

(assert (=> b!1416845 (= lt!624980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416845 (= lt!624978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46674 a!2901) j!112) mask!2840) (select (arr!46674 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!952780 () Bool)

(assert (=> start!122100 (=> (not res!952780) (not e!801894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122100 (= res!952780 (validMask!0 mask!2840))))

(assert (=> start!122100 e!801894))

(assert (=> start!122100 true))

(declare-fun array_inv!35907 (array!96688) Bool)

(assert (=> start!122100 (array_inv!35907 a!2901)))

(assert (= (and start!122100 res!952780) b!1416849))

(assert (= (and b!1416849 res!952774) b!1416852))

(assert (= (and b!1416852 res!952779) b!1416847))

(assert (= (and b!1416847 res!952773) b!1416848))

(assert (= (and b!1416848 res!952777) b!1416851))

(assert (= (and b!1416851 res!952778) b!1416845))

(assert (= (and b!1416845 res!952775) b!1416846))

(assert (= (and b!1416845 (not res!952776)) b!1416850))

(declare-fun m!1307109 () Bool)

(assert (=> b!1416851 m!1307109))

(declare-fun m!1307111 () Bool)

(assert (=> b!1416845 m!1307111))

(declare-fun m!1307113 () Bool)

(assert (=> b!1416845 m!1307113))

(assert (=> b!1416845 m!1307111))

(declare-fun m!1307115 () Bool)

(assert (=> b!1416845 m!1307115))

(assert (=> b!1416845 m!1307113))

(assert (=> b!1416845 m!1307111))

(declare-fun m!1307117 () Bool)

(assert (=> b!1416845 m!1307117))

(declare-fun m!1307119 () Bool)

(assert (=> b!1416845 m!1307119))

(declare-fun m!1307121 () Bool)

(assert (=> start!122100 m!1307121))

(declare-fun m!1307123 () Bool)

(assert (=> start!122100 m!1307123))

(declare-fun m!1307125 () Bool)

(assert (=> b!1416848 m!1307125))

(assert (=> b!1416847 m!1307111))

(assert (=> b!1416847 m!1307111))

(declare-fun m!1307127 () Bool)

(assert (=> b!1416847 m!1307127))

(declare-fun m!1307129 () Bool)

(assert (=> b!1416850 m!1307129))

(declare-fun m!1307131 () Bool)

(assert (=> b!1416850 m!1307131))

(assert (=> b!1416850 m!1307131))

(declare-fun m!1307133 () Bool)

(assert (=> b!1416850 m!1307133))

(assert (=> b!1416850 m!1307133))

(assert (=> b!1416850 m!1307131))

(declare-fun m!1307135 () Bool)

(assert (=> b!1416850 m!1307135))

(assert (=> b!1416846 m!1307111))

(assert (=> b!1416846 m!1307111))

(declare-fun m!1307137 () Bool)

(assert (=> b!1416846 m!1307137))

(declare-fun m!1307139 () Bool)

(assert (=> b!1416852 m!1307139))

(assert (=> b!1416852 m!1307139))

(declare-fun m!1307141 () Bool)

(assert (=> b!1416852 m!1307141))

(push 1)

(assert (not start!122100))

(assert (not b!1416850))

(assert (not b!1416852))

(assert (not b!1416848))

(assert (not b!1416847))

(assert (not b!1416851))

(assert (not b!1416845))

(assert (not b!1416846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

