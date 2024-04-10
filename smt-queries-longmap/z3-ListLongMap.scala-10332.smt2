; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121478 () Bool)

(assert start!121478)

(declare-fun b!1411498 () Bool)

(declare-fun e!798758 () Bool)

(assert (=> b!1411498 (= e!798758 true)))

(declare-datatypes ((array!96479 0))(
  ( (array!96480 (arr!46578 (Array (_ BitVec 32) (_ BitVec 64))) (size!47128 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96479)

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10889 0))(
  ( (MissingZero!10889 (index!45933 (_ BitVec 32))) (Found!10889 (index!45934 (_ BitVec 32))) (Intermediate!10889 (undefined!11701 Bool) (index!45935 (_ BitVec 32)) (x!127524 (_ BitVec 32))) (Undefined!10889) (MissingVacant!10889 (index!45936 (_ BitVec 32))) )
))
(declare-fun lt!621755 () SeekEntryResult!10889)

(declare-fun lt!621758 () SeekEntryResult!10889)

(assert (=> b!1411498 (and (not (undefined!11701 lt!621758)) (= (index!45935 lt!621758) i!1037) (bvslt (x!127524 lt!621758) (x!127524 lt!621755)) (= (select (store (arr!46578 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45935 lt!621758)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47752 0))(
  ( (Unit!47753) )
))
(declare-fun lt!621759 () Unit!47752)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!621754 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47752)

(assert (=> b!1411498 (= lt!621759 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621754 (x!127524 lt!621755) (index!45935 lt!621755) (x!127524 lt!621758) (index!45935 lt!621758) (undefined!11701 lt!621758) mask!2840))))

(declare-fun b!1411499 () Bool)

(declare-fun res!948733 () Bool)

(declare-fun e!798761 () Bool)

(assert (=> b!1411499 (=> (not res!948733) (not e!798761))))

(declare-datatypes ((List!33097 0))(
  ( (Nil!33094) (Cons!33093 (h!34365 (_ BitVec 64)) (t!47791 List!33097)) )
))
(declare-fun arrayNoDuplicates!0 (array!96479 (_ BitVec 32) List!33097) Bool)

(assert (=> b!1411499 (= res!948733 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33094))))

(declare-fun b!1411500 () Bool)

(declare-fun e!798757 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96479 (_ BitVec 32)) SeekEntryResult!10889)

(assert (=> b!1411500 (= e!798757 (= (seekEntryOrOpen!0 (select (arr!46578 a!2901) j!112) a!2901 mask!2840) (Found!10889 j!112)))))

(declare-fun b!1411501 () Bool)

(declare-fun res!948732 () Bool)

(assert (=> b!1411501 (=> (not res!948732) (not e!798761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411501 (= res!948732 (validKeyInArray!0 (select (arr!46578 a!2901) i!1037)))))

(declare-fun b!1411502 () Bool)

(declare-fun res!948730 () Bool)

(assert (=> b!1411502 (=> (not res!948730) (not e!798761))))

(assert (=> b!1411502 (= res!948730 (and (= (size!47128 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47128 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47128 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411503 () Bool)

(declare-fun res!948725 () Bool)

(assert (=> b!1411503 (=> (not res!948725) (not e!798761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96479 (_ BitVec 32)) Bool)

(assert (=> b!1411503 (= res!948725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411504 () Bool)

(declare-fun res!948726 () Bool)

(assert (=> b!1411504 (=> (not res!948726) (not e!798761))))

(assert (=> b!1411504 (= res!948726 (validKeyInArray!0 (select (arr!46578 a!2901) j!112)))))

(declare-fun res!948728 () Bool)

(assert (=> start!121478 (=> (not res!948728) (not e!798761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121478 (= res!948728 (validMask!0 mask!2840))))

(assert (=> start!121478 e!798761))

(assert (=> start!121478 true))

(declare-fun array_inv!35606 (array!96479) Bool)

(assert (=> start!121478 (array_inv!35606 a!2901)))

(declare-fun b!1411505 () Bool)

(declare-fun e!798760 () Bool)

(assert (=> b!1411505 (= e!798761 (not e!798760))))

(declare-fun res!948727 () Bool)

(assert (=> b!1411505 (=> res!948727 e!798760)))

(get-info :version)

(assert (=> b!1411505 (= res!948727 (or (not ((_ is Intermediate!10889) lt!621755)) (undefined!11701 lt!621755)))))

(assert (=> b!1411505 e!798757))

(declare-fun res!948729 () Bool)

(assert (=> b!1411505 (=> (not res!948729) (not e!798757))))

(assert (=> b!1411505 (= res!948729 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621757 () Unit!47752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47752)

(assert (=> b!1411505 (= lt!621757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96479 (_ BitVec 32)) SeekEntryResult!10889)

(assert (=> b!1411505 (= lt!621755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621754 (select (arr!46578 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411505 (= lt!621754 (toIndex!0 (select (arr!46578 a!2901) j!112) mask!2840))))

(declare-fun b!1411506 () Bool)

(assert (=> b!1411506 (= e!798760 e!798758)))

(declare-fun res!948731 () Bool)

(assert (=> b!1411506 (=> res!948731 e!798758)))

(assert (=> b!1411506 (= res!948731 (or (= lt!621755 lt!621758) (not ((_ is Intermediate!10889) lt!621758))))))

(declare-fun lt!621756 () (_ BitVec 64))

(assert (=> b!1411506 (= lt!621758 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621756 mask!2840) lt!621756 (array!96480 (store (arr!46578 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47128 a!2901)) mask!2840))))

(assert (=> b!1411506 (= lt!621756 (select (store (arr!46578 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!121478 res!948728) b!1411502))

(assert (= (and b!1411502 res!948730) b!1411501))

(assert (= (and b!1411501 res!948732) b!1411504))

(assert (= (and b!1411504 res!948726) b!1411503))

(assert (= (and b!1411503 res!948725) b!1411499))

(assert (= (and b!1411499 res!948733) b!1411505))

(assert (= (and b!1411505 res!948729) b!1411500))

(assert (= (and b!1411505 (not res!948727)) b!1411506))

(assert (= (and b!1411506 (not res!948731)) b!1411498))

(declare-fun m!1301369 () Bool)

(assert (=> b!1411504 m!1301369))

(assert (=> b!1411504 m!1301369))

(declare-fun m!1301371 () Bool)

(assert (=> b!1411504 m!1301371))

(assert (=> b!1411500 m!1301369))

(assert (=> b!1411500 m!1301369))

(declare-fun m!1301373 () Bool)

(assert (=> b!1411500 m!1301373))

(declare-fun m!1301375 () Bool)

(assert (=> b!1411503 m!1301375))

(declare-fun m!1301377 () Bool)

(assert (=> b!1411501 m!1301377))

(assert (=> b!1411501 m!1301377))

(declare-fun m!1301379 () Bool)

(assert (=> b!1411501 m!1301379))

(assert (=> b!1411505 m!1301369))

(declare-fun m!1301381 () Bool)

(assert (=> b!1411505 m!1301381))

(assert (=> b!1411505 m!1301369))

(declare-fun m!1301383 () Bool)

(assert (=> b!1411505 m!1301383))

(assert (=> b!1411505 m!1301369))

(declare-fun m!1301385 () Bool)

(assert (=> b!1411505 m!1301385))

(declare-fun m!1301387 () Bool)

(assert (=> b!1411505 m!1301387))

(declare-fun m!1301389 () Bool)

(assert (=> b!1411498 m!1301389))

(declare-fun m!1301391 () Bool)

(assert (=> b!1411498 m!1301391))

(declare-fun m!1301393 () Bool)

(assert (=> b!1411498 m!1301393))

(declare-fun m!1301395 () Bool)

(assert (=> b!1411506 m!1301395))

(assert (=> b!1411506 m!1301389))

(assert (=> b!1411506 m!1301395))

(declare-fun m!1301397 () Bool)

(assert (=> b!1411506 m!1301397))

(declare-fun m!1301399 () Bool)

(assert (=> b!1411506 m!1301399))

(declare-fun m!1301401 () Bool)

(assert (=> start!121478 m!1301401))

(declare-fun m!1301403 () Bool)

(assert (=> start!121478 m!1301403))

(declare-fun m!1301405 () Bool)

(assert (=> b!1411499 m!1301405))

(check-sat (not b!1411501) (not start!121478) (not b!1411504) (not b!1411499) (not b!1411506) (not b!1411505) (not b!1411503) (not b!1411498) (not b!1411500))
(check-sat)
