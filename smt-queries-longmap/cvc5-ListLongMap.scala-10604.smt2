; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124762 () Bool)

(assert start!124762)

(declare-fun b!1446945 () Bool)

(declare-fun res!978664 () Bool)

(declare-fun e!814933 () Bool)

(assert (=> b!1446945 (=> (not res!978664) (not e!814933))))

(declare-datatypes ((array!98210 0))(
  ( (array!98211 (arr!47393 (Array (_ BitVec 32) (_ BitVec 64))) (size!47943 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98210)

(declare-datatypes ((List!33894 0))(
  ( (Nil!33891) (Cons!33890 (h!35240 (_ BitVec 64)) (t!48588 List!33894)) )
))
(declare-fun arrayNoDuplicates!0 (array!98210 (_ BitVec 32) List!33894) Bool)

(assert (=> b!1446945 (= res!978664 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33891))))

(declare-fun b!1446946 () Bool)

(declare-fun e!814928 () Bool)

(declare-fun e!814932 () Bool)

(assert (=> b!1446946 (= e!814928 e!814932)))

(declare-fun res!978655 () Bool)

(assert (=> b!1446946 (=> res!978655 e!814932)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446946 (= res!978655 (or (and (= (select (arr!47393 a!2862) index!646) (select (store (arr!47393 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47393 a!2862) index!646) (select (arr!47393 a!2862) j!93))) (not (= (select (arr!47393 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446947 () Bool)

(declare-fun res!978648 () Bool)

(assert (=> b!1446947 (=> (not res!978648) (not e!814933))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1446947 (= res!978648 (and (= (size!47943 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47943 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47943 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446948 () Bool)

(declare-fun e!814931 () Bool)

(declare-fun e!814929 () Bool)

(assert (=> b!1446948 (= e!814931 e!814929)))

(declare-fun res!978663 () Bool)

(assert (=> b!1446948 (=> (not res!978663) (not e!814929))))

(declare-datatypes ((SeekEntryResult!11645 0))(
  ( (MissingZero!11645 (index!48972 (_ BitVec 32))) (Found!11645 (index!48973 (_ BitVec 32))) (Intermediate!11645 (undefined!12457 Bool) (index!48974 (_ BitVec 32)) (x!130654 (_ BitVec 32))) (Undefined!11645) (MissingVacant!11645 (index!48975 (_ BitVec 32))) )
))
(declare-fun lt!634983 () SeekEntryResult!11645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98210 (_ BitVec 32)) SeekEntryResult!11645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446948 (= res!978663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47393 a!2862) j!93) mask!2687) (select (arr!47393 a!2862) j!93) a!2862 mask!2687) lt!634983))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446948 (= lt!634983 (Intermediate!11645 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!634986 () array!98210)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634984 () SeekEntryResult!11645)

(declare-fun b!1446949 () Bool)

(declare-fun e!814930 () Bool)

(declare-fun lt!634982 () (_ BitVec 64))

(assert (=> b!1446949 (= e!814930 (= lt!634984 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634982 lt!634986 mask!2687)))))

(declare-fun b!1446950 () Bool)

(declare-fun e!814926 () Bool)

(assert (=> b!1446950 (= e!814926 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446951 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98210 (_ BitVec 32)) SeekEntryResult!11645)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98210 (_ BitVec 32)) SeekEntryResult!11645)

(assert (=> b!1446951 (= e!814930 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634982 lt!634986 mask!2687) (seekEntryOrOpen!0 lt!634982 lt!634986 mask!2687)))))

(declare-fun b!1446952 () Bool)

(declare-fun res!978660 () Bool)

(assert (=> b!1446952 (=> (not res!978660) (not e!814933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446952 (= res!978660 (validKeyInArray!0 (select (arr!47393 a!2862) i!1006)))))

(declare-fun b!1446953 () Bool)

(declare-fun e!814934 () Bool)

(declare-fun e!814927 () Bool)

(assert (=> b!1446953 (= e!814934 (not e!814927))))

(declare-fun res!978650 () Bool)

(assert (=> b!1446953 (=> res!978650 e!814927)))

(assert (=> b!1446953 (= res!978650 (or (and (= (select (arr!47393 a!2862) index!646) (select (store (arr!47393 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47393 a!2862) index!646) (select (arr!47393 a!2862) j!93))) (not (= (select (arr!47393 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47393 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446953 e!814928))

(declare-fun res!978661 () Bool)

(assert (=> b!1446953 (=> (not res!978661) (not e!814928))))

(declare-fun lt!634981 () SeekEntryResult!11645)

(assert (=> b!1446953 (= res!978661 (and (= lt!634981 (Found!11645 j!93)) (or (= (select (arr!47393 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47393 a!2862) intermediateBeforeIndex!19) (select (arr!47393 a!2862) j!93)))))))

(assert (=> b!1446953 (= lt!634981 (seekEntryOrOpen!0 (select (arr!47393 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98210 (_ BitVec 32)) Bool)

(assert (=> b!1446953 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48786 0))(
  ( (Unit!48787) )
))
(declare-fun lt!634980 () Unit!48786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48786)

(assert (=> b!1446953 (= lt!634980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!978659 () Bool)

(assert (=> start!124762 (=> (not res!978659) (not e!814933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124762 (= res!978659 (validMask!0 mask!2687))))

(assert (=> start!124762 e!814933))

(assert (=> start!124762 true))

(declare-fun array_inv!36421 (array!98210) Bool)

(assert (=> start!124762 (array_inv!36421 a!2862)))

(declare-fun b!1446954 () Bool)

(assert (=> b!1446954 (= e!814933 e!814931)))

(declare-fun res!978658 () Bool)

(assert (=> b!1446954 (=> (not res!978658) (not e!814931))))

(assert (=> b!1446954 (= res!978658 (= (select (store (arr!47393 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446954 (= lt!634986 (array!98211 (store (arr!47393 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47943 a!2862)))))

(declare-fun b!1446955 () Bool)

(declare-fun res!978651 () Bool)

(assert (=> b!1446955 (=> (not res!978651) (not e!814934))))

(assert (=> b!1446955 (= res!978651 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446956 () Bool)

(declare-fun res!978662 () Bool)

(assert (=> b!1446956 (=> (not res!978662) (not e!814929))))

(assert (=> b!1446956 (= res!978662 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47393 a!2862) j!93) a!2862 mask!2687) lt!634983))))

(declare-fun b!1446957 () Bool)

(declare-fun res!978653 () Bool)

(assert (=> b!1446957 (=> (not res!978653) (not e!814933))))

(assert (=> b!1446957 (= res!978653 (validKeyInArray!0 (select (arr!47393 a!2862) j!93)))))

(declare-fun b!1446958 () Bool)

(assert (=> b!1446958 (= e!814932 e!814926)))

(declare-fun res!978656 () Bool)

(assert (=> b!1446958 (=> (not res!978656) (not e!814926))))

(assert (=> b!1446958 (= res!978656 (= lt!634981 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47393 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446959 () Bool)

(assert (=> b!1446959 (= e!814929 e!814934)))

(declare-fun res!978649 () Bool)

(assert (=> b!1446959 (=> (not res!978649) (not e!814934))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446959 (= res!978649 (= lt!634984 (Intermediate!11645 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446959 (= lt!634984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634982 mask!2687) lt!634982 lt!634986 mask!2687))))

(assert (=> b!1446959 (= lt!634982 (select (store (arr!47393 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446960 () Bool)

(declare-fun res!978654 () Bool)

(assert (=> b!1446960 (=> (not res!978654) (not e!814933))))

(assert (=> b!1446960 (= res!978654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446961 () Bool)

(declare-fun res!978652 () Bool)

(assert (=> b!1446961 (=> (not res!978652) (not e!814933))))

(assert (=> b!1446961 (= res!978652 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47943 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47943 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47943 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446962 () Bool)

(assert (=> b!1446962 (= e!814927 true)))

(declare-fun lt!634985 () SeekEntryResult!11645)

(assert (=> b!1446962 (= lt!634985 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47393 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446963 () Bool)

(declare-fun res!978657 () Bool)

(assert (=> b!1446963 (=> (not res!978657) (not e!814934))))

(assert (=> b!1446963 (= res!978657 e!814930)))

(declare-fun c!133659 () Bool)

(assert (=> b!1446963 (= c!133659 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!124762 res!978659) b!1446947))

(assert (= (and b!1446947 res!978648) b!1446952))

(assert (= (and b!1446952 res!978660) b!1446957))

(assert (= (and b!1446957 res!978653) b!1446960))

(assert (= (and b!1446960 res!978654) b!1446945))

(assert (= (and b!1446945 res!978664) b!1446961))

(assert (= (and b!1446961 res!978652) b!1446954))

(assert (= (and b!1446954 res!978658) b!1446948))

(assert (= (and b!1446948 res!978663) b!1446956))

(assert (= (and b!1446956 res!978662) b!1446959))

(assert (= (and b!1446959 res!978649) b!1446963))

(assert (= (and b!1446963 c!133659) b!1446949))

(assert (= (and b!1446963 (not c!133659)) b!1446951))

(assert (= (and b!1446963 res!978657) b!1446955))

(assert (= (and b!1446955 res!978651) b!1446953))

(assert (= (and b!1446953 res!978661) b!1446946))

(assert (= (and b!1446946 (not res!978655)) b!1446958))

(assert (= (and b!1446958 res!978656) b!1446950))

(assert (= (and b!1446953 (not res!978650)) b!1446962))

(declare-fun m!1335787 () Bool)

(assert (=> b!1446948 m!1335787))

(assert (=> b!1446948 m!1335787))

(declare-fun m!1335789 () Bool)

(assert (=> b!1446948 m!1335789))

(assert (=> b!1446948 m!1335789))

(assert (=> b!1446948 m!1335787))

(declare-fun m!1335791 () Bool)

(assert (=> b!1446948 m!1335791))

(declare-fun m!1335793 () Bool)

(assert (=> start!124762 m!1335793))

(declare-fun m!1335795 () Bool)

(assert (=> start!124762 m!1335795))

(declare-fun m!1335797 () Bool)

(assert (=> b!1446946 m!1335797))

(declare-fun m!1335799 () Bool)

(assert (=> b!1446946 m!1335799))

(declare-fun m!1335801 () Bool)

(assert (=> b!1446946 m!1335801))

(assert (=> b!1446946 m!1335787))

(declare-fun m!1335803 () Bool)

(assert (=> b!1446959 m!1335803))

(assert (=> b!1446959 m!1335803))

(declare-fun m!1335805 () Bool)

(assert (=> b!1446959 m!1335805))

(assert (=> b!1446959 m!1335799))

(declare-fun m!1335807 () Bool)

(assert (=> b!1446959 m!1335807))

(declare-fun m!1335809 () Bool)

(assert (=> b!1446945 m!1335809))

(declare-fun m!1335811 () Bool)

(assert (=> b!1446960 m!1335811))

(declare-fun m!1335813 () Bool)

(assert (=> b!1446952 m!1335813))

(assert (=> b!1446952 m!1335813))

(declare-fun m!1335815 () Bool)

(assert (=> b!1446952 m!1335815))

(assert (=> b!1446958 m!1335787))

(assert (=> b!1446958 m!1335787))

(declare-fun m!1335817 () Bool)

(assert (=> b!1446958 m!1335817))

(assert (=> b!1446957 m!1335787))

(assert (=> b!1446957 m!1335787))

(declare-fun m!1335819 () Bool)

(assert (=> b!1446957 m!1335819))

(assert (=> b!1446954 m!1335799))

(declare-fun m!1335821 () Bool)

(assert (=> b!1446954 m!1335821))

(assert (=> b!1446956 m!1335787))

(assert (=> b!1446956 m!1335787))

(declare-fun m!1335823 () Bool)

(assert (=> b!1446956 m!1335823))

(assert (=> b!1446962 m!1335787))

(assert (=> b!1446962 m!1335787))

(declare-fun m!1335825 () Bool)

(assert (=> b!1446962 m!1335825))

(declare-fun m!1335827 () Bool)

(assert (=> b!1446953 m!1335827))

(assert (=> b!1446953 m!1335799))

(declare-fun m!1335829 () Bool)

(assert (=> b!1446953 m!1335829))

(assert (=> b!1446953 m!1335801))

(assert (=> b!1446953 m!1335797))

(assert (=> b!1446953 m!1335787))

(declare-fun m!1335831 () Bool)

(assert (=> b!1446953 m!1335831))

(declare-fun m!1335833 () Bool)

(assert (=> b!1446953 m!1335833))

(assert (=> b!1446953 m!1335787))

(declare-fun m!1335835 () Bool)

(assert (=> b!1446951 m!1335835))

(declare-fun m!1335837 () Bool)

(assert (=> b!1446951 m!1335837))

(declare-fun m!1335839 () Bool)

(assert (=> b!1446949 m!1335839))

(push 1)

