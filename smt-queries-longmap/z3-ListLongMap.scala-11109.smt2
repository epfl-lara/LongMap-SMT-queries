; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129708 () Bool)

(assert start!129708)

(declare-fun b!1522671 () Bool)

(declare-fun res!1041765 () Bool)

(declare-fun e!848977 () Bool)

(assert (=> b!1522671 (=> (not res!1041765) (not e!848977))))

(declare-datatypes ((array!101302 0))(
  ( (array!101303 (arr!48883 (Array (_ BitVec 32) (_ BitVec 64))) (size!49435 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101302)

(declare-datatypes ((List!35444 0))(
  ( (Nil!35441) (Cons!35440 (h!36865 (_ BitVec 64)) (t!50130 List!35444)) )
))
(declare-fun arrayNoDuplicates!0 (array!101302 (_ BitVec 32) List!35444) Bool)

(assert (=> b!1522671 (= res!1041765 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35441))))

(declare-fun b!1522672 () Bool)

(declare-fun res!1041771 () Bool)

(assert (=> b!1522672 (=> (not res!1041771) (not e!848977))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522672 (= res!1041771 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49435 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49435 a!2804))))))

(declare-fun b!1522673 () Bool)

(declare-fun e!848976 () Bool)

(assert (=> b!1522673 (= e!848977 e!848976)))

(declare-fun res!1041763 () Bool)

(assert (=> b!1522673 (=> (not res!1041763) (not e!848976))))

(declare-datatypes ((SeekEntryResult!13071 0))(
  ( (MissingZero!13071 (index!54679 (_ BitVec 32))) (Found!13071 (index!54680 (_ BitVec 32))) (Intermediate!13071 (undefined!13883 Bool) (index!54681 (_ BitVec 32)) (x!136376 (_ BitVec 32))) (Undefined!13071) (MissingVacant!13071 (index!54682 (_ BitVec 32))) )
))
(declare-fun lt!659544 () SeekEntryResult!13071)

(declare-fun lt!659543 () SeekEntryResult!13071)

(assert (=> b!1522673 (= res!1041763 (= lt!659544 lt!659543))))

(assert (=> b!1522673 (= lt!659543 (Intermediate!13071 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101302 (_ BitVec 32)) SeekEntryResult!13071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522673 (= lt!659544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48883 a!2804) j!70) mask!2512) (select (arr!48883 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522674 () Bool)

(declare-fun res!1041766 () Bool)

(assert (=> b!1522674 (=> (not res!1041766) (not e!848977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101302 (_ BitVec 32)) Bool)

(assert (=> b!1522674 (= res!1041766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522675 () Bool)

(declare-fun res!1041764 () Bool)

(assert (=> b!1522675 (=> (not res!1041764) (not e!848977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522675 (= res!1041764 (validKeyInArray!0 (select (arr!48883 a!2804) j!70)))))

(declare-fun b!1522676 () Bool)

(declare-fun res!1041772 () Bool)

(assert (=> b!1522676 (=> (not res!1041772) (not e!848977))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522676 (= res!1041772 (validKeyInArray!0 (select (arr!48883 a!2804) i!961)))))

(declare-fun b!1522677 () Bool)

(declare-fun res!1041770 () Bool)

(assert (=> b!1522677 (=> (not res!1041770) (not e!848976))))

(assert (=> b!1522677 (= res!1041770 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) lt!659543))))

(declare-fun b!1522678 () Bool)

(assert (=> b!1522678 (= e!848976 (not true))))

(declare-fun e!848974 () Bool)

(assert (=> b!1522678 e!848974))

(declare-fun res!1041762 () Bool)

(assert (=> b!1522678 (=> (not res!1041762) (not e!848974))))

(assert (=> b!1522678 (= res!1041762 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50765 0))(
  ( (Unit!50766) )
))
(declare-fun lt!659542 () Unit!50765)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50765)

(assert (=> b!1522678 (= lt!659542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522679 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101302 (_ BitVec 32)) SeekEntryResult!13071)

(assert (=> b!1522679 (= e!848974 (= (seekEntry!0 (select (arr!48883 a!2804) j!70) a!2804 mask!2512) (Found!13071 j!70)))))

(declare-fun res!1041768 () Bool)

(assert (=> start!129708 (=> (not res!1041768) (not e!848977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129708 (= res!1041768 (validMask!0 mask!2512))))

(assert (=> start!129708 e!848977))

(assert (=> start!129708 true))

(declare-fun array_inv!38116 (array!101302) Bool)

(assert (=> start!129708 (array_inv!38116 a!2804)))

(declare-fun b!1522680 () Bool)

(declare-fun res!1041769 () Bool)

(assert (=> b!1522680 (=> (not res!1041769) (not e!848976))))

(assert (=> b!1522680 (= res!1041769 (= lt!659544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101303 (store (arr!48883 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49435 a!2804)) mask!2512)))))

(declare-fun b!1522681 () Bool)

(declare-fun res!1041767 () Bool)

(assert (=> b!1522681 (=> (not res!1041767) (not e!848977))))

(assert (=> b!1522681 (= res!1041767 (and (= (size!49435 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49435 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49435 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129708 res!1041768) b!1522681))

(assert (= (and b!1522681 res!1041767) b!1522676))

(assert (= (and b!1522676 res!1041772) b!1522675))

(assert (= (and b!1522675 res!1041764) b!1522674))

(assert (= (and b!1522674 res!1041766) b!1522671))

(assert (= (and b!1522671 res!1041765) b!1522672))

(assert (= (and b!1522672 res!1041771) b!1522673))

(assert (= (and b!1522673 res!1041763) b!1522677))

(assert (= (and b!1522677 res!1041770) b!1522680))

(assert (= (and b!1522680 res!1041769) b!1522678))

(assert (= (and b!1522678 res!1041762) b!1522679))

(declare-fun m!1405169 () Bool)

(assert (=> b!1522680 m!1405169))

(declare-fun m!1405171 () Bool)

(assert (=> b!1522680 m!1405171))

(assert (=> b!1522680 m!1405171))

(declare-fun m!1405173 () Bool)

(assert (=> b!1522680 m!1405173))

(assert (=> b!1522680 m!1405173))

(assert (=> b!1522680 m!1405171))

(declare-fun m!1405175 () Bool)

(assert (=> b!1522680 m!1405175))

(declare-fun m!1405177 () Bool)

(assert (=> b!1522676 m!1405177))

(assert (=> b!1522676 m!1405177))

(declare-fun m!1405179 () Bool)

(assert (=> b!1522676 m!1405179))

(declare-fun m!1405181 () Bool)

(assert (=> b!1522679 m!1405181))

(assert (=> b!1522679 m!1405181))

(declare-fun m!1405183 () Bool)

(assert (=> b!1522679 m!1405183))

(declare-fun m!1405185 () Bool)

(assert (=> b!1522674 m!1405185))

(declare-fun m!1405187 () Bool)

(assert (=> start!129708 m!1405187))

(declare-fun m!1405189 () Bool)

(assert (=> start!129708 m!1405189))

(assert (=> b!1522675 m!1405181))

(assert (=> b!1522675 m!1405181))

(declare-fun m!1405191 () Bool)

(assert (=> b!1522675 m!1405191))

(declare-fun m!1405193 () Bool)

(assert (=> b!1522678 m!1405193))

(declare-fun m!1405195 () Bool)

(assert (=> b!1522678 m!1405195))

(assert (=> b!1522673 m!1405181))

(assert (=> b!1522673 m!1405181))

(declare-fun m!1405197 () Bool)

(assert (=> b!1522673 m!1405197))

(assert (=> b!1522673 m!1405197))

(assert (=> b!1522673 m!1405181))

(declare-fun m!1405199 () Bool)

(assert (=> b!1522673 m!1405199))

(assert (=> b!1522677 m!1405181))

(assert (=> b!1522677 m!1405181))

(declare-fun m!1405201 () Bool)

(assert (=> b!1522677 m!1405201))

(declare-fun m!1405203 () Bool)

(assert (=> b!1522671 m!1405203))

(check-sat (not b!1522678) (not b!1522676) (not b!1522673) (not b!1522679) (not b!1522677) (not start!129708) (not b!1522675) (not b!1522671) (not b!1522680) (not b!1522674))
(check-sat)
