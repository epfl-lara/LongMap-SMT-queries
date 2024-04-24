; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126522 () Bool)

(assert start!126522)

(declare-fun b!1481307 () Bool)

(declare-fun res!1006112 () Bool)

(declare-fun e!830994 () Bool)

(assert (=> b!1481307 (=> (not res!1006112) (not e!830994))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99466 0))(
  ( (array!99467 (arr!48007 (Array (_ BitVec 32) (_ BitVec 64))) (size!48558 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99466)

(assert (=> b!1481307 (= res!1006112 (and (= (size!48558 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48558 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48558 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481308 () Bool)

(declare-fun e!830997 () Bool)

(declare-fun e!830999 () Bool)

(assert (=> b!1481308 (= e!830997 e!830999)))

(declare-fun res!1006113 () Bool)

(assert (=> b!1481308 (=> (not res!1006113) (not e!830999))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12144 0))(
  ( (MissingZero!12144 (index!50968 (_ BitVec 32))) (Found!12144 (index!50969 (_ BitVec 32))) (Intermediate!12144 (undefined!12956 Bool) (index!50970 (_ BitVec 32)) (x!132736 (_ BitVec 32))) (Undefined!12144) (MissingVacant!12144 (index!50971 (_ BitVec 32))) )
))
(declare-fun lt!646727 () SeekEntryResult!12144)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12144)

(assert (=> b!1481308 (= res!1006113 (= lt!646727 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!48007 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1481309 () Bool)

(declare-fun res!1006099 () Bool)

(assert (=> b!1481309 (=> (not res!1006099) (not e!830994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481309 (= res!1006099 (validKeyInArray!0 (select (arr!48007 a!2862) j!93)))))

(declare-fun b!1481310 () Bool)

(declare-fun res!1006106 () Bool)

(declare-fun e!830993 () Bool)

(assert (=> b!1481310 (=> (not res!1006106) (not e!830993))))

(declare-fun lt!646729 () SeekEntryResult!12144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12144)

(assert (=> b!1481310 (= res!1006106 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!646729))))

(declare-fun b!1481311 () Bool)

(declare-fun res!1006114 () Bool)

(assert (=> b!1481311 (=> (not res!1006114) (not e!830994))))

(declare-datatypes ((List!34495 0))(
  ( (Nil!34492) (Cons!34491 (h!35873 (_ BitVec 64)) (t!49181 List!34495)) )
))
(declare-fun arrayNoDuplicates!0 (array!99466 (_ BitVec 32) List!34495) Bool)

(assert (=> b!1481311 (= res!1006114 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34492))))

(declare-fun lt!646732 () array!99466)

(declare-fun lt!646726 () (_ BitVec 64))

(declare-fun e!830992 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1481312 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99466 (_ BitVec 32)) SeekEntryResult!12144)

(assert (=> b!1481312 (= e!830992 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646726 lt!646732 mask!2687) (seekEntryOrOpen!0 lt!646726 lt!646732 mask!2687)))))

(declare-fun b!1481313 () Bool)

(declare-fun e!831000 () Bool)

(assert (=> b!1481313 (= e!830994 e!831000)))

(declare-fun res!1006103 () Bool)

(assert (=> b!1481313 (=> (not res!1006103) (not e!831000))))

(assert (=> b!1481313 (= res!1006103 (= (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481313 (= lt!646732 (array!99467 (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48558 a!2862)))))

(declare-fun b!1481314 () Bool)

(declare-fun res!1006110 () Bool)

(declare-fun e!830995 () Bool)

(assert (=> b!1481314 (=> (not res!1006110) (not e!830995))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481314 (= res!1006110 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481315 () Bool)

(declare-fun e!830996 () Bool)

(assert (=> b!1481315 (= e!830996 true)))

(declare-fun lt!646728 () SeekEntryResult!12144)

(assert (=> b!1481315 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646726 lt!646732 mask!2687) lt!646728)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49661 0))(
  ( (Unit!49662) )
))
(declare-fun lt!646725 () Unit!49661)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49661)

(assert (=> b!1481315 (= lt!646725 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1481317 () Bool)

(declare-fun res!1006105 () Bool)

(assert (=> b!1481317 (=> (not res!1006105) (not e!830994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99466 (_ BitVec 32)) Bool)

(assert (=> b!1481317 (= res!1006105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481318 () Bool)

(declare-fun res!1006107 () Bool)

(assert (=> b!1481318 (=> res!1006107 e!830996)))

(assert (=> b!1481318 (= res!1006107 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!646728)))))

(declare-fun b!1481319 () Bool)

(declare-fun res!1006101 () Bool)

(assert (=> b!1481319 (=> (not res!1006101) (not e!830994))))

(assert (=> b!1481319 (= res!1006101 (validKeyInArray!0 (select (arr!48007 a!2862) i!1006)))))

(declare-fun b!1481320 () Bool)

(declare-fun res!1006098 () Bool)

(assert (=> b!1481320 (=> (not res!1006098) (not e!830994))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481320 (= res!1006098 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48558 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48558 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48558 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481321 () Bool)

(assert (=> b!1481321 (= e!831000 e!830993)))

(declare-fun res!1006100 () Bool)

(assert (=> b!1481321 (=> (not res!1006100) (not e!830993))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481321 (= res!1006100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48007 a!2862) j!93) mask!2687) (select (arr!48007 a!2862) j!93) a!2862 mask!2687) lt!646729))))

(assert (=> b!1481321 (= lt!646729 (Intermediate!12144 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481322 () Bool)

(declare-fun res!1006109 () Bool)

(assert (=> b!1481322 (=> (not res!1006109) (not e!830995))))

(assert (=> b!1481322 (= res!1006109 e!830992)))

(declare-fun c!137134 () Bool)

(assert (=> b!1481322 (= c!137134 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!646731 () SeekEntryResult!12144)

(declare-fun b!1481323 () Bool)

(assert (=> b!1481323 (= e!830992 (= lt!646731 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646726 lt!646732 mask!2687)))))

(declare-fun b!1481324 () Bool)

(assert (=> b!1481324 (= e!830993 e!830995)))

(declare-fun res!1006102 () Bool)

(assert (=> b!1481324 (=> (not res!1006102) (not e!830995))))

(assert (=> b!1481324 (= res!1006102 (= lt!646731 (Intermediate!12144 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481324 (= lt!646731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646726 mask!2687) lt!646726 lt!646732 mask!2687))))

(assert (=> b!1481324 (= lt!646726 (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481325 () Bool)

(assert (=> b!1481325 (= e!830995 (not e!830996))))

(declare-fun res!1006115 () Bool)

(assert (=> b!1481325 (=> res!1006115 e!830996)))

(assert (=> b!1481325 (= res!1006115 (or (and (= (select (arr!48007 a!2862) index!646) (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48007 a!2862) index!646) (select (arr!48007 a!2862) j!93))) (not (= (select (arr!48007 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!830991 () Bool)

(assert (=> b!1481325 e!830991))

(declare-fun res!1006108 () Bool)

(assert (=> b!1481325 (=> (not res!1006108) (not e!830991))))

(assert (=> b!1481325 (= res!1006108 (and (= lt!646727 lt!646728) (or (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48007 a!2862) intermediateBeforeIndex!19) (select (arr!48007 a!2862) j!93)))))))

(assert (=> b!1481325 (= lt!646728 (Found!12144 j!93))))

(assert (=> b!1481325 (= lt!646727 (seekEntryOrOpen!0 (select (arr!48007 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1481325 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646730 () Unit!49661)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49661)

(assert (=> b!1481325 (= lt!646730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481326 () Bool)

(assert (=> b!1481326 (= e!830991 e!830997)))

(declare-fun res!1006111 () Bool)

(assert (=> b!1481326 (=> res!1006111 e!830997)))

(assert (=> b!1481326 (= res!1006111 (or (and (= (select (arr!48007 a!2862) index!646) (select (store (arr!48007 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48007 a!2862) index!646) (select (arr!48007 a!2862) j!93))) (not (= (select (arr!48007 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1006104 () Bool)

(assert (=> start!126522 (=> (not res!1006104) (not e!830994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126522 (= res!1006104 (validMask!0 mask!2687))))

(assert (=> start!126522 e!830994))

(assert (=> start!126522 true))

(declare-fun array_inv!37288 (array!99466) Bool)

(assert (=> start!126522 (array_inv!37288 a!2862)))

(declare-fun b!1481316 () Bool)

(assert (=> b!1481316 (= e!830999 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126522 res!1006104) b!1481307))

(assert (= (and b!1481307 res!1006112) b!1481319))

(assert (= (and b!1481319 res!1006101) b!1481309))

(assert (= (and b!1481309 res!1006099) b!1481317))

(assert (= (and b!1481317 res!1006105) b!1481311))

(assert (= (and b!1481311 res!1006114) b!1481320))

(assert (= (and b!1481320 res!1006098) b!1481313))

(assert (= (and b!1481313 res!1006103) b!1481321))

(assert (= (and b!1481321 res!1006100) b!1481310))

(assert (= (and b!1481310 res!1006106) b!1481324))

(assert (= (and b!1481324 res!1006102) b!1481322))

(assert (= (and b!1481322 c!137134) b!1481323))

(assert (= (and b!1481322 (not c!137134)) b!1481312))

(assert (= (and b!1481322 res!1006109) b!1481314))

(assert (= (and b!1481314 res!1006110) b!1481325))

(assert (= (and b!1481325 res!1006108) b!1481326))

(assert (= (and b!1481326 (not res!1006111)) b!1481308))

(assert (= (and b!1481308 res!1006113) b!1481316))

(assert (= (and b!1481325 (not res!1006115)) b!1481318))

(assert (= (and b!1481318 (not res!1006107)) b!1481315))

(declare-fun m!1367143 () Bool)

(assert (=> b!1481313 m!1367143))

(declare-fun m!1367145 () Bool)

(assert (=> b!1481313 m!1367145))

(declare-fun m!1367147 () Bool)

(assert (=> b!1481312 m!1367147))

(declare-fun m!1367149 () Bool)

(assert (=> b!1481312 m!1367149))

(declare-fun m!1367151 () Bool)

(assert (=> b!1481317 m!1367151))

(declare-fun m!1367153 () Bool)

(assert (=> b!1481310 m!1367153))

(assert (=> b!1481310 m!1367153))

(declare-fun m!1367155 () Bool)

(assert (=> b!1481310 m!1367155))

(declare-fun m!1367157 () Bool)

(assert (=> b!1481311 m!1367157))

(assert (=> b!1481318 m!1367153))

(assert (=> b!1481318 m!1367153))

(declare-fun m!1367159 () Bool)

(assert (=> b!1481318 m!1367159))

(assert (=> b!1481321 m!1367153))

(assert (=> b!1481321 m!1367153))

(declare-fun m!1367161 () Bool)

(assert (=> b!1481321 m!1367161))

(assert (=> b!1481321 m!1367161))

(assert (=> b!1481321 m!1367153))

(declare-fun m!1367163 () Bool)

(assert (=> b!1481321 m!1367163))

(declare-fun m!1367165 () Bool)

(assert (=> b!1481326 m!1367165))

(assert (=> b!1481326 m!1367143))

(declare-fun m!1367167 () Bool)

(assert (=> b!1481326 m!1367167))

(assert (=> b!1481326 m!1367153))

(assert (=> b!1481315 m!1367147))

(declare-fun m!1367169 () Bool)

(assert (=> b!1481315 m!1367169))

(declare-fun m!1367171 () Bool)

(assert (=> start!126522 m!1367171))

(declare-fun m!1367173 () Bool)

(assert (=> start!126522 m!1367173))

(declare-fun m!1367175 () Bool)

(assert (=> b!1481325 m!1367175))

(assert (=> b!1481325 m!1367143))

(declare-fun m!1367177 () Bool)

(assert (=> b!1481325 m!1367177))

(assert (=> b!1481325 m!1367167))

(assert (=> b!1481325 m!1367165))

(assert (=> b!1481325 m!1367153))

(declare-fun m!1367179 () Bool)

(assert (=> b!1481325 m!1367179))

(declare-fun m!1367181 () Bool)

(assert (=> b!1481325 m!1367181))

(assert (=> b!1481325 m!1367153))

(assert (=> b!1481308 m!1367153))

(assert (=> b!1481308 m!1367153))

(declare-fun m!1367183 () Bool)

(assert (=> b!1481308 m!1367183))

(declare-fun m!1367185 () Bool)

(assert (=> b!1481324 m!1367185))

(assert (=> b!1481324 m!1367185))

(declare-fun m!1367187 () Bool)

(assert (=> b!1481324 m!1367187))

(assert (=> b!1481324 m!1367143))

(declare-fun m!1367189 () Bool)

(assert (=> b!1481324 m!1367189))

(assert (=> b!1481309 m!1367153))

(assert (=> b!1481309 m!1367153))

(declare-fun m!1367191 () Bool)

(assert (=> b!1481309 m!1367191))

(declare-fun m!1367193 () Bool)

(assert (=> b!1481319 m!1367193))

(assert (=> b!1481319 m!1367193))

(declare-fun m!1367195 () Bool)

(assert (=> b!1481319 m!1367195))

(declare-fun m!1367197 () Bool)

(assert (=> b!1481323 m!1367197))

(check-sat (not b!1481309) (not b!1481312) (not b!1481308) (not b!1481323) (not b!1481310) (not b!1481311) (not b!1481319) (not b!1481324) (not b!1481317) (not b!1481325) (not b!1481318) (not b!1481315) (not start!126522) (not b!1481321))
(check-sat)
