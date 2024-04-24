; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130656 () Bool)

(assert start!130656)

(declare-fun b!1531788 () Bool)

(declare-fun res!1048018 () Bool)

(declare-fun e!853773 () Bool)

(assert (=> b!1531788 (=> (not res!1048018) (not e!853773))))

(declare-datatypes ((array!101743 0))(
  ( (array!101744 (arr!49090 (Array (_ BitVec 32) (_ BitVec 64))) (size!49641 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101743)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101743 (_ BitVec 32)) Bool)

(assert (=> b!1531788 (= res!1048018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531789 () Bool)

(declare-fun e!853775 () Bool)

(declare-fun e!853776 () Bool)

(assert (=> b!1531789 (= e!853775 (not e!853776))))

(declare-fun res!1048017 () Bool)

(assert (=> b!1531789 (=> res!1048017 e!853776)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531789 (= res!1048017 (or (not (= (select (arr!49090 a!2804) j!70) (select (store (arr!49090 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853777 () Bool)

(assert (=> b!1531789 e!853777))

(declare-fun res!1048013 () Bool)

(assert (=> b!1531789 (=> (not res!1048013) (not e!853777))))

(assert (=> b!1531789 (= res!1048013 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51115 0))(
  ( (Unit!51116) )
))
(declare-fun lt!663328 () Unit!51115)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51115)

(assert (=> b!1531789 (= lt!663328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531790 () Bool)

(declare-fun res!1048015 () Bool)

(assert (=> b!1531790 (=> (not res!1048015) (not e!853775))))

(declare-datatypes ((SeekEntryResult!13148 0))(
  ( (MissingZero!13148 (index!54987 (_ BitVec 32))) (Found!13148 (index!54988 (_ BitVec 32))) (Intermediate!13148 (undefined!13960 Bool) (index!54989 (_ BitVec 32)) (x!136882 (_ BitVec 32))) (Undefined!13148) (MissingVacant!13148 (index!54990 (_ BitVec 32))) )
))
(declare-fun lt!663329 () SeekEntryResult!13148)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101743 (_ BitVec 32)) SeekEntryResult!13148)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531790 (= res!1048015 (= lt!663329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49090 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49090 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101744 (store (arr!49090 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49641 a!2804)) mask!2512)))))

(declare-fun b!1531791 () Bool)

(assert (=> b!1531791 (= e!853776 true)))

(declare-fun lt!663327 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531791 (= lt!663327 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531792 () Bool)

(declare-fun res!1048011 () Bool)

(assert (=> b!1531792 (=> (not res!1048011) (not e!853775))))

(declare-fun lt!663330 () SeekEntryResult!13148)

(assert (=> b!1531792 (= res!1048011 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49090 a!2804) j!70) a!2804 mask!2512) lt!663330))))

(declare-fun b!1531793 () Bool)

(declare-fun res!1048020 () Bool)

(assert (=> b!1531793 (=> (not res!1048020) (not e!853773))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531793 (= res!1048020 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49641 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49641 a!2804))))))

(declare-fun b!1531794 () Bool)

(declare-fun res!1048016 () Bool)

(assert (=> b!1531794 (=> (not res!1048016) (not e!853773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531794 (= res!1048016 (validKeyInArray!0 (select (arr!49090 a!2804) i!961)))))

(declare-fun b!1531795 () Bool)

(declare-fun res!1048009 () Bool)

(assert (=> b!1531795 (=> (not res!1048009) (not e!853773))))

(assert (=> b!1531795 (= res!1048009 (and (= (size!49641 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49641 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49641 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531796 () Bool)

(declare-fun res!1048019 () Bool)

(assert (=> b!1531796 (=> (not res!1048019) (not e!853773))))

(assert (=> b!1531796 (= res!1048019 (validKeyInArray!0 (select (arr!49090 a!2804) j!70)))))

(declare-fun b!1531797 () Bool)

(declare-fun res!1048010 () Bool)

(assert (=> b!1531797 (=> (not res!1048010) (not e!853773))))

(declare-datatypes ((List!35560 0))(
  ( (Nil!35557) (Cons!35556 (h!37010 (_ BitVec 64)) (t!50246 List!35560)) )
))
(declare-fun arrayNoDuplicates!0 (array!101743 (_ BitVec 32) List!35560) Bool)

(assert (=> b!1531797 (= res!1048010 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35557))))

(declare-fun res!1048014 () Bool)

(assert (=> start!130656 (=> (not res!1048014) (not e!853773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130656 (= res!1048014 (validMask!0 mask!2512))))

(assert (=> start!130656 e!853773))

(assert (=> start!130656 true))

(declare-fun array_inv!38371 (array!101743) Bool)

(assert (=> start!130656 (array_inv!38371 a!2804)))

(declare-fun b!1531798 () Bool)

(assert (=> b!1531798 (= e!853773 e!853775)))

(declare-fun res!1048012 () Bool)

(assert (=> b!1531798 (=> (not res!1048012) (not e!853775))))

(assert (=> b!1531798 (= res!1048012 (= lt!663329 lt!663330))))

(assert (=> b!1531798 (= lt!663330 (Intermediate!13148 false resIndex!21 resX!21))))

(assert (=> b!1531798 (= lt!663329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49090 a!2804) j!70) mask!2512) (select (arr!49090 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531799 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101743 (_ BitVec 32)) SeekEntryResult!13148)

(assert (=> b!1531799 (= e!853777 (= (seekEntry!0 (select (arr!49090 a!2804) j!70) a!2804 mask!2512) (Found!13148 j!70)))))

(assert (= (and start!130656 res!1048014) b!1531795))

(assert (= (and b!1531795 res!1048009) b!1531794))

(assert (= (and b!1531794 res!1048016) b!1531796))

(assert (= (and b!1531796 res!1048019) b!1531788))

(assert (= (and b!1531788 res!1048018) b!1531797))

(assert (= (and b!1531797 res!1048010) b!1531793))

(assert (= (and b!1531793 res!1048020) b!1531798))

(assert (= (and b!1531798 res!1048012) b!1531792))

(assert (= (and b!1531792 res!1048011) b!1531790))

(assert (= (and b!1531790 res!1048015) b!1531789))

(assert (= (and b!1531789 res!1048013) b!1531799))

(assert (= (and b!1531789 (not res!1048017)) b!1531791))

(declare-fun m!1414585 () Bool)

(assert (=> b!1531788 m!1414585))

(declare-fun m!1414587 () Bool)

(assert (=> b!1531796 m!1414587))

(assert (=> b!1531796 m!1414587))

(declare-fun m!1414589 () Bool)

(assert (=> b!1531796 m!1414589))

(declare-fun m!1414591 () Bool)

(assert (=> start!130656 m!1414591))

(declare-fun m!1414593 () Bool)

(assert (=> start!130656 m!1414593))

(declare-fun m!1414595 () Bool)

(assert (=> b!1531790 m!1414595))

(declare-fun m!1414597 () Bool)

(assert (=> b!1531790 m!1414597))

(assert (=> b!1531790 m!1414597))

(declare-fun m!1414599 () Bool)

(assert (=> b!1531790 m!1414599))

(assert (=> b!1531790 m!1414599))

(assert (=> b!1531790 m!1414597))

(declare-fun m!1414601 () Bool)

(assert (=> b!1531790 m!1414601))

(declare-fun m!1414603 () Bool)

(assert (=> b!1531791 m!1414603))

(declare-fun m!1414605 () Bool)

(assert (=> b!1531797 m!1414605))

(declare-fun m!1414607 () Bool)

(assert (=> b!1531794 m!1414607))

(assert (=> b!1531794 m!1414607))

(declare-fun m!1414609 () Bool)

(assert (=> b!1531794 m!1414609))

(assert (=> b!1531792 m!1414587))

(assert (=> b!1531792 m!1414587))

(declare-fun m!1414611 () Bool)

(assert (=> b!1531792 m!1414611))

(assert (=> b!1531798 m!1414587))

(assert (=> b!1531798 m!1414587))

(declare-fun m!1414613 () Bool)

(assert (=> b!1531798 m!1414613))

(assert (=> b!1531798 m!1414613))

(assert (=> b!1531798 m!1414587))

(declare-fun m!1414615 () Bool)

(assert (=> b!1531798 m!1414615))

(assert (=> b!1531799 m!1414587))

(assert (=> b!1531799 m!1414587))

(declare-fun m!1414617 () Bool)

(assert (=> b!1531799 m!1414617))

(assert (=> b!1531789 m!1414587))

(declare-fun m!1414619 () Bool)

(assert (=> b!1531789 m!1414619))

(assert (=> b!1531789 m!1414595))

(assert (=> b!1531789 m!1414597))

(declare-fun m!1414621 () Bool)

(assert (=> b!1531789 m!1414621))

(check-sat (not b!1531790) (not b!1531799) (not b!1531794) (not b!1531792) (not b!1531789) (not b!1531788) (not b!1531796) (not b!1531791) (not b!1531798) (not start!130656) (not b!1531797))
(check-sat)
