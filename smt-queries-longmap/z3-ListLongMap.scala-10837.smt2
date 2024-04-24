; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127146 () Bool)

(assert start!127146)

(declare-fun b!1491956 () Bool)

(declare-fun res!1014172 () Bool)

(declare-fun e!836163 () Bool)

(assert (=> b!1491956 (=> (not res!1014172) (not e!836163))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99757 0))(
  ( (array!99758 (arr!48145 (Array (_ BitVec 32) (_ BitVec 64))) (size!48696 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99757)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12282 0))(
  ( (MissingZero!12282 (index!51520 (_ BitVec 32))) (Found!12282 (index!51521 (_ BitVec 32))) (Intermediate!12282 (undefined!13094 Bool) (index!51522 (_ BitVec 32)) (x!133299 (_ BitVec 32))) (Undefined!12282) (MissingVacant!12282 (index!51523 (_ BitVec 32))) )
))
(declare-fun lt!650516 () SeekEntryResult!12282)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99757 (_ BitVec 32)) SeekEntryResult!12282)

(assert (=> b!1491956 (= res!1014172 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!650516))))

(declare-fun b!1491957 () Bool)

(declare-fun e!836159 () Bool)

(declare-fun e!836160 () Bool)

(assert (=> b!1491957 (= e!836159 (not e!836160))))

(declare-fun res!1014165 () Bool)

(assert (=> b!1491957 (=> res!1014165 e!836160)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491957 (= res!1014165 (or (and (= (select (arr!48145 a!2862) index!646) (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48145 a!2862) index!646) (select (arr!48145 a!2862) j!93))) (= (select (arr!48145 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836165 () Bool)

(assert (=> b!1491957 e!836165))

(declare-fun res!1014163 () Bool)

(assert (=> b!1491957 (=> (not res!1014163) (not e!836165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99757 (_ BitVec 32)) Bool)

(assert (=> b!1491957 (= res!1014163 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49937 0))(
  ( (Unit!49938) )
))
(declare-fun lt!650517 () Unit!49937)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99757 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49937)

(assert (=> b!1491957 (= lt!650517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491958 () Bool)

(declare-fun res!1014173 () Bool)

(declare-fun e!836166 () Bool)

(assert (=> b!1491958 (=> (not res!1014173) (not e!836166))))

(declare-datatypes ((List!34633 0))(
  ( (Nil!34630) (Cons!34629 (h!36026 (_ BitVec 64)) (t!49319 List!34633)) )
))
(declare-fun arrayNoDuplicates!0 (array!99757 (_ BitVec 32) List!34633) Bool)

(assert (=> b!1491958 (= res!1014173 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34630))))

(declare-fun b!1491959 () Bool)

(declare-fun res!1014166 () Bool)

(assert (=> b!1491959 (=> (not res!1014166) (not e!836166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491959 (= res!1014166 (validKeyInArray!0 (select (arr!48145 a!2862) i!1006)))))

(declare-fun e!836164 () Bool)

(declare-fun lt!650520 () (_ BitVec 64))

(declare-fun b!1491960 () Bool)

(declare-fun lt!650518 () array!99757)

(declare-fun lt!650521 () SeekEntryResult!12282)

(assert (=> b!1491960 (= e!836164 (= lt!650521 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650520 lt!650518 mask!2687)))))

(declare-fun b!1491961 () Bool)

(declare-fun res!1014164 () Bool)

(assert (=> b!1491961 (=> (not res!1014164) (not e!836166))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491961 (= res!1014164 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48696 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48696 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48696 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491962 () Bool)

(assert (=> b!1491962 (= e!836165 (or (= (select (arr!48145 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48145 a!2862) intermediateBeforeIndex!19) (select (arr!48145 a!2862) j!93))))))

(declare-fun res!1014169 () Bool)

(assert (=> start!127146 (=> (not res!1014169) (not e!836166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127146 (= res!1014169 (validMask!0 mask!2687))))

(assert (=> start!127146 e!836166))

(assert (=> start!127146 true))

(declare-fun array_inv!37426 (array!99757) Bool)

(assert (=> start!127146 (array_inv!37426 a!2862)))

(declare-fun b!1491963 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99757 (_ BitVec 32)) SeekEntryResult!12282)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99757 (_ BitVec 32)) SeekEntryResult!12282)

(assert (=> b!1491963 (= e!836164 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650520 lt!650518 mask!2687) (seekEntryOrOpen!0 lt!650520 lt!650518 mask!2687)))))

(declare-fun b!1491964 () Bool)

(declare-fun res!1014159 () Bool)

(assert (=> b!1491964 (=> (not res!1014159) (not e!836166))))

(assert (=> b!1491964 (= res!1014159 (validKeyInArray!0 (select (arr!48145 a!2862) j!93)))))

(declare-fun b!1491965 () Bool)

(declare-fun e!836161 () Bool)

(assert (=> b!1491965 (= e!836161 e!836163)))

(declare-fun res!1014161 () Bool)

(assert (=> b!1491965 (=> (not res!1014161) (not e!836163))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491965 (= res!1014161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48145 a!2862) j!93) mask!2687) (select (arr!48145 a!2862) j!93) a!2862 mask!2687) lt!650516))))

(assert (=> b!1491965 (= lt!650516 (Intermediate!12282 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491966 () Bool)

(assert (=> b!1491966 (= e!836166 e!836161)))

(declare-fun res!1014160 () Bool)

(assert (=> b!1491966 (=> (not res!1014160) (not e!836161))))

(assert (=> b!1491966 (= res!1014160 (= (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491966 (= lt!650518 (array!99758 (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48696 a!2862)))))

(declare-fun b!1491967 () Bool)

(assert (=> b!1491967 (= e!836160 true)))

(declare-fun lt!650519 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491967 (= lt!650519 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1491968 () Bool)

(declare-fun res!1014168 () Bool)

(assert (=> b!1491968 (=> (not res!1014168) (not e!836159))))

(assert (=> b!1491968 (= res!1014168 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491969 () Bool)

(declare-fun res!1014158 () Bool)

(assert (=> b!1491969 (=> (not res!1014158) (not e!836166))))

(assert (=> b!1491969 (= res!1014158 (and (= (size!48696 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48696 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48696 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491970 () Bool)

(declare-fun res!1014167 () Bool)

(assert (=> b!1491970 (=> (not res!1014167) (not e!836165))))

(assert (=> b!1491970 (= res!1014167 (= (seekEntryOrOpen!0 (select (arr!48145 a!2862) j!93) a!2862 mask!2687) (Found!12282 j!93)))))

(declare-fun b!1491971 () Bool)

(declare-fun res!1014170 () Bool)

(assert (=> b!1491971 (=> (not res!1014170) (not e!836159))))

(assert (=> b!1491971 (= res!1014170 e!836164)))

(declare-fun c!138436 () Bool)

(assert (=> b!1491971 (= c!138436 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491972 () Bool)

(assert (=> b!1491972 (= e!836163 e!836159)))

(declare-fun res!1014162 () Bool)

(assert (=> b!1491972 (=> (not res!1014162) (not e!836159))))

(assert (=> b!1491972 (= res!1014162 (= lt!650521 (Intermediate!12282 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1491972 (= lt!650521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650520 mask!2687) lt!650520 lt!650518 mask!2687))))

(assert (=> b!1491972 (= lt!650520 (select (store (arr!48145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491973 () Bool)

(declare-fun res!1014171 () Bool)

(assert (=> b!1491973 (=> (not res!1014171) (not e!836166))))

(assert (=> b!1491973 (= res!1014171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!127146 res!1014169) b!1491969))

(assert (= (and b!1491969 res!1014158) b!1491959))

(assert (= (and b!1491959 res!1014166) b!1491964))

(assert (= (and b!1491964 res!1014159) b!1491973))

(assert (= (and b!1491973 res!1014171) b!1491958))

(assert (= (and b!1491958 res!1014173) b!1491961))

(assert (= (and b!1491961 res!1014164) b!1491966))

(assert (= (and b!1491966 res!1014160) b!1491965))

(assert (= (and b!1491965 res!1014161) b!1491956))

(assert (= (and b!1491956 res!1014172) b!1491972))

(assert (= (and b!1491972 res!1014162) b!1491971))

(assert (= (and b!1491971 c!138436) b!1491960))

(assert (= (and b!1491971 (not c!138436)) b!1491963))

(assert (= (and b!1491971 res!1014170) b!1491968))

(assert (= (and b!1491968 res!1014168) b!1491957))

(assert (= (and b!1491957 res!1014163) b!1491970))

(assert (= (and b!1491970 res!1014167) b!1491962))

(assert (= (and b!1491957 (not res!1014165)) b!1491967))

(declare-fun m!1376119 () Bool)

(assert (=> b!1491959 m!1376119))

(assert (=> b!1491959 m!1376119))

(declare-fun m!1376121 () Bool)

(assert (=> b!1491959 m!1376121))

(declare-fun m!1376123 () Bool)

(assert (=> b!1491960 m!1376123))

(declare-fun m!1376125 () Bool)

(assert (=> b!1491957 m!1376125))

(declare-fun m!1376127 () Bool)

(assert (=> b!1491957 m!1376127))

(declare-fun m!1376129 () Bool)

(assert (=> b!1491957 m!1376129))

(declare-fun m!1376131 () Bool)

(assert (=> b!1491957 m!1376131))

(declare-fun m!1376133 () Bool)

(assert (=> b!1491957 m!1376133))

(declare-fun m!1376135 () Bool)

(assert (=> b!1491957 m!1376135))

(assert (=> b!1491956 m!1376135))

(assert (=> b!1491956 m!1376135))

(declare-fun m!1376137 () Bool)

(assert (=> b!1491956 m!1376137))

(declare-fun m!1376139 () Bool)

(assert (=> start!127146 m!1376139))

(declare-fun m!1376141 () Bool)

(assert (=> start!127146 m!1376141))

(declare-fun m!1376143 () Bool)

(assert (=> b!1491973 m!1376143))

(assert (=> b!1491964 m!1376135))

(assert (=> b!1491964 m!1376135))

(declare-fun m!1376145 () Bool)

(assert (=> b!1491964 m!1376145))

(declare-fun m!1376147 () Bool)

(assert (=> b!1491958 m!1376147))

(declare-fun m!1376149 () Bool)

(assert (=> b!1491962 m!1376149))

(assert (=> b!1491962 m!1376135))

(declare-fun m!1376151 () Bool)

(assert (=> b!1491972 m!1376151))

(assert (=> b!1491972 m!1376151))

(declare-fun m!1376153 () Bool)

(assert (=> b!1491972 m!1376153))

(assert (=> b!1491972 m!1376127))

(declare-fun m!1376155 () Bool)

(assert (=> b!1491972 m!1376155))

(assert (=> b!1491966 m!1376127))

(declare-fun m!1376157 () Bool)

(assert (=> b!1491966 m!1376157))

(assert (=> b!1491965 m!1376135))

(assert (=> b!1491965 m!1376135))

(declare-fun m!1376159 () Bool)

(assert (=> b!1491965 m!1376159))

(assert (=> b!1491965 m!1376159))

(assert (=> b!1491965 m!1376135))

(declare-fun m!1376161 () Bool)

(assert (=> b!1491965 m!1376161))

(assert (=> b!1491970 m!1376135))

(assert (=> b!1491970 m!1376135))

(declare-fun m!1376163 () Bool)

(assert (=> b!1491970 m!1376163))

(declare-fun m!1376165 () Bool)

(assert (=> b!1491963 m!1376165))

(declare-fun m!1376167 () Bool)

(assert (=> b!1491963 m!1376167))

(declare-fun m!1376169 () Bool)

(assert (=> b!1491967 m!1376169))

(check-sat (not b!1491972) (not b!1491960) (not b!1491967) (not b!1491957) (not b!1491958) (not b!1491963) (not start!127146) (not b!1491970) (not b!1491964) (not b!1491965) (not b!1491973) (not b!1491956) (not b!1491959))
(check-sat)
