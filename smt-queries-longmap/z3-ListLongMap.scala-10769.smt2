; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125962 () Bool)

(assert start!125962)

(declare-fun b!1475018 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644306 () (_ BitVec 64))

(declare-datatypes ((array!99160 0))(
  ( (array!99161 (arr!47863 (Array (_ BitVec 32) (_ BitVec 64))) (size!48415 (_ BitVec 32))) )
))
(declare-fun lt!644309 () array!99160)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!827550 () Bool)

(declare-datatypes ((SeekEntryResult!12128 0))(
  ( (MissingZero!12128 (index!50904 (_ BitVec 32))) (Found!12128 (index!50905 (_ BitVec 32))) (Intermediate!12128 (undefined!12940 Bool) (index!50906 (_ BitVec 32)) (x!132488 (_ BitVec 32))) (Undefined!12128) (MissingVacant!12128 (index!50907 (_ BitVec 32))) )
))
(declare-fun lt!644305 () SeekEntryResult!12128)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99160 (_ BitVec 32)) SeekEntryResult!12128)

(assert (=> b!1475018 (= e!827550 (= lt!644305 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644306 lt!644309 mask!2687)))))

(declare-fun b!1475019 () Bool)

(declare-fun e!827554 () Bool)

(declare-fun e!827551 () Bool)

(assert (=> b!1475019 (= e!827554 e!827551)))

(declare-fun res!1002008 () Bool)

(assert (=> b!1475019 (=> res!1002008 e!827551)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99160)

(assert (=> b!1475019 (= res!1002008 (or (and (= (select (arr!47863 a!2862) index!646) (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47863 a!2862) index!646) (select (arr!47863 a!2862) j!93))) (not (= (select (arr!47863 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1475020 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99160 (_ BitVec 32)) SeekEntryResult!12128)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99160 (_ BitVec 32)) SeekEntryResult!12128)

(assert (=> b!1475020 (= e!827550 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644306 lt!644309 mask!2687) (seekEntryOrOpen!0 lt!644306 lt!644309 mask!2687)))))

(declare-fun b!1475021 () Bool)

(declare-fun lt!644307 () SeekEntryResult!12128)

(assert (=> b!1475021 (= e!827551 (= lt!644307 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1475022 () Bool)

(declare-fun e!827556 () Bool)

(declare-fun e!827549 () Bool)

(assert (=> b!1475022 (= e!827556 e!827549)))

(declare-fun res!1002012 () Bool)

(assert (=> b!1475022 (=> (not res!1002012) (not e!827549))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475022 (= res!1002012 (= lt!644305 (Intermediate!12128 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475022 (= lt!644305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644306 mask!2687) lt!644306 lt!644309 mask!2687))))

(assert (=> b!1475022 (= lt!644306 (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475023 () Bool)

(declare-fun res!1002013 () Bool)

(declare-fun e!827552 () Bool)

(assert (=> b!1475023 (=> (not res!1002013) (not e!827552))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1475023 (= res!1002013 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48415 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48415 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48415 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1475024 () Bool)

(declare-fun res!1002007 () Bool)

(assert (=> b!1475024 (=> (not res!1002007) (not e!827552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99160 (_ BitVec 32)) Bool)

(assert (=> b!1475024 (= res!1002007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475025 () Bool)

(declare-fun res!1002002 () Bool)

(assert (=> b!1475025 (=> (not res!1002002) (not e!827556))))

(declare-fun lt!644310 () SeekEntryResult!12128)

(assert (=> b!1475025 (= res!1002002 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!644310))))

(declare-fun b!1475026 () Bool)

(declare-fun res!1002010 () Bool)

(assert (=> b!1475026 (=> (not res!1002010) (not e!827549))))

(assert (=> b!1475026 (= res!1002010 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475027 () Bool)

(declare-fun res!1002005 () Bool)

(assert (=> b!1475027 (=> (not res!1002005) (not e!827549))))

(assert (=> b!1475027 (= res!1002005 e!827550)))

(declare-fun c!136027 () Bool)

(assert (=> b!1475027 (= c!136027 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475028 () Bool)

(declare-fun res!1002015 () Bool)

(assert (=> b!1475028 (=> (not res!1002015) (not e!827552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475028 (= res!1002015 (validKeyInArray!0 (select (arr!47863 a!2862) i!1006)))))

(declare-fun b!1475029 () Bool)

(declare-fun res!1002003 () Bool)

(assert (=> b!1475029 (=> (not res!1002003) (not e!827552))))

(assert (=> b!1475029 (= res!1002003 (and (= (size!48415 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48415 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48415 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475030 () Bool)

(declare-fun res!1002009 () Bool)

(assert (=> b!1475030 (=> (not res!1002009) (not e!827552))))

(declare-datatypes ((List!34442 0))(
  ( (Nil!34439) (Cons!34438 (h!35800 (_ BitVec 64)) (t!49128 List!34442)) )
))
(declare-fun arrayNoDuplicates!0 (array!99160 (_ BitVec 32) List!34442) Bool)

(assert (=> b!1475030 (= res!1002009 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34439))))

(declare-fun b!1475031 () Bool)

(declare-fun res!1002011 () Bool)

(assert (=> b!1475031 (=> (not res!1002011) (not e!827552))))

(assert (=> b!1475031 (= res!1002011 (validKeyInArray!0 (select (arr!47863 a!2862) j!93)))))

(declare-fun b!1475032 () Bool)

(declare-fun e!827553 () Bool)

(assert (=> b!1475032 (= e!827553 e!827556)))

(declare-fun res!1002004 () Bool)

(assert (=> b!1475032 (=> (not res!1002004) (not e!827556))))

(assert (=> b!1475032 (= res!1002004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!644310))))

(assert (=> b!1475032 (= lt!644310 (Intermediate!12128 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475033 () Bool)

(assert (=> b!1475033 (= e!827552 e!827553)))

(declare-fun res!1002014 () Bool)

(assert (=> b!1475033 (=> (not res!1002014) (not e!827553))))

(assert (=> b!1475033 (= res!1002014 (= (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475033 (= lt!644309 (array!99161 (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48415 a!2862)))))

(declare-fun b!1475034 () Bool)

(assert (=> b!1475034 (= e!827549 (not (or (and (= (select (arr!47863 a!2862) index!646) (select (store (arr!47863 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47863 a!2862) index!646) (select (arr!47863 a!2862) j!93))) (not (= (select (arr!47863 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!646 intermediateBeforeIndex!19))))))

(assert (=> b!1475034 e!827554))

(declare-fun res!1002016 () Bool)

(assert (=> b!1475034 (=> (not res!1002016) (not e!827554))))

(assert (=> b!1475034 (= res!1002016 (and (= lt!644307 (Found!12128 j!93)) (or (= (select (arr!47863 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47863 a!2862) intermediateBeforeIndex!19) (select (arr!47863 a!2862) j!93)))))))

(assert (=> b!1475034 (= lt!644307 (seekEntryOrOpen!0 (select (arr!47863 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1475034 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49437 0))(
  ( (Unit!49438) )
))
(declare-fun lt!644308 () Unit!49437)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49437)

(assert (=> b!1475034 (= lt!644308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1002006 () Bool)

(assert (=> start!125962 (=> (not res!1002006) (not e!827552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125962 (= res!1002006 (validMask!0 mask!2687))))

(assert (=> start!125962 e!827552))

(assert (=> start!125962 true))

(declare-fun array_inv!37096 (array!99160) Bool)

(assert (=> start!125962 (array_inv!37096 a!2862)))

(assert (= (and start!125962 res!1002006) b!1475029))

(assert (= (and b!1475029 res!1002003) b!1475028))

(assert (= (and b!1475028 res!1002015) b!1475031))

(assert (= (and b!1475031 res!1002011) b!1475024))

(assert (= (and b!1475024 res!1002007) b!1475030))

(assert (= (and b!1475030 res!1002009) b!1475023))

(assert (= (and b!1475023 res!1002013) b!1475033))

(assert (= (and b!1475033 res!1002014) b!1475032))

(assert (= (and b!1475032 res!1002004) b!1475025))

(assert (= (and b!1475025 res!1002002) b!1475022))

(assert (= (and b!1475022 res!1002012) b!1475027))

(assert (= (and b!1475027 c!136027) b!1475018))

(assert (= (and b!1475027 (not c!136027)) b!1475020))

(assert (= (and b!1475027 res!1002005) b!1475026))

(assert (= (and b!1475026 res!1002010) b!1475034))

(assert (= (and b!1475034 res!1002016) b!1475019))

(assert (= (and b!1475019 (not res!1002008)) b!1475021))

(declare-fun m!1360827 () Bool)

(assert (=> b!1475024 m!1360827))

(declare-fun m!1360829 () Bool)

(assert (=> b!1475019 m!1360829))

(declare-fun m!1360831 () Bool)

(assert (=> b!1475019 m!1360831))

(declare-fun m!1360833 () Bool)

(assert (=> b!1475019 m!1360833))

(declare-fun m!1360835 () Bool)

(assert (=> b!1475019 m!1360835))

(assert (=> b!1475031 m!1360835))

(assert (=> b!1475031 m!1360835))

(declare-fun m!1360837 () Bool)

(assert (=> b!1475031 m!1360837))

(assert (=> b!1475025 m!1360835))

(assert (=> b!1475025 m!1360835))

(declare-fun m!1360839 () Bool)

(assert (=> b!1475025 m!1360839))

(declare-fun m!1360841 () Bool)

(assert (=> b!1475022 m!1360841))

(assert (=> b!1475022 m!1360841))

(declare-fun m!1360843 () Bool)

(assert (=> b!1475022 m!1360843))

(assert (=> b!1475022 m!1360831))

(declare-fun m!1360845 () Bool)

(assert (=> b!1475022 m!1360845))

(declare-fun m!1360847 () Bool)

(assert (=> start!125962 m!1360847))

(declare-fun m!1360849 () Bool)

(assert (=> start!125962 m!1360849))

(declare-fun m!1360851 () Bool)

(assert (=> b!1475018 m!1360851))

(declare-fun m!1360853 () Bool)

(assert (=> b!1475034 m!1360853))

(assert (=> b!1475034 m!1360831))

(declare-fun m!1360855 () Bool)

(assert (=> b!1475034 m!1360855))

(assert (=> b!1475034 m!1360833))

(assert (=> b!1475034 m!1360829))

(assert (=> b!1475034 m!1360835))

(declare-fun m!1360857 () Bool)

(assert (=> b!1475034 m!1360857))

(declare-fun m!1360859 () Bool)

(assert (=> b!1475034 m!1360859))

(assert (=> b!1475034 m!1360835))

(assert (=> b!1475033 m!1360831))

(declare-fun m!1360861 () Bool)

(assert (=> b!1475033 m!1360861))

(declare-fun m!1360863 () Bool)

(assert (=> b!1475028 m!1360863))

(assert (=> b!1475028 m!1360863))

(declare-fun m!1360865 () Bool)

(assert (=> b!1475028 m!1360865))

(declare-fun m!1360867 () Bool)

(assert (=> b!1475020 m!1360867))

(declare-fun m!1360869 () Bool)

(assert (=> b!1475020 m!1360869))

(assert (=> b!1475021 m!1360835))

(assert (=> b!1475021 m!1360835))

(declare-fun m!1360871 () Bool)

(assert (=> b!1475021 m!1360871))

(assert (=> b!1475032 m!1360835))

(assert (=> b!1475032 m!1360835))

(declare-fun m!1360873 () Bool)

(assert (=> b!1475032 m!1360873))

(assert (=> b!1475032 m!1360873))

(assert (=> b!1475032 m!1360835))

(declare-fun m!1360875 () Bool)

(assert (=> b!1475032 m!1360875))

(declare-fun m!1360877 () Bool)

(assert (=> b!1475030 m!1360877))

(check-sat (not start!125962) (not b!1475020) (not b!1475030) (not b!1475028) (not b!1475022) (not b!1475034) (not b!1475024) (not b!1475021) (not b!1475018) (not b!1475025) (not b!1475032) (not b!1475031))
(check-sat)
(get-model)

(declare-fun d!155591 () Bool)

(assert (=> d!155591 (= (validKeyInArray!0 (select (arr!47863 a!2862) j!93)) (and (not (= (select (arr!47863 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47863 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475031 d!155591))

(declare-fun b!1475149 () Bool)

(declare-fun e!827612 () SeekEntryResult!12128)

(declare-fun e!827611 () SeekEntryResult!12128)

(assert (=> b!1475149 (= e!827612 e!827611)))

(declare-fun c!136042 () Bool)

(declare-fun lt!644352 () (_ BitVec 64))

(assert (=> b!1475149 (= c!136042 (= lt!644352 lt!644306))))

(declare-fun b!1475150 () Bool)

(declare-fun c!136040 () Bool)

(assert (=> b!1475150 (= c!136040 (= lt!644352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827613 () SeekEntryResult!12128)

(assert (=> b!1475150 (= e!827611 e!827613)))

(declare-fun b!1475152 () Bool)

(assert (=> b!1475152 (= e!827611 (Found!12128 index!646))))

(declare-fun b!1475153 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475153 (= e!827613 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!644306 lt!644309 mask!2687))))

(declare-fun b!1475154 () Bool)

(assert (=> b!1475154 (= e!827612 Undefined!12128)))

(declare-fun d!155593 () Bool)

(declare-fun lt!644351 () SeekEntryResult!12128)

(get-info :version)

(assert (=> d!155593 (and (or ((_ is Undefined!12128) lt!644351) (not ((_ is Found!12128) lt!644351)) (and (bvsge (index!50905 lt!644351) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644351) (size!48415 lt!644309)))) (or ((_ is Undefined!12128) lt!644351) ((_ is Found!12128) lt!644351) (not ((_ is MissingVacant!12128) lt!644351)) (not (= (index!50907 lt!644351) intermediateAfterIndex!19)) (and (bvsge (index!50907 lt!644351) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644351) (size!48415 lt!644309)))) (or ((_ is Undefined!12128) lt!644351) (ite ((_ is Found!12128) lt!644351) (= (select (arr!47863 lt!644309) (index!50905 lt!644351)) lt!644306) (and ((_ is MissingVacant!12128) lt!644351) (= (index!50907 lt!644351) intermediateAfterIndex!19) (= (select (arr!47863 lt!644309) (index!50907 lt!644351)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155593 (= lt!644351 e!827612)))

(declare-fun c!136041 () Bool)

(assert (=> d!155593 (= c!136041 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155593 (= lt!644352 (select (arr!47863 lt!644309) index!646))))

(assert (=> d!155593 (validMask!0 mask!2687)))

(assert (=> d!155593 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644306 lt!644309 mask!2687) lt!644351)))

(declare-fun b!1475151 () Bool)

(assert (=> b!1475151 (= e!827613 (MissingVacant!12128 intermediateAfterIndex!19))))

(assert (= (and d!155593 c!136041) b!1475154))

(assert (= (and d!155593 (not c!136041)) b!1475149))

(assert (= (and b!1475149 c!136042) b!1475152))

(assert (= (and b!1475149 (not c!136042)) b!1475150))

(assert (= (and b!1475150 c!136040) b!1475151))

(assert (= (and b!1475150 (not c!136040)) b!1475153))

(declare-fun m!1360983 () Bool)

(assert (=> b!1475153 m!1360983))

(assert (=> b!1475153 m!1360983))

(declare-fun m!1360985 () Bool)

(assert (=> b!1475153 m!1360985))

(declare-fun m!1360987 () Bool)

(assert (=> d!155593 m!1360987))

(declare-fun m!1360989 () Bool)

(assert (=> d!155593 m!1360989))

(declare-fun m!1360991 () Bool)

(assert (=> d!155593 m!1360991))

(assert (=> d!155593 m!1360847))

(assert (=> b!1475020 d!155593))

(declare-fun d!155595 () Bool)

(declare-fun lt!644359 () SeekEntryResult!12128)

(assert (=> d!155595 (and (or ((_ is Undefined!12128) lt!644359) (not ((_ is Found!12128) lt!644359)) (and (bvsge (index!50905 lt!644359) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644359) (size!48415 lt!644309)))) (or ((_ is Undefined!12128) lt!644359) ((_ is Found!12128) lt!644359) (not ((_ is MissingZero!12128) lt!644359)) (and (bvsge (index!50904 lt!644359) #b00000000000000000000000000000000) (bvslt (index!50904 lt!644359) (size!48415 lt!644309)))) (or ((_ is Undefined!12128) lt!644359) ((_ is Found!12128) lt!644359) ((_ is MissingZero!12128) lt!644359) (not ((_ is MissingVacant!12128) lt!644359)) (and (bvsge (index!50907 lt!644359) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644359) (size!48415 lt!644309)))) (or ((_ is Undefined!12128) lt!644359) (ite ((_ is Found!12128) lt!644359) (= (select (arr!47863 lt!644309) (index!50905 lt!644359)) lt!644306) (ite ((_ is MissingZero!12128) lt!644359) (= (select (arr!47863 lt!644309) (index!50904 lt!644359)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12128) lt!644359) (= (select (arr!47863 lt!644309) (index!50907 lt!644359)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!827622 () SeekEntryResult!12128)

(assert (=> d!155595 (= lt!644359 e!827622)))

(declare-fun c!136051 () Bool)

(declare-fun lt!644361 () SeekEntryResult!12128)

(assert (=> d!155595 (= c!136051 (and ((_ is Intermediate!12128) lt!644361) (undefined!12940 lt!644361)))))

(assert (=> d!155595 (= lt!644361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644306 mask!2687) lt!644306 lt!644309 mask!2687))))

(assert (=> d!155595 (validMask!0 mask!2687)))

(assert (=> d!155595 (= (seekEntryOrOpen!0 lt!644306 lt!644309 mask!2687) lt!644359)))

(declare-fun b!1475167 () Bool)

(assert (=> b!1475167 (= e!827622 Undefined!12128)))

(declare-fun b!1475168 () Bool)

(declare-fun e!827620 () SeekEntryResult!12128)

(assert (=> b!1475168 (= e!827620 (seekKeyOrZeroReturnVacant!0 (x!132488 lt!644361) (index!50906 lt!644361) (index!50906 lt!644361) lt!644306 lt!644309 mask!2687))))

(declare-fun b!1475169 () Bool)

(assert (=> b!1475169 (= e!827620 (MissingZero!12128 (index!50906 lt!644361)))))

(declare-fun b!1475170 () Bool)

(declare-fun e!827621 () SeekEntryResult!12128)

(assert (=> b!1475170 (= e!827621 (Found!12128 (index!50906 lt!644361)))))

(declare-fun b!1475171 () Bool)

(declare-fun c!136049 () Bool)

(declare-fun lt!644360 () (_ BitVec 64))

(assert (=> b!1475171 (= c!136049 (= lt!644360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475171 (= e!827621 e!827620)))

(declare-fun b!1475172 () Bool)

(assert (=> b!1475172 (= e!827622 e!827621)))

(assert (=> b!1475172 (= lt!644360 (select (arr!47863 lt!644309) (index!50906 lt!644361)))))

(declare-fun c!136050 () Bool)

(assert (=> b!1475172 (= c!136050 (= lt!644360 lt!644306))))

(assert (= (and d!155595 c!136051) b!1475167))

(assert (= (and d!155595 (not c!136051)) b!1475172))

(assert (= (and b!1475172 c!136050) b!1475170))

(assert (= (and b!1475172 (not c!136050)) b!1475171))

(assert (= (and b!1475171 c!136049) b!1475169))

(assert (= (and b!1475171 (not c!136049)) b!1475168))

(assert (=> d!155595 m!1360841))

(declare-fun m!1360993 () Bool)

(assert (=> d!155595 m!1360993))

(declare-fun m!1360995 () Bool)

(assert (=> d!155595 m!1360995))

(assert (=> d!155595 m!1360847))

(assert (=> d!155595 m!1360841))

(assert (=> d!155595 m!1360843))

(declare-fun m!1360997 () Bool)

(assert (=> d!155595 m!1360997))

(declare-fun m!1360999 () Bool)

(assert (=> b!1475168 m!1360999))

(declare-fun m!1361001 () Bool)

(assert (=> b!1475172 m!1361001))

(assert (=> b!1475020 d!155595))

(declare-fun b!1475183 () Bool)

(declare-fun e!827633 () Bool)

(declare-fun call!67754 () Bool)

(assert (=> b!1475183 (= e!827633 call!67754)))

(declare-fun b!1475184 () Bool)

(declare-fun e!827634 () Bool)

(assert (=> b!1475184 (= e!827634 e!827633)))

(declare-fun c!136054 () Bool)

(assert (=> b!1475184 (= c!136054 (validKeyInArray!0 (select (arr!47863 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475185 () Bool)

(assert (=> b!1475185 (= e!827633 call!67754)))

(declare-fun d!155597 () Bool)

(declare-fun res!1002115 () Bool)

(declare-fun e!827632 () Bool)

(assert (=> d!155597 (=> res!1002115 e!827632)))

(assert (=> d!155597 (= res!1002115 (bvsge #b00000000000000000000000000000000 (size!48415 a!2862)))))

(assert (=> d!155597 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34439) e!827632)))

(declare-fun bm!67751 () Bool)

(assert (=> bm!67751 (= call!67754 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136054 (Cons!34438 (select (arr!47863 a!2862) #b00000000000000000000000000000000) Nil!34439) Nil!34439)))))

(declare-fun b!1475186 () Bool)

(declare-fun e!827631 () Bool)

(declare-fun contains!9872 (List!34442 (_ BitVec 64)) Bool)

(assert (=> b!1475186 (= e!827631 (contains!9872 Nil!34439 (select (arr!47863 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475187 () Bool)

(assert (=> b!1475187 (= e!827632 e!827634)))

(declare-fun res!1002113 () Bool)

(assert (=> b!1475187 (=> (not res!1002113) (not e!827634))))

(assert (=> b!1475187 (= res!1002113 (not e!827631))))

(declare-fun res!1002114 () Bool)

(assert (=> b!1475187 (=> (not res!1002114) (not e!827631))))

(assert (=> b!1475187 (= res!1002114 (validKeyInArray!0 (select (arr!47863 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155597 (not res!1002115)) b!1475187))

(assert (= (and b!1475187 res!1002114) b!1475186))

(assert (= (and b!1475187 res!1002113) b!1475184))

(assert (= (and b!1475184 c!136054) b!1475185))

(assert (= (and b!1475184 (not c!136054)) b!1475183))

(assert (= (or b!1475185 b!1475183) bm!67751))

(declare-fun m!1361003 () Bool)

(assert (=> b!1475184 m!1361003))

(assert (=> b!1475184 m!1361003))

(declare-fun m!1361005 () Bool)

(assert (=> b!1475184 m!1361005))

(assert (=> bm!67751 m!1361003))

(declare-fun m!1361007 () Bool)

(assert (=> bm!67751 m!1361007))

(assert (=> b!1475186 m!1361003))

(assert (=> b!1475186 m!1361003))

(declare-fun m!1361009 () Bool)

(assert (=> b!1475186 m!1361009))

(assert (=> b!1475187 m!1361003))

(assert (=> b!1475187 m!1361003))

(assert (=> b!1475187 m!1361005))

(assert (=> b!1475030 d!155597))

(declare-fun d!155599 () Bool)

(declare-fun e!827646 () Bool)

(assert (=> d!155599 e!827646))

(declare-fun c!136062 () Bool)

(declare-fun lt!644367 () SeekEntryResult!12128)

(assert (=> d!155599 (= c!136062 (and ((_ is Intermediate!12128) lt!644367) (undefined!12940 lt!644367)))))

(declare-fun e!827648 () SeekEntryResult!12128)

(assert (=> d!155599 (= lt!644367 e!827648)))

(declare-fun c!136063 () Bool)

(assert (=> d!155599 (= c!136063 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644366 () (_ BitVec 64))

(assert (=> d!155599 (= lt!644366 (select (arr!47863 lt!644309) index!646))))

(assert (=> d!155599 (validMask!0 mask!2687)))

(assert (=> d!155599 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644306 lt!644309 mask!2687) lt!644367)))

(declare-fun b!1475206 () Bool)

(assert (=> b!1475206 (and (bvsge (index!50906 lt!644367) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644367) (size!48415 lt!644309)))))

(declare-fun e!827649 () Bool)

(assert (=> b!1475206 (= e!827649 (= (select (arr!47863 lt!644309) (index!50906 lt!644367)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475207 () Bool)

(assert (=> b!1475207 (= e!827648 (Intermediate!12128 true index!646 x!665))))

(declare-fun b!1475208 () Bool)

(declare-fun e!827647 () SeekEntryResult!12128)

(assert (=> b!1475208 (= e!827647 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!644306 lt!644309 mask!2687))))

(declare-fun b!1475209 () Bool)

(assert (=> b!1475209 (and (bvsge (index!50906 lt!644367) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644367) (size!48415 lt!644309)))))

(declare-fun res!1002123 () Bool)

(assert (=> b!1475209 (= res!1002123 (= (select (arr!47863 lt!644309) (index!50906 lt!644367)) lt!644306))))

(assert (=> b!1475209 (=> res!1002123 e!827649)))

(declare-fun e!827645 () Bool)

(assert (=> b!1475209 (= e!827645 e!827649)))

(declare-fun b!1475210 () Bool)

(assert (=> b!1475210 (= e!827646 (bvsge (x!132488 lt!644367) #b01111111111111111111111111111110))))

(declare-fun b!1475211 () Bool)

(assert (=> b!1475211 (= e!827646 e!827645)))

(declare-fun res!1002122 () Bool)

(assert (=> b!1475211 (= res!1002122 (and ((_ is Intermediate!12128) lt!644367) (not (undefined!12940 lt!644367)) (bvslt (x!132488 lt!644367) #b01111111111111111111111111111110) (bvsge (x!132488 lt!644367) #b00000000000000000000000000000000) (bvsge (x!132488 lt!644367) x!665)))))

(assert (=> b!1475211 (=> (not res!1002122) (not e!827645))))

(declare-fun b!1475212 () Bool)

(assert (=> b!1475212 (= e!827647 (Intermediate!12128 false index!646 x!665))))

(declare-fun b!1475213 () Bool)

(assert (=> b!1475213 (and (bvsge (index!50906 lt!644367) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644367) (size!48415 lt!644309)))))

(declare-fun res!1002124 () Bool)

(assert (=> b!1475213 (= res!1002124 (= (select (arr!47863 lt!644309) (index!50906 lt!644367)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475213 (=> res!1002124 e!827649)))

(declare-fun b!1475214 () Bool)

(assert (=> b!1475214 (= e!827648 e!827647)))

(declare-fun c!136061 () Bool)

(assert (=> b!1475214 (= c!136061 (or (= lt!644366 lt!644306) (= (bvadd lt!644366 lt!644366) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155599 c!136063) b!1475207))

(assert (= (and d!155599 (not c!136063)) b!1475214))

(assert (= (and b!1475214 c!136061) b!1475212))

(assert (= (and b!1475214 (not c!136061)) b!1475208))

(assert (= (and d!155599 c!136062) b!1475210))

(assert (= (and d!155599 (not c!136062)) b!1475211))

(assert (= (and b!1475211 res!1002122) b!1475209))

(assert (= (and b!1475209 (not res!1002123)) b!1475213))

(assert (= (and b!1475213 (not res!1002124)) b!1475206))

(declare-fun m!1361011 () Bool)

(assert (=> b!1475206 m!1361011))

(assert (=> d!155599 m!1360991))

(assert (=> d!155599 m!1360847))

(assert (=> b!1475213 m!1361011))

(assert (=> b!1475209 m!1361011))

(assert (=> b!1475208 m!1360983))

(assert (=> b!1475208 m!1360983))

(declare-fun m!1361013 () Bool)

(assert (=> b!1475208 m!1361013))

(assert (=> b!1475018 d!155599))

(declare-fun d!155603 () Bool)

(assert (=> d!155603 (= (validKeyInArray!0 (select (arr!47863 a!2862) i!1006)) (and (not (= (select (arr!47863 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47863 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1475028 d!155603))

(declare-fun d!155605 () Bool)

(declare-fun e!827651 () Bool)

(assert (=> d!155605 e!827651))

(declare-fun c!136065 () Bool)

(declare-fun lt!644369 () SeekEntryResult!12128)

(assert (=> d!155605 (= c!136065 (and ((_ is Intermediate!12128) lt!644369) (undefined!12940 lt!644369)))))

(declare-fun e!827653 () SeekEntryResult!12128)

(assert (=> d!155605 (= lt!644369 e!827653)))

(declare-fun c!136066 () Bool)

(assert (=> d!155605 (= c!136066 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!644368 () (_ BitVec 64))

(assert (=> d!155605 (= lt!644368 (select (arr!47863 a!2862) index!646))))

(assert (=> d!155605 (validMask!0 mask!2687)))

(assert (=> d!155605 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!644369)))

(declare-fun b!1475215 () Bool)

(assert (=> b!1475215 (and (bvsge (index!50906 lt!644369) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644369) (size!48415 a!2862)))))

(declare-fun e!827654 () Bool)

(assert (=> b!1475215 (= e!827654 (= (select (arr!47863 a!2862) (index!50906 lt!644369)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475216 () Bool)

(assert (=> b!1475216 (= e!827653 (Intermediate!12128 true index!646 x!665))))

(declare-fun e!827652 () SeekEntryResult!12128)

(declare-fun b!1475217 () Bool)

(assert (=> b!1475217 (= e!827652 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475218 () Bool)

(assert (=> b!1475218 (and (bvsge (index!50906 lt!644369) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644369) (size!48415 a!2862)))))

(declare-fun res!1002126 () Bool)

(assert (=> b!1475218 (= res!1002126 (= (select (arr!47863 a!2862) (index!50906 lt!644369)) (select (arr!47863 a!2862) j!93)))))

(assert (=> b!1475218 (=> res!1002126 e!827654)))

(declare-fun e!827650 () Bool)

(assert (=> b!1475218 (= e!827650 e!827654)))

(declare-fun b!1475219 () Bool)

(assert (=> b!1475219 (= e!827651 (bvsge (x!132488 lt!644369) #b01111111111111111111111111111110))))

(declare-fun b!1475220 () Bool)

(assert (=> b!1475220 (= e!827651 e!827650)))

(declare-fun res!1002125 () Bool)

(assert (=> b!1475220 (= res!1002125 (and ((_ is Intermediate!12128) lt!644369) (not (undefined!12940 lt!644369)) (bvslt (x!132488 lt!644369) #b01111111111111111111111111111110) (bvsge (x!132488 lt!644369) #b00000000000000000000000000000000) (bvsge (x!132488 lt!644369) x!665)))))

(assert (=> b!1475220 (=> (not res!1002125) (not e!827650))))

(declare-fun b!1475221 () Bool)

(assert (=> b!1475221 (= e!827652 (Intermediate!12128 false index!646 x!665))))

(declare-fun b!1475222 () Bool)

(assert (=> b!1475222 (and (bvsge (index!50906 lt!644369) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644369) (size!48415 a!2862)))))

(declare-fun res!1002127 () Bool)

(assert (=> b!1475222 (= res!1002127 (= (select (arr!47863 a!2862) (index!50906 lt!644369)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475222 (=> res!1002127 e!827654)))

(declare-fun b!1475223 () Bool)

(assert (=> b!1475223 (= e!827653 e!827652)))

(declare-fun c!136064 () Bool)

(assert (=> b!1475223 (= c!136064 (or (= lt!644368 (select (arr!47863 a!2862) j!93)) (= (bvadd lt!644368 lt!644368) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155605 c!136066) b!1475216))

(assert (= (and d!155605 (not c!136066)) b!1475223))

(assert (= (and b!1475223 c!136064) b!1475221))

(assert (= (and b!1475223 (not c!136064)) b!1475217))

(assert (= (and d!155605 c!136065) b!1475219))

(assert (= (and d!155605 (not c!136065)) b!1475220))

(assert (= (and b!1475220 res!1002125) b!1475218))

(assert (= (and b!1475218 (not res!1002126)) b!1475222))

(assert (= (and b!1475222 (not res!1002127)) b!1475215))

(declare-fun m!1361015 () Bool)

(assert (=> b!1475215 m!1361015))

(assert (=> d!155605 m!1360829))

(assert (=> d!155605 m!1360847))

(assert (=> b!1475222 m!1361015))

(assert (=> b!1475218 m!1361015))

(assert (=> b!1475217 m!1360983))

(assert (=> b!1475217 m!1360983))

(assert (=> b!1475217 m!1360835))

(declare-fun m!1361017 () Bool)

(assert (=> b!1475217 m!1361017))

(assert (=> b!1475025 d!155605))

(declare-fun b!1475242 () Bool)

(declare-fun e!827671 () Bool)

(declare-fun call!67757 () Bool)

(assert (=> b!1475242 (= e!827671 call!67757)))

(declare-fun bm!67754 () Bool)

(assert (=> bm!67754 (= call!67757 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475243 () Bool)

(declare-fun e!827669 () Bool)

(assert (=> b!1475243 (= e!827669 e!827671)))

(declare-fun lt!644378 () (_ BitVec 64))

(assert (=> b!1475243 (= lt!644378 (select (arr!47863 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!644377 () Unit!49437)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99160 (_ BitVec 64) (_ BitVec 32)) Unit!49437)

(assert (=> b!1475243 (= lt!644377 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644378 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1475243 (arrayContainsKey!0 a!2862 lt!644378 #b00000000000000000000000000000000)))

(declare-fun lt!644376 () Unit!49437)

(assert (=> b!1475243 (= lt!644376 lt!644377)))

(declare-fun res!1002138 () Bool)

(assert (=> b!1475243 (= res!1002138 (= (seekEntryOrOpen!0 (select (arr!47863 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12128 #b00000000000000000000000000000000)))))

(assert (=> b!1475243 (=> (not res!1002138) (not e!827671))))

(declare-fun d!155607 () Bool)

(declare-fun res!1002139 () Bool)

(declare-fun e!827670 () Bool)

(assert (=> d!155607 (=> res!1002139 e!827670)))

(assert (=> d!155607 (= res!1002139 (bvsge #b00000000000000000000000000000000 (size!48415 a!2862)))))

(assert (=> d!155607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!827670)))

(declare-fun b!1475244 () Bool)

(assert (=> b!1475244 (= e!827670 e!827669)))

(declare-fun c!136071 () Bool)

(assert (=> b!1475244 (= c!136071 (validKeyInArray!0 (select (arr!47863 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1475245 () Bool)

(assert (=> b!1475245 (= e!827669 call!67757)))

(assert (= (and d!155607 (not res!1002139)) b!1475244))

(assert (= (and b!1475244 c!136071) b!1475243))

(assert (= (and b!1475244 (not c!136071)) b!1475245))

(assert (= (and b!1475243 res!1002138) b!1475242))

(assert (= (or b!1475242 b!1475245) bm!67754))

(declare-fun m!1361019 () Bool)

(assert (=> bm!67754 m!1361019))

(assert (=> b!1475243 m!1361003))

(declare-fun m!1361021 () Bool)

(assert (=> b!1475243 m!1361021))

(declare-fun m!1361023 () Bool)

(assert (=> b!1475243 m!1361023))

(assert (=> b!1475243 m!1361003))

(declare-fun m!1361025 () Bool)

(assert (=> b!1475243 m!1361025))

(assert (=> b!1475244 m!1361003))

(assert (=> b!1475244 m!1361003))

(assert (=> b!1475244 m!1361005))

(assert (=> b!1475024 d!155607))

(declare-fun d!155611 () Bool)

(declare-fun lt!644379 () SeekEntryResult!12128)

(assert (=> d!155611 (and (or ((_ is Undefined!12128) lt!644379) (not ((_ is Found!12128) lt!644379)) (and (bvsge (index!50905 lt!644379) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644379) (size!48415 a!2862)))) (or ((_ is Undefined!12128) lt!644379) ((_ is Found!12128) lt!644379) (not ((_ is MissingZero!12128) lt!644379)) (and (bvsge (index!50904 lt!644379) #b00000000000000000000000000000000) (bvslt (index!50904 lt!644379) (size!48415 a!2862)))) (or ((_ is Undefined!12128) lt!644379) ((_ is Found!12128) lt!644379) ((_ is MissingZero!12128) lt!644379) (not ((_ is MissingVacant!12128) lt!644379)) (and (bvsge (index!50907 lt!644379) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644379) (size!48415 a!2862)))) (or ((_ is Undefined!12128) lt!644379) (ite ((_ is Found!12128) lt!644379) (= (select (arr!47863 a!2862) (index!50905 lt!644379)) (select (arr!47863 a!2862) j!93)) (ite ((_ is MissingZero!12128) lt!644379) (= (select (arr!47863 a!2862) (index!50904 lt!644379)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12128) lt!644379) (= (select (arr!47863 a!2862) (index!50907 lt!644379)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!827674 () SeekEntryResult!12128)

(assert (=> d!155611 (= lt!644379 e!827674)))

(declare-fun c!136074 () Bool)

(declare-fun lt!644381 () SeekEntryResult!12128)

(assert (=> d!155611 (= c!136074 (and ((_ is Intermediate!12128) lt!644381) (undefined!12940 lt!644381)))))

(assert (=> d!155611 (= lt!644381 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!155611 (validMask!0 mask!2687)))

(assert (=> d!155611 (= (seekEntryOrOpen!0 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!644379)))

(declare-fun b!1475246 () Bool)

(assert (=> b!1475246 (= e!827674 Undefined!12128)))

(declare-fun b!1475247 () Bool)

(declare-fun e!827672 () SeekEntryResult!12128)

(assert (=> b!1475247 (= e!827672 (seekKeyOrZeroReturnVacant!0 (x!132488 lt!644381) (index!50906 lt!644381) (index!50906 lt!644381) (select (arr!47863 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475248 () Bool)

(assert (=> b!1475248 (= e!827672 (MissingZero!12128 (index!50906 lt!644381)))))

(declare-fun b!1475249 () Bool)

(declare-fun e!827673 () SeekEntryResult!12128)

(assert (=> b!1475249 (= e!827673 (Found!12128 (index!50906 lt!644381)))))

(declare-fun b!1475250 () Bool)

(declare-fun c!136072 () Bool)

(declare-fun lt!644380 () (_ BitVec 64))

(assert (=> b!1475250 (= c!136072 (= lt!644380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475250 (= e!827673 e!827672)))

(declare-fun b!1475251 () Bool)

(assert (=> b!1475251 (= e!827674 e!827673)))

(assert (=> b!1475251 (= lt!644380 (select (arr!47863 a!2862) (index!50906 lt!644381)))))

(declare-fun c!136073 () Bool)

(assert (=> b!1475251 (= c!136073 (= lt!644380 (select (arr!47863 a!2862) j!93)))))

(assert (= (and d!155611 c!136074) b!1475246))

(assert (= (and d!155611 (not c!136074)) b!1475251))

(assert (= (and b!1475251 c!136073) b!1475249))

(assert (= (and b!1475251 (not c!136073)) b!1475250))

(assert (= (and b!1475250 c!136072) b!1475248))

(assert (= (and b!1475250 (not c!136072)) b!1475247))

(assert (=> d!155611 m!1360835))

(assert (=> d!155611 m!1360873))

(declare-fun m!1361027 () Bool)

(assert (=> d!155611 m!1361027))

(declare-fun m!1361029 () Bool)

(assert (=> d!155611 m!1361029))

(assert (=> d!155611 m!1360847))

(assert (=> d!155611 m!1360873))

(assert (=> d!155611 m!1360835))

(assert (=> d!155611 m!1360875))

(declare-fun m!1361031 () Bool)

(assert (=> d!155611 m!1361031))

(assert (=> b!1475247 m!1360835))

(declare-fun m!1361033 () Bool)

(assert (=> b!1475247 m!1361033))

(declare-fun m!1361035 () Bool)

(assert (=> b!1475251 m!1361035))

(assert (=> b!1475034 d!155611))

(declare-fun b!1475256 () Bool)

(declare-fun e!827679 () Bool)

(declare-fun call!67760 () Bool)

(assert (=> b!1475256 (= e!827679 call!67760)))

(declare-fun bm!67757 () Bool)

(assert (=> bm!67757 (= call!67760 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1475257 () Bool)

(declare-fun e!827677 () Bool)

(assert (=> b!1475257 (= e!827677 e!827679)))

(declare-fun lt!644390 () (_ BitVec 64))

(assert (=> b!1475257 (= lt!644390 (select (arr!47863 a!2862) j!93))))

(declare-fun lt!644389 () Unit!49437)

(assert (=> b!1475257 (= lt!644389 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!644390 j!93))))

(assert (=> b!1475257 (arrayContainsKey!0 a!2862 lt!644390 #b00000000000000000000000000000000)))

(declare-fun lt!644388 () Unit!49437)

(assert (=> b!1475257 (= lt!644388 lt!644389)))

(declare-fun res!1002140 () Bool)

(assert (=> b!1475257 (= res!1002140 (= (seekEntryOrOpen!0 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) (Found!12128 j!93)))))

(assert (=> b!1475257 (=> (not res!1002140) (not e!827679))))

(declare-fun d!155613 () Bool)

(declare-fun res!1002141 () Bool)

(declare-fun e!827678 () Bool)

(assert (=> d!155613 (=> res!1002141 e!827678)))

(assert (=> d!155613 (= res!1002141 (bvsge j!93 (size!48415 a!2862)))))

(assert (=> d!155613 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!827678)))

(declare-fun b!1475258 () Bool)

(assert (=> b!1475258 (= e!827678 e!827677)))

(declare-fun c!136077 () Bool)

(assert (=> b!1475258 (= c!136077 (validKeyInArray!0 (select (arr!47863 a!2862) j!93)))))

(declare-fun b!1475259 () Bool)

(assert (=> b!1475259 (= e!827677 call!67760)))

(assert (= (and d!155613 (not res!1002141)) b!1475258))

(assert (= (and b!1475258 c!136077) b!1475257))

(assert (= (and b!1475258 (not c!136077)) b!1475259))

(assert (= (and b!1475257 res!1002140) b!1475256))

(assert (= (or b!1475256 b!1475259) bm!67757))

(declare-fun m!1361037 () Bool)

(assert (=> bm!67757 m!1361037))

(assert (=> b!1475257 m!1360835))

(declare-fun m!1361039 () Bool)

(assert (=> b!1475257 m!1361039))

(declare-fun m!1361041 () Bool)

(assert (=> b!1475257 m!1361041))

(assert (=> b!1475257 m!1360835))

(assert (=> b!1475257 m!1360857))

(assert (=> b!1475258 m!1360835))

(assert (=> b!1475258 m!1360835))

(assert (=> b!1475258 m!1360837))

(assert (=> b!1475034 d!155613))

(declare-fun d!155615 () Bool)

(assert (=> d!155615 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!644396 () Unit!49437)

(declare-fun choose!38 (array!99160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49437)

(assert (=> d!155615 (= lt!644396 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!155615 (validMask!0 mask!2687)))

(assert (=> d!155615 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!644396)))

(declare-fun bs!42541 () Bool)

(assert (= bs!42541 d!155615))

(assert (=> bs!42541 m!1360859))

(declare-fun m!1361057 () Bool)

(assert (=> bs!42541 m!1361057))

(assert (=> bs!42541 m!1360847))

(assert (=> b!1475034 d!155615))

(declare-fun d!155619 () Bool)

(declare-fun e!827692 () Bool)

(assert (=> d!155619 e!827692))

(declare-fun c!136087 () Bool)

(declare-fun lt!644398 () SeekEntryResult!12128)

(assert (=> d!155619 (= c!136087 (and ((_ is Intermediate!12128) lt!644398) (undefined!12940 lt!644398)))))

(declare-fun e!827694 () SeekEntryResult!12128)

(assert (=> d!155619 (= lt!644398 e!827694)))

(declare-fun c!136088 () Bool)

(assert (=> d!155619 (= c!136088 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644397 () (_ BitVec 64))

(assert (=> d!155619 (= lt!644397 (select (arr!47863 lt!644309) (toIndex!0 lt!644306 mask!2687)))))

(assert (=> d!155619 (validMask!0 mask!2687)))

(assert (=> d!155619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644306 mask!2687) lt!644306 lt!644309 mask!2687) lt!644398)))

(declare-fun b!1475279 () Bool)

(assert (=> b!1475279 (and (bvsge (index!50906 lt!644398) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644398) (size!48415 lt!644309)))))

(declare-fun e!827695 () Bool)

(assert (=> b!1475279 (= e!827695 (= (select (arr!47863 lt!644309) (index!50906 lt!644398)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475280 () Bool)

(assert (=> b!1475280 (= e!827694 (Intermediate!12128 true (toIndex!0 lt!644306 mask!2687) #b00000000000000000000000000000000))))

(declare-fun e!827693 () SeekEntryResult!12128)

(declare-fun b!1475281 () Bool)

(assert (=> b!1475281 (= e!827693 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!644306 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!644306 lt!644309 mask!2687))))

(declare-fun b!1475282 () Bool)

(assert (=> b!1475282 (and (bvsge (index!50906 lt!644398) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644398) (size!48415 lt!644309)))))

(declare-fun res!1002146 () Bool)

(assert (=> b!1475282 (= res!1002146 (= (select (arr!47863 lt!644309) (index!50906 lt!644398)) lt!644306))))

(assert (=> b!1475282 (=> res!1002146 e!827695)))

(declare-fun e!827691 () Bool)

(assert (=> b!1475282 (= e!827691 e!827695)))

(declare-fun b!1475283 () Bool)

(assert (=> b!1475283 (= e!827692 (bvsge (x!132488 lt!644398) #b01111111111111111111111111111110))))

(declare-fun b!1475284 () Bool)

(assert (=> b!1475284 (= e!827692 e!827691)))

(declare-fun res!1002145 () Bool)

(assert (=> b!1475284 (= res!1002145 (and ((_ is Intermediate!12128) lt!644398) (not (undefined!12940 lt!644398)) (bvslt (x!132488 lt!644398) #b01111111111111111111111111111110) (bvsge (x!132488 lt!644398) #b00000000000000000000000000000000) (bvsge (x!132488 lt!644398) #b00000000000000000000000000000000)))))

(assert (=> b!1475284 (=> (not res!1002145) (not e!827691))))

(declare-fun b!1475285 () Bool)

(assert (=> b!1475285 (= e!827693 (Intermediate!12128 false (toIndex!0 lt!644306 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475286 () Bool)

(assert (=> b!1475286 (and (bvsge (index!50906 lt!644398) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644398) (size!48415 lt!644309)))))

(declare-fun res!1002147 () Bool)

(assert (=> b!1475286 (= res!1002147 (= (select (arr!47863 lt!644309) (index!50906 lt!644398)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475286 (=> res!1002147 e!827695)))

(declare-fun b!1475287 () Bool)

(assert (=> b!1475287 (= e!827694 e!827693)))

(declare-fun c!136086 () Bool)

(assert (=> b!1475287 (= c!136086 (or (= lt!644397 lt!644306) (= (bvadd lt!644397 lt!644397) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155619 c!136088) b!1475280))

(assert (= (and d!155619 (not c!136088)) b!1475287))

(assert (= (and b!1475287 c!136086) b!1475285))

(assert (= (and b!1475287 (not c!136086)) b!1475281))

(assert (= (and d!155619 c!136087) b!1475283))

(assert (= (and d!155619 (not c!136087)) b!1475284))

(assert (= (and b!1475284 res!1002145) b!1475282))

(assert (= (and b!1475282 (not res!1002146)) b!1475286))

(assert (= (and b!1475286 (not res!1002147)) b!1475279))

(declare-fun m!1361063 () Bool)

(assert (=> b!1475279 m!1361063))

(assert (=> d!155619 m!1360841))

(declare-fun m!1361065 () Bool)

(assert (=> d!155619 m!1361065))

(assert (=> d!155619 m!1360847))

(assert (=> b!1475286 m!1361063))

(assert (=> b!1475282 m!1361063))

(assert (=> b!1475281 m!1360841))

(declare-fun m!1361067 () Bool)

(assert (=> b!1475281 m!1361067))

(assert (=> b!1475281 m!1361067))

(declare-fun m!1361069 () Bool)

(assert (=> b!1475281 m!1361069))

(assert (=> b!1475022 d!155619))

(declare-fun d!155623 () Bool)

(declare-fun lt!644404 () (_ BitVec 32))

(declare-fun lt!644403 () (_ BitVec 32))

(assert (=> d!155623 (= lt!644404 (bvmul (bvxor lt!644403 (bvlshr lt!644403 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155623 (= lt!644403 ((_ extract 31 0) (bvand (bvxor lt!644306 (bvlshr lt!644306 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155623 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002148 (let ((h!35803 ((_ extract 31 0) (bvand (bvxor lt!644306 (bvlshr lt!644306 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132493 (bvmul (bvxor h!35803 (bvlshr h!35803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132493 (bvlshr x!132493 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002148 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002148 #b00000000000000000000000000000000))))))

(assert (=> d!155623 (= (toIndex!0 lt!644306 mask!2687) (bvand (bvxor lt!644404 (bvlshr lt!644404 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475022 d!155623))

(declare-fun d!155625 () Bool)

(declare-fun e!827703 () Bool)

(assert (=> d!155625 e!827703))

(declare-fun c!136092 () Bool)

(declare-fun lt!644412 () SeekEntryResult!12128)

(assert (=> d!155625 (= c!136092 (and ((_ is Intermediate!12128) lt!644412) (undefined!12940 lt!644412)))))

(declare-fun e!827705 () SeekEntryResult!12128)

(assert (=> d!155625 (= lt!644412 e!827705)))

(declare-fun c!136093 () Bool)

(assert (=> d!155625 (= c!136093 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!644411 () (_ BitVec 64))

(assert (=> d!155625 (= lt!644411 (select (arr!47863 a!2862) (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687)))))

(assert (=> d!155625 (validMask!0 mask!2687)))

(assert (=> d!155625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!644412)))

(declare-fun b!1475294 () Bool)

(assert (=> b!1475294 (and (bvsge (index!50906 lt!644412) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644412) (size!48415 a!2862)))))

(declare-fun e!827706 () Bool)

(assert (=> b!1475294 (= e!827706 (= (select (arr!47863 a!2862) (index!50906 lt!644412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1475295 () Bool)

(assert (=> b!1475295 (= e!827705 (Intermediate!12128 true (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475296 () Bool)

(declare-fun e!827704 () SeekEntryResult!12128)

(assert (=> b!1475296 (= e!827704 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47863 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475297 () Bool)

(assert (=> b!1475297 (and (bvsge (index!50906 lt!644412) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644412) (size!48415 a!2862)))))

(declare-fun res!1002154 () Bool)

(assert (=> b!1475297 (= res!1002154 (= (select (arr!47863 a!2862) (index!50906 lt!644412)) (select (arr!47863 a!2862) j!93)))))

(assert (=> b!1475297 (=> res!1002154 e!827706)))

(declare-fun e!827702 () Bool)

(assert (=> b!1475297 (= e!827702 e!827706)))

(declare-fun b!1475298 () Bool)

(assert (=> b!1475298 (= e!827703 (bvsge (x!132488 lt!644412) #b01111111111111111111111111111110))))

(declare-fun b!1475299 () Bool)

(assert (=> b!1475299 (= e!827703 e!827702)))

(declare-fun res!1002153 () Bool)

(assert (=> b!1475299 (= res!1002153 (and ((_ is Intermediate!12128) lt!644412) (not (undefined!12940 lt!644412)) (bvslt (x!132488 lt!644412) #b01111111111111111111111111111110) (bvsge (x!132488 lt!644412) #b00000000000000000000000000000000) (bvsge (x!132488 lt!644412) #b00000000000000000000000000000000)))))

(assert (=> b!1475299 (=> (not res!1002153) (not e!827702))))

(declare-fun b!1475300 () Bool)

(assert (=> b!1475300 (= e!827704 (Intermediate!12128 false (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1475301 () Bool)

(assert (=> b!1475301 (and (bvsge (index!50906 lt!644412) #b00000000000000000000000000000000) (bvslt (index!50906 lt!644412) (size!48415 a!2862)))))

(declare-fun res!1002155 () Bool)

(assert (=> b!1475301 (= res!1002155 (= (select (arr!47863 a!2862) (index!50906 lt!644412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1475301 (=> res!1002155 e!827706)))

(declare-fun b!1475302 () Bool)

(assert (=> b!1475302 (= e!827705 e!827704)))

(declare-fun c!136091 () Bool)

(assert (=> b!1475302 (= c!136091 (or (= lt!644411 (select (arr!47863 a!2862) j!93)) (= (bvadd lt!644411 lt!644411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!155625 c!136093) b!1475295))

(assert (= (and d!155625 (not c!136093)) b!1475302))

(assert (= (and b!1475302 c!136091) b!1475300))

(assert (= (and b!1475302 (not c!136091)) b!1475296))

(assert (= (and d!155625 c!136092) b!1475298))

(assert (= (and d!155625 (not c!136092)) b!1475299))

(assert (= (and b!1475299 res!1002153) b!1475297))

(assert (= (and b!1475297 (not res!1002154)) b!1475301))

(assert (= (and b!1475301 (not res!1002155)) b!1475294))

(declare-fun m!1361071 () Bool)

(assert (=> b!1475294 m!1361071))

(assert (=> d!155625 m!1360873))

(declare-fun m!1361073 () Bool)

(assert (=> d!155625 m!1361073))

(assert (=> d!155625 m!1360847))

(assert (=> b!1475301 m!1361071))

(assert (=> b!1475297 m!1361071))

(assert (=> b!1475296 m!1360873))

(declare-fun m!1361075 () Bool)

(assert (=> b!1475296 m!1361075))

(assert (=> b!1475296 m!1361075))

(assert (=> b!1475296 m!1360835))

(declare-fun m!1361077 () Bool)

(assert (=> b!1475296 m!1361077))

(assert (=> b!1475032 d!155625))

(declare-fun d!155627 () Bool)

(declare-fun lt!644414 () (_ BitVec 32))

(declare-fun lt!644413 () (_ BitVec 32))

(assert (=> d!155627 (= lt!644414 (bvmul (bvxor lt!644413 (bvlshr lt!644413 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155627 (= lt!644413 ((_ extract 31 0) (bvand (bvxor (select (arr!47863 a!2862) j!93) (bvlshr (select (arr!47863 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155627 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1002148 (let ((h!35803 ((_ extract 31 0) (bvand (bvxor (select (arr!47863 a!2862) j!93) (bvlshr (select (arr!47863 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132493 (bvmul (bvxor h!35803 (bvlshr h!35803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132493 (bvlshr x!132493 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1002148 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1002148 #b00000000000000000000000000000000))))))

(assert (=> d!155627 (= (toIndex!0 (select (arr!47863 a!2862) j!93) mask!2687) (bvand (bvxor lt!644414 (bvlshr lt!644414 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1475032 d!155627))

(declare-fun d!155629 () Bool)

(assert (=> d!155629 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!125962 d!155629))

(declare-fun d!155637 () Bool)

(assert (=> d!155637 (= (array_inv!37096 a!2862) (bvsge (size!48415 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!125962 d!155637))

(declare-fun b!1475327 () Bool)

(declare-fun e!827720 () SeekEntryResult!12128)

(declare-fun e!827719 () SeekEntryResult!12128)

(assert (=> b!1475327 (= e!827720 e!827719)))

(declare-fun c!136106 () Bool)

(declare-fun lt!644431 () (_ BitVec 64))

(assert (=> b!1475327 (= c!136106 (= lt!644431 (select (arr!47863 a!2862) j!93)))))

(declare-fun b!1475328 () Bool)

(declare-fun c!136104 () Bool)

(assert (=> b!1475328 (= c!136104 (= lt!644431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!827721 () SeekEntryResult!12128)

(assert (=> b!1475328 (= e!827719 e!827721)))

(declare-fun b!1475330 () Bool)

(assert (=> b!1475330 (= e!827719 (Found!12128 index!646))))

(declare-fun b!1475331 () Bool)

(assert (=> b!1475331 (= e!827721 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1475332 () Bool)

(assert (=> b!1475332 (= e!827720 Undefined!12128)))

(declare-fun d!155639 () Bool)

(declare-fun lt!644430 () SeekEntryResult!12128)

(assert (=> d!155639 (and (or ((_ is Undefined!12128) lt!644430) (not ((_ is Found!12128) lt!644430)) (and (bvsge (index!50905 lt!644430) #b00000000000000000000000000000000) (bvslt (index!50905 lt!644430) (size!48415 a!2862)))) (or ((_ is Undefined!12128) lt!644430) ((_ is Found!12128) lt!644430) (not ((_ is MissingVacant!12128) lt!644430)) (not (= (index!50907 lt!644430) index!646)) (and (bvsge (index!50907 lt!644430) #b00000000000000000000000000000000) (bvslt (index!50907 lt!644430) (size!48415 a!2862)))) (or ((_ is Undefined!12128) lt!644430) (ite ((_ is Found!12128) lt!644430) (= (select (arr!47863 a!2862) (index!50905 lt!644430)) (select (arr!47863 a!2862) j!93)) (and ((_ is MissingVacant!12128) lt!644430) (= (index!50907 lt!644430) index!646) (= (select (arr!47863 a!2862) (index!50907 lt!644430)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!155639 (= lt!644430 e!827720)))

(declare-fun c!136105 () Bool)

(assert (=> d!155639 (= c!136105 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155639 (= lt!644431 (select (arr!47863 a!2862) index!646))))

(assert (=> d!155639 (validMask!0 mask!2687)))

(assert (=> d!155639 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47863 a!2862) j!93) a!2862 mask!2687) lt!644430)))

(declare-fun b!1475329 () Bool)

(assert (=> b!1475329 (= e!827721 (MissingVacant!12128 index!646))))

(assert (= (and d!155639 c!136105) b!1475332))

(assert (= (and d!155639 (not c!136105)) b!1475327))

(assert (= (and b!1475327 c!136106) b!1475330))

(assert (= (and b!1475327 (not c!136106)) b!1475328))

(assert (= (and b!1475328 c!136104) b!1475329))

(assert (= (and b!1475328 (not c!136104)) b!1475331))

(assert (=> b!1475331 m!1360983))

(assert (=> b!1475331 m!1360983))

(assert (=> b!1475331 m!1360835))

(declare-fun m!1361097 () Bool)

(assert (=> b!1475331 m!1361097))

(declare-fun m!1361099 () Bool)

(assert (=> d!155639 m!1361099))

(declare-fun m!1361101 () Bool)

(assert (=> d!155639 m!1361101))

(assert (=> d!155639 m!1360829))

(assert (=> d!155639 m!1360847))

(assert (=> b!1475021 d!155639))

(check-sat (not b!1475296) (not b!1475243) (not b!1475153) (not bm!67754) (not b!1475217) (not b!1475281) (not b!1475244) (not bm!67751) (not b!1475331) (not b!1475258) (not b!1475168) (not b!1475187) (not d!155605) (not d!155599) (not d!155593) (not d!155625) (not bm!67757) (not d!155619) (not b!1475257) (not b!1475186) (not d!155639) (not d!155611) (not d!155595) (not b!1475208) (not d!155615) (not b!1475184) (not b!1475247))
(check-sat)
