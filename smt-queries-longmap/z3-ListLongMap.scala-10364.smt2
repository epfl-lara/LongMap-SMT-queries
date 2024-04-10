; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122000 () Bool)

(assert start!122000)

(declare-fun res!952038 () Bool)

(declare-fun e!801434 () Bool)

(assert (=> start!122000 (=> (not res!952038) (not e!801434))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122000 (= res!952038 (validMask!0 mask!2840))))

(assert (=> start!122000 e!801434))

(assert (=> start!122000 true))

(declare-datatypes ((array!96686 0))(
  ( (array!96687 (arr!46674 (Array (_ BitVec 32) (_ BitVec 64))) (size!47224 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96686)

(declare-fun array_inv!35702 (array!96686) Bool)

(assert (=> start!122000 (array_inv!35702 a!2901)))

(declare-fun b!1415991 () Bool)

(declare-fun e!801433 () Bool)

(declare-fun e!801435 () Bool)

(assert (=> b!1415991 (= e!801433 e!801435)))

(declare-fun res!952035 () Bool)

(assert (=> b!1415991 (=> res!952035 e!801435)))

(declare-datatypes ((SeekEntryResult!10985 0))(
  ( (MissingZero!10985 (index!46332 (_ BitVec 32))) (Found!10985 (index!46333 (_ BitVec 32))) (Intermediate!10985 (undefined!11797 Bool) (index!46334 (_ BitVec 32)) (x!127936 (_ BitVec 32))) (Undefined!10985) (MissingVacant!10985 (index!46335 (_ BitVec 32))) )
))
(declare-fun lt!624547 () SeekEntryResult!10985)

(declare-fun lt!624543 () (_ BitVec 32))

(declare-fun lt!624549 () SeekEntryResult!10985)

(assert (=> b!1415991 (= res!952035 (or (bvslt (x!127936 lt!624547) #b00000000000000000000000000000000) (bvsgt (x!127936 lt!624547) #b01111111111111111111111111111110) (bvslt (x!127936 lt!624549) #b00000000000000000000000000000000) (bvsgt (x!127936 lt!624549) #b01111111111111111111111111111110) (bvslt lt!624543 #b00000000000000000000000000000000) (bvsge lt!624543 (size!47224 a!2901)) (bvslt (index!46334 lt!624547) #b00000000000000000000000000000000) (bvsge (index!46334 lt!624547) (size!47224 a!2901)) (bvslt (index!46334 lt!624549) #b00000000000000000000000000000000) (bvsge (index!46334 lt!624549) (size!47224 a!2901)) (not (= lt!624547 (Intermediate!10985 false (index!46334 lt!624547) (x!127936 lt!624547)))) (not (= lt!624549 (Intermediate!10985 false (index!46334 lt!624549) (x!127936 lt!624549))))))))

(declare-fun lt!624544 () array!96686)

(declare-fun lt!624548 () SeekEntryResult!10985)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96686 (_ BitVec 32)) SeekEntryResult!10985)

(assert (=> b!1415991 (= lt!624548 (seekKeyOrZeroReturnVacant!0 (x!127936 lt!624549) (index!46334 lt!624549) (index!46334 lt!624549) (select (arr!46674 a!2901) j!112) lt!624544 mask!2840))))

(declare-fun lt!624552 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96686 (_ BitVec 32)) SeekEntryResult!10985)

(assert (=> b!1415991 (= lt!624548 (seekEntryOrOpen!0 lt!624552 lt!624544 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415991 (and (not (undefined!11797 lt!624549)) (= (index!46334 lt!624549) i!1037) (bvslt (x!127936 lt!624549) (x!127936 lt!624547)) (= (select (store (arr!46674 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46334 lt!624549)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47944 0))(
  ( (Unit!47945) )
))
(declare-fun lt!624546 () Unit!47944)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47944)

(assert (=> b!1415991 (= lt!624546 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624543 (x!127936 lt!624547) (index!46334 lt!624547) (x!127936 lt!624549) (index!46334 lt!624549) (undefined!11797 lt!624549) mask!2840))))

(declare-fun b!1415992 () Bool)

(declare-fun res!952036 () Bool)

(assert (=> b!1415992 (=> (not res!952036) (not e!801434))))

(declare-datatypes ((List!33193 0))(
  ( (Nil!33190) (Cons!33189 (h!34476 (_ BitVec 64)) (t!47887 List!33193)) )
))
(declare-fun arrayNoDuplicates!0 (array!96686 (_ BitVec 32) List!33193) Bool)

(assert (=> b!1415992 (= res!952036 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33190))))

(declare-fun b!1415993 () Bool)

(declare-fun res!952042 () Bool)

(assert (=> b!1415993 (=> (not res!952042) (not e!801434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415993 (= res!952042 (validKeyInArray!0 (select (arr!46674 a!2901) j!112)))))

(declare-fun b!1415994 () Bool)

(declare-fun e!801436 () Bool)

(assert (=> b!1415994 (= e!801436 e!801433)))

(declare-fun res!952033 () Bool)

(assert (=> b!1415994 (=> res!952033 e!801433)))

(get-info :version)

(assert (=> b!1415994 (= res!952033 (or (= lt!624547 lt!624549) (not ((_ is Intermediate!10985) lt!624549))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96686 (_ BitVec 32)) SeekEntryResult!10985)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415994 (= lt!624549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624552 mask!2840) lt!624552 lt!624544 mask!2840))))

(assert (=> b!1415994 (= lt!624552 (select (store (arr!46674 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415994 (= lt!624544 (array!96687 (store (arr!46674 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47224 a!2901)))))

(declare-fun b!1415995 () Bool)

(declare-fun res!952040 () Bool)

(assert (=> b!1415995 (=> res!952040 e!801435)))

(assert (=> b!1415995 (= res!952040 (not (= lt!624549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624543 lt!624552 lt!624544 mask!2840))))))

(declare-fun b!1415996 () Bool)

(assert (=> b!1415996 (= e!801435 true)))

(declare-fun lt!624550 () SeekEntryResult!10985)

(assert (=> b!1415996 (= lt!624550 lt!624548)))

(declare-fun lt!624551 () Unit!47944)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47944)

(assert (=> b!1415996 (= lt!624551 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624543 (x!127936 lt!624547) (index!46334 lt!624547) (x!127936 lt!624549) (index!46334 lt!624549) mask!2840))))

(declare-fun b!1415997 () Bool)

(assert (=> b!1415997 (= e!801434 (not e!801436))))

(declare-fun res!952034 () Bool)

(assert (=> b!1415997 (=> res!952034 e!801436)))

(assert (=> b!1415997 (= res!952034 (or (not ((_ is Intermediate!10985) lt!624547)) (undefined!11797 lt!624547)))))

(assert (=> b!1415997 (= lt!624550 (Found!10985 j!112))))

(assert (=> b!1415997 (= lt!624550 (seekEntryOrOpen!0 (select (arr!46674 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96686 (_ BitVec 32)) Bool)

(assert (=> b!1415997 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624545 () Unit!47944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47944)

(assert (=> b!1415997 (= lt!624545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415997 (= lt!624547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624543 (select (arr!46674 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415997 (= lt!624543 (toIndex!0 (select (arr!46674 a!2901) j!112) mask!2840))))

(declare-fun b!1415998 () Bool)

(declare-fun res!952041 () Bool)

(assert (=> b!1415998 (=> (not res!952041) (not e!801434))))

(assert (=> b!1415998 (= res!952041 (validKeyInArray!0 (select (arr!46674 a!2901) i!1037)))))

(declare-fun b!1415999 () Bool)

(declare-fun res!952037 () Bool)

(assert (=> b!1415999 (=> (not res!952037) (not e!801434))))

(assert (=> b!1415999 (= res!952037 (and (= (size!47224 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47224 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47224 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416000 () Bool)

(declare-fun res!952039 () Bool)

(assert (=> b!1416000 (=> (not res!952039) (not e!801434))))

(assert (=> b!1416000 (= res!952039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122000 res!952038) b!1415999))

(assert (= (and b!1415999 res!952037) b!1415998))

(assert (= (and b!1415998 res!952041) b!1415993))

(assert (= (and b!1415993 res!952042) b!1416000))

(assert (= (and b!1416000 res!952039) b!1415992))

(assert (= (and b!1415992 res!952036) b!1415997))

(assert (= (and b!1415997 (not res!952034)) b!1415994))

(assert (= (and b!1415994 (not res!952033)) b!1415991))

(assert (= (and b!1415991 (not res!952035)) b!1415995))

(assert (= (and b!1415995 (not res!952040)) b!1415996))

(declare-fun m!1306477 () Bool)

(assert (=> b!1415995 m!1306477))

(declare-fun m!1306479 () Bool)

(assert (=> b!1415992 m!1306479))

(declare-fun m!1306481 () Bool)

(assert (=> b!1415993 m!1306481))

(assert (=> b!1415993 m!1306481))

(declare-fun m!1306483 () Bool)

(assert (=> b!1415993 m!1306483))

(assert (=> b!1415997 m!1306481))

(declare-fun m!1306485 () Bool)

(assert (=> b!1415997 m!1306485))

(assert (=> b!1415997 m!1306481))

(assert (=> b!1415997 m!1306481))

(declare-fun m!1306487 () Bool)

(assert (=> b!1415997 m!1306487))

(declare-fun m!1306489 () Bool)

(assert (=> b!1415997 m!1306489))

(assert (=> b!1415997 m!1306481))

(declare-fun m!1306491 () Bool)

(assert (=> b!1415997 m!1306491))

(declare-fun m!1306493 () Bool)

(assert (=> b!1415997 m!1306493))

(declare-fun m!1306495 () Bool)

(assert (=> b!1415991 m!1306495))

(assert (=> b!1415991 m!1306481))

(declare-fun m!1306497 () Bool)

(assert (=> b!1415991 m!1306497))

(declare-fun m!1306499 () Bool)

(assert (=> b!1415991 m!1306499))

(declare-fun m!1306501 () Bool)

(assert (=> b!1415991 m!1306501))

(assert (=> b!1415991 m!1306481))

(declare-fun m!1306503 () Bool)

(assert (=> b!1415991 m!1306503))

(declare-fun m!1306505 () Bool)

(assert (=> b!1416000 m!1306505))

(declare-fun m!1306507 () Bool)

(assert (=> b!1415998 m!1306507))

(assert (=> b!1415998 m!1306507))

(declare-fun m!1306509 () Bool)

(assert (=> b!1415998 m!1306509))

(declare-fun m!1306511 () Bool)

(assert (=> b!1415996 m!1306511))

(declare-fun m!1306513 () Bool)

(assert (=> start!122000 m!1306513))

(declare-fun m!1306515 () Bool)

(assert (=> start!122000 m!1306515))

(declare-fun m!1306517 () Bool)

(assert (=> b!1415994 m!1306517))

(assert (=> b!1415994 m!1306517))

(declare-fun m!1306519 () Bool)

(assert (=> b!1415994 m!1306519))

(assert (=> b!1415994 m!1306499))

(declare-fun m!1306521 () Bool)

(assert (=> b!1415994 m!1306521))

(check-sat (not b!1415997) (not b!1415994) (not b!1415995) (not b!1415998) (not b!1416000) (not b!1415996) (not b!1415991) (not b!1415993) (not start!122000) (not b!1415992))
(check-sat)
