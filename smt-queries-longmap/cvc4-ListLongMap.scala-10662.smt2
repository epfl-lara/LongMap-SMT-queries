; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125114 () Bool)

(assert start!125114)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98562 0))(
  ( (array!98563 (arr!47569 (Array (_ BitVec 32) (_ BitVec 64))) (size!48119 (_ BitVec 32))) )
))
(declare-fun lt!638672 () array!98562)

(declare-datatypes ((SeekEntryResult!11821 0))(
  ( (MissingZero!11821 (index!49676 (_ BitVec 32))) (Found!11821 (index!49677 (_ BitVec 32))) (Intermediate!11821 (undefined!12633 Bool) (index!49678 (_ BitVec 32)) (x!131294 (_ BitVec 32))) (Undefined!11821) (MissingVacant!11821 (index!49679 (_ BitVec 32))) )
))
(declare-fun lt!638670 () SeekEntryResult!11821)

(declare-fun e!819874 () Bool)

(declare-fun lt!638671 () (_ BitVec 32))

(declare-fun b!1457406 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!638669 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98562 (_ BitVec 32)) SeekEntryResult!11821)

(assert (=> b!1457406 (= e!819874 (not (= lt!638670 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638671 lt!638669 lt!638672 mask!2687))))))

(declare-fun b!1457407 () Bool)

(declare-fun e!819879 () Bool)

(declare-fun e!819872 () Bool)

(assert (=> b!1457407 (= e!819879 (not e!819872))))

(declare-fun res!987721 () Bool)

(assert (=> b!1457407 (=> res!987721 e!819872)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98562)

(assert (=> b!1457407 (= res!987721 (or (and (= (select (arr!47569 a!2862) index!646) (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47569 a!2862) index!646) (select (arr!47569 a!2862) j!93))) (= (select (arr!47569 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819873 () Bool)

(assert (=> b!1457407 e!819873))

(declare-fun res!987727 () Bool)

(assert (=> b!1457407 (=> (not res!987727) (not e!819873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98562 (_ BitVec 32)) Bool)

(assert (=> b!1457407 (= res!987727 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49138 0))(
  ( (Unit!49139) )
))
(declare-fun lt!638666 () Unit!49138)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49138)

(assert (=> b!1457407 (= lt!638666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457408 () Bool)

(declare-fun res!987728 () Bool)

(declare-fun e!819875 () Bool)

(assert (=> b!1457408 (=> (not res!987728) (not e!819875))))

(declare-datatypes ((List!34070 0))(
  ( (Nil!34067) (Cons!34066 (h!35416 (_ BitVec 64)) (t!48764 List!34070)) )
))
(declare-fun arrayNoDuplicates!0 (array!98562 (_ BitVec 32) List!34070) Bool)

(assert (=> b!1457408 (= res!987728 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34067))))

(declare-fun b!1457409 () Bool)

(declare-fun res!987722 () Bool)

(assert (=> b!1457409 (=> (not res!987722) (not e!819875))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457409 (= res!987722 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48119 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48119 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48119 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457410 () Bool)

(declare-fun res!987723 () Bool)

(declare-fun e!819880 () Bool)

(assert (=> b!1457410 (=> (not res!987723) (not e!819880))))

(declare-fun lt!638673 () SeekEntryResult!11821)

(assert (=> b!1457410 (= res!987723 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47569 a!2862) j!93) a!2862 mask!2687) lt!638673))))

(declare-fun b!1457411 () Bool)

(declare-fun res!987713 () Bool)

(assert (=> b!1457411 (=> (not res!987713) (not e!819875))))

(assert (=> b!1457411 (= res!987713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457412 () Bool)

(declare-fun res!987726 () Bool)

(assert (=> b!1457412 (=> (not res!987726) (not e!819879))))

(assert (=> b!1457412 (= res!987726 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457413 () Bool)

(declare-fun e!819877 () Bool)

(assert (=> b!1457413 (= e!819877 true)))

(declare-fun lt!638668 () Bool)

(assert (=> b!1457413 (= lt!638668 e!819874)))

(declare-fun c!134357 () Bool)

(assert (=> b!1457413 (= c!134357 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457414 () Bool)

(declare-fun res!987730 () Bool)

(assert (=> b!1457414 (=> (not res!987730) (not e!819879))))

(declare-fun e!819876 () Bool)

(assert (=> b!1457414 (= res!987730 e!819876)))

(declare-fun c!134358 () Bool)

(assert (=> b!1457414 (= c!134358 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457415 () Bool)

(assert (=> b!1457415 (= e!819872 e!819877)))

(declare-fun res!987716 () Bool)

(assert (=> b!1457415 (=> res!987716 e!819877)))

(assert (=> b!1457415 (= res!987716 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638671 #b00000000000000000000000000000000) (bvsge lt!638671 (size!48119 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457415 (= lt!638671 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638667 () SeekEntryResult!11821)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98562 (_ BitVec 32)) SeekEntryResult!11821)

(assert (=> b!1457415 (= lt!638667 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638669 lt!638672 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98562 (_ BitVec 32)) SeekEntryResult!11821)

(assert (=> b!1457415 (= lt!638667 (seekEntryOrOpen!0 lt!638669 lt!638672 mask!2687))))

(declare-fun res!987729 () Bool)

(assert (=> start!125114 (=> (not res!987729) (not e!819875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125114 (= res!987729 (validMask!0 mask!2687))))

(assert (=> start!125114 e!819875))

(assert (=> start!125114 true))

(declare-fun array_inv!36597 (array!98562) Bool)

(assert (=> start!125114 (array_inv!36597 a!2862)))

(declare-fun b!1457416 () Bool)

(assert (=> b!1457416 (= e!819874 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638671 intermediateAfterIndex!19 lt!638669 lt!638672 mask!2687) lt!638667)))))

(declare-fun b!1457417 () Bool)

(assert (=> b!1457417 (= e!819876 (= lt!638670 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638669 lt!638672 mask!2687)))))

(declare-fun b!1457418 () Bool)

(declare-fun res!987715 () Bool)

(assert (=> b!1457418 (=> (not res!987715) (not e!819875))))

(assert (=> b!1457418 (= res!987715 (and (= (size!48119 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48119 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48119 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457419 () Bool)

(declare-fun res!987720 () Bool)

(assert (=> b!1457419 (=> (not res!987720) (not e!819873))))

(assert (=> b!1457419 (= res!987720 (= (seekEntryOrOpen!0 (select (arr!47569 a!2862) j!93) a!2862 mask!2687) (Found!11821 j!93)))))

(declare-fun b!1457420 () Bool)

(declare-fun e!819881 () Bool)

(assert (=> b!1457420 (= e!819875 e!819881)))

(declare-fun res!987725 () Bool)

(assert (=> b!1457420 (=> (not res!987725) (not e!819881))))

(assert (=> b!1457420 (= res!987725 (= (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457420 (= lt!638672 (array!98563 (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48119 a!2862)))))

(declare-fun b!1457421 () Bool)

(assert (=> b!1457421 (= e!819873 (and (or (= (select (arr!47569 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47569 a!2862) intermediateBeforeIndex!19) (select (arr!47569 a!2862) j!93))) (let ((bdg!53329 (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47569 a!2862) index!646) bdg!53329) (= (select (arr!47569 a!2862) index!646) (select (arr!47569 a!2862) j!93))) (= (select (arr!47569 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53329 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457422 () Bool)

(declare-fun res!987724 () Bool)

(assert (=> b!1457422 (=> (not res!987724) (not e!819875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457422 (= res!987724 (validKeyInArray!0 (select (arr!47569 a!2862) j!93)))))

(declare-fun b!1457423 () Bool)

(assert (=> b!1457423 (= e!819876 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638669 lt!638672 mask!2687) (seekEntryOrOpen!0 lt!638669 lt!638672 mask!2687)))))

(declare-fun b!1457424 () Bool)

(assert (=> b!1457424 (= e!819880 e!819879)))

(declare-fun res!987714 () Bool)

(assert (=> b!1457424 (=> (not res!987714) (not e!819879))))

(assert (=> b!1457424 (= res!987714 (= lt!638670 (Intermediate!11821 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457424 (= lt!638670 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638669 mask!2687) lt!638669 lt!638672 mask!2687))))

(assert (=> b!1457424 (= lt!638669 (select (store (arr!47569 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457425 () Bool)

(assert (=> b!1457425 (= e!819881 e!819880)))

(declare-fun res!987719 () Bool)

(assert (=> b!1457425 (=> (not res!987719) (not e!819880))))

(assert (=> b!1457425 (= res!987719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47569 a!2862) j!93) mask!2687) (select (arr!47569 a!2862) j!93) a!2862 mask!2687) lt!638673))))

(assert (=> b!1457425 (= lt!638673 (Intermediate!11821 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457426 () Bool)

(declare-fun res!987718 () Bool)

(assert (=> b!1457426 (=> (not res!987718) (not e!819875))))

(assert (=> b!1457426 (= res!987718 (validKeyInArray!0 (select (arr!47569 a!2862) i!1006)))))

(declare-fun b!1457427 () Bool)

(declare-fun res!987717 () Bool)

(assert (=> b!1457427 (=> res!987717 e!819877)))

(assert (=> b!1457427 (= res!987717 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638671 (select (arr!47569 a!2862) j!93) a!2862 mask!2687) lt!638673)))))

(assert (= (and start!125114 res!987729) b!1457418))

(assert (= (and b!1457418 res!987715) b!1457426))

(assert (= (and b!1457426 res!987718) b!1457422))

(assert (= (and b!1457422 res!987724) b!1457411))

(assert (= (and b!1457411 res!987713) b!1457408))

(assert (= (and b!1457408 res!987728) b!1457409))

(assert (= (and b!1457409 res!987722) b!1457420))

(assert (= (and b!1457420 res!987725) b!1457425))

(assert (= (and b!1457425 res!987719) b!1457410))

(assert (= (and b!1457410 res!987723) b!1457424))

(assert (= (and b!1457424 res!987714) b!1457414))

(assert (= (and b!1457414 c!134358) b!1457417))

(assert (= (and b!1457414 (not c!134358)) b!1457423))

(assert (= (and b!1457414 res!987730) b!1457412))

(assert (= (and b!1457412 res!987726) b!1457407))

(assert (= (and b!1457407 res!987727) b!1457419))

(assert (= (and b!1457419 res!987720) b!1457421))

(assert (= (and b!1457407 (not res!987721)) b!1457415))

(assert (= (and b!1457415 (not res!987716)) b!1457427))

(assert (= (and b!1457427 (not res!987717)) b!1457413))

(assert (= (and b!1457413 c!134357) b!1457406))

(assert (= (and b!1457413 (not c!134357)) b!1457416))

(declare-fun m!1345389 () Bool)

(assert (=> b!1457416 m!1345389))

(declare-fun m!1345391 () Bool)

(assert (=> b!1457415 m!1345391))

(declare-fun m!1345393 () Bool)

(assert (=> b!1457415 m!1345393))

(declare-fun m!1345395 () Bool)

(assert (=> b!1457415 m!1345395))

(declare-fun m!1345397 () Bool)

(assert (=> b!1457419 m!1345397))

(assert (=> b!1457419 m!1345397))

(declare-fun m!1345399 () Bool)

(assert (=> b!1457419 m!1345399))

(assert (=> b!1457427 m!1345397))

(assert (=> b!1457427 m!1345397))

(declare-fun m!1345401 () Bool)

(assert (=> b!1457427 m!1345401))

(declare-fun m!1345403 () Bool)

(assert (=> b!1457408 m!1345403))

(declare-fun m!1345405 () Bool)

(assert (=> start!125114 m!1345405))

(declare-fun m!1345407 () Bool)

(assert (=> start!125114 m!1345407))

(declare-fun m!1345409 () Bool)

(assert (=> b!1457424 m!1345409))

(assert (=> b!1457424 m!1345409))

(declare-fun m!1345411 () Bool)

(assert (=> b!1457424 m!1345411))

(declare-fun m!1345413 () Bool)

(assert (=> b!1457424 m!1345413))

(declare-fun m!1345415 () Bool)

(assert (=> b!1457424 m!1345415))

(assert (=> b!1457410 m!1345397))

(assert (=> b!1457410 m!1345397))

(declare-fun m!1345417 () Bool)

(assert (=> b!1457410 m!1345417))

(declare-fun m!1345419 () Bool)

(assert (=> b!1457407 m!1345419))

(assert (=> b!1457407 m!1345413))

(declare-fun m!1345421 () Bool)

(assert (=> b!1457407 m!1345421))

(declare-fun m!1345423 () Bool)

(assert (=> b!1457407 m!1345423))

(declare-fun m!1345425 () Bool)

(assert (=> b!1457407 m!1345425))

(assert (=> b!1457407 m!1345397))

(assert (=> b!1457422 m!1345397))

(assert (=> b!1457422 m!1345397))

(declare-fun m!1345427 () Bool)

(assert (=> b!1457422 m!1345427))

(declare-fun m!1345429 () Bool)

(assert (=> b!1457406 m!1345429))

(declare-fun m!1345431 () Bool)

(assert (=> b!1457426 m!1345431))

(assert (=> b!1457426 m!1345431))

(declare-fun m!1345433 () Bool)

(assert (=> b!1457426 m!1345433))

(declare-fun m!1345435 () Bool)

(assert (=> b!1457411 m!1345435))

(declare-fun m!1345437 () Bool)

(assert (=> b!1457417 m!1345437))

(assert (=> b!1457421 m!1345413))

(declare-fun m!1345439 () Bool)

(assert (=> b!1457421 m!1345439))

(assert (=> b!1457421 m!1345421))

(assert (=> b!1457421 m!1345423))

(assert (=> b!1457421 m!1345397))

(assert (=> b!1457420 m!1345413))

(declare-fun m!1345441 () Bool)

(assert (=> b!1457420 m!1345441))

(assert (=> b!1457425 m!1345397))

(assert (=> b!1457425 m!1345397))

(declare-fun m!1345443 () Bool)

(assert (=> b!1457425 m!1345443))

(assert (=> b!1457425 m!1345443))

(assert (=> b!1457425 m!1345397))

(declare-fun m!1345445 () Bool)

(assert (=> b!1457425 m!1345445))

(assert (=> b!1457423 m!1345393))

(assert (=> b!1457423 m!1345395))

(push 1)

