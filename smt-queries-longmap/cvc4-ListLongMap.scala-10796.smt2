; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126368 () Bool)

(assert start!126368)

(declare-fun b!1481210 () Bool)

(declare-fun res!1006573 () Bool)

(declare-fun e!830786 () Bool)

(assert (=> b!1481210 (=> (not res!1006573) (not e!830786))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12211 0))(
  ( (MissingZero!12211 (index!51236 (_ BitVec 32))) (Found!12211 (index!51237 (_ BitVec 32))) (Intermediate!12211 (undefined!13023 Bool) (index!51238 (_ BitVec 32)) (x!132822 (_ BitVec 32))) (Undefined!12211) (MissingVacant!12211 (index!51239 (_ BitVec 32))) )
))
(declare-fun lt!646712 () SeekEntryResult!12211)

(declare-datatypes ((array!99387 0))(
  ( (array!99388 (arr!47971 (Array (_ BitVec 32) (_ BitVec 64))) (size!48521 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99387)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99387 (_ BitVec 32)) SeekEntryResult!12211)

(assert (=> b!1481210 (= res!1006573 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646712))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!830784 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun b!1481211 () Bool)

(assert (=> b!1481211 (= e!830784 (and (or (= (select (arr!47971 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47971 a!2862) intermediateBeforeIndex!19) (select (arr!47971 a!2862) j!93))) (or (and (= (select (arr!47971 a!2862) index!646) (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47971 a!2862) index!646) (select (arr!47971 a!2862) j!93))) (= (select (arr!47971 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (= index!646 intermediateAfterIndex!19))))))

(declare-fun b!1481212 () Bool)

(declare-fun res!1006571 () Bool)

(declare-fun e!830780 () Bool)

(assert (=> b!1481212 (=> (not res!1006571) (not e!830780))))

(declare-datatypes ((List!34472 0))(
  ( (Nil!34469) (Cons!34468 (h!35839 (_ BitVec 64)) (t!49166 List!34472)) )
))
(declare-fun arrayNoDuplicates!0 (array!99387 (_ BitVec 32) List!34472) Bool)

(assert (=> b!1481212 (= res!1006571 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34469))))

(declare-fun b!1481213 () Bool)

(declare-fun e!830782 () Bool)

(assert (=> b!1481213 (= e!830786 e!830782)))

(declare-fun res!1006562 () Bool)

(assert (=> b!1481213 (=> (not res!1006562) (not e!830782))))

(declare-fun lt!646709 () SeekEntryResult!12211)

(assert (=> b!1481213 (= res!1006562 (= lt!646709 (Intermediate!12211 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646711 () array!99387)

(declare-fun lt!646710 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481213 (= lt!646709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646710 mask!2687) lt!646710 lt!646711 mask!2687))))

(assert (=> b!1481213 (= lt!646710 (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481214 () Bool)

(declare-fun e!830783 () Bool)

(assert (=> b!1481214 (= e!830783 (= lt!646709 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646710 lt!646711 mask!2687)))))

(declare-fun b!1481215 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99387 (_ BitVec 32)) SeekEntryResult!12211)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99387 (_ BitVec 32)) SeekEntryResult!12211)

(assert (=> b!1481215 (= e!830783 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646710 lt!646711 mask!2687) (seekEntryOrOpen!0 lt!646710 lt!646711 mask!2687)))))

(declare-fun b!1481216 () Bool)

(declare-fun res!1006566 () Bool)

(assert (=> b!1481216 (=> (not res!1006566) (not e!830780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99387 (_ BitVec 32)) Bool)

(assert (=> b!1481216 (= res!1006566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481217 () Bool)

(declare-fun res!1006565 () Bool)

(assert (=> b!1481217 (=> (not res!1006565) (not e!830780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481217 (= res!1006565 (validKeyInArray!0 (select (arr!47971 a!2862) i!1006)))))

(declare-fun res!1006575 () Bool)

(assert (=> start!126368 (=> (not res!1006575) (not e!830780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126368 (= res!1006575 (validMask!0 mask!2687))))

(assert (=> start!126368 e!830780))

(assert (=> start!126368 true))

(declare-fun array_inv!36999 (array!99387) Bool)

(assert (=> start!126368 (array_inv!36999 a!2862)))

(declare-fun b!1481218 () Bool)

(declare-fun res!1006564 () Bool)

(assert (=> b!1481218 (=> (not res!1006564) (not e!830782))))

(assert (=> b!1481218 (= res!1006564 e!830783)))

(declare-fun c!136845 () Bool)

(assert (=> b!1481218 (= c!136845 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481219 () Bool)

(declare-fun res!1006563 () Bool)

(assert (=> b!1481219 (=> (not res!1006563) (not e!830784))))

(assert (=> b!1481219 (= res!1006563 (= (seekEntryOrOpen!0 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) (Found!12211 j!93)))))

(declare-fun b!1481220 () Bool)

(declare-fun res!1006569 () Bool)

(assert (=> b!1481220 (=> (not res!1006569) (not e!830780))))

(assert (=> b!1481220 (= res!1006569 (and (= (size!48521 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48521 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48521 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481221 () Bool)

(declare-fun e!830781 () Bool)

(assert (=> b!1481221 (= e!830781 e!830786)))

(declare-fun res!1006568 () Bool)

(assert (=> b!1481221 (=> (not res!1006568) (not e!830786))))

(assert (=> b!1481221 (= res!1006568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646712))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481221 (= lt!646712 (Intermediate!12211 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481222 () Bool)

(assert (=> b!1481222 (= e!830780 e!830781)))

(declare-fun res!1006570 () Bool)

(assert (=> b!1481222 (=> (not res!1006570) (not e!830781))))

(assert (=> b!1481222 (= res!1006570 (= (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481222 (= lt!646711 (array!99388 (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48521 a!2862)))))

(declare-fun b!1481223 () Bool)

(assert (=> b!1481223 (= e!830782 (not true))))

(assert (=> b!1481223 e!830784))

(declare-fun res!1006574 () Bool)

(assert (=> b!1481223 (=> (not res!1006574) (not e!830784))))

(assert (=> b!1481223 (= res!1006574 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49762 0))(
  ( (Unit!49763) )
))
(declare-fun lt!646713 () Unit!49762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99387 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49762)

(assert (=> b!1481223 (= lt!646713 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481224 () Bool)

(declare-fun res!1006572 () Bool)

(assert (=> b!1481224 (=> (not res!1006572) (not e!830780))))

(assert (=> b!1481224 (= res!1006572 (validKeyInArray!0 (select (arr!47971 a!2862) j!93)))))

(declare-fun b!1481225 () Bool)

(declare-fun res!1006567 () Bool)

(assert (=> b!1481225 (=> (not res!1006567) (not e!830780))))

(assert (=> b!1481225 (= res!1006567 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48521 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48521 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48521 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481226 () Bool)

(declare-fun res!1006576 () Bool)

(assert (=> b!1481226 (=> (not res!1006576) (not e!830782))))

(assert (=> b!1481226 (= res!1006576 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126368 res!1006575) b!1481220))

(assert (= (and b!1481220 res!1006569) b!1481217))

(assert (= (and b!1481217 res!1006565) b!1481224))

(assert (= (and b!1481224 res!1006572) b!1481216))

(assert (= (and b!1481216 res!1006566) b!1481212))

(assert (= (and b!1481212 res!1006571) b!1481225))

(assert (= (and b!1481225 res!1006567) b!1481222))

(assert (= (and b!1481222 res!1006570) b!1481221))

(assert (= (and b!1481221 res!1006568) b!1481210))

(assert (= (and b!1481210 res!1006573) b!1481213))

(assert (= (and b!1481213 res!1006562) b!1481218))

(assert (= (and b!1481218 c!136845) b!1481214))

(assert (= (and b!1481218 (not c!136845)) b!1481215))

(assert (= (and b!1481218 res!1006564) b!1481226))

(assert (= (and b!1481226 res!1006576) b!1481223))

(assert (= (and b!1481223 res!1006574) b!1481219))

(assert (= (and b!1481219 res!1006563) b!1481211))

(declare-fun m!1366955 () Bool)

(assert (=> b!1481223 m!1366955))

(declare-fun m!1366957 () Bool)

(assert (=> b!1481223 m!1366957))

(declare-fun m!1366959 () Bool)

(assert (=> b!1481221 m!1366959))

(assert (=> b!1481221 m!1366959))

(declare-fun m!1366961 () Bool)

(assert (=> b!1481221 m!1366961))

(assert (=> b!1481221 m!1366961))

(assert (=> b!1481221 m!1366959))

(declare-fun m!1366963 () Bool)

(assert (=> b!1481221 m!1366963))

(declare-fun m!1366965 () Bool)

(assert (=> b!1481212 m!1366965))

(assert (=> b!1481210 m!1366959))

(assert (=> b!1481210 m!1366959))

(declare-fun m!1366967 () Bool)

(assert (=> b!1481210 m!1366967))

(declare-fun m!1366969 () Bool)

(assert (=> start!126368 m!1366969))

(declare-fun m!1366971 () Bool)

(assert (=> start!126368 m!1366971))

(declare-fun m!1366973 () Bool)

(assert (=> b!1481214 m!1366973))

(assert (=> b!1481219 m!1366959))

(assert (=> b!1481219 m!1366959))

(declare-fun m!1366975 () Bool)

(assert (=> b!1481219 m!1366975))

(declare-fun m!1366977 () Bool)

(assert (=> b!1481211 m!1366977))

(declare-fun m!1366979 () Bool)

(assert (=> b!1481211 m!1366979))

(declare-fun m!1366981 () Bool)

(assert (=> b!1481211 m!1366981))

(declare-fun m!1366983 () Bool)

(assert (=> b!1481211 m!1366983))

(assert (=> b!1481211 m!1366959))

(assert (=> b!1481224 m!1366959))

(assert (=> b!1481224 m!1366959))

(declare-fun m!1366985 () Bool)

(assert (=> b!1481224 m!1366985))

(declare-fun m!1366987 () Bool)

(assert (=> b!1481217 m!1366987))

(assert (=> b!1481217 m!1366987))

(declare-fun m!1366989 () Bool)

(assert (=> b!1481217 m!1366989))

(declare-fun m!1366991 () Bool)

(assert (=> b!1481216 m!1366991))

(declare-fun m!1366993 () Bool)

(assert (=> b!1481215 m!1366993))

(declare-fun m!1366995 () Bool)

(assert (=> b!1481215 m!1366995))

(assert (=> b!1481222 m!1366977))

(declare-fun m!1366997 () Bool)

(assert (=> b!1481222 m!1366997))

(declare-fun m!1366999 () Bool)

(assert (=> b!1481213 m!1366999))

(assert (=> b!1481213 m!1366999))

(declare-fun m!1367001 () Bool)

(assert (=> b!1481213 m!1367001))

(assert (=> b!1481213 m!1366977))

(declare-fun m!1367003 () Bool)

(assert (=> b!1481213 m!1367003))

(push 1)

(assert (not b!1481213))

(assert (not b!1481217))

(assert (not b!1481210))

(assert (not b!1481212))

