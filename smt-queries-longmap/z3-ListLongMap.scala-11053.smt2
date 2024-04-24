; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129452 () Bool)

(assert start!129452)

(declare-fun b!1517575 () Bool)

(declare-fun res!1036306 () Bool)

(declare-fun e!846987 () Bool)

(assert (=> b!1517575 (=> (not res!1036306) (not e!846987))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((array!101122 0))(
  ( (array!101123 (arr!48793 (Array (_ BitVec 32) (_ BitVec 64))) (size!49344 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101122)

(assert (=> b!1517575 (= res!1036306 (and (= (size!49344 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49344 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49344 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517576 () Bool)

(declare-fun res!1036312 () Bool)

(assert (=> b!1517576 (=> (not res!1036312) (not e!846987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517576 (= res!1036312 (validKeyInArray!0 (select (arr!48793 a!2804) i!961)))))

(declare-fun b!1517577 () Bool)

(declare-fun e!846984 () Bool)

(assert (=> b!1517577 (= e!846987 e!846984)))

(declare-fun res!1036305 () Bool)

(assert (=> b!1517577 (=> (not res!1036305) (not e!846984))))

(declare-datatypes ((SeekEntryResult!12857 0))(
  ( (MissingZero!12857 (index!53823 (_ BitVec 32))) (Found!12857 (index!53824 (_ BitVec 32))) (Intermediate!12857 (undefined!13669 Bool) (index!53825 (_ BitVec 32)) (x!135724 (_ BitVec 32))) (Undefined!12857) (MissingVacant!12857 (index!53826 (_ BitVec 32))) )
))
(declare-fun lt!657768 () SeekEntryResult!12857)

(declare-fun lt!657763 () SeekEntryResult!12857)

(assert (=> b!1517577 (= res!1036305 (= lt!657768 lt!657763))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517577 (= lt!657763 (Intermediate!12857 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12857)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517577 (= lt!657768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48793 a!2804) j!70) mask!2512) (select (arr!48793 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517578 () Bool)

(declare-fun e!846989 () Bool)

(declare-fun e!846990 () Bool)

(assert (=> b!1517578 (= e!846989 e!846990)))

(declare-fun res!1036313 () Bool)

(assert (=> b!1517578 (=> res!1036313 e!846990)))

(declare-fun lt!657767 () SeekEntryResult!12857)

(assert (=> b!1517578 (= res!1036313 (not (= lt!657767 (Found!12857 j!70))))))

(declare-fun lt!657771 () SeekEntryResult!12857)

(declare-fun lt!657769 () SeekEntryResult!12857)

(assert (=> b!1517578 (= lt!657771 lt!657769)))

(declare-fun lt!657766 () array!101122)

(declare-fun lt!657772 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12857)

(assert (=> b!1517578 (= lt!657769 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657772 lt!657766 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12857)

(assert (=> b!1517578 (= lt!657771 (seekEntryOrOpen!0 lt!657772 lt!657766 mask!2512))))

(declare-fun lt!657765 () SeekEntryResult!12857)

(assert (=> b!1517578 (= lt!657765 lt!657767)))

(assert (=> b!1517578 (= lt!657767 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48793 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517578 (= lt!657765 (seekEntryOrOpen!0 (select (arr!48793 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517579 () Bool)

(declare-fun res!1036304 () Bool)

(assert (=> b!1517579 (=> (not res!1036304) (not e!846987))))

(assert (=> b!1517579 (= res!1036304 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49344 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49344 a!2804))))))

(declare-fun res!1036301 () Bool)

(assert (=> start!129452 (=> (not res!1036301) (not e!846987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129452 (= res!1036301 (validMask!0 mask!2512))))

(assert (=> start!129452 e!846987))

(assert (=> start!129452 true))

(declare-fun array_inv!38074 (array!101122) Bool)

(assert (=> start!129452 (array_inv!38074 a!2804)))

(declare-fun b!1517580 () Bool)

(assert (=> b!1517580 (= e!846990 true)))

(assert (=> b!1517580 (= lt!657769 lt!657767)))

(declare-datatypes ((Unit!50617 0))(
  ( (Unit!50618) )
))
(declare-fun lt!657770 () Unit!50617)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50617)

(assert (=> b!1517580 (= lt!657770 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1517581 () Bool)

(declare-fun res!1036308 () Bool)

(assert (=> b!1517581 (=> (not res!1036308) (not e!846987))))

(declare-datatypes ((List!35263 0))(
  ( (Nil!35260) (Cons!35259 (h!36686 (_ BitVec 64)) (t!49949 List!35263)) )
))
(declare-fun arrayNoDuplicates!0 (array!101122 (_ BitVec 32) List!35263) Bool)

(assert (=> b!1517581 (= res!1036308 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35260))))

(declare-fun b!1517582 () Bool)

(declare-fun e!846988 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101122 (_ BitVec 32)) SeekEntryResult!12857)

(assert (=> b!1517582 (= e!846988 (= (seekEntry!0 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) (Found!12857 j!70)))))

(declare-fun b!1517583 () Bool)

(declare-fun e!846986 () Bool)

(assert (=> b!1517583 (= e!846984 e!846986)))

(declare-fun res!1036310 () Bool)

(assert (=> b!1517583 (=> (not res!1036310) (not e!846986))))

(assert (=> b!1517583 (= res!1036310 (= lt!657768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657772 mask!2512) lt!657772 lt!657766 mask!2512)))))

(assert (=> b!1517583 (= lt!657772 (select (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1517583 (= lt!657766 (array!101123 (store (arr!48793 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49344 a!2804)))))

(declare-fun b!1517584 () Bool)

(declare-fun res!1036309 () Bool)

(assert (=> b!1517584 (=> (not res!1036309) (not e!846987))))

(assert (=> b!1517584 (= res!1036309 (validKeyInArray!0 (select (arr!48793 a!2804) j!70)))))

(declare-fun b!1517585 () Bool)

(assert (=> b!1517585 (= e!846986 (not e!846989))))

(declare-fun res!1036307 () Bool)

(assert (=> b!1517585 (=> res!1036307 e!846989)))

(assert (=> b!1517585 (= res!1036307 (or (not (= (select (arr!48793 a!2804) j!70) lt!657772)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48793 a!2804) index!487) (select (arr!48793 a!2804) j!70)) (not (= (select (arr!48793 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1517585 e!846988))

(declare-fun res!1036302 () Bool)

(assert (=> b!1517585 (=> (not res!1036302) (not e!846988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101122 (_ BitVec 32)) Bool)

(assert (=> b!1517585 (= res!1036302 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657764 () Unit!50617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50617)

(assert (=> b!1517585 (= lt!657764 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517586 () Bool)

(declare-fun res!1036311 () Bool)

(assert (=> b!1517586 (=> (not res!1036311) (not e!846987))))

(assert (=> b!1517586 (= res!1036311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517587 () Bool)

(declare-fun res!1036303 () Bool)

(assert (=> b!1517587 (=> (not res!1036303) (not e!846984))))

(assert (=> b!1517587 (= res!1036303 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48793 a!2804) j!70) a!2804 mask!2512) lt!657763))))

(assert (= (and start!129452 res!1036301) b!1517575))

(assert (= (and b!1517575 res!1036306) b!1517576))

(assert (= (and b!1517576 res!1036312) b!1517584))

(assert (= (and b!1517584 res!1036309) b!1517586))

(assert (= (and b!1517586 res!1036311) b!1517581))

(assert (= (and b!1517581 res!1036308) b!1517579))

(assert (= (and b!1517579 res!1036304) b!1517577))

(assert (= (and b!1517577 res!1036305) b!1517587))

(assert (= (and b!1517587 res!1036303) b!1517583))

(assert (= (and b!1517583 res!1036310) b!1517585))

(assert (= (and b!1517585 res!1036302) b!1517582))

(assert (= (and b!1517585 (not res!1036307)) b!1517578))

(assert (= (and b!1517578 (not res!1036313)) b!1517580))

(declare-fun m!1400715 () Bool)

(assert (=> b!1517583 m!1400715))

(assert (=> b!1517583 m!1400715))

(declare-fun m!1400717 () Bool)

(assert (=> b!1517583 m!1400717))

(declare-fun m!1400719 () Bool)

(assert (=> b!1517583 m!1400719))

(declare-fun m!1400721 () Bool)

(assert (=> b!1517583 m!1400721))

(declare-fun m!1400723 () Bool)

(assert (=> b!1517582 m!1400723))

(assert (=> b!1517582 m!1400723))

(declare-fun m!1400725 () Bool)

(assert (=> b!1517582 m!1400725))

(declare-fun m!1400727 () Bool)

(assert (=> b!1517576 m!1400727))

(assert (=> b!1517576 m!1400727))

(declare-fun m!1400729 () Bool)

(assert (=> b!1517576 m!1400729))

(assert (=> b!1517587 m!1400723))

(assert (=> b!1517587 m!1400723))

(declare-fun m!1400731 () Bool)

(assert (=> b!1517587 m!1400731))

(assert (=> b!1517585 m!1400723))

(declare-fun m!1400733 () Bool)

(assert (=> b!1517585 m!1400733))

(declare-fun m!1400735 () Bool)

(assert (=> b!1517585 m!1400735))

(declare-fun m!1400737 () Bool)

(assert (=> b!1517585 m!1400737))

(declare-fun m!1400739 () Bool)

(assert (=> b!1517581 m!1400739))

(assert (=> b!1517578 m!1400723))

(declare-fun m!1400741 () Bool)

(assert (=> b!1517578 m!1400741))

(assert (=> b!1517578 m!1400723))

(declare-fun m!1400743 () Bool)

(assert (=> b!1517578 m!1400743))

(assert (=> b!1517578 m!1400723))

(declare-fun m!1400745 () Bool)

(assert (=> b!1517578 m!1400745))

(declare-fun m!1400747 () Bool)

(assert (=> b!1517578 m!1400747))

(declare-fun m!1400749 () Bool)

(assert (=> b!1517580 m!1400749))

(declare-fun m!1400751 () Bool)

(assert (=> start!129452 m!1400751))

(declare-fun m!1400753 () Bool)

(assert (=> start!129452 m!1400753))

(declare-fun m!1400755 () Bool)

(assert (=> b!1517586 m!1400755))

(assert (=> b!1517577 m!1400723))

(assert (=> b!1517577 m!1400723))

(declare-fun m!1400757 () Bool)

(assert (=> b!1517577 m!1400757))

(assert (=> b!1517577 m!1400757))

(assert (=> b!1517577 m!1400723))

(declare-fun m!1400759 () Bool)

(assert (=> b!1517577 m!1400759))

(assert (=> b!1517584 m!1400723))

(assert (=> b!1517584 m!1400723))

(declare-fun m!1400761 () Bool)

(assert (=> b!1517584 m!1400761))

(check-sat (not b!1517581) (not start!129452) (not b!1517580) (not b!1517584) (not b!1517585) (not b!1517586) (not b!1517583) (not b!1517587) (not b!1517576) (not b!1517577) (not b!1517582) (not b!1517578))
(check-sat)
