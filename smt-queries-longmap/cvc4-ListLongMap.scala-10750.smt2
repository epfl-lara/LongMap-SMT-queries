; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125762 () Bool)

(assert start!125762)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99096 0))(
  ( (array!99097 (arr!47833 (Array (_ BitVec 32) (_ BitVec 64))) (size!48383 (_ BitVec 32))) )
))
(declare-fun lt!643325 () array!99096)

(declare-fun e!826008 () Bool)

(declare-fun lt!643329 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12073 0))(
  ( (MissingZero!12073 (index!50684 (_ BitVec 32))) (Found!12073 (index!50685 (_ BitVec 32))) (Intermediate!12073 (undefined!12885 Bool) (index!50686 (_ BitVec 32)) (x!132268 (_ BitVec 32))) (Undefined!12073) (MissingVacant!12073 (index!50687 (_ BitVec 32))) )
))
(declare-fun lt!643328 () SeekEntryResult!12073)

(declare-fun b!1471601 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99096 (_ BitVec 32)) SeekEntryResult!12073)

(assert (=> b!1471601 (= e!826008 (= lt!643328 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643329 lt!643325 mask!2687)))))

(declare-fun b!1471602 () Bool)

(declare-fun res!999376 () Bool)

(declare-fun e!826004 () Bool)

(assert (=> b!1471602 (=> (not res!999376) (not e!826004))))

(declare-fun a!2862 () array!99096)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471602 (= res!999376 (validKeyInArray!0 (select (arr!47833 a!2862) i!1006)))))

(declare-fun b!1471603 () Bool)

(declare-fun res!999366 () Bool)

(assert (=> b!1471603 (=> (not res!999366) (not e!826004))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1471603 (= res!999366 (validKeyInArray!0 (select (arr!47833 a!2862) j!93)))))

(declare-fun b!1471604 () Bool)

(declare-fun res!999370 () Bool)

(declare-fun e!826005 () Bool)

(assert (=> b!1471604 (=> (not res!999370) (not e!826005))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1471604 (= res!999370 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1471605 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99096 (_ BitVec 32)) SeekEntryResult!12073)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99096 (_ BitVec 32)) SeekEntryResult!12073)

(assert (=> b!1471605 (= e!826008 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643329 lt!643325 mask!2687) (seekEntryOrOpen!0 lt!643329 lt!643325 mask!2687)))))

(declare-fun b!1471607 () Bool)

(declare-fun res!999369 () Bool)

(declare-fun e!826010 () Bool)

(assert (=> b!1471607 (=> (not res!999369) (not e!826010))))

(declare-fun lt!643327 () SeekEntryResult!12073)

(assert (=> b!1471607 (= res!999369 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643327))))

(declare-fun b!1471608 () Bool)

(declare-fun e!826009 () Bool)

(assert (=> b!1471608 (= e!826009 e!826010)))

(declare-fun res!999365 () Bool)

(assert (=> b!1471608 (=> (not res!999365) (not e!826010))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471608 (= res!999365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!643327))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1471608 (= lt!643327 (Intermediate!12073 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471609 () Bool)

(declare-fun res!999374 () Bool)

(declare-fun e!826007 () Bool)

(assert (=> b!1471609 (=> (not res!999374) (not e!826007))))

(assert (=> b!1471609 (= res!999374 (= (seekEntryOrOpen!0 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) (Found!12073 j!93)))))

(declare-fun b!1471610 () Bool)

(declare-fun res!999364 () Bool)

(assert (=> b!1471610 (=> (not res!999364) (not e!826004))))

(declare-datatypes ((List!34334 0))(
  ( (Nil!34331) (Cons!34330 (h!35686 (_ BitVec 64)) (t!49028 List!34334)) )
))
(declare-fun arrayNoDuplicates!0 (array!99096 (_ BitVec 32) List!34334) Bool)

(assert (=> b!1471610 (= res!999364 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34331))))

(declare-fun b!1471611 () Bool)

(assert (=> b!1471611 (= e!826005 (not true))))

(assert (=> b!1471611 e!826007))

(declare-fun res!999372 () Bool)

(assert (=> b!1471611 (=> (not res!999372) (not e!826007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99096 (_ BitVec 32)) Bool)

(assert (=> b!1471611 (= res!999372 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49486 0))(
  ( (Unit!49487) )
))
(declare-fun lt!643326 () Unit!49486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49486)

(assert (=> b!1471611 (= lt!643326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471612 () Bool)

(assert (=> b!1471612 (= e!826007 (or (= (select (arr!47833 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47833 a!2862) intermediateBeforeIndex!19) (select (arr!47833 a!2862) j!93))))))

(declare-fun b!1471613 () Bool)

(declare-fun res!999362 () Bool)

(assert (=> b!1471613 (=> (not res!999362) (not e!826004))))

(assert (=> b!1471613 (= res!999362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471606 () Bool)

(declare-fun res!999371 () Bool)

(assert (=> b!1471606 (=> (not res!999371) (not e!826004))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471606 (= res!999371 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48383 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48383 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48383 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!999367 () Bool)

(assert (=> start!125762 (=> (not res!999367) (not e!826004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125762 (= res!999367 (validMask!0 mask!2687))))

(assert (=> start!125762 e!826004))

(assert (=> start!125762 true))

(declare-fun array_inv!36861 (array!99096) Bool)

(assert (=> start!125762 (array_inv!36861 a!2862)))

(declare-fun b!1471614 () Bool)

(declare-fun res!999363 () Bool)

(assert (=> b!1471614 (=> (not res!999363) (not e!826005))))

(assert (=> b!1471614 (= res!999363 e!826008)))

(declare-fun c!135633 () Bool)

(assert (=> b!1471614 (= c!135633 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1471615 () Bool)

(assert (=> b!1471615 (= e!826004 e!826009)))

(declare-fun res!999368 () Bool)

(assert (=> b!1471615 (=> (not res!999368) (not e!826009))))

(assert (=> b!1471615 (= res!999368 (= (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471615 (= lt!643325 (array!99097 (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48383 a!2862)))))

(declare-fun b!1471616 () Bool)

(declare-fun res!999375 () Bool)

(assert (=> b!1471616 (=> (not res!999375) (not e!826004))))

(assert (=> b!1471616 (= res!999375 (and (= (size!48383 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48383 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48383 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471617 () Bool)

(assert (=> b!1471617 (= e!826010 e!826005)))

(declare-fun res!999373 () Bool)

(assert (=> b!1471617 (=> (not res!999373) (not e!826005))))

(assert (=> b!1471617 (= res!999373 (= lt!643328 (Intermediate!12073 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471617 (= lt!643328 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643329 mask!2687) lt!643329 lt!643325 mask!2687))))

(assert (=> b!1471617 (= lt!643329 (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125762 res!999367) b!1471616))

(assert (= (and b!1471616 res!999375) b!1471602))

(assert (= (and b!1471602 res!999376) b!1471603))

(assert (= (and b!1471603 res!999366) b!1471613))

(assert (= (and b!1471613 res!999362) b!1471610))

(assert (= (and b!1471610 res!999364) b!1471606))

(assert (= (and b!1471606 res!999371) b!1471615))

(assert (= (and b!1471615 res!999368) b!1471608))

(assert (= (and b!1471608 res!999365) b!1471607))

(assert (= (and b!1471607 res!999369) b!1471617))

(assert (= (and b!1471617 res!999373) b!1471614))

(assert (= (and b!1471614 c!135633) b!1471601))

(assert (= (and b!1471614 (not c!135633)) b!1471605))

(assert (= (and b!1471614 res!999363) b!1471604))

(assert (= (and b!1471604 res!999370) b!1471611))

(assert (= (and b!1471611 res!999372) b!1471609))

(assert (= (and b!1471609 res!999374) b!1471612))

(declare-fun m!1358397 () Bool)

(assert (=> b!1471607 m!1358397))

(assert (=> b!1471607 m!1358397))

(declare-fun m!1358399 () Bool)

(assert (=> b!1471607 m!1358399))

(assert (=> b!1471609 m!1358397))

(assert (=> b!1471609 m!1358397))

(declare-fun m!1358401 () Bool)

(assert (=> b!1471609 m!1358401))

(assert (=> b!1471608 m!1358397))

(assert (=> b!1471608 m!1358397))

(declare-fun m!1358403 () Bool)

(assert (=> b!1471608 m!1358403))

(assert (=> b!1471608 m!1358403))

(assert (=> b!1471608 m!1358397))

(declare-fun m!1358405 () Bool)

(assert (=> b!1471608 m!1358405))

(declare-fun m!1358407 () Bool)

(assert (=> b!1471613 m!1358407))

(declare-fun m!1358409 () Bool)

(assert (=> b!1471612 m!1358409))

(assert (=> b!1471612 m!1358397))

(declare-fun m!1358411 () Bool)

(assert (=> b!1471601 m!1358411))

(assert (=> b!1471603 m!1358397))

(assert (=> b!1471603 m!1358397))

(declare-fun m!1358413 () Bool)

(assert (=> b!1471603 m!1358413))

(declare-fun m!1358415 () Bool)

(assert (=> b!1471617 m!1358415))

(assert (=> b!1471617 m!1358415))

(declare-fun m!1358417 () Bool)

(assert (=> b!1471617 m!1358417))

(declare-fun m!1358419 () Bool)

(assert (=> b!1471617 m!1358419))

(declare-fun m!1358421 () Bool)

(assert (=> b!1471617 m!1358421))

(declare-fun m!1358423 () Bool)

(assert (=> start!125762 m!1358423))

(declare-fun m!1358425 () Bool)

(assert (=> start!125762 m!1358425))

(declare-fun m!1358427 () Bool)

(assert (=> b!1471602 m!1358427))

(assert (=> b!1471602 m!1358427))

(declare-fun m!1358429 () Bool)

(assert (=> b!1471602 m!1358429))

(declare-fun m!1358431 () Bool)

(assert (=> b!1471610 m!1358431))

(declare-fun m!1358433 () Bool)

(assert (=> b!1471611 m!1358433))

(declare-fun m!1358435 () Bool)

(assert (=> b!1471611 m!1358435))

(assert (=> b!1471615 m!1358419))

(declare-fun m!1358437 () Bool)

(assert (=> b!1471615 m!1358437))

(declare-fun m!1358439 () Bool)

(assert (=> b!1471605 m!1358439))

(declare-fun m!1358441 () Bool)

(assert (=> b!1471605 m!1358441))

(push 1)

