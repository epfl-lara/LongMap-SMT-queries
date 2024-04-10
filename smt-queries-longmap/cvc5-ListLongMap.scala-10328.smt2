; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121452 () Bool)

(assert start!121452)

(declare-fun b!1411147 () Bool)

(declare-fun e!798564 () Bool)

(assert (=> b!1411147 (= e!798564 true)))

(declare-datatypes ((SeekEntryResult!10876 0))(
  ( (MissingZero!10876 (index!45881 (_ BitVec 32))) (Found!10876 (index!45882 (_ BitVec 32))) (Intermediate!10876 (undefined!11688 Bool) (index!45883 (_ BitVec 32)) (x!127479 (_ BitVec 32))) (Undefined!10876) (MissingVacant!10876 (index!45884 (_ BitVec 32))) )
))
(declare-fun lt!621545 () SeekEntryResult!10876)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!621547 () SeekEntryResult!10876)

(assert (=> b!1411147 (and (not (undefined!11688 lt!621545)) (= (index!45883 lt!621545) i!1037) (bvslt (x!127479 lt!621545) (x!127479 lt!621547)))))

(declare-datatypes ((array!96453 0))(
  ( (array!96454 (arr!46565 (Array (_ BitVec 32) (_ BitVec 64))) (size!47115 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96453)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621548 () (_ BitVec 32))

(declare-datatypes ((Unit!47726 0))(
  ( (Unit!47727) )
))
(declare-fun lt!621546 () Unit!47726)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47726)

(assert (=> b!1411147 (= lt!621546 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621548 (x!127479 lt!621547) (index!45883 lt!621547) (x!127479 lt!621545) (index!45883 lt!621545) (undefined!11688 lt!621545) mask!2840))))

(declare-fun b!1411148 () Bool)

(declare-fun res!948379 () Bool)

(declare-fun e!798563 () Bool)

(assert (=> b!1411148 (=> (not res!948379) (not e!798563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411148 (= res!948379 (validKeyInArray!0 (select (arr!46565 a!2901) i!1037)))))

(declare-fun b!1411149 () Bool)

(declare-fun res!948380 () Bool)

(assert (=> b!1411149 (=> (not res!948380) (not e!798563))))

(assert (=> b!1411149 (= res!948380 (validKeyInArray!0 (select (arr!46565 a!2901) j!112)))))

(declare-fun b!1411150 () Bool)

(declare-fun e!798566 () Bool)

(assert (=> b!1411150 (= e!798563 (not e!798566))))

(declare-fun res!948375 () Bool)

(assert (=> b!1411150 (=> res!948375 e!798566)))

(assert (=> b!1411150 (= res!948375 (or (not (is-Intermediate!10876 lt!621547)) (undefined!11688 lt!621547)))))

(declare-fun e!798565 () Bool)

(assert (=> b!1411150 e!798565))

(declare-fun res!948382 () Bool)

(assert (=> b!1411150 (=> (not res!948382) (not e!798565))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96453 (_ BitVec 32)) Bool)

(assert (=> b!1411150 (= res!948382 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621549 () Unit!47726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96453 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47726)

(assert (=> b!1411150 (= lt!621549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96453 (_ BitVec 32)) SeekEntryResult!10876)

(assert (=> b!1411150 (= lt!621547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621548 (select (arr!46565 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411150 (= lt!621548 (toIndex!0 (select (arr!46565 a!2901) j!112) mask!2840))))

(declare-fun b!1411151 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96453 (_ BitVec 32)) SeekEntryResult!10876)

(assert (=> b!1411151 (= e!798565 (= (seekEntryOrOpen!0 (select (arr!46565 a!2901) j!112) a!2901 mask!2840) (Found!10876 j!112)))))

(declare-fun b!1411152 () Bool)

(assert (=> b!1411152 (= e!798566 e!798564)))

(declare-fun res!948376 () Bool)

(assert (=> b!1411152 (=> res!948376 e!798564)))

(assert (=> b!1411152 (= res!948376 (or (= lt!621547 lt!621545) (not (is-Intermediate!10876 lt!621545))))))

(assert (=> b!1411152 (= lt!621545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46565 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46565 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96454 (store (arr!46565 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47115 a!2901)) mask!2840))))

(declare-fun b!1411154 () Bool)

(declare-fun res!948374 () Bool)

(assert (=> b!1411154 (=> (not res!948374) (not e!798563))))

(assert (=> b!1411154 (= res!948374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411155 () Bool)

(declare-fun res!948378 () Bool)

(assert (=> b!1411155 (=> (not res!948378) (not e!798563))))

(assert (=> b!1411155 (= res!948378 (and (= (size!47115 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47115 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47115 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411153 () Bool)

(declare-fun res!948377 () Bool)

(assert (=> b!1411153 (=> (not res!948377) (not e!798563))))

(declare-datatypes ((List!33084 0))(
  ( (Nil!33081) (Cons!33080 (h!34352 (_ BitVec 64)) (t!47778 List!33084)) )
))
(declare-fun arrayNoDuplicates!0 (array!96453 (_ BitVec 32) List!33084) Bool)

(assert (=> b!1411153 (= res!948377 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33081))))

(declare-fun res!948381 () Bool)

(assert (=> start!121452 (=> (not res!948381) (not e!798563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121452 (= res!948381 (validMask!0 mask!2840))))

(assert (=> start!121452 e!798563))

(assert (=> start!121452 true))

(declare-fun array_inv!35593 (array!96453) Bool)

(assert (=> start!121452 (array_inv!35593 a!2901)))

(assert (= (and start!121452 res!948381) b!1411155))

(assert (= (and b!1411155 res!948378) b!1411148))

(assert (= (and b!1411148 res!948379) b!1411149))

(assert (= (and b!1411149 res!948380) b!1411154))

(assert (= (and b!1411154 res!948374) b!1411153))

(assert (= (and b!1411153 res!948377) b!1411150))

(assert (= (and b!1411150 res!948382) b!1411151))

(assert (= (and b!1411150 (not res!948375)) b!1411152))

(assert (= (and b!1411152 (not res!948376)) b!1411147))

(declare-fun m!1300893 () Bool)

(assert (=> b!1411148 m!1300893))

(assert (=> b!1411148 m!1300893))

(declare-fun m!1300895 () Bool)

(assert (=> b!1411148 m!1300895))

(declare-fun m!1300897 () Bool)

(assert (=> b!1411152 m!1300897))

(declare-fun m!1300899 () Bool)

(assert (=> b!1411152 m!1300899))

(assert (=> b!1411152 m!1300899))

(declare-fun m!1300901 () Bool)

(assert (=> b!1411152 m!1300901))

(assert (=> b!1411152 m!1300901))

(assert (=> b!1411152 m!1300899))

(declare-fun m!1300903 () Bool)

(assert (=> b!1411152 m!1300903))

(declare-fun m!1300905 () Bool)

(assert (=> b!1411150 m!1300905))

(declare-fun m!1300907 () Bool)

(assert (=> b!1411150 m!1300907))

(assert (=> b!1411150 m!1300905))

(declare-fun m!1300909 () Bool)

(assert (=> b!1411150 m!1300909))

(assert (=> b!1411150 m!1300905))

(declare-fun m!1300911 () Bool)

(assert (=> b!1411150 m!1300911))

(declare-fun m!1300913 () Bool)

(assert (=> b!1411150 m!1300913))

(declare-fun m!1300915 () Bool)

(assert (=> b!1411147 m!1300915))

(assert (=> b!1411149 m!1300905))

(assert (=> b!1411149 m!1300905))

(declare-fun m!1300917 () Bool)

(assert (=> b!1411149 m!1300917))

(assert (=> b!1411151 m!1300905))

(assert (=> b!1411151 m!1300905))

(declare-fun m!1300919 () Bool)

(assert (=> b!1411151 m!1300919))

(declare-fun m!1300921 () Bool)

(assert (=> b!1411153 m!1300921))

(declare-fun m!1300923 () Bool)

(assert (=> b!1411154 m!1300923))

(declare-fun m!1300925 () Bool)

(assert (=> start!121452 m!1300925))

(declare-fun m!1300927 () Bool)

(assert (=> start!121452 m!1300927))

(push 1)

