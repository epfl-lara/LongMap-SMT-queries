; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129158 () Bool)

(assert start!129158)

(declare-fun b!1515904 () Bool)

(declare-fun res!1035813 () Bool)

(declare-fun e!845937 () Bool)

(assert (=> b!1515904 (=> (not res!1035813) (not e!845937))))

(declare-datatypes ((array!101014 0))(
  ( (array!101015 (arr!48744 (Array (_ BitVec 32) (_ BitVec 64))) (size!49294 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101014)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101014 (_ BitVec 32)) Bool)

(assert (=> b!1515904 (= res!1035813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515905 () Bool)

(declare-fun res!1035816 () Bool)

(assert (=> b!1515905 (=> (not res!1035816) (not e!845937))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515905 (= res!1035816 (and (= (size!49294 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49294 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49294 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515906 () Bool)

(declare-fun e!845942 () Bool)

(declare-fun e!845943 () Bool)

(assert (=> b!1515906 (= e!845942 e!845943)))

(declare-fun res!1035820 () Bool)

(assert (=> b!1515906 (=> res!1035820 e!845943)))

(declare-datatypes ((SeekEntryResult!12915 0))(
  ( (MissingZero!12915 (index!54055 (_ BitVec 32))) (Found!12915 (index!54056 (_ BitVec 32))) (Intermediate!12915 (undefined!13727 Bool) (index!54057 (_ BitVec 32)) (x!135753 (_ BitVec 32))) (Undefined!12915) (MissingVacant!12915 (index!54058 (_ BitVec 32))) )
))
(declare-fun lt!657227 () SeekEntryResult!12915)

(assert (=> b!1515906 (= res!1035820 (not (= lt!657227 (Found!12915 j!70))))))

(declare-fun lt!657220 () SeekEntryResult!12915)

(declare-fun lt!657228 () SeekEntryResult!12915)

(assert (=> b!1515906 (= lt!657220 lt!657228)))

(declare-fun lt!657229 () array!101014)

(declare-fun lt!657224 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12915)

(assert (=> b!1515906 (= lt!657228 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657224 lt!657229 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12915)

(assert (=> b!1515906 (= lt!657220 (seekEntryOrOpen!0 lt!657224 lt!657229 mask!2512))))

(declare-fun lt!657225 () SeekEntryResult!12915)

(assert (=> b!1515906 (= lt!657225 lt!657227)))

(assert (=> b!1515906 (= lt!657227 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48744 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515906 (= lt!657225 (seekEntryOrOpen!0 (select (arr!48744 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035807 () Bool)

(assert (=> start!129158 (=> (not res!1035807) (not e!845937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129158 (= res!1035807 (validMask!0 mask!2512))))

(assert (=> start!129158 e!845937))

(assert (=> start!129158 true))

(declare-fun array_inv!37772 (array!101014) Bool)

(assert (=> start!129158 (array_inv!37772 a!2804)))

(declare-fun b!1515907 () Bool)

(declare-fun res!1035811 () Bool)

(assert (=> b!1515907 (=> (not res!1035811) (not e!845937))))

(declare-datatypes ((List!35227 0))(
  ( (Nil!35224) (Cons!35223 (h!36635 (_ BitVec 64)) (t!49921 List!35227)) )
))
(declare-fun arrayNoDuplicates!0 (array!101014 (_ BitVec 32) List!35227) Bool)

(assert (=> b!1515907 (= res!1035811 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35224))))

(declare-fun b!1515908 () Bool)

(declare-fun e!845940 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515908 (= e!845940 (validKeyInArray!0 lt!657224))))

(declare-fun b!1515909 () Bool)

(declare-fun res!1035810 () Bool)

(assert (=> b!1515909 (=> (not res!1035810) (not e!845937))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515909 (= res!1035810 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49294 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49294 a!2804))))))

(declare-fun b!1515910 () Bool)

(assert (=> b!1515910 (= e!845943 e!845940)))

(declare-fun res!1035812 () Bool)

(assert (=> b!1515910 (=> res!1035812 e!845940)))

(assert (=> b!1515910 (= res!1035812 (bvslt mask!2512 #b00000000000000000000000000000000))))

(assert (=> b!1515910 (= lt!657228 lt!657227)))

(declare-datatypes ((Unit!50698 0))(
  ( (Unit!50699) )
))
(declare-fun lt!657221 () Unit!50698)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50698)

(assert (=> b!1515910 (= lt!657221 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515911 () Bool)

(declare-fun e!845944 () Bool)

(assert (=> b!1515911 (= e!845937 e!845944)))

(declare-fun res!1035819 () Bool)

(assert (=> b!1515911 (=> (not res!1035819) (not e!845944))))

(declare-fun lt!657226 () SeekEntryResult!12915)

(declare-fun lt!657223 () SeekEntryResult!12915)

(assert (=> b!1515911 (= res!1035819 (= lt!657226 lt!657223))))

(assert (=> b!1515911 (= lt!657223 (Intermediate!12915 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515911 (= lt!657226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48744 a!2804) j!70) mask!2512) (select (arr!48744 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515912 () Bool)

(declare-fun res!1035809 () Bool)

(assert (=> b!1515912 (=> (not res!1035809) (not e!845937))))

(assert (=> b!1515912 (= res!1035809 (validKeyInArray!0 (select (arr!48744 a!2804) i!961)))))

(declare-fun e!845939 () Bool)

(declare-fun b!1515913 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101014 (_ BitVec 32)) SeekEntryResult!12915)

(assert (=> b!1515913 (= e!845939 (= (seekEntry!0 (select (arr!48744 a!2804) j!70) a!2804 mask!2512) (Found!12915 j!70)))))

(declare-fun b!1515914 () Bool)

(declare-fun e!845941 () Bool)

(assert (=> b!1515914 (= e!845944 e!845941)))

(declare-fun res!1035814 () Bool)

(assert (=> b!1515914 (=> (not res!1035814) (not e!845941))))

(assert (=> b!1515914 (= res!1035814 (= lt!657226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657224 mask!2512) lt!657224 lt!657229 mask!2512)))))

(assert (=> b!1515914 (= lt!657224 (select (store (arr!48744 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515914 (= lt!657229 (array!101015 (store (arr!48744 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49294 a!2804)))))

(declare-fun b!1515915 () Bool)

(declare-fun res!1035818 () Bool)

(assert (=> b!1515915 (=> (not res!1035818) (not e!845944))))

(assert (=> b!1515915 (= res!1035818 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48744 a!2804) j!70) a!2804 mask!2512) lt!657223))))

(declare-fun b!1515916 () Bool)

(assert (=> b!1515916 (= e!845941 (not e!845942))))

(declare-fun res!1035808 () Bool)

(assert (=> b!1515916 (=> res!1035808 e!845942)))

(assert (=> b!1515916 (= res!1035808 (or (not (= (select (arr!48744 a!2804) j!70) lt!657224)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48744 a!2804) index!487) (select (arr!48744 a!2804) j!70)) (not (= (select (arr!48744 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515916 e!845939))

(declare-fun res!1035817 () Bool)

(assert (=> b!1515916 (=> (not res!1035817) (not e!845939))))

(assert (=> b!1515916 (= res!1035817 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657222 () Unit!50698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50698)

(assert (=> b!1515916 (= lt!657222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515917 () Bool)

(declare-fun res!1035815 () Bool)

(assert (=> b!1515917 (=> (not res!1035815) (not e!845937))))

(assert (=> b!1515917 (= res!1035815 (validKeyInArray!0 (select (arr!48744 a!2804) j!70)))))

(assert (= (and start!129158 res!1035807) b!1515905))

(assert (= (and b!1515905 res!1035816) b!1515912))

(assert (= (and b!1515912 res!1035809) b!1515917))

(assert (= (and b!1515917 res!1035815) b!1515904))

(assert (= (and b!1515904 res!1035813) b!1515907))

(assert (= (and b!1515907 res!1035811) b!1515909))

(assert (= (and b!1515909 res!1035810) b!1515911))

(assert (= (and b!1515911 res!1035819) b!1515915))

(assert (= (and b!1515915 res!1035818) b!1515914))

(assert (= (and b!1515914 res!1035814) b!1515916))

(assert (= (and b!1515916 res!1035817) b!1515913))

(assert (= (and b!1515916 (not res!1035808)) b!1515906))

(assert (= (and b!1515906 (not res!1035820)) b!1515910))

(assert (= (and b!1515910 (not res!1035812)) b!1515908))

(declare-fun m!1399113 () Bool)

(assert (=> b!1515913 m!1399113))

(assert (=> b!1515913 m!1399113))

(declare-fun m!1399115 () Bool)

(assert (=> b!1515913 m!1399115))

(declare-fun m!1399117 () Bool)

(assert (=> b!1515907 m!1399117))

(assert (=> b!1515917 m!1399113))

(assert (=> b!1515917 m!1399113))

(declare-fun m!1399119 () Bool)

(assert (=> b!1515917 m!1399119))

(declare-fun m!1399121 () Bool)

(assert (=> b!1515914 m!1399121))

(assert (=> b!1515914 m!1399121))

(declare-fun m!1399123 () Bool)

(assert (=> b!1515914 m!1399123))

(declare-fun m!1399125 () Bool)

(assert (=> b!1515914 m!1399125))

(declare-fun m!1399127 () Bool)

(assert (=> b!1515914 m!1399127))

(declare-fun m!1399129 () Bool)

(assert (=> b!1515908 m!1399129))

(assert (=> b!1515911 m!1399113))

(assert (=> b!1515911 m!1399113))

(declare-fun m!1399131 () Bool)

(assert (=> b!1515911 m!1399131))

(assert (=> b!1515911 m!1399131))

(assert (=> b!1515911 m!1399113))

(declare-fun m!1399133 () Bool)

(assert (=> b!1515911 m!1399133))

(declare-fun m!1399135 () Bool)

(assert (=> b!1515904 m!1399135))

(assert (=> b!1515916 m!1399113))

(declare-fun m!1399137 () Bool)

(assert (=> b!1515916 m!1399137))

(declare-fun m!1399139 () Bool)

(assert (=> b!1515916 m!1399139))

(declare-fun m!1399141 () Bool)

(assert (=> b!1515916 m!1399141))

(assert (=> b!1515906 m!1399113))

(declare-fun m!1399143 () Bool)

(assert (=> b!1515906 m!1399143))

(assert (=> b!1515906 m!1399113))

(declare-fun m!1399145 () Bool)

(assert (=> b!1515906 m!1399145))

(assert (=> b!1515906 m!1399113))

(declare-fun m!1399147 () Bool)

(assert (=> b!1515906 m!1399147))

(declare-fun m!1399149 () Bool)

(assert (=> b!1515906 m!1399149))

(declare-fun m!1399151 () Bool)

(assert (=> b!1515912 m!1399151))

(assert (=> b!1515912 m!1399151))

(declare-fun m!1399153 () Bool)

(assert (=> b!1515912 m!1399153))

(declare-fun m!1399155 () Bool)

(assert (=> b!1515910 m!1399155))

(declare-fun m!1399157 () Bool)

(assert (=> start!129158 m!1399157))

(declare-fun m!1399159 () Bool)

(assert (=> start!129158 m!1399159))

(assert (=> b!1515915 m!1399113))

(assert (=> b!1515915 m!1399113))

(declare-fun m!1399161 () Bool)

(assert (=> b!1515915 m!1399161))

(check-sat (not b!1515908) (not b!1515917) (not start!129158) (not b!1515904) (not b!1515912) (not b!1515914) (not b!1515907) (not b!1515916) (not b!1515906) (not b!1515915) (not b!1515910) (not b!1515913) (not b!1515911))
(check-sat)
