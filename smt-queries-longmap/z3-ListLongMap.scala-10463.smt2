; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123182 () Bool)

(assert start!123182)

(declare-fun b!1427556 () Bool)

(declare-fun res!962110 () Bool)

(declare-fun e!806516 () Bool)

(assert (=> b!1427556 (=> (not res!962110) (not e!806516))))

(declare-datatypes ((array!97418 0))(
  ( (array!97419 (arr!47023 (Array (_ BitVec 32) (_ BitVec 64))) (size!47574 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97418)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427556 (= res!962110 (validKeyInArray!0 (select (arr!47023 a!2831) j!81)))))

(declare-fun b!1427557 () Bool)

(declare-fun res!962104 () Bool)

(assert (=> b!1427557 (=> (not res!962104) (not e!806516))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427557 (= res!962104 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47574 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47574 a!2831))))))

(declare-fun res!962111 () Bool)

(assert (=> start!123182 (=> (not res!962111) (not e!806516))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123182 (= res!962111 (validMask!0 mask!2608))))

(assert (=> start!123182 e!806516))

(assert (=> start!123182 true))

(declare-fun array_inv!36304 (array!97418) Bool)

(assert (=> start!123182 (array_inv!36304 a!2831)))

(declare-fun b!1427558 () Bool)

(declare-fun res!962109 () Bool)

(declare-fun e!806513 () Bool)

(assert (=> b!1427558 (=> (not res!962109) (not e!806513))))

(declare-datatypes ((SeekEntryResult!11204 0))(
  ( (MissingZero!11204 (index!47208 (_ BitVec 32))) (Found!11204 (index!47209 (_ BitVec 32))) (Intermediate!11204 (undefined!12016 Bool) (index!47210 (_ BitVec 32)) (x!128999 (_ BitVec 32))) (Undefined!11204) (MissingVacant!11204 (index!47211 (_ BitVec 32))) )
))
(declare-fun lt!628553 () SeekEntryResult!11204)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97418 (_ BitVec 32)) SeekEntryResult!11204)

(assert (=> b!1427558 (= res!962109 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47023 a!2831) j!81) a!2831 mask!2608) lt!628553))))

(declare-fun b!1427559 () Bool)

(declare-fun res!962107 () Bool)

(assert (=> b!1427559 (=> (not res!962107) (not e!806516))))

(declare-datatypes ((List!33520 0))(
  ( (Nil!33517) (Cons!33516 (h!34829 (_ BitVec 64)) (t!48206 List!33520)) )
))
(declare-fun arrayNoDuplicates!0 (array!97418 (_ BitVec 32) List!33520) Bool)

(assert (=> b!1427559 (= res!962107 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33517))))

(declare-fun b!1427560 () Bool)

(declare-fun res!962105 () Bool)

(assert (=> b!1427560 (=> (not res!962105) (not e!806516))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427560 (= res!962105 (and (= (size!47574 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47574 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47574 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1427561 () Bool)

(declare-fun res!962106 () Bool)

(assert (=> b!1427561 (=> (not res!962106) (not e!806516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97418 (_ BitVec 32)) Bool)

(assert (=> b!1427561 (= res!962106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427562 () Bool)

(declare-fun e!806514 () Bool)

(assert (=> b!1427562 (= e!806516 e!806514)))

(declare-fun res!962112 () Bool)

(assert (=> b!1427562 (=> (not res!962112) (not e!806514))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427562 (= res!962112 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47023 a!2831) j!81) mask!2608) (select (arr!47023 a!2831) j!81) a!2831 mask!2608) lt!628553))))

(assert (=> b!1427562 (= lt!628553 (Intermediate!11204 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427563 () Bool)

(assert (=> b!1427563 (= e!806514 e!806513)))

(declare-fun res!962108 () Bool)

(assert (=> b!1427563 (=> (not res!962108) (not e!806513))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!628555 () (_ BitVec 64))

(declare-fun lt!628556 () array!97418)

(assert (=> b!1427563 (= res!962108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628555 mask!2608) lt!628555 lt!628556 mask!2608) (Intermediate!11204 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1427563 (= lt!628555 (select (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427563 (= lt!628556 (array!97419 (store (arr!47023 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47574 a!2831)))))

(declare-fun b!1427564 () Bool)

(declare-fun res!962113 () Bool)

(assert (=> b!1427564 (=> (not res!962113) (not e!806516))))

(assert (=> b!1427564 (= res!962113 (validKeyInArray!0 (select (arr!47023 a!2831) i!982)))))

(declare-fun b!1427565 () Bool)

(assert (=> b!1427565 (= e!806513 false)))

(declare-fun lt!628554 () SeekEntryResult!11204)

(assert (=> b!1427565 (= lt!628554 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628555 lt!628556 mask!2608))))

(assert (= (and start!123182 res!962111) b!1427560))

(assert (= (and b!1427560 res!962105) b!1427564))

(assert (= (and b!1427564 res!962113) b!1427556))

(assert (= (and b!1427556 res!962110) b!1427561))

(assert (= (and b!1427561 res!962106) b!1427559))

(assert (= (and b!1427559 res!962107) b!1427557))

(assert (= (and b!1427557 res!962104) b!1427562))

(assert (= (and b!1427562 res!962112) b!1427563))

(assert (= (and b!1427563 res!962108) b!1427558))

(assert (= (and b!1427558 res!962109) b!1427565))

(declare-fun m!1318281 () Bool)

(assert (=> b!1427564 m!1318281))

(assert (=> b!1427564 m!1318281))

(declare-fun m!1318283 () Bool)

(assert (=> b!1427564 m!1318283))

(declare-fun m!1318285 () Bool)

(assert (=> b!1427559 m!1318285))

(declare-fun m!1318287 () Bool)

(assert (=> start!123182 m!1318287))

(declare-fun m!1318289 () Bool)

(assert (=> start!123182 m!1318289))

(declare-fun m!1318291 () Bool)

(assert (=> b!1427565 m!1318291))

(declare-fun m!1318293 () Bool)

(assert (=> b!1427561 m!1318293))

(declare-fun m!1318295 () Bool)

(assert (=> b!1427562 m!1318295))

(assert (=> b!1427562 m!1318295))

(declare-fun m!1318297 () Bool)

(assert (=> b!1427562 m!1318297))

(assert (=> b!1427562 m!1318297))

(assert (=> b!1427562 m!1318295))

(declare-fun m!1318299 () Bool)

(assert (=> b!1427562 m!1318299))

(declare-fun m!1318301 () Bool)

(assert (=> b!1427563 m!1318301))

(assert (=> b!1427563 m!1318301))

(declare-fun m!1318303 () Bool)

(assert (=> b!1427563 m!1318303))

(declare-fun m!1318305 () Bool)

(assert (=> b!1427563 m!1318305))

(declare-fun m!1318307 () Bool)

(assert (=> b!1427563 m!1318307))

(assert (=> b!1427556 m!1318295))

(assert (=> b!1427556 m!1318295))

(declare-fun m!1318309 () Bool)

(assert (=> b!1427556 m!1318309))

(assert (=> b!1427558 m!1318295))

(assert (=> b!1427558 m!1318295))

(declare-fun m!1318311 () Bool)

(assert (=> b!1427558 m!1318311))

(check-sat (not start!123182) (not b!1427556) (not b!1427558) (not b!1427561) (not b!1427565) (not b!1427563) (not b!1427562) (not b!1427559) (not b!1427564))
(check-sat)
