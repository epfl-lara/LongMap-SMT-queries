; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124662 () Bool)

(assert start!124662)

(declare-fun b!1444324 () Bool)

(declare-fun res!976341 () Bool)

(declare-fun e!813787 () Bool)

(assert (=> b!1444324 (=> (not res!976341) (not e!813787))))

(declare-datatypes ((array!98110 0))(
  ( (array!98111 (arr!47343 (Array (_ BitVec 32) (_ BitVec 64))) (size!47893 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98110)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444324 (= res!976341 (validKeyInArray!0 (select (arr!47343 a!2862) i!1006)))))

(declare-fun b!1444326 () Bool)

(declare-fun res!976327 () Bool)

(assert (=> b!1444326 (=> (not res!976327) (not e!813787))))

(declare-datatypes ((List!33844 0))(
  ( (Nil!33841) (Cons!33840 (h!35190 (_ BitVec 64)) (t!48538 List!33844)) )
))
(declare-fun arrayNoDuplicates!0 (array!98110 (_ BitVec 32) List!33844) Bool)

(assert (=> b!1444326 (= res!976327 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33841))))

(declare-fun b!1444327 () Bool)

(declare-fun res!976335 () Bool)

(assert (=> b!1444327 (=> (not res!976335) (not e!813787))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444327 (= res!976335 (and (= (size!47893 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47893 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47893 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444328 () Bool)

(declare-fun res!976336 () Bool)

(declare-fun e!813785 () Bool)

(assert (=> b!1444328 (=> (not res!976336) (not e!813785))))

(declare-fun e!813790 () Bool)

(assert (=> b!1444328 (= res!976336 e!813790)))

(declare-fun c!133509 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444328 (= c!133509 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444329 () Bool)

(declare-fun res!976333 () Bool)

(assert (=> b!1444329 (=> (not res!976333) (not e!813785))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444329 (= res!976333 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444330 () Bool)

(declare-fun e!813789 () Bool)

(assert (=> b!1444330 (= e!813785 (not e!813789))))

(declare-fun res!976328 () Bool)

(assert (=> b!1444330 (=> res!976328 e!813789)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1444330 (= res!976328 (or (not (= (select (arr!47343 a!2862) index!646) (select (store (arr!47343 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47343 a!2862) index!646) (select (arr!47343 a!2862) j!93)))))))

(declare-fun e!813791 () Bool)

(assert (=> b!1444330 e!813791))

(declare-fun res!976331 () Bool)

(assert (=> b!1444330 (=> (not res!976331) (not e!813791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98110 (_ BitVec 32)) Bool)

(assert (=> b!1444330 (= res!976331 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48686 0))(
  ( (Unit!48687) )
))
(declare-fun lt!634160 () Unit!48686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48686)

(assert (=> b!1444330 (= lt!634160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444331 () Bool)

(declare-fun e!813788 () Bool)

(declare-fun e!813784 () Bool)

(assert (=> b!1444331 (= e!813788 e!813784)))

(declare-fun res!976334 () Bool)

(assert (=> b!1444331 (=> (not res!976334) (not e!813784))))

(declare-datatypes ((SeekEntryResult!11595 0))(
  ( (MissingZero!11595 (index!48772 (_ BitVec 32))) (Found!11595 (index!48773 (_ BitVec 32))) (Intermediate!11595 (undefined!12407 Bool) (index!48774 (_ BitVec 32)) (x!130468 (_ BitVec 32))) (Undefined!11595) (MissingVacant!11595 (index!48775 (_ BitVec 32))) )
))
(declare-fun lt!634161 () SeekEntryResult!11595)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98110 (_ BitVec 32)) SeekEntryResult!11595)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444331 (= res!976334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47343 a!2862) j!93) mask!2687) (select (arr!47343 a!2862) j!93) a!2862 mask!2687) lt!634161))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444331 (= lt!634161 (Intermediate!11595 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444332 () Bool)

(assert (=> b!1444332 (= e!813784 e!813785)))

(declare-fun res!976342 () Bool)

(assert (=> b!1444332 (=> (not res!976342) (not e!813785))))

(declare-fun lt!634164 () SeekEntryResult!11595)

(assert (=> b!1444332 (= res!976342 (= lt!634164 (Intermediate!11595 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634162 () (_ BitVec 64))

(declare-fun lt!634163 () array!98110)

(assert (=> b!1444332 (= lt!634164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634162 mask!2687) lt!634162 lt!634163 mask!2687))))

(assert (=> b!1444332 (= lt!634162 (select (store (arr!47343 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444333 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98110 (_ BitVec 32)) SeekEntryResult!11595)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98110 (_ BitVec 32)) SeekEntryResult!11595)

(assert (=> b!1444333 (= e!813790 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634162 lt!634163 mask!2687) (seekEntryOrOpen!0 lt!634162 lt!634163 mask!2687)))))

(declare-fun b!1444334 () Bool)

(declare-fun res!976329 () Bool)

(assert (=> b!1444334 (=> (not res!976329) (not e!813784))))

(assert (=> b!1444334 (= res!976329 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47343 a!2862) j!93) a!2862 mask!2687) lt!634161))))

(declare-fun b!1444335 () Bool)

(assert (=> b!1444335 (= e!813790 (= lt!634164 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634162 lt!634163 mask!2687)))))

(declare-fun b!1444336 () Bool)

(assert (=> b!1444336 (= e!813791 (or (= (select (arr!47343 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47343 a!2862) intermediateBeforeIndex!19) (select (arr!47343 a!2862) j!93))))))

(declare-fun b!1444337 () Bool)

(declare-fun res!976338 () Bool)

(assert (=> b!1444337 (=> (not res!976338) (not e!813791))))

(assert (=> b!1444337 (= res!976338 (= (seekEntryOrOpen!0 (select (arr!47343 a!2862) j!93) a!2862 mask!2687) (Found!11595 j!93)))))

(declare-fun b!1444338 () Bool)

(assert (=> b!1444338 (= e!813787 e!813788)))

(declare-fun res!976340 () Bool)

(assert (=> b!1444338 (=> (not res!976340) (not e!813788))))

(assert (=> b!1444338 (= res!976340 (= (select (store (arr!47343 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444338 (= lt!634163 (array!98111 (store (arr!47343 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47893 a!2862)))))

(declare-fun b!1444339 () Bool)

(declare-fun res!976337 () Bool)

(assert (=> b!1444339 (=> (not res!976337) (not e!813787))))

(assert (=> b!1444339 (= res!976337 (validKeyInArray!0 (select (arr!47343 a!2862) j!93)))))

(declare-fun b!1444325 () Bool)

(declare-fun res!976330 () Bool)

(assert (=> b!1444325 (=> (not res!976330) (not e!813787))))

(assert (=> b!1444325 (= res!976330 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47893 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47893 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47893 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!976332 () Bool)

(assert (=> start!124662 (=> (not res!976332) (not e!813787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124662 (= res!976332 (validMask!0 mask!2687))))

(assert (=> start!124662 e!813787))

(assert (=> start!124662 true))

(declare-fun array_inv!36371 (array!98110) Bool)

(assert (=> start!124662 (array_inv!36371 a!2862)))

(declare-fun b!1444340 () Bool)

(declare-fun res!976339 () Bool)

(assert (=> b!1444340 (=> (not res!976339) (not e!813787))))

(assert (=> b!1444340 (= res!976339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444341 () Bool)

(assert (=> b!1444341 (= e!813789 true)))

(declare-fun lt!634159 () SeekEntryResult!11595)

(assert (=> b!1444341 (= lt!634159 (seekEntryOrOpen!0 lt!634162 lt!634163 mask!2687))))

(assert (= (and start!124662 res!976332) b!1444327))

(assert (= (and b!1444327 res!976335) b!1444324))

(assert (= (and b!1444324 res!976341) b!1444339))

(assert (= (and b!1444339 res!976337) b!1444340))

(assert (= (and b!1444340 res!976339) b!1444326))

(assert (= (and b!1444326 res!976327) b!1444325))

(assert (= (and b!1444325 res!976330) b!1444338))

(assert (= (and b!1444338 res!976340) b!1444331))

(assert (= (and b!1444331 res!976334) b!1444334))

(assert (= (and b!1444334 res!976329) b!1444332))

(assert (= (and b!1444332 res!976342) b!1444328))

(assert (= (and b!1444328 c!133509) b!1444335))

(assert (= (and b!1444328 (not c!133509)) b!1444333))

(assert (= (and b!1444328 res!976336) b!1444329))

(assert (= (and b!1444329 res!976333) b!1444330))

(assert (= (and b!1444330 res!976331) b!1444337))

(assert (= (and b!1444337 res!976338) b!1444336))

(assert (= (and b!1444330 (not res!976328)) b!1444341))

(declare-fun m!1333353 () Bool)

(assert (=> b!1444331 m!1333353))

(assert (=> b!1444331 m!1333353))

(declare-fun m!1333355 () Bool)

(assert (=> b!1444331 m!1333355))

(assert (=> b!1444331 m!1333355))

(assert (=> b!1444331 m!1333353))

(declare-fun m!1333357 () Bool)

(assert (=> b!1444331 m!1333357))

(assert (=> b!1444337 m!1333353))

(assert (=> b!1444337 m!1333353))

(declare-fun m!1333359 () Bool)

(assert (=> b!1444337 m!1333359))

(declare-fun m!1333361 () Bool)

(assert (=> b!1444341 m!1333361))

(declare-fun m!1333363 () Bool)

(assert (=> b!1444338 m!1333363))

(declare-fun m!1333365 () Bool)

(assert (=> b!1444338 m!1333365))

(assert (=> b!1444334 m!1333353))

(assert (=> b!1444334 m!1333353))

(declare-fun m!1333367 () Bool)

(assert (=> b!1444334 m!1333367))

(declare-fun m!1333369 () Bool)

(assert (=> b!1444333 m!1333369))

(assert (=> b!1444333 m!1333361))

(declare-fun m!1333371 () Bool)

(assert (=> b!1444335 m!1333371))

(assert (=> b!1444339 m!1333353))

(assert (=> b!1444339 m!1333353))

(declare-fun m!1333373 () Bool)

(assert (=> b!1444339 m!1333373))

(declare-fun m!1333375 () Bool)

(assert (=> b!1444330 m!1333375))

(assert (=> b!1444330 m!1333363))

(declare-fun m!1333377 () Bool)

(assert (=> b!1444330 m!1333377))

(declare-fun m!1333379 () Bool)

(assert (=> b!1444330 m!1333379))

(declare-fun m!1333381 () Bool)

(assert (=> b!1444330 m!1333381))

(assert (=> b!1444330 m!1333353))

(declare-fun m!1333383 () Bool)

(assert (=> start!124662 m!1333383))

(declare-fun m!1333385 () Bool)

(assert (=> start!124662 m!1333385))

(declare-fun m!1333387 () Bool)

(assert (=> b!1444340 m!1333387))

(declare-fun m!1333389 () Bool)

(assert (=> b!1444326 m!1333389))

(declare-fun m!1333391 () Bool)

(assert (=> b!1444336 m!1333391))

(assert (=> b!1444336 m!1333353))

(declare-fun m!1333393 () Bool)

(assert (=> b!1444332 m!1333393))

(assert (=> b!1444332 m!1333393))

(declare-fun m!1333395 () Bool)

(assert (=> b!1444332 m!1333395))

(assert (=> b!1444332 m!1333363))

(declare-fun m!1333397 () Bool)

(assert (=> b!1444332 m!1333397))

(declare-fun m!1333399 () Bool)

(assert (=> b!1444324 m!1333399))

(assert (=> b!1444324 m!1333399))

(declare-fun m!1333401 () Bool)

(assert (=> b!1444324 m!1333401))

(check-sat (not start!124662) (not b!1444333) (not b!1444331) (not b!1444334) (not b!1444335) (not b!1444330) (not b!1444332) (not b!1444324) (not b!1444340) (not b!1444326) (not b!1444339) (not b!1444337) (not b!1444341))
(check-sat)
