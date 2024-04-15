; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129732 () Bool)

(assert start!129732)

(declare-fun b!1523067 () Bool)

(declare-fun res!1042160 () Bool)

(declare-fun e!849119 () Bool)

(assert (=> b!1523067 (=> (not res!1042160) (not e!849119))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101326 0))(
  ( (array!101327 (arr!48895 (Array (_ BitVec 32) (_ BitVec 64))) (size!49447 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101326)

(assert (=> b!1523067 (= res!1042160 (and (= (size!49447 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49447 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49447 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523068 () Bool)

(declare-fun e!849120 () Bool)

(assert (=> b!1523068 (= e!849120 (not true))))

(declare-fun e!849118 () Bool)

(assert (=> b!1523068 e!849118))

(declare-fun res!1042161 () Bool)

(assert (=> b!1523068 (=> (not res!1042161) (not e!849118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101326 (_ BitVec 32)) Bool)

(assert (=> b!1523068 (= res!1042161 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50789 0))(
  ( (Unit!50790) )
))
(declare-fun lt!659652 () Unit!50789)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50789)

(assert (=> b!1523068 (= lt!659652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523069 () Bool)

(declare-fun res!1042164 () Bool)

(assert (=> b!1523069 (=> (not res!1042164) (not e!849120))))

(declare-datatypes ((SeekEntryResult!13083 0))(
  ( (MissingZero!13083 (index!54727 (_ BitVec 32))) (Found!13083 (index!54728 (_ BitVec 32))) (Intermediate!13083 (undefined!13895 Bool) (index!54729 (_ BitVec 32)) (x!136420 (_ BitVec 32))) (Undefined!13083) (MissingVacant!13083 (index!54730 (_ BitVec 32))) )
))
(declare-fun lt!659650 () SeekEntryResult!13083)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101326 (_ BitVec 32)) SeekEntryResult!13083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523069 (= res!1042164 (= lt!659650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48895 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48895 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101327 (store (arr!48895 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49447 a!2804)) mask!2512)))))

(declare-fun b!1523070 () Bool)

(declare-fun res!1042162 () Bool)

(assert (=> b!1523070 (=> (not res!1042162) (not e!849119))))

(declare-datatypes ((List!35456 0))(
  ( (Nil!35453) (Cons!35452 (h!36877 (_ BitVec 64)) (t!50142 List!35456)) )
))
(declare-fun arrayNoDuplicates!0 (array!101326 (_ BitVec 32) List!35456) Bool)

(assert (=> b!1523070 (= res!1042162 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35453))))

(declare-fun b!1523071 () Bool)

(assert (=> b!1523071 (= e!849119 e!849120)))

(declare-fun res!1042158 () Bool)

(assert (=> b!1523071 (=> (not res!1042158) (not e!849120))))

(declare-fun lt!659651 () SeekEntryResult!13083)

(assert (=> b!1523071 (= res!1042158 (= lt!659650 lt!659651))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523071 (= lt!659651 (Intermediate!13083 false resIndex!21 resX!21))))

(assert (=> b!1523071 (= lt!659650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48895 a!2804) j!70) mask!2512) (select (arr!48895 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523072 () Bool)

(declare-fun res!1042165 () Bool)

(assert (=> b!1523072 (=> (not res!1042165) (not e!849119))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523072 (= res!1042165 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49447 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49447 a!2804))))))

(declare-fun b!1523073 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101326 (_ BitVec 32)) SeekEntryResult!13083)

(assert (=> b!1523073 (= e!849118 (= (seekEntry!0 (select (arr!48895 a!2804) j!70) a!2804 mask!2512) (Found!13083 j!70)))))

(declare-fun b!1523074 () Bool)

(declare-fun res!1042166 () Bool)

(assert (=> b!1523074 (=> (not res!1042166) (not e!849120))))

(assert (=> b!1523074 (= res!1042166 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48895 a!2804) j!70) a!2804 mask!2512) lt!659651))))

(declare-fun res!1042163 () Bool)

(assert (=> start!129732 (=> (not res!1042163) (not e!849119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129732 (= res!1042163 (validMask!0 mask!2512))))

(assert (=> start!129732 e!849119))

(assert (=> start!129732 true))

(declare-fun array_inv!38128 (array!101326) Bool)

(assert (=> start!129732 (array_inv!38128 a!2804)))

(declare-fun b!1523075 () Bool)

(declare-fun res!1042168 () Bool)

(assert (=> b!1523075 (=> (not res!1042168) (not e!849119))))

(assert (=> b!1523075 (= res!1042168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523076 () Bool)

(declare-fun res!1042159 () Bool)

(assert (=> b!1523076 (=> (not res!1042159) (not e!849119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523076 (= res!1042159 (validKeyInArray!0 (select (arr!48895 a!2804) j!70)))))

(declare-fun b!1523077 () Bool)

(declare-fun res!1042167 () Bool)

(assert (=> b!1523077 (=> (not res!1042167) (not e!849119))))

(assert (=> b!1523077 (= res!1042167 (validKeyInArray!0 (select (arr!48895 a!2804) i!961)))))

(assert (= (and start!129732 res!1042163) b!1523067))

(assert (= (and b!1523067 res!1042160) b!1523077))

(assert (= (and b!1523077 res!1042167) b!1523076))

(assert (= (and b!1523076 res!1042159) b!1523075))

(assert (= (and b!1523075 res!1042168) b!1523070))

(assert (= (and b!1523070 res!1042162) b!1523072))

(assert (= (and b!1523072 res!1042165) b!1523071))

(assert (= (and b!1523071 res!1042158) b!1523074))

(assert (= (and b!1523074 res!1042166) b!1523069))

(assert (= (and b!1523069 res!1042164) b!1523068))

(assert (= (and b!1523068 res!1042161) b!1523073))

(declare-fun m!1405601 () Bool)

(assert (=> b!1523075 m!1405601))

(declare-fun m!1405603 () Bool)

(assert (=> b!1523077 m!1405603))

(assert (=> b!1523077 m!1405603))

(declare-fun m!1405605 () Bool)

(assert (=> b!1523077 m!1405605))

(declare-fun m!1405607 () Bool)

(assert (=> b!1523070 m!1405607))

(declare-fun m!1405609 () Bool)

(assert (=> b!1523068 m!1405609))

(declare-fun m!1405611 () Bool)

(assert (=> b!1523068 m!1405611))

(declare-fun m!1405613 () Bool)

(assert (=> start!129732 m!1405613))

(declare-fun m!1405615 () Bool)

(assert (=> start!129732 m!1405615))

(declare-fun m!1405617 () Bool)

(assert (=> b!1523073 m!1405617))

(assert (=> b!1523073 m!1405617))

(declare-fun m!1405619 () Bool)

(assert (=> b!1523073 m!1405619))

(assert (=> b!1523076 m!1405617))

(assert (=> b!1523076 m!1405617))

(declare-fun m!1405621 () Bool)

(assert (=> b!1523076 m!1405621))

(assert (=> b!1523074 m!1405617))

(assert (=> b!1523074 m!1405617))

(declare-fun m!1405623 () Bool)

(assert (=> b!1523074 m!1405623))

(assert (=> b!1523071 m!1405617))

(assert (=> b!1523071 m!1405617))

(declare-fun m!1405625 () Bool)

(assert (=> b!1523071 m!1405625))

(assert (=> b!1523071 m!1405625))

(assert (=> b!1523071 m!1405617))

(declare-fun m!1405627 () Bool)

(assert (=> b!1523071 m!1405627))

(declare-fun m!1405629 () Bool)

(assert (=> b!1523069 m!1405629))

(declare-fun m!1405631 () Bool)

(assert (=> b!1523069 m!1405631))

(assert (=> b!1523069 m!1405631))

(declare-fun m!1405633 () Bool)

(assert (=> b!1523069 m!1405633))

(assert (=> b!1523069 m!1405633))

(assert (=> b!1523069 m!1405631))

(declare-fun m!1405635 () Bool)

(assert (=> b!1523069 m!1405635))

(check-sat (not b!1523071) (not b!1523075) (not b!1523070) (not b!1523074) (not b!1523073) (not b!1523077) (not b!1523068) (not start!129732) (not b!1523076) (not b!1523069))
(check-sat)
