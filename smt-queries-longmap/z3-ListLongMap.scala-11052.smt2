; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129146 () Bool)

(assert start!129146)

(declare-datatypes ((array!101002 0))(
  ( (array!101003 (arr!48738 (Array (_ BitVec 32) (_ BitVec 64))) (size!49288 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101002)

(declare-fun b!1515665 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!845807 () Bool)

(declare-datatypes ((SeekEntryResult!12909 0))(
  ( (MissingZero!12909 (index!54031 (_ BitVec 32))) (Found!12909 (index!54032 (_ BitVec 32))) (Intermediate!12909 (undefined!13721 Bool) (index!54033 (_ BitVec 32)) (x!135731 (_ BitVec 32))) (Undefined!12909) (MissingVacant!12909 (index!54034 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12909)

(assert (=> b!1515665 (= e!845807 (= (seekEntry!0 (select (arr!48738 a!2804) j!70) a!2804 mask!2512) (Found!12909 j!70)))))

(declare-fun b!1515666 () Bool)

(declare-fun res!1035576 () Bool)

(declare-fun e!845806 () Bool)

(assert (=> b!1515666 (=> (not res!1035576) (not e!845806))))

(declare-datatypes ((List!35221 0))(
  ( (Nil!35218) (Cons!35217 (h!36629 (_ BitVec 64)) (t!49915 List!35221)) )
))
(declare-fun arrayNoDuplicates!0 (array!101002 (_ BitVec 32) List!35221) Bool)

(assert (=> b!1515666 (= res!1035576 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35218))))

(declare-fun b!1515667 () Bool)

(declare-fun res!1035572 () Bool)

(assert (=> b!1515667 (=> (not res!1035572) (not e!845806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515667 (= res!1035572 (validKeyInArray!0 (select (arr!48738 a!2804) j!70)))))

(declare-fun res!1035571 () Bool)

(assert (=> start!129146 (=> (not res!1035571) (not e!845806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129146 (= res!1035571 (validMask!0 mask!2512))))

(assert (=> start!129146 e!845806))

(assert (=> start!129146 true))

(declare-fun array_inv!37766 (array!101002) Bool)

(assert (=> start!129146 (array_inv!37766 a!2804)))

(declare-fun b!1515668 () Bool)

(declare-fun e!845808 () Bool)

(assert (=> b!1515668 (= e!845808 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!657040 () SeekEntryResult!12909)

(declare-fun lt!657048 () SeekEntryResult!12909)

(assert (=> b!1515668 (= lt!657040 lt!657048)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((Unit!50686 0))(
  ( (Unit!50687) )
))
(declare-fun lt!657045 () Unit!50686)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50686)

(assert (=> b!1515668 (= lt!657045 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515669 () Bool)

(declare-fun res!1035575 () Bool)

(assert (=> b!1515669 (=> (not res!1035575) (not e!845806))))

(assert (=> b!1515669 (= res!1035575 (validKeyInArray!0 (select (arr!48738 a!2804) i!961)))))

(declare-fun b!1515670 () Bool)

(declare-fun res!1035569 () Bool)

(assert (=> b!1515670 (=> (not res!1035569) (not e!845806))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515670 (= res!1035569 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49288 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49288 a!2804))))))

(declare-fun b!1515671 () Bool)

(declare-fun res!1035570 () Bool)

(assert (=> b!1515671 (=> (not res!1035570) (not e!845806))))

(assert (=> b!1515671 (= res!1035570 (and (= (size!49288 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49288 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49288 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515672 () Bool)

(declare-fun e!845812 () Bool)

(declare-fun e!845810 () Bool)

(assert (=> b!1515672 (= e!845812 e!845810)))

(declare-fun res!1035578 () Bool)

(assert (=> b!1515672 (=> (not res!1035578) (not e!845810))))

(declare-fun lt!657046 () (_ BitVec 64))

(declare-fun lt!657049 () SeekEntryResult!12909)

(declare-fun lt!657041 () array!101002)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515672 (= res!1035578 (= lt!657049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657046 mask!2512) lt!657046 lt!657041 mask!2512)))))

(assert (=> b!1515672 (= lt!657046 (select (store (arr!48738 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515672 (= lt!657041 (array!101003 (store (arr!48738 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49288 a!2804)))))

(declare-fun b!1515673 () Bool)

(declare-fun e!845811 () Bool)

(assert (=> b!1515673 (= e!845811 e!845808)))

(declare-fun res!1035579 () Bool)

(assert (=> b!1515673 (=> res!1035579 e!845808)))

(assert (=> b!1515673 (= res!1035579 (not (= lt!657048 (Found!12909 j!70))))))

(declare-fun lt!657044 () SeekEntryResult!12909)

(assert (=> b!1515673 (= lt!657044 lt!657040)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12909)

(assert (=> b!1515673 (= lt!657040 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657046 lt!657041 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12909)

(assert (=> b!1515673 (= lt!657044 (seekEntryOrOpen!0 lt!657046 lt!657041 mask!2512))))

(declare-fun lt!657043 () SeekEntryResult!12909)

(assert (=> b!1515673 (= lt!657043 lt!657048)))

(assert (=> b!1515673 (= lt!657048 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48738 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515673 (= lt!657043 (seekEntryOrOpen!0 (select (arr!48738 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515674 () Bool)

(declare-fun res!1035574 () Bool)

(assert (=> b!1515674 (=> (not res!1035574) (not e!845806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101002 (_ BitVec 32)) Bool)

(assert (=> b!1515674 (= res!1035574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515675 () Bool)

(assert (=> b!1515675 (= e!845810 (not e!845811))))

(declare-fun res!1035580 () Bool)

(assert (=> b!1515675 (=> res!1035580 e!845811)))

(assert (=> b!1515675 (= res!1035580 (or (not (= (select (arr!48738 a!2804) j!70) lt!657046)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48738 a!2804) index!487) (select (arr!48738 a!2804) j!70)) (not (= (select (arr!48738 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515675 e!845807))

(declare-fun res!1035568 () Bool)

(assert (=> b!1515675 (=> (not res!1035568) (not e!845807))))

(assert (=> b!1515675 (= res!1035568 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657042 () Unit!50686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50686)

(assert (=> b!1515675 (= lt!657042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515676 () Bool)

(assert (=> b!1515676 (= e!845806 e!845812)))

(declare-fun res!1035573 () Bool)

(assert (=> b!1515676 (=> (not res!1035573) (not e!845812))))

(declare-fun lt!657047 () SeekEntryResult!12909)

(assert (=> b!1515676 (= res!1035573 (= lt!657049 lt!657047))))

(assert (=> b!1515676 (= lt!657047 (Intermediate!12909 false resIndex!21 resX!21))))

(assert (=> b!1515676 (= lt!657049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48738 a!2804) j!70) mask!2512) (select (arr!48738 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515677 () Bool)

(declare-fun res!1035577 () Bool)

(assert (=> b!1515677 (=> (not res!1035577) (not e!845812))))

(assert (=> b!1515677 (= res!1035577 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48738 a!2804) j!70) a!2804 mask!2512) lt!657047))))

(assert (= (and start!129146 res!1035571) b!1515671))

(assert (= (and b!1515671 res!1035570) b!1515669))

(assert (= (and b!1515669 res!1035575) b!1515667))

(assert (= (and b!1515667 res!1035572) b!1515674))

(assert (= (and b!1515674 res!1035574) b!1515666))

(assert (= (and b!1515666 res!1035576) b!1515670))

(assert (= (and b!1515670 res!1035569) b!1515676))

(assert (= (and b!1515676 res!1035573) b!1515677))

(assert (= (and b!1515677 res!1035577) b!1515672))

(assert (= (and b!1515672 res!1035578) b!1515675))

(assert (= (and b!1515675 res!1035568) b!1515665))

(assert (= (and b!1515675 (not res!1035580)) b!1515673))

(assert (= (and b!1515673 (not res!1035579)) b!1515668))

(declare-fun m!1398823 () Bool)

(assert (=> b!1515668 m!1398823))

(declare-fun m!1398825 () Bool)

(assert (=> b!1515665 m!1398825))

(assert (=> b!1515665 m!1398825))

(declare-fun m!1398827 () Bool)

(assert (=> b!1515665 m!1398827))

(assert (=> b!1515673 m!1398825))

(declare-fun m!1398829 () Bool)

(assert (=> b!1515673 m!1398829))

(assert (=> b!1515673 m!1398825))

(declare-fun m!1398831 () Bool)

(assert (=> b!1515673 m!1398831))

(assert (=> b!1515673 m!1398825))

(declare-fun m!1398833 () Bool)

(assert (=> b!1515673 m!1398833))

(declare-fun m!1398835 () Bool)

(assert (=> b!1515673 m!1398835))

(assert (=> b!1515677 m!1398825))

(assert (=> b!1515677 m!1398825))

(declare-fun m!1398837 () Bool)

(assert (=> b!1515677 m!1398837))

(declare-fun m!1398839 () Bool)

(assert (=> b!1515666 m!1398839))

(assert (=> b!1515676 m!1398825))

(assert (=> b!1515676 m!1398825))

(declare-fun m!1398841 () Bool)

(assert (=> b!1515676 m!1398841))

(assert (=> b!1515676 m!1398841))

(assert (=> b!1515676 m!1398825))

(declare-fun m!1398843 () Bool)

(assert (=> b!1515676 m!1398843))

(assert (=> b!1515667 m!1398825))

(assert (=> b!1515667 m!1398825))

(declare-fun m!1398845 () Bool)

(assert (=> b!1515667 m!1398845))

(declare-fun m!1398847 () Bool)

(assert (=> start!129146 m!1398847))

(declare-fun m!1398849 () Bool)

(assert (=> start!129146 m!1398849))

(declare-fun m!1398851 () Bool)

(assert (=> b!1515674 m!1398851))

(assert (=> b!1515675 m!1398825))

(declare-fun m!1398853 () Bool)

(assert (=> b!1515675 m!1398853))

(declare-fun m!1398855 () Bool)

(assert (=> b!1515675 m!1398855))

(declare-fun m!1398857 () Bool)

(assert (=> b!1515675 m!1398857))

(declare-fun m!1398859 () Bool)

(assert (=> b!1515672 m!1398859))

(assert (=> b!1515672 m!1398859))

(declare-fun m!1398861 () Bool)

(assert (=> b!1515672 m!1398861))

(declare-fun m!1398863 () Bool)

(assert (=> b!1515672 m!1398863))

(declare-fun m!1398865 () Bool)

(assert (=> b!1515672 m!1398865))

(declare-fun m!1398867 () Bool)

(assert (=> b!1515669 m!1398867))

(assert (=> b!1515669 m!1398867))

(declare-fun m!1398869 () Bool)

(assert (=> b!1515669 m!1398869))

(check-sat (not b!1515674) (not b!1515675) (not b!1515667) (not b!1515677) (not b!1515668) (not b!1515665) (not b!1515676) (not b!1515666) (not b!1515673) (not b!1515669) (not start!129146) (not b!1515672))
(check-sat)
