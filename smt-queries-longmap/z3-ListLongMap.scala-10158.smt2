; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119714 () Bool)

(assert start!119714)

(declare-fun b!1394548 () Bool)

(declare-fun e!789554 () Bool)

(assert (=> b!1394548 (= e!789554 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10373 0))(
  ( (MissingZero!10373 (index!43863 (_ BitVec 32))) (Found!10373 (index!43864 (_ BitVec 32))) (Intermediate!10373 (undefined!11185 Bool) (index!43865 (_ BitVec 32)) (x!125529 (_ BitVec 32))) (Undefined!10373) (MissingVacant!10373 (index!43866 (_ BitVec 32))) )
))
(declare-fun lt!612557 () SeekEntryResult!10373)

(declare-fun lt!612558 () (_ BitVec 64))

(declare-datatypes ((array!95396 0))(
  ( (array!95397 (arr!46056 (Array (_ BitVec 32) (_ BitVec 64))) (size!46606 (_ BitVec 32))) )
))
(declare-fun lt!612555 () array!95396)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95396 (_ BitVec 32)) SeekEntryResult!10373)

(assert (=> b!1394548 (= lt!612557 (seekEntryOrOpen!0 lt!612558 lt!612555 mask!2840))))

(declare-fun a!2901 () array!95396)

(declare-datatypes ((Unit!46750 0))(
  ( (Unit!46751) )
))
(declare-fun lt!612561 () Unit!46750)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!612559 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lt!612560 () SeekEntryResult!10373)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46750)

(assert (=> b!1394548 (= lt!612561 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612559 (x!125529 lt!612560) (index!43865 lt!612560) mask!2840))))

(declare-fun b!1394549 () Bool)

(declare-fun e!789551 () Bool)

(declare-fun e!789553 () Bool)

(assert (=> b!1394549 (= e!789551 (not e!789553))))

(declare-fun res!933962 () Bool)

(assert (=> b!1394549 (=> res!933962 e!789553)))

(get-info :version)

(assert (=> b!1394549 (= res!933962 (or (not ((_ is Intermediate!10373) lt!612560)) (undefined!11185 lt!612560)))))

(assert (=> b!1394549 (= lt!612557 (Found!10373 j!112))))

(assert (=> b!1394549 (= lt!612557 (seekEntryOrOpen!0 (select (arr!46056 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95396 (_ BitVec 32)) Bool)

(assert (=> b!1394549 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612556 () Unit!46750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95396 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46750)

(assert (=> b!1394549 (= lt!612556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95396 (_ BitVec 32)) SeekEntryResult!10373)

(assert (=> b!1394549 (= lt!612560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612559 (select (arr!46056 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394549 (= lt!612559 (toIndex!0 (select (arr!46056 a!2901) j!112) mask!2840))))

(declare-fun b!1394550 () Bool)

(declare-fun res!933960 () Bool)

(assert (=> b!1394550 (=> res!933960 e!789554)))

(assert (=> b!1394550 (= res!933960 (or (bvslt (x!125529 lt!612560) #b00000000000000000000000000000000) (bvsgt (x!125529 lt!612560) #b01111111111111111111111111111110) (bvslt lt!612559 #b00000000000000000000000000000000) (bvsge lt!612559 (size!46606 a!2901)) (bvslt (index!43865 lt!612560) #b00000000000000000000000000000000) (bvsge (index!43865 lt!612560) (size!46606 a!2901)) (not (= lt!612560 (Intermediate!10373 false (index!43865 lt!612560) (x!125529 lt!612560))))))))

(declare-fun b!1394552 () Bool)

(declare-fun res!933959 () Bool)

(assert (=> b!1394552 (=> (not res!933959) (not e!789551))))

(assert (=> b!1394552 (= res!933959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394553 () Bool)

(declare-fun res!933963 () Bool)

(assert (=> b!1394553 (=> (not res!933963) (not e!789551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394553 (= res!933963 (validKeyInArray!0 (select (arr!46056 a!2901) i!1037)))))

(declare-fun b!1394554 () Bool)

(declare-fun res!933957 () Bool)

(assert (=> b!1394554 (=> (not res!933957) (not e!789551))))

(assert (=> b!1394554 (= res!933957 (validKeyInArray!0 (select (arr!46056 a!2901) j!112)))))

(declare-fun b!1394551 () Bool)

(declare-fun res!933961 () Bool)

(assert (=> b!1394551 (=> (not res!933961) (not e!789551))))

(declare-datatypes ((List!32575 0))(
  ( (Nil!32572) (Cons!32571 (h!33804 (_ BitVec 64)) (t!47269 List!32575)) )
))
(declare-fun arrayNoDuplicates!0 (array!95396 (_ BitVec 32) List!32575) Bool)

(assert (=> b!1394551 (= res!933961 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32572))))

(declare-fun res!933956 () Bool)

(assert (=> start!119714 (=> (not res!933956) (not e!789551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119714 (= res!933956 (validMask!0 mask!2840))))

(assert (=> start!119714 e!789551))

(assert (=> start!119714 true))

(declare-fun array_inv!35084 (array!95396) Bool)

(assert (=> start!119714 (array_inv!35084 a!2901)))

(declare-fun b!1394555 () Bool)

(declare-fun res!933964 () Bool)

(assert (=> b!1394555 (=> (not res!933964) (not e!789551))))

(assert (=> b!1394555 (= res!933964 (and (= (size!46606 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46606 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46606 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394556 () Bool)

(assert (=> b!1394556 (= e!789553 e!789554)))

(declare-fun res!933958 () Bool)

(assert (=> b!1394556 (=> res!933958 e!789554)))

(assert (=> b!1394556 (= res!933958 (not (= lt!612560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612558 mask!2840) lt!612558 lt!612555 mask!2840))))))

(assert (=> b!1394556 (= lt!612558 (select (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394556 (= lt!612555 (array!95397 (store (arr!46056 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46606 a!2901)))))

(assert (= (and start!119714 res!933956) b!1394555))

(assert (= (and b!1394555 res!933964) b!1394553))

(assert (= (and b!1394553 res!933963) b!1394554))

(assert (= (and b!1394554 res!933957) b!1394552))

(assert (= (and b!1394552 res!933959) b!1394551))

(assert (= (and b!1394551 res!933961) b!1394549))

(assert (= (and b!1394549 (not res!933962)) b!1394556))

(assert (= (and b!1394556 (not res!933958)) b!1394550))

(assert (= (and b!1394550 (not res!933960)) b!1394548))

(declare-fun m!1280915 () Bool)

(assert (=> b!1394554 m!1280915))

(assert (=> b!1394554 m!1280915))

(declare-fun m!1280917 () Bool)

(assert (=> b!1394554 m!1280917))

(declare-fun m!1280919 () Bool)

(assert (=> b!1394551 m!1280919))

(declare-fun m!1280921 () Bool)

(assert (=> b!1394553 m!1280921))

(assert (=> b!1394553 m!1280921))

(declare-fun m!1280923 () Bool)

(assert (=> b!1394553 m!1280923))

(declare-fun m!1280925 () Bool)

(assert (=> start!119714 m!1280925))

(declare-fun m!1280927 () Bool)

(assert (=> start!119714 m!1280927))

(declare-fun m!1280929 () Bool)

(assert (=> b!1394556 m!1280929))

(assert (=> b!1394556 m!1280929))

(declare-fun m!1280931 () Bool)

(assert (=> b!1394556 m!1280931))

(declare-fun m!1280933 () Bool)

(assert (=> b!1394556 m!1280933))

(declare-fun m!1280935 () Bool)

(assert (=> b!1394556 m!1280935))

(declare-fun m!1280937 () Bool)

(assert (=> b!1394552 m!1280937))

(assert (=> b!1394549 m!1280915))

(declare-fun m!1280939 () Bool)

(assert (=> b!1394549 m!1280939))

(assert (=> b!1394549 m!1280915))

(declare-fun m!1280941 () Bool)

(assert (=> b!1394549 m!1280941))

(assert (=> b!1394549 m!1280915))

(declare-fun m!1280943 () Bool)

(assert (=> b!1394549 m!1280943))

(assert (=> b!1394549 m!1280915))

(declare-fun m!1280945 () Bool)

(assert (=> b!1394549 m!1280945))

(declare-fun m!1280947 () Bool)

(assert (=> b!1394549 m!1280947))

(declare-fun m!1280949 () Bool)

(assert (=> b!1394548 m!1280949))

(declare-fun m!1280951 () Bool)

(assert (=> b!1394548 m!1280951))

(check-sat (not b!1394552) (not start!119714) (not b!1394556) (not b!1394548) (not b!1394551) (not b!1394554) (not b!1394553) (not b!1394549))
(check-sat)
