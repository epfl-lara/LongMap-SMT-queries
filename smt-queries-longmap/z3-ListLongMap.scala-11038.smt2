; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129362 () Bool)

(assert start!129362)

(declare-fun res!1034468 () Bool)

(declare-fun e!846044 () Bool)

(assert (=> start!129362 (=> (not res!1034468) (not e!846044))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129362 (= res!1034468 (validMask!0 mask!2512))))

(assert (=> start!129362 e!846044))

(assert (=> start!129362 true))

(declare-datatypes ((array!101032 0))(
  ( (array!101033 (arr!48748 (Array (_ BitVec 32) (_ BitVec 64))) (size!49299 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101032)

(declare-fun array_inv!38029 (array!101032) Bool)

(assert (=> start!129362 (array_inv!38029 a!2804)))

(declare-fun b!1515741 () Bool)

(declare-fun res!1034470 () Bool)

(declare-fun e!846041 () Bool)

(assert (=> b!1515741 (=> (not res!1034470) (not e!846041))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12812 0))(
  ( (MissingZero!12812 (index!53643 (_ BitVec 32))) (Found!12812 (index!53644 (_ BitVec 32))) (Intermediate!12812 (undefined!13624 Bool) (index!53645 (_ BitVec 32)) (x!135559 (_ BitVec 32))) (Undefined!12812) (MissingVacant!12812 (index!53646 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12812)

(assert (=> b!1515741 (= res!1034470 (= (seekEntry!0 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) (Found!12812 j!70)))))

(declare-fun b!1515742 () Bool)

(declare-fun e!846043 () Bool)

(declare-fun e!846045 () Bool)

(assert (=> b!1515742 (= e!846043 e!846045)))

(declare-fun res!1034471 () Bool)

(assert (=> b!1515742 (=> (not res!1034471) (not e!846045))))

(declare-fun lt!656810 () array!101032)

(declare-fun lt!656808 () (_ BitVec 64))

(declare-fun lt!656811 () SeekEntryResult!12812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12812)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515742 (= res!1034471 (= lt!656811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656808 mask!2512) lt!656808 lt!656810 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515742 (= lt!656808 (select (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515742 (= lt!656810 (array!101033 (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49299 a!2804)))))

(declare-fun b!1515743 () Bool)

(declare-fun res!1034475 () Bool)

(assert (=> b!1515743 (=> (not res!1034475) (not e!846044))))

(assert (=> b!1515743 (= res!1034475 (and (= (size!49299 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49299 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49299 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515744 () Bool)

(declare-fun res!1034480 () Bool)

(assert (=> b!1515744 (=> (not res!1034480) (not e!846044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101032 (_ BitVec 32)) Bool)

(assert (=> b!1515744 (= res!1034480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515745 () Bool)

(assert (=> b!1515745 (= e!846044 e!846043)))

(declare-fun res!1034473 () Bool)

(assert (=> b!1515745 (=> (not res!1034473) (not e!846043))))

(declare-fun lt!656809 () SeekEntryResult!12812)

(assert (=> b!1515745 (= res!1034473 (= lt!656811 lt!656809))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515745 (= lt!656809 (Intermediate!12812 false resIndex!21 resX!21))))

(assert (=> b!1515745 (= lt!656811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48748 a!2804) j!70) mask!2512) (select (arr!48748 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515746 () Bool)

(declare-fun res!1034477 () Bool)

(assert (=> b!1515746 (=> (not res!1034477) (not e!846044))))

(declare-datatypes ((List!35218 0))(
  ( (Nil!35215) (Cons!35214 (h!36641 (_ BitVec 64)) (t!49904 List!35218)) )
))
(declare-fun arrayNoDuplicates!0 (array!101032 (_ BitVec 32) List!35218) Bool)

(assert (=> b!1515746 (= res!1034477 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35215))))

(declare-fun b!1515747 () Bool)

(declare-fun res!1034472 () Bool)

(assert (=> b!1515747 (=> (not res!1034472) (not e!846043))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515747 (= res!1034472 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) lt!656809))))

(declare-fun b!1515748 () Bool)

(declare-fun e!846042 () Bool)

(declare-fun e!846040 () Bool)

(assert (=> b!1515748 (= e!846042 e!846040)))

(declare-fun res!1034478 () Bool)

(assert (=> b!1515748 (=> (not res!1034478) (not e!846040))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12812)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101032 (_ BitVec 32)) SeekEntryResult!12812)

(assert (=> b!1515748 (= res!1034478 (= (seekEntryOrOpen!0 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48748 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1515749 () Bool)

(assert (=> b!1515749 (= e!846045 (not true))))

(assert (=> b!1515749 e!846041))

(declare-fun res!1034469 () Bool)

(assert (=> b!1515749 (=> (not res!1034469) (not e!846041))))

(assert (=> b!1515749 (= res!1034469 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50527 0))(
  ( (Unit!50528) )
))
(declare-fun lt!656812 () Unit!50527)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50527)

(assert (=> b!1515749 (= lt!656812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515750 () Bool)

(declare-fun res!1034474 () Bool)

(assert (=> b!1515750 (=> (not res!1034474) (not e!846044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515750 (= res!1034474 (validKeyInArray!0 (select (arr!48748 a!2804) i!961)))))

(declare-fun b!1515751 () Bool)

(declare-fun res!1034479 () Bool)

(assert (=> b!1515751 (=> (not res!1034479) (not e!846044))))

(assert (=> b!1515751 (= res!1034479 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49299 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49299 a!2804))))))

(declare-fun b!1515752 () Bool)

(assert (=> b!1515752 (= e!846040 (= (seekEntryOrOpen!0 lt!656808 lt!656810 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656808 lt!656810 mask!2512)))))

(declare-fun b!1515753 () Bool)

(assert (=> b!1515753 (= e!846041 e!846042)))

(declare-fun res!1034476 () Bool)

(assert (=> b!1515753 (=> res!1034476 e!846042)))

(assert (=> b!1515753 (= res!1034476 (or (not (= (select (arr!48748 a!2804) j!70) lt!656808)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48748 a!2804) index!487) (select (arr!48748 a!2804) j!70)) (not (= (select (arr!48748 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1515754 () Bool)

(declare-fun res!1034467 () Bool)

(assert (=> b!1515754 (=> (not res!1034467) (not e!846044))))

(assert (=> b!1515754 (= res!1034467 (validKeyInArray!0 (select (arr!48748 a!2804) j!70)))))

(assert (= (and start!129362 res!1034468) b!1515743))

(assert (= (and b!1515743 res!1034475) b!1515750))

(assert (= (and b!1515750 res!1034474) b!1515754))

(assert (= (and b!1515754 res!1034467) b!1515744))

(assert (= (and b!1515744 res!1034480) b!1515746))

(assert (= (and b!1515746 res!1034477) b!1515751))

(assert (= (and b!1515751 res!1034479) b!1515745))

(assert (= (and b!1515745 res!1034473) b!1515747))

(assert (= (and b!1515747 res!1034472) b!1515742))

(assert (= (and b!1515742 res!1034471) b!1515749))

(assert (= (and b!1515749 res!1034469) b!1515741))

(assert (= (and b!1515741 res!1034470) b!1515753))

(assert (= (and b!1515753 (not res!1034476)) b!1515748))

(assert (= (and b!1515748 res!1034478) b!1515752))

(declare-fun m!1398609 () Bool)

(assert (=> b!1515746 m!1398609))

(declare-fun m!1398611 () Bool)

(assert (=> b!1515754 m!1398611))

(assert (=> b!1515754 m!1398611))

(declare-fun m!1398613 () Bool)

(assert (=> b!1515754 m!1398613))

(declare-fun m!1398615 () Bool)

(assert (=> b!1515744 m!1398615))

(declare-fun m!1398617 () Bool)

(assert (=> start!129362 m!1398617))

(declare-fun m!1398619 () Bool)

(assert (=> start!129362 m!1398619))

(declare-fun m!1398621 () Bool)

(assert (=> b!1515752 m!1398621))

(declare-fun m!1398623 () Bool)

(assert (=> b!1515752 m!1398623))

(declare-fun m!1398625 () Bool)

(assert (=> b!1515742 m!1398625))

(assert (=> b!1515742 m!1398625))

(declare-fun m!1398627 () Bool)

(assert (=> b!1515742 m!1398627))

(declare-fun m!1398629 () Bool)

(assert (=> b!1515742 m!1398629))

(declare-fun m!1398631 () Bool)

(assert (=> b!1515742 m!1398631))

(assert (=> b!1515745 m!1398611))

(assert (=> b!1515745 m!1398611))

(declare-fun m!1398633 () Bool)

(assert (=> b!1515745 m!1398633))

(assert (=> b!1515745 m!1398633))

(assert (=> b!1515745 m!1398611))

(declare-fun m!1398635 () Bool)

(assert (=> b!1515745 m!1398635))

(assert (=> b!1515747 m!1398611))

(assert (=> b!1515747 m!1398611))

(declare-fun m!1398637 () Bool)

(assert (=> b!1515747 m!1398637))

(assert (=> b!1515753 m!1398611))

(declare-fun m!1398639 () Bool)

(assert (=> b!1515753 m!1398639))

(assert (=> b!1515741 m!1398611))

(assert (=> b!1515741 m!1398611))

(declare-fun m!1398641 () Bool)

(assert (=> b!1515741 m!1398641))

(assert (=> b!1515748 m!1398611))

(assert (=> b!1515748 m!1398611))

(declare-fun m!1398643 () Bool)

(assert (=> b!1515748 m!1398643))

(assert (=> b!1515748 m!1398611))

(declare-fun m!1398645 () Bool)

(assert (=> b!1515748 m!1398645))

(declare-fun m!1398647 () Bool)

(assert (=> b!1515749 m!1398647))

(declare-fun m!1398649 () Bool)

(assert (=> b!1515749 m!1398649))

(declare-fun m!1398651 () Bool)

(assert (=> b!1515750 m!1398651))

(assert (=> b!1515750 m!1398651))

(declare-fun m!1398653 () Bool)

(assert (=> b!1515750 m!1398653))

(check-sat (not b!1515742) (not start!129362) (not b!1515752) (not b!1515748) (not b!1515741) (not b!1515746) (not b!1515745) (not b!1515747) (not b!1515754) (not b!1515744) (not b!1515749) (not b!1515750))
(check-sat)
