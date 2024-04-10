; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127118 () Bool)

(assert start!127118)

(declare-fun b!1494196 () Bool)

(declare-fun e!836966 () Bool)

(declare-fun e!836964 () Bool)

(assert (=> b!1494196 (= e!836966 e!836964)))

(declare-fun res!1016600 () Bool)

(assert (=> b!1494196 (=> (not res!1016600) (not e!836964))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99765 0))(
  ( (array!99766 (arr!48151 (Array (_ BitVec 32) (_ BitVec 64))) (size!48701 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99765)

(assert (=> b!1494196 (= res!1016600 (= (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651282 () array!99765)

(assert (=> b!1494196 (= lt!651282 (array!99766 (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48701 a!2862)))))

(declare-fun res!1016609 () Bool)

(assert (=> start!127118 (=> (not res!1016609) (not e!836966))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127118 (= res!1016609 (validMask!0 mask!2687))))

(assert (=> start!127118 e!836966))

(assert (=> start!127118 true))

(declare-fun array_inv!37179 (array!99765) Bool)

(assert (=> start!127118 (array_inv!37179 a!2862)))

(declare-fun b!1494197 () Bool)

(declare-fun e!836968 () Bool)

(assert (=> b!1494197 (= e!836964 e!836968)))

(declare-fun res!1016602 () Bool)

(assert (=> b!1494197 (=> (not res!1016602) (not e!836968))))

(declare-datatypes ((SeekEntryResult!12391 0))(
  ( (MissingZero!12391 (index!51956 (_ BitVec 32))) (Found!12391 (index!51957 (_ BitVec 32))) (Intermediate!12391 (undefined!13203 Bool) (index!51958 (_ BitVec 32)) (x!133551 (_ BitVec 32))) (Undefined!12391) (MissingVacant!12391 (index!51959 (_ BitVec 32))) )
))
(declare-fun lt!651280 () SeekEntryResult!12391)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99765 (_ BitVec 32)) SeekEntryResult!12391)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494197 (= res!1016602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48151 a!2862) j!93) mask!2687) (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!651280))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494197 (= lt!651280 (Intermediate!12391 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494198 () Bool)

(declare-fun res!1016599 () Bool)

(assert (=> b!1494198 (=> (not res!1016599) (not e!836966))))

(assert (=> b!1494198 (= res!1016599 (and (= (size!48701 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48701 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48701 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494199 () Bool)

(declare-fun res!1016596 () Bool)

(assert (=> b!1494199 (=> (not res!1016596) (not e!836966))))

(declare-datatypes ((List!34652 0))(
  ( (Nil!34649) (Cons!34648 (h!36037 (_ BitVec 64)) (t!49346 List!34652)) )
))
(declare-fun arrayNoDuplicates!0 (array!99765 (_ BitVec 32) List!34652) Bool)

(assert (=> b!1494199 (= res!1016596 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34649))))

(declare-fun e!836962 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!651277 () SeekEntryResult!12391)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!651279 () (_ BitVec 64))

(declare-fun b!1494200 () Bool)

(assert (=> b!1494200 (= e!836962 (= lt!651277 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651279 lt!651282 mask!2687)))))

(declare-fun b!1494201 () Bool)

(declare-fun e!836965 () Bool)

(assert (=> b!1494201 (= e!836965 true)))

(declare-fun lt!651281 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494201 (= lt!651281 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494202 () Bool)

(declare-fun res!1016607 () Bool)

(assert (=> b!1494202 (=> (not res!1016607) (not e!836966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494202 (= res!1016607 (validKeyInArray!0 (select (arr!48151 a!2862) j!93)))))

(declare-fun b!1494203 () Bool)

(declare-fun res!1016597 () Bool)

(declare-fun e!836963 () Bool)

(assert (=> b!1494203 (=> (not res!1016597) (not e!836963))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99765 (_ BitVec 32)) SeekEntryResult!12391)

(assert (=> b!1494203 (= res!1016597 (= (seekEntryOrOpen!0 (select (arr!48151 a!2862) j!93) a!2862 mask!2687) (Found!12391 j!93)))))

(declare-fun b!1494204 () Bool)

(declare-fun res!1016611 () Bool)

(assert (=> b!1494204 (=> (not res!1016611) (not e!836968))))

(assert (=> b!1494204 (= res!1016611 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48151 a!2862) j!93) a!2862 mask!2687) lt!651280))))

(declare-fun b!1494205 () Bool)

(assert (=> b!1494205 (= e!836963 (or (= (select (arr!48151 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48151 a!2862) intermediateBeforeIndex!19) (select (arr!48151 a!2862) j!93))))))

(declare-fun b!1494206 () Bool)

(declare-fun res!1016598 () Bool)

(declare-fun e!836967 () Bool)

(assert (=> b!1494206 (=> (not res!1016598) (not e!836967))))

(assert (=> b!1494206 (= res!1016598 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494207 () Bool)

(declare-fun res!1016605 () Bool)

(assert (=> b!1494207 (=> (not res!1016605) (not e!836966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99765 (_ BitVec 32)) Bool)

(assert (=> b!1494207 (= res!1016605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494208 () Bool)

(declare-fun res!1016608 () Bool)

(assert (=> b!1494208 (=> (not res!1016608) (not e!836966))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494208 (= res!1016608 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48701 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48701 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48701 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494209 () Bool)

(declare-fun res!1016610 () Bool)

(assert (=> b!1494209 (=> (not res!1016610) (not e!836966))))

(assert (=> b!1494209 (= res!1016610 (validKeyInArray!0 (select (arr!48151 a!2862) i!1006)))))

(declare-fun b!1494210 () Bool)

(assert (=> b!1494210 (= e!836968 e!836967)))

(declare-fun res!1016601 () Bool)

(assert (=> b!1494210 (=> (not res!1016601) (not e!836967))))

(assert (=> b!1494210 (= res!1016601 (= lt!651277 (Intermediate!12391 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1494210 (= lt!651277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651279 mask!2687) lt!651279 lt!651282 mask!2687))))

(assert (=> b!1494210 (= lt!651279 (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494211 () Bool)

(assert (=> b!1494211 (= e!836967 (not e!836965))))

(declare-fun res!1016603 () Bool)

(assert (=> b!1494211 (=> res!1016603 e!836965)))

(assert (=> b!1494211 (= res!1016603 (or (and (= (select (arr!48151 a!2862) index!646) (select (store (arr!48151 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48151 a!2862) index!646) (select (arr!48151 a!2862) j!93))) (= (select (arr!48151 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494211 e!836963))

(declare-fun res!1016606 () Bool)

(assert (=> b!1494211 (=> (not res!1016606) (not e!836963))))

(assert (=> b!1494211 (= res!1016606 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50122 0))(
  ( (Unit!50123) )
))
(declare-fun lt!651278 () Unit!50122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50122)

(assert (=> b!1494211 (= lt!651278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494212 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99765 (_ BitVec 32)) SeekEntryResult!12391)

(assert (=> b!1494212 (= e!836962 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651279 lt!651282 mask!2687) (seekEntryOrOpen!0 lt!651279 lt!651282 mask!2687)))))

(declare-fun b!1494213 () Bool)

(declare-fun res!1016604 () Bool)

(assert (=> b!1494213 (=> (not res!1016604) (not e!836967))))

(assert (=> b!1494213 (= res!1016604 e!836962)))

(declare-fun c!138330 () Bool)

(assert (=> b!1494213 (= c!138330 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!127118 res!1016609) b!1494198))

(assert (= (and b!1494198 res!1016599) b!1494209))

(assert (= (and b!1494209 res!1016610) b!1494202))

(assert (= (and b!1494202 res!1016607) b!1494207))

(assert (= (and b!1494207 res!1016605) b!1494199))

(assert (= (and b!1494199 res!1016596) b!1494208))

(assert (= (and b!1494208 res!1016608) b!1494196))

(assert (= (and b!1494196 res!1016600) b!1494197))

(assert (= (and b!1494197 res!1016602) b!1494204))

(assert (= (and b!1494204 res!1016611) b!1494210))

(assert (= (and b!1494210 res!1016601) b!1494213))

(assert (= (and b!1494213 c!138330) b!1494200))

(assert (= (and b!1494213 (not c!138330)) b!1494212))

(assert (= (and b!1494213 res!1016604) b!1494206))

(assert (= (and b!1494206 res!1016598) b!1494211))

(assert (= (and b!1494211 res!1016606) b!1494203))

(assert (= (and b!1494203 res!1016597) b!1494205))

(assert (= (and b!1494211 (not res!1016603)) b!1494201))

(declare-fun m!1377951 () Bool)

(assert (=> b!1494204 m!1377951))

(assert (=> b!1494204 m!1377951))

(declare-fun m!1377953 () Bool)

(assert (=> b!1494204 m!1377953))

(declare-fun m!1377955 () Bool)

(assert (=> b!1494196 m!1377955))

(declare-fun m!1377957 () Bool)

(assert (=> b!1494196 m!1377957))

(assert (=> b!1494203 m!1377951))

(assert (=> b!1494203 m!1377951))

(declare-fun m!1377959 () Bool)

(assert (=> b!1494203 m!1377959))

(declare-fun m!1377961 () Bool)

(assert (=> b!1494207 m!1377961))

(declare-fun m!1377963 () Bool)

(assert (=> b!1494201 m!1377963))

(assert (=> b!1494197 m!1377951))

(assert (=> b!1494197 m!1377951))

(declare-fun m!1377965 () Bool)

(assert (=> b!1494197 m!1377965))

(assert (=> b!1494197 m!1377965))

(assert (=> b!1494197 m!1377951))

(declare-fun m!1377967 () Bool)

(assert (=> b!1494197 m!1377967))

(declare-fun m!1377969 () Bool)

(assert (=> b!1494200 m!1377969))

(declare-fun m!1377971 () Bool)

(assert (=> b!1494212 m!1377971))

(declare-fun m!1377973 () Bool)

(assert (=> b!1494212 m!1377973))

(declare-fun m!1377975 () Bool)

(assert (=> b!1494209 m!1377975))

(assert (=> b!1494209 m!1377975))

(declare-fun m!1377977 () Bool)

(assert (=> b!1494209 m!1377977))

(declare-fun m!1377979 () Bool)

(assert (=> b!1494211 m!1377979))

(assert (=> b!1494211 m!1377955))

(declare-fun m!1377981 () Bool)

(assert (=> b!1494211 m!1377981))

(declare-fun m!1377983 () Bool)

(assert (=> b!1494211 m!1377983))

(declare-fun m!1377985 () Bool)

(assert (=> b!1494211 m!1377985))

(assert (=> b!1494211 m!1377951))

(declare-fun m!1377987 () Bool)

(assert (=> start!127118 m!1377987))

(declare-fun m!1377989 () Bool)

(assert (=> start!127118 m!1377989))

(declare-fun m!1377991 () Bool)

(assert (=> b!1494210 m!1377991))

(assert (=> b!1494210 m!1377991))

(declare-fun m!1377993 () Bool)

(assert (=> b!1494210 m!1377993))

(assert (=> b!1494210 m!1377955))

(declare-fun m!1377995 () Bool)

(assert (=> b!1494210 m!1377995))

(declare-fun m!1377997 () Bool)

(assert (=> b!1494199 m!1377997))

(assert (=> b!1494202 m!1377951))

(assert (=> b!1494202 m!1377951))

(declare-fun m!1377999 () Bool)

(assert (=> b!1494202 m!1377999))

(declare-fun m!1378001 () Bool)

(assert (=> b!1494205 m!1378001))

(assert (=> b!1494205 m!1377951))

(push 1)

(assert (not b!1494204))

(assert (not b!1494199))

(assert (not start!127118))

(assert (not b!1494200))

(assert (not b!1494212))

(assert (not b!1494197))

(assert (not b!1494211))

(assert (not b!1494209))

(assert (not b!1494210))

(assert (not b!1494203))

(assert (not b!1494202))

(assert (not b!1494207))

(assert (not b!1494201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

