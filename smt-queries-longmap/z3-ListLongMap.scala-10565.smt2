; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124530 () Bool)

(assert start!124530)

(declare-fun b!1441104 () Bool)

(declare-fun res!973513 () Bool)

(declare-fun e!812420 () Bool)

(assert (=> b!1441104 (=> (not res!973513) (not e!812420))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97978 0))(
  ( (array!97979 (arr!47277 (Array (_ BitVec 32) (_ BitVec 64))) (size!47827 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97978)

(assert (=> b!1441104 (= res!973513 (and (= (size!47827 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47827 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47827 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441105 () Bool)

(declare-fun res!973505 () Bool)

(assert (=> b!1441105 (=> (not res!973505) (not e!812420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441105 (= res!973505 (validKeyInArray!0 (select (arr!47277 a!2862) i!1006)))))

(declare-fun b!1441106 () Bool)

(declare-fun e!812419 () Bool)

(declare-fun e!812418 () Bool)

(assert (=> b!1441106 (= e!812419 e!812418)))

(declare-fun res!973506 () Bool)

(assert (=> b!1441106 (=> (not res!973506) (not e!812418))))

(declare-datatypes ((SeekEntryResult!11529 0))(
  ( (MissingZero!11529 (index!48508 (_ BitVec 32))) (Found!11529 (index!48509 (_ BitVec 32))) (Intermediate!11529 (undefined!12341 Bool) (index!48510 (_ BitVec 32)) (x!130226 (_ BitVec 32))) (Undefined!11529) (MissingVacant!11529 (index!48511 (_ BitVec 32))) )
))
(declare-fun lt!633113 () SeekEntryResult!11529)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441106 (= res!973506 (= lt!633113 (Intermediate!11529 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633110 () (_ BitVec 64))

(declare-fun lt!633114 () array!97978)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97978 (_ BitVec 32)) SeekEntryResult!11529)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441106 (= lt!633113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633110 mask!2687) lt!633110 lt!633114 mask!2687))))

(assert (=> b!1441106 (= lt!633110 (select (store (arr!47277 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441107 () Bool)

(declare-fun res!973510 () Bool)

(assert (=> b!1441107 (=> (not res!973510) (not e!812420))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441107 (= res!973510 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47827 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47827 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47827 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441108 () Bool)

(declare-fun res!973512 () Bool)

(assert (=> b!1441108 (=> (not res!973512) (not e!812419))))

(declare-fun lt!633111 () SeekEntryResult!11529)

(assert (=> b!1441108 (= res!973512 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47277 a!2862) j!93) a!2862 mask!2687) lt!633111))))

(declare-fun res!973503 () Bool)

(assert (=> start!124530 (=> (not res!973503) (not e!812420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124530 (= res!973503 (validMask!0 mask!2687))))

(assert (=> start!124530 e!812420))

(assert (=> start!124530 true))

(declare-fun array_inv!36305 (array!97978) Bool)

(assert (=> start!124530 (array_inv!36305 a!2862)))

(declare-fun e!812417 () Bool)

(declare-fun b!1441109 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97978 (_ BitVec 32)) SeekEntryResult!11529)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97978 (_ BitVec 32)) SeekEntryResult!11529)

(assert (=> b!1441109 (= e!812417 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633110 lt!633114 mask!2687) (seekEntryOrOpen!0 lt!633110 lt!633114 mask!2687))))))

(declare-fun b!1441110 () Bool)

(declare-fun e!812416 () Bool)

(assert (=> b!1441110 (= e!812416 e!812419)))

(declare-fun res!973508 () Bool)

(assert (=> b!1441110 (=> (not res!973508) (not e!812419))))

(assert (=> b!1441110 (= res!973508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47277 a!2862) j!93) mask!2687) (select (arr!47277 a!2862) j!93) a!2862 mask!2687) lt!633111))))

(assert (=> b!1441110 (= lt!633111 (Intermediate!11529 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441111 () Bool)

(assert (=> b!1441111 (= e!812418 false)))

(declare-fun lt!633112 () Bool)

(assert (=> b!1441111 (= lt!633112 e!812417)))

(declare-fun c!133311 () Bool)

(assert (=> b!1441111 (= c!133311 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441112 () Bool)

(declare-fun res!973511 () Bool)

(assert (=> b!1441112 (=> (not res!973511) (not e!812420))))

(declare-datatypes ((List!33778 0))(
  ( (Nil!33775) (Cons!33774 (h!35124 (_ BitVec 64)) (t!48472 List!33778)) )
))
(declare-fun arrayNoDuplicates!0 (array!97978 (_ BitVec 32) List!33778) Bool)

(assert (=> b!1441112 (= res!973511 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33775))))

(declare-fun b!1441113 () Bool)

(declare-fun res!973509 () Bool)

(assert (=> b!1441113 (=> (not res!973509) (not e!812420))))

(assert (=> b!1441113 (= res!973509 (validKeyInArray!0 (select (arr!47277 a!2862) j!93)))))

(declare-fun b!1441114 () Bool)

(declare-fun res!973507 () Bool)

(assert (=> b!1441114 (=> (not res!973507) (not e!812420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97978 (_ BitVec 32)) Bool)

(assert (=> b!1441114 (= res!973507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441115 () Bool)

(assert (=> b!1441115 (= e!812420 e!812416)))

(declare-fun res!973504 () Bool)

(assert (=> b!1441115 (=> (not res!973504) (not e!812416))))

(assert (=> b!1441115 (= res!973504 (= (select (store (arr!47277 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441115 (= lt!633114 (array!97979 (store (arr!47277 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47827 a!2862)))))

(declare-fun b!1441116 () Bool)

(assert (=> b!1441116 (= e!812417 (not (= lt!633113 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633110 lt!633114 mask!2687))))))

(assert (= (and start!124530 res!973503) b!1441104))

(assert (= (and b!1441104 res!973513) b!1441105))

(assert (= (and b!1441105 res!973505) b!1441113))

(assert (= (and b!1441113 res!973509) b!1441114))

(assert (= (and b!1441114 res!973507) b!1441112))

(assert (= (and b!1441112 res!973511) b!1441107))

(assert (= (and b!1441107 res!973510) b!1441115))

(assert (= (and b!1441115 res!973504) b!1441110))

(assert (= (and b!1441110 res!973508) b!1441108))

(assert (= (and b!1441108 res!973512) b!1441106))

(assert (= (and b!1441106 res!973506) b!1441111))

(assert (= (and b!1441111 c!133311) b!1441116))

(assert (= (and b!1441111 (not c!133311)) b!1441109))

(declare-fun m!1330335 () Bool)

(assert (=> b!1441116 m!1330335))

(declare-fun m!1330337 () Bool)

(assert (=> b!1441112 m!1330337))

(declare-fun m!1330339 () Bool)

(assert (=> b!1441105 m!1330339))

(assert (=> b!1441105 m!1330339))

(declare-fun m!1330341 () Bool)

(assert (=> b!1441105 m!1330341))

(declare-fun m!1330343 () Bool)

(assert (=> start!124530 m!1330343))

(declare-fun m!1330345 () Bool)

(assert (=> start!124530 m!1330345))

(declare-fun m!1330347 () Bool)

(assert (=> b!1441114 m!1330347))

(declare-fun m!1330349 () Bool)

(assert (=> b!1441113 m!1330349))

(assert (=> b!1441113 m!1330349))

(declare-fun m!1330351 () Bool)

(assert (=> b!1441113 m!1330351))

(declare-fun m!1330353 () Bool)

(assert (=> b!1441106 m!1330353))

(assert (=> b!1441106 m!1330353))

(declare-fun m!1330355 () Bool)

(assert (=> b!1441106 m!1330355))

(declare-fun m!1330357 () Bool)

(assert (=> b!1441106 m!1330357))

(declare-fun m!1330359 () Bool)

(assert (=> b!1441106 m!1330359))

(assert (=> b!1441115 m!1330357))

(declare-fun m!1330361 () Bool)

(assert (=> b!1441115 m!1330361))

(assert (=> b!1441108 m!1330349))

(assert (=> b!1441108 m!1330349))

(declare-fun m!1330363 () Bool)

(assert (=> b!1441108 m!1330363))

(declare-fun m!1330365 () Bool)

(assert (=> b!1441109 m!1330365))

(declare-fun m!1330367 () Bool)

(assert (=> b!1441109 m!1330367))

(assert (=> b!1441110 m!1330349))

(assert (=> b!1441110 m!1330349))

(declare-fun m!1330369 () Bool)

(assert (=> b!1441110 m!1330369))

(assert (=> b!1441110 m!1330369))

(assert (=> b!1441110 m!1330349))

(declare-fun m!1330371 () Bool)

(assert (=> b!1441110 m!1330371))

(check-sat (not start!124530) (not b!1441114) (not b!1441108) (not b!1441113) (not b!1441109) (not b!1441112) (not b!1441106) (not b!1441110) (not b!1441105) (not b!1441116))
(check-sat)
