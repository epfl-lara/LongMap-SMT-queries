; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129212 () Bool)

(assert start!129212)

(declare-fun b!1512837 () Bool)

(declare-fun e!844801 () Bool)

(declare-fun e!844802 () Bool)

(assert (=> b!1512837 (= e!844801 e!844802)))

(declare-fun res!1031569 () Bool)

(assert (=> b!1512837 (=> (not res!1031569) (not e!844802))))

(declare-datatypes ((SeekEntryResult!12737 0))(
  ( (MissingZero!12737 (index!53343 (_ BitVec 32))) (Found!12737 (index!53344 (_ BitVec 32))) (Intermediate!12737 (undefined!13549 Bool) (index!53345 (_ BitVec 32)) (x!135284 (_ BitVec 32))) (Undefined!12737) (MissingVacant!12737 (index!53346 (_ BitVec 32))) )
))
(declare-fun lt!655985 () SeekEntryResult!12737)

(declare-fun lt!655986 () SeekEntryResult!12737)

(assert (=> b!1512837 (= res!1031569 (= lt!655985 lt!655986))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512837 (= lt!655986 (Intermediate!12737 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100882 0))(
  ( (array!100883 (arr!48673 (Array (_ BitVec 32) (_ BitVec 64))) (size!49224 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100882)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512837 (= lt!655985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48673 a!2804) j!70) mask!2512) (select (arr!48673 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512838 () Bool)

(declare-fun res!1031567 () Bool)

(assert (=> b!1512838 (=> (not res!1031567) (not e!844802))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512838 (= res!1031567 (= lt!655985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100883 (store (arr!48673 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49224 a!2804)) mask!2512)))))

(declare-fun b!1512839 () Bool)

(declare-fun res!1031566 () Bool)

(assert (=> b!1512839 (=> (not res!1031566) (not e!844801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100882 (_ BitVec 32)) Bool)

(assert (=> b!1512839 (= res!1031566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1031571 () Bool)

(assert (=> start!129212 (=> (not res!1031571) (not e!844801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129212 (= res!1031571 (validMask!0 mask!2512))))

(assert (=> start!129212 e!844801))

(assert (=> start!129212 true))

(declare-fun array_inv!37954 (array!100882) Bool)

(assert (=> start!129212 (array_inv!37954 a!2804)))

(declare-fun b!1512840 () Bool)

(declare-fun res!1031572 () Bool)

(assert (=> b!1512840 (=> (not res!1031572) (not e!844802))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1512840 (= res!1031572 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) lt!655986))))

(declare-fun b!1512841 () Bool)

(assert (=> b!1512841 (= e!844802 (not true))))

(declare-fun e!844800 () Bool)

(assert (=> b!1512841 e!844800))

(declare-fun res!1031573 () Bool)

(assert (=> b!1512841 (=> (not res!1031573) (not e!844800))))

(assert (=> b!1512841 (= res!1031573 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50377 0))(
  ( (Unit!50378) )
))
(declare-fun lt!655987 () Unit!50377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50377)

(assert (=> b!1512841 (= lt!655987 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512842 () Bool)

(declare-fun res!1031563 () Bool)

(assert (=> b!1512842 (=> (not res!1031563) (not e!844801))))

(assert (=> b!1512842 (= res!1031563 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49224 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49224 a!2804))))))

(declare-fun b!1512843 () Bool)

(declare-fun res!1031564 () Bool)

(assert (=> b!1512843 (=> (not res!1031564) (not e!844801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512843 (= res!1031564 (validKeyInArray!0 (select (arr!48673 a!2804) j!70)))))

(declare-fun b!1512844 () Bool)

(declare-fun res!1031570 () Bool)

(assert (=> b!1512844 (=> (not res!1031570) (not e!844801))))

(declare-datatypes ((List!35143 0))(
  ( (Nil!35140) (Cons!35139 (h!36566 (_ BitVec 64)) (t!49829 List!35143)) )
))
(declare-fun arrayNoDuplicates!0 (array!100882 (_ BitVec 32) List!35143) Bool)

(assert (=> b!1512844 (= res!1031570 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35140))))

(declare-fun b!1512845 () Bool)

(declare-fun res!1031565 () Bool)

(assert (=> b!1512845 (=> (not res!1031565) (not e!844801))))

(assert (=> b!1512845 (= res!1031565 (validKeyInArray!0 (select (arr!48673 a!2804) i!961)))))

(declare-fun b!1512846 () Bool)

(declare-fun res!1031568 () Bool)

(assert (=> b!1512846 (=> (not res!1031568) (not e!844801))))

(assert (=> b!1512846 (= res!1031568 (and (= (size!49224 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49224 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49224 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512847 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12737)

(assert (=> b!1512847 (= e!844800 (= (seekEntry!0 (select (arr!48673 a!2804) j!70) a!2804 mask!2512) (Found!12737 j!70)))))

(assert (= (and start!129212 res!1031571) b!1512846))

(assert (= (and b!1512846 res!1031568) b!1512845))

(assert (= (and b!1512845 res!1031565) b!1512843))

(assert (= (and b!1512843 res!1031564) b!1512839))

(assert (= (and b!1512839 res!1031566) b!1512844))

(assert (= (and b!1512844 res!1031570) b!1512842))

(assert (= (and b!1512842 res!1031563) b!1512837))

(assert (= (and b!1512837 res!1031569) b!1512840))

(assert (= (and b!1512840 res!1031572) b!1512838))

(assert (= (and b!1512838 res!1031567) b!1512841))

(assert (= (and b!1512841 res!1031573) b!1512847))

(declare-fun m!1395453 () Bool)

(assert (=> b!1512840 m!1395453))

(assert (=> b!1512840 m!1395453))

(declare-fun m!1395455 () Bool)

(assert (=> b!1512840 m!1395455))

(declare-fun m!1395457 () Bool)

(assert (=> b!1512841 m!1395457))

(declare-fun m!1395459 () Bool)

(assert (=> b!1512841 m!1395459))

(assert (=> b!1512837 m!1395453))

(assert (=> b!1512837 m!1395453))

(declare-fun m!1395461 () Bool)

(assert (=> b!1512837 m!1395461))

(assert (=> b!1512837 m!1395461))

(assert (=> b!1512837 m!1395453))

(declare-fun m!1395463 () Bool)

(assert (=> b!1512837 m!1395463))

(assert (=> b!1512847 m!1395453))

(assert (=> b!1512847 m!1395453))

(declare-fun m!1395465 () Bool)

(assert (=> b!1512847 m!1395465))

(declare-fun m!1395467 () Bool)

(assert (=> b!1512844 m!1395467))

(declare-fun m!1395469 () Bool)

(assert (=> b!1512839 m!1395469))

(assert (=> b!1512843 m!1395453))

(assert (=> b!1512843 m!1395453))

(declare-fun m!1395471 () Bool)

(assert (=> b!1512843 m!1395471))

(declare-fun m!1395473 () Bool)

(assert (=> b!1512838 m!1395473))

(declare-fun m!1395475 () Bool)

(assert (=> b!1512838 m!1395475))

(assert (=> b!1512838 m!1395475))

(declare-fun m!1395477 () Bool)

(assert (=> b!1512838 m!1395477))

(assert (=> b!1512838 m!1395477))

(assert (=> b!1512838 m!1395475))

(declare-fun m!1395479 () Bool)

(assert (=> b!1512838 m!1395479))

(declare-fun m!1395481 () Bool)

(assert (=> b!1512845 m!1395481))

(assert (=> b!1512845 m!1395481))

(declare-fun m!1395483 () Bool)

(assert (=> b!1512845 m!1395483))

(declare-fun m!1395485 () Bool)

(assert (=> start!129212 m!1395485))

(declare-fun m!1395487 () Bool)

(assert (=> start!129212 m!1395487))

(check-sat (not b!1512841) (not b!1512840) (not b!1512838) (not b!1512839) (not b!1512847) (not b!1512844) (not start!129212) (not b!1512837) (not b!1512843) (not b!1512845))
(check-sat)
