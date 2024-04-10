; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129254 () Bool)

(assert start!129254)

(declare-fun b!1517708 () Bool)

(declare-fun res!1037623 () Bool)

(declare-fun e!846740 () Bool)

(assert (=> b!1517708 (=> (not res!1037623) (not e!846740))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101110 0))(
  ( (array!101111 (arr!48792 (Array (_ BitVec 32) (_ BitVec 64))) (size!49342 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101110)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12963 0))(
  ( (MissingZero!12963 (index!54247 (_ BitVec 32))) (Found!12963 (index!54248 (_ BitVec 32))) (Intermediate!12963 (undefined!13775 Bool) (index!54249 (_ BitVec 32)) (x!135929 (_ BitVec 32))) (Undefined!12963) (MissingVacant!12963 (index!54250 (_ BitVec 32))) )
))
(declare-fun lt!657889 () SeekEntryResult!12963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12963)

(assert (=> b!1517708 (= res!1037623 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48792 a!2804) j!70) a!2804 mask!2512) lt!657889))))

(declare-fun b!1517709 () Bool)

(declare-fun e!846739 () Bool)

(assert (=> b!1517709 (= e!846739 e!846740)))

(declare-fun res!1037620 () Bool)

(assert (=> b!1517709 (=> (not res!1037620) (not e!846740))))

(declare-fun lt!657890 () SeekEntryResult!12963)

(assert (=> b!1517709 (= res!1037620 (= lt!657890 lt!657889))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517709 (= lt!657889 (Intermediate!12963 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517709 (= lt!657890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48792 a!2804) j!70) mask!2512) (select (arr!48792 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517710 () Bool)

(declare-fun res!1037615 () Bool)

(assert (=> b!1517710 (=> (not res!1037615) (not e!846740))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517710 (= res!1037615 (= lt!657890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48792 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48792 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101111 (store (arr!48792 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49342 a!2804)) mask!2512)))))

(declare-fun res!1037622 () Bool)

(assert (=> start!129254 (=> (not res!1037622) (not e!846739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129254 (= res!1037622 (validMask!0 mask!2512))))

(assert (=> start!129254 e!846739))

(assert (=> start!129254 true))

(declare-fun array_inv!37820 (array!101110) Bool)

(assert (=> start!129254 (array_inv!37820 a!2804)))

(declare-fun b!1517711 () Bool)

(declare-fun e!846741 () Bool)

(assert (=> b!1517711 (= e!846740 (not e!846741))))

(declare-fun res!1037616 () Bool)

(assert (=> b!1517711 (=> res!1037616 e!846741)))

(assert (=> b!1517711 (= res!1037616 (or (not (= (select (arr!48792 a!2804) j!70) (select (store (arr!48792 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846737 () Bool)

(assert (=> b!1517711 e!846737))

(declare-fun res!1037619 () Bool)

(assert (=> b!1517711 (=> (not res!1037619) (not e!846737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101110 (_ BitVec 32)) Bool)

(assert (=> b!1517711 (= res!1037619 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50794 0))(
  ( (Unit!50795) )
))
(declare-fun lt!657892 () Unit!50794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50794)

(assert (=> b!1517711 (= lt!657892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517712 () Bool)

(declare-fun res!1037614 () Bool)

(assert (=> b!1517712 (=> (not res!1037614) (not e!846739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517712 (= res!1037614 (validKeyInArray!0 (select (arr!48792 a!2804) i!961)))))

(declare-fun b!1517713 () Bool)

(declare-fun res!1037613 () Bool)

(assert (=> b!1517713 (=> (not res!1037613) (not e!846739))))

(declare-datatypes ((List!35275 0))(
  ( (Nil!35272) (Cons!35271 (h!36683 (_ BitVec 64)) (t!49969 List!35275)) )
))
(declare-fun arrayNoDuplicates!0 (array!101110 (_ BitVec 32) List!35275) Bool)

(assert (=> b!1517713 (= res!1037613 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35272))))

(declare-fun b!1517714 () Bool)

(declare-fun res!1037612 () Bool)

(assert (=> b!1517714 (=> (not res!1037612) (not e!846739))))

(assert (=> b!1517714 (= res!1037612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517715 () Bool)

(declare-fun res!1037621 () Bool)

(assert (=> b!1517715 (=> (not res!1037621) (not e!846739))))

(assert (=> b!1517715 (= res!1037621 (validKeyInArray!0 (select (arr!48792 a!2804) j!70)))))

(declare-fun b!1517716 () Bool)

(declare-fun e!846742 () Bool)

(assert (=> b!1517716 (= e!846741 e!846742)))

(declare-fun res!1037618 () Bool)

(assert (=> b!1517716 (=> res!1037618 e!846742)))

(declare-fun lt!657888 () (_ BitVec 32))

(assert (=> b!1517716 (= res!1037618 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657888 #b00000000000000000000000000000000) (bvsge lt!657888 (size!49342 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517716 (= lt!657888 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517717 () Bool)

(declare-fun res!1037611 () Bool)

(assert (=> b!1517717 (=> (not res!1037611) (not e!846739))))

(assert (=> b!1517717 (= res!1037611 (and (= (size!49342 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49342 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49342 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517718 () Bool)

(declare-fun res!1037617 () Bool)

(assert (=> b!1517718 (=> (not res!1037617) (not e!846739))))

(assert (=> b!1517718 (= res!1037617 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49342 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49342 a!2804))))))

(declare-fun b!1517719 () Bool)

(assert (=> b!1517719 (= e!846742 true)))

(declare-fun lt!657891 () SeekEntryResult!12963)

(assert (=> b!1517719 (= lt!657891 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657888 (select (arr!48792 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517720 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12963)

(assert (=> b!1517720 (= e!846737 (= (seekEntry!0 (select (arr!48792 a!2804) j!70) a!2804 mask!2512) (Found!12963 j!70)))))

(assert (= (and start!129254 res!1037622) b!1517717))

(assert (= (and b!1517717 res!1037611) b!1517712))

(assert (= (and b!1517712 res!1037614) b!1517715))

(assert (= (and b!1517715 res!1037621) b!1517714))

(assert (= (and b!1517714 res!1037612) b!1517713))

(assert (= (and b!1517713 res!1037613) b!1517718))

(assert (= (and b!1517718 res!1037617) b!1517709))

(assert (= (and b!1517709 res!1037620) b!1517708))

(assert (= (and b!1517708 res!1037623) b!1517710))

(assert (= (and b!1517710 res!1037615) b!1517711))

(assert (= (and b!1517711 res!1037619) b!1517720))

(assert (= (and b!1517711 (not res!1037616)) b!1517716))

(assert (= (and b!1517716 (not res!1037618)) b!1517719))

(declare-fun m!1401005 () Bool)

(assert (=> b!1517711 m!1401005))

(declare-fun m!1401007 () Bool)

(assert (=> b!1517711 m!1401007))

(declare-fun m!1401009 () Bool)

(assert (=> b!1517711 m!1401009))

(declare-fun m!1401011 () Bool)

(assert (=> b!1517711 m!1401011))

(declare-fun m!1401013 () Bool)

(assert (=> b!1517711 m!1401013))

(assert (=> b!1517710 m!1401009))

(assert (=> b!1517710 m!1401011))

(assert (=> b!1517710 m!1401011))

(declare-fun m!1401015 () Bool)

(assert (=> b!1517710 m!1401015))

(assert (=> b!1517710 m!1401015))

(assert (=> b!1517710 m!1401011))

(declare-fun m!1401017 () Bool)

(assert (=> b!1517710 m!1401017))

(declare-fun m!1401019 () Bool)

(assert (=> b!1517712 m!1401019))

(assert (=> b!1517712 m!1401019))

(declare-fun m!1401021 () Bool)

(assert (=> b!1517712 m!1401021))

(assert (=> b!1517709 m!1401005))

(assert (=> b!1517709 m!1401005))

(declare-fun m!1401023 () Bool)

(assert (=> b!1517709 m!1401023))

(assert (=> b!1517709 m!1401023))

(assert (=> b!1517709 m!1401005))

(declare-fun m!1401025 () Bool)

(assert (=> b!1517709 m!1401025))

(declare-fun m!1401027 () Bool)

(assert (=> b!1517713 m!1401027))

(declare-fun m!1401029 () Bool)

(assert (=> b!1517716 m!1401029))

(assert (=> b!1517719 m!1401005))

(assert (=> b!1517719 m!1401005))

(declare-fun m!1401031 () Bool)

(assert (=> b!1517719 m!1401031))

(assert (=> b!1517715 m!1401005))

(assert (=> b!1517715 m!1401005))

(declare-fun m!1401033 () Bool)

(assert (=> b!1517715 m!1401033))

(declare-fun m!1401035 () Bool)

(assert (=> b!1517714 m!1401035))

(assert (=> b!1517708 m!1401005))

(assert (=> b!1517708 m!1401005))

(declare-fun m!1401037 () Bool)

(assert (=> b!1517708 m!1401037))

(declare-fun m!1401039 () Bool)

(assert (=> start!129254 m!1401039))

(declare-fun m!1401041 () Bool)

(assert (=> start!129254 m!1401041))

(assert (=> b!1517720 m!1401005))

(assert (=> b!1517720 m!1401005))

(declare-fun m!1401043 () Bool)

(assert (=> b!1517720 m!1401043))

(check-sat (not b!1517713) (not b!1517709) (not b!1517710) (not b!1517708) (not b!1517716) (not b!1517719) (not b!1517711) (not b!1517714) (not b!1517712) (not b!1517720) (not b!1517715) (not start!129254))
(check-sat)
