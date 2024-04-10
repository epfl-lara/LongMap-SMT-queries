; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125694 () Bool)

(assert start!125694)

(declare-fun b!1471020 () Bool)

(declare-fun res!999090 () Bool)

(declare-fun e!825695 () Bool)

(assert (=> b!1471020 (=> (not res!999090) (not e!825695))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471020 (= res!999090 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471021 () Bool)

(declare-fun res!999088 () Bool)

(declare-fun e!825700 () Bool)

(assert (=> b!1471021 (=> (not res!999088) (not e!825700))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99085 0))(
  ( (array!99086 (arr!47829 (Array (_ BitVec 32) (_ BitVec 64))) (size!48379 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99085)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12069 0))(
  ( (MissingZero!12069 (index!50668 (_ BitVec 32))) (Found!12069 (index!50669 (_ BitVec 32))) (Intermediate!12069 (undefined!12881 Bool) (index!50670 (_ BitVec 32)) (x!132247 (_ BitVec 32))) (Undefined!12069) (MissingVacant!12069 (index!50671 (_ BitVec 32))) )
))
(declare-fun lt!643108 () SeekEntryResult!12069)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99085 (_ BitVec 32)) SeekEntryResult!12069)

(assert (=> b!1471021 (= res!999088 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47829 a!2862) j!93) a!2862 mask!2687) lt!643108))))

(declare-fun lt!643110 () (_ BitVec 64))

(declare-fun e!825699 () Bool)

(declare-fun b!1471022 () Bool)

(declare-fun lt!643109 () array!99085)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99085 (_ BitVec 32)) SeekEntryResult!12069)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99085 (_ BitVec 32)) SeekEntryResult!12069)

(assert (=> b!1471022 (= e!825699 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643110 lt!643109 mask!2687) (seekEntryOrOpen!0 lt!643110 lt!643109 mask!2687)))))

(declare-fun b!1471023 () Bool)

(declare-fun res!999083 () Bool)

(assert (=> b!1471023 (=> (not res!999083) (not e!825695))))

(assert (=> b!1471023 (= res!999083 e!825699)))

(declare-fun c!135483 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471023 (= c!135483 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471024 () Bool)

(declare-fun res!999084 () Bool)

(declare-fun e!825696 () Bool)

(assert (=> b!1471024 (=> (not res!999084) (not e!825696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471024 (= res!999084 (validKeyInArray!0 (select (arr!47829 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1471026 () Bool)

(assert (=> b!1471026 (= e!825695 (not (or (= (select (arr!47829 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47829 a!2862) intermediateBeforeIndex!19) (select (arr!47829 a!2862) j!93)))))))

(declare-fun e!825697 () Bool)

(assert (=> b!1471026 e!825697))

(declare-fun res!999078 () Bool)

(assert (=> b!1471026 (=> (not res!999078) (not e!825697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99085 (_ BitVec 32)) Bool)

(assert (=> b!1471026 (= res!999078 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49478 0))(
  ( (Unit!49479) )
))
(declare-fun lt!643106 () Unit!49478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49478)

(assert (=> b!1471026 (= lt!643106 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471027 () Bool)

(declare-fun res!999087 () Bool)

(assert (=> b!1471027 (=> (not res!999087) (not e!825696))))

(declare-datatypes ((List!34330 0))(
  ( (Nil!34327) (Cons!34326 (h!35679 (_ BitVec 64)) (t!49024 List!34330)) )
))
(declare-fun arrayNoDuplicates!0 (array!99085 (_ BitVec 32) List!34330) Bool)

(assert (=> b!1471027 (= res!999087 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34327))))

(declare-fun b!1471028 () Bool)

(declare-fun res!999081 () Bool)

(assert (=> b!1471028 (=> (not res!999081) (not e!825696))))

(assert (=> b!1471028 (= res!999081 (validKeyInArray!0 (select (arr!47829 a!2862) i!1006)))))

(declare-fun b!1471029 () Bool)

(declare-fun e!825698 () Bool)

(assert (=> b!1471029 (= e!825698 e!825700)))

(declare-fun res!999079 () Bool)

(assert (=> b!1471029 (=> (not res!999079) (not e!825700))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471029 (= res!999079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) (select (arr!47829 a!2862) j!93) a!2862 mask!2687) lt!643108))))

(assert (=> b!1471029 (= lt!643108 (Intermediate!12069 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471030 () Bool)

(declare-fun res!999091 () Bool)

(assert (=> b!1471030 (=> (not res!999091) (not e!825696))))

(assert (=> b!1471030 (= res!999091 (and (= (size!48379 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48379 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48379 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471031 () Bool)

(declare-fun res!999082 () Bool)

(assert (=> b!1471031 (=> (not res!999082) (not e!825696))))

(assert (=> b!1471031 (= res!999082 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48379 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48379 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48379 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!999085 () Bool)

(assert (=> start!125694 (=> (not res!999085) (not e!825696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125694 (= res!999085 (validMask!0 mask!2687))))

(assert (=> start!125694 e!825696))

(assert (=> start!125694 true))

(declare-fun array_inv!36857 (array!99085) Bool)

(assert (=> start!125694 (array_inv!36857 a!2862)))

(declare-fun b!1471025 () Bool)

(declare-fun res!999089 () Bool)

(assert (=> b!1471025 (=> (not res!999089) (not e!825696))))

(assert (=> b!1471025 (= res!999089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471032 () Bool)

(assert (=> b!1471032 (= e!825700 e!825695)))

(declare-fun res!999086 () Bool)

(assert (=> b!1471032 (=> (not res!999086) (not e!825695))))

(declare-fun lt!643107 () SeekEntryResult!12069)

(assert (=> b!1471032 (= res!999086 (= lt!643107 (Intermediate!12069 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471032 (= lt!643107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643110 mask!2687) lt!643110 lt!643109 mask!2687))))

(assert (=> b!1471032 (= lt!643110 (select (store (arr!47829 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471033 () Bool)

(assert (=> b!1471033 (= e!825697 (= (seekEntryOrOpen!0 (select (arr!47829 a!2862) j!93) a!2862 mask!2687) (Found!12069 j!93)))))

(declare-fun b!1471034 () Bool)

(assert (=> b!1471034 (= e!825696 e!825698)))

(declare-fun res!999080 () Bool)

(assert (=> b!1471034 (=> (not res!999080) (not e!825698))))

(assert (=> b!1471034 (= res!999080 (= (select (store (arr!47829 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471034 (= lt!643109 (array!99086 (store (arr!47829 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48379 a!2862)))))

(declare-fun b!1471035 () Bool)

(assert (=> b!1471035 (= e!825699 (= lt!643107 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643110 lt!643109 mask!2687)))))

(assert (= (and start!125694 res!999085) b!1471030))

(assert (= (and b!1471030 res!999091) b!1471028))

(assert (= (and b!1471028 res!999081) b!1471024))

(assert (= (and b!1471024 res!999084) b!1471025))

(assert (= (and b!1471025 res!999089) b!1471027))

(assert (= (and b!1471027 res!999087) b!1471031))

(assert (= (and b!1471031 res!999082) b!1471034))

(assert (= (and b!1471034 res!999080) b!1471029))

(assert (= (and b!1471029 res!999079) b!1471021))

(assert (= (and b!1471021 res!999088) b!1471032))

(assert (= (and b!1471032 res!999086) b!1471023))

(assert (= (and b!1471023 c!135483) b!1471035))

(assert (= (and b!1471023 (not c!135483)) b!1471022))

(assert (= (and b!1471023 res!999083) b!1471020))

(assert (= (and b!1471020 res!999090) b!1471026))

(assert (= (and b!1471026 res!999078) b!1471033))

(declare-fun m!1357973 () Bool)

(assert (=> start!125694 m!1357973))

(declare-fun m!1357975 () Bool)

(assert (=> start!125694 m!1357975))

(declare-fun m!1357977 () Bool)

(assert (=> b!1471035 m!1357977))

(declare-fun m!1357979 () Bool)

(assert (=> b!1471024 m!1357979))

(assert (=> b!1471024 m!1357979))

(declare-fun m!1357981 () Bool)

(assert (=> b!1471024 m!1357981))

(assert (=> b!1471029 m!1357979))

(assert (=> b!1471029 m!1357979))

(declare-fun m!1357983 () Bool)

(assert (=> b!1471029 m!1357983))

(assert (=> b!1471029 m!1357983))

(assert (=> b!1471029 m!1357979))

(declare-fun m!1357985 () Bool)

(assert (=> b!1471029 m!1357985))

(assert (=> b!1471021 m!1357979))

(assert (=> b!1471021 m!1357979))

(declare-fun m!1357987 () Bool)

(assert (=> b!1471021 m!1357987))

(declare-fun m!1357989 () Bool)

(assert (=> b!1471022 m!1357989))

(declare-fun m!1357991 () Bool)

(assert (=> b!1471022 m!1357991))

(declare-fun m!1357993 () Bool)

(assert (=> b!1471032 m!1357993))

(assert (=> b!1471032 m!1357993))

(declare-fun m!1357995 () Bool)

(assert (=> b!1471032 m!1357995))

(declare-fun m!1357997 () Bool)

(assert (=> b!1471032 m!1357997))

(declare-fun m!1357999 () Bool)

(assert (=> b!1471032 m!1357999))

(declare-fun m!1358001 () Bool)

(assert (=> b!1471025 m!1358001))

(declare-fun m!1358003 () Bool)

(assert (=> b!1471028 m!1358003))

(assert (=> b!1471028 m!1358003))

(declare-fun m!1358005 () Bool)

(assert (=> b!1471028 m!1358005))

(assert (=> b!1471034 m!1357997))

(declare-fun m!1358007 () Bool)

(assert (=> b!1471034 m!1358007))

(declare-fun m!1358009 () Bool)

(assert (=> b!1471026 m!1358009))

(assert (=> b!1471026 m!1357979))

(declare-fun m!1358011 () Bool)

(assert (=> b!1471026 m!1358011))

(declare-fun m!1358013 () Bool)

(assert (=> b!1471026 m!1358013))

(assert (=> b!1471033 m!1357979))

(assert (=> b!1471033 m!1357979))

(declare-fun m!1358015 () Bool)

(assert (=> b!1471033 m!1358015))

(declare-fun m!1358017 () Bool)

(assert (=> b!1471027 m!1358017))

(check-sat (not start!125694) (not b!1471024) (not b!1471028) (not b!1471021) (not b!1471025) (not b!1471022) (not b!1471033) (not b!1471035) (not b!1471027) (not b!1471026) (not b!1471032) (not b!1471029))
(check-sat)
(get-model)

(declare-fun d!155421 () Bool)

(declare-fun res!999138 () Bool)

(declare-fun e!825731 () Bool)

(assert (=> d!155421 (=> res!999138 e!825731)))

(assert (=> d!155421 (= res!999138 (bvsge j!93 (size!48379 a!2862)))))

(assert (=> d!155421 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!825731)))

(declare-fun bm!67717 () Bool)

(declare-fun call!67720 () Bool)

(assert (=> bm!67717 (= call!67720 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1471092 () Bool)

(declare-fun e!825729 () Bool)

(assert (=> b!1471092 (= e!825729 call!67720)))

(declare-fun b!1471093 () Bool)

(declare-fun e!825730 () Bool)

(assert (=> b!1471093 (= e!825729 e!825730)))

(declare-fun lt!643132 () (_ BitVec 64))

(assert (=> b!1471093 (= lt!643132 (select (arr!47829 a!2862) j!93))))

(declare-fun lt!643134 () Unit!49478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99085 (_ BitVec 64) (_ BitVec 32)) Unit!49478)

(assert (=> b!1471093 (= lt!643134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643132 j!93))))

(declare-fun arrayContainsKey!0 (array!99085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1471093 (arrayContainsKey!0 a!2862 lt!643132 #b00000000000000000000000000000000)))

(declare-fun lt!643133 () Unit!49478)

(assert (=> b!1471093 (= lt!643133 lt!643134)))

(declare-fun res!999139 () Bool)

(assert (=> b!1471093 (= res!999139 (= (seekEntryOrOpen!0 (select (arr!47829 a!2862) j!93) a!2862 mask!2687) (Found!12069 j!93)))))

(assert (=> b!1471093 (=> (not res!999139) (not e!825730))))

(declare-fun b!1471094 () Bool)

(assert (=> b!1471094 (= e!825730 call!67720)))

(declare-fun b!1471095 () Bool)

(assert (=> b!1471095 (= e!825731 e!825729)))

(declare-fun c!135489 () Bool)

(assert (=> b!1471095 (= c!135489 (validKeyInArray!0 (select (arr!47829 a!2862) j!93)))))

(assert (= (and d!155421 (not res!999138)) b!1471095))

(assert (= (and b!1471095 c!135489) b!1471093))

(assert (= (and b!1471095 (not c!135489)) b!1471092))

(assert (= (and b!1471093 res!999139) b!1471094))

(assert (= (or b!1471094 b!1471092) bm!67717))

(declare-fun m!1358065 () Bool)

(assert (=> bm!67717 m!1358065))

(assert (=> b!1471093 m!1357979))

(declare-fun m!1358067 () Bool)

(assert (=> b!1471093 m!1358067))

(declare-fun m!1358069 () Bool)

(assert (=> b!1471093 m!1358069))

(assert (=> b!1471093 m!1357979))

(assert (=> b!1471093 m!1358015))

(assert (=> b!1471095 m!1357979))

(assert (=> b!1471095 m!1357979))

(assert (=> b!1471095 m!1357981))

(assert (=> b!1471026 d!155421))

(declare-fun d!155423 () Bool)

(assert (=> d!155423 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!643137 () Unit!49478)

(declare-fun choose!38 (array!99085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49478)

(assert (=> d!155423 (= lt!643137 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155423 (validMask!0 mask!2687)))

(assert (=> d!155423 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!643137)))

(declare-fun bs!42506 () Bool)

(assert (= bs!42506 d!155423))

(assert (=> bs!42506 m!1358011))

(declare-fun m!1358071 () Bool)

(assert (=> bs!42506 m!1358071))

(assert (=> bs!42506 m!1357973))

(assert (=> b!1471026 d!155423))

(declare-fun d!155425 () Bool)

(declare-fun res!999148 () Bool)

(declare-fun e!825740 () Bool)

(assert (=> d!155425 (=> res!999148 e!825740)))

(assert (=> d!155425 (= res!999148 (bvsge #b00000000000000000000000000000000 (size!48379 a!2862)))))

(assert (=> d!155425 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34327) e!825740)))

(declare-fun b!1471106 () Bool)

(declare-fun e!825742 () Bool)

(declare-fun call!67723 () Bool)

(assert (=> b!1471106 (= e!825742 call!67723)))

(declare-fun b!1471107 () Bool)

(declare-fun e!825741 () Bool)

(declare-fun contains!9899 (List!34330 (_ BitVec 64)) Bool)

(assert (=> b!1471107 (= e!825741 (contains!9899 Nil!34327 (select (arr!47829 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471108 () Bool)

(declare-fun e!825743 () Bool)

(assert (=> b!1471108 (= e!825743 e!825742)))

(declare-fun c!135492 () Bool)

(assert (=> b!1471108 (= c!135492 (validKeyInArray!0 (select (arr!47829 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1471109 () Bool)

(assert (=> b!1471109 (= e!825740 e!825743)))

(declare-fun res!999147 () Bool)

(assert (=> b!1471109 (=> (not res!999147) (not e!825743))))

(assert (=> b!1471109 (= res!999147 (not e!825741))))

(declare-fun res!999146 () Bool)

(assert (=> b!1471109 (=> (not res!999146) (not e!825741))))

(assert (=> b!1471109 (= res!999146 (validKeyInArray!0 (select (arr!47829 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67720 () Bool)

(assert (=> bm!67720 (= call!67723 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!135492 (Cons!34326 (select (arr!47829 a!2862) #b00000000000000000000000000000000) Nil!34327) Nil!34327)))))

(declare-fun b!1471110 () Bool)

(assert (=> b!1471110 (= e!825742 call!67723)))

(assert (= (and d!155425 (not res!999148)) b!1471109))

(assert (= (and b!1471109 res!999146) b!1471107))

(assert (= (and b!1471109 res!999147) b!1471108))

(assert (= (and b!1471108 c!135492) b!1471106))

(assert (= (and b!1471108 (not c!135492)) b!1471110))

(assert (= (or b!1471106 b!1471110) bm!67720))

(declare-fun m!1358073 () Bool)

(assert (=> b!1471107 m!1358073))

(assert (=> b!1471107 m!1358073))

(declare-fun m!1358075 () Bool)

(assert (=> b!1471107 m!1358075))

(assert (=> b!1471108 m!1358073))

(assert (=> b!1471108 m!1358073))

(declare-fun m!1358077 () Bool)

(assert (=> b!1471108 m!1358077))

(assert (=> b!1471109 m!1358073))

(assert (=> b!1471109 m!1358073))

(assert (=> b!1471109 m!1358077))

(assert (=> bm!67720 m!1358073))

(declare-fun m!1358079 () Bool)

(assert (=> bm!67720 m!1358079))

(assert (=> b!1471027 d!155425))

(declare-fun d!155427 () Bool)

(assert (=> d!155427 (= (validKeyInArray!0 (select (arr!47829 a!2862) i!1006)) (and (not (= (select (arr!47829 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47829 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1471028 d!155427))

(declare-fun b!1471156 () Bool)

(declare-fun lt!643148 () SeekEntryResult!12069)

(assert (=> b!1471156 (and (bvsge (index!50670 lt!643148) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643148) (size!48379 a!2862)))))

(declare-fun e!825770 () Bool)

(assert (=> b!1471156 (= e!825770 (= (select (arr!47829 a!2862) (index!50670 lt!643148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471157 () Bool)

(declare-fun e!825771 () Bool)

(assert (=> b!1471157 (= e!825771 (bvsge (x!132247 lt!643148) #b01111111111111111111111111111110))))

(declare-fun b!1471158 () Bool)

(assert (=> b!1471158 (and (bvsge (index!50670 lt!643148) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643148) (size!48379 a!2862)))))

(declare-fun res!999165 () Bool)

(assert (=> b!1471158 (= res!999165 (= (select (arr!47829 a!2862) (index!50670 lt!643148)) (select (arr!47829 a!2862) j!93)))))

(assert (=> b!1471158 (=> res!999165 e!825770)))

(declare-fun e!825773 () Bool)

(assert (=> b!1471158 (= e!825773 e!825770)))

(declare-fun b!1471159 () Bool)

(assert (=> b!1471159 (and (bvsge (index!50670 lt!643148) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643148) (size!48379 a!2862)))))

(declare-fun res!999164 () Bool)

(assert (=> b!1471159 (= res!999164 (= (select (arr!47829 a!2862) (index!50670 lt!643148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471159 (=> res!999164 e!825770)))

(declare-fun b!1471161 () Bool)

(assert (=> b!1471161 (= e!825771 e!825773)))

(declare-fun res!999166 () Bool)

(get-info :version)

(assert (=> b!1471161 (= res!999166 (and ((_ is Intermediate!12069) lt!643148) (not (undefined!12881 lt!643148)) (bvslt (x!132247 lt!643148) #b01111111111111111111111111111110) (bvsge (x!132247 lt!643148) #b00000000000000000000000000000000) (bvsge (x!132247 lt!643148) #b00000000000000000000000000000000)))))

(assert (=> b!1471161 (=> (not res!999166) (not e!825773))))

(declare-fun e!825769 () SeekEntryResult!12069)

(declare-fun b!1471162 () Bool)

(assert (=> b!1471162 (= e!825769 (Intermediate!12069 true (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1471163 () Bool)

(declare-fun e!825772 () SeekEntryResult!12069)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471163 (= e!825772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47829 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471164 () Bool)

(assert (=> b!1471164 (= e!825769 e!825772)))

(declare-fun c!135508 () Bool)

(declare-fun lt!643149 () (_ BitVec 64))

(assert (=> b!1471164 (= c!135508 (or (= lt!643149 (select (arr!47829 a!2862) j!93)) (= (bvadd lt!643149 lt!643149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471160 () Bool)

(assert (=> b!1471160 (= e!825772 (Intermediate!12069 false (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155431 () Bool)

(assert (=> d!155431 e!825771))

(declare-fun c!135510 () Bool)

(assert (=> d!155431 (= c!135510 (and ((_ is Intermediate!12069) lt!643148) (undefined!12881 lt!643148)))))

(assert (=> d!155431 (= lt!643148 e!825769)))

(declare-fun c!135509 () Bool)

(assert (=> d!155431 (= c!135509 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155431 (= lt!643149 (select (arr!47829 a!2862) (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687)))))

(assert (=> d!155431 (validMask!0 mask!2687)))

(assert (=> d!155431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) (select (arr!47829 a!2862) j!93) a!2862 mask!2687) lt!643148)))

(assert (= (and d!155431 c!135509) b!1471162))

(assert (= (and d!155431 (not c!135509)) b!1471164))

(assert (= (and b!1471164 c!135508) b!1471160))

(assert (= (and b!1471164 (not c!135508)) b!1471163))

(assert (= (and d!155431 c!135510) b!1471157))

(assert (= (and d!155431 (not c!135510)) b!1471161))

(assert (= (and b!1471161 res!999166) b!1471158))

(assert (= (and b!1471158 (not res!999165)) b!1471159))

(assert (= (and b!1471159 (not res!999164)) b!1471156))

(assert (=> d!155431 m!1357983))

(declare-fun m!1358083 () Bool)

(assert (=> d!155431 m!1358083))

(assert (=> d!155431 m!1357973))

(declare-fun m!1358085 () Bool)

(assert (=> b!1471159 m!1358085))

(assert (=> b!1471163 m!1357983))

(declare-fun m!1358089 () Bool)

(assert (=> b!1471163 m!1358089))

(assert (=> b!1471163 m!1358089))

(assert (=> b!1471163 m!1357979))

(declare-fun m!1358095 () Bool)

(assert (=> b!1471163 m!1358095))

(assert (=> b!1471156 m!1358085))

(assert (=> b!1471158 m!1358085))

(assert (=> b!1471029 d!155431))

(declare-fun d!155437 () Bool)

(declare-fun lt!643163 () (_ BitVec 32))

(declare-fun lt!643162 () (_ BitVec 32))

(assert (=> d!155437 (= lt!643163 (bvmul (bvxor lt!643162 (bvlshr lt!643162 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155437 (= lt!643162 ((_ extract 31 0) (bvand (bvxor (select (arr!47829 a!2862) j!93) (bvlshr (select (arr!47829 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155437 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999170 (let ((h!35681 ((_ extract 31 0) (bvand (bvxor (select (arr!47829 a!2862) j!93) (bvlshr (select (arr!47829 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132251 (bvmul (bvxor h!35681 (bvlshr h!35681 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132251 (bvlshr x!132251 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999170 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999170 #b00000000000000000000000000000000))))))

(assert (=> d!155437 (= (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) (bvand (bvxor lt!643163 (bvlshr lt!643163 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1471029 d!155437))

(declare-fun b!1471182 () Bool)

(declare-fun lt!643168 () SeekEntryResult!12069)

(assert (=> b!1471182 (and (bvsge (index!50670 lt!643168) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643168) (size!48379 lt!643109)))))

(declare-fun e!825786 () Bool)

(assert (=> b!1471182 (= e!825786 (= (select (arr!47829 lt!643109) (index!50670 lt!643168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471183 () Bool)

(declare-fun e!825787 () Bool)

(assert (=> b!1471183 (= e!825787 (bvsge (x!132247 lt!643168) #b01111111111111111111111111111110))))

(declare-fun b!1471184 () Bool)

(assert (=> b!1471184 (and (bvsge (index!50670 lt!643168) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643168) (size!48379 lt!643109)))))

(declare-fun res!999177 () Bool)

(assert (=> b!1471184 (= res!999177 (= (select (arr!47829 lt!643109) (index!50670 lt!643168)) lt!643110))))

(assert (=> b!1471184 (=> res!999177 e!825786)))

(declare-fun e!825789 () Bool)

(assert (=> b!1471184 (= e!825789 e!825786)))

(declare-fun b!1471185 () Bool)

(assert (=> b!1471185 (and (bvsge (index!50670 lt!643168) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643168) (size!48379 lt!643109)))))

(declare-fun res!999176 () Bool)

(assert (=> b!1471185 (= res!999176 (= (select (arr!47829 lt!643109) (index!50670 lt!643168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471185 (=> res!999176 e!825786)))

(declare-fun b!1471187 () Bool)

(assert (=> b!1471187 (= e!825787 e!825789)))

(declare-fun res!999178 () Bool)

(assert (=> b!1471187 (= res!999178 (and ((_ is Intermediate!12069) lt!643168) (not (undefined!12881 lt!643168)) (bvslt (x!132247 lt!643168) #b01111111111111111111111111111110) (bvsge (x!132247 lt!643168) #b00000000000000000000000000000000) (bvsge (x!132247 lt!643168) #b00000000000000000000000000000000)))))

(assert (=> b!1471187 (=> (not res!999178) (not e!825789))))

(declare-fun b!1471188 () Bool)

(declare-fun e!825785 () SeekEntryResult!12069)

(assert (=> b!1471188 (= e!825785 (Intermediate!12069 true (toIndex!0 lt!643110 mask!2687) #b00000000000000000000000000000000))))

(declare-fun e!825788 () SeekEntryResult!12069)

(declare-fun b!1471189 () Bool)

(assert (=> b!1471189 (= e!825788 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!643110 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!643110 lt!643109 mask!2687))))

(declare-fun b!1471190 () Bool)

(assert (=> b!1471190 (= e!825785 e!825788)))

(declare-fun c!135516 () Bool)

(declare-fun lt!643169 () (_ BitVec 64))

(assert (=> b!1471190 (= c!135516 (or (= lt!643169 lt!643110) (= (bvadd lt!643169 lt!643169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471186 () Bool)

(assert (=> b!1471186 (= e!825788 (Intermediate!12069 false (toIndex!0 lt!643110 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!155441 () Bool)

(assert (=> d!155441 e!825787))

(declare-fun c!135518 () Bool)

(assert (=> d!155441 (= c!135518 (and ((_ is Intermediate!12069) lt!643168) (undefined!12881 lt!643168)))))

(assert (=> d!155441 (= lt!643168 e!825785)))

(declare-fun c!135517 () Bool)

(assert (=> d!155441 (= c!135517 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155441 (= lt!643169 (select (arr!47829 lt!643109) (toIndex!0 lt!643110 mask!2687)))))

(assert (=> d!155441 (validMask!0 mask!2687)))

(assert (=> d!155441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643110 mask!2687) lt!643110 lt!643109 mask!2687) lt!643168)))

(assert (= (and d!155441 c!135517) b!1471188))

(assert (= (and d!155441 (not c!135517)) b!1471190))

(assert (= (and b!1471190 c!135516) b!1471186))

(assert (= (and b!1471190 (not c!135516)) b!1471189))

(assert (= (and d!155441 c!135518) b!1471183))

(assert (= (and d!155441 (not c!135518)) b!1471187))

(assert (= (and b!1471187 res!999178) b!1471184))

(assert (= (and b!1471184 (not res!999177)) b!1471185))

(assert (= (and b!1471185 (not res!999176)) b!1471182))

(assert (=> d!155441 m!1357993))

(declare-fun m!1358105 () Bool)

(assert (=> d!155441 m!1358105))

(assert (=> d!155441 m!1357973))

(declare-fun m!1358107 () Bool)

(assert (=> b!1471185 m!1358107))

(assert (=> b!1471189 m!1357993))

(declare-fun m!1358109 () Bool)

(assert (=> b!1471189 m!1358109))

(assert (=> b!1471189 m!1358109))

(declare-fun m!1358111 () Bool)

(assert (=> b!1471189 m!1358111))

(assert (=> b!1471182 m!1358107))

(assert (=> b!1471184 m!1358107))

(assert (=> b!1471032 d!155441))

(declare-fun d!155445 () Bool)

(declare-fun lt!643175 () (_ BitVec 32))

(declare-fun lt!643174 () (_ BitVec 32))

(assert (=> d!155445 (= lt!643175 (bvmul (bvxor lt!643174 (bvlshr lt!643174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155445 (= lt!643174 ((_ extract 31 0) (bvand (bvxor lt!643110 (bvlshr lt!643110 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155445 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!999170 (let ((h!35681 ((_ extract 31 0) (bvand (bvxor lt!643110 (bvlshr lt!643110 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132251 (bvmul (bvxor h!35681 (bvlshr h!35681 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132251 (bvlshr x!132251 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!999170 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!999170 #b00000000000000000000000000000000))))))

(assert (=> d!155445 (= (toIndex!0 lt!643110 mask!2687) (bvand (bvxor lt!643175 (bvlshr lt!643175 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1471032 d!155445))

(declare-fun b!1471200 () Bool)

(declare-fun lt!643176 () SeekEntryResult!12069)

(assert (=> b!1471200 (and (bvsge (index!50670 lt!643176) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643176) (size!48379 a!2862)))))

(declare-fun e!825796 () Bool)

(assert (=> b!1471200 (= e!825796 (= (select (arr!47829 a!2862) (index!50670 lt!643176)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471201 () Bool)

(declare-fun e!825797 () Bool)

(assert (=> b!1471201 (= e!825797 (bvsge (x!132247 lt!643176) #b01111111111111111111111111111110))))

(declare-fun b!1471202 () Bool)

(assert (=> b!1471202 (and (bvsge (index!50670 lt!643176) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643176) (size!48379 a!2862)))))

(declare-fun res!999183 () Bool)

(assert (=> b!1471202 (= res!999183 (= (select (arr!47829 a!2862) (index!50670 lt!643176)) (select (arr!47829 a!2862) j!93)))))

(assert (=> b!1471202 (=> res!999183 e!825796)))

(declare-fun e!825799 () Bool)

(assert (=> b!1471202 (= e!825799 e!825796)))

(declare-fun b!1471203 () Bool)

(assert (=> b!1471203 (and (bvsge (index!50670 lt!643176) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643176) (size!48379 a!2862)))))

(declare-fun res!999182 () Bool)

(assert (=> b!1471203 (= res!999182 (= (select (arr!47829 a!2862) (index!50670 lt!643176)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471203 (=> res!999182 e!825796)))

(declare-fun b!1471205 () Bool)

(assert (=> b!1471205 (= e!825797 e!825799)))

(declare-fun res!999184 () Bool)

(assert (=> b!1471205 (= res!999184 (and ((_ is Intermediate!12069) lt!643176) (not (undefined!12881 lt!643176)) (bvslt (x!132247 lt!643176) #b01111111111111111111111111111110) (bvsge (x!132247 lt!643176) #b00000000000000000000000000000000) (bvsge (x!132247 lt!643176) x!665)))))

(assert (=> b!1471205 (=> (not res!999184) (not e!825799))))

(declare-fun b!1471206 () Bool)

(declare-fun e!825795 () SeekEntryResult!12069)

(assert (=> b!1471206 (= e!825795 (Intermediate!12069 true index!646 x!665))))

(declare-fun b!1471207 () Bool)

(declare-fun e!825798 () SeekEntryResult!12069)

(assert (=> b!1471207 (= e!825798 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47829 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1471208 () Bool)

(assert (=> b!1471208 (= e!825795 e!825798)))

(declare-fun lt!643177 () (_ BitVec 64))

(declare-fun c!135522 () Bool)

(assert (=> b!1471208 (= c!135522 (or (= lt!643177 (select (arr!47829 a!2862) j!93)) (= (bvadd lt!643177 lt!643177) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471204 () Bool)

(assert (=> b!1471204 (= e!825798 (Intermediate!12069 false index!646 x!665))))

(declare-fun d!155447 () Bool)

(assert (=> d!155447 e!825797))

(declare-fun c!135524 () Bool)

(assert (=> d!155447 (= c!135524 (and ((_ is Intermediate!12069) lt!643176) (undefined!12881 lt!643176)))))

(assert (=> d!155447 (= lt!643176 e!825795)))

(declare-fun c!135523 () Bool)

(assert (=> d!155447 (= c!135523 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155447 (= lt!643177 (select (arr!47829 a!2862) index!646))))

(assert (=> d!155447 (validMask!0 mask!2687)))

(assert (=> d!155447 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47829 a!2862) j!93) a!2862 mask!2687) lt!643176)))

(assert (= (and d!155447 c!135523) b!1471206))

(assert (= (and d!155447 (not c!135523)) b!1471208))

(assert (= (and b!1471208 c!135522) b!1471204))

(assert (= (and b!1471208 (not c!135522)) b!1471207))

(assert (= (and d!155447 c!135524) b!1471201))

(assert (= (and d!155447 (not c!135524)) b!1471205))

(assert (= (and b!1471205 res!999184) b!1471202))

(assert (= (and b!1471202 (not res!999183)) b!1471203))

(assert (= (and b!1471203 (not res!999182)) b!1471200))

(declare-fun m!1358121 () Bool)

(assert (=> d!155447 m!1358121))

(assert (=> d!155447 m!1357973))

(declare-fun m!1358123 () Bool)

(assert (=> b!1471203 m!1358123))

(declare-fun m!1358125 () Bool)

(assert (=> b!1471207 m!1358125))

(assert (=> b!1471207 m!1358125))

(assert (=> b!1471207 m!1357979))

(declare-fun m!1358127 () Bool)

(assert (=> b!1471207 m!1358127))

(assert (=> b!1471200 m!1358123))

(assert (=> b!1471202 m!1358123))

(assert (=> b!1471021 d!155447))

(declare-fun b!1471237 () Bool)

(declare-fun e!825817 () SeekEntryResult!12069)

(assert (=> b!1471237 (= e!825817 (MissingVacant!12069 intermediateAfterIndex!19))))

(declare-fun b!1471238 () Bool)

(declare-fun c!135538 () Bool)

(declare-fun lt!643195 () (_ BitVec 64))

(assert (=> b!1471238 (= c!135538 (= lt!643195 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825815 () SeekEntryResult!12069)

(assert (=> b!1471238 (= e!825815 e!825817)))

(declare-fun b!1471239 () Bool)

(declare-fun e!825816 () SeekEntryResult!12069)

(assert (=> b!1471239 (= e!825816 Undefined!12069)))

(declare-fun d!155453 () Bool)

(declare-fun lt!643194 () SeekEntryResult!12069)

(assert (=> d!155453 (and (or ((_ is Undefined!12069) lt!643194) (not ((_ is Found!12069) lt!643194)) (and (bvsge (index!50669 lt!643194) #b00000000000000000000000000000000) (bvslt (index!50669 lt!643194) (size!48379 lt!643109)))) (or ((_ is Undefined!12069) lt!643194) ((_ is Found!12069) lt!643194) (not ((_ is MissingVacant!12069) lt!643194)) (not (= (index!50671 lt!643194) intermediateAfterIndex!19)) (and (bvsge (index!50671 lt!643194) #b00000000000000000000000000000000) (bvslt (index!50671 lt!643194) (size!48379 lt!643109)))) (or ((_ is Undefined!12069) lt!643194) (ite ((_ is Found!12069) lt!643194) (= (select (arr!47829 lt!643109) (index!50669 lt!643194)) lt!643110) (and ((_ is MissingVacant!12069) lt!643194) (= (index!50671 lt!643194) intermediateAfterIndex!19) (= (select (arr!47829 lt!643109) (index!50671 lt!643194)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155453 (= lt!643194 e!825816)))

(declare-fun c!135539 () Bool)

(assert (=> d!155453 (= c!135539 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155453 (= lt!643195 (select (arr!47829 lt!643109) index!646))))

(assert (=> d!155453 (validMask!0 mask!2687)))

(assert (=> d!155453 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643110 lt!643109 mask!2687) lt!643194)))

(declare-fun b!1471240 () Bool)

(assert (=> b!1471240 (= e!825815 (Found!12069 index!646))))

(declare-fun b!1471241 () Bool)

(assert (=> b!1471241 (= e!825816 e!825815)))

(declare-fun c!135540 () Bool)

(assert (=> b!1471241 (= c!135540 (= lt!643195 lt!643110))))

(declare-fun b!1471242 () Bool)

(assert (=> b!1471242 (= e!825817 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!643110 lt!643109 mask!2687))))

(assert (= (and d!155453 c!135539) b!1471239))

(assert (= (and d!155453 (not c!135539)) b!1471241))

(assert (= (and b!1471241 c!135540) b!1471240))

(assert (= (and b!1471241 (not c!135540)) b!1471238))

(assert (= (and b!1471238 c!135538) b!1471237))

(assert (= (and b!1471238 (not c!135538)) b!1471242))

(declare-fun m!1358137 () Bool)

(assert (=> d!155453 m!1358137))

(declare-fun m!1358139 () Bool)

(assert (=> d!155453 m!1358139))

(declare-fun m!1358141 () Bool)

(assert (=> d!155453 m!1358141))

(assert (=> d!155453 m!1357973))

(assert (=> b!1471242 m!1358125))

(assert (=> b!1471242 m!1358125))

(declare-fun m!1358148 () Bool)

(assert (=> b!1471242 m!1358148))

(assert (=> b!1471022 d!155453))

(declare-fun b!1471300 () Bool)

(declare-fun e!825848 () SeekEntryResult!12069)

(declare-fun e!825849 () SeekEntryResult!12069)

(assert (=> b!1471300 (= e!825848 e!825849)))

(declare-fun lt!643216 () (_ BitVec 64))

(declare-fun lt!643218 () SeekEntryResult!12069)

(assert (=> b!1471300 (= lt!643216 (select (arr!47829 lt!643109) (index!50670 lt!643218)))))

(declare-fun c!135565 () Bool)

(assert (=> b!1471300 (= c!135565 (= lt!643216 lt!643110))))

(declare-fun d!155459 () Bool)

(declare-fun lt!643217 () SeekEntryResult!12069)

(assert (=> d!155459 (and (or ((_ is Undefined!12069) lt!643217) (not ((_ is Found!12069) lt!643217)) (and (bvsge (index!50669 lt!643217) #b00000000000000000000000000000000) (bvslt (index!50669 lt!643217) (size!48379 lt!643109)))) (or ((_ is Undefined!12069) lt!643217) ((_ is Found!12069) lt!643217) (not ((_ is MissingZero!12069) lt!643217)) (and (bvsge (index!50668 lt!643217) #b00000000000000000000000000000000) (bvslt (index!50668 lt!643217) (size!48379 lt!643109)))) (or ((_ is Undefined!12069) lt!643217) ((_ is Found!12069) lt!643217) ((_ is MissingZero!12069) lt!643217) (not ((_ is MissingVacant!12069) lt!643217)) (and (bvsge (index!50671 lt!643217) #b00000000000000000000000000000000) (bvslt (index!50671 lt!643217) (size!48379 lt!643109)))) (or ((_ is Undefined!12069) lt!643217) (ite ((_ is Found!12069) lt!643217) (= (select (arr!47829 lt!643109) (index!50669 lt!643217)) lt!643110) (ite ((_ is MissingZero!12069) lt!643217) (= (select (arr!47829 lt!643109) (index!50668 lt!643217)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12069) lt!643217) (= (select (arr!47829 lt!643109) (index!50671 lt!643217)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155459 (= lt!643217 e!825848)))

(declare-fun c!135567 () Bool)

(assert (=> d!155459 (= c!135567 (and ((_ is Intermediate!12069) lt!643218) (undefined!12881 lt!643218)))))

(assert (=> d!155459 (= lt!643218 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643110 mask!2687) lt!643110 lt!643109 mask!2687))))

(assert (=> d!155459 (validMask!0 mask!2687)))

(assert (=> d!155459 (= (seekEntryOrOpen!0 lt!643110 lt!643109 mask!2687) lt!643217)))

(declare-fun b!1471301 () Bool)

(assert (=> b!1471301 (= e!825848 Undefined!12069)))

(declare-fun b!1471302 () Bool)

(declare-fun c!135566 () Bool)

(assert (=> b!1471302 (= c!135566 (= lt!643216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825850 () SeekEntryResult!12069)

(assert (=> b!1471302 (= e!825849 e!825850)))

(declare-fun b!1471303 () Bool)

(assert (=> b!1471303 (= e!825849 (Found!12069 (index!50670 lt!643218)))))

(declare-fun b!1471304 () Bool)

(assert (=> b!1471304 (= e!825850 (MissingZero!12069 (index!50670 lt!643218)))))

(declare-fun b!1471305 () Bool)

(assert (=> b!1471305 (= e!825850 (seekKeyOrZeroReturnVacant!0 (x!132247 lt!643218) (index!50670 lt!643218) (index!50670 lt!643218) lt!643110 lt!643109 mask!2687))))

(assert (= (and d!155459 c!135567) b!1471301))

(assert (= (and d!155459 (not c!135567)) b!1471300))

(assert (= (and b!1471300 c!135565) b!1471303))

(assert (= (and b!1471300 (not c!135565)) b!1471302))

(assert (= (and b!1471302 c!135566) b!1471304))

(assert (= (and b!1471302 (not c!135566)) b!1471305))

(declare-fun m!1358159 () Bool)

(assert (=> b!1471300 m!1358159))

(assert (=> d!155459 m!1357973))

(declare-fun m!1358163 () Bool)

(assert (=> d!155459 m!1358163))

(declare-fun m!1358165 () Bool)

(assert (=> d!155459 m!1358165))

(declare-fun m!1358167 () Bool)

(assert (=> d!155459 m!1358167))

(assert (=> d!155459 m!1357993))

(assert (=> d!155459 m!1357993))

(assert (=> d!155459 m!1357995))

(declare-fun m!1358173 () Bool)

(assert (=> b!1471305 m!1358173))

(assert (=> b!1471022 d!155459))

(declare-fun b!1471312 () Bool)

(declare-fun e!825854 () SeekEntryResult!12069)

(declare-fun e!825855 () SeekEntryResult!12069)

(assert (=> b!1471312 (= e!825854 e!825855)))

(declare-fun lt!643222 () (_ BitVec 64))

(declare-fun lt!643224 () SeekEntryResult!12069)

(assert (=> b!1471312 (= lt!643222 (select (arr!47829 a!2862) (index!50670 lt!643224)))))

(declare-fun c!135571 () Bool)

(assert (=> b!1471312 (= c!135571 (= lt!643222 (select (arr!47829 a!2862) j!93)))))

(declare-fun d!155465 () Bool)

(declare-fun lt!643223 () SeekEntryResult!12069)

(assert (=> d!155465 (and (or ((_ is Undefined!12069) lt!643223) (not ((_ is Found!12069) lt!643223)) (and (bvsge (index!50669 lt!643223) #b00000000000000000000000000000000) (bvslt (index!50669 lt!643223) (size!48379 a!2862)))) (or ((_ is Undefined!12069) lt!643223) ((_ is Found!12069) lt!643223) (not ((_ is MissingZero!12069) lt!643223)) (and (bvsge (index!50668 lt!643223) #b00000000000000000000000000000000) (bvslt (index!50668 lt!643223) (size!48379 a!2862)))) (or ((_ is Undefined!12069) lt!643223) ((_ is Found!12069) lt!643223) ((_ is MissingZero!12069) lt!643223) (not ((_ is MissingVacant!12069) lt!643223)) (and (bvsge (index!50671 lt!643223) #b00000000000000000000000000000000) (bvslt (index!50671 lt!643223) (size!48379 a!2862)))) (or ((_ is Undefined!12069) lt!643223) (ite ((_ is Found!12069) lt!643223) (= (select (arr!47829 a!2862) (index!50669 lt!643223)) (select (arr!47829 a!2862) j!93)) (ite ((_ is MissingZero!12069) lt!643223) (= (select (arr!47829 a!2862) (index!50668 lt!643223)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12069) lt!643223) (= (select (arr!47829 a!2862) (index!50671 lt!643223)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!155465 (= lt!643223 e!825854)))

(declare-fun c!135573 () Bool)

(assert (=> d!155465 (= c!135573 (and ((_ is Intermediate!12069) lt!643224) (undefined!12881 lt!643224)))))

(assert (=> d!155465 (= lt!643224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47829 a!2862) j!93) mask!2687) (select (arr!47829 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155465 (validMask!0 mask!2687)))

(assert (=> d!155465 (= (seekEntryOrOpen!0 (select (arr!47829 a!2862) j!93) a!2862 mask!2687) lt!643223)))

(declare-fun b!1471313 () Bool)

(assert (=> b!1471313 (= e!825854 Undefined!12069)))

(declare-fun b!1471314 () Bool)

(declare-fun c!135572 () Bool)

(assert (=> b!1471314 (= c!135572 (= lt!643222 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!825856 () SeekEntryResult!12069)

(assert (=> b!1471314 (= e!825855 e!825856)))

(declare-fun b!1471315 () Bool)

(assert (=> b!1471315 (= e!825855 (Found!12069 (index!50670 lt!643224)))))

(declare-fun b!1471316 () Bool)

(assert (=> b!1471316 (= e!825856 (MissingZero!12069 (index!50670 lt!643224)))))

(declare-fun b!1471317 () Bool)

(assert (=> b!1471317 (= e!825856 (seekKeyOrZeroReturnVacant!0 (x!132247 lt!643224) (index!50670 lt!643224) (index!50670 lt!643224) (select (arr!47829 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and d!155465 c!135573) b!1471313))

(assert (= (and d!155465 (not c!135573)) b!1471312))

(assert (= (and b!1471312 c!135571) b!1471315))

(assert (= (and b!1471312 (not c!135571)) b!1471314))

(assert (= (and b!1471314 c!135572) b!1471316))

(assert (= (and b!1471314 (not c!135572)) b!1471317))

(declare-fun m!1358179 () Bool)

(assert (=> b!1471312 m!1358179))

(assert (=> d!155465 m!1357973))

(declare-fun m!1358181 () Bool)

(assert (=> d!155465 m!1358181))

(declare-fun m!1358183 () Bool)

(assert (=> d!155465 m!1358183))

(declare-fun m!1358185 () Bool)

(assert (=> d!155465 m!1358185))

(assert (=> d!155465 m!1357979))

(assert (=> d!155465 m!1357983))

(assert (=> d!155465 m!1357983))

(assert (=> d!155465 m!1357979))

(assert (=> d!155465 m!1357985))

(assert (=> b!1471317 m!1357979))

(declare-fun m!1358187 () Bool)

(assert (=> b!1471317 m!1358187))

(assert (=> b!1471033 d!155465))

(declare-fun d!155469 () Bool)

(assert (=> d!155469 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125694 d!155469))

(declare-fun d!155475 () Bool)

(assert (=> d!155475 (= (array_inv!36857 a!2862) (bvsge (size!48379 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125694 d!155475))

(declare-fun d!155479 () Bool)

(assert (=> d!155479 (= (validKeyInArray!0 (select (arr!47829 a!2862) j!93)) (and (not (= (select (arr!47829 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47829 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1471024 d!155479))

(declare-fun b!1471357 () Bool)

(declare-fun lt!643245 () SeekEntryResult!12069)

(assert (=> b!1471357 (and (bvsge (index!50670 lt!643245) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643245) (size!48379 lt!643109)))))

(declare-fun e!825881 () Bool)

(assert (=> b!1471357 (= e!825881 (= (select (arr!47829 lt!643109) (index!50670 lt!643245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1471358 () Bool)

(declare-fun e!825882 () Bool)

(assert (=> b!1471358 (= e!825882 (bvsge (x!132247 lt!643245) #b01111111111111111111111111111110))))

(declare-fun b!1471359 () Bool)

(assert (=> b!1471359 (and (bvsge (index!50670 lt!643245) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643245) (size!48379 lt!643109)))))

(declare-fun res!999207 () Bool)

(assert (=> b!1471359 (= res!999207 (= (select (arr!47829 lt!643109) (index!50670 lt!643245)) lt!643110))))

(assert (=> b!1471359 (=> res!999207 e!825881)))

(declare-fun e!825884 () Bool)

(assert (=> b!1471359 (= e!825884 e!825881)))

(declare-fun b!1471360 () Bool)

(assert (=> b!1471360 (and (bvsge (index!50670 lt!643245) #b00000000000000000000000000000000) (bvslt (index!50670 lt!643245) (size!48379 lt!643109)))))

(declare-fun res!999206 () Bool)

(assert (=> b!1471360 (= res!999206 (= (select (arr!47829 lt!643109) (index!50670 lt!643245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471360 (=> res!999206 e!825881)))

(declare-fun b!1471362 () Bool)

(assert (=> b!1471362 (= e!825882 e!825884)))

(declare-fun res!999208 () Bool)

(assert (=> b!1471362 (= res!999208 (and ((_ is Intermediate!12069) lt!643245) (not (undefined!12881 lt!643245)) (bvslt (x!132247 lt!643245) #b01111111111111111111111111111110) (bvsge (x!132247 lt!643245) #b00000000000000000000000000000000) (bvsge (x!132247 lt!643245) x!665)))))

(assert (=> b!1471362 (=> (not res!999208) (not e!825884))))

(declare-fun b!1471363 () Bool)

(declare-fun e!825880 () SeekEntryResult!12069)

(assert (=> b!1471363 (= e!825880 (Intermediate!12069 true index!646 x!665))))

(declare-fun b!1471364 () Bool)

(declare-fun e!825883 () SeekEntryResult!12069)

(assert (=> b!1471364 (= e!825883 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!643110 lt!643109 mask!2687))))

(declare-fun b!1471365 () Bool)

(assert (=> b!1471365 (= e!825880 e!825883)))

(declare-fun c!135589 () Bool)

(declare-fun lt!643246 () (_ BitVec 64))

(assert (=> b!1471365 (= c!135589 (or (= lt!643246 lt!643110) (= (bvadd lt!643246 lt!643246) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1471361 () Bool)

(assert (=> b!1471361 (= e!825883 (Intermediate!12069 false index!646 x!665))))

(declare-fun d!155481 () Bool)

(assert (=> d!155481 e!825882))

(declare-fun c!135591 () Bool)

(assert (=> d!155481 (= c!135591 (and ((_ is Intermediate!12069) lt!643245) (undefined!12881 lt!643245)))))

(assert (=> d!155481 (= lt!643245 e!825880)))

(declare-fun c!135590 () Bool)

(assert (=> d!155481 (= c!135590 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155481 (= lt!643246 (select (arr!47829 lt!643109) index!646))))

(assert (=> d!155481 (validMask!0 mask!2687)))

(assert (=> d!155481 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643110 lt!643109 mask!2687) lt!643245)))

(assert (= (and d!155481 c!135590) b!1471363))

(assert (= (and d!155481 (not c!135590)) b!1471365))

(assert (= (and b!1471365 c!135589) b!1471361))

(assert (= (and b!1471365 (not c!135589)) b!1471364))

(assert (= (and d!155481 c!135591) b!1471358))

(assert (= (and d!155481 (not c!135591)) b!1471362))

(assert (= (and b!1471362 res!999208) b!1471359))

(assert (= (and b!1471359 (not res!999207)) b!1471360))

(assert (= (and b!1471360 (not res!999206)) b!1471357))

(assert (=> d!155481 m!1358141))

(assert (=> d!155481 m!1357973))

(declare-fun m!1358213 () Bool)

(assert (=> b!1471360 m!1358213))

(assert (=> b!1471364 m!1358125))

(assert (=> b!1471364 m!1358125))

(declare-fun m!1358215 () Bool)

(assert (=> b!1471364 m!1358215))

(assert (=> b!1471357 m!1358213))

(assert (=> b!1471359 m!1358213))

(assert (=> b!1471035 d!155481))

(declare-fun d!155483 () Bool)

(declare-fun res!999209 () Bool)

(declare-fun e!825887 () Bool)

(assert (=> d!155483 (=> res!999209 e!825887)))

(assert (=> d!155483 (= res!999209 (bvsge #b00000000000000000000000000000000 (size!48379 a!2862)))))

(assert (=> d!155483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!825887)))

(declare-fun bm!67727 () Bool)

(declare-fun call!67730 () Bool)

(assert (=> bm!67727 (= call!67730 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1471366 () Bool)

(declare-fun e!825885 () Bool)

(assert (=> b!1471366 (= e!825885 call!67730)))

(declare-fun b!1471367 () Bool)

(declare-fun e!825886 () Bool)

(assert (=> b!1471367 (= e!825885 e!825886)))

(declare-fun lt!643247 () (_ BitVec 64))

(assert (=> b!1471367 (= lt!643247 (select (arr!47829 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!643249 () Unit!49478)

(assert (=> b!1471367 (= lt!643249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!643247 #b00000000000000000000000000000000))))

(assert (=> b!1471367 (arrayContainsKey!0 a!2862 lt!643247 #b00000000000000000000000000000000)))

(declare-fun lt!643248 () Unit!49478)

(assert (=> b!1471367 (= lt!643248 lt!643249)))

(declare-fun res!999210 () Bool)

(assert (=> b!1471367 (= res!999210 (= (seekEntryOrOpen!0 (select (arr!47829 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12069 #b00000000000000000000000000000000)))))

(assert (=> b!1471367 (=> (not res!999210) (not e!825886))))

(declare-fun b!1471368 () Bool)

(assert (=> b!1471368 (= e!825886 call!67730)))

(declare-fun b!1471369 () Bool)

(assert (=> b!1471369 (= e!825887 e!825885)))

(declare-fun c!135592 () Bool)

(assert (=> b!1471369 (= c!135592 (validKeyInArray!0 (select (arr!47829 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155483 (not res!999209)) b!1471369))

(assert (= (and b!1471369 c!135592) b!1471367))

(assert (= (and b!1471369 (not c!135592)) b!1471366))

(assert (= (and b!1471367 res!999210) b!1471368))

(assert (= (or b!1471368 b!1471366) bm!67727))

(declare-fun m!1358217 () Bool)

(assert (=> bm!67727 m!1358217))

(assert (=> b!1471367 m!1358073))

(declare-fun m!1358219 () Bool)

(assert (=> b!1471367 m!1358219))

(declare-fun m!1358221 () Bool)

(assert (=> b!1471367 m!1358221))

(assert (=> b!1471367 m!1358073))

(declare-fun m!1358223 () Bool)

(assert (=> b!1471367 m!1358223))

(assert (=> b!1471369 m!1358073))

(assert (=> b!1471369 m!1358073))

(assert (=> b!1471369 m!1358077))

(assert (=> b!1471025 d!155483))

(check-sat (not bm!67717) (not b!1471108) (not d!155453) (not b!1471369) (not b!1471242) (not d!155441) (not d!155481) (not b!1471305) (not b!1471317) (not b!1471095) (not bm!67720) (not d!155459) (not b!1471107) (not d!155465) (not b!1471163) (not d!155423) (not b!1471367) (not b!1471093) (not b!1471189) (not d!155447) (not b!1471109) (not d!155431) (not bm!67727) (not b!1471364) (not b!1471207))
(check-sat)
