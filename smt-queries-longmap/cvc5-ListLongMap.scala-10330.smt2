; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121464 () Bool)

(assert start!121464)

(declare-fun b!1411309 () Bool)

(declare-fun res!948541 () Bool)

(declare-fun e!798656 () Bool)

(assert (=> b!1411309 (=> (not res!948541) (not e!798656))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96465 0))(
  ( (array!96466 (arr!46571 (Array (_ BitVec 32) (_ BitVec 64))) (size!47121 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96465)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411309 (= res!948541 (and (= (size!47121 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47121 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47121 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411310 () Bool)

(declare-fun res!948538 () Bool)

(assert (=> b!1411310 (=> (not res!948538) (not e!798656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411310 (= res!948538 (validKeyInArray!0 (select (arr!46571 a!2901) i!1037)))))

(declare-fun b!1411311 () Bool)

(declare-fun res!948542 () Bool)

(assert (=> b!1411311 (=> (not res!948542) (not e!798656))))

(declare-datatypes ((List!33090 0))(
  ( (Nil!33087) (Cons!33086 (h!34358 (_ BitVec 64)) (t!47784 List!33090)) )
))
(declare-fun arrayNoDuplicates!0 (array!96465 (_ BitVec 32) List!33090) Bool)

(assert (=> b!1411311 (= res!948542 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33087))))

(declare-fun b!1411312 () Bool)

(declare-fun res!948539 () Bool)

(assert (=> b!1411312 (=> (not res!948539) (not e!798656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96465 (_ BitVec 32)) Bool)

(assert (=> b!1411312 (= res!948539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411313 () Bool)

(declare-fun e!798654 () Bool)

(assert (=> b!1411313 (= e!798656 (not e!798654))))

(declare-fun res!948540 () Bool)

(assert (=> b!1411313 (=> res!948540 e!798654)))

(declare-datatypes ((SeekEntryResult!10882 0))(
  ( (MissingZero!10882 (index!45905 (_ BitVec 32))) (Found!10882 (index!45906 (_ BitVec 32))) (Intermediate!10882 (undefined!11694 Bool) (index!45907 (_ BitVec 32)) (x!127501 (_ BitVec 32))) (Undefined!10882) (MissingVacant!10882 (index!45908 (_ BitVec 32))) )
))
(declare-fun lt!621638 () SeekEntryResult!10882)

(assert (=> b!1411313 (= res!948540 (or (not (is-Intermediate!10882 lt!621638)) (undefined!11694 lt!621638)))))

(declare-fun e!798652 () Bool)

(assert (=> b!1411313 e!798652))

(declare-fun res!948537 () Bool)

(assert (=> b!1411313 (=> (not res!948537) (not e!798652))))

(assert (=> b!1411313 (= res!948537 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47738 0))(
  ( (Unit!47739) )
))
(declare-fun lt!621639 () Unit!47738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47738)

(assert (=> b!1411313 (= lt!621639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621636 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96465 (_ BitVec 32)) SeekEntryResult!10882)

(assert (=> b!1411313 (= lt!621638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621636 (select (arr!46571 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411313 (= lt!621636 (toIndex!0 (select (arr!46571 a!2901) j!112) mask!2840))))

(declare-fun b!1411314 () Bool)

(declare-fun e!798653 () Bool)

(declare-fun lt!621637 () SeekEntryResult!10882)

(assert (=> b!1411314 (= e!798653 (and (bvsge (index!45907 lt!621637) #b00000000000000000000000000000000) (bvslt (index!45907 lt!621637) (size!47121 a!2901))))))

(assert (=> b!1411314 (and (not (undefined!11694 lt!621637)) (= (index!45907 lt!621637) i!1037) (bvslt (x!127501 lt!621637) (x!127501 lt!621638)))))

(declare-fun lt!621635 () Unit!47738)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47738)

(assert (=> b!1411314 (= lt!621635 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621636 (x!127501 lt!621638) (index!45907 lt!621638) (x!127501 lt!621637) (index!45907 lt!621637) (undefined!11694 lt!621637) mask!2840))))

(declare-fun b!1411316 () Bool)

(assert (=> b!1411316 (= e!798654 e!798653)))

(declare-fun res!948543 () Bool)

(assert (=> b!1411316 (=> res!948543 e!798653)))

(assert (=> b!1411316 (= res!948543 (or (= lt!621638 lt!621637) (not (is-Intermediate!10882 lt!621637))))))

(assert (=> b!1411316 (= lt!621637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46571 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46571 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96466 (store (arr!46571 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47121 a!2901)) mask!2840))))

(declare-fun b!1411317 () Bool)

(declare-fun res!948544 () Bool)

(assert (=> b!1411317 (=> (not res!948544) (not e!798656))))

(assert (=> b!1411317 (= res!948544 (validKeyInArray!0 (select (arr!46571 a!2901) j!112)))))

(declare-fun b!1411315 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96465 (_ BitVec 32)) SeekEntryResult!10882)

(assert (=> b!1411315 (= e!798652 (= (seekEntryOrOpen!0 (select (arr!46571 a!2901) j!112) a!2901 mask!2840) (Found!10882 j!112)))))

(declare-fun res!948536 () Bool)

(assert (=> start!121464 (=> (not res!948536) (not e!798656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121464 (= res!948536 (validMask!0 mask!2840))))

(assert (=> start!121464 e!798656))

(assert (=> start!121464 true))

(declare-fun array_inv!35599 (array!96465) Bool)

(assert (=> start!121464 (array_inv!35599 a!2901)))

(assert (= (and start!121464 res!948536) b!1411309))

(assert (= (and b!1411309 res!948541) b!1411310))

(assert (= (and b!1411310 res!948538) b!1411317))

(assert (= (and b!1411317 res!948544) b!1411312))

(assert (= (and b!1411312 res!948539) b!1411311))

(assert (= (and b!1411311 res!948542) b!1411313))

(assert (= (and b!1411313 res!948537) b!1411315))

(assert (= (and b!1411313 (not res!948540)) b!1411316))

(assert (= (and b!1411316 (not res!948543)) b!1411314))

(declare-fun m!1301109 () Bool)

(assert (=> b!1411311 m!1301109))

(declare-fun m!1301111 () Bool)

(assert (=> b!1411312 m!1301111))

(declare-fun m!1301113 () Bool)

(assert (=> b!1411310 m!1301113))

(assert (=> b!1411310 m!1301113))

(declare-fun m!1301115 () Bool)

(assert (=> b!1411310 m!1301115))

(declare-fun m!1301117 () Bool)

(assert (=> b!1411314 m!1301117))

(declare-fun m!1301119 () Bool)

(assert (=> b!1411317 m!1301119))

(assert (=> b!1411317 m!1301119))

(declare-fun m!1301121 () Bool)

(assert (=> b!1411317 m!1301121))

(assert (=> b!1411313 m!1301119))

(declare-fun m!1301123 () Bool)

(assert (=> b!1411313 m!1301123))

(assert (=> b!1411313 m!1301119))

(declare-fun m!1301125 () Bool)

(assert (=> b!1411313 m!1301125))

(assert (=> b!1411313 m!1301119))

(declare-fun m!1301127 () Bool)

(assert (=> b!1411313 m!1301127))

(declare-fun m!1301129 () Bool)

(assert (=> b!1411313 m!1301129))

(declare-fun m!1301131 () Bool)

(assert (=> b!1411316 m!1301131))

(declare-fun m!1301133 () Bool)

(assert (=> b!1411316 m!1301133))

(assert (=> b!1411316 m!1301133))

(declare-fun m!1301135 () Bool)

(assert (=> b!1411316 m!1301135))

(assert (=> b!1411316 m!1301135))

(assert (=> b!1411316 m!1301133))

(declare-fun m!1301137 () Bool)

(assert (=> b!1411316 m!1301137))

(assert (=> b!1411315 m!1301119))

(assert (=> b!1411315 m!1301119))

(declare-fun m!1301139 () Bool)

(assert (=> b!1411315 m!1301139))

(declare-fun m!1301141 () Bool)

(assert (=> start!121464 m!1301141))

(declare-fun m!1301143 () Bool)

(assert (=> start!121464 m!1301143))

(push 1)

(assert (not b!1411310))

(assert (not b!1411312))

(assert (not b!1411316))

(assert (not b!1411313))

(assert (not start!121464))

(assert (not b!1411317))

(assert (not b!1411311))

(assert (not b!1411314))

(assert (not b!1411315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

