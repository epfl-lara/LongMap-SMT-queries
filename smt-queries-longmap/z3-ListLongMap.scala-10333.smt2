; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121478 () Bool)

(assert start!121478)

(declare-fun b!1411471 () Bool)

(declare-fun e!798749 () Bool)

(assert (=> b!1411471 (= e!798749 true)))

(declare-datatypes ((SeekEntryResult!10892 0))(
  ( (MissingZero!10892 (index!45945 (_ BitVec 32))) (Found!10892 (index!45946 (_ BitVec 32))) (Intermediate!10892 (undefined!11704 Bool) (index!45947 (_ BitVec 32)) (x!127532 (_ BitVec 32))) (Undefined!10892) (MissingVacant!10892 (index!45948 (_ BitVec 32))) )
))
(declare-fun lt!621604 () SeekEntryResult!10892)

(declare-datatypes ((array!96432 0))(
  ( (array!96433 (arr!46555 (Array (_ BitVec 32) (_ BitVec 64))) (size!47107 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96432)

(declare-fun lt!621603 () SeekEntryResult!10892)

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411471 (and (not (undefined!11704 lt!621603)) (= (index!45947 lt!621603) i!1037) (bvslt (x!127532 lt!621603) (x!127532 lt!621604)) (= (select (store (arr!46555 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45947 lt!621603)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!621600 () (_ BitVec 32))

(declare-datatypes ((Unit!47601 0))(
  ( (Unit!47602) )
))
(declare-fun lt!621601 () Unit!47601)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47601)

(assert (=> b!1411471 (= lt!621601 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!621600 (x!127532 lt!621604) (index!45947 lt!621604) (x!127532 lt!621603) (index!45947 lt!621603) (undefined!11704 lt!621603) mask!2840))))

(declare-fun res!948751 () Bool)

(declare-fun e!798748 () Bool)

(assert (=> start!121478 (=> (not res!948751) (not e!798748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121478 (= res!948751 (validMask!0 mask!2840))))

(assert (=> start!121478 e!798748))

(assert (=> start!121478 true))

(declare-fun array_inv!35788 (array!96432) Bool)

(assert (=> start!121478 (array_inv!35788 a!2901)))

(declare-fun b!1411472 () Bool)

(declare-fun res!948755 () Bool)

(assert (=> b!1411472 (=> (not res!948755) (not e!798748))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411472 (= res!948755 (validKeyInArray!0 (select (arr!46555 a!2901) i!1037)))))

(declare-fun e!798750 () Bool)

(declare-fun b!1411473 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96432 (_ BitVec 32)) SeekEntryResult!10892)

(assert (=> b!1411473 (= e!798750 (= (seekEntryOrOpen!0 (select (arr!46555 a!2901) j!112) a!2901 mask!2840) (Found!10892 j!112)))))

(declare-fun b!1411474 () Bool)

(declare-fun res!948757 () Bool)

(assert (=> b!1411474 (=> (not res!948757) (not e!798748))))

(declare-datatypes ((List!33152 0))(
  ( (Nil!33149) (Cons!33148 (h!34420 (_ BitVec 64)) (t!47838 List!33152)) )
))
(declare-fun arrayNoDuplicates!0 (array!96432 (_ BitVec 32) List!33152) Bool)

(assert (=> b!1411474 (= res!948757 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33149))))

(declare-fun b!1411475 () Bool)

(declare-fun e!798752 () Bool)

(assert (=> b!1411475 (= e!798752 e!798749)))

(declare-fun res!948750 () Bool)

(assert (=> b!1411475 (=> res!948750 e!798749)))

(get-info :version)

(assert (=> b!1411475 (= res!948750 (or (= lt!621604 lt!621603) (not ((_ is Intermediate!10892) lt!621603))))))

(declare-fun lt!621602 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96432 (_ BitVec 32)) SeekEntryResult!10892)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411475 (= lt!621603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621602 mask!2840) lt!621602 (array!96433 (store (arr!46555 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47107 a!2901)) mask!2840))))

(assert (=> b!1411475 (= lt!621602 (select (store (arr!46555 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1411476 () Bool)

(declare-fun res!948753 () Bool)

(assert (=> b!1411476 (=> (not res!948753) (not e!798748))))

(assert (=> b!1411476 (= res!948753 (and (= (size!47107 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47107 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47107 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411477 () Bool)

(assert (=> b!1411477 (= e!798748 (not e!798752))))

(declare-fun res!948749 () Bool)

(assert (=> b!1411477 (=> res!948749 e!798752)))

(assert (=> b!1411477 (= res!948749 (or (not ((_ is Intermediate!10892) lt!621604)) (undefined!11704 lt!621604)))))

(assert (=> b!1411477 e!798750))

(declare-fun res!948752 () Bool)

(assert (=> b!1411477 (=> (not res!948752) (not e!798750))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96432 (_ BitVec 32)) Bool)

(assert (=> b!1411477 (= res!948752 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!621605 () Unit!47601)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47601)

(assert (=> b!1411477 (= lt!621605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411477 (= lt!621604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621600 (select (arr!46555 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411477 (= lt!621600 (toIndex!0 (select (arr!46555 a!2901) j!112) mask!2840))))

(declare-fun b!1411478 () Bool)

(declare-fun res!948754 () Bool)

(assert (=> b!1411478 (=> (not res!948754) (not e!798748))))

(assert (=> b!1411478 (= res!948754 (validKeyInArray!0 (select (arr!46555 a!2901) j!112)))))

(declare-fun b!1411479 () Bool)

(declare-fun res!948756 () Bool)

(assert (=> b!1411479 (=> (not res!948756) (not e!798748))))

(assert (=> b!1411479 (= res!948756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121478 res!948751) b!1411476))

(assert (= (and b!1411476 res!948753) b!1411472))

(assert (= (and b!1411472 res!948755) b!1411478))

(assert (= (and b!1411478 res!948754) b!1411479))

(assert (= (and b!1411479 res!948756) b!1411474))

(assert (= (and b!1411474 res!948757) b!1411477))

(assert (= (and b!1411477 res!948752) b!1411473))

(assert (= (and b!1411477 (not res!948749)) b!1411475))

(assert (= (and b!1411475 (not res!948750)) b!1411471))

(declare-fun m!1300909 () Bool)

(assert (=> b!1411477 m!1300909))

(declare-fun m!1300911 () Bool)

(assert (=> b!1411477 m!1300911))

(assert (=> b!1411477 m!1300909))

(declare-fun m!1300913 () Bool)

(assert (=> b!1411477 m!1300913))

(declare-fun m!1300915 () Bool)

(assert (=> b!1411477 m!1300915))

(assert (=> b!1411477 m!1300909))

(declare-fun m!1300917 () Bool)

(assert (=> b!1411477 m!1300917))

(assert (=> b!1411473 m!1300909))

(assert (=> b!1411473 m!1300909))

(declare-fun m!1300919 () Bool)

(assert (=> b!1411473 m!1300919))

(declare-fun m!1300921 () Bool)

(assert (=> b!1411475 m!1300921))

(declare-fun m!1300923 () Bool)

(assert (=> b!1411475 m!1300923))

(assert (=> b!1411475 m!1300921))

(declare-fun m!1300925 () Bool)

(assert (=> b!1411475 m!1300925))

(declare-fun m!1300927 () Bool)

(assert (=> b!1411475 m!1300927))

(declare-fun m!1300929 () Bool)

(assert (=> start!121478 m!1300929))

(declare-fun m!1300931 () Bool)

(assert (=> start!121478 m!1300931))

(assert (=> b!1411478 m!1300909))

(assert (=> b!1411478 m!1300909))

(declare-fun m!1300933 () Bool)

(assert (=> b!1411478 m!1300933))

(assert (=> b!1411471 m!1300923))

(declare-fun m!1300935 () Bool)

(assert (=> b!1411471 m!1300935))

(declare-fun m!1300937 () Bool)

(assert (=> b!1411471 m!1300937))

(declare-fun m!1300939 () Bool)

(assert (=> b!1411472 m!1300939))

(assert (=> b!1411472 m!1300939))

(declare-fun m!1300941 () Bool)

(assert (=> b!1411472 m!1300941))

(declare-fun m!1300943 () Bool)

(assert (=> b!1411479 m!1300943))

(declare-fun m!1300945 () Bool)

(assert (=> b!1411474 m!1300945))

(check-sat (not b!1411477) (not b!1411472) (not b!1411479) (not start!121478) (not b!1411478) (not b!1411471) (not b!1411473) (not b!1411474) (not b!1411475))
(check-sat)
