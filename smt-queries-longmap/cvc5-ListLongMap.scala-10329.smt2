; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121458 () Bool)

(assert start!121458)

(declare-fun b!1411228 () Bool)

(declare-fun e!798611 () Bool)

(declare-fun e!798607 () Bool)

(assert (=> b!1411228 (= e!798611 e!798607)))

(declare-fun res!948455 () Bool)

(assert (=> b!1411228 (=> res!948455 e!798607)))

(declare-datatypes ((SeekEntryResult!10879 0))(
  ( (MissingZero!10879 (index!45893 (_ BitVec 32))) (Found!10879 (index!45894 (_ BitVec 32))) (Intermediate!10879 (undefined!11691 Bool) (index!45895 (_ BitVec 32)) (x!127490 (_ BitVec 32))) (Undefined!10879) (MissingVacant!10879 (index!45896 (_ BitVec 32))) )
))
(declare-fun lt!621593 () SeekEntryResult!10879)

(declare-fun lt!621590 () SeekEntryResult!10879)

(assert (=> b!1411228 (= res!948455 (or (= lt!621593 lt!621590) (not (is-Intermediate!10879 lt!621590))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96459 0))(
  ( (array!96460 (arr!46568 (Array (_ BitVec 32) (_ BitVec 64))) (size!47118 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96459)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96459 (_ BitVec 32)) SeekEntryResult!10879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411228 (= lt!621590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46568 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46568 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96460 (store (arr!46568 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47118 a!2901)) mask!2840))))

(declare-fun b!1411229 () Bool)

(declare-fun res!948461 () Bool)

(declare-fun e!798610 () Bool)

(assert (=> b!1411229 (=> (not res!948461) (not e!798610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96459 (_ BitVec 32)) Bool)

(assert (=> b!1411229 (= res!948461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!948462 () Bool)

(assert (=> start!121458 (=> (not res!948462) (not e!798610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121458 (= res!948462 (validMask!0 mask!2840))))

(assert (=> start!121458 e!798610))

(assert (=> start!121458 true))

(declare-fun array_inv!35596 (array!96459) Bool)

(assert (=> start!121458 (array_inv!35596 a!2901)))

(declare-fun b!1411230 () Bool)

(assert (=> b!1411230 (= e!798610 (not e!798611))))

(declare-fun res!948458 () Bool)

(assert (=> b!1411230 (=> res!948458 e!798611)))

(assert (=> b!1411230 (= res!948458 (or (not (is-Intermediate!10879 lt!621593)) (undefined!11691 lt!621593)))))

(declare-fun e!798609 () Bool)

(assert (=> b!1411230 e!798609))

(declare-fun res!948463 () Bool)

(assert (=> b!1411230 (=> (not res!948463) (not e!798609))))

(assert (=> b!1411230 (= res!948463 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47732 0))(
  ( (Unit!47733) )
))
(declare-fun lt!621592 () Unit!47732)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47732)

(assert (=> b!1411230 (= lt!621592 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621594 () (_ BitVec 32))

(assert (=> b!1411230 (= lt!621593 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621594 (select (arr!46568 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411230 (= lt!621594 (toIndex!0 (select (arr!46568 a!2901) j!112) mask!2840))))

(declare-fun b!1411231 () Bool)

(declare-fun res!948456 () Bool)

(assert (=> b!1411231 (=> (not res!948456) (not e!798610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411231 (= res!948456 (validKeyInArray!0 (select (arr!46568 a!2901) j!112)))))

(declare-fun b!1411232 () Bool)

(declare-fun res!948460 () Bool)

(assert (=> b!1411232 (=> (not res!948460) (not e!798610))))

(assert (=> b!1411232 (= res!948460 (validKeyInArray!0 (select (arr!46568 a!2901) i!1037)))))

(declare-fun b!1411233 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96459 (_ BitVec 32)) SeekEntryResult!10879)

(assert (=> b!1411233 (= e!798609 (= (seekEntryOrOpen!0 (select (arr!46568 a!2901) j!112) a!2901 mask!2840) (Found!10879 j!112)))))

(declare-fun b!1411234 () Bool)

(declare-fun res!948457 () Bool)

(assert (=> b!1411234 (=> (not res!948457) (not e!798610))))

(assert (=> b!1411234 (= res!948457 (and (= (size!47118 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47118 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47118 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411235 () Bool)

(declare-fun res!948459 () Bool)

(assert (=> b!1411235 (=> (not res!948459) (not e!798610))))

(declare-datatypes ((List!33087 0))(
  ( (Nil!33084) (Cons!33083 (h!34355 (_ BitVec 64)) (t!47781 List!33087)) )
))
(declare-fun arrayNoDuplicates!0 (array!96459 (_ BitVec 32) List!33087) Bool)

(assert (=> b!1411235 (= res!948459 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33084))))

(declare-fun b!1411236 () Bool)

(assert (=> b!1411236 (= e!798607 true)))

(assert (=> b!1411236 (and (not (undefined!11691 lt!621590)) (= (index!45895 lt!621590) i!1037) (bvslt (x!127490 lt!621590) (x!127490 lt!621593)))))

(declare-fun lt!621591 () Unit!47732)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47732)

(assert (=> b!1411236 (= lt!621591 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621594 (x!127490 lt!621593) (index!45895 lt!621593) (x!127490 lt!621590) (index!45895 lt!621590) (undefined!11691 lt!621590) mask!2840))))

(assert (= (and start!121458 res!948462) b!1411234))

(assert (= (and b!1411234 res!948457) b!1411232))

(assert (= (and b!1411232 res!948460) b!1411231))

(assert (= (and b!1411231 res!948456) b!1411229))

(assert (= (and b!1411229 res!948461) b!1411235))

(assert (= (and b!1411235 res!948459) b!1411230))

(assert (= (and b!1411230 res!948463) b!1411233))

(assert (= (and b!1411230 (not res!948458)) b!1411228))

(assert (= (and b!1411228 (not res!948455)) b!1411236))

(declare-fun m!1301001 () Bool)

(assert (=> b!1411236 m!1301001))

(declare-fun m!1301003 () Bool)

(assert (=> b!1411235 m!1301003))

(declare-fun m!1301005 () Bool)

(assert (=> b!1411232 m!1301005))

(assert (=> b!1411232 m!1301005))

(declare-fun m!1301007 () Bool)

(assert (=> b!1411232 m!1301007))

(declare-fun m!1301009 () Bool)

(assert (=> start!121458 m!1301009))

(declare-fun m!1301011 () Bool)

(assert (=> start!121458 m!1301011))

(declare-fun m!1301013 () Bool)

(assert (=> b!1411233 m!1301013))

(assert (=> b!1411233 m!1301013))

(declare-fun m!1301015 () Bool)

(assert (=> b!1411233 m!1301015))

(assert (=> b!1411231 m!1301013))

(assert (=> b!1411231 m!1301013))

(declare-fun m!1301017 () Bool)

(assert (=> b!1411231 m!1301017))

(declare-fun m!1301019 () Bool)

(assert (=> b!1411229 m!1301019))

(declare-fun m!1301021 () Bool)

(assert (=> b!1411228 m!1301021))

(declare-fun m!1301023 () Bool)

(assert (=> b!1411228 m!1301023))

(assert (=> b!1411228 m!1301023))

(declare-fun m!1301025 () Bool)

(assert (=> b!1411228 m!1301025))

(assert (=> b!1411228 m!1301025))

(assert (=> b!1411228 m!1301023))

(declare-fun m!1301027 () Bool)

(assert (=> b!1411228 m!1301027))

(assert (=> b!1411230 m!1301013))

(declare-fun m!1301029 () Bool)

(assert (=> b!1411230 m!1301029))

(assert (=> b!1411230 m!1301013))

(declare-fun m!1301031 () Bool)

(assert (=> b!1411230 m!1301031))

(assert (=> b!1411230 m!1301013))

(declare-fun m!1301033 () Bool)

(assert (=> b!1411230 m!1301033))

(declare-fun m!1301035 () Bool)

(assert (=> b!1411230 m!1301035))

(push 1)

