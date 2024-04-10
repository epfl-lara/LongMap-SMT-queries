; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130228 () Bool)

(assert start!130228)

(declare-fun b!1528664 () Bool)

(declare-fun res!1046380 () Bool)

(declare-fun e!852007 () Bool)

(assert (=> b!1528664 (=> (not res!1046380) (not e!852007))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101578 0))(
  ( (array!101579 (arr!49014 (Array (_ BitVec 32) (_ BitVec 64))) (size!49564 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101578)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528664 (= res!1046380 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49564 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49564 a!2804))))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1528665 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!852003 () Bool)

(declare-datatypes ((SeekEntryResult!13179 0))(
  ( (MissingZero!13179 (index!55111 (_ BitVec 32))) (Found!13179 (index!55112 (_ BitVec 32))) (Intermediate!13179 (undefined!13991 Bool) (index!55113 (_ BitVec 32)) (x!136802 (_ BitVec 32))) (Undefined!13179) (MissingVacant!13179 (index!55114 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13179)

(assert (=> b!1528665 (= e!852003 (= (seekEntry!0 (select (arr!49014 a!2804) j!70) a!2804 mask!2512) (Found!13179 j!70)))))

(declare-fun b!1528666 () Bool)

(declare-fun res!1046378 () Bool)

(assert (=> b!1528666 (=> (not res!1046378) (not e!852007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528666 (= res!1046378 (validKeyInArray!0 (select (arr!49014 a!2804) j!70)))))

(declare-fun b!1528667 () Bool)

(declare-fun e!852004 () Bool)

(declare-fun e!852006 () Bool)

(assert (=> b!1528667 (= e!852004 (not e!852006))))

(declare-fun res!1046374 () Bool)

(assert (=> b!1528667 (=> res!1046374 e!852006)))

(declare-fun lt!662160 () (_ BitVec 64))

(assert (=> b!1528667 (= res!1046374 (or (not (= (select (arr!49014 a!2804) j!70) lt!662160)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49014 a!2804) index!487) (select (arr!49014 a!2804) j!70)) (not (= (select (arr!49014 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528667 e!852003))

(declare-fun res!1046371 () Bool)

(assert (=> b!1528667 (=> (not res!1046371) (not e!852003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101578 (_ BitVec 32)) Bool)

(assert (=> b!1528667 (= res!1046371 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51142 0))(
  ( (Unit!51143) )
))
(declare-fun lt!662155 () Unit!51142)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51142)

(assert (=> b!1528667 (= lt!662155 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528668 () Bool)

(declare-fun e!852001 () Bool)

(assert (=> b!1528668 (= e!852007 e!852001)))

(declare-fun res!1046381 () Bool)

(assert (=> b!1528668 (=> (not res!1046381) (not e!852001))))

(declare-fun lt!662152 () SeekEntryResult!13179)

(declare-fun lt!662158 () SeekEntryResult!13179)

(assert (=> b!1528668 (= res!1046381 (= lt!662152 lt!662158))))

(assert (=> b!1528668 (= lt!662158 (Intermediate!13179 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528668 (= lt!662152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49014 a!2804) j!70) mask!2512) (select (arr!49014 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528669 () Bool)

(declare-fun e!852002 () Bool)

(declare-fun lt!662153 () SeekEntryResult!13179)

(declare-fun lt!662159 () SeekEntryResult!13179)

(assert (=> b!1528669 (= e!852002 (= lt!662153 lt!662159))))

(declare-fun lt!662156 () SeekEntryResult!13179)

(declare-fun lt!662157 () SeekEntryResult!13179)

(assert (=> b!1528669 (= lt!662156 lt!662157)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!662161 () Unit!51142)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51142)

(assert (=> b!1528669 (= lt!662161 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528670 () Bool)

(assert (=> b!1528670 (= e!852001 e!852004)))

(declare-fun res!1046372 () Bool)

(assert (=> b!1528670 (=> (not res!1046372) (not e!852004))))

(declare-fun lt!662154 () array!101578)

(assert (=> b!1528670 (= res!1046372 (= lt!662152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662160 mask!2512) lt!662160 lt!662154 mask!2512)))))

(assert (=> b!1528670 (= lt!662160 (select (store (arr!49014 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528670 (= lt!662154 (array!101579 (store (arr!49014 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49564 a!2804)))))

(declare-fun b!1528671 () Bool)

(declare-fun res!1046377 () Bool)

(assert (=> b!1528671 (=> (not res!1046377) (not e!852007))))

(assert (=> b!1528671 (= res!1046377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1046382 () Bool)

(assert (=> start!130228 (=> (not res!1046382) (not e!852007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130228 (= res!1046382 (validMask!0 mask!2512))))

(assert (=> start!130228 e!852007))

(assert (=> start!130228 true))

(declare-fun array_inv!38042 (array!101578) Bool)

(assert (=> start!130228 (array_inv!38042 a!2804)))

(declare-fun b!1528672 () Bool)

(declare-fun res!1046376 () Bool)

(assert (=> b!1528672 (=> (not res!1046376) (not e!852007))))

(declare-datatypes ((List!35497 0))(
  ( (Nil!35494) (Cons!35493 (h!36929 (_ BitVec 64)) (t!50191 List!35497)) )
))
(declare-fun arrayNoDuplicates!0 (array!101578 (_ BitVec 32) List!35497) Bool)

(assert (=> b!1528672 (= res!1046376 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35494))))

(declare-fun b!1528673 () Bool)

(declare-fun res!1046375 () Bool)

(assert (=> b!1528673 (=> (not res!1046375) (not e!852007))))

(assert (=> b!1528673 (= res!1046375 (and (= (size!49564 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49564 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49564 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528674 () Bool)

(assert (=> b!1528674 (= e!852006 e!852002)))

(declare-fun res!1046379 () Bool)

(assert (=> b!1528674 (=> res!1046379 e!852002)))

(assert (=> b!1528674 (= res!1046379 (not (= lt!662157 (Found!13179 j!70))))))

(assert (=> b!1528674 (= lt!662159 lt!662156)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13179)

(assert (=> b!1528674 (= lt!662156 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662160 lt!662154 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101578 (_ BitVec 32)) SeekEntryResult!13179)

(assert (=> b!1528674 (= lt!662159 (seekEntryOrOpen!0 lt!662160 lt!662154 mask!2512))))

(assert (=> b!1528674 (= lt!662153 lt!662157)))

(assert (=> b!1528674 (= lt!662157 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49014 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528674 (= lt!662153 (seekEntryOrOpen!0 (select (arr!49014 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528675 () Bool)

(declare-fun res!1046373 () Bool)

(assert (=> b!1528675 (=> (not res!1046373) (not e!852007))))

(assert (=> b!1528675 (= res!1046373 (validKeyInArray!0 (select (arr!49014 a!2804) i!961)))))

(declare-fun b!1528676 () Bool)

(declare-fun res!1046383 () Bool)

(assert (=> b!1528676 (=> (not res!1046383) (not e!852001))))

(assert (=> b!1528676 (= res!1046383 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49014 a!2804) j!70) a!2804 mask!2512) lt!662158))))

(assert (= (and start!130228 res!1046382) b!1528673))

(assert (= (and b!1528673 res!1046375) b!1528675))

(assert (= (and b!1528675 res!1046373) b!1528666))

(assert (= (and b!1528666 res!1046378) b!1528671))

(assert (= (and b!1528671 res!1046377) b!1528672))

(assert (= (and b!1528672 res!1046376) b!1528664))

(assert (= (and b!1528664 res!1046380) b!1528668))

(assert (= (and b!1528668 res!1046381) b!1528676))

(assert (= (and b!1528676 res!1046383) b!1528670))

(assert (= (and b!1528670 res!1046372) b!1528667))

(assert (= (and b!1528667 res!1046371) b!1528665))

(assert (= (and b!1528667 (not res!1046374)) b!1528674))

(assert (= (and b!1528674 (not res!1046379)) b!1528669))

(declare-fun m!1411551 () Bool)

(assert (=> b!1528670 m!1411551))

(assert (=> b!1528670 m!1411551))

(declare-fun m!1411553 () Bool)

(assert (=> b!1528670 m!1411553))

(declare-fun m!1411555 () Bool)

(assert (=> b!1528670 m!1411555))

(declare-fun m!1411557 () Bool)

(assert (=> b!1528670 m!1411557))

(declare-fun m!1411559 () Bool)

(assert (=> b!1528669 m!1411559))

(declare-fun m!1411561 () Bool)

(assert (=> start!130228 m!1411561))

(declare-fun m!1411563 () Bool)

(assert (=> start!130228 m!1411563))

(declare-fun m!1411565 () Bool)

(assert (=> b!1528676 m!1411565))

(assert (=> b!1528676 m!1411565))

(declare-fun m!1411567 () Bool)

(assert (=> b!1528676 m!1411567))

(declare-fun m!1411569 () Bool)

(assert (=> b!1528672 m!1411569))

(declare-fun m!1411571 () Bool)

(assert (=> b!1528675 m!1411571))

(assert (=> b!1528675 m!1411571))

(declare-fun m!1411573 () Bool)

(assert (=> b!1528675 m!1411573))

(assert (=> b!1528674 m!1411565))

(assert (=> b!1528674 m!1411565))

(declare-fun m!1411575 () Bool)

(assert (=> b!1528674 m!1411575))

(declare-fun m!1411577 () Bool)

(assert (=> b!1528674 m!1411577))

(declare-fun m!1411579 () Bool)

(assert (=> b!1528674 m!1411579))

(assert (=> b!1528674 m!1411565))

(declare-fun m!1411581 () Bool)

(assert (=> b!1528674 m!1411581))

(declare-fun m!1411583 () Bool)

(assert (=> b!1528671 m!1411583))

(assert (=> b!1528666 m!1411565))

(assert (=> b!1528666 m!1411565))

(declare-fun m!1411585 () Bool)

(assert (=> b!1528666 m!1411585))

(assert (=> b!1528665 m!1411565))

(assert (=> b!1528665 m!1411565))

(declare-fun m!1411587 () Bool)

(assert (=> b!1528665 m!1411587))

(assert (=> b!1528667 m!1411565))

(declare-fun m!1411589 () Bool)

(assert (=> b!1528667 m!1411589))

(declare-fun m!1411591 () Bool)

(assert (=> b!1528667 m!1411591))

(declare-fun m!1411593 () Bool)

(assert (=> b!1528667 m!1411593))

(assert (=> b!1528668 m!1411565))

(assert (=> b!1528668 m!1411565))

(declare-fun m!1411595 () Bool)

(assert (=> b!1528668 m!1411595))

(assert (=> b!1528668 m!1411595))

(assert (=> b!1528668 m!1411565))

(declare-fun m!1411597 () Bool)

(assert (=> b!1528668 m!1411597))

(check-sat (not b!1528671) (not b!1528676) (not b!1528672) (not b!1528665) (not b!1528674) (not b!1528670) (not start!130228) (not b!1528667) (not b!1528666) (not b!1528675) (not b!1528669) (not b!1528668))
(check-sat)
