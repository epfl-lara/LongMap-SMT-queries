; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129686 () Bool)

(assert start!129686)

(declare-fun b!1521360 () Bool)

(declare-fun e!848787 () Bool)

(declare-fun e!848792 () Bool)

(assert (=> b!1521360 (= e!848787 e!848792)))

(declare-fun res!1039916 () Bool)

(assert (=> b!1521360 (=> res!1039916 e!848792)))

(declare-datatypes ((array!101305 0))(
  ( (array!101306 (arr!48883 (Array (_ BitVec 32) (_ BitVec 64))) (size!49434 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101305)

(declare-fun lt!659371 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521360 (= res!1039916 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659371 #b00000000000000000000000000000000) (bvsge lt!659371 (size!49434 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521360 (= lt!659371 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1521361 () Bool)

(declare-fun res!1039912 () Bool)

(declare-fun e!848788 () Bool)

(assert (=> b!1521361 (=> (not res!1039912) (not e!848788))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521361 (= res!1039912 (validKeyInArray!0 (select (arr!48883 a!2804) j!70)))))

(declare-fun b!1521362 () Bool)

(declare-fun res!1039907 () Bool)

(assert (=> b!1521362 (=> (not res!1039907) (not e!848788))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521362 (= res!1039907 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49434 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49434 a!2804))))))

(declare-fun b!1521363 () Bool)

(declare-fun res!1039914 () Bool)

(assert (=> b!1521363 (=> (not res!1039914) (not e!848788))))

(declare-datatypes ((List!35353 0))(
  ( (Nil!35350) (Cons!35349 (h!36779 (_ BitVec 64)) (t!50039 List!35353)) )
))
(declare-fun arrayNoDuplicates!0 (array!101305 (_ BitVec 32) List!35353) Bool)

(assert (=> b!1521363 (= res!1039914 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35350))))

(declare-fun b!1521364 () Bool)

(declare-fun e!848790 () Bool)

(assert (=> b!1521364 (= e!848790 (not e!848787))))

(declare-fun res!1039905 () Bool)

(assert (=> b!1521364 (=> res!1039905 e!848787)))

(declare-fun lt!659374 () (_ BitVec 64))

(assert (=> b!1521364 (= res!1039905 (or (not (= (select (arr!48883 a!2804) j!70) lt!659374)) (= x!534 resX!21)))))

(declare-fun e!848791 () Bool)

(assert (=> b!1521364 e!848791))

(declare-fun res!1039910 () Bool)

(assert (=> b!1521364 (=> (not res!1039910) (not e!848791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101305 (_ BitVec 32)) Bool)

(assert (=> b!1521364 (= res!1039910 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50797 0))(
  ( (Unit!50798) )
))
(declare-fun lt!659373 () Unit!50797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50797)

(assert (=> b!1521364 (= lt!659373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1521365 () Bool)

(declare-fun e!848789 () Bool)

(assert (=> b!1521365 (= e!848788 e!848789)))

(declare-fun res!1039913 () Bool)

(assert (=> b!1521365 (=> (not res!1039913) (not e!848789))))

(declare-datatypes ((SeekEntryResult!12947 0))(
  ( (MissingZero!12947 (index!54183 (_ BitVec 32))) (Found!12947 (index!54184 (_ BitVec 32))) (Intermediate!12947 (undefined!13759 Bool) (index!54185 (_ BitVec 32)) (x!136060 (_ BitVec 32))) (Undefined!12947) (MissingVacant!12947 (index!54186 (_ BitVec 32))) )
))
(declare-fun lt!659372 () SeekEntryResult!12947)

(declare-fun lt!659370 () SeekEntryResult!12947)

(assert (=> b!1521365 (= res!1039913 (= lt!659372 lt!659370))))

(assert (=> b!1521365 (= lt!659370 (Intermediate!12947 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101305 (_ BitVec 32)) SeekEntryResult!12947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521365 (= lt!659372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48883 a!2804) j!70) mask!2512) (select (arr!48883 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521366 () Bool)

(declare-fun res!1039909 () Bool)

(assert (=> b!1521366 (=> (not res!1039909) (not e!848788))))

(assert (=> b!1521366 (= res!1039909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521368 () Bool)

(declare-fun res!1039915 () Bool)

(assert (=> b!1521368 (=> (not res!1039915) (not e!848788))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521368 (= res!1039915 (validKeyInArray!0 (select (arr!48883 a!2804) i!961)))))

(declare-fun b!1521369 () Bool)

(declare-fun res!1039911 () Bool)

(assert (=> b!1521369 (=> (not res!1039911) (not e!848788))))

(assert (=> b!1521369 (= res!1039911 (and (= (size!49434 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49434 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49434 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521370 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101305 (_ BitVec 32)) SeekEntryResult!12947)

(assert (=> b!1521370 (= e!848791 (= (seekEntry!0 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) (Found!12947 j!70)))))

(declare-fun b!1521371 () Bool)

(declare-fun res!1039903 () Bool)

(assert (=> b!1521371 (=> res!1039903 e!848792)))

(assert (=> b!1521371 (= res!1039903 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659371 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) lt!659370)))))

(declare-fun b!1521372 () Bool)

(assert (=> b!1521372 (= e!848789 e!848790)))

(declare-fun res!1039904 () Bool)

(assert (=> b!1521372 (=> (not res!1039904) (not e!848790))))

(declare-fun lt!659369 () array!101305)

(assert (=> b!1521372 (= res!1039904 (= lt!659372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659374 mask!2512) lt!659374 lt!659369 mask!2512)))))

(assert (=> b!1521372 (= lt!659374 (select (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1521372 (= lt!659369 (array!101306 (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49434 a!2804)))))

(declare-fun b!1521373 () Bool)

(declare-fun res!1039908 () Bool)

(assert (=> b!1521373 (=> (not res!1039908) (not e!848789))))

(assert (=> b!1521373 (= res!1039908 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) lt!659370))))

(declare-fun b!1521367 () Bool)

(assert (=> b!1521367 (= e!848792 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101305 (_ BitVec 32)) SeekEntryResult!12947)

(assert (=> b!1521367 (= (seekEntryOrOpen!0 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659374 lt!659369 mask!2512))))

(declare-fun lt!659368 () Unit!50797)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50797)

(assert (=> b!1521367 (= lt!659368 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659371 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1039906 () Bool)

(assert (=> start!129686 (=> (not res!1039906) (not e!848788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129686 (= res!1039906 (validMask!0 mask!2512))))

(assert (=> start!129686 e!848788))

(assert (=> start!129686 true))

(declare-fun array_inv!38164 (array!101305) Bool)

(assert (=> start!129686 (array_inv!38164 a!2804)))

(assert (= (and start!129686 res!1039906) b!1521369))

(assert (= (and b!1521369 res!1039911) b!1521368))

(assert (= (and b!1521368 res!1039915) b!1521361))

(assert (= (and b!1521361 res!1039912) b!1521366))

(assert (= (and b!1521366 res!1039909) b!1521363))

(assert (= (and b!1521363 res!1039914) b!1521362))

(assert (= (and b!1521362 res!1039907) b!1521365))

(assert (= (and b!1521365 res!1039913) b!1521373))

(assert (= (and b!1521373 res!1039908) b!1521372))

(assert (= (and b!1521372 res!1039904) b!1521364))

(assert (= (and b!1521364 res!1039910) b!1521370))

(assert (= (and b!1521364 (not res!1039905)) b!1521360))

(assert (= (and b!1521360 (not res!1039916)) b!1521371))

(assert (= (and b!1521371 (not res!1039903)) b!1521367))

(declare-fun m!1404597 () Bool)

(assert (=> b!1521367 m!1404597))

(assert (=> b!1521367 m!1404597))

(declare-fun m!1404599 () Bool)

(assert (=> b!1521367 m!1404599))

(declare-fun m!1404601 () Bool)

(assert (=> b!1521367 m!1404601))

(declare-fun m!1404603 () Bool)

(assert (=> b!1521367 m!1404603))

(declare-fun m!1404605 () Bool)

(assert (=> b!1521360 m!1404605))

(declare-fun m!1404607 () Bool)

(assert (=> b!1521372 m!1404607))

(assert (=> b!1521372 m!1404607))

(declare-fun m!1404609 () Bool)

(assert (=> b!1521372 m!1404609))

(declare-fun m!1404611 () Bool)

(assert (=> b!1521372 m!1404611))

(declare-fun m!1404613 () Bool)

(assert (=> b!1521372 m!1404613))

(assert (=> b!1521370 m!1404597))

(assert (=> b!1521370 m!1404597))

(declare-fun m!1404615 () Bool)

(assert (=> b!1521370 m!1404615))

(declare-fun m!1404617 () Bool)

(assert (=> b!1521368 m!1404617))

(assert (=> b!1521368 m!1404617))

(declare-fun m!1404619 () Bool)

(assert (=> b!1521368 m!1404619))

(declare-fun m!1404621 () Bool)

(assert (=> b!1521366 m!1404621))

(assert (=> b!1521371 m!1404597))

(assert (=> b!1521371 m!1404597))

(declare-fun m!1404623 () Bool)

(assert (=> b!1521371 m!1404623))

(assert (=> b!1521364 m!1404597))

(declare-fun m!1404625 () Bool)

(assert (=> b!1521364 m!1404625))

(declare-fun m!1404627 () Bool)

(assert (=> b!1521364 m!1404627))

(declare-fun m!1404629 () Bool)

(assert (=> b!1521363 m!1404629))

(assert (=> b!1521373 m!1404597))

(assert (=> b!1521373 m!1404597))

(declare-fun m!1404631 () Bool)

(assert (=> b!1521373 m!1404631))

(assert (=> b!1521365 m!1404597))

(assert (=> b!1521365 m!1404597))

(declare-fun m!1404633 () Bool)

(assert (=> b!1521365 m!1404633))

(assert (=> b!1521365 m!1404633))

(assert (=> b!1521365 m!1404597))

(declare-fun m!1404635 () Bool)

(assert (=> b!1521365 m!1404635))

(assert (=> b!1521361 m!1404597))

(assert (=> b!1521361 m!1404597))

(declare-fun m!1404637 () Bool)

(assert (=> b!1521361 m!1404637))

(declare-fun m!1404639 () Bool)

(assert (=> start!129686 m!1404639))

(declare-fun m!1404641 () Bool)

(assert (=> start!129686 m!1404641))

(check-sat (not b!1521363) (not b!1521368) (not b!1521372) (not b!1521366) (not b!1521361) (not b!1521370) (not b!1521373) (not b!1521364) (not b!1521365) (not b!1521371) (not start!129686) (not b!1521367) (not b!1521360))
(check-sat)
