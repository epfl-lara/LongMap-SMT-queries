; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129320 () Bool)

(assert start!129320)

(declare-fun b!1514859 () Bool)

(declare-fun res!1033585 () Bool)

(declare-fun e!845604 () Bool)

(assert (=> b!1514859 (=> (not res!1033585) (not e!845604))))

(declare-datatypes ((SeekEntryResult!12791 0))(
  ( (MissingZero!12791 (index!53559 (_ BitVec 32))) (Found!12791 (index!53560 (_ BitVec 32))) (Intermediate!12791 (undefined!13603 Bool) (index!53561 (_ BitVec 32)) (x!135482 (_ BitVec 32))) (Undefined!12791) (MissingVacant!12791 (index!53562 (_ BitVec 32))) )
))
(declare-fun lt!656496 () SeekEntryResult!12791)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100990 0))(
  ( (array!100991 (arr!48727 (Array (_ BitVec 32) (_ BitVec 64))) (size!49278 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100990)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12791)

(assert (=> b!1514859 (= res!1033585 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) lt!656496))))

(declare-fun b!1514860 () Bool)

(declare-fun e!845599 () Bool)

(assert (=> b!1514860 (= e!845599 e!845604)))

(declare-fun res!1033592 () Bool)

(assert (=> b!1514860 (=> (not res!1033592) (not e!845604))))

(declare-fun lt!656493 () SeekEntryResult!12791)

(assert (=> b!1514860 (= res!1033592 (= lt!656493 lt!656496))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514860 (= lt!656496 (Intermediate!12791 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514860 (= lt!656493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48727 a!2804) j!70) mask!2512) (select (arr!48727 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514861 () Bool)

(declare-fun res!1033586 () Bool)

(assert (=> b!1514861 (=> (not res!1033586) (not e!845599))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514861 (= res!1033586 (and (= (size!49278 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49278 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49278 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514862 () Bool)

(declare-fun res!1033588 () Bool)

(assert (=> b!1514862 (=> (not res!1033588) (not e!845599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100990 (_ BitVec 32)) Bool)

(assert (=> b!1514862 (= res!1033588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514863 () Bool)

(declare-fun lt!656494 () array!100990)

(declare-fun lt!656495 () (_ BitVec 64))

(declare-fun e!845598 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12791)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12791)

(assert (=> b!1514863 (= e!845598 (= (seekEntryOrOpen!0 lt!656495 lt!656494 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656495 lt!656494 mask!2512)))))

(declare-fun b!1514864 () Bool)

(declare-fun res!1033590 () Bool)

(assert (=> b!1514864 (=> (not res!1033590) (not e!845599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514864 (= res!1033590 (validKeyInArray!0 (select (arr!48727 a!2804) j!70)))))

(declare-fun b!1514865 () Bool)

(declare-fun e!845601 () Bool)

(declare-fun e!845600 () Bool)

(assert (=> b!1514865 (= e!845601 e!845600)))

(declare-fun res!1033596 () Bool)

(assert (=> b!1514865 (=> res!1033596 e!845600)))

(assert (=> b!1514865 (= res!1033596 (or (not (= (select (arr!48727 a!2804) j!70) lt!656495)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48727 a!2804) index!487) (select (arr!48727 a!2804) j!70)) (not (= (select (arr!48727 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514866 () Bool)

(declare-fun res!1033587 () Bool)

(assert (=> b!1514866 (=> (not res!1033587) (not e!845599))))

(assert (=> b!1514866 (= res!1033587 (validKeyInArray!0 (select (arr!48727 a!2804) i!961)))))

(declare-fun b!1514867 () Bool)

(declare-fun e!845602 () Bool)

(assert (=> b!1514867 (= e!845604 e!845602)))

(declare-fun res!1033598 () Bool)

(assert (=> b!1514867 (=> (not res!1033598) (not e!845602))))

(assert (=> b!1514867 (= res!1033598 (= lt!656493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656495 mask!2512) lt!656495 lt!656494 mask!2512)))))

(assert (=> b!1514867 (= lt!656495 (select (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514867 (= lt!656494 (array!100991 (store (arr!48727 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49278 a!2804)))))

(declare-fun res!1033589 () Bool)

(assert (=> start!129320 (=> (not res!1033589) (not e!845599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129320 (= res!1033589 (validMask!0 mask!2512))))

(assert (=> start!129320 e!845599))

(assert (=> start!129320 true))

(declare-fun array_inv!38008 (array!100990) Bool)

(assert (=> start!129320 (array_inv!38008 a!2804)))

(declare-fun b!1514868 () Bool)

(declare-fun res!1033593 () Bool)

(assert (=> b!1514868 (=> (not res!1033593) (not e!845601))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12791)

(assert (=> b!1514868 (= res!1033593 (= (seekEntry!0 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) (Found!12791 j!70)))))

(declare-fun b!1514869 () Bool)

(declare-fun res!1033591 () Bool)

(assert (=> b!1514869 (=> (not res!1033591) (not e!845599))))

(assert (=> b!1514869 (= res!1033591 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49278 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49278 a!2804))))))

(declare-fun b!1514870 () Bool)

(assert (=> b!1514870 (= e!845600 e!845598)))

(declare-fun res!1033595 () Bool)

(assert (=> b!1514870 (=> (not res!1033595) (not e!845598))))

(assert (=> b!1514870 (= res!1033595 (= (seekEntryOrOpen!0 (select (arr!48727 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48727 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514871 () Bool)

(declare-fun res!1033597 () Bool)

(assert (=> b!1514871 (=> (not res!1033597) (not e!845599))))

(declare-datatypes ((List!35197 0))(
  ( (Nil!35194) (Cons!35193 (h!36620 (_ BitVec 64)) (t!49883 List!35197)) )
))
(declare-fun arrayNoDuplicates!0 (array!100990 (_ BitVec 32) List!35197) Bool)

(assert (=> b!1514871 (= res!1033597 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35194))))

(declare-fun b!1514872 () Bool)

(assert (=> b!1514872 (= e!845602 (not true))))

(assert (=> b!1514872 e!845601))

(declare-fun res!1033594 () Bool)

(assert (=> b!1514872 (=> (not res!1033594) (not e!845601))))

(assert (=> b!1514872 (= res!1033594 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50485 0))(
  ( (Unit!50486) )
))
(declare-fun lt!656497 () Unit!50485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50485)

(assert (=> b!1514872 (= lt!656497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129320 res!1033589) b!1514861))

(assert (= (and b!1514861 res!1033586) b!1514866))

(assert (= (and b!1514866 res!1033587) b!1514864))

(assert (= (and b!1514864 res!1033590) b!1514862))

(assert (= (and b!1514862 res!1033588) b!1514871))

(assert (= (and b!1514871 res!1033597) b!1514869))

(assert (= (and b!1514869 res!1033591) b!1514860))

(assert (= (and b!1514860 res!1033592) b!1514859))

(assert (= (and b!1514859 res!1033585) b!1514867))

(assert (= (and b!1514867 res!1033598) b!1514872))

(assert (= (and b!1514872 res!1033594) b!1514868))

(assert (= (and b!1514868 res!1033593) b!1514865))

(assert (= (and b!1514865 (not res!1033596)) b!1514870))

(assert (= (and b!1514870 res!1033595) b!1514863))

(declare-fun m!1397643 () Bool)

(assert (=> b!1514871 m!1397643))

(declare-fun m!1397645 () Bool)

(assert (=> b!1514872 m!1397645))

(declare-fun m!1397647 () Bool)

(assert (=> b!1514872 m!1397647))

(declare-fun m!1397649 () Bool)

(assert (=> b!1514864 m!1397649))

(assert (=> b!1514864 m!1397649))

(declare-fun m!1397651 () Bool)

(assert (=> b!1514864 m!1397651))

(declare-fun m!1397653 () Bool)

(assert (=> b!1514866 m!1397653))

(assert (=> b!1514866 m!1397653))

(declare-fun m!1397655 () Bool)

(assert (=> b!1514866 m!1397655))

(assert (=> b!1514860 m!1397649))

(assert (=> b!1514860 m!1397649))

(declare-fun m!1397657 () Bool)

(assert (=> b!1514860 m!1397657))

(assert (=> b!1514860 m!1397657))

(assert (=> b!1514860 m!1397649))

(declare-fun m!1397659 () Bool)

(assert (=> b!1514860 m!1397659))

(assert (=> b!1514870 m!1397649))

(assert (=> b!1514870 m!1397649))

(declare-fun m!1397661 () Bool)

(assert (=> b!1514870 m!1397661))

(assert (=> b!1514870 m!1397649))

(declare-fun m!1397663 () Bool)

(assert (=> b!1514870 m!1397663))

(declare-fun m!1397665 () Bool)

(assert (=> b!1514867 m!1397665))

(assert (=> b!1514867 m!1397665))

(declare-fun m!1397667 () Bool)

(assert (=> b!1514867 m!1397667))

(declare-fun m!1397669 () Bool)

(assert (=> b!1514867 m!1397669))

(declare-fun m!1397671 () Bool)

(assert (=> b!1514867 m!1397671))

(assert (=> b!1514865 m!1397649))

(declare-fun m!1397673 () Bool)

(assert (=> b!1514865 m!1397673))

(declare-fun m!1397675 () Bool)

(assert (=> start!129320 m!1397675))

(declare-fun m!1397677 () Bool)

(assert (=> start!129320 m!1397677))

(declare-fun m!1397679 () Bool)

(assert (=> b!1514862 m!1397679))

(declare-fun m!1397681 () Bool)

(assert (=> b!1514863 m!1397681))

(declare-fun m!1397683 () Bool)

(assert (=> b!1514863 m!1397683))

(assert (=> b!1514859 m!1397649))

(assert (=> b!1514859 m!1397649))

(declare-fun m!1397685 () Bool)

(assert (=> b!1514859 m!1397685))

(assert (=> b!1514868 m!1397649))

(assert (=> b!1514868 m!1397649))

(declare-fun m!1397687 () Bool)

(assert (=> b!1514868 m!1397687))

(check-sat (not b!1514863) (not b!1514859) (not b!1514860) (not b!1514866) (not b!1514872) (not b!1514867) (not start!129320) (not b!1514871) (not b!1514864) (not b!1514862) (not b!1514868) (not b!1514870))
(check-sat)
