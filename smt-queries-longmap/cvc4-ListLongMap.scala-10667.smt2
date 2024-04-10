; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125144 () Bool)

(assert start!125144)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639027 () (_ BitVec 64))

(declare-fun e!820324 () Bool)

(declare-fun b!1458396 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11836 0))(
  ( (MissingZero!11836 (index!49736 (_ BitVec 32))) (Found!11836 (index!49737 (_ BitVec 32))) (Intermediate!11836 (undefined!12648 Bool) (index!49738 (_ BitVec 32)) (x!131349 (_ BitVec 32))) (Undefined!11836) (MissingVacant!11836 (index!49739 (_ BitVec 32))) )
))
(declare-fun lt!639028 () SeekEntryResult!11836)

(declare-datatypes ((array!98592 0))(
  ( (array!98593 (arr!47584 (Array (_ BitVec 32) (_ BitVec 64))) (size!48134 (_ BitVec 32))) )
))
(declare-fun lt!639031 () array!98592)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98592 (_ BitVec 32)) SeekEntryResult!11836)

(assert (=> b!1458396 (= e!820324 (= lt!639028 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639027 lt!639031 mask!2687)))))

(declare-fun b!1458397 () Bool)

(declare-fun e!820326 () Bool)

(declare-fun lt!639026 () (_ BitVec 32))

(assert (=> b!1458397 (= e!820326 (not (= lt!639028 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639026 lt!639027 lt!639031 mask!2687))))))

(declare-fun b!1458398 () Bool)

(declare-fun e!820325 () Bool)

(declare-fun e!820329 () Bool)

(assert (=> b!1458398 (= e!820325 e!820329)))

(declare-fun res!988530 () Bool)

(assert (=> b!1458398 (=> res!988530 e!820329)))

(declare-fun a!2862 () array!98592)

(assert (=> b!1458398 (= res!988530 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639026 #b00000000000000000000000000000000) (bvsge lt!639026 (size!48134 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458398 (= lt!639026 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639033 () SeekEntryResult!11836)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98592 (_ BitVec 32)) SeekEntryResult!11836)

(assert (=> b!1458398 (= lt!639033 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639027 lt!639031 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98592 (_ BitVec 32)) SeekEntryResult!11836)

(assert (=> b!1458398 (= lt!639033 (seekEntryOrOpen!0 lt!639027 lt!639031 mask!2687))))

(declare-fun b!1458399 () Bool)

(declare-fun res!988531 () Bool)

(declare-fun e!820322 () Bool)

(assert (=> b!1458399 (=> (not res!988531) (not e!820322))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1458399 (= res!988531 (and (= (size!48134 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48134 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48134 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458400 () Bool)

(declare-fun res!988534 () Bool)

(declare-fun e!820327 () Bool)

(assert (=> b!1458400 (=> (not res!988534) (not e!820327))))

(assert (=> b!1458400 (= res!988534 (= (seekEntryOrOpen!0 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) (Found!11836 j!93)))))

(declare-fun b!1458401 () Bool)

(declare-fun res!988540 () Bool)

(declare-fun e!820323 () Bool)

(assert (=> b!1458401 (=> (not res!988540) (not e!820323))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1458401 (= res!988540 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458402 () Bool)

(declare-fun e!820328 () Bool)

(assert (=> b!1458402 (= e!820322 e!820328)))

(declare-fun res!988526 () Bool)

(assert (=> b!1458402 (=> (not res!988526) (not e!820328))))

(assert (=> b!1458402 (= res!988526 (= (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458402 (= lt!639031 (array!98593 (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48134 a!2862)))))

(declare-fun b!1458403 () Bool)

(declare-fun e!820330 () Bool)

(assert (=> b!1458403 (= e!820328 e!820330)))

(declare-fun res!988535 () Bool)

(assert (=> b!1458403 (=> (not res!988535) (not e!820330))))

(declare-fun lt!639030 () SeekEntryResult!11836)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458403 (= res!988535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47584 a!2862) j!93) mask!2687) (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!639030))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1458403 (= lt!639030 (Intermediate!11836 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458404 () Bool)

(declare-fun res!988533 () Bool)

(assert (=> b!1458404 (=> res!988533 e!820329)))

(assert (=> b!1458404 (= res!988533 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639026 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!639030)))))

(declare-fun b!1458405 () Bool)

(declare-fun res!988524 () Bool)

(assert (=> b!1458405 (=> (not res!988524) (not e!820322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458405 (= res!988524 (validKeyInArray!0 (select (arr!47584 a!2862) i!1006)))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1458406 () Bool)

(assert (=> b!1458406 (= e!820327 (and (or (= (select (arr!47584 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47584 a!2862) intermediateBeforeIndex!19) (select (arr!47584 a!2862) j!93))) (let ((bdg!53419 (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47584 a!2862) index!646) bdg!53419) (= (select (arr!47584 a!2862) index!646) (select (arr!47584 a!2862) j!93))) (= (select (arr!47584 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53419 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1458407 () Bool)

(assert (=> b!1458407 (= e!820323 (not e!820325))))

(declare-fun res!988529 () Bool)

(assert (=> b!1458407 (=> res!988529 e!820325)))

(assert (=> b!1458407 (= res!988529 (or (and (= (select (arr!47584 a!2862) index!646) (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47584 a!2862) index!646) (select (arr!47584 a!2862) j!93))) (= (select (arr!47584 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458407 e!820327))

(declare-fun res!988539 () Bool)

(assert (=> b!1458407 (=> (not res!988539) (not e!820327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98592 (_ BitVec 32)) Bool)

(assert (=> b!1458407 (= res!988539 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49168 0))(
  ( (Unit!49169) )
))
(declare-fun lt!639029 () Unit!49168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49168)

(assert (=> b!1458407 (= lt!639029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458408 () Bool)

(declare-fun res!988528 () Bool)

(assert (=> b!1458408 (=> (not res!988528) (not e!820330))))

(assert (=> b!1458408 (= res!988528 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47584 a!2862) j!93) a!2862 mask!2687) lt!639030))))

(declare-fun b!1458409 () Bool)

(assert (=> b!1458409 (= e!820329 true)))

(declare-fun lt!639032 () Bool)

(assert (=> b!1458409 (= lt!639032 e!820326)))

(declare-fun c!134448 () Bool)

(assert (=> b!1458409 (= c!134448 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458410 () Bool)

(assert (=> b!1458410 (= e!820330 e!820323)))

(declare-fun res!988538 () Bool)

(assert (=> b!1458410 (=> (not res!988538) (not e!820323))))

(assert (=> b!1458410 (= res!988538 (= lt!639028 (Intermediate!11836 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458410 (= lt!639028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639027 mask!2687) lt!639027 lt!639031 mask!2687))))

(assert (=> b!1458410 (= lt!639027 (select (store (arr!47584 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458411 () Bool)

(declare-fun res!988527 () Bool)

(assert (=> b!1458411 (=> (not res!988527) (not e!820322))))

(declare-datatypes ((List!34085 0))(
  ( (Nil!34082) (Cons!34081 (h!35431 (_ BitVec 64)) (t!48779 List!34085)) )
))
(declare-fun arrayNoDuplicates!0 (array!98592 (_ BitVec 32) List!34085) Bool)

(assert (=> b!1458411 (= res!988527 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34082))))

(declare-fun b!1458412 () Bool)

(declare-fun res!988537 () Bool)

(assert (=> b!1458412 (=> (not res!988537) (not e!820322))))

(assert (=> b!1458412 (= res!988537 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48134 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48134 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48134 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458413 () Bool)

(assert (=> b!1458413 (= e!820324 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639027 lt!639031 mask!2687) (seekEntryOrOpen!0 lt!639027 lt!639031 mask!2687)))))

(declare-fun b!1458414 () Bool)

(declare-fun res!988523 () Bool)

(assert (=> b!1458414 (=> (not res!988523) (not e!820323))))

(assert (=> b!1458414 (= res!988523 e!820324)))

(declare-fun c!134447 () Bool)

(assert (=> b!1458414 (= c!134447 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458415 () Bool)

(assert (=> b!1458415 (= e!820326 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639026 intermediateAfterIndex!19 lt!639027 lt!639031 mask!2687) lt!639033)))))

(declare-fun b!1458416 () Bool)

(declare-fun res!988532 () Bool)

(assert (=> b!1458416 (=> (not res!988532) (not e!820322))))

(assert (=> b!1458416 (= res!988532 (validKeyInArray!0 (select (arr!47584 a!2862) j!93)))))

(declare-fun b!1458417 () Bool)

(declare-fun res!988536 () Bool)

(assert (=> b!1458417 (=> (not res!988536) (not e!820322))))

(assert (=> b!1458417 (= res!988536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!988525 () Bool)

(assert (=> start!125144 (=> (not res!988525) (not e!820322))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125144 (= res!988525 (validMask!0 mask!2687))))

(assert (=> start!125144 e!820322))

(assert (=> start!125144 true))

(declare-fun array_inv!36612 (array!98592) Bool)

(assert (=> start!125144 (array_inv!36612 a!2862)))

(assert (= (and start!125144 res!988525) b!1458399))

(assert (= (and b!1458399 res!988531) b!1458405))

(assert (= (and b!1458405 res!988524) b!1458416))

(assert (= (and b!1458416 res!988532) b!1458417))

(assert (= (and b!1458417 res!988536) b!1458411))

(assert (= (and b!1458411 res!988527) b!1458412))

(assert (= (and b!1458412 res!988537) b!1458402))

(assert (= (and b!1458402 res!988526) b!1458403))

(assert (= (and b!1458403 res!988535) b!1458408))

(assert (= (and b!1458408 res!988528) b!1458410))

(assert (= (and b!1458410 res!988538) b!1458414))

(assert (= (and b!1458414 c!134447) b!1458396))

(assert (= (and b!1458414 (not c!134447)) b!1458413))

(assert (= (and b!1458414 res!988523) b!1458401))

(assert (= (and b!1458401 res!988540) b!1458407))

(assert (= (and b!1458407 res!988539) b!1458400))

(assert (= (and b!1458400 res!988534) b!1458406))

(assert (= (and b!1458407 (not res!988529)) b!1458398))

(assert (= (and b!1458398 (not res!988530)) b!1458404))

(assert (= (and b!1458404 (not res!988533)) b!1458409))

(assert (= (and b!1458409 c!134448) b!1458397))

(assert (= (and b!1458409 (not c!134448)) b!1458415))

(declare-fun m!1346259 () Bool)

(assert (=> b!1458408 m!1346259))

(assert (=> b!1458408 m!1346259))

(declare-fun m!1346261 () Bool)

(assert (=> b!1458408 m!1346261))

(declare-fun m!1346263 () Bool)

(assert (=> b!1458397 m!1346263))

(declare-fun m!1346265 () Bool)

(assert (=> b!1458417 m!1346265))

(declare-fun m!1346267 () Bool)

(assert (=> b!1458405 m!1346267))

(assert (=> b!1458405 m!1346267))

(declare-fun m!1346269 () Bool)

(assert (=> b!1458405 m!1346269))

(assert (=> b!1458400 m!1346259))

(assert (=> b!1458400 m!1346259))

(declare-fun m!1346271 () Bool)

(assert (=> b!1458400 m!1346271))

(declare-fun m!1346273 () Bool)

(assert (=> b!1458398 m!1346273))

(declare-fun m!1346275 () Bool)

(assert (=> b!1458398 m!1346275))

(declare-fun m!1346277 () Bool)

(assert (=> b!1458398 m!1346277))

(declare-fun m!1346279 () Bool)

(assert (=> b!1458415 m!1346279))

(declare-fun m!1346281 () Bool)

(assert (=> b!1458407 m!1346281))

(declare-fun m!1346283 () Bool)

(assert (=> b!1458407 m!1346283))

(declare-fun m!1346285 () Bool)

(assert (=> b!1458407 m!1346285))

(declare-fun m!1346287 () Bool)

(assert (=> b!1458407 m!1346287))

(declare-fun m!1346289 () Bool)

(assert (=> b!1458407 m!1346289))

(assert (=> b!1458407 m!1346259))

(assert (=> b!1458404 m!1346259))

(assert (=> b!1458404 m!1346259))

(declare-fun m!1346291 () Bool)

(assert (=> b!1458404 m!1346291))

(declare-fun m!1346293 () Bool)

(assert (=> start!125144 m!1346293))

(declare-fun m!1346295 () Bool)

(assert (=> start!125144 m!1346295))

(declare-fun m!1346297 () Bool)

(assert (=> b!1458396 m!1346297))

(assert (=> b!1458413 m!1346275))

(assert (=> b!1458413 m!1346277))

(assert (=> b!1458416 m!1346259))

(assert (=> b!1458416 m!1346259))

(declare-fun m!1346299 () Bool)

(assert (=> b!1458416 m!1346299))

(assert (=> b!1458402 m!1346283))

(declare-fun m!1346301 () Bool)

(assert (=> b!1458402 m!1346301))

(assert (=> b!1458406 m!1346283))

(declare-fun m!1346303 () Bool)

(assert (=> b!1458406 m!1346303))

(assert (=> b!1458406 m!1346285))

(assert (=> b!1458406 m!1346287))

(assert (=> b!1458406 m!1346259))

(assert (=> b!1458403 m!1346259))

(assert (=> b!1458403 m!1346259))

(declare-fun m!1346305 () Bool)

(assert (=> b!1458403 m!1346305))

(assert (=> b!1458403 m!1346305))

(assert (=> b!1458403 m!1346259))

(declare-fun m!1346307 () Bool)

(assert (=> b!1458403 m!1346307))

(declare-fun m!1346309 () Bool)

(assert (=> b!1458410 m!1346309))

(assert (=> b!1458410 m!1346309))

(declare-fun m!1346311 () Bool)

(assert (=> b!1458410 m!1346311))

(assert (=> b!1458410 m!1346283))

(declare-fun m!1346313 () Bool)

(assert (=> b!1458410 m!1346313))

(declare-fun m!1346315 () Bool)

(assert (=> b!1458411 m!1346315))

(push 1)

