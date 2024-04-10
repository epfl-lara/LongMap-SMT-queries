; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129326 () Bool)

(assert start!129326)

(declare-fun b!1519162 () Bool)

(declare-fun res!1039078 () Bool)

(declare-fun e!847436 () Bool)

(assert (=> b!1519162 (=> (not res!1039078) (not e!847436))))

(declare-datatypes ((array!101182 0))(
  ( (array!101183 (arr!48828 (Array (_ BitVec 32) (_ BitVec 64))) (size!49378 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101182)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519162 (= res!1039078 (validKeyInArray!0 (select (arr!48828 a!2804) j!70)))))

(declare-fun b!1519163 () Bool)

(declare-fun e!847441 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1519163 (= e!847441 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!658534 () (_ BitVec 64))

(declare-fun lt!658529 () array!101182)

(declare-datatypes ((SeekEntryResult!12999 0))(
  ( (MissingZero!12999 (index!54391 (_ BitVec 32))) (Found!12999 (index!54392 (_ BitVec 32))) (Intermediate!12999 (undefined!13811 Bool) (index!54393 (_ BitVec 32)) (x!136061 (_ BitVec 32))) (Undefined!12999) (MissingVacant!12999 (index!54394 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101182 (_ BitVec 32)) SeekEntryResult!12999)

(assert (=> b!1519163 (= (seekEntryOrOpen!0 (select (arr!48828 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658534 lt!658529 mask!2512))))

(declare-datatypes ((Unit!50866 0))(
  ( (Unit!50867) )
))
(declare-fun lt!658528 () Unit!50866)

(declare-fun lt!658533 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50866)

(assert (=> b!1519163 (= lt!658528 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658533 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519164 () Bool)

(declare-fun res!1039075 () Bool)

(assert (=> b!1519164 (=> (not res!1039075) (not e!847436))))

(assert (=> b!1519164 (= res!1039075 (validKeyInArray!0 (select (arr!48828 a!2804) i!961)))))

(declare-fun b!1519165 () Bool)

(declare-fun res!1039066 () Bool)

(assert (=> b!1519165 (=> (not res!1039066) (not e!847436))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1519165 (= res!1039066 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49378 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49378 a!2804))))))

(declare-fun b!1519166 () Bool)

(declare-fun e!847439 () Bool)

(declare-fun e!847435 () Bool)

(assert (=> b!1519166 (= e!847439 (not e!847435))))

(declare-fun res!1039065 () Bool)

(assert (=> b!1519166 (=> res!1039065 e!847435)))

(assert (=> b!1519166 (= res!1039065 (or (not (= (select (arr!48828 a!2804) j!70) lt!658534)) (= x!534 resX!21)))))

(declare-fun e!847440 () Bool)

(assert (=> b!1519166 e!847440))

(declare-fun res!1039069 () Bool)

(assert (=> b!1519166 (=> (not res!1039069) (not e!847440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101182 (_ BitVec 32)) Bool)

(assert (=> b!1519166 (= res!1039069 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658531 () Unit!50866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101182 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50866)

(assert (=> b!1519166 (= lt!658531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519167 () Bool)

(declare-fun res!1039067 () Bool)

(assert (=> b!1519167 (=> (not res!1039067) (not e!847436))))

(declare-datatypes ((List!35311 0))(
  ( (Nil!35308) (Cons!35307 (h!36719 (_ BitVec 64)) (t!50005 List!35311)) )
))
(declare-fun arrayNoDuplicates!0 (array!101182 (_ BitVec 32) List!35311) Bool)

(assert (=> b!1519167 (= res!1039067 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35308))))

(declare-fun b!1519168 () Bool)

(declare-fun e!847438 () Bool)

(assert (=> b!1519168 (= e!847438 e!847439)))

(declare-fun res!1039076 () Bool)

(assert (=> b!1519168 (=> (not res!1039076) (not e!847439))))

(declare-fun lt!658532 () SeekEntryResult!12999)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101182 (_ BitVec 32)) SeekEntryResult!12999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519168 (= res!1039076 (= lt!658532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658534 mask!2512) lt!658534 lt!658529 mask!2512)))))

(assert (=> b!1519168 (= lt!658534 (select (store (arr!48828 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519168 (= lt!658529 (array!101183 (store (arr!48828 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49378 a!2804)))))

(declare-fun res!1039070 () Bool)

(assert (=> start!129326 (=> (not res!1039070) (not e!847436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129326 (= res!1039070 (validMask!0 mask!2512))))

(assert (=> start!129326 e!847436))

(assert (=> start!129326 true))

(declare-fun array_inv!37856 (array!101182) Bool)

(assert (=> start!129326 (array_inv!37856 a!2804)))

(declare-fun b!1519169 () Bool)

(declare-fun res!1039073 () Bool)

(assert (=> b!1519169 (=> (not res!1039073) (not e!847436))))

(assert (=> b!1519169 (= res!1039073 (and (= (size!49378 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49378 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49378 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519170 () Bool)

(assert (=> b!1519170 (= e!847435 e!847441)))

(declare-fun res!1039077 () Bool)

(assert (=> b!1519170 (=> res!1039077 e!847441)))

(assert (=> b!1519170 (= res!1039077 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658533 #b00000000000000000000000000000000) (bvsge lt!658533 (size!49378 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519170 (= lt!658533 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519171 () Bool)

(declare-fun res!1039071 () Bool)

(assert (=> b!1519171 (=> (not res!1039071) (not e!847438))))

(declare-fun lt!658530 () SeekEntryResult!12999)

(assert (=> b!1519171 (= res!1039071 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48828 a!2804) j!70) a!2804 mask!2512) lt!658530))))

(declare-fun b!1519172 () Bool)

(declare-fun res!1039068 () Bool)

(assert (=> b!1519172 (=> (not res!1039068) (not e!847436))))

(assert (=> b!1519172 (= res!1039068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519173 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101182 (_ BitVec 32)) SeekEntryResult!12999)

(assert (=> b!1519173 (= e!847440 (= (seekEntry!0 (select (arr!48828 a!2804) j!70) a!2804 mask!2512) (Found!12999 j!70)))))

(declare-fun b!1519174 () Bool)

(assert (=> b!1519174 (= e!847436 e!847438)))

(declare-fun res!1039074 () Bool)

(assert (=> b!1519174 (=> (not res!1039074) (not e!847438))))

(assert (=> b!1519174 (= res!1039074 (= lt!658532 lt!658530))))

(assert (=> b!1519174 (= lt!658530 (Intermediate!12999 false resIndex!21 resX!21))))

(assert (=> b!1519174 (= lt!658532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48828 a!2804) j!70) mask!2512) (select (arr!48828 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519175 () Bool)

(declare-fun res!1039072 () Bool)

(assert (=> b!1519175 (=> res!1039072 e!847441)))

(assert (=> b!1519175 (= res!1039072 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658533 (select (arr!48828 a!2804) j!70) a!2804 mask!2512) lt!658530)))))

(assert (= (and start!129326 res!1039070) b!1519169))

(assert (= (and b!1519169 res!1039073) b!1519164))

(assert (= (and b!1519164 res!1039075) b!1519162))

(assert (= (and b!1519162 res!1039078) b!1519172))

(assert (= (and b!1519172 res!1039068) b!1519167))

(assert (= (and b!1519167 res!1039067) b!1519165))

(assert (= (and b!1519165 res!1039066) b!1519174))

(assert (= (and b!1519174 res!1039074) b!1519171))

(assert (= (and b!1519171 res!1039071) b!1519168))

(assert (= (and b!1519168 res!1039076) b!1519166))

(assert (= (and b!1519166 res!1039069) b!1519173))

(assert (= (and b!1519166 (not res!1039065)) b!1519170))

(assert (= (and b!1519170 (not res!1039077)) b!1519175))

(assert (= (and b!1519175 (not res!1039072)) b!1519163))

(declare-fun m!1402541 () Bool)

(assert (=> b!1519170 m!1402541))

(declare-fun m!1402543 () Bool)

(assert (=> b!1519163 m!1402543))

(assert (=> b!1519163 m!1402543))

(declare-fun m!1402545 () Bool)

(assert (=> b!1519163 m!1402545))

(declare-fun m!1402547 () Bool)

(assert (=> b!1519163 m!1402547))

(declare-fun m!1402549 () Bool)

(assert (=> b!1519163 m!1402549))

(assert (=> b!1519171 m!1402543))

(assert (=> b!1519171 m!1402543))

(declare-fun m!1402551 () Bool)

(assert (=> b!1519171 m!1402551))

(declare-fun m!1402553 () Bool)

(assert (=> b!1519167 m!1402553))

(assert (=> b!1519173 m!1402543))

(assert (=> b!1519173 m!1402543))

(declare-fun m!1402555 () Bool)

(assert (=> b!1519173 m!1402555))

(declare-fun m!1402557 () Bool)

(assert (=> start!129326 m!1402557))

(declare-fun m!1402559 () Bool)

(assert (=> start!129326 m!1402559))

(declare-fun m!1402561 () Bool)

(assert (=> b!1519168 m!1402561))

(assert (=> b!1519168 m!1402561))

(declare-fun m!1402563 () Bool)

(assert (=> b!1519168 m!1402563))

(declare-fun m!1402565 () Bool)

(assert (=> b!1519168 m!1402565))

(declare-fun m!1402567 () Bool)

(assert (=> b!1519168 m!1402567))

(assert (=> b!1519174 m!1402543))

(assert (=> b!1519174 m!1402543))

(declare-fun m!1402569 () Bool)

(assert (=> b!1519174 m!1402569))

(assert (=> b!1519174 m!1402569))

(assert (=> b!1519174 m!1402543))

(declare-fun m!1402571 () Bool)

(assert (=> b!1519174 m!1402571))

(assert (=> b!1519175 m!1402543))

(assert (=> b!1519175 m!1402543))

(declare-fun m!1402573 () Bool)

(assert (=> b!1519175 m!1402573))

(declare-fun m!1402575 () Bool)

(assert (=> b!1519172 m!1402575))

(assert (=> b!1519162 m!1402543))

(assert (=> b!1519162 m!1402543))

(declare-fun m!1402577 () Bool)

(assert (=> b!1519162 m!1402577))

(assert (=> b!1519166 m!1402543))

(declare-fun m!1402579 () Bool)

(assert (=> b!1519166 m!1402579))

(declare-fun m!1402581 () Bool)

(assert (=> b!1519166 m!1402581))

(declare-fun m!1402583 () Bool)

(assert (=> b!1519164 m!1402583))

(assert (=> b!1519164 m!1402583))

(declare-fun m!1402585 () Bool)

(assert (=> b!1519164 m!1402585))

(check-sat (not b!1519174) (not b!1519166) (not b!1519164) (not start!129326) (not b!1519170) (not b!1519167) (not b!1519172) (not b!1519163) (not b!1519171) (not b!1519173) (not b!1519175) (not b!1519162) (not b!1519168))
(check-sat)
