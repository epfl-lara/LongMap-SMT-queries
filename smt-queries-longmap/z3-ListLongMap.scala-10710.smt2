; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125676 () Bool)

(assert start!125676)

(declare-fun b!1468315 () Bool)

(declare-fun res!995909 () Bool)

(declare-fun e!824993 () Bool)

(assert (=> b!1468315 (=> (not res!995909) (not e!824993))))

(declare-fun e!824991 () Bool)

(assert (=> b!1468315 (= res!995909 e!824991)))

(declare-fun c!135733 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1468315 (= c!135733 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1468316 () Bool)

(declare-fun res!995908 () Bool)

(declare-fun e!824987 () Bool)

(assert (=> b!1468316 (=> (not res!995908) (not e!824987))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11913 0))(
  ( (MissingZero!11913 (index!50044 (_ BitVec 32))) (Found!11913 (index!50045 (_ BitVec 32))) (Intermediate!11913 (undefined!12725 Bool) (index!50046 (_ BitVec 32)) (x!131803 (_ BitVec 32))) (Undefined!11913) (MissingVacant!11913 (index!50047 (_ BitVec 32))) )
))
(declare-fun lt!642456 () SeekEntryResult!11913)

(declare-datatypes ((array!98962 0))(
  ( (array!98963 (arr!47764 (Array (_ BitVec 32) (_ BitVec 64))) (size!48315 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98962)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!11913)

(assert (=> b!1468316 (= res!995908 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642456))))

(declare-fun res!995896 () Bool)

(declare-fun e!824988 () Bool)

(assert (=> start!125676 (=> (not res!995896) (not e!824988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125676 (= res!995896 (validMask!0 mask!2687))))

(assert (=> start!125676 e!824988))

(assert (=> start!125676 true))

(declare-fun array_inv!37045 (array!98962) Bool)

(assert (=> start!125676 (array_inv!37045 a!2862)))

(declare-fun b!1468317 () Bool)

(declare-fun res!995905 () Bool)

(assert (=> b!1468317 (=> (not res!995905) (not e!824988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98962 (_ BitVec 32)) Bool)

(assert (=> b!1468317 (= res!995905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468318 () Bool)

(declare-fun res!995903 () Bool)

(assert (=> b!1468318 (=> (not res!995903) (not e!824988))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468318 (= res!995903 (validKeyInArray!0 (select (arr!47764 a!2862) i!1006)))))

(declare-fun e!824990 () Bool)

(declare-fun lt!642455 () SeekEntryResult!11913)

(declare-fun b!1468319 () Bool)

(declare-fun lt!642451 () array!98962)

(declare-fun lt!642457 () (_ BitVec 32))

(declare-fun lt!642453 () (_ BitVec 64))

(assert (=> b!1468319 (= e!824990 (not (= lt!642455 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642457 lt!642453 lt!642451 mask!2687))))))

(declare-fun b!1468320 () Bool)

(assert (=> b!1468320 (= e!824987 e!824993)))

(declare-fun res!995895 () Bool)

(assert (=> b!1468320 (=> (not res!995895) (not e!824993))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468320 (= res!995895 (= lt!642455 (Intermediate!11913 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468320 (= lt!642455 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642453 mask!2687) lt!642453 lt!642451 mask!2687))))

(assert (=> b!1468320 (= lt!642453 (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1468321 () Bool)

(declare-fun res!995907 () Bool)

(assert (=> b!1468321 (=> (not res!995907) (not e!824988))))

(assert (=> b!1468321 (= res!995907 (validKeyInArray!0 (select (arr!47764 a!2862) j!93)))))

(declare-fun b!1468322 () Bool)

(declare-fun res!995892 () Bool)

(assert (=> b!1468322 (=> (not res!995892) (not e!824988))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468322 (= res!995892 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48315 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48315 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48315 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1468323 () Bool)

(declare-fun e!824992 () Bool)

(declare-fun e!824989 () Bool)

(assert (=> b!1468323 (= e!824992 e!824989)))

(declare-fun res!995899 () Bool)

(assert (=> b!1468323 (=> res!995899 e!824989)))

(assert (=> b!1468323 (= res!995899 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642457 #b00000000000000000000000000000000) (bvsge lt!642457 (size!48315 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468323 (= lt!642457 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1468324 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!11913)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!11913)

(assert (=> b!1468324 (= e!824991 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642453 lt!642451 mask!2687) (seekEntryOrOpen!0 lt!642453 lt!642451 mask!2687)))))

(declare-fun b!1468325 () Bool)

(declare-fun res!995893 () Bool)

(assert (=> b!1468325 (=> res!995893 e!824989)))

(assert (=> b!1468325 (= res!995893 e!824990)))

(declare-fun c!135732 () Bool)

(assert (=> b!1468325 (= c!135732 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1468326 () Bool)

(declare-fun e!824986 () Bool)

(assert (=> b!1468326 (= e!824988 e!824986)))

(declare-fun res!995897 () Bool)

(assert (=> b!1468326 (=> (not res!995897) (not e!824986))))

(assert (=> b!1468326 (= res!995897 (= (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1468326 (= lt!642451 (array!98963 (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48315 a!2862)))))

(declare-fun b!1468327 () Bool)

(declare-fun res!995900 () Bool)

(assert (=> b!1468327 (=> res!995900 e!824989)))

(assert (=> b!1468327 (= res!995900 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1468328 () Bool)

(declare-fun res!995904 () Bool)

(assert (=> b!1468328 (=> (not res!995904) (not e!824988))))

(assert (=> b!1468328 (= res!995904 (and (= (size!48315 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48315 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48315 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468329 () Bool)

(declare-fun res!995902 () Bool)

(assert (=> b!1468329 (=> (not res!995902) (not e!824993))))

(assert (=> b!1468329 (= res!995902 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1468330 () Bool)

(assert (=> b!1468330 (= e!824986 e!824987)))

(declare-fun res!995894 () Bool)

(assert (=> b!1468330 (=> (not res!995894) (not e!824987))))

(assert (=> b!1468330 (= res!995894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47764 a!2862) j!93) mask!2687) (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642456))))

(assert (=> b!1468330 (= lt!642456 (Intermediate!11913 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468331 () Bool)

(assert (=> b!1468331 (= e!824989 true)))

(declare-fun lt!642452 () SeekEntryResult!11913)

(assert (=> b!1468331 (= lt!642452 (seekEntryOrOpen!0 lt!642453 lt!642451 mask!2687))))

(declare-datatypes ((Unit!49355 0))(
  ( (Unit!49356) )
))
(declare-fun lt!642450 () Unit!49355)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49355)

(assert (=> b!1468331 (= lt!642450 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642457 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1468332 () Bool)

(assert (=> b!1468332 (= e!824990 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642457 intermediateAfterIndex!19 lt!642453 lt!642451 mask!2687) (seekEntryOrOpen!0 lt!642453 lt!642451 mask!2687))))))

(declare-fun b!1468333 () Bool)

(declare-fun res!995898 () Bool)

(assert (=> b!1468333 (=> res!995898 e!824989)))

(assert (=> b!1468333 (= res!995898 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642457 (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642456)))))

(declare-fun b!1468334 () Bool)

(declare-fun res!995906 () Bool)

(assert (=> b!1468334 (=> (not res!995906) (not e!824988))))

(declare-datatypes ((List!34252 0))(
  ( (Nil!34249) (Cons!34248 (h!35612 (_ BitVec 64)) (t!48938 List!34252)) )
))
(declare-fun arrayNoDuplicates!0 (array!98962 (_ BitVec 32) List!34252) Bool)

(assert (=> b!1468334 (= res!995906 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34249))))

(declare-fun b!1468335 () Bool)

(assert (=> b!1468335 (= e!824991 (= lt!642455 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642453 lt!642451 mask!2687)))))

(declare-fun b!1468336 () Bool)

(assert (=> b!1468336 (= e!824993 (not e!824992))))

(declare-fun res!995901 () Bool)

(assert (=> b!1468336 (=> res!995901 e!824992)))

(assert (=> b!1468336 (= res!995901 (or (and (= (select (arr!47764 a!2862) index!646) (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47764 a!2862) index!646) (select (arr!47764 a!2862) j!93))) (= (select (arr!47764 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1468336 (and (= lt!642452 (Found!11913 j!93)) (or (= (select (arr!47764 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47764 a!2862) intermediateBeforeIndex!19) (select (arr!47764 a!2862) j!93))))))

(assert (=> b!1468336 (= lt!642452 (seekEntryOrOpen!0 (select (arr!47764 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1468336 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642454 () Unit!49355)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49355)

(assert (=> b!1468336 (= lt!642454 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125676 res!995896) b!1468328))

(assert (= (and b!1468328 res!995904) b!1468318))

(assert (= (and b!1468318 res!995903) b!1468321))

(assert (= (and b!1468321 res!995907) b!1468317))

(assert (= (and b!1468317 res!995905) b!1468334))

(assert (= (and b!1468334 res!995906) b!1468322))

(assert (= (and b!1468322 res!995892) b!1468326))

(assert (= (and b!1468326 res!995897) b!1468330))

(assert (= (and b!1468330 res!995894) b!1468316))

(assert (= (and b!1468316 res!995908) b!1468320))

(assert (= (and b!1468320 res!995895) b!1468315))

(assert (= (and b!1468315 c!135733) b!1468335))

(assert (= (and b!1468315 (not c!135733)) b!1468324))

(assert (= (and b!1468315 res!995909) b!1468329))

(assert (= (and b!1468329 res!995902) b!1468336))

(assert (= (and b!1468336 (not res!995901)) b!1468323))

(assert (= (and b!1468323 (not res!995899)) b!1468333))

(assert (= (and b!1468333 (not res!995898)) b!1468325))

(assert (= (and b!1468325 c!135732) b!1468319))

(assert (= (and b!1468325 (not c!135732)) b!1468332))

(assert (= (and b!1468325 (not res!995893)) b!1468327))

(assert (= (and b!1468327 (not res!995900)) b!1468331))

(declare-fun m!1355269 () Bool)

(assert (=> b!1468321 m!1355269))

(assert (=> b!1468321 m!1355269))

(declare-fun m!1355271 () Bool)

(assert (=> b!1468321 m!1355271))

(declare-fun m!1355273 () Bool)

(assert (=> b!1468334 m!1355273))

(declare-fun m!1355275 () Bool)

(assert (=> b!1468332 m!1355275))

(declare-fun m!1355277 () Bool)

(assert (=> b!1468332 m!1355277))

(declare-fun m!1355279 () Bool)

(assert (=> start!125676 m!1355279))

(declare-fun m!1355281 () Bool)

(assert (=> start!125676 m!1355281))

(assert (=> b!1468316 m!1355269))

(assert (=> b!1468316 m!1355269))

(declare-fun m!1355283 () Bool)

(assert (=> b!1468316 m!1355283))

(declare-fun m!1355285 () Bool)

(assert (=> b!1468335 m!1355285))

(declare-fun m!1355287 () Bool)

(assert (=> b!1468318 m!1355287))

(assert (=> b!1468318 m!1355287))

(declare-fun m!1355289 () Bool)

(assert (=> b!1468318 m!1355289))

(declare-fun m!1355291 () Bool)

(assert (=> b!1468323 m!1355291))

(assert (=> b!1468331 m!1355277))

(declare-fun m!1355293 () Bool)

(assert (=> b!1468331 m!1355293))

(assert (=> b!1468333 m!1355269))

(assert (=> b!1468333 m!1355269))

(declare-fun m!1355295 () Bool)

(assert (=> b!1468333 m!1355295))

(declare-fun m!1355297 () Bool)

(assert (=> b!1468326 m!1355297))

(declare-fun m!1355299 () Bool)

(assert (=> b!1468326 m!1355299))

(declare-fun m!1355301 () Bool)

(assert (=> b!1468324 m!1355301))

(assert (=> b!1468324 m!1355277))

(declare-fun m!1355303 () Bool)

(assert (=> b!1468320 m!1355303))

(assert (=> b!1468320 m!1355303))

(declare-fun m!1355305 () Bool)

(assert (=> b!1468320 m!1355305))

(assert (=> b!1468320 m!1355297))

(declare-fun m!1355307 () Bool)

(assert (=> b!1468320 m!1355307))

(assert (=> b!1468330 m!1355269))

(assert (=> b!1468330 m!1355269))

(declare-fun m!1355309 () Bool)

(assert (=> b!1468330 m!1355309))

(assert (=> b!1468330 m!1355309))

(assert (=> b!1468330 m!1355269))

(declare-fun m!1355311 () Bool)

(assert (=> b!1468330 m!1355311))

(declare-fun m!1355313 () Bool)

(assert (=> b!1468317 m!1355313))

(declare-fun m!1355315 () Bool)

(assert (=> b!1468319 m!1355315))

(declare-fun m!1355317 () Bool)

(assert (=> b!1468336 m!1355317))

(assert (=> b!1468336 m!1355297))

(declare-fun m!1355319 () Bool)

(assert (=> b!1468336 m!1355319))

(declare-fun m!1355321 () Bool)

(assert (=> b!1468336 m!1355321))

(declare-fun m!1355323 () Bool)

(assert (=> b!1468336 m!1355323))

(assert (=> b!1468336 m!1355269))

(declare-fun m!1355325 () Bool)

(assert (=> b!1468336 m!1355325))

(declare-fun m!1355327 () Bool)

(assert (=> b!1468336 m!1355327))

(assert (=> b!1468336 m!1355269))

(check-sat (not b!1468321) (not b!1468319) (not b!1468331) (not b!1468316) (not b!1468324) (not start!125676) (not b!1468320) (not b!1468330) (not b!1468318) (not b!1468323) (not b!1468317) (not b!1468334) (not b!1468335) (not b!1468333) (not b!1468332) (not b!1468336))
(check-sat)
