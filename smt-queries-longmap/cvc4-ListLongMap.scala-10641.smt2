; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124988 () Bool)

(assert start!124988)

(declare-fun b!1453286 () Bool)

(declare-fun res!984323 () Bool)

(declare-fun e!818003 () Bool)

(assert (=> b!1453286 (=> (not res!984323) (not e!818003))))

(declare-datatypes ((array!98436 0))(
  ( (array!98437 (arr!47506 (Array (_ BitVec 32) (_ BitVec 64))) (size!48056 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98436)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11758 0))(
  ( (MissingZero!11758 (index!49424 (_ BitVec 32))) (Found!11758 (index!49425 (_ BitVec 32))) (Intermediate!11758 (undefined!12570 Bool) (index!49426 (_ BitVec 32)) (x!131063 (_ BitVec 32))) (Undefined!11758) (MissingVacant!11758 (index!49427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98436 (_ BitVec 32)) SeekEntryResult!11758)

(assert (=> b!1453286 (= res!984323 (= (seekEntryOrOpen!0 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) (Found!11758 j!93)))))

(declare-fun b!1453287 () Bool)

(declare-fun res!984326 () Bool)

(declare-fun e!818009 () Bool)

(assert (=> b!1453287 (=> (not res!984326) (not e!818009))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453287 (= res!984326 (validKeyInArray!0 (select (arr!47506 a!2862) i!1006)))))

(declare-fun b!1453288 () Bool)

(declare-fun res!984322 () Bool)

(declare-fun e!818001 () Bool)

(assert (=> b!1453288 (=> (not res!984322) (not e!818001))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453288 (= res!984322 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453289 () Bool)

(declare-fun e!818002 () Bool)

(declare-fun lt!637192 () array!98436)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637194 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98436 (_ BitVec 32)) SeekEntryResult!11758)

(assert (=> b!1453289 (= e!818002 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637194 lt!637192 mask!2687) (seekEntryOrOpen!0 lt!637194 lt!637192 mask!2687)))))

(declare-fun b!1453290 () Bool)

(declare-fun e!818005 () Bool)

(declare-fun e!818006 () Bool)

(assert (=> b!1453290 (= e!818005 e!818006)))

(declare-fun res!984327 () Bool)

(assert (=> b!1453290 (=> (not res!984327) (not e!818006))))

(declare-fun lt!637195 () SeekEntryResult!11758)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98436 (_ BitVec 32)) SeekEntryResult!11758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453290 (= res!984327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47506 a!2862) j!93) mask!2687) (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!637195))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453290 (= lt!637195 (Intermediate!11758 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453291 () Bool)

(declare-fun lt!637197 () SeekEntryResult!11758)

(assert (=> b!1453291 (= e!818002 (= lt!637197 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637194 lt!637192 mask!2687)))))

(declare-fun b!1453293 () Bool)

(declare-fun res!984320 () Bool)

(assert (=> b!1453293 (=> (not res!984320) (not e!818009))))

(assert (=> b!1453293 (= res!984320 (and (= (size!48056 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48056 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48056 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453294 () Bool)

(declare-fun e!818004 () Bool)

(assert (=> b!1453294 (= e!818003 e!818004)))

(declare-fun res!984321 () Bool)

(assert (=> b!1453294 (=> res!984321 e!818004)))

(declare-fun lt!637193 () (_ BitVec 64))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1453294 (= res!984321 (or (and (= (select (arr!47506 a!2862) index!646) lt!637193) (= (select (arr!47506 a!2862) index!646) (select (arr!47506 a!2862) j!93))) (= (select (arr!47506 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453294 (= lt!637193 (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453295 () Bool)

(declare-fun res!984328 () Bool)

(assert (=> b!1453295 (=> (not res!984328) (not e!818006))))

(assert (=> b!1453295 (= res!984328 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!637195))))

(declare-fun b!1453296 () Bool)

(declare-fun res!984313 () Bool)

(assert (=> b!1453296 (=> (not res!984313) (not e!818009))))

(assert (=> b!1453296 (= res!984313 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48056 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48056 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48056 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453297 () Bool)

(assert (=> b!1453297 (= e!818001 (not (or (and (= (select (arr!47506 a!2862) index!646) (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47506 a!2862) index!646) (select (arr!47506 a!2862) j!93))) (= (select (arr!47506 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1453297 e!818003))

(declare-fun res!984324 () Bool)

(assert (=> b!1453297 (=> (not res!984324) (not e!818003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98436 (_ BitVec 32)) Bool)

(assert (=> b!1453297 (= res!984324 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49012 0))(
  ( (Unit!49013) )
))
(declare-fun lt!637196 () Unit!49012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49012)

(assert (=> b!1453297 (= lt!637196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453298 () Bool)

(declare-fun res!984311 () Bool)

(assert (=> b!1453298 (=> (not res!984311) (not e!818009))))

(declare-datatypes ((List!34007 0))(
  ( (Nil!34004) (Cons!34003 (h!35353 (_ BitVec 64)) (t!48701 List!34007)) )
))
(declare-fun arrayNoDuplicates!0 (array!98436 (_ BitVec 32) List!34007) Bool)

(assert (=> b!1453298 (= res!984311 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34004))))

(declare-fun b!1453299 () Bool)

(declare-fun res!984315 () Bool)

(assert (=> b!1453299 (=> (not res!984315) (not e!818009))))

(assert (=> b!1453299 (= res!984315 (validKeyInArray!0 (select (arr!47506 a!2862) j!93)))))

(declare-fun b!1453300 () Bool)

(declare-fun res!984318 () Bool)

(assert (=> b!1453300 (=> (not res!984318) (not e!818001))))

(assert (=> b!1453300 (= res!984318 e!818002)))

(declare-fun c!133998 () Bool)

(assert (=> b!1453300 (= c!133998 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453301 () Bool)

(declare-fun res!984312 () Bool)

(assert (=> b!1453301 (=> (not res!984312) (not e!818003))))

(assert (=> b!1453301 (= res!984312 (or (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) (select (arr!47506 a!2862) j!93))))))

(declare-fun b!1453302 () Bool)

(declare-fun e!818008 () Bool)

(assert (=> b!1453302 (= e!818004 e!818008)))

(declare-fun res!984316 () Bool)

(assert (=> b!1453302 (=> (not res!984316) (not e!818008))))

(assert (=> b!1453302 (= res!984316 (and (= index!646 intermediateAfterIndex!19) (= lt!637193 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453303 () Bool)

(declare-fun res!984325 () Bool)

(assert (=> b!1453303 (=> (not res!984325) (not e!818009))))

(assert (=> b!1453303 (= res!984325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453304 () Bool)

(assert (=> b!1453304 (= e!818009 e!818005)))

(declare-fun res!984319 () Bool)

(assert (=> b!1453304 (=> (not res!984319) (not e!818005))))

(assert (=> b!1453304 (= res!984319 (= (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453304 (= lt!637192 (array!98437 (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48056 a!2862)))))

(declare-fun b!1453305 () Bool)

(assert (=> b!1453305 (= e!818008 (= (seekEntryOrOpen!0 lt!637194 lt!637192 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637194 lt!637192 mask!2687)))))

(declare-fun b!1453292 () Bool)

(assert (=> b!1453292 (= e!818006 e!818001)))

(declare-fun res!984314 () Bool)

(assert (=> b!1453292 (=> (not res!984314) (not e!818001))))

(assert (=> b!1453292 (= res!984314 (= lt!637197 (Intermediate!11758 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1453292 (= lt!637197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637194 mask!2687) lt!637194 lt!637192 mask!2687))))

(assert (=> b!1453292 (= lt!637194 (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!984317 () Bool)

(assert (=> start!124988 (=> (not res!984317) (not e!818009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124988 (= res!984317 (validMask!0 mask!2687))))

(assert (=> start!124988 e!818009))

(assert (=> start!124988 true))

(declare-fun array_inv!36534 (array!98436) Bool)

(assert (=> start!124988 (array_inv!36534 a!2862)))

(assert (= (and start!124988 res!984317) b!1453293))

(assert (= (and b!1453293 res!984320) b!1453287))

(assert (= (and b!1453287 res!984326) b!1453299))

(assert (= (and b!1453299 res!984315) b!1453303))

(assert (= (and b!1453303 res!984325) b!1453298))

(assert (= (and b!1453298 res!984311) b!1453296))

(assert (= (and b!1453296 res!984313) b!1453304))

(assert (= (and b!1453304 res!984319) b!1453290))

(assert (= (and b!1453290 res!984327) b!1453295))

(assert (= (and b!1453295 res!984328) b!1453292))

(assert (= (and b!1453292 res!984314) b!1453300))

(assert (= (and b!1453300 c!133998) b!1453291))

(assert (= (and b!1453300 (not c!133998)) b!1453289))

(assert (= (and b!1453300 res!984318) b!1453288))

(assert (= (and b!1453288 res!984322) b!1453297))

(assert (= (and b!1453297 res!984324) b!1453286))

(assert (= (and b!1453286 res!984323) b!1453301))

(assert (= (and b!1453301 res!984312) b!1453294))

(assert (= (and b!1453294 (not res!984321)) b!1453302))

(assert (= (and b!1453302 res!984316) b!1453305))

(declare-fun m!1341791 () Bool)

(assert (=> b!1453304 m!1341791))

(declare-fun m!1341793 () Bool)

(assert (=> b!1453304 m!1341793))

(declare-fun m!1341795 () Bool)

(assert (=> b!1453299 m!1341795))

(assert (=> b!1453299 m!1341795))

(declare-fun m!1341797 () Bool)

(assert (=> b!1453299 m!1341797))

(assert (=> b!1453295 m!1341795))

(assert (=> b!1453295 m!1341795))

(declare-fun m!1341799 () Bool)

(assert (=> b!1453295 m!1341799))

(declare-fun m!1341801 () Bool)

(assert (=> b!1453303 m!1341801))

(declare-fun m!1341803 () Bool)

(assert (=> start!124988 m!1341803))

(declare-fun m!1341805 () Bool)

(assert (=> start!124988 m!1341805))

(declare-fun m!1341807 () Bool)

(assert (=> b!1453298 m!1341807))

(declare-fun m!1341809 () Bool)

(assert (=> b!1453305 m!1341809))

(declare-fun m!1341811 () Bool)

(assert (=> b!1453305 m!1341811))

(assert (=> b!1453289 m!1341811))

(assert (=> b!1453289 m!1341809))

(declare-fun m!1341813 () Bool)

(assert (=> b!1453292 m!1341813))

(assert (=> b!1453292 m!1341813))

(declare-fun m!1341815 () Bool)

(assert (=> b!1453292 m!1341815))

(assert (=> b!1453292 m!1341791))

(declare-fun m!1341817 () Bool)

(assert (=> b!1453292 m!1341817))

(declare-fun m!1341819 () Bool)

(assert (=> b!1453291 m!1341819))

(declare-fun m!1341821 () Bool)

(assert (=> b!1453294 m!1341821))

(assert (=> b!1453294 m!1341795))

(assert (=> b!1453294 m!1341791))

(declare-fun m!1341823 () Bool)

(assert (=> b!1453294 m!1341823))

(assert (=> b!1453286 m!1341795))

(assert (=> b!1453286 m!1341795))

(declare-fun m!1341825 () Bool)

(assert (=> b!1453286 m!1341825))

(assert (=> b!1453290 m!1341795))

(assert (=> b!1453290 m!1341795))

(declare-fun m!1341827 () Bool)

(assert (=> b!1453290 m!1341827))

(assert (=> b!1453290 m!1341827))

(assert (=> b!1453290 m!1341795))

(declare-fun m!1341829 () Bool)

(assert (=> b!1453290 m!1341829))

(declare-fun m!1341831 () Bool)

(assert (=> b!1453287 m!1341831))

(assert (=> b!1453287 m!1341831))

(declare-fun m!1341833 () Bool)

(assert (=> b!1453287 m!1341833))

(declare-fun m!1341835 () Bool)

(assert (=> b!1453297 m!1341835))

(assert (=> b!1453297 m!1341791))

(assert (=> b!1453297 m!1341823))

(assert (=> b!1453297 m!1341821))

(declare-fun m!1341837 () Bool)

(assert (=> b!1453297 m!1341837))

(assert (=> b!1453297 m!1341795))

(declare-fun m!1341839 () Bool)

(assert (=> b!1453301 m!1341839))

(assert (=> b!1453301 m!1341795))

(push 1)

(assert (not b!1453287))

(assert (not b!1453299))

