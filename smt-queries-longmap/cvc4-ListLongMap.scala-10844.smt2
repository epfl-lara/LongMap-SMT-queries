; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126914 () Bool)

(assert start!126914)

(declare-fun b!1491490 () Bool)

(declare-fun e!835653 () Bool)

(assert (=> b!1491490 (= e!835653 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650295 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491490 (= lt!650295 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-datatypes ((SeekEntryResult!12355 0))(
  ( (MissingZero!12355 (index!51812 (_ BitVec 32))) (Found!12355 (index!51813 (_ BitVec 32))) (Intermediate!12355 (undefined!13167 Bool) (index!51814 (_ BitVec 32)) (x!133395 (_ BitVec 32))) (Undefined!12355) (MissingVacant!12355 (index!51815 (_ BitVec 32))) )
))
(declare-fun lt!650296 () SeekEntryResult!12355)

(declare-fun e!835648 () Bool)

(declare-datatypes ((array!99687 0))(
  ( (array!99688 (arr!48115 (Array (_ BitVec 32) (_ BitVec 64))) (size!48665 (_ BitVec 32))) )
))
(declare-fun lt!650293 () array!99687)

(declare-fun lt!650298 () (_ BitVec 64))

(declare-fun b!1491491 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99687 (_ BitVec 32)) SeekEntryResult!12355)

(assert (=> b!1491491 (= e!835648 (= lt!650296 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650298 lt!650293 mask!2687)))))

(declare-fun b!1491492 () Bool)

(declare-fun e!835652 () Bool)

(declare-fun e!835655 () Bool)

(assert (=> b!1491492 (= e!835652 e!835655)))

(declare-fun res!1014657 () Bool)

(assert (=> b!1491492 (=> (not res!1014657) (not e!835655))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491492 (= res!1014657 (= lt!650296 (Intermediate!12355 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491492 (= lt!650296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650298 mask!2687) lt!650298 lt!650293 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99687)

(assert (=> b!1491492 (= lt!650298 (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!835649 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1491493 () Bool)

(assert (=> b!1491493 (= e!835649 (or (= (select (arr!48115 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48115 a!2862) intermediateBeforeIndex!19) (select (arr!48115 a!2862) j!93))))))

(declare-fun b!1491494 () Bool)

(declare-fun res!1014661 () Bool)

(assert (=> b!1491494 (=> (not res!1014661) (not e!835649))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99687 (_ BitVec 32)) SeekEntryResult!12355)

(assert (=> b!1491494 (= res!1014661 (= (seekEntryOrOpen!0 (select (arr!48115 a!2862) j!93) a!2862 mask!2687) (Found!12355 j!93)))))

(declare-fun b!1491495 () Bool)

(declare-fun res!1014658 () Bool)

(declare-fun e!835651 () Bool)

(assert (=> b!1491495 (=> (not res!1014658) (not e!835651))))

(assert (=> b!1491495 (= res!1014658 (and (= (size!48665 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48665 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48665 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491496 () Bool)

(declare-fun res!1014663 () Bool)

(assert (=> b!1491496 (=> (not res!1014663) (not e!835652))))

(declare-fun lt!650294 () SeekEntryResult!12355)

(assert (=> b!1491496 (= res!1014663 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48115 a!2862) j!93) a!2862 mask!2687) lt!650294))))

(declare-fun b!1491498 () Bool)

(declare-fun res!1014659 () Bool)

(assert (=> b!1491498 (=> (not res!1014659) (not e!835651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99687 (_ BitVec 32)) Bool)

(assert (=> b!1491498 (= res!1014659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491499 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99687 (_ BitVec 32)) SeekEntryResult!12355)

(assert (=> b!1491499 (= e!835648 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650298 lt!650293 mask!2687) (seekEntryOrOpen!0 lt!650298 lt!650293 mask!2687)))))

(declare-fun b!1491500 () Bool)

(declare-fun res!1014653 () Bool)

(assert (=> b!1491500 (=> (not res!1014653) (not e!835655))))

(assert (=> b!1491500 (= res!1014653 e!835648)))

(declare-fun c!137946 () Bool)

(assert (=> b!1491500 (= c!137946 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491501 () Bool)

(assert (=> b!1491501 (= e!835655 (not e!835653))))

(declare-fun res!1014666 () Bool)

(assert (=> b!1491501 (=> res!1014666 e!835653)))

(assert (=> b!1491501 (= res!1014666 (or (and (= (select (arr!48115 a!2862) index!646) (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48115 a!2862) index!646) (select (arr!48115 a!2862) j!93))) (= (select (arr!48115 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491501 e!835649))

(declare-fun res!1014656 () Bool)

(assert (=> b!1491501 (=> (not res!1014656) (not e!835649))))

(assert (=> b!1491501 (= res!1014656 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50050 0))(
  ( (Unit!50051) )
))
(declare-fun lt!650297 () Unit!50050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50050)

(assert (=> b!1491501 (= lt!650297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491502 () Bool)

(declare-fun res!1014662 () Bool)

(assert (=> b!1491502 (=> (not res!1014662) (not e!835651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491502 (= res!1014662 (validKeyInArray!0 (select (arr!48115 a!2862) j!93)))))

(declare-fun b!1491503 () Bool)

(declare-fun e!835650 () Bool)

(assert (=> b!1491503 (= e!835650 e!835652)))

(declare-fun res!1014664 () Bool)

(assert (=> b!1491503 (=> (not res!1014664) (not e!835652))))

(assert (=> b!1491503 (= res!1014664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48115 a!2862) j!93) mask!2687) (select (arr!48115 a!2862) j!93) a!2862 mask!2687) lt!650294))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491503 (= lt!650294 (Intermediate!12355 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491504 () Bool)

(declare-fun res!1014654 () Bool)

(assert (=> b!1491504 (=> (not res!1014654) (not e!835651))))

(assert (=> b!1491504 (= res!1014654 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48665 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48665 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48665 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491505 () Bool)

(declare-fun res!1014652 () Bool)

(assert (=> b!1491505 (=> (not res!1014652) (not e!835655))))

(assert (=> b!1491505 (= res!1014652 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1014660 () Bool)

(assert (=> start!126914 (=> (not res!1014660) (not e!835651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126914 (= res!1014660 (validMask!0 mask!2687))))

(assert (=> start!126914 e!835651))

(assert (=> start!126914 true))

(declare-fun array_inv!37143 (array!99687) Bool)

(assert (=> start!126914 (array_inv!37143 a!2862)))

(declare-fun b!1491497 () Bool)

(declare-fun res!1014655 () Bool)

(assert (=> b!1491497 (=> (not res!1014655) (not e!835651))))

(assert (=> b!1491497 (= res!1014655 (validKeyInArray!0 (select (arr!48115 a!2862) i!1006)))))

(declare-fun b!1491506 () Bool)

(declare-fun res!1014665 () Bool)

(assert (=> b!1491506 (=> (not res!1014665) (not e!835651))))

(declare-datatypes ((List!34616 0))(
  ( (Nil!34613) (Cons!34612 (h!35995 (_ BitVec 64)) (t!49310 List!34616)) )
))
(declare-fun arrayNoDuplicates!0 (array!99687 (_ BitVec 32) List!34616) Bool)

(assert (=> b!1491506 (= res!1014665 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34613))))

(declare-fun b!1491507 () Bool)

(assert (=> b!1491507 (= e!835651 e!835650)))

(declare-fun res!1014667 () Bool)

(assert (=> b!1491507 (=> (not res!1014667) (not e!835650))))

(assert (=> b!1491507 (= res!1014667 (= (select (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491507 (= lt!650293 (array!99688 (store (arr!48115 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48665 a!2862)))))

(assert (= (and start!126914 res!1014660) b!1491495))

(assert (= (and b!1491495 res!1014658) b!1491497))

(assert (= (and b!1491497 res!1014655) b!1491502))

(assert (= (and b!1491502 res!1014662) b!1491498))

(assert (= (and b!1491498 res!1014659) b!1491506))

(assert (= (and b!1491506 res!1014665) b!1491504))

(assert (= (and b!1491504 res!1014654) b!1491507))

(assert (= (and b!1491507 res!1014667) b!1491503))

(assert (= (and b!1491503 res!1014664) b!1491496))

(assert (= (and b!1491496 res!1014663) b!1491492))

(assert (= (and b!1491492 res!1014657) b!1491500))

(assert (= (and b!1491500 c!137946) b!1491491))

(assert (= (and b!1491500 (not c!137946)) b!1491499))

(assert (= (and b!1491500 res!1014653) b!1491505))

(assert (= (and b!1491505 res!1014652) b!1491501))

(assert (= (and b!1491501 res!1014656) b!1491494))

(assert (= (and b!1491494 res!1014661) b!1491493))

(assert (= (and b!1491501 (not res!1014666)) b!1491490))

(declare-fun m!1375611 () Bool)

(assert (=> b!1491501 m!1375611))

(declare-fun m!1375613 () Bool)

(assert (=> b!1491501 m!1375613))

(declare-fun m!1375615 () Bool)

(assert (=> b!1491501 m!1375615))

(declare-fun m!1375617 () Bool)

(assert (=> b!1491501 m!1375617))

(declare-fun m!1375619 () Bool)

(assert (=> b!1491501 m!1375619))

(declare-fun m!1375621 () Bool)

(assert (=> b!1491501 m!1375621))

(declare-fun m!1375623 () Bool)

(assert (=> b!1491497 m!1375623))

(assert (=> b!1491497 m!1375623))

(declare-fun m!1375625 () Bool)

(assert (=> b!1491497 m!1375625))

(assert (=> b!1491503 m!1375621))

(assert (=> b!1491503 m!1375621))

(declare-fun m!1375627 () Bool)

(assert (=> b!1491503 m!1375627))

(assert (=> b!1491503 m!1375627))

(assert (=> b!1491503 m!1375621))

(declare-fun m!1375629 () Bool)

(assert (=> b!1491503 m!1375629))

(declare-fun m!1375631 () Bool)

(assert (=> b!1491490 m!1375631))

(declare-fun m!1375633 () Bool)

(assert (=> b!1491492 m!1375633))

(assert (=> b!1491492 m!1375633))

(declare-fun m!1375635 () Bool)

(assert (=> b!1491492 m!1375635))

(assert (=> b!1491492 m!1375613))

(declare-fun m!1375637 () Bool)

(assert (=> b!1491492 m!1375637))

(declare-fun m!1375639 () Bool)

(assert (=> b!1491498 m!1375639))

(declare-fun m!1375641 () Bool)

(assert (=> start!126914 m!1375641))

(declare-fun m!1375643 () Bool)

(assert (=> start!126914 m!1375643))

(assert (=> b!1491507 m!1375613))

(declare-fun m!1375645 () Bool)

(assert (=> b!1491507 m!1375645))

(declare-fun m!1375647 () Bool)

(assert (=> b!1491491 m!1375647))

(assert (=> b!1491502 m!1375621))

(assert (=> b!1491502 m!1375621))

(declare-fun m!1375649 () Bool)

(assert (=> b!1491502 m!1375649))

(declare-fun m!1375651 () Bool)

(assert (=> b!1491506 m!1375651))

(declare-fun m!1375653 () Bool)

(assert (=> b!1491499 m!1375653))

(declare-fun m!1375655 () Bool)

(assert (=> b!1491499 m!1375655))

(assert (=> b!1491494 m!1375621))

(assert (=> b!1491494 m!1375621))

(declare-fun m!1375657 () Bool)

(assert (=> b!1491494 m!1375657))

(declare-fun m!1375659 () Bool)

(assert (=> b!1491493 m!1375659))

(assert (=> b!1491493 m!1375621))

(assert (=> b!1491496 m!1375621))

(assert (=> b!1491496 m!1375621))

(declare-fun m!1375661 () Bool)

(assert (=> b!1491496 m!1375661))

(push 1)

