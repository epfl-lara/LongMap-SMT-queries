; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130488 () Bool)

(assert start!130488)

(declare-fun b!1531644 () Bool)

(declare-fun res!1048979 () Bool)

(declare-fun e!853396 () Bool)

(assert (=> b!1531644 (=> (not res!1048979) (not e!853396))))

(declare-datatypes ((array!101665 0))(
  ( (array!101666 (arr!49054 (Array (_ BitVec 32) (_ BitVec 64))) (size!49606 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101665)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531644 (= res!1048979 (validKeyInArray!0 (select (arr!49054 a!2804) i!961)))))

(declare-fun b!1531645 () Bool)

(declare-fun res!1048970 () Bool)

(assert (=> b!1531645 (=> (not res!1048970) (not e!853396))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101665 (_ BitVec 32)) Bool)

(assert (=> b!1531645 (= res!1048970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531646 () Bool)

(declare-fun e!853395 () Bool)

(declare-fun e!853391 () Bool)

(assert (=> b!1531646 (= e!853395 e!853391)))

(declare-fun res!1048974 () Bool)

(assert (=> b!1531646 (=> (not res!1048974) (not e!853391))))

(declare-fun lt!663182 () (_ BitVec 64))

(declare-fun lt!663181 () array!101665)

(declare-datatypes ((SeekEntryResult!13242 0))(
  ( (MissingZero!13242 (index!55363 (_ BitVec 32))) (Found!13242 (index!55364 (_ BitVec 32))) (Intermediate!13242 (undefined!14054 Bool) (index!55365 (_ BitVec 32)) (x!137063 (_ BitVec 32))) (Undefined!13242) (MissingVacant!13242 (index!55366 (_ BitVec 32))) )
))
(declare-fun lt!663177 () SeekEntryResult!13242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531646 (= res!1048974 (= lt!663177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663182 mask!2512) lt!663182 lt!663181 mask!2512)))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1531646 (= lt!663182 (select (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531646 (= lt!663181 (array!101666 (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49606 a!2804)))))

(declare-fun b!1531647 () Bool)

(declare-fun e!853394 () Bool)

(declare-fun e!853392 () Bool)

(assert (=> b!1531647 (= e!853394 e!853392)))

(declare-fun res!1048973 () Bool)

(assert (=> b!1531647 (=> res!1048973 e!853392)))

(declare-fun lt!663180 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531647 (= res!1048973 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663180 #b00000000000000000000000000000000) (bvsge lt!663180 (size!49606 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531647 (= lt!663180 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531648 () Bool)

(declare-fun res!1048971 () Bool)

(assert (=> b!1531648 (=> (not res!1048971) (not e!853396))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531648 (= res!1048971 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49606 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49606 a!2804))))))

(declare-fun b!1531649 () Bool)

(declare-fun res!1048968 () Bool)

(assert (=> b!1531649 (=> (not res!1048968) (not e!853395))))

(declare-fun lt!663178 () SeekEntryResult!13242)

(assert (=> b!1531649 (= res!1048968 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) lt!663178))))

(declare-fun b!1531650 () Bool)

(declare-fun res!1048969 () Bool)

(assert (=> b!1531650 (=> (not res!1048969) (not e!853396))))

(assert (=> b!1531650 (= res!1048969 (validKeyInArray!0 (select (arr!49054 a!2804) j!70)))))

(declare-fun b!1531651 () Bool)

(declare-fun res!1048976 () Bool)

(assert (=> b!1531651 (=> (not res!1048976) (not e!853396))))

(assert (=> b!1531651 (= res!1048976 (and (= (size!49606 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49606 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49606 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!853390 () Bool)

(declare-fun b!1531652 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13242)

(assert (=> b!1531652 (= e!853390 (= (seekEntry!0 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) (Found!13242 j!70)))))

(declare-fun b!1531653 () Bool)

(declare-fun res!1048981 () Bool)

(assert (=> b!1531653 (=> res!1048981 e!853392)))

(assert (=> b!1531653 (= res!1048981 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663180 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) lt!663178)))))

(declare-fun res!1048972 () Bool)

(assert (=> start!130488 (=> (not res!1048972) (not e!853396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130488 (= res!1048972 (validMask!0 mask!2512))))

(assert (=> start!130488 e!853396))

(assert (=> start!130488 true))

(declare-fun array_inv!38287 (array!101665) Bool)

(assert (=> start!130488 (array_inv!38287 a!2804)))

(declare-fun b!1531654 () Bool)

(assert (=> b!1531654 (= e!853396 e!853395)))

(declare-fun res!1048977 () Bool)

(assert (=> b!1531654 (=> (not res!1048977) (not e!853395))))

(assert (=> b!1531654 (= res!1048977 (= lt!663177 lt!663178))))

(assert (=> b!1531654 (= lt!663178 (Intermediate!13242 false resIndex!21 resX!21))))

(assert (=> b!1531654 (= lt!663177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49054 a!2804) j!70) mask!2512) (select (arr!49054 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531655 () Bool)

(assert (=> b!1531655 (= e!853391 (not e!853394))))

(declare-fun res!1048980 () Bool)

(assert (=> b!1531655 (=> res!1048980 e!853394)))

(assert (=> b!1531655 (= res!1048980 (or (not (= (select (arr!49054 a!2804) j!70) lt!663182)) (= x!534 resX!21)))))

(assert (=> b!1531655 e!853390))

(declare-fun res!1048975 () Bool)

(assert (=> b!1531655 (=> (not res!1048975) (not e!853390))))

(assert (=> b!1531655 (= res!1048975 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51107 0))(
  ( (Unit!51108) )
))
(declare-fun lt!663179 () Unit!51107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51107)

(assert (=> b!1531655 (= lt!663179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531656 () Bool)

(declare-fun res!1048978 () Bool)

(assert (=> b!1531656 (=> (not res!1048978) (not e!853396))))

(declare-datatypes ((List!35615 0))(
  ( (Nil!35612) (Cons!35611 (h!37057 (_ BitVec 64)) (t!50301 List!35615)) )
))
(declare-fun arrayNoDuplicates!0 (array!101665 (_ BitVec 32) List!35615) Bool)

(assert (=> b!1531656 (= res!1048978 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35612))))

(declare-fun b!1531657 () Bool)

(assert (=> b!1531657 (= e!853392 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101665 (_ BitVec 32)) SeekEntryResult!13242)

(assert (=> b!1531657 (= (seekEntryOrOpen!0 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663182 lt!663181 mask!2512))))

(declare-fun lt!663183 () Unit!51107)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51107)

(assert (=> b!1531657 (= lt!663183 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663180 resX!21 resIndex!21 mask!2512))))

(assert (= (and start!130488 res!1048972) b!1531651))

(assert (= (and b!1531651 res!1048976) b!1531644))

(assert (= (and b!1531644 res!1048979) b!1531650))

(assert (= (and b!1531650 res!1048969) b!1531645))

(assert (= (and b!1531645 res!1048970) b!1531656))

(assert (= (and b!1531656 res!1048978) b!1531648))

(assert (= (and b!1531648 res!1048971) b!1531654))

(assert (= (and b!1531654 res!1048977) b!1531649))

(assert (= (and b!1531649 res!1048968) b!1531646))

(assert (= (and b!1531646 res!1048974) b!1531655))

(assert (= (and b!1531655 res!1048975) b!1531652))

(assert (= (and b!1531655 (not res!1048980)) b!1531647))

(assert (= (and b!1531647 (not res!1048973)) b!1531653))

(assert (= (and b!1531653 (not res!1048981)) b!1531657))

(declare-fun m!1413743 () Bool)

(assert (=> b!1531649 m!1413743))

(assert (=> b!1531649 m!1413743))

(declare-fun m!1413745 () Bool)

(assert (=> b!1531649 m!1413745))

(assert (=> b!1531655 m!1413743))

(declare-fun m!1413747 () Bool)

(assert (=> b!1531655 m!1413747))

(declare-fun m!1413749 () Bool)

(assert (=> b!1531655 m!1413749))

(declare-fun m!1413751 () Bool)

(assert (=> b!1531644 m!1413751))

(assert (=> b!1531644 m!1413751))

(declare-fun m!1413753 () Bool)

(assert (=> b!1531644 m!1413753))

(declare-fun m!1413755 () Bool)

(assert (=> b!1531656 m!1413755))

(assert (=> b!1531650 m!1413743))

(assert (=> b!1531650 m!1413743))

(declare-fun m!1413757 () Bool)

(assert (=> b!1531650 m!1413757))

(declare-fun m!1413759 () Bool)

(assert (=> b!1531645 m!1413759))

(assert (=> b!1531652 m!1413743))

(assert (=> b!1531652 m!1413743))

(declare-fun m!1413761 () Bool)

(assert (=> b!1531652 m!1413761))

(assert (=> b!1531653 m!1413743))

(assert (=> b!1531653 m!1413743))

(declare-fun m!1413763 () Bool)

(assert (=> b!1531653 m!1413763))

(declare-fun m!1413765 () Bool)

(assert (=> b!1531646 m!1413765))

(assert (=> b!1531646 m!1413765))

(declare-fun m!1413767 () Bool)

(assert (=> b!1531646 m!1413767))

(declare-fun m!1413769 () Bool)

(assert (=> b!1531646 m!1413769))

(declare-fun m!1413771 () Bool)

(assert (=> b!1531646 m!1413771))

(assert (=> b!1531654 m!1413743))

(assert (=> b!1531654 m!1413743))

(declare-fun m!1413773 () Bool)

(assert (=> b!1531654 m!1413773))

(assert (=> b!1531654 m!1413773))

(assert (=> b!1531654 m!1413743))

(declare-fun m!1413775 () Bool)

(assert (=> b!1531654 m!1413775))

(assert (=> b!1531657 m!1413743))

(assert (=> b!1531657 m!1413743))

(declare-fun m!1413777 () Bool)

(assert (=> b!1531657 m!1413777))

(declare-fun m!1413779 () Bool)

(assert (=> b!1531657 m!1413779))

(declare-fun m!1413781 () Bool)

(assert (=> b!1531657 m!1413781))

(declare-fun m!1413783 () Bool)

(assert (=> start!130488 m!1413783))

(declare-fun m!1413785 () Bool)

(assert (=> start!130488 m!1413785))

(declare-fun m!1413787 () Bool)

(assert (=> b!1531647 m!1413787))

(check-sat (not b!1531646) (not b!1531650) (not b!1531647) (not b!1531654) (not b!1531644) (not b!1531652) (not b!1531657) (not start!130488) (not b!1531653) (not b!1531645) (not b!1531656) (not b!1531655) (not b!1531649))
(check-sat)
