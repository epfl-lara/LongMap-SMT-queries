; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130250 () Bool)

(assert start!130250)

(declare-fun b!1529064 () Bool)

(declare-fun res!1046771 () Bool)

(declare-fun e!852176 () Bool)

(assert (=> b!1529064 (=> (not res!1046771) (not e!852176))))

(declare-datatypes ((array!101600 0))(
  ( (array!101601 (arr!49025 (Array (_ BitVec 32) (_ BitVec 64))) (size!49575 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101600)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529064 (= res!1046771 (validKeyInArray!0 (select (arr!49025 a!2804) j!70)))))

(declare-fun b!1529065 () Bool)

(declare-fun e!852174 () Bool)

(declare-fun e!852178 () Bool)

(assert (=> b!1529065 (= e!852174 (not e!852178))))

(declare-fun res!1046777 () Bool)

(assert (=> b!1529065 (=> res!1046777 e!852178)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529065 (= res!1046777 (or (not (= (select (arr!49025 a!2804) j!70) (select (store (arr!49025 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852177 () Bool)

(assert (=> b!1529065 e!852177))

(declare-fun res!1046773 () Bool)

(assert (=> b!1529065 (=> (not res!1046773) (not e!852177))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101600 (_ BitVec 32)) Bool)

(assert (=> b!1529065 (= res!1046773 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51164 0))(
  ( (Unit!51165) )
))
(declare-fun lt!662309 () Unit!51164)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101600 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51164)

(assert (=> b!1529065 (= lt!662309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529066 () Bool)

(assert (=> b!1529066 (= e!852176 e!852174)))

(declare-fun res!1046774 () Bool)

(assert (=> b!1529066 (=> (not res!1046774) (not e!852174))))

(declare-datatypes ((SeekEntryResult!13190 0))(
  ( (MissingZero!13190 (index!55155 (_ BitVec 32))) (Found!13190 (index!55156 (_ BitVec 32))) (Intermediate!13190 (undefined!14002 Bool) (index!55157 (_ BitVec 32)) (x!136845 (_ BitVec 32))) (Undefined!13190) (MissingVacant!13190 (index!55158 (_ BitVec 32))) )
))
(declare-fun lt!662308 () SeekEntryResult!13190)

(declare-fun lt!662310 () SeekEntryResult!13190)

(assert (=> b!1529066 (= res!1046774 (= lt!662308 lt!662310))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529066 (= lt!662310 (Intermediate!13190 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101600 (_ BitVec 32)) SeekEntryResult!13190)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529066 (= lt!662308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49025 a!2804) j!70) mask!2512) (select (arr!49025 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529067 () Bool)

(declare-fun res!1046780 () Bool)

(assert (=> b!1529067 (=> (not res!1046780) (not e!852176))))

(assert (=> b!1529067 (= res!1046780 (and (= (size!49575 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49575 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49575 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529068 () Bool)

(declare-fun res!1046779 () Bool)

(assert (=> b!1529068 (=> (not res!1046779) (not e!852176))))

(declare-datatypes ((List!35508 0))(
  ( (Nil!35505) (Cons!35504 (h!36940 (_ BitVec 64)) (t!50202 List!35508)) )
))
(declare-fun arrayNoDuplicates!0 (array!101600 (_ BitVec 32) List!35508) Bool)

(assert (=> b!1529068 (= res!1046779 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35505))))

(declare-fun b!1529069 () Bool)

(declare-fun res!1046778 () Bool)

(assert (=> b!1529069 (=> (not res!1046778) (not e!852176))))

(assert (=> b!1529069 (= res!1046778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529070 () Bool)

(declare-fun res!1046772 () Bool)

(assert (=> b!1529070 (=> (not res!1046772) (not e!852174))))

(assert (=> b!1529070 (= res!1046772 (= lt!662308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49025 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49025 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101601 (store (arr!49025 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49575 a!2804)) mask!2512)))))

(declare-fun b!1529072 () Bool)

(assert (=> b!1529072 (= e!852178 true)))

(declare-fun lt!662311 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529072 (= lt!662311 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529073 () Bool)

(declare-fun res!1046776 () Bool)

(assert (=> b!1529073 (=> (not res!1046776) (not e!852176))))

(assert (=> b!1529073 (= res!1046776 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49575 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49575 a!2804))))))

(declare-fun b!1529074 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101600 (_ BitVec 32)) SeekEntryResult!13190)

(assert (=> b!1529074 (= e!852177 (= (seekEntry!0 (select (arr!49025 a!2804) j!70) a!2804 mask!2512) (Found!13190 j!70)))))

(declare-fun b!1529075 () Bool)

(declare-fun res!1046781 () Bool)

(assert (=> b!1529075 (=> (not res!1046781) (not e!852176))))

(assert (=> b!1529075 (= res!1046781 (validKeyInArray!0 (select (arr!49025 a!2804) i!961)))))

(declare-fun b!1529071 () Bool)

(declare-fun res!1046782 () Bool)

(assert (=> b!1529071 (=> (not res!1046782) (not e!852174))))

(assert (=> b!1529071 (= res!1046782 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49025 a!2804) j!70) a!2804 mask!2512) lt!662310))))

(declare-fun res!1046775 () Bool)

(assert (=> start!130250 (=> (not res!1046775) (not e!852176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130250 (= res!1046775 (validMask!0 mask!2512))))

(assert (=> start!130250 e!852176))

(assert (=> start!130250 true))

(declare-fun array_inv!38053 (array!101600) Bool)

(assert (=> start!130250 (array_inv!38053 a!2804)))

(assert (= (and start!130250 res!1046775) b!1529067))

(assert (= (and b!1529067 res!1046780) b!1529075))

(assert (= (and b!1529075 res!1046781) b!1529064))

(assert (= (and b!1529064 res!1046771) b!1529069))

(assert (= (and b!1529069 res!1046778) b!1529068))

(assert (= (and b!1529068 res!1046779) b!1529073))

(assert (= (and b!1529073 res!1046776) b!1529066))

(assert (= (and b!1529066 res!1046774) b!1529071))

(assert (= (and b!1529071 res!1046782) b!1529070))

(assert (= (and b!1529070 res!1046772) b!1529065))

(assert (= (and b!1529065 res!1046773) b!1529074))

(assert (= (and b!1529065 (not res!1046777)) b!1529072))

(declare-fun m!1411989 () Bool)

(assert (=> b!1529070 m!1411989))

(declare-fun m!1411991 () Bool)

(assert (=> b!1529070 m!1411991))

(assert (=> b!1529070 m!1411991))

(declare-fun m!1411993 () Bool)

(assert (=> b!1529070 m!1411993))

(assert (=> b!1529070 m!1411993))

(assert (=> b!1529070 m!1411991))

(declare-fun m!1411995 () Bool)

(assert (=> b!1529070 m!1411995))

(declare-fun m!1411997 () Bool)

(assert (=> b!1529068 m!1411997))

(declare-fun m!1411999 () Bool)

(assert (=> b!1529066 m!1411999))

(assert (=> b!1529066 m!1411999))

(declare-fun m!1412001 () Bool)

(assert (=> b!1529066 m!1412001))

(assert (=> b!1529066 m!1412001))

(assert (=> b!1529066 m!1411999))

(declare-fun m!1412003 () Bool)

(assert (=> b!1529066 m!1412003))

(declare-fun m!1412005 () Bool)

(assert (=> b!1529069 m!1412005))

(declare-fun m!1412007 () Bool)

(assert (=> b!1529072 m!1412007))

(declare-fun m!1412009 () Bool)

(assert (=> b!1529075 m!1412009))

(assert (=> b!1529075 m!1412009))

(declare-fun m!1412011 () Bool)

(assert (=> b!1529075 m!1412011))

(assert (=> b!1529071 m!1411999))

(assert (=> b!1529071 m!1411999))

(declare-fun m!1412013 () Bool)

(assert (=> b!1529071 m!1412013))

(assert (=> b!1529065 m!1411999))

(declare-fun m!1412015 () Bool)

(assert (=> b!1529065 m!1412015))

(assert (=> b!1529065 m!1411989))

(assert (=> b!1529065 m!1411991))

(declare-fun m!1412017 () Bool)

(assert (=> b!1529065 m!1412017))

(declare-fun m!1412019 () Bool)

(assert (=> start!130250 m!1412019))

(declare-fun m!1412021 () Bool)

(assert (=> start!130250 m!1412021))

(assert (=> b!1529064 m!1411999))

(assert (=> b!1529064 m!1411999))

(declare-fun m!1412023 () Bool)

(assert (=> b!1529064 m!1412023))

(assert (=> b!1529074 m!1411999))

(assert (=> b!1529074 m!1411999))

(declare-fun m!1412025 () Bool)

(assert (=> b!1529074 m!1412025))

(push 1)

