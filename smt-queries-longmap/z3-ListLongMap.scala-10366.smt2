; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122006 () Bool)

(assert start!122006)

(declare-fun b!1416060 () Bool)

(declare-fun e!801473 () Bool)

(declare-fun e!801471 () Bool)

(assert (=> b!1416060 (= e!801473 e!801471)))

(declare-fun res!952154 () Bool)

(assert (=> b!1416060 (=> res!952154 e!801471)))

(declare-datatypes ((array!96645 0))(
  ( (array!96646 (arr!46654 (Array (_ BitVec 32) (_ BitVec 64))) (size!47206 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96645)

(declare-datatypes ((SeekEntryResult!10991 0))(
  ( (MissingZero!10991 (index!46356 (_ BitVec 32))) (Found!10991 (index!46357 (_ BitVec 32))) (Intermediate!10991 (undefined!11803 Bool) (index!46358 (_ BitVec 32)) (x!127955 (_ BitVec 32))) (Undefined!10991) (MissingVacant!10991 (index!46359 (_ BitVec 32))) )
))
(declare-fun lt!624507 () SeekEntryResult!10991)

(declare-fun lt!624509 () (_ BitVec 32))

(declare-fun lt!624511 () SeekEntryResult!10991)

(assert (=> b!1416060 (= res!952154 (or (bvslt (x!127955 lt!624507) #b00000000000000000000000000000000) (bvsgt (x!127955 lt!624507) #b01111111111111111111111111111110) (bvslt (x!127955 lt!624511) #b00000000000000000000000000000000) (bvsgt (x!127955 lt!624511) #b01111111111111111111111111111110) (bvslt lt!624509 #b00000000000000000000000000000000) (bvsge lt!624509 (size!47206 a!2901)) (bvslt (index!46358 lt!624507) #b00000000000000000000000000000000) (bvsge (index!46358 lt!624507) (size!47206 a!2901)) (bvslt (index!46358 lt!624511) #b00000000000000000000000000000000) (bvsge (index!46358 lt!624511) (size!47206 a!2901)) (not (= lt!624507 (Intermediate!10991 false (index!46358 lt!624507) (x!127955 lt!624507)))) (not (= lt!624511 (Intermediate!10991 false (index!46358 lt!624511) (x!127955 lt!624511))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624505 () SeekEntryResult!10991)

(declare-fun lt!624506 () array!96645)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96645 (_ BitVec 32)) SeekEntryResult!10991)

(assert (=> b!1416060 (= lt!624505 (seekKeyOrZeroReturnVacant!0 (x!127955 lt!624511) (index!46358 lt!624511) (index!46358 lt!624511) (select (arr!46654 a!2901) j!112) lt!624506 mask!2840))))

(declare-fun lt!624512 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96645 (_ BitVec 32)) SeekEntryResult!10991)

(assert (=> b!1416060 (= lt!624505 (seekEntryOrOpen!0 lt!624512 lt!624506 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416060 (and (not (undefined!11803 lt!624511)) (= (index!46358 lt!624511) i!1037) (bvslt (x!127955 lt!624511) (x!127955 lt!624507)) (= (select (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46358 lt!624511)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47799 0))(
  ( (Unit!47800) )
))
(declare-fun lt!624510 () Unit!47799)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47799)

(assert (=> b!1416060 (= lt!624510 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624509 (x!127955 lt!624507) (index!46358 lt!624507) (x!127955 lt!624511) (index!46358 lt!624511) (undefined!11803 lt!624511) mask!2840))))

(declare-fun b!1416061 () Bool)

(declare-fun res!952153 () Bool)

(assert (=> b!1416061 (=> res!952153 e!801471)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96645 (_ BitVec 32)) SeekEntryResult!10991)

(assert (=> b!1416061 (= res!952153 (not (= lt!624511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624509 lt!624512 lt!624506 mask!2840))))))

(declare-fun b!1416062 () Bool)

(declare-fun res!952158 () Bool)

(declare-fun e!801472 () Bool)

(assert (=> b!1416062 (=> (not res!952158) (not e!801472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416062 (= res!952158 (validKeyInArray!0 (select (arr!46654 a!2901) i!1037)))))

(declare-fun res!952155 () Bool)

(assert (=> start!122006 (=> (not res!952155) (not e!801472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122006 (= res!952155 (validMask!0 mask!2840))))

(assert (=> start!122006 e!801472))

(assert (=> start!122006 true))

(declare-fun array_inv!35887 (array!96645) Bool)

(assert (=> start!122006 (array_inv!35887 a!2901)))

(declare-fun b!1416063 () Bool)

(declare-fun e!801470 () Bool)

(assert (=> b!1416063 (= e!801472 (not e!801470))))

(declare-fun res!952159 () Bool)

(assert (=> b!1416063 (=> res!952159 e!801470)))

(get-info :version)

(assert (=> b!1416063 (= res!952159 (or (not ((_ is Intermediate!10991) lt!624507)) (undefined!11803 lt!624507)))))

(declare-fun lt!624503 () SeekEntryResult!10991)

(assert (=> b!1416063 (= lt!624503 (Found!10991 j!112))))

(assert (=> b!1416063 (= lt!624503 (seekEntryOrOpen!0 (select (arr!46654 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96645 (_ BitVec 32)) Bool)

(assert (=> b!1416063 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624504 () Unit!47799)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47799)

(assert (=> b!1416063 (= lt!624504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1416063 (= lt!624507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624509 (select (arr!46654 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416063 (= lt!624509 (toIndex!0 (select (arr!46654 a!2901) j!112) mask!2840))))

(declare-fun b!1416064 () Bool)

(declare-fun res!952156 () Bool)

(assert (=> b!1416064 (=> (not res!952156) (not e!801472))))

(assert (=> b!1416064 (= res!952156 (and (= (size!47206 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47206 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47206 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416065 () Bool)

(assert (=> b!1416065 (= e!801471 true)))

(assert (=> b!1416065 (= lt!624503 lt!624505)))

(declare-fun lt!624508 () Unit!47799)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47799)

(assert (=> b!1416065 (= lt!624508 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624509 (x!127955 lt!624507) (index!46358 lt!624507) (x!127955 lt!624511) (index!46358 lt!624511) mask!2840))))

(declare-fun b!1416066 () Bool)

(declare-fun res!952157 () Bool)

(assert (=> b!1416066 (=> (not res!952157) (not e!801472))))

(assert (=> b!1416066 (= res!952157 (validKeyInArray!0 (select (arr!46654 a!2901) j!112)))))

(declare-fun b!1416067 () Bool)

(declare-fun res!952161 () Bool)

(assert (=> b!1416067 (=> (not res!952161) (not e!801472))))

(assert (=> b!1416067 (= res!952161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416068 () Bool)

(assert (=> b!1416068 (= e!801470 e!801473)))

(declare-fun res!952162 () Bool)

(assert (=> b!1416068 (=> res!952162 e!801473)))

(assert (=> b!1416068 (= res!952162 (or (= lt!624507 lt!624511) (not ((_ is Intermediate!10991) lt!624511))))))

(assert (=> b!1416068 (= lt!624511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624512 mask!2840) lt!624512 lt!624506 mask!2840))))

(assert (=> b!1416068 (= lt!624512 (select (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416068 (= lt!624506 (array!96646 (store (arr!46654 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47206 a!2901)))))

(declare-fun b!1416069 () Bool)

(declare-fun res!952160 () Bool)

(assert (=> b!1416069 (=> (not res!952160) (not e!801472))))

(declare-datatypes ((List!33251 0))(
  ( (Nil!33248) (Cons!33247 (h!34534 (_ BitVec 64)) (t!47937 List!33251)) )
))
(declare-fun arrayNoDuplicates!0 (array!96645 (_ BitVec 32) List!33251) Bool)

(assert (=> b!1416069 (= res!952160 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33248))))

(assert (= (and start!122006 res!952155) b!1416064))

(assert (= (and b!1416064 res!952156) b!1416062))

(assert (= (and b!1416062 res!952158) b!1416066))

(assert (= (and b!1416066 res!952157) b!1416067))

(assert (= (and b!1416067 res!952161) b!1416069))

(assert (= (and b!1416069 res!952160) b!1416063))

(assert (= (and b!1416063 (not res!952159)) b!1416068))

(assert (= (and b!1416068 (not res!952162)) b!1416060))

(assert (= (and b!1416060 (not res!952154)) b!1416061))

(assert (= (and b!1416061 (not res!952153)) b!1416065))

(declare-fun m!1306171 () Bool)

(assert (=> b!1416060 m!1306171))

(declare-fun m!1306173 () Bool)

(assert (=> b!1416060 m!1306173))

(declare-fun m!1306175 () Bool)

(assert (=> b!1416060 m!1306175))

(declare-fun m!1306177 () Bool)

(assert (=> b!1416060 m!1306177))

(assert (=> b!1416060 m!1306175))

(declare-fun m!1306179 () Bool)

(assert (=> b!1416060 m!1306179))

(declare-fun m!1306181 () Bool)

(assert (=> b!1416060 m!1306181))

(declare-fun m!1306183 () Bool)

(assert (=> b!1416069 m!1306183))

(assert (=> b!1416066 m!1306175))

(assert (=> b!1416066 m!1306175))

(declare-fun m!1306185 () Bool)

(assert (=> b!1416066 m!1306185))

(declare-fun m!1306187 () Bool)

(assert (=> b!1416065 m!1306187))

(declare-fun m!1306189 () Bool)

(assert (=> start!122006 m!1306189))

(declare-fun m!1306191 () Bool)

(assert (=> start!122006 m!1306191))

(assert (=> b!1416063 m!1306175))

(declare-fun m!1306193 () Bool)

(assert (=> b!1416063 m!1306193))

(assert (=> b!1416063 m!1306175))

(declare-fun m!1306195 () Bool)

(assert (=> b!1416063 m!1306195))

(assert (=> b!1416063 m!1306175))

(declare-fun m!1306197 () Bool)

(assert (=> b!1416063 m!1306197))

(assert (=> b!1416063 m!1306175))

(declare-fun m!1306199 () Bool)

(assert (=> b!1416063 m!1306199))

(declare-fun m!1306201 () Bool)

(assert (=> b!1416063 m!1306201))

(declare-fun m!1306203 () Bool)

(assert (=> b!1416068 m!1306203))

(assert (=> b!1416068 m!1306203))

(declare-fun m!1306205 () Bool)

(assert (=> b!1416068 m!1306205))

(assert (=> b!1416068 m!1306177))

(declare-fun m!1306207 () Bool)

(assert (=> b!1416068 m!1306207))

(declare-fun m!1306209 () Bool)

(assert (=> b!1416062 m!1306209))

(assert (=> b!1416062 m!1306209))

(declare-fun m!1306211 () Bool)

(assert (=> b!1416062 m!1306211))

(declare-fun m!1306213 () Bool)

(assert (=> b!1416061 m!1306213))

(declare-fun m!1306215 () Bool)

(assert (=> b!1416067 m!1306215))

(check-sat (not b!1416061) (not start!122006) (not b!1416068) (not b!1416069) (not b!1416066) (not b!1416060) (not b!1416067) (not b!1416063) (not b!1416062) (not b!1416065))
(check-sat)
