; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129248 () Bool)

(assert start!129248)

(declare-fun b!1517591 () Bool)

(declare-fun e!846686 () Bool)

(assert (=> b!1517591 (= e!846686 true)))

(declare-datatypes ((SeekEntryResult!12960 0))(
  ( (MissingZero!12960 (index!54235 (_ BitVec 32))) (Found!12960 (index!54236 (_ BitVec 32))) (Intermediate!12960 (undefined!13772 Bool) (index!54237 (_ BitVec 32)) (x!135918 (_ BitVec 32))) (Undefined!12960) (MissingVacant!12960 (index!54238 (_ BitVec 32))) )
))
(declare-fun lt!657843 () SeekEntryResult!12960)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101104 0))(
  ( (array!101105 (arr!48789 (Array (_ BitVec 32) (_ BitVec 64))) (size!49339 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101104)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657847 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12960)

(assert (=> b!1517591 (= lt!657843 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657847 (select (arr!48789 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517592 () Bool)

(declare-fun e!846688 () Bool)

(declare-fun e!846687 () Bool)

(assert (=> b!1517592 (= e!846688 (not e!846687))))

(declare-fun res!1037506 () Bool)

(assert (=> b!1517592 (=> res!1037506 e!846687)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517592 (= res!1037506 (or (not (= (select (arr!48789 a!2804) j!70) (select (store (arr!48789 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846684 () Bool)

(assert (=> b!1517592 e!846684))

(declare-fun res!1037500 () Bool)

(assert (=> b!1517592 (=> (not res!1037500) (not e!846684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101104 (_ BitVec 32)) Bool)

(assert (=> b!1517592 (= res!1037500 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50788 0))(
  ( (Unit!50789) )
))
(declare-fun lt!657846 () Unit!50788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50788)

(assert (=> b!1517592 (= lt!657846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517593 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12960)

(assert (=> b!1517593 (= e!846684 (= (seekEntry!0 (select (arr!48789 a!2804) j!70) a!2804 mask!2512) (Found!12960 j!70)))))

(declare-fun b!1517594 () Bool)

(declare-fun e!846683 () Bool)

(assert (=> b!1517594 (= e!846683 e!846688)))

(declare-fun res!1037502 () Bool)

(assert (=> b!1517594 (=> (not res!1037502) (not e!846688))))

(declare-fun lt!657845 () SeekEntryResult!12960)

(declare-fun lt!657844 () SeekEntryResult!12960)

(assert (=> b!1517594 (= res!1037502 (= lt!657845 lt!657844))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517594 (= lt!657844 (Intermediate!12960 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517594 (= lt!657845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48789 a!2804) j!70) mask!2512) (select (arr!48789 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517595 () Bool)

(declare-fun res!1037498 () Bool)

(assert (=> b!1517595 (=> (not res!1037498) (not e!846683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517595 (= res!1037498 (validKeyInArray!0 (select (arr!48789 a!2804) i!961)))))

(declare-fun b!1517596 () Bool)

(assert (=> b!1517596 (= e!846687 e!846686)))

(declare-fun res!1037501 () Bool)

(assert (=> b!1517596 (=> res!1037501 e!846686)))

(assert (=> b!1517596 (= res!1037501 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657847 #b00000000000000000000000000000000) (bvsge lt!657847 (size!49339 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517596 (= lt!657847 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517597 () Bool)

(declare-fun res!1037496 () Bool)

(assert (=> b!1517597 (=> (not res!1037496) (not e!846683))))

(assert (=> b!1517597 (= res!1037496 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49339 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49339 a!2804))))))

(declare-fun b!1517598 () Bool)

(declare-fun res!1037499 () Bool)

(assert (=> b!1517598 (=> (not res!1037499) (not e!846683))))

(assert (=> b!1517598 (= res!1037499 (validKeyInArray!0 (select (arr!48789 a!2804) j!70)))))

(declare-fun b!1517599 () Bool)

(declare-fun res!1037495 () Bool)

(assert (=> b!1517599 (=> (not res!1037495) (not e!846683))))

(assert (=> b!1517599 (= res!1037495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517600 () Bool)

(declare-fun res!1037497 () Bool)

(assert (=> b!1517600 (=> (not res!1037497) (not e!846683))))

(declare-datatypes ((List!35272 0))(
  ( (Nil!35269) (Cons!35268 (h!36680 (_ BitVec 64)) (t!49966 List!35272)) )
))
(declare-fun arrayNoDuplicates!0 (array!101104 (_ BitVec 32) List!35272) Bool)

(assert (=> b!1517600 (= res!1037497 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35269))))

(declare-fun b!1517601 () Bool)

(declare-fun res!1037503 () Bool)

(assert (=> b!1517601 (=> (not res!1037503) (not e!846688))))

(assert (=> b!1517601 (= res!1037503 (= lt!657845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48789 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48789 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101105 (store (arr!48789 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49339 a!2804)) mask!2512)))))

(declare-fun res!1037504 () Bool)

(assert (=> start!129248 (=> (not res!1037504) (not e!846683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129248 (= res!1037504 (validMask!0 mask!2512))))

(assert (=> start!129248 e!846683))

(assert (=> start!129248 true))

(declare-fun array_inv!37817 (array!101104) Bool)

(assert (=> start!129248 (array_inv!37817 a!2804)))

(declare-fun b!1517602 () Bool)

(declare-fun res!1037505 () Bool)

(assert (=> b!1517602 (=> (not res!1037505) (not e!846688))))

(assert (=> b!1517602 (= res!1037505 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48789 a!2804) j!70) a!2804 mask!2512) lt!657844))))

(declare-fun b!1517603 () Bool)

(declare-fun res!1037494 () Bool)

(assert (=> b!1517603 (=> (not res!1037494) (not e!846683))))

(assert (=> b!1517603 (= res!1037494 (and (= (size!49339 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49339 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49339 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129248 res!1037504) b!1517603))

(assert (= (and b!1517603 res!1037494) b!1517595))

(assert (= (and b!1517595 res!1037498) b!1517598))

(assert (= (and b!1517598 res!1037499) b!1517599))

(assert (= (and b!1517599 res!1037495) b!1517600))

(assert (= (and b!1517600 res!1037497) b!1517597))

(assert (= (and b!1517597 res!1037496) b!1517594))

(assert (= (and b!1517594 res!1037502) b!1517602))

(assert (= (and b!1517602 res!1037505) b!1517601))

(assert (= (and b!1517601 res!1037503) b!1517592))

(assert (= (and b!1517592 res!1037500) b!1517593))

(assert (= (and b!1517592 (not res!1037506)) b!1517596))

(assert (= (and b!1517596 (not res!1037501)) b!1517591))

(declare-fun m!1400885 () Bool)

(assert (=> b!1517596 m!1400885))

(declare-fun m!1400887 () Bool)

(assert (=> b!1517599 m!1400887))

(declare-fun m!1400889 () Bool)

(assert (=> b!1517591 m!1400889))

(assert (=> b!1517591 m!1400889))

(declare-fun m!1400891 () Bool)

(assert (=> b!1517591 m!1400891))

(assert (=> b!1517602 m!1400889))

(assert (=> b!1517602 m!1400889))

(declare-fun m!1400893 () Bool)

(assert (=> b!1517602 m!1400893))

(assert (=> b!1517594 m!1400889))

(assert (=> b!1517594 m!1400889))

(declare-fun m!1400895 () Bool)

(assert (=> b!1517594 m!1400895))

(assert (=> b!1517594 m!1400895))

(assert (=> b!1517594 m!1400889))

(declare-fun m!1400897 () Bool)

(assert (=> b!1517594 m!1400897))

(declare-fun m!1400899 () Bool)

(assert (=> start!129248 m!1400899))

(declare-fun m!1400901 () Bool)

(assert (=> start!129248 m!1400901))

(assert (=> b!1517593 m!1400889))

(assert (=> b!1517593 m!1400889))

(declare-fun m!1400903 () Bool)

(assert (=> b!1517593 m!1400903))

(declare-fun m!1400905 () Bool)

(assert (=> b!1517601 m!1400905))

(declare-fun m!1400907 () Bool)

(assert (=> b!1517601 m!1400907))

(assert (=> b!1517601 m!1400907))

(declare-fun m!1400909 () Bool)

(assert (=> b!1517601 m!1400909))

(assert (=> b!1517601 m!1400909))

(assert (=> b!1517601 m!1400907))

(declare-fun m!1400911 () Bool)

(assert (=> b!1517601 m!1400911))

(assert (=> b!1517598 m!1400889))

(assert (=> b!1517598 m!1400889))

(declare-fun m!1400913 () Bool)

(assert (=> b!1517598 m!1400913))

(declare-fun m!1400915 () Bool)

(assert (=> b!1517600 m!1400915))

(assert (=> b!1517592 m!1400889))

(declare-fun m!1400917 () Bool)

(assert (=> b!1517592 m!1400917))

(assert (=> b!1517592 m!1400905))

(assert (=> b!1517592 m!1400907))

(declare-fun m!1400919 () Bool)

(assert (=> b!1517592 m!1400919))

(declare-fun m!1400921 () Bool)

(assert (=> b!1517595 m!1400921))

(assert (=> b!1517595 m!1400921))

(declare-fun m!1400923 () Bool)

(assert (=> b!1517595 m!1400923))

(check-sat (not b!1517599) (not b!1517594) (not start!129248) (not b!1517592) (not b!1517598) (not b!1517593) (not b!1517591) (not b!1517596) (not b!1517595) (not b!1517602) (not b!1517600) (not b!1517601))
(check-sat)
