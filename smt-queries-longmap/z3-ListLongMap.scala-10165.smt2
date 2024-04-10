; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119810 () Bool)

(assert start!119810)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95441 0))(
  ( (array!95442 (arr!46077 (Array (_ BitVec 32) (_ BitVec 64))) (size!46627 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95441)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!789974 () Bool)

(declare-fun b!1395370 () Bool)

(declare-datatypes ((SeekEntryResult!10394 0))(
  ( (MissingZero!10394 (index!43947 (_ BitVec 32))) (Found!10394 (index!43948 (_ BitVec 32))) (Intermediate!10394 (undefined!11206 Bool) (index!43949 (_ BitVec 32)) (x!125612 (_ BitVec 32))) (Undefined!10394) (MissingVacant!10394 (index!43950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95441 (_ BitVec 32)) SeekEntryResult!10394)

(assert (=> b!1395370 (= e!789974 (= (seekEntryOrOpen!0 (select (arr!46077 a!2901) j!112) a!2901 mask!2840) (Found!10394 j!112)))))

(declare-fun b!1395371 () Bool)

(declare-fun res!934617 () Bool)

(declare-fun e!789972 () Bool)

(assert (=> b!1395371 (=> (not res!934617) (not e!789972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95441 (_ BitVec 32)) Bool)

(assert (=> b!1395371 (= res!934617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395372 () Bool)

(declare-fun res!934618 () Bool)

(assert (=> b!1395372 (=> (not res!934618) (not e!789972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395372 (= res!934618 (validKeyInArray!0 (select (arr!46077 a!2901) j!112)))))

(declare-fun res!934621 () Bool)

(assert (=> start!119810 (=> (not res!934621) (not e!789972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119810 (= res!934621 (validMask!0 mask!2840))))

(assert (=> start!119810 e!789972))

(assert (=> start!119810 true))

(declare-fun array_inv!35105 (array!95441) Bool)

(assert (=> start!119810 (array_inv!35105 a!2901)))

(declare-fun b!1395373 () Bool)

(declare-fun res!934615 () Bool)

(assert (=> b!1395373 (=> (not res!934615) (not e!789972))))

(declare-datatypes ((List!32596 0))(
  ( (Nil!32593) (Cons!32592 (h!33828 (_ BitVec 64)) (t!47290 List!32596)) )
))
(declare-fun arrayNoDuplicates!0 (array!95441 (_ BitVec 32) List!32596) Bool)

(assert (=> b!1395373 (= res!934615 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32593))))

(declare-fun b!1395374 () Bool)

(declare-fun res!934613 () Bool)

(assert (=> b!1395374 (=> (not res!934613) (not e!789972))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1395374 (= res!934613 (and (= (size!46627 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46627 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46627 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1395375 () Bool)

(declare-fun e!789973 () Bool)

(assert (=> b!1395375 (= e!789972 (not e!789973))))

(declare-fun res!934616 () Bool)

(assert (=> b!1395375 (=> res!934616 e!789973)))

(declare-fun lt!612965 () SeekEntryResult!10394)

(get-info :version)

(assert (=> b!1395375 (= res!934616 (or (not ((_ is Intermediate!10394) lt!612965)) (undefined!11206 lt!612965)))))

(assert (=> b!1395375 e!789974))

(declare-fun res!934614 () Bool)

(assert (=> b!1395375 (=> (not res!934614) (not e!789974))))

(assert (=> b!1395375 (= res!934614 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46792 0))(
  ( (Unit!46793) )
))
(declare-fun lt!612966 () Unit!46792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95441 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46792)

(assert (=> b!1395375 (= lt!612966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95441 (_ BitVec 32)) SeekEntryResult!10394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395375 (= lt!612965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46077 a!2901) j!112) mask!2840) (select (arr!46077 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395376 () Bool)

(declare-fun res!934620 () Bool)

(assert (=> b!1395376 (=> res!934620 e!789973)))

(assert (=> b!1395376 (= res!934620 (= lt!612965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46077 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46077 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95442 (store (arr!46077 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46627 a!2901)) mask!2840)))))

(declare-fun b!1395377 () Bool)

(assert (=> b!1395377 (= e!789973 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun b!1395378 () Bool)

(declare-fun res!934619 () Bool)

(assert (=> b!1395378 (=> (not res!934619) (not e!789972))))

(assert (=> b!1395378 (= res!934619 (validKeyInArray!0 (select (arr!46077 a!2901) i!1037)))))

(assert (= (and start!119810 res!934621) b!1395374))

(assert (= (and b!1395374 res!934613) b!1395378))

(assert (= (and b!1395378 res!934619) b!1395372))

(assert (= (and b!1395372 res!934618) b!1395371))

(assert (= (and b!1395371 res!934617) b!1395373))

(assert (= (and b!1395373 res!934615) b!1395375))

(assert (= (and b!1395375 res!934614) b!1395370))

(assert (= (and b!1395375 (not res!934616)) b!1395376))

(assert (= (and b!1395376 (not res!934620)) b!1395377))

(declare-fun m!1281829 () Bool)

(assert (=> b!1395375 m!1281829))

(declare-fun m!1281831 () Bool)

(assert (=> b!1395375 m!1281831))

(assert (=> b!1395375 m!1281829))

(declare-fun m!1281833 () Bool)

(assert (=> b!1395375 m!1281833))

(assert (=> b!1395375 m!1281831))

(assert (=> b!1395375 m!1281829))

(declare-fun m!1281835 () Bool)

(assert (=> b!1395375 m!1281835))

(declare-fun m!1281837 () Bool)

(assert (=> b!1395375 m!1281837))

(declare-fun m!1281839 () Bool)

(assert (=> b!1395378 m!1281839))

(assert (=> b!1395378 m!1281839))

(declare-fun m!1281841 () Bool)

(assert (=> b!1395378 m!1281841))

(declare-fun m!1281843 () Bool)

(assert (=> b!1395371 m!1281843))

(assert (=> b!1395372 m!1281829))

(assert (=> b!1395372 m!1281829))

(declare-fun m!1281845 () Bool)

(assert (=> b!1395372 m!1281845))

(assert (=> b!1395370 m!1281829))

(assert (=> b!1395370 m!1281829))

(declare-fun m!1281847 () Bool)

(assert (=> b!1395370 m!1281847))

(declare-fun m!1281849 () Bool)

(assert (=> start!119810 m!1281849))

(declare-fun m!1281851 () Bool)

(assert (=> start!119810 m!1281851))

(declare-fun m!1281853 () Bool)

(assert (=> b!1395373 m!1281853))

(declare-fun m!1281855 () Bool)

(assert (=> b!1395376 m!1281855))

(declare-fun m!1281857 () Bool)

(assert (=> b!1395376 m!1281857))

(assert (=> b!1395376 m!1281857))

(declare-fun m!1281859 () Bool)

(assert (=> b!1395376 m!1281859))

(assert (=> b!1395376 m!1281859))

(assert (=> b!1395376 m!1281857))

(declare-fun m!1281861 () Bool)

(assert (=> b!1395376 m!1281861))

(check-sat (not start!119810) (not b!1395378) (not b!1395370) (not b!1395376) (not b!1395371) (not b!1395373) (not b!1395375) (not b!1395372))
(check-sat)
