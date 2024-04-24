; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129314 () Bool)

(assert start!129314)

(declare-fun b!1514733 () Bool)

(declare-fun e!845541 () Bool)

(declare-fun e!845537 () Bool)

(assert (=> b!1514733 (= e!845541 e!845537)))

(declare-fun res!1033463 () Bool)

(assert (=> b!1514733 (=> (not res!1033463) (not e!845537))))

(declare-datatypes ((SeekEntryResult!12788 0))(
  ( (MissingZero!12788 (index!53547 (_ BitVec 32))) (Found!12788 (index!53548 (_ BitVec 32))) (Intermediate!12788 (undefined!13600 Bool) (index!53549 (_ BitVec 32)) (x!135471 (_ BitVec 32))) (Undefined!12788) (MissingVacant!12788 (index!53550 (_ BitVec 32))) )
))
(declare-fun lt!656458 () SeekEntryResult!12788)

(declare-fun lt!656455 () SeekEntryResult!12788)

(assert (=> b!1514733 (= res!1033463 (= lt!656458 lt!656455))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514733 (= lt!656455 (Intermediate!12788 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100984 0))(
  ( (array!100985 (arr!48724 (Array (_ BitVec 32) (_ BitVec 64))) (size!49275 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100984)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514733 (= lt!656458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48724 a!2804) j!70) mask!2512) (select (arr!48724 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514734 () Bool)

(declare-fun res!1033470 () Bool)

(assert (=> b!1514734 (=> (not res!1033470) (not e!845541))))

(declare-datatypes ((List!35194 0))(
  ( (Nil!35191) (Cons!35190 (h!36617 (_ BitVec 64)) (t!49880 List!35194)) )
))
(declare-fun arrayNoDuplicates!0 (array!100984 (_ BitVec 32) List!35194) Bool)

(assert (=> b!1514734 (= res!1033470 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35191))))

(declare-fun b!1514735 () Bool)

(declare-fun e!845538 () Bool)

(declare-fun e!845539 () Bool)

(assert (=> b!1514735 (= e!845538 (not e!845539))))

(declare-fun res!1033465 () Bool)

(assert (=> b!1514735 (=> res!1033465 e!845539)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!656457 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1514735 (= res!1033465 (or (not (= (select (arr!48724 a!2804) j!70) lt!656457)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48724 a!2804) index!487) (select (arr!48724 a!2804) j!70)) (not (= (select (arr!48724 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (not (= (select (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845540 () Bool)

(assert (=> b!1514735 e!845540))

(declare-fun res!1033466 () Bool)

(assert (=> b!1514735 (=> (not res!1033466) (not e!845540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100984 (_ BitVec 32)) Bool)

(assert (=> b!1514735 (= res!1033466 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50479 0))(
  ( (Unit!50480) )
))
(declare-fun lt!656456 () Unit!50479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50479)

(assert (=> b!1514735 (= lt!656456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun e!845535 () Bool)

(declare-fun b!1514736 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12788)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12788)

(assert (=> b!1514736 (= e!845535 (= (seekEntryOrOpen!0 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48724 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1033461 () Bool)

(assert (=> start!129314 (=> (not res!1033461) (not e!845541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129314 (= res!1033461 (validMask!0 mask!2512))))

(assert (=> start!129314 e!845541))

(assert (=> start!129314 true))

(declare-fun array_inv!38005 (array!100984) Bool)

(assert (=> start!129314 (array_inv!38005 a!2804)))

(declare-fun b!1514737 () Bool)

(declare-fun res!1033468 () Bool)

(assert (=> b!1514737 (=> (not res!1033468) (not e!845541))))

(assert (=> b!1514737 (= res!1033468 (and (= (size!49275 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49275 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49275 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514738 () Bool)

(declare-fun res!1033464 () Bool)

(assert (=> b!1514738 (=> (not res!1033464) (not e!845541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514738 (= res!1033464 (validKeyInArray!0 (select (arr!48724 a!2804) j!70)))))

(declare-fun b!1514739 () Bool)

(assert (=> b!1514739 (= e!845539 (validKeyInArray!0 lt!656457))))

(declare-fun b!1514740 () Bool)

(declare-fun res!1033462 () Bool)

(assert (=> b!1514740 (=> (not res!1033462) (not e!845541))))

(assert (=> b!1514740 (= res!1033462 (validKeyInArray!0 (select (arr!48724 a!2804) i!961)))))

(declare-fun b!1514741 () Bool)

(assert (=> b!1514741 (= e!845537 e!845538)))

(declare-fun res!1033467 () Bool)

(assert (=> b!1514741 (=> (not res!1033467) (not e!845538))))

(assert (=> b!1514741 (= res!1033467 (= lt!656458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656457 mask!2512) lt!656457 (array!100985 (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49275 a!2804)) mask!2512)))))

(assert (=> b!1514741 (= lt!656457 (select (store (arr!48724 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1514742 () Bool)

(declare-fun res!1033471 () Bool)

(assert (=> b!1514742 (=> (not res!1033471) (not e!845541))))

(assert (=> b!1514742 (= res!1033471 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49275 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49275 a!2804))))))

(declare-fun b!1514743 () Bool)

(assert (=> b!1514743 (= e!845540 e!845535)))

(declare-fun res!1033460 () Bool)

(assert (=> b!1514743 (=> res!1033460 e!845535)))

(assert (=> b!1514743 (= res!1033460 (or (not (= (select (arr!48724 a!2804) j!70) lt!656457)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48724 a!2804) index!487) (select (arr!48724 a!2804) j!70)) (not (= (select (arr!48724 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514744 () Bool)

(declare-fun res!1033472 () Bool)

(assert (=> b!1514744 (=> (not res!1033472) (not e!845540))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100984 (_ BitVec 32)) SeekEntryResult!12788)

(assert (=> b!1514744 (= res!1033472 (= (seekEntry!0 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) (Found!12788 j!70)))))

(declare-fun b!1514745 () Bool)

(declare-fun res!1033469 () Bool)

(assert (=> b!1514745 (=> (not res!1033469) (not e!845537))))

(assert (=> b!1514745 (= res!1033469 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48724 a!2804) j!70) a!2804 mask!2512) lt!656455))))

(declare-fun b!1514746 () Bool)

(declare-fun res!1033459 () Bool)

(assert (=> b!1514746 (=> (not res!1033459) (not e!845541))))

(assert (=> b!1514746 (= res!1033459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129314 res!1033461) b!1514737))

(assert (= (and b!1514737 res!1033468) b!1514740))

(assert (= (and b!1514740 res!1033462) b!1514738))

(assert (= (and b!1514738 res!1033464) b!1514746))

(assert (= (and b!1514746 res!1033459) b!1514734))

(assert (= (and b!1514734 res!1033470) b!1514742))

(assert (= (and b!1514742 res!1033471) b!1514733))

(assert (= (and b!1514733 res!1033463) b!1514745))

(assert (= (and b!1514745 res!1033469) b!1514741))

(assert (= (and b!1514741 res!1033467) b!1514735))

(assert (= (and b!1514735 res!1033466) b!1514744))

(assert (= (and b!1514744 res!1033472) b!1514743))

(assert (= (and b!1514743 (not res!1033460)) b!1514736))

(assert (= (and b!1514735 (not res!1033465)) b!1514739))

(declare-fun m!1397505 () Bool)

(assert (=> b!1514736 m!1397505))

(assert (=> b!1514736 m!1397505))

(declare-fun m!1397507 () Bool)

(assert (=> b!1514736 m!1397507))

(assert (=> b!1514736 m!1397505))

(declare-fun m!1397509 () Bool)

(assert (=> b!1514736 m!1397509))

(assert (=> b!1514743 m!1397505))

(declare-fun m!1397511 () Bool)

(assert (=> b!1514743 m!1397511))

(assert (=> b!1514733 m!1397505))

(assert (=> b!1514733 m!1397505))

(declare-fun m!1397513 () Bool)

(assert (=> b!1514733 m!1397513))

(assert (=> b!1514733 m!1397513))

(assert (=> b!1514733 m!1397505))

(declare-fun m!1397515 () Bool)

(assert (=> b!1514733 m!1397515))

(declare-fun m!1397517 () Bool)

(assert (=> b!1514739 m!1397517))

(assert (=> b!1514744 m!1397505))

(assert (=> b!1514744 m!1397505))

(declare-fun m!1397519 () Bool)

(assert (=> b!1514744 m!1397519))

(declare-fun m!1397521 () Bool)

(assert (=> b!1514740 m!1397521))

(assert (=> b!1514740 m!1397521))

(declare-fun m!1397523 () Bool)

(assert (=> b!1514740 m!1397523))

(declare-fun m!1397525 () Bool)

(assert (=> b!1514746 m!1397525))

(assert (=> b!1514738 m!1397505))

(assert (=> b!1514738 m!1397505))

(declare-fun m!1397527 () Bool)

(assert (=> b!1514738 m!1397527))

(assert (=> b!1514745 m!1397505))

(assert (=> b!1514745 m!1397505))

(declare-fun m!1397529 () Bool)

(assert (=> b!1514745 m!1397529))

(declare-fun m!1397531 () Bool)

(assert (=> start!129314 m!1397531))

(declare-fun m!1397533 () Bool)

(assert (=> start!129314 m!1397533))

(assert (=> b!1514735 m!1397505))

(declare-fun m!1397535 () Bool)

(assert (=> b!1514735 m!1397535))

(declare-fun m!1397537 () Bool)

(assert (=> b!1514735 m!1397537))

(assert (=> b!1514735 m!1397511))

(declare-fun m!1397539 () Bool)

(assert (=> b!1514735 m!1397539))

(declare-fun m!1397541 () Bool)

(assert (=> b!1514735 m!1397541))

(declare-fun m!1397543 () Bool)

(assert (=> b!1514741 m!1397543))

(assert (=> b!1514741 m!1397537))

(assert (=> b!1514741 m!1397543))

(declare-fun m!1397545 () Bool)

(assert (=> b!1514741 m!1397545))

(declare-fun m!1397547 () Bool)

(assert (=> b!1514741 m!1397547))

(declare-fun m!1397549 () Bool)

(assert (=> b!1514734 m!1397549))

(check-sat (not start!129314) (not b!1514734) (not b!1514746) (not b!1514739) (not b!1514741) (not b!1514740) (not b!1514745) (not b!1514736) (not b!1514733) (not b!1514738) (not b!1514735) (not b!1514744))
(check-sat)
