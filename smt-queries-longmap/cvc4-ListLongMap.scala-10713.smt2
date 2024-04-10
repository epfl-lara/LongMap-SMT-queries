; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125420 () Bool)

(assert start!125420)

(declare-fun b!1467341 () Bool)

(declare-fun e!824234 () Bool)

(declare-fun e!824231 () Bool)

(assert (=> b!1467341 (= e!824234 e!824231)))

(declare-fun res!995902 () Bool)

(assert (=> b!1467341 (=> res!995902 e!824231)))

(declare-datatypes ((array!98868 0))(
  ( (array!98869 (arr!47722 (Array (_ BitVec 32) (_ BitVec 64))) (size!48272 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98868)

(declare-fun lt!642077 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1467341 (= res!995902 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642077 #b00000000000000000000000000000000) (bvsge lt!642077 (size!48272 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467341 (= lt!642077 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1467342 () Bool)

(declare-fun e!824229 () Bool)

(assert (=> b!1467342 (= e!824231 e!824229)))

(declare-fun res!995896 () Bool)

(assert (=> b!1467342 (=> res!995896 e!824229)))

(assert (=> b!1467342 (= res!995896 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!642079 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11974 0))(
  ( (MissingZero!11974 (index!50288 (_ BitVec 32))) (Found!11974 (index!50289 (_ BitVec 32))) (Intermediate!11974 (undefined!12786 Bool) (index!50290 (_ BitVec 32)) (x!131855 (_ BitVec 32))) (Undefined!11974) (MissingVacant!11974 (index!50291 (_ BitVec 32))) )
))
(declare-fun lt!642084 () SeekEntryResult!11974)

(declare-fun lt!642080 () array!98868)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98868 (_ BitVec 32)) SeekEntryResult!11974)

(assert (=> b!1467342 (= lt!642084 (seekEntryOrOpen!0 lt!642079 lt!642080 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49444 0))(
  ( (Unit!49445) )
))
(declare-fun lt!642081 () Unit!49444)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49444)

(assert (=> b!1467342 (= lt!642081 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642077 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467343 () Bool)

(declare-fun e!824236 () Bool)

(assert (=> b!1467343 (= e!824236 (not e!824234))))

(declare-fun res!995901 () Bool)

(assert (=> b!1467343 (=> res!995901 e!824234)))

(assert (=> b!1467343 (= res!995901 (or (and (= (select (arr!47722 a!2862) index!646) (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47722 a!2862) index!646) (select (arr!47722 a!2862) j!93))) (= (select (arr!47722 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467343 (and (= lt!642084 (Found!11974 j!93)) (or (= (select (arr!47722 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47722 a!2862) intermediateBeforeIndex!19) (select (arr!47722 a!2862) j!93))))))

(assert (=> b!1467343 (= lt!642084 (seekEntryOrOpen!0 (select (arr!47722 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98868 (_ BitVec 32)) Bool)

(assert (=> b!1467343 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642078 () Unit!49444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98868 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49444)

(assert (=> b!1467343 (= lt!642078 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467344 () Bool)

(declare-fun res!995886 () Bool)

(declare-fun e!824235 () Bool)

(assert (=> b!1467344 (=> (not res!995886) (not e!824235))))

(declare-fun lt!642082 () SeekEntryResult!11974)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98868 (_ BitVec 32)) SeekEntryResult!11974)

(assert (=> b!1467344 (= res!995886 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!642082))))

(declare-fun b!1467346 () Bool)

(declare-fun e!824230 () Bool)

(declare-fun e!824237 () Bool)

(assert (=> b!1467346 (= e!824230 e!824237)))

(declare-fun res!995888 () Bool)

(assert (=> b!1467346 (=> (not res!995888) (not e!824237))))

(assert (=> b!1467346 (= res!995888 (= (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467346 (= lt!642080 (array!98869 (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48272 a!2862)))))

(declare-fun b!1467347 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467347 (= e!824229 (validKeyInArray!0 lt!642079))))

(declare-fun b!1467348 () Bool)

(declare-fun res!995892 () Bool)

(assert (=> b!1467348 (=> (not res!995892) (not e!824236))))

(assert (=> b!1467348 (= res!995892 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467349 () Bool)

(declare-fun res!995887 () Bool)

(assert (=> b!1467349 (=> res!995887 e!824231)))

(assert (=> b!1467349 (= res!995887 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642077 (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!642082)))))

(declare-fun b!1467350 () Bool)

(declare-fun res!995889 () Bool)

(assert (=> b!1467350 (=> (not res!995889) (not e!824230))))

(assert (=> b!1467350 (= res!995889 (validKeyInArray!0 (select (arr!47722 a!2862) i!1006)))))

(declare-fun b!1467351 () Bool)

(declare-fun res!995897 () Bool)

(assert (=> b!1467351 (=> res!995897 e!824231)))

(declare-fun e!824233 () Bool)

(assert (=> b!1467351 (= res!995897 e!824233)))

(declare-fun c!135239 () Bool)

(assert (=> b!1467351 (= c!135239 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467352 () Bool)

(declare-fun lt!642083 () SeekEntryResult!11974)

(assert (=> b!1467352 (= e!824233 (not (= lt!642083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642077 lt!642079 lt!642080 mask!2687))))))

(declare-fun b!1467353 () Bool)

(declare-fun res!995891 () Bool)

(assert (=> b!1467353 (=> res!995891 e!824231)))

(assert (=> b!1467353 (= res!995891 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun e!824232 () Bool)

(declare-fun b!1467345 () Bool)

(assert (=> b!1467345 (= e!824232 (= lt!642083 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642079 lt!642080 mask!2687)))))

(declare-fun res!995884 () Bool)

(assert (=> start!125420 (=> (not res!995884) (not e!824230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125420 (= res!995884 (validMask!0 mask!2687))))

(assert (=> start!125420 e!824230))

(assert (=> start!125420 true))

(declare-fun array_inv!36750 (array!98868) Bool)

(assert (=> start!125420 (array_inv!36750 a!2862)))

(declare-fun b!1467354 () Bool)

(declare-fun res!995890 () Bool)

(assert (=> b!1467354 (=> (not res!995890) (not e!824230))))

(assert (=> b!1467354 (= res!995890 (validKeyInArray!0 (select (arr!47722 a!2862) j!93)))))

(declare-fun b!1467355 () Bool)

(declare-fun res!995899 () Bool)

(assert (=> b!1467355 (=> (not res!995899) (not e!824236))))

(assert (=> b!1467355 (= res!995899 e!824232)))

(declare-fun c!135240 () Bool)

(assert (=> b!1467355 (= c!135240 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1467356 () Bool)

(declare-fun res!995894 () Bool)

(assert (=> b!1467356 (=> (not res!995894) (not e!824230))))

(declare-datatypes ((List!34223 0))(
  ( (Nil!34220) (Cons!34219 (h!35569 (_ BitVec 64)) (t!48917 List!34223)) )
))
(declare-fun arrayNoDuplicates!0 (array!98868 (_ BitVec 32) List!34223) Bool)

(assert (=> b!1467356 (= res!995894 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34220))))

(declare-fun b!1467357 () Bool)

(assert (=> b!1467357 (= e!824235 e!824236)))

(declare-fun res!995900 () Bool)

(assert (=> b!1467357 (=> (not res!995900) (not e!824236))))

(assert (=> b!1467357 (= res!995900 (= lt!642083 (Intermediate!11974 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467357 (= lt!642083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642079 mask!2687) lt!642079 lt!642080 mask!2687))))

(assert (=> b!1467357 (= lt!642079 (select (store (arr!47722 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467358 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98868 (_ BitVec 32)) SeekEntryResult!11974)

(assert (=> b!1467358 (= e!824232 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642079 lt!642080 mask!2687) (seekEntryOrOpen!0 lt!642079 lt!642080 mask!2687)))))

(declare-fun b!1467359 () Bool)

(declare-fun res!995898 () Bool)

(assert (=> b!1467359 (=> (not res!995898) (not e!824230))))

(assert (=> b!1467359 (= res!995898 (and (= (size!48272 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48272 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48272 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467360 () Bool)

(declare-fun res!995885 () Bool)

(assert (=> b!1467360 (=> (not res!995885) (not e!824230))))

(assert (=> b!1467360 (= res!995885 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48272 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48272 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48272 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467361 () Bool)

(declare-fun res!995893 () Bool)

(assert (=> b!1467361 (=> (not res!995893) (not e!824230))))

(assert (=> b!1467361 (= res!995893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467362 () Bool)

(assert (=> b!1467362 (= e!824233 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642077 intermediateAfterIndex!19 lt!642079 lt!642080 mask!2687) (seekEntryOrOpen!0 lt!642079 lt!642080 mask!2687))))))

(declare-fun b!1467363 () Bool)

(assert (=> b!1467363 (= e!824237 e!824235)))

(declare-fun res!995895 () Bool)

(assert (=> b!1467363 (=> (not res!995895) (not e!824235))))

(assert (=> b!1467363 (= res!995895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47722 a!2862) j!93) mask!2687) (select (arr!47722 a!2862) j!93) a!2862 mask!2687) lt!642082))))

(assert (=> b!1467363 (= lt!642082 (Intermediate!11974 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125420 res!995884) b!1467359))

(assert (= (and b!1467359 res!995898) b!1467350))

(assert (= (and b!1467350 res!995889) b!1467354))

(assert (= (and b!1467354 res!995890) b!1467361))

(assert (= (and b!1467361 res!995893) b!1467356))

(assert (= (and b!1467356 res!995894) b!1467360))

(assert (= (and b!1467360 res!995885) b!1467346))

(assert (= (and b!1467346 res!995888) b!1467363))

(assert (= (and b!1467363 res!995895) b!1467344))

(assert (= (and b!1467344 res!995886) b!1467357))

(assert (= (and b!1467357 res!995900) b!1467355))

(assert (= (and b!1467355 c!135240) b!1467345))

(assert (= (and b!1467355 (not c!135240)) b!1467358))

(assert (= (and b!1467355 res!995899) b!1467348))

(assert (= (and b!1467348 res!995892) b!1467343))

(assert (= (and b!1467343 (not res!995901)) b!1467341))

(assert (= (and b!1467341 (not res!995902)) b!1467349))

(assert (= (and b!1467349 (not res!995887)) b!1467351))

(assert (= (and b!1467351 c!135239) b!1467352))

(assert (= (and b!1467351 (not c!135239)) b!1467362))

(assert (= (and b!1467351 (not res!995897)) b!1467353))

(assert (= (and b!1467353 (not res!995891)) b!1467342))

(assert (= (and b!1467342 (not res!995896)) b!1467347))

(declare-fun m!1354247 () Bool)

(assert (=> b!1467354 m!1354247))

(assert (=> b!1467354 m!1354247))

(declare-fun m!1354249 () Bool)

(assert (=> b!1467354 m!1354249))

(declare-fun m!1354251 () Bool)

(assert (=> b!1467352 m!1354251))

(declare-fun m!1354253 () Bool)

(assert (=> b!1467342 m!1354253))

(declare-fun m!1354255 () Bool)

(assert (=> b!1467342 m!1354255))

(assert (=> b!1467363 m!1354247))

(assert (=> b!1467363 m!1354247))

(declare-fun m!1354257 () Bool)

(assert (=> b!1467363 m!1354257))

(assert (=> b!1467363 m!1354257))

(assert (=> b!1467363 m!1354247))

(declare-fun m!1354259 () Bool)

(assert (=> b!1467363 m!1354259))

(assert (=> b!1467344 m!1354247))

(assert (=> b!1467344 m!1354247))

(declare-fun m!1354261 () Bool)

(assert (=> b!1467344 m!1354261))

(declare-fun m!1354263 () Bool)

(assert (=> start!125420 m!1354263))

(declare-fun m!1354265 () Bool)

(assert (=> start!125420 m!1354265))

(declare-fun m!1354267 () Bool)

(assert (=> b!1467345 m!1354267))

(declare-fun m!1354269 () Bool)

(assert (=> b!1467362 m!1354269))

(assert (=> b!1467362 m!1354253))

(declare-fun m!1354271 () Bool)

(assert (=> b!1467358 m!1354271))

(assert (=> b!1467358 m!1354253))

(declare-fun m!1354273 () Bool)

(assert (=> b!1467350 m!1354273))

(assert (=> b!1467350 m!1354273))

(declare-fun m!1354275 () Bool)

(assert (=> b!1467350 m!1354275))

(assert (=> b!1467349 m!1354247))

(assert (=> b!1467349 m!1354247))

(declare-fun m!1354277 () Bool)

(assert (=> b!1467349 m!1354277))

(declare-fun m!1354279 () Bool)

(assert (=> b!1467346 m!1354279))

(declare-fun m!1354281 () Bool)

(assert (=> b!1467346 m!1354281))

(declare-fun m!1354283 () Bool)

(assert (=> b!1467357 m!1354283))

(assert (=> b!1467357 m!1354283))

(declare-fun m!1354285 () Bool)

(assert (=> b!1467357 m!1354285))

(assert (=> b!1467357 m!1354279))

(declare-fun m!1354287 () Bool)

(assert (=> b!1467357 m!1354287))

(declare-fun m!1354289 () Bool)

(assert (=> b!1467347 m!1354289))

(declare-fun m!1354291 () Bool)

(assert (=> b!1467356 m!1354291))

(declare-fun m!1354293 () Bool)

(assert (=> b!1467341 m!1354293))

(declare-fun m!1354295 () Bool)

(assert (=> b!1467343 m!1354295))

(assert (=> b!1467343 m!1354279))

(declare-fun m!1354297 () Bool)

(assert (=> b!1467343 m!1354297))

(declare-fun m!1354299 () Bool)

(assert (=> b!1467343 m!1354299))

(declare-fun m!1354301 () Bool)

(assert (=> b!1467343 m!1354301))

(assert (=> b!1467343 m!1354247))

(declare-fun m!1354303 () Bool)

(assert (=> b!1467343 m!1354303))

(declare-fun m!1354305 () Bool)

(assert (=> b!1467343 m!1354305))

(assert (=> b!1467343 m!1354247))

(declare-fun m!1354307 () Bool)

(assert (=> b!1467361 m!1354307))

(push 1)

