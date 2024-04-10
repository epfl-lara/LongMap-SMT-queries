; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124976 () Bool)

(assert start!124976)

(declare-fun res!984004 () Bool)

(declare-fun e!817841 () Bool)

(assert (=> start!124976 (=> (not res!984004) (not e!817841))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124976 (= res!984004 (validMask!0 mask!2687))))

(assert (=> start!124976 e!817841))

(assert (=> start!124976 true))

(declare-datatypes ((array!98424 0))(
  ( (array!98425 (arr!47500 (Array (_ BitVec 32) (_ BitVec 64))) (size!48050 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98424)

(declare-fun array_inv!36528 (array!98424) Bool)

(assert (=> start!124976 (array_inv!36528 a!2862)))

(declare-fun b!1452928 () Bool)

(declare-fun e!817847 () Bool)

(declare-fun e!817842 () Bool)

(assert (=> b!1452928 (= e!817847 e!817842)))

(declare-fun res!983995 () Bool)

(assert (=> b!1452928 (=> (not res!983995) (not e!817842))))

(declare-datatypes ((SeekEntryResult!11752 0))(
  ( (MissingZero!11752 (index!49400 (_ BitVec 32))) (Found!11752 (index!49401 (_ BitVec 32))) (Intermediate!11752 (undefined!12564 Bool) (index!49402 (_ BitVec 32)) (x!131041 (_ BitVec 32))) (Undefined!11752) (MissingVacant!11752 (index!49403 (_ BitVec 32))) )
))
(declare-fun lt!637085 () SeekEntryResult!11752)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98424 (_ BitVec 32)) SeekEntryResult!11752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452928 (= res!983995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47500 a!2862) j!93) mask!2687) (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!637085))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452928 (= lt!637085 (Intermediate!11752 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452929 () Bool)

(declare-fun res!984001 () Bool)

(assert (=> b!1452929 (=> (not res!984001) (not e!817841))))

(declare-datatypes ((List!34001 0))(
  ( (Nil!33998) (Cons!33997 (h!35347 (_ BitVec 64)) (t!48695 List!34001)) )
))
(declare-fun arrayNoDuplicates!0 (array!98424 (_ BitVec 32) List!34001) Bool)

(assert (=> b!1452929 (= res!984001 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33998))))

(declare-fun b!1452930 () Bool)

(declare-fun res!983998 () Bool)

(assert (=> b!1452930 (=> (not res!983998) (not e!817841))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452930 (= res!983998 (and (= (size!48050 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48050 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48050 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452931 () Bool)

(declare-fun res!983994 () Bool)

(declare-fun e!817844 () Bool)

(assert (=> b!1452931 (=> (not res!983994) (not e!817844))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452931 (= res!983994 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452932 () Bool)

(assert (=> b!1452932 (= e!817841 e!817847)))

(declare-fun res!984002 () Bool)

(assert (=> b!1452932 (=> (not res!984002) (not e!817847))))

(assert (=> b!1452932 (= res!984002 (= (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637086 () array!98424)

(assert (=> b!1452932 (= lt!637086 (array!98425 (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48050 a!2862)))))

(declare-fun b!1452933 () Bool)

(assert (=> b!1452933 (= e!817842 e!817844)))

(declare-fun res!983991 () Bool)

(assert (=> b!1452933 (=> (not res!983991) (not e!817844))))

(declare-fun lt!637089 () SeekEntryResult!11752)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452933 (= res!983991 (= lt!637089 (Intermediate!11752 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637088 () (_ BitVec 64))

(assert (=> b!1452933 (= lt!637089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637088 mask!2687) lt!637088 lt!637086 mask!2687))))

(assert (=> b!1452933 (= lt!637088 (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452934 () Bool)

(declare-fun res!983993 () Bool)

(assert (=> b!1452934 (=> (not res!983993) (not e!817841))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1452934 (= res!983993 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48050 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48050 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48050 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452935 () Bool)

(declare-fun res!983997 () Bool)

(declare-fun e!817843 () Bool)

(assert (=> b!1452935 (=> (not res!983997) (not e!817843))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98424 (_ BitVec 32)) SeekEntryResult!11752)

(assert (=> b!1452935 (= res!983997 (= (seekEntryOrOpen!0 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) (Found!11752 j!93)))))

(declare-fun b!1452936 () Bool)

(declare-fun res!984000 () Bool)

(assert (=> b!1452936 (=> (not res!984000) (not e!817844))))

(declare-fun e!817845 () Bool)

(assert (=> b!1452936 (= res!984000 e!817845)))

(declare-fun c!133980 () Bool)

(assert (=> b!1452936 (= c!133980 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452937 () Bool)

(declare-fun res!983990 () Bool)

(assert (=> b!1452937 (=> (not res!983990) (not e!817842))))

(assert (=> b!1452937 (= res!983990 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47500 a!2862) j!93) a!2862 mask!2687) lt!637085))))

(declare-fun b!1452938 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98424 (_ BitVec 32)) SeekEntryResult!11752)

(assert (=> b!1452938 (= e!817845 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637088 lt!637086 mask!2687) (seekEntryOrOpen!0 lt!637088 lt!637086 mask!2687)))))

(declare-fun b!1452939 () Bool)

(declare-fun e!817846 () Bool)

(assert (=> b!1452939 (= e!817844 (not e!817846))))

(declare-fun res!983989 () Bool)

(assert (=> b!1452939 (=> res!983989 e!817846)))

(assert (=> b!1452939 (= res!983989 (or (and (= (select (arr!47500 a!2862) index!646) (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47500 a!2862) index!646) (select (arr!47500 a!2862) j!93))) (= (select (arr!47500 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (=> b!1452939 e!817843))

(declare-fun res!983996 () Bool)

(assert (=> b!1452939 (=> (not res!983996) (not e!817843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98424 (_ BitVec 32)) Bool)

(assert (=> b!1452939 (= res!983996 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49000 0))(
  ( (Unit!49001) )
))
(declare-fun lt!637087 () Unit!49000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49000)

(assert (=> b!1452939 (= lt!637087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452940 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452940 (= e!817846 (validKeyInArray!0 lt!637088))))

(declare-fun b!1452941 () Bool)

(assert (=> b!1452941 (= e!817845 (= lt!637089 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637088 lt!637086 mask!2687)))))

(declare-fun b!1452942 () Bool)

(declare-fun res!983992 () Bool)

(assert (=> b!1452942 (=> (not res!983992) (not e!817841))))

(assert (=> b!1452942 (= res!983992 (validKeyInArray!0 (select (arr!47500 a!2862) j!93)))))

(declare-fun b!1452943 () Bool)

(declare-fun res!984003 () Bool)

(assert (=> b!1452943 (=> (not res!984003) (not e!817841))))

(assert (=> b!1452943 (= res!984003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452944 () Bool)

(declare-fun res!983999 () Bool)

(assert (=> b!1452944 (=> (not res!983999) (not e!817841))))

(assert (=> b!1452944 (= res!983999 (validKeyInArray!0 (select (arr!47500 a!2862) i!1006)))))

(declare-fun b!1452945 () Bool)

(assert (=> b!1452945 (= e!817843 (and (or (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47500 a!2862) intermediateBeforeIndex!19) (select (arr!47500 a!2862) j!93))) (or (and (= (select (arr!47500 a!2862) index!646) (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47500 a!2862) index!646) (select (arr!47500 a!2862) j!93))) (= (select (arr!47500 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47500 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!124976 res!984004) b!1452930))

(assert (= (and b!1452930 res!983998) b!1452944))

(assert (= (and b!1452944 res!983999) b!1452942))

(assert (= (and b!1452942 res!983992) b!1452943))

(assert (= (and b!1452943 res!984003) b!1452929))

(assert (= (and b!1452929 res!984001) b!1452934))

(assert (= (and b!1452934 res!983993) b!1452932))

(assert (= (and b!1452932 res!984002) b!1452928))

(assert (= (and b!1452928 res!983995) b!1452937))

(assert (= (and b!1452937 res!983990) b!1452933))

(assert (= (and b!1452933 res!983991) b!1452936))

(assert (= (and b!1452936 c!133980) b!1452941))

(assert (= (and b!1452936 (not c!133980)) b!1452938))

(assert (= (and b!1452936 res!984000) b!1452931))

(assert (= (and b!1452931 res!983994) b!1452939))

(assert (= (and b!1452939 res!983996) b!1452935))

(assert (= (and b!1452935 res!983997) b!1452945))

(assert (= (and b!1452939 (not res!983989)) b!1452940))

(declare-fun m!1341489 () Bool)

(assert (=> b!1452945 m!1341489))

(declare-fun m!1341491 () Bool)

(assert (=> b!1452945 m!1341491))

(declare-fun m!1341493 () Bool)

(assert (=> b!1452945 m!1341493))

(declare-fun m!1341495 () Bool)

(assert (=> b!1452945 m!1341495))

(declare-fun m!1341497 () Bool)

(assert (=> b!1452945 m!1341497))

(declare-fun m!1341499 () Bool)

(assert (=> b!1452929 m!1341499))

(declare-fun m!1341501 () Bool)

(assert (=> b!1452943 m!1341501))

(assert (=> b!1452935 m!1341497))

(assert (=> b!1452935 m!1341497))

(declare-fun m!1341503 () Bool)

(assert (=> b!1452935 m!1341503))

(declare-fun m!1341505 () Bool)

(assert (=> b!1452939 m!1341505))

(assert (=> b!1452939 m!1341489))

(assert (=> b!1452939 m!1341493))

(assert (=> b!1452939 m!1341495))

(declare-fun m!1341507 () Bool)

(assert (=> b!1452939 m!1341507))

(assert (=> b!1452939 m!1341497))

(assert (=> b!1452932 m!1341489))

(declare-fun m!1341509 () Bool)

(assert (=> b!1452932 m!1341509))

(declare-fun m!1341511 () Bool)

(assert (=> b!1452941 m!1341511))

(declare-fun m!1341513 () Bool)

(assert (=> start!124976 m!1341513))

(declare-fun m!1341515 () Bool)

(assert (=> start!124976 m!1341515))

(assert (=> b!1452928 m!1341497))

(assert (=> b!1452928 m!1341497))

(declare-fun m!1341517 () Bool)

(assert (=> b!1452928 m!1341517))

(assert (=> b!1452928 m!1341517))

(assert (=> b!1452928 m!1341497))

(declare-fun m!1341519 () Bool)

(assert (=> b!1452928 m!1341519))

(declare-fun m!1341521 () Bool)

(assert (=> b!1452938 m!1341521))

(declare-fun m!1341523 () Bool)

(assert (=> b!1452938 m!1341523))

(declare-fun m!1341525 () Bool)

(assert (=> b!1452933 m!1341525))

(assert (=> b!1452933 m!1341525))

(declare-fun m!1341527 () Bool)

(assert (=> b!1452933 m!1341527))

(assert (=> b!1452933 m!1341489))

(declare-fun m!1341529 () Bool)

(assert (=> b!1452933 m!1341529))

(declare-fun m!1341531 () Bool)

(assert (=> b!1452944 m!1341531))

(assert (=> b!1452944 m!1341531))

(declare-fun m!1341533 () Bool)

(assert (=> b!1452944 m!1341533))

(assert (=> b!1452937 m!1341497))

(assert (=> b!1452937 m!1341497))

(declare-fun m!1341535 () Bool)

(assert (=> b!1452937 m!1341535))

(assert (=> b!1452942 m!1341497))

(assert (=> b!1452942 m!1341497))

(declare-fun m!1341537 () Bool)

(assert (=> b!1452942 m!1341537))

(declare-fun m!1341539 () Bool)

(assert (=> b!1452940 m!1341539))

(push 1)

(assert (not b!1452938))

(assert (not b!1452933))

(assert (not b!1452939))

(assert (not b!1452928))

