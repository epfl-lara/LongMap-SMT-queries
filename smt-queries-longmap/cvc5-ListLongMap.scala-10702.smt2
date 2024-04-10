; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125350 () Bool)

(assert start!125350)

(declare-fun b!1465023 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!823250 () Bool)

(declare-datatypes ((array!98798 0))(
  ( (array!98799 (arr!47687 (Array (_ BitVec 32) (_ BitVec 64))) (size!48237 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98798)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465023 (= e!823250 (or (= (select (arr!47687 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47687 a!2862) intermediateBeforeIndex!19) (select (arr!47687 a!2862) j!93))))))

(declare-fun lt!641272 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1465024 () Bool)

(declare-fun lt!641277 () (_ BitVec 64))

(declare-fun lt!641271 () array!98798)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!823247 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11939 0))(
  ( (MissingZero!11939 (index!50148 (_ BitVec 32))) (Found!11939 (index!50149 (_ BitVec 32))) (Intermediate!11939 (undefined!12751 Bool) (index!50150 (_ BitVec 32)) (x!131732 (_ BitVec 32))) (Undefined!11939) (MissingVacant!11939 (index!50151 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98798 (_ BitVec 32)) SeekEntryResult!11939)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98798 (_ BitVec 32)) SeekEntryResult!11939)

(assert (=> b!1465024 (= e!823247 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641272 intermediateAfterIndex!19 lt!641277 lt!641271 mask!2687) (seekEntryOrOpen!0 lt!641277 lt!641271 mask!2687))))))

(declare-fun b!1465025 () Bool)

(declare-fun res!994000 () Bool)

(declare-fun e!823243 () Bool)

(assert (=> b!1465025 (=> (not res!994000) (not e!823243))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465025 (= res!994000 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465026 () Bool)

(declare-fun e!823248 () Bool)

(declare-fun e!823246 () Bool)

(assert (=> b!1465026 (= e!823248 e!823246)))

(declare-fun res!993997 () Bool)

(assert (=> b!1465026 (=> res!993997 e!823246)))

(assert (=> b!1465026 (= res!993997 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641272 #b00000000000000000000000000000000) (bvsge lt!641272 (size!48237 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465026 (= lt!641272 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465027 () Bool)

(declare-fun res!993986 () Bool)

(assert (=> b!1465027 (=> res!993986 e!823246)))

(declare-fun lt!641276 () SeekEntryResult!11939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98798 (_ BitVec 32)) SeekEntryResult!11939)

(assert (=> b!1465027 (= res!993986 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641272 (select (arr!47687 a!2862) j!93) a!2862 mask!2687) lt!641276)))))

(declare-fun b!1465028 () Bool)

(declare-fun res!993998 () Bool)

(assert (=> b!1465028 (=> (not res!993998) (not e!823243))))

(declare-fun e!823242 () Bool)

(assert (=> b!1465028 (= res!993998 e!823242)))

(declare-fun c!135030 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465028 (= c!135030 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465029 () Bool)

(assert (=> b!1465029 (= e!823246 true)))

(declare-fun lt!641273 () Bool)

(assert (=> b!1465029 (= lt!641273 e!823247)))

(declare-fun c!135029 () Bool)

(assert (=> b!1465029 (= c!135029 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465030 () Bool)

(declare-fun res!993993 () Bool)

(declare-fun e!823241 () Bool)

(assert (=> b!1465030 (=> (not res!993993) (not e!823241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98798 (_ BitVec 32)) Bool)

(assert (=> b!1465030 (= res!993993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465031 () Bool)

(declare-fun res!993999 () Bool)

(assert (=> b!1465031 (=> (not res!993999) (not e!823241))))

(declare-datatypes ((List!34188 0))(
  ( (Nil!34185) (Cons!34184 (h!35534 (_ BitVec 64)) (t!48882 List!34188)) )
))
(declare-fun arrayNoDuplicates!0 (array!98798 (_ BitVec 32) List!34188) Bool)

(assert (=> b!1465031 (= res!993999 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34185))))

(declare-fun b!1465032 () Bool)

(declare-fun res!993991 () Bool)

(assert (=> b!1465032 (=> (not res!993991) (not e!823241))))

(assert (=> b!1465032 (= res!993991 (and (= (size!48237 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48237 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48237 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465034 () Bool)

(declare-fun res!993987 () Bool)

(assert (=> b!1465034 (=> (not res!993987) (not e!823241))))

(assert (=> b!1465034 (= res!993987 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48237 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48237 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48237 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465035 () Bool)

(assert (=> b!1465035 (= e!823242 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641277 lt!641271 mask!2687) (seekEntryOrOpen!0 lt!641277 lt!641271 mask!2687)))))

(declare-fun lt!641275 () SeekEntryResult!11939)

(declare-fun b!1465036 () Bool)

(assert (=> b!1465036 (= e!823247 (not (= lt!641275 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641272 lt!641277 lt!641271 mask!2687))))))

(declare-fun b!1465037 () Bool)

(declare-fun res!994003 () Bool)

(assert (=> b!1465037 (=> (not res!994003) (not e!823241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465037 (= res!994003 (validKeyInArray!0 (select (arr!47687 a!2862) j!93)))))

(declare-fun b!1465038 () Bool)

(declare-fun e!823249 () Bool)

(declare-fun e!823245 () Bool)

(assert (=> b!1465038 (= e!823249 e!823245)))

(declare-fun res!994002 () Bool)

(assert (=> b!1465038 (=> (not res!994002) (not e!823245))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465038 (= res!994002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47687 a!2862) j!93) mask!2687) (select (arr!47687 a!2862) j!93) a!2862 mask!2687) lt!641276))))

(assert (=> b!1465038 (= lt!641276 (Intermediate!11939 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465039 () Bool)

(assert (=> b!1465039 (= e!823242 (= lt!641275 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641277 lt!641271 mask!2687)))))

(declare-fun b!1465040 () Bool)

(declare-fun res!993994 () Bool)

(assert (=> b!1465040 (=> (not res!993994) (not e!823241))))

(assert (=> b!1465040 (= res!993994 (validKeyInArray!0 (select (arr!47687 a!2862) i!1006)))))

(declare-fun b!1465041 () Bool)

(declare-fun res!994001 () Bool)

(assert (=> b!1465041 (=> (not res!994001) (not e!823250))))

(assert (=> b!1465041 (= res!994001 (= (seekEntryOrOpen!0 (select (arr!47687 a!2862) j!93) a!2862 mask!2687) (Found!11939 j!93)))))

(declare-fun b!1465042 () Bool)

(assert (=> b!1465042 (= e!823241 e!823249)))

(declare-fun res!993996 () Bool)

(assert (=> b!1465042 (=> (not res!993996) (not e!823249))))

(assert (=> b!1465042 (= res!993996 (= (select (store (arr!47687 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465042 (= lt!641271 (array!98799 (store (arr!47687 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48237 a!2862)))))

(declare-fun b!1465043 () Bool)

(assert (=> b!1465043 (= e!823245 e!823243)))

(declare-fun res!993995 () Bool)

(assert (=> b!1465043 (=> (not res!993995) (not e!823243))))

(assert (=> b!1465043 (= res!993995 (= lt!641275 (Intermediate!11939 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465043 (= lt!641275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641277 mask!2687) lt!641277 lt!641271 mask!2687))))

(assert (=> b!1465043 (= lt!641277 (select (store (arr!47687 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465044 () Bool)

(assert (=> b!1465044 (= e!823243 (not e!823248))))

(declare-fun res!993988 () Bool)

(assert (=> b!1465044 (=> res!993988 e!823248)))

(assert (=> b!1465044 (= res!993988 (or (and (= (select (arr!47687 a!2862) index!646) (select (store (arr!47687 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47687 a!2862) index!646) (select (arr!47687 a!2862) j!93))) (= (select (arr!47687 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465044 e!823250))

(declare-fun res!993989 () Bool)

(assert (=> b!1465044 (=> (not res!993989) (not e!823250))))

(assert (=> b!1465044 (= res!993989 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49374 0))(
  ( (Unit!49375) )
))
(declare-fun lt!641274 () Unit!49374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49374)

(assert (=> b!1465044 (= lt!641274 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465033 () Bool)

(declare-fun res!993992 () Bool)

(assert (=> b!1465033 (=> (not res!993992) (not e!823245))))

(assert (=> b!1465033 (= res!993992 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47687 a!2862) j!93) a!2862 mask!2687) lt!641276))))

(declare-fun res!993990 () Bool)

(assert (=> start!125350 (=> (not res!993990) (not e!823241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125350 (= res!993990 (validMask!0 mask!2687))))

(assert (=> start!125350 e!823241))

(assert (=> start!125350 true))

(declare-fun array_inv!36715 (array!98798) Bool)

(assert (=> start!125350 (array_inv!36715 a!2862)))

(assert (= (and start!125350 res!993990) b!1465032))

(assert (= (and b!1465032 res!993991) b!1465040))

(assert (= (and b!1465040 res!993994) b!1465037))

(assert (= (and b!1465037 res!994003) b!1465030))

(assert (= (and b!1465030 res!993993) b!1465031))

(assert (= (and b!1465031 res!993999) b!1465034))

(assert (= (and b!1465034 res!993987) b!1465042))

(assert (= (and b!1465042 res!993996) b!1465038))

(assert (= (and b!1465038 res!994002) b!1465033))

(assert (= (and b!1465033 res!993992) b!1465043))

(assert (= (and b!1465043 res!993995) b!1465028))

(assert (= (and b!1465028 c!135030) b!1465039))

(assert (= (and b!1465028 (not c!135030)) b!1465035))

(assert (= (and b!1465028 res!993998) b!1465025))

(assert (= (and b!1465025 res!994000) b!1465044))

(assert (= (and b!1465044 res!993989) b!1465041))

(assert (= (and b!1465041 res!994001) b!1465023))

(assert (= (and b!1465044 (not res!993988)) b!1465026))

(assert (= (and b!1465026 (not res!993997)) b!1465027))

(assert (= (and b!1465027 (not res!993986)) b!1465029))

(assert (= (and b!1465029 c!135029) b!1465036))

(assert (= (and b!1465029 (not c!135029)) b!1465024))

(declare-fun m!1352167 () Bool)

(assert (=> b!1465030 m!1352167))

(declare-fun m!1352169 () Bool)

(assert (=> b!1465033 m!1352169))

(assert (=> b!1465033 m!1352169))

(declare-fun m!1352171 () Bool)

(assert (=> b!1465033 m!1352171))

(declare-fun m!1352173 () Bool)

(assert (=> b!1465026 m!1352173))

(declare-fun m!1352175 () Bool)

(assert (=> b!1465044 m!1352175))

(declare-fun m!1352177 () Bool)

(assert (=> b!1465044 m!1352177))

(declare-fun m!1352179 () Bool)

(assert (=> b!1465044 m!1352179))

(declare-fun m!1352181 () Bool)

(assert (=> b!1465044 m!1352181))

(declare-fun m!1352183 () Bool)

(assert (=> b!1465044 m!1352183))

(assert (=> b!1465044 m!1352169))

(declare-fun m!1352185 () Bool)

(assert (=> b!1465043 m!1352185))

(assert (=> b!1465043 m!1352185))

(declare-fun m!1352187 () Bool)

(assert (=> b!1465043 m!1352187))

(assert (=> b!1465043 m!1352177))

(declare-fun m!1352189 () Bool)

(assert (=> b!1465043 m!1352189))

(assert (=> b!1465041 m!1352169))

(assert (=> b!1465041 m!1352169))

(declare-fun m!1352191 () Bool)

(assert (=> b!1465041 m!1352191))

(declare-fun m!1352193 () Bool)

(assert (=> start!125350 m!1352193))

(declare-fun m!1352195 () Bool)

(assert (=> start!125350 m!1352195))

(assert (=> b!1465042 m!1352177))

(declare-fun m!1352197 () Bool)

(assert (=> b!1465042 m!1352197))

(declare-fun m!1352199 () Bool)

(assert (=> b!1465039 m!1352199))

(declare-fun m!1352201 () Bool)

(assert (=> b!1465031 m!1352201))

(assert (=> b!1465037 m!1352169))

(assert (=> b!1465037 m!1352169))

(declare-fun m!1352203 () Bool)

(assert (=> b!1465037 m!1352203))

(assert (=> b!1465038 m!1352169))

(assert (=> b!1465038 m!1352169))

(declare-fun m!1352205 () Bool)

(assert (=> b!1465038 m!1352205))

(assert (=> b!1465038 m!1352205))

(assert (=> b!1465038 m!1352169))

(declare-fun m!1352207 () Bool)

(assert (=> b!1465038 m!1352207))

(declare-fun m!1352209 () Bool)

(assert (=> b!1465040 m!1352209))

(assert (=> b!1465040 m!1352209))

(declare-fun m!1352211 () Bool)

(assert (=> b!1465040 m!1352211))

(assert (=> b!1465027 m!1352169))

(assert (=> b!1465027 m!1352169))

(declare-fun m!1352213 () Bool)

(assert (=> b!1465027 m!1352213))

(declare-fun m!1352215 () Bool)

(assert (=> b!1465036 m!1352215))

(declare-fun m!1352217 () Bool)

(assert (=> b!1465024 m!1352217))

(declare-fun m!1352219 () Bool)

(assert (=> b!1465024 m!1352219))

(declare-fun m!1352221 () Bool)

(assert (=> b!1465035 m!1352221))

(assert (=> b!1465035 m!1352219))

(declare-fun m!1352223 () Bool)

(assert (=> b!1465023 m!1352223))

(assert (=> b!1465023 m!1352169))

(push 1)

