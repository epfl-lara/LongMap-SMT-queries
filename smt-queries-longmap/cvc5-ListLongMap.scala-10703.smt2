; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125356 () Bool)

(assert start!125356)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!823334 () Bool)

(declare-fun b!1465221 () Bool)

(declare-datatypes ((array!98804 0))(
  ( (array!98805 (arr!47690 (Array (_ BitVec 32) (_ BitVec 64))) (size!48240 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98804)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465221 (= e!823334 (or (= (select (arr!47690 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47690 a!2862) intermediateBeforeIndex!19) (select (arr!47690 a!2862) j!93))))))

(declare-fun b!1465222 () Bool)

(declare-fun res!994151 () Bool)

(declare-fun e!823338 () Bool)

(assert (=> b!1465222 (=> res!994151 e!823338)))

(declare-fun lt!641337 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11942 0))(
  ( (MissingZero!11942 (index!50160 (_ BitVec 32))) (Found!11942 (index!50161 (_ BitVec 32))) (Intermediate!11942 (undefined!12754 Bool) (index!50162 (_ BitVec 32)) (x!131743 (_ BitVec 32))) (Undefined!11942) (MissingVacant!11942 (index!50163 (_ BitVec 32))) )
))
(declare-fun lt!641336 () SeekEntryResult!11942)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98804 (_ BitVec 32)) SeekEntryResult!11942)

(assert (=> b!1465222 (= res!994151 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641337 (select (arr!47690 a!2862) j!93) a!2862 mask!2687) lt!641336)))))

(declare-fun b!1465223 () Bool)

(declare-fun e!823332 () Bool)

(declare-fun e!823335 () Bool)

(assert (=> b!1465223 (= e!823332 (not e!823335))))

(declare-fun res!994165 () Bool)

(assert (=> b!1465223 (=> res!994165 e!823335)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465223 (= res!994165 (or (and (= (select (arr!47690 a!2862) index!646) (select (store (arr!47690 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47690 a!2862) index!646) (select (arr!47690 a!2862) j!93))) (= (select (arr!47690 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465223 e!823334))

(declare-fun res!994155 () Bool)

(assert (=> b!1465223 (=> (not res!994155) (not e!823334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98804 (_ BitVec 32)) Bool)

(assert (=> b!1465223 (= res!994155 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49380 0))(
  ( (Unit!49381) )
))
(declare-fun lt!641338 () Unit!49380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49380)

(assert (=> b!1465223 (= lt!641338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465224 () Bool)

(declare-fun res!994160 () Bool)

(declare-fun e!823336 () Bool)

(assert (=> b!1465224 (=> (not res!994160) (not e!823336))))

(assert (=> b!1465224 (= res!994160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465225 () Bool)

(assert (=> b!1465225 (= e!823335 e!823338)))

(declare-fun res!994152 () Bool)

(assert (=> b!1465225 (=> res!994152 e!823338)))

(assert (=> b!1465225 (= res!994152 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641337 #b00000000000000000000000000000000) (bvsge lt!641337 (size!48240 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465225 (= lt!641337 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!641334 () array!98804)

(declare-fun lt!641339 () (_ BitVec 64))

(declare-fun e!823340 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1465226 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98804 (_ BitVec 32)) SeekEntryResult!11942)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98804 (_ BitVec 32)) SeekEntryResult!11942)

(assert (=> b!1465226 (= e!823340 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641339 lt!641334 mask!2687) (seekEntryOrOpen!0 lt!641339 lt!641334 mask!2687)))))

(declare-fun b!1465227 () Bool)

(declare-fun res!994154 () Bool)

(assert (=> b!1465227 (=> (not res!994154) (not e!823336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465227 (= res!994154 (validKeyInArray!0 (select (arr!47690 a!2862) i!1006)))))

(declare-fun b!1465228 () Bool)

(declare-fun res!994159 () Bool)

(assert (=> b!1465228 (=> (not res!994159) (not e!823332))))

(assert (=> b!1465228 (= res!994159 e!823340)))

(declare-fun c!135048 () Bool)

(assert (=> b!1465228 (= c!135048 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465229 () Bool)

(declare-fun res!994150 () Bool)

(assert (=> b!1465229 (=> (not res!994150) (not e!823336))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465229 (= res!994150 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48240 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48240 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48240 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!994158 () Bool)

(assert (=> start!125356 (=> (not res!994158) (not e!823336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125356 (= res!994158 (validMask!0 mask!2687))))

(assert (=> start!125356 e!823336))

(assert (=> start!125356 true))

(declare-fun array_inv!36718 (array!98804) Bool)

(assert (=> start!125356 (array_inv!36718 a!2862)))

(declare-fun b!1465230 () Bool)

(declare-fun e!823337 () Bool)

(declare-fun e!823339 () Bool)

(assert (=> b!1465230 (= e!823337 e!823339)))

(declare-fun res!994163 () Bool)

(assert (=> b!1465230 (=> (not res!994163) (not e!823339))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465230 (= res!994163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47690 a!2862) j!93) mask!2687) (select (arr!47690 a!2862) j!93) a!2862 mask!2687) lt!641336))))

(assert (=> b!1465230 (= lt!641336 (Intermediate!11942 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465231 () Bool)

(declare-fun res!994149 () Bool)

(assert (=> b!1465231 (=> (not res!994149) (not e!823336))))

(declare-datatypes ((List!34191 0))(
  ( (Nil!34188) (Cons!34187 (h!35537 (_ BitVec 64)) (t!48885 List!34191)) )
))
(declare-fun arrayNoDuplicates!0 (array!98804 (_ BitVec 32) List!34191) Bool)

(assert (=> b!1465231 (= res!994149 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34188))))

(declare-fun e!823333 () Bool)

(declare-fun b!1465232 () Bool)

(declare-fun lt!641340 () SeekEntryResult!11942)

(assert (=> b!1465232 (= e!823333 (not (= lt!641340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641337 lt!641339 lt!641334 mask!2687))))))

(declare-fun b!1465233 () Bool)

(assert (=> b!1465233 (= e!823333 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641337 intermediateAfterIndex!19 lt!641339 lt!641334 mask!2687) (seekEntryOrOpen!0 lt!641339 lt!641334 mask!2687))))))

(declare-fun b!1465234 () Bool)

(declare-fun res!994153 () Bool)

(assert (=> b!1465234 (=> (not res!994153) (not e!823334))))

(assert (=> b!1465234 (= res!994153 (= (seekEntryOrOpen!0 (select (arr!47690 a!2862) j!93) a!2862 mask!2687) (Found!11942 j!93)))))

(declare-fun b!1465235 () Bool)

(declare-fun res!994161 () Bool)

(assert (=> b!1465235 (=> (not res!994161) (not e!823332))))

(assert (=> b!1465235 (= res!994161 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465236 () Bool)

(assert (=> b!1465236 (= e!823339 e!823332)))

(declare-fun res!994162 () Bool)

(assert (=> b!1465236 (=> (not res!994162) (not e!823332))))

(assert (=> b!1465236 (= res!994162 (= lt!641340 (Intermediate!11942 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465236 (= lt!641340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641339 mask!2687) lt!641339 lt!641334 mask!2687))))

(assert (=> b!1465236 (= lt!641339 (select (store (arr!47690 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465237 () Bool)

(declare-fun res!994156 () Bool)

(assert (=> b!1465237 (=> (not res!994156) (not e!823336))))

(assert (=> b!1465237 (= res!994156 (and (= (size!48240 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48240 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48240 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465238 () Bool)

(declare-fun res!994164 () Bool)

(assert (=> b!1465238 (=> (not res!994164) (not e!823336))))

(assert (=> b!1465238 (= res!994164 (validKeyInArray!0 (select (arr!47690 a!2862) j!93)))))

(declare-fun b!1465239 () Bool)

(declare-fun res!994148 () Bool)

(assert (=> b!1465239 (=> (not res!994148) (not e!823339))))

(assert (=> b!1465239 (= res!994148 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47690 a!2862) j!93) a!2862 mask!2687) lt!641336))))

(declare-fun b!1465240 () Bool)

(assert (=> b!1465240 (= e!823340 (= lt!641340 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641339 lt!641334 mask!2687)))))

(declare-fun b!1465241 () Bool)

(assert (=> b!1465241 (= e!823336 e!823337)))

(declare-fun res!994157 () Bool)

(assert (=> b!1465241 (=> (not res!994157) (not e!823337))))

(assert (=> b!1465241 (= res!994157 (= (select (store (arr!47690 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465241 (= lt!641334 (array!98805 (store (arr!47690 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48240 a!2862)))))

(declare-fun b!1465242 () Bool)

(assert (=> b!1465242 (= e!823338 true)))

(declare-fun lt!641335 () Bool)

(assert (=> b!1465242 (= lt!641335 e!823333)))

(declare-fun c!135047 () Bool)

(assert (=> b!1465242 (= c!135047 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125356 res!994158) b!1465237))

(assert (= (and b!1465237 res!994156) b!1465227))

(assert (= (and b!1465227 res!994154) b!1465238))

(assert (= (and b!1465238 res!994164) b!1465224))

(assert (= (and b!1465224 res!994160) b!1465231))

(assert (= (and b!1465231 res!994149) b!1465229))

(assert (= (and b!1465229 res!994150) b!1465241))

(assert (= (and b!1465241 res!994157) b!1465230))

(assert (= (and b!1465230 res!994163) b!1465239))

(assert (= (and b!1465239 res!994148) b!1465236))

(assert (= (and b!1465236 res!994162) b!1465228))

(assert (= (and b!1465228 c!135048) b!1465240))

(assert (= (and b!1465228 (not c!135048)) b!1465226))

(assert (= (and b!1465228 res!994159) b!1465235))

(assert (= (and b!1465235 res!994161) b!1465223))

(assert (= (and b!1465223 res!994155) b!1465234))

(assert (= (and b!1465234 res!994153) b!1465221))

(assert (= (and b!1465223 (not res!994165)) b!1465225))

(assert (= (and b!1465225 (not res!994152)) b!1465222))

(assert (= (and b!1465222 (not res!994151)) b!1465242))

(assert (= (and b!1465242 c!135047) b!1465232))

(assert (= (and b!1465242 (not c!135047)) b!1465233))

(declare-fun m!1352341 () Bool)

(assert (=> b!1465227 m!1352341))

(assert (=> b!1465227 m!1352341))

(declare-fun m!1352343 () Bool)

(assert (=> b!1465227 m!1352343))

(declare-fun m!1352345 () Bool)

(assert (=> b!1465232 m!1352345))

(declare-fun m!1352347 () Bool)

(assert (=> b!1465236 m!1352347))

(assert (=> b!1465236 m!1352347))

(declare-fun m!1352349 () Bool)

(assert (=> b!1465236 m!1352349))

(declare-fun m!1352351 () Bool)

(assert (=> b!1465236 m!1352351))

(declare-fun m!1352353 () Bool)

(assert (=> b!1465236 m!1352353))

(declare-fun m!1352355 () Bool)

(assert (=> b!1465230 m!1352355))

(assert (=> b!1465230 m!1352355))

(declare-fun m!1352357 () Bool)

(assert (=> b!1465230 m!1352357))

(assert (=> b!1465230 m!1352357))

(assert (=> b!1465230 m!1352355))

(declare-fun m!1352359 () Bool)

(assert (=> b!1465230 m!1352359))

(declare-fun m!1352361 () Bool)

(assert (=> b!1465226 m!1352361))

(declare-fun m!1352363 () Bool)

(assert (=> b!1465226 m!1352363))

(declare-fun m!1352365 () Bool)

(assert (=> b!1465223 m!1352365))

(assert (=> b!1465223 m!1352351))

(declare-fun m!1352367 () Bool)

(assert (=> b!1465223 m!1352367))

(declare-fun m!1352369 () Bool)

(assert (=> b!1465223 m!1352369))

(declare-fun m!1352371 () Bool)

(assert (=> b!1465223 m!1352371))

(assert (=> b!1465223 m!1352355))

(assert (=> b!1465239 m!1352355))

(assert (=> b!1465239 m!1352355))

(declare-fun m!1352373 () Bool)

(assert (=> b!1465239 m!1352373))

(assert (=> b!1465234 m!1352355))

(assert (=> b!1465234 m!1352355))

(declare-fun m!1352375 () Bool)

(assert (=> b!1465234 m!1352375))

(declare-fun m!1352377 () Bool)

(assert (=> b!1465225 m!1352377))

(assert (=> b!1465222 m!1352355))

(assert (=> b!1465222 m!1352355))

(declare-fun m!1352379 () Bool)

(assert (=> b!1465222 m!1352379))

(declare-fun m!1352381 () Bool)

(assert (=> b!1465233 m!1352381))

(assert (=> b!1465233 m!1352363))

(declare-fun m!1352383 () Bool)

(assert (=> b!1465240 m!1352383))

(declare-fun m!1352385 () Bool)

(assert (=> b!1465221 m!1352385))

(assert (=> b!1465221 m!1352355))

(declare-fun m!1352387 () Bool)

(assert (=> start!125356 m!1352387))

(declare-fun m!1352389 () Bool)

(assert (=> start!125356 m!1352389))

(assert (=> b!1465241 m!1352351))

(declare-fun m!1352391 () Bool)

(assert (=> b!1465241 m!1352391))

(declare-fun m!1352393 () Bool)

(assert (=> b!1465224 m!1352393))

(assert (=> b!1465238 m!1352355))

(assert (=> b!1465238 m!1352355))

(declare-fun m!1352395 () Bool)

(assert (=> b!1465238 m!1352395))

(declare-fun m!1352397 () Bool)

(assert (=> b!1465231 m!1352397))

(push 1)

