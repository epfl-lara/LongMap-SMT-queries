; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124870 () Bool)

(assert start!124870)

(declare-fun b!1450750 () Bool)

(declare-fun e!816884 () Bool)

(declare-fun e!816882 () Bool)

(assert (=> b!1450750 (= e!816884 (not e!816882))))

(declare-fun res!982161 () Bool)

(assert (=> b!1450750 (=> res!982161 e!816882)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98296 0))(
  ( (array!98297 (arr!47437 (Array (_ BitVec 32) (_ BitVec 64))) (size!47989 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98296)

(assert (=> b!1450750 (= res!982161 (or (and (= (select (arr!47437 a!2862) index!646) (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47437 a!2862) index!646) (select (arr!47437 a!2862) j!93))) (not (= (select (arr!47437 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816881 () Bool)

(assert (=> b!1450750 e!816881))

(declare-fun res!982159 () Bool)

(assert (=> b!1450750 (=> (not res!982159) (not e!816881))))

(declare-datatypes ((SeekEntryResult!11714 0))(
  ( (MissingZero!11714 (index!49248 (_ BitVec 32))) (Found!11714 (index!49249 (_ BitVec 32))) (Intermediate!11714 (undefined!12526 Bool) (index!49250 (_ BitVec 32)) (x!130902 (_ BitVec 32))) (Undefined!11714) (MissingVacant!11714 (index!49251 (_ BitVec 32))) )
))
(declare-fun lt!636262 () SeekEntryResult!11714)

(declare-fun lt!636261 () SeekEntryResult!11714)

(assert (=> b!1450750 (= res!982159 (and (= lt!636261 lt!636262) (or (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47437 a!2862) intermediateBeforeIndex!19) (select (arr!47437 a!2862) j!93)))))))

(assert (=> b!1450750 (= lt!636262 (Found!11714 j!93))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98296 (_ BitVec 32)) SeekEntryResult!11714)

(assert (=> b!1450750 (= lt!636261 (seekEntryOrOpen!0 (select (arr!47437 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98296 (_ BitVec 32)) Bool)

(assert (=> b!1450750 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48765 0))(
  ( (Unit!48766) )
))
(declare-fun lt!636263 () Unit!48765)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48765)

(assert (=> b!1450750 (= lt!636263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450751 () Bool)

(declare-fun res!982167 () Bool)

(assert (=> b!1450751 (=> res!982167 e!816882)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98296 (_ BitVec 32)) SeekEntryResult!11714)

(assert (=> b!1450751 (= res!982167 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!636262)))))

(declare-fun b!1450752 () Bool)

(declare-fun res!982168 () Bool)

(declare-fun e!816891 () Bool)

(assert (=> b!1450752 (=> (not res!982168) (not e!816891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450752 (= res!982168 (validKeyInArray!0 (select (arr!47437 a!2862) i!1006)))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!816887 () Bool)

(declare-fun b!1450753 () Bool)

(assert (=> b!1450753 (= e!816887 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!982164 () Bool)

(assert (=> start!124870 (=> (not res!982164) (not e!816891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124870 (= res!982164 (validMask!0 mask!2687))))

(assert (=> start!124870 e!816891))

(assert (=> start!124870 true))

(declare-fun array_inv!36670 (array!98296) Bool)

(assert (=> start!124870 (array_inv!36670 a!2862)))

(declare-fun b!1450754 () Bool)

(declare-fun e!816883 () Bool)

(assert (=> b!1450754 (= e!816891 e!816883)))

(declare-fun res!982170 () Bool)

(assert (=> b!1450754 (=> (not res!982170) (not e!816883))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450754 (= res!982170 (= (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636265 () array!98296)

(assert (=> b!1450754 (= lt!636265 (array!98297 (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47989 a!2862)))))

(declare-fun b!1450755 () Bool)

(declare-fun e!816885 () Bool)

(declare-fun lt!636260 () (_ BitVec 64))

(assert (=> b!1450755 (= e!816885 (validKeyInArray!0 lt!636260))))

(declare-fun b!1450756 () Bool)

(declare-fun res!982166 () Bool)

(assert (=> b!1450756 (=> (not res!982166) (not e!816891))))

(assert (=> b!1450756 (= res!982166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450757 () Bool)

(declare-fun res!982173 () Bool)

(assert (=> b!1450757 (=> (not res!982173) (not e!816891))))

(assert (=> b!1450757 (= res!982173 (and (= (size!47989 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47989 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47989 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450758 () Bool)

(declare-fun res!982162 () Bool)

(assert (=> b!1450758 (=> (not res!982162) (not e!816891))))

(declare-datatypes ((List!34016 0))(
  ( (Nil!34013) (Cons!34012 (h!35362 (_ BitVec 64)) (t!48702 List!34016)) )
))
(declare-fun arrayNoDuplicates!0 (array!98296 (_ BitVec 32) List!34016) Bool)

(assert (=> b!1450758 (= res!982162 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34013))))

(declare-fun b!1450759 () Bool)

(declare-fun res!982174 () Bool)

(declare-fun e!816886 () Bool)

(assert (=> b!1450759 (=> (not res!982174) (not e!816886))))

(declare-fun lt!636266 () SeekEntryResult!11714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98296 (_ BitVec 32)) SeekEntryResult!11714)

(assert (=> b!1450759 (= res!982174 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!636266))))

(declare-fun b!1450760 () Bool)

(assert (=> b!1450760 (= e!816886 e!816884)))

(declare-fun res!982165 () Bool)

(assert (=> b!1450760 (=> (not res!982165) (not e!816884))))

(declare-fun lt!636267 () SeekEntryResult!11714)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450760 (= res!982165 (= lt!636267 (Intermediate!11714 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450760 (= lt!636267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636260 mask!2687) lt!636260 lt!636265 mask!2687))))

(assert (=> b!1450760 (= lt!636260 (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450761 () Bool)

(declare-fun res!982158 () Bool)

(assert (=> b!1450761 (=> (not res!982158) (not e!816891))))

(assert (=> b!1450761 (= res!982158 (validKeyInArray!0 (select (arr!47437 a!2862) j!93)))))

(declare-fun b!1450762 () Bool)

(declare-fun res!982172 () Bool)

(assert (=> b!1450762 (=> (not res!982172) (not e!816884))))

(declare-fun e!816890 () Bool)

(assert (=> b!1450762 (= res!982172 e!816890)))

(declare-fun c!133810 () Bool)

(assert (=> b!1450762 (= c!133810 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450763 () Bool)

(declare-fun e!816889 () Bool)

(assert (=> b!1450763 (= e!816881 e!816889)))

(declare-fun res!982156 () Bool)

(assert (=> b!1450763 (=> res!982156 e!816889)))

(assert (=> b!1450763 (= res!982156 (or (and (= (select (arr!47437 a!2862) index!646) (select (store (arr!47437 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47437 a!2862) index!646) (select (arr!47437 a!2862) j!93))) (not (= (select (arr!47437 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450764 () Bool)

(assert (=> b!1450764 (= e!816882 e!816885)))

(declare-fun res!982163 () Bool)

(assert (=> b!1450764 (=> res!982163 e!816885)))

(assert (=> b!1450764 (= res!982163 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1450764 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636260 lt!636265 mask!2687) lt!636262)))

(declare-fun lt!636264 () Unit!48765)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48765)

(assert (=> b!1450764 (= lt!636264 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450765 () Bool)

(assert (=> b!1450765 (= e!816890 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636260 lt!636265 mask!2687) (seekEntryOrOpen!0 lt!636260 lt!636265 mask!2687)))))

(declare-fun b!1450766 () Bool)

(assert (=> b!1450766 (= e!816883 e!816886)))

(declare-fun res!982157 () Bool)

(assert (=> b!1450766 (=> (not res!982157) (not e!816886))))

(assert (=> b!1450766 (= res!982157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47437 a!2862) j!93) mask!2687) (select (arr!47437 a!2862) j!93) a!2862 mask!2687) lt!636266))))

(assert (=> b!1450766 (= lt!636266 (Intermediate!11714 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450767 () Bool)

(declare-fun res!982169 () Bool)

(assert (=> b!1450767 (=> (not res!982169) (not e!816891))))

(assert (=> b!1450767 (= res!982169 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47989 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47989 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47989 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450768 () Bool)

(assert (=> b!1450768 (= e!816890 (= lt!636267 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636260 lt!636265 mask!2687)))))

(declare-fun b!1450769 () Bool)

(declare-fun res!982171 () Bool)

(assert (=> b!1450769 (=> (not res!982171) (not e!816884))))

(assert (=> b!1450769 (= res!982171 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450770 () Bool)

(assert (=> b!1450770 (= e!816889 e!816887)))

(declare-fun res!982160 () Bool)

(assert (=> b!1450770 (=> (not res!982160) (not e!816887))))

(assert (=> b!1450770 (= res!982160 (= lt!636261 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47437 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!124870 res!982164) b!1450757))

(assert (= (and b!1450757 res!982173) b!1450752))

(assert (= (and b!1450752 res!982168) b!1450761))

(assert (= (and b!1450761 res!982158) b!1450756))

(assert (= (and b!1450756 res!982166) b!1450758))

(assert (= (and b!1450758 res!982162) b!1450767))

(assert (= (and b!1450767 res!982169) b!1450754))

(assert (= (and b!1450754 res!982170) b!1450766))

(assert (= (and b!1450766 res!982157) b!1450759))

(assert (= (and b!1450759 res!982174) b!1450760))

(assert (= (and b!1450760 res!982165) b!1450762))

(assert (= (and b!1450762 c!133810) b!1450768))

(assert (= (and b!1450762 (not c!133810)) b!1450765))

(assert (= (and b!1450762 res!982172) b!1450769))

(assert (= (and b!1450769 res!982171) b!1450750))

(assert (= (and b!1450750 res!982159) b!1450763))

(assert (= (and b!1450763 (not res!982156)) b!1450770))

(assert (= (and b!1450770 res!982160) b!1450753))

(assert (= (and b!1450750 (not res!982161)) b!1450751))

(assert (= (and b!1450751 (not res!982167)) b!1450764))

(assert (= (and b!1450764 (not res!982163)) b!1450755))

(declare-fun m!1338879 () Bool)

(assert (=> b!1450764 m!1338879))

(declare-fun m!1338881 () Bool)

(assert (=> b!1450764 m!1338881))

(declare-fun m!1338883 () Bool)

(assert (=> b!1450755 m!1338883))

(assert (=> b!1450765 m!1338879))

(declare-fun m!1338885 () Bool)

(assert (=> b!1450765 m!1338885))

(declare-fun m!1338887 () Bool)

(assert (=> b!1450770 m!1338887))

(assert (=> b!1450770 m!1338887))

(declare-fun m!1338889 () Bool)

(assert (=> b!1450770 m!1338889))

(declare-fun m!1338891 () Bool)

(assert (=> b!1450752 m!1338891))

(assert (=> b!1450752 m!1338891))

(declare-fun m!1338893 () Bool)

(assert (=> b!1450752 m!1338893))

(declare-fun m!1338895 () Bool)

(assert (=> b!1450768 m!1338895))

(declare-fun m!1338897 () Bool)

(assert (=> b!1450750 m!1338897))

(declare-fun m!1338899 () Bool)

(assert (=> b!1450750 m!1338899))

(declare-fun m!1338901 () Bool)

(assert (=> b!1450750 m!1338901))

(declare-fun m!1338903 () Bool)

(assert (=> b!1450750 m!1338903))

(declare-fun m!1338905 () Bool)

(assert (=> b!1450750 m!1338905))

(assert (=> b!1450750 m!1338887))

(declare-fun m!1338907 () Bool)

(assert (=> b!1450750 m!1338907))

(declare-fun m!1338909 () Bool)

(assert (=> b!1450750 m!1338909))

(assert (=> b!1450750 m!1338887))

(declare-fun m!1338911 () Bool)

(assert (=> start!124870 m!1338911))

(declare-fun m!1338913 () Bool)

(assert (=> start!124870 m!1338913))

(assert (=> b!1450766 m!1338887))

(assert (=> b!1450766 m!1338887))

(declare-fun m!1338915 () Bool)

(assert (=> b!1450766 m!1338915))

(assert (=> b!1450766 m!1338915))

(assert (=> b!1450766 m!1338887))

(declare-fun m!1338917 () Bool)

(assert (=> b!1450766 m!1338917))

(assert (=> b!1450751 m!1338887))

(assert (=> b!1450751 m!1338887))

(declare-fun m!1338919 () Bool)

(assert (=> b!1450751 m!1338919))

(declare-fun m!1338921 () Bool)

(assert (=> b!1450756 m!1338921))

(assert (=> b!1450759 m!1338887))

(assert (=> b!1450759 m!1338887))

(declare-fun m!1338923 () Bool)

(assert (=> b!1450759 m!1338923))

(assert (=> b!1450754 m!1338899))

(declare-fun m!1338925 () Bool)

(assert (=> b!1450754 m!1338925))

(declare-fun m!1338927 () Bool)

(assert (=> b!1450760 m!1338927))

(assert (=> b!1450760 m!1338927))

(declare-fun m!1338929 () Bool)

(assert (=> b!1450760 m!1338929))

(assert (=> b!1450760 m!1338899))

(declare-fun m!1338931 () Bool)

(assert (=> b!1450760 m!1338931))

(declare-fun m!1338933 () Bool)

(assert (=> b!1450758 m!1338933))

(assert (=> b!1450763 m!1338905))

(assert (=> b!1450763 m!1338899))

(assert (=> b!1450763 m!1338903))

(assert (=> b!1450763 m!1338887))

(assert (=> b!1450761 m!1338887))

(assert (=> b!1450761 m!1338887))

(declare-fun m!1338935 () Bool)

(assert (=> b!1450761 m!1338935))

(check-sat (not b!1450765) (not b!1450756) (not b!1450751) (not b!1450760) (not b!1450764) (not b!1450755) (not b!1450752) (not b!1450768) (not b!1450750) (not b!1450766) (not b!1450770) (not b!1450758) (not b!1450759) (not b!1450761) (not start!124870))
(check-sat)
