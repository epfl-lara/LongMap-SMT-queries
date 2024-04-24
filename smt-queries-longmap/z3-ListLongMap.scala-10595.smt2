; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124926 () Bool)

(assert start!124926)

(declare-fun b!1446837 () Bool)

(declare-fun e!815110 () Bool)

(declare-fun e!815113 () Bool)

(assert (=> b!1446837 (= e!815110 e!815113)))

(declare-fun res!977884 () Bool)

(assert (=> b!1446837 (=> (not res!977884) (not e!815113))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11568 0))(
  ( (MissingZero!11568 (index!48664 (_ BitVec 32))) (Found!11568 (index!48665 (_ BitVec 32))) (Intermediate!11568 (undefined!12380 Bool) (index!48666 (_ BitVec 32)) (x!130529 (_ BitVec 32))) (Undefined!11568) (MissingVacant!11568 (index!48667 (_ BitVec 32))) )
))
(declare-fun lt!634996 () SeekEntryResult!11568)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446837 (= res!977884 (= lt!634996 (Intermediate!11568 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634998 () (_ BitVec 64))

(declare-datatypes ((array!98269 0))(
  ( (array!98270 (arr!47419 (Array (_ BitVec 32) (_ BitVec 64))) (size!47970 (_ BitVec 32))) )
))
(declare-fun lt!634997 () array!98269)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98269 (_ BitVec 32)) SeekEntryResult!11568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446837 (= lt!634996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634998 mask!2687) lt!634998 lt!634997 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98269)

(assert (=> b!1446837 (= lt!634998 (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446838 () Bool)

(declare-fun res!977882 () Bool)

(declare-fun e!815114 () Bool)

(assert (=> b!1446838 (=> (not res!977882) (not e!815114))))

(declare-datatypes ((List!33907 0))(
  ( (Nil!33904) (Cons!33903 (h!35264 (_ BitVec 64)) (t!48593 List!33907)) )
))
(declare-fun arrayNoDuplicates!0 (array!98269 (_ BitVec 32) List!33907) Bool)

(assert (=> b!1446838 (= res!977882 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33904))))

(declare-fun b!1446839 () Bool)

(declare-fun res!977881 () Bool)

(assert (=> b!1446839 (=> (not res!977881) (not e!815114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446839 (= res!977881 (validKeyInArray!0 (select (arr!47419 a!2862) j!93)))))

(declare-fun b!1446840 () Bool)

(declare-fun res!977879 () Bool)

(assert (=> b!1446840 (=> (not res!977879) (not e!815114))))

(assert (=> b!1446840 (= res!977879 (and (= (size!47970 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47970 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47970 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446841 () Bool)

(declare-fun res!977877 () Bool)

(assert (=> b!1446841 (=> (not res!977877) (not e!815113))))

(declare-fun e!815111 () Bool)

(assert (=> b!1446841 (= res!977877 e!815111)))

(declare-fun c!133999 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1446841 (= c!133999 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446842 () Bool)

(declare-fun res!977891 () Bool)

(assert (=> b!1446842 (=> (not res!977891) (not e!815114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98269 (_ BitVec 32)) Bool)

(assert (=> b!1446842 (= res!977891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1446843 () Bool)

(assert (=> b!1446843 (= e!815111 (= lt!634996 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634998 lt!634997 mask!2687)))))

(declare-fun b!1446844 () Bool)

(declare-fun res!977883 () Bool)

(declare-fun e!815112 () Bool)

(assert (=> b!1446844 (=> (not res!977883) (not e!815112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98269 (_ BitVec 32)) SeekEntryResult!11568)

(assert (=> b!1446844 (= res!977883 (= (seekEntryOrOpen!0 (select (arr!47419 a!2862) j!93) a!2862 mask!2687) (Found!11568 j!93)))))

(declare-fun b!1446845 () Bool)

(declare-fun res!977886 () Bool)

(assert (=> b!1446845 (=> (not res!977886) (not e!815114))))

(assert (=> b!1446845 (= res!977886 (validKeyInArray!0 (select (arr!47419 a!2862) i!1006)))))

(declare-fun b!1446846 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98269 (_ BitVec 32)) SeekEntryResult!11568)

(assert (=> b!1446846 (= e!815111 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634998 lt!634997 mask!2687) (seekEntryOrOpen!0 lt!634998 lt!634997 mask!2687)))))

(declare-fun b!1446847 () Bool)

(declare-fun e!815109 () Bool)

(assert (=> b!1446847 (= e!815114 e!815109)))

(declare-fun res!977885 () Bool)

(assert (=> b!1446847 (=> (not res!977885) (not e!815109))))

(assert (=> b!1446847 (= res!977885 (= (select (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446847 (= lt!634997 (array!98270 (store (arr!47419 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47970 a!2862)))))

(declare-fun b!1446848 () Bool)

(declare-fun res!977887 () Bool)

(assert (=> b!1446848 (=> (not res!977887) (not e!815113))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446848 (= res!977887 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446849 () Bool)

(declare-fun res!977890 () Bool)

(assert (=> b!1446849 (=> (not res!977890) (not e!815110))))

(declare-fun lt!634999 () SeekEntryResult!11568)

(assert (=> b!1446849 (= res!977890 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!634999))))

(declare-fun res!977878 () Bool)

(assert (=> start!124926 (=> (not res!977878) (not e!815114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124926 (= res!977878 (validMask!0 mask!2687))))

(assert (=> start!124926 e!815114))

(assert (=> start!124926 true))

(declare-fun array_inv!36700 (array!98269) Bool)

(assert (=> start!124926 (array_inv!36700 a!2862)))

(declare-fun b!1446850 () Bool)

(declare-fun res!977880 () Bool)

(assert (=> b!1446850 (=> (not res!977880) (not e!815114))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1446850 (= res!977880 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47970 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47970 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47970 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446851 () Bool)

(assert (=> b!1446851 (= e!815109 e!815110)))

(declare-fun res!977888 () Bool)

(assert (=> b!1446851 (=> (not res!977888) (not e!815110))))

(assert (=> b!1446851 (= res!977888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47419 a!2862) j!93) mask!2687) (select (arr!47419 a!2862) j!93) a!2862 mask!2687) lt!634999))))

(assert (=> b!1446851 (= lt!634999 (Intermediate!11568 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446852 () Bool)

(assert (=> b!1446852 (= e!815113 (not true))))

(assert (=> b!1446852 e!815112))

(declare-fun res!977889 () Bool)

(assert (=> b!1446852 (=> (not res!977889) (not e!815112))))

(assert (=> b!1446852 (= res!977889 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48665 0))(
  ( (Unit!48666) )
))
(declare-fun lt!634995 () Unit!48665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48665)

(assert (=> b!1446852 (= lt!634995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446853 () Bool)

(assert (=> b!1446853 (= e!815112 (or (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47419 a!2862) intermediateBeforeIndex!19) (select (arr!47419 a!2862) j!93))))))

(assert (= (and start!124926 res!977878) b!1446840))

(assert (= (and b!1446840 res!977879) b!1446845))

(assert (= (and b!1446845 res!977886) b!1446839))

(assert (= (and b!1446839 res!977881) b!1446842))

(assert (= (and b!1446842 res!977891) b!1446838))

(assert (= (and b!1446838 res!977882) b!1446850))

(assert (= (and b!1446850 res!977880) b!1446847))

(assert (= (and b!1446847 res!977885) b!1446851))

(assert (= (and b!1446851 res!977888) b!1446849))

(assert (= (and b!1446849 res!977890) b!1446837))

(assert (= (and b!1446837 res!977884) b!1446841))

(assert (= (and b!1446841 c!133999) b!1446843))

(assert (= (and b!1446841 (not c!133999)) b!1446846))

(assert (= (and b!1446841 res!977877) b!1446848))

(assert (= (and b!1446848 res!977887) b!1446852))

(assert (= (and b!1446852 res!977889) b!1446844))

(assert (= (and b!1446844 res!977883) b!1446853))

(declare-fun m!1335901 () Bool)

(assert (=> b!1446845 m!1335901))

(assert (=> b!1446845 m!1335901))

(declare-fun m!1335903 () Bool)

(assert (=> b!1446845 m!1335903))

(declare-fun m!1335905 () Bool)

(assert (=> b!1446847 m!1335905))

(declare-fun m!1335907 () Bool)

(assert (=> b!1446847 m!1335907))

(declare-fun m!1335909 () Bool)

(assert (=> b!1446838 m!1335909))

(declare-fun m!1335911 () Bool)

(assert (=> b!1446852 m!1335911))

(declare-fun m!1335913 () Bool)

(assert (=> b!1446852 m!1335913))

(declare-fun m!1335915 () Bool)

(assert (=> b!1446844 m!1335915))

(assert (=> b!1446844 m!1335915))

(declare-fun m!1335917 () Bool)

(assert (=> b!1446844 m!1335917))

(declare-fun m!1335919 () Bool)

(assert (=> b!1446843 m!1335919))

(assert (=> b!1446851 m!1335915))

(assert (=> b!1446851 m!1335915))

(declare-fun m!1335921 () Bool)

(assert (=> b!1446851 m!1335921))

(assert (=> b!1446851 m!1335921))

(assert (=> b!1446851 m!1335915))

(declare-fun m!1335923 () Bool)

(assert (=> b!1446851 m!1335923))

(declare-fun m!1335925 () Bool)

(assert (=> start!124926 m!1335925))

(declare-fun m!1335927 () Bool)

(assert (=> start!124926 m!1335927))

(declare-fun m!1335929 () Bool)

(assert (=> b!1446853 m!1335929))

(assert (=> b!1446853 m!1335915))

(declare-fun m!1335931 () Bool)

(assert (=> b!1446842 m!1335931))

(assert (=> b!1446849 m!1335915))

(assert (=> b!1446849 m!1335915))

(declare-fun m!1335933 () Bool)

(assert (=> b!1446849 m!1335933))

(declare-fun m!1335935 () Bool)

(assert (=> b!1446837 m!1335935))

(assert (=> b!1446837 m!1335935))

(declare-fun m!1335937 () Bool)

(assert (=> b!1446837 m!1335937))

(assert (=> b!1446837 m!1335905))

(declare-fun m!1335939 () Bool)

(assert (=> b!1446837 m!1335939))

(assert (=> b!1446839 m!1335915))

(assert (=> b!1446839 m!1335915))

(declare-fun m!1335941 () Bool)

(assert (=> b!1446839 m!1335941))

(declare-fun m!1335943 () Bool)

(assert (=> b!1446846 m!1335943))

(declare-fun m!1335945 () Bool)

(assert (=> b!1446846 m!1335945))

(check-sat (not b!1446844) (not b!1446838) (not b!1446845) (not b!1446842) (not b!1446849) (not b!1446851) (not start!124926) (not b!1446852) (not b!1446843) (not b!1446837) (not b!1446839) (not b!1446846))
(check-sat)
