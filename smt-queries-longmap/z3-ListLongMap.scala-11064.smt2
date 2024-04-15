; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129164 () Bool)

(assert start!129164)

(declare-fun b!1516628 () Bool)

(declare-fun res!1036739 () Bool)

(declare-fun e!846185 () Bool)

(assert (=> b!1516628 (=> (not res!1036739) (not e!846185))))

(declare-datatypes ((array!101020 0))(
  ( (array!101021 (arr!48748 (Array (_ BitVec 32) (_ BitVec 64))) (size!49300 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101020)

(declare-datatypes ((List!35309 0))(
  ( (Nil!35306) (Cons!35305 (h!36718 (_ BitVec 64)) (t!49995 List!35309)) )
))
(declare-fun arrayNoDuplicates!0 (array!101020 (_ BitVec 32) List!35309) Bool)

(assert (=> b!1516628 (= res!1036739 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35306))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1516629 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!846181 () Bool)

(declare-datatypes ((SeekEntryResult!12942 0))(
  ( (MissingZero!12942 (index!54163 (_ BitVec 32))) (Found!12942 (index!54164 (_ BitVec 32))) (Intermediate!12942 (undefined!13754 Bool) (index!54165 (_ BitVec 32)) (x!135854 (_ BitVec 32))) (Undefined!12942) (MissingVacant!12942 (index!54166 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12942)

(assert (=> b!1516629 (= e!846181 (= (seekEntry!0 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) (Found!12942 j!70)))))

(declare-fun b!1516630 () Bool)

(declare-fun e!846186 () Bool)

(declare-fun e!846183 () Bool)

(assert (=> b!1516630 (= e!846186 e!846183)))

(declare-fun res!1036748 () Bool)

(assert (=> b!1516630 (=> res!1036748 e!846183)))

(declare-fun lt!657312 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516630 (= res!1036748 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657312 #b00000000000000000000000000000000) (bvsge lt!657312 (size!49300 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516630 (= lt!657312 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516631 () Bool)

(declare-fun e!846182 () Bool)

(assert (=> b!1516631 (= e!846185 e!846182)))

(declare-fun res!1036740 () Bool)

(assert (=> b!1516631 (=> (not res!1036740) (not e!846182))))

(declare-fun lt!657308 () SeekEntryResult!12942)

(declare-fun lt!657310 () SeekEntryResult!12942)

(assert (=> b!1516631 (= res!1036740 (= lt!657308 lt!657310))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516631 (= lt!657310 (Intermediate!12942 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12942)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516631 (= lt!657308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48748 a!2804) j!70) mask!2512) (select (arr!48748 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516632 () Bool)

(declare-fun res!1036742 () Bool)

(assert (=> b!1516632 (=> (not res!1036742) (not e!846185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516632 (= res!1036742 (validKeyInArray!0 (select (arr!48748 a!2804) j!70)))))

(declare-fun b!1516633 () Bool)

(assert (=> b!1516633 (= e!846182 (not e!846186))))

(declare-fun res!1036737 () Bool)

(assert (=> b!1516633 (=> res!1036737 e!846186)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516633 (= res!1036737 (or (not (= (select (arr!48748 a!2804) j!70) (select (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516633 e!846181))

(declare-fun res!1036743 () Bool)

(assert (=> b!1516633 (=> (not res!1036743) (not e!846181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101020 (_ BitVec 32)) Bool)

(assert (=> b!1516633 (= res!1036743 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50591 0))(
  ( (Unit!50592) )
))
(declare-fun lt!657309 () Unit!50591)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50591)

(assert (=> b!1516633 (= lt!657309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516634 () Bool)

(declare-fun res!1036738 () Bool)

(assert (=> b!1516634 (=> (not res!1036738) (not e!846185))))

(assert (=> b!1516634 (= res!1036738 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49300 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49300 a!2804))))))

(declare-fun b!1516635 () Bool)

(assert (=> b!1516635 (= e!846183 true)))

(declare-fun lt!657311 () SeekEntryResult!12942)

(assert (=> b!1516635 (= lt!657311 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657312 (select (arr!48748 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516636 () Bool)

(declare-fun res!1036745 () Bool)

(assert (=> b!1516636 (=> (not res!1036745) (not e!846185))))

(assert (=> b!1516636 (= res!1036745 (and (= (size!49300 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49300 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49300 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516637 () Bool)

(declare-fun res!1036744 () Bool)

(assert (=> b!1516637 (=> (not res!1036744) (not e!846185))))

(assert (=> b!1516637 (= res!1036744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1036741 () Bool)

(assert (=> start!129164 (=> (not res!1036741) (not e!846185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129164 (= res!1036741 (validMask!0 mask!2512))))

(assert (=> start!129164 e!846185))

(assert (=> start!129164 true))

(declare-fun array_inv!37981 (array!101020) Bool)

(assert (=> start!129164 (array_inv!37981 a!2804)))

(declare-fun b!1516627 () Bool)

(declare-fun res!1036747 () Bool)

(assert (=> b!1516627 (=> (not res!1036747) (not e!846182))))

(assert (=> b!1516627 (= res!1036747 (= lt!657308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101021 (store (arr!48748 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49300 a!2804)) mask!2512)))))

(declare-fun b!1516638 () Bool)

(declare-fun res!1036736 () Bool)

(assert (=> b!1516638 (=> (not res!1036736) (not e!846185))))

(assert (=> b!1516638 (= res!1036736 (validKeyInArray!0 (select (arr!48748 a!2804) i!961)))))

(declare-fun b!1516639 () Bool)

(declare-fun res!1036746 () Bool)

(assert (=> b!1516639 (=> (not res!1036746) (not e!846182))))

(assert (=> b!1516639 (= res!1036746 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48748 a!2804) j!70) a!2804 mask!2512) lt!657310))))

(assert (= (and start!129164 res!1036741) b!1516636))

(assert (= (and b!1516636 res!1036745) b!1516638))

(assert (= (and b!1516638 res!1036736) b!1516632))

(assert (= (and b!1516632 res!1036742) b!1516637))

(assert (= (and b!1516637 res!1036744) b!1516628))

(assert (= (and b!1516628 res!1036739) b!1516634))

(assert (= (and b!1516634 res!1036738) b!1516631))

(assert (= (and b!1516631 res!1036740) b!1516639))

(assert (= (and b!1516639 res!1036746) b!1516627))

(assert (= (and b!1516627 res!1036747) b!1516633))

(assert (= (and b!1516633 res!1036743) b!1516629))

(assert (= (and b!1516633 (not res!1036737)) b!1516630))

(assert (= (and b!1516630 (not res!1036748)) b!1516635))

(declare-fun m!1399337 () Bool)

(assert (=> b!1516631 m!1399337))

(assert (=> b!1516631 m!1399337))

(declare-fun m!1399339 () Bool)

(assert (=> b!1516631 m!1399339))

(assert (=> b!1516631 m!1399339))

(assert (=> b!1516631 m!1399337))

(declare-fun m!1399341 () Bool)

(assert (=> b!1516631 m!1399341))

(assert (=> b!1516635 m!1399337))

(assert (=> b!1516635 m!1399337))

(declare-fun m!1399343 () Bool)

(assert (=> b!1516635 m!1399343))

(assert (=> b!1516639 m!1399337))

(assert (=> b!1516639 m!1399337))

(declare-fun m!1399345 () Bool)

(assert (=> b!1516639 m!1399345))

(declare-fun m!1399347 () Bool)

(assert (=> b!1516638 m!1399347))

(assert (=> b!1516638 m!1399347))

(declare-fun m!1399349 () Bool)

(assert (=> b!1516638 m!1399349))

(declare-fun m!1399351 () Bool)

(assert (=> b!1516637 m!1399351))

(declare-fun m!1399353 () Bool)

(assert (=> b!1516628 m!1399353))

(declare-fun m!1399355 () Bool)

(assert (=> b!1516630 m!1399355))

(declare-fun m!1399357 () Bool)

(assert (=> start!129164 m!1399357))

(declare-fun m!1399359 () Bool)

(assert (=> start!129164 m!1399359))

(assert (=> b!1516632 m!1399337))

(assert (=> b!1516632 m!1399337))

(declare-fun m!1399361 () Bool)

(assert (=> b!1516632 m!1399361))

(assert (=> b!1516633 m!1399337))

(declare-fun m!1399363 () Bool)

(assert (=> b!1516633 m!1399363))

(declare-fun m!1399365 () Bool)

(assert (=> b!1516633 m!1399365))

(declare-fun m!1399367 () Bool)

(assert (=> b!1516633 m!1399367))

(declare-fun m!1399369 () Bool)

(assert (=> b!1516633 m!1399369))

(assert (=> b!1516627 m!1399365))

(assert (=> b!1516627 m!1399367))

(assert (=> b!1516627 m!1399367))

(declare-fun m!1399371 () Bool)

(assert (=> b!1516627 m!1399371))

(assert (=> b!1516627 m!1399371))

(assert (=> b!1516627 m!1399367))

(declare-fun m!1399373 () Bool)

(assert (=> b!1516627 m!1399373))

(assert (=> b!1516629 m!1399337))

(assert (=> b!1516629 m!1399337))

(declare-fun m!1399375 () Bool)

(assert (=> b!1516629 m!1399375))

(check-sat (not start!129164) (not b!1516630) (not b!1516632) (not b!1516627) (not b!1516631) (not b!1516635) (not b!1516629) (not b!1516639) (not b!1516628) (not b!1516633) (not b!1516637) (not b!1516638))
(check-sat)
