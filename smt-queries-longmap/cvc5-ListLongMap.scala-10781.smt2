; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126184 () Bool)

(assert start!126184)

(declare-fun b!1477948 () Bool)

(declare-fun res!1004019 () Bool)

(declare-fun e!829098 () Bool)

(assert (=> b!1477948 (=> (not res!1004019) (not e!829098))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99290 0))(
  ( (array!99291 (arr!47924 (Array (_ BitVec 32) (_ BitVec 64))) (size!48474 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99290)

(assert (=> b!1477948 (= res!1004019 (and (= (size!48474 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48474 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48474 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477949 () Bool)

(declare-fun e!829106 () Bool)

(assert (=> b!1477949 (= e!829106 (not true))))

(declare-fun e!829102 () Bool)

(assert (=> b!1477949 e!829102))

(declare-fun res!1004030 () Bool)

(assert (=> b!1477949 (=> (not res!1004030) (not e!829102))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12164 0))(
  ( (MissingZero!12164 (index!51048 (_ BitVec 32))) (Found!12164 (index!51049 (_ BitVec 32))) (Intermediate!12164 (undefined!12976 Bool) (index!51050 (_ BitVec 32)) (x!132643 (_ BitVec 32))) (Undefined!12164) (MissingVacant!12164 (index!51051 (_ BitVec 32))) )
))
(declare-fun lt!645521 () SeekEntryResult!12164)

(assert (=> b!1477949 (= res!1004030 (and (= lt!645521 (Found!12164 j!93)) (or (= (select (arr!47924 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47924 a!2862) intermediateBeforeIndex!19) (select (arr!47924 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99290 (_ BitVec 32)) SeekEntryResult!12164)

(assert (=> b!1477949 (= lt!645521 (seekEntryOrOpen!0 (select (arr!47924 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99290 (_ BitVec 32)) Bool)

(assert (=> b!1477949 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49668 0))(
  ( (Unit!49669) )
))
(declare-fun lt!645517 () Unit!49668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49668)

(assert (=> b!1477949 (= lt!645517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477950 () Bool)

(declare-fun res!1004026 () Bool)

(assert (=> b!1477950 (=> (not res!1004026) (not e!829098))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477950 (= res!1004026 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48474 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48474 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48474 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477951 () Bool)

(declare-fun res!1004029 () Bool)

(assert (=> b!1477951 (=> (not res!1004029) (not e!829098))))

(declare-datatypes ((List!34425 0))(
  ( (Nil!34422) (Cons!34421 (h!35789 (_ BitVec 64)) (t!49119 List!34425)) )
))
(declare-fun arrayNoDuplicates!0 (array!99290 (_ BitVec 32) List!34425) Bool)

(assert (=> b!1477951 (= res!1004029 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34422))))

(declare-fun b!1477953 () Bool)

(declare-fun res!1004022 () Bool)

(declare-fun e!829099 () Bool)

(assert (=> b!1477953 (=> (not res!1004022) (not e!829099))))

(declare-fun lt!645520 () SeekEntryResult!12164)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99290 (_ BitVec 32)) SeekEntryResult!12164)

(assert (=> b!1477953 (= res!1004022 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47924 a!2862) j!93) a!2862 mask!2687) lt!645520))))

(declare-fun b!1477954 () Bool)

(declare-fun e!829104 () Bool)

(assert (=> b!1477954 (= e!829104 e!829099)))

(declare-fun res!1004017 () Bool)

(assert (=> b!1477954 (=> (not res!1004017) (not e!829099))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477954 (= res!1004017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47924 a!2862) j!93) mask!2687) (select (arr!47924 a!2862) j!93) a!2862 mask!2687) lt!645520))))

(assert (=> b!1477954 (= lt!645520 (Intermediate!12164 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477955 () Bool)

(declare-fun e!829101 () Bool)

(assert (=> b!1477955 (= e!829102 e!829101)))

(declare-fun res!1004027 () Bool)

(assert (=> b!1477955 (=> res!1004027 e!829101)))

(assert (=> b!1477955 (= res!1004027 (or (and (= (select (arr!47924 a!2862) index!646) (select (store (arr!47924 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47924 a!2862) index!646) (select (arr!47924 a!2862) j!93))) (not (= (select (arr!47924 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477956 () Bool)

(declare-fun res!1004023 () Bool)

(assert (=> b!1477956 (=> (not res!1004023) (not e!829106))))

(assert (=> b!1477956 (= res!1004023 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1477957 () Bool)

(declare-fun res!1004031 () Bool)

(assert (=> b!1477957 (=> (not res!1004031) (not e!829098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477957 (= res!1004031 (validKeyInArray!0 (select (arr!47924 a!2862) j!93)))))

(declare-fun b!1477958 () Bool)

(assert (=> b!1477958 (= e!829098 e!829104)))

(declare-fun res!1004021 () Bool)

(assert (=> b!1477958 (=> (not res!1004021) (not e!829104))))

(assert (=> b!1477958 (= res!1004021 (= (select (store (arr!47924 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645522 () array!99290)

(assert (=> b!1477958 (= lt!645522 (array!99291 (store (arr!47924 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48474 a!2862)))))

(declare-fun b!1477959 () Bool)

(declare-fun res!1004032 () Bool)

(assert (=> b!1477959 (=> (not res!1004032) (not e!829098))))

(assert (=> b!1477959 (= res!1004032 (validKeyInArray!0 (select (arr!47924 a!2862) i!1006)))))

(declare-fun b!1477960 () Bool)

(assert (=> b!1477960 (= e!829099 e!829106)))

(declare-fun res!1004028 () Bool)

(assert (=> b!1477960 (=> (not res!1004028) (not e!829106))))

(declare-fun lt!645519 () SeekEntryResult!12164)

(assert (=> b!1477960 (= res!1004028 (= lt!645519 (Intermediate!12164 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645518 () (_ BitVec 64))

(assert (=> b!1477960 (= lt!645519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645518 mask!2687) lt!645518 lt!645522 mask!2687))))

(assert (=> b!1477960 (= lt!645518 (select (store (arr!47924 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!829103 () Bool)

(declare-fun b!1477961 () Bool)

(assert (=> b!1477961 (= e!829103 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun e!829105 () Bool)

(declare-fun b!1477962 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99290 (_ BitVec 32)) SeekEntryResult!12164)

(assert (=> b!1477962 (= e!829105 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645518 lt!645522 mask!2687) (seekEntryOrOpen!0 lt!645518 lt!645522 mask!2687)))))

(declare-fun b!1477963 () Bool)

(assert (=> b!1477963 (= e!829105 (= lt!645519 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645518 lt!645522 mask!2687)))))

(declare-fun b!1477952 () Bool)

(declare-fun res!1004018 () Bool)

(assert (=> b!1477952 (=> (not res!1004018) (not e!829106))))

(assert (=> b!1477952 (= res!1004018 e!829105)))

(declare-fun c!136485 () Bool)

(assert (=> b!1477952 (= c!136485 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1004020 () Bool)

(assert (=> start!126184 (=> (not res!1004020) (not e!829098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126184 (= res!1004020 (validMask!0 mask!2687))))

(assert (=> start!126184 e!829098))

(assert (=> start!126184 true))

(declare-fun array_inv!36952 (array!99290) Bool)

(assert (=> start!126184 (array_inv!36952 a!2862)))

(declare-fun b!1477964 () Bool)

(assert (=> b!1477964 (= e!829101 e!829103)))

(declare-fun res!1004025 () Bool)

(assert (=> b!1477964 (=> (not res!1004025) (not e!829103))))

(assert (=> b!1477964 (= res!1004025 (= lt!645521 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47924 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1477965 () Bool)

(declare-fun res!1004024 () Bool)

(assert (=> b!1477965 (=> (not res!1004024) (not e!829098))))

(assert (=> b!1477965 (= res!1004024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!126184 res!1004020) b!1477948))

(assert (= (and b!1477948 res!1004019) b!1477959))

(assert (= (and b!1477959 res!1004032) b!1477957))

(assert (= (and b!1477957 res!1004031) b!1477965))

(assert (= (and b!1477965 res!1004024) b!1477951))

(assert (= (and b!1477951 res!1004029) b!1477950))

(assert (= (and b!1477950 res!1004026) b!1477958))

(assert (= (and b!1477958 res!1004021) b!1477954))

(assert (= (and b!1477954 res!1004017) b!1477953))

(assert (= (and b!1477953 res!1004022) b!1477960))

(assert (= (and b!1477960 res!1004028) b!1477952))

(assert (= (and b!1477952 c!136485) b!1477963))

(assert (= (and b!1477952 (not c!136485)) b!1477962))

(assert (= (and b!1477952 res!1004018) b!1477956))

(assert (= (and b!1477956 res!1004023) b!1477949))

(assert (= (and b!1477949 res!1004030) b!1477955))

(assert (= (and b!1477955 (not res!1004027)) b!1477964))

(assert (= (and b!1477964 res!1004025) b!1477961))

(declare-fun m!1363879 () Bool)

(assert (=> b!1477962 m!1363879))

(declare-fun m!1363881 () Bool)

(assert (=> b!1477962 m!1363881))

(declare-fun m!1363883 () Bool)

(assert (=> b!1477959 m!1363883))

(assert (=> b!1477959 m!1363883))

(declare-fun m!1363885 () Bool)

(assert (=> b!1477959 m!1363885))

(declare-fun m!1363887 () Bool)

(assert (=> b!1477960 m!1363887))

(assert (=> b!1477960 m!1363887))

(declare-fun m!1363889 () Bool)

(assert (=> b!1477960 m!1363889))

(declare-fun m!1363891 () Bool)

(assert (=> b!1477960 m!1363891))

(declare-fun m!1363893 () Bool)

(assert (=> b!1477960 m!1363893))

(declare-fun m!1363895 () Bool)

(assert (=> start!126184 m!1363895))

(declare-fun m!1363897 () Bool)

(assert (=> start!126184 m!1363897))

(declare-fun m!1363899 () Bool)

(assert (=> b!1477949 m!1363899))

(declare-fun m!1363901 () Bool)

(assert (=> b!1477949 m!1363901))

(declare-fun m!1363903 () Bool)

(assert (=> b!1477949 m!1363903))

(declare-fun m!1363905 () Bool)

(assert (=> b!1477949 m!1363905))

(declare-fun m!1363907 () Bool)

(assert (=> b!1477949 m!1363907))

(assert (=> b!1477949 m!1363903))

(assert (=> b!1477954 m!1363903))

(assert (=> b!1477954 m!1363903))

(declare-fun m!1363909 () Bool)

(assert (=> b!1477954 m!1363909))

(assert (=> b!1477954 m!1363909))

(assert (=> b!1477954 m!1363903))

(declare-fun m!1363911 () Bool)

(assert (=> b!1477954 m!1363911))

(declare-fun m!1363913 () Bool)

(assert (=> b!1477955 m!1363913))

(assert (=> b!1477955 m!1363891))

(declare-fun m!1363915 () Bool)

(assert (=> b!1477955 m!1363915))

(assert (=> b!1477955 m!1363903))

(assert (=> b!1477964 m!1363903))

(assert (=> b!1477964 m!1363903))

(declare-fun m!1363917 () Bool)

(assert (=> b!1477964 m!1363917))

(assert (=> b!1477958 m!1363891))

(declare-fun m!1363919 () Bool)

(assert (=> b!1477958 m!1363919))

(declare-fun m!1363921 () Bool)

(assert (=> b!1477963 m!1363921))

(declare-fun m!1363923 () Bool)

(assert (=> b!1477951 m!1363923))

(declare-fun m!1363925 () Bool)

(assert (=> b!1477965 m!1363925))

(assert (=> b!1477953 m!1363903))

(assert (=> b!1477953 m!1363903))

(declare-fun m!1363927 () Bool)

(assert (=> b!1477953 m!1363927))

(assert (=> b!1477957 m!1363903))

(assert (=> b!1477957 m!1363903))

(declare-fun m!1363929 () Bool)

(assert (=> b!1477957 m!1363929))

(push 1)

