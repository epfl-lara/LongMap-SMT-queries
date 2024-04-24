; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122174 () Bool)

(assert start!122174)

(declare-fun b!1416905 () Bool)

(declare-fun res!952270 () Bool)

(declare-fun e!802036 () Bool)

(assert (=> b!1416905 (=> (not res!952270) (not e!802036))))

(declare-datatypes ((array!96782 0))(
  ( (array!96783 (arr!46720 (Array (_ BitVec 32) (_ BitVec 64))) (size!47271 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96782)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416905 (= res!952270 (validKeyInArray!0 (select (arr!46720 a!2901) i!1037)))))

(declare-fun b!1416906 () Bool)

(declare-fun res!952273 () Bool)

(assert (=> b!1416906 (=> (not res!952273) (not e!802036))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96782 (_ BitVec 32)) Bool)

(assert (=> b!1416906 (= res!952273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416907 () Bool)

(declare-fun res!952265 () Bool)

(assert (=> b!1416907 (=> (not res!952265) (not e!802036))))

(declare-datatypes ((List!33226 0))(
  ( (Nil!33223) (Cons!33222 (h!34517 (_ BitVec 64)) (t!47912 List!33226)) )
))
(declare-fun arrayNoDuplicates!0 (array!96782 (_ BitVec 32) List!33226) Bool)

(assert (=> b!1416907 (= res!952265 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33223))))

(declare-fun b!1416908 () Bool)

(declare-fun e!802038 () Bool)

(declare-fun e!802035 () Bool)

(assert (=> b!1416908 (= e!802038 e!802035)))

(declare-fun res!952272 () Bool)

(assert (=> b!1416908 (=> res!952272 e!802035)))

(declare-fun lt!624768 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10934 0))(
  ( (MissingZero!10934 (index!46128 (_ BitVec 32))) (Found!10934 (index!46129 (_ BitVec 32))) (Intermediate!10934 (undefined!11746 Bool) (index!46130 (_ BitVec 32)) (x!127888 (_ BitVec 32))) (Undefined!10934) (MissingVacant!10934 (index!46131 (_ BitVec 32))) )
))
(declare-fun lt!624767 () SeekEntryResult!10934)

(declare-fun lt!624766 () SeekEntryResult!10934)

(assert (=> b!1416908 (= res!952272 (or (bvslt (x!127888 lt!624766) #b00000000000000000000000000000000) (bvsgt (x!127888 lt!624766) #b01111111111111111111111111111110) (bvslt (x!127888 lt!624767) #b00000000000000000000000000000000) (bvsgt (x!127888 lt!624767) #b01111111111111111111111111111110) (bvslt lt!624768 #b00000000000000000000000000000000) (bvsge lt!624768 (size!47271 a!2901)) (bvslt (index!46130 lt!624766) #b00000000000000000000000000000000) (bvsge (index!46130 lt!624766) (size!47271 a!2901)) (bvslt (index!46130 lt!624767) #b00000000000000000000000000000000) (bvsge (index!46130 lt!624767) (size!47271 a!2901)) (not (= lt!624766 (Intermediate!10934 false (index!46130 lt!624766) (x!127888 lt!624766)))) (not (= lt!624767 (Intermediate!10934 false (index!46130 lt!624767) (x!127888 lt!624767))))))))

(declare-fun e!802040 () Bool)

(assert (=> b!1416908 e!802040))

(declare-fun res!952266 () Bool)

(assert (=> b!1416908 (=> (not res!952266) (not e!802040))))

(assert (=> b!1416908 (= res!952266 (and (not (undefined!11746 lt!624767)) (= (index!46130 lt!624767) i!1037) (bvslt (x!127888 lt!624767) (x!127888 lt!624766)) (= (select (store (arr!46720 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46130 lt!624767)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47869 0))(
  ( (Unit!47870) )
))
(declare-fun lt!624764 () Unit!47869)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47869)

(assert (=> b!1416908 (= lt!624764 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624768 (x!127888 lt!624766) (index!46130 lt!624766) (x!127888 lt!624767) (index!46130 lt!624767) (undefined!11746 lt!624767) mask!2840))))

(declare-fun b!1416909 () Bool)

(declare-fun e!802037 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96782 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1416909 (= e!802037 (= (seekEntryOrOpen!0 (select (arr!46720 a!2901) j!112) a!2901 mask!2840) (Found!10934 j!112)))))

(declare-fun b!1416910 () Bool)

(declare-fun res!952267 () Bool)

(assert (=> b!1416910 (=> (not res!952267) (not e!802036))))

(assert (=> b!1416910 (= res!952267 (and (= (size!47271 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47271 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47271 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952263 () Bool)

(assert (=> start!122174 (=> (not res!952263) (not e!802036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122174 (= res!952263 (validMask!0 mask!2840))))

(assert (=> start!122174 e!802036))

(assert (=> start!122174 true))

(declare-fun array_inv!36001 (array!96782) Bool)

(assert (=> start!122174 (array_inv!36001 a!2901)))

(declare-fun b!1416911 () Bool)

(declare-fun e!802034 () Bool)

(assert (=> b!1416911 (= e!802036 (not e!802034))))

(declare-fun res!952271 () Bool)

(assert (=> b!1416911 (=> res!952271 e!802034)))

(get-info :version)

(assert (=> b!1416911 (= res!952271 (or (not ((_ is Intermediate!10934) lt!624766)) (undefined!11746 lt!624766)))))

(assert (=> b!1416911 e!802037))

(declare-fun res!952264 () Bool)

(assert (=> b!1416911 (=> (not res!952264) (not e!802037))))

(assert (=> b!1416911 (= res!952264 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!624763 () Unit!47869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47869)

(assert (=> b!1416911 (= lt!624763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96782 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1416911 (= lt!624766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624768 (select (arr!46720 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416911 (= lt!624768 (toIndex!0 (select (arr!46720 a!2901) j!112) mask!2840))))

(declare-fun lt!624765 () (_ BitVec 64))

(declare-fun lt!624769 () array!96782)

(declare-fun b!1416912 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96782 (_ BitVec 32)) SeekEntryResult!10934)

(assert (=> b!1416912 (= e!802040 (= (seekEntryOrOpen!0 lt!624765 lt!624769 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127888 lt!624767) (index!46130 lt!624767) (index!46130 lt!624767) (select (arr!46720 a!2901) j!112) lt!624769 mask!2840)))))

(declare-fun b!1416913 () Bool)

(assert (=> b!1416913 (= e!802034 e!802038)))

(declare-fun res!952269 () Bool)

(assert (=> b!1416913 (=> res!952269 e!802038)))

(assert (=> b!1416913 (= res!952269 (or (= lt!624766 lt!624767) (not ((_ is Intermediate!10934) lt!624767))))))

(assert (=> b!1416913 (= lt!624767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624765 mask!2840) lt!624765 lt!624769 mask!2840))))

(assert (=> b!1416913 (= lt!624765 (select (store (arr!46720 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1416913 (= lt!624769 (array!96783 (store (arr!46720 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47271 a!2901)))))

(declare-fun b!1416914 () Bool)

(assert (=> b!1416914 (= e!802035 true)))

(declare-fun lt!624770 () SeekEntryResult!10934)

(assert (=> b!1416914 (= lt!624770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624768 lt!624765 lt!624769 mask!2840))))

(declare-fun b!1416915 () Bool)

(declare-fun res!952268 () Bool)

(assert (=> b!1416915 (=> (not res!952268) (not e!802036))))

(assert (=> b!1416915 (= res!952268 (validKeyInArray!0 (select (arr!46720 a!2901) j!112)))))

(assert (= (and start!122174 res!952263) b!1416910))

(assert (= (and b!1416910 res!952267) b!1416905))

(assert (= (and b!1416905 res!952270) b!1416915))

(assert (= (and b!1416915 res!952268) b!1416906))

(assert (= (and b!1416906 res!952273) b!1416907))

(assert (= (and b!1416907 res!952265) b!1416911))

(assert (= (and b!1416911 res!952264) b!1416909))

(assert (= (and b!1416911 (not res!952271)) b!1416913))

(assert (= (and b!1416913 (not res!952269)) b!1416908))

(assert (= (and b!1416908 res!952266) b!1416912))

(assert (= (and b!1416908 (not res!952272)) b!1416914))

(declare-fun m!1307539 () Bool)

(assert (=> b!1416908 m!1307539))

(declare-fun m!1307541 () Bool)

(assert (=> b!1416908 m!1307541))

(declare-fun m!1307543 () Bool)

(assert (=> b!1416908 m!1307543))

(declare-fun m!1307545 () Bool)

(assert (=> b!1416909 m!1307545))

(assert (=> b!1416909 m!1307545))

(declare-fun m!1307547 () Bool)

(assert (=> b!1416909 m!1307547))

(declare-fun m!1307549 () Bool)

(assert (=> b!1416907 m!1307549))

(declare-fun m!1307551 () Bool)

(assert (=> b!1416913 m!1307551))

(assert (=> b!1416913 m!1307551))

(declare-fun m!1307553 () Bool)

(assert (=> b!1416913 m!1307553))

(assert (=> b!1416913 m!1307539))

(declare-fun m!1307555 () Bool)

(assert (=> b!1416913 m!1307555))

(assert (=> b!1416915 m!1307545))

(assert (=> b!1416915 m!1307545))

(declare-fun m!1307557 () Bool)

(assert (=> b!1416915 m!1307557))

(declare-fun m!1307559 () Bool)

(assert (=> b!1416914 m!1307559))

(declare-fun m!1307561 () Bool)

(assert (=> b!1416905 m!1307561))

(assert (=> b!1416905 m!1307561))

(declare-fun m!1307563 () Bool)

(assert (=> b!1416905 m!1307563))

(assert (=> b!1416911 m!1307545))

(declare-fun m!1307565 () Bool)

(assert (=> b!1416911 m!1307565))

(assert (=> b!1416911 m!1307545))

(declare-fun m!1307567 () Bool)

(assert (=> b!1416911 m!1307567))

(declare-fun m!1307569 () Bool)

(assert (=> b!1416911 m!1307569))

(assert (=> b!1416911 m!1307545))

(declare-fun m!1307571 () Bool)

(assert (=> b!1416911 m!1307571))

(declare-fun m!1307573 () Bool)

(assert (=> b!1416912 m!1307573))

(assert (=> b!1416912 m!1307545))

(assert (=> b!1416912 m!1307545))

(declare-fun m!1307575 () Bool)

(assert (=> b!1416912 m!1307575))

(declare-fun m!1307577 () Bool)

(assert (=> start!122174 m!1307577))

(declare-fun m!1307579 () Bool)

(assert (=> start!122174 m!1307579))

(declare-fun m!1307581 () Bool)

(assert (=> b!1416906 m!1307581))

(check-sat (not b!1416913) (not b!1416909) (not b!1416912) (not b!1416911) (not b!1416915) (not b!1416906) (not start!122174) (not b!1416907) (not b!1416914) (not b!1416908) (not b!1416905))
(check-sat)
