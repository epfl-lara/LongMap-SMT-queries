; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122798 () Bool)

(assert start!122798)

(declare-fun e!804736 () Bool)

(declare-fun b!1423806 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97116 0))(
  ( (array!97117 (arr!46876 (Array (_ BitVec 32) (_ BitVec 64))) (size!47428 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97116)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11188 0))(
  ( (MissingZero!11188 (index!47144 (_ BitVec 32))) (Found!11188 (index!47145 (_ BitVec 32))) (Intermediate!11188 (undefined!12000 Bool) (index!47146 (_ BitVec 32)) (x!128771 (_ BitVec 32))) (Undefined!11188) (MissingVacant!11188 (index!47147 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97116 (_ BitVec 32)) SeekEntryResult!11188)

(assert (=> b!1423806 (= e!804736 (= (seekEntryOrOpen!0 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) (Found!11188 j!81)))))

(declare-fun res!959298 () Bool)

(declare-fun e!804740 () Bool)

(assert (=> start!122798 (=> (not res!959298) (not e!804740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122798 (= res!959298 (validMask!0 mask!2608))))

(assert (=> start!122798 e!804740))

(assert (=> start!122798 true))

(declare-fun array_inv!36109 (array!97116) Bool)

(assert (=> start!122798 (array_inv!36109 a!2831)))

(declare-fun b!1423807 () Bool)

(declare-fun res!959293 () Bool)

(declare-fun e!804737 () Bool)

(assert (=> b!1423807 (=> (not res!959293) (not e!804737))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423807 (= res!959293 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423808 () Bool)

(declare-fun res!959303 () Bool)

(assert (=> b!1423808 (=> (not res!959303) (not e!804740))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423808 (= res!959303 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47428 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47428 a!2831))))))

(declare-fun b!1423809 () Bool)

(declare-fun e!804735 () Bool)

(assert (=> b!1423809 (= e!804735 true)))

(declare-fun lt!627122 () (_ BitVec 64))

(declare-fun lt!627119 () (_ BitVec 32))

(declare-fun lt!627124 () SeekEntryResult!11188)

(declare-fun lt!627121 () array!97116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97116 (_ BitVec 32)) SeekEntryResult!11188)

(assert (=> b!1423809 (= lt!627124 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627119 lt!627122 lt!627121 mask!2608))))

(declare-fun b!1423810 () Bool)

(declare-fun e!804734 () Bool)

(assert (=> b!1423810 (= e!804740 e!804734)))

(declare-fun res!959292 () Bool)

(assert (=> b!1423810 (=> (not res!959292) (not e!804734))))

(declare-fun lt!627125 () SeekEntryResult!11188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423810 (= res!959292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46876 a!2831) j!81) mask!2608) (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!627125))))

(assert (=> b!1423810 (= lt!627125 (Intermediate!11188 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423811 () Bool)

(declare-fun res!959302 () Bool)

(assert (=> b!1423811 (=> (not res!959302) (not e!804740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97116 (_ BitVec 32)) Bool)

(assert (=> b!1423811 (= res!959302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423812 () Bool)

(declare-fun res!959296 () Bool)

(assert (=> b!1423812 (=> res!959296 e!804735)))

(assert (=> b!1423812 (= res!959296 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627119 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!627125)))))

(declare-fun b!1423813 () Bool)

(declare-fun res!959291 () Bool)

(assert (=> b!1423813 (=> (not res!959291) (not e!804737))))

(declare-fun lt!627120 () SeekEntryResult!11188)

(assert (=> b!1423813 (= res!959291 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627122 lt!627121 mask!2608) lt!627120))))

(declare-fun b!1423814 () Bool)

(declare-fun res!959294 () Bool)

(assert (=> b!1423814 (=> (not res!959294) (not e!804740))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423814 (= res!959294 (and (= (size!47428 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47428 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47428 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423815 () Bool)

(declare-fun res!959299 () Bool)

(assert (=> b!1423815 (=> (not res!959299) (not e!804740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423815 (= res!959299 (validKeyInArray!0 (select (arr!46876 a!2831) j!81)))))

(declare-fun b!1423816 () Bool)

(declare-fun res!959305 () Bool)

(assert (=> b!1423816 (=> (not res!959305) (not e!804737))))

(assert (=> b!1423816 (= res!959305 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46876 a!2831) j!81) a!2831 mask!2608) lt!627125))))

(declare-fun b!1423817 () Bool)

(declare-fun res!959301 () Bool)

(assert (=> b!1423817 (=> (not res!959301) (not e!804740))))

(declare-datatypes ((List!33464 0))(
  ( (Nil!33461) (Cons!33460 (h!34762 (_ BitVec 64)) (t!48150 List!33464)) )
))
(declare-fun arrayNoDuplicates!0 (array!97116 (_ BitVec 32) List!33464) Bool)

(assert (=> b!1423817 (= res!959301 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33461))))

(declare-fun b!1423818 () Bool)

(declare-fun e!804738 () Bool)

(assert (=> b!1423818 (= e!804737 (not e!804738))))

(declare-fun res!959297 () Bool)

(assert (=> b!1423818 (=> res!959297 e!804738)))

(assert (=> b!1423818 (= res!959297 (or (= (select (arr!46876 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46876 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46876 a!2831) index!585) (select (arr!46876 a!2831) j!81)) (= (select (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423818 e!804736))

(declare-fun res!959290 () Bool)

(assert (=> b!1423818 (=> (not res!959290) (not e!804736))))

(assert (=> b!1423818 (= res!959290 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48051 0))(
  ( (Unit!48052) )
))
(declare-fun lt!627123 () Unit!48051)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48051)

(assert (=> b!1423818 (= lt!627123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423819 () Bool)

(assert (=> b!1423819 (= e!804738 e!804735)))

(declare-fun res!959304 () Bool)

(assert (=> b!1423819 (=> res!959304 e!804735)))

(assert (=> b!1423819 (= res!959304 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627119 #b00000000000000000000000000000000) (bvsge lt!627119 (size!47428 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423819 (= lt!627119 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423820 () Bool)

(declare-fun res!959300 () Bool)

(assert (=> b!1423820 (=> (not res!959300) (not e!804740))))

(assert (=> b!1423820 (= res!959300 (validKeyInArray!0 (select (arr!46876 a!2831) i!982)))))

(declare-fun b!1423821 () Bool)

(assert (=> b!1423821 (= e!804734 e!804737)))

(declare-fun res!959295 () Bool)

(assert (=> b!1423821 (=> (not res!959295) (not e!804737))))

(assert (=> b!1423821 (= res!959295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627122 mask!2608) lt!627122 lt!627121 mask!2608) lt!627120))))

(assert (=> b!1423821 (= lt!627120 (Intermediate!11188 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423821 (= lt!627122 (select (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423821 (= lt!627121 (array!97117 (store (arr!46876 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47428 a!2831)))))

(assert (= (and start!122798 res!959298) b!1423814))

(assert (= (and b!1423814 res!959294) b!1423820))

(assert (= (and b!1423820 res!959300) b!1423815))

(assert (= (and b!1423815 res!959299) b!1423811))

(assert (= (and b!1423811 res!959302) b!1423817))

(assert (= (and b!1423817 res!959301) b!1423808))

(assert (= (and b!1423808 res!959303) b!1423810))

(assert (= (and b!1423810 res!959292) b!1423821))

(assert (= (and b!1423821 res!959295) b!1423816))

(assert (= (and b!1423816 res!959305) b!1423813))

(assert (= (and b!1423813 res!959291) b!1423807))

(assert (= (and b!1423807 res!959293) b!1423818))

(assert (= (and b!1423818 res!959290) b!1423806))

(assert (= (and b!1423818 (not res!959297)) b!1423819))

(assert (= (and b!1423819 (not res!959304)) b!1423812))

(assert (= (and b!1423812 (not res!959296)) b!1423809))

(declare-fun m!1313883 () Bool)

(assert (=> b!1423819 m!1313883))

(declare-fun m!1313885 () Bool)

(assert (=> b!1423820 m!1313885))

(assert (=> b!1423820 m!1313885))

(declare-fun m!1313887 () Bool)

(assert (=> b!1423820 m!1313887))

(declare-fun m!1313889 () Bool)

(assert (=> b!1423815 m!1313889))

(assert (=> b!1423815 m!1313889))

(declare-fun m!1313891 () Bool)

(assert (=> b!1423815 m!1313891))

(declare-fun m!1313893 () Bool)

(assert (=> b!1423821 m!1313893))

(assert (=> b!1423821 m!1313893))

(declare-fun m!1313895 () Bool)

(assert (=> b!1423821 m!1313895))

(declare-fun m!1313897 () Bool)

(assert (=> b!1423821 m!1313897))

(declare-fun m!1313899 () Bool)

(assert (=> b!1423821 m!1313899))

(assert (=> b!1423810 m!1313889))

(assert (=> b!1423810 m!1313889))

(declare-fun m!1313901 () Bool)

(assert (=> b!1423810 m!1313901))

(assert (=> b!1423810 m!1313901))

(assert (=> b!1423810 m!1313889))

(declare-fun m!1313903 () Bool)

(assert (=> b!1423810 m!1313903))

(assert (=> b!1423816 m!1313889))

(assert (=> b!1423816 m!1313889))

(declare-fun m!1313905 () Bool)

(assert (=> b!1423816 m!1313905))

(declare-fun m!1313907 () Bool)

(assert (=> b!1423813 m!1313907))

(assert (=> b!1423818 m!1313897))

(declare-fun m!1313909 () Bool)

(assert (=> b!1423818 m!1313909))

(declare-fun m!1313911 () Bool)

(assert (=> b!1423818 m!1313911))

(declare-fun m!1313913 () Bool)

(assert (=> b!1423818 m!1313913))

(assert (=> b!1423818 m!1313889))

(declare-fun m!1313915 () Bool)

(assert (=> b!1423818 m!1313915))

(assert (=> b!1423806 m!1313889))

(assert (=> b!1423806 m!1313889))

(declare-fun m!1313917 () Bool)

(assert (=> b!1423806 m!1313917))

(declare-fun m!1313919 () Bool)

(assert (=> start!122798 m!1313919))

(declare-fun m!1313921 () Bool)

(assert (=> start!122798 m!1313921))

(declare-fun m!1313923 () Bool)

(assert (=> b!1423811 m!1313923))

(declare-fun m!1313925 () Bool)

(assert (=> b!1423817 m!1313925))

(declare-fun m!1313927 () Bool)

(assert (=> b!1423809 m!1313927))

(assert (=> b!1423812 m!1313889))

(assert (=> b!1423812 m!1313889))

(declare-fun m!1313929 () Bool)

(assert (=> b!1423812 m!1313929))

(check-sat (not b!1423820) (not b!1423811) (not b!1423816) (not b!1423809) (not b!1423818) (not b!1423813) (not b!1423819) (not b!1423817) (not b!1423810) (not start!122798) (not b!1423821) (not b!1423806) (not b!1423812) (not b!1423815))
(check-sat)
