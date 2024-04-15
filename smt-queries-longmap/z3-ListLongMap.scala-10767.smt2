; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125890 () Bool)

(assert start!125890)

(declare-fun b!1474322 () Bool)

(declare-fun res!1001646 () Bool)

(declare-fun e!827187 () Bool)

(assert (=> b!1474322 (=> (not res!1001646) (not e!827187))))

(declare-datatypes ((array!99145 0))(
  ( (array!99146 (arr!47857 (Array (_ BitVec 32) (_ BitVec 64))) (size!48409 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99145)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474322 (= res!1001646 (validKeyInArray!0 (select (arr!47857 a!2862) i!1006)))))

(declare-fun b!1474323 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!644040 () (_ BitVec 64))

(declare-fun lt!644039 () array!99145)

(declare-fun e!827193 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12122 0))(
  ( (MissingZero!12122 (index!50880 (_ BitVec 32))) (Found!12122 (index!50881 (_ BitVec 32))) (Intermediate!12122 (undefined!12934 Bool) (index!50882 (_ BitVec 32)) (x!132457 (_ BitVec 32))) (Undefined!12122) (MissingVacant!12122 (index!50883 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99145 (_ BitVec 32)) SeekEntryResult!12122)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99145 (_ BitVec 32)) SeekEntryResult!12122)

(assert (=> b!1474323 (= e!827193 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644040 lt!644039 mask!2687) (seekEntryOrOpen!0 lt!644040 lt!644039 mask!2687)))))

(declare-fun res!1001637 () Bool)

(assert (=> start!125890 (=> (not res!1001637) (not e!827187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125890 (= res!1001637 (validMask!0 mask!2687))))

(assert (=> start!125890 e!827187))

(assert (=> start!125890 true))

(declare-fun array_inv!37090 (array!99145) Bool)

(assert (=> start!125890 (array_inv!37090 a!2862)))

(declare-fun b!1474324 () Bool)

(declare-fun res!1001643 () Bool)

(assert (=> b!1474324 (=> (not res!1001643) (not e!827187))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1474324 (= res!1001643 (and (= (size!48409 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48409 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48409 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474325 () Bool)

(declare-fun res!1001639 () Bool)

(declare-fun e!827190 () Bool)

(assert (=> b!1474325 (=> (not res!1001639) (not e!827190))))

(assert (=> b!1474325 (= res!1001639 (= (seekEntryOrOpen!0 (select (arr!47857 a!2862) j!93) a!2862 mask!2687) (Found!12122 j!93)))))

(declare-fun b!1474326 () Bool)

(declare-fun res!1001641 () Bool)

(declare-fun e!827189 () Bool)

(assert (=> b!1474326 (=> (not res!1001641) (not e!827189))))

(declare-fun lt!644041 () SeekEntryResult!12122)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99145 (_ BitVec 32)) SeekEntryResult!12122)

(assert (=> b!1474326 (= res!1001641 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47857 a!2862) j!93) a!2862 mask!2687) lt!644041))))

(declare-fun b!1474327 () Bool)

(declare-fun res!1001634 () Bool)

(assert (=> b!1474327 (=> (not res!1001634) (not e!827187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99145 (_ BitVec 32)) Bool)

(assert (=> b!1474327 (= res!1001634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474328 () Bool)

(declare-fun res!1001636 () Bool)

(declare-fun e!827192 () Bool)

(assert (=> b!1474328 (=> (not res!1001636) (not e!827192))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474328 (= res!1001636 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474329 () Bool)

(declare-fun e!827188 () Bool)

(assert (=> b!1474329 (= e!827187 e!827188)))

(declare-fun res!1001640 () Bool)

(assert (=> b!1474329 (=> (not res!1001640) (not e!827188))))

(assert (=> b!1474329 (= res!1001640 (= (select (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1474329 (= lt!644039 (array!99146 (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48409 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1474330 () Bool)

(assert (=> b!1474330 (= e!827190 (or (= (select (arr!47857 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47857 a!2862) intermediateBeforeIndex!19) (select (arr!47857 a!2862) j!93))))))

(declare-fun b!1474331 () Bool)

(declare-fun res!1001635 () Bool)

(assert (=> b!1474331 (=> (not res!1001635) (not e!827192))))

(assert (=> b!1474331 (= res!1001635 e!827193)))

(declare-fun c!135862 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474331 (= c!135862 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474332 () Bool)

(assert (=> b!1474332 (= e!827189 e!827192)))

(declare-fun res!1001644 () Bool)

(assert (=> b!1474332 (=> (not res!1001644) (not e!827192))))

(declare-fun lt!644042 () SeekEntryResult!12122)

(assert (=> b!1474332 (= res!1001644 (= lt!644042 (Intermediate!12122 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474332 (= lt!644042 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644040 mask!2687) lt!644040 lt!644039 mask!2687))))

(assert (=> b!1474332 (= lt!644040 (select (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474333 () Bool)

(declare-fun res!1001633 () Bool)

(assert (=> b!1474333 (=> (not res!1001633) (not e!827187))))

(declare-datatypes ((List!34436 0))(
  ( (Nil!34433) (Cons!34432 (h!35791 (_ BitVec 64)) (t!49122 List!34436)) )
))
(declare-fun arrayNoDuplicates!0 (array!99145 (_ BitVec 32) List!34436) Bool)

(assert (=> b!1474333 (= res!1001633 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34433))))

(declare-fun b!1474334 () Bool)

(declare-fun res!1001645 () Bool)

(assert (=> b!1474334 (=> (not res!1001645) (not e!827187))))

(assert (=> b!1474334 (= res!1001645 (validKeyInArray!0 (select (arr!47857 a!2862) j!93)))))

(declare-fun b!1474335 () Bool)

(assert (=> b!1474335 (= e!827192 (not true))))

(assert (=> b!1474335 e!827190))

(declare-fun res!1001642 () Bool)

(assert (=> b!1474335 (=> (not res!1001642) (not e!827190))))

(assert (=> b!1474335 (= res!1001642 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49425 0))(
  ( (Unit!49426) )
))
(declare-fun lt!644043 () Unit!49425)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49425)

(assert (=> b!1474335 (= lt!644043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474336 () Bool)

(declare-fun res!1001638 () Bool)

(assert (=> b!1474336 (=> (not res!1001638) (not e!827187))))

(assert (=> b!1474336 (= res!1001638 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48409 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48409 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48409 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474337 () Bool)

(assert (=> b!1474337 (= e!827193 (= lt!644042 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644040 lt!644039 mask!2687)))))

(declare-fun b!1474338 () Bool)

(assert (=> b!1474338 (= e!827188 e!827189)))

(declare-fun res!1001647 () Bool)

(assert (=> b!1474338 (=> (not res!1001647) (not e!827189))))

(assert (=> b!1474338 (= res!1001647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47857 a!2862) j!93) mask!2687) (select (arr!47857 a!2862) j!93) a!2862 mask!2687) lt!644041))))

(assert (=> b!1474338 (= lt!644041 (Intermediate!12122 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125890 res!1001637) b!1474324))

(assert (= (and b!1474324 res!1001643) b!1474322))

(assert (= (and b!1474322 res!1001646) b!1474334))

(assert (= (and b!1474334 res!1001645) b!1474327))

(assert (= (and b!1474327 res!1001634) b!1474333))

(assert (= (and b!1474333 res!1001633) b!1474336))

(assert (= (and b!1474336 res!1001638) b!1474329))

(assert (= (and b!1474329 res!1001640) b!1474338))

(assert (= (and b!1474338 res!1001647) b!1474326))

(assert (= (and b!1474326 res!1001641) b!1474332))

(assert (= (and b!1474332 res!1001644) b!1474331))

(assert (= (and b!1474331 c!135862) b!1474337))

(assert (= (and b!1474331 (not c!135862)) b!1474323))

(assert (= (and b!1474331 res!1001635) b!1474328))

(assert (= (and b!1474328 res!1001636) b!1474335))

(assert (= (and b!1474335 res!1001642) b!1474325))

(assert (= (and b!1474325 res!1001639) b!1474330))

(declare-fun m!1360281 () Bool)

(assert (=> b!1474325 m!1360281))

(assert (=> b!1474325 m!1360281))

(declare-fun m!1360283 () Bool)

(assert (=> b!1474325 m!1360283))

(declare-fun m!1360285 () Bool)

(assert (=> start!125890 m!1360285))

(declare-fun m!1360287 () Bool)

(assert (=> start!125890 m!1360287))

(declare-fun m!1360289 () Bool)

(assert (=> b!1474329 m!1360289))

(declare-fun m!1360291 () Bool)

(assert (=> b!1474329 m!1360291))

(declare-fun m!1360293 () Bool)

(assert (=> b!1474332 m!1360293))

(assert (=> b!1474332 m!1360293))

(declare-fun m!1360295 () Bool)

(assert (=> b!1474332 m!1360295))

(assert (=> b!1474332 m!1360289))

(declare-fun m!1360297 () Bool)

(assert (=> b!1474332 m!1360297))

(assert (=> b!1474326 m!1360281))

(assert (=> b!1474326 m!1360281))

(declare-fun m!1360299 () Bool)

(assert (=> b!1474326 m!1360299))

(declare-fun m!1360301 () Bool)

(assert (=> b!1474322 m!1360301))

(assert (=> b!1474322 m!1360301))

(declare-fun m!1360303 () Bool)

(assert (=> b!1474322 m!1360303))

(declare-fun m!1360305 () Bool)

(assert (=> b!1474337 m!1360305))

(declare-fun m!1360307 () Bool)

(assert (=> b!1474327 m!1360307))

(declare-fun m!1360309 () Bool)

(assert (=> b!1474335 m!1360309))

(declare-fun m!1360311 () Bool)

(assert (=> b!1474335 m!1360311))

(assert (=> b!1474338 m!1360281))

(assert (=> b!1474338 m!1360281))

(declare-fun m!1360313 () Bool)

(assert (=> b!1474338 m!1360313))

(assert (=> b!1474338 m!1360313))

(assert (=> b!1474338 m!1360281))

(declare-fun m!1360315 () Bool)

(assert (=> b!1474338 m!1360315))

(assert (=> b!1474334 m!1360281))

(assert (=> b!1474334 m!1360281))

(declare-fun m!1360317 () Bool)

(assert (=> b!1474334 m!1360317))

(declare-fun m!1360319 () Bool)

(assert (=> b!1474330 m!1360319))

(assert (=> b!1474330 m!1360281))

(declare-fun m!1360321 () Bool)

(assert (=> b!1474323 m!1360321))

(declare-fun m!1360323 () Bool)

(assert (=> b!1474323 m!1360323))

(declare-fun m!1360325 () Bool)

(assert (=> b!1474333 m!1360325))

(check-sat (not b!1474323) (not b!1474335) (not b!1474326) (not b!1474322) (not b!1474334) (not b!1474337) (not b!1474333) (not start!125890) (not b!1474327) (not b!1474332) (not b!1474325) (not b!1474338))
(check-sat)
