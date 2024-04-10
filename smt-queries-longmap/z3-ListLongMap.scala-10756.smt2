; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125796 () Bool)

(assert start!125796)

(declare-fun res!1000128 () Bool)

(declare-fun e!826361 () Bool)

(assert (=> start!125796 (=> (not res!1000128) (not e!826361))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125796 (= res!1000128 (validMask!0 mask!2687))))

(assert (=> start!125796 e!826361))

(assert (=> start!125796 true))

(declare-datatypes ((array!99130 0))(
  ( (array!99131 (arr!47850 (Array (_ BitVec 32) (_ BitVec 64))) (size!48400 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99130)

(declare-fun array_inv!36878 (array!99130) Bool)

(assert (=> start!125796 (array_inv!36878 a!2862)))

(declare-fun b!1472468 () Bool)

(declare-fun res!1000137 () Bool)

(declare-fun e!826363 () Bool)

(assert (=> b!1472468 (=> (not res!1000137) (not e!826363))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472468 (= res!1000137 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472469 () Bool)

(declare-fun res!1000141 () Bool)

(assert (=> b!1472469 (=> (not res!1000141) (not e!826363))))

(declare-fun e!826362 () Bool)

(assert (=> b!1472469 (= res!1000141 e!826362)))

(declare-fun c!135684 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472469 (= c!135684 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472470 () Bool)

(declare-fun res!1000134 () Bool)

(assert (=> b!1472470 (=> (not res!1000134) (not e!826361))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472470 (= res!1000134 (validKeyInArray!0 (select (arr!47850 a!2862) j!93)))))

(declare-fun lt!643584 () array!99130)

(declare-fun b!1472471 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643583 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12090 0))(
  ( (MissingZero!12090 (index!50752 (_ BitVec 32))) (Found!12090 (index!50753 (_ BitVec 32))) (Intermediate!12090 (undefined!12902 Bool) (index!50754 (_ BitVec 32)) (x!132333 (_ BitVec 32))) (Undefined!12090) (MissingVacant!12090 (index!50755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99130 (_ BitVec 32)) SeekEntryResult!12090)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99130 (_ BitVec 32)) SeekEntryResult!12090)

(assert (=> b!1472471 (= e!826362 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643583 lt!643584 mask!2687) (seekEntryOrOpen!0 lt!643583 lt!643584 mask!2687)))))

(declare-fun b!1472472 () Bool)

(declare-fun e!826367 () Bool)

(declare-fun e!826364 () Bool)

(assert (=> b!1472472 (= e!826367 e!826364)))

(declare-fun res!1000129 () Bool)

(assert (=> b!1472472 (=> (not res!1000129) (not e!826364))))

(declare-fun lt!643580 () SeekEntryResult!12090)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99130 (_ BitVec 32)) SeekEntryResult!12090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472472 (= res!1000129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47850 a!2862) j!93) mask!2687) (select (arr!47850 a!2862) j!93) a!2862 mask!2687) lt!643580))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472472 (= lt!643580 (Intermediate!12090 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472473 () Bool)

(declare-fun res!1000138 () Bool)

(assert (=> b!1472473 (=> (not res!1000138) (not e!826361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99130 (_ BitVec 32)) Bool)

(assert (=> b!1472473 (= res!1000138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472474 () Bool)

(assert (=> b!1472474 (= e!826364 e!826363)))

(declare-fun res!1000131 () Bool)

(assert (=> b!1472474 (=> (not res!1000131) (not e!826363))))

(declare-fun lt!643581 () SeekEntryResult!12090)

(assert (=> b!1472474 (= res!1000131 (= lt!643581 (Intermediate!12090 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472474 (= lt!643581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643583 mask!2687) lt!643583 lt!643584 mask!2687))))

(assert (=> b!1472474 (= lt!643583 (select (store (arr!47850 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472475 () Bool)

(declare-fun res!1000127 () Bool)

(assert (=> b!1472475 (=> (not res!1000127) (not e!826361))))

(declare-datatypes ((List!34351 0))(
  ( (Nil!34348) (Cons!34347 (h!35703 (_ BitVec 64)) (t!49045 List!34351)) )
))
(declare-fun arrayNoDuplicates!0 (array!99130 (_ BitVec 32) List!34351) Bool)

(assert (=> b!1472475 (= res!1000127 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34348))))

(declare-fun b!1472476 () Bool)

(declare-fun res!1000135 () Bool)

(assert (=> b!1472476 (=> (not res!1000135) (not e!826361))))

(assert (=> b!1472476 (= res!1000135 (validKeyInArray!0 (select (arr!47850 a!2862) i!1006)))))

(declare-fun b!1472477 () Bool)

(declare-fun res!1000136 () Bool)

(assert (=> b!1472477 (=> (not res!1000136) (not e!826364))))

(assert (=> b!1472477 (= res!1000136 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47850 a!2862) j!93) a!2862 mask!2687) lt!643580))))

(declare-fun b!1472478 () Bool)

(assert (=> b!1472478 (= e!826363 (not true))))

(declare-fun e!826366 () Bool)

(assert (=> b!1472478 e!826366))

(declare-fun res!1000139 () Bool)

(assert (=> b!1472478 (=> (not res!1000139) (not e!826366))))

(assert (=> b!1472478 (= res!1000139 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49520 0))(
  ( (Unit!49521) )
))
(declare-fun lt!643582 () Unit!49520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49520)

(assert (=> b!1472478 (= lt!643582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472479 () Bool)

(declare-fun res!1000133 () Bool)

(assert (=> b!1472479 (=> (not res!1000133) (not e!826366))))

(assert (=> b!1472479 (= res!1000133 (= (seekEntryOrOpen!0 (select (arr!47850 a!2862) j!93) a!2862 mask!2687) (Found!12090 j!93)))))

(declare-fun b!1472480 () Bool)

(assert (=> b!1472480 (= e!826366 (or (= (select (arr!47850 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47850 a!2862) intermediateBeforeIndex!19) (select (arr!47850 a!2862) j!93))))))

(declare-fun b!1472481 () Bool)

(declare-fun res!1000140 () Bool)

(assert (=> b!1472481 (=> (not res!1000140) (not e!826361))))

(assert (=> b!1472481 (= res!1000140 (and (= (size!48400 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48400 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48400 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472482 () Bool)

(assert (=> b!1472482 (= e!826362 (= lt!643581 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643583 lt!643584 mask!2687)))))

(declare-fun b!1472483 () Bool)

(assert (=> b!1472483 (= e!826361 e!826367)))

(declare-fun res!1000130 () Bool)

(assert (=> b!1472483 (=> (not res!1000130) (not e!826367))))

(assert (=> b!1472483 (= res!1000130 (= (select (store (arr!47850 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472483 (= lt!643584 (array!99131 (store (arr!47850 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48400 a!2862)))))

(declare-fun b!1472484 () Bool)

(declare-fun res!1000132 () Bool)

(assert (=> b!1472484 (=> (not res!1000132) (not e!826361))))

(assert (=> b!1472484 (= res!1000132 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48400 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48400 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48400 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125796 res!1000128) b!1472481))

(assert (= (and b!1472481 res!1000140) b!1472476))

(assert (= (and b!1472476 res!1000135) b!1472470))

(assert (= (and b!1472470 res!1000134) b!1472473))

(assert (= (and b!1472473 res!1000138) b!1472475))

(assert (= (and b!1472475 res!1000127) b!1472484))

(assert (= (and b!1472484 res!1000132) b!1472483))

(assert (= (and b!1472483 res!1000130) b!1472472))

(assert (= (and b!1472472 res!1000129) b!1472477))

(assert (= (and b!1472477 res!1000136) b!1472474))

(assert (= (and b!1472474 res!1000131) b!1472469))

(assert (= (and b!1472469 c!135684) b!1472482))

(assert (= (and b!1472469 (not c!135684)) b!1472471))

(assert (= (and b!1472469 res!1000141) b!1472468))

(assert (= (and b!1472468 res!1000137) b!1472478))

(assert (= (and b!1472478 res!1000139) b!1472479))

(assert (= (and b!1472479 res!1000133) b!1472480))

(declare-fun m!1359179 () Bool)

(assert (=> b!1472472 m!1359179))

(assert (=> b!1472472 m!1359179))

(declare-fun m!1359181 () Bool)

(assert (=> b!1472472 m!1359181))

(assert (=> b!1472472 m!1359181))

(assert (=> b!1472472 m!1359179))

(declare-fun m!1359183 () Bool)

(assert (=> b!1472472 m!1359183))

(declare-fun m!1359185 () Bool)

(assert (=> b!1472474 m!1359185))

(assert (=> b!1472474 m!1359185))

(declare-fun m!1359187 () Bool)

(assert (=> b!1472474 m!1359187))

(declare-fun m!1359189 () Bool)

(assert (=> b!1472474 m!1359189))

(declare-fun m!1359191 () Bool)

(assert (=> b!1472474 m!1359191))

(declare-fun m!1359193 () Bool)

(assert (=> b!1472482 m!1359193))

(declare-fun m!1359195 () Bool)

(assert (=> b!1472480 m!1359195))

(assert (=> b!1472480 m!1359179))

(assert (=> b!1472477 m!1359179))

(assert (=> b!1472477 m!1359179))

(declare-fun m!1359197 () Bool)

(assert (=> b!1472477 m!1359197))

(declare-fun m!1359199 () Bool)

(assert (=> b!1472475 m!1359199))

(declare-fun m!1359201 () Bool)

(assert (=> b!1472471 m!1359201))

(declare-fun m!1359203 () Bool)

(assert (=> b!1472471 m!1359203))

(assert (=> b!1472479 m!1359179))

(assert (=> b!1472479 m!1359179))

(declare-fun m!1359205 () Bool)

(assert (=> b!1472479 m!1359205))

(declare-fun m!1359207 () Bool)

(assert (=> b!1472478 m!1359207))

(declare-fun m!1359209 () Bool)

(assert (=> b!1472478 m!1359209))

(declare-fun m!1359211 () Bool)

(assert (=> b!1472476 m!1359211))

(assert (=> b!1472476 m!1359211))

(declare-fun m!1359213 () Bool)

(assert (=> b!1472476 m!1359213))

(assert (=> b!1472483 m!1359189))

(declare-fun m!1359215 () Bool)

(assert (=> b!1472483 m!1359215))

(assert (=> b!1472470 m!1359179))

(assert (=> b!1472470 m!1359179))

(declare-fun m!1359217 () Bool)

(assert (=> b!1472470 m!1359217))

(declare-fun m!1359219 () Bool)

(assert (=> start!125796 m!1359219))

(declare-fun m!1359221 () Bool)

(assert (=> start!125796 m!1359221))

(declare-fun m!1359223 () Bool)

(assert (=> b!1472473 m!1359223))

(check-sat (not b!1472482) (not b!1472473) (not b!1472470) (not b!1472475) (not start!125796) (not b!1472478) (not b!1472477) (not b!1472476) (not b!1472471) (not b!1472479) (not b!1472472) (not b!1472474))
(check-sat)
