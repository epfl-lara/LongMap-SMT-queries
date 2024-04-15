; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119882 () Bool)

(assert start!119882)

(declare-fun b!1395825 () Bool)

(declare-fun res!934959 () Bool)

(declare-fun e!790234 () Bool)

(assert (=> b!1395825 (=> (not res!934959) (not e!790234))))

(declare-datatypes ((array!95415 0))(
  ( (array!95416 (arr!46063 (Array (_ BitVec 32) (_ BitVec 64))) (size!46615 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95415)

(declare-datatypes ((List!32660 0))(
  ( (Nil!32657) (Cons!32656 (h!33895 (_ BitVec 64)) (t!47346 List!32660)) )
))
(declare-fun arrayNoDuplicates!0 (array!95415 (_ BitVec 32) List!32660) Bool)

(assert (=> b!1395825 (= res!934959 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32657))))

(declare-fun b!1395826 () Bool)

(declare-fun res!934962 () Bool)

(declare-fun e!790238 () Bool)

(assert (=> b!1395826 (=> res!934962 e!790238)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!612991 () (_ BitVec 32))

(assert (=> b!1395826 (= res!934962 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt lt!612991 #b00000000000000000000000000000000) (bvsge lt!612991 (bvadd #b00000000000000000000000000000001 mask!2840))))))

(declare-fun b!1395827 () Bool)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395827 (= e!790238 (validKeyInArray!0 (select (store (arr!46063 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun b!1395828 () Bool)

(declare-fun res!934957 () Bool)

(assert (=> b!1395828 (=> (not res!934957) (not e!790234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95415 (_ BitVec 32)) Bool)

(assert (=> b!1395828 (= res!934957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395829 () Bool)

(declare-fun res!934961 () Bool)

(assert (=> b!1395829 (=> (not res!934961) (not e!790234))))

(assert (=> b!1395829 (= res!934961 (validKeyInArray!0 (select (arr!46063 a!2901) i!1037)))))

(declare-fun b!1395830 () Bool)

(declare-fun e!790237 () Bool)

(assert (=> b!1395830 (= e!790234 (not e!790237))))

(declare-fun res!934963 () Bool)

(assert (=> b!1395830 (=> res!934963 e!790237)))

(declare-datatypes ((SeekEntryResult!10406 0))(
  ( (MissingZero!10406 (index!43995 (_ BitVec 32))) (Found!10406 (index!43996 (_ BitVec 32))) (Intermediate!10406 (undefined!11218 Bool) (index!43997 (_ BitVec 32)) (x!125659 (_ BitVec 32))) (Undefined!10406) (MissingVacant!10406 (index!43998 (_ BitVec 32))) )
))
(declare-fun lt!612990 () SeekEntryResult!10406)

(get-info :version)

(assert (=> b!1395830 (= res!934963 (or (not ((_ is Intermediate!10406) lt!612990)) (undefined!11218 lt!612990)))))

(declare-fun e!790236 () Bool)

(assert (=> b!1395830 e!790236))

(declare-fun res!934960 () Bool)

(assert (=> b!1395830 (=> (not res!934960) (not e!790236))))

(assert (=> b!1395830 (= res!934960 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46659 0))(
  ( (Unit!46660) )
))
(declare-fun lt!612992 () Unit!46659)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46659)

(assert (=> b!1395830 (= lt!612992 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95415 (_ BitVec 32)) SeekEntryResult!10406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395830 (= lt!612990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46063 a!2901) j!112) mask!2840) (select (arr!46063 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395831 () Bool)

(declare-fun res!934955 () Bool)

(assert (=> b!1395831 (=> (not res!934955) (not e!790234))))

(assert (=> b!1395831 (= res!934955 (and (= (size!46615 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46615 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46615 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!934954 () Bool)

(assert (=> start!119882 (=> (not res!934954) (not e!790234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119882 (= res!934954 (validMask!0 mask!2840))))

(assert (=> start!119882 e!790234))

(assert (=> start!119882 true))

(declare-fun array_inv!35296 (array!95415) Bool)

(assert (=> start!119882 (array_inv!35296 a!2901)))

(declare-fun b!1395832 () Bool)

(assert (=> b!1395832 (= e!790237 e!790238)))

(declare-fun res!934956 () Bool)

(assert (=> b!1395832 (=> res!934956 e!790238)))

(assert (=> b!1395832 (= res!934956 (= lt!612990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612991 (select (store (arr!46063 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95416 (store (arr!46063 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46615 a!2901)) mask!2840)))))

(assert (=> b!1395832 (= lt!612991 (toIndex!0 (select (store (arr!46063 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1395833 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95415 (_ BitVec 32)) SeekEntryResult!10406)

(assert (=> b!1395833 (= e!790236 (= (seekEntryOrOpen!0 (select (arr!46063 a!2901) j!112) a!2901 mask!2840) (Found!10406 j!112)))))

(declare-fun b!1395834 () Bool)

(declare-fun res!934958 () Bool)

(assert (=> b!1395834 (=> (not res!934958) (not e!790234))))

(assert (=> b!1395834 (= res!934958 (validKeyInArray!0 (select (arr!46063 a!2901) j!112)))))

(assert (= (and start!119882 res!934954) b!1395831))

(assert (= (and b!1395831 res!934955) b!1395829))

(assert (= (and b!1395829 res!934961) b!1395834))

(assert (= (and b!1395834 res!934958) b!1395828))

(assert (= (and b!1395828 res!934957) b!1395825))

(assert (= (and b!1395825 res!934959) b!1395830))

(assert (= (and b!1395830 res!934960) b!1395833))

(assert (= (and b!1395830 (not res!934963)) b!1395832))

(assert (= (and b!1395832 (not res!934956)) b!1395826))

(assert (= (and b!1395826 (not res!934962)) b!1395827))

(declare-fun m!1281817 () Bool)

(assert (=> b!1395829 m!1281817))

(assert (=> b!1395829 m!1281817))

(declare-fun m!1281819 () Bool)

(assert (=> b!1395829 m!1281819))

(declare-fun m!1281821 () Bool)

(assert (=> b!1395832 m!1281821))

(declare-fun m!1281823 () Bool)

(assert (=> b!1395832 m!1281823))

(assert (=> b!1395832 m!1281823))

(declare-fun m!1281825 () Bool)

(assert (=> b!1395832 m!1281825))

(assert (=> b!1395832 m!1281823))

(declare-fun m!1281827 () Bool)

(assert (=> b!1395832 m!1281827))

(declare-fun m!1281829 () Bool)

(assert (=> b!1395830 m!1281829))

(declare-fun m!1281831 () Bool)

(assert (=> b!1395830 m!1281831))

(assert (=> b!1395830 m!1281829))

(declare-fun m!1281833 () Bool)

(assert (=> b!1395830 m!1281833))

(assert (=> b!1395830 m!1281831))

(assert (=> b!1395830 m!1281829))

(declare-fun m!1281835 () Bool)

(assert (=> b!1395830 m!1281835))

(declare-fun m!1281837 () Bool)

(assert (=> b!1395830 m!1281837))

(assert (=> b!1395834 m!1281829))

(assert (=> b!1395834 m!1281829))

(declare-fun m!1281839 () Bool)

(assert (=> b!1395834 m!1281839))

(declare-fun m!1281841 () Bool)

(assert (=> b!1395825 m!1281841))

(declare-fun m!1281843 () Bool)

(assert (=> b!1395828 m!1281843))

(declare-fun m!1281845 () Bool)

(assert (=> start!119882 m!1281845))

(declare-fun m!1281847 () Bool)

(assert (=> start!119882 m!1281847))

(assert (=> b!1395827 m!1281821))

(assert (=> b!1395827 m!1281823))

(assert (=> b!1395827 m!1281823))

(declare-fun m!1281849 () Bool)

(assert (=> b!1395827 m!1281849))

(assert (=> b!1395833 m!1281829))

(assert (=> b!1395833 m!1281829))

(declare-fun m!1281851 () Bool)

(assert (=> b!1395833 m!1281851))

(check-sat (not b!1395834) (not b!1395828) (not b!1395827) (not b!1395830) (not b!1395825) (not b!1395829) (not b!1395833) (not b!1395832) (not start!119882))
(check-sat)
