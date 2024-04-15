; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121112 () Bool)

(assert start!121112)

(declare-fun b!1408141 () Bool)

(declare-fun e!796956 () Bool)

(declare-fun e!796958 () Bool)

(assert (=> b!1408141 (= e!796956 e!796958)))

(declare-fun res!945916 () Bool)

(assert (=> b!1408141 (=> res!945916 e!796958)))

(declare-fun lt!620023 () (_ BitVec 64))

(declare-datatypes ((array!96219 0))(
  ( (array!96220 (arr!46453 (Array (_ BitVec 32) (_ BitVec 64))) (size!47005 (_ BitVec 32))) )
))
(declare-fun lt!620024 () array!96219)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10790 0))(
  ( (MissingZero!10790 (index!45537 (_ BitVec 32))) (Found!10790 (index!45538 (_ BitVec 32))) (Intermediate!10790 (undefined!11602 Bool) (index!45539 (_ BitVec 32)) (x!127140 (_ BitVec 32))) (Undefined!10790) (MissingVacant!10790 (index!45540 (_ BitVec 32))) )
))
(declare-fun lt!620019 () SeekEntryResult!10790)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96219 (_ BitVec 32)) SeekEntryResult!10790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408141 (= res!945916 (not (= lt!620019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620023 mask!2840) lt!620023 lt!620024 mask!2840))))))

(declare-fun a!2901 () array!96219)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1408141 (= lt!620023 (select (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1408141 (= lt!620024 (array!96220 (store (arr!46453 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47005 a!2901)))))

(declare-fun b!1408142 () Bool)

(declare-fun res!945921 () Bool)

(declare-fun e!796955 () Bool)

(assert (=> b!1408142 (=> (not res!945921) (not e!796955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408142 (= res!945921 (validKeyInArray!0 (select (arr!46453 a!2901) i!1037)))))

(declare-fun b!1408143 () Bool)

(declare-fun res!945919 () Bool)

(assert (=> b!1408143 (=> (not res!945919) (not e!796955))))

(assert (=> b!1408143 (= res!945919 (and (= (size!47005 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47005 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47005 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408144 () Bool)

(declare-fun res!945918 () Bool)

(assert (=> b!1408144 (=> res!945918 e!796958)))

(declare-fun lt!620022 () (_ BitVec 32))

(assert (=> b!1408144 (= res!945918 (or (bvslt (x!127140 lt!620019) #b00000000000000000000000000000000) (bvsgt (x!127140 lt!620019) #b01111111111111111111111111111110) (bvslt lt!620022 #b00000000000000000000000000000000) (bvsge lt!620022 (size!47005 a!2901)) (bvslt (index!45539 lt!620019) #b00000000000000000000000000000000) (bvsge (index!45539 lt!620019) (size!47005 a!2901)) (not (= lt!620019 (Intermediate!10790 false (index!45539 lt!620019) (x!127140 lt!620019))))))))

(declare-fun b!1408145 () Bool)

(declare-fun res!945917 () Bool)

(assert (=> b!1408145 (=> (not res!945917) (not e!796955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96219 (_ BitVec 32)) Bool)

(assert (=> b!1408145 (= res!945917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408147 () Bool)

(declare-fun res!945922 () Bool)

(assert (=> b!1408147 (=> (not res!945922) (not e!796955))))

(declare-datatypes ((List!33050 0))(
  ( (Nil!33047) (Cons!33046 (h!34309 (_ BitVec 64)) (t!47736 List!33050)) )
))
(declare-fun arrayNoDuplicates!0 (array!96219 (_ BitVec 32) List!33050) Bool)

(assert (=> b!1408147 (= res!945922 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33047))))

(declare-fun b!1408148 () Bool)

(assert (=> b!1408148 (= e!796955 (not e!796956))))

(declare-fun res!945914 () Bool)

(assert (=> b!1408148 (=> res!945914 e!796956)))

(get-info :version)

(assert (=> b!1408148 (= res!945914 (or (not ((_ is Intermediate!10790) lt!620019)) (undefined!11602 lt!620019)))))

(declare-fun lt!620018 () SeekEntryResult!10790)

(assert (=> b!1408148 (= lt!620018 (Found!10790 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96219 (_ BitVec 32)) SeekEntryResult!10790)

(assert (=> b!1408148 (= lt!620018 (seekEntryOrOpen!0 (select (arr!46453 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408148 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47397 0))(
  ( (Unit!47398) )
))
(declare-fun lt!620020 () Unit!47397)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47397)

(assert (=> b!1408148 (= lt!620020 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1408148 (= lt!620019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620022 (select (arr!46453 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1408148 (= lt!620022 (toIndex!0 (select (arr!46453 a!2901) j!112) mask!2840))))

(declare-fun b!1408149 () Bool)

(declare-fun res!945920 () Bool)

(assert (=> b!1408149 (=> (not res!945920) (not e!796955))))

(assert (=> b!1408149 (= res!945920 (validKeyInArray!0 (select (arr!46453 a!2901) j!112)))))

(declare-fun res!945915 () Bool)

(assert (=> start!121112 (=> (not res!945915) (not e!796955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121112 (= res!945915 (validMask!0 mask!2840))))

(assert (=> start!121112 e!796955))

(assert (=> start!121112 true))

(declare-fun array_inv!35686 (array!96219) Bool)

(assert (=> start!121112 (array_inv!35686 a!2901)))

(declare-fun b!1408146 () Bool)

(assert (=> b!1408146 (= e!796958 true)))

(assert (=> b!1408146 (= lt!620018 (seekEntryOrOpen!0 lt!620023 lt!620024 mask!2840))))

(declare-fun lt!620021 () Unit!47397)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96219 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47397)

(assert (=> b!1408146 (= lt!620021 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620022 (x!127140 lt!620019) (index!45539 lt!620019) mask!2840))))

(assert (= (and start!121112 res!945915) b!1408143))

(assert (= (and b!1408143 res!945919) b!1408142))

(assert (= (and b!1408142 res!945921) b!1408149))

(assert (= (and b!1408149 res!945920) b!1408145))

(assert (= (and b!1408145 res!945917) b!1408147))

(assert (= (and b!1408147 res!945922) b!1408148))

(assert (= (and b!1408148 (not res!945914)) b!1408141))

(assert (= (and b!1408141 (not res!945916)) b!1408144))

(assert (= (and b!1408144 (not res!945918)) b!1408146))

(declare-fun m!1296895 () Bool)

(assert (=> b!1408146 m!1296895))

(declare-fun m!1296897 () Bool)

(assert (=> b!1408146 m!1296897))

(declare-fun m!1296899 () Bool)

(assert (=> b!1408148 m!1296899))

(declare-fun m!1296901 () Bool)

(assert (=> b!1408148 m!1296901))

(assert (=> b!1408148 m!1296899))

(declare-fun m!1296903 () Bool)

(assert (=> b!1408148 m!1296903))

(assert (=> b!1408148 m!1296899))

(declare-fun m!1296905 () Bool)

(assert (=> b!1408148 m!1296905))

(assert (=> b!1408148 m!1296899))

(declare-fun m!1296907 () Bool)

(assert (=> b!1408148 m!1296907))

(declare-fun m!1296909 () Bool)

(assert (=> b!1408148 m!1296909))

(declare-fun m!1296911 () Bool)

(assert (=> b!1408141 m!1296911))

(assert (=> b!1408141 m!1296911))

(declare-fun m!1296913 () Bool)

(assert (=> b!1408141 m!1296913))

(declare-fun m!1296915 () Bool)

(assert (=> b!1408141 m!1296915))

(declare-fun m!1296917 () Bool)

(assert (=> b!1408141 m!1296917))

(assert (=> b!1408149 m!1296899))

(assert (=> b!1408149 m!1296899))

(declare-fun m!1296919 () Bool)

(assert (=> b!1408149 m!1296919))

(declare-fun m!1296921 () Bool)

(assert (=> b!1408145 m!1296921))

(declare-fun m!1296923 () Bool)

(assert (=> start!121112 m!1296923))

(declare-fun m!1296925 () Bool)

(assert (=> start!121112 m!1296925))

(declare-fun m!1296927 () Bool)

(assert (=> b!1408147 m!1296927))

(declare-fun m!1296929 () Bool)

(assert (=> b!1408142 m!1296929))

(assert (=> b!1408142 m!1296929))

(declare-fun m!1296931 () Bool)

(assert (=> b!1408142 m!1296931))

(check-sat (not b!1408147) (not b!1408142) (not b!1408145) (not start!121112) (not b!1408148) (not b!1408146) (not b!1408149) (not b!1408141))
(check-sat)
