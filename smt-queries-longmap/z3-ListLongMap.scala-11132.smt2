; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130090 () Bool)

(assert start!130090)

(declare-fun b!1526776 () Bool)

(declare-fun res!1044821 () Bool)

(declare-fun e!851003 () Bool)

(assert (=> b!1526776 (=> (not res!1044821) (not e!851003))))

(declare-datatypes ((array!101503 0))(
  ( (array!101504 (arr!48978 (Array (_ BitVec 32) (_ BitVec 64))) (size!49528 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101503)

(declare-datatypes ((List!35461 0))(
  ( (Nil!35458) (Cons!35457 (h!36890 (_ BitVec 64)) (t!50155 List!35461)) )
))
(declare-fun arrayNoDuplicates!0 (array!101503 (_ BitVec 32) List!35461) Bool)

(assert (=> b!1526776 (= res!1044821 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35458))))

(declare-fun b!1526777 () Bool)

(declare-fun res!1044818 () Bool)

(assert (=> b!1526777 (=> (not res!1044818) (not e!851003))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1526777 (= res!1044818 (and (= (size!49528 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49528 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49528 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526778 () Bool)

(declare-fun e!851005 () Bool)

(declare-fun e!850999 () Bool)

(assert (=> b!1526778 (= e!851005 e!850999)))

(declare-fun res!1044810 () Bool)

(assert (=> b!1526778 (=> res!1044810 e!850999)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!661197 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526778 (= res!1044810 (or (not (= (select (arr!48978 a!2804) j!70) lt!661197)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48978 a!2804) index!487) (select (arr!48978 a!2804) j!70)) (not (= (select (arr!48978 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526779 () Bool)

(declare-fun res!1044813 () Bool)

(assert (=> b!1526779 (=> (not res!1044813) (not e!851005))))

(declare-datatypes ((SeekEntryResult!13143 0))(
  ( (MissingZero!13143 (index!54967 (_ BitVec 32))) (Found!13143 (index!54968 (_ BitVec 32))) (Intermediate!13143 (undefined!13955 Bool) (index!54969 (_ BitVec 32)) (x!136661 (_ BitVec 32))) (Undefined!13143) (MissingVacant!13143 (index!54970 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101503 (_ BitVec 32)) SeekEntryResult!13143)

(assert (=> b!1526779 (= res!1044813 (= (seekEntry!0 (select (arr!48978 a!2804) j!70) a!2804 mask!2512) (Found!13143 j!70)))))

(declare-fun b!1526781 () Bool)

(declare-fun e!851004 () Bool)

(declare-fun e!851001 () Bool)

(assert (=> b!1526781 (= e!851004 e!851001)))

(declare-fun res!1044817 () Bool)

(assert (=> b!1526781 (=> (not res!1044817) (not e!851001))))

(declare-fun lt!661198 () array!101503)

(declare-fun lt!661196 () SeekEntryResult!13143)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101503 (_ BitVec 32)) SeekEntryResult!13143)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526781 (= res!1044817 (= lt!661196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661197 mask!2512) lt!661197 lt!661198 mask!2512)))))

(assert (=> b!1526781 (= lt!661197 (select (store (arr!48978 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526781 (= lt!661198 (array!101504 (store (arr!48978 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49528 a!2804)))))

(declare-fun b!1526782 () Bool)

(declare-fun res!1044815 () Bool)

(assert (=> b!1526782 (=> (not res!1044815) (not e!851003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526782 (= res!1044815 (validKeyInArray!0 (select (arr!48978 a!2804) j!70)))))

(declare-fun b!1526783 () Bool)

(assert (=> b!1526783 (= e!851003 e!851004)))

(declare-fun res!1044812 () Bool)

(assert (=> b!1526783 (=> (not res!1044812) (not e!851004))))

(declare-fun lt!661194 () SeekEntryResult!13143)

(assert (=> b!1526783 (= res!1044812 (= lt!661196 lt!661194))))

(assert (=> b!1526783 (= lt!661194 (Intermediate!13143 false resIndex!21 resX!21))))

(assert (=> b!1526783 (= lt!661196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48978 a!2804) j!70) mask!2512) (select (arr!48978 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526784 () Bool)

(declare-fun e!851002 () Bool)

(assert (=> b!1526784 (= e!850999 e!851002)))

(declare-fun res!1044819 () Bool)

(assert (=> b!1526784 (=> (not res!1044819) (not e!851002))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101503 (_ BitVec 32)) SeekEntryResult!13143)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101503 (_ BitVec 32)) SeekEntryResult!13143)

(assert (=> b!1526784 (= res!1044819 (= (seekEntryOrOpen!0 (select (arr!48978 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48978 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526785 () Bool)

(declare-fun res!1044811 () Bool)

(assert (=> b!1526785 (=> (not res!1044811) (not e!851003))))

(assert (=> b!1526785 (= res!1044811 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49528 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49528 a!2804))))))

(declare-fun b!1526786 () Bool)

(declare-fun res!1044822 () Bool)

(assert (=> b!1526786 (=> (not res!1044822) (not e!851003))))

(assert (=> b!1526786 (= res!1044822 (validKeyInArray!0 (select (arr!48978 a!2804) i!961)))))

(declare-fun b!1526787 () Bool)

(declare-fun res!1044820 () Bool)

(assert (=> b!1526787 (=> (not res!1044820) (not e!851004))))

(assert (=> b!1526787 (= res!1044820 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48978 a!2804) j!70) a!2804 mask!2512) lt!661194))))

(declare-fun res!1044823 () Bool)

(assert (=> start!130090 (=> (not res!1044823) (not e!851003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130090 (= res!1044823 (validMask!0 mask!2512))))

(assert (=> start!130090 e!851003))

(assert (=> start!130090 true))

(declare-fun array_inv!38006 (array!101503) Bool)

(assert (=> start!130090 (array_inv!38006 a!2804)))

(declare-fun b!1526780 () Bool)

(assert (=> b!1526780 (= e!851001 (not true))))

(assert (=> b!1526780 e!851005))

(declare-fun res!1044816 () Bool)

(assert (=> b!1526780 (=> (not res!1044816) (not e!851005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101503 (_ BitVec 32)) Bool)

(assert (=> b!1526780 (= res!1044816 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51070 0))(
  ( (Unit!51071) )
))
(declare-fun lt!661195 () Unit!51070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51070)

(assert (=> b!1526780 (= lt!661195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526788 () Bool)

(declare-fun res!1044814 () Bool)

(assert (=> b!1526788 (=> (not res!1044814) (not e!851003))))

(assert (=> b!1526788 (= res!1044814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526789 () Bool)

(assert (=> b!1526789 (= e!851002 (= (seekEntryOrOpen!0 lt!661197 lt!661198 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661197 lt!661198 mask!2512)))))

(assert (= (and start!130090 res!1044823) b!1526777))

(assert (= (and b!1526777 res!1044818) b!1526786))

(assert (= (and b!1526786 res!1044822) b!1526782))

(assert (= (and b!1526782 res!1044815) b!1526788))

(assert (= (and b!1526788 res!1044814) b!1526776))

(assert (= (and b!1526776 res!1044821) b!1526785))

(assert (= (and b!1526785 res!1044811) b!1526783))

(assert (= (and b!1526783 res!1044812) b!1526787))

(assert (= (and b!1526787 res!1044820) b!1526781))

(assert (= (and b!1526781 res!1044817) b!1526780))

(assert (= (and b!1526780 res!1044816) b!1526779))

(assert (= (and b!1526779 res!1044813) b!1526778))

(assert (= (and b!1526778 (not res!1044810)) b!1526784))

(assert (= (and b!1526784 res!1044819) b!1526789))

(declare-fun m!1409611 () Bool)

(assert (=> b!1526776 m!1409611))

(declare-fun m!1409613 () Bool)

(assert (=> b!1526784 m!1409613))

(assert (=> b!1526784 m!1409613))

(declare-fun m!1409615 () Bool)

(assert (=> b!1526784 m!1409615))

(assert (=> b!1526784 m!1409613))

(declare-fun m!1409617 () Bool)

(assert (=> b!1526784 m!1409617))

(assert (=> b!1526782 m!1409613))

(assert (=> b!1526782 m!1409613))

(declare-fun m!1409619 () Bool)

(assert (=> b!1526782 m!1409619))

(declare-fun m!1409621 () Bool)

(assert (=> start!130090 m!1409621))

(declare-fun m!1409623 () Bool)

(assert (=> start!130090 m!1409623))

(assert (=> b!1526778 m!1409613))

(declare-fun m!1409625 () Bool)

(assert (=> b!1526778 m!1409625))

(assert (=> b!1526787 m!1409613))

(assert (=> b!1526787 m!1409613))

(declare-fun m!1409627 () Bool)

(assert (=> b!1526787 m!1409627))

(assert (=> b!1526779 m!1409613))

(assert (=> b!1526779 m!1409613))

(declare-fun m!1409629 () Bool)

(assert (=> b!1526779 m!1409629))

(declare-fun m!1409631 () Bool)

(assert (=> b!1526786 m!1409631))

(assert (=> b!1526786 m!1409631))

(declare-fun m!1409633 () Bool)

(assert (=> b!1526786 m!1409633))

(declare-fun m!1409635 () Bool)

(assert (=> b!1526780 m!1409635))

(declare-fun m!1409637 () Bool)

(assert (=> b!1526780 m!1409637))

(declare-fun m!1409639 () Bool)

(assert (=> b!1526789 m!1409639))

(declare-fun m!1409641 () Bool)

(assert (=> b!1526789 m!1409641))

(declare-fun m!1409643 () Bool)

(assert (=> b!1526788 m!1409643))

(declare-fun m!1409645 () Bool)

(assert (=> b!1526781 m!1409645))

(assert (=> b!1526781 m!1409645))

(declare-fun m!1409647 () Bool)

(assert (=> b!1526781 m!1409647))

(declare-fun m!1409649 () Bool)

(assert (=> b!1526781 m!1409649))

(declare-fun m!1409651 () Bool)

(assert (=> b!1526781 m!1409651))

(assert (=> b!1526783 m!1409613))

(assert (=> b!1526783 m!1409613))

(declare-fun m!1409653 () Bool)

(assert (=> b!1526783 m!1409653))

(assert (=> b!1526783 m!1409653))

(assert (=> b!1526783 m!1409613))

(declare-fun m!1409655 () Bool)

(assert (=> b!1526783 m!1409655))

(check-sat (not b!1526779) (not b!1526784) (not b!1526789) (not b!1526783) (not b!1526776) (not b!1526781) (not b!1526780) (not b!1526787) (not b!1526782) (not b!1526786) (not b!1526788) (not start!130090))
(check-sat)
