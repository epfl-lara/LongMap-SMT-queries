; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125184 () Bool)

(assert start!125184)

(declare-fun b!1459716 () Bool)

(declare-fun e!820873 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1459716 (= e!820873 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!11856 0))(
  ( (MissingZero!11856 (index!49816 (_ BitVec 32))) (Found!11856 (index!49817 (_ BitVec 32))) (Intermediate!11856 (undefined!12668 Bool) (index!49818 (_ BitVec 32)) (x!131425 (_ BitVec 32))) (Undefined!11856) (MissingVacant!11856 (index!49819 (_ BitVec 32))) )
))
(declare-fun lt!639557 () SeekEntryResult!11856)

(declare-fun lt!639562 () SeekEntryResult!11856)

(assert (=> b!1459716 (= lt!639557 lt!639562)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49208 0))(
  ( (Unit!49209) )
))
(declare-fun lt!639563 () Unit!49208)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639560 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98632 0))(
  ( (array!98633 (arr!47604 (Array (_ BitVec 32) (_ BitVec 64))) (size!48154 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98632)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49208)

(assert (=> b!1459716 (= lt!639563 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639560 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459717 () Bool)

(declare-fun res!989609 () Bool)

(declare-fun e!820876 () Bool)

(assert (=> b!1459717 (=> (not res!989609) (not e!820876))))

(declare-fun lt!639564 () SeekEntryResult!11856)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98632 (_ BitVec 32)) SeekEntryResult!11856)

(assert (=> b!1459717 (= res!989609 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47604 a!2862) j!93) a!2862 mask!2687) lt!639564))))

(declare-fun b!1459718 () Bool)

(declare-fun res!989617 () Bool)

(declare-fun e!820872 () Bool)

(assert (=> b!1459718 (=> (not res!989617) (not e!820872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459718 (= res!989617 (validKeyInArray!0 (select (arr!47604 a!2862) i!1006)))))

(declare-fun b!1459719 () Bool)

(declare-fun e!820877 () Bool)

(assert (=> b!1459719 (= e!820872 e!820877)))

(declare-fun res!989605 () Bool)

(assert (=> b!1459719 (=> (not res!989605) (not e!820877))))

(assert (=> b!1459719 (= res!989605 (= (select (store (arr!47604 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639558 () array!98632)

(assert (=> b!1459719 (= lt!639558 (array!98633 (store (arr!47604 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48154 a!2862)))))

(declare-fun b!1459721 () Bool)

(declare-fun res!989613 () Bool)

(assert (=> b!1459721 (=> (not res!989613) (not e!820872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98632 (_ BitVec 32)) Bool)

(assert (=> b!1459721 (= res!989613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459722 () Bool)

(declare-fun res!989619 () Bool)

(assert (=> b!1459722 (=> (not res!989619) (not e!820872))))

(declare-datatypes ((List!34105 0))(
  ( (Nil!34102) (Cons!34101 (h!35451 (_ BitVec 64)) (t!48799 List!34105)) )
))
(declare-fun arrayNoDuplicates!0 (array!98632 (_ BitVec 32) List!34105) Bool)

(assert (=> b!1459722 (= res!989619 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34102))))

(declare-fun b!1459723 () Bool)

(declare-fun res!989607 () Bool)

(assert (=> b!1459723 (=> (not res!989607) (not e!820872))))

(assert (=> b!1459723 (= res!989607 (validKeyInArray!0 (select (arr!47604 a!2862) j!93)))))

(declare-fun b!1459724 () Bool)

(declare-fun res!989614 () Bool)

(assert (=> b!1459724 (=> (not res!989614) (not e!820872))))

(assert (=> b!1459724 (= res!989614 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48154 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48154 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48154 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459725 () Bool)

(declare-fun res!989603 () Bool)

(assert (=> b!1459725 (=> res!989603 e!820873)))

(declare-fun e!820880 () Bool)

(assert (=> b!1459725 (= res!989603 e!820880)))

(declare-fun c!134567 () Bool)

(assert (=> b!1459725 (= c!134567 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!639559 () (_ BitVec 64))

(declare-fun lt!639556 () SeekEntryResult!11856)

(declare-fun b!1459726 () Bool)

(assert (=> b!1459726 (= e!820880 (not (= lt!639556 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639560 lt!639559 lt!639558 mask!2687))))))

(declare-fun b!1459727 () Bool)

(declare-fun res!989620 () Bool)

(assert (=> b!1459727 (=> (not res!989620) (not e!820872))))

(assert (=> b!1459727 (= res!989620 (and (= (size!48154 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48154 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48154 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459728 () Bool)

(declare-fun e!820875 () Bool)

(assert (=> b!1459728 (= e!820876 e!820875)))

(declare-fun res!989610 () Bool)

(assert (=> b!1459728 (=> (not res!989610) (not e!820875))))

(assert (=> b!1459728 (= res!989610 (= lt!639556 (Intermediate!11856 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459728 (= lt!639556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639559 mask!2687) lt!639559 lt!639558 mask!2687))))

(assert (=> b!1459728 (= lt!639559 (select (store (arr!47604 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459729 () Bool)

(declare-fun res!989608 () Bool)

(assert (=> b!1459729 (=> (not res!989608) (not e!820875))))

(assert (=> b!1459729 (= res!989608 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459730 () Bool)

(assert (=> b!1459730 (= e!820877 e!820876)))

(declare-fun res!989618 () Bool)

(assert (=> b!1459730 (=> (not res!989618) (not e!820876))))

(assert (=> b!1459730 (= res!989618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47604 a!2862) j!93) mask!2687) (select (arr!47604 a!2862) j!93) a!2862 mask!2687) lt!639564))))

(assert (=> b!1459730 (= lt!639564 (Intermediate!11856 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459731 () Bool)

(declare-fun res!989611 () Bool)

(assert (=> b!1459731 (=> (not res!989611) (not e!820875))))

(declare-fun e!820879 () Bool)

(assert (=> b!1459731 (= res!989611 e!820879)))

(declare-fun c!134568 () Bool)

(assert (=> b!1459731 (= c!134568 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459732 () Bool)

(declare-fun e!820878 () Bool)

(assert (=> b!1459732 (= e!820875 (not e!820878))))

(declare-fun res!989612 () Bool)

(assert (=> b!1459732 (=> res!989612 e!820878)))

(assert (=> b!1459732 (= res!989612 (or (and (= (select (arr!47604 a!2862) index!646) (select (store (arr!47604 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47604 a!2862) index!646) (select (arr!47604 a!2862) j!93))) (= (select (arr!47604 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459732 (and (= lt!639557 (Found!11856 j!93)) (or (= (select (arr!47604 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47604 a!2862) intermediateBeforeIndex!19) (select (arr!47604 a!2862) j!93))) (let ((bdg!53531 (select (store (arr!47604 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47604 a!2862) index!646) bdg!53531) (= (select (arr!47604 a!2862) index!646) (select (arr!47604 a!2862) j!93))) (= (select (arr!47604 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53531 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98632 (_ BitVec 32)) SeekEntryResult!11856)

(assert (=> b!1459732 (= lt!639557 (seekEntryOrOpen!0 (select (arr!47604 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459732 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639561 () Unit!49208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49208)

(assert (=> b!1459732 (= lt!639561 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459720 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98632 (_ BitVec 32)) SeekEntryResult!11856)

(assert (=> b!1459720 (= e!820880 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639560 intermediateAfterIndex!19 lt!639559 lt!639558 mask!2687) lt!639562)))))

(declare-fun res!989606 () Bool)

(assert (=> start!125184 (=> (not res!989606) (not e!820872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125184 (= res!989606 (validMask!0 mask!2687))))

(assert (=> start!125184 e!820872))

(assert (=> start!125184 true))

(declare-fun array_inv!36632 (array!98632) Bool)

(assert (=> start!125184 (array_inv!36632 a!2862)))

(declare-fun b!1459733 () Bool)

(assert (=> b!1459733 (= e!820879 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639559 lt!639558 mask!2687) (seekEntryOrOpen!0 lt!639559 lt!639558 mask!2687)))))

(declare-fun b!1459734 () Bool)

(declare-fun res!989616 () Bool)

(assert (=> b!1459734 (=> res!989616 e!820873)))

(assert (=> b!1459734 (= res!989616 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459735 () Bool)

(assert (=> b!1459735 (= e!820878 e!820873)))

(declare-fun res!989615 () Bool)

(assert (=> b!1459735 (=> res!989615 e!820873)))

(assert (=> b!1459735 (= res!989615 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639560 #b00000000000000000000000000000000) (bvsge lt!639560 (size!48154 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459735 (= lt!639560 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459735 (= lt!639562 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639559 lt!639558 mask!2687))))

(assert (=> b!1459735 (= lt!639562 (seekEntryOrOpen!0 lt!639559 lt!639558 mask!2687))))

(declare-fun b!1459736 () Bool)

(assert (=> b!1459736 (= e!820879 (= lt!639556 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639559 lt!639558 mask!2687)))))

(declare-fun b!1459737 () Bool)

(declare-fun res!989604 () Bool)

(assert (=> b!1459737 (=> res!989604 e!820873)))

(assert (=> b!1459737 (= res!989604 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639560 (select (arr!47604 a!2862) j!93) a!2862 mask!2687) lt!639564)))))

(assert (= (and start!125184 res!989606) b!1459727))

(assert (= (and b!1459727 res!989620) b!1459718))

(assert (= (and b!1459718 res!989617) b!1459723))

(assert (= (and b!1459723 res!989607) b!1459721))

(assert (= (and b!1459721 res!989613) b!1459722))

(assert (= (and b!1459722 res!989619) b!1459724))

(assert (= (and b!1459724 res!989614) b!1459719))

(assert (= (and b!1459719 res!989605) b!1459730))

(assert (= (and b!1459730 res!989618) b!1459717))

(assert (= (and b!1459717 res!989609) b!1459728))

(assert (= (and b!1459728 res!989610) b!1459731))

(assert (= (and b!1459731 c!134568) b!1459736))

(assert (= (and b!1459731 (not c!134568)) b!1459733))

(assert (= (and b!1459731 res!989611) b!1459729))

(assert (= (and b!1459729 res!989608) b!1459732))

(assert (= (and b!1459732 (not res!989612)) b!1459735))

(assert (= (and b!1459735 (not res!989615)) b!1459737))

(assert (= (and b!1459737 (not res!989604)) b!1459725))

(assert (= (and b!1459725 c!134567) b!1459726))

(assert (= (and b!1459725 (not c!134567)) b!1459720))

(assert (= (and b!1459725 (not res!989603)) b!1459734))

(assert (= (and b!1459734 (not res!989616)) b!1459716))

(declare-fun m!1347451 () Bool)

(assert (=> b!1459718 m!1347451))

(assert (=> b!1459718 m!1347451))

(declare-fun m!1347453 () Bool)

(assert (=> b!1459718 m!1347453))

(declare-fun m!1347455 () Bool)

(assert (=> b!1459733 m!1347455))

(declare-fun m!1347457 () Bool)

(assert (=> b!1459733 m!1347457))

(declare-fun m!1347459 () Bool)

(assert (=> b!1459716 m!1347459))

(declare-fun m!1347461 () Bool)

(assert (=> b!1459723 m!1347461))

(assert (=> b!1459723 m!1347461))

(declare-fun m!1347463 () Bool)

(assert (=> b!1459723 m!1347463))

(declare-fun m!1347465 () Bool)

(assert (=> b!1459720 m!1347465))

(declare-fun m!1347467 () Bool)

(assert (=> b!1459722 m!1347467))

(assert (=> b!1459730 m!1347461))

(assert (=> b!1459730 m!1347461))

(declare-fun m!1347469 () Bool)

(assert (=> b!1459730 m!1347469))

(assert (=> b!1459730 m!1347469))

(assert (=> b!1459730 m!1347461))

(declare-fun m!1347471 () Bool)

(assert (=> b!1459730 m!1347471))

(declare-fun m!1347473 () Bool)

(assert (=> b!1459728 m!1347473))

(assert (=> b!1459728 m!1347473))

(declare-fun m!1347475 () Bool)

(assert (=> b!1459728 m!1347475))

(declare-fun m!1347477 () Bool)

(assert (=> b!1459728 m!1347477))

(declare-fun m!1347479 () Bool)

(assert (=> b!1459728 m!1347479))

(declare-fun m!1347481 () Bool)

(assert (=> b!1459735 m!1347481))

(assert (=> b!1459735 m!1347455))

(assert (=> b!1459735 m!1347457))

(declare-fun m!1347483 () Bool)

(assert (=> b!1459721 m!1347483))

(declare-fun m!1347485 () Bool)

(assert (=> b!1459736 m!1347485))

(assert (=> b!1459737 m!1347461))

(assert (=> b!1459737 m!1347461))

(declare-fun m!1347487 () Bool)

(assert (=> b!1459737 m!1347487))

(declare-fun m!1347489 () Bool)

(assert (=> start!125184 m!1347489))

(declare-fun m!1347491 () Bool)

(assert (=> start!125184 m!1347491))

(assert (=> b!1459719 m!1347477))

(declare-fun m!1347493 () Bool)

(assert (=> b!1459719 m!1347493))

(assert (=> b!1459717 m!1347461))

(assert (=> b!1459717 m!1347461))

(declare-fun m!1347495 () Bool)

(assert (=> b!1459717 m!1347495))

(declare-fun m!1347497 () Bool)

(assert (=> b!1459726 m!1347497))

(declare-fun m!1347499 () Bool)

(assert (=> b!1459732 m!1347499))

(assert (=> b!1459732 m!1347477))

(declare-fun m!1347501 () Bool)

(assert (=> b!1459732 m!1347501))

(declare-fun m!1347503 () Bool)

(assert (=> b!1459732 m!1347503))

(declare-fun m!1347505 () Bool)

(assert (=> b!1459732 m!1347505))

(assert (=> b!1459732 m!1347461))

(declare-fun m!1347507 () Bool)

(assert (=> b!1459732 m!1347507))

(declare-fun m!1347509 () Bool)

(assert (=> b!1459732 m!1347509))

(assert (=> b!1459732 m!1347461))

(check-sat (not b!1459723) (not b!1459737) (not b!1459721) (not b!1459728) (not b!1459733) (not b!1459736) (not b!1459726) (not b!1459720) (not b!1459735) (not start!125184) (not b!1459717) (not b!1459722) (not b!1459718) (not b!1459716) (not b!1459730) (not b!1459732))
(check-sat)
