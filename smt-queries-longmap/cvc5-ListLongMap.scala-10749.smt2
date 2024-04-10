; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125692 () Bool)

(assert start!125692)

(declare-fun b!1470972 () Bool)

(declare-fun res!999038 () Bool)

(declare-fun e!825679 () Bool)

(assert (=> b!1470972 (=> (not res!999038) (not e!825679))))

(declare-datatypes ((array!99083 0))(
  ( (array!99084 (arr!47828 (Array (_ BitVec 32) (_ BitVec 64))) (size!48378 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99083)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470972 (= res!999038 (validKeyInArray!0 (select (arr!47828 a!2862) i!1006)))))

(declare-fun res!999040 () Bool)

(assert (=> start!125692 (=> (not res!999040) (not e!825679))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125692 (= res!999040 (validMask!0 mask!2687))))

(assert (=> start!125692 e!825679))

(assert (=> start!125692 true))

(declare-fun array_inv!36856 (array!99083) Bool)

(assert (=> start!125692 (array_inv!36856 a!2862)))

(declare-fun b!1470973 () Bool)

(declare-fun res!999045 () Bool)

(assert (=> b!1470973 (=> (not res!999045) (not e!825679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99083 (_ BitVec 32)) Bool)

(assert (=> b!1470973 (= res!999045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!643092 () array!99083)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!825678 () Bool)

(declare-fun b!1470974 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643091 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12068 0))(
  ( (MissingZero!12068 (index!50664 (_ BitVec 32))) (Found!12068 (index!50665 (_ BitVec 32))) (Intermediate!12068 (undefined!12880 Bool) (index!50666 (_ BitVec 32)) (x!132246 (_ BitVec 32))) (Undefined!12068) (MissingVacant!12068 (index!50667 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99083 (_ BitVec 32)) SeekEntryResult!12068)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99083 (_ BitVec 32)) SeekEntryResult!12068)

(assert (=> b!1470974 (= e!825678 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643091 lt!643092 mask!2687) (seekEntryOrOpen!0 lt!643091 lt!643092 mask!2687)))))

(declare-fun b!1470975 () Bool)

(declare-fun res!999041 () Bool)

(assert (=> b!1470975 (=> (not res!999041) (not e!825679))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1470975 (= res!999041 (and (= (size!48378 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48378 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48378 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470976 () Bool)

(declare-fun res!999048 () Bool)

(assert (=> b!1470976 (=> (not res!999048) (not e!825679))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1470976 (= res!999048 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48378 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48378 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48378 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470977 () Bool)

(declare-fun res!999043 () Bool)

(declare-fun e!825677 () Bool)

(assert (=> b!1470977 (=> (not res!999043) (not e!825677))))

(assert (=> b!1470977 (= res!999043 e!825678)))

(declare-fun c!135480 () Bool)

(assert (=> b!1470977 (= c!135480 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!643095 () SeekEntryResult!12068)

(declare-fun b!1470978 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99083 (_ BitVec 32)) SeekEntryResult!12068)

(assert (=> b!1470978 (= e!825678 (= lt!643095 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643091 lt!643092 mask!2687)))))

(declare-fun e!825674 () Bool)

(declare-fun b!1470979 () Bool)

(assert (=> b!1470979 (= e!825674 (= (seekEntryOrOpen!0 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) (Found!12068 j!93)))))

(declare-fun b!1470980 () Bool)

(declare-fun e!825675 () Bool)

(declare-fun e!825680 () Bool)

(assert (=> b!1470980 (= e!825675 e!825680)))

(declare-fun res!999037 () Bool)

(assert (=> b!1470980 (=> (not res!999037) (not e!825680))))

(declare-fun lt!643093 () SeekEntryResult!12068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470980 (= res!999037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643093))))

(assert (=> b!1470980 (= lt!643093 (Intermediate!12068 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470981 () Bool)

(declare-fun res!999049 () Bool)

(assert (=> b!1470981 (=> (not res!999049) (not e!825679))))

(declare-datatypes ((List!34329 0))(
  ( (Nil!34326) (Cons!34325 (h!35678 (_ BitVec 64)) (t!49023 List!34329)) )
))
(declare-fun arrayNoDuplicates!0 (array!99083 (_ BitVec 32) List!34329) Bool)

(assert (=> b!1470981 (= res!999049 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34326))))

(declare-fun b!1470982 () Bool)

(declare-fun res!999042 () Bool)

(assert (=> b!1470982 (=> (not res!999042) (not e!825677))))

(assert (=> b!1470982 (= res!999042 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470983 () Bool)

(declare-fun res!999046 () Bool)

(assert (=> b!1470983 (=> (not res!999046) (not e!825680))))

(assert (=> b!1470983 (= res!999046 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643093))))

(declare-fun b!1470984 () Bool)

(assert (=> b!1470984 (= e!825679 e!825675)))

(declare-fun res!999039 () Bool)

(assert (=> b!1470984 (=> (not res!999039) (not e!825675))))

(assert (=> b!1470984 (= res!999039 (= (select (store (arr!47828 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470984 (= lt!643092 (array!99084 (store (arr!47828 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48378 a!2862)))))

(declare-fun b!1470985 () Bool)

(declare-fun res!999044 () Bool)

(assert (=> b!1470985 (=> (not res!999044) (not e!825679))))

(assert (=> b!1470985 (= res!999044 (validKeyInArray!0 (select (arr!47828 a!2862) j!93)))))

(declare-fun b!1470986 () Bool)

(assert (=> b!1470986 (= e!825680 e!825677)))

(declare-fun res!999036 () Bool)

(assert (=> b!1470986 (=> (not res!999036) (not e!825677))))

(assert (=> b!1470986 (= res!999036 (= lt!643095 (Intermediate!12068 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1470986 (= lt!643095 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643091 mask!2687) lt!643091 lt!643092 mask!2687))))

(assert (=> b!1470986 (= lt!643091 (select (store (arr!47828 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470987 () Bool)

(assert (=> b!1470987 (= e!825677 (not (or (= (select (arr!47828 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47828 a!2862) intermediateBeforeIndex!19) (select (arr!47828 a!2862) j!93)))))))

(assert (=> b!1470987 e!825674))

(declare-fun res!999047 () Bool)

(assert (=> b!1470987 (=> (not res!999047) (not e!825674))))

(assert (=> b!1470987 (= res!999047 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49476 0))(
  ( (Unit!49477) )
))
(declare-fun lt!643094 () Unit!49476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49476)

(assert (=> b!1470987 (= lt!643094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125692 res!999040) b!1470975))

(assert (= (and b!1470975 res!999041) b!1470972))

(assert (= (and b!1470972 res!999038) b!1470985))

(assert (= (and b!1470985 res!999044) b!1470973))

(assert (= (and b!1470973 res!999045) b!1470981))

(assert (= (and b!1470981 res!999049) b!1470976))

(assert (= (and b!1470976 res!999048) b!1470984))

(assert (= (and b!1470984 res!999039) b!1470980))

(assert (= (and b!1470980 res!999037) b!1470983))

(assert (= (and b!1470983 res!999046) b!1470986))

(assert (= (and b!1470986 res!999036) b!1470977))

(assert (= (and b!1470977 c!135480) b!1470978))

(assert (= (and b!1470977 (not c!135480)) b!1470974))

(assert (= (and b!1470977 res!999043) b!1470982))

(assert (= (and b!1470982 res!999042) b!1470987))

(assert (= (and b!1470987 res!999047) b!1470979))

(declare-fun m!1357927 () Bool)

(assert (=> b!1470979 m!1357927))

(assert (=> b!1470979 m!1357927))

(declare-fun m!1357929 () Bool)

(assert (=> b!1470979 m!1357929))

(declare-fun m!1357931 () Bool)

(assert (=> b!1470987 m!1357931))

(assert (=> b!1470987 m!1357927))

(declare-fun m!1357933 () Bool)

(assert (=> b!1470987 m!1357933))

(declare-fun m!1357935 () Bool)

(assert (=> b!1470987 m!1357935))

(declare-fun m!1357937 () Bool)

(assert (=> b!1470981 m!1357937))

(declare-fun m!1357939 () Bool)

(assert (=> b!1470973 m!1357939))

(declare-fun m!1357941 () Bool)

(assert (=> b!1470978 m!1357941))

(declare-fun m!1357943 () Bool)

(assert (=> b!1470974 m!1357943))

(declare-fun m!1357945 () Bool)

(assert (=> b!1470974 m!1357945))

(assert (=> b!1470983 m!1357927))

(assert (=> b!1470983 m!1357927))

(declare-fun m!1357947 () Bool)

(assert (=> b!1470983 m!1357947))

(declare-fun m!1357949 () Bool)

(assert (=> start!125692 m!1357949))

(declare-fun m!1357951 () Bool)

(assert (=> start!125692 m!1357951))

(assert (=> b!1470980 m!1357927))

(assert (=> b!1470980 m!1357927))

(declare-fun m!1357953 () Bool)

(assert (=> b!1470980 m!1357953))

(assert (=> b!1470980 m!1357953))

(assert (=> b!1470980 m!1357927))

(declare-fun m!1357955 () Bool)

(assert (=> b!1470980 m!1357955))

(declare-fun m!1357957 () Bool)

(assert (=> b!1470984 m!1357957))

(declare-fun m!1357959 () Bool)

(assert (=> b!1470984 m!1357959))

(assert (=> b!1470985 m!1357927))

(assert (=> b!1470985 m!1357927))

(declare-fun m!1357961 () Bool)

(assert (=> b!1470985 m!1357961))

(declare-fun m!1357963 () Bool)

(assert (=> b!1470986 m!1357963))

(assert (=> b!1470986 m!1357963))

(declare-fun m!1357965 () Bool)

(assert (=> b!1470986 m!1357965))

(assert (=> b!1470986 m!1357957))

(declare-fun m!1357967 () Bool)

(assert (=> b!1470986 m!1357967))

(declare-fun m!1357969 () Bool)

(assert (=> b!1470972 m!1357969))

(assert (=> b!1470972 m!1357969))

(declare-fun m!1357971 () Bool)

(assert (=> b!1470972 m!1357971))

(push 1)

(assert (not b!1470978))

(assert (not b!1470973))

(assert (not b!1470974))

(assert (not b!1470986))

(assert (not b!1470987))

(assert (not b!1470983))

(assert (not b!1470980))

(assert (not b!1470979))

(assert (not b!1470972))

(assert (not b!1470985))

(assert (not b!1470981))

(assert (not start!125692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1471209 () Bool)

(declare-fun e!825802 () Bool)

(declare-fun call!67726 () Bool)

(assert (=> b!1471209 (= e!825802 call!67726)))

(declare-fun b!1471210 () Bool)

(declare-fun e!825801 () Bool)

(assert (=> b!1471210 (= e!825801 call!67726)))

(declare-fun d!155433 () Bool)

(declare-fun res!999185 () Bool)

(declare-fun e!825800 () Bool)

(assert (=> d!155433 (=> res!999185 e!825800)))

(assert (=> d!155433 (= res!999185 (bvsge j!93 (size!48378 a!2862)))))

(assert (=> d!155433 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825800)))

(declare-fun b!1471211 () Bool)

(assert (=> b!1471211 (= e!825800 e!825802)))

(declare-fun c!135525 () Bool)

(assert (=> b!1471211 (= c!135525 (validKeyInArray!0 (select (arr!47828 a!2862) j!93)))))

(declare-fun b!1471212 () Bool)

(assert (=> b!1471212 (= e!825802 e!825801)))

(declare-fun lt!643181 () (_ BitVec 64))

(assert (=> b!1471212 (= lt!643181 (select (arr!47828 a!2862) j!93))))

(declare-fun lt!643180 () Unit!49476)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99083 (_ BitVec 64) (_ BitVec 32)) Unit!49476)

(assert (=> b!1471212 (= lt!643180 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643181 j!93))))

(declare-fun arrayContainsKey!0 (array!99083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1471212 (arrayContainsKey!0 a!2862 lt!643181 #b00000000000000000000000000000000)))

(declare-fun lt!643182 () Unit!49476)

(assert (=> b!1471212 (= lt!643182 lt!643180)))

(declare-fun res!999186 () Bool)

(assert (=> b!1471212 (= res!999186 (= (seekEntryOrOpen!0 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) (Found!12068 j!93)))))

(assert (=> b!1471212 (=> (not res!999186) (not e!825801))))

(declare-fun bm!67723 () Bool)

(assert (=> bm!67723 (= call!67726 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155433 (not res!999185)) b!1471211))

(assert (= (and b!1471211 c!135525) b!1471212))

(assert (= (and b!1471211 (not c!135525)) b!1471209))

(assert (= (and b!1471212 res!999186) b!1471210))

(assert (= (or b!1471210 b!1471209) bm!67723))

(assert (=> b!1471211 m!1357927))

(assert (=> b!1471211 m!1357927))

(assert (=> b!1471211 m!1357961))

(assert (=> b!1471212 m!1357927))

(declare-fun m!1358129 () Bool)

(assert (=> b!1471212 m!1358129))

(declare-fun m!1358131 () Bool)

(assert (=> b!1471212 m!1358131))

(assert (=> b!1471212 m!1357927))

(assert (=> b!1471212 m!1357929))

(declare-fun m!1358133 () Bool)

(assert (=> bm!67723 m!1358133))

(assert (=> b!1470987 d!155433))

(declare-fun d!155455 () Bool)

(assert (=> d!155455 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643185 () Unit!49476)

(declare-fun choose!38 (array!99083 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49476)

(assert (=> d!155455 (= lt!643185 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155455 (validMask!0 mask!2687)))

(assert (=> d!155455 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643185)))

(declare-fun bs!42507 () Bool)

(assert (= bs!42507 d!155455))

(assert (=> bs!42507 m!1357933))

(declare-fun m!1358135 () Bool)

(assert (=> bs!42507 m!1358135))

(assert (=> bs!42507 m!1357949))

(assert (=> b!1470987 d!155455))

(declare-fun b!1471267 () Bool)

(declare-fun e!825832 () Bool)

(declare-fun lt!643203 () SeekEntryResult!12068)

(assert (=> b!1471267 (= e!825832 (bvsge (x!132246 lt!643203) #b01111111111111111111111111111110))))

(declare-fun b!1471268 () Bool)

(assert (=> b!1471268 (and (bvsge (index!50666 lt!643203) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643203) (size!48378 lt!643092)))))

(declare-fun e!825835 () Bool)

(assert (=> b!1471268 (= e!825835 (= (select (arr!47828 lt!643092) (index!50666 lt!643203)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471269 () Bool)

(declare-fun e!825831 () SeekEntryResult!12068)

(assert (=> b!1471269 (= e!825831 (Intermediate!12068 true index!646 x!665))))

(declare-fun b!1471270 () Bool)

(assert (=> b!1471270 (and (bvsge (index!50666 lt!643203) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643203) (size!48378 lt!643092)))))

(declare-fun res!999193 () Bool)

(assert (=> b!1471270 (= res!999193 (= (select (arr!47828 lt!643092) (index!50666 lt!643203)) lt!643091))))

(assert (=> b!1471270 (=> res!999193 e!825835)))

(declare-fun e!825834 () Bool)

(assert (=> b!1471270 (= e!825834 e!825835)))

(declare-fun d!155457 () Bool)

(assert (=> d!155457 e!825832))

(declare-fun c!135551 () Bool)

(assert (=> d!155457 (= c!135551 (and (is-Intermediate!12068 lt!643203) (undefined!12880 lt!643203)))))

(assert (=> d!155457 (= lt!643203 e!825831)))

(declare-fun c!135550 () Bool)

(assert (=> d!155457 (= c!135550 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643202 () (_ BitVec 64))

(assert (=> d!155457 (= lt!643202 (select (arr!47828 lt!643092) index!646))))

(assert (=> d!155457 (validMask!0 mask!2687)))

(assert (=> d!155457 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643091 lt!643092 mask!2687) lt!643203)))

(declare-fun b!1471271 () Bool)

(declare-fun e!825833 () SeekEntryResult!12068)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471271 (= e!825833 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!643091 lt!643092 mask!2687))))

(declare-fun b!1471272 () Bool)

(assert (=> b!1471272 (= e!825833 (Intermediate!12068 false index!646 x!665))))

(declare-fun b!1471273 () Bool)

(assert (=> b!1471273 (and (bvsge (index!50666 lt!643203) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643203) (size!48378 lt!643092)))))

(declare-fun res!999194 () Bool)

(assert (=> b!1471273 (= res!999194 (= (select (arr!47828 lt!643092) (index!50666 lt!643203)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471273 (=> res!999194 e!825835)))

(declare-fun b!1471274 () Bool)

(assert (=> b!1471274 (= e!825832 e!825834)))

(declare-fun res!999195 () Bool)

(assert (=> b!1471274 (= res!999195 (and (is-Intermediate!12068 lt!643203) (not (undefined!12880 lt!643203)) (bvslt (x!132246 lt!643203) #b01111111111111111111111111111110) (bvsge (x!132246 lt!643203) #b00000000000000000000000000000000) (bvsge (x!132246 lt!643203) x!665)))))

(assert (=> b!1471274 (=> (not res!999195) (not e!825834))))

(declare-fun b!1471275 () Bool)

(assert (=> b!1471275 (= e!825831 e!825833)))

(declare-fun c!135552 () Bool)

(assert (=> b!1471275 (= c!135552 (or (= lt!643202 lt!643091) (= (bvadd lt!643202 lt!643202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155457 c!135550) b!1471269))

(assert (= (and d!155457 (not c!135550)) b!1471275))

(assert (= (and b!1471275 c!135552) b!1471272))

(assert (= (and b!1471275 (not c!135552)) b!1471271))

(assert (= (and d!155457 c!135551) b!1471267))

(assert (= (and d!155457 (not c!135551)) b!1471274))

(assert (= (and b!1471274 res!999195) b!1471270))

(assert (= (and b!1471270 (not res!999193)) b!1471273))

(assert (= (and b!1471273 (not res!999194)) b!1471268))

(declare-fun m!1358151 () Bool)

(assert (=> b!1471270 m!1358151))

(declare-fun m!1358153 () Bool)

(assert (=> b!1471271 m!1358153))

(assert (=> b!1471271 m!1358153))

(declare-fun m!1358155 () Bool)

(assert (=> b!1471271 m!1358155))

(assert (=> b!1471268 m!1358151))

(declare-fun m!1358157 () Bool)

(assert (=> d!155457 m!1358157))

(assert (=> d!155457 m!1357949))

(assert (=> b!1471273 m!1358151))

(assert (=> b!1470978 d!155457))

(declare-fun b!1471338 () Bool)

(declare-fun e!825870 () SeekEntryResult!12068)

(declare-fun lt!643237 () SeekEntryResult!12068)

(assert (=> b!1471338 (= e!825870 (Found!12068 (index!50666 lt!643237)))))

(declare-fun d!155463 () Bool)

(declare-fun lt!643238 () SeekEntryResult!12068)

(assert (=> d!155463 (and (or (is-Undefined!12068 lt!643238) (not (is-Found!12068 lt!643238)) (and (bvsge (index!50665 lt!643238) #b00000000000000000000000000000000) (bvslt (index!50665 lt!643238) (size!48378 a!2862)))) (or (is-Undefined!12068 lt!643238) (is-Found!12068 lt!643238) (not (is-MissingZero!12068 lt!643238)) (and (bvsge (index!50664 lt!643238) #b00000000000000000000000000000000) (bvslt (index!50664 lt!643238) (size!48378 a!2862)))) (or (is-Undefined!12068 lt!643238) (is-Found!12068 lt!643238) (is-MissingZero!12068 lt!643238) (not (is-MissingVacant!12068 lt!643238)) (and (bvsge (index!50667 lt!643238) #b00000000000000000000000000000000) (bvslt (index!50667 lt!643238) (size!48378 a!2862)))) (or (is-Undefined!12068 lt!643238) (ite (is-Found!12068 lt!643238) (= (select (arr!47828 a!2862) (index!50665 lt!643238)) (select (arr!47828 a!2862) j!93)) (ite (is-MissingZero!12068 lt!643238) (= (select (arr!47828 a!2862) (index!50664 lt!643238)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12068 lt!643238) (= (select (arr!47828 a!2862) (index!50667 lt!643238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!825871 () SeekEntryResult!12068)

(assert (=> d!155463 (= lt!643238 e!825871)))

(declare-fun c!135582 () Bool)

(assert (=> d!155463 (= c!135582 (and (is-Intermediate!12068 lt!643237) (undefined!12880 lt!643237)))))

(assert (=> d!155463 (= lt!643237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) (select (arr!47828 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155463 (validMask!0 mask!2687)))

(assert (=> d!155463 (= (seekEntryOrOpen!0 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643238)))

(declare-fun b!1471339 () Bool)

(declare-fun e!825869 () SeekEntryResult!12068)

(assert (=> b!1471339 (= e!825869 (seekKeyOrZeroReturnVacant!0 (x!132246 lt!643237) (index!50666 lt!643237) (index!50666 lt!643237) (select (arr!47828 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471340 () Bool)

(declare-fun c!135583 () Bool)

(declare-fun lt!643239 () (_ BitVec 64))

(assert (=> b!1471340 (= c!135583 (= lt!643239 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471340 (= e!825870 e!825869)))

(declare-fun b!1471341 () Bool)

(assert (=> b!1471341 (= e!825871 Undefined!12068)))

(declare-fun b!1471342 () Bool)

(assert (=> b!1471342 (= e!825869 (MissingZero!12068 (index!50666 lt!643237)))))

(declare-fun b!1471343 () Bool)

(assert (=> b!1471343 (= e!825871 e!825870)))

(assert (=> b!1471343 (= lt!643239 (select (arr!47828 a!2862) (index!50666 lt!643237)))))

(declare-fun c!135584 () Bool)

(assert (=> b!1471343 (= c!135584 (= lt!643239 (select (arr!47828 a!2862) j!93)))))

(assert (= (and d!155463 c!135582) b!1471341))

(assert (= (and d!155463 (not c!135582)) b!1471343))

(assert (= (and b!1471343 c!135584) b!1471338))

(assert (= (and b!1471343 (not c!135584)) b!1471340))

(assert (= (and b!1471340 c!135583) b!1471342))

(assert (= (and b!1471340 (not c!135583)) b!1471339))

(assert (=> d!155463 m!1357953))

(assert (=> d!155463 m!1357927))

(assert (=> d!155463 m!1357955))

(declare-fun m!1358189 () Bool)

(assert (=> d!155463 m!1358189))

(assert (=> d!155463 m!1357949))

(declare-fun m!1358193 () Bool)

(assert (=> d!155463 m!1358193))

(declare-fun m!1358197 () Bool)

(assert (=> d!155463 m!1358197))

(assert (=> d!155463 m!1357927))

(assert (=> d!155463 m!1357953))

(assert (=> b!1471339 m!1357927))

(declare-fun m!1358199 () Bool)

(assert (=> b!1471339 m!1358199))

(declare-fun m!1358201 () Bool)

(assert (=> b!1471343 m!1358201))

(assert (=> b!1470979 d!155463))

(declare-fun b!1471348 () Bool)

(declare-fun e!825876 () Bool)

(declare-fun lt!643244 () SeekEntryResult!12068)

(assert (=> b!1471348 (= e!825876 (bvsge (x!132246 lt!643244) #b01111111111111111111111111111110))))

(declare-fun b!1471349 () Bool)

(assert (=> b!1471349 (and (bvsge (index!50666 lt!643244) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643244) (size!48378 a!2862)))))

(declare-fun e!825879 () Bool)

(assert (=> b!1471349 (= e!825879 (= (select (arr!47828 a!2862) (index!50666 lt!643244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825875 () SeekEntryResult!12068)

(declare-fun b!1471350 () Bool)

(assert (=> b!1471350 (= e!825875 (Intermediate!12068 true (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471351 () Bool)

(assert (=> b!1471351 (and (bvsge (index!50666 lt!643244) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643244) (size!48378 a!2862)))))

(declare-fun res!999202 () Bool)

(assert (=> b!1471351 (= res!999202 (= (select (arr!47828 a!2862) (index!50666 lt!643244)) (select (arr!47828 a!2862) j!93)))))

(assert (=> b!1471351 (=> res!999202 e!825879)))

(declare-fun e!825878 () Bool)

(assert (=> b!1471351 (= e!825878 e!825879)))

(declare-fun d!155471 () Bool)

(assert (=> d!155471 e!825876))

(declare-fun c!135587 () Bool)

(assert (=> d!155471 (= c!135587 (and (is-Intermediate!12068 lt!643244) (undefined!12880 lt!643244)))))

(assert (=> d!155471 (= lt!643244 e!825875)))

(declare-fun c!135586 () Bool)

(assert (=> d!155471 (= c!135586 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643243 () (_ BitVec 64))

(assert (=> d!155471 (= lt!643243 (select (arr!47828 a!2862) (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687)))))

(assert (=> d!155471 (validMask!0 mask!2687)))

(assert (=> d!155471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643244)))

(declare-fun b!1471352 () Bool)

(declare-fun e!825877 () SeekEntryResult!12068)

(assert (=> b!1471352 (= e!825877 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47828 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471353 () Bool)

(assert (=> b!1471353 (= e!825877 (Intermediate!12068 false (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471354 () Bool)

(assert (=> b!1471354 (and (bvsge (index!50666 lt!643244) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643244) (size!48378 a!2862)))))

(declare-fun res!999203 () Bool)

(assert (=> b!1471354 (= res!999203 (= (select (arr!47828 a!2862) (index!50666 lt!643244)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471354 (=> res!999203 e!825879)))

(declare-fun b!1471355 () Bool)

(assert (=> b!1471355 (= e!825876 e!825878)))

(declare-fun res!999204 () Bool)

(assert (=> b!1471355 (= res!999204 (and (is-Intermediate!12068 lt!643244) (not (undefined!12880 lt!643244)) (bvslt (x!132246 lt!643244) #b01111111111111111111111111111110) (bvsge (x!132246 lt!643244) #b00000000000000000000000000000000) (bvsge (x!132246 lt!643244) #b00000000000000000000000000000000)))))

(assert (=> b!1471355 (=> (not res!999204) (not e!825878))))

(declare-fun b!1471356 () Bool)

(assert (=> b!1471356 (= e!825875 e!825877)))

(declare-fun c!135588 () Bool)

(assert (=> b!1471356 (= c!135588 (or (= lt!643243 (select (arr!47828 a!2862) j!93)) (= (bvadd lt!643243 lt!643243) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155471 c!135586) b!1471350))

(assert (= (and d!155471 (not c!135586)) b!1471356))

(assert (= (and b!1471356 c!135588) b!1471353))

(assert (= (and b!1471356 (not c!135588)) b!1471352))

(assert (= (and d!155471 c!135587) b!1471348))

(assert (= (and d!155471 (not c!135587)) b!1471355))

(assert (= (and b!1471355 res!999204) b!1471351))

(assert (= (and b!1471351 (not res!999202)) b!1471354))

(assert (= (and b!1471354 (not res!999203)) b!1471349))

(declare-fun m!1358205 () Bool)

(assert (=> b!1471351 m!1358205))

(assert (=> b!1471352 m!1357953))

(declare-fun m!1358207 () Bool)

(assert (=> b!1471352 m!1358207))

(assert (=> b!1471352 m!1358207))

(assert (=> b!1471352 m!1357927))

(declare-fun m!1358209 () Bool)

(assert (=> b!1471352 m!1358209))

(assert (=> b!1471349 m!1358205))

(assert (=> d!155471 m!1357953))

(declare-fun m!1358211 () Bool)

(assert (=> d!155471 m!1358211))

(assert (=> d!155471 m!1357949))

(assert (=> b!1471354 m!1358205))

(assert (=> b!1470980 d!155471))

(declare-fun d!155477 () Bool)

(declare-fun lt!643260 () (_ BitVec 32))

(declare-fun lt!643259 () (_ BitVec 32))

(assert (=> d!155477 (= lt!643260 (bvmul (bvxor lt!643259 (bvlshr lt!643259 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155477 (= lt!643259 ((_ extract 31 0) (bvand (bvxor (select (arr!47828 a!2862) j!93) (bvlshr (select (arr!47828 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155477 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999205 (let ((h!35683 ((_ extract 31 0) (bvand (bvxor (select (arr!47828 a!2862) j!93) (bvlshr (select (arr!47828 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132256 (bvmul (bvxor h!35683 (bvlshr h!35683 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132256 (bvlshr x!132256 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999205 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999205 #b00000000000000000000000000000000))))))

(assert (=> d!155477 (= (toIndex!0 (select (arr!47828 a!2862) j!93) mask!2687) (bvand (bvxor lt!643260 (bvlshr lt!643260 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1470980 d!155477))

(declare-fun b!1471393 () Bool)

(declare-fun e!825906 () Bool)

(declare-fun e!825905 () Bool)

(assert (=> b!1471393 (= e!825906 e!825905)))

(declare-fun c!135599 () Bool)

(assert (=> b!1471393 (= c!135599 (validKeyInArray!0 (select (arr!47828 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471394 () Bool)

(declare-fun e!825904 () Bool)

(assert (=> b!1471394 (= e!825904 e!825906)))

(declare-fun res!999222 () Bool)

(assert (=> b!1471394 (=> (not res!999222) (not e!825906))))

(declare-fun e!825907 () Bool)

(assert (=> b!1471394 (= res!999222 (not e!825907))))

(declare-fun res!999223 () Bool)

(assert (=> b!1471394 (=> (not res!999223) (not e!825907))))

(assert (=> b!1471394 (= res!999223 (validKeyInArray!0 (select (arr!47828 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155489 () Bool)

(declare-fun res!999224 () Bool)

(assert (=> d!155489 (=> res!999224 e!825904)))

(assert (=> d!155489 (= res!999224 (bvsge #b00000000000000000000000000000000 (size!48378 a!2862)))))

(assert (=> d!155489 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34326) e!825904)))

(declare-fun b!1471395 () Bool)

(declare-fun call!67734 () Bool)

(assert (=> b!1471395 (= e!825905 call!67734)))

(declare-fun b!1471396 () Bool)

(declare-fun contains!9900 (List!34329 (_ BitVec 64)) Bool)

(assert (=> b!1471396 (= e!825907 (contains!9900 Nil!34326 (select (arr!47828 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471397 () Bool)

(assert (=> b!1471397 (= e!825905 call!67734)))

(declare-fun bm!67731 () Bool)

(assert (=> bm!67731 (= call!67734 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135599 (Cons!34325 (select (arr!47828 a!2862) #b00000000000000000000000000000000) Nil!34326) Nil!34326)))))

(assert (= (and d!155489 (not res!999224)) b!1471394))

(assert (= (and b!1471394 res!999223) b!1471396))

(assert (= (and b!1471394 res!999222) b!1471393))

(assert (= (and b!1471393 c!135599) b!1471395))

(assert (= (and b!1471393 (not c!135599)) b!1471397))

(assert (= (or b!1471395 b!1471397) bm!67731))

(declare-fun m!1358245 () Bool)

(assert (=> b!1471393 m!1358245))

(assert (=> b!1471393 m!1358245))

(declare-fun m!1358247 () Bool)

(assert (=> b!1471393 m!1358247))

(assert (=> b!1471394 m!1358245))

(assert (=> b!1471394 m!1358245))

(assert (=> b!1471394 m!1358247))

(assert (=> b!1471396 m!1358245))

(assert (=> b!1471396 m!1358245))

(declare-fun m!1358249 () Bool)

(assert (=> b!1471396 m!1358249))

(assert (=> bm!67731 m!1358245))

(declare-fun m!1358251 () Bool)

(assert (=> bm!67731 m!1358251))

(assert (=> b!1470981 d!155489))

(declare-fun b!1471398 () Bool)

(declare-fun e!825909 () Bool)

(declare-fun lt!643265 () SeekEntryResult!12068)

(assert (=> b!1471398 (= e!825909 (bvsge (x!132246 lt!643265) #b01111111111111111111111111111110))))

(declare-fun b!1471399 () Bool)

(assert (=> b!1471399 (and (bvsge (index!50666 lt!643265) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643265) (size!48378 a!2862)))))

(declare-fun e!825912 () Bool)

(assert (=> b!1471399 (= e!825912 (= (select (arr!47828 a!2862) (index!50666 lt!643265)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471400 () Bool)

(declare-fun e!825908 () SeekEntryResult!12068)

(assert (=> b!1471400 (= e!825908 (Intermediate!12068 true index!646 x!665))))

(declare-fun b!1471401 () Bool)

(assert (=> b!1471401 (and (bvsge (index!50666 lt!643265) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643265) (size!48378 a!2862)))))

(declare-fun res!999225 () Bool)

(assert (=> b!1471401 (= res!999225 (= (select (arr!47828 a!2862) (index!50666 lt!643265)) (select (arr!47828 a!2862) j!93)))))

(assert (=> b!1471401 (=> res!999225 e!825912)))

(declare-fun e!825911 () Bool)

(assert (=> b!1471401 (= e!825911 e!825912)))

(declare-fun d!155495 () Bool)

(assert (=> d!155495 e!825909))

(declare-fun c!135601 () Bool)

(assert (=> d!155495 (= c!135601 (and (is-Intermediate!12068 lt!643265) (undefined!12880 lt!643265)))))

(assert (=> d!155495 (= lt!643265 e!825908)))

(declare-fun c!135600 () Bool)

(assert (=> d!155495 (= c!135600 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643264 () (_ BitVec 64))

(assert (=> d!155495 (= lt!643264 (select (arr!47828 a!2862) index!646))))

(assert (=> d!155495 (validMask!0 mask!2687)))

(assert (=> d!155495 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47828 a!2862) j!93) a!2862 mask!2687) lt!643265)))

(declare-fun b!1471402 () Bool)

(declare-fun e!825910 () SeekEntryResult!12068)

(assert (=> b!1471402 (= e!825910 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47828 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471403 () Bool)

(assert (=> b!1471403 (= e!825910 (Intermediate!12068 false index!646 x!665))))

(declare-fun b!1471404 () Bool)

(assert (=> b!1471404 (and (bvsge (index!50666 lt!643265) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643265) (size!48378 a!2862)))))

(declare-fun res!999226 () Bool)

(assert (=> b!1471404 (= res!999226 (= (select (arr!47828 a!2862) (index!50666 lt!643265)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471404 (=> res!999226 e!825912)))

(declare-fun b!1471405 () Bool)

(assert (=> b!1471405 (= e!825909 e!825911)))

(declare-fun res!999227 () Bool)

(assert (=> b!1471405 (= res!999227 (and (is-Intermediate!12068 lt!643265) (not (undefined!12880 lt!643265)) (bvslt (x!132246 lt!643265) #b01111111111111111111111111111110) (bvsge (x!132246 lt!643265) #b00000000000000000000000000000000) (bvsge (x!132246 lt!643265) x!665)))))

(assert (=> b!1471405 (=> (not res!999227) (not e!825911))))

(declare-fun b!1471406 () Bool)

(assert (=> b!1471406 (= e!825908 e!825910)))

(declare-fun c!135602 () Bool)

(assert (=> b!1471406 (= c!135602 (or (= lt!643264 (select (arr!47828 a!2862) j!93)) (= (bvadd lt!643264 lt!643264) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155495 c!135600) b!1471400))

(assert (= (and d!155495 (not c!135600)) b!1471406))

(assert (= (and b!1471406 c!135602) b!1471403))

(assert (= (and b!1471406 (not c!135602)) b!1471402))

(assert (= (and d!155495 c!135601) b!1471398))

(assert (= (and d!155495 (not c!135601)) b!1471405))

(assert (= (and b!1471405 res!999227) b!1471401))

(assert (= (and b!1471401 (not res!999225)) b!1471404))

(assert (= (and b!1471404 (not res!999226)) b!1471399))

(declare-fun m!1358253 () Bool)

(assert (=> b!1471401 m!1358253))

(assert (=> b!1471402 m!1358153))

(assert (=> b!1471402 m!1358153))

(assert (=> b!1471402 m!1357927))

(declare-fun m!1358255 () Bool)

(assert (=> b!1471402 m!1358255))

(assert (=> b!1471399 m!1358253))

(declare-fun m!1358257 () Bool)

(assert (=> d!155495 m!1358257))

(assert (=> d!155495 m!1357949))

(assert (=> b!1471404 m!1358253))

(assert (=> b!1470983 d!155495))

(declare-fun d!155497 () Bool)

(assert (=> d!155497 (= (validKeyInArray!0 (select (arr!47828 a!2862) i!1006)) (and (not (= (select (arr!47828 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47828 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470972 d!155497))

(declare-fun b!1471407 () Bool)

(declare-fun e!825915 () Bool)

(declare-fun call!67735 () Bool)

(assert (=> b!1471407 (= e!825915 call!67735)))

(declare-fun b!1471408 () Bool)

(declare-fun e!825914 () Bool)

(assert (=> b!1471408 (= e!825914 call!67735)))

(declare-fun d!155499 () Bool)

(declare-fun res!999228 () Bool)

(declare-fun e!825913 () Bool)

(assert (=> d!155499 (=> res!999228 e!825913)))

(assert (=> d!155499 (= res!999228 (bvsge #b00000000000000000000000000000000 (size!48378 a!2862)))))

(assert (=> d!155499 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825913)))

(declare-fun b!1471409 () Bool)

(assert (=> b!1471409 (= e!825913 e!825915)))

(declare-fun c!135603 () Bool)

(assert (=> b!1471409 (= c!135603 (validKeyInArray!0 (select (arr!47828 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471410 () Bool)

(assert (=> b!1471410 (= e!825915 e!825914)))

(declare-fun lt!643267 () (_ BitVec 64))

(assert (=> b!1471410 (= lt!643267 (select (arr!47828 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643266 () Unit!49476)

(assert (=> b!1471410 (= lt!643266 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643267 #b00000000000000000000000000000000))))

(assert (=> b!1471410 (arrayContainsKey!0 a!2862 lt!643267 #b00000000000000000000000000000000)))

(declare-fun lt!643268 () Unit!49476)

(assert (=> b!1471410 (= lt!643268 lt!643266)))

(declare-fun res!999229 () Bool)

(assert (=> b!1471410 (= res!999229 (= (seekEntryOrOpen!0 (select (arr!47828 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12068 #b00000000000000000000000000000000)))))

(assert (=> b!1471410 (=> (not res!999229) (not e!825914))))

(declare-fun bm!67732 () Bool)

(assert (=> bm!67732 (= call!67735 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(assert (= (and d!155499 (not res!999228)) b!1471409))

(assert (= (and b!1471409 c!135603) b!1471410))

(assert (= (and b!1471409 (not c!135603)) b!1471407))

(assert (= (and b!1471410 res!999229) b!1471408))

(assert (= (or b!1471408 b!1471407) bm!67732))

(assert (=> b!1471409 m!1358245))

(assert (=> b!1471409 m!1358245))

(assert (=> b!1471409 m!1358247))

(assert (=> b!1471410 m!1358245))

(declare-fun m!1358259 () Bool)

(assert (=> b!1471410 m!1358259))

(declare-fun m!1358261 () Bool)

(assert (=> b!1471410 m!1358261))

(assert (=> b!1471410 m!1358245))

(declare-fun m!1358263 () Bool)

(assert (=> b!1471410 m!1358263))

(declare-fun m!1358265 () Bool)

(assert (=> bm!67732 m!1358265))

(assert (=> b!1470973 d!155499))

(declare-fun d!155501 () Bool)

(assert (=> d!155501 (= (validKeyInArray!0 (select (arr!47828 a!2862) j!93)) (and (not (= (select (arr!47828 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47828 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1470985 d!155501))

(declare-fun b!1471444 () Bool)

(declare-fun e!825938 () SeekEntryResult!12068)

(assert (=> b!1471444 (= e!825938 (Found!12068 index!646))))

(declare-fun d!155503 () Bool)

(declare-fun lt!643277 () SeekEntryResult!12068)

(assert (=> d!155503 (and (or (is-Undefined!12068 lt!643277) (not (is-Found!12068 lt!643277)) (and (bvsge (index!50665 lt!643277) #b00000000000000000000000000000000) (bvslt (index!50665 lt!643277) (size!48378 lt!643092)))) (or (is-Undefined!12068 lt!643277) (is-Found!12068 lt!643277) (not (is-MissingVacant!12068 lt!643277)) (not (= (index!50667 lt!643277) intermediateAfterIndex!19)) (and (bvsge (index!50667 lt!643277) #b00000000000000000000000000000000) (bvslt (index!50667 lt!643277) (size!48378 lt!643092)))) (or (is-Undefined!12068 lt!643277) (ite (is-Found!12068 lt!643277) (= (select (arr!47828 lt!643092) (index!50665 lt!643277)) lt!643091) (and (is-MissingVacant!12068 lt!643277) (= (index!50667 lt!643277) intermediateAfterIndex!19) (= (select (arr!47828 lt!643092) (index!50667 lt!643277)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!825939 () SeekEntryResult!12068)

(assert (=> d!155503 (= lt!643277 e!825939)))

(declare-fun c!135616 () Bool)

(assert (=> d!155503 (= c!135616 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!643276 () (_ BitVec 64))

(assert (=> d!155503 (= lt!643276 (select (arr!47828 lt!643092) index!646))))

(assert (=> d!155503 (validMask!0 mask!2687)))

(assert (=> d!155503 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643091 lt!643092 mask!2687) lt!643277)))

(declare-fun b!1471445 () Bool)

(assert (=> b!1471445 (= e!825939 e!825938)))

(declare-fun c!135617 () Bool)

(assert (=> b!1471445 (= c!135617 (= lt!643276 lt!643091))))

(declare-fun b!1471446 () Bool)

(declare-fun c!135618 () Bool)

(assert (=> b!1471446 (= c!135618 (= lt!643276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825937 () SeekEntryResult!12068)

(assert (=> b!1471446 (= e!825938 e!825937)))

(declare-fun b!1471447 () Bool)

(assert (=> b!1471447 (= e!825939 Undefined!12068)))

(declare-fun b!1471448 () Bool)

(assert (=> b!1471448 (= e!825937 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643091 lt!643092 mask!2687))))

(declare-fun b!1471449 () Bool)

(assert (=> b!1471449 (= e!825937 (MissingVacant!12068 intermediateAfterIndex!19))))

(assert (= (and d!155503 c!135616) b!1471447))

(assert (= (and d!155503 (not c!135616)) b!1471445))

(assert (= (and b!1471445 c!135617) b!1471444))

(assert (= (and b!1471445 (not c!135617)) b!1471446))

(assert (= (and b!1471446 c!135618) b!1471449))

(assert (= (and b!1471446 (not c!135618)) b!1471448))

(declare-fun m!1358281 () Bool)

(assert (=> d!155503 m!1358281))

(declare-fun m!1358283 () Bool)

(assert (=> d!155503 m!1358283))

(assert (=> d!155503 m!1358157))

(assert (=> d!155503 m!1357949))

(assert (=> b!1471448 m!1358153))

(assert (=> b!1471448 m!1358153))

(declare-fun m!1358285 () Bool)

(assert (=> b!1471448 m!1358285))

(assert (=> b!1470974 d!155503))

(declare-fun b!1471450 () Bool)

(declare-fun e!825941 () SeekEntryResult!12068)

(declare-fun lt!643278 () SeekEntryResult!12068)

(assert (=> b!1471450 (= e!825941 (Found!12068 (index!50666 lt!643278)))))

(declare-fun d!155513 () Bool)

(declare-fun lt!643279 () SeekEntryResult!12068)

(assert (=> d!155513 (and (or (is-Undefined!12068 lt!643279) (not (is-Found!12068 lt!643279)) (and (bvsge (index!50665 lt!643279) #b00000000000000000000000000000000) (bvslt (index!50665 lt!643279) (size!48378 lt!643092)))) (or (is-Undefined!12068 lt!643279) (is-Found!12068 lt!643279) (not (is-MissingZero!12068 lt!643279)) (and (bvsge (index!50664 lt!643279) #b00000000000000000000000000000000) (bvslt (index!50664 lt!643279) (size!48378 lt!643092)))) (or (is-Undefined!12068 lt!643279) (is-Found!12068 lt!643279) (is-MissingZero!12068 lt!643279) (not (is-MissingVacant!12068 lt!643279)) (and (bvsge (index!50667 lt!643279) #b00000000000000000000000000000000) (bvslt (index!50667 lt!643279) (size!48378 lt!643092)))) (or (is-Undefined!12068 lt!643279) (ite (is-Found!12068 lt!643279) (= (select (arr!47828 lt!643092) (index!50665 lt!643279)) lt!643091) (ite (is-MissingZero!12068 lt!643279) (= (select (arr!47828 lt!643092) (index!50664 lt!643279)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12068 lt!643279) (= (select (arr!47828 lt!643092) (index!50667 lt!643279)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!825942 () SeekEntryResult!12068)

(assert (=> d!155513 (= lt!643279 e!825942)))

(declare-fun c!135619 () Bool)

(assert (=> d!155513 (= c!135619 (and (is-Intermediate!12068 lt!643278) (undefined!12880 lt!643278)))))

(assert (=> d!155513 (= lt!643278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643091 mask!2687) lt!643091 lt!643092 mask!2687))))

(assert (=> d!155513 (validMask!0 mask!2687)))

(assert (=> d!155513 (= (seekEntryOrOpen!0 lt!643091 lt!643092 mask!2687) lt!643279)))

(declare-fun e!825940 () SeekEntryResult!12068)

(declare-fun b!1471451 () Bool)

(assert (=> b!1471451 (= e!825940 (seekKeyOrZeroReturnVacant!0 (x!132246 lt!643278) (index!50666 lt!643278) (index!50666 lt!643278) lt!643091 lt!643092 mask!2687))))

(declare-fun b!1471452 () Bool)

(declare-fun c!135620 () Bool)

(declare-fun lt!643280 () (_ BitVec 64))

(assert (=> b!1471452 (= c!135620 (= lt!643280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471452 (= e!825941 e!825940)))

(declare-fun b!1471453 () Bool)

(assert (=> b!1471453 (= e!825942 Undefined!12068)))

(declare-fun b!1471454 () Bool)

(assert (=> b!1471454 (= e!825940 (MissingZero!12068 (index!50666 lt!643278)))))

(declare-fun b!1471455 () Bool)

(assert (=> b!1471455 (= e!825942 e!825941)))

(assert (=> b!1471455 (= lt!643280 (select (arr!47828 lt!643092) (index!50666 lt!643278)))))

(declare-fun c!135621 () Bool)

(assert (=> b!1471455 (= c!135621 (= lt!643280 lt!643091))))

(assert (= (and d!155513 c!135619) b!1471453))

(assert (= (and d!155513 (not c!135619)) b!1471455))

(assert (= (and b!1471455 c!135621) b!1471450))

(assert (= (and b!1471455 (not c!135621)) b!1471452))

(assert (= (and b!1471452 c!135620) b!1471454))

(assert (= (and b!1471452 (not c!135620)) b!1471451))

(assert (=> d!155513 m!1357963))

(assert (=> d!155513 m!1357965))

(declare-fun m!1358287 () Bool)

(assert (=> d!155513 m!1358287))

(assert (=> d!155513 m!1357949))

(declare-fun m!1358289 () Bool)

(assert (=> d!155513 m!1358289))

(declare-fun m!1358291 () Bool)

(assert (=> d!155513 m!1358291))

(assert (=> d!155513 m!1357963))

(declare-fun m!1358293 () Bool)

(assert (=> b!1471451 m!1358293))

(declare-fun m!1358295 () Bool)

(assert (=> b!1471455 m!1358295))

(assert (=> b!1470974 d!155513))

(declare-fun d!155515 () Bool)

(assert (=> d!155515 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125692 d!155515))

(declare-fun d!155517 () Bool)

(assert (=> d!155517 (= (array_inv!36856 a!2862) (bvsge (size!48378 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125692 d!155517))

(declare-fun b!1471456 () Bool)

(declare-fun e!825944 () Bool)

(declare-fun lt!643282 () SeekEntryResult!12068)

(assert (=> b!1471456 (= e!825944 (bvsge (x!132246 lt!643282) #b01111111111111111111111111111110))))

(declare-fun b!1471457 () Bool)

(assert (=> b!1471457 (and (bvsge (index!50666 lt!643282) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643282) (size!48378 lt!643092)))))

(declare-fun e!825947 () Bool)

(assert (=> b!1471457 (= e!825947 (= (select (arr!47828 lt!643092) (index!50666 lt!643282)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471458 () Bool)

(declare-fun e!825943 () SeekEntryResult!12068)

(assert (=> b!1471458 (= e!825943 (Intermediate!12068 true (toIndex!0 lt!643091 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471459 () Bool)

(assert (=> b!1471459 (and (bvsge (index!50666 lt!643282) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643282) (size!48378 lt!643092)))))

(declare-fun res!999239 () Bool)

(assert (=> b!1471459 (= res!999239 (= (select (arr!47828 lt!643092) (index!50666 lt!643282)) lt!643091))))

(assert (=> b!1471459 (=> res!999239 e!825947)))

(declare-fun e!825946 () Bool)

(assert (=> b!1471459 (= e!825946 e!825947)))

(declare-fun d!155519 () Bool)

(assert (=> d!155519 e!825944))

(declare-fun c!135623 () Bool)

(assert (=> d!155519 (= c!135623 (and (is-Intermediate!12068 lt!643282) (undefined!12880 lt!643282)))))

(assert (=> d!155519 (= lt!643282 e!825943)))

(declare-fun c!135622 () Bool)

(assert (=> d!155519 (= c!135622 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!643281 () (_ BitVec 64))

(assert (=> d!155519 (= lt!643281 (select (arr!47828 lt!643092) (toIndex!0 lt!643091 mask!2687)))))

(assert (=> d!155519 (validMask!0 mask!2687)))

(assert (=> d!155519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643091 mask!2687) lt!643091 lt!643092 mask!2687) lt!643282)))

(declare-fun b!1471460 () Bool)

(declare-fun e!825945 () SeekEntryResult!12068)

(assert (=> b!1471460 (= e!825945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643091 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643091 lt!643092 mask!2687))))

(declare-fun b!1471461 () Bool)

(assert (=> b!1471461 (= e!825945 (Intermediate!12068 false (toIndex!0 lt!643091 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471462 () Bool)

(assert (=> b!1471462 (and (bvsge (index!50666 lt!643282) #b00000000000000000000000000000000) (bvslt (index!50666 lt!643282) (size!48378 lt!643092)))))

(declare-fun res!999240 () Bool)

(assert (=> b!1471462 (= res!999240 (= (select (arr!47828 lt!643092) (index!50666 lt!643282)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471462 (=> res!999240 e!825947)))

(declare-fun b!1471463 () Bool)

(assert (=> b!1471463 (= e!825944 e!825946)))

(declare-fun res!999241 () Bool)

(assert (=> b!1471463 (= res!999241 (and (is-Intermediate!12068 lt!643282) (not (undefined!12880 lt!643282)) (bvslt (x!132246 lt!643282) #b01111111111111111111111111111110) (bvsge (x!132246 lt!643282) #b00000000000000000000000000000000) (bvsge (x!132246 lt!643282) #b00000000000000000000000000000000)))))

(assert (=> b!1471463 (=> (not res!999241) (not e!825946))))

(declare-fun b!1471464 () Bool)

(assert (=> b!1471464 (= e!825943 e!825945)))

(declare-fun c!135624 () Bool)

(assert (=> b!1471464 (= c!135624 (or (= lt!643281 lt!643091) (= (bvadd lt!643281 lt!643281) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155519 c!135622) b!1471458))

(assert (= (and d!155519 (not c!135622)) b!1471464))

(assert (= (and b!1471464 c!135624) b!1471461))

(assert (= (and b!1471464 (not c!135624)) b!1471460))

(assert (= (and d!155519 c!135623) b!1471456))

(assert (= (and d!155519 (not c!135623)) b!1471463))

(assert (= (and b!1471463 res!999241) b!1471459))

(assert (= (and b!1471459 (not res!999239)) b!1471462))

(assert (= (and b!1471462 (not res!999240)) b!1471457))

(declare-fun m!1358297 () Bool)

(assert (=> b!1471459 m!1358297))

(assert (=> b!1471460 m!1357963))

(declare-fun m!1358299 () Bool)

(assert (=> b!1471460 m!1358299))

(assert (=> b!1471460 m!1358299))

(declare-fun m!1358301 () Bool)

(assert (=> b!1471460 m!1358301))

(assert (=> b!1471457 m!1358297))

(assert (=> d!155519 m!1357963))

(declare-fun m!1358303 () Bool)

(assert (=> d!155519 m!1358303))

(assert (=> d!155519 m!1357949))

(assert (=> b!1471462 m!1358297))

(assert (=> b!1470986 d!155519))

(declare-fun d!155521 () Bool)

(declare-fun lt!643284 () (_ BitVec 32))

