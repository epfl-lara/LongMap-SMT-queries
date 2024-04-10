; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122022 () Bool)

(assert start!122022)

(declare-fun b!1416321 () Bool)

(declare-fun res!952369 () Bool)

(declare-fun e!801602 () Bool)

(assert (=> b!1416321 (=> res!952369 e!801602)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624881 () (_ BitVec 32))

(declare-fun lt!624880 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10996 0))(
  ( (MissingZero!10996 (index!46376 (_ BitVec 32))) (Found!10996 (index!46377 (_ BitVec 32))) (Intermediate!10996 (undefined!11808 Bool) (index!46378 (_ BitVec 32)) (x!127979 (_ BitVec 32))) (Undefined!10996) (MissingVacant!10996 (index!46379 (_ BitVec 32))) )
))
(declare-fun lt!624873 () SeekEntryResult!10996)

(declare-datatypes ((array!96708 0))(
  ( (array!96709 (arr!46685 (Array (_ BitVec 32) (_ BitVec 64))) (size!47235 (_ BitVec 32))) )
))
(declare-fun lt!624876 () array!96708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96708 (_ BitVec 32)) SeekEntryResult!10996)

(assert (=> b!1416321 (= res!952369 (not (= lt!624873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624881 lt!624880 lt!624876 mask!2840))))))

(declare-fun b!1416322 () Bool)

(declare-fun res!952364 () Bool)

(declare-fun e!801601 () Bool)

(assert (=> b!1416322 (=> (not res!952364) (not e!801601))))

(declare-fun a!2901 () array!96708)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96708 (_ BitVec 32)) Bool)

(assert (=> b!1416322 (= res!952364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416323 () Bool)

(declare-fun res!952365 () Bool)

(assert (=> b!1416323 (=> (not res!952365) (not e!801601))))

(declare-datatypes ((List!33204 0))(
  ( (Nil!33201) (Cons!33200 (h!34487 (_ BitVec 64)) (t!47898 List!33204)) )
))
(declare-fun arrayNoDuplicates!0 (array!96708 (_ BitVec 32) List!33204) Bool)

(assert (=> b!1416323 (= res!952365 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33201))))

(declare-fun b!1416324 () Bool)

(declare-fun res!952372 () Bool)

(assert (=> b!1416324 (=> (not res!952372) (not e!801601))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416324 (= res!952372 (validKeyInArray!0 (select (arr!46685 a!2901) j!112)))))

(declare-fun b!1416325 () Bool)

(declare-fun e!801599 () Bool)

(declare-fun e!801600 () Bool)

(assert (=> b!1416325 (= e!801599 e!801600)))

(declare-fun res!952363 () Bool)

(assert (=> b!1416325 (=> res!952363 e!801600)))

(declare-fun lt!624877 () SeekEntryResult!10996)

(assert (=> b!1416325 (= res!952363 (or (= lt!624877 lt!624873) (not (is-Intermediate!10996 lt!624873))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416325 (= lt!624873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624880 mask!2840) lt!624880 lt!624876 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416325 (= lt!624880 (select (store (arr!46685 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416325 (= lt!624876 (array!96709 (store (arr!46685 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47235 a!2901)))))

(declare-fun b!1416326 () Bool)

(declare-fun res!952371 () Bool)

(assert (=> b!1416326 (=> (not res!952371) (not e!801601))))

(assert (=> b!1416326 (= res!952371 (and (= (size!47235 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47235 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47235 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416327 () Bool)

(declare-fun res!952368 () Bool)

(assert (=> b!1416327 (=> (not res!952368) (not e!801601))))

(assert (=> b!1416327 (= res!952368 (validKeyInArray!0 (select (arr!46685 a!2901) i!1037)))))

(declare-fun b!1416328 () Bool)

(assert (=> b!1416328 (= e!801601 (not e!801599))))

(declare-fun res!952366 () Bool)

(assert (=> b!1416328 (=> res!952366 e!801599)))

(assert (=> b!1416328 (= res!952366 (or (not (is-Intermediate!10996 lt!624877)) (undefined!11808 lt!624877)))))

(declare-fun lt!624875 () SeekEntryResult!10996)

(assert (=> b!1416328 (= lt!624875 (Found!10996 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96708 (_ BitVec 32)) SeekEntryResult!10996)

(assert (=> b!1416328 (= lt!624875 (seekEntryOrOpen!0 (select (arr!46685 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416328 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47966 0))(
  ( (Unit!47967) )
))
(declare-fun lt!624878 () Unit!47966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47966)

(assert (=> b!1416328 (= lt!624878 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416328 (= lt!624877 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624881 (select (arr!46685 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1416328 (= lt!624881 (toIndex!0 (select (arr!46685 a!2901) j!112) mask!2840))))

(declare-fun res!952370 () Bool)

(assert (=> start!122022 (=> (not res!952370) (not e!801601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122022 (= res!952370 (validMask!0 mask!2840))))

(assert (=> start!122022 e!801601))

(assert (=> start!122022 true))

(declare-fun array_inv!35713 (array!96708) Bool)

(assert (=> start!122022 (array_inv!35713 a!2901)))

(declare-fun b!1416329 () Bool)

(assert (=> b!1416329 (= e!801602 true)))

(declare-fun lt!624879 () SeekEntryResult!10996)

(assert (=> b!1416329 (= lt!624875 lt!624879)))

(declare-fun lt!624874 () Unit!47966)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47966)

(assert (=> b!1416329 (= lt!624874 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624881 (x!127979 lt!624877) (index!46378 lt!624877) (x!127979 lt!624873) (index!46378 lt!624873) mask!2840))))

(declare-fun b!1416330 () Bool)

(assert (=> b!1416330 (= e!801600 e!801602)))

(declare-fun res!952367 () Bool)

(assert (=> b!1416330 (=> res!952367 e!801602)))

(assert (=> b!1416330 (= res!952367 (or (bvslt (x!127979 lt!624877) #b00000000000000000000000000000000) (bvsgt (x!127979 lt!624877) #b01111111111111111111111111111110) (bvslt (x!127979 lt!624873) #b00000000000000000000000000000000) (bvsgt (x!127979 lt!624873) #b01111111111111111111111111111110) (bvslt lt!624881 #b00000000000000000000000000000000) (bvsge lt!624881 (size!47235 a!2901)) (bvslt (index!46378 lt!624877) #b00000000000000000000000000000000) (bvsge (index!46378 lt!624877) (size!47235 a!2901)) (bvslt (index!46378 lt!624873) #b00000000000000000000000000000000) (bvsge (index!46378 lt!624873) (size!47235 a!2901)) (not (= lt!624877 (Intermediate!10996 false (index!46378 lt!624877) (x!127979 lt!624877)))) (not (= lt!624873 (Intermediate!10996 false (index!46378 lt!624873) (x!127979 lt!624873))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96708 (_ BitVec 32)) SeekEntryResult!10996)

(assert (=> b!1416330 (= lt!624879 (seekKeyOrZeroReturnVacant!0 (x!127979 lt!624873) (index!46378 lt!624873) (index!46378 lt!624873) (select (arr!46685 a!2901) j!112) lt!624876 mask!2840))))

(assert (=> b!1416330 (= lt!624879 (seekEntryOrOpen!0 lt!624880 lt!624876 mask!2840))))

(assert (=> b!1416330 (and (not (undefined!11808 lt!624873)) (= (index!46378 lt!624873) i!1037) (bvslt (x!127979 lt!624873) (x!127979 lt!624877)) (= (select (store (arr!46685 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46378 lt!624873)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624882 () Unit!47966)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47966)

(assert (=> b!1416330 (= lt!624882 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624881 (x!127979 lt!624877) (index!46378 lt!624877) (x!127979 lt!624873) (index!46378 lt!624873) (undefined!11808 lt!624873) mask!2840))))

(assert (= (and start!122022 res!952370) b!1416326))

(assert (= (and b!1416326 res!952371) b!1416327))

(assert (= (and b!1416327 res!952368) b!1416324))

(assert (= (and b!1416324 res!952372) b!1416322))

(assert (= (and b!1416322 res!952364) b!1416323))

(assert (= (and b!1416323 res!952365) b!1416328))

(assert (= (and b!1416328 (not res!952366)) b!1416325))

(assert (= (and b!1416325 (not res!952363)) b!1416330))

(assert (= (and b!1416330 (not res!952367)) b!1416321))

(assert (= (and b!1416321 (not res!952369)) b!1416329))

(declare-fun m!1306983 () Bool)

(assert (=> b!1416325 m!1306983))

(assert (=> b!1416325 m!1306983))

(declare-fun m!1306985 () Bool)

(assert (=> b!1416325 m!1306985))

(declare-fun m!1306987 () Bool)

(assert (=> b!1416325 m!1306987))

(declare-fun m!1306989 () Bool)

(assert (=> b!1416325 m!1306989))

(declare-fun m!1306991 () Bool)

(assert (=> b!1416328 m!1306991))

(declare-fun m!1306993 () Bool)

(assert (=> b!1416328 m!1306993))

(assert (=> b!1416328 m!1306991))

(assert (=> b!1416328 m!1306991))

(declare-fun m!1306995 () Bool)

(assert (=> b!1416328 m!1306995))

(declare-fun m!1306997 () Bool)

(assert (=> b!1416328 m!1306997))

(assert (=> b!1416328 m!1306991))

(declare-fun m!1306999 () Bool)

(assert (=> b!1416328 m!1306999))

(declare-fun m!1307001 () Bool)

(assert (=> b!1416328 m!1307001))

(declare-fun m!1307003 () Bool)

(assert (=> b!1416323 m!1307003))

(assert (=> b!1416324 m!1306991))

(assert (=> b!1416324 m!1306991))

(declare-fun m!1307005 () Bool)

(assert (=> b!1416324 m!1307005))

(declare-fun m!1307007 () Bool)

(assert (=> b!1416329 m!1307007))

(declare-fun m!1307009 () Bool)

(assert (=> b!1416330 m!1307009))

(assert (=> b!1416330 m!1306991))

(declare-fun m!1307011 () Bool)

(assert (=> b!1416330 m!1307011))

(assert (=> b!1416330 m!1306991))

(declare-fun m!1307013 () Bool)

(assert (=> b!1416330 m!1307013))

(declare-fun m!1307015 () Bool)

(assert (=> b!1416330 m!1307015))

(assert (=> b!1416330 m!1306987))

(declare-fun m!1307017 () Bool)

(assert (=> b!1416321 m!1307017))

(declare-fun m!1307019 () Bool)

(assert (=> b!1416327 m!1307019))

(assert (=> b!1416327 m!1307019))

(declare-fun m!1307021 () Bool)

(assert (=> b!1416327 m!1307021))

(declare-fun m!1307023 () Bool)

(assert (=> b!1416322 m!1307023))

(declare-fun m!1307025 () Bool)

(assert (=> start!122022 m!1307025))

(declare-fun m!1307027 () Bool)

(assert (=> start!122022 m!1307027))

(push 1)

