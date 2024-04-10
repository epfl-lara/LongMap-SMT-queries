; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121480 () Bool)

(assert start!121480)

(declare-fun b!1411525 () Bool)

(declare-fun res!948759 () Bool)

(declare-fun e!798776 () Bool)

(assert (=> b!1411525 (=> (not res!948759) (not e!798776))))

(declare-datatypes ((array!96481 0))(
  ( (array!96482 (arr!46579 (Array (_ BitVec 32) (_ BitVec 64))) (size!47129 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96481)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411525 (= res!948759 (validKeyInArray!0 (select (arr!46579 a!2901) i!1037)))))

(declare-fun b!1411526 () Bool)

(declare-fun e!798773 () Bool)

(assert (=> b!1411526 (= e!798776 (not e!798773))))

(declare-fun res!948754 () Bool)

(assert (=> b!1411526 (=> res!948754 e!798773)))

(declare-datatypes ((SeekEntryResult!10890 0))(
  ( (MissingZero!10890 (index!45937 (_ BitVec 32))) (Found!10890 (index!45938 (_ BitVec 32))) (Intermediate!10890 (undefined!11702 Bool) (index!45939 (_ BitVec 32)) (x!127525 (_ BitVec 32))) (Undefined!10890) (MissingVacant!10890 (index!45940 (_ BitVec 32))) )
))
(declare-fun lt!621775 () SeekEntryResult!10890)

(assert (=> b!1411526 (= res!948754 (or (not (is-Intermediate!10890 lt!621775)) (undefined!11702 lt!621775)))))

(declare-fun e!798775 () Bool)

(assert (=> b!1411526 e!798775))

(declare-fun res!948752 () Bool)

(assert (=> b!1411526 (=> (not res!948752) (not e!798775))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96481 (_ BitVec 32)) Bool)

(assert (=> b!1411526 (= res!948752 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47754 0))(
  ( (Unit!47755) )
))
(declare-fun lt!621774 () Unit!47754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47754)

(assert (=> b!1411526 (= lt!621774 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621773 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96481 (_ BitVec 32)) SeekEntryResult!10890)

(assert (=> b!1411526 (= lt!621775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621773 (select (arr!46579 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411526 (= lt!621773 (toIndex!0 (select (arr!46579 a!2901) j!112) mask!2840))))

(declare-fun b!1411527 () Bool)

(declare-fun e!798774 () Bool)

(assert (=> b!1411527 (= e!798773 e!798774)))

(declare-fun res!948760 () Bool)

(assert (=> b!1411527 (=> res!948760 e!798774)))

(declare-fun lt!621777 () SeekEntryResult!10890)

(assert (=> b!1411527 (= res!948760 (or (= lt!621775 lt!621777) (not (is-Intermediate!10890 lt!621777))))))

(declare-fun lt!621776 () (_ BitVec 64))

(assert (=> b!1411527 (= lt!621777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621776 mask!2840) lt!621776 (array!96482 (store (arr!46579 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47129 a!2901)) mask!2840))))

(assert (=> b!1411527 (= lt!621776 (select (store (arr!46579 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411528 () Bool)

(declare-fun res!948758 () Bool)

(assert (=> b!1411528 (=> (not res!948758) (not e!798776))))

(assert (=> b!1411528 (= res!948758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411529 () Bool)

(declare-fun res!948755 () Bool)

(assert (=> b!1411529 (=> (not res!948755) (not e!798776))))

(declare-datatypes ((List!33098 0))(
  ( (Nil!33095) (Cons!33094 (h!34366 (_ BitVec 64)) (t!47792 List!33098)) )
))
(declare-fun arrayNoDuplicates!0 (array!96481 (_ BitVec 32) List!33098) Bool)

(assert (=> b!1411529 (= res!948755 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33095))))

(declare-fun b!1411530 () Bool)

(assert (=> b!1411530 (= e!798774 true)))

(assert (=> b!1411530 (and (not (undefined!11702 lt!621777)) (= (index!45939 lt!621777) i!1037) (bvslt (x!127525 lt!621777) (x!127525 lt!621775)) (= (select (store (arr!46579 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45939 lt!621777)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!621772 () Unit!47754)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47754)

(assert (=> b!1411530 (= lt!621772 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621773 (x!127525 lt!621775) (index!45939 lt!621775) (x!127525 lt!621777) (index!45939 lt!621777) (undefined!11702 lt!621777) mask!2840))))

(declare-fun b!1411531 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96481 (_ BitVec 32)) SeekEntryResult!10890)

(assert (=> b!1411531 (= e!798775 (= (seekEntryOrOpen!0 (select (arr!46579 a!2901) j!112) a!2901 mask!2840) (Found!10890 j!112)))))

(declare-fun res!948753 () Bool)

(assert (=> start!121480 (=> (not res!948753) (not e!798776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121480 (= res!948753 (validMask!0 mask!2840))))

(assert (=> start!121480 e!798776))

(assert (=> start!121480 true))

(declare-fun array_inv!35607 (array!96481) Bool)

(assert (=> start!121480 (array_inv!35607 a!2901)))

(declare-fun b!1411532 () Bool)

(declare-fun res!948756 () Bool)

(assert (=> b!1411532 (=> (not res!948756) (not e!798776))))

(assert (=> b!1411532 (= res!948756 (validKeyInArray!0 (select (arr!46579 a!2901) j!112)))))

(declare-fun b!1411533 () Bool)

(declare-fun res!948757 () Bool)

(assert (=> b!1411533 (=> (not res!948757) (not e!798776))))

(assert (=> b!1411533 (= res!948757 (and (= (size!47129 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47129 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47129 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121480 res!948753) b!1411533))

(assert (= (and b!1411533 res!948757) b!1411525))

(assert (= (and b!1411525 res!948759) b!1411532))

(assert (= (and b!1411532 res!948756) b!1411528))

(assert (= (and b!1411528 res!948758) b!1411529))

(assert (= (and b!1411529 res!948755) b!1411526))

(assert (= (and b!1411526 res!948752) b!1411531))

(assert (= (and b!1411526 (not res!948754)) b!1411527))

(assert (= (and b!1411527 (not res!948760)) b!1411530))

(declare-fun m!1301407 () Bool)

(assert (=> b!1411532 m!1301407))

(assert (=> b!1411532 m!1301407))

(declare-fun m!1301409 () Bool)

(assert (=> b!1411532 m!1301409))

(declare-fun m!1301411 () Bool)

(assert (=> b!1411525 m!1301411))

(assert (=> b!1411525 m!1301411))

(declare-fun m!1301413 () Bool)

(assert (=> b!1411525 m!1301413))

(declare-fun m!1301415 () Bool)

(assert (=> b!1411529 m!1301415))

(declare-fun m!1301417 () Bool)

(assert (=> b!1411528 m!1301417))

(assert (=> b!1411526 m!1301407))

(declare-fun m!1301419 () Bool)

(assert (=> b!1411526 m!1301419))

(assert (=> b!1411526 m!1301407))

(assert (=> b!1411526 m!1301407))

(declare-fun m!1301421 () Bool)

(assert (=> b!1411526 m!1301421))

(declare-fun m!1301423 () Bool)

(assert (=> b!1411526 m!1301423))

(declare-fun m!1301425 () Bool)

(assert (=> b!1411526 m!1301425))

(declare-fun m!1301427 () Bool)

(assert (=> b!1411527 m!1301427))

(declare-fun m!1301429 () Bool)

(assert (=> b!1411527 m!1301429))

(assert (=> b!1411527 m!1301427))

(declare-fun m!1301431 () Bool)

(assert (=> b!1411527 m!1301431))

(declare-fun m!1301433 () Bool)

(assert (=> b!1411527 m!1301433))

(assert (=> b!1411530 m!1301429))

(declare-fun m!1301435 () Bool)

(assert (=> b!1411530 m!1301435))

(declare-fun m!1301437 () Bool)

(assert (=> b!1411530 m!1301437))

(assert (=> b!1411531 m!1301407))

(assert (=> b!1411531 m!1301407))

(declare-fun m!1301439 () Bool)

(assert (=> b!1411531 m!1301439))

(declare-fun m!1301441 () Bool)

(assert (=> start!121480 m!1301441))

(declare-fun m!1301443 () Bool)

(assert (=> start!121480 m!1301443))

(push 1)

