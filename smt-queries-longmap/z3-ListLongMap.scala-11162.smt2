; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130464 () Bool)

(assert start!130464)

(declare-fun b!1531147 () Bool)

(declare-fun res!1048476 () Bool)

(declare-fun e!853159 () Bool)

(assert (=> b!1531147 (=> (not res!1048476) (not e!853159))))

(declare-datatypes ((array!101641 0))(
  ( (array!101642 (arr!49042 (Array (_ BitVec 32) (_ BitVec 64))) (size!49594 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101641)

(declare-datatypes ((List!35603 0))(
  ( (Nil!35600) (Cons!35599 (h!37045 (_ BitVec 64)) (t!50289 List!35603)) )
))
(declare-fun arrayNoDuplicates!0 (array!101641 (_ BitVec 32) List!35603) Bool)

(assert (=> b!1531147 (= res!1048476 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35600))))

(declare-fun res!1048474 () Bool)

(assert (=> start!130464 (=> (not res!1048474) (not e!853159))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130464 (= res!1048474 (validMask!0 mask!2512))))

(assert (=> start!130464 e!853159))

(assert (=> start!130464 true))

(declare-fun array_inv!38275 (array!101641) Bool)

(assert (=> start!130464 (array_inv!38275 a!2804)))

(declare-fun b!1531148 () Bool)

(declare-fun res!1048482 () Bool)

(declare-fun e!853154 () Bool)

(assert (=> b!1531148 (=> (not res!1048482) (not e!853154))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13230 0))(
  ( (MissingZero!13230 (index!55315 (_ BitVec 32))) (Found!13230 (index!55316 (_ BitVec 32))) (Intermediate!13230 (undefined!14042 Bool) (index!55317 (_ BitVec 32)) (x!137019 (_ BitVec 32))) (Undefined!13230) (MissingVacant!13230 (index!55318 (_ BitVec 32))) )
))
(declare-fun lt!662970 () SeekEntryResult!13230)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101641 (_ BitVec 32)) SeekEntryResult!13230)

(assert (=> b!1531148 (= res!1048482 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) lt!662970))))

(declare-fun b!1531149 () Bool)

(declare-fun e!853155 () Bool)

(assert (=> b!1531149 (= e!853155 true)))

(declare-fun lt!662967 () SeekEntryResult!13230)

(declare-fun lt!662966 () (_ BitVec 32))

(assert (=> b!1531149 (= lt!662967 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!662966 (select (arr!49042 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531150 () Bool)

(declare-fun e!853157 () Bool)

(assert (=> b!1531150 (= e!853157 e!853155)))

(declare-fun res!1048483 () Bool)

(assert (=> b!1531150 (=> res!1048483 e!853155)))

(assert (=> b!1531150 (= res!1048483 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!662966 #b00000000000000000000000000000000) (bvsge lt!662966 (size!49594 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531150 (= lt!662966 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531151 () Bool)

(assert (=> b!1531151 (= e!853154 (not e!853157))))

(declare-fun res!1048480 () Bool)

(assert (=> b!1531151 (=> res!1048480 e!853157)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531151 (= res!1048480 (or (not (= (select (arr!49042 a!2804) j!70) (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853156 () Bool)

(assert (=> b!1531151 e!853156))

(declare-fun res!1048479 () Bool)

(assert (=> b!1531151 (=> (not res!1048479) (not e!853156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101641 (_ BitVec 32)) Bool)

(assert (=> b!1531151 (= res!1048479 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51083 0))(
  ( (Unit!51084) )
))
(declare-fun lt!662968 () Unit!51083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51083)

(assert (=> b!1531151 (= lt!662968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531152 () Bool)

(declare-fun res!1048472 () Bool)

(assert (=> b!1531152 (=> (not res!1048472) (not e!853159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531152 (= res!1048472 (validKeyInArray!0 (select (arr!49042 a!2804) j!70)))))

(declare-fun b!1531153 () Bool)

(declare-fun res!1048478 () Bool)

(assert (=> b!1531153 (=> (not res!1048478) (not e!853159))))

(assert (=> b!1531153 (= res!1048478 (validKeyInArray!0 (select (arr!49042 a!2804) i!961)))))

(declare-fun b!1531154 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101641 (_ BitVec 32)) SeekEntryResult!13230)

(assert (=> b!1531154 (= e!853156 (= (seekEntry!0 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) (Found!13230 j!70)))))

(declare-fun b!1531155 () Bool)

(declare-fun res!1048481 () Bool)

(assert (=> b!1531155 (=> (not res!1048481) (not e!853159))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531155 (= res!1048481 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49594 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49594 a!2804))))))

(declare-fun b!1531156 () Bool)

(declare-fun res!1048477 () Bool)

(assert (=> b!1531156 (=> (not res!1048477) (not e!853159))))

(assert (=> b!1531156 (= res!1048477 (and (= (size!49594 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49594 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49594 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531157 () Bool)

(declare-fun res!1048471 () Bool)

(assert (=> b!1531157 (=> (not res!1048471) (not e!853154))))

(declare-fun lt!662969 () SeekEntryResult!13230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531157 (= res!1048471 (= lt!662969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101642 (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49594 a!2804)) mask!2512)))))

(declare-fun b!1531158 () Bool)

(declare-fun res!1048475 () Bool)

(assert (=> b!1531158 (=> (not res!1048475) (not e!853159))))

(assert (=> b!1531158 (= res!1048475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531159 () Bool)

(assert (=> b!1531159 (= e!853159 e!853154)))

(declare-fun res!1048473 () Bool)

(assert (=> b!1531159 (=> (not res!1048473) (not e!853154))))

(assert (=> b!1531159 (= res!1048473 (= lt!662969 lt!662970))))

(assert (=> b!1531159 (= lt!662970 (Intermediate!13230 false resIndex!21 resX!21))))

(assert (=> b!1531159 (= lt!662969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49042 a!2804) j!70) mask!2512) (select (arr!49042 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130464 res!1048474) b!1531156))

(assert (= (and b!1531156 res!1048477) b!1531153))

(assert (= (and b!1531153 res!1048478) b!1531152))

(assert (= (and b!1531152 res!1048472) b!1531158))

(assert (= (and b!1531158 res!1048475) b!1531147))

(assert (= (and b!1531147 res!1048476) b!1531155))

(assert (= (and b!1531155 res!1048481) b!1531159))

(assert (= (and b!1531159 res!1048473) b!1531148))

(assert (= (and b!1531148 res!1048482) b!1531157))

(assert (= (and b!1531157 res!1048471) b!1531151))

(assert (= (and b!1531151 res!1048479) b!1531154))

(assert (= (and b!1531151 (not res!1048480)) b!1531150))

(assert (= (and b!1531150 (not res!1048483)) b!1531149))

(declare-fun m!1413227 () Bool)

(assert (=> b!1531159 m!1413227))

(assert (=> b!1531159 m!1413227))

(declare-fun m!1413229 () Bool)

(assert (=> b!1531159 m!1413229))

(assert (=> b!1531159 m!1413229))

(assert (=> b!1531159 m!1413227))

(declare-fun m!1413231 () Bool)

(assert (=> b!1531159 m!1413231))

(assert (=> b!1531151 m!1413227))

(declare-fun m!1413233 () Bool)

(assert (=> b!1531151 m!1413233))

(declare-fun m!1413235 () Bool)

(assert (=> b!1531151 m!1413235))

(declare-fun m!1413237 () Bool)

(assert (=> b!1531151 m!1413237))

(declare-fun m!1413239 () Bool)

(assert (=> b!1531151 m!1413239))

(assert (=> b!1531152 m!1413227))

(assert (=> b!1531152 m!1413227))

(declare-fun m!1413241 () Bool)

(assert (=> b!1531152 m!1413241))

(declare-fun m!1413243 () Bool)

(assert (=> start!130464 m!1413243))

(declare-fun m!1413245 () Bool)

(assert (=> start!130464 m!1413245))

(assert (=> b!1531148 m!1413227))

(assert (=> b!1531148 m!1413227))

(declare-fun m!1413247 () Bool)

(assert (=> b!1531148 m!1413247))

(declare-fun m!1413249 () Bool)

(assert (=> b!1531153 m!1413249))

(assert (=> b!1531153 m!1413249))

(declare-fun m!1413251 () Bool)

(assert (=> b!1531153 m!1413251))

(assert (=> b!1531157 m!1413235))

(assert (=> b!1531157 m!1413237))

(assert (=> b!1531157 m!1413237))

(declare-fun m!1413253 () Bool)

(assert (=> b!1531157 m!1413253))

(assert (=> b!1531157 m!1413253))

(assert (=> b!1531157 m!1413237))

(declare-fun m!1413255 () Bool)

(assert (=> b!1531157 m!1413255))

(declare-fun m!1413257 () Bool)

(assert (=> b!1531147 m!1413257))

(declare-fun m!1413259 () Bool)

(assert (=> b!1531150 m!1413259))

(assert (=> b!1531154 m!1413227))

(assert (=> b!1531154 m!1413227))

(declare-fun m!1413261 () Bool)

(assert (=> b!1531154 m!1413261))

(assert (=> b!1531149 m!1413227))

(assert (=> b!1531149 m!1413227))

(declare-fun m!1413263 () Bool)

(assert (=> b!1531149 m!1413263))

(declare-fun m!1413265 () Bool)

(assert (=> b!1531158 m!1413265))

(check-sat (not start!130464) (not b!1531149) (not b!1531159) (not b!1531154) (not b!1531157) (not b!1531152) (not b!1531158) (not b!1531147) (not b!1531148) (not b!1531150) (not b!1531153) (not b!1531151))
(check-sat)
