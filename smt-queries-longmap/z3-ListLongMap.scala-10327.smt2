; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121448 () Bool)

(assert start!121448)

(declare-fun b!1411093 () Bool)

(declare-fun e!798535 () Bool)

(assert (=> b!1411093 (= e!798535 true)))

(declare-datatypes ((SeekEntryResult!10874 0))(
  ( (MissingZero!10874 (index!45873 (_ BitVec 32))) (Found!10874 (index!45874 (_ BitVec 32))) (Intermediate!10874 (undefined!11686 Bool) (index!45875 (_ BitVec 32)) (x!127469 (_ BitVec 32))) (Undefined!10874) (MissingVacant!10874 (index!45876 (_ BitVec 32))) )
))
(declare-fun lt!621519 () SeekEntryResult!10874)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621517 () SeekEntryResult!10874)

(assert (=> b!1411093 (and (not (undefined!11686 lt!621519)) (= (index!45875 lt!621519) i!1037) (bvslt (x!127469 lt!621519) (x!127469 lt!621517)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96449 0))(
  ( (array!96450 (arr!46563 (Array (_ BitVec 32) (_ BitVec 64))) (size!47113 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96449)

(declare-datatypes ((Unit!47722 0))(
  ( (Unit!47723) )
))
(declare-fun lt!621515 () Unit!47722)

(declare-fun lt!621516 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47722)

(assert (=> b!1411093 (= lt!621515 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621516 (x!127469 lt!621517) (index!45875 lt!621517) (x!127469 lt!621519) (index!45875 lt!621519) (undefined!11686 lt!621519) mask!2840))))

(declare-fun res!948320 () Bool)

(declare-fun e!798532 () Bool)

(assert (=> start!121448 (=> (not res!948320) (not e!798532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121448 (= res!948320 (validMask!0 mask!2840))))

(assert (=> start!121448 e!798532))

(assert (=> start!121448 true))

(declare-fun array_inv!35591 (array!96449) Bool)

(assert (=> start!121448 (array_inv!35591 a!2901)))

(declare-fun b!1411094 () Bool)

(declare-fun res!948323 () Bool)

(assert (=> b!1411094 (=> (not res!948323) (not e!798532))))

(declare-datatypes ((List!33082 0))(
  ( (Nil!33079) (Cons!33078 (h!34350 (_ BitVec 64)) (t!47776 List!33082)) )
))
(declare-fun arrayNoDuplicates!0 (array!96449 (_ BitVec 32) List!33082) Bool)

(assert (=> b!1411094 (= res!948323 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33079))))

(declare-fun b!1411095 () Bool)

(declare-fun e!798534 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96449 (_ BitVec 32)) SeekEntryResult!10874)

(assert (=> b!1411095 (= e!798534 (= (seekEntryOrOpen!0 (select (arr!46563 a!2901) j!112) a!2901 mask!2840) (Found!10874 j!112)))))

(declare-fun b!1411096 () Bool)

(declare-fun e!798533 () Bool)

(assert (=> b!1411096 (= e!798532 (not e!798533))))

(declare-fun res!948322 () Bool)

(assert (=> b!1411096 (=> res!948322 e!798533)))

(get-info :version)

(assert (=> b!1411096 (= res!948322 (or (not ((_ is Intermediate!10874) lt!621517)) (undefined!11686 lt!621517)))))

(assert (=> b!1411096 e!798534))

(declare-fun res!948326 () Bool)

(assert (=> b!1411096 (=> (not res!948326) (not e!798534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96449 (_ BitVec 32)) Bool)

(assert (=> b!1411096 (= res!948326 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621518 () Unit!47722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47722)

(assert (=> b!1411096 (= lt!621518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96449 (_ BitVec 32)) SeekEntryResult!10874)

(assert (=> b!1411096 (= lt!621517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621516 (select (arr!46563 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411096 (= lt!621516 (toIndex!0 (select (arr!46563 a!2901) j!112) mask!2840))))

(declare-fun b!1411097 () Bool)

(declare-fun res!948321 () Bool)

(assert (=> b!1411097 (=> (not res!948321) (not e!798532))))

(assert (=> b!1411097 (= res!948321 (and (= (size!47113 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47113 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47113 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411098 () Bool)

(assert (=> b!1411098 (= e!798533 e!798535)))

(declare-fun res!948325 () Bool)

(assert (=> b!1411098 (=> res!948325 e!798535)))

(assert (=> b!1411098 (= res!948325 (or (= lt!621517 lt!621519) (not ((_ is Intermediate!10874) lt!621519))))))

(assert (=> b!1411098 (= lt!621519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46563 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46563 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96450 (store (arr!46563 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47113 a!2901)) mask!2840))))

(declare-fun b!1411099 () Bool)

(declare-fun res!948328 () Bool)

(assert (=> b!1411099 (=> (not res!948328) (not e!798532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411099 (= res!948328 (validKeyInArray!0 (select (arr!46563 a!2901) j!112)))))

(declare-fun b!1411100 () Bool)

(declare-fun res!948327 () Bool)

(assert (=> b!1411100 (=> (not res!948327) (not e!798532))))

(assert (=> b!1411100 (= res!948327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411101 () Bool)

(declare-fun res!948324 () Bool)

(assert (=> b!1411101 (=> (not res!948324) (not e!798532))))

(assert (=> b!1411101 (= res!948324 (validKeyInArray!0 (select (arr!46563 a!2901) i!1037)))))

(assert (= (and start!121448 res!948320) b!1411097))

(assert (= (and b!1411097 res!948321) b!1411101))

(assert (= (and b!1411101 res!948324) b!1411099))

(assert (= (and b!1411099 res!948328) b!1411100))

(assert (= (and b!1411100 res!948327) b!1411094))

(assert (= (and b!1411094 res!948323) b!1411096))

(assert (= (and b!1411096 res!948326) b!1411095))

(assert (= (and b!1411096 (not res!948322)) b!1411098))

(assert (= (and b!1411098 (not res!948325)) b!1411093))

(declare-fun m!1300821 () Bool)

(assert (=> b!1411093 m!1300821))

(declare-fun m!1300823 () Bool)

(assert (=> b!1411096 m!1300823))

(declare-fun m!1300825 () Bool)

(assert (=> b!1411096 m!1300825))

(declare-fun m!1300827 () Bool)

(assert (=> b!1411096 m!1300827))

(declare-fun m!1300829 () Bool)

(assert (=> b!1411096 m!1300829))

(assert (=> b!1411096 m!1300823))

(declare-fun m!1300831 () Bool)

(assert (=> b!1411096 m!1300831))

(assert (=> b!1411096 m!1300823))

(declare-fun m!1300833 () Bool)

(assert (=> b!1411098 m!1300833))

(declare-fun m!1300835 () Bool)

(assert (=> b!1411098 m!1300835))

(assert (=> b!1411098 m!1300835))

(declare-fun m!1300837 () Bool)

(assert (=> b!1411098 m!1300837))

(assert (=> b!1411098 m!1300837))

(assert (=> b!1411098 m!1300835))

(declare-fun m!1300839 () Bool)

(assert (=> b!1411098 m!1300839))

(declare-fun m!1300841 () Bool)

(assert (=> start!121448 m!1300841))

(declare-fun m!1300843 () Bool)

(assert (=> start!121448 m!1300843))

(declare-fun m!1300845 () Bool)

(assert (=> b!1411101 m!1300845))

(assert (=> b!1411101 m!1300845))

(declare-fun m!1300847 () Bool)

(assert (=> b!1411101 m!1300847))

(assert (=> b!1411095 m!1300823))

(assert (=> b!1411095 m!1300823))

(declare-fun m!1300849 () Bool)

(assert (=> b!1411095 m!1300849))

(declare-fun m!1300851 () Bool)

(assert (=> b!1411094 m!1300851))

(assert (=> b!1411099 m!1300823))

(assert (=> b!1411099 m!1300823))

(declare-fun m!1300853 () Bool)

(assert (=> b!1411099 m!1300853))

(declare-fun m!1300855 () Bool)

(assert (=> b!1411100 m!1300855))

(check-sat (not b!1411100) (not b!1411093) (not b!1411095) (not b!1411098) (not b!1411096) (not b!1411099) (not b!1411101) (not start!121448) (not b!1411094))
(check-sat)
