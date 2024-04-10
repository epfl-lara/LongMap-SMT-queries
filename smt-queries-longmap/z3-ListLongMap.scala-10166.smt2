; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119816 () Bool)

(assert start!119816)

(declare-fun b!1395446 () Bool)

(declare-fun e!790009 () Bool)

(assert (=> b!1395446 (= e!790009 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95447 0))(
  ( (array!95448 (arr!46080 (Array (_ BitVec 32) (_ BitVec 64))) (size!46630 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95447)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10397 0))(
  ( (MissingZero!10397 (index!43959 (_ BitVec 32))) (Found!10397 (index!43960 (_ BitVec 32))) (Intermediate!10397 (undefined!11209 Bool) (index!43961 (_ BitVec 32)) (x!125623 (_ BitVec 32))) (Undefined!10397) (MissingVacant!10397 (index!43962 (_ BitVec 32))) )
))
(declare-fun lt!612989 () SeekEntryResult!10397)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95447 (_ BitVec 32)) SeekEntryResult!10397)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395446 (= lt!612989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46080 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46080 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95448 (store (arr!46080 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46630 a!2901)) mask!2840))))

(declare-fun b!1395447 () Bool)

(declare-fun res!934693 () Bool)

(declare-fun e!790007 () Bool)

(assert (=> b!1395447 (=> (not res!934693) (not e!790007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395447 (= res!934693 (validKeyInArray!0 (select (arr!46080 a!2901) j!112)))))

(declare-fun b!1395448 () Bool)

(declare-fun res!934695 () Bool)

(assert (=> b!1395448 (=> (not res!934695) (not e!790007))))

(assert (=> b!1395448 (= res!934695 (validKeyInArray!0 (select (arr!46080 a!2901) i!1037)))))

(declare-fun res!934696 () Bool)

(assert (=> start!119816 (=> (not res!934696) (not e!790007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119816 (= res!934696 (validMask!0 mask!2840))))

(assert (=> start!119816 e!790007))

(assert (=> start!119816 true))

(declare-fun array_inv!35108 (array!95447) Bool)

(assert (=> start!119816 (array_inv!35108 a!2901)))

(declare-fun b!1395449 () Bool)

(assert (=> b!1395449 (= e!790007 (not e!790009))))

(declare-fun res!934689 () Bool)

(assert (=> b!1395449 (=> res!934689 e!790009)))

(declare-fun lt!612990 () SeekEntryResult!10397)

(get-info :version)

(assert (=> b!1395449 (= res!934689 (or (not ((_ is Intermediate!10397) lt!612990)) (undefined!11209 lt!612990)))))

(declare-fun e!790008 () Bool)

(assert (=> b!1395449 e!790008))

(declare-fun res!934692 () Bool)

(assert (=> b!1395449 (=> (not res!934692) (not e!790008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95447 (_ BitVec 32)) Bool)

(assert (=> b!1395449 (= res!934692 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46798 0))(
  ( (Unit!46799) )
))
(declare-fun lt!612988 () Unit!46798)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95447 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46798)

(assert (=> b!1395449 (= lt!612988 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1395449 (= lt!612990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46080 a!2901) j!112) mask!2840) (select (arr!46080 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395450 () Bool)

(declare-fun res!934694 () Bool)

(assert (=> b!1395450 (=> (not res!934694) (not e!790007))))

(assert (=> b!1395450 (= res!934694 (and (= (size!46630 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46630 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46630 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395451 () Bool)

(declare-fun res!934690 () Bool)

(assert (=> b!1395451 (=> (not res!934690) (not e!790007))))

(assert (=> b!1395451 (= res!934690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395452 () Bool)

(declare-fun res!934691 () Bool)

(assert (=> b!1395452 (=> (not res!934691) (not e!790007))))

(declare-datatypes ((List!32599 0))(
  ( (Nil!32596) (Cons!32595 (h!33831 (_ BitVec 64)) (t!47293 List!32599)) )
))
(declare-fun arrayNoDuplicates!0 (array!95447 (_ BitVec 32) List!32599) Bool)

(assert (=> b!1395452 (= res!934691 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32596))))

(declare-fun b!1395453 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95447 (_ BitVec 32)) SeekEntryResult!10397)

(assert (=> b!1395453 (= e!790008 (= (seekEntryOrOpen!0 (select (arr!46080 a!2901) j!112) a!2901 mask!2840) (Found!10397 j!112)))))

(assert (= (and start!119816 res!934696) b!1395450))

(assert (= (and b!1395450 res!934694) b!1395448))

(assert (= (and b!1395448 res!934695) b!1395447))

(assert (= (and b!1395447 res!934693) b!1395451))

(assert (= (and b!1395451 res!934690) b!1395452))

(assert (= (and b!1395452 res!934691) b!1395449))

(assert (= (and b!1395449 res!934692) b!1395453))

(assert (= (and b!1395449 (not res!934689)) b!1395446))

(declare-fun m!1281931 () Bool)

(assert (=> b!1395446 m!1281931))

(declare-fun m!1281933 () Bool)

(assert (=> b!1395446 m!1281933))

(assert (=> b!1395446 m!1281933))

(declare-fun m!1281935 () Bool)

(assert (=> b!1395446 m!1281935))

(assert (=> b!1395446 m!1281935))

(assert (=> b!1395446 m!1281933))

(declare-fun m!1281937 () Bool)

(assert (=> b!1395446 m!1281937))

(declare-fun m!1281939 () Bool)

(assert (=> b!1395449 m!1281939))

(declare-fun m!1281941 () Bool)

(assert (=> b!1395449 m!1281941))

(assert (=> b!1395449 m!1281939))

(declare-fun m!1281943 () Bool)

(assert (=> b!1395449 m!1281943))

(assert (=> b!1395449 m!1281941))

(assert (=> b!1395449 m!1281939))

(declare-fun m!1281945 () Bool)

(assert (=> b!1395449 m!1281945))

(declare-fun m!1281947 () Bool)

(assert (=> b!1395449 m!1281947))

(declare-fun m!1281949 () Bool)

(assert (=> b!1395451 m!1281949))

(declare-fun m!1281951 () Bool)

(assert (=> start!119816 m!1281951))

(declare-fun m!1281953 () Bool)

(assert (=> start!119816 m!1281953))

(declare-fun m!1281955 () Bool)

(assert (=> b!1395452 m!1281955))

(assert (=> b!1395447 m!1281939))

(assert (=> b!1395447 m!1281939))

(declare-fun m!1281957 () Bool)

(assert (=> b!1395447 m!1281957))

(assert (=> b!1395453 m!1281939))

(assert (=> b!1395453 m!1281939))

(declare-fun m!1281959 () Bool)

(assert (=> b!1395453 m!1281959))

(declare-fun m!1281961 () Bool)

(assert (=> b!1395448 m!1281961))

(assert (=> b!1395448 m!1281961))

(declare-fun m!1281963 () Bool)

(assert (=> b!1395448 m!1281963))

(check-sat (not start!119816) (not b!1395452) (not b!1395453) (not b!1395449) (not b!1395447) (not b!1395448) (not b!1395446) (not b!1395451))
