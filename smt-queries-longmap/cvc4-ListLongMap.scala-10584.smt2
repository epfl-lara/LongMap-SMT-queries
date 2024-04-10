; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124646 () Bool)

(assert start!124646)

(declare-fun b!1443901 () Bool)

(declare-fun res!975961 () Bool)

(declare-fun e!813605 () Bool)

(assert (=> b!1443901 (=> (not res!975961) (not e!813605))))

(declare-datatypes ((array!98094 0))(
  ( (array!98095 (arr!47335 (Array (_ BitVec 32) (_ BitVec 64))) (size!47885 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98094)

(declare-datatypes ((List!33836 0))(
  ( (Nil!33833) (Cons!33832 (h!35182 (_ BitVec 64)) (t!48530 List!33836)) )
))
(declare-fun arrayNoDuplicates!0 (array!98094 (_ BitVec 32) List!33836) Bool)

(assert (=> b!1443901 (= res!975961 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33833))))

(declare-fun b!1443902 () Bool)

(declare-fun e!813601 () Bool)

(declare-fun e!813604 () Bool)

(assert (=> b!1443902 (= e!813601 (not e!813604))))

(declare-fun res!975962 () Bool)

(assert (=> b!1443902 (=> res!975962 e!813604)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443902 (= res!975962 (or (not (= (select (arr!47335 a!2862) index!646) (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47335 a!2862) index!646) (select (arr!47335 a!2862) j!93)))))))

(declare-fun e!813606 () Bool)

(assert (=> b!1443902 e!813606))

(declare-fun res!975953 () Bool)

(assert (=> b!1443902 (=> (not res!975953) (not e!813606))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98094 (_ BitVec 32)) Bool)

(assert (=> b!1443902 (= res!975953 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48670 0))(
  ( (Unit!48671) )
))
(declare-fun lt!634017 () Unit!48670)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48670)

(assert (=> b!1443902 (= lt!634017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443903 () Bool)

(declare-fun res!975952 () Bool)

(assert (=> b!1443903 (=> (not res!975952) (not e!813605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443903 (= res!975952 (validKeyInArray!0 (select (arr!47335 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634016 () array!98094)

(declare-fun lt!634018 () (_ BitVec 64))

(declare-fun e!813603 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1443904 () Bool)

(declare-datatypes ((SeekEntryResult!11587 0))(
  ( (MissingZero!11587 (index!48740 (_ BitVec 32))) (Found!11587 (index!48741 (_ BitVec 32))) (Intermediate!11587 (undefined!12399 Bool) (index!48742 (_ BitVec 32)) (x!130436 (_ BitVec 32))) (Undefined!11587) (MissingVacant!11587 (index!48743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98094 (_ BitVec 32)) SeekEntryResult!11587)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98094 (_ BitVec 32)) SeekEntryResult!11587)

(assert (=> b!1443904 (= e!813603 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634018 lt!634016 mask!2687) (seekEntryOrOpen!0 lt!634018 lt!634016 mask!2687)))))

(declare-fun b!1443905 () Bool)

(declare-fun res!975966 () Bool)

(assert (=> b!1443905 (=> (not res!975966) (not e!813601))))

(assert (=> b!1443905 (= res!975966 e!813603)))

(declare-fun c!133485 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443905 (= c!133485 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443906 () Bool)

(declare-fun e!813608 () Bool)

(declare-fun e!813607 () Bool)

(assert (=> b!1443906 (= e!813608 e!813607)))

(declare-fun res!975965 () Bool)

(assert (=> b!1443906 (=> (not res!975965) (not e!813607))))

(declare-fun lt!634020 () SeekEntryResult!11587)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98094 (_ BitVec 32)) SeekEntryResult!11587)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443906 (= res!975965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47335 a!2862) j!93) mask!2687) (select (arr!47335 a!2862) j!93) a!2862 mask!2687) lt!634020))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443906 (= lt!634020 (Intermediate!11587 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443907 () Bool)

(declare-fun res!975956 () Bool)

(assert (=> b!1443907 (=> (not res!975956) (not e!813605))))

(assert (=> b!1443907 (= res!975956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443908 () Bool)

(assert (=> b!1443908 (= e!813605 e!813608)))

(declare-fun res!975963 () Bool)

(assert (=> b!1443908 (=> (not res!975963) (not e!813608))))

(assert (=> b!1443908 (= res!975963 (= (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443908 (= lt!634016 (array!98095 (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47885 a!2862)))))

(declare-fun res!975964 () Bool)

(assert (=> start!124646 (=> (not res!975964) (not e!813605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124646 (= res!975964 (validMask!0 mask!2687))))

(assert (=> start!124646 e!813605))

(assert (=> start!124646 true))

(declare-fun array_inv!36363 (array!98094) Bool)

(assert (=> start!124646 (array_inv!36363 a!2862)))

(declare-fun b!1443909 () Bool)

(declare-fun res!975959 () Bool)

(assert (=> b!1443909 (=> (not res!975959) (not e!813601))))

(assert (=> b!1443909 (= res!975959 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443910 () Bool)

(declare-fun res!975958 () Bool)

(assert (=> b!1443910 (=> (not res!975958) (not e!813605))))

(assert (=> b!1443910 (= res!975958 (validKeyInArray!0 (select (arr!47335 a!2862) j!93)))))

(declare-fun b!1443911 () Bool)

(assert (=> b!1443911 (= e!813604 true)))

(declare-fun lt!634019 () SeekEntryResult!11587)

(assert (=> b!1443911 (= lt!634019 (seekEntryOrOpen!0 lt!634018 lt!634016 mask!2687))))

(declare-fun b!1443912 () Bool)

(declare-fun res!975957 () Bool)

(assert (=> b!1443912 (=> (not res!975957) (not e!813607))))

(assert (=> b!1443912 (= res!975957 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47335 a!2862) j!93) a!2862 mask!2687) lt!634020))))

(declare-fun b!1443913 () Bool)

(assert (=> b!1443913 (= e!813607 e!813601)))

(declare-fun res!975955 () Bool)

(assert (=> b!1443913 (=> (not res!975955) (not e!813601))))

(declare-fun lt!634015 () SeekEntryResult!11587)

(assert (=> b!1443913 (= res!975955 (= lt!634015 (Intermediate!11587 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443913 (= lt!634015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634018 mask!2687) lt!634018 lt!634016 mask!2687))))

(assert (=> b!1443913 (= lt!634018 (select (store (arr!47335 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443914 () Bool)

(assert (=> b!1443914 (= e!813606 (or (= (select (arr!47335 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47335 a!2862) intermediateBeforeIndex!19) (select (arr!47335 a!2862) j!93))))))

(declare-fun b!1443915 () Bool)

(assert (=> b!1443915 (= e!813603 (= lt!634015 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634018 lt!634016 mask!2687)))))

(declare-fun b!1443916 () Bool)

(declare-fun res!975967 () Bool)

(assert (=> b!1443916 (=> (not res!975967) (not e!813605))))

(assert (=> b!1443916 (= res!975967 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47885 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47885 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47885 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443917 () Bool)

(declare-fun res!975960 () Bool)

(assert (=> b!1443917 (=> (not res!975960) (not e!813605))))

(assert (=> b!1443917 (= res!975960 (and (= (size!47885 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47885 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47885 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443918 () Bool)

(declare-fun res!975954 () Bool)

(assert (=> b!1443918 (=> (not res!975954) (not e!813606))))

(assert (=> b!1443918 (= res!975954 (= (seekEntryOrOpen!0 (select (arr!47335 a!2862) j!93) a!2862 mask!2687) (Found!11587 j!93)))))

(assert (= (and start!124646 res!975964) b!1443917))

(assert (= (and b!1443917 res!975960) b!1443903))

(assert (= (and b!1443903 res!975952) b!1443910))

(assert (= (and b!1443910 res!975958) b!1443907))

(assert (= (and b!1443907 res!975956) b!1443901))

(assert (= (and b!1443901 res!975961) b!1443916))

(assert (= (and b!1443916 res!975967) b!1443908))

(assert (= (and b!1443908 res!975963) b!1443906))

(assert (= (and b!1443906 res!975965) b!1443912))

(assert (= (and b!1443912 res!975957) b!1443913))

(assert (= (and b!1443913 res!975955) b!1443905))

(assert (= (and b!1443905 c!133485) b!1443915))

(assert (= (and b!1443905 (not c!133485)) b!1443904))

(assert (= (and b!1443905 res!975966) b!1443909))

(assert (= (and b!1443909 res!975959) b!1443902))

(assert (= (and b!1443902 res!975953) b!1443918))

(assert (= (and b!1443918 res!975954) b!1443914))

(assert (= (and b!1443902 (not res!975962)) b!1443911))

(declare-fun m!1332953 () Bool)

(assert (=> b!1443906 m!1332953))

(assert (=> b!1443906 m!1332953))

(declare-fun m!1332955 () Bool)

(assert (=> b!1443906 m!1332955))

(assert (=> b!1443906 m!1332955))

(assert (=> b!1443906 m!1332953))

(declare-fun m!1332957 () Bool)

(assert (=> b!1443906 m!1332957))

(declare-fun m!1332959 () Bool)

(assert (=> b!1443914 m!1332959))

(assert (=> b!1443914 m!1332953))

(declare-fun m!1332961 () Bool)

(assert (=> b!1443908 m!1332961))

(declare-fun m!1332963 () Bool)

(assert (=> b!1443908 m!1332963))

(declare-fun m!1332965 () Bool)

(assert (=> b!1443911 m!1332965))

(assert (=> b!1443918 m!1332953))

(assert (=> b!1443918 m!1332953))

(declare-fun m!1332967 () Bool)

(assert (=> b!1443918 m!1332967))

(declare-fun m!1332969 () Bool)

(assert (=> b!1443902 m!1332969))

(assert (=> b!1443902 m!1332961))

(declare-fun m!1332971 () Bool)

(assert (=> b!1443902 m!1332971))

(declare-fun m!1332973 () Bool)

(assert (=> b!1443902 m!1332973))

(declare-fun m!1332975 () Bool)

(assert (=> b!1443902 m!1332975))

(assert (=> b!1443902 m!1332953))

(assert (=> b!1443910 m!1332953))

(assert (=> b!1443910 m!1332953))

(declare-fun m!1332977 () Bool)

(assert (=> b!1443910 m!1332977))

(assert (=> b!1443912 m!1332953))

(assert (=> b!1443912 m!1332953))

(declare-fun m!1332979 () Bool)

(assert (=> b!1443912 m!1332979))

(declare-fun m!1332981 () Bool)

(assert (=> b!1443913 m!1332981))

(assert (=> b!1443913 m!1332981))

(declare-fun m!1332983 () Bool)

(assert (=> b!1443913 m!1332983))

(assert (=> b!1443913 m!1332961))

(declare-fun m!1332985 () Bool)

(assert (=> b!1443913 m!1332985))

(declare-fun m!1332987 () Bool)

(assert (=> b!1443904 m!1332987))

(assert (=> b!1443904 m!1332965))

(declare-fun m!1332989 () Bool)

(assert (=> b!1443903 m!1332989))

(assert (=> b!1443903 m!1332989))

(declare-fun m!1332991 () Bool)

(assert (=> b!1443903 m!1332991))

(declare-fun m!1332993 () Bool)

(assert (=> b!1443907 m!1332993))

(declare-fun m!1332995 () Bool)

(assert (=> start!124646 m!1332995))

(declare-fun m!1332997 () Bool)

(assert (=> start!124646 m!1332997))

(declare-fun m!1332999 () Bool)

(assert (=> b!1443915 m!1332999))

(declare-fun m!1333001 () Bool)

(assert (=> b!1443901 m!1333001))

(push 1)

