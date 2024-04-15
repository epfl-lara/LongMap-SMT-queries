; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125008 () Bool)

(assert start!125008)

(declare-fun b!1454703 () Bool)

(declare-fun res!985598 () Bool)

(declare-fun e!818616 () Bool)

(assert (=> b!1454703 (=> (not res!985598) (not e!818616))))

(declare-fun e!818620 () Bool)

(assert (=> b!1454703 (= res!985598 e!818620)))

(declare-fun c!134074 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454703 (= c!134074 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454704 () Bool)

(declare-fun res!985586 () Bool)

(declare-fun e!818625 () Bool)

(assert (=> b!1454704 (=> (not res!985586) (not e!818625))))

(declare-datatypes ((array!98434 0))(
  ( (array!98435 (arr!47506 (Array (_ BitVec 32) (_ BitVec 64))) (size!48058 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98434)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454704 (= res!985586 (validKeyInArray!0 (select (arr!47506 a!2862) j!93)))))

(declare-fun b!1454705 () Bool)

(declare-fun res!985592 () Bool)

(assert (=> b!1454705 (=> (not res!985592) (not e!818625))))

(declare-datatypes ((List!34085 0))(
  ( (Nil!34082) (Cons!34081 (h!35431 (_ BitVec 64)) (t!48771 List!34085)) )
))
(declare-fun arrayNoDuplicates!0 (array!98434 (_ BitVec 32) List!34085) Bool)

(assert (=> b!1454705 (= res!985592 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34082))))

(declare-fun lt!637522 () (_ BitVec 32))

(declare-fun e!818621 () Bool)

(declare-fun lt!637523 () array!98434)

(declare-fun lt!637521 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11783 0))(
  ( (MissingZero!11783 (index!49524 (_ BitVec 32))) (Found!11783 (index!49525 (_ BitVec 32))) (Intermediate!11783 (undefined!12595 Bool) (index!49526 (_ BitVec 32)) (x!131155 (_ BitVec 32))) (Undefined!11783) (MissingVacant!11783 (index!49527 (_ BitVec 32))) )
))
(declare-fun lt!637524 () SeekEntryResult!11783)

(declare-fun b!1454706 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98434 (_ BitVec 32)) SeekEntryResult!11783)

(assert (=> b!1454706 (= e!818621 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637522 intermediateAfterIndex!19 lt!637521 lt!637523 mask!2687) lt!637524)))))

(declare-fun b!1454707 () Bool)

(declare-fun res!985591 () Bool)

(assert (=> b!1454707 (=> (not res!985591) (not e!818625))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1454707 (= res!985591 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48058 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48058 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48058 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!637525 () SeekEntryResult!11783)

(declare-fun b!1454708 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98434 (_ BitVec 32)) SeekEntryResult!11783)

(assert (=> b!1454708 (= e!818621 (not (= lt!637525 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637522 lt!637521 lt!637523 mask!2687))))))

(declare-fun b!1454709 () Bool)

(declare-fun e!818624 () Bool)

(assert (=> b!1454709 (= e!818616 (not e!818624))))

(declare-fun res!985583 () Bool)

(assert (=> b!1454709 (=> res!985583 e!818624)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454709 (= res!985583 (or (and (= (select (arr!47506 a!2862) index!646) (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47506 a!2862) index!646) (select (arr!47506 a!2862) j!93))) (= (select (arr!47506 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!818617 () Bool)

(assert (=> b!1454709 e!818617))

(declare-fun res!985594 () Bool)

(assert (=> b!1454709 (=> (not res!985594) (not e!818617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98434 (_ BitVec 32)) Bool)

(assert (=> b!1454709 (= res!985594 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48903 0))(
  ( (Unit!48904) )
))
(declare-fun lt!637520 () Unit!48903)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48903)

(assert (=> b!1454709 (= lt!637520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454710 () Bool)

(declare-fun res!985593 () Bool)

(assert (=> b!1454710 (=> (not res!985593) (not e!818625))))

(assert (=> b!1454710 (= res!985593 (validKeyInArray!0 (select (arr!47506 a!2862) i!1006)))))

(declare-fun b!1454711 () Bool)

(declare-fun res!985585 () Bool)

(assert (=> b!1454711 (=> (not res!985585) (not e!818617))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98434 (_ BitVec 32)) SeekEntryResult!11783)

(assert (=> b!1454711 (= res!985585 (= (seekEntryOrOpen!0 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) (Found!11783 j!93)))))

(declare-fun b!1454712 () Bool)

(declare-fun res!985587 () Bool)

(assert (=> b!1454712 (=> (not res!985587) (not e!818625))))

(assert (=> b!1454712 (= res!985587 (and (= (size!48058 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48058 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48058 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454713 () Bool)

(declare-fun e!818618 () Bool)

(assert (=> b!1454713 (= e!818624 e!818618)))

(declare-fun res!985599 () Bool)

(assert (=> b!1454713 (=> res!985599 e!818618)))

(assert (=> b!1454713 (= res!985599 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637522 #b00000000000000000000000000000000) (bvsge lt!637522 (size!48058 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454713 (= lt!637522 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454713 (= lt!637524 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637521 lt!637523 mask!2687))))

(assert (=> b!1454713 (= lt!637524 (seekEntryOrOpen!0 lt!637521 lt!637523 mask!2687))))

(declare-fun b!1454714 () Bool)

(assert (=> b!1454714 (= e!818617 (and (or (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47506 a!2862) intermediateBeforeIndex!19) (select (arr!47506 a!2862) j!93))) (let ((bdg!53107 (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47506 a!2862) index!646) bdg!53107) (= (select (arr!47506 a!2862) index!646) (select (arr!47506 a!2862) j!93))) (= (select (arr!47506 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53107 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454716 () Bool)

(declare-fun res!985597 () Bool)

(assert (=> b!1454716 (=> (not res!985597) (not e!818616))))

(assert (=> b!1454716 (= res!985597 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454717 () Bool)

(assert (=> b!1454717 (= e!818620 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637521 lt!637523 mask!2687) (seekEntryOrOpen!0 lt!637521 lt!637523 mask!2687)))))

(declare-fun b!1454718 () Bool)

(declare-fun res!985588 () Bool)

(assert (=> b!1454718 (=> res!985588 e!818618)))

(declare-fun lt!637526 () SeekEntryResult!11783)

(assert (=> b!1454718 (= res!985588 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637522 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!637526)))))

(declare-fun b!1454719 () Bool)

(assert (=> b!1454719 (= e!818620 (= lt!637525 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637521 lt!637523 mask!2687)))))

(declare-fun b!1454720 () Bool)

(assert (=> b!1454720 (= e!818618 true)))

(declare-fun lt!637527 () Bool)

(assert (=> b!1454720 (= lt!637527 e!818621)))

(declare-fun c!134073 () Bool)

(assert (=> b!1454720 (= c!134073 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454721 () Bool)

(declare-fun e!818622 () Bool)

(assert (=> b!1454721 (= e!818622 e!818616)))

(declare-fun res!985584 () Bool)

(assert (=> b!1454721 (=> (not res!985584) (not e!818616))))

(assert (=> b!1454721 (= res!985584 (= lt!637525 (Intermediate!11783 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454721 (= lt!637525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637521 mask!2687) lt!637521 lt!637523 mask!2687))))

(assert (=> b!1454721 (= lt!637521 (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454722 () Bool)

(declare-fun res!985590 () Bool)

(assert (=> b!1454722 (=> (not res!985590) (not e!818625))))

(assert (=> b!1454722 (= res!985590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454723 () Bool)

(declare-fun e!818619 () Bool)

(assert (=> b!1454723 (= e!818625 e!818619)))

(declare-fun res!985600 () Bool)

(assert (=> b!1454723 (=> (not res!985600) (not e!818619))))

(assert (=> b!1454723 (= res!985600 (= (select (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454723 (= lt!637523 (array!98435 (store (arr!47506 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48058 a!2862)))))

(declare-fun b!1454724 () Bool)

(declare-fun res!985596 () Bool)

(assert (=> b!1454724 (=> (not res!985596) (not e!818622))))

(assert (=> b!1454724 (= res!985596 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!637526))))

(declare-fun b!1454715 () Bool)

(assert (=> b!1454715 (= e!818619 e!818622)))

(declare-fun res!985595 () Bool)

(assert (=> b!1454715 (=> (not res!985595) (not e!818622))))

(assert (=> b!1454715 (= res!985595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47506 a!2862) j!93) mask!2687) (select (arr!47506 a!2862) j!93) a!2862 mask!2687) lt!637526))))

(assert (=> b!1454715 (= lt!637526 (Intermediate!11783 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!985589 () Bool)

(assert (=> start!125008 (=> (not res!985589) (not e!818625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125008 (= res!985589 (validMask!0 mask!2687))))

(assert (=> start!125008 e!818625))

(assert (=> start!125008 true))

(declare-fun array_inv!36739 (array!98434) Bool)

(assert (=> start!125008 (array_inv!36739 a!2862)))

(assert (= (and start!125008 res!985589) b!1454712))

(assert (= (and b!1454712 res!985587) b!1454710))

(assert (= (and b!1454710 res!985593) b!1454704))

(assert (= (and b!1454704 res!985586) b!1454722))

(assert (= (and b!1454722 res!985590) b!1454705))

(assert (= (and b!1454705 res!985592) b!1454707))

(assert (= (and b!1454707 res!985591) b!1454723))

(assert (= (and b!1454723 res!985600) b!1454715))

(assert (= (and b!1454715 res!985595) b!1454724))

(assert (= (and b!1454724 res!985596) b!1454721))

(assert (= (and b!1454721 res!985584) b!1454703))

(assert (= (and b!1454703 c!134074) b!1454719))

(assert (= (and b!1454703 (not c!134074)) b!1454717))

(assert (= (and b!1454703 res!985598) b!1454716))

(assert (= (and b!1454716 res!985597) b!1454709))

(assert (= (and b!1454709 res!985594) b!1454711))

(assert (= (and b!1454711 res!985585) b!1454714))

(assert (= (and b!1454709 (not res!985583)) b!1454713))

(assert (= (and b!1454713 (not res!985599)) b!1454718))

(assert (= (and b!1454718 (not res!985588)) b!1454720))

(assert (= (and b!1454720 c!134073) b!1454708))

(assert (= (and b!1454720 (not c!134073)) b!1454706))

(declare-fun m!1342509 () Bool)

(assert (=> b!1454709 m!1342509))

(declare-fun m!1342511 () Bool)

(assert (=> b!1454709 m!1342511))

(declare-fun m!1342513 () Bool)

(assert (=> b!1454709 m!1342513))

(declare-fun m!1342515 () Bool)

(assert (=> b!1454709 m!1342515))

(declare-fun m!1342517 () Bool)

(assert (=> b!1454709 m!1342517))

(declare-fun m!1342519 () Bool)

(assert (=> b!1454709 m!1342519))

(declare-fun m!1342521 () Bool)

(assert (=> b!1454710 m!1342521))

(assert (=> b!1454710 m!1342521))

(declare-fun m!1342523 () Bool)

(assert (=> b!1454710 m!1342523))

(assert (=> b!1454724 m!1342519))

(assert (=> b!1454724 m!1342519))

(declare-fun m!1342525 () Bool)

(assert (=> b!1454724 m!1342525))

(assert (=> b!1454704 m!1342519))

(assert (=> b!1454704 m!1342519))

(declare-fun m!1342527 () Bool)

(assert (=> b!1454704 m!1342527))

(declare-fun m!1342529 () Bool)

(assert (=> start!125008 m!1342529))

(declare-fun m!1342531 () Bool)

(assert (=> start!125008 m!1342531))

(declare-fun m!1342533 () Bool)

(assert (=> b!1454721 m!1342533))

(assert (=> b!1454721 m!1342533))

(declare-fun m!1342535 () Bool)

(assert (=> b!1454721 m!1342535))

(assert (=> b!1454721 m!1342511))

(declare-fun m!1342537 () Bool)

(assert (=> b!1454721 m!1342537))

(declare-fun m!1342539 () Bool)

(assert (=> b!1454722 m!1342539))

(assert (=> b!1454718 m!1342519))

(assert (=> b!1454718 m!1342519))

(declare-fun m!1342541 () Bool)

(assert (=> b!1454718 m!1342541))

(assert (=> b!1454715 m!1342519))

(assert (=> b!1454715 m!1342519))

(declare-fun m!1342543 () Bool)

(assert (=> b!1454715 m!1342543))

(assert (=> b!1454715 m!1342543))

(assert (=> b!1454715 m!1342519))

(declare-fun m!1342545 () Bool)

(assert (=> b!1454715 m!1342545))

(declare-fun m!1342547 () Bool)

(assert (=> b!1454719 m!1342547))

(assert (=> b!1454711 m!1342519))

(assert (=> b!1454711 m!1342519))

(declare-fun m!1342549 () Bool)

(assert (=> b!1454711 m!1342549))

(declare-fun m!1342551 () Bool)

(assert (=> b!1454708 m!1342551))

(assert (=> b!1454714 m!1342511))

(declare-fun m!1342553 () Bool)

(assert (=> b!1454714 m!1342553))

(assert (=> b!1454714 m!1342513))

(assert (=> b!1454714 m!1342515))

(assert (=> b!1454714 m!1342519))

(declare-fun m!1342555 () Bool)

(assert (=> b!1454717 m!1342555))

(declare-fun m!1342557 () Bool)

(assert (=> b!1454717 m!1342557))

(assert (=> b!1454723 m!1342511))

(declare-fun m!1342559 () Bool)

(assert (=> b!1454723 m!1342559))

(declare-fun m!1342561 () Bool)

(assert (=> b!1454706 m!1342561))

(declare-fun m!1342563 () Bool)

(assert (=> b!1454713 m!1342563))

(assert (=> b!1454713 m!1342555))

(assert (=> b!1454713 m!1342557))

(declare-fun m!1342565 () Bool)

(assert (=> b!1454705 m!1342565))

(check-sat (not start!125008) (not b!1454717) (not b!1454709) (not b!1454719) (not b!1454713) (not b!1454715) (not b!1454710) (not b!1454711) (not b!1454721) (not b!1454724) (not b!1454706) (not b!1454705) (not b!1454718) (not b!1454708) (not b!1454704) (not b!1454722))
(check-sat)
