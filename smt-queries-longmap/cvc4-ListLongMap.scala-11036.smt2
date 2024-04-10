; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129052 () Bool)

(assert start!129052)

(declare-fun b!1513741 () Bool)

(declare-fun e!844820 () Bool)

(declare-fun e!844819 () Bool)

(assert (=> b!1513741 (= e!844820 e!844819)))

(declare-fun res!1033652 () Bool)

(assert (=> b!1513741 (=> res!1033652 e!844819)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!656087 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100908 0))(
  ( (array!100909 (arr!48691 (Array (_ BitVec 32) (_ BitVec 64))) (size!49241 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100908)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513741 (= res!1033652 (or (not (= (select (arr!48691 a!2804) j!70) lt!656087)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48691 a!2804) index!487) (select (arr!48691 a!2804) j!70)) (not (= (select (arr!48691 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513742 () Bool)

(declare-fun res!1033654 () Bool)

(declare-fun e!844824 () Bool)

(assert (=> b!1513742 (=> (not res!1033654) (not e!844824))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1513742 (= res!1033654 (and (= (size!49241 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49241 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49241 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513743 () Bool)

(declare-fun res!1033650 () Bool)

(assert (=> b!1513743 (=> (not res!1033650) (not e!844824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100908 (_ BitVec 32)) Bool)

(assert (=> b!1513743 (= res!1033650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513744 () Bool)

(declare-fun res!1033649 () Bool)

(assert (=> b!1513744 (=> (not res!1033649) (not e!844824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513744 (= res!1033649 (validKeyInArray!0 (select (arr!48691 a!2804) i!961)))))

(declare-fun b!1513745 () Bool)

(declare-fun res!1033644 () Bool)

(declare-fun e!844821 () Bool)

(assert (=> b!1513745 (=> (not res!1033644) (not e!844821))))

(declare-datatypes ((SeekEntryResult!12862 0))(
  ( (MissingZero!12862 (index!53843 (_ BitVec 32))) (Found!12862 (index!53844 (_ BitVec 32))) (Intermediate!12862 (undefined!13674 Bool) (index!53845 (_ BitVec 32)) (x!135556 (_ BitVec 32))) (Undefined!12862) (MissingVacant!12862 (index!53846 (_ BitVec 32))) )
))
(declare-fun lt!656086 () SeekEntryResult!12862)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100908 (_ BitVec 32)) SeekEntryResult!12862)

(assert (=> b!1513745 (= res!1033644 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) lt!656086))))

(declare-fun b!1513746 () Bool)

(declare-fun e!844825 () Bool)

(assert (=> b!1513746 (= e!844821 e!844825)))

(declare-fun res!1033646 () Bool)

(assert (=> b!1513746 (=> (not res!1033646) (not e!844825))))

(declare-fun lt!656085 () array!100908)

(declare-fun lt!656088 () SeekEntryResult!12862)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513746 (= res!1033646 (= lt!656088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656087 mask!2512) lt!656087 lt!656085 mask!2512)))))

(assert (=> b!1513746 (= lt!656087 (select (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513746 (= lt!656085 (array!100909 (store (arr!48691 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49241 a!2804)))))

(declare-fun e!844823 () Bool)

(declare-fun b!1513747 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100908 (_ BitVec 32)) SeekEntryResult!12862)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100908 (_ BitVec 32)) SeekEntryResult!12862)

(assert (=> b!1513747 (= e!844823 (= (seekEntryOrOpen!0 lt!656087 lt!656085 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656087 lt!656085 mask!2512)))))

(declare-fun b!1513748 () Bool)

(declare-fun res!1033645 () Bool)

(assert (=> b!1513748 (=> (not res!1033645) (not e!844824))))

(assert (=> b!1513748 (= res!1033645 (validKeyInArray!0 (select (arr!48691 a!2804) j!70)))))

(declare-fun b!1513749 () Bool)

(declare-fun res!1033648 () Bool)

(assert (=> b!1513749 (=> (not res!1033648) (not e!844824))))

(declare-datatypes ((List!35174 0))(
  ( (Nil!35171) (Cons!35170 (h!36582 (_ BitVec 64)) (t!49868 List!35174)) )
))
(declare-fun arrayNoDuplicates!0 (array!100908 (_ BitVec 32) List!35174) Bool)

(assert (=> b!1513749 (= res!1033648 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35171))))

(declare-fun b!1513750 () Bool)

(assert (=> b!1513750 (= e!844825 (not true))))

(assert (=> b!1513750 e!844820))

(declare-fun res!1033647 () Bool)

(assert (=> b!1513750 (=> (not res!1033647) (not e!844820))))

(assert (=> b!1513750 (= res!1033647 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50592 0))(
  ( (Unit!50593) )
))
(declare-fun lt!656089 () Unit!50592)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50592)

(assert (=> b!1513750 (= lt!656089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1033651 () Bool)

(assert (=> start!129052 (=> (not res!1033651) (not e!844824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129052 (= res!1033651 (validMask!0 mask!2512))))

(assert (=> start!129052 e!844824))

(assert (=> start!129052 true))

(declare-fun array_inv!37719 (array!100908) Bool)

(assert (=> start!129052 (array_inv!37719 a!2804)))

(declare-fun b!1513751 () Bool)

(assert (=> b!1513751 (= e!844819 e!844823)))

(declare-fun res!1033655 () Bool)

(assert (=> b!1513751 (=> (not res!1033655) (not e!844823))))

(assert (=> b!1513751 (= res!1033655 (= (seekEntryOrOpen!0 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48691 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513752 () Bool)

(declare-fun res!1033656 () Bool)

(assert (=> b!1513752 (=> (not res!1033656) (not e!844824))))

(assert (=> b!1513752 (= res!1033656 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49241 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49241 a!2804))))))

(declare-fun b!1513753 () Bool)

(assert (=> b!1513753 (= e!844824 e!844821)))

(declare-fun res!1033653 () Bool)

(assert (=> b!1513753 (=> (not res!1033653) (not e!844821))))

(assert (=> b!1513753 (= res!1033653 (= lt!656088 lt!656086))))

(assert (=> b!1513753 (= lt!656086 (Intermediate!12862 false resIndex!21 resX!21))))

(assert (=> b!1513753 (= lt!656088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48691 a!2804) j!70) mask!2512) (select (arr!48691 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513754 () Bool)

(declare-fun res!1033657 () Bool)

(assert (=> b!1513754 (=> (not res!1033657) (not e!844820))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100908 (_ BitVec 32)) SeekEntryResult!12862)

(assert (=> b!1513754 (= res!1033657 (= (seekEntry!0 (select (arr!48691 a!2804) j!70) a!2804 mask!2512) (Found!12862 j!70)))))

(assert (= (and start!129052 res!1033651) b!1513742))

(assert (= (and b!1513742 res!1033654) b!1513744))

(assert (= (and b!1513744 res!1033649) b!1513748))

(assert (= (and b!1513748 res!1033645) b!1513743))

(assert (= (and b!1513743 res!1033650) b!1513749))

(assert (= (and b!1513749 res!1033648) b!1513752))

(assert (= (and b!1513752 res!1033656) b!1513753))

(assert (= (and b!1513753 res!1033653) b!1513745))

(assert (= (and b!1513745 res!1033644) b!1513746))

(assert (= (and b!1513746 res!1033646) b!1513750))

(assert (= (and b!1513750 res!1033647) b!1513754))

(assert (= (and b!1513754 res!1033657) b!1513741))

(assert (= (and b!1513741 (not res!1033652)) b!1513751))

(assert (= (and b!1513751 res!1033655) b!1513747))

(declare-fun m!1396629 () Bool)

(assert (=> b!1513751 m!1396629))

(assert (=> b!1513751 m!1396629))

(declare-fun m!1396631 () Bool)

(assert (=> b!1513751 m!1396631))

(assert (=> b!1513751 m!1396629))

(declare-fun m!1396633 () Bool)

(assert (=> b!1513751 m!1396633))

(declare-fun m!1396635 () Bool)

(assert (=> b!1513744 m!1396635))

(assert (=> b!1513744 m!1396635))

(declare-fun m!1396637 () Bool)

(assert (=> b!1513744 m!1396637))

(declare-fun m!1396639 () Bool)

(assert (=> b!1513750 m!1396639))

(declare-fun m!1396641 () Bool)

(assert (=> b!1513750 m!1396641))

(declare-fun m!1396643 () Bool)

(assert (=> start!129052 m!1396643))

(declare-fun m!1396645 () Bool)

(assert (=> start!129052 m!1396645))

(declare-fun m!1396647 () Bool)

(assert (=> b!1513743 m!1396647))

(assert (=> b!1513754 m!1396629))

(assert (=> b!1513754 m!1396629))

(declare-fun m!1396649 () Bool)

(assert (=> b!1513754 m!1396649))

(declare-fun m!1396651 () Bool)

(assert (=> b!1513747 m!1396651))

(declare-fun m!1396653 () Bool)

(assert (=> b!1513747 m!1396653))

(assert (=> b!1513741 m!1396629))

(declare-fun m!1396655 () Bool)

(assert (=> b!1513741 m!1396655))

(assert (=> b!1513748 m!1396629))

(assert (=> b!1513748 m!1396629))

(declare-fun m!1396657 () Bool)

(assert (=> b!1513748 m!1396657))

(declare-fun m!1396659 () Bool)

(assert (=> b!1513749 m!1396659))

(assert (=> b!1513745 m!1396629))

(assert (=> b!1513745 m!1396629))

(declare-fun m!1396661 () Bool)

(assert (=> b!1513745 m!1396661))

(assert (=> b!1513753 m!1396629))

(assert (=> b!1513753 m!1396629))

(declare-fun m!1396663 () Bool)

(assert (=> b!1513753 m!1396663))

(assert (=> b!1513753 m!1396663))

(assert (=> b!1513753 m!1396629))

(declare-fun m!1396665 () Bool)

(assert (=> b!1513753 m!1396665))

(declare-fun m!1396667 () Bool)

(assert (=> b!1513746 m!1396667))

(assert (=> b!1513746 m!1396667))

(declare-fun m!1396669 () Bool)

(assert (=> b!1513746 m!1396669))

(declare-fun m!1396671 () Bool)

(assert (=> b!1513746 m!1396671))

(declare-fun m!1396673 () Bool)

(assert (=> b!1513746 m!1396673))

(push 1)

