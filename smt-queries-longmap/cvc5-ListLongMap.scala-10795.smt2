; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126550 () Bool)

(assert start!126550)

(declare-fun b!1482123 () Bool)

(declare-fun res!1006839 () Bool)

(declare-fun e!831392 () Bool)

(assert (=> b!1482123 (=> (not res!1006839) (not e!831392))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99494 0))(
  ( (array!99495 (arr!48021 (Array (_ BitVec 32) (_ BitVec 64))) (size!48572 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99494)

(assert (=> b!1482123 (= res!1006839 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48572 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48572 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48572 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482124 () Bool)

(declare-fun res!1006834 () Bool)

(assert (=> b!1482124 (=> (not res!1006834) (not e!831392))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482124 (= res!1006834 (validKeyInArray!0 (select (arr!48021 a!2862) j!93)))))

(declare-fun b!1482125 () Bool)

(declare-fun e!831390 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482125 (= e!831390 (not (or (and (= (select (arr!48021 a!2862) index!646) (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48021 a!2862) index!646) (select (arr!48021 a!2862) j!93))) (= (select (arr!48021 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun e!831387 () Bool)

(assert (=> b!1482125 e!831387))

(declare-fun res!1006840 () Bool)

(assert (=> b!1482125 (=> (not res!1006840) (not e!831387))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99494 (_ BitVec 32)) Bool)

(assert (=> b!1482125 (= res!1006840 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49689 0))(
  ( (Unit!49690) )
))
(declare-fun lt!647038 () Unit!49689)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49689)

(assert (=> b!1482125 (= lt!647038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482126 () Bool)

(declare-fun res!1006842 () Bool)

(assert (=> b!1482126 (=> (not res!1006842) (not e!831392))))

(declare-datatypes ((List!34509 0))(
  ( (Nil!34506) (Cons!34505 (h!35887 (_ BitVec 64)) (t!49195 List!34509)) )
))
(declare-fun arrayNoDuplicates!0 (array!99494 (_ BitVec 32) List!34509) Bool)

(assert (=> b!1482126 (= res!1006842 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34506))))

(declare-fun b!1482127 () Bool)

(declare-fun e!831391 () Bool)

(assert (=> b!1482127 (= e!831392 e!831391)))

(declare-fun res!1006837 () Bool)

(assert (=> b!1482127 (=> (not res!1006837) (not e!831391))))

(assert (=> b!1482127 (= res!1006837 (= (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!647037 () array!99494)

(assert (=> b!1482127 (= lt!647037 (array!99495 (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48572 a!2862)))))

(declare-fun res!1006841 () Bool)

(assert (=> start!126550 (=> (not res!1006841) (not e!831392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126550 (= res!1006841 (validMask!0 mask!2687))))

(assert (=> start!126550 e!831392))

(assert (=> start!126550 true))

(declare-fun array_inv!37302 (array!99494) Bool)

(assert (=> start!126550 (array_inv!37302 a!2862)))

(declare-fun b!1482128 () Bool)

(declare-fun res!1006836 () Bool)

(assert (=> b!1482128 (=> (not res!1006836) (not e!831392))))

(assert (=> b!1482128 (= res!1006836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!647039 () (_ BitVec 64))

(declare-fun b!1482129 () Bool)

(declare-fun e!831389 () Bool)

(declare-datatypes ((SeekEntryResult!12158 0))(
  ( (MissingZero!12158 (index!51024 (_ BitVec 32))) (Found!12158 (index!51025 (_ BitVec 32))) (Intermediate!12158 (undefined!12970 Bool) (index!51026 (_ BitVec 32)) (x!132782 (_ BitVec 32))) (Undefined!12158) (MissingVacant!12158 (index!51027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99494 (_ BitVec 32)) SeekEntryResult!12158)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99494 (_ BitVec 32)) SeekEntryResult!12158)

(assert (=> b!1482129 (= e!831389 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647039 lt!647037 mask!2687) (seekEntryOrOpen!0 lt!647039 lt!647037 mask!2687)))))

(declare-fun lt!647040 () SeekEntryResult!12158)

(declare-fun b!1482130 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99494 (_ BitVec 32)) SeekEntryResult!12158)

(assert (=> b!1482130 (= e!831389 (= lt!647040 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647039 lt!647037 mask!2687)))))

(declare-fun b!1482131 () Bool)

(declare-fun res!1006833 () Bool)

(assert (=> b!1482131 (=> (not res!1006833) (not e!831392))))

(assert (=> b!1482131 (= res!1006833 (and (= (size!48572 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48572 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48572 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1482132 () Bool)

(declare-fun e!831388 () Bool)

(assert (=> b!1482132 (= e!831391 e!831388)))

(declare-fun res!1006838 () Bool)

(assert (=> b!1482132 (=> (not res!1006838) (not e!831388))))

(declare-fun lt!647041 () SeekEntryResult!12158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482132 (= res!1006838 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647041))))

(assert (=> b!1482132 (= lt!647041 (Intermediate!12158 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482133 () Bool)

(declare-fun res!1006830 () Bool)

(assert (=> b!1482133 (=> (not res!1006830) (not e!831392))))

(assert (=> b!1482133 (= res!1006830 (validKeyInArray!0 (select (arr!48021 a!2862) i!1006)))))

(declare-fun b!1482134 () Bool)

(declare-fun res!1006832 () Bool)

(assert (=> b!1482134 (=> (not res!1006832) (not e!831388))))

(assert (=> b!1482134 (= res!1006832 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647041))))

(declare-fun b!1482135 () Bool)

(declare-fun res!1006844 () Bool)

(assert (=> b!1482135 (=> (not res!1006844) (not e!831387))))

(assert (=> b!1482135 (= res!1006844 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) (Found!12158 j!93)))))

(declare-fun b!1482136 () Bool)

(assert (=> b!1482136 (= e!831387 (or (= (select (arr!48021 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48021 a!2862) intermediateBeforeIndex!19) (select (arr!48021 a!2862) j!93))))))

(declare-fun b!1482137 () Bool)

(assert (=> b!1482137 (= e!831388 e!831390)))

(declare-fun res!1006835 () Bool)

(assert (=> b!1482137 (=> (not res!1006835) (not e!831390))))

(assert (=> b!1482137 (= res!1006835 (= lt!647040 (Intermediate!12158 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1482137 (= lt!647040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647039 mask!2687) lt!647039 lt!647037 mask!2687))))

(assert (=> b!1482137 (= lt!647039 (select (store (arr!48021 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1482138 () Bool)

(declare-fun res!1006843 () Bool)

(assert (=> b!1482138 (=> (not res!1006843) (not e!831390))))

(assert (=> b!1482138 (= res!1006843 e!831389)))

(declare-fun c!137176 () Bool)

(assert (=> b!1482138 (= c!137176 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1482139 () Bool)

(declare-fun res!1006831 () Bool)

(assert (=> b!1482139 (=> (not res!1006831) (not e!831390))))

(assert (=> b!1482139 (= res!1006831 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126550 res!1006841) b!1482131))

(assert (= (and b!1482131 res!1006833) b!1482133))

(assert (= (and b!1482133 res!1006830) b!1482124))

(assert (= (and b!1482124 res!1006834) b!1482128))

(assert (= (and b!1482128 res!1006836) b!1482126))

(assert (= (and b!1482126 res!1006842) b!1482123))

(assert (= (and b!1482123 res!1006839) b!1482127))

(assert (= (and b!1482127 res!1006837) b!1482132))

(assert (= (and b!1482132 res!1006838) b!1482134))

(assert (= (and b!1482134 res!1006832) b!1482137))

(assert (= (and b!1482137 res!1006835) b!1482138))

(assert (= (and b!1482138 c!137176) b!1482130))

(assert (= (and b!1482138 (not c!137176)) b!1482129))

(assert (= (and b!1482138 res!1006843) b!1482139))

(assert (= (and b!1482139 res!1006831) b!1482125))

(assert (= (and b!1482125 res!1006840) b!1482135))

(assert (= (and b!1482135 res!1006844) b!1482136))

(declare-fun m!1367915 () Bool)

(assert (=> b!1482132 m!1367915))

(assert (=> b!1482132 m!1367915))

(declare-fun m!1367917 () Bool)

(assert (=> b!1482132 m!1367917))

(assert (=> b!1482132 m!1367917))

(assert (=> b!1482132 m!1367915))

(declare-fun m!1367919 () Bool)

(assert (=> b!1482132 m!1367919))

(declare-fun m!1367921 () Bool)

(assert (=> b!1482127 m!1367921))

(declare-fun m!1367923 () Bool)

(assert (=> b!1482127 m!1367923))

(declare-fun m!1367925 () Bool)

(assert (=> b!1482130 m!1367925))

(declare-fun m!1367927 () Bool)

(assert (=> b!1482128 m!1367927))

(declare-fun m!1367929 () Bool)

(assert (=> start!126550 m!1367929))

(declare-fun m!1367931 () Bool)

(assert (=> start!126550 m!1367931))

(declare-fun m!1367933 () Bool)

(assert (=> b!1482136 m!1367933))

(assert (=> b!1482136 m!1367915))

(declare-fun m!1367935 () Bool)

(assert (=> b!1482125 m!1367935))

(assert (=> b!1482125 m!1367921))

(declare-fun m!1367937 () Bool)

(assert (=> b!1482125 m!1367937))

(declare-fun m!1367939 () Bool)

(assert (=> b!1482125 m!1367939))

(declare-fun m!1367941 () Bool)

(assert (=> b!1482125 m!1367941))

(assert (=> b!1482125 m!1367915))

(declare-fun m!1367943 () Bool)

(assert (=> b!1482133 m!1367943))

(assert (=> b!1482133 m!1367943))

(declare-fun m!1367945 () Bool)

(assert (=> b!1482133 m!1367945))

(assert (=> b!1482135 m!1367915))

(assert (=> b!1482135 m!1367915))

(declare-fun m!1367947 () Bool)

(assert (=> b!1482135 m!1367947))

(declare-fun m!1367949 () Bool)

(assert (=> b!1482126 m!1367949))

(declare-fun m!1367951 () Bool)

(assert (=> b!1482129 m!1367951))

(declare-fun m!1367953 () Bool)

(assert (=> b!1482129 m!1367953))

(assert (=> b!1482124 m!1367915))

(assert (=> b!1482124 m!1367915))

(declare-fun m!1367955 () Bool)

(assert (=> b!1482124 m!1367955))

(declare-fun m!1367957 () Bool)

(assert (=> b!1482137 m!1367957))

(assert (=> b!1482137 m!1367957))

(declare-fun m!1367959 () Bool)

(assert (=> b!1482137 m!1367959))

(assert (=> b!1482137 m!1367921))

(declare-fun m!1367961 () Bool)

(assert (=> b!1482137 m!1367961))

(assert (=> b!1482134 m!1367915))

(assert (=> b!1482134 m!1367915))

(declare-fun m!1367963 () Bool)

(assert (=> b!1482134 m!1367963))

(push 1)

(assert (not b!1482135))

(assert (not b!1482137))

(assert (not b!1482124))

(assert (not b!1482132))

(assert (not b!1482128))

(assert (not b!1482130))

(assert (not b!1482125))

(assert (not b!1482129))

(assert (not start!126550))

(assert (not b!1482126))

(assert (not b!1482134))

(assert (not b!1482133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1482263 () Bool)

(declare-fun e!831469 () SeekEntryResult!12158)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482263 (= e!831469 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!647039 lt!647037 mask!2687))))

(declare-fun d!156553 () Bool)

(declare-fun lt!647090 () SeekEntryResult!12158)

(assert (=> d!156553 (and (or (is-Undefined!12158 lt!647090) (not (is-Found!12158 lt!647090)) (and (bvsge (index!51025 lt!647090) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647090) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647090) (is-Found!12158 lt!647090) (not (is-MissingVacant!12158 lt!647090)) (not (= (index!51027 lt!647090) intermediateAfterIndex!19)) (and (bvsge (index!51027 lt!647090) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647090) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647090) (ite (is-Found!12158 lt!647090) (= (select (arr!48021 lt!647037) (index!51025 lt!647090)) lt!647039) (and (is-MissingVacant!12158 lt!647090) (= (index!51027 lt!647090) intermediateAfterIndex!19) (= (select (arr!48021 lt!647037) (index!51027 lt!647090)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!831470 () SeekEntryResult!12158)

(assert (=> d!156553 (= lt!647090 e!831470)))

(declare-fun c!137221 () Bool)

(assert (=> d!156553 (= c!137221 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!647091 () (_ BitVec 64))

(assert (=> d!156553 (= lt!647091 (select (arr!48021 lt!647037) index!646))))

(assert (=> d!156553 (validMask!0 mask!2687)))

(assert (=> d!156553 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647039 lt!647037 mask!2687) lt!647090)))

(declare-fun b!1482264 () Bool)

(declare-fun e!831471 () SeekEntryResult!12158)

(assert (=> b!1482264 (= e!831471 (Found!12158 index!646))))

(declare-fun b!1482265 () Bool)

(assert (=> b!1482265 (= e!831469 (MissingVacant!12158 intermediateAfterIndex!19))))

(declare-fun b!1482266 () Bool)

(assert (=> b!1482266 (= e!831470 e!831471)))

(declare-fun c!137220 () Bool)

(assert (=> b!1482266 (= c!137220 (= lt!647091 lt!647039))))

(declare-fun b!1482267 () Bool)

(assert (=> b!1482267 (= e!831470 Undefined!12158)))

(declare-fun b!1482268 () Bool)

(declare-fun c!137219 () Bool)

(assert (=> b!1482268 (= c!137219 (= lt!647091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482268 (= e!831471 e!831469)))

(assert (= (and d!156553 c!137221) b!1482267))

(assert (= (and d!156553 (not c!137221)) b!1482266))

(assert (= (and b!1482266 c!137220) b!1482264))

(assert (= (and b!1482266 (not c!137220)) b!1482268))

(assert (= (and b!1482268 c!137219) b!1482265))

(assert (= (and b!1482268 (not c!137219)) b!1482263))

(declare-fun m!1368027 () Bool)

(assert (=> b!1482263 m!1368027))

(assert (=> b!1482263 m!1368027))

(declare-fun m!1368029 () Bool)

(assert (=> b!1482263 m!1368029))

(declare-fun m!1368031 () Bool)

(assert (=> d!156553 m!1368031))

(declare-fun m!1368033 () Bool)

(assert (=> d!156553 m!1368033))

(declare-fun m!1368035 () Bool)

(assert (=> d!156553 m!1368035))

(assert (=> d!156553 m!1367929))

(assert (=> b!1482129 d!156553))

(declare-fun b!1482327 () Bool)

(declare-fun e!831502 () SeekEntryResult!12158)

(declare-fun e!831504 () SeekEntryResult!12158)

(assert (=> b!1482327 (= e!831502 e!831504)))

(declare-fun lt!647123 () (_ BitVec 64))

(declare-fun lt!647124 () SeekEntryResult!12158)

(assert (=> b!1482327 (= lt!647123 (select (arr!48021 lt!647037) (index!51026 lt!647124)))))

(declare-fun c!137251 () Bool)

(assert (=> b!1482327 (= c!137251 (= lt!647123 lt!647039))))

(declare-fun b!1482328 () Bool)

(declare-fun e!831503 () SeekEntryResult!12158)

(assert (=> b!1482328 (= e!831503 (MissingZero!12158 (index!51026 lt!647124)))))

(declare-fun b!1482329 () Bool)

(assert (=> b!1482329 (= e!831504 (Found!12158 (index!51026 lt!647124)))))

(declare-fun b!1482330 () Bool)

(assert (=> b!1482330 (= e!831502 Undefined!12158)))

(declare-fun b!1482331 () Bool)

(assert (=> b!1482331 (= e!831503 (seekKeyOrZeroReturnVacant!0 (x!132782 lt!647124) (index!51026 lt!647124) (index!51026 lt!647124) lt!647039 lt!647037 mask!2687))))

(declare-fun d!156561 () Bool)

(declare-fun lt!647122 () SeekEntryResult!12158)

(assert (=> d!156561 (and (or (is-Undefined!12158 lt!647122) (not (is-Found!12158 lt!647122)) (and (bvsge (index!51025 lt!647122) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647122) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647122) (is-Found!12158 lt!647122) (not (is-MissingZero!12158 lt!647122)) (and (bvsge (index!51024 lt!647122) #b00000000000000000000000000000000) (bvslt (index!51024 lt!647122) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647122) (is-Found!12158 lt!647122) (is-MissingZero!12158 lt!647122) (not (is-MissingVacant!12158 lt!647122)) (and (bvsge (index!51027 lt!647122) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647122) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647122) (ite (is-Found!12158 lt!647122) (= (select (arr!48021 lt!647037) (index!51025 lt!647122)) lt!647039) (ite (is-MissingZero!12158 lt!647122) (= (select (arr!48021 lt!647037) (index!51024 lt!647122)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12158 lt!647122) (= (select (arr!48021 lt!647037) (index!51027 lt!647122)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156561 (= lt!647122 e!831502)))

(declare-fun c!137250 () Bool)

(assert (=> d!156561 (= c!137250 (and (is-Intermediate!12158 lt!647124) (undefined!12970 lt!647124)))))

(assert (=> d!156561 (= lt!647124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647039 mask!2687) lt!647039 lt!647037 mask!2687))))

(assert (=> d!156561 (validMask!0 mask!2687)))

(assert (=> d!156561 (= (seekEntryOrOpen!0 lt!647039 lt!647037 mask!2687) lt!647122)))

(declare-fun b!1482332 () Bool)

(declare-fun c!137252 () Bool)

(assert (=> b!1482332 (= c!137252 (= lt!647123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482332 (= e!831504 e!831503)))

(assert (= (and d!156561 c!137250) b!1482330))

(assert (= (and d!156561 (not c!137250)) b!1482327))

(assert (= (and b!1482327 c!137251) b!1482329))

(assert (= (and b!1482327 (not c!137251)) b!1482332))

(assert (= (and b!1482332 c!137252) b!1482328))

(assert (= (and b!1482332 (not c!137252)) b!1482331))

(declare-fun m!1368073 () Bool)

(assert (=> b!1482327 m!1368073))

(declare-fun m!1368075 () Bool)

(assert (=> b!1482331 m!1368075))

(assert (=> d!156561 m!1367957))

(assert (=> d!156561 m!1367959))

(assert (=> d!156561 m!1367957))

(declare-fun m!1368077 () Bool)

(assert (=> d!156561 m!1368077))

(declare-fun m!1368079 () Bool)

(assert (=> d!156561 m!1368079))

(declare-fun m!1368081 () Bool)

(assert (=> d!156561 m!1368081))

(assert (=> d!156561 m!1367929))

(assert (=> b!1482129 d!156561))

(declare-fun b!1482359 () Bool)

(declare-fun e!831522 () Bool)

(declare-fun call!67927 () Bool)

(assert (=> b!1482359 (= e!831522 call!67927)))

(declare-fun d!156571 () Bool)

(declare-fun res!1006897 () Bool)

(declare-fun e!831523 () Bool)

(assert (=> d!156571 (=> res!1006897 e!831523)))

(assert (=> d!156571 (= res!1006897 (bvsge #b00000000000000000000000000000000 (size!48572 a!2862)))))

(assert (=> d!156571 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!831523)))

(declare-fun b!1482360 () Bool)

(assert (=> b!1482360 (= e!831523 e!831522)))

(declare-fun c!137261 () Bool)

(assert (=> b!1482360 (= c!137261 (validKeyInArray!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482361 () Bool)

(declare-fun e!831521 () Bool)

(assert (=> b!1482361 (= e!831521 call!67927)))

(declare-fun bm!67924 () Bool)

(assert (=> bm!67924 (= call!67927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482362 () Bool)

(assert (=> b!1482362 (= e!831522 e!831521)))

(declare-fun lt!647138 () (_ BitVec 64))

(assert (=> b!1482362 (= lt!647138 (select (arr!48021 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!647140 () Unit!49689)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99494 (_ BitVec 64) (_ BitVec 32)) Unit!49689)

(assert (=> b!1482362 (= lt!647140 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647138 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1482362 (arrayContainsKey!0 a!2862 lt!647138 #b00000000000000000000000000000000)))

(declare-fun lt!647139 () Unit!49689)

(assert (=> b!1482362 (= lt!647139 lt!647140)))

(declare-fun res!1006898 () Bool)

(assert (=> b!1482362 (= res!1006898 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12158 #b00000000000000000000000000000000)))))

(assert (=> b!1482362 (=> (not res!1006898) (not e!831521))))

(assert (= (and d!156571 (not res!1006897)) b!1482360))

(assert (= (and b!1482360 c!137261) b!1482362))

(assert (= (and b!1482360 (not c!137261)) b!1482359))

(assert (= (and b!1482362 res!1006898) b!1482361))

(assert (= (or b!1482361 b!1482359) bm!67924))

(declare-fun m!1368085 () Bool)

(assert (=> b!1482360 m!1368085))

(assert (=> b!1482360 m!1368085))

(declare-fun m!1368087 () Bool)

(assert (=> b!1482360 m!1368087))

(declare-fun m!1368089 () Bool)

(assert (=> bm!67924 m!1368089))

(assert (=> b!1482362 m!1368085))

(declare-fun m!1368091 () Bool)

(assert (=> b!1482362 m!1368091))

(declare-fun m!1368093 () Bool)

(assert (=> b!1482362 m!1368093))

(assert (=> b!1482362 m!1368085))

(declare-fun m!1368095 () Bool)

(assert (=> b!1482362 m!1368095))

(assert (=> b!1482128 d!156571))

(declare-fun e!831547 () SeekEntryResult!12158)

(declare-fun b!1482399 () Bool)

(assert (=> b!1482399 (= e!831547 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!647039 lt!647037 mask!2687))))

(declare-fun b!1482400 () Bool)

(declare-fun lt!647155 () SeekEntryResult!12158)

(assert (=> b!1482400 (and (bvsge (index!51026 lt!647155) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647155) (size!48572 lt!647037)))))

(declare-fun e!831548 () Bool)

(assert (=> b!1482400 (= e!831548 (= (select (arr!48021 lt!647037) (index!51026 lt!647155)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482401 () Bool)

(declare-fun e!831545 () SeekEntryResult!12158)

(assert (=> b!1482401 (= e!831545 (Intermediate!12158 true (toIndex!0 lt!647039 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482402 () Bool)

(assert (=> b!1482402 (and (bvsge (index!51026 lt!647155) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647155) (size!48572 lt!647037)))))

(declare-fun res!1006913 () Bool)

(assert (=> b!1482402 (= res!1006913 (= (select (arr!48021 lt!647037) (index!51026 lt!647155)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482402 (=> res!1006913 e!831548)))

(declare-fun b!1482404 () Bool)

(assert (=> b!1482404 (and (bvsge (index!51026 lt!647155) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647155) (size!48572 lt!647037)))))

(declare-fun res!1006912 () Bool)

(assert (=> b!1482404 (= res!1006912 (= (select (arr!48021 lt!647037) (index!51026 lt!647155)) lt!647039))))

(assert (=> b!1482404 (=> res!1006912 e!831548)))

(declare-fun e!831544 () Bool)

(assert (=> b!1482404 (= e!831544 e!831548)))

(declare-fun b!1482405 () Bool)

(declare-fun e!831546 () Bool)

(assert (=> b!1482405 (= e!831546 e!831544)))

(declare-fun res!1006914 () Bool)

(assert (=> b!1482405 (= res!1006914 (and (is-Intermediate!12158 lt!647155) (not (undefined!12970 lt!647155)) (bvslt (x!132782 lt!647155) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647155) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647155) #b00000000000000000000000000000000)))))

(assert (=> b!1482405 (=> (not res!1006914) (not e!831544))))

(declare-fun b!1482406 () Bool)

(assert (=> b!1482406 (= e!831545 e!831547)))

(declare-fun c!137274 () Bool)

(declare-fun lt!647156 () (_ BitVec 64))

(assert (=> b!1482406 (= c!137274 (or (= lt!647156 lt!647039) (= (bvadd lt!647156 lt!647156) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482407 () Bool)

(assert (=> b!1482407 (= e!831547 (Intermediate!12158 false (toIndex!0 lt!647039 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482403 () Bool)

(assert (=> b!1482403 (= e!831546 (bvsge (x!132782 lt!647155) #b01111111111111111111111111111110))))

(declare-fun d!156573 () Bool)

(assert (=> d!156573 e!831546))

(declare-fun c!137276 () Bool)

(assert (=> d!156573 (= c!137276 (and (is-Intermediate!12158 lt!647155) (undefined!12970 lt!647155)))))

(assert (=> d!156573 (= lt!647155 e!831545)))

(declare-fun c!137275 () Bool)

(assert (=> d!156573 (= c!137275 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156573 (= lt!647156 (select (arr!48021 lt!647037) (toIndex!0 lt!647039 mask!2687)))))

(assert (=> d!156573 (validMask!0 mask!2687)))

(assert (=> d!156573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647039 mask!2687) lt!647039 lt!647037 mask!2687) lt!647155)))

(assert (= (and d!156573 c!137275) b!1482401))

(assert (= (and d!156573 (not c!137275)) b!1482406))

(assert (= (and b!1482406 c!137274) b!1482407))

(assert (= (and b!1482406 (not c!137274)) b!1482399))

(assert (= (and d!156573 c!137276) b!1482403))

(assert (= (and d!156573 (not c!137276)) b!1482405))

(assert (= (and b!1482405 res!1006914) b!1482404))

(assert (= (and b!1482404 (not res!1006912)) b!1482402))

(assert (= (and b!1482402 (not res!1006913)) b!1482400))

(declare-fun m!1368111 () Bool)

(assert (=> b!1482402 m!1368111))

(assert (=> b!1482404 m!1368111))

(assert (=> b!1482399 m!1367957))

(declare-fun m!1368113 () Bool)

(assert (=> b!1482399 m!1368113))

(assert (=> b!1482399 m!1368113))

(declare-fun m!1368115 () Bool)

(assert (=> b!1482399 m!1368115))

(assert (=> b!1482400 m!1368111))

(assert (=> d!156573 m!1367957))

(declare-fun m!1368117 () Bool)

(assert (=> d!156573 m!1368117))

(assert (=> d!156573 m!1367929))

(assert (=> b!1482137 d!156573))

(declare-fun d!156581 () Bool)

(declare-fun lt!647162 () (_ BitVec 32))

(declare-fun lt!647161 () (_ BitVec 32))

(assert (=> d!156581 (= lt!647162 (bvmul (bvxor lt!647161 (bvlshr lt!647161 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156581 (= lt!647161 ((_ extract 31 0) (bvand (bvxor lt!647039 (bvlshr lt!647039 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156581 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006915 (let ((h!35890 ((_ extract 31 0) (bvand (bvxor lt!647039 (bvlshr lt!647039 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132790 (bvmul (bvxor h!35890 (bvlshr h!35890 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132790 (bvlshr x!132790 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006915 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006915 #b00000000000000000000000000000000))))))

(assert (=> d!156581 (= (toIndex!0 lt!647039 mask!2687) (bvand (bvxor lt!647162 (bvlshr lt!647162 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482137 d!156581))

(declare-fun bm!67927 () Bool)

(declare-fun call!67930 () Bool)

(declare-fun c!137279 () Bool)

(assert (=> bm!67927 (= call!67930 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137279 (Cons!34505 (select (arr!48021 a!2862) #b00000000000000000000000000000000) Nil!34506) Nil!34506)))))

(declare-fun b!1482418 () Bool)

(declare-fun e!831557 () Bool)

(assert (=> b!1482418 (= e!831557 call!67930)))

(declare-fun b!1482419 () Bool)

(assert (=> b!1482419 (= e!831557 call!67930)))

(declare-fun b!1482420 () Bool)

(declare-fun e!831558 () Bool)

(declare-fun contains!9959 (List!34509 (_ BitVec 64)) Bool)

(assert (=> b!1482420 (= e!831558 (contains!9959 Nil!34506 (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482421 () Bool)

(declare-fun e!831560 () Bool)

(declare-fun e!831559 () Bool)

(assert (=> b!1482421 (= e!831560 e!831559)))

(declare-fun res!1006923 () Bool)

(assert (=> b!1482421 (=> (not res!1006923) (not e!831559))))

(assert (=> b!1482421 (= res!1006923 (not e!831558))))

(declare-fun res!1006924 () Bool)

(assert (=> b!1482421 (=> (not res!1006924) (not e!831558))))

(assert (=> b!1482421 (= res!1006924 (validKeyInArray!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156583 () Bool)

(declare-fun res!1006922 () Bool)

(assert (=> d!156583 (=> res!1006922 e!831560)))

(assert (=> d!156583 (= res!1006922 (bvsge #b00000000000000000000000000000000 (size!48572 a!2862)))))

(assert (=> d!156583 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34506) e!831560)))

(declare-fun b!1482422 () Bool)

(assert (=> b!1482422 (= e!831559 e!831557)))

(assert (=> b!1482422 (= c!137279 (validKeyInArray!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156583 (not res!1006922)) b!1482421))

(assert (= (and b!1482421 res!1006924) b!1482420))

(assert (= (and b!1482421 res!1006923) b!1482422))

(assert (= (and b!1482422 c!137279) b!1482418))

(assert (= (and b!1482422 (not c!137279)) b!1482419))

(assert (= (or b!1482418 b!1482419) bm!67927))

(assert (=> bm!67927 m!1368085))

(declare-fun m!1368119 () Bool)

(assert (=> bm!67927 m!1368119))

(assert (=> b!1482420 m!1368085))

(assert (=> b!1482420 m!1368085))

(declare-fun m!1368121 () Bool)

(assert (=> b!1482420 m!1368121))

(assert (=> b!1482421 m!1368085))

(assert (=> b!1482421 m!1368085))

(assert (=> b!1482421 m!1368087))

(assert (=> b!1482422 m!1368085))

(assert (=> b!1482422 m!1368085))

(assert (=> b!1482422 m!1368087))

(assert (=> b!1482126 d!156583))

(declare-fun b!1482423 () Bool)

(declare-fun e!831562 () Bool)

(declare-fun call!67931 () Bool)

(assert (=> b!1482423 (= e!831562 call!67931)))

(declare-fun d!156585 () Bool)

(declare-fun res!1006925 () Bool)

(declare-fun e!831563 () Bool)

(assert (=> d!156585 (=> res!1006925 e!831563)))

(assert (=> d!156585 (= res!1006925 (bvsge j!93 (size!48572 a!2862)))))

(assert (=> d!156585 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!831563)))

(declare-fun b!1482424 () Bool)

(assert (=> b!1482424 (= e!831563 e!831562)))

(declare-fun c!137280 () Bool)

(assert (=> b!1482424 (= c!137280 (validKeyInArray!0 (select (arr!48021 a!2862) j!93)))))

(declare-fun b!1482425 () Bool)

(declare-fun e!831561 () Bool)

(assert (=> b!1482425 (= e!831561 call!67931)))

(declare-fun bm!67928 () Bool)

(assert (=> bm!67928 (= call!67931 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482426 () Bool)

(assert (=> b!1482426 (= e!831562 e!831561)))

(declare-fun lt!647167 () (_ BitVec 64))

(assert (=> b!1482426 (= lt!647167 (select (arr!48021 a!2862) j!93))))

(declare-fun lt!647169 () Unit!49689)

(assert (=> b!1482426 (= lt!647169 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647167 j!93))))

(assert (=> b!1482426 (arrayContainsKey!0 a!2862 lt!647167 #b00000000000000000000000000000000)))

(declare-fun lt!647168 () Unit!49689)

(assert (=> b!1482426 (= lt!647168 lt!647169)))

(declare-fun res!1006926 () Bool)

(assert (=> b!1482426 (= res!1006926 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) (Found!12158 j!93)))))

(assert (=> b!1482426 (=> (not res!1006926) (not e!831561))))

(assert (= (and d!156585 (not res!1006925)) b!1482424))

(assert (= (and b!1482424 c!137280) b!1482426))

(assert (= (and b!1482424 (not c!137280)) b!1482423))

(assert (= (and b!1482426 res!1006926) b!1482425))

(assert (= (or b!1482425 b!1482423) bm!67928))

(assert (=> b!1482424 m!1367915))

(assert (=> b!1482424 m!1367915))

(assert (=> b!1482424 m!1367955))

(declare-fun m!1368123 () Bool)

(assert (=> bm!67928 m!1368123))

(assert (=> b!1482426 m!1367915))

(declare-fun m!1368125 () Bool)

(assert (=> b!1482426 m!1368125))

(declare-fun m!1368127 () Bool)

(assert (=> b!1482426 m!1368127))

(assert (=> b!1482426 m!1367915))

(assert (=> b!1482426 m!1367947))

(assert (=> b!1482125 d!156585))

(declare-fun d!156587 () Bool)

(assert (=> d!156587 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!647172 () Unit!49689)

(declare-fun choose!38 (array!99494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49689)

(assert (=> d!156587 (= lt!647172 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156587 (validMask!0 mask!2687)))

(assert (=> d!156587 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!647172)))

(declare-fun bs!42665 () Bool)

(assert (= bs!42665 d!156587))

(assert (=> bs!42665 m!1367941))

(declare-fun m!1368129 () Bool)

(assert (=> bs!42665 m!1368129))

(assert (=> bs!42665 m!1367929))

(assert (=> b!1482125 d!156587))

(declare-fun b!1482445 () Bool)

(declare-fun e!831573 () SeekEntryResult!12158)

(declare-fun e!831575 () SeekEntryResult!12158)

(assert (=> b!1482445 (= e!831573 e!831575)))

(declare-fun lt!647176 () (_ BitVec 64))

(declare-fun lt!647177 () SeekEntryResult!12158)

(assert (=> b!1482445 (= lt!647176 (select (arr!48021 a!2862) (index!51026 lt!647177)))))

(declare-fun c!137291 () Bool)

(assert (=> b!1482445 (= c!137291 (= lt!647176 (select (arr!48021 a!2862) j!93)))))

(declare-fun b!1482446 () Bool)

(declare-fun e!831574 () SeekEntryResult!12158)

(assert (=> b!1482446 (= e!831574 (MissingZero!12158 (index!51026 lt!647177)))))

(declare-fun b!1482447 () Bool)

(assert (=> b!1482447 (= e!831575 (Found!12158 (index!51026 lt!647177)))))

(declare-fun b!1482448 () Bool)

(assert (=> b!1482448 (= e!831573 Undefined!12158)))

(declare-fun b!1482449 () Bool)

(assert (=> b!1482449 (= e!831574 (seekKeyOrZeroReturnVacant!0 (x!132782 lt!647177) (index!51026 lt!647177) (index!51026 lt!647177) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156589 () Bool)

(declare-fun lt!647175 () SeekEntryResult!12158)

(assert (=> d!156589 (and (or (is-Undefined!12158 lt!647175) (not (is-Found!12158 lt!647175)) (and (bvsge (index!51025 lt!647175) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647175) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647175) (is-Found!12158 lt!647175) (not (is-MissingZero!12158 lt!647175)) (and (bvsge (index!51024 lt!647175) #b00000000000000000000000000000000) (bvslt (index!51024 lt!647175) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647175) (is-Found!12158 lt!647175) (is-MissingZero!12158 lt!647175) (not (is-MissingVacant!12158 lt!647175)) (and (bvsge (index!51027 lt!647175) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647175) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647175) (ite (is-Found!12158 lt!647175) (= (select (arr!48021 a!2862) (index!51025 lt!647175)) (select (arr!48021 a!2862) j!93)) (ite (is-MissingZero!12158 lt!647175) (= (select (arr!48021 a!2862) (index!51024 lt!647175)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12158 lt!647175) (= (select (arr!48021 a!2862) (index!51027 lt!647175)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156589 (= lt!647175 e!831573)))

(declare-fun c!137290 () Bool)

(assert (=> d!156589 (= c!137290 (and (is-Intermediate!12158 lt!647177) (undefined!12970 lt!647177)))))

(assert (=> d!156589 (= lt!647177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156589 (validMask!0 mask!2687)))

(assert (=> d!156589 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647175)))

(declare-fun b!1482450 () Bool)

(declare-fun c!137292 () Bool)

(assert (=> b!1482450 (= c!137292 (= lt!647176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482450 (= e!831575 e!831574)))

(assert (= (and d!156589 c!137290) b!1482448))

(assert (= (and d!156589 (not c!137290)) b!1482445))

(assert (= (and b!1482445 c!137291) b!1482447))

(assert (= (and b!1482445 (not c!137291)) b!1482450))

(assert (= (and b!1482450 c!137292) b!1482446))

(assert (= (and b!1482450 (not c!137292)) b!1482449))

(declare-fun m!1368135 () Bool)

(assert (=> b!1482445 m!1368135))

(assert (=> b!1482449 m!1367915))

(declare-fun m!1368141 () Bool)

(assert (=> b!1482449 m!1368141))

(assert (=> d!156589 m!1367917))

(assert (=> d!156589 m!1367915))

(assert (=> d!156589 m!1367919))

(assert (=> d!156589 m!1367915))

(assert (=> d!156589 m!1367917))

(declare-fun m!1368143 () Bool)

(assert (=> d!156589 m!1368143))

(declare-fun m!1368145 () Bool)

(assert (=> d!156589 m!1368145))

(declare-fun m!1368147 () Bool)

(assert (=> d!156589 m!1368147))

(assert (=> d!156589 m!1367929))

(assert (=> b!1482135 d!156589))

(declare-fun d!156593 () Bool)

(assert (=> d!156593 (= (validKeyInArray!0 (select (arr!48021 a!2862) j!93)) (and (not (= (select (arr!48021 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48021 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482124 d!156593))

(declare-fun b!1482457 () Bool)

(declare-fun e!831582 () SeekEntryResult!12158)

(assert (=> b!1482457 (= e!831582 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482458 () Bool)

(declare-fun lt!647181 () SeekEntryResult!12158)

(assert (=> b!1482458 (and (bvsge (index!51026 lt!647181) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647181) (size!48572 a!2862)))))

(declare-fun e!831583 () Bool)

(assert (=> b!1482458 (= e!831583 (= (select (arr!48021 a!2862) (index!51026 lt!647181)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482459 () Bool)

(declare-fun e!831580 () SeekEntryResult!12158)

(assert (=> b!1482459 (= e!831580 (Intermediate!12158 true index!646 x!665))))

(declare-fun b!1482460 () Bool)

(assert (=> b!1482460 (and (bvsge (index!51026 lt!647181) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647181) (size!48572 a!2862)))))

(declare-fun res!1006928 () Bool)

(assert (=> b!1482460 (= res!1006928 (= (select (arr!48021 a!2862) (index!51026 lt!647181)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482460 (=> res!1006928 e!831583)))

(declare-fun b!1482462 () Bool)

(assert (=> b!1482462 (and (bvsge (index!51026 lt!647181) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647181) (size!48572 a!2862)))))

(declare-fun res!1006927 () Bool)

(assert (=> b!1482462 (= res!1006927 (= (select (arr!48021 a!2862) (index!51026 lt!647181)) (select (arr!48021 a!2862) j!93)))))

(assert (=> b!1482462 (=> res!1006927 e!831583)))

(declare-fun e!831579 () Bool)

(assert (=> b!1482462 (= e!831579 e!831583)))

(declare-fun b!1482463 () Bool)

(declare-fun e!831581 () Bool)

(assert (=> b!1482463 (= e!831581 e!831579)))

(declare-fun res!1006929 () Bool)

(assert (=> b!1482463 (= res!1006929 (and (is-Intermediate!12158 lt!647181) (not (undefined!12970 lt!647181)) (bvslt (x!132782 lt!647181) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647181) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647181) x!665)))))

(assert (=> b!1482463 (=> (not res!1006929) (not e!831579))))

(declare-fun b!1482464 () Bool)

(assert (=> b!1482464 (= e!831580 e!831582)))

(declare-fun c!137296 () Bool)

(declare-fun lt!647182 () (_ BitVec 64))

(assert (=> b!1482464 (= c!137296 (or (= lt!647182 (select (arr!48021 a!2862) j!93)) (= (bvadd lt!647182 lt!647182) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482465 () Bool)

(assert (=> b!1482465 (= e!831582 (Intermediate!12158 false index!646 x!665))))

(declare-fun b!1482461 () Bool)

(assert (=> b!1482461 (= e!831581 (bvsge (x!132782 lt!647181) #b01111111111111111111111111111110))))

(declare-fun d!156599 () Bool)

(assert (=> d!156599 e!831581))

(declare-fun c!137298 () Bool)

(assert (=> d!156599 (= c!137298 (and (is-Intermediate!12158 lt!647181) (undefined!12970 lt!647181)))))

(assert (=> d!156599 (= lt!647181 e!831580)))

(declare-fun c!137297 () Bool)

(assert (=> d!156599 (= c!137297 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156599 (= lt!647182 (select (arr!48021 a!2862) index!646))))

(assert (=> d!156599 (validMask!0 mask!2687)))

(assert (=> d!156599 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647181)))

(assert (= (and d!156599 c!137297) b!1482459))

(assert (= (and d!156599 (not c!137297)) b!1482464))

(assert (= (and b!1482464 c!137296) b!1482465))

(assert (= (and b!1482464 (not c!137296)) b!1482457))

(assert (= (and d!156599 c!137298) b!1482461))

(assert (= (and d!156599 (not c!137298)) b!1482463))

(assert (= (and b!1482463 res!1006929) b!1482462))

(assert (= (and b!1482462 (not res!1006927)) b!1482460))

(assert (= (and b!1482460 (not res!1006928)) b!1482458))

(declare-fun m!1368159 () Bool)

(assert (=> b!1482460 m!1368159))

(assert (=> b!1482462 m!1368159))

(assert (=> b!1482457 m!1368027))

(assert (=> b!1482457 m!1368027))

(assert (=> b!1482457 m!1367915))

(declare-fun m!1368161 () Bool)

(assert (=> b!1482457 m!1368161))

(assert (=> b!1482458 m!1368159))

(assert (=> d!156599 m!1367939))

(assert (=> d!156599 m!1367929))

(assert (=> b!1482134 d!156599))

(declare-fun d!156601 () Bool)

(assert (=> d!156601 (= (validKeyInArray!0 (select (arr!48021 a!2862) i!1006)) (and (not (= (select (arr!48021 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48021 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482133 d!156601))

(declare-fun d!156603 () Bool)

(assert (=> d!156603 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126550 d!156603))

(declare-fun d!156609 () Bool)

(assert (=> d!156609 (= (array_inv!37302 a!2862) (bvsge (size!48572 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126550 d!156609))

(declare-fun b!1482479 () Bool)

(declare-fun e!831595 () SeekEntryResult!12158)

(assert (=> b!1482479 (= e!831595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482480 () Bool)

(declare-fun lt!647188 () SeekEntryResult!12158)

(assert (=> b!1482480 (and (bvsge (index!51026 lt!647188) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647188) (size!48572 a!2862)))))

(declare-fun e!831596 () Bool)

(assert (=> b!1482480 (= e!831596 (= (select (arr!48021 a!2862) (index!51026 lt!647188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482481 () Bool)

(declare-fun e!831593 () SeekEntryResult!12158)

(assert (=> b!1482481 (= e!831593 (Intermediate!12158 true (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482482 () Bool)

(assert (=> b!1482482 (and (bvsge (index!51026 lt!647188) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647188) (size!48572 a!2862)))))

(declare-fun res!1006936 () Bool)

(assert (=> b!1482482 (= res!1006936 (= (select (arr!48021 a!2862) (index!51026 lt!647188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482482 (=> res!1006936 e!831596)))

(declare-fun b!1482484 () Bool)

(assert (=> b!1482484 (and (bvsge (index!51026 lt!647188) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647188) (size!48572 a!2862)))))

(declare-fun res!1006935 () Bool)

(assert (=> b!1482484 (= res!1006935 (= (select (arr!48021 a!2862) (index!51026 lt!647188)) (select (arr!48021 a!2862) j!93)))))

(assert (=> b!1482484 (=> res!1006935 e!831596)))

(declare-fun e!831592 () Bool)

(assert (=> b!1482484 (= e!831592 e!831596)))

(declare-fun b!1482485 () Bool)

(declare-fun e!831594 () Bool)

(assert (=> b!1482485 (= e!831594 e!831592)))

(declare-fun res!1006937 () Bool)

(assert (=> b!1482485 (= res!1006937 (and (is-Intermediate!12158 lt!647188) (not (undefined!12970 lt!647188)) (bvslt (x!132782 lt!647188) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647188) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647188) #b00000000000000000000000000000000)))))

(assert (=> b!1482485 (=> (not res!1006937) (not e!831592))))

(declare-fun b!1482486 () Bool)

(assert (=> b!1482486 (= e!831593 e!831595)))

(declare-fun lt!647189 () (_ BitVec 64))

(declare-fun c!137303 () Bool)

(assert (=> b!1482486 (= c!137303 (or (= lt!647189 (select (arr!48021 a!2862) j!93)) (= (bvadd lt!647189 lt!647189) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482487 () Bool)

(assert (=> b!1482487 (= e!831595 (Intermediate!12158 false (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482483 () Bool)

(assert (=> b!1482483 (= e!831594 (bvsge (x!132782 lt!647188) #b01111111111111111111111111111110))))

(declare-fun d!156613 () Bool)

(assert (=> d!156613 e!831594))

(declare-fun c!137305 () Bool)

(assert (=> d!156613 (= c!137305 (and (is-Intermediate!12158 lt!647188) (undefined!12970 lt!647188)))))

(assert (=> d!156613 (= lt!647188 e!831593)))

(declare-fun c!137304 () Bool)

(assert (=> d!156613 (= c!137304 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156613 (= lt!647189 (select (arr!48021 a!2862) (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687)))))

(assert (=> d!156613 (validMask!0 mask!2687)))

(assert (=> d!156613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647188)))

(assert (= (and d!156613 c!137304) b!1482481))

(assert (= (and d!156613 (not c!137304)) b!1482486))

(assert (= (and b!1482486 c!137303) b!1482487))

(assert (= (and b!1482486 (not c!137303)) b!1482479))

(assert (= (and d!156613 c!137305) b!1482483))

(assert (= (and d!156613 (not c!137305)) b!1482485))

(assert (= (and b!1482485 res!1006937) b!1482484))

(assert (= (and b!1482484 (not res!1006935)) b!1482482))

(assert (= (and b!1482482 (not res!1006936)) b!1482480))

(declare-fun m!1368173 () Bool)

(assert (=> b!1482482 m!1368173))

(assert (=> b!1482484 m!1368173))

(assert (=> b!1482479 m!1367917))

(declare-fun m!1368175 () Bool)

(assert (=> b!1482479 m!1368175))

(assert (=> b!1482479 m!1368175))

(assert (=> b!1482479 m!1367915))

(declare-fun m!1368177 () Bool)

(assert (=> b!1482479 m!1368177))

(assert (=> b!1482480 m!1368173))

(assert (=> d!156613 m!1367917))

(declare-fun m!1368179 () Bool)

(assert (=> d!156613 m!1368179))

(assert (=> d!156613 m!1367929))

(assert (=> b!1482132 d!156613))

(declare-fun d!156617 () Bool)

(declare-fun lt!647191 () (_ BitVec 32))

(declare-fun lt!647190 () (_ BitVec 32))

(assert (=> d!156617 (= lt!647191 (bvmul (bvxor lt!647190 (bvlshr lt!647190 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156617 (= lt!647190 ((_ extract 31 0) (bvand (bvxor (select (arr!48021 a!2862) j!93) (bvlshr (select (arr!48021 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156617 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1006915 (let ((h!35890 ((_ extract 31 0) (bvand (bvxor (select (arr!48021 a!2862) j!93) (bvlshr (select (arr!48021 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132790 (bvmul (bvxor h!35890 (bvlshr h!35890 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132790 (bvlshr x!132790 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1006915 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1006915 #b00000000000000000000000000000000))))))

(assert (=> d!156617 (= (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvand (bvxor lt!647191 (bvlshr lt!647191 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482132 d!156617))

(declare-fun b!1482488 () Bool)

(declare-fun e!831600 () SeekEntryResult!12158)

(assert (=> b!1482488 (= e!831600 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!647039 lt!647037 mask!2687))))

(declare-fun b!1482489 () Bool)

(declare-fun lt!647192 () SeekEntryResult!12158)

(assert (=> b!1482489 (and (bvsge (index!51026 lt!647192) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647192) (size!48572 lt!647037)))))

(declare-fun e!831601 () Bool)

(assert (=> b!1482489 (= e!831601 (= (select (arr!48021 lt!647037) (index!51026 lt!647192)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482490 () Bool)

(declare-fun e!831598 () SeekEntryResult!12158)

(assert (=> b!1482490 (= e!831598 (Intermediate!12158 true index!646 x!665))))

(declare-fun b!1482491 () Bool)

(assert (=> b!1482491 (and (bvsge (index!51026 lt!647192) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647192) (size!48572 lt!647037)))))

(declare-fun res!1006939 () Bool)

(assert (=> b!1482491 (= res!1006939 (= (select (arr!48021 lt!647037) (index!51026 lt!647192)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482491 (=> res!1006939 e!831601)))

(declare-fun b!1482493 () Bool)

(assert (=> b!1482493 (and (bvsge (index!51026 lt!647192) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647192) (size!48572 lt!647037)))))

(declare-fun res!1006938 () Bool)

(assert (=> b!1482493 (= res!1006938 (= (select (arr!48021 lt!647037) (index!51026 lt!647192)) lt!647039))))

(assert (=> b!1482493 (=> res!1006938 e!831601)))

(declare-fun e!831597 () Bool)

(assert (=> b!1482493 (= e!831597 e!831601)))

(declare-fun b!1482494 () Bool)

(declare-fun e!831599 () Bool)

(assert (=> b!1482494 (= e!831599 e!831597)))

(declare-fun res!1006940 () Bool)

(assert (=> b!1482494 (= res!1006940 (and (is-Intermediate!12158 lt!647192) (not (undefined!12970 lt!647192)) (bvslt (x!132782 lt!647192) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647192) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647192) x!665)))))

(assert (=> b!1482494 (=> (not res!1006940) (not e!831597))))

(declare-fun b!1482495 () Bool)

(assert (=> b!1482495 (= e!831598 e!831600)))

(declare-fun c!137306 () Bool)

(declare-fun lt!647193 () (_ BitVec 64))

(assert (=> b!1482495 (= c!137306 (or (= lt!647193 lt!647039) (= (bvadd lt!647193 lt!647193) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482496 () Bool)

(assert (=> b!1482496 (= e!831600 (Intermediate!12158 false index!646 x!665))))

(declare-fun b!1482492 () Bool)

(assert (=> b!1482492 (= e!831599 (bvsge (x!132782 lt!647192) #b01111111111111111111111111111110))))

(declare-fun d!156619 () Bool)

(assert (=> d!156619 e!831599))

(declare-fun c!137308 () Bool)

(assert (=> d!156619 (= c!137308 (and (is-Intermediate!12158 lt!647192) (undefined!12970 lt!647192)))))

(assert (=> d!156619 (= lt!647192 e!831598)))

(declare-fun c!137307 () Bool)

(assert (=> d!156619 (= c!137307 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156619 (= lt!647193 (select (arr!48021 lt!647037) index!646))))

(assert (=> d!156619 (validMask!0 mask!2687)))

(assert (=> d!156619 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647039 lt!647037 mask!2687) lt!647192)))

(assert (= (and d!156619 c!137307) b!1482490))

(assert (= (and d!156619 (not c!137307)) b!1482495))

(assert (= (and b!1482495 c!137306) b!1482496))

(assert (= (and b!1482495 (not c!137306)) b!1482488))

(assert (= (and d!156619 c!137308) b!1482492))

(assert (= (and d!156619 (not c!137308)) b!1482494))

(assert (= (and b!1482494 res!1006940) b!1482493))

(assert (= (and b!1482493 (not res!1006938)) b!1482491))

(assert (= (and b!1482491 (not res!1006939)) b!1482489))

(declare-fun m!1368181 () Bool)

(assert (=> b!1482491 m!1368181))

(assert (=> b!1482493 m!1368181))

(assert (=> b!1482488 m!1368027))

(assert (=> b!1482488 m!1368027))

(declare-fun m!1368183 () Bool)

(assert (=> b!1482488 m!1368183))

(assert (=> b!1482489 m!1368181))

(assert (=> d!156619 m!1368035))

(assert (=> d!156619 m!1367929))

(assert (=> b!1482130 d!156619))

(push 1)

(assert (not b!1482331))

(assert (not b!1482263))

(assert (not bm!67924))

(assert (not d!156613))

(assert (not d!156561))

(assert (not b!1482449))

(assert (not b!1482362))

(assert (not bm!67928))

(assert (not b!1482479))

(assert (not d!156553))

(assert (not d!156599))

(assert (not bm!67927))

(assert (not b!1482488))

(assert (not b!1482421))

(assert (not b!1482360))

(assert (not b!1482422))

(assert (not b!1482420))

(assert (not b!1482457))

(assert (not d!156619))

(assert (not d!156587))

(assert (not b!1482426))

(assert (not b!1482399))

(assert (not d!156573))

(assert (not d!156589))

(assert (not b!1482424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!831622 () SeekEntryResult!12158)

(declare-fun b!1482521 () Bool)

(assert (=> b!1482521 (= e!831622 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2687) lt!647039 lt!647037 mask!2687))))

(declare-fun b!1482522 () Bool)

(declare-fun lt!647201 () SeekEntryResult!12158)

(assert (=> b!1482522 (and (bvsge (index!51026 lt!647201) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647201) (size!48572 lt!647037)))))

(declare-fun e!831623 () Bool)

(assert (=> b!1482522 (= e!831623 (= (select (arr!48021 lt!647037) (index!51026 lt!647201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482523 () Bool)

(declare-fun e!831620 () SeekEntryResult!12158)

(assert (=> b!1482523 (= e!831620 (Intermediate!12158 true (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1482524 () Bool)

(assert (=> b!1482524 (and (bvsge (index!51026 lt!647201) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647201) (size!48572 lt!647037)))))

(declare-fun res!1006954 () Bool)

(assert (=> b!1482524 (= res!1006954 (= (select (arr!48021 lt!647037) (index!51026 lt!647201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482524 (=> res!1006954 e!831623)))

(declare-fun b!1482526 () Bool)

(assert (=> b!1482526 (and (bvsge (index!51026 lt!647201) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647201) (size!48572 lt!647037)))))

(declare-fun res!1006953 () Bool)

(assert (=> b!1482526 (= res!1006953 (= (select (arr!48021 lt!647037) (index!51026 lt!647201)) lt!647039))))

(assert (=> b!1482526 (=> res!1006953 e!831623)))

(declare-fun e!831619 () Bool)

(assert (=> b!1482526 (= e!831619 e!831623)))

(declare-fun b!1482527 () Bool)

(declare-fun e!831621 () Bool)

(assert (=> b!1482527 (= e!831621 e!831619)))

(declare-fun res!1006955 () Bool)

(assert (=> b!1482527 (= res!1006955 (and (is-Intermediate!12158 lt!647201) (not (undefined!12970 lt!647201)) (bvslt (x!132782 lt!647201) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647201) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647201) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1482527 (=> (not res!1006955) (not e!831619))))

(declare-fun b!1482528 () Bool)

(assert (=> b!1482528 (= e!831620 e!831622)))

(declare-fun c!137315 () Bool)

(declare-fun lt!647202 () (_ BitVec 64))

(assert (=> b!1482528 (= c!137315 (or (= lt!647202 lt!647039) (= (bvadd lt!647202 lt!647202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482529 () Bool)

(assert (=> b!1482529 (= e!831622 (Intermediate!12158 false (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1482525 () Bool)

(assert (=> b!1482525 (= e!831621 (bvsge (x!132782 lt!647201) #b01111111111111111111111111111110))))

(declare-fun d!156627 () Bool)

(assert (=> d!156627 e!831621))

(declare-fun c!137317 () Bool)

(assert (=> d!156627 (= c!137317 (and (is-Intermediate!12158 lt!647201) (undefined!12970 lt!647201)))))

(assert (=> d!156627 (= lt!647201 e!831620)))

(declare-fun c!137316 () Bool)

(assert (=> d!156627 (= c!137316 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!156627 (= lt!647202 (select (arr!48021 lt!647037) (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687)))))

(assert (=> d!156627 (validMask!0 mask!2687)))

(assert (=> d!156627 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!647039 lt!647037 mask!2687) lt!647201)))

(assert (= (and d!156627 c!137316) b!1482523))

(assert (= (and d!156627 (not c!137316)) b!1482528))

(assert (= (and b!1482528 c!137315) b!1482529))

(assert (= (and b!1482528 (not c!137315)) b!1482521))

(assert (= (and d!156627 c!137317) b!1482525))

(assert (= (and d!156627 (not c!137317)) b!1482527))

(assert (= (and b!1482527 res!1006955) b!1482526))

(assert (= (and b!1482526 (not res!1006953)) b!1482524))

(assert (= (and b!1482524 (not res!1006954)) b!1482522))

(declare-fun m!1368199 () Bool)

(assert (=> b!1482524 m!1368199))

(assert (=> b!1482526 m!1368199))

(assert (=> b!1482521 m!1368113))

(declare-fun m!1368201 () Bool)

(assert (=> b!1482521 m!1368201))

(assert (=> b!1482521 m!1368201))

(declare-fun m!1368203 () Bool)

(assert (=> b!1482521 m!1368203))

(assert (=> b!1482522 m!1368199))

(assert (=> d!156627 m!1368113))

(declare-fun m!1368205 () Bool)

(assert (=> d!156627 m!1368205))

(assert (=> d!156627 m!1367929))

(assert (=> b!1482399 d!156627))

(declare-fun d!156629 () Bool)

(declare-fun lt!647205 () (_ BitVec 32))

(assert (=> d!156629 (and (bvsge lt!647205 #b00000000000000000000000000000000) (bvslt lt!647205 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156629 (= lt!647205 (choose!52 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687))))

(assert (=> d!156629 (validMask!0 mask!2687)))

(assert (=> d!156629 (= (nextIndex!0 (toIndex!0 lt!647039 mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!647205)))

(declare-fun bs!42667 () Bool)

(assert (= bs!42667 d!156629))

(assert (=> bs!42667 m!1367957))

(declare-fun m!1368207 () Bool)

(assert (=> bs!42667 m!1368207))

(assert (=> bs!42667 m!1367929))

(assert (=> b!1482399 d!156629))

(assert (=> d!156619 d!156603))

(declare-fun e!831624 () SeekEntryResult!12158)

(declare-fun b!1482530 () Bool)

(assert (=> b!1482530 (= e!831624 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132782 lt!647177) #b00000000000000000000000000000001) (nextIndex!0 (index!51026 lt!647177) (bvadd (x!132782 lt!647177) #b00000000000000000000000000000001) mask!2687) (index!51026 lt!647177) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(declare-fun d!156631 () Bool)

(declare-fun lt!647206 () SeekEntryResult!12158)

(assert (=> d!156631 (and (or (is-Undefined!12158 lt!647206) (not (is-Found!12158 lt!647206)) (and (bvsge (index!51025 lt!647206) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647206) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647206) (is-Found!12158 lt!647206) (not (is-MissingVacant!12158 lt!647206)) (not (= (index!51027 lt!647206) (index!51026 lt!647177))) (and (bvsge (index!51027 lt!647206) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647206) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647206) (ite (is-Found!12158 lt!647206) (= (select (arr!48021 a!2862) (index!51025 lt!647206)) (select (arr!48021 a!2862) j!93)) (and (is-MissingVacant!12158 lt!647206) (= (index!51027 lt!647206) (index!51026 lt!647177)) (= (select (arr!48021 a!2862) (index!51027 lt!647206)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!831625 () SeekEntryResult!12158)

(assert (=> d!156631 (= lt!647206 e!831625)))

(declare-fun c!137320 () Bool)

(assert (=> d!156631 (= c!137320 (bvsge (x!132782 lt!647177) #b01111111111111111111111111111110))))

(declare-fun lt!647207 () (_ BitVec 64))

(assert (=> d!156631 (= lt!647207 (select (arr!48021 a!2862) (index!51026 lt!647177)))))

(assert (=> d!156631 (validMask!0 mask!2687)))

(assert (=> d!156631 (= (seekKeyOrZeroReturnVacant!0 (x!132782 lt!647177) (index!51026 lt!647177) (index!51026 lt!647177) (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647206)))

(declare-fun b!1482531 () Bool)

(declare-fun e!831626 () SeekEntryResult!12158)

(assert (=> b!1482531 (= e!831626 (Found!12158 (index!51026 lt!647177)))))

(declare-fun b!1482532 () Bool)

(assert (=> b!1482532 (= e!831624 (MissingVacant!12158 (index!51026 lt!647177)))))

(declare-fun b!1482533 () Bool)

(assert (=> b!1482533 (= e!831625 e!831626)))

(declare-fun c!137319 () Bool)

(assert (=> b!1482533 (= c!137319 (= lt!647207 (select (arr!48021 a!2862) j!93)))))

(declare-fun b!1482534 () Bool)

(assert (=> b!1482534 (= e!831625 Undefined!12158)))

(declare-fun b!1482535 () Bool)

(declare-fun c!137318 () Bool)

(assert (=> b!1482535 (= c!137318 (= lt!647207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482535 (= e!831626 e!831624)))

(assert (= (and d!156631 c!137320) b!1482534))

(assert (= (and d!156631 (not c!137320)) b!1482533))

(assert (= (and b!1482533 c!137319) b!1482531))

(assert (= (and b!1482533 (not c!137319)) b!1482535))

(assert (= (and b!1482535 c!137318) b!1482532))

(assert (= (and b!1482535 (not c!137318)) b!1482530))

(declare-fun m!1368209 () Bool)

(assert (=> b!1482530 m!1368209))

(assert (=> b!1482530 m!1368209))

(assert (=> b!1482530 m!1367915))

(declare-fun m!1368211 () Bool)

(assert (=> b!1482530 m!1368211))

(declare-fun m!1368213 () Bool)

(assert (=> d!156631 m!1368213))

(declare-fun m!1368215 () Bool)

(assert (=> d!156631 m!1368215))

(assert (=> d!156631 m!1368135))

(assert (=> d!156631 m!1367929))

(assert (=> b!1482449 d!156631))

(declare-fun d!156633 () Bool)

(assert (=> d!156633 (= (validKeyInArray!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000)) (and (not (= (select (arr!48021 a!2862) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48021 a!2862) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482422 d!156633))

(assert (=> d!156587 d!156585))

(declare-fun d!156635 () Bool)

(assert (=> d!156635 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(assert (=> d!156635 true))

(declare-fun _$72!140 () Unit!49689)

(assert (=> d!156635 (= (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) _$72!140)))

(declare-fun bs!42668 () Bool)

(assert (= bs!42668 d!156635))

(assert (=> bs!42668 m!1367941))

(assert (=> d!156587 d!156635))

(assert (=> d!156587 d!156603))

(assert (=> d!156613 d!156603))

(assert (=> b!1482421 d!156633))

(declare-fun d!156637 () Bool)

(declare-fun lt!647210 () Bool)

(declare-fun content!768 (List!34509) (Set (_ BitVec 64)))

(assert (=> d!156637 (= lt!647210 (set.member (select (arr!48021 a!2862) #b00000000000000000000000000000000) (content!768 Nil!34506)))))

(declare-fun e!831631 () Bool)

(assert (=> d!156637 (= lt!647210 e!831631)))

(declare-fun res!1006960 () Bool)

(assert (=> d!156637 (=> (not res!1006960) (not e!831631))))

(assert (=> d!156637 (= res!1006960 (is-Cons!34505 Nil!34506))))

(assert (=> d!156637 (= (contains!9959 Nil!34506 (select (arr!48021 a!2862) #b00000000000000000000000000000000)) lt!647210)))

(declare-fun b!1482540 () Bool)

(declare-fun e!831632 () Bool)

(assert (=> b!1482540 (= e!831631 e!831632)))

(declare-fun res!1006961 () Bool)

(assert (=> b!1482540 (=> res!1006961 e!831632)))

(assert (=> b!1482540 (= res!1006961 (= (h!35887 Nil!34506) (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482541 () Bool)

(assert (=> b!1482541 (= e!831632 (contains!9959 (t!49195 Nil!34506) (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156637 res!1006960) b!1482540))

(assert (= (and b!1482540 (not res!1006961)) b!1482541))

(declare-fun m!1368217 () Bool)

(assert (=> d!156637 m!1368217))

(assert (=> d!156637 m!1368085))

(declare-fun m!1368219 () Bool)

(assert (=> d!156637 m!1368219))

(assert (=> b!1482541 m!1368085))

(declare-fun m!1368221 () Bool)

(assert (=> b!1482541 m!1368221))

(assert (=> b!1482420 d!156637))

(declare-fun call!67936 () Bool)

(declare-fun c!137321 () Bool)

(declare-fun bm!67933 () Bool)

(assert (=> bm!67933 (= call!67936 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!137321 (Cons!34505 (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!137279 (Cons!34505 (select (arr!48021 a!2862) #b00000000000000000000000000000000) Nil!34506) Nil!34506)) (ite c!137279 (Cons!34505 (select (arr!48021 a!2862) #b00000000000000000000000000000000) Nil!34506) Nil!34506))))))

(declare-fun b!1482542 () Bool)

(declare-fun e!831633 () Bool)

(assert (=> b!1482542 (= e!831633 call!67936)))

(declare-fun b!1482543 () Bool)

(assert (=> b!1482543 (= e!831633 call!67936)))

(declare-fun b!1482544 () Bool)

(declare-fun e!831634 () Bool)

(assert (=> b!1482544 (= e!831634 (contains!9959 (ite c!137279 (Cons!34505 (select (arr!48021 a!2862) #b00000000000000000000000000000000) Nil!34506) Nil!34506) (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1482545 () Bool)

(declare-fun e!831636 () Bool)

(declare-fun e!831635 () Bool)

(assert (=> b!1482545 (= e!831636 e!831635)))

(declare-fun res!1006963 () Bool)

(assert (=> b!1482545 (=> (not res!1006963) (not e!831635))))

(assert (=> b!1482545 (= res!1006963 (not e!831634))))

(declare-fun res!1006964 () Bool)

(assert (=> b!1482545 (=> (not res!1006964) (not e!831634))))

(assert (=> b!1482545 (= res!1006964 (validKeyInArray!0 (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!156639 () Bool)

(declare-fun res!1006962 () Bool)

(assert (=> d!156639 (=> res!1006962 e!831636)))

(assert (=> d!156639 (= res!1006962 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48572 a!2862)))))

(assert (=> d!156639 (= (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137279 (Cons!34505 (select (arr!48021 a!2862) #b00000000000000000000000000000000) Nil!34506) Nil!34506)) e!831636)))

(declare-fun b!1482546 () Bool)

(assert (=> b!1482546 (= e!831635 e!831633)))

(assert (=> b!1482546 (= c!137321 (validKeyInArray!0 (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!156639 (not res!1006962)) b!1482545))

(assert (= (and b!1482545 res!1006964) b!1482544))

(assert (= (and b!1482545 res!1006963) b!1482546))

(assert (= (and b!1482546 c!137321) b!1482542))

(assert (= (and b!1482546 (not c!137321)) b!1482543))

(assert (= (or b!1482542 b!1482543) bm!67933))

(declare-fun m!1368223 () Bool)

(assert (=> bm!67933 m!1368223))

(declare-fun m!1368225 () Bool)

(assert (=> bm!67933 m!1368225))

(assert (=> b!1482544 m!1368223))

(assert (=> b!1482544 m!1368223))

(declare-fun m!1368227 () Bool)

(assert (=> b!1482544 m!1368227))

(assert (=> b!1482545 m!1368223))

(assert (=> b!1482545 m!1368223))

(declare-fun m!1368229 () Bool)

(assert (=> b!1482545 m!1368229))

(assert (=> b!1482546 m!1368223))

(assert (=> b!1482546 m!1368223))

(assert (=> b!1482546 m!1368229))

(assert (=> bm!67927 d!156639))

(declare-fun e!831640 () SeekEntryResult!12158)

(declare-fun b!1482547 () Bool)

(assert (=> b!1482547 (= e!831640 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2687) lt!647039 lt!647037 mask!2687))))

(declare-fun b!1482548 () Bool)

(declare-fun lt!647211 () SeekEntryResult!12158)

(assert (=> b!1482548 (and (bvsge (index!51026 lt!647211) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647211) (size!48572 lt!647037)))))

(declare-fun e!831641 () Bool)

(assert (=> b!1482548 (= e!831641 (= (select (arr!48021 lt!647037) (index!51026 lt!647211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831638 () SeekEntryResult!12158)

(declare-fun b!1482549 () Bool)

(assert (=> b!1482549 (= e!831638 (Intermediate!12158 true (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1482550 () Bool)

(assert (=> b!1482550 (and (bvsge (index!51026 lt!647211) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647211) (size!48572 lt!647037)))))

(declare-fun res!1006966 () Bool)

(assert (=> b!1482550 (= res!1006966 (= (select (arr!48021 lt!647037) (index!51026 lt!647211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482550 (=> res!1006966 e!831641)))

(declare-fun b!1482552 () Bool)

(assert (=> b!1482552 (and (bvsge (index!51026 lt!647211) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647211) (size!48572 lt!647037)))))

(declare-fun res!1006965 () Bool)

(assert (=> b!1482552 (= res!1006965 (= (select (arr!48021 lt!647037) (index!51026 lt!647211)) lt!647039))))

(assert (=> b!1482552 (=> res!1006965 e!831641)))

(declare-fun e!831637 () Bool)

(assert (=> b!1482552 (= e!831637 e!831641)))

(declare-fun b!1482553 () Bool)

(declare-fun e!831639 () Bool)

(assert (=> b!1482553 (= e!831639 e!831637)))

(declare-fun res!1006967 () Bool)

(assert (=> b!1482553 (= res!1006967 (and (is-Intermediate!12158 lt!647211) (not (undefined!12970 lt!647211)) (bvslt (x!132782 lt!647211) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647211) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647211) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1482553 (=> (not res!1006967) (not e!831637))))

(declare-fun b!1482554 () Bool)

(assert (=> b!1482554 (= e!831638 e!831640)))

(declare-fun c!137322 () Bool)

(declare-fun lt!647212 () (_ BitVec 64))

(assert (=> b!1482554 (= c!137322 (or (= lt!647212 lt!647039) (= (bvadd lt!647212 lt!647212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482555 () Bool)

(assert (=> b!1482555 (= e!831640 (Intermediate!12158 false (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1482551 () Bool)

(assert (=> b!1482551 (= e!831639 (bvsge (x!132782 lt!647211) #b01111111111111111111111111111110))))

(declare-fun d!156641 () Bool)

(assert (=> d!156641 e!831639))

(declare-fun c!137324 () Bool)

(assert (=> d!156641 (= c!137324 (and (is-Intermediate!12158 lt!647211) (undefined!12970 lt!647211)))))

(assert (=> d!156641 (= lt!647211 e!831638)))

(declare-fun c!137323 () Bool)

(assert (=> d!156641 (= c!137323 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!156641 (= lt!647212 (select (arr!48021 lt!647037) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687)))))

(assert (=> d!156641 (validMask!0 mask!2687)))

(assert (=> d!156641 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!647039 lt!647037 mask!2687) lt!647211)))

(assert (= (and d!156641 c!137323) b!1482549))

(assert (= (and d!156641 (not c!137323)) b!1482554))

(assert (= (and b!1482554 c!137322) b!1482555))

(assert (= (and b!1482554 (not c!137322)) b!1482547))

(assert (= (and d!156641 c!137324) b!1482551))

(assert (= (and d!156641 (not c!137324)) b!1482553))

(assert (= (and b!1482553 res!1006967) b!1482552))

(assert (= (and b!1482552 (not res!1006965)) b!1482550))

(assert (= (and b!1482550 (not res!1006966)) b!1482548))

(declare-fun m!1368231 () Bool)

(assert (=> b!1482550 m!1368231))

(assert (=> b!1482552 m!1368231))

(assert (=> b!1482547 m!1368027))

(declare-fun m!1368233 () Bool)

(assert (=> b!1482547 m!1368233))

(assert (=> b!1482547 m!1368233))

(declare-fun m!1368235 () Bool)

(assert (=> b!1482547 m!1368235))

(assert (=> b!1482548 m!1368231))

(assert (=> d!156641 m!1368027))

(declare-fun m!1368237 () Bool)

(assert (=> d!156641 m!1368237))

(assert (=> d!156641 m!1367929))

(assert (=> b!1482488 d!156641))

(declare-fun d!156643 () Bool)

(declare-fun lt!647213 () (_ BitVec 32))

(assert (=> d!156643 (and (bvsge lt!647213 #b00000000000000000000000000000000) (bvslt lt!647213 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156643 (= lt!647213 (choose!52 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687))))

(assert (=> d!156643 (validMask!0 mask!2687)))

(assert (=> d!156643 (= (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) lt!647213)))

(declare-fun bs!42669 () Bool)

(assert (= bs!42669 d!156643))

(declare-fun m!1368239 () Bool)

(assert (=> bs!42669 m!1368239))

(assert (=> bs!42669 m!1367929))

(assert (=> b!1482488 d!156643))

(declare-fun e!831642 () SeekEntryResult!12158)

(declare-fun b!1482556 () Bool)

(assert (=> b!1482556 (= e!831642 (seekKeyOrZeroReturnVacant!0 (bvadd (x!132782 lt!647124) #b00000000000000000000000000000001) (nextIndex!0 (index!51026 lt!647124) (bvadd (x!132782 lt!647124) #b00000000000000000000000000000001) mask!2687) (index!51026 lt!647124) lt!647039 lt!647037 mask!2687))))

(declare-fun lt!647214 () SeekEntryResult!12158)

(declare-fun d!156645 () Bool)

(assert (=> d!156645 (and (or (is-Undefined!12158 lt!647214) (not (is-Found!12158 lt!647214)) (and (bvsge (index!51025 lt!647214) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647214) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647214) (is-Found!12158 lt!647214) (not (is-MissingVacant!12158 lt!647214)) (not (= (index!51027 lt!647214) (index!51026 lt!647124))) (and (bvsge (index!51027 lt!647214) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647214) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647214) (ite (is-Found!12158 lt!647214) (= (select (arr!48021 lt!647037) (index!51025 lt!647214)) lt!647039) (and (is-MissingVacant!12158 lt!647214) (= (index!51027 lt!647214) (index!51026 lt!647124)) (= (select (arr!48021 lt!647037) (index!51027 lt!647214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!831643 () SeekEntryResult!12158)

(assert (=> d!156645 (= lt!647214 e!831643)))

(declare-fun c!137327 () Bool)

(assert (=> d!156645 (= c!137327 (bvsge (x!132782 lt!647124) #b01111111111111111111111111111110))))

(declare-fun lt!647215 () (_ BitVec 64))

(assert (=> d!156645 (= lt!647215 (select (arr!48021 lt!647037) (index!51026 lt!647124)))))

(assert (=> d!156645 (validMask!0 mask!2687)))

(assert (=> d!156645 (= (seekKeyOrZeroReturnVacant!0 (x!132782 lt!647124) (index!51026 lt!647124) (index!51026 lt!647124) lt!647039 lt!647037 mask!2687) lt!647214)))

(declare-fun b!1482557 () Bool)

(declare-fun e!831644 () SeekEntryResult!12158)

(assert (=> b!1482557 (= e!831644 (Found!12158 (index!51026 lt!647124)))))

(declare-fun b!1482558 () Bool)

(assert (=> b!1482558 (= e!831642 (MissingVacant!12158 (index!51026 lt!647124)))))

(declare-fun b!1482559 () Bool)

(assert (=> b!1482559 (= e!831643 e!831644)))

(declare-fun c!137326 () Bool)

(assert (=> b!1482559 (= c!137326 (= lt!647215 lt!647039))))

(declare-fun b!1482560 () Bool)

(assert (=> b!1482560 (= e!831643 Undefined!12158)))

(declare-fun b!1482561 () Bool)

(declare-fun c!137325 () Bool)

(assert (=> b!1482561 (= c!137325 (= lt!647215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482561 (= e!831644 e!831642)))

(assert (= (and d!156645 c!137327) b!1482560))

(assert (= (and d!156645 (not c!137327)) b!1482559))

(assert (= (and b!1482559 c!137326) b!1482557))

(assert (= (and b!1482559 (not c!137326)) b!1482561))

(assert (= (and b!1482561 c!137325) b!1482558))

(assert (= (and b!1482561 (not c!137325)) b!1482556))

(declare-fun m!1368241 () Bool)

(assert (=> b!1482556 m!1368241))

(assert (=> b!1482556 m!1368241))

(declare-fun m!1368243 () Bool)

(assert (=> b!1482556 m!1368243))

(declare-fun m!1368245 () Bool)

(assert (=> d!156645 m!1368245))

(declare-fun m!1368247 () Bool)

(assert (=> d!156645 m!1368247))

(assert (=> d!156645 m!1368073))

(assert (=> d!156645 m!1367929))

(assert (=> b!1482331 d!156645))

(declare-fun b!1482562 () Bool)

(declare-fun e!831648 () SeekEntryResult!12158)

(assert (=> b!1482562 (= e!831648 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482563 () Bool)

(declare-fun lt!647216 () SeekEntryResult!12158)

(assert (=> b!1482563 (and (bvsge (index!51026 lt!647216) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647216) (size!48572 a!2862)))))

(declare-fun e!831649 () Bool)

(assert (=> b!1482563 (= e!831649 (= (select (arr!48021 a!2862) (index!51026 lt!647216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482564 () Bool)

(declare-fun e!831646 () SeekEntryResult!12158)

(assert (=> b!1482564 (= e!831646 (Intermediate!12158 true (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1482565 () Bool)

(assert (=> b!1482565 (and (bvsge (index!51026 lt!647216) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647216) (size!48572 a!2862)))))

(declare-fun res!1006969 () Bool)

(assert (=> b!1482565 (= res!1006969 (= (select (arr!48021 a!2862) (index!51026 lt!647216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482565 (=> res!1006969 e!831649)))

(declare-fun b!1482567 () Bool)

(assert (=> b!1482567 (and (bvsge (index!51026 lt!647216) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647216) (size!48572 a!2862)))))

(declare-fun res!1006968 () Bool)

(assert (=> b!1482567 (= res!1006968 (= (select (arr!48021 a!2862) (index!51026 lt!647216)) (select (arr!48021 a!2862) j!93)))))

(assert (=> b!1482567 (=> res!1006968 e!831649)))

(declare-fun e!831645 () Bool)

(assert (=> b!1482567 (= e!831645 e!831649)))

(declare-fun b!1482568 () Bool)

(declare-fun e!831647 () Bool)

(assert (=> b!1482568 (= e!831647 e!831645)))

(declare-fun res!1006970 () Bool)

(assert (=> b!1482568 (= res!1006970 (and (is-Intermediate!12158 lt!647216) (not (undefined!12970 lt!647216)) (bvslt (x!132782 lt!647216) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647216) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1482568 (=> (not res!1006970) (not e!831645))))

(declare-fun b!1482569 () Bool)

(assert (=> b!1482569 (= e!831646 e!831648)))

(declare-fun lt!647217 () (_ BitVec 64))

(declare-fun c!137328 () Bool)

(assert (=> b!1482569 (= c!137328 (or (= lt!647217 (select (arr!48021 a!2862) j!93)) (= (bvadd lt!647217 lt!647217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482570 () Bool)

(assert (=> b!1482570 (= e!831648 (Intermediate!12158 false (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1482566 () Bool)

(assert (=> b!1482566 (= e!831647 (bvsge (x!132782 lt!647216) #b01111111111111111111111111111110))))

(declare-fun d!156647 () Bool)

(assert (=> d!156647 e!831647))

(declare-fun c!137330 () Bool)

(assert (=> d!156647 (= c!137330 (and (is-Intermediate!12158 lt!647216) (undefined!12970 lt!647216)))))

(assert (=> d!156647 (= lt!647216 e!831646)))

(declare-fun c!137329 () Bool)

(assert (=> d!156647 (= c!137329 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!156647 (= lt!647217 (select (arr!48021 a!2862) (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687)))))

(assert (=> d!156647 (validMask!0 mask!2687)))

(assert (=> d!156647 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647216)))

(assert (= (and d!156647 c!137329) b!1482564))

(assert (= (and d!156647 (not c!137329)) b!1482569))

(assert (= (and b!1482569 c!137328) b!1482570))

(assert (= (and b!1482569 (not c!137328)) b!1482562))

(assert (= (and d!156647 c!137330) b!1482566))

(assert (= (and d!156647 (not c!137330)) b!1482568))

(assert (= (and b!1482568 res!1006970) b!1482567))

(assert (= (and b!1482567 (not res!1006968)) b!1482565))

(assert (= (and b!1482565 (not res!1006969)) b!1482563))

(declare-fun m!1368249 () Bool)

(assert (=> b!1482565 m!1368249))

(assert (=> b!1482567 m!1368249))

(assert (=> b!1482562 m!1368175))

(declare-fun m!1368251 () Bool)

(assert (=> b!1482562 m!1368251))

(assert (=> b!1482562 m!1368251))

(assert (=> b!1482562 m!1367915))

(declare-fun m!1368253 () Bool)

(assert (=> b!1482562 m!1368253))

(assert (=> b!1482563 m!1368249))

(assert (=> d!156647 m!1368175))

(declare-fun m!1368255 () Bool)

(assert (=> d!156647 m!1368255))

(assert (=> d!156647 m!1367929))

(assert (=> b!1482479 d!156647))

(declare-fun d!156649 () Bool)

(declare-fun lt!647218 () (_ BitVec 32))

(assert (=> d!156649 (and (bvsge lt!647218 #b00000000000000000000000000000000) (bvslt lt!647218 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(assert (=> d!156649 (= lt!647218 (choose!52 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687))))

(assert (=> d!156649 (validMask!0 mask!2687)))

(assert (=> d!156649 (= (nextIndex!0 (toIndex!0 (select (arr!48021 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) lt!647218)))

(declare-fun bs!42670 () Bool)

(assert (= bs!42670 d!156649))

(assert (=> bs!42670 m!1367917))

(declare-fun m!1368257 () Bool)

(assert (=> bs!42670 m!1368257))

(assert (=> bs!42670 m!1367929))

(assert (=> b!1482479 d!156649))

(assert (=> d!156599 d!156603))

(declare-fun d!156651 () Bool)

(assert (=> d!156651 (arrayContainsKey!0 a!2862 lt!647138 #b00000000000000000000000000000000)))

(declare-fun lt!647221 () Unit!49689)

(declare-fun choose!13 (array!99494 (_ BitVec 64) (_ BitVec 32)) Unit!49689)

(assert (=> d!156651 (= lt!647221 (choose!13 a!2862 lt!647138 #b00000000000000000000000000000000))))

(assert (=> d!156651 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!156651 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647138 #b00000000000000000000000000000000) lt!647221)))

(declare-fun bs!42671 () Bool)

(assert (= bs!42671 d!156651))

(assert (=> bs!42671 m!1368093))

(declare-fun m!1368259 () Bool)

(assert (=> bs!42671 m!1368259))

(assert (=> b!1482362 d!156651))

(declare-fun d!156653 () Bool)

(declare-fun res!1006975 () Bool)

(declare-fun e!831654 () Bool)

(assert (=> d!156653 (=> res!1006975 e!831654)))

(assert (=> d!156653 (= res!1006975 (= (select (arr!48021 a!2862) #b00000000000000000000000000000000) lt!647138))))

(assert (=> d!156653 (= (arrayContainsKey!0 a!2862 lt!647138 #b00000000000000000000000000000000) e!831654)))

(declare-fun b!1482575 () Bool)

(declare-fun e!831655 () Bool)

(assert (=> b!1482575 (= e!831654 e!831655)))

(declare-fun res!1006976 () Bool)

(assert (=> b!1482575 (=> (not res!1006976) (not e!831655))))

(assert (=> b!1482575 (= res!1006976 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48572 a!2862)))))

(declare-fun b!1482576 () Bool)

(assert (=> b!1482576 (= e!831655 (arrayContainsKey!0 a!2862 lt!647138 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156653 (not res!1006975)) b!1482575))

(assert (= (and b!1482575 res!1006976) b!1482576))

(assert (=> d!156653 m!1368085))

(declare-fun m!1368261 () Bool)

(assert (=> b!1482576 m!1368261))

(assert (=> b!1482362 d!156653))

(declare-fun b!1482577 () Bool)

(declare-fun e!831656 () SeekEntryResult!12158)

(declare-fun e!831658 () SeekEntryResult!12158)

(assert (=> b!1482577 (= e!831656 e!831658)))

(declare-fun lt!647223 () (_ BitVec 64))

(declare-fun lt!647224 () SeekEntryResult!12158)

(assert (=> b!1482577 (= lt!647223 (select (arr!48021 a!2862) (index!51026 lt!647224)))))

(declare-fun c!137332 () Bool)

(assert (=> b!1482577 (= c!137332 (= lt!647223 (select (arr!48021 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482578 () Bool)

(declare-fun e!831657 () SeekEntryResult!12158)

(assert (=> b!1482578 (= e!831657 (MissingZero!12158 (index!51026 lt!647224)))))

(declare-fun b!1482579 () Bool)

(assert (=> b!1482579 (= e!831658 (Found!12158 (index!51026 lt!647224)))))

(declare-fun b!1482580 () Bool)

(assert (=> b!1482580 (= e!831656 Undefined!12158)))

(declare-fun b!1482581 () Bool)

(assert (=> b!1482581 (= e!831657 (seekKeyOrZeroReturnVacant!0 (x!132782 lt!647224) (index!51026 lt!647224) (index!51026 lt!647224) (select (arr!48021 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(declare-fun d!156655 () Bool)

(declare-fun lt!647222 () SeekEntryResult!12158)

(assert (=> d!156655 (and (or (is-Undefined!12158 lt!647222) (not (is-Found!12158 lt!647222)) (and (bvsge (index!51025 lt!647222) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647222) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647222) (is-Found!12158 lt!647222) (not (is-MissingZero!12158 lt!647222)) (and (bvsge (index!51024 lt!647222) #b00000000000000000000000000000000) (bvslt (index!51024 lt!647222) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647222) (is-Found!12158 lt!647222) (is-MissingZero!12158 lt!647222) (not (is-MissingVacant!12158 lt!647222)) (and (bvsge (index!51027 lt!647222) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647222) (size!48572 a!2862)))) (or (is-Undefined!12158 lt!647222) (ite (is-Found!12158 lt!647222) (= (select (arr!48021 a!2862) (index!51025 lt!647222)) (select (arr!48021 a!2862) #b00000000000000000000000000000000)) (ite (is-MissingZero!12158 lt!647222) (= (select (arr!48021 a!2862) (index!51024 lt!647222)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12158 lt!647222) (= (select (arr!48021 a!2862) (index!51027 lt!647222)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156655 (= lt!647222 e!831656)))

(declare-fun c!137331 () Bool)

(assert (=> d!156655 (= c!137331 (and (is-Intermediate!12158 lt!647224) (undefined!12970 lt!647224)))))

(assert (=> d!156655 (= lt!647224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000) mask!2687) (select (arr!48021 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687))))

(assert (=> d!156655 (validMask!0 mask!2687)))

(assert (=> d!156655 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) lt!647222)))

(declare-fun b!1482582 () Bool)

(declare-fun c!137333 () Bool)

(assert (=> b!1482582 (= c!137333 (= lt!647223 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482582 (= e!831658 e!831657)))

(assert (= (and d!156655 c!137331) b!1482580))

(assert (= (and d!156655 (not c!137331)) b!1482577))

(assert (= (and b!1482577 c!137332) b!1482579))

(assert (= (and b!1482577 (not c!137332)) b!1482582))

(assert (= (and b!1482582 c!137333) b!1482578))

(assert (= (and b!1482582 (not c!137333)) b!1482581))

(declare-fun m!1368263 () Bool)

(assert (=> b!1482577 m!1368263))

(assert (=> b!1482581 m!1368085))

(declare-fun m!1368265 () Bool)

(assert (=> b!1482581 m!1368265))

(declare-fun m!1368267 () Bool)

(assert (=> d!156655 m!1368267))

(assert (=> d!156655 m!1368085))

(declare-fun m!1368269 () Bool)

(assert (=> d!156655 m!1368269))

(assert (=> d!156655 m!1368085))

(assert (=> d!156655 m!1368267))

(declare-fun m!1368271 () Bool)

(assert (=> d!156655 m!1368271))

(declare-fun m!1368273 () Bool)

(assert (=> d!156655 m!1368273))

(declare-fun m!1368275 () Bool)

(assert (=> d!156655 m!1368275))

(assert (=> d!156655 m!1367929))

(assert (=> b!1482362 d!156655))

(declare-fun b!1482583 () Bool)

(declare-fun e!831660 () Bool)

(declare-fun call!67937 () Bool)

(assert (=> b!1482583 (= e!831660 call!67937)))

(declare-fun d!156657 () Bool)

(declare-fun res!1006977 () Bool)

(declare-fun e!831661 () Bool)

(assert (=> d!156657 (=> res!1006977 e!831661)))

(assert (=> d!156657 (= res!1006977 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48572 a!2862)))))

(assert (=> d!156657 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687) e!831661)))

(declare-fun b!1482584 () Bool)

(assert (=> b!1482584 (= e!831661 e!831660)))

(declare-fun c!137334 () Bool)

(assert (=> b!1482584 (= c!137334 (validKeyInArray!0 (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1482585 () Bool)

(declare-fun e!831659 () Bool)

(assert (=> b!1482585 (= e!831659 call!67937)))

(declare-fun bm!67934 () Bool)

(assert (=> bm!67934 (= call!67937 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482586 () Bool)

(assert (=> b!1482586 (= e!831660 e!831659)))

(declare-fun lt!647225 () (_ BitVec 64))

(assert (=> b!1482586 (= lt!647225 (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!647227 () Unit!49689)

(assert (=> b!1482586 (= lt!647227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647225 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1482586 (arrayContainsKey!0 a!2862 lt!647225 #b00000000000000000000000000000000)))

(declare-fun lt!647226 () Unit!49689)

(assert (=> b!1482586 (= lt!647226 lt!647227)))

(declare-fun res!1006978 () Bool)

(assert (=> b!1482586 (= res!1006978 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12158 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1482586 (=> (not res!1006978) (not e!831659))))

(assert (= (and d!156657 (not res!1006977)) b!1482584))

(assert (= (and b!1482584 c!137334) b!1482586))

(assert (= (and b!1482584 (not c!137334)) b!1482583))

(assert (= (and b!1482586 res!1006978) b!1482585))

(assert (= (or b!1482585 b!1482583) bm!67934))

(assert (=> b!1482584 m!1368223))

(assert (=> b!1482584 m!1368223))

(assert (=> b!1482584 m!1368229))

(declare-fun m!1368277 () Bool)

(assert (=> bm!67934 m!1368277))

(assert (=> b!1482586 m!1368223))

(declare-fun m!1368279 () Bool)

(assert (=> b!1482586 m!1368279))

(declare-fun m!1368281 () Bool)

(assert (=> b!1482586 m!1368281))

(assert (=> b!1482586 m!1368223))

(declare-fun m!1368283 () Bool)

(assert (=> b!1482586 m!1368283))

(assert (=> bm!67924 d!156657))

(assert (=> d!156553 d!156603))

(declare-fun b!1482587 () Bool)

(declare-fun e!831663 () Bool)

(declare-fun call!67938 () Bool)

(assert (=> b!1482587 (= e!831663 call!67938)))

(declare-fun d!156659 () Bool)

(declare-fun res!1006979 () Bool)

(declare-fun e!831664 () Bool)

(assert (=> d!156659 (=> res!1006979 e!831664)))

(assert (=> d!156659 (= res!1006979 (bvsge (bvadd j!93 #b00000000000000000000000000000001) (size!48572 a!2862)))))

(assert (=> d!156659 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687) e!831664)))

(declare-fun b!1482588 () Bool)

(assert (=> b!1482588 (= e!831664 e!831663)))

(declare-fun c!137335 () Bool)

(assert (=> b!1482588 (= c!137335 (validKeyInArray!0 (select (arr!48021 a!2862) (bvadd j!93 #b00000000000000000000000000000001))))))

(declare-fun b!1482589 () Bool)

(declare-fun e!831662 () Bool)

(assert (=> b!1482589 (= e!831662 call!67938)))

(declare-fun bm!67935 () Bool)

(assert (=> bm!67935 (= call!67938 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482590 () Bool)

(assert (=> b!1482590 (= e!831663 e!831662)))

(declare-fun lt!647228 () (_ BitVec 64))

(assert (=> b!1482590 (= lt!647228 (select (arr!48021 a!2862) (bvadd j!93 #b00000000000000000000000000000001)))))

(declare-fun lt!647230 () Unit!49689)

(assert (=> b!1482590 (= lt!647230 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647228 (bvadd j!93 #b00000000000000000000000000000001)))))

(assert (=> b!1482590 (arrayContainsKey!0 a!2862 lt!647228 #b00000000000000000000000000000000)))

(declare-fun lt!647229 () Unit!49689)

(assert (=> b!1482590 (= lt!647229 lt!647230)))

(declare-fun res!1006980 () Bool)

(assert (=> b!1482590 (= res!1006980 (= (seekEntryOrOpen!0 (select (arr!48021 a!2862) (bvadd j!93 #b00000000000000000000000000000001)) a!2862 mask!2687) (Found!12158 (bvadd j!93 #b00000000000000000000000000000001))))))

(assert (=> b!1482590 (=> (not res!1006980) (not e!831662))))

(assert (= (and d!156659 (not res!1006979)) b!1482588))

(assert (= (and b!1482588 c!137335) b!1482590))

(assert (= (and b!1482588 (not c!137335)) b!1482587))

(assert (= (and b!1482590 res!1006980) b!1482589))

(assert (= (or b!1482589 b!1482587) bm!67935))

(declare-fun m!1368285 () Bool)

(assert (=> b!1482588 m!1368285))

(assert (=> b!1482588 m!1368285))

(declare-fun m!1368287 () Bool)

(assert (=> b!1482588 m!1368287))

(declare-fun m!1368289 () Bool)

(assert (=> bm!67935 m!1368289))

(assert (=> b!1482590 m!1368285))

(declare-fun m!1368291 () Bool)

(assert (=> b!1482590 m!1368291))

(declare-fun m!1368293 () Bool)

(assert (=> b!1482590 m!1368293))

(assert (=> b!1482590 m!1368285))

(declare-fun m!1368295 () Bool)

(assert (=> b!1482590 m!1368295))

(assert (=> bm!67928 d!156659))

(declare-fun d!156661 () Bool)

(assert (=> d!156661 (arrayContainsKey!0 a!2862 lt!647167 #b00000000000000000000000000000000)))

(declare-fun lt!647231 () Unit!49689)

(assert (=> d!156661 (= lt!647231 (choose!13 a!2862 lt!647167 j!93))))

(assert (=> d!156661 (bvsge j!93 #b00000000000000000000000000000000)))

(assert (=> d!156661 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!647167 j!93) lt!647231)))

(declare-fun bs!42672 () Bool)

(assert (= bs!42672 d!156661))

(assert (=> bs!42672 m!1368127))

(declare-fun m!1368297 () Bool)

(assert (=> bs!42672 m!1368297))

(assert (=> b!1482426 d!156661))

(declare-fun d!156663 () Bool)

(declare-fun res!1006981 () Bool)

(declare-fun e!831665 () Bool)

(assert (=> d!156663 (=> res!1006981 e!831665)))

(assert (=> d!156663 (= res!1006981 (= (select (arr!48021 a!2862) #b00000000000000000000000000000000) lt!647167))))

(assert (=> d!156663 (= (arrayContainsKey!0 a!2862 lt!647167 #b00000000000000000000000000000000) e!831665)))

(declare-fun b!1482591 () Bool)

(declare-fun e!831666 () Bool)

(assert (=> b!1482591 (= e!831665 e!831666)))

(declare-fun res!1006982 () Bool)

(assert (=> b!1482591 (=> (not res!1006982) (not e!831666))))

(assert (=> b!1482591 (= res!1006982 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!48572 a!2862)))))

(declare-fun b!1482592 () Bool)

(assert (=> b!1482592 (= e!831666 (arrayContainsKey!0 a!2862 lt!647167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!156663 (not res!1006981)) b!1482591))

(assert (= (and b!1482591 res!1006982) b!1482592))

(assert (=> d!156663 m!1368085))

(declare-fun m!1368299 () Bool)

(assert (=> b!1482592 m!1368299))

(assert (=> b!1482426 d!156663))

(assert (=> b!1482426 d!156589))

(assert (=> b!1482360 d!156633))

(assert (=> b!1482424 d!156593))

(declare-fun b!1482593 () Bool)

(declare-fun e!831667 () SeekEntryResult!12158)

(assert (=> b!1482593 (= e!831667 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!647039 lt!647037 mask!2687))))

(declare-fun d!156665 () Bool)

(declare-fun lt!647232 () SeekEntryResult!12158)

(assert (=> d!156665 (and (or (is-Undefined!12158 lt!647232) (not (is-Found!12158 lt!647232)) (and (bvsge (index!51025 lt!647232) #b00000000000000000000000000000000) (bvslt (index!51025 lt!647232) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647232) (is-Found!12158 lt!647232) (not (is-MissingVacant!12158 lt!647232)) (not (= (index!51027 lt!647232) intermediateAfterIndex!19)) (and (bvsge (index!51027 lt!647232) #b00000000000000000000000000000000) (bvslt (index!51027 lt!647232) (size!48572 lt!647037)))) (or (is-Undefined!12158 lt!647232) (ite (is-Found!12158 lt!647232) (= (select (arr!48021 lt!647037) (index!51025 lt!647232)) lt!647039) (and (is-MissingVacant!12158 lt!647232) (= (index!51027 lt!647232) intermediateAfterIndex!19) (= (select (arr!48021 lt!647037) (index!51027 lt!647232)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!831668 () SeekEntryResult!12158)

(assert (=> d!156665 (= lt!647232 e!831668)))

(declare-fun c!137338 () Bool)

(assert (=> d!156665 (= c!137338 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!647233 () (_ BitVec 64))

(assert (=> d!156665 (= lt!647233 (select (arr!48021 lt!647037) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687)))))

(assert (=> d!156665 (validMask!0 mask!2687)))

(assert (=> d!156665 (= (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) intermediateAfterIndex!19 lt!647039 lt!647037 mask!2687) lt!647232)))

(declare-fun b!1482594 () Bool)

(declare-fun e!831669 () SeekEntryResult!12158)

(assert (=> b!1482594 (= e!831669 (Found!12158 (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687)))))

(declare-fun b!1482595 () Bool)

(assert (=> b!1482595 (= e!831667 (MissingVacant!12158 intermediateAfterIndex!19))))

(declare-fun b!1482596 () Bool)

(assert (=> b!1482596 (= e!831668 e!831669)))

(declare-fun c!137337 () Bool)

(assert (=> b!1482596 (= c!137337 (= lt!647233 lt!647039))))

(declare-fun b!1482597 () Bool)

(assert (=> b!1482597 (= e!831668 Undefined!12158)))

(declare-fun b!1482598 () Bool)

(declare-fun c!137336 () Bool)

(assert (=> b!1482598 (= c!137336 (= lt!647233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482598 (= e!831669 e!831667)))

(assert (= (and d!156665 c!137338) b!1482597))

(assert (= (and d!156665 (not c!137338)) b!1482596))

(assert (= (and b!1482596 c!137337) b!1482594))

(assert (= (and b!1482596 (not c!137337)) b!1482598))

(assert (= (and b!1482598 c!137336) b!1482595))

(assert (= (and b!1482598 (not c!137336)) b!1482593))

(assert (=> b!1482593 m!1368027))

(assert (=> b!1482593 m!1368233))

(assert (=> b!1482593 m!1368233))

(declare-fun m!1368301 () Bool)

(assert (=> b!1482593 m!1368301))

(declare-fun m!1368303 () Bool)

(assert (=> d!156665 m!1368303))

(declare-fun m!1368305 () Bool)

(assert (=> d!156665 m!1368305))

(assert (=> d!156665 m!1368027))

(assert (=> d!156665 m!1368237))

(assert (=> d!156665 m!1367929))

(assert (=> b!1482263 d!156665))

(assert (=> b!1482263 d!156643))

(assert (=> d!156573 d!156603))

(assert (=> d!156589 d!156613))

(assert (=> d!156589 d!156617))

(assert (=> d!156589 d!156603))

(declare-fun e!831673 () SeekEntryResult!12158)

(declare-fun b!1482599 () Bool)

(assert (=> b!1482599 (= e!831673 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001 #b00000000000000000000000000000001) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482600 () Bool)

(declare-fun lt!647234 () SeekEntryResult!12158)

(assert (=> b!1482600 (and (bvsge (index!51026 lt!647234) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647234) (size!48572 a!2862)))))

(declare-fun e!831674 () Bool)

(assert (=> b!1482600 (= e!831674 (= (select (arr!48021 a!2862) (index!51026 lt!647234)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831671 () SeekEntryResult!12158)

(declare-fun b!1482601 () Bool)

(assert (=> b!1482601 (= e!831671 (Intermediate!12158 true (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1482602 () Bool)

(assert (=> b!1482602 (and (bvsge (index!51026 lt!647234) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647234) (size!48572 a!2862)))))

(declare-fun res!1006984 () Bool)

(assert (=> b!1482602 (= res!1006984 (= (select (arr!48021 a!2862) (index!51026 lt!647234)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482602 (=> res!1006984 e!831674)))

(declare-fun b!1482604 () Bool)

(assert (=> b!1482604 (and (bvsge (index!51026 lt!647234) #b00000000000000000000000000000000) (bvslt (index!51026 lt!647234) (size!48572 a!2862)))))

(declare-fun res!1006983 () Bool)

(assert (=> b!1482604 (= res!1006983 (= (select (arr!48021 a!2862) (index!51026 lt!647234)) (select (arr!48021 a!2862) j!93)))))

(assert (=> b!1482604 (=> res!1006983 e!831674)))

(declare-fun e!831670 () Bool)

(assert (=> b!1482604 (= e!831670 e!831674)))

(declare-fun b!1482605 () Bool)

(declare-fun e!831672 () Bool)

(assert (=> b!1482605 (= e!831672 e!831670)))

(declare-fun res!1006985 () Bool)

(assert (=> b!1482605 (= res!1006985 (and (is-Intermediate!12158 lt!647234) (not (undefined!12970 lt!647234)) (bvslt (x!132782 lt!647234) #b01111111111111111111111111111110) (bvsge (x!132782 lt!647234) #b00000000000000000000000000000000) (bvsge (x!132782 lt!647234) (bvadd x!665 #b00000000000000000000000000000001))))))

(assert (=> b!1482605 (=> (not res!1006985) (not e!831670))))

(declare-fun b!1482606 () Bool)

(assert (=> b!1482606 (= e!831671 e!831673)))

(declare-fun c!137339 () Bool)

(declare-fun lt!647235 () (_ BitVec 64))

(assert (=> b!1482606 (= c!137339 (or (= lt!647235 (select (arr!48021 a!2862) j!93)) (= (bvadd lt!647235 lt!647235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1482607 () Bool)

(assert (=> b!1482607 (= e!831673 (Intermediate!12158 false (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (bvadd x!665 #b00000000000000000000000000000001)))))

(declare-fun b!1482603 () Bool)

(assert (=> b!1482603 (= e!831672 (bvsge (x!132782 lt!647234) #b01111111111111111111111111111110))))

(declare-fun d!156667 () Bool)

(assert (=> d!156667 e!831672))

(declare-fun c!137341 () Bool)

(assert (=> d!156667 (= c!137341 (and (is-Intermediate!12158 lt!647234) (undefined!12970 lt!647234)))))

(assert (=> d!156667 (= lt!647234 e!831671)))

(declare-fun c!137340 () Bool)

(assert (=> d!156667 (= c!137340 (bvsge (bvadd x!665 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!156667 (= lt!647235 (select (arr!48021 a!2862) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687)))))

(assert (=> d!156667 (validMask!0 mask!2687)))

(assert (=> d!156667 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!48021 a!2862) j!93) a!2862 mask!2687) lt!647234)))

(assert (= (and d!156667 c!137340) b!1482601))

(assert (= (and d!156667 (not c!137340)) b!1482606))

(assert (= (and b!1482606 c!137339) b!1482607))

(assert (= (and b!1482606 (not c!137339)) b!1482599))

(assert (= (and d!156667 c!137341) b!1482603))

(assert (= (and d!156667 (not c!137341)) b!1482605))

(assert (= (and b!1482605 res!1006985) b!1482604))

(assert (= (and b!1482604 (not res!1006983)) b!1482602))

(assert (= (and b!1482602 (not res!1006984)) b!1482600))

(declare-fun m!1368307 () Bool)

(assert (=> b!1482602 m!1368307))

(assert (=> b!1482604 m!1368307))

(assert (=> b!1482599 m!1368027))

(assert (=> b!1482599 m!1368233))

(assert (=> b!1482599 m!1368233))

(assert (=> b!1482599 m!1367915))

(declare-fun m!1368309 () Bool)

(assert (=> b!1482599 m!1368309))

(assert (=> b!1482600 m!1368307))

(assert (=> d!156667 m!1368027))

(declare-fun m!1368311 () Bool)

(assert (=> d!156667 m!1368311))

(assert (=> d!156667 m!1367929))

(assert (=> b!1482457 d!156667))

(assert (=> b!1482457 d!156643))

(assert (=> d!156561 d!156573))

(assert (=> d!156561 d!156581))

(assert (=> d!156561 d!156603))

(push 1)

(assert (not b!1482590))

(assert (not b!1482576))

(assert (not b!1482593))

(assert (not d!156631))

(assert (not b!1482584))

(assert (not b!1482562))

(assert (not b!1482581))

(assert (not d!156645))

(assert (not d!156627))

(assert (not d!156647))

(assert (not d!156667))

(assert (not b!1482592))

(assert (not b!1482546))

(assert (not d!156637))

(assert (not d!156643))

(assert (not bm!67933))

(assert (not b!1482544))

(assert (not d!156649))

(assert (not b!1482586))

(assert (not b!1482547))

(assert (not b!1482545))

(assert (not d!156655))

(assert (not b!1482588))

(assert (not b!1482541))

(assert (not d!156661))

(assert (not d!156641))

(assert (not b!1482521))

(assert (not b!1482530))

(assert (not b!1482556))

(assert (not d!156629))

(assert (not bm!67935))

(assert (not bm!67934))

(assert (not d!156635))

(assert (not d!156665))

(assert (not d!156651))

(assert (not b!1482599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

