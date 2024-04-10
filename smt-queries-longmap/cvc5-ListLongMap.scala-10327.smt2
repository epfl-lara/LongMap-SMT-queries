; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121446 () Bool)

(assert start!121446)

(declare-fun res!948293 () Bool)

(declare-fun e!798518 () Bool)

(assert (=> start!121446 (=> (not res!948293) (not e!798518))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121446 (= res!948293 (validMask!0 mask!2840))))

(assert (=> start!121446 e!798518))

(assert (=> start!121446 true))

(declare-datatypes ((array!96447 0))(
  ( (array!96448 (arr!46562 (Array (_ BitVec 32) (_ BitVec 64))) (size!47112 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96447)

(declare-fun array_inv!35590 (array!96447) Bool)

(assert (=> start!121446 (array_inv!35590 a!2901)))

(declare-fun b!1411066 () Bool)

(declare-fun res!948295 () Bool)

(assert (=> b!1411066 (=> (not res!948295) (not e!798518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96447 (_ BitVec 32)) Bool)

(assert (=> b!1411066 (= res!948295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!798519 () Bool)

(declare-fun b!1411067 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10873 0))(
  ( (MissingZero!10873 (index!45869 (_ BitVec 32))) (Found!10873 (index!45870 (_ BitVec 32))) (Intermediate!10873 (undefined!11685 Bool) (index!45871 (_ BitVec 32)) (x!127468 (_ BitVec 32))) (Undefined!10873) (MissingVacant!10873 (index!45872 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96447 (_ BitVec 32)) SeekEntryResult!10873)

(assert (=> b!1411067 (= e!798519 (= (seekEntryOrOpen!0 (select (arr!46562 a!2901) j!112) a!2901 mask!2840) (Found!10873 j!112)))))

(declare-fun b!1411068 () Bool)

(declare-fun res!948294 () Bool)

(assert (=> b!1411068 (=> (not res!948294) (not e!798518))))

(declare-datatypes ((List!33081 0))(
  ( (Nil!33078) (Cons!33077 (h!34349 (_ BitVec 64)) (t!47775 List!33081)) )
))
(declare-fun arrayNoDuplicates!0 (array!96447 (_ BitVec 32) List!33081) Bool)

(assert (=> b!1411068 (= res!948294 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33078))))

(declare-fun b!1411069 () Bool)

(declare-fun e!798521 () Bool)

(declare-fun e!798517 () Bool)

(assert (=> b!1411069 (= e!798521 e!798517)))

(declare-fun res!948298 () Bool)

(assert (=> b!1411069 (=> res!948298 e!798517)))

(declare-fun lt!621500 () SeekEntryResult!10873)

(declare-fun lt!621503 () SeekEntryResult!10873)

(assert (=> b!1411069 (= res!948298 (or (= lt!621500 lt!621503) (not (is-Intermediate!10873 lt!621503))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96447 (_ BitVec 32)) SeekEntryResult!10873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411069 (= lt!621503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46562 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46562 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96448 (store (arr!46562 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47112 a!2901)) mask!2840))))

(declare-fun b!1411070 () Bool)

(assert (=> b!1411070 (= e!798518 (not e!798521))))

(declare-fun res!948297 () Bool)

(assert (=> b!1411070 (=> res!948297 e!798521)))

(assert (=> b!1411070 (= res!948297 (or (not (is-Intermediate!10873 lt!621500)) (undefined!11685 lt!621500)))))

(assert (=> b!1411070 e!798519))

(declare-fun res!948301 () Bool)

(assert (=> b!1411070 (=> (not res!948301) (not e!798519))))

(assert (=> b!1411070 (= res!948301 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47720 0))(
  ( (Unit!47721) )
))
(declare-fun lt!621504 () Unit!47720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47720)

(assert (=> b!1411070 (= lt!621504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621501 () (_ BitVec 32))

(assert (=> b!1411070 (= lt!621500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621501 (select (arr!46562 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411070 (= lt!621501 (toIndex!0 (select (arr!46562 a!2901) j!112) mask!2840))))

(declare-fun b!1411071 () Bool)

(assert (=> b!1411071 (= e!798517 true)))

(assert (=> b!1411071 (and (not (undefined!11685 lt!621503)) (= (index!45871 lt!621503) i!1037) (bvslt (x!127468 lt!621503) (x!127468 lt!621500)))))

(declare-fun lt!621502 () Unit!47720)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47720)

(assert (=> b!1411071 (= lt!621502 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621501 (x!127468 lt!621500) (index!45871 lt!621500) (x!127468 lt!621503) (index!45871 lt!621503) (undefined!11685 lt!621503) mask!2840))))

(declare-fun b!1411072 () Bool)

(declare-fun res!948300 () Bool)

(assert (=> b!1411072 (=> (not res!948300) (not e!798518))))

(assert (=> b!1411072 (= res!948300 (and (= (size!47112 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47112 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47112 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411073 () Bool)

(declare-fun res!948299 () Bool)

(assert (=> b!1411073 (=> (not res!948299) (not e!798518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411073 (= res!948299 (validKeyInArray!0 (select (arr!46562 a!2901) i!1037)))))

(declare-fun b!1411074 () Bool)

(declare-fun res!948296 () Bool)

(assert (=> b!1411074 (=> (not res!948296) (not e!798518))))

(assert (=> b!1411074 (= res!948296 (validKeyInArray!0 (select (arr!46562 a!2901) j!112)))))

(assert (= (and start!121446 res!948293) b!1411072))

(assert (= (and b!1411072 res!948300) b!1411073))

(assert (= (and b!1411073 res!948299) b!1411074))

(assert (= (and b!1411074 res!948296) b!1411066))

(assert (= (and b!1411066 res!948295) b!1411068))

(assert (= (and b!1411068 res!948294) b!1411070))

(assert (= (and b!1411070 res!948301) b!1411067))

(assert (= (and b!1411070 (not res!948297)) b!1411069))

(assert (= (and b!1411069 (not res!948298)) b!1411071))

(declare-fun m!1300785 () Bool)

(assert (=> b!1411068 m!1300785))

(declare-fun m!1300787 () Bool)

(assert (=> b!1411073 m!1300787))

(assert (=> b!1411073 m!1300787))

(declare-fun m!1300789 () Bool)

(assert (=> b!1411073 m!1300789))

(declare-fun m!1300791 () Bool)

(assert (=> b!1411070 m!1300791))

(declare-fun m!1300793 () Bool)

(assert (=> b!1411070 m!1300793))

(assert (=> b!1411070 m!1300791))

(declare-fun m!1300795 () Bool)

(assert (=> b!1411070 m!1300795))

(declare-fun m!1300797 () Bool)

(assert (=> b!1411070 m!1300797))

(assert (=> b!1411070 m!1300791))

(declare-fun m!1300799 () Bool)

(assert (=> b!1411070 m!1300799))

(assert (=> b!1411067 m!1300791))

(assert (=> b!1411067 m!1300791))

(declare-fun m!1300801 () Bool)

(assert (=> b!1411067 m!1300801))

(assert (=> b!1411074 m!1300791))

(assert (=> b!1411074 m!1300791))

(declare-fun m!1300803 () Bool)

(assert (=> b!1411074 m!1300803))

(declare-fun m!1300805 () Bool)

(assert (=> b!1411071 m!1300805))

(declare-fun m!1300807 () Bool)

(assert (=> b!1411069 m!1300807))

(declare-fun m!1300809 () Bool)

(assert (=> b!1411069 m!1300809))

(assert (=> b!1411069 m!1300809))

(declare-fun m!1300811 () Bool)

(assert (=> b!1411069 m!1300811))

(assert (=> b!1411069 m!1300811))

(assert (=> b!1411069 m!1300809))

(declare-fun m!1300813 () Bool)

(assert (=> b!1411069 m!1300813))

(declare-fun m!1300815 () Bool)

(assert (=> start!121446 m!1300815))

(declare-fun m!1300817 () Bool)

(assert (=> start!121446 m!1300817))

(declare-fun m!1300819 () Bool)

(assert (=> b!1411066 m!1300819))

(push 1)

