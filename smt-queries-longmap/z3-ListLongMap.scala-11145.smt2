; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130182 () Bool)

(assert start!130182)

(declare-fun b!1528428 () Bool)

(declare-fun res!1046324 () Bool)

(declare-fun e!851843 () Bool)

(assert (=> b!1528428 (=> (not res!1046324) (not e!851843))))

(declare-datatypes ((array!101530 0))(
  ( (array!101531 (arr!48991 (Array (_ BitVec 32) (_ BitVec 64))) (size!49543 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101530)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528428 (= res!1046324 (validKeyInArray!0 (select (arr!48991 a!2804) i!961)))))

(declare-fun b!1528429 () Bool)

(declare-fun e!851842 () Bool)

(declare-fun e!851845 () Bool)

(assert (=> b!1528429 (= e!851842 (not e!851845))))

(declare-fun res!1046328 () Bool)

(assert (=> b!1528429 (=> res!1046328 e!851845)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528429 (= res!1046328 (or (not (= (select (arr!48991 a!2804) j!70) (select (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!851841 () Bool)

(assert (=> b!1528429 e!851841))

(declare-fun res!1046319 () Bool)

(assert (=> b!1528429 (=> (not res!1046319) (not e!851841))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101530 (_ BitVec 32)) Bool)

(assert (=> b!1528429 (= res!1046319 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50981 0))(
  ( (Unit!50982) )
))
(declare-fun lt!661916 () Unit!50981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50981)

(assert (=> b!1528429 (= lt!661916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528430 () Bool)

(declare-fun res!1046321 () Bool)

(assert (=> b!1528430 (=> (not res!1046321) (not e!851842))))

(declare-datatypes ((SeekEntryResult!13179 0))(
  ( (MissingZero!13179 (index!55111 (_ BitVec 32))) (Found!13179 (index!55112 (_ BitVec 32))) (Intermediate!13179 (undefined!13991 Bool) (index!55113 (_ BitVec 32)) (x!136805 (_ BitVec 32))) (Undefined!13179) (MissingVacant!13179 (index!55114 (_ BitVec 32))) )
))
(declare-fun lt!661917 () SeekEntryResult!13179)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101530 (_ BitVec 32)) SeekEntryResult!13179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528430 (= res!1046321 (= lt!661917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101531 (store (arr!48991 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49543 a!2804)) mask!2512)))))

(declare-fun b!1528431 () Bool)

(declare-fun res!1046325 () Bool)

(assert (=> b!1528431 (=> (not res!1046325) (not e!851843))))

(assert (=> b!1528431 (= res!1046325 (validKeyInArray!0 (select (arr!48991 a!2804) j!70)))))

(declare-fun b!1528432 () Bool)

(assert (=> b!1528432 (= e!851843 e!851842)))

(declare-fun res!1046329 () Bool)

(assert (=> b!1528432 (=> (not res!1046329) (not e!851842))))

(declare-fun lt!661914 () SeekEntryResult!13179)

(assert (=> b!1528432 (= res!1046329 (= lt!661917 lt!661914))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528432 (= lt!661914 (Intermediate!13179 false resIndex!21 resX!21))))

(assert (=> b!1528432 (= lt!661917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48991 a!2804) j!70) mask!2512) (select (arr!48991 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528433 () Bool)

(declare-fun res!1046318 () Bool)

(assert (=> b!1528433 (=> (not res!1046318) (not e!851843))))

(assert (=> b!1528433 (= res!1046318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528434 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101530 (_ BitVec 32)) SeekEntryResult!13179)

(assert (=> b!1528434 (= e!851841 (= (seekEntry!0 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) (Found!13179 j!70)))))

(declare-fun b!1528427 () Bool)

(declare-fun res!1046326 () Bool)

(assert (=> b!1528427 (=> (not res!1046326) (not e!851843))))

(declare-datatypes ((List!35552 0))(
  ( (Nil!35549) (Cons!35548 (h!36985 (_ BitVec 64)) (t!50238 List!35552)) )
))
(declare-fun arrayNoDuplicates!0 (array!101530 (_ BitVec 32) List!35552) Bool)

(assert (=> b!1528427 (= res!1046326 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35549))))

(declare-fun res!1046320 () Bool)

(assert (=> start!130182 (=> (not res!1046320) (not e!851843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130182 (= res!1046320 (validMask!0 mask!2512))))

(assert (=> start!130182 e!851843))

(assert (=> start!130182 true))

(declare-fun array_inv!38224 (array!101530) Bool)

(assert (=> start!130182 (array_inv!38224 a!2804)))

(declare-fun b!1528435 () Bool)

(assert (=> b!1528435 (= e!851845 true)))

(declare-fun lt!661915 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528435 (= lt!661915 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528436 () Bool)

(declare-fun res!1046323 () Bool)

(assert (=> b!1528436 (=> (not res!1046323) (not e!851843))))

(assert (=> b!1528436 (= res!1046323 (and (= (size!49543 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49543 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49543 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528437 () Bool)

(declare-fun res!1046327 () Bool)

(assert (=> b!1528437 (=> (not res!1046327) (not e!851843))))

(assert (=> b!1528437 (= res!1046327 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49543 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49543 a!2804))))))

(declare-fun b!1528438 () Bool)

(declare-fun res!1046322 () Bool)

(assert (=> b!1528438 (=> (not res!1046322) (not e!851842))))

(assert (=> b!1528438 (= res!1046322 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48991 a!2804) j!70) a!2804 mask!2512) lt!661914))))

(assert (= (and start!130182 res!1046320) b!1528436))

(assert (= (and b!1528436 res!1046323) b!1528428))

(assert (= (and b!1528428 res!1046324) b!1528431))

(assert (= (and b!1528431 res!1046325) b!1528433))

(assert (= (and b!1528433 res!1046318) b!1528427))

(assert (= (and b!1528427 res!1046326) b!1528437))

(assert (= (and b!1528437 res!1046327) b!1528432))

(assert (= (and b!1528432 res!1046329) b!1528438))

(assert (= (and b!1528438 res!1046322) b!1528430))

(assert (= (and b!1528430 res!1046321) b!1528429))

(assert (= (and b!1528429 res!1046319) b!1528434))

(assert (= (and b!1528429 (not res!1046328)) b!1528435))

(declare-fun m!1410755 () Bool)

(assert (=> start!130182 m!1410755))

(declare-fun m!1410757 () Bool)

(assert (=> start!130182 m!1410757))

(declare-fun m!1410759 () Bool)

(assert (=> b!1528434 m!1410759))

(assert (=> b!1528434 m!1410759))

(declare-fun m!1410761 () Bool)

(assert (=> b!1528434 m!1410761))

(assert (=> b!1528432 m!1410759))

(assert (=> b!1528432 m!1410759))

(declare-fun m!1410763 () Bool)

(assert (=> b!1528432 m!1410763))

(assert (=> b!1528432 m!1410763))

(assert (=> b!1528432 m!1410759))

(declare-fun m!1410765 () Bool)

(assert (=> b!1528432 m!1410765))

(declare-fun m!1410767 () Bool)

(assert (=> b!1528435 m!1410767))

(declare-fun m!1410769 () Bool)

(assert (=> b!1528427 m!1410769))

(declare-fun m!1410771 () Bool)

(assert (=> b!1528430 m!1410771))

(declare-fun m!1410773 () Bool)

(assert (=> b!1528430 m!1410773))

(assert (=> b!1528430 m!1410773))

(declare-fun m!1410775 () Bool)

(assert (=> b!1528430 m!1410775))

(assert (=> b!1528430 m!1410775))

(assert (=> b!1528430 m!1410773))

(declare-fun m!1410777 () Bool)

(assert (=> b!1528430 m!1410777))

(declare-fun m!1410779 () Bool)

(assert (=> b!1528433 m!1410779))

(assert (=> b!1528429 m!1410759))

(declare-fun m!1410781 () Bool)

(assert (=> b!1528429 m!1410781))

(assert (=> b!1528429 m!1410771))

(assert (=> b!1528429 m!1410773))

(declare-fun m!1410783 () Bool)

(assert (=> b!1528429 m!1410783))

(assert (=> b!1528438 m!1410759))

(assert (=> b!1528438 m!1410759))

(declare-fun m!1410785 () Bool)

(assert (=> b!1528438 m!1410785))

(assert (=> b!1528431 m!1410759))

(assert (=> b!1528431 m!1410759))

(declare-fun m!1410787 () Bool)

(assert (=> b!1528431 m!1410787))

(declare-fun m!1410789 () Bool)

(assert (=> b!1528428 m!1410789))

(assert (=> b!1528428 m!1410789))

(declare-fun m!1410791 () Bool)

(assert (=> b!1528428 m!1410791))

(check-sat (not start!130182) (not b!1528428) (not b!1528431) (not b!1528438) (not b!1528434) (not b!1528433) (not b!1528430) (not b!1528435) (not b!1528429) (not b!1528432) (not b!1528427))
(check-sat)
