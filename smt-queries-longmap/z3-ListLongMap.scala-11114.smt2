; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130170 () Bool)

(assert start!130170)

(declare-fun b!1525771 () Bool)

(declare-fun res!1043197 () Bool)

(declare-fun e!850772 () Bool)

(assert (=> b!1525771 (=> (not res!1043197) (not e!850772))))

(declare-datatypes ((array!101503 0))(
  ( (array!101504 (arr!48976 (Array (_ BitVec 32) (_ BitVec 64))) (size!49527 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101503)

(declare-datatypes ((List!35446 0))(
  ( (Nil!35443) (Cons!35442 (h!36884 (_ BitVec 64)) (t!50132 List!35446)) )
))
(declare-fun arrayNoDuplicates!0 (array!101503 (_ BitVec 32) List!35446) Bool)

(assert (=> b!1525771 (= res!1043197 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35443))))

(declare-fun b!1525772 () Bool)

(declare-fun res!1043196 () Bool)

(assert (=> b!1525772 (=> (not res!1043196) (not e!850772))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101503 (_ BitVec 32)) Bool)

(assert (=> b!1525772 (= res!1043196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525773 () Bool)

(declare-fun res!1043200 () Bool)

(assert (=> b!1525773 (=> (not res!1043200) (not e!850772))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525773 (= res!1043200 (validKeyInArray!0 (select (arr!48976 a!2804) i!961)))))

(declare-fun b!1525774 () Bool)

(declare-fun e!850773 () Bool)

(assert (=> b!1525774 (= e!850772 e!850773)))

(declare-fun res!1043201 () Bool)

(assert (=> b!1525774 (=> (not res!1043201) (not e!850773))))

(declare-datatypes ((SeekEntryResult!13034 0))(
  ( (MissingZero!13034 (index!54531 (_ BitVec 32))) (Found!13034 (index!54532 (_ BitVec 32))) (Intermediate!13034 (undefined!13846 Bool) (index!54533 (_ BitVec 32)) (x!136431 (_ BitVec 32))) (Undefined!13034) (MissingVacant!13034 (index!54534 (_ BitVec 32))) )
))
(declare-fun lt!660838 () SeekEntryResult!13034)

(declare-fun lt!660839 () SeekEntryResult!13034)

(assert (=> b!1525774 (= res!1043201 (= lt!660838 lt!660839))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525774 (= lt!660839 (Intermediate!13034 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101503 (_ BitVec 32)) SeekEntryResult!13034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525774 (= lt!660838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48976 a!2804) j!70) mask!2512) (select (arr!48976 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525775 () Bool)

(declare-fun res!1043199 () Bool)

(assert (=> b!1525775 (=> (not res!1043199) (not e!850772))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525775 (= res!1043199 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49527 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49527 a!2804))))))

(declare-fun b!1525776 () Bool)

(declare-fun res!1043194 () Bool)

(assert (=> b!1525776 (=> (not res!1043194) (not e!850773))))

(assert (=> b!1525776 (= res!1043194 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) lt!660839))))

(declare-fun b!1525777 () Bool)

(declare-fun res!1043192 () Bool)

(assert (=> b!1525777 (=> (not res!1043192) (not e!850773))))

(assert (=> b!1525777 (= res!1043192 (= lt!660838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101504 (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49527 a!2804)) mask!2512)))))

(declare-fun b!1525778 () Bool)

(declare-fun res!1043202 () Bool)

(assert (=> b!1525778 (=> (not res!1043202) (not e!850772))))

(assert (=> b!1525778 (= res!1043202 (validKeyInArray!0 (select (arr!48976 a!2804) j!70)))))

(declare-fun b!1525779 () Bool)

(assert (=> b!1525779 (= e!850773 (not true))))

(declare-fun e!850771 () Bool)

(assert (=> b!1525779 e!850771))

(declare-fun res!1043198 () Bool)

(assert (=> b!1525779 (=> (not res!1043198) (not e!850771))))

(assert (=> b!1525779 (= res!1043198 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50887 0))(
  ( (Unit!50888) )
))
(declare-fun lt!660840 () Unit!50887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50887)

(assert (=> b!1525779 (= lt!660840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525780 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101503 (_ BitVec 32)) SeekEntryResult!13034)

(assert (=> b!1525780 (= e!850771 (= (seekEntry!0 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) (Found!13034 j!70)))))

(declare-fun res!1043193 () Bool)

(assert (=> start!130170 (=> (not res!1043193) (not e!850772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130170 (= res!1043193 (validMask!0 mask!2512))))

(assert (=> start!130170 e!850772))

(assert (=> start!130170 true))

(declare-fun array_inv!38257 (array!101503) Bool)

(assert (=> start!130170 (array_inv!38257 a!2804)))

(declare-fun b!1525781 () Bool)

(declare-fun res!1043195 () Bool)

(assert (=> b!1525781 (=> (not res!1043195) (not e!850772))))

(assert (=> b!1525781 (= res!1043195 (and (= (size!49527 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49527 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49527 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130170 res!1043193) b!1525781))

(assert (= (and b!1525781 res!1043195) b!1525773))

(assert (= (and b!1525773 res!1043200) b!1525778))

(assert (= (and b!1525778 res!1043202) b!1525772))

(assert (= (and b!1525772 res!1043196) b!1525771))

(assert (= (and b!1525771 res!1043197) b!1525775))

(assert (= (and b!1525775 res!1043199) b!1525774))

(assert (= (and b!1525774 res!1043201) b!1525776))

(assert (= (and b!1525776 res!1043194) b!1525777))

(assert (= (and b!1525777 res!1043192) b!1525779))

(assert (= (and b!1525779 res!1043198) b!1525780))

(declare-fun m!1408741 () Bool)

(assert (=> b!1525774 m!1408741))

(assert (=> b!1525774 m!1408741))

(declare-fun m!1408743 () Bool)

(assert (=> b!1525774 m!1408743))

(assert (=> b!1525774 m!1408743))

(assert (=> b!1525774 m!1408741))

(declare-fun m!1408745 () Bool)

(assert (=> b!1525774 m!1408745))

(declare-fun m!1408747 () Bool)

(assert (=> b!1525772 m!1408747))

(assert (=> b!1525776 m!1408741))

(assert (=> b!1525776 m!1408741))

(declare-fun m!1408749 () Bool)

(assert (=> b!1525776 m!1408749))

(declare-fun m!1408751 () Bool)

(assert (=> b!1525771 m!1408751))

(declare-fun m!1408753 () Bool)

(assert (=> b!1525779 m!1408753))

(declare-fun m!1408755 () Bool)

(assert (=> b!1525779 m!1408755))

(assert (=> b!1525778 m!1408741))

(assert (=> b!1525778 m!1408741))

(declare-fun m!1408757 () Bool)

(assert (=> b!1525778 m!1408757))

(assert (=> b!1525780 m!1408741))

(assert (=> b!1525780 m!1408741))

(declare-fun m!1408759 () Bool)

(assert (=> b!1525780 m!1408759))

(declare-fun m!1408761 () Bool)

(assert (=> b!1525773 m!1408761))

(assert (=> b!1525773 m!1408761))

(declare-fun m!1408763 () Bool)

(assert (=> b!1525773 m!1408763))

(declare-fun m!1408765 () Bool)

(assert (=> b!1525777 m!1408765))

(declare-fun m!1408767 () Bool)

(assert (=> b!1525777 m!1408767))

(assert (=> b!1525777 m!1408767))

(declare-fun m!1408769 () Bool)

(assert (=> b!1525777 m!1408769))

(assert (=> b!1525777 m!1408769))

(assert (=> b!1525777 m!1408767))

(declare-fun m!1408771 () Bool)

(assert (=> b!1525777 m!1408771))

(declare-fun m!1408773 () Bool)

(assert (=> start!130170 m!1408773))

(declare-fun m!1408775 () Bool)

(assert (=> start!130170 m!1408775))

(check-sat (not b!1525771) (not b!1525773) (not b!1525776) (not b!1525780) (not b!1525778) (not b!1525777) (not b!1525772) (not b!1525774) (not b!1525779) (not start!130170))
(check-sat)
