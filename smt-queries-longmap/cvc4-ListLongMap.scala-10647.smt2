; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125024 () Bool)

(assert start!125024)

(declare-fun b!1454436 () Bool)

(declare-fun res!985298 () Bool)

(declare-fun e!818527 () Bool)

(assert (=> b!1454436 (=> (not res!985298) (not e!818527))))

(declare-datatypes ((array!98472 0))(
  ( (array!98473 (arr!47524 (Array (_ BitVec 32) (_ BitVec 64))) (size!48074 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98472)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11776 0))(
  ( (MissingZero!11776 (index!49496 (_ BitVec 32))) (Found!11776 (index!49497 (_ BitVec 32))) (Intermediate!11776 (undefined!12588 Bool) (index!49498 (_ BitVec 32)) (x!131129 (_ BitVec 32))) (Undefined!11776) (MissingVacant!11776 (index!49499 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98472 (_ BitVec 32)) SeekEntryResult!11776)

(assert (=> b!1454436 (= res!985298 (= (seekEntryOrOpen!0 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) (Found!11776 j!93)))))

(declare-fun b!1454438 () Bool)

(declare-fun res!985292 () Bool)

(declare-fun e!818522 () Bool)

(assert (=> b!1454438 (=> (not res!985292) (not e!818522))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454438 (= res!985292 (validKeyInArray!0 (select (arr!47524 a!2862) i!1006)))))

(declare-fun b!1454439 () Bool)

(declare-fun e!818531 () Bool)

(assert (=> b!1454439 (= e!818531 true)))

(declare-fun lt!637593 () Bool)

(declare-fun e!818525 () Bool)

(assert (=> b!1454439 (= lt!637593 e!818525)))

(declare-fun c!134088 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454439 (= c!134088 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454440 () Bool)

(declare-fun e!818528 () Bool)

(assert (=> b!1454440 (= e!818522 e!818528)))

(declare-fun res!985299 () Bool)

(assert (=> b!1454440 (=> (not res!985299) (not e!818528))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454440 (= res!985299 (= (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637589 () array!98472)

(assert (=> b!1454440 (= lt!637589 (array!98473 (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48074 a!2862)))))

(declare-fun b!1454441 () Bool)

(declare-fun lt!637592 () (_ BitVec 64))

(declare-fun lt!637587 () SeekEntryResult!11776)

(declare-fun lt!637588 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98472 (_ BitVec 32)) SeekEntryResult!11776)

(assert (=> b!1454441 (= e!818525 (not (= lt!637587 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637588 lt!637592 lt!637589 mask!2687))))))

(declare-fun b!1454442 () Bool)

(declare-fun e!818526 () Bool)

(declare-fun e!818524 () Bool)

(assert (=> b!1454442 (= e!818526 e!818524)))

(declare-fun res!985296 () Bool)

(assert (=> b!1454442 (=> (not res!985296) (not e!818524))))

(assert (=> b!1454442 (= res!985296 (= lt!637587 (Intermediate!11776 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454442 (= lt!637587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637592 mask!2687) lt!637592 lt!637589 mask!2687))))

(assert (=> b!1454442 (= lt!637592 (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454443 () Bool)

(declare-fun res!985283 () Bool)

(assert (=> b!1454443 (=> (not res!985283) (not e!818522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98472 (_ BitVec 32)) Bool)

(assert (=> b!1454443 (= res!985283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454444 () Bool)

(declare-fun lt!637591 () SeekEntryResult!11776)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98472 (_ BitVec 32)) SeekEntryResult!11776)

(assert (=> b!1454444 (= e!818525 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637588 intermediateAfterIndex!19 lt!637592 lt!637589 mask!2687) lt!637591)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1454445 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1454445 (= e!818527 (and (or (= (select (arr!47524 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47524 a!2862) intermediateBeforeIndex!19) (select (arr!47524 a!2862) j!93))) (let ((bdg!53059 (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47524 a!2862) index!646) bdg!53059) (= (select (arr!47524 a!2862) index!646) (select (arr!47524 a!2862) j!93))) (= (select (arr!47524 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53059 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454446 () Bool)

(declare-fun res!985287 () Bool)

(assert (=> b!1454446 (=> (not res!985287) (not e!818526))))

(declare-fun lt!637586 () SeekEntryResult!11776)

(assert (=> b!1454446 (= res!985287 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637586))))

(declare-fun res!985291 () Bool)

(assert (=> start!125024 (=> (not res!985291) (not e!818522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125024 (= res!985291 (validMask!0 mask!2687))))

(assert (=> start!125024 e!818522))

(assert (=> start!125024 true))

(declare-fun array_inv!36552 (array!98472) Bool)

(assert (=> start!125024 (array_inv!36552 a!2862)))

(declare-fun b!1454437 () Bool)

(declare-fun res!985295 () Bool)

(assert (=> b!1454437 (=> (not res!985295) (not e!818522))))

(assert (=> b!1454437 (= res!985295 (and (= (size!48074 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48074 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48074 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454447 () Bool)

(declare-fun res!985284 () Bool)

(assert (=> b!1454447 (=> (not res!985284) (not e!818524))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454447 (= res!985284 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454448 () Bool)

(declare-fun res!985300 () Bool)

(assert (=> b!1454448 (=> res!985300 e!818531)))

(assert (=> b!1454448 (= res!985300 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637588 (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637586)))))

(declare-fun b!1454449 () Bool)

(declare-fun res!985290 () Bool)

(assert (=> b!1454449 (=> (not res!985290) (not e!818522))))

(assert (=> b!1454449 (= res!985290 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48074 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48074 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48074 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454450 () Bool)

(declare-fun e!818530 () Bool)

(assert (=> b!1454450 (= e!818530 e!818531)))

(declare-fun res!985288 () Bool)

(assert (=> b!1454450 (=> res!985288 e!818531)))

(assert (=> b!1454450 (= res!985288 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637588 #b00000000000000000000000000000000) (bvsge lt!637588 (size!48074 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454450 (= lt!637588 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454450 (= lt!637591 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637592 lt!637589 mask!2687))))

(assert (=> b!1454450 (= lt!637591 (seekEntryOrOpen!0 lt!637592 lt!637589 mask!2687))))

(declare-fun e!818523 () Bool)

(declare-fun b!1454451 () Bool)

(assert (=> b!1454451 (= e!818523 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637592 lt!637589 mask!2687) (seekEntryOrOpen!0 lt!637592 lt!637589 mask!2687)))))

(declare-fun b!1454452 () Bool)

(declare-fun res!985293 () Bool)

(assert (=> b!1454452 (=> (not res!985293) (not e!818522))))

(declare-datatypes ((List!34025 0))(
  ( (Nil!34022) (Cons!34021 (h!35371 (_ BitVec 64)) (t!48719 List!34025)) )
))
(declare-fun arrayNoDuplicates!0 (array!98472 (_ BitVec 32) List!34025) Bool)

(assert (=> b!1454452 (= res!985293 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34022))))

(declare-fun b!1454453 () Bool)

(assert (=> b!1454453 (= e!818524 (not e!818530))))

(declare-fun res!985285 () Bool)

(assert (=> b!1454453 (=> res!985285 e!818530)))

(assert (=> b!1454453 (= res!985285 (or (and (= (select (arr!47524 a!2862) index!646) (select (store (arr!47524 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47524 a!2862) index!646) (select (arr!47524 a!2862) j!93))) (= (select (arr!47524 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454453 e!818527))

(declare-fun res!985286 () Bool)

(assert (=> b!1454453 (=> (not res!985286) (not e!818527))))

(assert (=> b!1454453 (= res!985286 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49048 0))(
  ( (Unit!49049) )
))
(declare-fun lt!637590 () Unit!49048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49048)

(assert (=> b!1454453 (= lt!637590 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454454 () Bool)

(declare-fun res!985294 () Bool)

(assert (=> b!1454454 (=> (not res!985294) (not e!818524))))

(assert (=> b!1454454 (= res!985294 e!818523)))

(declare-fun c!134087 () Bool)

(assert (=> b!1454454 (= c!134087 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454455 () Bool)

(assert (=> b!1454455 (= e!818528 e!818526)))

(declare-fun res!985297 () Bool)

(assert (=> b!1454455 (=> (not res!985297) (not e!818526))))

(assert (=> b!1454455 (= res!985297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47524 a!2862) j!93) mask!2687) (select (arr!47524 a!2862) j!93) a!2862 mask!2687) lt!637586))))

(assert (=> b!1454455 (= lt!637586 (Intermediate!11776 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454456 () Bool)

(assert (=> b!1454456 (= e!818523 (= lt!637587 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637592 lt!637589 mask!2687)))))

(declare-fun b!1454457 () Bool)

(declare-fun res!985289 () Bool)

(assert (=> b!1454457 (=> (not res!985289) (not e!818522))))

(assert (=> b!1454457 (= res!985289 (validKeyInArray!0 (select (arr!47524 a!2862) j!93)))))

(assert (= (and start!125024 res!985291) b!1454437))

(assert (= (and b!1454437 res!985295) b!1454438))

(assert (= (and b!1454438 res!985292) b!1454457))

(assert (= (and b!1454457 res!985289) b!1454443))

(assert (= (and b!1454443 res!985283) b!1454452))

(assert (= (and b!1454452 res!985293) b!1454449))

(assert (= (and b!1454449 res!985290) b!1454440))

(assert (= (and b!1454440 res!985299) b!1454455))

(assert (= (and b!1454455 res!985297) b!1454446))

(assert (= (and b!1454446 res!985287) b!1454442))

(assert (= (and b!1454442 res!985296) b!1454454))

(assert (= (and b!1454454 c!134087) b!1454456))

(assert (= (and b!1454454 (not c!134087)) b!1454451))

(assert (= (and b!1454454 res!985294) b!1454447))

(assert (= (and b!1454447 res!985284) b!1454453))

(assert (= (and b!1454453 res!985286) b!1454436))

(assert (= (and b!1454436 res!985298) b!1454445))

(assert (= (and b!1454453 (not res!985285)) b!1454450))

(assert (= (and b!1454450 (not res!985288)) b!1454448))

(assert (= (and b!1454448 (not res!985300)) b!1454439))

(assert (= (and b!1454439 c!134088) b!1454441))

(assert (= (and b!1454439 (not c!134088)) b!1454444))

(declare-fun m!1342779 () Bool)

(assert (=> b!1454448 m!1342779))

(assert (=> b!1454448 m!1342779))

(declare-fun m!1342781 () Bool)

(assert (=> b!1454448 m!1342781))

(assert (=> b!1454436 m!1342779))

(assert (=> b!1454436 m!1342779))

(declare-fun m!1342783 () Bool)

(assert (=> b!1454436 m!1342783))

(declare-fun m!1342785 () Bool)

(assert (=> b!1454441 m!1342785))

(assert (=> b!1454446 m!1342779))

(assert (=> b!1454446 m!1342779))

(declare-fun m!1342787 () Bool)

(assert (=> b!1454446 m!1342787))

(declare-fun m!1342789 () Bool)

(assert (=> start!125024 m!1342789))

(declare-fun m!1342791 () Bool)

(assert (=> start!125024 m!1342791))

(declare-fun m!1342793 () Bool)

(assert (=> b!1454453 m!1342793))

(declare-fun m!1342795 () Bool)

(assert (=> b!1454453 m!1342795))

(declare-fun m!1342797 () Bool)

(assert (=> b!1454453 m!1342797))

(declare-fun m!1342799 () Bool)

(assert (=> b!1454453 m!1342799))

(declare-fun m!1342801 () Bool)

(assert (=> b!1454453 m!1342801))

(assert (=> b!1454453 m!1342779))

(declare-fun m!1342803 () Bool)

(assert (=> b!1454451 m!1342803))

(declare-fun m!1342805 () Bool)

(assert (=> b!1454451 m!1342805))

(declare-fun m!1342807 () Bool)

(assert (=> b!1454442 m!1342807))

(assert (=> b!1454442 m!1342807))

(declare-fun m!1342809 () Bool)

(assert (=> b!1454442 m!1342809))

(assert (=> b!1454442 m!1342795))

(declare-fun m!1342811 () Bool)

(assert (=> b!1454442 m!1342811))

(declare-fun m!1342813 () Bool)

(assert (=> b!1454444 m!1342813))

(declare-fun m!1342815 () Bool)

(assert (=> b!1454452 m!1342815))

(assert (=> b!1454455 m!1342779))

(assert (=> b!1454455 m!1342779))

(declare-fun m!1342817 () Bool)

(assert (=> b!1454455 m!1342817))

(assert (=> b!1454455 m!1342817))

(assert (=> b!1454455 m!1342779))

(declare-fun m!1342819 () Bool)

(assert (=> b!1454455 m!1342819))

(declare-fun m!1342821 () Bool)

(assert (=> b!1454438 m!1342821))

(assert (=> b!1454438 m!1342821))

(declare-fun m!1342823 () Bool)

(assert (=> b!1454438 m!1342823))

(assert (=> b!1454440 m!1342795))

(declare-fun m!1342825 () Bool)

(assert (=> b!1454440 m!1342825))

(declare-fun m!1342827 () Bool)

(assert (=> b!1454450 m!1342827))

(assert (=> b!1454450 m!1342803))

(assert (=> b!1454450 m!1342805))

(assert (=> b!1454457 m!1342779))

(assert (=> b!1454457 m!1342779))

(declare-fun m!1342829 () Bool)

(assert (=> b!1454457 m!1342829))

(declare-fun m!1342831 () Bool)

(assert (=> b!1454456 m!1342831))

(declare-fun m!1342833 () Bool)

(assert (=> b!1454443 m!1342833))

(assert (=> b!1454445 m!1342795))

(declare-fun m!1342835 () Bool)

(assert (=> b!1454445 m!1342835))

(assert (=> b!1454445 m!1342797))

(assert (=> b!1454445 m!1342799))

(assert (=> b!1454445 m!1342779))

(push 1)

