; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122116 () Bool)

(assert start!122116)

(declare-fun b!1417070 () Bool)

(declare-fun e!802006 () Bool)

(declare-fun e!802004 () Bool)

(assert (=> b!1417070 (= e!802006 (not e!802004))))

(declare-fun res!952951 () Bool)

(assert (=> b!1417070 (=> res!952951 e!802004)))

(declare-datatypes ((SeekEntryResult!11016 0))(
  ( (MissingZero!11016 (index!46456 (_ BitVec 32))) (Found!11016 (index!46457 (_ BitVec 32))) (Intermediate!11016 (undefined!11828 Bool) (index!46458 (_ BitVec 32)) (x!128053 (_ BitVec 32))) (Undefined!11016) (MissingVacant!11016 (index!46459 (_ BitVec 32))) )
))
(declare-fun lt!625222 () SeekEntryResult!11016)

(assert (=> b!1417070 (= res!952951 (or (not (is-Intermediate!11016 lt!625222)) (undefined!11828 lt!625222)))))

(declare-fun e!802007 () Bool)

(assert (=> b!1417070 e!802007))

(declare-fun res!952947 () Bool)

(assert (=> b!1417070 (=> (not res!952947) (not e!802007))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96751 0))(
  ( (array!96752 (arr!46705 (Array (_ BitVec 32) (_ BitVec 64))) (size!47255 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96751)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96751 (_ BitVec 32)) Bool)

(assert (=> b!1417070 (= res!952947 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48006 0))(
  ( (Unit!48007) )
))
(declare-fun lt!625223 () Unit!48006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48006)

(assert (=> b!1417070 (= lt!625223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96751 (_ BitVec 32)) SeekEntryResult!11016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417070 (= lt!625222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46705 a!2901) j!112) mask!2840) (select (arr!46705 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!952954 () Bool)

(assert (=> start!122116 (=> (not res!952954) (not e!802006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122116 (= res!952954 (validMask!0 mask!2840))))

(assert (=> start!122116 e!802006))

(assert (=> start!122116 true))

(declare-fun array_inv!35733 (array!96751) Bool)

(assert (=> start!122116 (array_inv!35733 a!2901)))

(declare-fun b!1417071 () Bool)

(declare-fun res!952950 () Bool)

(assert (=> b!1417071 (=> (not res!952950) (not e!802006))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417071 (= res!952950 (and (= (size!47255 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47255 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47255 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417072 () Bool)

(declare-fun res!952953 () Bool)

(assert (=> b!1417072 (=> (not res!952953) (not e!802006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417072 (= res!952953 (validKeyInArray!0 (select (arr!46705 a!2901) i!1037)))))

(declare-fun b!1417073 () Bool)

(declare-fun res!952952 () Bool)

(assert (=> b!1417073 (=> (not res!952952) (not e!802006))))

(declare-datatypes ((List!33224 0))(
  ( (Nil!33221) (Cons!33220 (h!34510 (_ BitVec 64)) (t!47918 List!33224)) )
))
(declare-fun arrayNoDuplicates!0 (array!96751 (_ BitVec 32) List!33224) Bool)

(assert (=> b!1417073 (= res!952952 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33221))))

(declare-fun b!1417074 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96751 (_ BitVec 32)) SeekEntryResult!11016)

(assert (=> b!1417074 (= e!802007 (= (seekEntryOrOpen!0 (select (arr!46705 a!2901) j!112) a!2901 mask!2840) (Found!11016 j!112)))))

(declare-fun b!1417075 () Bool)

(declare-fun res!952949 () Bool)

(assert (=> b!1417075 (=> (not res!952949) (not e!802006))))

(assert (=> b!1417075 (= res!952949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417076 () Bool)

(assert (=> b!1417076 (= e!802004 true)))

(declare-fun lt!625224 () SeekEntryResult!11016)

(assert (=> b!1417076 (= lt!625224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46705 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46705 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96752 (store (arr!46705 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47255 a!2901)) mask!2840))))

(declare-fun b!1417077 () Bool)

(declare-fun res!952948 () Bool)

(assert (=> b!1417077 (=> (not res!952948) (not e!802006))))

(assert (=> b!1417077 (= res!952948 (validKeyInArray!0 (select (arr!46705 a!2901) j!112)))))

(assert (= (and start!122116 res!952954) b!1417071))

(assert (= (and b!1417071 res!952950) b!1417072))

(assert (= (and b!1417072 res!952953) b!1417077))

(assert (= (and b!1417077 res!952948) b!1417075))

(assert (= (and b!1417075 res!952949) b!1417073))

(assert (= (and b!1417073 res!952952) b!1417070))

(assert (= (and b!1417070 res!952947) b!1417074))

(assert (= (and b!1417070 (not res!952951)) b!1417076))

(declare-fun m!1307849 () Bool)

(assert (=> start!122116 m!1307849))

(declare-fun m!1307851 () Bool)

(assert (=> start!122116 m!1307851))

(declare-fun m!1307853 () Bool)

(assert (=> b!1417074 m!1307853))

(assert (=> b!1417074 m!1307853))

(declare-fun m!1307855 () Bool)

(assert (=> b!1417074 m!1307855))

(declare-fun m!1307857 () Bool)

(assert (=> b!1417073 m!1307857))

(declare-fun m!1307859 () Bool)

(assert (=> b!1417075 m!1307859))

(declare-fun m!1307861 () Bool)

(assert (=> b!1417072 m!1307861))

(assert (=> b!1417072 m!1307861))

(declare-fun m!1307863 () Bool)

(assert (=> b!1417072 m!1307863))

(assert (=> b!1417077 m!1307853))

(assert (=> b!1417077 m!1307853))

(declare-fun m!1307865 () Bool)

(assert (=> b!1417077 m!1307865))

(declare-fun m!1307867 () Bool)

(assert (=> b!1417076 m!1307867))

(declare-fun m!1307869 () Bool)

(assert (=> b!1417076 m!1307869))

(assert (=> b!1417076 m!1307869))

(declare-fun m!1307871 () Bool)

(assert (=> b!1417076 m!1307871))

(assert (=> b!1417076 m!1307871))

(assert (=> b!1417076 m!1307869))

(declare-fun m!1307873 () Bool)

(assert (=> b!1417076 m!1307873))

(assert (=> b!1417070 m!1307853))

(declare-fun m!1307875 () Bool)

(assert (=> b!1417070 m!1307875))

(assert (=> b!1417070 m!1307853))

(declare-fun m!1307877 () Bool)

(assert (=> b!1417070 m!1307877))

(assert (=> b!1417070 m!1307875))

(assert (=> b!1417070 m!1307853))

(declare-fun m!1307879 () Bool)

(assert (=> b!1417070 m!1307879))

(declare-fun m!1307881 () Bool)

(assert (=> b!1417070 m!1307881))

(push 1)

(assert (not b!1417072))

(assert (not start!122116))

(assert (not b!1417077))

(assert (not b!1417076))

(assert (not b!1417075))

(assert (not b!1417073))

(assert (not b!1417074))

(assert (not b!1417070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

