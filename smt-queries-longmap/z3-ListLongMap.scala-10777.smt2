; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126438 () Bool)

(assert start!126438)

(declare-fun b!1479008 () Bool)

(declare-fun res!1004064 () Bool)

(declare-fun e!829842 () Bool)

(assert (=> b!1479008 (=> (not res!1004064) (not e!829842))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479008 (= res!1004064 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479009 () Bool)

(declare-fun e!829839 () Bool)

(declare-fun e!829845 () Bool)

(assert (=> b!1479009 (= e!829839 e!829845)))

(declare-fun res!1004061 () Bool)

(assert (=> b!1479009 (=> (not res!1004061) (not e!829845))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99382 0))(
  ( (array!99383 (arr!47965 (Array (_ BitVec 32) (_ BitVec 64))) (size!48516 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99382)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12102 0))(
  ( (MissingZero!12102 (index!50800 (_ BitVec 32))) (Found!12102 (index!50801 (_ BitVec 32))) (Intermediate!12102 (undefined!12914 Bool) (index!50802 (_ BitVec 32)) (x!132582 (_ BitVec 32))) (Undefined!12102) (MissingVacant!12102 (index!50803 (_ BitVec 32))) )
))
(declare-fun lt!645941 () SeekEntryResult!12102)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99382 (_ BitVec 32)) SeekEntryResult!12102)

(assert (=> b!1479009 (= res!1004061 (= lt!645941 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47965 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun lt!645942 () array!99382)

(declare-fun e!829843 () Bool)

(declare-fun lt!645943 () SeekEntryResult!12102)

(declare-fun lt!645939 () (_ BitVec 64))

(declare-fun b!1479010 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99382 (_ BitVec 32)) SeekEntryResult!12102)

(assert (=> b!1479010 (= e!829843 (= lt!645943 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645939 lt!645942 mask!2687)))))

(declare-fun b!1479011 () Bool)

(declare-fun res!1004057 () Bool)

(declare-fun e!829837 () Bool)

(assert (=> b!1479011 (=> (not res!1004057) (not e!829837))))

(declare-fun lt!645940 () SeekEntryResult!12102)

(assert (=> b!1479011 (= res!1004057 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47965 a!2862) j!93) a!2862 mask!2687) lt!645940))))

(declare-fun res!1004055 () Bool)

(declare-fun e!829844 () Bool)

(assert (=> start!126438 (=> (not res!1004055) (not e!829844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126438 (= res!1004055 (validMask!0 mask!2687))))

(assert (=> start!126438 e!829844))

(assert (=> start!126438 true))

(declare-fun array_inv!37246 (array!99382) Bool)

(assert (=> start!126438 (array_inv!37246 a!2862)))

(declare-fun b!1479012 () Bool)

(declare-fun res!1004054 () Bool)

(assert (=> b!1479012 (=> (not res!1004054) (not e!829842))))

(assert (=> b!1479012 (= res!1004054 e!829843)))

(declare-fun c!137008 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479012 (= c!137008 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479013 () Bool)

(declare-fun res!1004058 () Bool)

(assert (=> b!1479013 (=> (not res!1004058) (not e!829844))))

(declare-datatypes ((List!34453 0))(
  ( (Nil!34450) (Cons!34449 (h!35831 (_ BitVec 64)) (t!49139 List!34453)) )
))
(declare-fun arrayNoDuplicates!0 (array!99382 (_ BitVec 32) List!34453) Bool)

(assert (=> b!1479013 (= res!1004058 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34450))))

(declare-fun b!1479014 () Bool)

(declare-fun e!829840 () Bool)

(assert (=> b!1479014 (= e!829844 e!829840)))

(declare-fun res!1004053 () Bool)

(assert (=> b!1479014 (=> (not res!1004053) (not e!829840))))

(assert (=> b!1479014 (= res!1004053 (= (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479014 (= lt!645942 (array!99383 (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48516 a!2862)))))

(declare-fun b!1479015 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99382 (_ BitVec 32)) SeekEntryResult!12102)

(assert (=> b!1479015 (= e!829843 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645939 lt!645942 mask!2687) (seekEntryOrOpen!0 lt!645939 lt!645942 mask!2687)))))

(declare-fun b!1479016 () Bool)

(declare-fun res!1004059 () Bool)

(assert (=> b!1479016 (=> (not res!1004059) (not e!829844))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479016 (= res!1004059 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48516 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48516 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48516 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479017 () Bool)

(declare-fun e!829841 () Bool)

(assert (=> b!1479017 (= e!829841 e!829839)))

(declare-fun res!1004066 () Bool)

(assert (=> b!1479017 (=> res!1004066 e!829839)))

(assert (=> b!1479017 (= res!1004066 (or (and (= (select (arr!47965 a!2862) index!646) (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47965 a!2862) index!646) (select (arr!47965 a!2862) j!93))) (not (= (select (arr!47965 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479018 () Bool)

(assert (=> b!1479018 (= e!829840 e!829837)))

(declare-fun res!1004056 () Bool)

(assert (=> b!1479018 (=> (not res!1004056) (not e!829837))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479018 (= res!1004056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47965 a!2862) j!93) mask!2687) (select (arr!47965 a!2862) j!93) a!2862 mask!2687) lt!645940))))

(assert (=> b!1479018 (= lt!645940 (Intermediate!12102 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479019 () Bool)

(assert (=> b!1479019 (= e!829845 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479020 () Bool)

(declare-fun res!1004062 () Bool)

(assert (=> b!1479020 (=> (not res!1004062) (not e!829844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479020 (= res!1004062 (validKeyInArray!0 (select (arr!47965 a!2862) i!1006)))))

(declare-fun b!1479021 () Bool)

(assert (=> b!1479021 (= e!829837 e!829842)))

(declare-fun res!1004051 () Bool)

(assert (=> b!1479021 (=> (not res!1004051) (not e!829842))))

(assert (=> b!1479021 (= res!1004051 (= lt!645943 (Intermediate!12102 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479021 (= lt!645943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645939 mask!2687) lt!645939 lt!645942 mask!2687))))

(assert (=> b!1479021 (= lt!645939 (select (store (arr!47965 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479022 () Bool)

(declare-fun res!1004052 () Bool)

(assert (=> b!1479022 (=> (not res!1004052) (not e!829844))))

(assert (=> b!1479022 (= res!1004052 (validKeyInArray!0 (select (arr!47965 a!2862) j!93)))))

(declare-fun b!1479023 () Bool)

(assert (=> b!1479023 (= e!829842 (not true))))

(assert (=> b!1479023 e!829841))

(declare-fun res!1004060 () Bool)

(assert (=> b!1479023 (=> (not res!1004060) (not e!829841))))

(assert (=> b!1479023 (= res!1004060 (and (= lt!645941 (Found!12102 j!93)) (or (= (select (arr!47965 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47965 a!2862) intermediateBeforeIndex!19) (select (arr!47965 a!2862) j!93)))))))

(assert (=> b!1479023 (= lt!645941 (seekEntryOrOpen!0 (select (arr!47965 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99382 (_ BitVec 32)) Bool)

(assert (=> b!1479023 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49577 0))(
  ( (Unit!49578) )
))
(declare-fun lt!645938 () Unit!49577)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99382 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49577)

(assert (=> b!1479023 (= lt!645938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479024 () Bool)

(declare-fun res!1004065 () Bool)

(assert (=> b!1479024 (=> (not res!1004065) (not e!829844))))

(assert (=> b!1479024 (= res!1004065 (and (= (size!48516 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48516 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48516 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479025 () Bool)

(declare-fun res!1004063 () Bool)

(assert (=> b!1479025 (=> (not res!1004063) (not e!829844))))

(assert (=> b!1479025 (= res!1004063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126438 res!1004055) b!1479024))

(assert (= (and b!1479024 res!1004065) b!1479020))

(assert (= (and b!1479020 res!1004062) b!1479022))

(assert (= (and b!1479022 res!1004052) b!1479025))

(assert (= (and b!1479025 res!1004063) b!1479013))

(assert (= (and b!1479013 res!1004058) b!1479016))

(assert (= (and b!1479016 res!1004059) b!1479014))

(assert (= (and b!1479014 res!1004053) b!1479018))

(assert (= (and b!1479018 res!1004056) b!1479011))

(assert (= (and b!1479011 res!1004057) b!1479021))

(assert (= (and b!1479021 res!1004051) b!1479012))

(assert (= (and b!1479012 c!137008) b!1479010))

(assert (= (and b!1479012 (not c!137008)) b!1479015))

(assert (= (and b!1479012 res!1004054) b!1479008))

(assert (= (and b!1479008 res!1004064) b!1479023))

(assert (= (and b!1479023 res!1004060) b!1479017))

(assert (= (and b!1479017 (not res!1004066)) b!1479009))

(assert (= (and b!1479009 res!1004061) b!1479019))

(declare-fun m!1364941 () Bool)

(assert (=> b!1479015 m!1364941))

(declare-fun m!1364943 () Bool)

(assert (=> b!1479015 m!1364943))

(declare-fun m!1364945 () Bool)

(assert (=> b!1479021 m!1364945))

(assert (=> b!1479021 m!1364945))

(declare-fun m!1364947 () Bool)

(assert (=> b!1479021 m!1364947))

(declare-fun m!1364949 () Bool)

(assert (=> b!1479021 m!1364949))

(declare-fun m!1364951 () Bool)

(assert (=> b!1479021 m!1364951))

(declare-fun m!1364953 () Bool)

(assert (=> b!1479010 m!1364953))

(declare-fun m!1364955 () Bool)

(assert (=> b!1479013 m!1364955))

(declare-fun m!1364957 () Bool)

(assert (=> b!1479011 m!1364957))

(assert (=> b!1479011 m!1364957))

(declare-fun m!1364959 () Bool)

(assert (=> b!1479011 m!1364959))

(declare-fun m!1364961 () Bool)

(assert (=> b!1479020 m!1364961))

(assert (=> b!1479020 m!1364961))

(declare-fun m!1364963 () Bool)

(assert (=> b!1479020 m!1364963))

(assert (=> b!1479022 m!1364957))

(assert (=> b!1479022 m!1364957))

(declare-fun m!1364965 () Bool)

(assert (=> b!1479022 m!1364965))

(declare-fun m!1364967 () Bool)

(assert (=> b!1479017 m!1364967))

(assert (=> b!1479017 m!1364949))

(declare-fun m!1364969 () Bool)

(assert (=> b!1479017 m!1364969))

(assert (=> b!1479017 m!1364957))

(assert (=> b!1479014 m!1364949))

(declare-fun m!1364971 () Bool)

(assert (=> b!1479014 m!1364971))

(declare-fun m!1364973 () Bool)

(assert (=> b!1479023 m!1364973))

(declare-fun m!1364975 () Bool)

(assert (=> b!1479023 m!1364975))

(assert (=> b!1479023 m!1364957))

(declare-fun m!1364977 () Bool)

(assert (=> b!1479023 m!1364977))

(declare-fun m!1364979 () Bool)

(assert (=> b!1479023 m!1364979))

(assert (=> b!1479023 m!1364957))

(declare-fun m!1364981 () Bool)

(assert (=> start!126438 m!1364981))

(declare-fun m!1364983 () Bool)

(assert (=> start!126438 m!1364983))

(assert (=> b!1479018 m!1364957))

(assert (=> b!1479018 m!1364957))

(declare-fun m!1364985 () Bool)

(assert (=> b!1479018 m!1364985))

(assert (=> b!1479018 m!1364985))

(assert (=> b!1479018 m!1364957))

(declare-fun m!1364987 () Bool)

(assert (=> b!1479018 m!1364987))

(declare-fun m!1364989 () Bool)

(assert (=> b!1479025 m!1364989))

(assert (=> b!1479009 m!1364957))

(assert (=> b!1479009 m!1364957))

(declare-fun m!1364991 () Bool)

(assert (=> b!1479009 m!1364991))

(check-sat (not b!1479011) (not b!1479022) (not b!1479023) (not b!1479015) (not b!1479010) (not b!1479021) (not b!1479018) (not b!1479013) (not b!1479009) (not b!1479025) (not start!126438) (not b!1479020))
(check-sat)
