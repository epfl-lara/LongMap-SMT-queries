; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130434 () Bool)

(assert start!130434)

(declare-fun b!1528270 () Bool)

(declare-fun res!1044824 () Bool)

(declare-fun e!852020 () Bool)

(assert (=> b!1528270 (=> (not res!1044824) (not e!852020))))

(declare-datatypes ((array!101584 0))(
  ( (array!101585 (arr!49012 (Array (_ BitVec 32) (_ BitVec 64))) (size!49563 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101584)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101584 (_ BitVec 32)) Bool)

(assert (=> b!1528270 (= res!1044824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528271 () Bool)

(declare-fun e!852024 () Bool)

(assert (=> b!1528271 (= e!852020 e!852024)))

(declare-fun res!1044822 () Bool)

(assert (=> b!1528271 (=> (not res!1044822) (not e!852024))))

(declare-datatypes ((SeekEntryResult!13070 0))(
  ( (MissingZero!13070 (index!54675 (_ BitVec 32))) (Found!13070 (index!54676 (_ BitVec 32))) (Intermediate!13070 (undefined!13882 Bool) (index!54677 (_ BitVec 32)) (x!136587 (_ BitVec 32))) (Undefined!13070) (MissingVacant!13070 (index!54678 (_ BitVec 32))) )
))
(declare-fun lt!661784 () SeekEntryResult!13070)

(declare-fun lt!661788 () SeekEntryResult!13070)

(assert (=> b!1528271 (= res!1044822 (= lt!661784 lt!661788))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528271 (= lt!661788 (Intermediate!13070 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528271 (= lt!661784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49012 a!2804) j!70) mask!2512) (select (arr!49012 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528272 () Bool)

(declare-fun res!1044819 () Bool)

(assert (=> b!1528272 (=> (not res!1044819) (not e!852020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528272 (= res!1044819 (validKeyInArray!0 (select (arr!49012 a!2804) j!70)))))

(declare-fun b!1528273 () Bool)

(declare-fun e!852022 () Bool)

(assert (=> b!1528273 (= e!852022 (not true))))

(declare-fun e!852019 () Bool)

(assert (=> b!1528273 e!852019))

(declare-fun res!1044820 () Bool)

(assert (=> b!1528273 (=> (not res!1044820) (not e!852019))))

(assert (=> b!1528273 (= res!1044820 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50959 0))(
  ( (Unit!50960) )
))
(declare-fun lt!661785 () Unit!50959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50959)

(assert (=> b!1528273 (= lt!661785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528275 () Bool)

(declare-fun res!1044828 () Bool)

(assert (=> b!1528275 (=> (not res!1044828) (not e!852024))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528275 (= res!1044828 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) lt!661788))))

(declare-fun e!852025 () Bool)

(declare-fun lt!661787 () (_ BitVec 64))

(declare-fun b!1528276 () Bool)

(declare-fun lt!661786 () array!101584)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13070)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13070)

(assert (=> b!1528276 (= e!852025 (= (seekEntryOrOpen!0 lt!661787 lt!661786 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661787 lt!661786 mask!2512)))))

(declare-fun b!1528277 () Bool)

(declare-fun res!1044818 () Bool)

(assert (=> b!1528277 (=> (not res!1044818) (not e!852020))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528277 (= res!1044818 (validKeyInArray!0 (select (arr!49012 a!2804) i!961)))))

(declare-fun b!1528278 () Bool)

(declare-fun res!1044830 () Bool)

(assert (=> b!1528278 (=> (not res!1044830) (not e!852020))))

(assert (=> b!1528278 (= res!1044830 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49563 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49563 a!2804))))))

(declare-fun b!1528279 () Bool)

(declare-fun res!1044829 () Bool)

(assert (=> b!1528279 (=> (not res!1044829) (not e!852020))))

(declare-datatypes ((List!35482 0))(
  ( (Nil!35479) (Cons!35478 (h!36929 (_ BitVec 64)) (t!50168 List!35482)) )
))
(declare-fun arrayNoDuplicates!0 (array!101584 (_ BitVec 32) List!35482) Bool)

(assert (=> b!1528279 (= res!1044829 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35479))))

(declare-fun b!1528280 () Bool)

(declare-fun res!1044831 () Bool)

(assert (=> b!1528280 (=> (not res!1044831) (not e!852019))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101584 (_ BitVec 32)) SeekEntryResult!13070)

(assert (=> b!1528280 (= res!1044831 (= (seekEntry!0 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) (Found!13070 j!70)))))

(declare-fun b!1528281 () Bool)

(declare-fun res!1044826 () Bool)

(assert (=> b!1528281 (=> (not res!1044826) (not e!852020))))

(assert (=> b!1528281 (= res!1044826 (and (= (size!49563 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49563 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49563 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1044821 () Bool)

(assert (=> start!130434 (=> (not res!1044821) (not e!852020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130434 (= res!1044821 (validMask!0 mask!2512))))

(assert (=> start!130434 e!852020))

(assert (=> start!130434 true))

(declare-fun array_inv!38293 (array!101584) Bool)

(assert (=> start!130434 (array_inv!38293 a!2804)))

(declare-fun b!1528274 () Bool)

(declare-fun e!852021 () Bool)

(assert (=> b!1528274 (= e!852019 e!852021)))

(declare-fun res!1044827 () Bool)

(assert (=> b!1528274 (=> res!1044827 e!852021)))

(assert (=> b!1528274 (= res!1044827 (or (not (= (select (arr!49012 a!2804) j!70) lt!661787)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49012 a!2804) index!487) (select (arr!49012 a!2804) j!70)) (not (= (select (arr!49012 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528282 () Bool)

(assert (=> b!1528282 (= e!852021 e!852025)))

(declare-fun res!1044825 () Bool)

(assert (=> b!1528282 (=> (not res!1044825) (not e!852025))))

(assert (=> b!1528282 (= res!1044825 (= (seekEntryOrOpen!0 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49012 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1528283 () Bool)

(assert (=> b!1528283 (= e!852024 e!852022)))

(declare-fun res!1044823 () Bool)

(assert (=> b!1528283 (=> (not res!1044823) (not e!852022))))

(assert (=> b!1528283 (= res!1044823 (= lt!661784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661787 mask!2512) lt!661787 lt!661786 mask!2512)))))

(assert (=> b!1528283 (= lt!661787 (select (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528283 (= lt!661786 (array!101585 (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49563 a!2804)))))

(assert (= (and start!130434 res!1044821) b!1528281))

(assert (= (and b!1528281 res!1044826) b!1528277))

(assert (= (and b!1528277 res!1044818) b!1528272))

(assert (= (and b!1528272 res!1044819) b!1528270))

(assert (= (and b!1528270 res!1044824) b!1528279))

(assert (= (and b!1528279 res!1044829) b!1528278))

(assert (= (and b!1528278 res!1044830) b!1528271))

(assert (= (and b!1528271 res!1044822) b!1528275))

(assert (= (and b!1528275 res!1044828) b!1528283))

(assert (= (and b!1528283 res!1044823) b!1528273))

(assert (= (and b!1528273 res!1044820) b!1528280))

(assert (= (and b!1528280 res!1044831) b!1528274))

(assert (= (and b!1528274 (not res!1044827)) b!1528282))

(assert (= (and b!1528282 res!1044825) b!1528276))

(declare-fun m!1410877 () Bool)

(assert (=> b!1528274 m!1410877))

(declare-fun m!1410879 () Bool)

(assert (=> b!1528274 m!1410879))

(declare-fun m!1410881 () Bool)

(assert (=> b!1528273 m!1410881))

(declare-fun m!1410883 () Bool)

(assert (=> b!1528273 m!1410883))

(declare-fun m!1410885 () Bool)

(assert (=> b!1528270 m!1410885))

(declare-fun m!1410887 () Bool)

(assert (=> b!1528283 m!1410887))

(assert (=> b!1528283 m!1410887))

(declare-fun m!1410889 () Bool)

(assert (=> b!1528283 m!1410889))

(declare-fun m!1410891 () Bool)

(assert (=> b!1528283 m!1410891))

(declare-fun m!1410893 () Bool)

(assert (=> b!1528283 m!1410893))

(declare-fun m!1410895 () Bool)

(assert (=> start!130434 m!1410895))

(declare-fun m!1410897 () Bool)

(assert (=> start!130434 m!1410897))

(declare-fun m!1410899 () Bool)

(assert (=> b!1528277 m!1410899))

(assert (=> b!1528277 m!1410899))

(declare-fun m!1410901 () Bool)

(assert (=> b!1528277 m!1410901))

(assert (=> b!1528272 m!1410877))

(assert (=> b!1528272 m!1410877))

(declare-fun m!1410903 () Bool)

(assert (=> b!1528272 m!1410903))

(assert (=> b!1528271 m!1410877))

(assert (=> b!1528271 m!1410877))

(declare-fun m!1410905 () Bool)

(assert (=> b!1528271 m!1410905))

(assert (=> b!1528271 m!1410905))

(assert (=> b!1528271 m!1410877))

(declare-fun m!1410907 () Bool)

(assert (=> b!1528271 m!1410907))

(assert (=> b!1528282 m!1410877))

(assert (=> b!1528282 m!1410877))

(declare-fun m!1410909 () Bool)

(assert (=> b!1528282 m!1410909))

(assert (=> b!1528282 m!1410877))

(declare-fun m!1410911 () Bool)

(assert (=> b!1528282 m!1410911))

(assert (=> b!1528280 m!1410877))

(assert (=> b!1528280 m!1410877))

(declare-fun m!1410913 () Bool)

(assert (=> b!1528280 m!1410913))

(assert (=> b!1528275 m!1410877))

(assert (=> b!1528275 m!1410877))

(declare-fun m!1410915 () Bool)

(assert (=> b!1528275 m!1410915))

(declare-fun m!1410917 () Bool)

(assert (=> b!1528276 m!1410917))

(declare-fun m!1410919 () Bool)

(assert (=> b!1528276 m!1410919))

(declare-fun m!1410921 () Bool)

(assert (=> b!1528279 m!1410921))

(check-sat (not b!1528273) (not b!1528279) (not b!1528280) (not b!1528275) (not b!1528282) (not b!1528272) (not b!1528283) (not b!1528271) (not b!1528270) (not start!130434) (not b!1528276) (not b!1528277))
(check-sat)
