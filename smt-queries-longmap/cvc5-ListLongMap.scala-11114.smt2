; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129788 () Bool)

(assert start!129788)

(declare-fun e!849354 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1523479 () Bool)

(declare-datatypes ((array!101384 0))(
  ( (array!101385 (arr!48923 (Array (_ BitVec 32) (_ BitVec 64))) (size!49473 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101384)

(declare-datatypes ((SeekEntryResult!13088 0))(
  ( (MissingZero!13088 (index!54747 (_ BitVec 32))) (Found!13088 (index!54748 (_ BitVec 32))) (Intermediate!13088 (undefined!13900 Bool) (index!54749 (_ BitVec 32)) (x!136438 (_ BitVec 32))) (Undefined!13088) (MissingVacant!13088 (index!54750 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101384 (_ BitVec 32)) SeekEntryResult!13088)

(assert (=> b!1523479 (= e!849354 (= (seekEntry!0 (select (arr!48923 a!2804) j!70) a!2804 mask!2512) (Found!13088 j!70)))))

(declare-fun res!1042386 () Bool)

(declare-fun e!849352 () Bool)

(assert (=> start!129788 (=> (not res!1042386) (not e!849352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129788 (= res!1042386 (validMask!0 mask!2512))))

(assert (=> start!129788 e!849352))

(assert (=> start!129788 true))

(declare-fun array_inv!37951 (array!101384) Bool)

(assert (=> start!129788 (array_inv!37951 a!2804)))

(declare-fun b!1523480 () Bool)

(declare-fun res!1042387 () Bool)

(assert (=> b!1523480 (=> (not res!1042387) (not e!849352))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523480 (= res!1042387 (validKeyInArray!0 (select (arr!48923 a!2804) i!961)))))

(declare-fun b!1523481 () Bool)

(declare-fun res!1042390 () Bool)

(assert (=> b!1523481 (=> (not res!1042390) (not e!849352))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523481 (= res!1042390 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49473 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49473 a!2804))))))

(declare-fun b!1523482 () Bool)

(declare-fun res!1042395 () Bool)

(assert (=> b!1523482 (=> (not res!1042395) (not e!849352))))

(assert (=> b!1523482 (= res!1042395 (validKeyInArray!0 (select (arr!48923 a!2804) j!70)))))

(declare-fun b!1523483 () Bool)

(declare-fun res!1042391 () Bool)

(declare-fun e!849355 () Bool)

(assert (=> b!1523483 (=> (not res!1042391) (not e!849355))))

(declare-fun lt!659965 () SeekEntryResult!13088)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101384 (_ BitVec 32)) SeekEntryResult!13088)

(assert (=> b!1523483 (= res!1042391 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48923 a!2804) j!70) a!2804 mask!2512) lt!659965))))

(declare-fun b!1523484 () Bool)

(assert (=> b!1523484 (= e!849355 (not true))))

(assert (=> b!1523484 e!849354))

(declare-fun res!1042394 () Bool)

(assert (=> b!1523484 (=> (not res!1042394) (not e!849354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101384 (_ BitVec 32)) Bool)

(assert (=> b!1523484 (= res!1042394 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50960 0))(
  ( (Unit!50961) )
))
(declare-fun lt!659963 () Unit!50960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50960)

(assert (=> b!1523484 (= lt!659963 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523485 () Bool)

(declare-fun res!1042388 () Bool)

(assert (=> b!1523485 (=> (not res!1042388) (not e!849355))))

(declare-fun lt!659964 () SeekEntryResult!13088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523485 (= res!1042388 (= lt!659964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48923 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48923 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101385 (store (arr!48923 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49473 a!2804)) mask!2512)))))

(declare-fun b!1523486 () Bool)

(assert (=> b!1523486 (= e!849352 e!849355)))

(declare-fun res!1042393 () Bool)

(assert (=> b!1523486 (=> (not res!1042393) (not e!849355))))

(assert (=> b!1523486 (= res!1042393 (= lt!659964 lt!659965))))

(assert (=> b!1523486 (= lt!659965 (Intermediate!13088 false resIndex!21 resX!21))))

(assert (=> b!1523486 (= lt!659964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48923 a!2804) j!70) mask!2512) (select (arr!48923 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523487 () Bool)

(declare-fun res!1042396 () Bool)

(assert (=> b!1523487 (=> (not res!1042396) (not e!849352))))

(assert (=> b!1523487 (= res!1042396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523488 () Bool)

(declare-fun res!1042389 () Bool)

(assert (=> b!1523488 (=> (not res!1042389) (not e!849352))))

(declare-datatypes ((List!35406 0))(
  ( (Nil!35403) (Cons!35402 (h!36826 (_ BitVec 64)) (t!50100 List!35406)) )
))
(declare-fun arrayNoDuplicates!0 (array!101384 (_ BitVec 32) List!35406) Bool)

(assert (=> b!1523488 (= res!1042389 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35403))))

(declare-fun b!1523489 () Bool)

(declare-fun res!1042392 () Bool)

(assert (=> b!1523489 (=> (not res!1042392) (not e!849352))))

(assert (=> b!1523489 (= res!1042392 (and (= (size!49473 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49473 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49473 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129788 res!1042386) b!1523489))

(assert (= (and b!1523489 res!1042392) b!1523480))

(assert (= (and b!1523480 res!1042387) b!1523482))

(assert (= (and b!1523482 res!1042395) b!1523487))

(assert (= (and b!1523487 res!1042396) b!1523488))

(assert (= (and b!1523488 res!1042389) b!1523481))

(assert (= (and b!1523481 res!1042390) b!1523486))

(assert (= (and b!1523486 res!1042393) b!1523483))

(assert (= (and b!1523483 res!1042391) b!1523485))

(assert (= (and b!1523485 res!1042388) b!1523484))

(assert (= (and b!1523484 res!1042394) b!1523479))

(declare-fun m!1406601 () Bool)

(assert (=> b!1523482 m!1406601))

(assert (=> b!1523482 m!1406601))

(declare-fun m!1406603 () Bool)

(assert (=> b!1523482 m!1406603))

(declare-fun m!1406605 () Bool)

(assert (=> b!1523487 m!1406605))

(declare-fun m!1406607 () Bool)

(assert (=> b!1523485 m!1406607))

(declare-fun m!1406609 () Bool)

(assert (=> b!1523485 m!1406609))

(assert (=> b!1523485 m!1406609))

(declare-fun m!1406611 () Bool)

(assert (=> b!1523485 m!1406611))

(assert (=> b!1523485 m!1406611))

(assert (=> b!1523485 m!1406609))

(declare-fun m!1406613 () Bool)

(assert (=> b!1523485 m!1406613))

(assert (=> b!1523479 m!1406601))

(assert (=> b!1523479 m!1406601))

(declare-fun m!1406615 () Bool)

(assert (=> b!1523479 m!1406615))

(declare-fun m!1406617 () Bool)

(assert (=> b!1523484 m!1406617))

(declare-fun m!1406619 () Bool)

(assert (=> b!1523484 m!1406619))

(assert (=> b!1523486 m!1406601))

(assert (=> b!1523486 m!1406601))

(declare-fun m!1406621 () Bool)

(assert (=> b!1523486 m!1406621))

(assert (=> b!1523486 m!1406621))

(assert (=> b!1523486 m!1406601))

(declare-fun m!1406623 () Bool)

(assert (=> b!1523486 m!1406623))

(declare-fun m!1406625 () Bool)

(assert (=> b!1523480 m!1406625))

(assert (=> b!1523480 m!1406625))

(declare-fun m!1406627 () Bool)

(assert (=> b!1523480 m!1406627))

(declare-fun m!1406629 () Bool)

(assert (=> start!129788 m!1406629))

(declare-fun m!1406631 () Bool)

(assert (=> start!129788 m!1406631))

(declare-fun m!1406633 () Bool)

(assert (=> b!1523488 m!1406633))

(assert (=> b!1523483 m!1406601))

(assert (=> b!1523483 m!1406601))

(declare-fun m!1406635 () Bool)

(assert (=> b!1523483 m!1406635))

(push 1)

