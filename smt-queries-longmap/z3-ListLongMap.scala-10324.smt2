; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121430 () Bool)

(assert start!121430)

(declare-fun b!1410827 () Bool)

(declare-fun res!948057 () Bool)

(declare-fun e!798386 () Bool)

(assert (=> b!1410827 (=> (not res!948057) (not e!798386))))

(declare-datatypes ((array!96431 0))(
  ( (array!96432 (arr!46554 (Array (_ BitVec 32) (_ BitVec 64))) (size!47104 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96431)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410827 (= res!948057 (validKeyInArray!0 (select (arr!46554 a!2901) i!1037)))))

(declare-fun b!1410828 () Bool)

(declare-fun res!948055 () Bool)

(assert (=> b!1410828 (=> (not res!948055) (not e!798386))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1410828 (= res!948055 (and (= (size!47104 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47104 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47104 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!948056 () Bool)

(assert (=> start!121430 (=> (not res!948056) (not e!798386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121430 (= res!948056 (validMask!0 mask!2840))))

(assert (=> start!121430 e!798386))

(assert (=> start!121430 true))

(declare-fun array_inv!35582 (array!96431) Bool)

(assert (=> start!121430 (array_inv!35582 a!2901)))

(declare-fun b!1410829 () Bool)

(declare-fun res!948054 () Bool)

(assert (=> b!1410829 (=> (not res!948054) (not e!798386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96431 (_ BitVec 32)) Bool)

(assert (=> b!1410829 (= res!948054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410830 () Bool)

(declare-fun e!798384 () Bool)

(declare-datatypes ((SeekEntryResult!10865 0))(
  ( (MissingZero!10865 (index!45837 (_ BitVec 32))) (Found!10865 (index!45838 (_ BitVec 32))) (Intermediate!10865 (undefined!11677 Bool) (index!45839 (_ BitVec 32)) (x!127436 (_ BitVec 32))) (Undefined!10865) (MissingVacant!10865 (index!45840 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96431 (_ BitVec 32)) SeekEntryResult!10865)

(assert (=> b!1410830 (= e!798384 (= (seekEntryOrOpen!0 (select (arr!46554 a!2901) j!112) a!2901 mask!2840) (Found!10865 j!112)))))

(declare-fun b!1410831 () Bool)

(declare-fun res!948061 () Bool)

(assert (=> b!1410831 (=> (not res!948061) (not e!798386))))

(assert (=> b!1410831 (= res!948061 (validKeyInArray!0 (select (arr!46554 a!2901) j!112)))))

(declare-fun b!1410832 () Bool)

(declare-fun e!798385 () Bool)

(assert (=> b!1410832 (= e!798386 (not e!798385))))

(declare-fun res!948060 () Bool)

(assert (=> b!1410832 (=> res!948060 e!798385)))

(declare-fun lt!621353 () SeekEntryResult!10865)

(get-info :version)

(assert (=> b!1410832 (= res!948060 (or (not ((_ is Intermediate!10865) lt!621353)) (undefined!11677 lt!621353)))))

(assert (=> b!1410832 e!798384))

(declare-fun res!948058 () Bool)

(assert (=> b!1410832 (=> (not res!948058) (not e!798384))))

(assert (=> b!1410832 (= res!948058 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47704 0))(
  ( (Unit!47705) )
))
(declare-fun lt!621354 () Unit!47704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47704)

(assert (=> b!1410832 (= lt!621354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96431 (_ BitVec 32)) SeekEntryResult!10865)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410832 (= lt!621353 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46554 a!2901) j!112) mask!2840) (select (arr!46554 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410833 () Bool)

(declare-fun res!948059 () Bool)

(assert (=> b!1410833 (=> (not res!948059) (not e!798386))))

(declare-datatypes ((List!33073 0))(
  ( (Nil!33070) (Cons!33069 (h!34341 (_ BitVec 64)) (t!47767 List!33073)) )
))
(declare-fun arrayNoDuplicates!0 (array!96431 (_ BitVec 32) List!33073) Bool)

(assert (=> b!1410833 (= res!948059 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33070))))

(declare-fun b!1410834 () Bool)

(assert (=> b!1410834 (= e!798385 true)))

(declare-fun lt!621352 () SeekEntryResult!10865)

(assert (=> b!1410834 (= lt!621352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46554 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46554 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96432 (store (arr!46554 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47104 a!2901)) mask!2840))))

(assert (= (and start!121430 res!948056) b!1410828))

(assert (= (and b!1410828 res!948055) b!1410827))

(assert (= (and b!1410827 res!948057) b!1410831))

(assert (= (and b!1410831 res!948061) b!1410829))

(assert (= (and b!1410829 res!948054) b!1410833))

(assert (= (and b!1410833 res!948059) b!1410832))

(assert (= (and b!1410832 res!948058) b!1410830))

(assert (= (and b!1410832 (not res!948060)) b!1410834))

(declare-fun m!1300501 () Bool)

(assert (=> b!1410829 m!1300501))

(declare-fun m!1300503 () Bool)

(assert (=> b!1410834 m!1300503))

(declare-fun m!1300505 () Bool)

(assert (=> b!1410834 m!1300505))

(assert (=> b!1410834 m!1300505))

(declare-fun m!1300507 () Bool)

(assert (=> b!1410834 m!1300507))

(assert (=> b!1410834 m!1300507))

(assert (=> b!1410834 m!1300505))

(declare-fun m!1300509 () Bool)

(assert (=> b!1410834 m!1300509))

(declare-fun m!1300511 () Bool)

(assert (=> b!1410831 m!1300511))

(assert (=> b!1410831 m!1300511))

(declare-fun m!1300513 () Bool)

(assert (=> b!1410831 m!1300513))

(declare-fun m!1300515 () Bool)

(assert (=> b!1410827 m!1300515))

(assert (=> b!1410827 m!1300515))

(declare-fun m!1300517 () Bool)

(assert (=> b!1410827 m!1300517))

(assert (=> b!1410832 m!1300511))

(declare-fun m!1300519 () Bool)

(assert (=> b!1410832 m!1300519))

(assert (=> b!1410832 m!1300511))

(declare-fun m!1300521 () Bool)

(assert (=> b!1410832 m!1300521))

(assert (=> b!1410832 m!1300519))

(assert (=> b!1410832 m!1300511))

(declare-fun m!1300523 () Bool)

(assert (=> b!1410832 m!1300523))

(declare-fun m!1300525 () Bool)

(assert (=> b!1410832 m!1300525))

(declare-fun m!1300527 () Bool)

(assert (=> b!1410833 m!1300527))

(declare-fun m!1300529 () Bool)

(assert (=> start!121430 m!1300529))

(declare-fun m!1300531 () Bool)

(assert (=> start!121430 m!1300531))

(assert (=> b!1410830 m!1300511))

(assert (=> b!1410830 m!1300511))

(declare-fun m!1300533 () Bool)

(assert (=> b!1410830 m!1300533))

(check-sat (not b!1410830) (not b!1410833) (not b!1410831) (not b!1410832) (not start!121430) (not b!1410829) (not b!1410827) (not b!1410834))
