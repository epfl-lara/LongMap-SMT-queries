; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129136 () Bool)

(assert start!129136)

(declare-fun e!845705 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100992 0))(
  ( (array!100993 (arr!48733 (Array (_ BitVec 32) (_ BitVec 64))) (size!49283 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100992)

(declare-fun b!1515470 () Bool)

(declare-datatypes ((SeekEntryResult!12904 0))(
  ( (MissingZero!12904 (index!54011 (_ BitVec 32))) (Found!12904 (index!54012 (_ BitVec 32))) (Intermediate!12904 (undefined!13716 Bool) (index!54013 (_ BitVec 32)) (x!135710 (_ BitVec 32))) (Undefined!12904) (MissingVacant!12904 (index!54014 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100992 (_ BitVec 32)) SeekEntryResult!12904)

(assert (=> b!1515470 (= e!845705 (= (seekEntry!0 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) (Found!12904 j!70)))))

(declare-fun b!1515471 () Bool)

(declare-fun res!1035377 () Bool)

(declare-fun e!845706 () Bool)

(assert (=> b!1515471 (=> (not res!1035377) (not e!845706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515471 (= res!1035377 (validKeyInArray!0 (select (arr!48733 a!2804) j!70)))))

(declare-fun b!1515472 () Bool)

(declare-fun e!845703 () Bool)

(assert (=> b!1515472 (= e!845703 true)))

(declare-fun lt!656898 () SeekEntryResult!12904)

(declare-fun lt!656891 () SeekEntryResult!12904)

(assert (=> b!1515472 (= lt!656898 lt!656891)))

(declare-datatypes ((Unit!50676 0))(
  ( (Unit!50677) )
))
(declare-fun lt!656897 () Unit!50676)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50676)

(assert (=> b!1515472 (= lt!656897 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515473 () Bool)

(declare-fun e!845704 () Bool)

(assert (=> b!1515473 (= e!845706 e!845704)))

(declare-fun res!1035382 () Bool)

(assert (=> b!1515473 (=> (not res!1035382) (not e!845704))))

(declare-fun lt!656890 () SeekEntryResult!12904)

(declare-fun lt!656896 () SeekEntryResult!12904)

(assert (=> b!1515473 (= res!1035382 (= lt!656890 lt!656896))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515473 (= lt!656896 (Intermediate!12904 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100992 (_ BitVec 32)) SeekEntryResult!12904)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515473 (= lt!656890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48733 a!2804) j!70) mask!2512) (select (arr!48733 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515474 () Bool)

(declare-fun res!1035373 () Bool)

(assert (=> b!1515474 (=> (not res!1035373) (not e!845706))))

(assert (=> b!1515474 (= res!1035373 (and (= (size!49283 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49283 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49283 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515475 () Bool)

(declare-fun e!845701 () Bool)

(declare-fun e!845702 () Bool)

(assert (=> b!1515475 (= e!845701 (not e!845702))))

(declare-fun res!1035375 () Bool)

(assert (=> b!1515475 (=> res!1035375 e!845702)))

(declare-fun lt!656899 () (_ BitVec 64))

(assert (=> b!1515475 (= res!1035375 (or (not (= (select (arr!48733 a!2804) j!70) lt!656899)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48733 a!2804) index!487) (select (arr!48733 a!2804) j!70)) (not (= (select (arr!48733 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515475 e!845705))

(declare-fun res!1035383 () Bool)

(assert (=> b!1515475 (=> (not res!1035383) (not e!845705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100992 (_ BitVec 32)) Bool)

(assert (=> b!1515475 (= res!1035383 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656894 () Unit!50676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50676)

(assert (=> b!1515475 (= lt!656894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515476 () Bool)

(declare-fun res!1035385 () Bool)

(assert (=> b!1515476 (=> (not res!1035385) (not e!845706))))

(assert (=> b!1515476 (= res!1035385 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49283 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49283 a!2804))))))

(declare-fun b!1515478 () Bool)

(assert (=> b!1515478 (= e!845704 e!845701)))

(declare-fun res!1035380 () Bool)

(assert (=> b!1515478 (=> (not res!1035380) (not e!845701))))

(declare-fun lt!656893 () array!100992)

(assert (=> b!1515478 (= res!1035380 (= lt!656890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656899 mask!2512) lt!656899 lt!656893 mask!2512)))))

(assert (=> b!1515478 (= lt!656899 (select (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515478 (= lt!656893 (array!100993 (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49283 a!2804)))))

(declare-fun b!1515479 () Bool)

(declare-fun res!1035384 () Bool)

(assert (=> b!1515479 (=> (not res!1035384) (not e!845706))))

(assert (=> b!1515479 (= res!1035384 (validKeyInArray!0 (select (arr!48733 a!2804) i!961)))))

(declare-fun b!1515480 () Bool)

(declare-fun res!1035381 () Bool)

(assert (=> b!1515480 (=> (not res!1035381) (not e!845704))))

(assert (=> b!1515480 (= res!1035381 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) lt!656896))))

(declare-fun b!1515481 () Bool)

(declare-fun res!1035379 () Bool)

(assert (=> b!1515481 (=> (not res!1035379) (not e!845706))))

(assert (=> b!1515481 (= res!1035379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515482 () Bool)

(assert (=> b!1515482 (= e!845702 e!845703)))

(declare-fun res!1035376 () Bool)

(assert (=> b!1515482 (=> res!1035376 e!845703)))

(assert (=> b!1515482 (= res!1035376 (not (= lt!656891 (Found!12904 j!70))))))

(declare-fun lt!656895 () SeekEntryResult!12904)

(assert (=> b!1515482 (= lt!656895 lt!656898)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100992 (_ BitVec 32)) SeekEntryResult!12904)

(assert (=> b!1515482 (= lt!656898 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656899 lt!656893 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100992 (_ BitVec 32)) SeekEntryResult!12904)

(assert (=> b!1515482 (= lt!656895 (seekEntryOrOpen!0 lt!656899 lt!656893 mask!2512))))

(declare-fun lt!656892 () SeekEntryResult!12904)

(assert (=> b!1515482 (= lt!656892 lt!656891)))

(assert (=> b!1515482 (= lt!656891 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48733 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515482 (= lt!656892 (seekEntryOrOpen!0 (select (arr!48733 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035374 () Bool)

(assert (=> start!129136 (=> (not res!1035374) (not e!845706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129136 (= res!1035374 (validMask!0 mask!2512))))

(assert (=> start!129136 e!845706))

(assert (=> start!129136 true))

(declare-fun array_inv!37761 (array!100992) Bool)

(assert (=> start!129136 (array_inv!37761 a!2804)))

(declare-fun b!1515477 () Bool)

(declare-fun res!1035378 () Bool)

(assert (=> b!1515477 (=> (not res!1035378) (not e!845706))))

(declare-datatypes ((List!35216 0))(
  ( (Nil!35213) (Cons!35212 (h!36624 (_ BitVec 64)) (t!49910 List!35216)) )
))
(declare-fun arrayNoDuplicates!0 (array!100992 (_ BitVec 32) List!35216) Bool)

(assert (=> b!1515477 (= res!1035378 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35213))))

(assert (= (and start!129136 res!1035374) b!1515474))

(assert (= (and b!1515474 res!1035373) b!1515479))

(assert (= (and b!1515479 res!1035384) b!1515471))

(assert (= (and b!1515471 res!1035377) b!1515481))

(assert (= (and b!1515481 res!1035379) b!1515477))

(assert (= (and b!1515477 res!1035378) b!1515476))

(assert (= (and b!1515476 res!1035385) b!1515473))

(assert (= (and b!1515473 res!1035382) b!1515480))

(assert (= (and b!1515480 res!1035381) b!1515478))

(assert (= (and b!1515478 res!1035380) b!1515475))

(assert (= (and b!1515475 res!1035383) b!1515470))

(assert (= (and b!1515475 (not res!1035375)) b!1515482))

(assert (= (and b!1515482 (not res!1035376)) b!1515472))

(declare-fun m!1398583 () Bool)

(assert (=> b!1515478 m!1398583))

(assert (=> b!1515478 m!1398583))

(declare-fun m!1398585 () Bool)

(assert (=> b!1515478 m!1398585))

(declare-fun m!1398587 () Bool)

(assert (=> b!1515478 m!1398587))

(declare-fun m!1398589 () Bool)

(assert (=> b!1515478 m!1398589))

(declare-fun m!1398591 () Bool)

(assert (=> b!1515477 m!1398591))

(declare-fun m!1398593 () Bool)

(assert (=> b!1515472 m!1398593))

(declare-fun m!1398595 () Bool)

(assert (=> b!1515473 m!1398595))

(assert (=> b!1515473 m!1398595))

(declare-fun m!1398597 () Bool)

(assert (=> b!1515473 m!1398597))

(assert (=> b!1515473 m!1398597))

(assert (=> b!1515473 m!1398595))

(declare-fun m!1398599 () Bool)

(assert (=> b!1515473 m!1398599))

(assert (=> b!1515482 m!1398595))

(declare-fun m!1398601 () Bool)

(assert (=> b!1515482 m!1398601))

(assert (=> b!1515482 m!1398595))

(declare-fun m!1398603 () Bool)

(assert (=> b!1515482 m!1398603))

(declare-fun m!1398605 () Bool)

(assert (=> b!1515482 m!1398605))

(assert (=> b!1515482 m!1398595))

(declare-fun m!1398607 () Bool)

(assert (=> b!1515482 m!1398607))

(declare-fun m!1398609 () Bool)

(assert (=> start!129136 m!1398609))

(declare-fun m!1398611 () Bool)

(assert (=> start!129136 m!1398611))

(assert (=> b!1515470 m!1398595))

(assert (=> b!1515470 m!1398595))

(declare-fun m!1398613 () Bool)

(assert (=> b!1515470 m!1398613))

(assert (=> b!1515471 m!1398595))

(assert (=> b!1515471 m!1398595))

(declare-fun m!1398615 () Bool)

(assert (=> b!1515471 m!1398615))

(assert (=> b!1515475 m!1398595))

(declare-fun m!1398617 () Bool)

(assert (=> b!1515475 m!1398617))

(declare-fun m!1398619 () Bool)

(assert (=> b!1515475 m!1398619))

(declare-fun m!1398621 () Bool)

(assert (=> b!1515475 m!1398621))

(declare-fun m!1398623 () Bool)

(assert (=> b!1515479 m!1398623))

(assert (=> b!1515479 m!1398623))

(declare-fun m!1398625 () Bool)

(assert (=> b!1515479 m!1398625))

(declare-fun m!1398627 () Bool)

(assert (=> b!1515481 m!1398627))

(assert (=> b!1515480 m!1398595))

(assert (=> b!1515480 m!1398595))

(declare-fun m!1398629 () Bool)

(assert (=> b!1515480 m!1398629))

(push 1)

