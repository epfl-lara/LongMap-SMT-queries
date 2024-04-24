; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130422 () Bool)

(assert start!130422)

(declare-fun b!1528018 () Bool)

(declare-fun res!1044575 () Bool)

(declare-fun e!851896 () Bool)

(assert (=> b!1528018 (=> (not res!1044575) (not e!851896))))

(declare-datatypes ((array!101572 0))(
  ( (array!101573 (arr!49006 (Array (_ BitVec 32) (_ BitVec 64))) (size!49557 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101572)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101572 (_ BitVec 32)) Bool)

(assert (=> b!1528018 (= res!1044575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528019 () Bool)

(declare-fun e!851895 () Bool)

(declare-fun e!851897 () Bool)

(assert (=> b!1528019 (= e!851895 e!851897)))

(declare-fun res!1044572 () Bool)

(assert (=> b!1528019 (=> res!1044572 e!851897)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!661696 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528019 (= res!1044572 (or (not (= (select (arr!49006 a!2804) j!70) lt!661696)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49006 a!2804) index!487) (select (arr!49006 a!2804) j!70)) (not (= (select (arr!49006 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528020 () Bool)

(declare-fun res!1044573 () Bool)

(assert (=> b!1528020 (=> (not res!1044573) (not e!851896))))

(assert (=> b!1528020 (= res!1044573 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49557 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49557 a!2804))))))

(declare-fun b!1528021 () Bool)

(declare-fun res!1044568 () Bool)

(assert (=> b!1528021 (=> (not res!1044568) (not e!851896))))

(declare-datatypes ((List!35476 0))(
  ( (Nil!35473) (Cons!35472 (h!36923 (_ BitVec 64)) (t!50162 List!35476)) )
))
(declare-fun arrayNoDuplicates!0 (array!101572 (_ BitVec 32) List!35476) Bool)

(assert (=> b!1528021 (= res!1044568 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35473))))

(declare-fun b!1528022 () Bool)

(declare-fun e!851898 () Bool)

(assert (=> b!1528022 (= e!851898 (not true))))

(assert (=> b!1528022 e!851895))

(declare-fun res!1044571 () Bool)

(assert (=> b!1528022 (=> (not res!1044571) (not e!851895))))

(assert (=> b!1528022 (= res!1044571 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50947 0))(
  ( (Unit!50948) )
))
(declare-fun lt!661694 () Unit!50947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50947)

(assert (=> b!1528022 (= lt!661694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528023 () Bool)

(declare-fun res!1044578 () Bool)

(assert (=> b!1528023 (=> (not res!1044578) (not e!851896))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528023 (= res!1044578 (validKeyInArray!0 (select (arr!49006 a!2804) j!70)))))

(declare-fun b!1528024 () Bool)

(declare-fun res!1044579 () Bool)

(assert (=> b!1528024 (=> (not res!1044579) (not e!851896))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528024 (= res!1044579 (and (= (size!49557 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49557 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49557 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528025 () Bool)

(declare-fun res!1044570 () Bool)

(declare-fun e!851899 () Bool)

(assert (=> b!1528025 (=> (not res!1044570) (not e!851899))))

(declare-datatypes ((SeekEntryResult!13064 0))(
  ( (MissingZero!13064 (index!54651 (_ BitVec 32))) (Found!13064 (index!54652 (_ BitVec 32))) (Intermediate!13064 (undefined!13876 Bool) (index!54653 (_ BitVec 32)) (x!136565 (_ BitVec 32))) (Undefined!13064) (MissingVacant!13064 (index!54654 (_ BitVec 32))) )
))
(declare-fun lt!661695 () SeekEntryResult!13064)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1528025 (= res!1044570 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) lt!661695))))

(declare-fun b!1528026 () Bool)

(assert (=> b!1528026 (= e!851896 e!851899)))

(declare-fun res!1044569 () Bool)

(assert (=> b!1528026 (=> (not res!1044569) (not e!851899))))

(declare-fun lt!661698 () SeekEntryResult!13064)

(assert (=> b!1528026 (= res!1044569 (= lt!661698 lt!661695))))

(assert (=> b!1528026 (= lt!661695 (Intermediate!13064 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528026 (= lt!661698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49006 a!2804) j!70) mask!2512) (select (arr!49006 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528027 () Bool)

(declare-fun res!1044577 () Bool)

(assert (=> b!1528027 (=> (not res!1044577) (not e!851896))))

(assert (=> b!1528027 (= res!1044577 (validKeyInArray!0 (select (arr!49006 a!2804) i!961)))))

(declare-fun res!1044566 () Bool)

(assert (=> start!130422 (=> (not res!1044566) (not e!851896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130422 (= res!1044566 (validMask!0 mask!2512))))

(assert (=> start!130422 e!851896))

(assert (=> start!130422 true))

(declare-fun array_inv!38287 (array!101572) Bool)

(assert (=> start!130422 (array_inv!38287 a!2804)))

(declare-fun b!1528028 () Bool)

(declare-fun res!1044574 () Bool)

(assert (=> b!1528028 (=> (not res!1044574) (not e!851895))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1528028 (= res!1044574 (= (seekEntry!0 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) (Found!13064 j!70)))))

(declare-fun b!1528029 () Bool)

(declare-fun e!851893 () Bool)

(declare-fun lt!661697 () array!101572)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13064)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13064)

(assert (=> b!1528029 (= e!851893 (= (seekEntryOrOpen!0 lt!661696 lt!661697 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661696 lt!661697 mask!2512)))))

(declare-fun b!1528030 () Bool)

(assert (=> b!1528030 (= e!851897 e!851893)))

(declare-fun res!1044576 () Bool)

(assert (=> b!1528030 (=> (not res!1044576) (not e!851893))))

(assert (=> b!1528030 (= res!1044576 (= (seekEntryOrOpen!0 (select (arr!49006 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49006 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1528031 () Bool)

(assert (=> b!1528031 (= e!851899 e!851898)))

(declare-fun res!1044567 () Bool)

(assert (=> b!1528031 (=> (not res!1044567) (not e!851898))))

(assert (=> b!1528031 (= res!1044567 (= lt!661698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661696 mask!2512) lt!661696 lt!661697 mask!2512)))))

(assert (=> b!1528031 (= lt!661696 (select (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528031 (= lt!661697 (array!101573 (store (arr!49006 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49557 a!2804)))))

(assert (= (and start!130422 res!1044566) b!1528024))

(assert (= (and b!1528024 res!1044579) b!1528027))

(assert (= (and b!1528027 res!1044577) b!1528023))

(assert (= (and b!1528023 res!1044578) b!1528018))

(assert (= (and b!1528018 res!1044575) b!1528021))

(assert (= (and b!1528021 res!1044568) b!1528020))

(assert (= (and b!1528020 res!1044573) b!1528026))

(assert (= (and b!1528026 res!1044569) b!1528025))

(assert (= (and b!1528025 res!1044570) b!1528031))

(assert (= (and b!1528031 res!1044567) b!1528022))

(assert (= (and b!1528022 res!1044571) b!1528028))

(assert (= (and b!1528028 res!1044574) b!1528019))

(assert (= (and b!1528019 (not res!1044572)) b!1528030))

(assert (= (and b!1528030 res!1044576) b!1528029))

(declare-fun m!1410601 () Bool)

(assert (=> b!1528027 m!1410601))

(assert (=> b!1528027 m!1410601))

(declare-fun m!1410603 () Bool)

(assert (=> b!1528027 m!1410603))

(declare-fun m!1410605 () Bool)

(assert (=> b!1528030 m!1410605))

(assert (=> b!1528030 m!1410605))

(declare-fun m!1410607 () Bool)

(assert (=> b!1528030 m!1410607))

(assert (=> b!1528030 m!1410605))

(declare-fun m!1410609 () Bool)

(assert (=> b!1528030 m!1410609))

(declare-fun m!1410611 () Bool)

(assert (=> b!1528031 m!1410611))

(assert (=> b!1528031 m!1410611))

(declare-fun m!1410613 () Bool)

(assert (=> b!1528031 m!1410613))

(declare-fun m!1410615 () Bool)

(assert (=> b!1528031 m!1410615))

(declare-fun m!1410617 () Bool)

(assert (=> b!1528031 m!1410617))

(declare-fun m!1410619 () Bool)

(assert (=> b!1528018 m!1410619))

(assert (=> b!1528026 m!1410605))

(assert (=> b!1528026 m!1410605))

(declare-fun m!1410621 () Bool)

(assert (=> b!1528026 m!1410621))

(assert (=> b!1528026 m!1410621))

(assert (=> b!1528026 m!1410605))

(declare-fun m!1410623 () Bool)

(assert (=> b!1528026 m!1410623))

(declare-fun m!1410625 () Bool)

(assert (=> b!1528029 m!1410625))

(declare-fun m!1410627 () Bool)

(assert (=> b!1528029 m!1410627))

(declare-fun m!1410629 () Bool)

(assert (=> b!1528021 m!1410629))

(assert (=> b!1528023 m!1410605))

(assert (=> b!1528023 m!1410605))

(declare-fun m!1410631 () Bool)

(assert (=> b!1528023 m!1410631))

(assert (=> b!1528019 m!1410605))

(declare-fun m!1410633 () Bool)

(assert (=> b!1528019 m!1410633))

(declare-fun m!1410635 () Bool)

(assert (=> start!130422 m!1410635))

(declare-fun m!1410637 () Bool)

(assert (=> start!130422 m!1410637))

(assert (=> b!1528025 m!1410605))

(assert (=> b!1528025 m!1410605))

(declare-fun m!1410639 () Bool)

(assert (=> b!1528025 m!1410639))

(assert (=> b!1528028 m!1410605))

(assert (=> b!1528028 m!1410605))

(declare-fun m!1410641 () Bool)

(assert (=> b!1528028 m!1410641))

(declare-fun m!1410643 () Bool)

(assert (=> b!1528022 m!1410643))

(declare-fun m!1410645 () Bool)

(assert (=> b!1528022 m!1410645))

(check-sat (not b!1528028) (not b!1528030) (not b!1528026) (not b!1528021) (not b!1528029) (not start!130422) (not b!1528027) (not b!1528031) (not b!1528023) (not b!1528025) (not b!1528018) (not b!1528022))
(check-sat)
