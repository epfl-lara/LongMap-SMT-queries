; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129134 () Bool)

(assert start!129134)

(declare-fun b!1516042 () Bool)

(declare-fun res!1036156 () Bool)

(declare-fun e!845912 () Bool)

(assert (=> b!1516042 (=> (not res!1036156) (not e!845912))))

(declare-datatypes ((array!100990 0))(
  ( (array!100991 (arr!48733 (Array (_ BitVec 32) (_ BitVec 64))) (size!49285 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100990)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516042 (= res!1036156 (validKeyInArray!0 (select (arr!48733 a!2804) j!70)))))

(declare-fun b!1516043 () Bool)

(declare-fun res!1036157 () Bool)

(assert (=> b!1516043 (=> (not res!1036157) (not e!845912))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1516043 (= res!1036157 (and (= (size!49285 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49285 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49285 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516044 () Bool)

(declare-fun res!1036154 () Bool)

(assert (=> b!1516044 (=> (not res!1036154) (not e!845912))))

(declare-datatypes ((List!35294 0))(
  ( (Nil!35291) (Cons!35290 (h!36703 (_ BitVec 64)) (t!49980 List!35294)) )
))
(declare-fun arrayNoDuplicates!0 (array!100990 (_ BitVec 32) List!35294) Bool)

(assert (=> b!1516044 (= res!1036154 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35291))))

(declare-fun b!1516045 () Bool)

(declare-fun e!845911 () Bool)

(declare-fun e!845913 () Bool)

(assert (=> b!1516045 (= e!845911 (not e!845913))))

(declare-fun res!1036155 () Bool)

(assert (=> b!1516045 (=> res!1036155 e!845913)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516045 (= res!1036155 (or (not (= (select (arr!48733 a!2804) j!70) (select (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!845915 () Bool)

(assert (=> b!1516045 e!845915))

(declare-fun res!1036162 () Bool)

(assert (=> b!1516045 (=> (not res!1036162) (not e!845915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100990 (_ BitVec 32)) Bool)

(assert (=> b!1516045 (= res!1036162 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50561 0))(
  ( (Unit!50562) )
))
(declare-fun lt!657087 () Unit!50561)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50561)

(assert (=> b!1516045 (= lt!657087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516046 () Bool)

(declare-fun res!1036159 () Bool)

(assert (=> b!1516046 (=> (not res!1036159) (not e!845911))))

(declare-datatypes ((SeekEntryResult!12927 0))(
  ( (MissingZero!12927 (index!54103 (_ BitVec 32))) (Found!12927 (index!54104 (_ BitVec 32))) (Intermediate!12927 (undefined!13739 Bool) (index!54105 (_ BitVec 32)) (x!135799 (_ BitVec 32))) (Undefined!12927) (MissingVacant!12927 (index!54106 (_ BitVec 32))) )
))
(declare-fun lt!657085 () SeekEntryResult!12927)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12927)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516046 (= res!1036159 (= lt!657085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100991 (store (arr!48733 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49285 a!2804)) mask!2512)))))

(declare-fun b!1516047 () Bool)

(declare-fun res!1036163 () Bool)

(assert (=> b!1516047 (=> (not res!1036163) (not e!845912))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516047 (= res!1036163 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49285 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49285 a!2804))))))

(declare-fun b!1516048 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12927)

(assert (=> b!1516048 (= e!845915 (= (seekEntry!0 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) (Found!12927 j!70)))))

(declare-fun res!1036153 () Bool)

(assert (=> start!129134 (=> (not res!1036153) (not e!845912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129134 (= res!1036153 (validMask!0 mask!2512))))

(assert (=> start!129134 e!845912))

(assert (=> start!129134 true))

(declare-fun array_inv!37966 (array!100990) Bool)

(assert (=> start!129134 (array_inv!37966 a!2804)))

(declare-fun b!1516049 () Bool)

(declare-fun e!845916 () Bool)

(assert (=> b!1516049 (= e!845916 true)))

(declare-fun lt!657086 () (_ BitVec 32))

(declare-fun lt!657083 () SeekEntryResult!12927)

(assert (=> b!1516049 (= lt!657083 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657086 (select (arr!48733 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516050 () Bool)

(declare-fun res!1036160 () Bool)

(assert (=> b!1516050 (=> (not res!1036160) (not e!845912))))

(assert (=> b!1516050 (= res!1036160 (validKeyInArray!0 (select (arr!48733 a!2804) i!961)))))

(declare-fun b!1516051 () Bool)

(declare-fun res!1036158 () Bool)

(assert (=> b!1516051 (=> (not res!1036158) (not e!845912))))

(assert (=> b!1516051 (= res!1036158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516052 () Bool)

(assert (=> b!1516052 (= e!845913 e!845916)))

(declare-fun res!1036151 () Bool)

(assert (=> b!1516052 (=> res!1036151 e!845916)))

(assert (=> b!1516052 (= res!1036151 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657086 #b00000000000000000000000000000000) (bvsge lt!657086 (size!49285 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516052 (= lt!657086 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516053 () Bool)

(declare-fun res!1036161 () Bool)

(assert (=> b!1516053 (=> (not res!1036161) (not e!845911))))

(declare-fun lt!657084 () SeekEntryResult!12927)

(assert (=> b!1516053 (= res!1036161 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48733 a!2804) j!70) a!2804 mask!2512) lt!657084))))

(declare-fun b!1516054 () Bool)

(assert (=> b!1516054 (= e!845912 e!845911)))

(declare-fun res!1036152 () Bool)

(assert (=> b!1516054 (=> (not res!1036152) (not e!845911))))

(assert (=> b!1516054 (= res!1036152 (= lt!657085 lt!657084))))

(assert (=> b!1516054 (= lt!657084 (Intermediate!12927 false resIndex!21 resX!21))))

(assert (=> b!1516054 (= lt!657085 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48733 a!2804) j!70) mask!2512) (select (arr!48733 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129134 res!1036153) b!1516043))

(assert (= (and b!1516043 res!1036157) b!1516050))

(assert (= (and b!1516050 res!1036160) b!1516042))

(assert (= (and b!1516042 res!1036156) b!1516051))

(assert (= (and b!1516051 res!1036158) b!1516044))

(assert (= (and b!1516044 res!1036154) b!1516047))

(assert (= (and b!1516047 res!1036163) b!1516054))

(assert (= (and b!1516054 res!1036152) b!1516053))

(assert (= (and b!1516053 res!1036161) b!1516046))

(assert (= (and b!1516046 res!1036159) b!1516045))

(assert (= (and b!1516045 res!1036162) b!1516048))

(assert (= (and b!1516045 (not res!1036155)) b!1516052))

(assert (= (and b!1516052 (not res!1036151)) b!1516049))

(declare-fun m!1398737 () Bool)

(assert (=> b!1516046 m!1398737))

(declare-fun m!1398739 () Bool)

(assert (=> b!1516046 m!1398739))

(assert (=> b!1516046 m!1398739))

(declare-fun m!1398741 () Bool)

(assert (=> b!1516046 m!1398741))

(assert (=> b!1516046 m!1398741))

(assert (=> b!1516046 m!1398739))

(declare-fun m!1398743 () Bool)

(assert (=> b!1516046 m!1398743))

(declare-fun m!1398745 () Bool)

(assert (=> start!129134 m!1398745))

(declare-fun m!1398747 () Bool)

(assert (=> start!129134 m!1398747))

(declare-fun m!1398749 () Bool)

(assert (=> b!1516051 m!1398749))

(declare-fun m!1398751 () Bool)

(assert (=> b!1516052 m!1398751))

(declare-fun m!1398753 () Bool)

(assert (=> b!1516054 m!1398753))

(assert (=> b!1516054 m!1398753))

(declare-fun m!1398755 () Bool)

(assert (=> b!1516054 m!1398755))

(assert (=> b!1516054 m!1398755))

(assert (=> b!1516054 m!1398753))

(declare-fun m!1398757 () Bool)

(assert (=> b!1516054 m!1398757))

(assert (=> b!1516042 m!1398753))

(assert (=> b!1516042 m!1398753))

(declare-fun m!1398759 () Bool)

(assert (=> b!1516042 m!1398759))

(assert (=> b!1516048 m!1398753))

(assert (=> b!1516048 m!1398753))

(declare-fun m!1398761 () Bool)

(assert (=> b!1516048 m!1398761))

(assert (=> b!1516049 m!1398753))

(assert (=> b!1516049 m!1398753))

(declare-fun m!1398763 () Bool)

(assert (=> b!1516049 m!1398763))

(declare-fun m!1398765 () Bool)

(assert (=> b!1516050 m!1398765))

(assert (=> b!1516050 m!1398765))

(declare-fun m!1398767 () Bool)

(assert (=> b!1516050 m!1398767))

(assert (=> b!1516045 m!1398753))

(declare-fun m!1398769 () Bool)

(assert (=> b!1516045 m!1398769))

(assert (=> b!1516045 m!1398737))

(assert (=> b!1516045 m!1398739))

(declare-fun m!1398771 () Bool)

(assert (=> b!1516045 m!1398771))

(assert (=> b!1516053 m!1398753))

(assert (=> b!1516053 m!1398753))

(declare-fun m!1398773 () Bool)

(assert (=> b!1516053 m!1398773))

(declare-fun m!1398775 () Bool)

(assert (=> b!1516044 m!1398775))

(check-sat (not b!1516044) (not b!1516046) (not b!1516051) (not b!1516042) (not b!1516049) (not b!1516050) (not b!1516054) (not start!129134) (not b!1516052) (not b!1516045) (not b!1516053) (not b!1516048))
(check-sat)
