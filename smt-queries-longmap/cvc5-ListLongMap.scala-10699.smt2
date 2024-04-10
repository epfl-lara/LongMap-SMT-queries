; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125332 () Bool)

(assert start!125332)

(declare-fun b!1464429 () Bool)

(declare-fun e!822973 () Bool)

(assert (=> b!1464429 (= e!822973 true)))

(declare-fun lt!641086 () Bool)

(declare-fun e!822979 () Bool)

(assert (=> b!1464429 (= lt!641086 e!822979)))

(declare-fun c!134976 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464429 (= c!134976 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464430 () Bool)

(declare-fun res!993507 () Bool)

(declare-fun e!822975 () Bool)

(assert (=> b!1464430 (=> (not res!993507) (not e!822975))))

(declare-datatypes ((array!98780 0))(
  ( (array!98781 (arr!47678 (Array (_ BitVec 32) (_ BitVec 64))) (size!48228 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98780)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464430 (= res!993507 (validKeyInArray!0 (select (arr!47678 a!2862) i!1006)))))

(declare-fun b!1464431 () Bool)

(declare-fun e!822980 () Bool)

(declare-fun e!822971 () Bool)

(assert (=> b!1464431 (= e!822980 e!822971)))

(declare-fun res!993506 () Bool)

(assert (=> b!1464431 (=> (not res!993506) (not e!822971))))

(declare-datatypes ((SeekEntryResult!11930 0))(
  ( (MissingZero!11930 (index!50112 (_ BitVec 32))) (Found!11930 (index!50113 (_ BitVec 32))) (Intermediate!11930 (undefined!12742 Bool) (index!50114 (_ BitVec 32)) (x!131699 (_ BitVec 32))) (Undefined!11930) (MissingVacant!11930 (index!50115 (_ BitVec 32))) )
))
(declare-fun lt!641087 () SeekEntryResult!11930)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464431 (= res!993506 (= lt!641087 (Intermediate!11930 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641084 () array!98780)

(declare-fun lt!641085 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98780 (_ BitVec 32)) SeekEntryResult!11930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464431 (= lt!641087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641085 mask!2687) lt!641085 lt!641084 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1464431 (= lt!641085 (select (store (arr!47678 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464432 () Bool)

(declare-fun res!993500 () Bool)

(assert (=> b!1464432 (=> res!993500 e!822973)))

(declare-fun lt!641088 () (_ BitVec 32))

(declare-fun lt!641083 () SeekEntryResult!11930)

(assert (=> b!1464432 (= res!993500 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641088 (select (arr!47678 a!2862) j!93) a!2862 mask!2687) lt!641083)))))

(declare-fun b!1464433 () Bool)

(declare-fun res!993511 () Bool)

(assert (=> b!1464433 (=> (not res!993511) (not e!822975))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1464433 (= res!993511 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48228 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48228 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48228 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464434 () Bool)

(declare-fun res!993504 () Bool)

(assert (=> b!1464434 (=> (not res!993504) (not e!822975))))

(declare-datatypes ((List!34179 0))(
  ( (Nil!34176) (Cons!34175 (h!35525 (_ BitVec 64)) (t!48873 List!34179)) )
))
(declare-fun arrayNoDuplicates!0 (array!98780 (_ BitVec 32) List!34179) Bool)

(assert (=> b!1464434 (= res!993504 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34176))))

(declare-fun b!1464435 () Bool)

(declare-fun e!822972 () Bool)

(assert (=> b!1464435 (= e!822972 e!822973)))

(declare-fun res!993512 () Bool)

(assert (=> b!1464435 (=> res!993512 e!822973)))

(assert (=> b!1464435 (= res!993512 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641088 #b00000000000000000000000000000000) (bvsge lt!641088 (size!48228 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464435 (= lt!641088 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464436 () Bool)

(declare-fun res!993515 () Bool)

(assert (=> b!1464436 (=> (not res!993515) (not e!822971))))

(declare-fun e!822976 () Bool)

(assert (=> b!1464436 (= res!993515 e!822976)))

(declare-fun c!134975 () Bool)

(assert (=> b!1464436 (= c!134975 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464437 () Bool)

(declare-fun res!993517 () Bool)

(assert (=> b!1464437 (=> (not res!993517) (not e!822975))))

(assert (=> b!1464437 (= res!993517 (validKeyInArray!0 (select (arr!47678 a!2862) j!93)))))

(declare-fun b!1464438 () Bool)

(declare-fun res!993505 () Bool)

(assert (=> b!1464438 (=> (not res!993505) (not e!822980))))

(assert (=> b!1464438 (= res!993505 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47678 a!2862) j!93) a!2862 mask!2687) lt!641083))))

(declare-fun b!1464440 () Bool)

(declare-fun res!993513 () Bool)

(assert (=> b!1464440 (=> (not res!993513) (not e!822975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98780 (_ BitVec 32)) Bool)

(assert (=> b!1464440 (= res!993513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464441 () Bool)

(declare-fun res!993509 () Bool)

(declare-fun e!822978 () Bool)

(assert (=> b!1464441 (=> (not res!993509) (not e!822978))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98780 (_ BitVec 32)) SeekEntryResult!11930)

(assert (=> b!1464441 (= res!993509 (= (seekEntryOrOpen!0 (select (arr!47678 a!2862) j!93) a!2862 mask!2687) (Found!11930 j!93)))))

(declare-fun b!1464442 () Bool)

(declare-fun res!993516 () Bool)

(assert (=> b!1464442 (=> (not res!993516) (not e!822971))))

(assert (=> b!1464442 (= res!993516 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464443 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98780 (_ BitVec 32)) SeekEntryResult!11930)

(assert (=> b!1464443 (= e!822979 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641088 intermediateAfterIndex!19 lt!641085 lt!641084 mask!2687) (seekEntryOrOpen!0 lt!641085 lt!641084 mask!2687))))))

(declare-fun b!1464444 () Bool)

(assert (=> b!1464444 (= e!822971 (not e!822972))))

(declare-fun res!993501 () Bool)

(assert (=> b!1464444 (=> res!993501 e!822972)))

(assert (=> b!1464444 (= res!993501 (or (and (= (select (arr!47678 a!2862) index!646) (select (store (arr!47678 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47678 a!2862) index!646) (select (arr!47678 a!2862) j!93))) (= (select (arr!47678 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464444 e!822978))

(declare-fun res!993514 () Bool)

(assert (=> b!1464444 (=> (not res!993514) (not e!822978))))

(assert (=> b!1464444 (= res!993514 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49356 0))(
  ( (Unit!49357) )
))
(declare-fun lt!641082 () Unit!49356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98780 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49356)

(assert (=> b!1464444 (= lt!641082 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464445 () Bool)

(assert (=> b!1464445 (= e!822976 (= lt!641087 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641085 lt!641084 mask!2687)))))

(declare-fun b!1464446 () Bool)

(assert (=> b!1464446 (= e!822979 (not (= lt!641087 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641088 lt!641085 lt!641084 mask!2687))))))

(declare-fun b!1464447 () Bool)

(assert (=> b!1464447 (= e!822978 (or (= (select (arr!47678 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47678 a!2862) intermediateBeforeIndex!19) (select (arr!47678 a!2862) j!93))))))

(declare-fun b!1464448 () Bool)

(declare-fun e!822974 () Bool)

(assert (=> b!1464448 (= e!822974 e!822980)))

(declare-fun res!993502 () Bool)

(assert (=> b!1464448 (=> (not res!993502) (not e!822980))))

(assert (=> b!1464448 (= res!993502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47678 a!2862) j!93) mask!2687) (select (arr!47678 a!2862) j!93) a!2862 mask!2687) lt!641083))))

(assert (=> b!1464448 (= lt!641083 (Intermediate!11930 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464449 () Bool)

(assert (=> b!1464449 (= e!822975 e!822974)))

(declare-fun res!993503 () Bool)

(assert (=> b!1464449 (=> (not res!993503) (not e!822974))))

(assert (=> b!1464449 (= res!993503 (= (select (store (arr!47678 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464449 (= lt!641084 (array!98781 (store (arr!47678 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48228 a!2862)))))

(declare-fun b!1464450 () Bool)

(declare-fun res!993510 () Bool)

(assert (=> b!1464450 (=> (not res!993510) (not e!822975))))

(assert (=> b!1464450 (= res!993510 (and (= (size!48228 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48228 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48228 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!993508 () Bool)

(assert (=> start!125332 (=> (not res!993508) (not e!822975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125332 (= res!993508 (validMask!0 mask!2687))))

(assert (=> start!125332 e!822975))

(assert (=> start!125332 true))

(declare-fun array_inv!36706 (array!98780) Bool)

(assert (=> start!125332 (array_inv!36706 a!2862)))

(declare-fun b!1464439 () Bool)

(assert (=> b!1464439 (= e!822976 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641085 lt!641084 mask!2687) (seekEntryOrOpen!0 lt!641085 lt!641084 mask!2687)))))

(assert (= (and start!125332 res!993508) b!1464450))

(assert (= (and b!1464450 res!993510) b!1464430))

(assert (= (and b!1464430 res!993507) b!1464437))

(assert (= (and b!1464437 res!993517) b!1464440))

(assert (= (and b!1464440 res!993513) b!1464434))

(assert (= (and b!1464434 res!993504) b!1464433))

(assert (= (and b!1464433 res!993511) b!1464449))

(assert (= (and b!1464449 res!993503) b!1464448))

(assert (= (and b!1464448 res!993502) b!1464438))

(assert (= (and b!1464438 res!993505) b!1464431))

(assert (= (and b!1464431 res!993506) b!1464436))

(assert (= (and b!1464436 c!134975) b!1464445))

(assert (= (and b!1464436 (not c!134975)) b!1464439))

(assert (= (and b!1464436 res!993515) b!1464442))

(assert (= (and b!1464442 res!993516) b!1464444))

(assert (= (and b!1464444 res!993514) b!1464441))

(assert (= (and b!1464441 res!993509) b!1464447))

(assert (= (and b!1464444 (not res!993501)) b!1464435))

(assert (= (and b!1464435 (not res!993512)) b!1464432))

(assert (= (and b!1464432 (not res!993500)) b!1464429))

(assert (= (and b!1464429 c!134976) b!1464446))

(assert (= (and b!1464429 (not c!134976)) b!1464443))

(declare-fun m!1351645 () Bool)

(assert (=> b!1464430 m!1351645))

(assert (=> b!1464430 m!1351645))

(declare-fun m!1351647 () Bool)

(assert (=> b!1464430 m!1351647))

(declare-fun m!1351649 () Bool)

(assert (=> b!1464431 m!1351649))

(assert (=> b!1464431 m!1351649))

(declare-fun m!1351651 () Bool)

(assert (=> b!1464431 m!1351651))

(declare-fun m!1351653 () Bool)

(assert (=> b!1464431 m!1351653))

(declare-fun m!1351655 () Bool)

(assert (=> b!1464431 m!1351655))

(declare-fun m!1351657 () Bool)

(assert (=> start!125332 m!1351657))

(declare-fun m!1351659 () Bool)

(assert (=> start!125332 m!1351659))

(declare-fun m!1351661 () Bool)

(assert (=> b!1464448 m!1351661))

(assert (=> b!1464448 m!1351661))

(declare-fun m!1351663 () Bool)

(assert (=> b!1464448 m!1351663))

(assert (=> b!1464448 m!1351663))

(assert (=> b!1464448 m!1351661))

(declare-fun m!1351665 () Bool)

(assert (=> b!1464448 m!1351665))

(declare-fun m!1351667 () Bool)

(assert (=> b!1464439 m!1351667))

(declare-fun m!1351669 () Bool)

(assert (=> b!1464439 m!1351669))

(assert (=> b!1464441 m!1351661))

(assert (=> b!1464441 m!1351661))

(declare-fun m!1351671 () Bool)

(assert (=> b!1464441 m!1351671))

(assert (=> b!1464437 m!1351661))

(assert (=> b!1464437 m!1351661))

(declare-fun m!1351673 () Bool)

(assert (=> b!1464437 m!1351673))

(assert (=> b!1464449 m!1351653))

(declare-fun m!1351675 () Bool)

(assert (=> b!1464449 m!1351675))

(declare-fun m!1351677 () Bool)

(assert (=> b!1464434 m!1351677))

(declare-fun m!1351679 () Bool)

(assert (=> b!1464444 m!1351679))

(assert (=> b!1464444 m!1351653))

(declare-fun m!1351681 () Bool)

(assert (=> b!1464444 m!1351681))

(declare-fun m!1351683 () Bool)

(assert (=> b!1464444 m!1351683))

(declare-fun m!1351685 () Bool)

(assert (=> b!1464444 m!1351685))

(assert (=> b!1464444 m!1351661))

(declare-fun m!1351687 () Bool)

(assert (=> b!1464443 m!1351687))

(assert (=> b!1464443 m!1351669))

(declare-fun m!1351689 () Bool)

(assert (=> b!1464440 m!1351689))

(declare-fun m!1351691 () Bool)

(assert (=> b!1464435 m!1351691))

(declare-fun m!1351693 () Bool)

(assert (=> b!1464447 m!1351693))

(assert (=> b!1464447 m!1351661))

(declare-fun m!1351695 () Bool)

(assert (=> b!1464445 m!1351695))

(declare-fun m!1351697 () Bool)

(assert (=> b!1464446 m!1351697))

(assert (=> b!1464432 m!1351661))

(assert (=> b!1464432 m!1351661))

(declare-fun m!1351699 () Bool)

(assert (=> b!1464432 m!1351699))

(assert (=> b!1464438 m!1351661))

(assert (=> b!1464438 m!1351661))

(declare-fun m!1351701 () Bool)

(assert (=> b!1464438 m!1351701))

(push 1)

