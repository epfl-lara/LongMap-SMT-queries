; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126368 () Bool)

(assert start!126368)

(declare-fun lt!646781 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1482118 () Bool)

(declare-fun e!831084 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12236 0))(
  ( (MissingZero!12236 (index!51336 (_ BitVec 32))) (Found!12236 (index!51337 (_ BitVec 32))) (Intermediate!12236 (undefined!13048 Bool) (index!51338 (_ BitVec 32)) (x!132912 (_ BitVec 32))) (Undefined!12236) (MissingVacant!12236 (index!51339 (_ BitVec 32))) )
))
(declare-fun lt!646782 () SeekEntryResult!12236)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!99385 0))(
  ( (array!99386 (arr!47971 (Array (_ BitVec 32) (_ BitVec 64))) (size!48523 (_ BitVec 32))) )
))
(declare-fun lt!646780 () array!99385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99385 (_ BitVec 32)) SeekEntryResult!12236)

(assert (=> b!1482118 (= e!831084 (= lt!646782 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646781 lt!646780 mask!2687)))))

(declare-fun b!1482119 () Bool)

(declare-fun res!1007551 () Bool)

(declare-fun e!831081 () Bool)

(assert (=> b!1482119 (=> (not res!1007551) (not e!831081))))

(declare-fun a!2862 () array!99385)

(declare-datatypes ((List!34550 0))(
  ( (Nil!34547) (Cons!34546 (h!35917 (_ BitVec 64)) (t!49236 List!34550)) )
))
(declare-fun arrayNoDuplicates!0 (array!99385 (_ BitVec 32) List!34550) Bool)

(assert (=> b!1482119 (= res!1007551 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34547))))

(declare-fun b!1482120 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99385 (_ BitVec 32)) SeekEntryResult!12236)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99385 (_ BitVec 32)) SeekEntryResult!12236)

(assert (=> b!1482120 (= e!831084 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646781 lt!646780 mask!2687) (seekEntryOrOpen!0 lt!646781 lt!646780 mask!2687)))))

(declare-fun b!1482121 () Bool)

(declare-fun e!831082 () Bool)

(declare-fun e!831086 () Bool)

(assert (=> b!1482121 (= e!831082 e!831086)))

(declare-fun res!1007557 () Bool)

(assert (=> b!1482121 (=> (not res!1007557) (not e!831086))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1482121 (= res!1007557 (= lt!646782 (Intermediate!12236 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482121 (= lt!646782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646781 mask!2687) lt!646781 lt!646780 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1482121 (= lt!646781 (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!831080 () Bool)

(declare-fun b!1482122 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1482122 (= e!831080 (and (or (= (select (arr!47971 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47971 a!2862) intermediateBeforeIndex!19) (select (arr!47971 a!2862) j!93))) (let ((bdg!54266 (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47971 a!2862) index!646) bdg!54266) (= (select (arr!47971 a!2862) index!646) (select (arr!47971 a!2862) j!93))) (= (select (arr!47971 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54266 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1482123 () Bool)

(declare-fun res!1007549 () Bool)

(assert (=> b!1482123 (=> (not res!1007549) (not e!831081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99385 (_ BitVec 32)) Bool)

(assert (=> b!1482123 (= res!1007549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1482124 () Bool)

(declare-fun res!1007556 () Bool)

(assert (=> b!1482124 (=> (not res!1007556) (not e!831086))))

(assert (=> b!1482124 (= res!1007556 e!831084)))

(declare-fun c!136810 () Bool)

(assert (=> b!1482124 (= c!136810 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1007550 () Bool)

(assert (=> start!126368 (=> (not res!1007550) (not e!831081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126368 (= res!1007550 (validMask!0 mask!2687))))

(assert (=> start!126368 e!831081))

(assert (=> start!126368 true))

(declare-fun array_inv!37204 (array!99385) Bool)

(assert (=> start!126368 (array_inv!37204 a!2862)))

(declare-fun b!1482125 () Bool)

(declare-fun res!1007552 () Bool)

(assert (=> b!1482125 (=> (not res!1007552) (not e!831081))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1482125 (= res!1007552 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48523 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48523 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48523 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1482126 () Bool)

(declare-fun e!831083 () Bool)

(assert (=> b!1482126 (= e!831083 e!831082)))

(declare-fun res!1007545 () Bool)

(assert (=> b!1482126 (=> (not res!1007545) (not e!831082))))

(declare-fun lt!646783 () SeekEntryResult!12236)

(assert (=> b!1482126 (= res!1007545 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646783))))

(assert (=> b!1482126 (= lt!646783 (Intermediate!12236 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1482127 () Bool)

(declare-fun e!831085 () Bool)

(assert (=> b!1482127 (= e!831085 (= (seekEntryOrOpen!0 lt!646781 lt!646780 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646781 lt!646780 mask!2687)))))

(declare-fun b!1482128 () Bool)

(declare-fun res!1007558 () Bool)

(assert (=> b!1482128 (=> (not res!1007558) (not e!831086))))

(assert (=> b!1482128 (= res!1007558 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1482129 () Bool)

(assert (=> b!1482129 (= e!831081 e!831083)))

(declare-fun res!1007553 () Bool)

(assert (=> b!1482129 (=> (not res!1007553) (not e!831083))))

(assert (=> b!1482129 (= res!1007553 (= (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482129 (= lt!646780 (array!99386 (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48523 a!2862)))))

(declare-fun b!1482130 () Bool)

(assert (=> b!1482130 (= e!831086 (not e!831085))))

(declare-fun res!1007554 () Bool)

(assert (=> b!1482130 (=> res!1007554 e!831085)))

(assert (=> b!1482130 (= res!1007554 (or (and (= (select (arr!47971 a!2862) index!646) (select (store (arr!47971 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47971 a!2862) index!646) (select (arr!47971 a!2862) j!93))) (= (select (arr!47971 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1482130 e!831080))

(declare-fun res!1007555 () Bool)

(assert (=> b!1482130 (=> (not res!1007555) (not e!831080))))

(assert (=> b!1482130 (= res!1007555 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49653 0))(
  ( (Unit!49654) )
))
(declare-fun lt!646784 () Unit!49653)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49653)

(assert (=> b!1482130 (= lt!646784 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1482131 () Bool)

(declare-fun res!1007547 () Bool)

(assert (=> b!1482131 (=> (not res!1007547) (not e!831082))))

(assert (=> b!1482131 (= res!1007547 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646783))))

(declare-fun b!1482132 () Bool)

(declare-fun res!1007559 () Bool)

(assert (=> b!1482132 (=> (not res!1007559) (not e!831081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1482132 (= res!1007559 (validKeyInArray!0 (select (arr!47971 a!2862) i!1006)))))

(declare-fun b!1482133 () Bool)

(declare-fun res!1007560 () Bool)

(assert (=> b!1482133 (=> (not res!1007560) (not e!831080))))

(assert (=> b!1482133 (= res!1007560 (= (seekEntryOrOpen!0 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) (Found!12236 j!93)))))

(declare-fun b!1482134 () Bool)

(declare-fun res!1007546 () Bool)

(assert (=> b!1482134 (=> (not res!1007546) (not e!831081))))

(assert (=> b!1482134 (= res!1007546 (validKeyInArray!0 (select (arr!47971 a!2862) j!93)))))

(declare-fun b!1482135 () Bool)

(declare-fun res!1007548 () Bool)

(assert (=> b!1482135 (=> (not res!1007548) (not e!831081))))

(assert (=> b!1482135 (= res!1007548 (and (= (size!48523 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48523 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48523 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!126368 res!1007550) b!1482135))

(assert (= (and b!1482135 res!1007548) b!1482132))

(assert (= (and b!1482132 res!1007559) b!1482134))

(assert (= (and b!1482134 res!1007546) b!1482123))

(assert (= (and b!1482123 res!1007549) b!1482119))

(assert (= (and b!1482119 res!1007551) b!1482125))

(assert (= (and b!1482125 res!1007552) b!1482129))

(assert (= (and b!1482129 res!1007553) b!1482126))

(assert (= (and b!1482126 res!1007545) b!1482131))

(assert (= (and b!1482131 res!1007547) b!1482121))

(assert (= (and b!1482121 res!1007557) b!1482124))

(assert (= (and b!1482124 c!136810) b!1482118))

(assert (= (and b!1482124 (not c!136810)) b!1482120))

(assert (= (and b!1482124 res!1007556) b!1482128))

(assert (= (and b!1482128 res!1007558) b!1482130))

(assert (= (and b!1482130 res!1007555) b!1482133))

(assert (= (and b!1482133 res!1007560) b!1482122))

(assert (= (and b!1482130 (not res!1007554)) b!1482127))

(declare-fun m!1367301 () Bool)

(assert (=> b!1482132 m!1367301))

(assert (=> b!1482132 m!1367301))

(declare-fun m!1367303 () Bool)

(assert (=> b!1482132 m!1367303))

(declare-fun m!1367305 () Bool)

(assert (=> b!1482120 m!1367305))

(declare-fun m!1367307 () Bool)

(assert (=> b!1482120 m!1367307))

(assert (=> b!1482127 m!1367307))

(assert (=> b!1482127 m!1367305))

(declare-fun m!1367309 () Bool)

(assert (=> b!1482123 m!1367309))

(declare-fun m!1367311 () Bool)

(assert (=> b!1482131 m!1367311))

(assert (=> b!1482131 m!1367311))

(declare-fun m!1367313 () Bool)

(assert (=> b!1482131 m!1367313))

(declare-fun m!1367315 () Bool)

(assert (=> b!1482118 m!1367315))

(declare-fun m!1367317 () Bool)

(assert (=> b!1482130 m!1367317))

(declare-fun m!1367319 () Bool)

(assert (=> b!1482130 m!1367319))

(declare-fun m!1367321 () Bool)

(assert (=> b!1482130 m!1367321))

(declare-fun m!1367323 () Bool)

(assert (=> b!1482130 m!1367323))

(declare-fun m!1367325 () Bool)

(assert (=> b!1482130 m!1367325))

(assert (=> b!1482130 m!1367311))

(assert (=> b!1482126 m!1367311))

(assert (=> b!1482126 m!1367311))

(declare-fun m!1367327 () Bool)

(assert (=> b!1482126 m!1367327))

(assert (=> b!1482126 m!1367327))

(assert (=> b!1482126 m!1367311))

(declare-fun m!1367329 () Bool)

(assert (=> b!1482126 m!1367329))

(assert (=> b!1482129 m!1367319))

(declare-fun m!1367331 () Bool)

(assert (=> b!1482129 m!1367331))

(assert (=> b!1482133 m!1367311))

(assert (=> b!1482133 m!1367311))

(declare-fun m!1367333 () Bool)

(assert (=> b!1482133 m!1367333))

(assert (=> b!1482134 m!1367311))

(assert (=> b!1482134 m!1367311))

(declare-fun m!1367335 () Bool)

(assert (=> b!1482134 m!1367335))

(declare-fun m!1367337 () Bool)

(assert (=> b!1482119 m!1367337))

(declare-fun m!1367339 () Bool)

(assert (=> start!126368 m!1367339))

(declare-fun m!1367341 () Bool)

(assert (=> start!126368 m!1367341))

(assert (=> b!1482122 m!1367319))

(declare-fun m!1367343 () Bool)

(assert (=> b!1482122 m!1367343))

(assert (=> b!1482122 m!1367321))

(assert (=> b!1482122 m!1367323))

(assert (=> b!1482122 m!1367311))

(declare-fun m!1367345 () Bool)

(assert (=> b!1482121 m!1367345))

(assert (=> b!1482121 m!1367345))

(declare-fun m!1367347 () Bool)

(assert (=> b!1482121 m!1367347))

(assert (=> b!1482121 m!1367319))

(declare-fun m!1367349 () Bool)

(assert (=> b!1482121 m!1367349))

(check-sat (not b!1482126) (not start!126368) (not b!1482130) (not b!1482131) (not b!1482120) (not b!1482119) (not b!1482132) (not b!1482123) (not b!1482134) (not b!1482121) (not b!1482118) (not b!1482127) (not b!1482133))
(check-sat)
(get-model)

(declare-fun d!156023 () Bool)

(assert (=> d!156023 (= (validKeyInArray!0 (select (arr!47971 a!2862) j!93)) (and (not (= (select (arr!47971 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47971 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482134 d!156023))

(declare-fun d!156025 () Bool)

(declare-fun res!1007662 () Bool)

(declare-fun e!831141 () Bool)

(assert (=> d!156025 (=> res!1007662 e!831141)))

(assert (=> d!156025 (= res!1007662 (bvsge #b00000000000000000000000000000000 (size!48523 a!2862)))))

(assert (=> d!156025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!831141)))

(declare-fun b!1482252 () Bool)

(declare-fun e!831143 () Bool)

(declare-fun e!831142 () Bool)

(assert (=> b!1482252 (= e!831143 e!831142)))

(declare-fun lt!646822 () (_ BitVec 64))

(assert (=> b!1482252 (= lt!646822 (select (arr!47971 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!646823 () Unit!49653)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99385 (_ BitVec 64) (_ BitVec 32)) Unit!49653)

(assert (=> b!1482252 (= lt!646823 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646822 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1482252 (arrayContainsKey!0 a!2862 lt!646822 #b00000000000000000000000000000000)))

(declare-fun lt!646821 () Unit!49653)

(assert (=> b!1482252 (= lt!646821 lt!646823)))

(declare-fun res!1007661 () Bool)

(assert (=> b!1482252 (= res!1007661 (= (seekEntryOrOpen!0 (select (arr!47971 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12236 #b00000000000000000000000000000000)))))

(assert (=> b!1482252 (=> (not res!1007661) (not e!831142))))

(declare-fun bm!67817 () Bool)

(declare-fun call!67820 () Bool)

(assert (=> bm!67817 (= call!67820 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482253 () Bool)

(assert (=> b!1482253 (= e!831143 call!67820)))

(declare-fun b!1482254 () Bool)

(assert (=> b!1482254 (= e!831142 call!67820)))

(declare-fun b!1482255 () Bool)

(assert (=> b!1482255 (= e!831141 e!831143)))

(declare-fun c!136819 () Bool)

(assert (=> b!1482255 (= c!136819 (validKeyInArray!0 (select (arr!47971 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156025 (not res!1007662)) b!1482255))

(assert (= (and b!1482255 c!136819) b!1482252))

(assert (= (and b!1482255 (not c!136819)) b!1482253))

(assert (= (and b!1482252 res!1007661) b!1482254))

(assert (= (or b!1482254 b!1482253) bm!67817))

(declare-fun m!1367451 () Bool)

(assert (=> b!1482252 m!1367451))

(declare-fun m!1367453 () Bool)

(assert (=> b!1482252 m!1367453))

(declare-fun m!1367455 () Bool)

(assert (=> b!1482252 m!1367455))

(assert (=> b!1482252 m!1367451))

(declare-fun m!1367457 () Bool)

(assert (=> b!1482252 m!1367457))

(declare-fun m!1367459 () Bool)

(assert (=> bm!67817 m!1367459))

(assert (=> b!1482255 m!1367451))

(assert (=> b!1482255 m!1367451))

(declare-fun m!1367461 () Bool)

(assert (=> b!1482255 m!1367461))

(assert (=> b!1482123 d!156025))

(declare-fun b!1482268 () Bool)

(declare-fun e!831150 () SeekEntryResult!12236)

(declare-fun e!831151 () SeekEntryResult!12236)

(assert (=> b!1482268 (= e!831150 e!831151)))

(declare-fun lt!646832 () (_ BitVec 64))

(declare-fun lt!646830 () SeekEntryResult!12236)

(assert (=> b!1482268 (= lt!646832 (select (arr!47971 a!2862) (index!51338 lt!646830)))))

(declare-fun c!136826 () Bool)

(assert (=> b!1482268 (= c!136826 (= lt!646832 (select (arr!47971 a!2862) j!93)))))

(declare-fun e!831152 () SeekEntryResult!12236)

(declare-fun b!1482269 () Bool)

(assert (=> b!1482269 (= e!831152 (seekKeyOrZeroReturnVacant!0 (x!132912 lt!646830) (index!51338 lt!646830) (index!51338 lt!646830) (select (arr!47971 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482270 () Bool)

(assert (=> b!1482270 (= e!831152 (MissingZero!12236 (index!51338 lt!646830)))))

(declare-fun b!1482271 () Bool)

(assert (=> b!1482271 (= e!831151 (Found!12236 (index!51338 lt!646830)))))

(declare-fun b!1482272 () Bool)

(declare-fun c!136828 () Bool)

(assert (=> b!1482272 (= c!136828 (= lt!646832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482272 (= e!831151 e!831152)))

(declare-fun d!156027 () Bool)

(declare-fun lt!646831 () SeekEntryResult!12236)

(get-info :version)

(assert (=> d!156027 (and (or ((_ is Undefined!12236) lt!646831) (not ((_ is Found!12236) lt!646831)) (and (bvsge (index!51337 lt!646831) #b00000000000000000000000000000000) (bvslt (index!51337 lt!646831) (size!48523 a!2862)))) (or ((_ is Undefined!12236) lt!646831) ((_ is Found!12236) lt!646831) (not ((_ is MissingZero!12236) lt!646831)) (and (bvsge (index!51336 lt!646831) #b00000000000000000000000000000000) (bvslt (index!51336 lt!646831) (size!48523 a!2862)))) (or ((_ is Undefined!12236) lt!646831) ((_ is Found!12236) lt!646831) ((_ is MissingZero!12236) lt!646831) (not ((_ is MissingVacant!12236) lt!646831)) (and (bvsge (index!51339 lt!646831) #b00000000000000000000000000000000) (bvslt (index!51339 lt!646831) (size!48523 a!2862)))) (or ((_ is Undefined!12236) lt!646831) (ite ((_ is Found!12236) lt!646831) (= (select (arr!47971 a!2862) (index!51337 lt!646831)) (select (arr!47971 a!2862) j!93)) (ite ((_ is MissingZero!12236) lt!646831) (= (select (arr!47971 a!2862) (index!51336 lt!646831)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12236) lt!646831) (= (select (arr!47971 a!2862) (index!51339 lt!646831)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156027 (= lt!646831 e!831150)))

(declare-fun c!136827 () Bool)

(assert (=> d!156027 (= c!136827 (and ((_ is Intermediate!12236) lt!646830) (undefined!13048 lt!646830)))))

(assert (=> d!156027 (= lt!646830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156027 (validMask!0 mask!2687)))

(assert (=> d!156027 (= (seekEntryOrOpen!0 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646831)))

(declare-fun b!1482273 () Bool)

(assert (=> b!1482273 (= e!831150 Undefined!12236)))

(assert (= (and d!156027 c!136827) b!1482273))

(assert (= (and d!156027 (not c!136827)) b!1482268))

(assert (= (and b!1482268 c!136826) b!1482271))

(assert (= (and b!1482268 (not c!136826)) b!1482272))

(assert (= (and b!1482272 c!136828) b!1482270))

(assert (= (and b!1482272 (not c!136828)) b!1482269))

(declare-fun m!1367463 () Bool)

(assert (=> b!1482268 m!1367463))

(assert (=> b!1482269 m!1367311))

(declare-fun m!1367465 () Bool)

(assert (=> b!1482269 m!1367465))

(declare-fun m!1367467 () Bool)

(assert (=> d!156027 m!1367467))

(declare-fun m!1367469 () Bool)

(assert (=> d!156027 m!1367469))

(assert (=> d!156027 m!1367339))

(assert (=> d!156027 m!1367311))

(assert (=> d!156027 m!1367327))

(declare-fun m!1367471 () Bool)

(assert (=> d!156027 m!1367471))

(assert (=> d!156027 m!1367327))

(assert (=> d!156027 m!1367311))

(assert (=> d!156027 m!1367329))

(assert (=> b!1482133 d!156027))

(declare-fun d!156029 () Bool)

(assert (=> d!156029 (= (validKeyInArray!0 (select (arr!47971 a!2862) i!1006)) (and (not (= (select (arr!47971 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47971 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1482132 d!156029))

(declare-fun b!1482292 () Bool)

(declare-fun lt!646838 () SeekEntryResult!12236)

(assert (=> b!1482292 (and (bvsge (index!51338 lt!646838) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646838) (size!48523 lt!646780)))))

(declare-fun res!1007670 () Bool)

(assert (=> b!1482292 (= res!1007670 (= (select (arr!47971 lt!646780) (index!51338 lt!646838)) lt!646781))))

(declare-fun e!831167 () Bool)

(assert (=> b!1482292 (=> res!1007670 e!831167)))

(declare-fun e!831164 () Bool)

(assert (=> b!1482292 (= e!831164 e!831167)))

(declare-fun b!1482293 () Bool)

(declare-fun e!831165 () SeekEntryResult!12236)

(assert (=> b!1482293 (= e!831165 (Intermediate!12236 false (toIndex!0 lt!646781 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482294 () Bool)

(assert (=> b!1482294 (and (bvsge (index!51338 lt!646838) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646838) (size!48523 lt!646780)))))

(declare-fun res!1007669 () Bool)

(assert (=> b!1482294 (= res!1007669 (= (select (arr!47971 lt!646780) (index!51338 lt!646838)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482294 (=> res!1007669 e!831167)))

(declare-fun b!1482295 () Bool)

(assert (=> b!1482295 (and (bvsge (index!51338 lt!646838) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646838) (size!48523 lt!646780)))))

(assert (=> b!1482295 (= e!831167 (= (select (arr!47971 lt!646780) (index!51338 lt!646838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482296 () Bool)

(declare-fun e!831166 () SeekEntryResult!12236)

(assert (=> b!1482296 (= e!831166 e!831165)))

(declare-fun c!136837 () Bool)

(declare-fun lt!646837 () (_ BitVec 64))

(assert (=> b!1482296 (= c!136837 (or (= lt!646837 lt!646781) (= (bvadd lt!646837 lt!646837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156031 () Bool)

(declare-fun e!831163 () Bool)

(assert (=> d!156031 e!831163))

(declare-fun c!136836 () Bool)

(assert (=> d!156031 (= c!136836 (and ((_ is Intermediate!12236) lt!646838) (undefined!13048 lt!646838)))))

(assert (=> d!156031 (= lt!646838 e!831166)))

(declare-fun c!136835 () Bool)

(assert (=> d!156031 (= c!136835 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156031 (= lt!646837 (select (arr!47971 lt!646780) (toIndex!0 lt!646781 mask!2687)))))

(assert (=> d!156031 (validMask!0 mask!2687)))

(assert (=> d!156031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646781 mask!2687) lt!646781 lt!646780 mask!2687) lt!646838)))

(declare-fun b!1482297 () Bool)

(assert (=> b!1482297 (= e!831166 (Intermediate!12236 true (toIndex!0 lt!646781 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482298 () Bool)

(assert (=> b!1482298 (= e!831163 (bvsge (x!132912 lt!646838) #b01111111111111111111111111111110))))

(declare-fun b!1482299 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1482299 (= e!831165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!646781 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!646781 lt!646780 mask!2687))))

(declare-fun b!1482300 () Bool)

(assert (=> b!1482300 (= e!831163 e!831164)))

(declare-fun res!1007671 () Bool)

(assert (=> b!1482300 (= res!1007671 (and ((_ is Intermediate!12236) lt!646838) (not (undefined!13048 lt!646838)) (bvslt (x!132912 lt!646838) #b01111111111111111111111111111110) (bvsge (x!132912 lt!646838) #b00000000000000000000000000000000) (bvsge (x!132912 lt!646838) #b00000000000000000000000000000000)))))

(assert (=> b!1482300 (=> (not res!1007671) (not e!831164))))

(assert (= (and d!156031 c!136835) b!1482297))

(assert (= (and d!156031 (not c!136835)) b!1482296))

(assert (= (and b!1482296 c!136837) b!1482293))

(assert (= (and b!1482296 (not c!136837)) b!1482299))

(assert (= (and d!156031 c!136836) b!1482298))

(assert (= (and d!156031 (not c!136836)) b!1482300))

(assert (= (and b!1482300 res!1007671) b!1482292))

(assert (= (and b!1482292 (not res!1007670)) b!1482294))

(assert (= (and b!1482294 (not res!1007669)) b!1482295))

(assert (=> b!1482299 m!1367345))

(declare-fun m!1367473 () Bool)

(assert (=> b!1482299 m!1367473))

(assert (=> b!1482299 m!1367473))

(declare-fun m!1367475 () Bool)

(assert (=> b!1482299 m!1367475))

(declare-fun m!1367477 () Bool)

(assert (=> b!1482292 m!1367477))

(assert (=> d!156031 m!1367345))

(declare-fun m!1367479 () Bool)

(assert (=> d!156031 m!1367479))

(assert (=> d!156031 m!1367339))

(assert (=> b!1482294 m!1367477))

(assert (=> b!1482295 m!1367477))

(assert (=> b!1482121 d!156031))

(declare-fun d!156037 () Bool)

(declare-fun lt!646844 () (_ BitVec 32))

(declare-fun lt!646843 () (_ BitVec 32))

(assert (=> d!156037 (= lt!646844 (bvmul (bvxor lt!646843 (bvlshr lt!646843 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156037 (= lt!646843 ((_ extract 31 0) (bvand (bvxor lt!646781 (bvlshr lt!646781 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156037 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007672 (let ((h!35920 ((_ extract 31 0) (bvand (bvxor lt!646781 (bvlshr lt!646781 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132916 (bvmul (bvxor h!35920 (bvlshr h!35920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132916 (bvlshr x!132916 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007672 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007672 #b00000000000000000000000000000000))))))

(assert (=> d!156037 (= (toIndex!0 lt!646781 mask!2687) (bvand (bvxor lt!646844 (bvlshr lt!646844 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482121 d!156037))

(declare-fun b!1482301 () Bool)

(declare-fun lt!646846 () SeekEntryResult!12236)

(assert (=> b!1482301 (and (bvsge (index!51338 lt!646846) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646846) (size!48523 a!2862)))))

(declare-fun res!1007674 () Bool)

(assert (=> b!1482301 (= res!1007674 (= (select (arr!47971 a!2862) (index!51338 lt!646846)) (select (arr!47971 a!2862) j!93)))))

(declare-fun e!831172 () Bool)

(assert (=> b!1482301 (=> res!1007674 e!831172)))

(declare-fun e!831169 () Bool)

(assert (=> b!1482301 (= e!831169 e!831172)))

(declare-fun b!1482302 () Bool)

(declare-fun e!831170 () SeekEntryResult!12236)

(assert (=> b!1482302 (= e!831170 (Intermediate!12236 false index!646 x!665))))

(declare-fun b!1482303 () Bool)

(assert (=> b!1482303 (and (bvsge (index!51338 lt!646846) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646846) (size!48523 a!2862)))))

(declare-fun res!1007673 () Bool)

(assert (=> b!1482303 (= res!1007673 (= (select (arr!47971 a!2862) (index!51338 lt!646846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482303 (=> res!1007673 e!831172)))

(declare-fun b!1482304 () Bool)

(assert (=> b!1482304 (and (bvsge (index!51338 lt!646846) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646846) (size!48523 a!2862)))))

(assert (=> b!1482304 (= e!831172 (= (select (arr!47971 a!2862) (index!51338 lt!646846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482305 () Bool)

(declare-fun e!831171 () SeekEntryResult!12236)

(assert (=> b!1482305 (= e!831171 e!831170)))

(declare-fun lt!646845 () (_ BitVec 64))

(declare-fun c!136840 () Bool)

(assert (=> b!1482305 (= c!136840 (or (= lt!646845 (select (arr!47971 a!2862) j!93)) (= (bvadd lt!646845 lt!646845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156039 () Bool)

(declare-fun e!831168 () Bool)

(assert (=> d!156039 e!831168))

(declare-fun c!136839 () Bool)

(assert (=> d!156039 (= c!136839 (and ((_ is Intermediate!12236) lt!646846) (undefined!13048 lt!646846)))))

(assert (=> d!156039 (= lt!646846 e!831171)))

(declare-fun c!136838 () Bool)

(assert (=> d!156039 (= c!136838 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156039 (= lt!646845 (select (arr!47971 a!2862) index!646))))

(assert (=> d!156039 (validMask!0 mask!2687)))

(assert (=> d!156039 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646846)))

(declare-fun b!1482306 () Bool)

(assert (=> b!1482306 (= e!831171 (Intermediate!12236 true index!646 x!665))))

(declare-fun b!1482307 () Bool)

(assert (=> b!1482307 (= e!831168 (bvsge (x!132912 lt!646846) #b01111111111111111111111111111110))))

(declare-fun b!1482308 () Bool)

(assert (=> b!1482308 (= e!831170 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482309 () Bool)

(assert (=> b!1482309 (= e!831168 e!831169)))

(declare-fun res!1007675 () Bool)

(assert (=> b!1482309 (= res!1007675 (and ((_ is Intermediate!12236) lt!646846) (not (undefined!13048 lt!646846)) (bvslt (x!132912 lt!646846) #b01111111111111111111111111111110) (bvsge (x!132912 lt!646846) #b00000000000000000000000000000000) (bvsge (x!132912 lt!646846) x!665)))))

(assert (=> b!1482309 (=> (not res!1007675) (not e!831169))))

(assert (= (and d!156039 c!136838) b!1482306))

(assert (= (and d!156039 (not c!136838)) b!1482305))

(assert (= (and b!1482305 c!136840) b!1482302))

(assert (= (and b!1482305 (not c!136840)) b!1482308))

(assert (= (and d!156039 c!136839) b!1482307))

(assert (= (and d!156039 (not c!136839)) b!1482309))

(assert (= (and b!1482309 res!1007675) b!1482301))

(assert (= (and b!1482301 (not res!1007674)) b!1482303))

(assert (= (and b!1482303 (not res!1007673)) b!1482304))

(declare-fun m!1367481 () Bool)

(assert (=> b!1482308 m!1367481))

(assert (=> b!1482308 m!1367481))

(assert (=> b!1482308 m!1367311))

(declare-fun m!1367483 () Bool)

(assert (=> b!1482308 m!1367483))

(declare-fun m!1367485 () Bool)

(assert (=> b!1482301 m!1367485))

(assert (=> d!156039 m!1367323))

(assert (=> d!156039 m!1367339))

(assert (=> b!1482303 m!1367485))

(assert (=> b!1482304 m!1367485))

(assert (=> b!1482131 d!156039))

(declare-fun d!156041 () Bool)

(declare-fun lt!646869 () SeekEntryResult!12236)

(assert (=> d!156041 (and (or ((_ is Undefined!12236) lt!646869) (not ((_ is Found!12236) lt!646869)) (and (bvsge (index!51337 lt!646869) #b00000000000000000000000000000000) (bvslt (index!51337 lt!646869) (size!48523 lt!646780)))) (or ((_ is Undefined!12236) lt!646869) ((_ is Found!12236) lt!646869) (not ((_ is MissingVacant!12236) lt!646869)) (not (= (index!51339 lt!646869) intermediateAfterIndex!19)) (and (bvsge (index!51339 lt!646869) #b00000000000000000000000000000000) (bvslt (index!51339 lt!646869) (size!48523 lt!646780)))) (or ((_ is Undefined!12236) lt!646869) (ite ((_ is Found!12236) lt!646869) (= (select (arr!47971 lt!646780) (index!51337 lt!646869)) lt!646781) (and ((_ is MissingVacant!12236) lt!646869) (= (index!51339 lt!646869) intermediateAfterIndex!19) (= (select (arr!47971 lt!646780) (index!51339 lt!646869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!831199 () SeekEntryResult!12236)

(assert (=> d!156041 (= lt!646869 e!831199)))

(declare-fun c!136859 () Bool)

(assert (=> d!156041 (= c!136859 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!646870 () (_ BitVec 64))

(assert (=> d!156041 (= lt!646870 (select (arr!47971 lt!646780) index!646))))

(assert (=> d!156041 (validMask!0 mask!2687)))

(assert (=> d!156041 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646781 lt!646780 mask!2687) lt!646869)))

(declare-fun b!1482352 () Bool)

(declare-fun c!136860 () Bool)

(assert (=> b!1482352 (= c!136860 (= lt!646870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!831197 () SeekEntryResult!12236)

(declare-fun e!831198 () SeekEntryResult!12236)

(assert (=> b!1482352 (= e!831197 e!831198)))

(declare-fun b!1482353 () Bool)

(assert (=> b!1482353 (= e!831198 (MissingVacant!12236 intermediateAfterIndex!19))))

(declare-fun b!1482354 () Bool)

(assert (=> b!1482354 (= e!831197 (Found!12236 index!646))))

(declare-fun b!1482355 () Bool)

(assert (=> b!1482355 (= e!831198 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!646781 lt!646780 mask!2687))))

(declare-fun b!1482356 () Bool)

(assert (=> b!1482356 (= e!831199 Undefined!12236)))

(declare-fun b!1482357 () Bool)

(assert (=> b!1482357 (= e!831199 e!831197)))

(declare-fun c!136861 () Bool)

(assert (=> b!1482357 (= c!136861 (= lt!646870 lt!646781))))

(assert (= (and d!156041 c!136859) b!1482356))

(assert (= (and d!156041 (not c!136859)) b!1482357))

(assert (= (and b!1482357 c!136861) b!1482354))

(assert (= (and b!1482357 (not c!136861)) b!1482352))

(assert (= (and b!1482352 c!136860) b!1482353))

(assert (= (and b!1482352 (not c!136860)) b!1482355))

(declare-fun m!1367503 () Bool)

(assert (=> d!156041 m!1367503))

(declare-fun m!1367505 () Bool)

(assert (=> d!156041 m!1367505))

(declare-fun m!1367507 () Bool)

(assert (=> d!156041 m!1367507))

(assert (=> d!156041 m!1367339))

(assert (=> b!1482355 m!1367481))

(assert (=> b!1482355 m!1367481))

(declare-fun m!1367509 () Bool)

(assert (=> b!1482355 m!1367509))

(assert (=> b!1482120 d!156041))

(declare-fun b!1482358 () Bool)

(declare-fun e!831200 () SeekEntryResult!12236)

(declare-fun e!831201 () SeekEntryResult!12236)

(assert (=> b!1482358 (= e!831200 e!831201)))

(declare-fun lt!646873 () (_ BitVec 64))

(declare-fun lt!646871 () SeekEntryResult!12236)

(assert (=> b!1482358 (= lt!646873 (select (arr!47971 lt!646780) (index!51338 lt!646871)))))

(declare-fun c!136862 () Bool)

(assert (=> b!1482358 (= c!136862 (= lt!646873 lt!646781))))

(declare-fun b!1482359 () Bool)

(declare-fun e!831202 () SeekEntryResult!12236)

(assert (=> b!1482359 (= e!831202 (seekKeyOrZeroReturnVacant!0 (x!132912 lt!646871) (index!51338 lt!646871) (index!51338 lt!646871) lt!646781 lt!646780 mask!2687))))

(declare-fun b!1482360 () Bool)

(assert (=> b!1482360 (= e!831202 (MissingZero!12236 (index!51338 lt!646871)))))

(declare-fun b!1482361 () Bool)

(assert (=> b!1482361 (= e!831201 (Found!12236 (index!51338 lt!646871)))))

(declare-fun b!1482362 () Bool)

(declare-fun c!136864 () Bool)

(assert (=> b!1482362 (= c!136864 (= lt!646873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482362 (= e!831201 e!831202)))

(declare-fun d!156053 () Bool)

(declare-fun lt!646872 () SeekEntryResult!12236)

(assert (=> d!156053 (and (or ((_ is Undefined!12236) lt!646872) (not ((_ is Found!12236) lt!646872)) (and (bvsge (index!51337 lt!646872) #b00000000000000000000000000000000) (bvslt (index!51337 lt!646872) (size!48523 lt!646780)))) (or ((_ is Undefined!12236) lt!646872) ((_ is Found!12236) lt!646872) (not ((_ is MissingZero!12236) lt!646872)) (and (bvsge (index!51336 lt!646872) #b00000000000000000000000000000000) (bvslt (index!51336 lt!646872) (size!48523 lt!646780)))) (or ((_ is Undefined!12236) lt!646872) ((_ is Found!12236) lt!646872) ((_ is MissingZero!12236) lt!646872) (not ((_ is MissingVacant!12236) lt!646872)) (and (bvsge (index!51339 lt!646872) #b00000000000000000000000000000000) (bvslt (index!51339 lt!646872) (size!48523 lt!646780)))) (or ((_ is Undefined!12236) lt!646872) (ite ((_ is Found!12236) lt!646872) (= (select (arr!47971 lt!646780) (index!51337 lt!646872)) lt!646781) (ite ((_ is MissingZero!12236) lt!646872) (= (select (arr!47971 lt!646780) (index!51336 lt!646872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12236) lt!646872) (= (select (arr!47971 lt!646780) (index!51339 lt!646872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156053 (= lt!646872 e!831200)))

(declare-fun c!136863 () Bool)

(assert (=> d!156053 (= c!136863 (and ((_ is Intermediate!12236) lt!646871) (undefined!13048 lt!646871)))))

(assert (=> d!156053 (= lt!646871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646781 mask!2687) lt!646781 lt!646780 mask!2687))))

(assert (=> d!156053 (validMask!0 mask!2687)))

(assert (=> d!156053 (= (seekEntryOrOpen!0 lt!646781 lt!646780 mask!2687) lt!646872)))

(declare-fun b!1482363 () Bool)

(assert (=> b!1482363 (= e!831200 Undefined!12236)))

(assert (= (and d!156053 c!136863) b!1482363))

(assert (= (and d!156053 (not c!136863)) b!1482358))

(assert (= (and b!1482358 c!136862) b!1482361))

(assert (= (and b!1482358 (not c!136862)) b!1482362))

(assert (= (and b!1482362 c!136864) b!1482360))

(assert (= (and b!1482362 (not c!136864)) b!1482359))

(declare-fun m!1367511 () Bool)

(assert (=> b!1482358 m!1367511))

(declare-fun m!1367513 () Bool)

(assert (=> b!1482359 m!1367513))

(declare-fun m!1367515 () Bool)

(assert (=> d!156053 m!1367515))

(declare-fun m!1367517 () Bool)

(assert (=> d!156053 m!1367517))

(assert (=> d!156053 m!1367339))

(assert (=> d!156053 m!1367345))

(declare-fun m!1367519 () Bool)

(assert (=> d!156053 m!1367519))

(assert (=> d!156053 m!1367345))

(assert (=> d!156053 m!1367347))

(assert (=> b!1482120 d!156053))

(declare-fun d!156055 () Bool)

(declare-fun res!1007683 () Bool)

(declare-fun e!831203 () Bool)

(assert (=> d!156055 (=> res!1007683 e!831203)))

(assert (=> d!156055 (= res!1007683 (bvsge j!93 (size!48523 a!2862)))))

(assert (=> d!156055 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!831203)))

(declare-fun b!1482364 () Bool)

(declare-fun e!831205 () Bool)

(declare-fun e!831204 () Bool)

(assert (=> b!1482364 (= e!831205 e!831204)))

(declare-fun lt!646875 () (_ BitVec 64))

(assert (=> b!1482364 (= lt!646875 (select (arr!47971 a!2862) j!93))))

(declare-fun lt!646876 () Unit!49653)

(assert (=> b!1482364 (= lt!646876 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!646875 j!93))))

(assert (=> b!1482364 (arrayContainsKey!0 a!2862 lt!646875 #b00000000000000000000000000000000)))

(declare-fun lt!646874 () Unit!49653)

(assert (=> b!1482364 (= lt!646874 lt!646876)))

(declare-fun res!1007682 () Bool)

(assert (=> b!1482364 (= res!1007682 (= (seekEntryOrOpen!0 (select (arr!47971 a!2862) j!93) a!2862 mask!2687) (Found!12236 j!93)))))

(assert (=> b!1482364 (=> (not res!1007682) (not e!831204))))

(declare-fun bm!67821 () Bool)

(declare-fun call!67824 () Bool)

(assert (=> bm!67821 (= call!67824 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1482365 () Bool)

(assert (=> b!1482365 (= e!831205 call!67824)))

(declare-fun b!1482366 () Bool)

(assert (=> b!1482366 (= e!831204 call!67824)))

(declare-fun b!1482367 () Bool)

(assert (=> b!1482367 (= e!831203 e!831205)))

(declare-fun c!136865 () Bool)

(assert (=> b!1482367 (= c!136865 (validKeyInArray!0 (select (arr!47971 a!2862) j!93)))))

(assert (= (and d!156055 (not res!1007683)) b!1482367))

(assert (= (and b!1482367 c!136865) b!1482364))

(assert (= (and b!1482367 (not c!136865)) b!1482365))

(assert (= (and b!1482364 res!1007682) b!1482366))

(assert (= (or b!1482366 b!1482365) bm!67821))

(assert (=> b!1482364 m!1367311))

(declare-fun m!1367521 () Bool)

(assert (=> b!1482364 m!1367521))

(declare-fun m!1367523 () Bool)

(assert (=> b!1482364 m!1367523))

(assert (=> b!1482364 m!1367311))

(assert (=> b!1482364 m!1367333))

(declare-fun m!1367525 () Bool)

(assert (=> bm!67821 m!1367525))

(assert (=> b!1482367 m!1367311))

(assert (=> b!1482367 m!1367311))

(assert (=> b!1482367 m!1367335))

(assert (=> b!1482130 d!156055))

(declare-fun d!156057 () Bool)

(assert (=> d!156057 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646882 () Unit!49653)

(declare-fun choose!38 (array!99385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49653)

(assert (=> d!156057 (= lt!646882 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156057 (validMask!0 mask!2687)))

(assert (=> d!156057 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!646882)))

(declare-fun bs!42665 () Bool)

(assert (= bs!42665 d!156057))

(assert (=> bs!42665 m!1367325))

(declare-fun m!1367529 () Bool)

(assert (=> bs!42665 m!1367529))

(assert (=> bs!42665 m!1367339))

(assert (=> b!1482130 d!156057))

(declare-fun b!1482390 () Bool)

(declare-fun e!831221 () Bool)

(declare-fun call!67827 () Bool)

(assert (=> b!1482390 (= e!831221 call!67827)))

(declare-fun d!156061 () Bool)

(declare-fun res!1007690 () Bool)

(declare-fun e!831222 () Bool)

(assert (=> d!156061 (=> res!1007690 e!831222)))

(assert (=> d!156061 (= res!1007690 (bvsge #b00000000000000000000000000000000 (size!48523 a!2862)))))

(assert (=> d!156061 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34547) e!831222)))

(declare-fun b!1482391 () Bool)

(declare-fun e!831223 () Bool)

(assert (=> b!1482391 (= e!831223 e!831221)))

(declare-fun c!136874 () Bool)

(assert (=> b!1482391 (= c!136874 (validKeyInArray!0 (select (arr!47971 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482392 () Bool)

(assert (=> b!1482392 (= e!831221 call!67827)))

(declare-fun bm!67824 () Bool)

(assert (=> bm!67824 (= call!67827 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!136874 (Cons!34546 (select (arr!47971 a!2862) #b00000000000000000000000000000000) Nil!34547) Nil!34547)))))

(declare-fun b!1482393 () Bool)

(assert (=> b!1482393 (= e!831222 e!831223)))

(declare-fun res!1007692 () Bool)

(assert (=> b!1482393 (=> (not res!1007692) (not e!831223))))

(declare-fun e!831220 () Bool)

(assert (=> b!1482393 (= res!1007692 (not e!831220))))

(declare-fun res!1007691 () Bool)

(assert (=> b!1482393 (=> (not res!1007691) (not e!831220))))

(assert (=> b!1482393 (= res!1007691 (validKeyInArray!0 (select (arr!47971 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1482394 () Bool)

(declare-fun contains!9881 (List!34550 (_ BitVec 64)) Bool)

(assert (=> b!1482394 (= e!831220 (contains!9881 Nil!34547 (select (arr!47971 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156061 (not res!1007690)) b!1482393))

(assert (= (and b!1482393 res!1007691) b!1482394))

(assert (= (and b!1482393 res!1007692) b!1482391))

(assert (= (and b!1482391 c!136874) b!1482390))

(assert (= (and b!1482391 (not c!136874)) b!1482392))

(assert (= (or b!1482390 b!1482392) bm!67824))

(assert (=> b!1482391 m!1367451))

(assert (=> b!1482391 m!1367451))

(assert (=> b!1482391 m!1367461))

(assert (=> bm!67824 m!1367451))

(declare-fun m!1367531 () Bool)

(assert (=> bm!67824 m!1367531))

(assert (=> b!1482393 m!1367451))

(assert (=> b!1482393 m!1367451))

(assert (=> b!1482393 m!1367461))

(assert (=> b!1482394 m!1367451))

(assert (=> b!1482394 m!1367451))

(declare-fun m!1367533 () Bool)

(assert (=> b!1482394 m!1367533))

(assert (=> b!1482119 d!156061))

(declare-fun b!1482395 () Bool)

(declare-fun lt!646888 () SeekEntryResult!12236)

(assert (=> b!1482395 (and (bvsge (index!51338 lt!646888) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646888) (size!48523 lt!646780)))))

(declare-fun res!1007694 () Bool)

(assert (=> b!1482395 (= res!1007694 (= (select (arr!47971 lt!646780) (index!51338 lt!646888)) lt!646781))))

(declare-fun e!831228 () Bool)

(assert (=> b!1482395 (=> res!1007694 e!831228)))

(declare-fun e!831225 () Bool)

(assert (=> b!1482395 (= e!831225 e!831228)))

(declare-fun b!1482396 () Bool)

(declare-fun e!831226 () SeekEntryResult!12236)

(assert (=> b!1482396 (= e!831226 (Intermediate!12236 false index!646 x!665))))

(declare-fun b!1482397 () Bool)

(assert (=> b!1482397 (and (bvsge (index!51338 lt!646888) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646888) (size!48523 lt!646780)))))

(declare-fun res!1007693 () Bool)

(assert (=> b!1482397 (= res!1007693 (= (select (arr!47971 lt!646780) (index!51338 lt!646888)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482397 (=> res!1007693 e!831228)))

(declare-fun b!1482398 () Bool)

(assert (=> b!1482398 (and (bvsge (index!51338 lt!646888) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646888) (size!48523 lt!646780)))))

(assert (=> b!1482398 (= e!831228 (= (select (arr!47971 lt!646780) (index!51338 lt!646888)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482399 () Bool)

(declare-fun e!831227 () SeekEntryResult!12236)

(assert (=> b!1482399 (= e!831227 e!831226)))

(declare-fun c!136877 () Bool)

(declare-fun lt!646887 () (_ BitVec 64))

(assert (=> b!1482399 (= c!136877 (or (= lt!646887 lt!646781) (= (bvadd lt!646887 lt!646887) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156063 () Bool)

(declare-fun e!831224 () Bool)

(assert (=> d!156063 e!831224))

(declare-fun c!136876 () Bool)

(assert (=> d!156063 (= c!136876 (and ((_ is Intermediate!12236) lt!646888) (undefined!13048 lt!646888)))))

(assert (=> d!156063 (= lt!646888 e!831227)))

(declare-fun c!136875 () Bool)

(assert (=> d!156063 (= c!136875 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156063 (= lt!646887 (select (arr!47971 lt!646780) index!646))))

(assert (=> d!156063 (validMask!0 mask!2687)))

(assert (=> d!156063 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646781 lt!646780 mask!2687) lt!646888)))

(declare-fun b!1482400 () Bool)

(assert (=> b!1482400 (= e!831227 (Intermediate!12236 true index!646 x!665))))

(declare-fun b!1482401 () Bool)

(assert (=> b!1482401 (= e!831224 (bvsge (x!132912 lt!646888) #b01111111111111111111111111111110))))

(declare-fun b!1482402 () Bool)

(assert (=> b!1482402 (= e!831226 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!646781 lt!646780 mask!2687))))

(declare-fun b!1482403 () Bool)

(assert (=> b!1482403 (= e!831224 e!831225)))

(declare-fun res!1007695 () Bool)

(assert (=> b!1482403 (= res!1007695 (and ((_ is Intermediate!12236) lt!646888) (not (undefined!13048 lt!646888)) (bvslt (x!132912 lt!646888) #b01111111111111111111111111111110) (bvsge (x!132912 lt!646888) #b00000000000000000000000000000000) (bvsge (x!132912 lt!646888) x!665)))))

(assert (=> b!1482403 (=> (not res!1007695) (not e!831225))))

(assert (= (and d!156063 c!136875) b!1482400))

(assert (= (and d!156063 (not c!136875)) b!1482399))

(assert (= (and b!1482399 c!136877) b!1482396))

(assert (= (and b!1482399 (not c!136877)) b!1482402))

(assert (= (and d!156063 c!136876) b!1482401))

(assert (= (and d!156063 (not c!136876)) b!1482403))

(assert (= (and b!1482403 res!1007695) b!1482395))

(assert (= (and b!1482395 (not res!1007694)) b!1482397))

(assert (= (and b!1482397 (not res!1007693)) b!1482398))

(assert (=> b!1482402 m!1367481))

(assert (=> b!1482402 m!1367481))

(declare-fun m!1367535 () Bool)

(assert (=> b!1482402 m!1367535))

(declare-fun m!1367537 () Bool)

(assert (=> b!1482395 m!1367537))

(assert (=> d!156063 m!1367507))

(assert (=> d!156063 m!1367339))

(assert (=> b!1482397 m!1367537))

(assert (=> b!1482398 m!1367537))

(assert (=> b!1482118 d!156063))

(assert (=> b!1482127 d!156053))

(assert (=> b!1482127 d!156041))

(declare-fun d!156065 () Bool)

(assert (=> d!156065 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126368 d!156065))

(declare-fun d!156073 () Bool)

(assert (=> d!156073 (= (array_inv!37204 a!2862) (bvsge (size!48523 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126368 d!156073))

(declare-fun b!1482437 () Bool)

(declare-fun lt!646898 () SeekEntryResult!12236)

(assert (=> b!1482437 (and (bvsge (index!51338 lt!646898) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646898) (size!48523 a!2862)))))

(declare-fun res!1007707 () Bool)

(assert (=> b!1482437 (= res!1007707 (= (select (arr!47971 a!2862) (index!51338 lt!646898)) (select (arr!47971 a!2862) j!93)))))

(declare-fun e!831251 () Bool)

(assert (=> b!1482437 (=> res!1007707 e!831251)))

(declare-fun e!831248 () Bool)

(assert (=> b!1482437 (= e!831248 e!831251)))

(declare-fun e!831249 () SeekEntryResult!12236)

(declare-fun b!1482438 () Bool)

(assert (=> b!1482438 (= e!831249 (Intermediate!12236 false (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482439 () Bool)

(assert (=> b!1482439 (and (bvsge (index!51338 lt!646898) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646898) (size!48523 a!2862)))))

(declare-fun res!1007706 () Bool)

(assert (=> b!1482439 (= res!1007706 (= (select (arr!47971 a!2862) (index!51338 lt!646898)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1482439 (=> res!1007706 e!831251)))

(declare-fun b!1482440 () Bool)

(assert (=> b!1482440 (and (bvsge (index!51338 lt!646898) #b00000000000000000000000000000000) (bvslt (index!51338 lt!646898) (size!48523 a!2862)))))

(assert (=> b!1482440 (= e!831251 (= (select (arr!47971 a!2862) (index!51338 lt!646898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1482441 () Bool)

(declare-fun e!831250 () SeekEntryResult!12236)

(assert (=> b!1482441 (= e!831250 e!831249)))

(declare-fun lt!646897 () (_ BitVec 64))

(declare-fun c!136892 () Bool)

(assert (=> b!1482441 (= c!136892 (or (= lt!646897 (select (arr!47971 a!2862) j!93)) (= (bvadd lt!646897 lt!646897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!156075 () Bool)

(declare-fun e!831247 () Bool)

(assert (=> d!156075 e!831247))

(declare-fun c!136891 () Bool)

(assert (=> d!156075 (= c!136891 (and ((_ is Intermediate!12236) lt!646898) (undefined!13048 lt!646898)))))

(assert (=> d!156075 (= lt!646898 e!831250)))

(declare-fun c!136890 () Bool)

(assert (=> d!156075 (= c!136890 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156075 (= lt!646897 (select (arr!47971 a!2862) (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687)))))

(assert (=> d!156075 (validMask!0 mask!2687)))

(assert (=> d!156075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687) lt!646898)))

(declare-fun b!1482442 () Bool)

(assert (=> b!1482442 (= e!831250 (Intermediate!12236 true (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1482443 () Bool)

(assert (=> b!1482443 (= e!831247 (bvsge (x!132912 lt!646898) #b01111111111111111111111111111110))))

(declare-fun b!1482444 () Bool)

(assert (=> b!1482444 (= e!831249 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47971 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1482445 () Bool)

(assert (=> b!1482445 (= e!831247 e!831248)))

(declare-fun res!1007708 () Bool)

(assert (=> b!1482445 (= res!1007708 (and ((_ is Intermediate!12236) lt!646898) (not (undefined!13048 lt!646898)) (bvslt (x!132912 lt!646898) #b01111111111111111111111111111110) (bvsge (x!132912 lt!646898) #b00000000000000000000000000000000) (bvsge (x!132912 lt!646898) #b00000000000000000000000000000000)))))

(assert (=> b!1482445 (=> (not res!1007708) (not e!831248))))

(assert (= (and d!156075 c!136890) b!1482442))

(assert (= (and d!156075 (not c!136890)) b!1482441))

(assert (= (and b!1482441 c!136892) b!1482438))

(assert (= (and b!1482441 (not c!136892)) b!1482444))

(assert (= (and d!156075 c!136891) b!1482443))

(assert (= (and d!156075 (not c!136891)) b!1482445))

(assert (= (and b!1482445 res!1007708) b!1482437))

(assert (= (and b!1482437 (not res!1007707)) b!1482439))

(assert (= (and b!1482439 (not res!1007706)) b!1482440))

(assert (=> b!1482444 m!1367327))

(declare-fun m!1367557 () Bool)

(assert (=> b!1482444 m!1367557))

(assert (=> b!1482444 m!1367557))

(assert (=> b!1482444 m!1367311))

(declare-fun m!1367559 () Bool)

(assert (=> b!1482444 m!1367559))

(declare-fun m!1367561 () Bool)

(assert (=> b!1482437 m!1367561))

(assert (=> d!156075 m!1367327))

(declare-fun m!1367563 () Bool)

(assert (=> d!156075 m!1367563))

(assert (=> d!156075 m!1367339))

(assert (=> b!1482439 m!1367561))

(assert (=> b!1482440 m!1367561))

(assert (=> b!1482126 d!156075))

(declare-fun d!156077 () Bool)

(declare-fun lt!646900 () (_ BitVec 32))

(declare-fun lt!646899 () (_ BitVec 32))

(assert (=> d!156077 (= lt!646900 (bvmul (bvxor lt!646899 (bvlshr lt!646899 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156077 (= lt!646899 ((_ extract 31 0) (bvand (bvxor (select (arr!47971 a!2862) j!93) (bvlshr (select (arr!47971 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156077 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1007672 (let ((h!35920 ((_ extract 31 0) (bvand (bvxor (select (arr!47971 a!2862) j!93) (bvlshr (select (arr!47971 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!132916 (bvmul (bvxor h!35920 (bvlshr h!35920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!132916 (bvlshr x!132916 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1007672 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1007672 #b00000000000000000000000000000000))))))

(assert (=> d!156077 (= (toIndex!0 (select (arr!47971 a!2862) j!93) mask!2687) (bvand (bvxor lt!646900 (bvlshr lt!646900 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1482126 d!156077))

(check-sat (not b!1482394) (not d!156075) (not bm!67821) (not b!1482252) (not d!156027) (not d!156063) (not d!156057) (not b!1482393) (not d!156053) (not b!1482359) (not b!1482255) (not b!1482355) (not b!1482269) (not d!156041) (not b!1482444) (not bm!67817) (not d!156031) (not b!1482308) (not b!1482364) (not b!1482367) (not b!1482391) (not b!1482299) (not b!1482402) (not d!156039) (not bm!67824))
(check-sat)
