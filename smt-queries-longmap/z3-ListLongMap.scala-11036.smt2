; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129050 () Bool)

(assert start!129050)

(declare-fun b!1513699 () Bool)

(declare-fun res!1033612 () Bool)

(declare-fun e!844798 () Bool)

(assert (=> b!1513699 (=> (not res!1033612) (not e!844798))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100906 0))(
  ( (array!100907 (arr!48690 (Array (_ BitVec 32) (_ BitVec 64))) (size!49240 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100906)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513699 (= res!1033612 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49240 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49240 a!2804))))))

(declare-fun b!1513700 () Bool)

(declare-fun res!1033613 () Bool)

(assert (=> b!1513700 (=> (not res!1033613) (not e!844798))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513700 (= res!1033613 (validKeyInArray!0 (select (arr!48690 a!2804) i!961)))))

(declare-fun res!1033614 () Bool)

(assert (=> start!129050 (=> (not res!1033614) (not e!844798))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129050 (= res!1033614 (validMask!0 mask!2512))))

(assert (=> start!129050 e!844798))

(assert (=> start!129050 true))

(declare-fun array_inv!37718 (array!100906) Bool)

(assert (=> start!129050 (array_inv!37718 a!2804)))

(declare-fun b!1513701 () Bool)

(declare-fun res!1033606 () Bool)

(assert (=> b!1513701 (=> (not res!1033606) (not e!844798))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1513701 (= res!1033606 (and (= (size!49240 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49240 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49240 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513702 () Bool)

(declare-fun res!1033609 () Bool)

(assert (=> b!1513702 (=> (not res!1033609) (not e!844798))))

(assert (=> b!1513702 (= res!1033609 (validKeyInArray!0 (select (arr!48690 a!2804) j!70)))))

(declare-fun b!1513703 () Bool)

(declare-fun res!1033605 () Bool)

(assert (=> b!1513703 (=> (not res!1033605) (not e!844798))))

(declare-datatypes ((List!35173 0))(
  ( (Nil!35170) (Cons!35169 (h!36581 (_ BitVec 64)) (t!49867 List!35173)) )
))
(declare-fun arrayNoDuplicates!0 (array!100906 (_ BitVec 32) List!35173) Bool)

(assert (=> b!1513703 (= res!1033605 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35170))))

(declare-fun lt!656073 () array!100906)

(declare-fun lt!656071 () (_ BitVec 64))

(declare-fun e!844801 () Bool)

(declare-fun b!1513704 () Bool)

(declare-datatypes ((SeekEntryResult!12861 0))(
  ( (MissingZero!12861 (index!53839 (_ BitVec 32))) (Found!12861 (index!53840 (_ BitVec 32))) (Intermediate!12861 (undefined!13673 Bool) (index!53841 (_ BitVec 32)) (x!135555 (_ BitVec 32))) (Undefined!12861) (MissingVacant!12861 (index!53842 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12861)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12861)

(assert (=> b!1513704 (= e!844801 (= (seekEntryOrOpen!0 lt!656071 lt!656073 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656071 lt!656073 mask!2512)))))

(declare-fun b!1513705 () Bool)

(declare-fun e!844803 () Bool)

(assert (=> b!1513705 (= e!844798 e!844803)))

(declare-fun res!1033604 () Bool)

(assert (=> b!1513705 (=> (not res!1033604) (not e!844803))))

(declare-fun lt!656070 () SeekEntryResult!12861)

(declare-fun lt!656074 () SeekEntryResult!12861)

(assert (=> b!1513705 (= res!1033604 (= lt!656070 lt!656074))))

(assert (=> b!1513705 (= lt!656074 (Intermediate!12861 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12861)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513705 (= lt!656070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48690 a!2804) j!70) mask!2512) (select (arr!48690 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513706 () Bool)

(declare-fun e!844800 () Bool)

(assert (=> b!1513706 (= e!844800 (not true))))

(declare-fun e!844799 () Bool)

(assert (=> b!1513706 e!844799))

(declare-fun res!1033608 () Bool)

(assert (=> b!1513706 (=> (not res!1033608) (not e!844799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100906 (_ BitVec 32)) Bool)

(assert (=> b!1513706 (= res!1033608 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50590 0))(
  ( (Unit!50591) )
))
(declare-fun lt!656072 () Unit!50590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50590)

(assert (=> b!1513706 (= lt!656072 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513707 () Bool)

(declare-fun res!1033611 () Bool)

(assert (=> b!1513707 (=> (not res!1033611) (not e!844799))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100906 (_ BitVec 32)) SeekEntryResult!12861)

(assert (=> b!1513707 (= res!1033611 (= (seekEntry!0 (select (arr!48690 a!2804) j!70) a!2804 mask!2512) (Found!12861 j!70)))))

(declare-fun b!1513708 () Bool)

(declare-fun res!1033602 () Bool)

(assert (=> b!1513708 (=> (not res!1033602) (not e!844798))))

(assert (=> b!1513708 (= res!1033602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513709 () Bool)

(declare-fun e!844802 () Bool)

(assert (=> b!1513709 (= e!844799 e!844802)))

(declare-fun res!1033607 () Bool)

(assert (=> b!1513709 (=> res!1033607 e!844802)))

(assert (=> b!1513709 (= res!1033607 (or (not (= (select (arr!48690 a!2804) j!70) lt!656071)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48690 a!2804) index!487) (select (arr!48690 a!2804) j!70)) (not (= (select (arr!48690 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513710 () Bool)

(declare-fun res!1033615 () Bool)

(assert (=> b!1513710 (=> (not res!1033615) (not e!844803))))

(assert (=> b!1513710 (= res!1033615 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48690 a!2804) j!70) a!2804 mask!2512) lt!656074))))

(declare-fun b!1513711 () Bool)

(assert (=> b!1513711 (= e!844803 e!844800)))

(declare-fun res!1033610 () Bool)

(assert (=> b!1513711 (=> (not res!1033610) (not e!844800))))

(assert (=> b!1513711 (= res!1033610 (= lt!656070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656071 mask!2512) lt!656071 lt!656073 mask!2512)))))

(assert (=> b!1513711 (= lt!656071 (select (store (arr!48690 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513711 (= lt!656073 (array!100907 (store (arr!48690 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49240 a!2804)))))

(declare-fun b!1513712 () Bool)

(assert (=> b!1513712 (= e!844802 e!844801)))

(declare-fun res!1033603 () Bool)

(assert (=> b!1513712 (=> (not res!1033603) (not e!844801))))

(assert (=> b!1513712 (= res!1033603 (= (seekEntryOrOpen!0 (select (arr!48690 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48690 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129050 res!1033614) b!1513701))

(assert (= (and b!1513701 res!1033606) b!1513700))

(assert (= (and b!1513700 res!1033613) b!1513702))

(assert (= (and b!1513702 res!1033609) b!1513708))

(assert (= (and b!1513708 res!1033602) b!1513703))

(assert (= (and b!1513703 res!1033605) b!1513699))

(assert (= (and b!1513699 res!1033612) b!1513705))

(assert (= (and b!1513705 res!1033604) b!1513710))

(assert (= (and b!1513710 res!1033615) b!1513711))

(assert (= (and b!1513711 res!1033610) b!1513706))

(assert (= (and b!1513706 res!1033608) b!1513707))

(assert (= (and b!1513707 res!1033611) b!1513709))

(assert (= (and b!1513709 (not res!1033607)) b!1513712))

(assert (= (and b!1513712 res!1033603) b!1513704))

(declare-fun m!1396583 () Bool)

(assert (=> b!1513710 m!1396583))

(assert (=> b!1513710 m!1396583))

(declare-fun m!1396585 () Bool)

(assert (=> b!1513710 m!1396585))

(declare-fun m!1396587 () Bool)

(assert (=> b!1513708 m!1396587))

(assert (=> b!1513705 m!1396583))

(assert (=> b!1513705 m!1396583))

(declare-fun m!1396589 () Bool)

(assert (=> b!1513705 m!1396589))

(assert (=> b!1513705 m!1396589))

(assert (=> b!1513705 m!1396583))

(declare-fun m!1396591 () Bool)

(assert (=> b!1513705 m!1396591))

(declare-fun m!1396593 () Bool)

(assert (=> b!1513703 m!1396593))

(declare-fun m!1396595 () Bool)

(assert (=> start!129050 m!1396595))

(declare-fun m!1396597 () Bool)

(assert (=> start!129050 m!1396597))

(assert (=> b!1513712 m!1396583))

(assert (=> b!1513712 m!1396583))

(declare-fun m!1396599 () Bool)

(assert (=> b!1513712 m!1396599))

(assert (=> b!1513712 m!1396583))

(declare-fun m!1396601 () Bool)

(assert (=> b!1513712 m!1396601))

(assert (=> b!1513709 m!1396583))

(declare-fun m!1396603 () Bool)

(assert (=> b!1513709 m!1396603))

(declare-fun m!1396605 () Bool)

(assert (=> b!1513706 m!1396605))

(declare-fun m!1396607 () Bool)

(assert (=> b!1513706 m!1396607))

(declare-fun m!1396609 () Bool)

(assert (=> b!1513711 m!1396609))

(assert (=> b!1513711 m!1396609))

(declare-fun m!1396611 () Bool)

(assert (=> b!1513711 m!1396611))

(declare-fun m!1396613 () Bool)

(assert (=> b!1513711 m!1396613))

(declare-fun m!1396615 () Bool)

(assert (=> b!1513711 m!1396615))

(assert (=> b!1513702 m!1396583))

(assert (=> b!1513702 m!1396583))

(declare-fun m!1396617 () Bool)

(assert (=> b!1513702 m!1396617))

(declare-fun m!1396619 () Bool)

(assert (=> b!1513704 m!1396619))

(declare-fun m!1396621 () Bool)

(assert (=> b!1513704 m!1396621))

(declare-fun m!1396623 () Bool)

(assert (=> b!1513700 m!1396623))

(assert (=> b!1513700 m!1396623))

(declare-fun m!1396625 () Bool)

(assert (=> b!1513700 m!1396625))

(assert (=> b!1513707 m!1396583))

(assert (=> b!1513707 m!1396583))

(declare-fun m!1396627 () Bool)

(assert (=> b!1513707 m!1396627))

(check-sat (not b!1513700) (not start!129050) (not b!1513710) (not b!1513706) (not b!1513712) (not b!1513711) (not b!1513704) (not b!1513702) (not b!1513707) (not b!1513703) (not b!1513705) (not b!1513708))
(check-sat)
