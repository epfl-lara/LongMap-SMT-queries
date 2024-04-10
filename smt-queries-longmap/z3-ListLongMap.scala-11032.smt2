; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129026 () Bool)

(assert start!129026)

(declare-fun lt!655894 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!100882 0))(
  ( (array!100883 (arr!48678 (Array (_ BitVec 32) (_ BitVec 64))) (size!49228 (_ BitVec 32))) )
))
(declare-fun lt!655892 () array!100882)

(declare-fun e!844550 () Bool)

(declare-fun b!1513195 () Bool)

(declare-datatypes ((SeekEntryResult!12849 0))(
  ( (MissingZero!12849 (index!53791 (_ BitVec 32))) (Found!12849 (index!53792 (_ BitVec 32))) (Intermediate!12849 (undefined!13661 Bool) (index!53793 (_ BitVec 32)) (x!135511 (_ BitVec 32))) (Undefined!12849) (MissingVacant!12849 (index!53794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12849)

(assert (=> b!1513195 (= e!844550 (= (seekEntryOrOpen!0 lt!655894 lt!655892 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655894 lt!655892 mask!2512)))))

(declare-fun b!1513196 () Bool)

(declare-fun e!844551 () Bool)

(declare-fun e!844549 () Bool)

(assert (=> b!1513196 (= e!844551 e!844549)))

(declare-fun res!1033108 () Bool)

(assert (=> b!1513196 (=> (not res!1033108) (not e!844549))))

(declare-fun lt!655891 () SeekEntryResult!12849)

(declare-fun lt!655893 () SeekEntryResult!12849)

(assert (=> b!1513196 (= res!1033108 (= lt!655891 lt!655893))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513196 (= lt!655893 (Intermediate!12849 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100882)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513196 (= lt!655891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48678 a!2804) j!70) mask!2512) (select (arr!48678 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513197 () Bool)

(declare-fun res!1033109 () Bool)

(declare-fun e!844548 () Bool)

(assert (=> b!1513197 (=> (not res!1033109) (not e!844548))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100882 (_ BitVec 32)) SeekEntryResult!12849)

(assert (=> b!1513197 (= res!1033109 (= (seekEntry!0 (select (arr!48678 a!2804) j!70) a!2804 mask!2512) (Found!12849 j!70)))))

(declare-fun b!1513198 () Bool)

(declare-fun res!1033111 () Bool)

(assert (=> b!1513198 (=> (not res!1033111) (not e!844551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513198 (= res!1033111 (validKeyInArray!0 (select (arr!48678 a!2804) j!70)))))

(declare-fun b!1513199 () Bool)

(declare-fun res!1033110 () Bool)

(assert (=> b!1513199 (=> (not res!1033110) (not e!844551))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513199 (= res!1033110 (and (= (size!49228 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49228 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49228 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513200 () Bool)

(declare-fun res!1033104 () Bool)

(assert (=> b!1513200 (=> (not res!1033104) (not e!844551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100882 (_ BitVec 32)) Bool)

(assert (=> b!1513200 (= res!1033104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513201 () Bool)

(declare-fun e!844546 () Bool)

(assert (=> b!1513201 (= e!844546 (not true))))

(assert (=> b!1513201 e!844548))

(declare-fun res!1033101 () Bool)

(assert (=> b!1513201 (=> (not res!1033101) (not e!844548))))

(assert (=> b!1513201 (= res!1033101 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50566 0))(
  ( (Unit!50567) )
))
(declare-fun lt!655890 () Unit!50566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50566)

(assert (=> b!1513201 (= lt!655890 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513203 () Bool)

(declare-fun res!1033100 () Bool)

(assert (=> b!1513203 (=> (not res!1033100) (not e!844551))))

(assert (=> b!1513203 (= res!1033100 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49228 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49228 a!2804))))))

(declare-fun b!1513204 () Bool)

(declare-fun e!844547 () Bool)

(assert (=> b!1513204 (= e!844548 e!844547)))

(declare-fun res!1033103 () Bool)

(assert (=> b!1513204 (=> res!1033103 e!844547)))

(assert (=> b!1513204 (= res!1033103 (or (not (= (select (arr!48678 a!2804) j!70) lt!655894)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48678 a!2804) index!487) (select (arr!48678 a!2804) j!70)) (not (= (select (arr!48678 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513205 () Bool)

(declare-fun res!1033098 () Bool)

(assert (=> b!1513205 (=> (not res!1033098) (not e!844551))))

(assert (=> b!1513205 (= res!1033098 (validKeyInArray!0 (select (arr!48678 a!2804) i!961)))))

(declare-fun b!1513206 () Bool)

(assert (=> b!1513206 (= e!844549 e!844546)))

(declare-fun res!1033102 () Bool)

(assert (=> b!1513206 (=> (not res!1033102) (not e!844546))))

(assert (=> b!1513206 (= res!1033102 (= lt!655891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655894 mask!2512) lt!655894 lt!655892 mask!2512)))))

(assert (=> b!1513206 (= lt!655894 (select (store (arr!48678 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513206 (= lt!655892 (array!100883 (store (arr!48678 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49228 a!2804)))))

(declare-fun b!1513202 () Bool)

(declare-fun res!1033105 () Bool)

(assert (=> b!1513202 (=> (not res!1033105) (not e!844551))))

(declare-datatypes ((List!35161 0))(
  ( (Nil!35158) (Cons!35157 (h!36569 (_ BitVec 64)) (t!49855 List!35161)) )
))
(declare-fun arrayNoDuplicates!0 (array!100882 (_ BitVec 32) List!35161) Bool)

(assert (=> b!1513202 (= res!1033105 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35158))))

(declare-fun res!1033107 () Bool)

(assert (=> start!129026 (=> (not res!1033107) (not e!844551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129026 (= res!1033107 (validMask!0 mask!2512))))

(assert (=> start!129026 e!844551))

(assert (=> start!129026 true))

(declare-fun array_inv!37706 (array!100882) Bool)

(assert (=> start!129026 (array_inv!37706 a!2804)))

(declare-fun b!1513207 () Bool)

(declare-fun res!1033099 () Bool)

(assert (=> b!1513207 (=> (not res!1033099) (not e!844549))))

(assert (=> b!1513207 (= res!1033099 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48678 a!2804) j!70) a!2804 mask!2512) lt!655893))))

(declare-fun b!1513208 () Bool)

(assert (=> b!1513208 (= e!844547 e!844550)))

(declare-fun res!1033106 () Bool)

(assert (=> b!1513208 (=> (not res!1033106) (not e!844550))))

(assert (=> b!1513208 (= res!1033106 (= (seekEntryOrOpen!0 (select (arr!48678 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48678 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129026 res!1033107) b!1513199))

(assert (= (and b!1513199 res!1033110) b!1513205))

(assert (= (and b!1513205 res!1033098) b!1513198))

(assert (= (and b!1513198 res!1033111) b!1513200))

(assert (= (and b!1513200 res!1033104) b!1513202))

(assert (= (and b!1513202 res!1033105) b!1513203))

(assert (= (and b!1513203 res!1033100) b!1513196))

(assert (= (and b!1513196 res!1033108) b!1513207))

(assert (= (and b!1513207 res!1033099) b!1513206))

(assert (= (and b!1513206 res!1033102) b!1513201))

(assert (= (and b!1513201 res!1033101) b!1513197))

(assert (= (and b!1513197 res!1033109) b!1513204))

(assert (= (and b!1513204 (not res!1033103)) b!1513208))

(assert (= (and b!1513208 res!1033106) b!1513195))

(declare-fun m!1396031 () Bool)

(assert (=> b!1513198 m!1396031))

(assert (=> b!1513198 m!1396031))

(declare-fun m!1396033 () Bool)

(assert (=> b!1513198 m!1396033))

(declare-fun m!1396035 () Bool)

(assert (=> b!1513201 m!1396035))

(declare-fun m!1396037 () Bool)

(assert (=> b!1513201 m!1396037))

(assert (=> b!1513207 m!1396031))

(assert (=> b!1513207 m!1396031))

(declare-fun m!1396039 () Bool)

(assert (=> b!1513207 m!1396039))

(assert (=> b!1513204 m!1396031))

(declare-fun m!1396041 () Bool)

(assert (=> b!1513204 m!1396041))

(declare-fun m!1396043 () Bool)

(assert (=> b!1513206 m!1396043))

(assert (=> b!1513206 m!1396043))

(declare-fun m!1396045 () Bool)

(assert (=> b!1513206 m!1396045))

(declare-fun m!1396047 () Bool)

(assert (=> b!1513206 m!1396047))

(declare-fun m!1396049 () Bool)

(assert (=> b!1513206 m!1396049))

(declare-fun m!1396051 () Bool)

(assert (=> b!1513200 m!1396051))

(declare-fun m!1396053 () Bool)

(assert (=> b!1513202 m!1396053))

(assert (=> b!1513196 m!1396031))

(assert (=> b!1513196 m!1396031))

(declare-fun m!1396055 () Bool)

(assert (=> b!1513196 m!1396055))

(assert (=> b!1513196 m!1396055))

(assert (=> b!1513196 m!1396031))

(declare-fun m!1396057 () Bool)

(assert (=> b!1513196 m!1396057))

(assert (=> b!1513197 m!1396031))

(assert (=> b!1513197 m!1396031))

(declare-fun m!1396059 () Bool)

(assert (=> b!1513197 m!1396059))

(declare-fun m!1396061 () Bool)

(assert (=> start!129026 m!1396061))

(declare-fun m!1396063 () Bool)

(assert (=> start!129026 m!1396063))

(declare-fun m!1396065 () Bool)

(assert (=> b!1513195 m!1396065))

(declare-fun m!1396067 () Bool)

(assert (=> b!1513195 m!1396067))

(assert (=> b!1513208 m!1396031))

(assert (=> b!1513208 m!1396031))

(declare-fun m!1396069 () Bool)

(assert (=> b!1513208 m!1396069))

(assert (=> b!1513208 m!1396031))

(declare-fun m!1396071 () Bool)

(assert (=> b!1513208 m!1396071))

(declare-fun m!1396073 () Bool)

(assert (=> b!1513205 m!1396073))

(assert (=> b!1513205 m!1396073))

(declare-fun m!1396075 () Bool)

(assert (=> b!1513205 m!1396075))

(check-sat (not b!1513205) (not b!1513201) (not b!1513207) (not b!1513202) (not b!1513198) (not b!1513195) (not b!1513196) (not start!129026) (not b!1513206) (not b!1513197) (not b!1513200) (not b!1513208))
(check-sat)
