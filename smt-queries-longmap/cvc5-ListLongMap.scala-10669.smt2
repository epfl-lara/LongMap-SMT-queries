; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125152 () Bool)

(assert start!125152)

(declare-fun b!1458660 () Bool)

(declare-fun res!988742 () Bool)

(declare-fun e!820443 () Bool)

(assert (=> b!1458660 (=> (not res!988742) (not e!820443))))

(declare-fun e!820441 () Bool)

(assert (=> b!1458660 (= res!988742 e!820441)))

(declare-fun c!134472 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458660 (= c!134472 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458661 () Bool)

(declare-fun res!988753 () Bool)

(declare-fun e!820440 () Bool)

(assert (=> b!1458661 (=> (not res!988753) (not e!820440))))

(declare-datatypes ((array!98600 0))(
  ( (array!98601 (arr!47588 (Array (_ BitVec 32) (_ BitVec 64))) (size!48138 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98600)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458661 (= res!988753 (validKeyInArray!0 (select (arr!47588 a!2862) i!1006)))))

(declare-fun b!1458662 () Bool)

(declare-fun res!988740 () Bool)

(assert (=> b!1458662 (=> (not res!988740) (not e!820440))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1458662 (= res!988740 (and (= (size!48138 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48138 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48138 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1458663 () Bool)

(declare-fun res!988756 () Bool)

(assert (=> b!1458663 (=> (not res!988756) (not e!820440))))

(assert (=> b!1458663 (= res!988756 (validKeyInArray!0 (select (arr!47588 a!2862) j!93)))))

(declare-fun b!1458664 () Bool)

(declare-fun res!988749 () Bool)

(declare-fun e!820445 () Bool)

(assert (=> b!1458664 (=> (not res!988749) (not e!820445))))

(declare-datatypes ((SeekEntryResult!11840 0))(
  ( (MissingZero!11840 (index!49752 (_ BitVec 32))) (Found!11840 (index!49753 (_ BitVec 32))) (Intermediate!11840 (undefined!12652 Bool) (index!49754 (_ BitVec 32)) (x!131369 (_ BitVec 32))) (Undefined!11840) (MissingVacant!11840 (index!49755 (_ BitVec 32))) )
))
(declare-fun lt!639128 () SeekEntryResult!11840)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98600 (_ BitVec 32)) SeekEntryResult!11840)

(assert (=> b!1458664 (= res!988749 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47588 a!2862) j!93) a!2862 mask!2687) lt!639128))))

(declare-fun res!988752 () Bool)

(assert (=> start!125152 (=> (not res!988752) (not e!820440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125152 (= res!988752 (validMask!0 mask!2687))))

(assert (=> start!125152 e!820440))

(assert (=> start!125152 true))

(declare-fun array_inv!36616 (array!98600) Bool)

(assert (=> start!125152 (array_inv!36616 a!2862)))

(declare-fun b!1458665 () Bool)

(declare-fun res!988746 () Bool)

(declare-fun e!820446 () Bool)

(assert (=> b!1458665 (=> res!988746 e!820446)))

(declare-fun lt!639131 () (_ BitVec 32))

(assert (=> b!1458665 (= res!988746 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639131 (select (arr!47588 a!2862) j!93) a!2862 mask!2687) lt!639128)))))

(declare-fun lt!639127 () SeekEntryResult!11840)

(declare-fun lt!639126 () array!98600)

(declare-fun lt!639129 () (_ BitVec 64))

(declare-fun b!1458666 () Bool)

(assert (=> b!1458666 (= e!820441 (= lt!639127 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639129 lt!639126 mask!2687)))))

(declare-fun b!1458667 () Bool)

(declare-fun res!988739 () Bool)

(assert (=> b!1458667 (=> (not res!988739) (not e!820440))))

(declare-datatypes ((List!34089 0))(
  ( (Nil!34086) (Cons!34085 (h!35435 (_ BitVec 64)) (t!48783 List!34089)) )
))
(declare-fun arrayNoDuplicates!0 (array!98600 (_ BitVec 32) List!34089) Bool)

(assert (=> b!1458667 (= res!988739 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34086))))

(declare-fun b!1458668 () Bool)

(declare-fun res!988748 () Bool)

(assert (=> b!1458668 (=> (not res!988748) (not e!820440))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1458668 (= res!988748 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48138 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48138 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48138 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458669 () Bool)

(declare-fun e!820448 () Bool)

(assert (=> b!1458669 (= e!820440 e!820448)))

(declare-fun res!988741 () Bool)

(assert (=> b!1458669 (=> (not res!988741) (not e!820448))))

(assert (=> b!1458669 (= res!988741 (= (select (store (arr!47588 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458669 (= lt!639126 (array!98601 (store (arr!47588 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48138 a!2862)))))

(declare-fun b!1458670 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98600 (_ BitVec 32)) SeekEntryResult!11840)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98600 (_ BitVec 32)) SeekEntryResult!11840)

(assert (=> b!1458670 (= e!820441 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639129 lt!639126 mask!2687) (seekEntryOrOpen!0 lt!639129 lt!639126 mask!2687)))))

(declare-fun b!1458671 () Bool)

(declare-fun res!988754 () Bool)

(assert (=> b!1458671 (=> (not res!988754) (not e!820443))))

(assert (=> b!1458671 (= res!988754 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458672 () Bool)

(declare-fun e!820447 () Bool)

(assert (=> b!1458672 (= e!820447 (not (= lt!639127 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639131 lt!639129 lt!639126 mask!2687))))))

(declare-fun b!1458673 () Bool)

(assert (=> b!1458673 (= e!820448 e!820445)))

(declare-fun res!988743 () Bool)

(assert (=> b!1458673 (=> (not res!988743) (not e!820445))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458673 (= res!988743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47588 a!2862) j!93) mask!2687) (select (arr!47588 a!2862) j!93) a!2862 mask!2687) lt!639128))))

(assert (=> b!1458673 (= lt!639128 (Intermediate!11840 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458674 () Bool)

(declare-fun e!820444 () Bool)

(assert (=> b!1458674 (= e!820443 (not e!820444))))

(declare-fun res!988745 () Bool)

(assert (=> b!1458674 (=> res!988745 e!820444)))

(assert (=> b!1458674 (= res!988745 (or (and (= (select (arr!47588 a!2862) index!646) (select (store (arr!47588 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47588 a!2862) index!646) (select (arr!47588 a!2862) j!93))) (= (select (arr!47588 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639132 () SeekEntryResult!11840)

(assert (=> b!1458674 (and (= lt!639132 (Found!11840 j!93)) (or (= (select (arr!47588 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47588 a!2862) intermediateBeforeIndex!19) (select (arr!47588 a!2862) j!93))) (let ((bdg!53449 (select (store (arr!47588 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47588 a!2862) index!646) bdg!53449) (= (select (arr!47588 a!2862) index!646) (select (arr!47588 a!2862) j!93))) (= (select (arr!47588 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53449 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1458674 (= lt!639132 (seekEntryOrOpen!0 (select (arr!47588 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98600 (_ BitVec 32)) Bool)

(assert (=> b!1458674 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49176 0))(
  ( (Unit!49177) )
))
(declare-fun lt!639125 () Unit!49176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49176)

(assert (=> b!1458674 (= lt!639125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!639130 () SeekEntryResult!11840)

(declare-fun b!1458675 () Bool)

(assert (=> b!1458675 (= e!820447 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639131 intermediateAfterIndex!19 lt!639129 lt!639126 mask!2687) lt!639130)))))

(declare-fun b!1458676 () Bool)

(declare-fun res!988755 () Bool)

(assert (=> b!1458676 (=> res!988755 e!820446)))

(assert (=> b!1458676 (= res!988755 e!820447)))

(declare-fun c!134471 () Bool)

(assert (=> b!1458676 (= c!134471 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458677 () Bool)

(declare-fun res!988744 () Bool)

(assert (=> b!1458677 (=> res!988744 e!820446)))

(assert (=> b!1458677 (= res!988744 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1458678 () Bool)

(assert (=> b!1458678 (= e!820444 e!820446)))

(declare-fun res!988747 () Bool)

(assert (=> b!1458678 (=> res!988747 e!820446)))

(assert (=> b!1458678 (= res!988747 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639131 #b00000000000000000000000000000000) (bvsge lt!639131 (size!48138 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458678 (= lt!639131 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1458678 (= lt!639130 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639129 lt!639126 mask!2687))))

(assert (=> b!1458678 (= lt!639130 (seekEntryOrOpen!0 lt!639129 lt!639126 mask!2687))))

(declare-fun b!1458679 () Bool)

(assert (=> b!1458679 (= e!820446 true)))

(assert (=> b!1458679 (= lt!639132 lt!639130)))

(declare-fun lt!639124 () Unit!49176)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49176)

(assert (=> b!1458679 (= lt!639124 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639131 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1458680 () Bool)

(declare-fun res!988750 () Bool)

(assert (=> b!1458680 (=> (not res!988750) (not e!820440))))

(assert (=> b!1458680 (= res!988750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1458681 () Bool)

(assert (=> b!1458681 (= e!820445 e!820443)))

(declare-fun res!988751 () Bool)

(assert (=> b!1458681 (=> (not res!988751) (not e!820443))))

(assert (=> b!1458681 (= res!988751 (= lt!639127 (Intermediate!11840 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1458681 (= lt!639127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639129 mask!2687) lt!639129 lt!639126 mask!2687))))

(assert (=> b!1458681 (= lt!639129 (select (store (arr!47588 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125152 res!988752) b!1458662))

(assert (= (and b!1458662 res!988740) b!1458661))

(assert (= (and b!1458661 res!988753) b!1458663))

(assert (= (and b!1458663 res!988756) b!1458680))

(assert (= (and b!1458680 res!988750) b!1458667))

(assert (= (and b!1458667 res!988739) b!1458668))

(assert (= (and b!1458668 res!988748) b!1458669))

(assert (= (and b!1458669 res!988741) b!1458673))

(assert (= (and b!1458673 res!988743) b!1458664))

(assert (= (and b!1458664 res!988749) b!1458681))

(assert (= (and b!1458681 res!988751) b!1458660))

(assert (= (and b!1458660 c!134472) b!1458666))

(assert (= (and b!1458660 (not c!134472)) b!1458670))

(assert (= (and b!1458660 res!988742) b!1458671))

(assert (= (and b!1458671 res!988754) b!1458674))

(assert (= (and b!1458674 (not res!988745)) b!1458678))

(assert (= (and b!1458678 (not res!988747)) b!1458665))

(assert (= (and b!1458665 (not res!988746)) b!1458676))

(assert (= (and b!1458676 c!134471) b!1458672))

(assert (= (and b!1458676 (not c!134471)) b!1458675))

(assert (= (and b!1458676 (not res!988755)) b!1458677))

(assert (= (and b!1458677 (not res!988744)) b!1458679))

(declare-fun m!1346491 () Bool)

(assert (=> b!1458664 m!1346491))

(assert (=> b!1458664 m!1346491))

(declare-fun m!1346493 () Bool)

(assert (=> b!1458664 m!1346493))

(declare-fun m!1346495 () Bool)

(assert (=> b!1458672 m!1346495))

(declare-fun m!1346497 () Bool)

(assert (=> b!1458680 m!1346497))

(declare-fun m!1346499 () Bool)

(assert (=> b!1458674 m!1346499))

(declare-fun m!1346501 () Bool)

(assert (=> b!1458674 m!1346501))

(declare-fun m!1346503 () Bool)

(assert (=> b!1458674 m!1346503))

(declare-fun m!1346505 () Bool)

(assert (=> b!1458674 m!1346505))

(declare-fun m!1346507 () Bool)

(assert (=> b!1458674 m!1346507))

(assert (=> b!1458674 m!1346491))

(declare-fun m!1346509 () Bool)

(assert (=> b!1458674 m!1346509))

(declare-fun m!1346511 () Bool)

(assert (=> b!1458674 m!1346511))

(assert (=> b!1458674 m!1346491))

(declare-fun m!1346513 () Bool)

(assert (=> b!1458666 m!1346513))

(declare-fun m!1346515 () Bool)

(assert (=> b!1458667 m!1346515))

(assert (=> b!1458663 m!1346491))

(assert (=> b!1458663 m!1346491))

(declare-fun m!1346517 () Bool)

(assert (=> b!1458663 m!1346517))

(declare-fun m!1346519 () Bool)

(assert (=> b!1458678 m!1346519))

(declare-fun m!1346521 () Bool)

(assert (=> b!1458678 m!1346521))

(declare-fun m!1346523 () Bool)

(assert (=> b!1458678 m!1346523))

(declare-fun m!1346525 () Bool)

(assert (=> b!1458679 m!1346525))

(declare-fun m!1346527 () Bool)

(assert (=> b!1458681 m!1346527))

(assert (=> b!1458681 m!1346527))

(declare-fun m!1346529 () Bool)

(assert (=> b!1458681 m!1346529))

(assert (=> b!1458681 m!1346501))

(declare-fun m!1346531 () Bool)

(assert (=> b!1458681 m!1346531))

(assert (=> b!1458670 m!1346521))

(assert (=> b!1458670 m!1346523))

(declare-fun m!1346533 () Bool)

(assert (=> start!125152 m!1346533))

(declare-fun m!1346535 () Bool)

(assert (=> start!125152 m!1346535))

(declare-fun m!1346537 () Bool)

(assert (=> b!1458675 m!1346537))

(assert (=> b!1458669 m!1346501))

(declare-fun m!1346539 () Bool)

(assert (=> b!1458669 m!1346539))

(assert (=> b!1458673 m!1346491))

(assert (=> b!1458673 m!1346491))

(declare-fun m!1346541 () Bool)

(assert (=> b!1458673 m!1346541))

(assert (=> b!1458673 m!1346541))

(assert (=> b!1458673 m!1346491))

(declare-fun m!1346543 () Bool)

(assert (=> b!1458673 m!1346543))

(declare-fun m!1346545 () Bool)

(assert (=> b!1458661 m!1346545))

(assert (=> b!1458661 m!1346545))

(declare-fun m!1346547 () Bool)

(assert (=> b!1458661 m!1346547))

(assert (=> b!1458665 m!1346491))

(assert (=> b!1458665 m!1346491))

(declare-fun m!1346549 () Bool)

(assert (=> b!1458665 m!1346549))

(push 1)

