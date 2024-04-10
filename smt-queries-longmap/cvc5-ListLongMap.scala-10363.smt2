; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121992 () Bool)

(assert start!121992)

(declare-fun b!1415864 () Bool)

(declare-fun e!801361 () Bool)

(declare-fun e!801359 () Bool)

(assert (=> b!1415864 (= e!801361 e!801359)))

(declare-fun res!951915 () Bool)

(assert (=> b!1415864 (=> res!951915 e!801359)))

(declare-datatypes ((SeekEntryResult!10981 0))(
  ( (MissingZero!10981 (index!46316 (_ BitVec 32))) (Found!10981 (index!46317 (_ BitVec 32))) (Intermediate!10981 (undefined!11793 Bool) (index!46318 (_ BitVec 32)) (x!127924 (_ BitVec 32))) (Undefined!10981) (MissingVacant!10981 (index!46319 (_ BitVec 32))) )
))
(declare-fun lt!624437 () SeekEntryResult!10981)

(declare-fun lt!624438 () SeekEntryResult!10981)

(assert (=> b!1415864 (= res!951915 (or (= lt!624437 lt!624438) (not (is-Intermediate!10981 lt!624438))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624440 () (_ BitVec 64))

(declare-datatypes ((array!96678 0))(
  ( (array!96679 (arr!46670 (Array (_ BitVec 32) (_ BitVec 64))) (size!47220 (_ BitVec 32))) )
))
(declare-fun lt!624443 () array!96678)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96678 (_ BitVec 32)) SeekEntryResult!10981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415864 (= lt!624438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624440 mask!2840) lt!624440 lt!624443 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun a!2901 () array!96678)

(assert (=> b!1415864 (= lt!624440 (select (store (arr!46670 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415864 (= lt!624443 (array!96679 (store (arr!46670 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47220 a!2901)))))

(declare-fun b!1415865 () Bool)

(declare-fun e!801360 () Bool)

(assert (=> b!1415865 (= e!801360 true)))

(declare-fun lt!624444 () SeekEntryResult!10981)

(declare-fun lt!624442 () (_ BitVec 32))

(assert (=> b!1415865 (= lt!624444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624442 lt!624440 lt!624443 mask!2840))))

(declare-fun b!1415866 () Bool)

(declare-fun res!951908 () Bool)

(declare-fun e!801364 () Bool)

(assert (=> b!1415866 (=> (not res!951908) (not e!801364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415866 (= res!951908 (validKeyInArray!0 (select (arr!46670 a!2901) j!112)))))

(declare-fun b!1415867 () Bool)

(assert (=> b!1415867 (= e!801359 e!801360)))

(declare-fun res!951916 () Bool)

(assert (=> b!1415867 (=> res!951916 e!801360)))

(assert (=> b!1415867 (= res!951916 (or (bvslt (x!127924 lt!624437) #b00000000000000000000000000000000) (bvsgt (x!127924 lt!624437) #b01111111111111111111111111111110) (bvslt (x!127924 lt!624438) #b00000000000000000000000000000000) (bvsgt (x!127924 lt!624438) #b01111111111111111111111111111110) (bvslt lt!624442 #b00000000000000000000000000000000) (bvsge lt!624442 (size!47220 a!2901)) (bvslt (index!46318 lt!624437) #b00000000000000000000000000000000) (bvsge (index!46318 lt!624437) (size!47220 a!2901)) (bvslt (index!46318 lt!624438) #b00000000000000000000000000000000) (bvsge (index!46318 lt!624438) (size!47220 a!2901)) (not (= lt!624437 (Intermediate!10981 false (index!46318 lt!624437) (x!127924 lt!624437)))) (not (= lt!624438 (Intermediate!10981 false (index!46318 lt!624438) (x!127924 lt!624438))))))))

(declare-fun e!801362 () Bool)

(assert (=> b!1415867 e!801362))

(declare-fun res!951909 () Bool)

(assert (=> b!1415867 (=> (not res!951909) (not e!801362))))

(assert (=> b!1415867 (= res!951909 (and (not (undefined!11793 lt!624438)) (= (index!46318 lt!624438) i!1037) (bvslt (x!127924 lt!624438) (x!127924 lt!624437)) (= (select (store (arr!46670 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46318 lt!624438)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47936 0))(
  ( (Unit!47937) )
))
(declare-fun lt!624439 () Unit!47936)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47936)

(assert (=> b!1415867 (= lt!624439 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624442 (x!127924 lt!624437) (index!46318 lt!624437) (x!127924 lt!624438) (index!46318 lt!624438) (undefined!11793 lt!624438) mask!2840))))

(declare-fun res!951911 () Bool)

(assert (=> start!121992 (=> (not res!951911) (not e!801364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121992 (= res!951911 (validMask!0 mask!2840))))

(assert (=> start!121992 e!801364))

(assert (=> start!121992 true))

(declare-fun array_inv!35698 (array!96678) Bool)

(assert (=> start!121992 (array_inv!35698 a!2901)))

(declare-fun b!1415868 () Bool)

(declare-fun res!951914 () Bool)

(assert (=> b!1415868 (=> (not res!951914) (not e!801364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96678 (_ BitVec 32)) Bool)

(assert (=> b!1415868 (= res!951914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415869 () Bool)

(declare-fun res!951910 () Bool)

(assert (=> b!1415869 (=> (not res!951910) (not e!801364))))

(assert (=> b!1415869 (= res!951910 (validKeyInArray!0 (select (arr!46670 a!2901) i!1037)))))

(declare-fun b!1415870 () Bool)

(declare-fun res!951906 () Bool)

(assert (=> b!1415870 (=> (not res!951906) (not e!801364))))

(declare-datatypes ((List!33189 0))(
  ( (Nil!33186) (Cons!33185 (h!34472 (_ BitVec 64)) (t!47883 List!33189)) )
))
(declare-fun arrayNoDuplicates!0 (array!96678 (_ BitVec 32) List!33189) Bool)

(assert (=> b!1415870 (= res!951906 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33186))))

(declare-fun b!1415871 () Bool)

(assert (=> b!1415871 (= e!801364 (not e!801361))))

(declare-fun res!951907 () Bool)

(assert (=> b!1415871 (=> res!951907 e!801361)))

(assert (=> b!1415871 (= res!951907 (or (not (is-Intermediate!10981 lt!624437)) (undefined!11793 lt!624437)))))

(declare-fun e!801365 () Bool)

(assert (=> b!1415871 e!801365))

(declare-fun res!951912 () Bool)

(assert (=> b!1415871 (=> (not res!951912) (not e!801365))))

(assert (=> b!1415871 (= res!951912 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624441 () Unit!47936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47936)

(assert (=> b!1415871 (= lt!624441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415871 (= lt!624437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624442 (select (arr!46670 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415871 (= lt!624442 (toIndex!0 (select (arr!46670 a!2901) j!112) mask!2840))))

(declare-fun b!1415872 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96678 (_ BitVec 32)) SeekEntryResult!10981)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96678 (_ BitVec 32)) SeekEntryResult!10981)

(assert (=> b!1415872 (= e!801362 (= (seekEntryOrOpen!0 lt!624440 lt!624443 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127924 lt!624438) (index!46318 lt!624438) (index!46318 lt!624438) (select (arr!46670 a!2901) j!112) lt!624443 mask!2840)))))

(declare-fun b!1415873 () Bool)

(assert (=> b!1415873 (= e!801365 (= (seekEntryOrOpen!0 (select (arr!46670 a!2901) j!112) a!2901 mask!2840) (Found!10981 j!112)))))

(declare-fun b!1415874 () Bool)

(declare-fun res!951913 () Bool)

(assert (=> b!1415874 (=> (not res!951913) (not e!801364))))

(assert (=> b!1415874 (= res!951913 (and (= (size!47220 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47220 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47220 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121992 res!951911) b!1415874))

(assert (= (and b!1415874 res!951913) b!1415869))

(assert (= (and b!1415869 res!951910) b!1415866))

(assert (= (and b!1415866 res!951908) b!1415868))

(assert (= (and b!1415868 res!951914) b!1415870))

(assert (= (and b!1415870 res!951906) b!1415871))

(assert (= (and b!1415871 res!951912) b!1415873))

(assert (= (and b!1415871 (not res!951907)) b!1415864))

(assert (= (and b!1415864 (not res!951915)) b!1415867))

(assert (= (and b!1415867 res!951909) b!1415872))

(assert (= (and b!1415867 (not res!951916)) b!1415865))

(declare-fun m!1306299 () Bool)

(assert (=> b!1415864 m!1306299))

(assert (=> b!1415864 m!1306299))

(declare-fun m!1306301 () Bool)

(assert (=> b!1415864 m!1306301))

(declare-fun m!1306303 () Bool)

(assert (=> b!1415864 m!1306303))

(declare-fun m!1306305 () Bool)

(assert (=> b!1415864 m!1306305))

(declare-fun m!1306307 () Bool)

(assert (=> b!1415869 m!1306307))

(assert (=> b!1415869 m!1306307))

(declare-fun m!1306309 () Bool)

(assert (=> b!1415869 m!1306309))

(declare-fun m!1306311 () Bool)

(assert (=> b!1415871 m!1306311))

(declare-fun m!1306313 () Bool)

(assert (=> b!1415871 m!1306313))

(assert (=> b!1415871 m!1306311))

(assert (=> b!1415871 m!1306311))

(declare-fun m!1306315 () Bool)

(assert (=> b!1415871 m!1306315))

(declare-fun m!1306317 () Bool)

(assert (=> b!1415871 m!1306317))

(declare-fun m!1306319 () Bool)

(assert (=> b!1415871 m!1306319))

(assert (=> b!1415873 m!1306311))

(assert (=> b!1415873 m!1306311))

(declare-fun m!1306321 () Bool)

(assert (=> b!1415873 m!1306321))

(declare-fun m!1306323 () Bool)

(assert (=> start!121992 m!1306323))

(declare-fun m!1306325 () Bool)

(assert (=> start!121992 m!1306325))

(declare-fun m!1306327 () Bool)

(assert (=> b!1415868 m!1306327))

(assert (=> b!1415867 m!1306303))

(declare-fun m!1306329 () Bool)

(assert (=> b!1415867 m!1306329))

(declare-fun m!1306331 () Bool)

(assert (=> b!1415867 m!1306331))

(declare-fun m!1306333 () Bool)

(assert (=> b!1415872 m!1306333))

(assert (=> b!1415872 m!1306311))

(assert (=> b!1415872 m!1306311))

(declare-fun m!1306335 () Bool)

(assert (=> b!1415872 m!1306335))

(declare-fun m!1306337 () Bool)

(assert (=> b!1415865 m!1306337))

(assert (=> b!1415866 m!1306311))

(assert (=> b!1415866 m!1306311))

(declare-fun m!1306339 () Bool)

(assert (=> b!1415866 m!1306339))

(declare-fun m!1306341 () Bool)

(assert (=> b!1415870 m!1306341))

(push 1)

