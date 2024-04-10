; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121456 () Bool)

(assert start!121456)

(declare-fun b!1411201 () Bool)

(declare-fun res!948435 () Bool)

(declare-fun e!798594 () Bool)

(assert (=> b!1411201 (=> (not res!948435) (not e!798594))))

(declare-datatypes ((array!96457 0))(
  ( (array!96458 (arr!46567 (Array (_ BitVec 32) (_ BitVec 64))) (size!47117 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96457)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96457 (_ BitVec 32)) Bool)

(assert (=> b!1411201 (= res!948435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!948434 () Bool)

(assert (=> start!121456 (=> (not res!948434) (not e!798594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121456 (= res!948434 (validMask!0 mask!2840))))

(assert (=> start!121456 e!798594))

(assert (=> start!121456 true))

(declare-fun array_inv!35595 (array!96457) Bool)

(assert (=> start!121456 (array_inv!35595 a!2901)))

(declare-fun b!1411202 () Bool)

(declare-fun res!948429 () Bool)

(assert (=> b!1411202 (=> (not res!948429) (not e!798594))))

(declare-datatypes ((List!33086 0))(
  ( (Nil!33083) (Cons!33082 (h!34354 (_ BitVec 64)) (t!47780 List!33086)) )
))
(declare-fun arrayNoDuplicates!0 (array!96457 (_ BitVec 32) List!33086) Bool)

(assert (=> b!1411202 (= res!948429 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33083))))

(declare-fun b!1411203 () Bool)

(declare-fun e!798596 () Bool)

(assert (=> b!1411203 (= e!798596 true)))

(declare-datatypes ((SeekEntryResult!10878 0))(
  ( (MissingZero!10878 (index!45889 (_ BitVec 32))) (Found!10878 (index!45890 (_ BitVec 32))) (Intermediate!10878 (undefined!11690 Bool) (index!45891 (_ BitVec 32)) (x!127481 (_ BitVec 32))) (Undefined!10878) (MissingVacant!10878 (index!45892 (_ BitVec 32))) )
))
(declare-fun lt!621577 () SeekEntryResult!10878)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621576 () SeekEntryResult!10878)

(assert (=> b!1411203 (and (not (undefined!11690 lt!621577)) (= (index!45891 lt!621577) i!1037) (bvslt (x!127481 lt!621577) (x!127481 lt!621576)))))

(declare-fun lt!621575 () (_ BitVec 32))

(declare-datatypes ((Unit!47730 0))(
  ( (Unit!47731) )
))
(declare-fun lt!621578 () Unit!47730)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47730)

(assert (=> b!1411203 (= lt!621578 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621575 (x!127481 lt!621576) (index!45891 lt!621576) (x!127481 lt!621577) (index!45891 lt!621577) (undefined!11690 lt!621577) mask!2840))))

(declare-fun b!1411204 () Bool)

(declare-fun res!948432 () Bool)

(assert (=> b!1411204 (=> (not res!948432) (not e!798594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411204 (= res!948432 (validKeyInArray!0 (select (arr!46567 a!2901) j!112)))))

(declare-fun b!1411205 () Bool)

(declare-fun e!798592 () Bool)

(assert (=> b!1411205 (= e!798592 e!798596)))

(declare-fun res!948433 () Bool)

(assert (=> b!1411205 (=> res!948433 e!798596)))

(assert (=> b!1411205 (= res!948433 (or (= lt!621576 lt!621577) (not (is-Intermediate!10878 lt!621577))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96457 (_ BitVec 32)) SeekEntryResult!10878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411205 (= lt!621577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46567 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46567 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96458 (store (arr!46567 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47117 a!2901)) mask!2840))))

(declare-fun e!798595 () Bool)

(declare-fun b!1411206 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96457 (_ BitVec 32)) SeekEntryResult!10878)

(assert (=> b!1411206 (= e!798595 (= (seekEntryOrOpen!0 (select (arr!46567 a!2901) j!112) a!2901 mask!2840) (Found!10878 j!112)))))

(declare-fun b!1411207 () Bool)

(declare-fun res!948436 () Bool)

(assert (=> b!1411207 (=> (not res!948436) (not e!798594))))

(assert (=> b!1411207 (= res!948436 (and (= (size!47117 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47117 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47117 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411208 () Bool)

(declare-fun res!948431 () Bool)

(assert (=> b!1411208 (=> (not res!948431) (not e!798594))))

(assert (=> b!1411208 (= res!948431 (validKeyInArray!0 (select (arr!46567 a!2901) i!1037)))))

(declare-fun b!1411209 () Bool)

(assert (=> b!1411209 (= e!798594 (not e!798592))))

(declare-fun res!948428 () Bool)

(assert (=> b!1411209 (=> res!948428 e!798592)))

(assert (=> b!1411209 (= res!948428 (or (not (is-Intermediate!10878 lt!621576)) (undefined!11690 lt!621576)))))

(assert (=> b!1411209 e!798595))

(declare-fun res!948430 () Bool)

(assert (=> b!1411209 (=> (not res!948430) (not e!798595))))

(assert (=> b!1411209 (= res!948430 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621579 () Unit!47730)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47730)

(assert (=> b!1411209 (= lt!621579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411209 (= lt!621576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621575 (select (arr!46567 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411209 (= lt!621575 (toIndex!0 (select (arr!46567 a!2901) j!112) mask!2840))))

(assert (= (and start!121456 res!948434) b!1411207))

(assert (= (and b!1411207 res!948436) b!1411208))

(assert (= (and b!1411208 res!948431) b!1411204))

(assert (= (and b!1411204 res!948432) b!1411201))

(assert (= (and b!1411201 res!948435) b!1411202))

(assert (= (and b!1411202 res!948429) b!1411209))

(assert (= (and b!1411209 res!948430) b!1411206))

(assert (= (and b!1411209 (not res!948428)) b!1411205))

(assert (= (and b!1411205 (not res!948433)) b!1411203))

(declare-fun m!1300965 () Bool)

(assert (=> b!1411201 m!1300965))

(declare-fun m!1300967 () Bool)

(assert (=> b!1411206 m!1300967))

(assert (=> b!1411206 m!1300967))

(declare-fun m!1300969 () Bool)

(assert (=> b!1411206 m!1300969))

(declare-fun m!1300971 () Bool)

(assert (=> start!121456 m!1300971))

(declare-fun m!1300973 () Bool)

(assert (=> start!121456 m!1300973))

(declare-fun m!1300975 () Bool)

(assert (=> b!1411205 m!1300975))

(declare-fun m!1300977 () Bool)

(assert (=> b!1411205 m!1300977))

(assert (=> b!1411205 m!1300977))

(declare-fun m!1300979 () Bool)

(assert (=> b!1411205 m!1300979))

(assert (=> b!1411205 m!1300979))

(assert (=> b!1411205 m!1300977))

(declare-fun m!1300981 () Bool)

(assert (=> b!1411205 m!1300981))

(declare-fun m!1300983 () Bool)

(assert (=> b!1411203 m!1300983))

(declare-fun m!1300985 () Bool)

(assert (=> b!1411208 m!1300985))

(assert (=> b!1411208 m!1300985))

(declare-fun m!1300987 () Bool)

(assert (=> b!1411208 m!1300987))

(assert (=> b!1411209 m!1300967))

(declare-fun m!1300989 () Bool)

(assert (=> b!1411209 m!1300989))

(assert (=> b!1411209 m!1300967))

(declare-fun m!1300991 () Bool)

(assert (=> b!1411209 m!1300991))

(assert (=> b!1411209 m!1300967))

(declare-fun m!1300993 () Bool)

(assert (=> b!1411209 m!1300993))

(declare-fun m!1300995 () Bool)

(assert (=> b!1411209 m!1300995))

(assert (=> b!1411204 m!1300967))

(assert (=> b!1411204 m!1300967))

(declare-fun m!1300997 () Bool)

(assert (=> b!1411204 m!1300997))

(declare-fun m!1300999 () Bool)

(assert (=> b!1411202 m!1300999))

(push 1)

