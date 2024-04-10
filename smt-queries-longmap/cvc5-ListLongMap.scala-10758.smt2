; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125806 () Bool)

(assert start!125806)

(declare-fun b!1472723 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!826470 () Bool)

(declare-datatypes ((array!99140 0))(
  ( (array!99141 (arr!47855 (Array (_ BitVec 32) (_ BitVec 64))) (size!48405 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99140)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1472723 (= e!826470 (or (= (select (arr!47855 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47855 a!2862) intermediateBeforeIndex!19) (select (arr!47855 a!2862) j!93))))))

(declare-fun b!1472724 () Bool)

(declare-fun res!1000363 () Bool)

(declare-fun e!826468 () Bool)

(assert (=> b!1472724 (=> (not res!1000363) (not e!826468))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12095 0))(
  ( (MissingZero!12095 (index!50772 (_ BitVec 32))) (Found!12095 (index!50773 (_ BitVec 32))) (Intermediate!12095 (undefined!12907 Bool) (index!50774 (_ BitVec 32)) (x!132354 (_ BitVec 32))) (Undefined!12095) (MissingVacant!12095 (index!50775 (_ BitVec 32))) )
))
(declare-fun lt!643657 () SeekEntryResult!12095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99140 (_ BitVec 32)) SeekEntryResult!12095)

(assert (=> b!1472724 (= res!1000363 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47855 a!2862) j!93) a!2862 mask!2687) lt!643657))))

(declare-fun b!1472725 () Bool)

(declare-fun res!1000358 () Bool)

(declare-fun e!826469 () Bool)

(assert (=> b!1472725 (=> (not res!1000358) (not e!826469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472725 (= res!1000358 (validKeyInArray!0 (select (arr!47855 a!2862) j!93)))))

(declare-fun b!1472726 () Bool)

(declare-fun e!826471 () Bool)

(assert (=> b!1472726 (= e!826471 e!826468)))

(declare-fun res!1000360 () Bool)

(assert (=> b!1472726 (=> (not res!1000360) (not e!826468))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472726 (= res!1000360 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47855 a!2862) j!93) mask!2687) (select (arr!47855 a!2862) j!93) a!2862 mask!2687) lt!643657))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472726 (= lt!643657 (Intermediate!12095 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472727 () Bool)

(declare-fun res!1000357 () Bool)

(assert (=> b!1472727 (=> (not res!1000357) (not e!826469))))

(declare-datatypes ((List!34356 0))(
  ( (Nil!34353) (Cons!34352 (h!35708 (_ BitVec 64)) (t!49050 List!34356)) )
))
(declare-fun arrayNoDuplicates!0 (array!99140 (_ BitVec 32) List!34356) Bool)

(assert (=> b!1472727 (= res!1000357 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34353))))

(declare-fun b!1472728 () Bool)

(declare-fun e!826466 () Bool)

(declare-fun lt!643655 () (_ BitVec 64))

(declare-fun lt!643659 () array!99140)

(declare-fun lt!643658 () SeekEntryResult!12095)

(assert (=> b!1472728 (= e!826466 (= lt!643658 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643655 lt!643659 mask!2687)))))

(declare-fun b!1472729 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99140 (_ BitVec 32)) SeekEntryResult!12095)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99140 (_ BitVec 32)) SeekEntryResult!12095)

(assert (=> b!1472729 (= e!826466 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643655 lt!643659 mask!2687) (seekEntryOrOpen!0 lt!643655 lt!643659 mask!2687)))))

(declare-fun res!1000365 () Bool)

(assert (=> start!125806 (=> (not res!1000365) (not e!826469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125806 (= res!1000365 (validMask!0 mask!2687))))

(assert (=> start!125806 e!826469))

(assert (=> start!125806 true))

(declare-fun array_inv!36883 (array!99140) Bool)

(assert (=> start!125806 (array_inv!36883 a!2862)))

(declare-fun b!1472730 () Bool)

(declare-fun res!1000355 () Bool)

(assert (=> b!1472730 (=> (not res!1000355) (not e!826469))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472730 (= res!1000355 (validKeyInArray!0 (select (arr!47855 a!2862) i!1006)))))

(declare-fun b!1472731 () Bool)

(declare-fun res!1000361 () Bool)

(declare-fun e!826472 () Bool)

(assert (=> b!1472731 (=> (not res!1000361) (not e!826472))))

(assert (=> b!1472731 (= res!1000361 e!826466)))

(declare-fun c!135699 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472731 (= c!135699 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472732 () Bool)

(declare-fun res!1000366 () Bool)

(assert (=> b!1472732 (=> (not res!1000366) (not e!826469))))

(assert (=> b!1472732 (= res!1000366 (and (= (size!48405 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48405 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48405 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472733 () Bool)

(declare-fun res!1000354 () Bool)

(assert (=> b!1472733 (=> (not res!1000354) (not e!826470))))

(assert (=> b!1472733 (= res!1000354 (= (seekEntryOrOpen!0 (select (arr!47855 a!2862) j!93) a!2862 mask!2687) (Found!12095 j!93)))))

(declare-fun b!1472734 () Bool)

(assert (=> b!1472734 (= e!826469 e!826471)))

(declare-fun res!1000362 () Bool)

(assert (=> b!1472734 (=> (not res!1000362) (not e!826471))))

(assert (=> b!1472734 (= res!1000362 (= (select (store (arr!47855 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472734 (= lt!643659 (array!99141 (store (arr!47855 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48405 a!2862)))))

(declare-fun b!1472735 () Bool)

(declare-fun res!1000364 () Bool)

(assert (=> b!1472735 (=> (not res!1000364) (not e!826469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99140 (_ BitVec 32)) Bool)

(assert (=> b!1472735 (= res!1000364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472736 () Bool)

(declare-fun res!1000352 () Bool)

(assert (=> b!1472736 (=> (not res!1000352) (not e!826472))))

(assert (=> b!1472736 (= res!1000352 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472737 () Bool)

(assert (=> b!1472737 (= e!826468 e!826472)))

(declare-fun res!1000353 () Bool)

(assert (=> b!1472737 (=> (not res!1000353) (not e!826472))))

(assert (=> b!1472737 (= res!1000353 (= lt!643658 (Intermediate!12095 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472737 (= lt!643658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643655 mask!2687) lt!643655 lt!643659 mask!2687))))

(assert (=> b!1472737 (= lt!643655 (select (store (arr!47855 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472738 () Bool)

(assert (=> b!1472738 (= e!826472 (not true))))

(assert (=> b!1472738 e!826470))

(declare-fun res!1000356 () Bool)

(assert (=> b!1472738 (=> (not res!1000356) (not e!826470))))

(assert (=> b!1472738 (= res!1000356 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49530 0))(
  ( (Unit!49531) )
))
(declare-fun lt!643656 () Unit!49530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49530)

(assert (=> b!1472738 (= lt!643656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472739 () Bool)

(declare-fun res!1000359 () Bool)

(assert (=> b!1472739 (=> (not res!1000359) (not e!826469))))

(assert (=> b!1472739 (= res!1000359 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48405 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48405 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48405 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125806 res!1000365) b!1472732))

(assert (= (and b!1472732 res!1000366) b!1472730))

(assert (= (and b!1472730 res!1000355) b!1472725))

(assert (= (and b!1472725 res!1000358) b!1472735))

(assert (= (and b!1472735 res!1000364) b!1472727))

(assert (= (and b!1472727 res!1000357) b!1472739))

(assert (= (and b!1472739 res!1000359) b!1472734))

(assert (= (and b!1472734 res!1000362) b!1472726))

(assert (= (and b!1472726 res!1000360) b!1472724))

(assert (= (and b!1472724 res!1000363) b!1472737))

(assert (= (and b!1472737 res!1000353) b!1472731))

(assert (= (and b!1472731 c!135699) b!1472728))

(assert (= (and b!1472731 (not c!135699)) b!1472729))

(assert (= (and b!1472731 res!1000361) b!1472736))

(assert (= (and b!1472736 res!1000352) b!1472738))

(assert (= (and b!1472738 res!1000356) b!1472733))

(assert (= (and b!1472733 res!1000354) b!1472723))

(declare-fun m!1359409 () Bool)

(assert (=> b!1472733 m!1359409))

(assert (=> b!1472733 m!1359409))

(declare-fun m!1359411 () Bool)

(assert (=> b!1472733 m!1359411))

(assert (=> b!1472725 m!1359409))

(assert (=> b!1472725 m!1359409))

(declare-fun m!1359413 () Bool)

(assert (=> b!1472725 m!1359413))

(assert (=> b!1472726 m!1359409))

(assert (=> b!1472726 m!1359409))

(declare-fun m!1359415 () Bool)

(assert (=> b!1472726 m!1359415))

(assert (=> b!1472726 m!1359415))

(assert (=> b!1472726 m!1359409))

(declare-fun m!1359417 () Bool)

(assert (=> b!1472726 m!1359417))

(declare-fun m!1359419 () Bool)

(assert (=> b!1472737 m!1359419))

(assert (=> b!1472737 m!1359419))

(declare-fun m!1359421 () Bool)

(assert (=> b!1472737 m!1359421))

(declare-fun m!1359423 () Bool)

(assert (=> b!1472737 m!1359423))

(declare-fun m!1359425 () Bool)

(assert (=> b!1472737 m!1359425))

(declare-fun m!1359427 () Bool)

(assert (=> b!1472729 m!1359427))

(declare-fun m!1359429 () Bool)

(assert (=> b!1472729 m!1359429))

(declare-fun m!1359431 () Bool)

(assert (=> start!125806 m!1359431))

(declare-fun m!1359433 () Bool)

(assert (=> start!125806 m!1359433))

(declare-fun m!1359435 () Bool)

(assert (=> b!1472728 m!1359435))

(declare-fun m!1359437 () Bool)

(assert (=> b!1472730 m!1359437))

(assert (=> b!1472730 m!1359437))

(declare-fun m!1359439 () Bool)

(assert (=> b!1472730 m!1359439))

(declare-fun m!1359441 () Bool)

(assert (=> b!1472735 m!1359441))

(declare-fun m!1359443 () Bool)

(assert (=> b!1472727 m!1359443))

(assert (=> b!1472724 m!1359409))

(assert (=> b!1472724 m!1359409))

(declare-fun m!1359445 () Bool)

(assert (=> b!1472724 m!1359445))

(assert (=> b!1472734 m!1359423))

(declare-fun m!1359447 () Bool)

(assert (=> b!1472734 m!1359447))

(declare-fun m!1359449 () Bool)

(assert (=> b!1472723 m!1359449))

(assert (=> b!1472723 m!1359409))

(declare-fun m!1359451 () Bool)

(assert (=> b!1472738 m!1359451))

(declare-fun m!1359453 () Bool)

(assert (=> b!1472738 m!1359453))

(push 1)

