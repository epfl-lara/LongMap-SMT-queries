; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124740 () Bool)

(assert start!124740)

(declare-fun b!1446326 () Bool)

(declare-fun e!814612 () Bool)

(assert (=> b!1446326 (= e!814612 (not true))))

(declare-fun e!814611 () Bool)

(assert (=> b!1446326 e!814611))

(declare-fun res!978104 () Bool)

(assert (=> b!1446326 (=> (not res!978104) (not e!814611))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98188 0))(
  ( (array!98189 (arr!47382 (Array (_ BitVec 32) (_ BitVec 64))) (size!47932 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98188)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98188 (_ BitVec 32)) Bool)

(assert (=> b!1446326 (= res!978104 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48764 0))(
  ( (Unit!48765) )
))
(declare-fun lt!634760 () Unit!48764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48764)

(assert (=> b!1446326 (= lt!634760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446327 () Bool)

(declare-fun e!814613 () Bool)

(assert (=> b!1446327 (= e!814613 e!814612)))

(declare-fun res!978107 () Bool)

(assert (=> b!1446327 (=> (not res!978107) (not e!814612))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11634 0))(
  ( (MissingZero!11634 (index!48928 (_ BitVec 32))) (Found!11634 (index!48929 (_ BitVec 32))) (Intermediate!11634 (undefined!12446 Bool) (index!48930 (_ BitVec 32)) (x!130611 (_ BitVec 32))) (Undefined!11634) (MissingVacant!11634 (index!48931 (_ BitVec 32))) )
))
(declare-fun lt!634759 () SeekEntryResult!11634)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446327 (= res!978107 (= lt!634759 (Intermediate!11634 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634757 () array!98188)

(declare-fun lt!634761 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98188 (_ BitVec 32)) SeekEntryResult!11634)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446327 (= lt!634759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634761 mask!2687) lt!634761 lt!634757 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1446327 (= lt!634761 (select (store (arr!47382 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446328 () Bool)

(declare-fun res!978102 () Bool)

(assert (=> b!1446328 (=> (not res!978102) (not e!814613))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!634758 () SeekEntryResult!11634)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1446328 (= res!978102 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47382 a!2862) j!93) a!2862 mask!2687) lt!634758))))

(declare-fun b!1446329 () Bool)

(declare-fun res!978098 () Bool)

(assert (=> b!1446329 (=> (not res!978098) (not e!814611))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98188 (_ BitVec 32)) SeekEntryResult!11634)

(assert (=> b!1446329 (= res!978098 (= (seekEntryOrOpen!0 (select (arr!47382 a!2862) j!93) a!2862 mask!2687) (Found!11634 j!93)))))

(declare-fun b!1446330 () Bool)

(declare-fun res!978100 () Bool)

(declare-fun e!814608 () Bool)

(assert (=> b!1446330 (=> (not res!978100) (not e!814608))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446330 (= res!978100 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47932 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47932 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47932 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446331 () Bool)

(declare-fun res!978096 () Bool)

(assert (=> b!1446331 (=> (not res!978096) (not e!814608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446331 (= res!978096 (validKeyInArray!0 (select (arr!47382 a!2862) j!93)))))

(declare-fun b!1446332 () Bool)

(declare-fun e!814607 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98188 (_ BitVec 32)) SeekEntryResult!11634)

(assert (=> b!1446332 (= e!814607 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634761 lt!634757 mask!2687) (seekEntryOrOpen!0 lt!634761 lt!634757 mask!2687)))))

(declare-fun res!978109 () Bool)

(assert (=> start!124740 (=> (not res!978109) (not e!814608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124740 (= res!978109 (validMask!0 mask!2687))))

(assert (=> start!124740 e!814608))

(assert (=> start!124740 true))

(declare-fun array_inv!36410 (array!98188) Bool)

(assert (=> start!124740 (array_inv!36410 a!2862)))

(declare-fun b!1446333 () Bool)

(declare-fun res!978099 () Bool)

(assert (=> b!1446333 (=> (not res!978099) (not e!814608))))

(declare-datatypes ((List!33883 0))(
  ( (Nil!33880) (Cons!33879 (h!35229 (_ BitVec 64)) (t!48577 List!33883)) )
))
(declare-fun arrayNoDuplicates!0 (array!98188 (_ BitVec 32) List!33883) Bool)

(assert (=> b!1446333 (= res!978099 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33880))))

(declare-fun b!1446334 () Bool)

(declare-fun res!978105 () Bool)

(assert (=> b!1446334 (=> (not res!978105) (not e!814608))))

(assert (=> b!1446334 (= res!978105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446335 () Bool)

(declare-fun res!978095 () Bool)

(assert (=> b!1446335 (=> (not res!978095) (not e!814608))))

(assert (=> b!1446335 (= res!978095 (validKeyInArray!0 (select (arr!47382 a!2862) i!1006)))))

(declare-fun b!1446336 () Bool)

(declare-fun res!978097 () Bool)

(assert (=> b!1446336 (=> (not res!978097) (not e!814608))))

(assert (=> b!1446336 (= res!978097 (and (= (size!47932 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47932 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47932 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446337 () Bool)

(declare-fun e!814610 () Bool)

(assert (=> b!1446337 (= e!814608 e!814610)))

(declare-fun res!978101 () Bool)

(assert (=> b!1446337 (=> (not res!978101) (not e!814610))))

(assert (=> b!1446337 (= res!978101 (= (select (store (arr!47382 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446337 (= lt!634757 (array!98189 (store (arr!47382 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47932 a!2862)))))

(declare-fun b!1446338 () Bool)

(assert (=> b!1446338 (= e!814611 (or (= (select (arr!47382 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47382 a!2862) intermediateBeforeIndex!19) (select (arr!47382 a!2862) j!93))))))

(declare-fun b!1446339 () Bool)

(declare-fun res!978106 () Bool)

(assert (=> b!1446339 (=> (not res!978106) (not e!814612))))

(assert (=> b!1446339 (= res!978106 e!814607)))

(declare-fun c!133626 () Bool)

(assert (=> b!1446339 (= c!133626 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446340 () Bool)

(assert (=> b!1446340 (= e!814610 e!814613)))

(declare-fun res!978103 () Bool)

(assert (=> b!1446340 (=> (not res!978103) (not e!814613))))

(assert (=> b!1446340 (= res!978103 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47382 a!2862) j!93) mask!2687) (select (arr!47382 a!2862) j!93) a!2862 mask!2687) lt!634758))))

(assert (=> b!1446340 (= lt!634758 (Intermediate!11634 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446341 () Bool)

(assert (=> b!1446341 (= e!814607 (= lt!634759 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634761 lt!634757 mask!2687)))))

(declare-fun b!1446342 () Bool)

(declare-fun res!978108 () Bool)

(assert (=> b!1446342 (=> (not res!978108) (not e!814612))))

(assert (=> b!1446342 (= res!978108 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124740 res!978109) b!1446336))

(assert (= (and b!1446336 res!978097) b!1446335))

(assert (= (and b!1446335 res!978095) b!1446331))

(assert (= (and b!1446331 res!978096) b!1446334))

(assert (= (and b!1446334 res!978105) b!1446333))

(assert (= (and b!1446333 res!978099) b!1446330))

(assert (= (and b!1446330 res!978100) b!1446337))

(assert (= (and b!1446337 res!978101) b!1446340))

(assert (= (and b!1446340 res!978103) b!1446328))

(assert (= (and b!1446328 res!978102) b!1446327))

(assert (= (and b!1446327 res!978107) b!1446339))

(assert (= (and b!1446339 c!133626) b!1446341))

(assert (= (and b!1446339 (not c!133626)) b!1446332))

(assert (= (and b!1446339 res!978106) b!1446342))

(assert (= (and b!1446342 res!978108) b!1446326))

(assert (= (and b!1446326 res!978104) b!1446329))

(assert (= (and b!1446329 res!978098) b!1446338))

(declare-fun m!1335209 () Bool)

(assert (=> b!1446333 m!1335209))

(declare-fun m!1335211 () Bool)

(assert (=> b!1446331 m!1335211))

(assert (=> b!1446331 m!1335211))

(declare-fun m!1335213 () Bool)

(assert (=> b!1446331 m!1335213))

(declare-fun m!1335215 () Bool)

(assert (=> b!1446341 m!1335215))

(assert (=> b!1446340 m!1335211))

(assert (=> b!1446340 m!1335211))

(declare-fun m!1335217 () Bool)

(assert (=> b!1446340 m!1335217))

(assert (=> b!1446340 m!1335217))

(assert (=> b!1446340 m!1335211))

(declare-fun m!1335219 () Bool)

(assert (=> b!1446340 m!1335219))

(declare-fun m!1335221 () Bool)

(assert (=> b!1446327 m!1335221))

(assert (=> b!1446327 m!1335221))

(declare-fun m!1335223 () Bool)

(assert (=> b!1446327 m!1335223))

(declare-fun m!1335225 () Bool)

(assert (=> b!1446327 m!1335225))

(declare-fun m!1335227 () Bool)

(assert (=> b!1446327 m!1335227))

(declare-fun m!1335229 () Bool)

(assert (=> b!1446335 m!1335229))

(assert (=> b!1446335 m!1335229))

(declare-fun m!1335231 () Bool)

(assert (=> b!1446335 m!1335231))

(declare-fun m!1335233 () Bool)

(assert (=> b!1446338 m!1335233))

(assert (=> b!1446338 m!1335211))

(declare-fun m!1335235 () Bool)

(assert (=> start!124740 m!1335235))

(declare-fun m!1335237 () Bool)

(assert (=> start!124740 m!1335237))

(assert (=> b!1446337 m!1335225))

(declare-fun m!1335239 () Bool)

(assert (=> b!1446337 m!1335239))

(assert (=> b!1446328 m!1335211))

(assert (=> b!1446328 m!1335211))

(declare-fun m!1335241 () Bool)

(assert (=> b!1446328 m!1335241))

(assert (=> b!1446329 m!1335211))

(assert (=> b!1446329 m!1335211))

(declare-fun m!1335243 () Bool)

(assert (=> b!1446329 m!1335243))

(declare-fun m!1335245 () Bool)

(assert (=> b!1446326 m!1335245))

(declare-fun m!1335247 () Bool)

(assert (=> b!1446326 m!1335247))

(declare-fun m!1335249 () Bool)

(assert (=> b!1446332 m!1335249))

(declare-fun m!1335251 () Bool)

(assert (=> b!1446332 m!1335251))

(declare-fun m!1335253 () Bool)

(assert (=> b!1446334 m!1335253))

(check-sat (not b!1446340) (not b!1446327) (not b!1446326) (not b!1446335) (not b!1446334) (not b!1446331) (not b!1446341) (not b!1446328) (not b!1446333) (not b!1446329) (not start!124740) (not b!1446332))
(check-sat)
