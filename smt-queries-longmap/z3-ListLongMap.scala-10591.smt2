; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124902 () Bool)

(assert start!124902)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!814863 () Bool)

(declare-datatypes ((array!98245 0))(
  ( (array!98246 (arr!47407 (Array (_ BitVec 32) (_ BitVec 64))) (size!47958 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98245)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1446225 () Bool)

(assert (=> b!1446225 (= e!814863 (or (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47407 a!2862) intermediateBeforeIndex!19) (select (arr!47407 a!2862) j!93))))))

(declare-fun lt!634817 () array!98245)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814857 () Bool)

(declare-fun b!1446226 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!634818 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11556 0))(
  ( (MissingZero!11556 (index!48616 (_ BitVec 32))) (Found!11556 (index!48617 (_ BitVec 32))) (Intermediate!11556 (undefined!12368 Bool) (index!48618 (_ BitVec 32)) (x!130485 (_ BitVec 32))) (Undefined!11556) (MissingVacant!11556 (index!48619 (_ BitVec 32))) )
))
(declare-fun lt!634815 () SeekEntryResult!11556)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98245 (_ BitVec 32)) SeekEntryResult!11556)

(assert (=> b!1446226 (= e!814857 (= lt!634815 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634818 lt!634817 mask!2687)))))

(declare-fun b!1446227 () Bool)

(declare-fun res!977347 () Bool)

(declare-fun e!814861 () Bool)

(assert (=> b!1446227 (=> (not res!977347) (not e!814861))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446227 (= res!977347 (validKeyInArray!0 (select (arr!47407 a!2862) i!1006)))))

(declare-fun b!1446228 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98245 (_ BitVec 32)) SeekEntryResult!11556)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98245 (_ BitVec 32)) SeekEntryResult!11556)

(assert (=> b!1446228 (= e!814857 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634818 lt!634817 mask!2687) (seekEntryOrOpen!0 lt!634818 lt!634817 mask!2687)))))

(declare-fun b!1446229 () Bool)

(declare-fun e!814858 () Bool)

(assert (=> b!1446229 (= e!814861 e!814858)))

(declare-fun res!977346 () Bool)

(assert (=> b!1446229 (=> (not res!977346) (not e!814858))))

(assert (=> b!1446229 (= res!977346 (= (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446229 (= lt!634817 (array!98246 (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47958 a!2862)))))

(declare-fun res!977339 () Bool)

(assert (=> start!124902 (=> (not res!977339) (not e!814861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124902 (= res!977339 (validMask!0 mask!2687))))

(assert (=> start!124902 e!814861))

(assert (=> start!124902 true))

(declare-fun array_inv!36688 (array!98245) Bool)

(assert (=> start!124902 (array_inv!36688 a!2862)))

(declare-fun b!1446230 () Bool)

(declare-fun res!977338 () Bool)

(assert (=> b!1446230 (=> (not res!977338) (not e!814861))))

(assert (=> b!1446230 (= res!977338 (and (= (size!47958 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47958 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47958 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446231 () Bool)

(declare-fun e!814862 () Bool)

(assert (=> b!1446231 (= e!814858 e!814862)))

(declare-fun res!977342 () Bool)

(assert (=> b!1446231 (=> (not res!977342) (not e!814862))))

(declare-fun lt!634816 () SeekEntryResult!11556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446231 (= res!977342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47407 a!2862) j!93) mask!2687) (select (arr!47407 a!2862) j!93) a!2862 mask!2687) lt!634816))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1446231 (= lt!634816 (Intermediate!11556 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446232 () Bool)

(declare-fun res!977351 () Bool)

(assert (=> b!1446232 (=> (not res!977351) (not e!814861))))

(assert (=> b!1446232 (= res!977351 (validKeyInArray!0 (select (arr!47407 a!2862) j!93)))))

(declare-fun b!1446233 () Bool)

(declare-fun res!977345 () Bool)

(assert (=> b!1446233 (=> (not res!977345) (not e!814861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98245 (_ BitVec 32)) Bool)

(assert (=> b!1446233 (= res!977345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446234 () Bool)

(declare-fun res!977349 () Bool)

(assert (=> b!1446234 (=> (not res!977349) (not e!814861))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446234 (= res!977349 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47958 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47958 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47958 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446235 () Bool)

(declare-fun e!814859 () Bool)

(assert (=> b!1446235 (= e!814859 (not true))))

(assert (=> b!1446235 e!814863))

(declare-fun res!977341 () Bool)

(assert (=> b!1446235 (=> (not res!977341) (not e!814863))))

(assert (=> b!1446235 (= res!977341 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48641 0))(
  ( (Unit!48642) )
))
(declare-fun lt!634819 () Unit!48641)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48641)

(assert (=> b!1446235 (= lt!634819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446236 () Bool)

(declare-fun res!977337 () Bool)

(assert (=> b!1446236 (=> (not res!977337) (not e!814861))))

(declare-datatypes ((List!33895 0))(
  ( (Nil!33892) (Cons!33891 (h!35252 (_ BitVec 64)) (t!48581 List!33895)) )
))
(declare-fun arrayNoDuplicates!0 (array!98245 (_ BitVec 32) List!33895) Bool)

(assert (=> b!1446236 (= res!977337 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33892))))

(declare-fun b!1446237 () Bool)

(assert (=> b!1446237 (= e!814862 e!814859)))

(declare-fun res!977344 () Bool)

(assert (=> b!1446237 (=> (not res!977344) (not e!814859))))

(assert (=> b!1446237 (= res!977344 (= lt!634815 (Intermediate!11556 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446237 (= lt!634815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634818 mask!2687) lt!634818 lt!634817 mask!2687))))

(assert (=> b!1446237 (= lt!634818 (select (store (arr!47407 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446238 () Bool)

(declare-fun res!977350 () Bool)

(assert (=> b!1446238 (=> (not res!977350) (not e!814863))))

(assert (=> b!1446238 (= res!977350 (= (seekEntryOrOpen!0 (select (arr!47407 a!2862) j!93) a!2862 mask!2687) (Found!11556 j!93)))))

(declare-fun b!1446239 () Bool)

(declare-fun res!977343 () Bool)

(assert (=> b!1446239 (=> (not res!977343) (not e!814859))))

(assert (=> b!1446239 (= res!977343 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446240 () Bool)

(declare-fun res!977348 () Bool)

(assert (=> b!1446240 (=> (not res!977348) (not e!814859))))

(assert (=> b!1446240 (= res!977348 e!814857)))

(declare-fun c!133963 () Bool)

(assert (=> b!1446240 (= c!133963 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446241 () Bool)

(declare-fun res!977340 () Bool)

(assert (=> b!1446241 (=> (not res!977340) (not e!814862))))

(assert (=> b!1446241 (= res!977340 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47407 a!2862) j!93) a!2862 mask!2687) lt!634816))))

(assert (= (and start!124902 res!977339) b!1446230))

(assert (= (and b!1446230 res!977338) b!1446227))

(assert (= (and b!1446227 res!977347) b!1446232))

(assert (= (and b!1446232 res!977351) b!1446233))

(assert (= (and b!1446233 res!977345) b!1446236))

(assert (= (and b!1446236 res!977337) b!1446234))

(assert (= (and b!1446234 res!977349) b!1446229))

(assert (= (and b!1446229 res!977346) b!1446231))

(assert (= (and b!1446231 res!977342) b!1446241))

(assert (= (and b!1446241 res!977340) b!1446237))

(assert (= (and b!1446237 res!977344) b!1446240))

(assert (= (and b!1446240 c!133963) b!1446226))

(assert (= (and b!1446240 (not c!133963)) b!1446228))

(assert (= (and b!1446240 res!977348) b!1446239))

(assert (= (and b!1446239 res!977343) b!1446235))

(assert (= (and b!1446235 res!977341) b!1446238))

(assert (= (and b!1446238 res!977350) b!1446225))

(declare-fun m!1335337 () Bool)

(assert (=> b!1446238 m!1335337))

(assert (=> b!1446238 m!1335337))

(declare-fun m!1335339 () Bool)

(assert (=> b!1446238 m!1335339))

(declare-fun m!1335341 () Bool)

(assert (=> start!124902 m!1335341))

(declare-fun m!1335343 () Bool)

(assert (=> start!124902 m!1335343))

(declare-fun m!1335345 () Bool)

(assert (=> b!1446237 m!1335345))

(assert (=> b!1446237 m!1335345))

(declare-fun m!1335347 () Bool)

(assert (=> b!1446237 m!1335347))

(declare-fun m!1335349 () Bool)

(assert (=> b!1446237 m!1335349))

(declare-fun m!1335351 () Bool)

(assert (=> b!1446237 m!1335351))

(assert (=> b!1446231 m!1335337))

(assert (=> b!1446231 m!1335337))

(declare-fun m!1335353 () Bool)

(assert (=> b!1446231 m!1335353))

(assert (=> b!1446231 m!1335353))

(assert (=> b!1446231 m!1335337))

(declare-fun m!1335355 () Bool)

(assert (=> b!1446231 m!1335355))

(declare-fun m!1335357 () Bool)

(assert (=> b!1446227 m!1335357))

(assert (=> b!1446227 m!1335357))

(declare-fun m!1335359 () Bool)

(assert (=> b!1446227 m!1335359))

(declare-fun m!1335361 () Bool)

(assert (=> b!1446228 m!1335361))

(declare-fun m!1335363 () Bool)

(assert (=> b!1446228 m!1335363))

(declare-fun m!1335365 () Bool)

(assert (=> b!1446235 m!1335365))

(declare-fun m!1335367 () Bool)

(assert (=> b!1446235 m!1335367))

(assert (=> b!1446232 m!1335337))

(assert (=> b!1446232 m!1335337))

(declare-fun m!1335369 () Bool)

(assert (=> b!1446232 m!1335369))

(declare-fun m!1335371 () Bool)

(assert (=> b!1446225 m!1335371))

(assert (=> b!1446225 m!1335337))

(assert (=> b!1446229 m!1335349))

(declare-fun m!1335373 () Bool)

(assert (=> b!1446229 m!1335373))

(assert (=> b!1446241 m!1335337))

(assert (=> b!1446241 m!1335337))

(declare-fun m!1335375 () Bool)

(assert (=> b!1446241 m!1335375))

(declare-fun m!1335377 () Bool)

(assert (=> b!1446236 m!1335377))

(declare-fun m!1335379 () Bool)

(assert (=> b!1446233 m!1335379))

(declare-fun m!1335381 () Bool)

(assert (=> b!1446226 m!1335381))

(check-sat (not b!1446241) (not start!124902) (not b!1446228) (not b!1446238) (not b!1446226) (not b!1446232) (not b!1446233) (not b!1446227) (not b!1446237) (not b!1446231) (not b!1446236) (not b!1446235))
(check-sat)
