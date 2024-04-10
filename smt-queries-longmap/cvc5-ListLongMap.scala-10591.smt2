; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124684 () Bool)

(assert start!124684)

(declare-fun b!1444898 () Bool)

(declare-fun res!976836 () Bool)

(declare-fun e!814025 () Bool)

(assert (=> b!1444898 (=> (not res!976836) (not e!814025))))

(declare-datatypes ((array!98132 0))(
  ( (array!98133 (arr!47354 (Array (_ BitVec 32) (_ BitVec 64))) (size!47904 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98132)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444898 (= res!976836 (validKeyInArray!0 (select (arr!47354 a!2862) i!1006)))))

(declare-fun b!1444899 () Bool)

(declare-fun e!814024 () Bool)

(declare-fun e!814023 () Bool)

(assert (=> b!1444899 (= e!814024 e!814023)))

(declare-fun res!976840 () Bool)

(assert (=> b!1444899 (=> (not res!976840) (not e!814023))))

(declare-datatypes ((SeekEntryResult!11606 0))(
  ( (MissingZero!11606 (index!48816 (_ BitVec 32))) (Found!11606 (index!48817 (_ BitVec 32))) (Intermediate!11606 (undefined!12418 Bool) (index!48818 (_ BitVec 32)) (x!130511 (_ BitVec 32))) (Undefined!11606) (MissingVacant!11606 (index!48819 (_ BitVec 32))) )
))
(declare-fun lt!634341 () SeekEntryResult!11606)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98132 (_ BitVec 32)) SeekEntryResult!11606)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444899 (= res!976840 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47354 a!2862) j!93) mask!2687) (select (arr!47354 a!2862) j!93) a!2862 mask!2687) lt!634341))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444899 (= lt!634341 (Intermediate!11606 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444900 () Bool)

(declare-fun res!976835 () Bool)

(assert (=> b!1444900 (=> (not res!976835) (not e!814025))))

(declare-datatypes ((List!33855 0))(
  ( (Nil!33852) (Cons!33851 (h!35201 (_ BitVec 64)) (t!48549 List!33855)) )
))
(declare-fun arrayNoDuplicates!0 (array!98132 (_ BitVec 32) List!33855) Bool)

(assert (=> b!1444900 (= res!976835 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33852))))

(declare-fun b!1444901 () Bool)

(declare-fun res!976837 () Bool)

(assert (=> b!1444901 (=> (not res!976837) (not e!814025))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444901 (= res!976837 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47904 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47904 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47904 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444902 () Bool)

(declare-fun e!814019 () Bool)

(assert (=> b!1444902 (= e!814019 (not true))))

(declare-fun e!814020 () Bool)

(assert (=> b!1444902 e!814020))

(declare-fun res!976846 () Bool)

(assert (=> b!1444902 (=> (not res!976846) (not e!814020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98132 (_ BitVec 32)) Bool)

(assert (=> b!1444902 (= res!976846 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48708 0))(
  ( (Unit!48709) )
))
(declare-fun lt!634339 () Unit!48708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48708)

(assert (=> b!1444902 (= lt!634339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!976845 () Bool)

(assert (=> start!124684 (=> (not res!976845) (not e!814025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124684 (= res!976845 (validMask!0 mask!2687))))

(assert (=> start!124684 e!814025))

(assert (=> start!124684 true))

(declare-fun array_inv!36382 (array!98132) Bool)

(assert (=> start!124684 (array_inv!36382 a!2862)))

(declare-fun b!1444903 () Bool)

(assert (=> b!1444903 (= e!814020 (or (= (select (arr!47354 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47354 a!2862) intermediateBeforeIndex!19) (select (arr!47354 a!2862) j!93))))))

(declare-fun b!1444904 () Bool)

(assert (=> b!1444904 (= e!814023 e!814019)))

(declare-fun res!976839 () Bool)

(assert (=> b!1444904 (=> (not res!976839) (not e!814019))))

(declare-fun lt!634337 () SeekEntryResult!11606)

(assert (=> b!1444904 (= res!976839 (= lt!634337 (Intermediate!11606 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634338 () (_ BitVec 64))

(declare-fun lt!634340 () array!98132)

(assert (=> b!1444904 (= lt!634337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634338 mask!2687) lt!634338 lt!634340 mask!2687))))

(assert (=> b!1444904 (= lt!634338 (select (store (arr!47354 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444905 () Bool)

(declare-fun res!976847 () Bool)

(assert (=> b!1444905 (=> (not res!976847) (not e!814019))))

(declare-fun e!814022 () Bool)

(assert (=> b!1444905 (= res!976847 e!814022)))

(declare-fun c!133542 () Bool)

(assert (=> b!1444905 (= c!133542 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444906 () Bool)

(declare-fun res!976841 () Bool)

(assert (=> b!1444906 (=> (not res!976841) (not e!814025))))

(assert (=> b!1444906 (= res!976841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444907 () Bool)

(assert (=> b!1444907 (= e!814022 (= lt!634337 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634338 lt!634340 mask!2687)))))

(declare-fun b!1444908 () Bool)

(declare-fun res!976838 () Bool)

(assert (=> b!1444908 (=> (not res!976838) (not e!814025))))

(assert (=> b!1444908 (= res!976838 (and (= (size!47904 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47904 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47904 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444909 () Bool)

(declare-fun res!976844 () Bool)

(assert (=> b!1444909 (=> (not res!976844) (not e!814023))))

(assert (=> b!1444909 (= res!976844 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47354 a!2862) j!93) a!2862 mask!2687) lt!634341))))

(declare-fun b!1444910 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98132 (_ BitVec 32)) SeekEntryResult!11606)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98132 (_ BitVec 32)) SeekEntryResult!11606)

(assert (=> b!1444910 (= e!814022 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634338 lt!634340 mask!2687) (seekEntryOrOpen!0 lt!634338 lt!634340 mask!2687)))))

(declare-fun b!1444911 () Bool)

(assert (=> b!1444911 (= e!814025 e!814024)))

(declare-fun res!976848 () Bool)

(assert (=> b!1444911 (=> (not res!976848) (not e!814024))))

(assert (=> b!1444911 (= res!976848 (= (select (store (arr!47354 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444911 (= lt!634340 (array!98133 (store (arr!47354 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47904 a!2862)))))

(declare-fun b!1444912 () Bool)

(declare-fun res!976843 () Bool)

(assert (=> b!1444912 (=> (not res!976843) (not e!814025))))

(assert (=> b!1444912 (= res!976843 (validKeyInArray!0 (select (arr!47354 a!2862) j!93)))))

(declare-fun b!1444913 () Bool)

(declare-fun res!976842 () Bool)

(assert (=> b!1444913 (=> (not res!976842) (not e!814020))))

(assert (=> b!1444913 (= res!976842 (= (seekEntryOrOpen!0 (select (arr!47354 a!2862) j!93) a!2862 mask!2687) (Found!11606 j!93)))))

(declare-fun b!1444914 () Bool)

(declare-fun res!976849 () Bool)

(assert (=> b!1444914 (=> (not res!976849) (not e!814019))))

(assert (=> b!1444914 (= res!976849 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124684 res!976845) b!1444908))

(assert (= (and b!1444908 res!976838) b!1444898))

(assert (= (and b!1444898 res!976836) b!1444912))

(assert (= (and b!1444912 res!976843) b!1444906))

(assert (= (and b!1444906 res!976841) b!1444900))

(assert (= (and b!1444900 res!976835) b!1444901))

(assert (= (and b!1444901 res!976837) b!1444911))

(assert (= (and b!1444911 res!976848) b!1444899))

(assert (= (and b!1444899 res!976840) b!1444909))

(assert (= (and b!1444909 res!976844) b!1444904))

(assert (= (and b!1444904 res!976839) b!1444905))

(assert (= (and b!1444905 c!133542) b!1444907))

(assert (= (and b!1444905 (not c!133542)) b!1444910))

(assert (= (and b!1444905 res!976847) b!1444914))

(assert (= (and b!1444914 res!976849) b!1444902))

(assert (= (and b!1444902 res!976846) b!1444913))

(assert (= (and b!1444913 res!976842) b!1444903))

(declare-fun m!1333897 () Bool)

(assert (=> b!1444913 m!1333897))

(assert (=> b!1444913 m!1333897))

(declare-fun m!1333899 () Bool)

(assert (=> b!1444913 m!1333899))

(declare-fun m!1333901 () Bool)

(assert (=> b!1444898 m!1333901))

(assert (=> b!1444898 m!1333901))

(declare-fun m!1333903 () Bool)

(assert (=> b!1444898 m!1333903))

(declare-fun m!1333905 () Bool)

(assert (=> b!1444900 m!1333905))

(assert (=> b!1444909 m!1333897))

(assert (=> b!1444909 m!1333897))

(declare-fun m!1333907 () Bool)

(assert (=> b!1444909 m!1333907))

(declare-fun m!1333909 () Bool)

(assert (=> b!1444910 m!1333909))

(declare-fun m!1333911 () Bool)

(assert (=> b!1444910 m!1333911))

(declare-fun m!1333913 () Bool)

(assert (=> b!1444907 m!1333913))

(declare-fun m!1333915 () Bool)

(assert (=> b!1444904 m!1333915))

(assert (=> b!1444904 m!1333915))

(declare-fun m!1333917 () Bool)

(assert (=> b!1444904 m!1333917))

(declare-fun m!1333919 () Bool)

(assert (=> b!1444904 m!1333919))

(declare-fun m!1333921 () Bool)

(assert (=> b!1444904 m!1333921))

(declare-fun m!1333923 () Bool)

(assert (=> b!1444902 m!1333923))

(declare-fun m!1333925 () Bool)

(assert (=> b!1444902 m!1333925))

(declare-fun m!1333927 () Bool)

(assert (=> b!1444903 m!1333927))

(assert (=> b!1444903 m!1333897))

(assert (=> b!1444911 m!1333919))

(declare-fun m!1333929 () Bool)

(assert (=> b!1444911 m!1333929))

(declare-fun m!1333931 () Bool)

(assert (=> start!124684 m!1333931))

(declare-fun m!1333933 () Bool)

(assert (=> start!124684 m!1333933))

(declare-fun m!1333935 () Bool)

(assert (=> b!1444906 m!1333935))

(assert (=> b!1444912 m!1333897))

(assert (=> b!1444912 m!1333897))

(declare-fun m!1333937 () Bool)

(assert (=> b!1444912 m!1333937))

(assert (=> b!1444899 m!1333897))

(assert (=> b!1444899 m!1333897))

(declare-fun m!1333939 () Bool)

(assert (=> b!1444899 m!1333939))

(assert (=> b!1444899 m!1333939))

(assert (=> b!1444899 m!1333897))

(declare-fun m!1333941 () Bool)

(assert (=> b!1444899 m!1333941))

(push 1)

