; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124830 () Bool)

(assert start!124830)

(declare-fun b!1444326 () Bool)

(declare-fun res!975658 () Bool)

(declare-fun e!814048 () Bool)

(assert (=> b!1444326 (=> (not res!975658) (not e!814048))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11520 0))(
  ( (MissingZero!11520 (index!48472 (_ BitVec 32))) (Found!11520 (index!48473 (_ BitVec 32))) (Intermediate!11520 (undefined!12332 Bool) (index!48474 (_ BitVec 32)) (x!130353 (_ BitVec 32))) (Undefined!11520) (MissingVacant!11520 (index!48475 (_ BitVec 32))) )
))
(declare-fun lt!634206 () SeekEntryResult!11520)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98173 0))(
  ( (array!98174 (arr!47371 (Array (_ BitVec 32) (_ BitVec 64))) (size!47922 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98173)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98173 (_ BitVec 32)) SeekEntryResult!11520)

(assert (=> b!1444326 (= res!975658 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47371 a!2862) j!93) a!2862 mask!2687) lt!634206))))

(declare-fun b!1444327 () Bool)

(declare-fun res!975662 () Bool)

(declare-fun e!814050 () Bool)

(assert (=> b!1444327 (=> (not res!975662) (not e!814050))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444327 (= res!975662 (validKeyInArray!0 (select (arr!47371 a!2862) i!1006)))))

(declare-fun b!1444328 () Bool)

(declare-fun res!975667 () Bool)

(assert (=> b!1444328 (=> (not res!975667) (not e!814050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98173 (_ BitVec 32)) Bool)

(assert (=> b!1444328 (= res!975667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444329 () Bool)

(declare-fun lt!634204 () array!98173)

(declare-fun lt!634205 () (_ BitVec 64))

(declare-fun e!814053 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98173 (_ BitVec 32)) SeekEntryResult!11520)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98173 (_ BitVec 32)) SeekEntryResult!11520)

(assert (=> b!1444329 (= e!814053 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634205 lt!634204 mask!2687) (seekEntryOrOpen!0 lt!634205 lt!634204 mask!2687)))))

(declare-fun b!1444330 () Bool)

(declare-fun res!975660 () Bool)

(assert (=> b!1444330 (=> (not res!975660) (not e!814050))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444330 (= res!975660 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47922 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47922 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47922 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444331 () Bool)

(declare-fun res!975657 () Bool)

(declare-fun e!814047 () Bool)

(assert (=> b!1444331 (=> (not res!975657) (not e!814047))))

(assert (=> b!1444331 (= res!975657 (= (seekEntryOrOpen!0 (select (arr!47371 a!2862) j!93) a!2862 mask!2687) (Found!11520 j!93)))))

(declare-fun b!1444332 () Bool)

(declare-fun lt!634203 () SeekEntryResult!11520)

(assert (=> b!1444332 (= e!814053 (= lt!634203 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634205 lt!634204 mask!2687)))))

(declare-fun b!1444333 () Bool)

(declare-fun e!814052 () Bool)

(assert (=> b!1444333 (= e!814052 (not true))))

(assert (=> b!1444333 e!814047))

(declare-fun res!975665 () Bool)

(assert (=> b!1444333 (=> (not res!975665) (not e!814047))))

(assert (=> b!1444333 (= res!975665 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48569 0))(
  ( (Unit!48570) )
))
(declare-fun lt!634207 () Unit!48569)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48569)

(assert (=> b!1444333 (= lt!634207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444335 () Bool)

(declare-fun res!975664 () Bool)

(assert (=> b!1444335 (=> (not res!975664) (not e!814050))))

(declare-datatypes ((List!33859 0))(
  ( (Nil!33856) (Cons!33855 (h!35216 (_ BitVec 64)) (t!48545 List!33859)) )
))
(declare-fun arrayNoDuplicates!0 (array!98173 (_ BitVec 32) List!33859) Bool)

(assert (=> b!1444335 (= res!975664 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33856))))

(declare-fun b!1444336 () Bool)

(declare-fun res!975654 () Bool)

(assert (=> b!1444336 (=> (not res!975654) (not e!814052))))

(assert (=> b!1444336 (= res!975654 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444337 () Bool)

(declare-fun res!975656 () Bool)

(assert (=> b!1444337 (=> (not res!975656) (not e!814052))))

(assert (=> b!1444337 (= res!975656 e!814053)))

(declare-fun c!133855 () Bool)

(assert (=> b!1444337 (= c!133855 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444338 () Bool)

(assert (=> b!1444338 (= e!814047 (or (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47371 a!2862) intermediateBeforeIndex!19) (select (arr!47371 a!2862) j!93))))))

(declare-fun b!1444339 () Bool)

(declare-fun res!975668 () Bool)

(assert (=> b!1444339 (=> (not res!975668) (not e!814050))))

(assert (=> b!1444339 (= res!975668 (validKeyInArray!0 (select (arr!47371 a!2862) j!93)))))

(declare-fun b!1444340 () Bool)

(declare-fun res!975666 () Bool)

(assert (=> b!1444340 (=> (not res!975666) (not e!814050))))

(assert (=> b!1444340 (= res!975666 (and (= (size!47922 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47922 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47922 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444341 () Bool)

(assert (=> b!1444341 (= e!814048 e!814052)))

(declare-fun res!975659 () Bool)

(assert (=> b!1444341 (=> (not res!975659) (not e!814052))))

(assert (=> b!1444341 (= res!975659 (= lt!634203 (Intermediate!11520 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444341 (= lt!634203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634205 mask!2687) lt!634205 lt!634204 mask!2687))))

(assert (=> b!1444341 (= lt!634205 (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444342 () Bool)

(declare-fun e!814051 () Bool)

(assert (=> b!1444342 (= e!814050 e!814051)))

(declare-fun res!975663 () Bool)

(assert (=> b!1444342 (=> (not res!975663) (not e!814051))))

(assert (=> b!1444342 (= res!975663 (= (select (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444342 (= lt!634204 (array!98174 (store (arr!47371 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47922 a!2862)))))

(declare-fun b!1444334 () Bool)

(assert (=> b!1444334 (= e!814051 e!814048)))

(declare-fun res!975661 () Bool)

(assert (=> b!1444334 (=> (not res!975661) (not e!814048))))

(assert (=> b!1444334 (= res!975661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47371 a!2862) j!93) mask!2687) (select (arr!47371 a!2862) j!93) a!2862 mask!2687) lt!634206))))

(assert (=> b!1444334 (= lt!634206 (Intermediate!11520 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!975655 () Bool)

(assert (=> start!124830 (=> (not res!975655) (not e!814050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124830 (= res!975655 (validMask!0 mask!2687))))

(assert (=> start!124830 e!814050))

(assert (=> start!124830 true))

(declare-fun array_inv!36652 (array!98173) Bool)

(assert (=> start!124830 (array_inv!36652 a!2862)))

(assert (= (and start!124830 res!975655) b!1444340))

(assert (= (and b!1444340 res!975666) b!1444327))

(assert (= (and b!1444327 res!975662) b!1444339))

(assert (= (and b!1444339 res!975668) b!1444328))

(assert (= (and b!1444328 res!975667) b!1444335))

(assert (= (and b!1444335 res!975664) b!1444330))

(assert (= (and b!1444330 res!975660) b!1444342))

(assert (= (and b!1444342 res!975663) b!1444334))

(assert (= (and b!1444334 res!975661) b!1444326))

(assert (= (and b!1444326 res!975658) b!1444341))

(assert (= (and b!1444341 res!975659) b!1444337))

(assert (= (and b!1444337 c!133855) b!1444332))

(assert (= (and b!1444337 (not c!133855)) b!1444329))

(assert (= (and b!1444337 res!975656) b!1444336))

(assert (= (and b!1444336 res!975654) b!1444333))

(assert (= (and b!1444333 res!975665) b!1444331))

(assert (= (and b!1444331 res!975657) b!1444338))

(declare-fun m!1333549 () Bool)

(assert (=> b!1444328 m!1333549))

(declare-fun m!1333551 () Bool)

(assert (=> start!124830 m!1333551))

(declare-fun m!1333553 () Bool)

(assert (=> start!124830 m!1333553))

(declare-fun m!1333555 () Bool)

(assert (=> b!1444331 m!1333555))

(assert (=> b!1444331 m!1333555))

(declare-fun m!1333557 () Bool)

(assert (=> b!1444331 m!1333557))

(declare-fun m!1333559 () Bool)

(assert (=> b!1444342 m!1333559))

(declare-fun m!1333561 () Bool)

(assert (=> b!1444342 m!1333561))

(assert (=> b!1444326 m!1333555))

(assert (=> b!1444326 m!1333555))

(declare-fun m!1333563 () Bool)

(assert (=> b!1444326 m!1333563))

(declare-fun m!1333565 () Bool)

(assert (=> b!1444329 m!1333565))

(declare-fun m!1333567 () Bool)

(assert (=> b!1444329 m!1333567))

(assert (=> b!1444339 m!1333555))

(assert (=> b!1444339 m!1333555))

(declare-fun m!1333569 () Bool)

(assert (=> b!1444339 m!1333569))

(declare-fun m!1333571 () Bool)

(assert (=> b!1444332 m!1333571))

(declare-fun m!1333573 () Bool)

(assert (=> b!1444327 m!1333573))

(assert (=> b!1444327 m!1333573))

(declare-fun m!1333575 () Bool)

(assert (=> b!1444327 m!1333575))

(declare-fun m!1333577 () Bool)

(assert (=> b!1444335 m!1333577))

(declare-fun m!1333579 () Bool)

(assert (=> b!1444338 m!1333579))

(assert (=> b!1444338 m!1333555))

(declare-fun m!1333581 () Bool)

(assert (=> b!1444341 m!1333581))

(assert (=> b!1444341 m!1333581))

(declare-fun m!1333583 () Bool)

(assert (=> b!1444341 m!1333583))

(assert (=> b!1444341 m!1333559))

(declare-fun m!1333585 () Bool)

(assert (=> b!1444341 m!1333585))

(declare-fun m!1333587 () Bool)

(assert (=> b!1444333 m!1333587))

(declare-fun m!1333589 () Bool)

(assert (=> b!1444333 m!1333589))

(assert (=> b!1444334 m!1333555))

(assert (=> b!1444334 m!1333555))

(declare-fun m!1333591 () Bool)

(assert (=> b!1444334 m!1333591))

(assert (=> b!1444334 m!1333591))

(assert (=> b!1444334 m!1333555))

(declare-fun m!1333593 () Bool)

(assert (=> b!1444334 m!1333593))

(check-sat (not b!1444333) (not b!1444339) (not b!1444332) (not start!124830) (not b!1444335) (not b!1444329) (not b!1444334) (not b!1444341) (not b!1444331) (not b!1444327) (not b!1444328) (not b!1444326))
(check-sat)
