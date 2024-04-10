; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121204 () Bool)

(assert start!121204)

(declare-fun b!1409294 () Bool)

(declare-fun res!947016 () Bool)

(declare-fun e!797525 () Bool)

(assert (=> b!1409294 (=> (not res!947016) (not e!797525))))

(declare-datatypes ((array!96358 0))(
  ( (array!96359 (arr!46522 (Array (_ BitVec 32) (_ BitVec 64))) (size!47072 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96358)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96358 (_ BitVec 32)) Bool)

(assert (=> b!1409294 (= res!947016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409295 () Bool)

(declare-fun res!947019 () Bool)

(assert (=> b!1409295 (=> (not res!947019) (not e!797525))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409295 (= res!947019 (validKeyInArray!0 (select (arr!46522 a!2901) j!112)))))

(declare-fun b!1409296 () Bool)

(declare-fun e!797522 () Bool)

(assert (=> b!1409296 (= e!797522 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10833 0))(
  ( (MissingZero!10833 (index!45709 (_ BitVec 32))) (Found!10833 (index!45710 (_ BitVec 32))) (Intermediate!10833 (undefined!11645 Bool) (index!45711 (_ BitVec 32)) (x!127298 (_ BitVec 32))) (Undefined!10833) (MissingVacant!10833 (index!45712 (_ BitVec 32))) )
))
(declare-fun lt!620669 () SeekEntryResult!10833)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96358 (_ BitVec 32)) SeekEntryResult!10833)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409296 (= lt!620669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96359 (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47072 a!2901)) mask!2840))))

(declare-fun b!1409297 () Bool)

(assert (=> b!1409297 (= e!797525 (not e!797522))))

(declare-fun res!947020 () Bool)

(assert (=> b!1409297 (=> res!947020 e!797522)))

(declare-fun lt!620670 () SeekEntryResult!10833)

(assert (=> b!1409297 (= res!947020 (or (not (is-Intermediate!10833 lt!620670)) (undefined!11645 lt!620670)))))

(declare-fun e!797523 () Bool)

(assert (=> b!1409297 e!797523))

(declare-fun res!947022 () Bool)

(assert (=> b!1409297 (=> (not res!947022) (not e!797523))))

(assert (=> b!1409297 (= res!947022 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47640 0))(
  ( (Unit!47641) )
))
(declare-fun lt!620668 () Unit!47640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47640)

(assert (=> b!1409297 (= lt!620668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409297 (= lt!620670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46522 a!2901) j!112) mask!2840) (select (arr!46522 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409298 () Bool)

(declare-fun res!947023 () Bool)

(assert (=> b!1409298 (=> (not res!947023) (not e!797525))))

(assert (=> b!1409298 (= res!947023 (validKeyInArray!0 (select (arr!46522 a!2901) i!1037)))))

(declare-fun b!1409299 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96358 (_ BitVec 32)) SeekEntryResult!10833)

(assert (=> b!1409299 (= e!797523 (= (seekEntryOrOpen!0 (select (arr!46522 a!2901) j!112) a!2901 mask!2840) (Found!10833 j!112)))))

(declare-fun b!1409300 () Bool)

(declare-fun res!947021 () Bool)

(assert (=> b!1409300 (=> (not res!947021) (not e!797525))))

(declare-datatypes ((List!33041 0))(
  ( (Nil!33038) (Cons!33037 (h!34300 (_ BitVec 64)) (t!47735 List!33041)) )
))
(declare-fun arrayNoDuplicates!0 (array!96358 (_ BitVec 32) List!33041) Bool)

(assert (=> b!1409300 (= res!947021 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33038))))

(declare-fun res!947017 () Bool)

(assert (=> start!121204 (=> (not res!947017) (not e!797525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121204 (= res!947017 (validMask!0 mask!2840))))

(assert (=> start!121204 e!797525))

(assert (=> start!121204 true))

(declare-fun array_inv!35550 (array!96358) Bool)

(assert (=> start!121204 (array_inv!35550 a!2901)))

(declare-fun b!1409301 () Bool)

(declare-fun res!947018 () Bool)

(assert (=> b!1409301 (=> (not res!947018) (not e!797525))))

(assert (=> b!1409301 (= res!947018 (and (= (size!47072 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47072 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47072 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121204 res!947017) b!1409301))

(assert (= (and b!1409301 res!947018) b!1409298))

(assert (= (and b!1409298 res!947023) b!1409295))

(assert (= (and b!1409295 res!947019) b!1409294))

(assert (= (and b!1409294 res!947016) b!1409300))

(assert (= (and b!1409300 res!947021) b!1409297))

(assert (= (and b!1409297 res!947022) b!1409299))

(assert (= (and b!1409297 (not res!947020)) b!1409296))

(declare-fun m!1298951 () Bool)

(assert (=> start!121204 m!1298951))

(declare-fun m!1298953 () Bool)

(assert (=> start!121204 m!1298953))

(declare-fun m!1298955 () Bool)

(assert (=> b!1409295 m!1298955))

(assert (=> b!1409295 m!1298955))

(declare-fun m!1298957 () Bool)

(assert (=> b!1409295 m!1298957))

(assert (=> b!1409297 m!1298955))

(declare-fun m!1298959 () Bool)

(assert (=> b!1409297 m!1298959))

(assert (=> b!1409297 m!1298955))

(declare-fun m!1298961 () Bool)

(assert (=> b!1409297 m!1298961))

(assert (=> b!1409297 m!1298959))

(assert (=> b!1409297 m!1298955))

(declare-fun m!1298963 () Bool)

(assert (=> b!1409297 m!1298963))

(declare-fun m!1298965 () Bool)

(assert (=> b!1409297 m!1298965))

(declare-fun m!1298967 () Bool)

(assert (=> b!1409294 m!1298967))

(declare-fun m!1298969 () Bool)

(assert (=> b!1409296 m!1298969))

(declare-fun m!1298971 () Bool)

(assert (=> b!1409296 m!1298971))

(assert (=> b!1409296 m!1298971))

(declare-fun m!1298973 () Bool)

(assert (=> b!1409296 m!1298973))

(assert (=> b!1409296 m!1298973))

(assert (=> b!1409296 m!1298971))

(declare-fun m!1298975 () Bool)

(assert (=> b!1409296 m!1298975))

(declare-fun m!1298977 () Bool)

(assert (=> b!1409298 m!1298977))

(assert (=> b!1409298 m!1298977))

(declare-fun m!1298979 () Bool)

(assert (=> b!1409298 m!1298979))

(assert (=> b!1409299 m!1298955))

(assert (=> b!1409299 m!1298955))

(declare-fun m!1298981 () Bool)

(assert (=> b!1409299 m!1298981))

(declare-fun m!1298983 () Bool)

(assert (=> b!1409300 m!1298983))

(push 1)

(assert (not start!121204))

(assert (not b!1409295))

(assert (not b!1409300))

(assert (not b!1409298))

(assert (not b!1409296))

(assert (not b!1409294))

(assert (not b!1409299))

(assert (not b!1409297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

