; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121090 () Bool)

(assert start!121090)

(declare-fun b!1407881 () Bool)

(declare-fun res!945605 () Bool)

(declare-fun e!796840 () Bool)

(assert (=> b!1407881 (=> (not res!945605) (not e!796840))))

(declare-datatypes ((array!96244 0))(
  ( (array!96245 (arr!46465 (Array (_ BitVec 32) (_ BitVec 64))) (size!47015 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96244)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407881 (= res!945605 (validKeyInArray!0 (select (arr!46465 a!2901) j!112)))))

(declare-fun b!1407882 () Bool)

(declare-fun res!945610 () Bool)

(assert (=> b!1407882 (=> (not res!945610) (not e!796840))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407882 (= res!945610 (and (= (size!47015 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47015 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47015 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407883 () Bool)

(declare-fun e!796839 () Bool)

(declare-datatypes ((SeekEntryResult!10776 0))(
  ( (MissingZero!10776 (index!45481 (_ BitVec 32))) (Found!10776 (index!45482 (_ BitVec 32))) (Intermediate!10776 (undefined!11588 Bool) (index!45483 (_ BitVec 32)) (x!127089 (_ BitVec 32))) (Undefined!10776) (MissingVacant!10776 (index!45484 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96244 (_ BitVec 32)) SeekEntryResult!10776)

(assert (=> b!1407883 (= e!796839 (= (seekEntryOrOpen!0 (select (arr!46465 a!2901) j!112) a!2901 mask!2840) (Found!10776 j!112)))))

(declare-fun b!1407885 () Bool)

(declare-fun e!796841 () Bool)

(assert (=> b!1407885 (= e!796840 (not e!796841))))

(declare-fun res!945606 () Bool)

(assert (=> b!1407885 (=> res!945606 e!796841)))

(declare-fun lt!619976 () SeekEntryResult!10776)

(assert (=> b!1407885 (= res!945606 (or (not (is-Intermediate!10776 lt!619976)) (undefined!11588 lt!619976)))))

(assert (=> b!1407885 e!796839))

(declare-fun res!945603 () Bool)

(assert (=> b!1407885 (=> (not res!945603) (not e!796839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96244 (_ BitVec 32)) Bool)

(assert (=> b!1407885 (= res!945603 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47526 0))(
  ( (Unit!47527) )
))
(declare-fun lt!619975 () Unit!47526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47526)

(assert (=> b!1407885 (= lt!619975 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96244 (_ BitVec 32)) SeekEntryResult!10776)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407885 (= lt!619976 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46465 a!2901) j!112) mask!2840) (select (arr!46465 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407886 () Bool)

(assert (=> b!1407886 (= e!796841 true)))

(declare-fun lt!619977 () SeekEntryResult!10776)

(assert (=> b!1407886 (= lt!619977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46465 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46465 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96245 (store (arr!46465 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47015 a!2901)) mask!2840))))

(declare-fun b!1407884 () Bool)

(declare-fun res!945609 () Bool)

(assert (=> b!1407884 (=> (not res!945609) (not e!796840))))

(declare-datatypes ((List!32984 0))(
  ( (Nil!32981) (Cons!32980 (h!34243 (_ BitVec 64)) (t!47678 List!32984)) )
))
(declare-fun arrayNoDuplicates!0 (array!96244 (_ BitVec 32) List!32984) Bool)

(assert (=> b!1407884 (= res!945609 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32981))))

(declare-fun res!945608 () Bool)

(assert (=> start!121090 (=> (not res!945608) (not e!796840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121090 (= res!945608 (validMask!0 mask!2840))))

(assert (=> start!121090 e!796840))

(assert (=> start!121090 true))

(declare-fun array_inv!35493 (array!96244) Bool)

(assert (=> start!121090 (array_inv!35493 a!2901)))

(declare-fun b!1407887 () Bool)

(declare-fun res!945607 () Bool)

(assert (=> b!1407887 (=> (not res!945607) (not e!796840))))

(assert (=> b!1407887 (= res!945607 (validKeyInArray!0 (select (arr!46465 a!2901) i!1037)))))

(declare-fun b!1407888 () Bool)

(declare-fun res!945604 () Bool)

(assert (=> b!1407888 (=> (not res!945604) (not e!796840))))

(assert (=> b!1407888 (= res!945604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121090 res!945608) b!1407882))

(assert (= (and b!1407882 res!945610) b!1407887))

(assert (= (and b!1407887 res!945607) b!1407881))

(assert (= (and b!1407881 res!945605) b!1407888))

(assert (= (and b!1407888 res!945604) b!1407884))

(assert (= (and b!1407884 res!945609) b!1407885))

(assert (= (and b!1407885 res!945603) b!1407883))

(assert (= (and b!1407885 (not res!945606)) b!1407886))

(declare-fun m!1296953 () Bool)

(assert (=> b!1407887 m!1296953))

(assert (=> b!1407887 m!1296953))

(declare-fun m!1296955 () Bool)

(assert (=> b!1407887 m!1296955))

(declare-fun m!1296957 () Bool)

(assert (=> b!1407886 m!1296957))

(declare-fun m!1296959 () Bool)

(assert (=> b!1407886 m!1296959))

(assert (=> b!1407886 m!1296959))

(declare-fun m!1296961 () Bool)

(assert (=> b!1407886 m!1296961))

(assert (=> b!1407886 m!1296961))

(assert (=> b!1407886 m!1296959))

(declare-fun m!1296963 () Bool)

(assert (=> b!1407886 m!1296963))

(declare-fun m!1296965 () Bool)

(assert (=> b!1407881 m!1296965))

(assert (=> b!1407881 m!1296965))

(declare-fun m!1296967 () Bool)

(assert (=> b!1407881 m!1296967))

(assert (=> b!1407883 m!1296965))

(assert (=> b!1407883 m!1296965))

(declare-fun m!1296969 () Bool)

(assert (=> b!1407883 m!1296969))

(assert (=> b!1407885 m!1296965))

(declare-fun m!1296971 () Bool)

(assert (=> b!1407885 m!1296971))

(assert (=> b!1407885 m!1296965))

(declare-fun m!1296973 () Bool)

(assert (=> b!1407885 m!1296973))

(assert (=> b!1407885 m!1296971))

(assert (=> b!1407885 m!1296965))

(declare-fun m!1296975 () Bool)

(assert (=> b!1407885 m!1296975))

(declare-fun m!1296977 () Bool)

(assert (=> b!1407885 m!1296977))

(declare-fun m!1296979 () Bool)

(assert (=> b!1407884 m!1296979))

(declare-fun m!1296981 () Bool)

(assert (=> b!1407888 m!1296981))

(declare-fun m!1296983 () Bool)

(assert (=> start!121090 m!1296983))

(declare-fun m!1296985 () Bool)

(assert (=> start!121090 m!1296985))

(push 1)

(assert (not b!1407883))

(assert (not b!1407884))

(assert (not b!1407888))

(assert (not b!1407886))

(assert (not b!1407887))

(assert (not start!121090))

(assert (not b!1407881))

(assert (not b!1407885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

