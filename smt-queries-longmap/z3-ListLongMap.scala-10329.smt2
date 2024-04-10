; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121460 () Bool)

(assert start!121460)

(declare-fun b!1411256 () Bool)

(declare-fun res!948483 () Bool)

(declare-fun e!798622 () Bool)

(assert (=> b!1411256 (=> (not res!948483) (not e!798622))))

(declare-datatypes ((array!96461 0))(
  ( (array!96462 (arr!46569 (Array (_ BitVec 32) (_ BitVec 64))) (size!47119 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96461)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96461 (_ BitVec 32)) Bool)

(assert (=> b!1411256 (= res!948483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411257 () Bool)

(declare-fun res!948487 () Bool)

(assert (=> b!1411257 (=> (not res!948487) (not e!798622))))

(declare-datatypes ((List!33088 0))(
  ( (Nil!33085) (Cons!33084 (h!34356 (_ BitVec 64)) (t!47782 List!33088)) )
))
(declare-fun arrayNoDuplicates!0 (array!96461 (_ BitVec 32) List!33088) Bool)

(assert (=> b!1411257 (= res!948487 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33085))))

(declare-fun b!1411258 () Bool)

(declare-fun res!948489 () Bool)

(assert (=> b!1411258 (=> (not res!948489) (not e!798622))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411258 (= res!948489 (and (= (size!47119 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47119 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47119 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411259 () Bool)

(declare-fun res!948490 () Bool)

(assert (=> b!1411259 (=> (not res!948490) (not e!798622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411259 (= res!948490 (validKeyInArray!0 (select (arr!46569 a!2901) j!112)))))

(declare-fun e!798624 () Bool)

(declare-fun b!1411260 () Bool)

(declare-datatypes ((SeekEntryResult!10880 0))(
  ( (MissingZero!10880 (index!45897 (_ BitVec 32))) (Found!10880 (index!45898 (_ BitVec 32))) (Intermediate!10880 (undefined!11692 Bool) (index!45899 (_ BitVec 32)) (x!127491 (_ BitVec 32))) (Undefined!10880) (MissingVacant!10880 (index!45900 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96461 (_ BitVec 32)) SeekEntryResult!10880)

(assert (=> b!1411260 (= e!798624 (= (seekEntryOrOpen!0 (select (arr!46569 a!2901) j!112) a!2901 mask!2840) (Found!10880 j!112)))))

(declare-fun res!948484 () Bool)

(assert (=> start!121460 (=> (not res!948484) (not e!798622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121460 (= res!948484 (validMask!0 mask!2840))))

(assert (=> start!121460 e!798622))

(assert (=> start!121460 true))

(declare-fun array_inv!35597 (array!96461) Bool)

(assert (=> start!121460 (array_inv!35597 a!2901)))

(declare-fun b!1411255 () Bool)

(declare-fun e!798623 () Bool)

(assert (=> b!1411255 (= e!798623 true)))

(declare-fun lt!621607 () SeekEntryResult!10880)

(declare-fun lt!621608 () SeekEntryResult!10880)

(assert (=> b!1411255 (and (not (undefined!11692 lt!621607)) (= (index!45899 lt!621607) i!1037) (bvslt (x!127491 lt!621607) (x!127491 lt!621608)))))

(declare-datatypes ((Unit!47734 0))(
  ( (Unit!47735) )
))
(declare-fun lt!621609 () Unit!47734)

(declare-fun lt!621605 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47734)

(assert (=> b!1411255 (= lt!621609 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621605 (x!127491 lt!621608) (index!45899 lt!621608) (x!127491 lt!621607) (index!45899 lt!621607) (undefined!11692 lt!621607) mask!2840))))

(declare-fun b!1411261 () Bool)

(declare-fun e!798626 () Bool)

(assert (=> b!1411261 (= e!798626 e!798623)))

(declare-fun res!948488 () Bool)

(assert (=> b!1411261 (=> res!948488 e!798623)))

(get-info :version)

(assert (=> b!1411261 (= res!948488 (or (= lt!621608 lt!621607) (not ((_ is Intermediate!10880) lt!621607))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96461 (_ BitVec 32)) SeekEntryResult!10880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411261 (= lt!621607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46569 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46569 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96462 (store (arr!46569 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47119 a!2901)) mask!2840))))

(declare-fun b!1411262 () Bool)

(assert (=> b!1411262 (= e!798622 (not e!798626))))

(declare-fun res!948482 () Bool)

(assert (=> b!1411262 (=> res!948482 e!798626)))

(assert (=> b!1411262 (= res!948482 (or (not ((_ is Intermediate!10880) lt!621608)) (undefined!11692 lt!621608)))))

(assert (=> b!1411262 e!798624))

(declare-fun res!948485 () Bool)

(assert (=> b!1411262 (=> (not res!948485) (not e!798624))))

(assert (=> b!1411262 (= res!948485 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621606 () Unit!47734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47734)

(assert (=> b!1411262 (= lt!621606 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411262 (= lt!621608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621605 (select (arr!46569 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411262 (= lt!621605 (toIndex!0 (select (arr!46569 a!2901) j!112) mask!2840))))

(declare-fun b!1411263 () Bool)

(declare-fun res!948486 () Bool)

(assert (=> b!1411263 (=> (not res!948486) (not e!798622))))

(assert (=> b!1411263 (= res!948486 (validKeyInArray!0 (select (arr!46569 a!2901) i!1037)))))

(assert (= (and start!121460 res!948484) b!1411258))

(assert (= (and b!1411258 res!948489) b!1411263))

(assert (= (and b!1411263 res!948486) b!1411259))

(assert (= (and b!1411259 res!948490) b!1411256))

(assert (= (and b!1411256 res!948483) b!1411257))

(assert (= (and b!1411257 res!948487) b!1411262))

(assert (= (and b!1411262 res!948485) b!1411260))

(assert (= (and b!1411262 (not res!948482)) b!1411261))

(assert (= (and b!1411261 (not res!948488)) b!1411255))

(declare-fun m!1301037 () Bool)

(assert (=> b!1411260 m!1301037))

(assert (=> b!1411260 m!1301037))

(declare-fun m!1301039 () Bool)

(assert (=> b!1411260 m!1301039))

(declare-fun m!1301041 () Bool)

(assert (=> b!1411255 m!1301041))

(declare-fun m!1301043 () Bool)

(assert (=> start!121460 m!1301043))

(declare-fun m!1301045 () Bool)

(assert (=> start!121460 m!1301045))

(declare-fun m!1301047 () Bool)

(assert (=> b!1411257 m!1301047))

(declare-fun m!1301049 () Bool)

(assert (=> b!1411263 m!1301049))

(assert (=> b!1411263 m!1301049))

(declare-fun m!1301051 () Bool)

(assert (=> b!1411263 m!1301051))

(declare-fun m!1301053 () Bool)

(assert (=> b!1411261 m!1301053))

(declare-fun m!1301055 () Bool)

(assert (=> b!1411261 m!1301055))

(assert (=> b!1411261 m!1301055))

(declare-fun m!1301057 () Bool)

(assert (=> b!1411261 m!1301057))

(assert (=> b!1411261 m!1301057))

(assert (=> b!1411261 m!1301055))

(declare-fun m!1301059 () Bool)

(assert (=> b!1411261 m!1301059))

(assert (=> b!1411262 m!1301037))

(declare-fun m!1301061 () Bool)

(assert (=> b!1411262 m!1301061))

(assert (=> b!1411262 m!1301037))

(declare-fun m!1301063 () Bool)

(assert (=> b!1411262 m!1301063))

(assert (=> b!1411262 m!1301037))

(declare-fun m!1301065 () Bool)

(assert (=> b!1411262 m!1301065))

(declare-fun m!1301067 () Bool)

(assert (=> b!1411262 m!1301067))

(declare-fun m!1301069 () Bool)

(assert (=> b!1411256 m!1301069))

(assert (=> b!1411259 m!1301037))

(assert (=> b!1411259 m!1301037))

(declare-fun m!1301071 () Bool)

(assert (=> b!1411259 m!1301071))

(check-sat (not b!1411255) (not b!1411257) (not b!1411263) (not b!1411259) (not b!1411256) (not b!1411260) (not b!1411261) (not b!1411262) (not start!121460))
(check-sat)
