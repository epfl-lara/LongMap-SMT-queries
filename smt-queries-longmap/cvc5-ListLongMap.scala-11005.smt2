; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128862 () Bool)

(assert start!128862)

(declare-fun b!1510204 () Bool)

(declare-fun e!843369 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100718 0))(
  ( (array!100719 (arr!48596 (Array (_ BitVec 32) (_ BitVec 64))) (size!49146 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100718)

(declare-datatypes ((SeekEntryResult!12767 0))(
  ( (MissingZero!12767 (index!53463 (_ BitVec 32))) (Found!12767 (index!53464 (_ BitVec 32))) (Intermediate!12767 (undefined!13579 Bool) (index!53465 (_ BitVec 32)) (x!135213 (_ BitVec 32))) (Undefined!12767) (MissingVacant!12767 (index!53466 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100718 (_ BitVec 32)) SeekEntryResult!12767)

(assert (=> b!1510204 (= e!843369 (= (seekEntry!0 (select (arr!48596 a!2804) j!70) a!2804 mask!2512) (Found!12767 j!70)))))

(declare-fun b!1510205 () Bool)

(declare-fun res!1030108 () Bool)

(declare-fun e!843368 () Bool)

(assert (=> b!1510205 (=> (not res!1030108) (not e!843368))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!655107 () SeekEntryResult!12767)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100718 (_ BitVec 32)) SeekEntryResult!12767)

(assert (=> b!1510205 (= res!1030108 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48596 a!2804) j!70) a!2804 mask!2512) lt!655107))))

(declare-fun b!1510206 () Bool)

(declare-fun e!843370 () Bool)

(assert (=> b!1510206 (= e!843370 e!843368)))

(declare-fun res!1030114 () Bool)

(assert (=> b!1510206 (=> (not res!1030114) (not e!843368))))

(declare-fun lt!655106 () SeekEntryResult!12767)

(assert (=> b!1510206 (= res!1030114 (= lt!655106 lt!655107))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510206 (= lt!655107 (Intermediate!12767 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510206 (= lt!655106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48596 a!2804) j!70) mask!2512) (select (arr!48596 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510207 () Bool)

(declare-fun res!1030115 () Bool)

(assert (=> b!1510207 (=> (not res!1030115) (not e!843370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100718 (_ BitVec 32)) Bool)

(assert (=> b!1510207 (= res!1030115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1030117 () Bool)

(assert (=> start!128862 (=> (not res!1030117) (not e!843370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128862 (= res!1030117 (validMask!0 mask!2512))))

(assert (=> start!128862 e!843370))

(assert (=> start!128862 true))

(declare-fun array_inv!37624 (array!100718) Bool)

(assert (=> start!128862 (array_inv!37624 a!2804)))

(declare-fun b!1510208 () Bool)

(declare-fun res!1030107 () Bool)

(assert (=> b!1510208 (=> (not res!1030107) (not e!843370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510208 (= res!1030107 (validKeyInArray!0 (select (arr!48596 a!2804) j!70)))))

(declare-fun b!1510209 () Bool)

(declare-fun res!1030110 () Bool)

(assert (=> b!1510209 (=> (not res!1030110) (not e!843370))))

(assert (=> b!1510209 (= res!1030110 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49146 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49146 a!2804))))))

(declare-fun b!1510210 () Bool)

(assert (=> b!1510210 (= e!843368 (not true))))

(assert (=> b!1510210 e!843369))

(declare-fun res!1030116 () Bool)

(assert (=> b!1510210 (=> (not res!1030116) (not e!843369))))

(assert (=> b!1510210 (= res!1030116 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50402 0))(
  ( (Unit!50403) )
))
(declare-fun lt!655108 () Unit!50402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50402)

(assert (=> b!1510210 (= lt!655108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510211 () Bool)

(declare-fun res!1030109 () Bool)

(assert (=> b!1510211 (=> (not res!1030109) (not e!843370))))

(declare-datatypes ((List!35079 0))(
  ( (Nil!35076) (Cons!35075 (h!36487 (_ BitVec 64)) (t!49773 List!35079)) )
))
(declare-fun arrayNoDuplicates!0 (array!100718 (_ BitVec 32) List!35079) Bool)

(assert (=> b!1510211 (= res!1030109 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35076))))

(declare-fun b!1510212 () Bool)

(declare-fun res!1030112 () Bool)

(assert (=> b!1510212 (=> (not res!1030112) (not e!843370))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510212 (= res!1030112 (and (= (size!49146 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49146 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49146 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510213 () Bool)

(declare-fun res!1030111 () Bool)

(assert (=> b!1510213 (=> (not res!1030111) (not e!843370))))

(assert (=> b!1510213 (= res!1030111 (validKeyInArray!0 (select (arr!48596 a!2804) i!961)))))

(declare-fun b!1510214 () Bool)

(declare-fun res!1030113 () Bool)

(assert (=> b!1510214 (=> (not res!1030113) (not e!843368))))

(assert (=> b!1510214 (= res!1030113 (= lt!655106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48596 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48596 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100719 (store (arr!48596 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49146 a!2804)) mask!2512)))))

(assert (= (and start!128862 res!1030117) b!1510212))

(assert (= (and b!1510212 res!1030112) b!1510213))

(assert (= (and b!1510213 res!1030111) b!1510208))

(assert (= (and b!1510208 res!1030107) b!1510207))

(assert (= (and b!1510207 res!1030115) b!1510211))

(assert (= (and b!1510211 res!1030109) b!1510209))

(assert (= (and b!1510209 res!1030110) b!1510206))

(assert (= (and b!1510206 res!1030114) b!1510205))

(assert (= (and b!1510205 res!1030108) b!1510214))

(assert (= (and b!1510214 res!1030113) b!1510210))

(assert (= (and b!1510210 res!1030116) b!1510204))

(declare-fun m!1392769 () Bool)

(assert (=> b!1510205 m!1392769))

(assert (=> b!1510205 m!1392769))

(declare-fun m!1392771 () Bool)

(assert (=> b!1510205 m!1392771))

(declare-fun m!1392773 () Bool)

(assert (=> b!1510213 m!1392773))

(assert (=> b!1510213 m!1392773))

(declare-fun m!1392775 () Bool)

(assert (=> b!1510213 m!1392775))

(declare-fun m!1392777 () Bool)

(assert (=> b!1510210 m!1392777))

(declare-fun m!1392779 () Bool)

(assert (=> b!1510210 m!1392779))

(assert (=> b!1510206 m!1392769))

(assert (=> b!1510206 m!1392769))

(declare-fun m!1392781 () Bool)

(assert (=> b!1510206 m!1392781))

(assert (=> b!1510206 m!1392781))

(assert (=> b!1510206 m!1392769))

(declare-fun m!1392783 () Bool)

(assert (=> b!1510206 m!1392783))

(declare-fun m!1392785 () Bool)

(assert (=> b!1510214 m!1392785))

(declare-fun m!1392787 () Bool)

(assert (=> b!1510214 m!1392787))

(assert (=> b!1510214 m!1392787))

(declare-fun m!1392789 () Bool)

(assert (=> b!1510214 m!1392789))

(assert (=> b!1510214 m!1392789))

(assert (=> b!1510214 m!1392787))

(declare-fun m!1392791 () Bool)

(assert (=> b!1510214 m!1392791))

(declare-fun m!1392793 () Bool)

(assert (=> b!1510207 m!1392793))

(assert (=> b!1510208 m!1392769))

(assert (=> b!1510208 m!1392769))

(declare-fun m!1392795 () Bool)

(assert (=> b!1510208 m!1392795))

(assert (=> b!1510204 m!1392769))

(assert (=> b!1510204 m!1392769))

(declare-fun m!1392797 () Bool)

(assert (=> b!1510204 m!1392797))

(declare-fun m!1392799 () Bool)

(assert (=> b!1510211 m!1392799))

(declare-fun m!1392801 () Bool)

(assert (=> start!128862 m!1392801))

(declare-fun m!1392803 () Bool)

(assert (=> start!128862 m!1392803))

(push 1)

